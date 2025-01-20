void type metadata accessor for Status(uint64_t a1)
{
  sub_2495ED148(a1, &qword_2696C4A10);
}

uint64_t sub_2495ECB64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9 = (uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2495ECC6C;
  return v9(a1, 0, a2, a3);
}

uint64_t sub_2495ECC6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *v4;
  uint64_t v8 = swift_task_dealloc();
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 8);
  if (!v3)
  {
    uint64_t v8 = a1;
    uint64_t v9 = a2;
    uint64_t v10 = a3;
  }
  return v11(v8, v9, v10);
}

uint64_t sub_2495ECD84(uint64_t a1, uint64_t a2)
{
  return sub_2495ECEE4(a1, a2, MEMORY[0x270FA9B98]);
}

uint64_t sub_2495ECD90(uint64_t a1, id *a2)
{
  uint64_t result = sub_24962C0D0();
  *a2 = 0;
  return result;
}

uint64_t sub_2495ECE08(uint64_t a1, id *a2)
{
  char v3 = sub_24962C0E0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2495ECE88@<X0>(uint64_t *a1@<X8>)
{
  sub_24962C0F0();
  uint64_t v2 = sub_24962C0C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2495ECECC(uint64_t a1, uint64_t a2)
{
  return sub_2495ECEE4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2495ECEE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24962C0F0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2495ECF28()
{
  sub_24962C0F0();
  sub_24962C170();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2495ECF7C()
{
  sub_24962C0F0();
  sub_24962C760();
  sub_24962C170();
  uint64_t v0 = sub_24962C780();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_2495ECFF0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_2495ED004@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2495ED014(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for AuthChallengeDisposition(uint64_t a1)
{
}

uint64_t sub_2495ED034()
{
  uint64_t v0 = sub_24962C0F0();
  uint64_t v2 = v1;
  if (v0 == sub_24962C0F0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24962C6C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2495ED0C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24962C0C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2495ED108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24962C0F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void sub_2495ED148(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2495ED190(uint64_t a1)
{
  uint64_t v2 = sub_2495ED290(&qword_2696C4A48);
  uint64_t v3 = sub_2495ED290(&qword_2696C4A50);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2495ED228()
{
  return sub_2495ED290(&qword_2696C4A30);
}

uint64_t sub_2495ED25C()
{
  return sub_2495ED290(&qword_2696C4A38);
}

uint64_t sub_2495ED290(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2495ED2D4()
{
  return sub_2495ED290(&qword_2696C4A40);
}

uint64_t sub_2495ED308()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C4A58);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696C4A58);
  return sub_24962BF30();
}

uint64_t static FileDownloader.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t FileDownloader.Error.hash(into:)()
{
  return sub_24962C770();
}

uint64_t FileDownloader.Error.hashValue.getter()
{
  return sub_24962C780();
}

uint64_t sub_2495ED400()
{
  return 1;
}

uint64_t sub_2495ED408()
{
  return sub_24962C780();
}

uint64_t sub_2495ED44C()
{
  return sub_24962C770();
}

uint64_t sub_2495ED474()
{
  return sub_24962C780();
}

uint64_t FileDownloader.data(for:)(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](sub_2495ED4E4, 0, 0);
}

uint64_t sub_2495ED4E4()
{
  uint64_t v1 = (void *)v0[6];
  if (v1[2])
  {
    uint64_t v2 = sub_24962BB70();
    v0[7] = v2;
    uint64_t v3 = *(void *)(v2 - 8);
    v0[8] = v3;
    uint64_t v4 = swift_task_alloc();
    v0[9] = v4;
    (*(void (**)(void))(v3 + 16))();
    swift_bridgeObjectRetain();
    sub_24962BB60();
    swift_bridgeObjectRelease();
    sub_24962BB60();
    uint64_t v5 = swift_task_alloc();
    v0[10] = v5;
    *(void *)(v5 + 16) = v4;
    __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2696C4A90 + dword_2696C4A90);
    v6 = (void *)swift_task_alloc();
    v0[11] = v6;
    void *v6 = v0;
    v6[1] = sub_2495ED814;
    return v13((uint64_t)(v0 + 2), (uint64_t)&unk_2696C4A88, v5);
  }
  else
  {
    if (qword_2696C49B0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24962BF40();
    __swift_project_value_buffer(v8, (uint64_t)qword_2696C4A58);
    uint64_t v9 = sub_24962BF20();
    os_log_type_t v10 = sub_24962C400();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2495EB000, v9, v10, "Failed to retrieve IMPU", v11, 2u);
      MEMORY[0x24C5A5090](v11, -1, -1);
    }

    sub_2495EDA94();
    swift_allocError();
    swift_willThrow();
    v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_2495ED814()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2495ED9CC;
  }
  else {
    uint64_t v2 = sub_2495ED928;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2495ED928()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  swift_task_dealloc();
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  return v7(v4, v5, v6);
}

uint64_t sub_2495ED9CC()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_2495EDA94()
{
  unint64_t result = qword_2696C4A78;
  if (!qword_2696C4A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2696C4A78);
  }
  return result;
}

uint64_t sub_2495EDAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2495EDB0C, 0, 0);
}

uint64_t sub_2495EDB0C()
{
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_2495EDBB0;
  uint64_t v2 = *(void *)(v0 + 32);
  return sub_24961EC08(v2);
}

uint64_t sub_2495EDBB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)*v4;
  uint64_t v9 = (void *)*v4;
  swift_task_dealloc();
  if (v3)
  {
    os_log_type_t v10 = (uint64_t (*)(void))v9[1];
    return v10();
  }
  else
  {
    v8[6] = a3;
    v8[7] = a2;
    v8[8] = a1;
    return MEMORY[0x270FA2498](sub_2495EDD14, 0, 0);
  }
}

uint64_t sub_2495EDD14()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(int8x16_t **)(v0 + 16);
  *uint64_t v2 = vextq_s8(*(int8x16_t *)(v0 + 56), *(int8x16_t *)(v0 + 56), 8uLL);
  v2[1].i64[0] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t FileDownloader.download(for:destinationFileURL:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2495EDD68, 0, 0);
}

uint64_t sub_2495EDD68()
{
  uint64_t v1 = (void *)v0[4];
  if (v1[2])
  {
    uint64_t v2 = v0[3];
    uint64_t v3 = sub_24962BB70();
    v0[5] = v3;
    uint64_t v4 = *(void *)(v3 - 8);
    v0[6] = v4;
    uint64_t v5 = swift_task_alloc();
    v0[7] = v5;
    (*(void (**)(void))(v4 + 16))();
    swift_bridgeObjectRetain();
    sub_24962BB60();
    swift_bridgeObjectRelease();
    sub_24962BB60();
    uint64_t v6 = swift_task_alloc();
    v0[8] = v6;
    *(void *)(v6 + 16) = v5;
    *(void *)(v6 + 24) = v2;
    __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2696C4AB0 + dword_2696C4AB0);
    v7 = (void *)swift_task_alloc();
    v0[9] = v7;
    void *v7 = v0;
    v7[1] = sub_2495EE08C;
    return v14((uint64_t)&unk_2696C4AA8, v6);
  }
  else
  {
    if (qword_2696C49B0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24962BF40();
    __swift_project_value_buffer(v9, (uint64_t)qword_2696C4A58);
    os_log_type_t v10 = sub_24962BF20();
    os_log_type_t v11 = sub_24962C400();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_2495EB000, v10, v11, "Failed to retrieve IMPU", v12, 2u);
      MEMORY[0x24C5A5090](v12, -1, -1);
    }

    sub_2495EDA94();
    swift_allocError();
    swift_willThrow();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_2495EE08C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2495EE248;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    uint64_t v5 = sub_2495EE1B4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2495EE1B4()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v5 = v0[11];
  return v4(v5);
}

uint64_t sub_2495EE248()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2495EE2D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_2495EE2FC, 0, 0);
}

uint64_t sub_2495EE2FC()
{
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  void *v1 = v0;
  v1[1] = sub_2495EE3A0;
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  return sub_24961E408(v3, v2);
}

uint64_t sub_2495EE3A0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 56) = a1;
    return MEMORY[0x270FA2498](sub_2495EE4EC, 0, 0);
  }
}

uint64_t sub_2495EE4EC()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 56);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void FileDownloader.init(subscriptionID:systemConfiguration:urlSession:)(id a1@<X1>, char *a2@<X0>, void *a3@<X2>, uint64_t a4@<X8>)
{
  char v7 = *a2;
  id v8 = objc_msgSend(a1, sel_identity);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(v8, sel_impus);

    os_log_type_t v11 = (void *)sub_24962C2A0();
    if (v11[2])
    {
      uint64_t v12 = v11[4];
      uint64_t v9 = (void *)v11[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v12 = 0;
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  v21 = &type metadata for ManagedURLSessionAuthenticator.DefaultFactory;
  v22 = &off_26FD38D00;
  uint64_t v13 = type metadata accessor for ManagedURLSessionAuthenticator();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, (uint64_t)&type metadata for ManagedURLSessionAuthenticator.DefaultFactory);
  MEMORY[0x270FA5388](v15, v15);
  (*(void (**)(void))(v16 + 16))();
  id v17 = a1;
  id v18 = a3;
  uint64_t v19 = sub_2495EFFC4(v7, v17, (uint64_t)v18, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  *(void *)(a4 + 48) = v13;
  *(void *)(a4 + 56) = &off_26FD38CF0;

  *(void *)(a4 + 24) = v19;
  *(unsigned char *)a4 = v7;
  *(void *)(a4 + 8) = v12;
  *(void *)(a4 + 16) = v9;
}

void FileDownloader.init(subscriptionID:systemConfiguration:)(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  char v8 = *a1;
  id v5 = objc_msgSend(self, sel_defaultSessionConfiguration);
  uint64_t v6 = (void *)sub_24962C0C0();
  objc_msgSend(v5, sel_set_sourceApplicationBundleIdentifier_, v6);

  id v7 = objc_msgSend(self, sel_sessionWithConfiguration_, v5);
  FileDownloader.init(subscriptionID:systemConfiguration:urlSession:)(a2, &v8, v7, a3);
}

uint64_t static FileDownloader.makeDownloader(subscriptionID:)(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 57) = *a2;
  return MEMORY[0x270FA2498](sub_2495EE80C, 0, 0);
}

uint64_t sub_2495EE80C()
{
  char v1 = *(unsigned char *)(v0 + 57);
  *(void *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02D30]), sel_initWithQueue_, 0);
  *(unsigned char *)(v0 + 56) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2495EE8D4;
  return sub_2495FFA08((unsigned char *)(v0 + 56));
}

uint64_t sub_2495EE8D4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = sub_2495EEB18;
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    id v5 = sub_2495EE9FC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2495EE9FC()
{
  uint64_t v10 = v0;
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  char v9 = *(unsigned char *)(v0 + 57);
  id v4 = objc_msgSend(self, sel_defaultSessionConfiguration);
  id v5 = (void *)sub_24962C0C0();
  objc_msgSend(v4, sel_set_sourceApplicationBundleIdentifier_, v5);

  id v6 = objc_msgSend(self, sel_sessionWithConfiguration_, v4);
  FileDownloader.init(subscriptionID:systemConfiguration:urlSession:)(v1, &v9, v6, v2);

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2495EEB18()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2495EEB7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  return MEMORY[0x270FA2498](sub_2495EEBA0, v3, 0);
}

uint64_t sub_2495EEBA0()
{
  char v1 = *(unsigned char *)(*(void *)(v0 + 168) + 112);
  *(unsigned char *)(v0 + 217) = v1;
  *(unsigned char *)(v0 + 216) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2495EEC48;
  return sub_2495FFA08((unsigned char *)(v0 + 216));
}

uint64_t sub_2495EEC48(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[23] = a1;
  v3[24] = v1;
  swift_task_dealloc();
  uint64_t v4 = v3[21];
  if (v1) {
    id v5 = sub_2495EF240;
  }
  else {
    id v5 = sub_2495EED60;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t sub_2495EED60()
{
  uint64_t v41 = v0;
  id v1 = objc_msgSend(*(id *)(v0 + 184), sel_fileTransferCapabilities);
  if (v1 && (v2 = v1, id v3 = objc_msgSend(v1, sel_userName), v2, v3))
  {
    uint64_t v4 = sub_24962C0F0();
    id v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    id v6 = 0;
  }
  id v7 = objc_msgSend(*(id *)(v0 + 184), sel_fileTransferCapabilities);
  char v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, sel_password);

    if (v9)
    {
      uint64_t v10 = sub_24962C0F0();
      char v8 = v11;
    }
    else
    {
      uint64_t v10 = 0;
      char v8 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = *(void *)(v0 + 168);
  id v13 = objc_msgSend(*(id *)(v12 + 248), sel_fileTransferCapabilities);
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = objc_msgSend(v13, sel_userName);

    if (v15)
    {
      uint64_t v16 = sub_24962C0F0();
      uint64_t v14 = v17;

      if (v6) {
        goto LABEL_13;
      }
LABEL_18:
      if (!v14) {
        goto LABEL_33;
      }
      goto LABEL_22;
    }
    uint64_t v16 = 0;
    uint64_t v14 = 0;
    if (!v6) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (!v6) {
      goto LABEL_18;
    }
  }
LABEL_13:
  if (!v14)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if (v4 == v16 && v6 == v14)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  char v32 = sub_24962C6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    if (qword_2696C49E8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_24962BF40();
    __swift_project_value_buffer(v18, (uint64_t)qword_2696C53F0);
    uint64_t v19 = sub_24962BF20();
    os_log_type_t v20 = sub_24962C3E0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2495EB000, v19, v20, "Credentials have changed, resetting authenticator", v21, 2u);
      MEMORY[0x24C5A5090](v21, -1, -1);
    }
    v22 = *(void **)(v0 + 184);
    char v23 = *(unsigned char *)(v0 + 217);
    uint64_t v24 = *(void *)(v0 + 168);

    v25 = *(void **)(v12 + 248);
    *(void *)(v12 + 248) = v22;
    id v26 = v22;

    __swift_project_boxed_opaque_existential_1((void *)(v24 + 120), *(void *)(v24 + 144));
    char v40 = v23;
    sub_249614DCC(&v40, v26, v24 + 168, (uint64_t *)(v0 + 16));
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_1(v24 + 208);
    sub_2495F0788((long long *)(v0 + 16), v24 + 208);
    swift_endAccess();
    goto LABEL_29;
  }
LABEL_33:
  id v33 = objc_msgSend(*(id *)(v12 + 248), sel_fileTransferCapabilities);
  v34 = v33;
  if (v33)
  {
    id v35 = objc_msgSend(v33, sel_password);

    if (v35)
    {
      uint64_t v36 = sub_24962C0F0();
      v34 = v37;

      if (v8) {
        goto LABEL_36;
      }
LABEL_41:
      if (!v34) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    uint64_t v36 = 0;
    v34 = 0;
    if (!v8) {
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if (!v8) {
      goto LABEL_41;
    }
  }
LABEL_36:
  if (!v34) {
    goto LABEL_23;
  }
  if (v10 == v36 && v8 == v34)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  char v38 = sub_24962C6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v38 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_29:
  v27 = *(int **)(v0 + 152);
  uint64_t v28 = *(void *)(v0 + 168) + 208;
  swift_beginAccess();
  sub_2495F07A0(v28, v0 + 56);
  v39 = (uint64_t (*)(uint64_t, uint64_t))((char *)v27 + *v27);
  v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v29;
  void *v29 = v0;
  v29[1] = sub_2495EF258;
  uint64_t v30 = *(void *)(v0 + 144);
  return v39(v30, v0 + 56);
}

uint64_t sub_2495EF240()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2495EF258()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 56;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v3);
  uint64_t v4 = *(void *)(v2 + 168);
  if (v0) {
    id v5 = sub_2495EF3F4;
  }
  else {
    id v5 = sub_2495EF390;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t sub_2495EF390()
{
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2495EF3F4()
{
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2495EF458(uint64_t a1, uint64_t a2)
{
  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  return MEMORY[0x270FA2498](sub_2495EF47C, v2, 0);
}

uint64_t sub_2495EF47C()
{
  char v1 = *(unsigned char *)(*(void *)(v0 + 168) + 112);
  *(unsigned char *)(v0 + 217) = v1;
  *(unsigned char *)(v0 + 216) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2495EF524;
  return sub_2495FFA08((unsigned char *)(v0 + 216));
}

uint64_t sub_2495EF524(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[23] = a1;
  v3[24] = v1;
  swift_task_dealloc();
  uint64_t v4 = v3[21];
  if (v1) {
    id v5 = sub_2495EF240;
  }
  else {
    id v5 = sub_2495EF63C;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t sub_2495EF63C()
{
  uint64_t v40 = v0;
  id v1 = objc_msgSend(*(id *)(v0 + 184), sel_fileTransferCapabilities);
  if (v1 && (v2 = v1, id v3 = objc_msgSend(v1, sel_userName), v2, v3))
  {
    uint64_t v4 = sub_24962C0F0();
    id v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    id v6 = 0;
  }
  id v7 = objc_msgSend(*(id *)(v0 + 184), sel_fileTransferCapabilities);
  char v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, sel_password);

    if (v9)
    {
      uint64_t v10 = sub_24962C0F0();
      char v8 = v11;
    }
    else
    {
      uint64_t v10 = 0;
      char v8 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = *(void *)(v0 + 168);
  id v13 = objc_msgSend(*(id *)(v12 + 248), sel_fileTransferCapabilities);
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = objc_msgSend(v13, sel_userName);

    if (v15)
    {
      uint64_t v16 = sub_24962C0F0();
      uint64_t v14 = v17;

      if (v6) {
        goto LABEL_13;
      }
LABEL_18:
      if (!v14) {
        goto LABEL_33;
      }
      goto LABEL_22;
    }
    uint64_t v16 = 0;
    uint64_t v14 = 0;
    if (!v6) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (!v6) {
      goto LABEL_18;
    }
  }
LABEL_13:
  if (!v14)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if (v4 == v16 && v6 == v14)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  char v31 = sub_24962C6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v31 & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    if (qword_2696C49E8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_24962BF40();
    __swift_project_value_buffer(v18, (uint64_t)qword_2696C53F0);
    uint64_t v19 = sub_24962BF20();
    os_log_type_t v20 = sub_24962C3E0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2495EB000, v19, v20, "Credentials have changed, resetting authenticator", v21, 2u);
      MEMORY[0x24C5A5090](v21, -1, -1);
    }
    v22 = *(void **)(v0 + 184);
    char v23 = *(unsigned char *)(v0 + 217);
    uint64_t v24 = *(void *)(v0 + 168);

    v25 = *(void **)(v12 + 248);
    *(void *)(v12 + 248) = v22;
    id v26 = v22;

    __swift_project_boxed_opaque_existential_1((void *)(v24 + 120), *(void *)(v24 + 144));
    char v39 = v23;
    sub_249614DCC(&v39, v26, v24 + 168, (uint64_t *)(v0 + 16));
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_1(v24 + 208);
    sub_2495F0788((long long *)(v0 + 16), v24 + 208);
    swift_endAccess();
    goto LABEL_29;
  }
LABEL_33:
  id v32 = objc_msgSend(*(id *)(v12 + 248), sel_fileTransferCapabilities);
  id v33 = v32;
  if (v32)
  {
    id v34 = objc_msgSend(v32, sel_password);

    if (v34)
    {
      uint64_t v35 = sub_24962C0F0();
      id v33 = v36;

      if (v8) {
        goto LABEL_36;
      }
LABEL_41:
      if (!v33) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    uint64_t v35 = 0;
    id v33 = 0;
    if (!v8) {
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v35 = 0;
    if (!v8) {
      goto LABEL_41;
    }
  }
LABEL_36:
  if (!v33) {
    goto LABEL_23;
  }
  if (v10 == v35 && v8 == v33)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  char v37 = sub_24962C6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_29:
  v27 = *(int **)(v0 + 152);
  uint64_t v28 = *(void *)(v0 + 168) + 208;
  swift_beginAccess();
  sub_2495F07A0(v28, v0 + 56);
  char v38 = (uint64_t (*)(uint64_t, uint64_t))((char *)v27 + *v27);
  v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v29;
  void *v29 = v0;
  v29[1] = sub_2495EFB20;
  return v38(v0 + 144, v0 + 56);
}

uint64_t sub_2495EFB20()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 56;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v3);
  uint64_t v4 = *(void *)(v2 + 168);
  if (v0) {
    id v5 = sub_2495EF3F4;
  }
  else {
    id v5 = sub_2495EFC58;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t sub_2495EFC58()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2495EFCC0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[3] = a2;
  v7[4] = v6;
  v7[1] = sub_2495EFD7C;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_2495EDB0C, 0, 0);
}

uint64_t sub_2495EFD7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2495EFEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v2 + 16);
  *(void *)(v3 + 16) = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = sub_2495F0868;
  *(_OWORD *)(v6 + 32) = v7;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  return MEMORY[0x270FA2498](sub_2495EE2FC, 0, 0);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2495EFFC4(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v7 = a1 & 1;
  v14[3] = sub_2495F0748();
  v14[4] = &off_26FD384F8;
  v14[0] = a3;
  uint64_t v12 = &type metadata for ManagedURLSessionAuthenticator.DefaultFactory;
  id v13 = &off_26FD38D00;
  swift_defaultActor_initialize();
  *(unsigned char *)(a4 + 112) = v7;
  sub_2495F07A0((uint64_t)v11, a4 + 120);
  *(void *)(a4 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02D30]), sel_initWithQueue_, 0);
  sub_2495F07A0((uint64_t)v14, a4 + 168);
  __swift_project_boxed_opaque_existential_1(v11, (uint64_t)v12);
  char v9 = v7;
  sub_249614DCC(&v9, a2, (uint64_t)v14, (uint64_t *)v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  sub_2495F0788(v10, a4 + 208);
  *(void *)(a4 + 248) = a2;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return a4;
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

unint64_t sub_2495F010C()
{
  unint64_t result = qword_2696C4AC0;
  if (!qword_2696C4AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4AC0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FileDownloader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FileDownloader(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 24);
}

uint64_t initializeWithCopy for FileDownloader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = a2 + 24;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v5;
  uint64_t v6 = v5;
  char v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 24, v4, v6);
  return a1;
}

uint64_t assignWithCopy for FileDownloader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t v3 = *a2;
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

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FileDownloader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDownloader(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FileDownloader(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FileDownloader()
{
  return &type metadata for FileDownloader;
}

uint64_t getEnumTagSinglePayload for FileDownloader.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for FileDownloader.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2495F0704);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2495F072C()
{
  return 0;
}

ValueMetadata *type metadata accessor for FileDownloader.Error()
{
  return &type metadata for FileDownloader.Error;
}

unint64_t sub_2495F0748()
{
  unint64_t result = qword_2696C4AC8;
  if (!qword_2696C4AC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696C4AC8);
  }
  return result;
}

uint64_t sub_2495F0788(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2495F07A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_2495F086C()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C4AD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696C4AD0);
  return sub_24962BF30();
}

BOOL static FileTransferController.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FileTransferController.Error.hash(into:)()
{
  return sub_24962C770();
}

uint64_t FileTransferController.Error.hashValue.getter()
{
  return sub_24962C780();
}

BOOL sub_2495F0974(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2495F0988()
{
  return sub_24962C780();
}

uint64_t sub_2495F09D0()
{
  return sub_24962C770();
}

uint64_t sub_2495F09FC()
{
  return sub_24962C780();
}

uint64_t sub_2495F0A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = type metadata accessor for FileUploadRequest();
  v4[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2495F0AD8, 0, 0);
}

uint64_t sub_2495F0AD8()
{
  long long v2 = (int *)v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = sub_24962BD40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v1, v4, v5);
  uint64_t v6 = v1 + v2[5];
  uint64_t v7 = sub_24962BEE0();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  sub_2495F7288(v3, v1 + v2[6], &qword_2696C4AF0);
  v8(v1 + v2[7], 1, 1, v7);
  int v9 = (void *)swift_task_alloc();
  v0[8] = v9;
  *int v9 = v0;
  v9[1] = sub_2495F0C54;
  uint64_t v10 = v0[7];
  uint64_t v11 = v0[2];
  return sub_2495F0E74(v11, v10);
}

uint64_t sub_2495F0C54()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *v1;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  sub_2495F91C4(v2, (uint64_t (*)(void))type metadata accessor for FileUploadRequest);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2495F0DCC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_2495F0DCC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
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

uint64_t sub_2495F0E74(uint64_t a1, uint64_t a2)
{
  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  uint64_t v4 = sub_24962BEA0();
  v3[17] = v4;
  v3[18] = *(void *)(v4 - 8);
  v3[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2495F0F38, 0, 0);
}

uint64_t sub_2495F0F38()
{
  v49 = v0;
  uint64_t v1 = v0[16];
  os_log_t loga = (os_log_t)v0[15];
  uint64_t v41 = sub_24962BB70();
  v0[20] = v41;
  uint64_t v2 = *(void *)(v41 - 8);
  uint64_t v3 = swift_task_alloc();
  v0[21] = v3;
  uint64_t v4 = v1 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration;
  uint64_t v43 = type metadata accessor for FileTransferController.Configuration(0);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = sub_24962BD40();
  v0[22] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v0[23] = v7;
  swift_task_alloc();
  uint64_t v8 = *(void (**)(void))(v7 + 16);
  uint64_t v44 = v4;
  v8();
  sub_24962BB40();
  swift_task_dealloc();
  sub_24962BAE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v5, v41);
  swift_bridgeObjectRetain();
  sub_24962BB60();
  swift_bridgeObjectRelease();
  uint64_t v45 = v3;
  sub_24962BB60();
  int v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[24] = v9;
  v0[25] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v5, v41);
  swift_task_dealloc();
  uint64_t v10 = swift_task_alloc();
  v0[26] = v10;
  uint64_t v39 = v6;
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
  uint64_t v11 = swift_task_alloc();
  v0[27] = v11;
  uint64_t v12 = (int *)type metadata accessor for FileUploadRequest();
  uint64_t v42 = v11;
  sub_2495F7288((uint64_t)loga + v12[5], v11, &qword_2696C4B08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v13 = swift_task_alloc();
  v0[28] = v13;
  sub_2495F7288((uint64_t)loga + v12[6], v13, &qword_2696C4AF0);
  uint64_t v14 = swift_task_alloc();
  v0[29] = v14;
  sub_2495F7288((uint64_t)loga + v12[7], v14, &qword_2696C4B08);
  if (qword_2696C49B8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24962BF40();
  v0[30] = __swift_project_value_buffer(v15, (uint64_t)qword_2696C4AD0);
  uint64_t v16 = swift_task_alloc();
  uint64_t v46 = v10;
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v16, v10, v6);
  uint64_t v17 = swift_task_alloc();
  uint64_t v40 = v13;
  sub_2495F7288(v13, v17, &qword_2696C4AF0);
  uint64_t v18 = sub_24962BF20();
  os_log_type_t v19 = sub_24962C3E0();
  if (os_log_type_enabled(v18, v19))
  {
    os_log_type_t v36 = v19;
    log = v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v48 = v35;
    *(_DWORD *)uint64_t v20 = 136315394;
    sub_2495FAB98((unint64_t *)&unk_2696C4B38, MEMORY[0x270FA8E58]);
    uint64_t v21 = sub_24962C6B0();
    v0[12] = sub_2495F74C8(v21, v22, &v48);
    sub_24962C490();
    swift_bridgeObjectRelease();
    char v23 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v23(v16, v39);
    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v24 = swift_task_alloc();
    sub_2495F7288(v17, v24, &qword_2696C4AF0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v24, 1, v39) == 1)
    {
      sub_2495F73C0(v24, &qword_2696C4AF0);
      unint64_t v25 = 0xE400000000000000;
      uint64_t v26 = 1701736302;
    }
    else
    {
      uint64_t v26 = sub_24962BC90();
      unint64_t v25 = v27;
      v23(v24, v39);
    }
    swift_task_dealloc();
    v0[13] = sub_2495F74C8(v26, v25, &v48);
    sub_24962C490();
    swift_bridgeObjectRelease();
    sub_2495F73C0(v17, &qword_2696C4AF0);
    uint64_t v18 = log;
    _os_log_impl(&dword_2495EB000, log, v36, "Attempting to upload file: %s, with thumbnail: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v35, -1, -1);
    MEMORY[0x24C5A5090](v20, -1, -1);
  }
  else
  {
    char v23 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v23(v16, v39);
    sub_2495F73C0(v17, &qword_2696C4AF0);
  }

  v0[31] = v23;
  uint64_t v28 = v0[16];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = v44 + *(int *)(v43 + 32);
  uint64_t v30 = sub_24962BE40();
  v0[32] = v30;
  v0[33] = *(void *)(v30 - 8);
  uint64_t v31 = swift_task_alloc();
  v0[34] = v31;
  sub_24962BE30();
  id v32 = (void *)swift_task_alloc();
  v0[35] = v32;
  v32[2] = v45;
  v32[3] = v29;
  v32[4] = v31;
  v32[5] = v40;
  v32[6] = v14;
  v32[7] = v46;
  v32[8] = v42;
  __swift_project_boxed_opaque_existential_1((void *)(v28 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator), *(void *)(v28 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator + 24));
  v47 = (char *)&dword_2696C4A90 + dword_2696C4A90;
  id v33 = (void *)swift_task_alloc();
  v0[36] = v33;
  *id v33 = v0;
  v33[1] = sub_2495F1724;
  return ((uint64_t (*)(void *, void *, void *))v47)(v0 + 6, &unk_2696C4B18, v32);
}

uint64_t sub_2495F1724()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2495F23D0;
  }
  else {
    uint64_t v2 = sub_2495F1838;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2495F1838()
{
  uint64_t v103 = v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v0 + 48);
  unint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void **)(v0 + 64);
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = (void *)v4;
  id v6 = v3;
  if (objc_msgSend(v5, sel_statusCode) != (id)200)
  {

LABEL_13:
    uint64_t v28 = *(void *)(v0 + 264);
    uint64_t v29 = *(void *)(v0 + 272);
    uint64_t v30 = *(void *)(v0 + 256);
    uint64_t v32 = *(void *)(v0 + 224);
    uint64_t v31 = *(void *)(v0 + 232);
    v98 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    uint64_t v91 = *(void *)(v0 + 208);
    v94 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
    uint64_t v79 = *(void *)(v0 + 216);
    uint64_t v88 = *(void *)(v0 + 168);
    uint64_t v82 = *(void *)(v0 + 176);
    uint64_t v85 = *(void *)(v0 + 160);
    sub_2495F741C();
    swift_allocError();
    *id v33 = 0;
    swift_willThrow();

    sub_2495F7470(v2, v1);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
    sub_2495F73C0(v31, &qword_2696C4B08);
    sub_2495F73C0(v32, &qword_2696C4AF0);
    sub_2495F73C0(v79, &qword_2696C4B08);
    v98(v91, v82);
    v94(v88, v85);
    goto LABEL_41;
  }
  v93 = v6;
  unint64_t v95 = v1;
  uint64_t v77 = v2;
  uint64_t v7 = (void *)sub_24962C0C0();
  id v8 = objc_msgSend(v5, sel_valueForHTTPHeaderField_, v7);

  if (!v8)
  {
LABEL_40:
    uint64_t v62 = *(void *)(v0 + 264);
    uint64_t v63 = *(void *)(v0 + 272);
    uint64_t v64 = *(void *)(v0 + 256);
    v100 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    uint64_t v66 = *(void *)(v0 + 224);
    uint64_t v65 = *(void *)(v0 + 232);
    uint64_t v67 = *(void *)(v0 + 216);
    uint64_t v87 = *(void *)(v0 + 208);
    v89 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
    uint64_t v68 = *(void *)(v0 + 176);
    uint64_t v81 = *(void *)(v0 + 160);
    uint64_t v84 = *(void *)(v0 + 168);
    sub_2495F741C();
    swift_allocError();
    unsigned char *v69 = 2;
    swift_willThrow();

    sub_2495F7470(v77, v95);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v63, v64);
    sub_2495F73C0(v65, &qword_2696C4B08);
    sub_2495F73C0(v66, &qword_2696C4AF0);
    sub_2495F73C0(v67, &qword_2696C4B08);
    v100(v87, v68);
    v89(v84, v81);
    goto LABEL_41;
  }
  uint64_t v9 = *(void *)(v0 + 296);
  uint64_t v10 = sub_24962C0F0();
  unint64_t v12 = v11;

  *(void *)(v0 + 72) = 59;
  *(void *)(v0 + 80) = 0xE100000000000000;
  uint64_t v13 = swift_task_alloc();
  *(void *)(v13 + 16) = v0 + 72;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_2495F6550(0x7FFFFFFFFFFFFFFFLL, 1, sub_2495F7DD0, v13, v10, v12);
  uint64_t v90 = v9;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  int64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    v102 = (void *)MEMORY[0x263F8EE78];
    sub_2495F7AB8(0, v15, 0);
    uint64_t v97 = sub_24962BB90();
    uint64_t v16 = (void (**)(uint64_t, uint64_t))(*(void *)(v97 - 8) + 8);
    uint64_t v17 = (uint64_t *)(v14 + 56);
    do
    {
      uint64_t v18 = *(v17 - 1);
      uint64_t v19 = *v17;
      *(_OWORD *)(v0 + 16) = *(_OWORD *)(v17 - 3);
      *(void *)(v0 + 32) = v18;
      *(void *)(v0 + 40) = v19;
      uint64_t v20 = swift_task_alloc();
      swift_bridgeObjectRetain();
      sub_24962BB80();
      sub_2495F7E28();
      uint64_t v21 = sub_24962C4B0();
      uint64_t v23 = v22;
      (*v16)(v20, v97);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      uint64_t v24 = v102;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2495F7AB8(0, v102[2] + 1, 1);
        uint64_t v24 = v102;
      }
      unint64_t v26 = v24[2];
      unint64_t v25 = v24[3];
      if (v26 >= v25 >> 1)
      {
        sub_2495F7AB8(v25 > 1, v26 + 1, 1);
        uint64_t v24 = v102;
      }
      v24[2] = v26 + 1;
      unint64_t v27 = &v24[2 * v26];
      v27[4] = v21;
      v27[5] = v23;
      v17 += 4;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    uint64_t v34 = v24[2];
    if (!v34) {
      goto LABEL_39;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = (void *)MEMORY[0x263F8EE78];
    uint64_t v34 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v34) {
      goto LABEL_39;
    }
  }
  uint64_t v35 = v24[4];
  uint64_t v36 = v24[5];
  if (v35 == 0x746163696C707061 && v36 == 0xEF6C6D782F6E6F69
    || (sub_24962C6C0() & 1) != 0
    || v35 == 0xD000000000000024 && v36 == 0x800000024962D140
    || (sub_24962C6C0() & 1) != 0
    || v35 == 0x6D74682F74786574 && v36 == 0xE90000000000006CLL
    || (uint64_t result = sub_24962C6C0(), (result & 1) != 0))
  {
LABEL_26:
    swift_bridgeObjectRelease();
    char v38 = (char *)v77;
    unint64_t v39 = v95;
    sub_2495F7E7C(v77, v95);
    sub_2495F7E7C(v77, v95);
    uint64_t v40 = sub_24962BF20();
    os_log_type_t v41 = sub_24962C3E0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v102 = (void *)v43;
      *(_DWORD *)uint64_t v42 = 136315138;
      sub_24962C130();
      swift_task_alloc();
      sub_24962C120();
      uint64_t v44 = sub_24962C100();
      unint64_t v46 = v45;
      swift_task_dealloc();
      if (v46) {
        uint64_t v47 = v44;
      }
      else {
        uint64_t v47 = 0;
      }
      if (v46) {
        unint64_t v48 = v46;
      }
      else {
        unint64_t v48 = 0xE000000000000000;
      }
      *(void *)(v0 + 88) = sub_2495F74C8(v47, v48, (uint64_t *)&v102);
      char v38 = (char *)v77;
      sub_24962C490();
      unint64_t v39 = v95;
      swift_bridgeObjectRelease();
      sub_2495F7470(v77, v95);
      sub_2495F7470(v77, v95);
      _os_log_impl(&dword_2495EB000, v40, v41, "Response body: %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v43, -1, -1);
      MEMORY[0x24C5A5090](v42, -1, -1);
    }
    else
    {
      sub_2495F7470(v77, v95);
      sub_2495F7470(v77, v95);
    }

    uint64_t v49 = v90;
    sub_2495F3098(v38, v39, *(void *)(v0 + 152));
    uint64_t v50 = *(void *)(v0 + 264);
    uint64_t v51 = *(void *)(v0 + 272);
    uint64_t v52 = *(void *)(v0 + 256);
    uint64_t v53 = *(void *)(v0 + 232);
    uint64_t v54 = *(void *)(v0 + 208);
    v92 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v83 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
    uint64_t v86 = *(void *)(v0 + 224);
    uint64_t v96 = *(void *)(v0 + 216);
    uint64_t v99 = *(void *)(v0 + 168);
    uint64_t v78 = *(void *)(v0 + 176);
    uint64_t v80 = *(void *)(v0 + 160);
    if (!v49)
    {
      uint64_t v56 = *(void *)(v0 + 144);
      uint64_t v55 = *(void *)(v0 + 152);
      uint64_t v75 = *(void *)(v0 + 136);
      uint64_t v76 = *(void *)(v0 + 208);
      uint64_t v57 = *(void *)(v0 + 112);

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v57, v51, v52);
      unint64_t v58 = v39;
      uint64_t v59 = type metadata accessor for FileUploadResult();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v57 + *(int *)(v59 + 20), v55, v75);
      v60 = (uint64_t *)(v57 + *(int *)(v59 + 24));
      uint64_t *v60 = v77;
      v60[1] = v58;
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
      sub_2495F73C0(v53, &qword_2696C4B08);
      sub_2495F73C0(v86, &qword_2696C4AF0);
      sub_2495F73C0(v96, &qword_2696C4B08);
      v92(v76, v78);
      v83(v99, v80);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v61 = *(uint64_t (**)(void))(v0 + 8);
LABEL_42:
      return v61();
    }

    sub_2495F7470((uint64_t)v38, v39);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
    sub_2495F73C0(v53, &qword_2696C4B08);
    sub_2495F73C0(v86, &qword_2696C4AF0);
    sub_2495F73C0(v96, &qword_2696C4B08);
    v92(v54, v78);
    v83(v99, v80);
LABEL_41:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v61 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_42;
  }
  if (v34 == 1)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  v70 = v24 + 7;
  uint64_t v71 = 1;
  while (1)
  {
    uint64_t v101 = v71 + 1;
    if (__OFADD__(v71, 1)) {
      break;
    }
    uint64_t v72 = *(v70 - 1);
    uint64_t v73 = *v70;
    BOOL v74 = v72 == 0x746163696C707061 && v73 == 0xEF6C6D782F6E6F69;
    if (v74 || (sub_24962C6C0() & 1) != 0 || v72 == 0xD000000000000024 && v73 == 0x800000024962D140) {
      goto LABEL_26;
    }
    if ((sub_24962C6C0() & 1) != 0 || v72 == 0x6D74682F74786574 && v73 == 0xE90000000000006CLL) {
      goto LABEL_26;
    }
    uint64_t result = sub_24962C6C0();
    if (result) {
      goto LABEL_26;
    }
    ++v71;
    v70 += 2;
    if (v101 == v34) {
      goto LABEL_39;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2495F23D0()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[33];
  uint64_t v5 = v0[28];
  uint64_t v4 = v0[29];
  uint64_t v6 = v0[27];
  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[31];
  uint64_t v12 = v0[26];
  uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[24];
  uint64_t v7 = v0[22];
  uint64_t v11 = v0[21];
  uint64_t v8 = v0[20];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_2495F73C0(v4, &qword_2696C4B08);
  sub_2495F73C0(v5, &qword_2696C4AF0);
  sub_2495F73C0(v6, &qword_2696C4B08);
  v14(v12, v7);
  v13(v11, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_2495F253C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[14] = a8;
  v8[15] = v10;
  v8[12] = a6;
  v8[13] = a7;
  v8[10] = a4;
  v8[11] = a5;
  v8[8] = a2;
  v8[9] = a3;
  v8[7] = a1;
  return MEMORY[0x270FA2498](sub_2495F2574, 0, 0);
}

uint64_t sub_2495F2574()
{
  uint64_t v28 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 64), *(void *)(*(void *)(v0 + 64) + 24));
  sub_2495F07A0(v3, v0 + 16);
  uint64_t v30 = sub_24962BE40();
  uint64_t v4 = *(void *)(v30 - 8);
  uint64_t v26 = *(void *)(v4 + 64);
  uint64_t v31 = swift_task_alloc();
  *(void *)(v0 + 128) = v31;
  uint64_t v5 = v4;
  uint64_t v21 = v4;
  (*(void (**)(void))(v4 + 16))();
  uint64_t v25 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0) - 8);
  uint64_t v6 = *(void *)(v25 + 64);
  uint64_t v29 = swift_task_alloc();
  *(void *)(v0 + 136) = v29;
  sub_2495F7288(v1, v29, &qword_2696C4AF0);
  uint64_t v22 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08) - 8);
  uint64_t v7 = *(void *)(v22 + 64);
  uint64_t v27 = swift_task_alloc();
  *(void *)(v0 + 144) = v27;
  sub_2495F7288(v2, v27, &qword_2696C4B08);
  uint64_t v23 = sub_24962BD40();
  uint64_t v8 = *(void *)(v23 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v24 = swift_task_alloc();
  *(void *)(v0 + 152) = v24;
  (*(void (**)(void))(v8 + 16))();
  uint64_t v10 = swift_task_alloc();
  *(void *)(v0 + 160) = v10;
  sub_2495F7288(v28, v10, &qword_2696C4B08);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v12 = (v26 + *(unsigned __int8 *)(v25 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v22 + 80);
  unint64_t v14 = (v6 + v13 + v12) & ~v13;
  unint64_t v15 = (v7 + *(unsigned __int8 *)(v8 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + v13 + v15) & ~v13;
  uint64_t v17 = swift_allocObject();
  *(void *)(v0 + 168) = v17;
  sub_2495F0788((long long *)(v0 + 16), v17 + 16);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v21 + 32))(v17 + v11, v31, v30);
  sub_2495FA914(v29, v17 + v12, &qword_2696C4AF0);
  sub_2495FA914(v27, v17 + v14, &qword_2696C4B08);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32))(v17 + v15, v24, v23);
  sub_2495FA914(v10, v17 + v16, &qword_2696C4B08);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_2495F2994;
  uint64_t v19 = *(void *)(v0 + 72);
  return sub_24961DD5C(v19, (uint64_t)sub_2495FAF30, v17);
}

uint64_t sub_2495F2994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void **)v4;
  *(void *)(*(void *)v4 + 184) = v3;
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v9 = sub_2495F2B44;
  }
  else
  {
    swift_release();
    v8[24] = a3;
    v8[25] = a2;
    v8[26] = a1;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = sub_2495F2B14;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_2495F2B14()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(int8x16_t **)(v0 + 56);
  *uint64_t v2 = vextq_s8(*(int8x16_t *)(v0 + 200), *(int8x16_t *)(v0 + 200), 8uLL);
  v2[1].i64[0] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2495F2B44()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2495F2BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v42 = a5;
  uint64_t v43 = a6;
  uint64_t v40 = a7;
  uint64_t v41 = a4;
  uint64_t v11 = sub_24962BB70();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  unint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = *(void (**)(char *, uint64_t))(v12 + 16);
  uint64_t v44 = v17;
  v16(v15, a1);
  sub_24960FFB0(v48);
  unint64_t v46 = &type metadata for HTTPMultipartFormDataBuilder;
  uint64_t v47 = &off_26FD388B0;
  uint64_t v18 = (_OWORD *)swift_allocObject();
  v45[0] = v18;
  long long v19 = v48[1];
  v18[1] = v48[0];
  v18[2] = v19;
  v18[3] = v48[2];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, (uint64_t)&type metadata for HTTPMultipartFormDataBuilder);
  off_26FD388C0(a2, 6580596, 0xE300000000000000, &type metadata for HTTPMultipartFormDataBuilder, &off_26FD388B0);
  uint64_t v20 = sub_24962BD40();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20, v22);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  MEMORY[0x270FA5388](v25 - 8, v26);
  uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2495F7288(a3, (uint64_t)v28, &qword_2696C4AF0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v28, 1, v20) == 1)
  {
    sub_2495F73C0((uint64_t)v28, &qword_2696C4AF0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v24, v28, v20);
    uint64_t v29 = v46;
    uint64_t v30 = v47;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, (uint64_t)v46);
    ((void (*)(char *, uint64_t, unint64_t, uint64_t, ValueMetadata *, _UNKNOWN **))v30[3])(v24, 0x69616E626D756854, 0xE90000000000006CLL, v41, v29, v30);
    if (v7)
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  }
  uint64_t v31 = v46;
  uint64_t v32 = v47;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, (uint64_t)v46);
  ((void (*)(uint64_t, uint64_t, unint64_t, uint64_t, ValueMetadata *, _UNKNOWN **))v32[3])(v42, 1701603654, 0xE400000000000000, v43, v31, v32);
  if (!v7)
  {
    id v33 = v46;
    uint64_t v34 = v47;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, (uint64_t)v46);
    uint64_t v35 = (void *)((uint64_t (*)(ValueMetadata *, _UNKNOWN **))v34[4])(v33, v34);
    uint64_t v37 = v36;
    id v38 = v35;
    sub_24962BB00();
    uint64_t v49 = v37;
    sub_24962C6B0();
    sub_24962BB60();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v45, (uint64_t)v46);
    swift_bridgeObjectRetain();
    sub_24962BB60();

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v40, v15, v44);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  }
LABEL_7:
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v44);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
}

uint64_t sub_2495F3098@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v41 = a1;
  uint64_t v38 = a3;
  uint64_t v3 = sub_24962BEA0();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v3, v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v5, v8);
  uint64_t v11 = (char *)&v36 - v10;
  MEMORY[0x270FA5388](v9, v12);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = sub_24962BF10();
  swift_allocObject();
  uint64_t v16 = sub_24962BF00();
  void v45[3] = v15;
  v45[4] = &off_26FD38D48;
  v45[0] = v16;
  __swift_project_boxed_opaque_existential_1(v45, v15);
  uint64_t v17 = sub_24962BFA0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  MEMORY[0x270FA5388](v17, v20);
  unint64_t v21 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2495FAB98(&qword_2696C4C30, MEMORY[0x270FB0688]);
  uint64_t v22 = v43;
  uint64_t v23 = sub_24962BEF0();
  if (v22) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  }
  uint64_t v41 = v7;
  uint64_t v42 = 0;
  MEMORY[0x270FA5388](v23, v24);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))((char *)&v36 - v21, (char *)&v36 - v21, v17);
  sub_24962BE90();
  (*(void (**)(char *, uint64_t))(v18 + 8))((char *)&v36 - v21, v17);
  if (qword_2696C49B8 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_24962BF40();
  __swift_project_value_buffer(v26, (uint64_t)qword_2696C4AD0);
  uint64_t v27 = v39;
  uint64_t v28 = v40;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  uint64_t v43 = v14;
  v29(v11, v14, v40);
  uint64_t v30 = sub_24962BF20();
  os_log_type_t v31 = sub_24962C3F0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v46 = v37;
    *(_DWORD *)uint64_t v32 = 136315138;
    uint64_t v28 = v40;
    uint64_t v36 = v32 + 4;
    v29(v41, v11, v40);
    uint64_t v33 = sub_24962C140();
    uint64_t v44 = sub_2495F74C8(v33, v34, &v46);
    uint64_t v27 = v39;
    sub_24962C490();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
    _os_log_impl(&dword_2495EB000, v30, v31, "%s", v32, 0xCu);
    uint64_t v35 = v37;
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v35, -1, -1);
    MEMORY[0x24C5A5090](v32, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  }

  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v38, v43, v28);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
}

uint64_t sub_2495F350C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = type metadata accessor for FileDownloadResult.Output(0);
  v3[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2495F35A4, 0, 0);
}

uint64_t sub_2495F35A4()
{
  uint64_t v10 = v0[4];
  uint64_t v1 = sub_24962BB70();
  v0[7] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  v0[8] = v3;
  type metadata accessor for FileTransferController.Configuration(0);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *(void *)(sub_24962BD40() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v5 + 16))();
  sub_24962BB40();
  swift_task_dealloc();
  sub_24962BAE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v4, v1);
  swift_bridgeObjectRetain();
  sub_24962BB60();
  swift_bridgeObjectRelease();
  sub_24962BB60();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[9] = v6;
  v0[10] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v4, v1);
  swift_task_dealloc();
  sub_24962BAF0();
  uint64_t v7 = swift_task_alloc();
  v0[11] = v7;
  *(void *)(v7 + 16) = v10;
  *(void *)(v7 + 24) = v3;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[12] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2495F3898;
  return sub_2495F8074(dword_2696C4B50, v7);
}

uint64_t sub_2495F3898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[13] = a1;
  v5[14] = a2;
  v5[15] = a3;
  v5[16] = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v3) {
    uint64_t v6 = sub_2495F3CC8;
  }
  else {
    uint64_t v6 = sub_2495F39D0;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2495F39D0()
{
  unint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void **)(v0 + 120);
  if (v1 >> 60 == 15)
  {
    sub_2495F741C();
    swift_allocError();
    *uint64_t v3 = 0;
    swift_willThrow();

    (*(void (**)(void, void))(v0 + 72))(*(void *)(v0 + 64), *(void *)(v0 + 56));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v6 = *(uint64_t **)(v0 + 48);
    uint64_t *v6 = v5;
    v6[1] = v1;
    swift_storeEnumTagMultiPayload();
    sub_2495F7E7C(v5, v1);
    sub_2495F7E7C(v5, v1);
    id v7 = objc_msgSend(v2, sel_suggestedFilename);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = sub_24962C0F0();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(void **)(v0 + 120);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    uint64_t v13 = swift_task_alloc();
    id v14 = objc_msgSend(v12, sel_MIMEType);
    unint64_t v15 = *(void *)(v0 + 112);
    uint64_t v16 = *(void **)(v0 + 120);
    uint64_t v17 = *(void *)(v0 + 104);
    if (v14)
    {
      uint64_t v18 = v14;
      sub_24962C0F0();

      sub_24962BEE0();
      swift_task_alloc();
      sub_24962BED0();
      sub_24962BEB0();
      sub_2495F8F84(v17, v15);
      sub_2495F8F84(v17, v15);

      swift_task_dealloc();
    }
    else
    {
      uint64_t v19 = sub_24962BEE0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
      sub_2495F8F84(v17, v15);
      sub_2495F8F84(v17, v15);
    }
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 72);
    uint64_t v22 = *(void *)(v0 + 56);
    uint64_t v21 = *(void *)(v0 + 64);
    uint64_t v23 = *(void *)(v0 + 16);
    sub_2495F8F98(*(void *)(v0 + 48), v23);
    uint64_t v24 = type metadata accessor for FileDownloadResult(0);
    uint64_t v25 = (uint64_t *)(v23 + *(int *)(v24 + 20));
    uint64_t *v25 = v9;
    v25[1] = v11;
    sub_2495FA914(v13, v23 + *(int *)(v24 + 24), &qword_2696C4B08);
    v20(v21, v22);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v4();
}

uint64_t sub_2495F3CC8()
{
  (*(void (**)(void, void))(v0 + 72))(*(void *)(v0 + 64), *(void *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2495F3D50(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return MEMORY[0x270FA2498](sub_2495F3D70, 0, 0);
}

uint64_t sub_2495F3D70()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = swift_task_alloc();
  v0[7] = v3;
  *(void *)(v3 + 16) = v1;
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator), *(void *)(v2 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator + 24));
  uint64_t v6 = (char *)&dword_2696C4A90 + dword_2696C4A90;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  void *v4 = v0;
  v4[1] = sub_2495F3E70;
  return ((uint64_t (*)(void *, void *, uint64_t))v6)(v0 + 2, &unk_2696C4C20, v3);
}

uint64_t sub_2495F3E70()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2495F0DCC;
  }
  else {
    uint64_t v2 = sub_2495F3F84;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2495F3F84()
{
  swift_task_dealloc();
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  return v4(v1, v2, v3);
}

uint64_t sub_2495F3FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = type metadata accessor for FileDownloadResult.Output(0);
  v4[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2495F4088, 0, 0);
}

uint64_t sub_2495F4088()
{
  uint64_t v12 = v0[5];
  uint64_t v13 = v0[4];
  uint64_t v1 = sub_24962BB70();
  v0[8] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  v0[9] = v3;
  type metadata accessor for FileTransferController.Configuration(0);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = sub_24962BD40();
  v0[10] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  swift_task_alloc();
  uint64_t v7 = *(void (**)(void))(v6 + 16);
  v0[11] = v7;
  v0[12] = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7();
  sub_24962BB40();
  swift_task_dealloc();
  sub_24962BAE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v4, v1);
  swift_bridgeObjectRetain();
  sub_24962BB60();
  swift_bridgeObjectRelease();
  sub_24962BB60();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[13] = v8;
  v0[14] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v4, v1);
  swift_task_dealloc();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[15] = v9;
  v9[2] = v12;
  v9[3] = v3;
  v9[4] = v13;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[16] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_2495F4390;
  return sub_2495F8074((int *)&unk_2696C4B70, (uint64_t)v9);
}

uint64_t sub_2495F4390(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v4;
  *(void *)(v7 + 136) = a3;
  *(void *)(v7 + 144) = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v8 = sub_2495F4730;
  }
  else
  {
    sub_2495F8F84(a1, a2);
    uint64_t v8 = sub_2495F44E0;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_2495F44E0()
{
  uint64_t v1 = *(void **)(v0 + 136);
  (*(void (**)(void, void, void))(v0 + 88))(*(void *)(v0 + 56), *(void *)(v0 + 32), *(void *)(v0 + 80));
  swift_storeEnumTagMultiPayload();
  id v2 = objc_msgSend(v1, sel_suggestedFilename);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_24962C0F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void **)(v0 + 136);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
  uint64_t v8 = swift_task_alloc();
  id v9 = objc_msgSend(v7, sel_MIMEType);
  uint64_t v10 = *(void **)(v0 + 136);
  if (v9)
  {
    uint64_t v11 = v9;
    sub_24962C0F0();

    sub_24962BEE0();
    swift_task_alloc();
    sub_24962BED0();
    sub_24962BEB0();

    swift_task_dealloc();
  }
  else
  {
    uint64_t v12 = sub_24962BEE0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  }
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0 + 104);
  uint64_t v15 = *(void *)(v0 + 64);
  uint64_t v14 = *(void *)(v0 + 72);
  uint64_t v16 = *(void *)(v0 + 16);
  sub_2495F8F98(*(void *)(v0 + 56), v16);
  uint64_t v17 = type metadata accessor for FileDownloadResult(0);
  uint64_t v18 = (uint64_t *)(v16 + *(int *)(v17 + 20));
  *uint64_t v18 = v4;
  v18[1] = v6;
  sub_2495FA914(v8, v16 + *(int *)(v17 + 24), &qword_2696C4B08);
  v13(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_2495F4730()
{
  (*(void (**)(void, void))(v0 + 104))(*(void *)(v0 + 72), *(void *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2495F47B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2495F47D4, 0, 0);
}

uint64_t sub_2495F47D4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator), *(void *)(v1 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator + 24));
  uint64_t v5 = (uint64_t (*)(void *, uint64_t))((char *)&dword_2696C4AB0 + dword_2696C4AB0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2495F48C4;
  return v5(&unk_2696C4BF0, v2);
}

uint64_t sub_2495F48C4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2495F4A5C;
  }
  else
  {
    *(void *)(v4 + 64) = a1;
    uint64_t v5 = sub_2495F49EC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2495F49EC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void, unint64_t, uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  return v1(0, 0xF000000000000000, v2);
}

uint64_t sub_2495F4A5C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t FileTransferController.deinit()
{
  sub_2495F91C4(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration, type metadata accessor for FileTransferController.Configuration);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator);
  return v0;
}

uint64_t FileTransferController.__deallocating_deinit()
{
  sub_2495F91C4(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration, type metadata accessor for FileTransferController.Configuration);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2495F4B94@<X0>(id a1@<X1>, unsigned __int8 *a2@<X0>, uint64_t a3@<X2>, char *a4@<X8>)
{
  id v6 = a1;
  int v8 = *a2;
  id v9 = objc_msgSend(a1, sel_fileTransferCapabilities);
  if (!v9) {
    goto LABEL_10;
  }
  uint64_t v10 = v9;
  LODWORD(v80) = v8;
  uint64_t v81 = a4;
  uint64_t v82 = v4;
  uint64_t v11 = sub_24962BD40();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11, v14);
  unint64_t v15 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  v83 = (char *)v71 - v15;
  id v93 = v10;
  id v16 = objc_msgSend(v10, sel_contentServerUploadUrl);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v86 = v71;
  uint64_t v19 = MEMORY[0x270FA5388](v17 - 8, v18);
  uint64_t v22 = (char *)v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))((char *)v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v11);
    goto LABEL_9;
  }
  uint64_t v79 = v21;
  uint64_t v84 = v71;
  MEMORY[0x270FA5388](v19, v20);
  id v85 = v6;
  uint64_t v23 = (char *)v71 - v15;
  sub_24962BCD0();

  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v25 = v23;
  id v6 = v85;
  v24(v22, v25, v11);
  uint64_t v77 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
  uint64_t v78 = v12 + 56;
  v77(v22, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v22, 1, v11) == 1)
  {
LABEL_9:

    sub_2495F73C0((uint64_t)v22, &qword_2696C4AF0);
LABEL_10:
    if (qword_2696C49B8 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_24962BF40();
    __swift_project_value_buffer(v45, (uint64_t)qword_2696C4AD0);
    uint64_t v46 = sub_24962BF20();
    os_log_type_t v47 = sub_24962C400();
    if (os_log_type_enabled(v46, v47))
    {
      unint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v48 = 0;
      _os_log_impl(&dword_2495EB000, v46, v47, "Failed to retrieve file transfer capabilities", v48, 2u);
      MEMORY[0x24C5A5090](v48, -1, -1);
    }

    sub_2495F741C();
    swift_allocError();
    unsigned char *v49 = 4;
    swift_willThrow();

    return __swift_destroy_boxed_opaque_existential_1(a3);
  }
  uint64_t v26 = v11;
  uint64_t v76 = v12;
  uint64_t v27 = v83;
  uint64_t v28 = v22;
  uint64_t v29 = v26;
  uint64_t v75 = v12 + 32;
  ((void (*)(char *, char *))v24)(v83, v28);
  id v30 = objc_msgSend(v6, sel_identity);
  if (v30)
  {
    os_log_type_t v31 = v30;
    uint64_t v32 = v24;
    id v33 = objc_msgSend(v30, sel_impus);

    unint64_t v34 = (void *)sub_24962C2A0();
    if (v34[2])
    {
      uint64_t v35 = v34[5];
      uint64_t v72 = v34[4];
      uint64_t v73 = v35;
      swift_bridgeObjectRetain();
      uint64_t v36 = swift_bridgeObjectRelease();
      uint64_t v86 = v71;
      MEMORY[0x270FA5388](v36, v37);
      uint64_t v38 = *(void (**)(void))(v76 + 16);
      v71[0] = (char *)v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      v38();
      id v39 = objc_msgSend(v93, sel_contentServerDownloadUrl);
      v71[1] = v71;
      uint64_t v41 = MEMORY[0x270FA5388](v39, v40);
      uint64_t v43 = (char *)v71 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
      BOOL v74 = v32;
      if (v41)
      {
        sub_24962BCD0();

        uint64_t v44 = 0;
      }
      else
      {
        uint64_t v44 = 1;
      }
      uint64_t v57 = v29;
      v77(v43, v44, 1, v29);
      uint64_t v58 = type metadata accessor for ManagedURLSessionAuthenticator();
      LOBYTE(v87) = (_BYTE)v80;
      sub_2495F07A0(a3, (uint64_t)&v90);
      uint64_t v59 = v91;
      uint64_t v60 = (uint64_t)v92;
      uint64_t v61 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v90, v91);
      uint64_t v80 = v43;
      MEMORY[0x270FA5388](v61, v61);
      uint64_t v63 = (char *)v71 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v64 + 16))(v63);
      id v65 = v85;
      uint64_t v66 = sub_249614F78(&v87, v65, (uint64_t)v63, v58, v59, v60);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
      uint64_t v91 = v58;
      v92 = &off_26FD38CF0;
      uint64_t v88 = &type metadata for FileTransferController.DefaultFactory;
      v89 = &off_26FD38008;
      *(void *)&long long v90 = v66;

      __swift_destroy_boxed_opaque_existential_1(a3);
      (*(void (**)(char *, uint64_t))(v76 + 8))(v83, v57);
      uint64_t v67 = v81;
      v74(v81, (char *)v71[0], v57);
      uint64_t v68 = (int *)type metadata accessor for FileTransferController.Configuration(0);
      sub_2495FA914((uint64_t)v80, (uint64_t)&v67[v68[5]], &qword_2696C4AF0);
      v69 = &v67[v68[6]];
      uint64_t v70 = v73;
      char *v69 = v72;
      v69[1] = v70;
      sub_2495F0788(&v90, (uint64_t)&v67[v68[7]]);
      return sub_2495F0788(&v87, (uint64_t)&v67[v68[8]]);
    }
    swift_bridgeObjectRelease();
    id v6 = v85;
  }
  if (qword_2696C49B8 != -1) {
    swift_once();
  }
  uint64_t v51 = sub_24962BF40();
  __swift_project_value_buffer(v51, (uint64_t)qword_2696C4AD0);
  uint64_t v52 = sub_24962BF20();
  os_log_type_t v53 = sub_24962C400();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v54 = 0;
    _os_log_impl(&dword_2495EB000, v52, v53, "Failed to retrieve IMPU", v54, 2u);
    uint64_t v55 = v54;
    id v6 = v85;
    MEMORY[0x24C5A5090](v55, -1, -1);
  }

  sub_2495F741C();
  swift_allocError();
  *uint64_t v56 = 4;
  swift_willThrow();

  __swift_destroy_boxed_opaque_existential_1(a3);
  return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v27, v29);
}

uint64_t sub_2495F53D4(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = a3;
  *(unsigned char *)(v3 + 105) = *a2;
  return MEMORY[0x270FA2498](sub_2495F53FC, 0, 0);
}

uint64_t sub_2495F53FC()
{
  char v1 = *(unsigned char *)(v0 + 105);
  *(void *)(v0 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02D30]), sel_initWithQueue_, 0);
  *(unsigned char *)(v0 + 104) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2495F54C4;
  return sub_2495FFA08((unsigned char *)(v0 + 104));
}

uint64_t sub_2495F54C4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2495F569C;
  }
  else
  {
    *(void *)(v4 + 96) = a1;
    uint64_t v5 = sub_2495F55EC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2495F55EC()
{
  uint64_t v7 = v0;
  uint64_t v1 = *(void **)(v0 + 96);
  uint64_t v3 = *(char **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  v6[0] = *(unsigned char *)(v0 + 105);
  sub_2495F07A0(v2, v0 + 16);
  sub_2495F4B94(v1, v6, v0 + 16, v3);

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2495F569C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static FileTransferController.makeController(for:urlSession:)(unsigned char *a1, uint64_t a2)
{
  *(void *)(v3 + 96) = a2;
  *(void *)(v3 + 104) = v2;
  *(void *)(v3 + 112) = type metadata accessor for FileTransferController.Configuration(0);
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  *(unsigned char *)(v3 + 153) = *a1;
  return MEMORY[0x270FA2498](sub_2495F57B0, 0, 0);
}

uint64_t sub_2495F57B0()
{
  uint64_t v1 = *(void **)(v0 + 96);
  *(unsigned char *)(v0 + 152) = *(unsigned char *)(v0 + 153);
  *(void *)(v0 + 40) = sub_2495F0748();
  *(void *)(v0 + 48) = &off_26FD384F8;
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 136) = v3;
  *(void *)uint64_t v3 = v0;
  *(void *)(v3 + 8) = sub_2495F589C;
  *(void *)(v3 + 56) = *(void *)(v0 + 128);
  *(void *)(v3 + 64) = v0 + 16;
  *(unsigned char *)(v3 + 105) = *(unsigned char *)(v0 + 152);
  return MEMORY[0x270FA2498](sub_2495F53FC, 0, 0);
}

uint64_t sub_2495F589C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2495F5ACC;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    uint64_t v3 = sub_2495F59B8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2495F59B8()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  sub_2495F9224(v1, v2);
  type metadata accessor for FileTransferController(0);
  uint64_t v4 = swift_allocObject();
  sub_2495F9224(v2, v4 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration);
  sub_2495F07A0(v2 + *(int *)(v3 + 28), v0 + 56);
  sub_2495F91C4(v2, type metadata accessor for FileTransferController.Configuration);
  sub_2495F0788((long long *)(v0 + 56), v4 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator);
  sub_2495F91C4(v1, type metadata accessor for FileTransferController.Configuration);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v4);
}

uint64_t sub_2495F5ACC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static FileTransferController.makeController(for:)(unsigned char *a1)
{
  *(unsigned char *)(v1 + 41) = *a1;
  return MEMORY[0x270FA2498](sub_2495F5B68, 0, 0);
}

uint64_t sub_2495F5B68()
{
  char v1 = *(unsigned char *)(v0 + 41);
  type metadata accessor for FileTransferController(0);
  *(unsigned char *)(v0 + 40) = v1;
  id v2 = objc_msgSend(self, sel_defaultSessionConfiguration);
  uint64_t v3 = (void *)sub_24962C0C0();
  objc_msgSend(v2, sel_set_sourceApplicationBundleIdentifier_, v3);

  id v4 = objc_msgSend(self, sel_sessionWithConfiguration_, v2);
  *(void *)(v0 + 16) = v4;

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2495F5CA8;
  return static FileTransferController.makeController(for:urlSession:)((unsigned char *)(v0 + 40), (uint64_t)v4);
}

uint64_t sub_2495F5CA8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2495F5E00, 0, 0);
  }
  else
  {

    uint64_t v6 = *(uint64_t (**)(uint64_t))(v5 + 8);
    return v6(a1);
  }
}

uint64_t sub_2495F5E00()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id static FileTransferController.makeController(for:systemConfiguration:)(unsigned __int8 *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for FileTransferController.Configuration(0);
  uint64_t v7 = MEMORY[0x270FA5388](v5, v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v19 - v11;
  unsigned __int8 v23 = *a1;
  uint64_t v13 = self;
  id v14 = a2;
  id v15 = objc_msgSend(v13, sel_defaultSessionConfiguration);
  id v16 = (void *)sub_24962C0C0();
  objc_msgSend(v15, sel_set_sourceApplicationBundleIdentifier_, v16);

  id v17 = objc_msgSend(self, sel_sessionWithConfiguration_, v15);
  unint64_t v21 = sub_2495F0748();
  uint64_t v22 = &off_26FD384F8;
  *(void *)&long long v20 = v17;
  sub_2495F4B94(v14, &v23, (uint64_t)&v20, v12);
  if (!v2)
  {
    sub_2495F9224((uint64_t)v12, (uint64_t)v9);
    type metadata accessor for FileTransferController(0);
    id v14 = (id)swift_allocObject();
    sub_2495F9224((uint64_t)v9, (uint64_t)v14 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration);
    sub_2495F07A0((uint64_t)&v9[*(int *)(v5 + 28)], (uint64_t)&v20);
    sub_2495F91C4((uint64_t)v9, type metadata accessor for FileTransferController.Configuration);
    sub_2495F0788(&v20, (uint64_t)v14 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_managedAuthenticator);
    sub_2495F91C4((uint64_t)v12, type metadata accessor for FileTransferController.Configuration);
  }
  return v14;
}

uint64_t sub_2495F6084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24962C580();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_2495F6188, 0, 0);
}

uint64_t sub_2495F6188()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24962C5A0();
  uint64_t v5 = sub_2495FAA38(&qword_2696C4C08, MEMORY[0x263F8F710]);
  sub_24962C700();
  sub_2495FAA38(&qword_2696C4C10, MEMORY[0x263F8F6D8]);
  sub_24962C5B0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_2495F6328;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_2495F6328()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2495F64E4, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2495F64E4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2495F6550(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_2495F6E98(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_24962C230();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_24962C190();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_24962C190();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_24962C260();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_2495F7158(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_2495F7158((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  uint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_24962C190();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_24962C260();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_2495F7158(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_2495F7158((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    uint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_24962C5C0();
  __break(1u);
LABEL_42:
  uint64_t result = sub_24962C5C0();
  __break(1u);
  return result;
}

uint64_t sub_2495F69F4(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, unint64_t a5, unint64_t a6)
{
  v47[3] = a4;
  if (a1 < 0) {
    goto LABEL_35;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = a5;
  if (!a1 || (unint64_t v45 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_2495F6FF4(a6, v44, a2 & 1, v10);
    swift_bridgeObjectRelease();
    a6 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    swift_release();
    return a6;
  }
  uint64_t v35 = a1;
  uint64_t v36 = v10;
  uint64_t v43 = (void *)MEMORY[0x263F8EE78];
  unint64_t v12 = a5;
  unint64_t v13 = a5;
  unint64_t v40 = a5;
  while (1)
  {
    v47[0] = sub_24962C470();
    v47[1] = v14;
    char v15 = a3(v47);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a6;
    }
    char v16 = v15;
    swift_bridgeObjectRelease();
    if (v16) {
      break;
    }
    unint64_t v12 = sub_24962C460();
LABEL_9:
    if (v45 == v12 >> 14) {
      goto LABEL_24;
    }
  }
  if (v13 >> 14 == v12 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v12 = sub_24962C460();
    *(void *)(v44 + 16) = v12;
    unint64_t v13 = v12;
    unint64_t v40 = v12;
    goto LABEL_9;
  }
  if (v12 >> 14 < v13 >> 14) {
    goto LABEL_34;
  }
  uint64_t v17 = sub_24962C480();
  uint64_t v39 = v18;
  uint64_t v41 = v17;
  uint64_t v37 = v20;
  uint64_t v38 = v19;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v43 = sub_2495F7158(0, v43[2] + 1, 1, v43);
  }
  unint64_t v22 = v43[2];
  unint64_t v21 = v43[3];
  if (v22 >= v21 >> 1) {
    uint64_t v43 = sub_2495F7158((void *)(v21 > 1), v22 + 1, 1, v43);
  }
  v43[2] = v22 + 1;
  uint64_t v23 = &v43[4 * v22];
  v23[4] = v41;
  v23[5] = v39;
  v23[6] = v38;
  v23[7] = v37;
  *(void *)(v36 + 16) = v43;
  uint64_t v24 = sub_24962C460();
  unint64_t v12 = v24;
  *(void *)(v44 + 16) = v24;
  if (v43[2] != v35)
  {
    unint64_t v13 = v24;
    unint64_t v40 = v24;
    goto LABEL_9;
  }
  unint64_t v40 = v24;
  unint64_t v13 = v24;
LABEL_24:
  if (v45 == v13 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
LABEL_33:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  if (v45 >= v40 >> 14)
  {
    uint64_t v25 = sub_24962C480();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a6 = (unint64_t)sub_2495F7158(0, v43[2] + 1, 1, v43);
    }
    unint64_t v33 = *(void *)(a6 + 16);
    unint64_t v32 = *(void *)(a6 + 24);
    if (v33 >= v32 >> 1) {
      a6 = (unint64_t)sub_2495F7158((void *)(v32 > 1), v33 + 1, 1, (void *)a6);
    }
    *(void *)(a6 + 16) = v33 + 1;
    uint64_t v34 = (void *)(a6 + 32 * v33);
    v34[4] = v25;
    v34[5] = v27;
    v34[6] = v29;
    v34[7] = v31;
    *(void *)(v36 + 16) = a6;
    goto LABEL_33;
  }
LABEL_34:
  sub_24962C5C0();
  __break(1u);
LABEL_35:
  uint64_t result = sub_24962C5C0();
  __break(1u);
  return result;
}

uint64_t sub_2495F6E98(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_24962C260();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_2495F7158(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_2495F7158((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    uint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_24962C5C0();
  __break(1u);
  return result;
}

uint64_t sub_2495F6FF4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_24962C480();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_2495F7158(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_2495F7158((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    uint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_24962C5C0();
  __break(1u);
  return result;
}

void *sub_2495F7158(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4BE0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      long long v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2495F7F80(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FileTransferController.Configuration(uint64_t a1)
{
  return sub_2495F92A8(a1, (uint64_t *)&unk_2696C4BC8);
}

uint64_t sub_2495F7288(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2495F72EC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v2 + 16);
  long long v9 = *(_OWORD *)(v2 + 32);
  long long v10 = *(_OWORD *)(v2 + 48);
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = sub_2495F0868;
  *(void *)(v7 + 120) = v6;
  *(_OWORD *)(v7 + 104) = v10;
  *(_OWORD *)(v7 + 88) = v9;
  *(_OWORD *)(v7 + 72) = v8;
  *(void *)(v7 + 56) = a1;
  *(void *)(v7 + 64) = a2;
  return MEMORY[0x270FA2498](sub_2495F2574, 0, 0);
}

uint64_t sub_2495F73C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2495F741C()
{
  unint64_t result = qword_2696C4B28;
  if (!qword_2696C4B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4B28);
  }
  return result;
}

uint64_t sub_2495F7470(uint64_t a1, unint64_t a2)
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

uint64_t sub_2495F74C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2495F759C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2495FAB3C((uint64_t)v12, *a3);
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
      sub_2495FAB3C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2495F759C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24962C4A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2495F7758(a5, a6);
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
  uint64_t v8 = sub_24962C570();
  if (!v8)
  {
    sub_24962C5C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24962C610();
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

uint64_t sub_2495F7758(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2495F77F0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2495F7968(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2495F7968(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2495F77F0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_249603630(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24962C530();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24962C5C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24962C1C0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24962C610();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24962C5C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2495F7968(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C28);
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
  uint64_t result = sub_24962C610();
  __break(1u);
  return result;
}

uint64_t sub_2495F7AB8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2495F7AF8(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2495F7AD8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2495F7C64(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2495F7AF8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C38);
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
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24962C610();
  __break(1u);
  return result;
}

uint64_t sub_2495F7C64(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C40);
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
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24962C610();
  __break(1u);
  return result;
}

uint64_t sub_2495F7DD0(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_24962C6C0() & 1;
  }
}

unint64_t sub_2495F7E28()
{
  unint64_t result = qword_2696C4B30;
  if (!qword_2696C4B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4B30);
  }
  return result;
}

uint64_t sub_2495F7E7C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2495F7ED4()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_2495FB164;
  *(_OWORD *)(v2 + 40) = v3;
  return MEMORY[0x270FA2498](sub_2495F3D70, 0, 0);
}

uint64_t sub_2495F7F80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24962C610();
  __break(1u);
  return result;
}

uint64_t sub_2495F8074(int *a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  uint64_t v4 = sub_24962C5A0();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  int64_t v7 = (uint64_t (*)(void))((char *)a1 + *a1);
  unint64_t v5 = (void *)swift_task_alloc();
  v2[10] = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_2495F81A8;
  return v7();
}

uint64_t sub_2495F81A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = (void *)*v4;
  unint64_t v6 = (void *)*v4;
  v5[11] = a1;
  v5[12] = a2;
  v5[13] = a3;
  swift_task_dealloc();
  if (v3)
  {
    swift_task_dealloc();
    int64_t v7 = (uint64_t (*)(void))v6[1];
    return v7();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2495F82FC, 0, 0);
  }
}

uint64_t sub_2495F82FC()
{
  uint64_t v39 = v0;
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  uint64_t v2 = *(void **)(v0 + 104);
  if (!v1)
  {
    uint64_t v17 = *(void *)(v0 + 88);
    unint64_t v16 = *(void *)(v0 + 96);
    sub_2495F741C();
    swift_allocError();
    *uint64_t v18 = 0;
    swift_willThrow();
LABEL_16:

    sub_2495F8F84(v17, v16);
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
  uint64_t v3 = (void *)v1;
  uint64_t v4 = qword_2696C49B8;
  id v5 = v2;
  if (v4 == -1)
  {
    unint64_t v6 = v5;
  }
  else
  {
    swift_once();
    unint64_t v6 = *(void **)(v0 + 104);
  }
  uint64_t v7 = sub_24962BF40();
  *(void *)(v0 + 112) = __swift_project_value_buffer(v7, (uint64_t)qword_2696C4AD0);
  id v8 = v6;
  uint64_t v9 = sub_24962BF20();
  os_log_type_t v10 = sub_24962C3F0();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = *(void **)(v0 + 104);
  if (v11)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    *(void *)(v0 + 32) = v3;
    id v15 = v12;
    sub_24962C490();
    *uint64_t v14 = v3;

    _os_log_impl(&dword_2495EB000, v9, v10, "%@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v14, -1, -1);
    MEMORY[0x24C5A5090](v13, -1, -1);
  }
  else
  {
  }
  if (objc_msgSend(v3, sel_statusCode) == (id)200)
  {

    uint64_t v19 = *(void *)(v0 + 88);
    uint64_t v20 = *(void *)(v0 + 96);
    swift_task_dealloc();
    unint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, void *))(v0 + 8);
    return v21(v19, v20, v3);
  }
  if (objc_msgSend(v3, sel_statusCode) != (id)503
    || (sub_2496032C8(), (v25 & 1) != 0)
    || (uint64_t v26 = v23, v27 = v24, (sub_24962C7C0() & 1) != 0))
  {
    unint64_t v16 = *(void *)(v0 + 96);
    uint64_t v2 = *(void **)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 88);
    sub_2495F741C();
    swift_allocError();
    *uint64_t v28 = 0;
    swift_willThrow();

    goto LABEL_16;
  }
  uint64_t v30 = sub_24962BF20();
  os_log_type_t v31 = sub_24962C410();
  if (os_log_type_enabled(v30, v31))
  {
    unint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v38 = v33;
    *(_DWORD *)unint64_t v32 = 136315138;
    uint64_t v34 = sub_24962C7B0();
    *(void *)(v0 + 24) = sub_2495F74C8(v34, v35, &v38);
    sub_24962C490();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2495EB000, v30, v31, "Received 503 with Retry-After, will retry in %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v33, -1, -1);
    MEMORY[0x24C5A5090](v32, -1, -1);
  }

  sub_24962C590();
  uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2696C4BF8 + dword_2696C4BF8);
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_2495F87F4;
  return v37(v26, v27, 0, 0, 1);
}

uint64_t sub_2495F87F4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[8] + 8))(v2[9], v2[7]);
  if (v0) {
    uint64_t v3 = sub_2495F8AA4;
  }
  else {
    uint64_t v3 = sub_2495F895C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2495F895C()
{
  uint64_t v1 = sub_24962BF20();
  os_log_type_t v2 = sub_24962C410();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2495EB000, v1, v2, "Retrying download after Retry-After duration elapsed", v3, 2u);
    MEMORY[0x24C5A5090](v3, -1, -1);
  }
  uint64_t v4 = *(int **)(v0 + 40);

  uint64_t v7 = (uint64_t (*)(void))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2495F8B2C;
  return v7();
}

uint64_t sub_2495F8AA4()
{
  unint64_t v1 = v0[12];
  os_log_type_t v2 = (void *)v0[13];
  uint64_t v3 = v0[11];

  sub_2495F8F84(v3, v1);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2495F8B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[18] = a1;
  v5[19] = a2;
  v5[20] = a3;
  v5[21] = v3;
  swift_task_dealloc();
  if (v3) {
    uint64_t v6 = sub_2495F8EFC;
  }
  else {
    uint64_t v6 = sub_2495F8C44;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2495F8C44()
{
  id v1 = *(id *)(v0 + 160);
  os_log_type_t v2 = sub_24962BF20();
  os_log_type_t v3 = sub_24962C3F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void **)(v0 + 160);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    char v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    *(void *)(v0 + 16) = v4;
    id v6 = v4;
    sub_24962C490();
    void *v25 = v4;

    _os_log_impl(&dword_2495EB000, v2, v3, "Response after retry: %@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v25, -1, -1);
    MEMORY[0x24C5A5090](v5, -1, -1);
  }
  else
  {
    uint64_t v7 = *(void **)(v0 + 160);

    os_log_type_t v2 = *(NSObject **)(v0 + 160);
  }

  self;
  uint64_t v8 = (void *)swift_dynamicCastObjCClass();
  if (v8 && (uint64_t v9 = v8, objc_msgSend(v8, sel_statusCode) == (id)200))
  {
    unint64_t v10 = *(void *)(v0 + 96);
    BOOL v11 = *(void **)(v0 + 104);
    uint64_t v12 = *(void *)(v0 + 88);

    sub_2495F8F84(v12, v10);
    uint64_t v14 = *(void *)(v0 + 144);
    uint64_t v13 = *(void *)(v0 + 152);
    swift_task_dealloc();
    id v15 = *(uint64_t (**)(uint64_t, uint64_t, void *))(v0 + 8);
    return v15(v14, v13, v9);
  }
  else
  {
    unint64_t v17 = *(void *)(v0 + 152);
    uint64_t v18 = *(void **)(v0 + 160);
    uint64_t v19 = *(void *)(v0 + 144);
    unint64_t v20 = *(void *)(v0 + 96);
    unint64_t v21 = *(void **)(v0 + 104);
    uint64_t v22 = *(void *)(v0 + 88);
    sub_2495F741C();
    swift_allocError();
    *uint64_t v23 = 0;
    swift_willThrow();

    sub_2495F8F84(v19, v17);
    sub_2495F8F84(v22, v20);
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
}

uint64_t sub_2495F8EFC()
{
  unint64_t v1 = v0[12];
  os_log_type_t v2 = (void *)v0[13];
  uint64_t v3 = v0[11];

  sub_2495F8F84(v3, v1);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2495F8F84(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2495F7470(a1, a2);
  }
  return a1;
}

uint64_t sub_2495F8F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FileDownloadResult.Output(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2495F8FFC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_2495F90B0;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return MEMORY[0x270FA2498](sub_2495F47D4, 0, 0);
}

uint64_t sub_2495F90B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *v3;
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 8);
  return v7(a1, a2, a3);
}

uint64_t sub_2495F91C4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2495F9224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FileTransferController.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for FileTransferController(uint64_t a1)
{
  return sub_2495F92A8(a1, (uint64_t *)&unk_2696C4B98);
}

uint64_t sub_2495F92A8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2495F92E4()
{
  unint64_t result = qword_2696C4B90;
  if (!qword_2696C4B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4B90);
  }
  return result;
}

uint64_t sub_2495F9338()
{
  return type metadata accessor for FileTransferController(0);
}

uint64_t sub_2495F9340()
{
  uint64_t result = type metadata accessor for FileTransferController.Configuration(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FileTransferController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FileTransferController);
}

uint64_t dispatch thunk of FileTransferController.uploadFile(at:thumbnailURL:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 104)
                                                          + **(int **)(*(void *)v3 + 104));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_2495EFD7C;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of FileTransferController.upload(fileRequest:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 112) + **(int **)(*(void *)v2 + 112));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_2495F0868;
  return v8(a1, a2);
}

uint64_t dispatch thunk of FileTransferController.downloadFile(at:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 120) + **(int **)(*(void *)v2 + 120));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_2495F0868;
  return v8(a1, a2);
}

uint64_t dispatch thunk of FileTransferController.downloadFile(at:destinationFileURL:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 128)
                                                          + **(int **)(*(void *)v3 + 128));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_2495F0868;
  return v10(a1, a2, a3);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FileTransferController.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FileTransferController.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x2495F99B8);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_2495F99E0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2495F99E8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FileTransferController.Error()
{
  return &type metadata for FileTransferController.Error;
}

char *sub_2495F9A00(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24962BD40();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = a3[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v10], 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9(v11, v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    unint64_t v17 = &a1[v15];
    uint64_t v18 = &a2[v15];
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)unint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    unint64_t v20 = &a1[v16];
    unint64_t v21 = &a2[v16];
    long long v22 = *(_OWORD *)&a2[v16 + 24];
    *(_OWORD *)&a1[v16 + 24] = v22;
    uint64_t v23 = v22;
    uint64_t v24 = **(void (***)(char *, char *, uint64_t))(v22 - 8);
    swift_bridgeObjectRetain();
    v24(v20, v21, v23);
    uint64_t v25 = a3[8];
    long long v26 = *(_OWORD *)&a2[v25 + 24];
    *(_OWORD *)&a1[v25 + 24] = v26;
    (**(void (***)(void))(v26 - 8))();
  }
  return a1;
}

uint64_t sub_2495F9C54(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_24962BD40();
  uint64_t v5 = *(void *)(v4 - 8);
  unsigned int v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = a1 + a2[5];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  return __swift_destroy_boxed_opaque_existential_1(a1 + a2[8]);
}

char *sub_2495F9D5C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v9], 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = v17;
  uint64_t v18 = &a1[v14];
  uint64_t v19 = &a2[v14];
  long long v20 = *(_OWORD *)&a2[v14 + 24];
  *(_OWORD *)&a1[v14 + 24] = v20;
  uint64_t v21 = v20;
  long long v22 = **(void (***)(char *, char *, uint64_t))(v20 - 8);
  swift_bridgeObjectRetain();
  v22(v18, v19, v21);
  uint64_t v23 = a3[8];
  long long v24 = *(_OWORD *)&a2[v23 + 24];
  *(_OWORD *)&a1[v23 + 24] = v24;
  (**(void (***)(void))(v24 - 8))();
  return a1;
}

char *sub_2495F9F60(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v22 = a3;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v21 = a2;
  uint64_t v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  uint64_t v16 = v22;
  uint64_t v17 = *(int *)(v22 + 24);
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &v21[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)&a1[*(int *)(v16 + 28)], (uint64_t *)&v21[*(int *)(v16 + 28)]);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)&a1[*(int *)(v16 + 32)], (uint64_t *)&v21[*(int *)(v16 + 32)]);
  return a1;
}

char *sub_2495FA178(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v9], 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  int v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  long long v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)int v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *((void *)v14 + 4) = *((void *)v15 + 4);
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  long long v20 = *((_OWORD *)v19 + 1);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v18 + 4) = *((void *)v19 + 4);
  return a1;
}

uint64_t sub_2495FA308(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  os_log_type_t v31 = a3;
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v30 = a2;
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(a1 + v9, 1, v6);
  int v14 = v12((uint64_t)v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8((uint64_t)v10, (uint64_t)v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  uint64_t v16 = v31[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(v30 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v31[7];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = v30 + v21;
  __swift_destroy_boxed_opaque_existential_1(a1 + v21);
  long long v24 = *(_OWORD *)(v23 + 16);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *(_OWORD *)(v22 + 16) = v24;
  *(void *)(v22 + 32) = *(void *)(v23 + 32);
  uint64_t v25 = v31[8];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = v30 + v25;
  __swift_destroy_boxed_opaque_existential_1(a1 + v25);
  long long v28 = *(_OWORD *)(v27 + 16);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *(_OWORD *)(v26 + 16) = v28;
  *(void *)(v26 + 32) = *(void *)(v27 + 32);
  return a1;
}

uint64_t sub_2495FA538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2495FA54C);
}

uint64_t sub_2495FA54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_2495FA668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2495FA67C);
}

uint64_t sub_2495FA67C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24962BD40();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2495FA794()
{
  sub_24962BD40();
  if (v0 <= 0x3F)
  {
    sub_2495FA870();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2495FA870()
{
  if (!qword_2696C4BD8)
  {
    sub_24962BD40();
    unint64_t v0 = sub_24962C450();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2696C4BD8);
    }
  }
}

uint64_t sub_2495FA8C8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2495FA900()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2495FA914(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2495FA978(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v2 + 16);
  *(void *)(v3 + 16) = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = sub_2495F0868;
  *(_OWORD *)(v6 + 32) = v7;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  return MEMORY[0x270FA2498](sub_2495EE2FC, 0, 0);
}

uint64_t sub_2495FAA38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2495FAA80(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[3] = a2;
  v7[4] = v6;
  v7[1] = sub_2495F0868;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_2495EDB0C, 0, 0);
}

uint64_t sub_2495FAB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2495FAB98(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2495FABE0()
{
  uint64_t v1 = sub_24962BE40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v25 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (v25 + 56) & ~v25;
  uint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0) - 8);
  uint64_t v24 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v6 = (v4 + v24) & ~v24;
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v6 + v7 + v9) & ~v9;
  uint64_t v11 = *(void *)(v8 + 64);
  uint64_t v12 = sub_24962BD40();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v23 = v11;
  uint64_t v21 = (v10 + v11 + v22) & ~v22;
  uint64_t v14 = *(void *)(v13 + 64) + v9 + v21;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v0 + v6, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0 + v6, v12);
  }
  uint64_t v15 = v14 & ~v9;
  uint64_t v16 = v0 + v10;
  uint64_t v17 = sub_24962BEE0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  if (!v19(v16, 1, v17)) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  }
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0 + v21, v12);
  if (!v19(v0 + v15, 1, v17)) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v0 + v15, v17);
  }
  return MEMORY[0x270FA0238](v0, v15 + v23, v25 | v24 | v9 | v22 | 7);
}

uint64_t sub_2495FAF30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_24962BE40() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0) - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08) - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  unint64_t v13 = (v9 + v10 + v12) & ~v12;
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v15 = *(void *)(sub_24962BD40() - 8);
  unint64_t v16 = (v13 + v14 + *(unsigned __int8 *)(v15 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  return sub_2495F2BE8(a1, v2 + v6, v2 + v9, v2 + v13, v2 + v16, v2 + ((*(void *)(v15 + 64) + v12 + v16) & ~v12), a2);
}

uint64_t sub_2495FB108()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

ValueMetadata *type metadata accessor for FileTransferController.DefaultFactory()
{
  return &type metadata for FileTransferController.DefaultFactory;
}

uint64_t sub_2495FB16C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for HTTPAuthenticationScheme(uint64_t a1)
{
  return sub_2495FB194(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2495FB194(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s15CTLazuliSupport24HTTPAuthenticationSchemeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_2495FB16C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for HTTPAuthenticationScheme(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_2495FB16C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2495FB194(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HTTPAuthenticationScheme(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2495FB194(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPAuthenticationScheme(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPAuthenticationScheme(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2495FB338(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_2495FB350(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme()
{
  return &type metadata for HTTPAuthenticationScheme;
}

uint64_t sub_2495FB378()
{
  return 0;
}

uint64_t sub_2495FB384@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2495FB3B4()
{
  return 0;
}

void sub_2495FB3C0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2495FB3CC(uint64_t a1)
{
  unint64_t v2 = sub_2495FC3C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2495FB408(uint64_t a1)
{
  unint64_t v2 = sub_2495FC3C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2495FB444(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v32 = a3;
  int v33 = a4;
  uint64_t v31 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C90);
  uint64_t v29 = *(void *)(v5 - 8);
  uint64_t v30 = v5;
  MEMORY[0x270FA5388](v5, v6);
  long long v28 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C98);
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CA0);
  uint64_t v25 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CA8);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2495FC2CC();
  sub_24962C7A0();
  if (!(_BYTE)v33)
  {
    char v35 = 1;
    sub_2495FC374();
    sub_24962C680();
    uint64_t v21 = v27;
    sub_24962C690();
    uint64_t v22 = v26;
    goto LABEL_5;
  }
  if (v33 == 1)
  {
    char v36 = 2;
    sub_2495FC320();
    uint64_t v11 = v28;
    sub_24962C680();
    uint64_t v21 = v30;
    sub_24962C690();
    uint64_t v22 = v29;
LABEL_5:
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  }
  char v34 = 0;
  sub_2495FC3C8();
  sub_24962C680();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v16);
}

uint64_t sub_2495FB81C()
{
  return 0x6D6C616572;
}

uint64_t sub_2495FB834(uint64_t a1)
{
  unint64_t v2 = sub_2495FC320();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2495FB870(uint64_t a1)
{
  unint64_t v2 = sub_2495FC320();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2495FB8AC()
{
  uint64_t v1 = 0x747365676964;
  if (*v0 != 1) {
    uint64_t v1 = 0x61727473746F6F62;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6369736162;
  }
}

uint64_t sub_2495FB904@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2495FBB60(a1, a2);
  *a3 = result;
  return result;
}

void sub_2495FB92C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2495FB938(uint64_t a1)
{
  unint64_t v2 = sub_2495FC2CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2495FB974(uint64_t a1)
{
  unint64_t v2 = sub_2495FC2CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2495FB9B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6D6C616572 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24962C6C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2495FBA40(uint64_t a1)
{
  unint64_t v2 = sub_2495FC374();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2495FBA7C(uint64_t a1)
{
  unint64_t v2 = sub_2495FC374();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_2495FBAB8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2495FBCB4(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_2495FBAE8(void *a1)
{
  return sub_2495FB444(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_2495FBB08()
{
  uint64_t v1 = 0x61727473746F6F42;
  if (*(unsigned char *)(v0 + 16) != 1) {
    uint64_t v1 = 0x6369736142;
  }
  if (*(unsigned char *)(v0 + 16)) {
    return v1;
  }
  else {
    return 0x747365676944;
  }
}

uint64_t sub_2495FBB60(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6369736162 && a2 == 0xE500000000000000;
  if (v2 || (sub_24962C6C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747365676964 && a2 == 0xE600000000000000 || (sub_24962C6C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61727473746F6F62 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24962C6C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_2495FBCB4(void *a1)
{
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C48);
  uint64_t v34 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36, v2);
  uint64_t v38 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C50);
  uint64_t v35 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33, v4);
  char v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C58);
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C60);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v39 = a1;
  uint64_t v17 = __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_2495FC2CC();
  uint64_t v18 = v40;
  sub_24962C790();
  if (!v18)
  {
    uint64_t v32 = v7;
    uint64_t v20 = v37;
    uint64_t v19 = v38;
    uint64_t v40 = v12;
    uint64_t v21 = sub_24962C670();
    if (*(void *)(v21 + 16) == 1)
    {
      if (*(unsigned char *)(v21 + 32))
      {
        if (*(unsigned char *)(v21 + 32) == 1)
        {
          char v42 = 1;
          sub_2495FC374();
          sub_24962C640();
          uint64_t v22 = v33;
          uint64_t v23 = sub_24962C660();
          uint64_t v24 = v40;
          uint64_t v17 = (void *)v23;
          (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v22);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v11);
        }
        else
        {
          char v43 = 2;
          sub_2495FC320();
          sub_24962C640();
          uint64_t v29 = sub_24962C660();
          uint64_t v30 = v40;
          uint64_t v17 = (void *)v29;
          (*(void (**)(char *, uint64_t))(v34 + 8))(v19, v36);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v11);
        }
      }
      else
      {
        char v41 = 0;
        sub_2495FC3C8();
        sub_24962C640();
        (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v32);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v11);
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v25 = sub_24962C560();
      swift_allocError();
      uint64_t v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C70);
      void *v27 = &type metadata for HTTPAuthenticationScheme;
      uint64_t v17 = v15;
      sub_24962C650();
      sub_24962C550();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v25);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v11);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  return v17;
}

unint64_t sub_2495FC2CC()
{
  unint64_t result = qword_2696C4C68;
  if (!qword_2696C4C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4C68);
  }
  return result;
}

unint64_t sub_2495FC320()
{
  unint64_t result = qword_2696C4C78;
  if (!qword_2696C4C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4C78);
  }
  return result;
}

unint64_t sub_2495FC374()
{
  unint64_t result = qword_2696C4C80;
  if (!qword_2696C4C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4C80);
  }
  return result;
}

unint64_t sub_2495FC3C8()
{
  unint64_t result = qword_2696C4C88;
  if (!qword_2696C4C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4C88);
  }
  return result;
}

uint64_t sub_2495FC41C(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v7 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (a1 == a5 && a2 == a6 && !(a3 >> 16) && v7 == a4 >> 16) {
    return 1;
  }
  else {
    return sub_24962C6A0() & 1;
  }
}

uint64_t sub_2495FC488(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CB0);
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v52 = v2;
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v50 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CB8);
  MEMORY[0x270FA5388](v5 - 8, v6);
  os_log_type_t v53 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CC0);
  uint64_t v54 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  unint64_t v48 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CC8);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CD0);
  MEMORY[0x270FA5388](v16 - 8, v17);
  uint64_t v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CD8);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20, v22);
  uint64_t v55 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (void *)sub_24962C0C0();
  id v25 = objc_msgSend(a1, sel_valueForHTTPHeaderField_, v24);

  if (v25)
  {
    uint64_t v47 = v8;
    id v49 = a1;
    uint64_t v26 = sub_24962C0F0();
    unint64_t v28 = v27;

    unint64_t v60 = v26;
    unint64_t v61 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CE0);
    sub_24962BE70();
    sub_2495FCBE4();
    sub_2495FCC80(&qword_2696C4CF0, &qword_2696C4CC8);
    sub_24962C0A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
    {
      swift_bridgeObjectRelease();

      sub_2495F73C0((uint64_t)v19, &qword_2696C4CD0);
      return 0;
    }
    uint64_t v30 = v55;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v55, v19, v20);
    unint64_t v60 = v26;
    unint64_t v61 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CF8);
    uint64_t v31 = v50;
    sub_24962BE70();
    sub_2495FCC80(&qword_2696C4D00, &qword_2696C4CB0);
    uint64_t v32 = (uint64_t)v53;
    uint64_t v33 = v52;
    sub_24962C080();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v33);
    swift_bridgeObjectRelease();
    uint64_t v34 = v54;
    uint64_t v35 = v47;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v32, 1, v47) == 1)
    {

      (*(void (**)(char *, uint64_t))(v21 + 8))(v30, v20);
      sub_2495F73C0(v32, &qword_2696C4CB8);
      return 0;
    }
    uint64_t v52 = v21;
    uint64_t v36 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v48, v32, v35);
    swift_getKeyPath();
    sub_24962BE80();
    swift_release();
    unint64_t v37 = v60;
    unint64_t v38 = v61;
    uint64_t v39 = v30;
    uint64_t v41 = v62;
    uint64_t v40 = v63;
    char v42 = sub_2495FC41C(0x6369736142, 0xE500000000000000, v60, v61, v62, v63);
    id v43 = v49;
    if (v42)
    {

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v35);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v20);
      return 0;
    }
    else
    {
      char v44 = sub_2495FC41C(0x747365676944, 0xE600000000000000, v37, v38, v41, v40);
      swift_bridgeObjectRelease();
      if ((v44 & 1) == 0)
      {

        (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v35);
        (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v20);
        return 0;
      }
      swift_getKeyPath();
      sub_24962BE80();
      swift_release();
      uint64_t v29 = MEMORY[0x24C5A43B0](v56, v57, v58, v59);
      swift_bridgeObjectRelease();
      sub_24962C220();

      (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v35);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v20);
    }
  }
  else
  {

    return 0;
  }
  return v29;
}

unint64_t sub_2495FCBE4()
{
  unint64_t result = qword_2696C4CE8;
  if (!qword_2696C4CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4CE8);
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

uint64_t sub_2495FCC80(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2495FCCD0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_protectionSpace);
  id v3 = objc_msgSend(v2, sel_authenticationMethod);
  uint64_t v4 = sub_24962C0F0();
  uint64_t v6 = v5;

  if (sub_24962C0F0() == v4 && v7 == v6)
  {

    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  char v9 = sub_24962C6C0();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    if (sub_24962C0F0() == v4 && v12 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v14 = sub_24962C6C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        goto LABEL_19;
      }
    }
    id v15 = objc_msgSend(v2, sel_realm);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v10 = sub_24962C0F0();

      sub_24962C220();
      return v10;
    }
LABEL_19:

    return 0;
  }

LABEL_8:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t getEnumTagSinglePayload for HTTPAuthenticationScheme.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HTTPAuthenticationScheme.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x2495FCFECLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.CodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.CodingKeys;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.BasicCodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.BasicCodingKeys;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.DigestCodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.DigestCodingKeys;
}

unsigned char *_s15CTLazuliSupport24HTTPAuthenticationSchemeO16DigestCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2495FD0E8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.BootstrapCodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.BootstrapCodingKeys;
}

unint64_t sub_2495FD124()
{
  unint64_t result = qword_2696C4D08;
  if (!qword_2696C4D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D08);
  }
  return result;
}

unint64_t sub_2495FD17C()
{
  unint64_t result = qword_2696C4D10;
  if (!qword_2696C4D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D10);
  }
  return result;
}

unint64_t sub_2495FD1D4()
{
  unint64_t result = qword_2696C4D18;
  if (!qword_2696C4D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D18);
  }
  return result;
}

unint64_t sub_2495FD22C()
{
  unint64_t result = qword_2696C4D20;
  if (!qword_2696C4D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D20);
  }
  return result;
}

unint64_t sub_2495FD284()
{
  unint64_t result = qword_2696C4D28;
  if (!qword_2696C4D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D28);
  }
  return result;
}

unint64_t sub_2495FD2DC()
{
  unint64_t result = qword_2696C4D30;
  if (!qword_2696C4D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D30);
  }
  return result;
}

unint64_t sub_2495FD334()
{
  unint64_t result = qword_2696C4D38;
  if (!qword_2696C4D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D38);
  }
  return result;
}

unint64_t sub_2495FD38C()
{
  unint64_t result = qword_2696C4D40;
  if (!qword_2696C4D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D40);
  }
  return result;
}

unint64_t sub_2495FD3E4()
{
  unint64_t result = qword_2696C4D48;
  if (!qword_2696C4D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D48);
  }
  return result;
}

unint64_t sub_2495FD43C()
{
  unint64_t result = qword_2696C4D50;
  if (!qword_2696C4D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D50);
  }
  return result;
}

unint64_t sub_2495FD494()
{
  unint64_t result = qword_2696C4D58;
  if (!qword_2696C4D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D58);
  }
  return result;
}

unint64_t sub_2495FD4EC()
{
  sub_24962C520();
  swift_bridgeObjectRelease();
  unint64_t v12 = 0xD000000000000011;
  unint64_t v13 = 0x800000024962D560;
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  strcpy((char *)v11, ", realm=\"");
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v11, ", uri=\"");
  v11[1] = 0xE700000000000000;
  __swift_project_boxed_opaque_existential_1(v0 + 13, v0[16]);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  MEMORY[0x270FA5388](v1 - 8, v2);
  unsigned int v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24962BB50();
  uint64_t v5 = sub_24962BD40();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    __break(1u);
    JUMPOUT(0x2495FDA7CLL);
  }
  sub_249603EE8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v11, ", response=\"");
  BYTE5(v11[1]) = 0;
  HIWORD(v11[1]) = -5120;
  sub_2495FDA8C();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v11, ", algorithm=");
  BYTE5(v11[1]) = 0;
  HIWORD(v11[1]) = -5120;
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  v11[0] = 0x3D636E202CLL;
  v11[1] = 0xE500000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D60);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_249630430;
  uint64_t v8 = v0[18];
  uint64_t v9 = MEMORY[0x263F8D750];
  *(void *)(v7 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v7 + 64) = v9;
  *(void *)(v7 + 32) = v8;
  sub_24962C110();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v11, ", nonce=\"");
  WORD1(v11[1]) = 0;
  HIDWORD(v11[1]) = -385875968;
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v11, ", cnonce=\"");
  BYTE3(v11[1]) = 0;
  HIDWORD(v11[1]) = -369098752;
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v11, ", opaque=\"");
  BYTE3(v11[1]) = 0;
  HIDWORD(v11[1]) = -369098752;
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  v11[0] = 0x3D706F71202CLL;
  v11[1] = 0xE600000000000000;
  if (!*(void *)(v0[5] + 16))
  {
    __break(1u);
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2495FDA8C()
{
  unint64_t v1 = sub_2495FDD20();
  unint64_t v3 = v2;
  sub_2495FDF08();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D60);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_249630430;
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = MEMORY[0x263F8D750];
  *(void *)(v4 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 32) = v5;
  sub_24962C110();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(*(void *)(v0 + 40) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24962C1B0();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_249604354(v1, v3);
    unint64_t v10 = v9;
    uint64_t v11 = sub_2495FDE20(v8, v9);
    sub_2495F7470(v8, v10);
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2495FDD20()
{
  unint64_t v6 = v0[9];
  unint64_t v8 = v0[10];
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  uint64_t v7 = sub_249604354(v6, v8);
  unint64_t v9 = v1;
  uint64_t v2 = v0[11];
  unint64_t v3 = v0[12];
  sub_2495F7E7C(v2, v3);
  sub_24960B338(v2, v3);
  sub_2495F7470(v2, v3);
  sub_2495F7E7C(v7, v9);
  uint64_t v4 = sub_2495FDE20(v7, v9);
  sub_2495F7470(v7, v9);
  sub_2495F7470(v7, v9);
  return v4;
}

uint64_t sub_2495FDE20(uint64_t a1, unint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(v2 + 32);
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      uint64_t v4 = sub_249618970(a1, a2);
    }
    else
    {
      uint64_t v6 = sub_249618E0C(a1, a2);
      sub_2495FE0E0(32, v6, v7, v12);
      uint64_t v4 = sub_249604884(v12[0], v12[1]);
    }
  }
  else
  {
    uint64_t v4 = sub_2496192A8(a1, a2);
  }
  uint64_t v8 = v4;
  unint64_t v9 = v5;
  v12[0] = sub_249603FAC(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D68);
  sub_2495FE3E8();
  uint64_t v10 = sub_24962C0B0();
  swift_bridgeObjectRelease();
  sub_2495F7470(v8, v9);
  return v10;
}

uint64_t sub_2495FDF08()
{
  unint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 104), *(void *)(v0 + 128));
  sub_24962BAD0();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 104), *(void *)(v0 + 128));
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  MEMORY[0x270FA5388](v1 - 8, v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24962BB50();
  uint64_t v5 = sub_24962BD40();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_249603EE8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_249604354(v12, v13);
    unint64_t v10 = v9;
    uint64_t v11 = sub_2495FDE20(v8, v9);
    sub_2495F7470(v8, v10);
    return v11;
  }
  return result;
}

uint64_t sub_2495FE0E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if (a1 < 0)
  {
LABEL_14:
    __break(1u);
    JUMPOUT(0x2495FE250);
  }
  unint64_t v5 = a3 >> 62;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = a2 >> 32;
      uint64_t v8 = (int)a2;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v8 = 0;
      uint64_t v9 = BYTE6(a3);
      break;
  }
  uint64_t v10 = -a1;
  uint64_t v11 = sub_2495FE2FC(v9, v8, a2, a3);
  if (v11 > 0 || v11 <= v10)
  {
    uint64_t v12 = sub_2495FE280(v9, v10, a2, a3);
    uint64_t v13 = 0;
    switch((int)v5)
    {
      case 1:
        uint64_t v13 = (int)a2;
        break;
      case 2:
        uint64_t v13 = *(void *)(a2 + 16);
        break;
      default:
        break;
    }
    if (v12 < v13)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  uint64_t v14 = sub_24962BDA0();
  uint64_t v16 = v15;
  uint64_t result = sub_2495F7470(a2, a3);
  *a4 = v14;
  a4[1] = v16;
  return result;
}

uint64_t sub_2495FE280(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < result || result < v7)
  {
LABEL_10:
    __break(1u);
    JUMPOUT(0x2495FE2ECLL);
  }
  return result;
}

uint64_t sub_2495FE2FC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)a3;
      uint64_t v4 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a3 + 16);
      uint64_t v4 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = 0;
      uint64_t v4 = BYTE6(a4);
      break;
  }
  if (v4 < a1 || v5 > a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < a2 || v7 > a2) {
    goto LABEL_16;
  }
  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t result = a2 - a1;
  if (v8)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x2495FE3C8);
  }
  return result;
}

unint64_t sub_2495FE3E8()
{
  unint64_t result = qword_2696C4D70;
  if (!qword_2696C4D70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696C4D68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D70);
  }
  return result;
}

uint64_t destroy for HTTPDigestAuthenticateResponse(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2495F7470(*(void *)(a1 + 88), *(void *)(a1 + 96));
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTTPDigestAuthenticateResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  unint64_t v9 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2495F7E7C(v8, v9);
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  long long v10 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 104, a2 + 104);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTTPDigestAuthenticateResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 88);
  unint64_t v5 = *(void *)(a2 + 96);
  sub_2495F7E7C(v4, v5);
  uint64_t v6 = *(void *)(a1 + 88);
  unint64_t v7 = *(void *)(a1 + 96);
  *(void *)(a1 + 88) = v4;
  *(void *)(a1 + 96) = v5;
  sub_2495F7470(v6, v7);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy168_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[9];
  *(void *)(a1 + 160) = *((void *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for HTTPDigestAuthenticateResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a1 + 88);
  unint64_t v9 = *(void *)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  sub_2495F7470(v8, v9);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPDigestAuthenticateResponse(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 168)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPDigestAuthenticateResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
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
      *(unsigned char *)(result + 168) = 1;
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
    *(unsigned char *)(result + 168) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPDigestAuthenticateResponse()
{
  return &type metadata for HTTPDigestAuthenticateResponse;
}

BOOL static SubscriptionID.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SubscriptionID.hash(into:)()
{
  return sub_24962C770();
}

BOOL sub_2495FE8FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2495FE91C()
{
  if (*v0) {
    return 7305076;
  }
  else {
    return 6647407;
  }
}

uint64_t sub_2495FE940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2495FF924(a1, a2);
  *a3 = result;
  return result;
}

void sub_2495FE968(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2495FE974(uint64_t a1)
{
  unint64_t v2 = sub_2495FED80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2495FE9B0(uint64_t a1)
{
  unint64_t v2 = sub_2495FED80();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2495FE9EC(uint64_t a1)
{
  unint64_t v2 = sub_2495FEE28();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2495FEA28(uint64_t a1)
{
  unint64_t v2 = sub_2495FEE28();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2495FEA64(uint64_t a1)
{
  unint64_t v2 = sub_2495FEDD4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2495FEAA0(uint64_t a1)
{
  unint64_t v2 = sub_2495FEDD4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SubscriptionID.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D78);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v21 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D80);
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v20 = v6;
  MEMORY[0x270FA5388](v6, v7);
  unint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D88);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v15 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2495FED80();
  sub_24962C7A0();
  uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v11 + 8);
  if (v15)
  {
    char v25 = 1;
    sub_2495FEDD4();
    uint64_t v17 = v21;
    sub_24962C680();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v23);
  }
  else
  {
    char v24 = 0;
    sub_2495FEE28();
    sub_24962C680();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v20);
  }
  return (*v16)(v14, v10);
}

unint64_t sub_2495FED80()
{
  unint64_t result = qword_2696C4D90;
  if (!qword_2696C4D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D90);
  }
  return result;
}

unint64_t sub_2495FEDD4()
{
  unint64_t result = qword_2696C4D98;
  if (!qword_2696C4D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4D98);
  }
  return result;
}

unint64_t sub_2495FEE28()
{
  unint64_t result = qword_2696C4DA0;
  if (!qword_2696C4DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DA0);
  }
  return result;
}

uint64_t SubscriptionID.hashValue.getter()
{
  return sub_24962C780();
}

uint64_t SubscriptionID.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4DA8);
  uint64_t v33 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30, v3);
  uint64_t v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4DB0);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v7);
  unint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4DB8);
  uint64_t v32 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2495FED80();
  uint64_t v14 = v35;
  sub_24962C790();
  if (v14) {
    goto LABEL_6;
  }
  uint64_t v35 = a1;
  uint64_t v16 = v33;
  char v15 = v34;
  uint64_t v17 = v13;
  uint64_t v18 = sub_24962C670();
  if (*(void *)(v18 + 16) != 1)
  {
    uint64_t v23 = sub_24962C560();
    swift_allocError();
    char v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C70);
    void *v25 = &type metadata for SubscriptionID;
    sub_24962C650();
    sub_24962C550();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v10);
    a1 = v35;
LABEL_6:
    uint64_t v26 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v26);
  }
  v29[1] = v18;
  char v19 = *(unsigned char *)(v18 + 32);
  if (v19)
  {
    char v20 = *(unsigned char *)(v18 + 32);
    char v37 = 1;
    sub_2495FEDD4();
    uint64_t v21 = v17;
    sub_24962C640();
    uint64_t v22 = v32;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v30);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v10);
    char v19 = v20;
  }
  else
  {
    char v36 = 0;
    sub_2495FEE28();
    sub_24962C640();
    uint64_t v28 = v32;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v10);
  }
  *char v15 = v19;
  uint64_t v26 = (uint64_t)v35;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_2495FF31C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SubscriptionID.init(from:)(a1, a2);
}

uint64_t sub_2495FF334(void *a1)
{
  return SubscriptionID.encode(to:)(a1);
}

uint64_t SubscriptionID.init(ctSubscriptionSlot:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  if (result == 2) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (result == 1) {
    char v2 = 0;
  }
  *a2 = v2;
  return result;
}

void SubscriptionID.init(ctServiceDescriptor:)(void *a1@<X0>, char *a2@<X8>)
{
  if (objc_msgSend(a1, sel_domain) == (id)1)
  {
    id v4 = objc_msgSend(a1, sel_instance);
    id v5 = objc_msgSend(v4, sel_integerValue);

    if (v5 == (id)2) {
      char v6 = 1;
    }
    else {
      char v6 = 2;
    }
    if (v5 == (id)1) {
      char v6 = 0;
    }
  }
  else
  {

    char v6 = 2;
  }
  *a2 = v6;
}

void SubscriptionID.init(ctSubscriptionContext:)(void *a1@<X0>, char *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_slotID);

  if (v4 == (id)2)
  {
    char v5 = 1;
  }
  else if (v4 == (id)1)
  {
    char v5 = 0;
  }
  else
  {
    char v5 = 2;
  }
  *a2 = v5;
}

uint64_t SubscriptionID.description.getter()
{
  if (*v0) {
    return 7305076;
  }
  else {
    return 6647407;
  }
}

unint64_t sub_2495FF490()
{
  unint64_t result = qword_2696C4DC0;
  if (!qword_2696C4DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionID()
{
  return &type metadata for SubscriptionID;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s15CTLazuliSupport14SubscriptionIDOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2495FF658);
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

unsigned char *sub_2495FF680(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionID.CodingKeys()
{
  return &type metadata for SubscriptionID.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionID.OneCodingKeys()
{
  return &type metadata for SubscriptionID.OneCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionID.TwoCodingKeys()
{
  return &type metadata for SubscriptionID.TwoCodingKeys;
}

unint64_t sub_2495FF6C0()
{
  unint64_t result = qword_2696C4DC8;
  if (!qword_2696C4DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DC8);
  }
  return result;
}

unint64_t sub_2495FF718()
{
  unint64_t result = qword_2696C4DD0;
  if (!qword_2696C4DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DD0);
  }
  return result;
}

unint64_t sub_2495FF770()
{
  unint64_t result = qword_2696C4DD8;
  if (!qword_2696C4DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DD8);
  }
  return result;
}

unint64_t sub_2495FF7C8()
{
  unint64_t result = qword_2696C4DE0;
  if (!qword_2696C4DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DE0);
  }
  return result;
}

unint64_t sub_2495FF820()
{
  unint64_t result = qword_2696C4DE8;
  if (!qword_2696C4DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DE8);
  }
  return result;
}

unint64_t sub_2495FF878()
{
  unint64_t result = qword_2696C4DF0;
  if (!qword_2696C4DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DF0);
  }
  return result;
}

unint64_t sub_2495FF8D0()
{
  unint64_t result = qword_2696C4DF8;
  if (!qword_2696C4DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4DF8);
  }
  return result;
}

uint64_t sub_2495FF924(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6647407 && a2 == 0xE300000000000000;
  if (v2 || (sub_24962C6C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7305076 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24962C6C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2495FFA08(unsigned char *a1)
{
  *(void *)(v2 + 152) = v1;
  *(unsigned char *)(v2 + 172) = *a1;
  return MEMORY[0x270FA2498](sub_2495FFAA0, 0, 0);
}

uint64_t sub_2495FFAA0()
{
  uint64_t v1 = (void *)v0[19];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_2495FFBC8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_249600410;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_getSubscriptionInfo_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2495FFBC8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_249600300;
  }
  else {
    uint64_t v2 = sub_2495FFD04;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2495FFD04()
{
  uint64_t v38 = v0;
  v37[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 120);
  id v2 = objc_msgSend(v1, sel_subscriptions);
  if (!v2)
  {
LABEL_29:
    if (qword_2696C49C0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24962BF40();
    __swift_project_value_buffer(v26, (uint64_t)qword_2696C4E00);
    unint64_t v27 = sub_24962BF20();
    os_log_type_t v28 = sub_24962C400();
    if (os_log_type_enabled(v27, v28))
    {
      int v29 = *(unsigned __int8 *)(v0 + 172);
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315138;
      v37[0] = v31;
      if (v29) {
        uint64_t v32 = 7305076;
      }
      else {
        uint64_t v32 = 6647407;
      }
      *(void *)(v0 + 136) = sub_2495F74C8(v32, 0xE300000000000000, v37);
      sub_24962C490();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2495EB000, v27, v28, "Failed to fetch subscription: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v31, -1, -1);
      MEMORY[0x24C5A5090](v30, -1, -1);
    }

    uint64_t v33 = sub_24962BAC0();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = swift_task_alloc();
    *(_DWORD *)(v0 + 168) = 22;
    sub_2496004D0(MEMORY[0x263F8EE78]);
    sub_2496007BC();
    sub_24962BC60();
    sub_24962BAB0();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
    swift_willThrow();

    swift_task_dealloc();
LABEL_37:
    char v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  int v3 = v2;
  sub_249600808();
  unint64_t v4 = sub_24962C2A0();

  if (v4 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24962C5D0();
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v5)
  {
LABEL_28:
    swift_bridgeObjectRelease_n();
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x24C5A47A0](v6, v4);
    }
    else {
      id v7 = *(id *)(v4 + 8 * v6 + 32);
    }
    int v8 = v7;
    uint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    id v10 = objc_msgSend(v7, sel_slotID);
    if (v10 != (id)2) {
      break;
    }
    if (*(unsigned char *)(v0 + 172)) {
      goto LABEL_14;
    }
LABEL_6:

    ++v6;
    if (v9 == v5) {
      goto LABEL_28;
    }
  }
  if (v10 != (id)1 || (*(unsigned char *)(v0 + 172) & 1) != 0) {
    goto LABEL_6;
  }
LABEL_14:
  swift_bridgeObjectRelease_n();
  if (qword_2696C49C0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24962BF40();
  __swift_project_value_buffer(v11, (uint64_t)qword_2696C4E00);
  uint64_t v12 = sub_24962BF20();
  os_log_type_t v13 = sub_24962C3E0();
  if (os_log_type_enabled(v12, v13))
  {
    int v14 = *(unsigned __int8 *)(v0 + 172);
    char v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)char v15 = 136315138;
    v37[0] = v16;
    if (v14) {
      uint64_t v17 = 7305076;
    }
    else {
      uint64_t v17 = 6647407;
    }
    *(void *)(v0 + 128) = sub_2495F74C8(v17, 0xE300000000000000, v37);
    sub_24962C490();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2495EB000, v12, v13, "Fetching system configuration for subscription %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v16, -1, -1);
    MEMORY[0x24C5A5090](v15, -1, -1);
  }

  uint64_t v18 = *(void **)(v0 + 152);
  *(void *)(v0 + 144) = 0;
  id v19 = objc_msgSend(v18, sel_getSystemConfiguration_withError_, v8, v0 + 144);
  char v20 = *(void **)(v0 + 144);
  if (!v19)
  {
    id v25 = v20;
    sub_24962BC80();

    swift_willThrow();
    goto LABEL_37;
  }
  id v21 = v19;
  id v22 = v20;

  uint64_t v23 = *(uint64_t (**)(id))(v0 + 8);
  return v23(v21);
}

uint64_t sub_249600300()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249600398()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C4E00);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696C4E00);
  return sub_24962BF30();
}

uint64_t sub_249600410(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2696C4E40);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

unint64_t sub_2496004D0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4E30);
  uint64_t v2 = sub_24962C600();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_249600848(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2496005FC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2496008B0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_2496005FC(uint64_t a1, uint64_t a2)
{
  sub_24962C760();
  sub_24962C170();
  uint64_t v4 = sub_24962C780();
  return sub_249600674(a1, a2, v4);
}

unint64_t sub_249600674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_24962C6C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_24962C6C0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_24962C6C0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_2496007BC()
{
  unint64_t result = qword_2696C4E20;
  if (!qword_2696C4E20)
  {
    sub_24962BAC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C4E20);
  }
  return result;
}

unint64_t sub_249600808()
{
  unint64_t result = qword_2696C4E28;
  if (!qword_2696C4E28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696C4E28);
  }
  return result;
}

uint64_t sub_249600848(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4E38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2496008B0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2496008C0()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C4E50);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696C4E50);
  return sub_24962BF30();
}

uint64_t sub_249600AD8(void *a1, void *a2, void *a3, void *aBlock, void *a5)
{
  v5[4] = a3;
  v5[5] = a5;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = _Block_copy(aBlock);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2696C4F00 + dword_2696C4F00);
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  a5;
  BOOL v13 = (void *)swift_task_alloc();
  v5[7] = v13;
  *BOOL v13 = v5;
  v13[1] = sub_249600BD4;
  return v15((uint64_t)v11, (uint64_t)v12);
}

uint64_t sub_249600BD4(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void (***)(void, void, void))(*v2 + 48);
  uint64_t v6 = *(void **)(*v2 + 40);
  uint64_t v7 = *(void **)(*v2 + 32);
  uint64_t v8 = *(void **)(*v2 + 24);
  uint64_t v9 = *(void **)(*v2 + 16);
  uint64_t v12 = *v2;
  swift_task_dealloc();

  ((void (**)(void, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  id v10 = *(uint64_t (**)(void))(v12 + 8);
  return v10();
}

id sub_249600DB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthTaskDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AuthTaskDelegate()
{
  return self;
}

uint64_t sub_249600E1C()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_249600E74()
{
  objc_super v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_2495EFD7C;
  uint64_t v8 = (uint64_t (*)(void *, void *, void *, void *, void *))((char *)&dword_2696C4EE0 + dword_2696C4EE0);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_249600F40()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2495F0868;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2696C51D0 + dword_2696C51D0);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_249601044(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2495F0868;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2696C51E0 + dword_2696C51E0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_249601110(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return MEMORY[0x270FA2498](sub_249601134, 0, 0);
}

uint64_t sub_249601134()
{
  uint64_t v1 = sub_2495FCCD0(*(id *)(v0 + 40));
  *(unsigned char *)(v0 + 96) = v3;
  if ((_BYTE)v3 == 0xFF)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, void))(v0 + 8);
    return v12(1, 0);
  }
  else
  {
    uint64_t v4 = v1;
    uint64_t v5 = v2;
    uint64_t v6 = v3;
    uint64_t v7 = *(void *)(v0 + 48);
    *(void *)(v0 + 56) = v2;
    *(void *)(v0 + 64) = v1;
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7
                                                                                          + OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler)
                                                                              + **(int **)(v7
                                                                                         + OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler));
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_249601298;
    uint64_t v10 = *(void *)(v0 + 32);
    uint64_t v9 = *(void *)(v0 + 40);
    return v13(v10, v4, v5, v6, v9);
  }
}

uint64_t sub_249601298(uint64_t a1)
{
  uint64_t v3 = *(void *)(*v2 + 64);
  uint64_t v4 = *(void *)(*v2 + 56);
  unsigned __int8 v5 = *(unsigned char *)(*v2 + 96);
  uint64_t v8 = *v2;
  *(void *)(v8 + 80) = a1;
  *(void *)(v8 + 88) = v1;
  swift_task_dealloc();
  sub_2496017F0(v3, v4, v5);
  if (v1) {
    uint64_t v6 = sub_2496015E4;
  }
  else {
    uint64_t v6 = sub_2496013F4;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2496013F4()
{
  uint64_t v1 = (void *)v0[10];
  if (v1)
  {
    if (qword_2696C49C8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_24962BF40();
    __swift_project_value_buffer(v2, (uint64_t)qword_2696C4E50);
    id v3 = v1;
    uint64_t v4 = sub_24962BF20();
    os_log_type_t v5 = sub_24962C3E0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v13 = v0[10];
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 138412290;
      v0[3] = v3;
      id v8 = v3;
      sub_24962C490();
      void *v7 = v13;

      _os_log_impl(&dword_2495EB000, v4, v5, "Using credential: %@", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v7, -1, -1);
      MEMORY[0x24C5A5090](v6, -1, -1);
    }
    else
    {
    }
    uint64_t v10 = 0;
    uint64_t v9 = v0[10];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 2;
  }
  id v11 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v11(v10, v9);
}

uint64_t sub_2496015E4()
{
  if (qword_2696C49C8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = sub_24962BF40();
  __swift_project_value_buffer(v2, (uint64_t)qword_2696C4E50);
  id v3 = v1;
  id v4 = v1;
  os_log_type_t v5 = sub_24962BF20();
  os_log_type_t v6 = sub_24962C400();
  BOOL v7 = os_log_type_enabled(v5, v6);
  id v8 = (void *)v0[11];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v12;
    sub_24962C490();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_2495EB000, v5, v6, "Failed to perform authentication: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v10, -1, -1);
    MEMORY[0x24C5A5090](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(uint64_t, void))v0[1];
  return v13(2, 0);
}

uint64_t sub_2496017F0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_2495FB194(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_249601804(uint64_t a1, uint64_t a2)
{
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_2495ECC6C;
  return MEMORY[0x270EF1EA8](a1, a2);
}

id sub_2496018B0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)sub_24962BB10();
  id v3 = objc_msgSend(v1, sel_downloadTaskWithRequest_, v2);

  return v3;
}

uint64_t sub_249601904(unsigned int a1)
{
  char v1 = a1;
  unsigned int v2 = a1 >> 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C28);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_249630870;
  *(unsigned char *)(v3 + 32) = v2;
  *(unsigned char *)(v3 + 33) = v1;
  uint64_t v4 = sub_24960B824(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t FileDownloadResult.output.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249601988(v1, a1);
}

uint64_t sub_249601988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FileDownloadResult.Output(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for FileDownloadResult.Output(uint64_t a1)
{
  return sub_2495F92A8(a1, (uint64_t *)&unk_2696C4FF0);
}

uint64_t FileDownloadResult.suggestedFileName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for FileDownloadResult(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for FileDownloadResult(uint64_t a1)
{
  return sub_2495F92A8(a1, (uint64_t *)&unk_2696C4FD8);
}

uint64_t FileDownloadResult.utType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FileDownloadResult(0) + 24);
  return sub_249601AB0(v3, a1);
}

uint64_t sub_249601AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FileDownloadResult.outputFileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for FileDownloadResult.Output(0);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249601988(v2, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_24962BD40();
    uint64_t v9 = *(void *)(v8 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
  }
  else
  {
    sub_249601C8C((uint64_t)v7);
    uint64_t v11 = sub_24962BD40();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a1, 1, 1, v11);
  }
}

uint64_t sub_249601C8C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FileDownloadResult.Output(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t FileDownloadResult.outputData.getter()
{
  uint64_t v1 = type metadata accessor for FileDownloadResult.Output(0);
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249601988(v0, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return *(void *)v4;
  }
  sub_249601C8C((uint64_t)v4);
  return 0;
}

uint64_t FileDownloadResult.fileData.getter()
{
  uint64_t v1 = type metadata accessor for FileDownloadResult.Output(0);
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249601988(v0, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return *(void *)v4;
  }
  sub_249601C8C((uint64_t)v4);
  return 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for FileDownloadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    type metadata accessor for FileDownloadResult.Output(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24962BD40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      uint64_t v9 = *a2;
      unint64_t v10 = a2[1];
      sub_2495F7E7C(*a2, v10);
      *a1 = v9;
      a1[1] = v10;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (char *)a1 + v12;
    long long v17 = (char *)a2 + v12;
    uint64_t v18 = sub_24962BEE0();
    uint64_t v19 = *(void *)(v18 - 8);
    char v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    swift_bridgeObjectRetain();
    if (v20(v17, 1, v18))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
      memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t destroy for FileDownloadResult(uint64_t a1, uint64_t a2)
{
  type metadata accessor for FileDownloadResult.Output(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24962BD40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    sub_2495F7470(*(void *)a1, *(void *)(a1 + 8));
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_24962BEE0();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t *initializeWithCopy for FileDownloadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  type metadata accessor for FileDownloadResult.Output(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24962BD40();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_2495F7E7C(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (uint64_t *)((char *)a1 + v9);
  uint64_t v12 = (uint64_t *)((char *)a2 + v9);
  uint64_t v13 = v12[1];
  void *v11 = *v12;
  v11[1] = v13;
  uint64_t v14 = (char *)a1 + v10;
  uint64_t v15 = (char *)a2 + v10;
  uint64_t v16 = sub_24962BEE0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  if (v18(v15, 1, v16))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t *assignWithCopy for FileDownloadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_249601C8C((uint64_t)a1);
    type metadata accessor for FileDownloadResult.Output(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24962BD40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v7 = *a2;
      unint64_t v8 = a2[1];
      sub_2495F7E7C(*a2, v8);
      *a1 = v7;
      a1[1] = v8;
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (uint64_t *)((char *)a1 + v9);
  uint64_t v11 = (uint64_t *)((char *)a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_24962BEE0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_11;
  }
  if (v19)
  {
LABEL_11:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

char *initializeWithTake for FileDownloadResult(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for FileDownloadResult.Output(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24962BD40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_24962BEE0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

char *assignWithTake for FileDownloadResult(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_249601C8C((uint64_t)a1);
    uint64_t v6 = type metadata accessor for FileDownloadResult.Output(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24962BD40();
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
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_24962BEE0();
  uint64_t v17 = *(void *)(v16 - 8);
  int v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (!v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_10;
  }
  if (v20)
  {
LABEL_10:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDownloadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249602988);
}

uint64_t sub_249602988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for FileDownloadResult.Output(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
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
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 24);
    return v13(v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for FileDownloadResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249602ADC);
}

uint64_t sub_249602ADC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for FileDownloadResult.Output(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_249602C10()
{
  type metadata accessor for FileDownloadResult.Output(319);
  if (v0 <= 0x3F)
  {
    sub_249602CE0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_249602CE0()
{
  if (!qword_2696C4FE8)
  {
    sub_24962BEE0();
    unint64_t v0 = sub_24962C450();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2696C4FE8);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for FileDownloadResult.Output(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24962BD40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v9 = *a2;
      unint64_t v8 = a2[1];
      sub_2495F7E7C(v9, v8);
      *a1 = v9;
      a1[1] = v8;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for FileDownloadResult.Output(uint64_t *a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24962BD40();
    uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    uint64_t v5 = *a1;
    unint64_t v6 = a1[1];
    return sub_2495F7470(v5, v6);
  }
}

uint64_t *initializeWithCopy for FileDownloadResult.Output(uint64_t *a1, uint64_t *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24962BD40();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    uint64_t v6 = *a2;
    unint64_t v5 = a2[1];
    sub_2495F7E7C(v6, v5);
    *a1 = v6;
    a1[1] = v5;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for FileDownloadResult.Output(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    sub_249601C8C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_24962BD40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      uint64_t v6 = *a2;
      unint64_t v5 = a2[1];
      sub_2495F7E7C(v6, v5);
      *a1 = v6;
      a1[1] = v5;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for FileDownloadResult.Output(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24962BD40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for FileDownloadResult.Output(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_249601C8C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24962BD40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDownloadResult.Output(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for FileDownloadResult.Output(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_249603224()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_249603234()
{
  uint64_t result = sub_24962BD40();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void sub_2496032C8()
{
  unint64_t v1 = (void *)sub_24962C0C0();
  id v2 = objc_msgSend(v0, sel_valueForHTTPHeaderField_, v1);

  if (v2)
  {
    uint64_t v3 = sub_24962C0F0();
    unint64_t v5 = v4;

    uint64_t v6 = HIBYTE(v5) & 0xF;
    uint64_t v7 = v3 & 0xFFFFFFFFFFFFLL;
    if ((v5 & 0x2000000000000000) != 0) {
      uint64_t v8 = HIBYTE(v5) & 0xF;
    }
    else {
      uint64_t v8 = v3 & 0xFFFFFFFFFFFFLL;
    }
    if (v8)
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        sub_249603698(v3, v5, 10);
LABEL_44:
        swift_bridgeObjectRelease();
        return;
      }
      if ((v5 & 0x2000000000000000) == 0)
      {
        if ((v3 & 0x1000000000000000) != 0) {
          uint64_t v9 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          uint64_t v9 = (unsigned __int8 *)sub_24962C570();
        }
        sub_249603780(v9, v7, 10);
        goto LABEL_44;
      }
      v25[0] = v3;
      v25[1] = v5 & 0xFFFFFFFFFFFFFFLL;
      if (v3 == 43)
      {
        if (v6)
        {
          if (v6 != 1 && (BYTE1(v3) - 48) <= 9u && v6 != 2 && (BYTE2(v3) - 48) <= 9u)
          {
            uint64_t v10 = 10 * (BYTE1(v3) - 48) + (BYTE2(v3) - 48);
            uint64_t v11 = v6 - 3;
            if (v11)
            {
              uint64_t v12 = (unsigned __int8 *)v25 + 3;
              do
              {
                unsigned int v13 = *v12 - 48;
                if (v13 > 9) {
                  break;
                }
                uint64_t v14 = 10 * v10;
                if ((unsigned __int128)(v10 * (__int128)10) >> 64 != (10 * v10) >> 63) {
                  break;
                }
                uint64_t v10 = v14 + v13;
                if (__OFADD__(v14, v13)) {
                  break;
                }
                ++v12;
                --v11;
              }
              while (v11);
            }
          }
          goto LABEL_44;
        }
      }
      else
      {
        if (v3 != 45)
        {
          if (v6)
          {
            if ((v3 - 48) <= 9u && v6 != 1 && (BYTE1(v3) - 48) <= 9u)
            {
              uint64_t v15 = 10 * (v3 - 48) + (BYTE1(v3) - 48);
              uint64_t v16 = v6 - 2;
              if (v16)
              {
                uint64_t v17 = (unsigned __int8 *)v25 + 2;
                do
                {
                  unsigned int v18 = *v17 - 48;
                  if (v18 > 9) {
                    break;
                  }
                  uint64_t v19 = 10 * v15;
                  if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63) {
                    break;
                  }
                  uint64_t v15 = v19 + v18;
                  if (__OFADD__(v19, v18)) {
                    break;
                  }
                  ++v17;
                  --v16;
                }
                while (v16);
              }
            }
          }
          goto LABEL_44;
        }
        if (v6)
        {
          if (v6 != 1 && (BYTE1(v3) - 48) <= 9u && v6 != 2 && (BYTE2(v3) - 48) <= 9u)
          {
            uint64_t v20 = -10 * (BYTE1(v3) - 48) - (BYTE2(v3) - 48);
            uint64_t v21 = v6 - 3;
            if (v21)
            {
              id v22 = (unsigned __int8 *)v25 + 3;
              do
              {
                unsigned int v23 = *v22 - 48;
                if (v23 > 9) {
                  break;
                }
                uint64_t v24 = 10 * v20;
                if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
                  break;
                }
                uint64_t v20 = v24 - v23;
                if (__OFSUB__(v24, v23)) {
                  break;
                }
                ++v22;
                --v21;
              }
              while (v21);
            }
          }
          goto LABEL_44;
        }
        __break(1u);
      }
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

void *sub_249603630(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unsigned __int8 *sub_249603698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24962C250();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_2496039FC();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_24962C570();
  }
LABEL_7:
  uint64_t v11 = sub_249603780(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_249603780(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unsigned int v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_2496039FC()
{
  unint64_t v0 = sub_24962C260();
  uint64_t v4 = sub_249603A7C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_249603A7C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_249603BD4(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_249603630(v9, 0);
      unint64_t v12 = sub_249603CD4((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24962C570();
LABEL_4:
        JUMPOUT(0x24C5A43C0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x24C5A43C0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24C5A43C0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_249603BD4(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_24960ACFC(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_24960ACFC(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_249603CD4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_24960ACFC(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_24962C200();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_24962C570();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_24960ACFC(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_24962C1D0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_249603EE8()
{
  uint64_t v0 = 47;
  uint64_t v7 = 47;
  uint64_t v1 = sub_24962BD00();
  unint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = v1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    uint64_t v0 = sub_24962BD00();
    uint64_t v7 = v0;
  }
  sub_24962BD20();
  if (v5)
  {
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    return v7;
  }
  return v0;
}

uint64_t sub_249603FAC(uint64_t a1, unint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v2 = a2 >> 62;
  uint64_t v3 = MEMORY[0x263F8EE78];
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
      uint64_t v29 = MEMORY[0x263F8EE78];
      int64_t v7 = v4 & ~(v4 >> 63);
      sub_2495F7AB8(0, v7, 0);
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
            uint64_t v9 = sub_24962BBC0();
            if (!v9) {
              goto LABEL_46;
            }
            uint64_t v10 = v9;
            uint64_t v11 = sub_24962BBF0();
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
            uint64_t v14 = sub_24962BBC0();
            if (!v14) {
              goto LABEL_47;
            }
            uint64_t v10 = v14;
            uint64_t v15 = sub_24962BBF0();
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
        __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D60);
        uint64_t v16 = swift_allocObject();
        *(_OWORD *)(v16 + 16) = xmmword_249630430;
        *(void *)(v16 + 56) = MEMORY[0x263F8E778];
        *(void *)(v16 + 64) = MEMORY[0x263F8E7C0];
        *(unsigned char *)(v16 + 32) = v13;
        unint64_t v2 = sub_24962C110();
        uint64_t v18 = v17;
        uint64_t v29 = v3;
        unint64_t v20 = *(void *)(v3 + 16);
        unint64_t v19 = *(void *)(v3 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_2495F7AB8(v19 > 1, v20 + 1, 1);
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

uint64_t sub_249604354(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5060);
  if (swift_dynamicCast())
  {
    sub_2495F0788(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_24962BC10();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_2495F73C0((uint64_t)v38, &qword_2696C5068);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      int64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_24962C570();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      int64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_24960B720(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_24962C1C0();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_24960B784(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0], v12);
  unint64_t v13 = (unint64_t)sub_24960AD78((void *(*)(uint64_t *__return_ptr, char *, char *))sub_24960BEB8);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_24962BD80();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_24960ACFC(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_24962C200();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_24962C570();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_24960ACFC(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_24962C1D0();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_24962BD90();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_24962BD90();
    sub_2495F8F84(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_2495F8F84((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_249604884(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F70];
  v28[4] = MEMORY[0x263F06F60];
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x263F06F70]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_2495F7E7C(a1, a2);
      sub_2495F7E7C(v5, v6);
      uint64_t v8 = (unsigned char *)sub_24962BBC0();
      if (v8)
      {
        uint64_t v9 = sub_24962BBF0();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_24962BBE0();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = 0;
      }
      sub_24960B07C(v8, v13, &v27);
      sub_2495F7470(v5, v6);
LABEL_27:
      sub_2495F7470(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_2495F7E7C(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_24962BBC0();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_24962BBF0();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_24962BBE0();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        BOOL v23 = v22;
      }
      else {
        BOOL v23 = 0;
      }
      sub_24960B07C(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_2495F7E7C(a1, a2);
      int64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_2495F7E7C(a1, a2);
      int64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_24960B07C(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_249604B38()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C5000);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2696C5000);
  if (qword_2696C49F0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2696C7C68);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

unint64_t sub_249604C00()
{
  return 0xD000000000000011;
}

uint64_t sub_249604D84()
{
  return 0x6C75736552414247;
}

uint64_t sub_249604ED4(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for GBAResult(0);
  MEMORY[0x270FA5388](v4, v5);
  int64_t v7 = (char *)&v151 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (unint64_t *)(v1 + *(int *)(v4 + 36));
  if ((a1 & 0x10000) != 0)
  {
    unint64_t v20 = *v8;
    unint64_t v21 = v8[1];
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_249604354(v20, v21);
    unint64_t v24 = v23;
    uint64_t v25 = sub_24960B824((uint64_t)&unk_26FD37B38);
    unint64_t v27 = v26;
    uint64_t v174 = v22;
    unint64_t v175 = v24;
    sub_2495F7E7C(v22, v24);
    sub_24960B338(v25, v27);
    sub_2495F7470(v25, v27);
    uint64_t v18 = v22;
    unint64_t v19 = v24;
  }
  else
  {
    unint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_249604354(v9, v10);
    unint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C28);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_249630900;
    *(_WORD *)(v14 + 32) = 1;
    *(unsigned char *)(v14 + 34) = 1;
    *(unsigned char *)(v14 + 35) = BYTE1(a1);
    *(unsigned char *)(v14 + 36) = a1;
    uint64_t v15 = sub_24960B824(v14);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v174 = v11;
    unint64_t v175 = v13;
    sub_2495F7E7C(v11, v13);
    sub_24960B338(v15, v17);
    sub_2495F7470(v15, v17);
    uint64_t v18 = v11;
    unint64_t v19 = v13;
  }
  sub_2495F7470(v18, v19);
  uint64_t v28 = v174;
  unint64_t v29 = v175;
  v168 = v7;
  uint64_t v172 = v4;
  if (qword_2696C49D0 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_24962BF40();
  uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_2696C5000);
  sub_2495F7E7C(v28, v29);
  sub_2495F7E7C(v28, v29);
  uint64_t v32 = sub_24962BF20();
  os_log_type_t v33 = sub_24962C3F0();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v169 = v31;
  uint64_t v170 = v28;
  unint64_t v173 = v29;
  unint64_t v171 = v2;
  if (v34)
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v174 = v36;
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v37 = sub_249603FAC(v28, v29);
    uint64_t v159 = 0;
    uint64_t v180 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D68);
    sub_24960C5D8((unint64_t *)&qword_2696C4D70, &qword_2696C4D68);
    uint64_t v38 = sub_24962C0B0();
    unint64_t v40 = v39;
    unint64_t v29 = v173;
    swift_bridgeObjectRelease();
    uint64_t v180 = sub_2495F74C8(v38, v40, &v174);
    sub_24962C490();
    uint64_t v28 = v170;
    swift_bridgeObjectRelease();
    sub_2495F7470(v28, v29);
    sub_2495F7470(v28, v29);
    _os_log_impl(&dword_2495EB000, v32, v33, "NAF ID: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v36, -1, -1);
    uint64_t v41 = v35;
    uint64_t v2 = v171;
    MEMORY[0x24C5A5090](v41, -1, -1);
  }
  else
  {
    sub_2495F7470(v28, v29);
    sub_2495F7470(v28, v29);

    uint64_t v159 = 0;
  }
  uint64_t v160 = v29 >> 62;
  uint64_t v42 = (uint64_t)v168;
  sub_24960B8C0(v2, (uint64_t)v168);
  uint64_t v43 = sub_24962BF20();
  os_log_type_t v44 = sub_24962C3F0();
  if (os_log_type_enabled(v43, v44))
  {
    unint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v180 = v46;
    *(_DWORD *)unint64_t v45 = 136315138;
    uint64_t v47 = (uint64_t *)(v42 + *(int *)(v172 + 28));
    unint64_t v48 = v47[1];
    uint64_t v49 = v47[2];
    unint64_t v50 = v47[3];
    uint64_t v52 = v47[4];
    unint64_t v51 = v47[5];
    uint64_t v174 = *v47;
    unint64_t v175 = v48;
    uint64_t v176 = v49;
    unint64_t v177 = v50;
    uint64_t v178 = v52;
    unint64_t v179 = v51;
    sub_2495F7E7C(v174, v48);
    unint64_t v53 = v50;
    uint64_t v2 = v171;
    sub_2495F7E7C(v49, v53);
    sub_2495F7E7C(v52, v51);
    uint64_t v54 = sub_24962C140();
    uint64_t v174 = sub_2495F74C8(v54, v55, &v180);
    unint64_t v29 = v173;
    sub_24962C490();
    uint64_t v28 = v170;
    swift_bridgeObjectRelease();
    sub_24960B924((uint64_t)v168);
    _os_log_impl(&dword_2495EB000, v43, v44, "%s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v46, -1, -1);
    uint64_t v56 = v45;
    uint64_t v57 = v172;
    MEMORY[0x24C5A5090](v56, -1, -1);
  }
  else
  {
    sub_24960B924(v42);

    uint64_t v57 = v172;
  }
  uint64_t v58 = (void *)(v2 + *(int *)(v57 + 28));
  uint64_t v59 = v58[4];
  unint64_t v60 = v58[5];
  uint64_t v61 = v58[2];
  unint64_t v62 = v58[3];
  uint64_t v174 = v59;
  unint64_t v175 = v60;
  sub_2495F7E7C(v59, v60);
  sub_2495F7E7C(v59, v60);
  sub_2495F7E7C(v61, v62);
  sub_24960B338(v61, v62);
  sub_2495F7470(v61, v62);
  sub_2495F7470(v59, v60);
  uint64_t v63 = v174;
  unint64_t v162 = v175;
  uint64_t v64 = sub_24960B824((uint64_t)&unk_26FD37B60);
  unint64_t v66 = v65;
  uint64_t v68 = sub_249604354(0x656D2D616267uLL, 0xE600000000000000);
  unint64_t v69 = v67;
  LODWORD(v70) = 0;
  switch(v67 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v68), v68))
      {
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        sub_24962C5C0();
        __break(1u);
        JUMPOUT(0x249605E88);
      }
      unint64_t v70 = HIDWORD(v68) - (int)v68;
LABEL_17:
      if ((v70 & 0x8000000000000000) != 0 || v70 >= 0x10000) {
        goto LABEL_55;
      }
LABEL_19:
      uint64_t v161 = v63;
      unint64_t v77 = sub_249601904(v70);
      unint64_t v167 = v73;
      v168 = (char *)v77;
      BOOL v74 = (uint64_t *)(v2 + *(int *)(v57 + 24));
      uint64_t v75 = *v74;
      unint64_t v76 = v74[1];
      LODWORD(v77) = 0;
      switch(v76 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v75), v75)) {
            goto LABEL_49;
          }
          unint64_t v77 = HIDWORD(v75) - (int)v75;
LABEL_24:
          if ((v77 & 0x8000000000000000) != 0 || v77 >= 0x10000) {
            goto LABEL_55;
          }
LABEL_26:
          uint64_t v80 = sub_249601904(v77);
          unint64_t v165 = v81;
          uint64_t v166 = v80;
          uint64_t v82 = (unint64_t *)(v171 + *(int *)(v172 + 32));
          unint64_t v83 = *v82;
          unint64_t v84 = v82[1];
          swift_bridgeObjectRetain();
          unint64_t v86 = sub_249604354(v83, v84);
          unint64_t v171 = v85;
          uint64_t v172 = v86;
          LODWORD(v86) = 0;
          switch(v85 >> 62)
          {
            case 1uLL:
              if (__OFSUB__(HIDWORD(v172), v172)) {
                goto LABEL_51;
              }
              unint64_t v86 = HIDWORD(v172) - (int)v172;
LABEL_31:
              if ((v86 & 0x8000000000000000) != 0 || v86 >= 0x10000) {
                goto LABEL_55;
              }
LABEL_33:
              uint64_t v164 = sub_249601904(v86);
              unint64_t v163 = v89;
              LODWORD(v90) = 0;
              switch((int)v160)
              {
                case 1:
                  if (__OFSUB__(HIDWORD(v28), v28)) {
                    goto LABEL_53;
                  }
                  unint64_t v90 = HIDWORD(v28) - (int)v28;
LABEL_38:
                  sub_2495F7E7C(v28, v29);
                  if ((v90 & 0x8000000000000000) != 0 || v90 >= 0x10000) {
                    goto LABEL_55;
                  }
LABEL_40:
                  uint64_t v93 = sub_249601904(v90);
                  uint64_t v94 = v64;
                  uint64_t v95 = v93;
                  unint64_t v97 = v96;
                  uint64_t v180 = v94;
                  unint64_t v181 = v66;
                  uint64_t v160 = v94;
                  unint64_t v158 = v66;
                  sub_2495F7E7C(v94, v66);
                  sub_2495F7E7C(v68, v69);
                  sub_24960B338(v68, v69);
                  uint64_t v157 = v68;
                  unint64_t v156 = v69;
                  sub_2495F7470(v68, v69);
                  uint64_t v98 = v180;
                  unint64_t v99 = v181;
                  uint64_t v174 = v180;
                  unint64_t v175 = v181;
                  sub_2495F7E7C(v180, v181);
                  unint64_t v101 = v167;
                  uint64_t v100 = (uint64_t)v168;
                  sub_2495F7E7C((uint64_t)v168, v167);
                  sub_24960B338(v100, v101);
                  sub_2495F7470(v100, v101);
                  sub_2495F7470(v98, v99);
                  uint64_t v102 = v174;
                  unint64_t v103 = v175;
                  uint64_t v180 = v174;
                  unint64_t v181 = v175;
                  sub_2495F7E7C(v174, v175);
                  sub_2495F7E7C(v75, v76);
                  sub_24960B338(v75, v76);
                  sub_2495F7470(v75, v76);
                  sub_2495F7470(v102, v103);
                  uint64_t v104 = v180;
                  unint64_t v105 = v181;
                  uint64_t v174 = v180;
                  unint64_t v175 = v181;
                  sub_2495F7E7C(v180, v181);
                  unint64_t v107 = v165;
                  uint64_t v106 = v166;
                  sub_2495F7E7C(v166, v165);
                  sub_24960B338(v106, v107);
                  sub_2495F7470(v106, v107);
                  sub_2495F7470(v104, v105);
                  uint64_t v108 = v174;
                  unint64_t v109 = v175;
                  uint64_t v180 = v174;
                  unint64_t v181 = v175;
                  sub_2495F7E7C(v174, v175);
                  unint64_t v111 = v171;
                  uint64_t v110 = v172;
                  sub_2495F7E7C(v172, v171);
                  sub_24960B338(v110, v111);
                  sub_2495F7470(v110, v111);
                  sub_2495F7470(v108, v109);
                  uint64_t v112 = v180;
                  unint64_t v113 = v181;
                  uint64_t v174 = v180;
                  unint64_t v175 = v181;
                  sub_2495F7E7C(v180, v181);
                  uint64_t v114 = v164;
                  unint64_t v115 = v163;
                  sub_2495F7E7C(v164, v163);
                  sub_24960B338(v114, v115);
                  sub_2495F7470(v114, v115);
                  sub_2495F7470(v112, v113);
                  uint64_t v116 = v174;
                  unint64_t v117 = v175;
                  uint64_t v180 = v174;
                  unint64_t v181 = v175;
                  unint64_t v118 = v173;
                  sub_2495F7E7C(v28, v173);
                  sub_2495F7E7C(v116, v117);
                  sub_24960B338(v28, v118);
                  sub_2495F7470(v28, v118);
                  sub_2495F7470(v116, v117);
                  uint64_t v119 = v180;
                  unint64_t v120 = v181;
                  uint64_t v174 = v180;
                  unint64_t v175 = v181;
                  sub_2495F7E7C(v180, v181);
                  sub_2495F7E7C(v95, v97);
                  sub_24960B338(v95, v97);
                  uint64_t v155 = v95;
                  unint64_t v154 = v97;
                  sub_2495F7470(v95, v97);
                  sub_2495F7470(v119, v120);
                  uint64_t v121 = v174;
                  uint64_t v122 = v175;
                  uint64_t v174 = sub_249603FAC(v174, v175);
                  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D68);
                  uint64_t v124 = sub_24960C5D8((unint64_t *)&qword_2696C4D70, &qword_2696C4D68);
                  uint64_t v159 = v123;
                  uint64_t v151 = v124;
                  uint64_t v125 = sub_24962C0B0();
                  unint64_t v127 = v126;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRetain();
                  v128 = sub_24962BF20();
                  os_log_type_t v129 = sub_24962C3F0();
                  BOOL v130 = os_log_type_enabled(v128, v129);
                  uint64_t v153 = v121;
                  uint64_t v152 = v122;
                  if (v130)
                  {
                    v131 = (uint8_t *)swift_slowAlloc();
                    uint64_t v132 = swift_slowAlloc();
                    uint64_t v174 = v132;
                    *(_DWORD *)v131 = 136315138;
                    swift_bridgeObjectRetain();
                    uint64_t v180 = sub_2495F74C8(v125, v127, &v174);
                    sub_24962C490();
                    swift_bridgeObjectRelease_n();
                    _os_log_impl(&dword_2495EB000, v128, v129, "S: %s", v131, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x24C5A5090](v132, -1, -1);
                    MEMORY[0x24C5A5090](v131, -1, -1);
                  }
                  else
                  {

                    swift_bridgeObjectRelease_n();
                  }
                  uint64_t v133 = v161;
                  unint64_t v134 = v162;
                  sub_2495F7E7C(v161, v162);
                  sub_2495F7E7C(v133, v134);
                  v135 = sub_24962BF20();
                  os_log_type_t v136 = sub_24962C3F0();
                  if (os_log_type_enabled(v135, v136))
                  {
                    v137 = (uint8_t *)swift_slowAlloc();
                    uint64_t v138 = swift_slowAlloc();
                    uint64_t v174 = v138;
                    *(_DWORD *)v137 = 136315138;
                    uint64_t v180 = sub_249603FAC(v133, v134);
                    uint64_t v139 = sub_24962C0B0();
                    unint64_t v141 = v140;
                    swift_bridgeObjectRelease();
                    uint64_t v180 = sub_2495F74C8(v139, v141, &v174);
                    uint64_t v133 = v161;
                    sub_24962C490();
                    unint64_t v134 = v162;
                    swift_bridgeObjectRelease();
                    sub_2495F7470(v133, v134);
                    sub_2495F7470(v133, v134);
                    _os_log_impl(&dword_2495EB000, v135, v136, "Ks: %s", v137, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x24C5A5090](v138, -1, -1);
                    MEMORY[0x24C5A5090](v137, -1, -1);
                  }
                  else
                  {
                    sub_2495F7470(v133, v134);
                    sub_2495F7470(v133, v134);
                  }

                  uint64_t v142 = v170;
                  uint64_t v143 = v153;
                  unint64_t v144 = v152;
                  uint64_t v145 = sub_249619744(v153, v152, v133, v134);
                  unint64_t v147 = v146;
                  sub_2495F7E7C(v145, v146);
                  uint64_t v148 = sub_249604884(v145, v147);
                  unint64_t v149 = v173;
                  sub_2495F7470(v142, v173);
                  sub_2495F7470(v133, v134);
                  sub_2495F7470(v145, v147);
                  sub_2495F7470(v143, v144);
                  sub_2495F7470(v155, v154);
                  sub_2495F7470(v142, v149);
                  sub_2495F7470(v164, v163);
                  sub_2495F7470(v172, v171);
                  sub_2495F7470(v166, v165);
                  sub_2495F7470((uint64_t)v168, v167);
                  sub_2495F7470(v157, v156);
                  sub_2495F7470(v160, v158);
                  return v148;
                case 2:
                  uint64_t v92 = *(void *)(v28 + 16);
                  uint64_t v91 = *(void *)(v28 + 24);
                  unint64_t v90 = v91 - v92;
                  if (!__OFSUB__(v91, v92)) {
                    goto LABEL_38;
                  }
                  goto LABEL_54;
                case 3:
                  goto LABEL_40;
                default:
                  LODWORD(v90) = BYTE6(v29);
                  goto LABEL_40;
              }
            case 2uLL:
              uint64_t v88 = *(void *)(v172 + 16);
              uint64_t v87 = *(void *)(v172 + 24);
              unint64_t v86 = v87 - v88;
              if (!__OFSUB__(v87, v88)) {
                goto LABEL_31;
              }
              goto LABEL_52;
            case 3uLL:
              goto LABEL_33;
            default:
              LODWORD(v86) = BYTE6(v171);
              goto LABEL_33;
          }
        case 2uLL:
          uint64_t v79 = *(void *)(v75 + 16);
          uint64_t v78 = *(void *)(v75 + 24);
          unint64_t v77 = v78 - v79;
          if (!__OFSUB__(v78, v79)) {
            goto LABEL_24;
          }
          goto LABEL_50;
        case 3uLL:
          goto LABEL_26;
        default:
          LODWORD(v77) = BYTE6(v76);
          goto LABEL_26;
      }
    case 2uLL:
      uint64_t v72 = *(void *)(v68 + 16);
      uint64_t v71 = *(void *)(v68 + 24);
      unint64_t v70 = v71 - v72;
      if (!__OFSUB__(v71, v72)) {
        goto LABEL_17;
      }
      goto LABEL_48;
    case 3uLL:
      goto LABEL_19;
    default:
      LODWORD(v70) = BYTE6(v67);
      goto LABEL_19;
  }
}

uint64_t sub_249605ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[31] = a3;
  v4[32] = v3;
  v4[29] = a1;
  v4[30] = a2;
  v4[33] = type metadata accessor for GBAResult(0);
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C50D0);
  v4[37] = v5;
  v4[38] = *(void *)(v5 - 8);
  v4[39] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C50D8);
  v4[40] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C50E0);
  v4[41] = v6;
  v4[42] = *(void *)(v6 - 8);
  v4[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249606070, 0, 0);
}

uint64_t sub_249606070()
{
  unint64_t v69 = v0;
  if (qword_2696C49D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24962BF40();
  v0[44] = __swift_project_value_buffer(v1, (uint64_t)qword_2696C5000);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_24962BF20();
  os_log_type_t v3 = sub_24962C3E0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[31];
  if (v4)
  {
    uint64_t v64 = v0[30];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v67 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_24962BE40();
    sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
    uint64_t v8 = sub_24962C6B0();
    v0[27] = sub_2495F74C8(v8, v9, &v67);
    sub_24962C490();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[28] = sub_2495F74C8(v64, v5, &v67);
    sub_24962C490();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2495EB000, v2, v3, "[%s] Performing authentication for NAF %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v7, -1, -1);
    MEMORY[0x24C5A5090](v6, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v10 = v0[41];
  uint64_t v11 = v0[42];
  uint64_t v13 = v0[39];
  uint64_t v12 = v0[40];
  uint64_t v14 = v0[37];
  uint64_t v15 = v0[38];
  uint64_t v16 = v0[32] + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_configuration;
  uint64_t v17 = *(void *)(v16 + 56);
  v0[16] = *(void *)(v16 + 48);
  v0[17] = v17;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C50E8);
  sub_24962BE70();
  sub_2495FCBE4();
  sub_24960C5D8(&qword_2696C50F0, &qword_2696C50D0);
  sub_24962C090();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10) == 1)
  {
    sub_2495F73C0(v0[40], &qword_2696C50D8);
    sub_24960C1A8();
    swift_allocError();
    *uint64_t v18 = 0;
    swift_willThrow();
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v31 = (uint64_t (*)(void))v0[1];
    return v31();
  }
  (*(void (**)(void, void, void))(v0[42] + 32))(v0[43], v0[40], v0[41]);
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  sub_24962C520();
  swift_bridgeObjectRelease();
  uint64_t v67 = 0x636E6D2E667362;
  unint64_t v68 = 0xE700000000000000;
  swift_getKeyPath();
  sub_24962BE80();
  swift_release();
  MEMORY[0x24C5A43B0](v0[2], v0[3], v0[4], v0[5]);
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  swift_getKeyPath();
  sub_24962BE80();
  swift_release();
  MEMORY[0x24C5A43B0](v0[6], v0[7], v0[8], v0[9]);
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v19 = swift_task_alloc();
  v0[45] = v19;
  uint64_t v20 = 1886680168;
  if (*(unsigned char *)(v16 + 73)) {
    uint64_t v20 = 0x7370747468;
  }
  unint64_t v21 = 0xE500000000000000;
  if (!*(unsigned char *)(v16 + 73)) {
    unint64_t v21 = 0xE400000000000000;
  }
  uint64_t v63 = (void *)v16;
  if (*(unsigned char *)(v16 + 72))
  {
    uint64_t v67 = v20;
    unint64_t v68 = v21;
    sub_24962C1B0();
    sub_24962C1B0();
  }
  else
  {
    uint64_t v22 = *(void *)(v16 + 64);
    uint64_t v67 = v20;
    unint64_t v68 = v21;
    sub_24962C1B0();
    sub_24962C1B0();
    sub_24962C1B0();
    v0[26] = v22;
    sub_24962C6B0();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
  }
  sub_24962BD30();
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_24962BD40();
  v0[46] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = swift_task_alloc();
  v0[47] = v25;
  uint64_t v26 = swift_task_alloc();
  sub_24960C61C(v19, v26);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v26, 1, v23) == 1)
  {
    uint64_t v28 = v0[42];
    uint64_t v27 = v0[43];
    uint64_t v29 = v0[41];
    swift_bridgeObjectRelease();
    sub_2495F73C0(v26, &qword_2696C4AF0);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24960C1A8();
    swift_allocError();
    *uint64_t v30 = 1;
    swift_willThrow();
    sub_2495F73C0(v19, &qword_2696C4AF0);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    swift_task_dealloc();
    goto LABEL_17;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v25, v26, v23);
  swift_task_dealloc();
  uint64_t v60 = swift_task_alloc();
  uint64_t v61 = *(void (**)(void))(v24 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v60, v25, v23);
  swift_retain_n();
  os_log_type_t v33 = sub_24962BF20();
  os_log_type_t type = sub_24962C3E0();
  uint64_t v62 = v25;
  if (os_log_type_enabled(v33, type))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v67 = v58;
    *(_DWORD *)uint64_t v34 = 136315394;
    sub_24962BE40();
    sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
    uint64_t v35 = sub_24962C6B0();
    v0[24] = sub_2495F74C8(v35, v36, &v67);
    sub_24962C490();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    sub_24960D964((unint64_t *)&unk_2696C4B38, MEMORY[0x270FA8E68]);
    uint64_t v37 = sub_24962C6B0();
    v0[25] = sub_2495F74C8(v37, v38, &v67);
    sub_24962C490();
    swift_bridgeObjectRelease();
    unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    uint64_t v66 = (v24 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v39(v60, v23);
    _os_log_impl(&dword_2495EB000, v33, type, "[%s] BSF URL: %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v58, -1, -1);
    MEMORY[0x24C5A5090](v34, -1, -1);
  }
  else
  {
    swift_release_n();
    unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    uint64_t v66 = (v24 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v39(v60, v23);
  }

  v0[48] = v39;
  swift_task_dealloc();
  uint64_t v40 = sub_24962BB70();
  v0[49] = v40;
  uint64_t v41 = *(void **)(v40 - 8);
  v0[50] = v41[8];
  uint64_t v42 = swift_task_alloc();
  v0[51] = v42;
  uint64_t v43 = swift_task_alloc();
  ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v43, v62, v23);
  uint64_t v44 = swift_task_alloc();
  swift_task_alloc();
  v61();
  sub_24962BB40();
  swift_task_dealloc();
  sub_249611E9C(v42);
  v0[52] = v66;
  v39(v43, v23);
  unint64_t v45 = (void (*)(uint64_t, uint64_t))v41[1];
  v0[53] = v45;
  v0[54] = (unint64_t)(v41 + 1) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v45(v44, v40);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24962BAF0();
  swift_bridgeObjectRetain();
  sub_249604C00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24962BB60();
  swift_bridgeObjectRelease();
  sub_24962BB60();
  swift_retain_n();
  uint64_t v46 = sub_24962BF20();
  os_log_type_t v47 = sub_24962C3F0();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t v67 = v65;
    *(_DWORD *)uint64_t v48 = 136315394;
    sub_24962BE40();
    sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
    uint64_t v49 = sub_24962C6B0();
    v0[21] = sub_2495F74C8(v49, v50, &v67);
    sub_24962C490();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2080;
    swift_beginAccess();
    sub_24960D964(&qword_2696C50C8, MEMORY[0x270FA7D40]);
    uint64_t v51 = sub_24962C6B0();
    v0[23] = sub_2495F74C8(v51, v52, &v67);
    sub_24962C490();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2495EB000, v46, v47, "[%s] %s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v65, -1, -1);
    MEMORY[0x24C5A5090](v48, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v53 = v63[4];
  uint64_t v54 = v63[5];
  __swift_project_boxed_opaque_existential_1(v63 + 1, v53);
  swift_beginAccess();
  uint64_t v55 = swift_task_alloc();
  v0[55] = v55;
  uint64_t v56 = (void (*)(void))v41[2];
  v0[56] = v56;
  v0[57] = (unint64_t)(v41 + 2) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v56();
  uint64_t v57 = (void *)swift_task_alloc();
  v0[58] = v57;
  *uint64_t v57 = v0;
  v57[1] = sub_249606F78;
  return sub_2495ECB64(v55, v53, v54);
}

uint64_t sub_249606F78(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v4;
  uint64_t v8 = *v4;
  *(void *)(v8 + 472) = a3;
  *(void *)(v8 + 480) = v3;
  swift_task_dealloc();
  (*(void (**)(void, void))(v7 + 424))(*(void *)(v7 + 440), *(void *)(v7 + 392));
  if (v3)
  {
    unint64_t v9 = sub_249607B44;
  }
  else
  {
    swift_task_dealloc();
    sub_2495F7470(a1, a2);
    unint64_t v9 = sub_249607110;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_249607110()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void **)(v0 + 472);
  swift_retain_n();
  id v2 = v1;
  uint64_t v3 = sub_24962BF20();
  os_log_type_t v4 = sub_24962C3F0();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = *(void **)(v0 + 472);
    uint64_t v6 = swift_slowAlloc();
    os_log_type_t v33 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = v35;
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_24962BE40();
    sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
    uint64_t v7 = sub_24962C6B0();
    *(void *)(v0 + 152) = sub_2495F74C8(v7, v8, &v36);
    sub_24962C490();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    *(void *)(v0 + 160) = v5;
    id v9 = v5;
    sub_24962C490();
    *os_log_type_t v33 = v5;

    _os_log_impl(&dword_2495EB000, v3, v4, "[%s] %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v33, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v35, -1, -1);
    MEMORY[0x24C5A5090](v6, -1, -1);
  }
  else
  {
    uint64_t v10 = *(void **)(v0 + 472);

    swift_release_n();
  }
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  uint64_t v12 = *(void **)(v0 + 472);
  if (v11)
  {
    uint64_t v13 = (void *)v11;
    id v14 = v12;
    if (objc_msgSend(v13, sel_statusCode) == (id)401)
    {
      uint64_t v15 = *(void (**)(void))(v0 + 448);
      uint64_t v16 = swift_task_alloc();
      *(void *)(v0 + 488) = v16;
      v15();
      uint64_t v17 = swift_task_alloc();
      *(void *)(v0 + 496) = v17;
      *(void *)uint64_t v17 = v0;
      *(void *)(v17 + 8) = sub_24960760C;
      uint64_t v18 = *(void *)(v0 + 288);
      uint64_t v19 = *(void *)(v0 + 240);
      *(_OWORD *)(v17 + 1336) = *(_OWORD *)(v0 + 248);
      *(void *)(v17 + 1328) = v19;
      *(void *)(v17 + 1320) = v16;
      *(void *)(v17 + 1312) = v13;
      *(void *)(v17 + 1304) = v18;
      return MEMORY[0x270FA2498](sub_249607E08, 0, 0);
    }
    uint64_t v12 = *(void **)(v0 + 472);
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    uint64_t v20 = *(void *)(v0 + 408);
    unint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v32 = *(void *)(v0 + 392);
    uint64_t v23 = *(void *)(v0 + 368);
    uint64_t v22 = *(void *)(v0 + 376);
    uint64_t v24 = *(void *)(v0 + 360);
    uint64_t v25 = *(void *)(v0 + 336);
    uint64_t v31 = *(void *)(v0 + 344);
    uint64_t v30 = *(void *)(v0 + 328);
    sub_24960C1A8();
    swift_allocError();
    unsigned char *v27 = 2;
    swift_willThrow();
  }
  else
  {
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    uint64_t v20 = *(void *)(v0 + 408);
    unint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v32 = *(void *)(v0 + 392);
    uint64_t v23 = *(void *)(v0 + 368);
    uint64_t v22 = *(void *)(v0 + 376);
    uint64_t v24 = *(void *)(v0 + 360);
    uint64_t v25 = *(void *)(v0 + 336);
    uint64_t v31 = *(void *)(v0 + 344);
    uint64_t v30 = *(void *)(v0 + 328);
    sub_24960C1A8();
    swift_allocError();
    *uint64_t v26 = 2;
    swift_willThrow();
  }

  v21(v22, v23);
  sub_2495F73C0(v24, &qword_2696C4AF0);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v31, v30);
  v34(v20, v32);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_24960760C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 504) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 424))(*(void *)(v2 + 488), *(void *)(v2 + 392));
  if (v0)
  {
    uint64_t v3 = sub_249607C7C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = sub_249607788;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_249607788()
{
  uint64_t v34 = v0;
  sub_24960B8C0(v0[36], v0[35]);
  swift_retain_n();
  uint64_t v1 = sub_24962BF20();
  os_log_type_t v2 = sub_24962C3F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v25 = v0[47];
    uint64_t v26 = (void (*)(uint64_t, uint64_t))v0[48];
    uint64_t v23 = (void *)v0[59];
    uint64_t v24 = v0[46];
    uint64_t v27 = v0[45];
    uint64_t v28 = v0[42];
    uint64_t v29 = v0[41];
    uint64_t v31 = v0[43];
    uint64_t v3 = v0[34];
    uint64_t v22 = v0[35];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v33 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    sub_24962BE40();
    sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
    uint64_t v6 = sub_24962C6B0();
    v0[22] = sub_2495F74C8(v6, v7, &v33);
    sub_24962C490();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v4 + 12) = 2080;
    sub_24960B8C0(v22, v3);
    uint64_t v8 = sub_24962C140();
    v0[18] = sub_2495F74C8(v8, v9, &v33);
    sub_24962C490();
    swift_bridgeObjectRelease();
    sub_24960B924(v22);
    _os_log_impl(&dword_2495EB000, v1, v2, "[%s] %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v5, -1, -1);
    MEMORY[0x24C5A5090](v4, -1, -1);

    v26(v25, v24);
    sub_2495F73C0(v27, &qword_2696C4AF0);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v29);
  }
  else
  {
    uint64_t v10 = (void *)v0[59];
    uint64_t v11 = v0[47];
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[48];
    uint64_t v14 = v0[45];
    uint64_t v13 = v0[46];
    uint64_t v15 = v0[42];
    uint64_t v32 = v0[43];
    uint64_t v30 = v0[41];
    uint64_t v16 = v0[35];

    sub_24960B924(v16);
    swift_release_n();

    v12(v11, v13);
    sub_2495F73C0(v14, &qword_2696C4AF0);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v32, v30);
  }
  uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[53];
  uint64_t v18 = v0[51];
  uint64_t v19 = v0[49];
  sub_24960C684(v0[36], v0[29]);
  v17(v18, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_249607B44()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 408);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 344);
  uint64_t v7 = *(void *)(v0 + 328);
  (*(void (**)(void, void))(v0 + 384))(*(void *)(v0 + 376), *(void *)(v0 + 368));
  sub_2495F73C0(v4, &qword_2696C4AF0);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  v1(v2, v3);
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
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_249607C7C()
{
  uint64_t v1 = (void *)v0[59];
  uint64_t v2 = v0[51];
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[48];
  uint64_t v12 = v0[49];
  uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[53];
  uint64_t v5 = v0[46];
  uint64_t v4 = v0[47];
  uint64_t v6 = v0[45];
  uint64_t v7 = v0[42];
  uint64_t v11 = v0[43];
  uint64_t v8 = v0[41];

  v3(v4, v5);
  sub_2495F73C0(v6, &qword_2696C4AF0);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v8);
  v13(v2, v12);
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
  unint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_249607DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[168] = v5;
  v6[167] = a5;
  v6[166] = a4;
  v6[165] = a3;
  v6[164] = a2;
  v6[163] = a1;
  return MEMORY[0x270FA2498](sub_249607E08, 0, 0);
}

uint64_t sub_249607E08()
{
  uint64_t v45 = v0;
  sub_249615C90(*(id *)(v0 + 1312), v0 + 664);
  sub_2495FA914(v0 + 664, v0 + 592, &qword_2696C50B0);
  if (*(void *)(v0 + 600))
  {
    *(_OWORD *)(v0 + 1200) = *(_OWORD *)(v0 + 592);
    uint64_t v1 = *(void *)(v0 + 608);
    *(void *)(v0 + 1352) = v1;
    uint64_t v2 = *(void *)(v0 + 616);
    *(void *)(v0 + 1360) = v2;
    uint64_t v3 = *(unsigned __int8 *)(v0 + 624);
    *(unsigned char *)(v0 + 585) = v3;
    long long v4 = *(_OWORD *)(v0 + 641);
    *(_OWORD *)(v0 + 1104) = *(_OWORD *)(v0 + 625);
    *(_OWORD *)(v0 + 1120) = v4;
    uint64_t v5 = sub_24962BD60();
    *(void *)(v0 + 1368) = v5;
    *(void *)(v0 + 1376) = v6;
    if (v6 >> 60 != 15)
    {
      uint64_t v40 = (uint64_t *)(v0 + 880);
      uint64_t v41 = (_OWORD *)(v0 + 928);
      uint64_t v39 = v3;
      unint64_t v8 = v6;
      uint64_t v42 = v5;
      switch(v3)
      {
        case 1:
          swift_bridgeObjectRelease();
          goto LABEL_8;
        default:
          char v9 = sub_24962C6C0();
          swift_bridgeObjectRelease();
          if (v9)
          {
LABEL_8:
            uint64_t v38 = (_OWORD *)(v0 + 976);
            if (qword_2696C49D0 != -1) {
              swift_once();
            }
            uint64_t v10 = sub_24962BF40();
            *(void *)(v0 + 1384) = __swift_project_value_buffer(v10, (uint64_t)qword_2696C5000);
            swift_retain();
            sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C3A8);
            swift_retain();
            sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C3A8);
            uint64_t v11 = sub_24962BF20();
            os_log_type_t v12 = sub_24962C3F0();
            if (os_log_type_enabled(v11, v12))
            {
              log = v11;
              uint64_t v13 = swift_slowAlloc();
              uint64_t v37 = swift_slowAlloc();
              v44[0] = v37;
              *(_DWORD *)uint64_t v13 = 136315394;
              sub_24962BE40();
              sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
              uint64_t v14 = sub_24962C6B0();
              *(void *)(v0 + 1280) = sub_2495F74C8(v14, v15, v44);
              sub_24962C490();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v13 + 12) = 2080;
              *(_OWORD *)(v0 + 520) = *(_OWORD *)(v0 + 1200);
              *(void *)(v0 + 536) = v1;
              *(void *)(v0 + 544) = v2;
              *(unsigned char *)(v0 + 552) = v39;
              long long v16 = *(_OWORD *)(v0 + 1120);
              *(_OWORD *)(v0 + 553) = *(_OWORD *)(v0 + 1104);
              *(_OWORD *)(v0 + 569) = v16;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              uint64_t v17 = sub_24962C140();
              *(void *)(v0 + 1296) = sub_2495F74C8(v17, v18, v44);
              sub_24962C490();
              swift_bridgeObjectRelease();
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
              _os_log_impl(&dword_2495EB000, log, v12, "[%s] Auth Info: %s", (uint8_t *)v13, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x24C5A5090](v37, -1, -1);
              MEMORY[0x24C5A5090](v13, -1, -1);
            }
            else
            {
              swift_release_n();
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
            }
            sub_2495F7E7C(v42, v8);
            sub_24960BB24(v42, v8, v40);
            sub_2495F8F84(v42, v8);
            sub_2495FA914((uint64_t)v40, (uint64_t)v41, &qword_2696C50B8);
            if (*(void *)(v0 + 936) >> 60 != 15)
            {
              long long v30 = *(_OWORD *)(v0 + 944);
              *uint64_t v38 = *v41;
              *(_OWORD *)(v0 + 992) = v30;
              *(_OWORD *)(v0 + 1008) = *(_OWORD *)(v0 + 960);
              uint64_t v31 = (void *)swift_task_alloc();
              *(void *)(v0 + 1392) = v31;
              *uint64_t v31 = v0;
              v31[1] = sub_249608800;
              uint64_t v32 = *(void *)(v0 + 1344);
              v31[16] = v38;
              v31[17] = v32;
              return MEMORY[0x270FA2498](sub_24960A0B4, 0, 0);
            }
            sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
            sub_24960C1A8();
            swift_allocError();
            unsigned char *v27 = 3;
            swift_willThrow();
            uint64_t v28 = v42;
            unint64_t v29 = v8;
          }
          else
          {
            if (qword_2696C49D0 != -1) {
              swift_once();
            }
            uint64_t v19 = sub_24962BF40();
            __swift_project_value_buffer(v19, (uint64_t)qword_2696C5000);
            swift_retain_n();
            sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C3A8);
            uint64_t v20 = sub_24962BF20();
            os_log_type_t v21 = sub_24962C400();
            if (os_log_type_enabled(v20, v21))
            {
              uint64_t v22 = swift_slowAlloc();
              uint64_t v43 = swift_slowAlloc();
              v44[0] = v43;
              *(_DWORD *)uint64_t v22 = 136315650;
              sub_24962BE40();
              sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
              uint64_t v23 = sub_24962C6B0();
              *(void *)(v0 + 1248) = sub_2495F74C8(v23, v24, v44);
              sub_24962C490();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v22 + 12) = 2080;
              unint64_t v25 = 0xE900000000000035;
              uint64_t v26 = 0x444D2D3176414B41;
              switch(v39)
              {
                case 1:
                  break;
                case 2:
                  unint64_t v25 = 0xE700000000000000;
                  uint64_t v26 = 0x3635322D414853;
                  break;
                case 3:
                  uint64_t v26 = 0x2D3231352D414853;
                  unint64_t v25 = 0xEB00000000363532;
                  break;
                default:
                  unint64_t v25 = 0xE300000000000000;
                  uint64_t v26 = 3490893;
                  break;
              }
              *(void *)(v0 + 1216) = sub_2495F74C8(v26, v25, v44);
              sub_24962C490();
              swift_bridgeObjectRelease();
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
              *(_WORD *)(v22 + 22) = 2080;
              *(void *)(v0 + 1288) = sub_2495F74C8(0x444D2D3176414B41, 0xE900000000000035, v44);
              sub_24962C490();
              _os_log_impl(&dword_2495EB000, v20, v21, "[%s] Unexpected algorithm: %s (expected: %s", (uint8_t *)v22, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x24C5A5090](v43, -1, -1);
              MEMORY[0x24C5A5090](v22, -1, -1);
            }
            else
            {
              swift_release_n();
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
              sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
            }

            sub_24960C1A8();
            swift_allocError();
            *uint64_t v33 = 2;
            swift_willThrow();
            uint64_t v28 = v42;
            unint64_t v29 = v8;
          }
          sub_2495F8F84(v28, v29);
          goto LABEL_29;
      }
    }
    sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
  }
  sub_24960C1A8();
  swift_allocError();
  unsigned char *v7 = 2;
  swift_willThrow();
LABEL_29:
  uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34();
}

uint64_t sub_249608800(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1400) = a1;
  *(void *)(v3 + 1408) = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_24960C354(v3 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
    long long v4 = sub_249609940;
  }
  else
  {
    long long v4 = sub_249608934;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_249608934()
{
  uint64_t v53 = v0;
  uint64_t v1 = (long long *)(v0 + 784);
  sub_24960BD1C(*(id *)(v0 + 1400), (uint64_t *)(v0 + 832));
  sub_2495FA914(v0 + 832, v0 + 784, &qword_2696C50C0);
  if (*(void *)(v0 + 792) >> 60 == 15)
  {
    uint64_t v2 = *(void **)(v0 + 1400);
    unint64_t v3 = *(void *)(v0 + 1376);
    uint64_t v4 = *(void *)(v0 + 1368);
    sub_24960C354(v0 + 664, (void (*)(void, void, void, void, void, void, void, void, char))sub_24960C2F0);
    sub_24960C1A8();
    swift_allocError();
    *uint64_t v5 = 4;
    swift_willThrow();

    sub_24960C51C(v0 + 880, (uint64_t (*)(uint64_t, uint64_t))sub_2495F8F84);
    sub_2495F8F84(v4, v3);
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  else
  {
    long long v8 = *(_OWORD *)(v0 + 800);
    long long v9 = *v1;
    *(_OWORD *)(v0 + 736) = *v1;
    *(_OWORD *)(v0 + 752) = v8;
    *(_OWORD *)(v0 + 768) = *(_OWORD *)(v0 + 816);
    uint64_t v50 = v0 + 184;
    char v47 = *(unsigned char *)(v0 + 585);
    uint64_t v46 = *(void *)(v0 + 1360);
    uint64_t v10 = *(void *)(v0 + 1352);
    uint64_t v11 = *(void *)(v0 + 1320);
    uint64_t v12 = *(void *)(v0 + 1344) + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_configuration;
    uint64_t v13 = *(void *)(v12 + 48);
    *(void *)(v0 + 1416) = v13;
    uint64_t v49 = (void *)v12;
    uint64_t v14 = *(void *)(v12 + 56);
    *(void *)(v0 + 1424) = v14;
    *(_OWORD *)(v0 + 1184) = v9;
    uint64_t v15 = sub_24962BB70();
    *(void *)(v0 + 1432) = v15;
    *(void *)(v0 + 1088) = v15;
    *(void *)(v0 + 1096) = &off_26FD38D18;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 1064));
    uint64_t v17 = *(void *)(v15 - 8);
    *(void *)(v0 + 1440) = v17;
    uint64_t v51 = *(void (**)(void))(v17 + 16);
    ((void (*)(uint64_t *, uint64_t, uint64_t))v51)(boxed_opaque_existential_1, v11, v15);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 1200);
    *(void *)(v0 + 32) = v10;
    *(void *)(v0 + 40) = v46;
    *(unsigned char *)(v0 + 48) = v47;
    long long v18 = *(_OWORD *)(v0 + 1120);
    *(_OWORD *)(v0 + 49) = *(_OWORD *)(v0 + 1104);
    *(_OWORD *)(v0 + 65) = v18;
    *(void *)(v0 + 88) = v13;
    *(void *)(v0 + 96) = v14;
    *(_OWORD *)(v0 + 104) = *(_OWORD *)(v0 + 1184);
    sub_2495F07A0(v0 + 1064, v0 + 120);
    *(void *)(v0 + 160) = 1;
    sub_24960C40C(v0 + 1184);
    sub_24960C40C(v0 + 1184);
    swift_bridgeObjectRetain();
    int64_t v19 = sub_249617ACC(8, 0);
    uint64_t v21 = v20;
    sub_24960C43C(v0 + 1184);
    __swift_destroy_boxed_opaque_existential_1(v0 + 1064);
    *(void *)(v0 + 168) = v19;
    *(void *)(v0 + 176) = v21;
    *(void *)(v0 + 512) = v21;
    long long v22 = *(_OWORD *)(v0 + 96);
    *(_OWORD *)(v0 + 416) = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v0 + 432) = v22;
    long long v23 = *(_OWORD *)(v0 + 128);
    *(_OWORD *)(v0 + 448) = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v0 + 464) = v23;
    long long v24 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v0 + 352) = *(_OWORD *)(v0 + 16);
    *(_OWORD *)(v0 + 368) = v24;
    long long v25 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 384) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v0 + 400) = v25;
    long long v26 = *(_OWORD *)(v0 + 160);
    *(_OWORD *)(v0 + 480) = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v0 + 496) = v26;
    sub_24960C46C(v0 + 352, v0 + 184);
    swift_retain_n();
    uint64_t v27 = sub_24962BF20();
    os_log_type_t v28 = sub_24962C3F0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v52[0] = v48;
      *(_DWORD *)uint64_t v29 = 136315394;
      sub_24962BE40();
      sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
      uint64_t v30 = sub_24962C6B0();
      *(void *)(v0 + 1264) = sub_2495F74C8(v30, v31, v52);
      sub_24962C490();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      unint64_t v32 = sub_2495FD4EC();
      *(void *)(v0 + 1272) = sub_2495F74C8(v32, v33, v52);
      sub_24962C490();
      swift_bridgeObjectRelease();
      sub_24960C4C8(v50);
      _os_log_impl(&dword_2495EB000, v27, v28, "[%s] Auth Response: %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v48, -1, -1);
      MEMORY[0x24C5A5090](v29, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_24960C4C8(v50);
    }

    *(void *)(v0 + 1448) = swift_task_alloc();
    v51();
    sub_2495FD4EC();
    sub_24962BB60();
    swift_bridgeObjectRelease();
    swift_retain_n();
    uint64_t v34 = sub_24962BF20();
    os_log_type_t v35 = sub_24962C3F0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v52[0] = v37;
      *(_DWORD *)uint64_t v36 = 136315394;
      sub_24962BE40();
      sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
      uint64_t v38 = sub_24962C6B0();
      *(void *)(v0 + 1240) = sub_2495F74C8(v38, v39, v52);
      sub_24962C490();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      swift_beginAccess();
      sub_24960D964(&qword_2696C50C8, MEMORY[0x270FA7D40]);
      uint64_t v40 = sub_24962C6B0();
      *(void *)(v0 + 1256) = sub_2495F74C8(v40, v41, v52);
      sub_24962C490();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2495EB000, v34, v35, "[%s] %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v37, -1, -1);
      MEMORY[0x24C5A5090](v36, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t v42 = v49[4];
    uint64_t v43 = v49[5];
    __swift_project_boxed_opaque_existential_1(v49 + 1, v42);
    swift_beginAccess();
    uint64_t v44 = swift_task_alloc();
    *(void *)(v0 + 1456) = v44;
    v51();
    uint64_t v45 = (void *)swift_task_alloc();
    *(void *)(v0 + 1464) = v45;
    *uint64_t v45 = v0;
    v45[1] = sub_249609128;
    return sub_2495ECB64(v44, v42, v43);
  }
}

uint64_t sub_249609128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  uint64_t v6 = (void *)*v4;
  v6[184] = a1;
  v6[185] = a2;
  v6[186] = a3;
  v6[187] = v3;
  swift_task_dealloc();
  uint64_t v7 = v5[182];
  uint64_t v8 = v5[180];
  uint64_t v9 = v5[179];
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  uint64_t v11 = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v3)
  {
    v6[190] = v10;
    v6[191] = v11;
    v10(v7, v9);
    uint64_t v12 = sub_2496099CC;
  }
  else
  {
    v6[188] = v10;
    v6[189] = v11;
    v10(v7, v9);
    swift_task_dealloc();
    uint64_t v12 = sub_2496092E0;
  }
  return MEMORY[0x270FA2498](v12, 0, 0);
}

uint64_t sub_2496092E0()
{
  uint64_t v66 = v0;
  uint64_t v62 = v0 + 832;
  uint64_t v64 = v0 + 352;
  uint64_t v60 = v0 + 880;
  uint64_t v1 = *(void **)(v0 + 1488);
  swift_retain_n();
  id v2 = v1;
  uint64_t v3 = sub_24962BF20();
  os_log_type_t v4 = sub_24962C3F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void **)(v0 + 1488);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v57 = (void *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v65 = v59;
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_24962BE40();
    sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
    uint64_t v7 = sub_24962C6B0();
    *(void *)(v0 + 1224) = sub_2495F74C8(v7, v8, &v65);
    sub_24962C490();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    *(void *)(v0 + 1232) = v5;
    id v9 = v5;
    sub_24962C490();
    *uint64_t v57 = v5;

    _os_log_impl(&dword_2495EB000, v3, v4, "[%s] %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v57, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v59, -1, -1);
    MEMORY[0x24C5A5090](v6, -1, -1);
  }
  else
  {
    uint64_t v10 = *(void **)(v0 + 1488);

    swift_release_n();
  }
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (!v11) {
    goto LABEL_9;
  }
  uint64_t v12 = (void *)v11;
  id v13 = *(id *)(v0 + 1488);
  if (objc_msgSend(v12, sel_statusCode) != (id)200)
  {

LABEL_9:
    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 1504);
    long long v23 = *(void **)(v0 + 1488);
    unint64_t v24 = *(void *)(v0 + 1480);
    uint64_t v25 = *(void *)(v0 + 1472);
    uint64_t v26 = *(void *)(v0 + 1448);
    uint64_t v56 = *(void *)(v0 + 1432);
    uint64_t v27 = *(void **)(v0 + 1400);
    unint64_t v28 = *(void *)(v0 + 1376);
    uint64_t v29 = *(void *)(v0 + 1368);
    sub_24960C1A8();
    swift_allocError();
    *uint64_t v30 = 2;
    swift_willThrow();
    sub_2495F7470(v25, v24);
    sub_24960C51C(v60, (uint64_t (*)(uint64_t, uint64_t))sub_2495F8F84);
    sub_24960C51C(v62, (uint64_t (*)(uint64_t, uint64_t))sub_2495F7470);

    sub_2495F8F84(v29, v28);
    sub_24960C4C8(v64);
    uint64_t v22 = v26;
    goto LABEL_10;
  }
  uint64_t v14 = *(void *)(v0 + 1496);
  sub_249609AE0(*(void *)(v0 + 1472), *(void *)(v0 + 1480), v12, (uint64_t *)(v0 + 1024));
  uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 1504);
  uint64_t v15 = *(void **)(v0 + 1488);
  unint64_t v16 = *(void *)(v0 + 1480);
  uint64_t v17 = *(void *)(v0 + 1472);
  uint64_t v18 = *(void *)(v0 + 1448);
  uint64_t v56 = *(void *)(v0 + 1432);
  if (v14)
  {
    int64_t v19 = *(void **)(v0 + 1400);
    unint64_t v20 = *(void *)(v0 + 1376);
    uint64_t v21 = *(void *)(v0 + 1368);
    sub_24960C4C8(v64);
    sub_2495F8F84(v21, v20);

    sub_2495F7470(v17, v16);
    sub_24960C51C(v62, (uint64_t (*)(uint64_t, uint64_t))sub_2495F7470);
    sub_24960C51C(v60, (uint64_t (*)(uint64_t, uint64_t))sub_2495F8F84);
    uint64_t v22 = v18;
LABEL_10:
    v58(v22, v56);
    swift_task_dealloc();
    unint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_11;
  }
  uint64_t v63 = *(void *)(v0 + 1424);
  unint64_t v52 = *(void *)(v0 + 1376);
  uint64_t v50 = *(void **)(v0 + 1400);
  uint64_t v51 = *(void *)(v0 + 1368);
  uint64_t v61 = *(void *)(v0 + 1336);
  uint64_t v54 = *(void *)(v0 + 1328);
  uint64_t v55 = *(void *)(v0 + 1416);
  unint64_t v33 = *(char **)(v0 + 1304);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 1024), *(void *)(v0 + 1048));
  uint64_t v34 = sub_24962BF70();
  uint64_t v48 = v35;
  uint64_t v49 = v34;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 1024), *(void *)(v0 + 1048));
  uint64_t v36 = sub_24962BE10();
  uint64_t v53 = v18;
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = swift_task_alloc();
  sub_24962BF80();

  sub_2495F7470(v17, v16);
  sub_2495F8F84(v51, v52);
  sub_24960C4C8(v64);
  *(void *)unint64_t v33 = v49;
  *((void *)v33 + 1) = v48;
  unint64_t v39 = (int *)type metadata accessor for GBAResult(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(&v33[v39[5]], v38, v36);
  uint64_t v40 = &v33[v39[6]];
  long long v42 = *(_OWORD *)(v0 + 992);
  long long v41 = *(_OWORD *)(v0 + 1008);
  *(_OWORD *)uint64_t v40 = *(_OWORD *)(v0 + 976);
  *((_OWORD *)v40 + 1) = v42;
  *((_OWORD *)v40 + 2) = v41;
  uint64_t v43 = &v33[v39[7]];
  long long v45 = *(_OWORD *)(v0 + 752);
  long long v44 = *(_OWORD *)(v0 + 768);
  *(_OWORD *)uint64_t v43 = *(_OWORD *)(v0 + 736);
  *((_OWORD *)v43 + 1) = v45;
  *((_OWORD *)v43 + 2) = v44;
  uint64_t v46 = &v33[v39[8]];
  *(void *)uint64_t v46 = v55;
  *((void *)v46 + 1) = v63;
  char v47 = &v33[v39[9]];
  *(void *)char v47 = v54;
  *((void *)v47 + 1) = v61;
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1(v0 + 1024);
  v58(v53, v56);
  swift_task_dealloc();
  unint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
LABEL_11:
  return v31();
}

uint64_t sub_249609940()
{
  unint64_t v1 = v0[172];
  uint64_t v2 = v0[171];
  sub_24960C51C((uint64_t)(v0 + 110), (uint64_t (*)(uint64_t, uint64_t))sub_2495F8F84);
  sub_2495F8F84(v2, v1);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2496099CC()
{
  unint64_t v1 = (void (*)(uint64_t, uint64_t))v0[190];
  uint64_t v2 = v0[181];
  uint64_t v3 = v0[179];
  os_log_type_t v4 = (void *)v0[175];
  unint64_t v5 = v0[172];
  uint64_t v6 = v0[171];
  sub_24960C51C((uint64_t)(v0 + 110), (uint64_t (*)(uint64_t, uint64_t))sub_2495F8F84);
  sub_24960C51C((uint64_t)(v0 + 104), (uint64_t (*)(uint64_t, uint64_t))sub_2495F7470);

  sub_2495F8F84(v6, v5);
  sub_24960C4C8((uint64_t)(v0 + 44));
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_249609AE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5 = v4;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a1) - a1;
      if (!__OFSUB__(HIDWORD(a1), a1))
      {
        uint64_t v10 = (int)v10;
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_26;
    case 2uLL:
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(a1 + 24);
      BOOL v13 = __OFSUB__(v11, v12);
      uint64_t v10 = v11 - v12;
      if (!v13) {
        goto LABEL_6;
      }
LABEL_26:
      __break(1u);
      goto LABEL_27;
    case 3uLL:
      goto LABEL_11;
    default:
      uint64_t v10 = BYTE6(a2);
LABEL_6:
      if (v10 < 1)
      {
LABEL_11:
        sub_24960C1A8();
        swift_allocError();
        char v20 = 6;
LABEL_20:
        *int64_t v19 = v20;
        return swift_willThrow();
      }
      uint64_t v14 = (void *)sub_24962C0C0();
      id v15 = objc_msgSend(a3, sel_valueForHTTPHeaderField_, v14);

      if (!v15) {
        goto LABEL_19;
      }
      uint64_t v16 = sub_24962C0F0();
      uint64_t v18 = v17;

      if (v16 != 0xD00000000000001CLL || v18 != 0x800000024962D6D0)
      {
        char v21 = sub_24962C6C0();
        swift_bridgeObjectRelease();
        if (v21) {
          goto LABEL_13;
        }
LABEL_19:
        sub_24960C1A8();
        swift_allocError();
        char v20 = 7;
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
LABEL_13:
      if (qword_2696C49D0 != -1) {
LABEL_27:
      }
        swift_once();
      uint64_t v22 = sub_24962BF40();
      __swift_project_value_buffer(v22, (uint64_t)qword_2696C5000);
      swift_retain();
      sub_2495F7E7C(a1, a2);
      swift_retain();
      sub_2495F7E7C(a1, a2);
      long long v23 = sub_24962BF20();
      os_log_type_t v24 = sub_24962C3F0();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        v38[0] = v37;
        *(_DWORD *)uint64_t v25 = 136315394;
        os_log_type_t v36 = v24;
        sub_24962BE40();
        sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
        uint64_t v26 = sub_24962C6B0();
        uint64_t v39 = sub_2495F74C8(v26, v27, v38);
        sub_24962C490();
        uint64_t v5 = v4;
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v25 + 12) = 2080;
        uint64_t v28 = sub_24962C130();
        MEMORY[0x270FA5388](v28 - 8, v29);
        sub_24962C120();
        uint64_t v30 = sub_24962C100();
        if (v31)
        {
          unint64_t v32 = v31;
        }
        else
        {
          uint64_t v30 = 0;
          unint64_t v32 = 0xE000000000000000;
        }
        uint64_t v39 = sub_2495F74C8(v30, v32, v38);
        sub_24962C490();
        swift_bridgeObjectRelease();
        sub_2495F7470(a1, a2);
        sub_2495F7470(a1, a2);
        _os_log_impl(&dword_2495EB000, v23, v36, "[%s] %s", (uint8_t *)v25, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24C5A5090](v37, -1, -1);
        MEMORY[0x24C5A5090](v25, -1, -1);
      }
      else
      {
        swift_release_n();
        sub_2495F7470(a1, a2);
        sub_2495F7470(a1, a2);
      }

      uint64_t v34 = sub_24962BF10();
      swift_allocObject();
      uint64_t v35 = sub_24962BF00();
      v38[3] = v34;
      v38[4] = (uint64_t)&off_26FD38D48;
      v38[0] = v35;
      __swift_project_boxed_opaque_existential_1(v38, v34);
      a4[3] = sub_24962BF90();
      a4[4] = (uint64_t)&off_26FD38D30;
      __swift_allocate_boxed_opaque_existential_1(a4);
      sub_24960D964(&qword_2696C50A8, MEMORY[0x270FB0548]);
      sub_24962BEF0();
      if (v5) {
        __swift_deallocate_boxed_opaque_existential_1((uint64_t)a4);
      }
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
}

uint64_t sub_24960A024(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](sub_24960A0B4, 0, 0);
}

uint64_t sub_24960A0B4()
{
  unint64_t v31 = v0;
  v30[1] = *MEMORY[0x263EF8340];
  id v1 = sub_24960BF44();
  v0[10] = 0;
  v0[18] = v1;
  id v2 = objc_msgSend(v1, sel_getDescriptorsForDomain_error_, 1, v0 + 10);
  v0[19] = v2;
  uint64_t v3 = (void *)v0[10];
  if (v2)
  {
    uint64_t v4 = v2;
    id v5 = v3;
    id v6 = objc_msgSend(v4, sel_descriptors);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = v0[17];
      sub_24960C1FC(0, &qword_2696C5078);
      unint64_t v9 = sub_24962C2A0();

      swift_retain();
      id v10 = sub_24960B980(v9, v8);
      v0[20] = v10;
      swift_bridgeObjectRelease();
      swift_release();
      if (v10)
      {
        if (qword_2696C49D0 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_24962BF40();
        __swift_project_value_buffer(v11, (uint64_t)qword_2696C5000);
        swift_retain_n();
        uint64_t v12 = sub_24962BF20();
        os_log_type_t v13 = sub_24962C3E0();
        BOOL v14 = os_log_type_enabled(v12, v13);
        uint64_t v15 = v0[17];
        if (v14)
        {
          uint64_t v16 = swift_slowAlloc();
          uint64_t v29 = swift_slowAlloc();
          v30[0] = v29;
          *(_DWORD *)uint64_t v16 = 136315394;
          sub_24962BE40();
          sub_24960D964(&qword_2696C5080, MEMORY[0x270FA9688]);
          uint64_t v17 = sub_24962C6B0();
          v0[10] = sub_2495F74C8(v17, v18, v30);
          sub_24962C490();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v16 + 12) = 2080;
          if (*(unsigned char *)(v15 + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_configuration)) {
            uint64_t v19 = 7305076;
          }
          else {
            uint64_t v19 = 6647407;
          }
          v0[10] = sub_2495F74C8(v19, 0xE300000000000000, v30);
          sub_24962C490();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2495EB000, v12, v13, "[%s] Performing AKA authentication for subscriptionID %s", (uint8_t *)v16, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24C5A5090](v29, -1, -1);
          MEMORY[0x24C5A5090](v16, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02CF8]), sel_init);
        v0[21] = v24;
        uint64_t v25 = (void *)sub_24962BDB0();
        objc_msgSend(v24, sel_setRand_, v25);

        uint64_t v26 = (void *)sub_24962BDB0();
        objc_msgSend(v24, sel_setAutn_, v26);

        id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02D08]), sel_init);
        v0[22] = v27;
        objc_msgSend(v27, sel_setAlgorithm_, v24);
        v0[2] = v0;
        v0[7] = v0 + 15;
        v0[3] = sub_24960A620;
        uint64_t v28 = swift_continuation_init();
        v0[10] = MEMORY[0x263EF8330];
        v0[11] = 0x40000000;
        v0[12] = sub_249600410;
        v0[13] = &block_descriptor_0;
        v0[14] = v28;
        objc_msgSend(v1, sel_authenticate_request_completion_, v10, v27, v0 + 10);
        return MEMORY[0x270FA23F0](v0 + 2);
      }
    }
    sub_24960C1A8();
    swift_allocError();
    *char v20 = 5;
    swift_willThrow();
  }
  else
  {
    id v21 = v3;
    sub_24962BC80();

    swift_willThrow();
  }

  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_24960A620()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    id v2 = sub_24960A818;
  }
  else {
    id v2 = sub_24960A75C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24960A75C()
{
  uint64_t v1 = *(void **)(v0 + 168);
  uint64_t v3 = *(void **)(v0 + 152);
  id v2 = *(void **)(v0 + 160);
  uint64_t v4 = *(void **)(v0 + 144);

  uint64_t v5 = *(void *)(v0 + 120);
  id v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v5);
}

uint64_t sub_24960A818()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v3 = (void *)v0[20];
  id v2 = (void *)v0[21];
  uint64_t v5 = (void *)v0[18];
  uint64_t v4 = (void *)v0[19];
  swift_willThrow();

  id v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24960A8DC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_id;
  uint64_t v2 = sub_24962BE40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24960C6E8(v0 + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_configuration);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_factory);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24960A99C()
{
  return type metadata accessor for HTTPGBAAuthenticator(0);
}

uint64_t type metadata accessor for HTTPGBAAuthenticator(uint64_t a1)
{
  return sub_2495F92A8(a1, (uint64_t *)&unk_2696C5028);
}

uint64_t sub_24960A9C4()
{
  uint64_t result = sub_24962BE40();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t destroy for HTTPGBAAuthenticator.Configuration(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTTPGBAAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTTPGBAAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v4;
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  return a1;
}

__n128 __swift_memcpy74_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 58) = *(_OWORD *)(a2 + 58);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HTTPGBAAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPGBAAuthenticator.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 74)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPGBAAuthenticator.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 74) = 1;
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
    *(unsigned char *)(result + 74) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPGBAAuthenticator.Configuration()
{
  return &type metadata for HTTPGBAAuthenticator.Configuration;
}

uint64_t type metadata accessor for GBAResult(uint64_t a1)
{
  return sub_2495F92A8(a1, (uint64_t *)&unk_2696C50F8);
}

uint64_t sub_24960ACFC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24962C210();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x24C5A4440](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_24960AD78(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)unint64_t v1 = xmmword_249630910;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_24962BBC0() && __OFSUB__((int)v4, sub_24962BBF0())) {
        goto LABEL_24;
      }
      sub_24962BC00();
      swift_allocObject();
      uint64_t v13 = sub_24962BBA0();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      __n128 result = sub_24960B164((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_24962BD50();
      __n128 result = sub_24960B164(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      __n128 result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      __n128 result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        __n128 result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_24960B07C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    __n128 result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    __n128 result = (unsigned char *)sub_24960B55C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    __n128 result = (unsigned char *)sub_24960B620((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    __n128 result = (unsigned char *)sub_24960B69C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_24960B0F4(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    __n128 result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  __n128 result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_24960B164(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  __n128 result = (char *)sub_24962BBC0();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  __n128 result = (char *)sub_24962BBF0();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_24962BBE0();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  __n128 result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_24960B218@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    __n128 result = sub_24962C530();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      __n128 result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24960B2A4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_24962BBC0();
  if (!result || (uint64_t result = sub_24962BBF0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_24962BBE0();
      return sub_24962BD90();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24960B338(uint64_t a1, unint64_t a2)
{
  v10[5] = *MEMORY[0x263EF8340];
  v10[3] = MEMORY[0x263F06F70];
  v10[4] = MEMORY[0x263F06F60];
  v10[0] = a1;
  v10[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v10, MEMORY[0x263F06F70]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5) {
        __break(1u);
      }
      sub_2495F7E7C(a1, a2);
      sub_2495F7E7C(v5, v6);
      sub_24960B2A4((int)v5, v5 >> 32);
      sub_2495F7470(v5, v6);
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(v5 + 16);
      uint64_t v8 = *(void *)(v5 + 24);
      sub_2495F7E7C(a1, a2);
      swift_retain();
      swift_retain();
      sub_24960B2A4(v7, v8);
      swift_release();
      swift_release();
      break;
    default:
      sub_2495F7E7C(a1, a2);
      sub_24962BD90();
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t sub_24960B55C(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_24960B620(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24962BC00();
  swift_allocObject();
  uint64_t result = sub_24962BBB0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24962BD70();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_24960B69C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24962BC00();
  swift_allocObject();
  uint64_t result = sub_24962BBB0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_24960B720(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_24960B55C(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_24960B620((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_24960B69C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_24960B784(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_24962BC00();
      swift_allocObject();
      sub_24962BBD0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_24962BD70();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_24960B824(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5050);
  unint64_t v10 = sub_24960BE68();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  char v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_24960B07C(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_24960B8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GBAResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24960B924(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GBAResult(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_24960B980(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24962C5D0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_configuration);
      uint64_t v5 = 4;
      do
      {
        a2 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)MEMORY[0x24C5A47A0](v5 - 4, a1);
          uint64_t v7 = v5 - 3;
          if (__OFADD__(a2, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * v5);
          uint64_t v7 = v5 - 3;
          if (__OFADD__(a2, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        id v8 = v6;
        if (objc_msgSend(v8, sel_domain) == (id)1)
        {
          id v9 = objc_msgSend(v8, sel_instance);
          id v10 = objc_msgSend(v9, sel_integerValue);

          if (v10 == (id)1)
          {
            if ((v12 & 1) == 0) {
              goto LABEL_17;
            }
          }
          else if (v10 == (id)2 && v12)
          {
LABEL_17:
            swift_bridgeObjectRelease();
            return v8;
          }
        }
        else
        {
        }
        ++v5;
      }
      while (v7 != v4);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_24960BB24@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v3 = a2 >> 62;
  unint64_t v4 = 0xF000000000000000;
  unsigned __int8 v5 = BYTE6(a2);
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t result = 0;
  unint64_t v12 = 0;
  switch(v3)
  {
    case 1uLL:
      LODWORD(v13) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_33;
      }
      uint64_t v13 = (int)v13;
LABEL_6:
      if (v13 >= 32)
      {
        if (v3)
        {
          if (v3 == 1)
          {
            uint64_t v17 = (int)a1;
            uint64_t v18 = a1 >> 32;
          }
          else
          {
            uint64_t v17 = *(void *)(a1 + 16);
            uint64_t v18 = *(void *)(a1 + 24);
          }
        }
        else
        {
          uint64_t v17 = 0;
          uint64_t v18 = v5;
        }
        if (v18 < v17 || v17 > 16)
        {
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
        }
        else
        {
          uint64_t v8 = sub_24962BDA0();
          unint64_t v4 = v19;
          uint64_t v9 = sub_24962BDA0();
          uint64_t v10 = v20;
          if (!v3)
          {
            uint64_t v21 = v5;
            goto LABEL_21;
          }
          if (v3 != 1)
          {
            uint64_t v23 = *(void *)(a1 + 16);
            uint64_t v22 = *(void *)(a1 + 24);
            BOOL v16 = __OFSUB__(v22, v23);
            uint64_t v21 = v22 - v23;
            if (!v16) {
              goto LABEL_21;
            }
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
          LODWORD(v21) = HIDWORD(a1) - a1;
          if (!__OFSUB__(HIDWORD(a1), a1))
          {
            uint64_t v21 = (int)v21;
LABEL_21:
            if (v21 < 33)
            {
              uint64_t result = 0;
              unint64_t v12 = 0xF000000000000000;
              goto LABEL_31;
            }
            if (v3)
            {
              if (v3 == 1)
              {
                uint64_t v24 = (int)a1;
                uint64_t v25 = a1 >> 32;
              }
              else
              {
                uint64_t v24 = *(void *)(a1 + 16);
                uint64_t v25 = *(void *)(a1 + 24);
              }
            }
            else
            {
              uint64_t v24 = 0;
              uint64_t v25 = v5;
            }
            if (v25 >= 32 && v25 >= v24)
            {
              uint64_t result = sub_24962BDA0();
              goto LABEL_31;
            }
LABEL_37:
            __break(1u);
            JUMPOUT(0x24960BD0CLL);
          }
        }
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t result = 0;
      unint64_t v12 = 0;
LABEL_31:
      *a3 = v8;
      a3[1] = v4;
      a3[2] = v9;
      a3[3] = v10;
      a3[4] = result;
      a3[5] = v12;
      return result;
    case 2uLL:
      uint64_t v15 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(a1 + 24);
      BOOL v16 = __OFSUB__(v14, v15);
      uint64_t v13 = v14 - v15;
      if (!v16) {
        goto LABEL_6;
      }
      goto LABEL_34;
    case 3uLL:
      goto LABEL_31;
    default:
      uint64_t v13 = v5;
      goto LABEL_6;
  }
}

void sub_24960BD1C(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_res);
  if (!v4)
  {

    uint64_t v5 = 0;
LABEL_8:
    unint64_t v10 = 0;
    id v8 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = sub_24962BDD0();
  unint64_t v7 = v6;

  id v8 = objc_msgSend(a1, sel_ik);
  if (!v8)
  {

    sub_2495F7470(v5, v7);
    uint64_t v5 = 0;
    id v4 = 0;
    unint64_t v10 = 0;
LABEL_9:
    uint64_t v14 = 0;
    unint64_t v7 = 0xF000000000000000;
    goto LABEL_10;
  }
  id v4 = (id)sub_24962BDD0();
  unint64_t v10 = v9;

  id v11 = objc_msgSend(a1, sel_ck);
  if (!v11)
  {

    sub_2495F7470((uint64_t)v4, v10);
    sub_2495F7470(v5, v7);
    uint64_t v5 = 0;
    id v4 = 0;
    goto LABEL_8;
  }
  unint64_t v12 = v11;
  id v8 = (id)sub_24962BDD0();
  uint64_t v14 = v13;

LABEL_10:
  *a2 = v5;
  a2[1] = v7;
  a2[2] = (uint64_t)v4;
  a2[3] = v10;
  a2[4] = (uint64_t)v8;
  a2[5] = v14;
}

unint64_t sub_24960BE68()
{
  unint64_t result = qword_2696C5058;
  if (!qword_2696C5058)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696C5050);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5058);
  }
  return result;
}

void *sub_24960BEB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  uint64_t v12[2] = v13;
  unint64_t result = sub_24960B0F4((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24960BF24, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_24960BF24@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24960B218(a1, a2);
}

id sub_24960BF44()
{
  sub_24960C1FC(0, &qword_2696C5088);
  uint64_t v0 = sub_24962BF60();
  MEMORY[0x270FA5388](v0 - 8, v1);
  sub_24962BF50();
  uint64_t v2 = sub_24962C420();
  MEMORY[0x270FA5388](v2, v3);
  v11[1] = MEMORY[0x263F8EE78];
  sub_24960D964(&qword_2696C5090, MEMORY[0x270FCDB70]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5098);
  sub_24960C5D8(&qword_2696C50A0, &qword_2696C5098);
  sub_24962C4D0();
  uint64_t v4 = sub_24962C430();
  MEMORY[0x270FA5388](v4, v5);
  (*(void (**)(char *, void))(v7 + 104))((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  id v8 = (void *)sub_24962C440();
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02D30]), sel_initWithQueue_, v8);

  return v9;
}

unint64_t sub_24960C1A8()
{
  unint64_t result = qword_2696C5070;
  if (!qword_2696C5070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5070);
  }
  return result;
}

uint64_t sub_24960C1FC(uint64_t a1, unint64_t *a2)
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x24C5A5090);
  }
  return result;
}

uint64_t sub_24960C2F0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24960C354(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 64);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v4);
  return a1;
}

uint64_t sub_24960C3A8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24960C40C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24960C43C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24960C46C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24960C4C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24960C51C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  return a1;
}

uint64_t sub_24960C558(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t))
{
  if (a2 >> 60 != 15)
  {
    sub_2495F7470(result, a2);
    sub_2495F7470(a3, a4);
    return a7(a5, a6);
  }
  return result;
}

uint64_t sub_24960C5D8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24960C61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24960C684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GBAResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24960C6E8(uint64_t a1)
{
  return a1;
}

uint64_t destroy for HTTPAKANonce(uint64_t *a1)
{
  sub_2495F7470(*a1, a1[1]);
  uint64_t result = sub_2495F7470(a1[2], a1[3]);
  unint64_t v3 = a1[5];
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = a1[4];
    return sub_2495F7470(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for HTTPAKANonce(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2495F7E7C(*a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_2495F7E7C(v6, v7);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  id v8 = a2 + 4;
  unint64_t v9 = a2[5];
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v10 = *v8;
    sub_2495F7E7C(*v8, v9);
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v9;
  }
  return a1;
}

uint64_t *assignWithCopy for HTTPAKANonce(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2495F7E7C(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2495F7470(v6, v7);
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_2495F7E7C(v8, v9);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_2495F7470(v10, v11);
  unint64_t v12 = a2 + 4;
  unint64_t v13 = a2[5];
  if ((unint64_t)a1[5] >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *v12;
      sub_2495F7E7C(*v12, v13);
      uint64_t v16 = a1[4];
      unint64_t v17 = a1[5];
      a1[4] = v15;
      a1[5] = v13;
      sub_2495F7470(v16, v17);
      return a1;
    }
    sub_24960C8F4((uint64_t)(a1 + 4));
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 2) = *(_OWORD *)v12;
    return a1;
  }
  uint64_t v14 = *v12;
  sub_2495F7E7C(*v12, v13);
  a1[4] = v14;
  a1[5] = v13;
  return a1;
}

uint64_t sub_24960C8F4(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for HTTPAKANonce(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2495F7470(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_2495F7470(v6, v7);
  uint64_t v8 = (uint64_t *)(a2 + 32);
  unint64_t v9 = a1[5];
  if (v9 >> 60 != 15)
  {
    unint64_t v10 = *(void *)(a2 + 40);
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = a1[4];
      a1[4] = *v8;
      a1[5] = v10;
      sub_2495F7470(v11, v9);
      return a1;
    }
    sub_24960C8F4((uint64_t)(a1 + 4));
  }
  *((_OWORD *)a1 + 2) = *(_OWORD *)v8;
  return a1;
}

ValueMetadata *type metadata accessor for HTTPAKANonce()
{
  return &type metadata for HTTPAKANonce;
}

uint64_t getEnumTagSinglePayload for HTTPGBAAuthenticator.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HTTPGBAAuthenticator.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *__n128 result = a2 + 9;
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
        JUMPOUT(0x24960CB70);
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
          *__n128 result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPGBAAuthenticator.Error()
{
  return &type metadata for HTTPGBAAuthenticator.Error;
}

ValueMetadata *type metadata accessor for HTTPGBAAuthenticator.DefaultFactory()
{
  return &type metadata for HTTPGBAAuthenticator.DefaultFactory;
}

uint64_t destroy for AKAResult(uint64_t *a1)
{
  sub_2495F7470(*a1, a1[1]);
  sub_2495F7470(a1[2], a1[3]);
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  return sub_2495F7470(v2, v3);
}

uint64_t *initializeWithCopy for AKAResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2495F7E7C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_2495F7E7C(v6, v7);
  a1[2] = v6;
  a1[3] = v7;
  uint64_t v9 = a2[4];
  unint64_t v8 = a2[5];
  sub_2495F7E7C(v9, v8);
  a1[4] = v9;
  a1[5] = v8;
  return a1;
}

uint64_t *assignWithCopy for AKAResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2495F7E7C(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2495F7470(v6, v7);
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_2495F7E7C(v8, v9);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_2495F7470(v10, v11);
  uint64_t v13 = a2[4];
  unint64_t v12 = a2[5];
  sub_2495F7E7C(v13, v12);
  uint64_t v14 = a1[4];
  unint64_t v15 = a1[5];
  a1[4] = v13;
  a1[5] = v12;
  sub_2495F7470(v14, v15);
  return a1;
}

uint64_t *assignWithTake for AKAResult(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_2495F7470(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_2495F7470(v6, v7);
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_2495F7470(v8, v9);
  return a1;
}

uint64_t _s15CTLazuliSupport12HTTPAKANonceVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s15CTLazuliSupport12HTTPAKANonceVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AKAResult()
{
  return &type metadata for AKAResult;
}

uint64_t *sub_24960CE0C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24962BE10();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)v4 + v13;
    unint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13);
    unint64_t v17 = *(uint64_t *)((char *)a2 + v13 + 8);
    sub_2495F7E7C(v16, v17);
    *(void *)uint64_t v14 = v16;
    *((void *)v14 + 1) = v17;
    uint64_t v18 = v15[2];
    unint64_t v19 = v15[3];
    sub_2495F7E7C(v18, v19);
    *((void *)v14 + 2) = v18;
    *((void *)v14 + 3) = v19;
    uint64_t v20 = v15 + 4;
    unint64_t v21 = v15[5];
    if (v21 >> 60 == 15)
    {
      *((_OWORD *)v14 + 2) = *(_OWORD *)v20;
    }
    else
    {
      uint64_t v23 = *v20;
      sub_2495F7E7C(*v20, v15[5]);
      *((void *)v14 + 4) = v23;
      *((void *)v14 + 5) = v21;
    }
    uint64_t v24 = a3[7];
    uint64_t v25 = (uint64_t *)((char *)v4 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = *(uint64_t *)((char *)a2 + v24);
    unint64_t v28 = *(uint64_t *)((char *)a2 + v24 + 8);
    sub_2495F7E7C(v27, v28);
    uint64_t *v25 = v27;
    v25[1] = v28;
    uint64_t v29 = v26[2];
    unint64_t v30 = v26[3];
    sub_2495F7E7C(v29, v30);
    v25[2] = v29;
    void v25[3] = v30;
    uint64_t v31 = v26[4];
    unint64_t v32 = v26[5];
    sub_2495F7E7C(v31, v32);
    v25[4] = v31;
    v25[5] = v32;
    uint64_t v33 = a3[8];
    uint64_t v34 = a3[9];
    uint64_t v35 = (uint64_t *)((char *)v4 + v33);
    os_log_type_t v36 = (uint64_t *)((char *)a2 + v33);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    uint64_t v38 = (uint64_t *)((char *)v4 + v34);
    uint64_t v39 = (uint64_t *)((char *)a2 + v34);
    uint64_t v40 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24960CFE8(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_24962BE10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (uint64_t *)(a1 + a2[6]);
  sub_2495F7470(*v6, v6[1]);
  sub_2495F7470(v6[2], v6[3]);
  unint64_t v7 = v6[5];
  if (v7 >> 60 != 15) {
    sub_2495F7470(v6[4], v7);
  }
  uint64_t v8 = a1 + a2[7];
  sub_2495F7470(*(void *)v8, *(void *)(v8 + 8));
  sub_2495F7470(*(void *)(v8 + 16), *(void *)(v8 + 24));
  sub_2495F7470(*(void *)(v8 + 32), *(void *)(v8 + 40));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_24960D0D8(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24962BE10();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = *(void *)((char *)a2 + v12);
  unint64_t v16 = *(void *)((char *)a2 + v12 + 8);
  sub_2495F7E7C(v15, v16);
  *(void *)uint64_t v13 = v15;
  *((void *)v13 + 1) = v16;
  uint64_t v17 = v14[2];
  unint64_t v18 = v14[3];
  sub_2495F7E7C(v17, v18);
  *((void *)v13 + 2) = v17;
  *((void *)v13 + 3) = v18;
  unint64_t v19 = v14 + 4;
  unint64_t v20 = v14[5];
  if (v20 >> 60 == 15)
  {
    *((_OWORD *)v13 + 2) = *(_OWORD *)v19;
  }
  else
  {
    uint64_t v21 = *v19;
    sub_2495F7E7C(*v19, v14[5]);
    *((void *)v13 + 4) = v21;
    *((void *)v13 + 5) = v20;
  }
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = *(void *)((char *)a2 + v22);
  unint64_t v26 = *(void *)((char *)a2 + v22 + 8);
  sub_2495F7E7C(v25, v26);
  *uint64_t v23 = v25;
  v23[1] = v26;
  uint64_t v27 = v24[2];
  unint64_t v28 = v24[3];
  sub_2495F7E7C(v27, v28);
  v23[2] = v27;
  v23[3] = v28;
  uint64_t v29 = v24[4];
  unint64_t v30 = v24[5];
  sub_2495F7E7C(v29, v30);
  v23[4] = v29;
  v23[5] = v30;
  uint64_t v31 = a3[8];
  uint64_t v32 = a3[9];
  uint64_t v33 = (void *)((char *)a1 + v31);
  uint64_t v34 = (void *)((char *)a2 + v31);
  uint64_t v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  os_log_type_t v36 = (void *)((char *)a1 + v32);
  uint64_t v37 = (void *)((char *)a2 + v32);
  uint64_t v38 = v37[1];
  *os_log_type_t v36 = *v37;
  v36[1] = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_24960D264(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24962BE10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = *(void *)((char *)a2 + v10);
  unint64_t v14 = *(void *)((char *)a2 + v10 + 8);
  sub_2495F7E7C(v13, v14);
  uint64_t v15 = *v11;
  unint64_t v16 = v11[1];
  uint64_t *v11 = v13;
  v11[1] = v14;
  sub_2495F7470(v15, v16);
  uint64_t v17 = v12[2];
  unint64_t v18 = v12[3];
  sub_2495F7E7C(v17, v18);
  uint64_t v19 = v11[2];
  unint64_t v20 = v11[3];
  void v11[2] = v17;
  void v11[3] = v18;
  sub_2495F7470(v19, v20);
  uint64_t v21 = v12 + 4;
  unint64_t v22 = v12[5];
  if ((unint64_t)v11[5] >> 60 != 15)
  {
    if (v22 >> 60 != 15)
    {
      uint64_t v24 = *v21;
      sub_2495F7E7C(*v21, v12[5]);
      uint64_t v25 = v11[4];
      unint64_t v26 = v11[5];
      v11[4] = v24;
      v11[5] = v22;
      sub_2495F7470(v25, v26);
      goto LABEL_8;
    }
    sub_24960C8F4((uint64_t)(v11 + 4));
    goto LABEL_6;
  }
  if (v22 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)v11 + 2) = *(_OWORD *)v21;
    goto LABEL_8;
  }
  uint64_t v23 = *v21;
  sub_2495F7E7C(*v21, v12[5]);
  v11[4] = v23;
  v11[5] = v22;
LABEL_8:
  uint64_t v27 = a3[7];
  unint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = *(void *)((char *)a2 + v27);
  unint64_t v31 = *(void *)((char *)a2 + v27 + 8);
  sub_2495F7E7C(v30, v31);
  uint64_t v32 = *v28;
  unint64_t v33 = v28[1];
  *unint64_t v28 = v30;
  v28[1] = v31;
  sub_2495F7470(v32, v33);
  uint64_t v34 = v29[2];
  unint64_t v35 = v29[3];
  sub_2495F7E7C(v34, v35);
  uint64_t v36 = v28[2];
  unint64_t v37 = v28[3];
  void v28[2] = v34;
  v28[3] = v35;
  sub_2495F7470(v36, v37);
  uint64_t v38 = v29[4];
  unint64_t v39 = v29[5];
  sub_2495F7E7C(v38, v39);
  uint64_t v40 = v28[4];
  unint64_t v41 = v28[5];
  v28[4] = v38;
  v28[5] = v39;
  sub_2495F7470(v40, v41);
  uint64_t v42 = a3[8];
  uint64_t v43 = (void *)((char *)a1 + v42);
  long long v44 = (void *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[9];
  uint64_t v46 = (void *)((char *)a1 + v45);
  char v47 = (void *)((char *)a2 + v45);
  *uint64_t v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_24960D488(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24962BE10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (_OWORD *)((char *)a1 + v10);
  uint64_t v13 = (_OWORD *)((char *)a2 + v10);
  long long v14 = v13[2];
  long long v15 = *v13;
  v12[1] = v13[1];
  uint64_t v12[2] = v14;
  *uint64_t v12 = v15;
  unint64_t v16 = (_OWORD *)((char *)a1 + v11);
  uint64_t v17 = (_OWORD *)((char *)a2 + v11);
  long long v18 = v17[2];
  long long v19 = *v17;
  v16[1] = v17[1];
  v16[2] = v18;
  *unint64_t v16 = v19;
  uint64_t v20 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v20) = *(_OWORD *)((char *)a2 + v20);
  return a1;
}

void *sub_24960D55C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24962BE10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)((char *)a1 + v11);
  unint64_t v15 = *(void *)((char *)a1 + v11 + 8);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  sub_2495F7470(v14, v15);
  uint64_t v16 = v12[2];
  unint64_t v17 = v12[3];
  *((_OWORD *)v12 + 1) = *((_OWORD *)v13 + 1);
  sub_2495F7470(v16, v17);
  long long v18 = v13 + 32;
  unint64_t v19 = v12[5];
  if (v19 >> 60 != 15)
  {
    unint64_t v20 = *((void *)v13 + 5);
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = v12[4];
      void v12[4] = *v18;
      v12[5] = v20;
      sub_2495F7470(v21, v19);
      goto LABEL_6;
    }
    sub_24960C8F4((uint64_t)(v12 + 4));
  }
  *((_OWORD *)v12 + 2) = *(_OWORD *)v18;
LABEL_6:
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)((char *)a1 + v22);
  unint64_t v26 = *(void *)((char *)a1 + v22 + 8);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  sub_2495F7470(v25, v26);
  uint64_t v27 = v23[2];
  unint64_t v28 = v23[3];
  *((_OWORD *)v23 + 1) = *((_OWORD *)v24 + 1);
  sub_2495F7470(v27, v28);
  uint64_t v29 = v23[4];
  unint64_t v30 = v23[5];
  *((_OWORD *)v23 + 2) = *((_OWORD *)v24 + 2);
  sub_2495F7470(v29, v30);
  uint64_t v31 = a3[8];
  uint64_t v32 = (void *)((char *)a1 + v31);
  unint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[9];
  unint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  void *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24960D6E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24960D6F8);
}

uint64_t sub_24960D6F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24962BE10();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24960D7A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24960D7BC);
}

uint64_t sub_24960D7BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24962BE10();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24960D864()
{
  uint64_t result = sub_24962BE10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24960D910()
{
  unint64_t result = qword_2696C5108;
  if (!qword_2696C5108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5108);
  }
  return result;
}

uint64_t sub_24960D964(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24960D9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5118);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5120);
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5128);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13, v15);
  unint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5130);
  sub_24962BE70();
  sub_2495FCBE4();
  sub_24960DCE0();
  sub_24962C090();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_24960DD3C((uint64_t)v12);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
    swift_getKeyPath();
    sub_24962BE80();
    swift_release();
    uint64_t v18 = MEMORY[0x24C5A43B0](v20, v21, v22, v23);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    sub_24962BE80();
    swift_release();
    MEMORY[0x24C5A43B0](v20, v21, v22, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  return v18;
}

unint64_t sub_24960DCE0()
{
  unint64_t result = qword_2696C5138;
  if (!qword_2696C5138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696C5118);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5138);
  }
  return result;
}

uint64_t sub_24960DD3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5120);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24960DD9C(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6567412D72657355;
      break;
    case 2:
    case 3:
      unint64_t result = 0x2D746E65746E6F43;
      break;
    case 4:
      unint64_t result = 0x7A69726F68747541;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 1953722184;
      break;
    case 7:
      unint64_t result = 0x66412D7972746552;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24960DEC0(char *a1, char *a2)
{
  return sub_249611900(*a1, *a2);
}

uint64_t sub_24960DECC()
{
  return sub_249611D34();
}

uint64_t sub_24960DED8()
{
  return sub_249611BDC();
}

uint64_t sub_24960DEE0()
{
  return sub_249611D34();
}

uint64_t sub_24960DEE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24960E130();
  *a1 = result;
  return result;
}

unint64_t sub_24960DF18@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24960DD9C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for HTTPHeader(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HTTPHeader(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24960E0A0);
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

ValueMetadata *type metadata accessor for HTTPHeader()
{
  return &type metadata for HTTPHeader;
}

unint64_t sub_24960E0DC()
{
  unint64_t result = qword_2696C5140;
  if (!qword_2696C5140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5140);
  }
  return result;
}

uint64_t sub_24960E130()
{
  unint64_t v0 = sub_24962C630();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t sub_24960E17C()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C5148);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696C5148);
  return sub_24962BF30();
}

unint64_t sub_24960E1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24962C520();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  unint64_t result = 0xD000000000000026;
  if (a4)
  {
    sub_24962C1B0();
    sub_24962C1B0();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    return 0xD000000000000026;
  }
  return result;
}

unint64_t sub_24960E300()
{
  return sub_24960E1EC(*v0, v0[1], v0[2], v0[3]);
}

uint64_t sub_24960E30C()
{
  sub_24962C520();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "Content-Type: ");
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t sub_24960E3A0()
{
  unint64_t v1 = *(void *)(v0 + 32);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24962C5D0();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    uint64_t v2 = 757926413;
    unint64_t v3 = 0xE400000000000000;
    goto LABEL_6;
  }
  uint64_t v2 = 11565;
  unint64_t v3 = 0xE200000000000000;
LABEL_6:
  unint64_t v6 = v2;
  unint64_t v7 = v3;
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24960E488(v6, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24960E488(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_249604354(a1, a2);
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  uint64_t v10 = 0;
  switch(v7 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(v6) - v6;
      if (__OFSUB__(HIDWORD(v6), v6))
      {
        __break(1u);
LABEL_14:
        __break(1u);
        JUMPOUT(0x24960E5E0);
      }
      uint64_t v10 = (int)v10;
LABEL_6:
      uint64_t v14 = *(void *)(v3 + 40);
      BOOL v13 = __OFADD__(v14, v10);
      uint64_t v15 = v14 + v10;
      if (v13)
      {
        __break(1u);
      }
      else
      {
        *(void *)(v3 + 40) = v15;
        id v16 = objc_allocWithZone(MEMORY[0x263EFF948]);
        unint64_t v17 = (void *)sub_24962BDB0();
        objc_msgSend(v16, sel_initWithData_, v17);

        MEMORY[0x24C5A44F0]();
        if (*(void *)((*(void *)(v3 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*(void *)(v3 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                          + 0x18) >> 1)
          goto LABEL_8;
      }
      sub_24962C2C0();
LABEL_8:
      sub_24962C2D0();
      sub_24962C2B0();
      return sub_2495F7470(v8, v9);
    case 2uLL:
      uint64_t v12 = *(void *)(v6 + 16);
      uint64_t v11 = *(void *)(v6 + 24);
      BOOL v13 = __OFSUB__(v11, v12);
      uint64_t v10 = v11 - v12;
      if (!v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v10 = BYTE6(v7);
      goto LABEL_6;
  }
}

uint64_t sub_24960E5F0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  unint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    unint64_t v21 = MEMORY[0x263F8EE78];
    sub_2495F7AB8(0, v1, 0);
    uint64_t v4 = a1 + 32;
    unint64_t v2 = v21;
    do
    {
      sub_2495F07A0(v4, (uint64_t)&v17);
      uint64_t v5 = v19;
      uint64_t v6 = v20;
      __swift_project_boxed_opaque_existential_1(&v17, v19);
      uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      uint64_t v9 = v8;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2495F7AB8(0, *(void *)(v2 + 16) + 1, 1);
        unint64_t v2 = v21;
      }
      unint64_t v11 = *(void *)(v2 + 16);
      unint64_t v10 = *(void *)(v2 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_2495F7AB8(v10 > 1, v11 + 1, 1);
        unint64_t v2 = v21;
      }
      *(void *)(v2 + 16) = v11 + 1;
      unint64_t v12 = v2 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  unint64_t v17 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D68);
  sub_24960C5D8((unint64_t *)&qword_2696C4D70, &qword_2696C4D68);
  uint64_t v13 = sub_24962C0B0();
  unint64_t v15 = v14;
  swift_bridgeObjectRelease();
  unint64_t v17 = v13;
  unint64_t v18 = v15;
  sub_24962C1B0();
  sub_24960E488(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24960E7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24960E3A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5180);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_249630870;
  *(void *)(inited + 56) = &type metadata for HTTPMultipartFormDataBuilder.ContentDisposition;
  *(void *)(inited + 64) = &off_26FD38AA0;
  uint64_t v6 = (void *)swift_allocObject();
  *(void *)(inited + 32) = v6;
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = 0;
  v6[5] = 0;
  *(void *)(inited + 96) = &type metadata for HTTPMultipartFormDataBuilder.ContentType;
  *(void *)(inited + 104) = &off_26FD38A90;
  *(void *)(inited + 72) = 0x616C702F74786574;
  *(void *)(inited + 80) = 0xEA00000000006E69;
  swift_bridgeObjectRetain();
  sub_24960E5F0(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5188);
  swift_arrayDestroy();
  unint64_t v7 = sub_24962BE20();
  sub_24960E488(v7, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24960E8EC(uint8_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v150 = (void *)a4;
  uint64_t v145 = a3;
  uint64_t v7 = sub_24962BC40();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  unint64_t v11 = (char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5170);
  uint64_t inited = swift_initStackObject();
  long long v144 = xmmword_249630870;
  *(_OWORD *)(inited + 16) = xmmword_249630870;
  uint64_t v13 = (void *)*MEMORY[0x263EFF680];
  *(void *)(inited + 32) = *MEMORY[0x263EFF680];
  unint64_t v14 = (void *)*MEMORY[0x263EFF600];
  *(void *)(inited + 40) = *MEMORY[0x263EFF600];
  id v15 = v13;
  id v16 = v14;
  sub_249610348(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_24962BCA0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v4)
  {
    uint64_t v136 = a2;
    unint64_t v147 = a1;
    uint64_t v137 = 0;
    unint64_t v149 = v11;
    uint64_t v140 = v8;
    uint64_t v141 = v7;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    uint64_t v139 = &v130;
    uint64_t v19 = *(void *)(*(void *)(v18 - 8) + 64);
    MEMORY[0x270FA5388](v18 - 8, v20);
    unint64_t v21 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v148 = (uint64_t)&v130 - v21;
    uint64_t v22 = sub_24962BEE0();
    uint64_t v143 = &v130;
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v24 = *(void *)(v23 + 64);
    uint64_t v26 = MEMORY[0x270FA5388](v22, v25);
    unint64_t v27 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v28 = (uint8_t **)((char *)&v130 - v27);
    uint64_t v142 = &v130;
    MEMORY[0x270FA5388](v26, v29);
    uint64_t v138 = (char *)v21;
    unint64_t v30 = (char *)&v130 - v21;
    sub_249601AB0((uint64_t)v150, (uint64_t)&v130 - v21);
    uint64_t v31 = *(char **)(v23 + 48);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v31)((char *)&v130 - v21, 1, v22) == 1)
    {
      uint64_t v135 = v23;
      uint64_t v32 = sub_249610578((uint64_t)v30);
      uint64_t v34 = MEMORY[0x270FA5388](v32, v33);
      uint64_t v35 = (void (*)(uint64_t, uint8_t **, uint64_t))((char *)&v130 - v27);
      MEMORY[0x270FA5388](v34, v36);
      unint64_t v37 = (char *)((char *)&v130 - v138);
      sub_24962BC20();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v31)(v37, 1, v22) == 1)
      {
        sub_249610578((uint64_t)v37);
        uint64_t v23 = v135;
        uint64_t v38 = v148;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v135 + 56))(v148, 1, 1, v22);
        unint64_t v39 = 0x2696C4000;
      }
      else
      {
        uint64_t v143 = &v130;
        uint64_t v138 = v31;
        v150 = (void *)(v23 + 48);
        uint64_t v23 = v135;
        uint64_t v142 = *(uint8_t ***)(v135 + 32);
        ((void (*)(void, char *, uint64_t))v142)(v35, v37, v22);
        if (qword_2696C49D8 != -1) {
          swift_once();
        }
        uint64_t v53 = sub_24962BF40();
        uint64_t v54 = __swift_project_value_buffer(v53, (uint64_t)qword_2696C5148);
        unint64_t v134 = &v130;
        MEMORY[0x270FA5388](v54, v55);
        uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
        uint64_t v133 = v35;
        v56((char *)&v130 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)v35, v22);
        uint64_t v57 = sub_24962BF20();
        os_log_type_t v58 = sub_24962C3E0();
        if (os_log_type_enabled(v57, v58))
        {
          uint64_t v59 = (uint8_t *)swift_slowAlloc();
          uint64_t v132 = (void *)swift_slowAlloc();
          uint64_t v152 = v132;
          *(_DWORD *)uint64_t v59 = 136315138;
          uint64_t v131 = (uint64_t)(v59 + 4);
          sub_24961066C(&qword_2696C5190, MEMORY[0x270FCDEA8]);
          uint64_t v60 = sub_24962C6B0();
          uint64_t v151 = sub_2495F74C8(v60, v61, (uint64_t *)&v152);
          uint64_t v23 = v135;
          sub_24962C490();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v23 + 8))((char *)&v130 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
          _os_log_impl(&dword_2495EB000, v57, v58, "Using deduced content type: %s", v59, 0xCu);
          uint64_t v62 = v132;
          swift_arrayDestroy();
          MEMORY[0x24C5A5090](v62, -1, -1);
          MEMORY[0x24C5A5090](v59, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v23 + 8))((char *)&v130 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
        }

        uint64_t v38 = v148;
        ((void (*)(uint64_t, void, uint64_t))v142)(v148, v133, v22);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v38, 0, 1, v22);
        unint64_t v39 = 0x2696C4000uLL;
        uint64_t v31 = v138;
      }
    }
    else
    {
      uint64_t v138 = v31;
      v150 = (void *)(v23 + 48);
      uint64_t v135 = v24;
      unint64_t v39 = 0x2696C4000uLL;
      uint64_t v40 = *(void (**)(uint64_t, uint8_t **, uint64_t))(v23 + 32);
      unint64_t v134 = (uint8_t **)(v23 + 32);
      uint64_t v133 = v40;
      v40((uint64_t)v28, (uint8_t **)v30, v22);
      uint64_t v41 = v22;
      if (qword_2696C49D8 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_24962BF40();
      uint64_t v43 = __swift_project_value_buffer(v42, (uint64_t)qword_2696C5148);
      uint64_t v132 = &v130;
      uint64_t v24 = v135;
      MEMORY[0x270FA5388](v43, v44);
      uint64_t v45 = (char *)&v130 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v46 = *(void (**)(char *, uint8_t **, uint64_t))(v23 + 16);
      uint64_t v142 = v28;
      v46(v45, v28, v41);
      char v47 = sub_24962BF20();
      os_log_type_t v48 = sub_24962C3E0();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        uint64_t v131 = swift_slowAlloc();
        uint64_t v152 = (void *)v131;
        *(_DWORD *)uint64_t v49 = 136315138;
        BOOL v130 = v49 + 4;
        sub_24961066C(&qword_2696C5190, MEMORY[0x270FCDEA8]);
        uint64_t v50 = sub_24962C6B0();
        uint64_t v151 = sub_2495F74C8(v50, v51, (uint64_t *)&v152);
        uint64_t v24 = v135;
        sub_24962C490();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v45, v41);
        _os_log_impl(&dword_2495EB000, v47, v48, "Using client-provided content type: %s", v49, 0xCu);
        uint64_t v52 = v131;
        swift_arrayDestroy();
        MEMORY[0x24C5A5090](v52, -1, -1);
        MEMORY[0x24C5A5090](v49, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))((char *)&v130 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v41);
      }

      uint64_t v38 = v148;
      uint64_t v22 = v41;
      uint64_t v31 = v138;
      v133(v148, v142, v22);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v38, 0, 1, v22);
    }
    uint64_t v63 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v31)(v38, 1, v22);
    if (v63
      || (MEMORY[0x270FA5388](v63, v64),
          unint64_t v81 = (char *)&v130 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0),
          (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v81, v38, v22),
          uint64_t v80 = sub_24962BEC0(),
          uint64_t v79 = v82,
          (*(void (**)(char *, uint64_t))(v23 + 8))(v81, v22),
          !v79))
    {
      uint64_t v65 = v38;
      if (*(void *)(v39 + 2520) != -1) {
        swift_once();
      }
      uint64_t v66 = sub_24962BF40();
      __swift_project_value_buffer(v66, (uint64_t)qword_2696C5148);
      uint64_t v67 = sub_24962BD40();
      uint64_t v68 = *(void *)(v67 - 8);
      MEMORY[0x270FA5388](v67, v69);
      uint64_t v71 = (char *)&v130 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint8_t *, uint64_t))(v68 + 16))(v71, v147, v67);
      uint64_t v72 = sub_24962BF20();
      os_log_type_t v73 = sub_24962C400();
      if (os_log_type_enabled(v72, v73))
      {
        BOOL v74 = (uint8_t *)swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        uint64_t v152 = (void *)v75;
        v150 = &v130;
        *(_DWORD *)BOOL v74 = 136315138;
        uint64_t v143 = (uint8_t **)(v74 + 4);
        sub_24961066C((unint64_t *)&unk_2696C4B38, MEMORY[0x270FA8F20]);
        uint64_t v76 = sub_24962C6B0();
        uint64_t v151 = sub_2495F74C8(v76, v77, (uint64_t *)&v152);
        sub_24962C490();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v67);
        _os_log_impl(&dword_2495EB000, v72, v73, "Unable to determine MIME type for file URL: %s, falling back to default", v74, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5A5090](v75, -1, -1);
        uint64_t v78 = v74;
        unint64_t v39 = 0x2696C4000;
        uint64_t v38 = v148;
        MEMORY[0x24C5A5090](v78, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v67);

        uint64_t v38 = v65;
      }
      uint64_t v79 = (char *)0x800000024962D6B0;
      uint64_t v80 = 0xD000000000000018;
    }
    uint64_t v83 = sub_24962BC30();
    if (v84)
    {
      swift_bridgeObjectRelease();
      if (*(void *)(v39 + 2520) != -1) {
        swift_once();
      }
      uint64_t v102 = sub_24962BF40();
      __swift_project_value_buffer(v102, (uint64_t)qword_2696C5148);
      uint64_t v103 = sub_24962BD40();
      uint64_t v104 = *(void *)(v103 - 8);
      MEMORY[0x270FA5388](v103, v105);
      unint64_t v107 = (char *)&v130 - ((v106 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint8_t *, uint64_t))(v104 + 16))(v107, v147, v103);
      uint64_t v108 = sub_24962BF20();
      os_log_type_t v109 = sub_24962C400();
      if (os_log_type_enabled(v108, v109))
      {
        uint64_t v110 = (uint8_t *)swift_slowAlloc();
        uint64_t v111 = swift_slowAlloc();
        v150 = &v130;
        uint64_t v112 = v111;
        uint64_t v152 = (void *)v111;
        *(_DWORD *)uint64_t v110 = 136315138;
        unint64_t v147 = v110 + 4;
        sub_24961066C((unint64_t *)&unk_2696C4B38, MEMORY[0x270FA8F20]);
        uint64_t v113 = sub_24962C6B0();
        uint64_t v151 = sub_2495F74C8(v113, v114, (uint64_t *)&v152);
        sub_24962C490();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v104 + 8))(v107, v103);
        _os_log_impl(&dword_2495EB000, v108, v109, "Unable to determine size of file at: %s", v110, 0xCu);
        swift_arrayDestroy();
        uint64_t v115 = v148;
        MEMORY[0x24C5A5090](v112, -1, -1);
        uint64_t v116 = v110;
        uint64_t v38 = v115;
        MEMORY[0x24C5A5090](v116, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v104 + 8))(v107, v103);
      }

      uint64_t v117 = v140;
      sub_2496105D8();
      swift_allocError();
      *unint64_t v118 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v117 + 8))(v149, v141);
      uint64_t v119 = v38;
    }
    else
    {
      uint64_t v85 = v83;
      uint64_t v86 = sub_24962BCF0();
      unint64_t v88 = v87;
      id v89 = objc_allocWithZone(MEMORY[0x263EFF948]);
      swift_bridgeObjectRetain();
      unint64_t v90 = (void *)sub_24962C0C0();
      swift_bridgeObjectRelease();
      uint64_t v91 = (char *)objc_msgSend(v89, sel_initWithFileAtPath_, v90);

      if (v91)
      {
        swift_bridgeObjectRelease();
        uint64_t v92 = v146;
        uint64_t v93 = *(void *)(v146 + 40);
        BOOL v94 = __OFADD__(v93, v85);
        uint64_t v95 = v93 + v85;
        if (v94)
        {
          __break(1u);
        }
        else
        {
          *(void *)(v146 + 40) = v95;
          sub_24960E3A0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5180);
          uint64_t v96 = swift_initStackObject();
          *(_OWORD *)(v96 + 16) = v144;
          uint64_t v97 = v145;
          swift_bridgeObjectRetain();
          uint64_t v98 = sub_24962BCB0();
          uint64_t v100 = v99;
          *(void *)(v96 + 56) = &type metadata for HTTPMultipartFormDataBuilder.ContentDisposition;
          *(void *)(v96 + 64) = &off_26FD38AA0;
          unint64_t v101 = (void *)swift_allocObject();
          *(void *)(v96 + 32) = v101;
          v101[2] = v136;
          v101[3] = v97;
          v101[4] = v98;
          v101[5] = v100;
          *(void *)(v96 + 96) = &type metadata for HTTPMultipartFormDataBuilder.ContentType;
          *(void *)(v96 + 104) = &off_26FD38A90;
          *(void *)(v96 + 72) = v80;
          *(void *)(v96 + 80) = v79;
          sub_24960E5F0(v96);
          swift_setDeallocating();
          __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5188);
          swift_arrayDestroy();
          uint64_t v79 = v91;
          MEMORY[0x24C5A44F0]();
          uint64_t v91 = v149;
          if (*(void *)((*(void *)(v92 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*(void *)(v92 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                             + 0x18) >> 1)
          {
LABEL_29:
            sub_24962C2D0();
            sub_24962C2B0();

            (*(void (**)(char *, uint64_t))(v140 + 8))(v91, v141);
            return sub_249610578(v148);
          }
        }
        sub_24962C2C0();
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
      if (*(void *)(v39 + 2520) != -1) {
        swift_once();
      }
      uint64_t v120 = sub_24962BF40();
      __swift_project_value_buffer(v120, (uint64_t)qword_2696C5148);
      swift_bridgeObjectRetain();
      uint64_t v121 = sub_24962BF20();
      os_log_type_t v122 = sub_24962C400();
      BOOL v123 = os_log_type_enabled(v121, v122);
      uint64_t v124 = v140;
      if (v123)
      {
        uint64_t v125 = (uint8_t *)swift_slowAlloc();
        uint64_t v126 = swift_slowAlloc();
        uint64_t v152 = (void *)v126;
        *(_DWORD *)uint64_t v125 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v151 = sub_2495F74C8(v86, v88, (uint64_t *)&v152);
        uint64_t v127 = v148;
        sub_24962C490();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2495EB000, v121, v122, "Unable to open file at: %s", v125, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5A5090](v126, -1, -1);
        MEMORY[0x24C5A5090](v125, -1, -1);

        uint64_t v128 = v141;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v128 = v141;
        uint64_t v127 = v148;
      }
      sub_2496105D8();
      swift_allocError();
      *os_log_type_t v129 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v124 + 8))(v149, v128);
      uint64_t v119 = v127;
    }
    return sub_249610578(v119);
  }
  return result;
}

id sub_24960FCC0()
{
  uint64_t v7 = 757926413;
  unint64_t v8 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C1B0();
  sub_24960E488(0x2D2D0A0DuLL, 0xE400000000000000);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 32);
  unint64_t v2 = (objc_class *)type metadata accessor for AggregateInputStream();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream] = 0;
  *(void *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError] = 0;
  *(void *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streams] = v1;
  *(void *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status] = 0;
  uint64_t v4 = &v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streamIterator];
  *(void *)uint64_t v4 = v1;
  *((void *)v4 + 1) = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  swift_bridgeObjectRetain_n();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_24960FDCC(uint8_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24960E8EC(a1, a2, a3, a4);
}

uint64_t sub_24960FDE8(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v9 = result;
  uint64_t v22 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2495F7AD8(0, v4 & ~(v4 >> 63), 0);
  if (a2 >= v9 && (v4 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v5 = v22;
    uint64_t v11 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v11 = a3 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v20 = v11;
    while (v10 != v4)
    {
      if (!v20) {
        goto LABEL_20;
      }
      uint64_t result = sub_24962C180();
      if (result < 0) {
        goto LABEL_21;
      }
      unint64_t v12 = result;
      if (!result) {
        goto LABEL_22;
      }
      uint64_t v21 = 0;
      MEMORY[0x24C5A50A0](&v21, 8);
      if (v12 > v21 * v12)
      {
        unint64_t v13 = -(uint64_t)v12 % v12;
        while (v13 > v21 * v12)
        {
          uint64_t v21 = 0;
          MEMORY[0x24C5A50A0](&v21, 8);
        }
      }
      sub_24962C1A0();
      uint64_t result = sub_24962C230();
      uint64_t v14 = result;
      uint64_t v16 = v15;
      uint64_t v22 = v5;
      unint64_t v18 = *(void *)(v5 + 16);
      unint64_t v17 = *(void *)(v5 + 24);
      if (v18 >= v17 >> 1)
      {
        uint64_t result = sub_2495F7AD8(v17 > 1, v18 + 1, 1);
        uint64_t v5 = v22;
      }
      ++v10;
      *(void *)(v5 + 16) = v18 + 1;
      uint64_t v19 = v5 + 16 * v18;
      *(void *)(v19 + 32) = v14;
      *(void *)(v19 + 40) = v16;
      if (v10 == v4) {
        return v5;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_24960FFB0@<X0>(void *a1@<X8>)
{
  sub_24962C520();
  swift_bridgeObjectRelease();
  sub_24960FDE8(0, 20, 0xD00000000000003ELL, 0x800000024962D8D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5160);
  sub_24960C5D8(&qword_2696C5168, &qword_2696C5160);
  sub_24962C240();
  sub_24962C1B0();
  swift_bridgeObjectRelease();
  sub_24962C520();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24962C1B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 0xD000000000000018;
  a1[1] = 0x800000024962D8B0;
  a1[2] = 0xD00000000000001ELL;
  a1[3] = 0x800000024962D910;
  a1[4] = MEMORY[0x263F8EE78];
  a1[5] = 0;
  return result;
}

uint64_t destroy for HTTPMultipartFormDataBuilder()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for HTTPMultipartFormDataBuilder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HTTPMultipartFormDataBuilder(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  return a1;
}

uint64_t assignWithTake for HTTPMultipartFormDataBuilder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder()
{
  return &type metadata for HTTPMultipartFormDataBuilder;
}

uint64_t sub_249610348(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5198);
    uint64_t v3 = sub_24962C510();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      objc_super v6 = *(void **)(v32 + 8 * v4);
      sub_24962C0F0();
      sub_24962C760();
      id v7 = v6;
      sub_24962C170();
      uint64_t v8 = sub_24962C780();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_24962C0F0();
        uint64_t v17 = v16;
        if (v15 == sub_24962C0F0() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_24962C6C0();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_24962C0F0();
          uint64_t v24 = v23;
          if (v22 == sub_24962C0F0() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_24962C6C0();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_249610578(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2496105D8()
{
  unint64_t result = qword_2696C5178;
  if (!qword_2696C5178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5178);
  }
  return result;
}

uint64_t sub_24961062C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24961066C(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for HTTPMultipartFormDataBuilder.ContentType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HTTPMultipartFormDataBuilder.ContentType()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HTTPMultipartFormDataBuilder.ContentType(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for HTTPMultipartFormDataBuilder.ContentType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder.ContentType()
{
  return &type metadata for HTTPMultipartFormDataBuilder.ContentType;
}

uint64_t destroy for HTTPMultipartFormDataBuilder.ContentDisposition()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for HTTPMultipartFormDataBuilder.ContentDisposition(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HTTPMultipartFormDataBuilder.ContentDisposition(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for HTTPMultipartFormDataBuilder.ContentDisposition(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentDisposition(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentDisposition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder.ContentDisposition()
{
  return &type metadata for HTTPMultipartFormDataBuilder.ContentDisposition;
}

unsigned char *storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x249610AA8);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder.Error()
{
  return &type metadata for HTTPMultipartFormDataBuilder.Error;
}

unint64_t sub_249610AE4()
{
  unint64_t result = qword_2696C51A0;
  if (!qword_2696C51A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C51A0);
  }
  return result;
}

uint64_t sub_249610D1C(void *a1, void *a2, void *a3, void *aBlock, void *a5)
{
  v5[4] = a3;
  v5[5] = a5;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = _Block_copy(aBlock);
  uint64_t v15 = (uint64_t (*)(uint64_t))((char *)&dword_2696C5200 + dword_2696C5200);
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  a5;
  uint64_t v13 = (void *)swift_task_alloc();
  v5[7] = v13;
  *uint64_t v13 = v5;
  v13[1] = sub_249600BD4;
  return v15((uint64_t)v12);
}

id sub_249610E68()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ManualAuthTaskDelegate()
{
  return self;
}

uint64_t sub_249610F10()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_249610F68()
{
  objc_super v2 = (void *)v0[2];
  int v3 = (void *)v0[3];
  unsigned int v4 = (void *)v0[4];
  uint64_t v5 = (void *)v0[5];
  unsigned int v6 = (void *)v0[6];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_2495EFD7C;
  uint64_t v8 = (uint64_t (*)(void *, void *, void *, void *, void *))((char *)&dword_2696C51C0 + dword_2696C51C0);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_249611030(uint64_t a1, uint64_t a2, int *a3)
{
  unsigned int v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_2495F0868;
  return v6();
}

uint64_t sub_249611100(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_2495F0868;
  return v7();
}

uint64_t sub_2496111D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962C340();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24962C330();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_249611374(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24962C2E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_249611374(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4ED8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2496113D4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2496114B0;
  return v6(a1);
}

uint64_t sub_2496114B0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2496115A8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2496115E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2495EFD7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2696C51F0 + dword_2696C51F0);
  return v6(a1, v4);
}

uint64_t sub_249611698(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2496116B8, 0, 0);
}

uint64_t sub_2496116B8()
{
  uint64_t v1 = sub_2495FCCD0(*(id *)(v0 + 16));
  int v3 = ~v2;
  sub_2496017F0(v1, v4, v2);
  if (v3)
  {
    uint64_t v5 = *(void *)(v0 + 24);
    id v6 = objc_msgSend(*(id *)(v0 + 16), sel_failureResponse);
    uint64_t v7 = *(void **)(v5 + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse);
    *(void *)(v5 + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse) = v6;

    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, void))(v0 + 8);
  return v9(v8, 0);
}

uint64_t sub_249611768(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 3490893;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 3490893;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x444D2D3176414B41;
      unint64_t v3 = 0xE900000000000035;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x3635322D414853;
      break;
    case 3:
      uint64_t v5 = 0x2D3231352D414853;
      unint64_t v3 = 0xEB00000000363532;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000035;
      if (v5 == 0x444D2D3176414B41) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x3635322D414853;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEB00000000363532;
      if (v5 == 0x2D3231352D414853) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_24962C6C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_249611900(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000018;
  unint64_t v4 = 0x800000024962D050;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x6567412D72657355;
      unint64_t v4 = 0xEA0000000000746ELL;
      break;
    case 2:
      unint64_t v3 = 0x2D746E65746E6F43;
      unint64_t v4 = 0xEC00000065707954;
      break;
    case 3:
      unint64_t v3 = 0x2D746E65746E6F43;
      unint64_t v4 = 0xEE006874676E654CLL;
      break;
    case 4:
      unint64_t v3 = 0x7A69726F68747541;
      unint64_t v4 = 0xED00006E6F697461;
      break;
    case 5:
      unint64_t v4 = 0x800000024962D0A0;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 6:
      unint64_t v4 = 0xE400000000000000;
      unint64_t v3 = 1953722184;
      break;
    case 7:
      unint64_t v3 = 0x66412D7972746552;
      unint64_t v4 = 0xEB00000000726574;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xD000000000000018;
  unint64_t v6 = 0x800000024962D050;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEA0000000000746ELL;
      if (v3 == 0x6567412D72657355) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v6 = 0xEC00000065707954;
      if (v3 != 0x2D746E65746E6F43) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xEE006874676E654CLL;
      if (v3 != 0x2D746E65746E6F43) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xED00006E6F697461;
      if (v3 != 0x7A69726F68747541) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0x800000024962D0A0;
      if (v3 != 0xD000000000000010) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v5 = 1953722184;
      goto LABEL_21;
    case 7:
      unint64_t v6 = 0xEB00000000726574;
      if (v3 != 0x66412D7972746552) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v3 != v5) {
        goto LABEL_25;
      }
LABEL_22:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = sub_24962C6C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_249611BDC()
{
  sub_24962C170();
  return swift_bridgeObjectRelease();
}

uint64_t sub_249611D34()
{
  return sub_24962C780();
}

uint64_t sub_249611E9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24962BB70();
  unint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  uint64_t v38 = a1;
  v4(a1, v1, v3);
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_2496133BC(v5);
  uint64_t result = swift_bridgeObjectRelease();
  int64_t v8 = 0;
  uint64_t v9 = v6 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v6 + 56);
  int64_t v39 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v35 = v6 + 56;
  uint64_t v36 = v6;
  while (v12)
  {
    unint64_t v21 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v22 = v21 | (v8 << 6);
LABEL_26:
    if (*(unsigned char *)(*(void *)(v6 + 48) + v22) == 6)
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
      MEMORY[0x270FA5388](v13 - 8, v14);
      uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24962BB50();
      uint64_t v17 = sub_24962BD40();
      uint64_t v18 = *(void *)(v17 - 8);
      uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
      if (v19)
      {
        uint64_t result = sub_249613430((uint64_t)v16);
      }
      else
      {
        MEMORY[0x270FA5388](v19, v20);
        char v27 = (char *)&v35 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v27, v16, v17);
        sub_249613430((uint64_t)v16);
        uint64_t v28 = sub_24962BCE0();
        if (v29)
        {
          uint64_t v30 = v28;
          uint64_t v31 = v29;
          unint64_t v37 = &v35;
          uint64_t v32 = sub_24962BD10();
          if ((v33 & 1) == 0)
          {
            uint64_t v34 = v32;
            uint64_t v41 = v30;
            uint64_t v42 = v31;
            sub_24962C1B0();
            uint64_t v40 = v34;
            sub_24962C6B0();
            sub_24962C1B0();
            swift_bridgeObjectRelease();
          }
          (*(void (**)(char *, uint64_t))(v18 + 8))(v27, v17);
          sub_24962BB60();
          uint64_t result = swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v27, v17);
        }
        uint64_t v9 = v35;
        uint64_t v6 = v36;
      }
    }
  }
  int64_t v23 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v23 >= v39) {
    return swift_release();
  }
  unint64_t v24 = *(void *)(v9 + 8 * v23);
  ++v8;
  if (v24) {
    goto LABEL_25;
  }
  int64_t v8 = v23 + 1;
  if (v23 + 1 >= v39) {
    return swift_release();
  }
  unint64_t v24 = *(void *)(v9 + 8 * v8);
  if (v24) {
    goto LABEL_25;
  }
  int64_t v8 = v23 + 2;
  if (v23 + 2 >= v39) {
    return swift_release();
  }
  unint64_t v24 = *(void *)(v9 + 8 * v8);
  if (v24)
  {
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v8 << 6);
    goto LABEL_26;
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v39) {
    return swift_release();
  }
  unint64_t v24 = *(void *)(v9 + 8 * v25);
  if (v24)
  {
    int64_t v8 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v8 >= v39) {
      return swift_release();
    }
    unint64_t v24 = *(void *)(v9 + 8 * v8);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_249612264(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_249611D34();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v17;
    *uint64_t v17 = 0x8000000000000000;
    char v15 = a2;
    sub_249612A64(a2, v7, isUniquelyReferenced_nonNull_native);
    *uint64_t v17 = v19;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_34;
  }
  uint64_t v8 = ~v6;
  while (2)
  {
    unint64_t v9 = 0xD000000000000018;
    unint64_t v10 = 0x800000024962D050;
    switch(*(unsigned char *)(*(void *)(v4 + 48) + v7))
    {
      case 1:
        unint64_t v9 = 0x6567412D72657355;
        unint64_t v10 = 0xEA0000000000746ELL;
        break;
      case 2:
        unint64_t v9 = 0x2D746E65746E6F43;
        unint64_t v10 = 0xEC00000065707954;
        break;
      case 3:
        unint64_t v9 = 0x2D746E65746E6F43;
        unint64_t v10 = 0xEE006874676E654CLL;
        break;
      case 4:
        unint64_t v9 = 0x7A69726F68747541;
        unint64_t v10 = 0xED00006E6F697461;
        break;
      case 5:
        unint64_t v10 = 0x800000024962D0A0;
        unint64_t v9 = 0xD000000000000010;
        break;
      case 6:
        unint64_t v10 = 0xE400000000000000;
        unint64_t v9 = 1953722184;
        break;
      case 7:
        unint64_t v9 = 0x66412D7972746552;
        unint64_t v10 = 0xEB00000000726574;
        break;
      default:
        break;
    }
    unint64_t v11 = 0xD000000000000018;
    unint64_t v12 = 0x800000024962D050;
    switch((char)a2)
    {
      case 1:
        unint64_t v12 = 0xEA0000000000746ELL;
        if (v9 == 0x6567412D72657355) {
          goto LABEL_24;
        }
        goto LABEL_25;
      case 2:
        unint64_t v12 = 0xEC00000065707954;
        if (v9 != 0x2D746E65746E6F43) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 3:
        unint64_t v12 = 0xEE006874676E654CLL;
        if (v9 != 0x2D746E65746E6F43) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 4:
        unint64_t v12 = 0xED00006E6F697461;
        if (v9 != 0x7A69726F68747541) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 5:
        unint64_t v12 = 0x800000024962D0A0;
        if (v9 != 0xD000000000000010) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 6:
        unint64_t v12 = 0xE400000000000000;
        unint64_t v11 = 1953722184;
        goto LABEL_23;
      case 7:
        unint64_t v12 = 0xEB00000000726574;
        if (v9 != 0x66412D7972746552) {
          goto LABEL_25;
        }
        goto LABEL_24;
      default:
LABEL_23:
        if (v9 != v11) {
          goto LABEL_25;
        }
LABEL_24:
        if (v10 == v12)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_33;
        }
LABEL_25:
        char v13 = sub_24962C6C0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0)
        {
          unint64_t v7 = (v7 + 1) & v8;
          if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
            goto LABEL_30;
          }
          continue;
        }
        swift_bridgeObjectRelease();
LABEL_33:
        uint64_t result = 0;
        char v15 = *(unsigned char *)(*(void *)(*v17 + 48) + v7);
LABEL_34:
        *a1 = v15;
        return result;
    }
  }
}

uint64_t sub_249612660()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5218);
  uint64_t v3 = sub_24962C500();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v28 = (void *)(v2 + 56);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_38;
    }
    if (v14 >= v8) {
      break;
    }
    unint64_t v15 = v28[v14];
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v8) {
        break;
      }
      unint64_t v15 = v28[v10];
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v8) {
          break;
        }
        unint64_t v15 = v28[v10];
        if (!v15)
        {
          int64_t v16 = v14 + 3;
          if (v16 >= v8) {
            break;
          }
          unint64_t v15 = v28[v16];
          if (!v15)
          {
            while (1)
            {
              int64_t v10 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_39;
              }
              if (v10 >= v8) {
                goto LABEL_33;
              }
              unint64_t v15 = v28[v10];
              ++v16;
              if (v15) {
                goto LABEL_23;
              }
            }
          }
          int64_t v10 = v16;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    char v17 = *(unsigned char *)(*(void *)(v2 + 48) + v13);
    sub_24962C760();
    sub_24962C170();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_24962C780();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v22 = 0;
    unint64_t v23 = (unint64_t)(63 - v19) >> 6;
    do
    {
      if (++v21 == v23 && (v22 & 1) != 0)
      {
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x249612A44);
      }
      BOOL v24 = v21 == v23;
      if (v21 == v23) {
        unint64_t v21 = 0;
      }
      v22 |= v24;
      uint64_t v25 = *(void *)(v9 + 8 * v21);
    }
    while (v25 == -1);
    unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
LABEL_7:
    *(void *)(v9 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(unsigned char *)(*(void *)(v4 + 48) + v11) = v17;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  swift_release();
  uint64_t v1 = v0;
  uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
  if (v26 > 63) {
    bzero(v28, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v28 = -1 << v26;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_249612A64(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_249612660();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_249612E5C();
        goto LABEL_37;
      }
      sub_249612FF0();
    }
    uint64_t v8 = *v3;
    uint64_t result = sub_249611D34();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      while (2)
      {
        unint64_t v11 = 0xD000000000000018;
        unint64_t v12 = 0x800000024962D050;
        switch(*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          case 1:
            unint64_t v11 = 0x6567412D72657355;
            unint64_t v12 = 0xEA0000000000746ELL;
            break;
          case 2:
            unint64_t v11 = 0x2D746E65746E6F43;
            unint64_t v12 = 0xEC00000065707954;
            break;
          case 3:
            unint64_t v11 = 0x2D746E65746E6F43;
            unint64_t v12 = 0xEE006874676E654CLL;
            break;
          case 4:
            unint64_t v11 = 0x7A69726F68747541;
            unint64_t v12 = 0xED00006E6F697461;
            break;
          case 5:
            unint64_t v12 = 0x800000024962D0A0;
            unint64_t v11 = 0xD000000000000010;
            break;
          case 6:
            unint64_t v12 = 0xE400000000000000;
            unint64_t v11 = 1953722184;
            break;
          case 7:
            unint64_t v11 = 0x66412D7972746552;
            unint64_t v12 = 0xEB00000000726574;
            break;
          default:
            break;
        }
        unint64_t v13 = 0xD000000000000018;
        unint64_t v14 = 0x800000024962D050;
        switch(v5)
        {
          case 1:
            unint64_t v14 = 0xEA0000000000746ELL;
            if (v11 != 0x6567412D72657355) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 2:
            unint64_t v14 = 0xEC00000065707954;
            if (v11 != 0x2D746E65746E6F43) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 3:
            unint64_t v14 = 0xEE006874676E654CLL;
            if (v11 != 0x2D746E65746E6F43) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 4:
            unint64_t v14 = 0xED00006E6F697461;
            if (v11 != 0x7A69726F68747541) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 5:
            unint64_t v14 = 0x800000024962D0A0;
            unint64_t v13 = 0xD000000000000010;
            goto LABEL_30;
          case 6:
            unint64_t v14 = 0xE400000000000000;
            if (v11 != 1953722184) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 7:
            unint64_t v14 = 0xEB00000000726574;
            if (v11 != 0x66412D7972746552) {
              goto LABEL_32;
            }
            goto LABEL_31;
          default:
LABEL_30:
            if (v11 != v13) {
              goto LABEL_32;
            }
LABEL_31:
            if (v12 == v14) {
              goto LABEL_40;
            }
LABEL_32:
            char v15 = sub_24962C6C0();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v15) {
              goto LABEL_41;
            }
            a2 = (a2 + 1) & v10;
            if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
LABEL_37:
  uint64_t v16 = *v20;
  *(void *)(*v20 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v16 + 48) + a2) = v21;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18)
  {
    __break(1u);
LABEL_40:
    swift_bridgeObjectRelease_n();
LABEL_41:
    sub_24962C6E0();
    __break(1u);
    JUMPOUT(0x249612E1CLL);
  }
  *(void *)(v16 + 16) = v19;
  return result;
}

void *sub_249612E5C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5218);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24962C4F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_249612FF0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5218);
  uint64_t v3 = sub_24962C500();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_35;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v27 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v27) {
      break;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v27) {
        break;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v27) {
          break;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v10);
        if (!v15)
        {
          int64_t v16 = v14 + 3;
          if (v16 >= v27) {
            break;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v16);
          if (!v15)
          {
            while (1)
            {
              int64_t v10 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_37;
              }
              if (v10 >= v27) {
                goto LABEL_33;
              }
              unint64_t v15 = *(void *)(v6 + 8 * v10);
              ++v16;
              if (v15) {
                goto LABEL_23;
              }
            }
          }
          int64_t v10 = v16;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    char v17 = *(unsigned char *)(*(void *)(v2 + 48) + v13);
    sub_24962C760();
    sub_24962C170();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_24962C780();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v22 = 0;
    unint64_t v23 = (unint64_t)(63 - v19) >> 6;
    do
    {
      if (++v21 == v23 && (v22 & 1) != 0)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        JUMPOUT(0x24961339CLL);
      }
      BOOL v24 = v21 == v23;
      if (v21 == v23) {
        unint64_t v21 = 0;
      }
      v22 |= v24;
      uint64_t v25 = *(void *)(v9 + 8 * v21);
    }
    while (v25 == -1);
    unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
LABEL_7:
    *(void *)(v9 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(unsigned char *)(*(void *)(v4 + 48) + v11) = v17;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  uint64_t result = swift_release_n();
  uint64_t v1 = v0;
LABEL_35:
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2496133BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_249613490();
  uint64_t result = sub_24962C3C0();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_249612264(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_249613430(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_249613490()
{
  unint64_t result = qword_2696C5210;
  if (!qword_2696C5210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5210);
  }
  return result;
}

uint64_t sub_2496134E4()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C5220);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696C5220);
  return sub_24962BF30();
}

uint64_t sub_249613564()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2696C5268);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

id sub_2496135D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncTaskDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24961367C()
{
  return type metadata accessor for AsyncTaskDelegate();
}

uint64_t type metadata accessor for AsyncTaskDelegate()
{
  uint64_t result = qword_2696C5240;
  if (!qword_2696C5240) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2496136D0()
{
  sub_249613760();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_249613760()
{
  if (!qword_2696C5250)
  {
    sub_2496137D4();
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
    unint64_t v0 = sub_24962C310();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2696C5250);
    }
  }
}

unint64_t sub_2496137D4()
{
  unint64_t result = qword_2696C5258;
  if (!qword_2696C5258)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696C5258);
  }
  return result;
}

void sub_2496138A0(void *a1, NSObject *a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (qword_2696C49E0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24962BF40();
  __swift_project_value_buffer(v6, (uint64_t)qword_2696C5220);
  id v7 = a1;
  unint64_t v8 = a2;
  uint64_t v9 = v7;
  int64_t v10 = a2;
  unint64_t v11 = sub_24962BF20();
  os_log_type_t v12 = sub_24962C3E0();
  if (!os_log_type_enabled(v11, v12))
  {

    if (!a2) {
      goto LABEL_10;
    }
LABEL_7:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(qword_2696C5268);
    uint64_t v19 = *(void *)(v18 - 8);
    MEMORY[0x270FA5388](v18, v20);
    char v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v3 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation, v18);
    uint64_t v45 = a2;
    unint64_t v23 = a2;
    sub_24962C2F0();
LABEL_12:
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    return;
  }
  os_log_t v42 = v11;
  uint64_t v44 = v2;
  uint64_t v13 = swift_slowAlloc();
  int64_t v14 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v13 = 138412546;
  uint64_t v45 = v9;
  unint64_t v15 = v9;
  sub_24962C490();
  uint64_t v43 = v9;
  *int64_t v14 = v9;

  *(_WORD *)(v13 + 12) = 2112;
  if (a2)
  {
    int64_t v16 = a2;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v45 = v17;
    sub_24962C490();
  }
  else
  {
    uint64_t v45 = 0;
    sub_24962C490();
    uint64_t v17 = 0;
  }
  v14[1] = v17;

  _os_log_impl(&dword_2495EB000, v42, v12, "Task [%@] completed with error: %@", (uint8_t *)v13, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
  swift_arrayDestroy();
  MEMORY[0x24C5A5090](v14, -1, -1);
  MEMORY[0x24C5A5090](v13, -1, -1);

  uint64_t v9 = v43;
  uint64_t v3 = v44;
  if (a2) {
    goto LABEL_7;
  }
LABEL_10:
  BOOL v24 = [v9 response];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(qword_2696C5268);
    uint64_t v19 = *(void *)(v18 - 8);
    MEMORY[0x270FA5388](v18, v26);
    char v22 = (char *)&v42 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v3 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation, v18);
    uint64_t v45 = v25;
    sub_24962C300();
    goto LABEL_12;
  }
  uint64_t v28 = v9;
  uint64_t v29 = sub_24962BF20();
  os_log_type_t v30 = sub_24962C400();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 138412290;
    uint64_t v45 = v28;
    char v33 = v28;
    sub_24962C490();
    *uint64_t v32 = v28;

    _os_log_impl(&dword_2495EB000, v29, v30, "No response set for task [%@]", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v32, -1, -1);
    MEMORY[0x24C5A5090](v31, -1, -1);
  }
  else
  {

    uint64_t v29 = v28;
  }

  sub_249613EDC();
  uint64_t v34 = swift_allocError();
  *uint64_t v35 = 0;
  v35[1] = 0;
  swift_willThrow();
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(qword_2696C5268);
  uint64_t v37 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36, v38);
  uint64_t v40 = (char *)&v42 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v40, v3 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation, v36);
  uint64_t v45 = v34;
  uint64_t v41 = v34;
  sub_24962C2F0();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v36);
}

unint64_t sub_249613EDC()
{
  unint64_t result = qword_2696C5260;
  if (!qword_2696C5260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5260);
  }
  return result;
}

uint64_t sub_249613F34()
{
  type metadata accessor for AsyncRequestQueue.RequestState();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
  uint64_t result = sub_24962C3B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24962C380();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_249614058()
{
  swift_release();
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 112);
  type metadata accessor for AsyncRequestQueue.RequestState();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
  uint64_t v2 = sub_24962C3B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 120);
  uint64_t v4 = sub_24962C380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_2496141A0()
{
  sub_249614058();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for AsyncRequestQueue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AsyncRequestQueue.RequestState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2496141FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_249614204()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
    uint64_t result = sub_24962C310();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2496142FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1, a2);
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = *(int *)(a3 + 40);
    uint64_t v9 = (uint64_t *)((char *)v4 + v7);
    int64_t v10 = (uint64_t *)((char *)a2 + v7);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    os_log_type_t v12 = (char *)v4 + v8;
    uint64_t v13 = (char *)a2 + v8;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
    uint64_t v14 = sub_24962C310();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return v4;
}

uint64_t sub_249614430(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
  uint64_t v5 = sub_24962C310();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_2496144FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 16))();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = (void *)(a1 + v6);
  uint64_t v9 = (void *)(a2 + v6);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a1 + v7;
  uint64_t v12 = a2 + v7;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
  uint64_t v13 = sub_24962C310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t sub_2496145D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 24))();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = v8[1];
  void *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
  uint64_t v13 = sub_24962C310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_2496146C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 32))();
  uint64_t v6 = *(int *)(a3 + 40);
  *(_OWORD *)(a1 + *(int *)(a3 + 36)) = *(_OWORD *)(a2 + *(int *)(a3 + 36));
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
  uint64_t v9 = sub_24962C310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t sub_249614794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 40))();
  *(_OWORD *)(a1 + *(int *)(a3 + 36)) = *(_OWORD *)(a2 + *(int *)(a3 + 36));
  swift_release();
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
  uint64_t v9 = sub_24962C310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_249614874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249614888);
}

uint64_t sub_249614888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(_DWORD *)(v6 + 84) == a2)
  {
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 48);
    return v7();
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 36));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
    uint64_t v10 = sub_24962C310();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 40);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_2496149CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2496149E0);
}

uint64_t sub_2496149E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6 = result;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  if (*(_DWORD *)(v7 + 84) == a3)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    return v8(result, a2, a2);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + *(int *)(a4 + 36)) = (a2 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696C4E40);
    uint64_t v9 = sub_24962C310();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    uint64_t v11 = v9;
    uint64_t v12 = v6 + *(int *)(a4 + 40);
    return v10(v12, a2, a2, v11);
  }
  return result;
}

uint64_t sub_249614B20()
{
  return v0;
}

uint64_t sub_249614B2C()
{
  return sub_249614B20();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_249614B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_249614B80(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x249614C1CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t type metadata accessor for AsyncRequestQueue.Error()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_249614C5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_249614C78()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C53F0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2696C53F0);
  if (qword_2696C49F8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2696C7C80);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_249614D40()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);

  __swift_destroy_boxed_opaque_existential_1(v0 + 168);
  __swift_destroy_boxed_opaque_existential_1(v0 + 208);

  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for ManagedURLSessionAuthenticator()
{
  return self;
}

ValueMetadata *type metadata accessor for ManagedURLSessionAuthenticator.DefaultFactory()
{
  return &type metadata for ManagedURLSessionAuthenticator.DefaultFactory;
}

uint64_t sub_249614DCC@<X0>(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  v15[0] = *a1;
  sub_2495F07A0(a3, (uint64_t)v16);
  sub_24961DA34(a2, v15, v16, (uint64_t)v17);
  sub_249615284((uint64_t)v17, (uint64_t)v16);
  sub_249615284((uint64_t)v16, (uint64_t)v15);
  void v14[3] = &type metadata for URLSessionAuthenticator.DefaultFactory;
  v14[4] = &off_26FD391C0;
  uint64_t v6 = type metadata accessor for URLSessionAuthenticator();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, (uint64_t)&type metadata for URLSessionAuthenticator.DefaultFactory);
  MEMORY[0x270FA5388](v8, v8);
  (*(void (**)(void))(v9 + 16))();
  uint64_t v12 = &type metadata for URLSessionAuthenticator.DefaultFactory;
  uint64_t v13 = &off_26FD391C0;
  swift_defaultActor_initialize();
  sub_249615284((uint64_t)v15, v7 + 112);
  sub_2495F0788(&v11, v7 + 224);
  sub_2496152E0((uint64_t)v15);
  *(void *)(v7 + 264) = MEMORY[0x263F8EE80];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  sub_2496152E0((uint64_t)v16);
  a4[3] = v6;
  a4[4] = (uint64_t)&off_26FD39040;
  *a4 = v7;
  return sub_2496152E0((uint64_t)v17);
}

uint64_t sub_249614F78(unsigned char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = a1;
  uint64_t v10 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v13 = &v25[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v11, v14);
  int64_t v16 = &v25[-v15 - 8];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 32))(&v25[-v15 - 8], v17, v18);
  LOBYTE(v9) = *v9;
  uint64_t v26 = &type metadata for ManagedURLSessionAuthenticator.DefaultFactory;
  uint64_t v27 = &off_26FD38D00;
  type metadata accessor for ManagedURLSessionAuthenticator();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, (uint64_t)&type metadata for ManagedURLSessionAuthenticator.DefaultFactory);
  MEMORY[0x270FA5388](v20, v20);
  (*(void (**)(void))(v21 + 16))();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v13, v16, a5);
  uint64_t v22 = sub_249615160((char)v9, a2, (uint64_t)v13, v19, a5, a6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, a5);
  return v22;
}

uint64_t sub_249615160(char a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v10 = a1 & 1;
  v18[3] = a5;
  v18[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a3, a5);
  int64_t v16 = &type metadata for ManagedURLSessionAuthenticator.DefaultFactory;
  uint64_t v17 = &off_26FD38D00;
  swift_defaultActor_initialize();
  *(unsigned char *)(a4 + 112) = v10;
  sub_2495F07A0((uint64_t)v15, a4 + 120);
  *(void *)(a4 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02D30]), sel_initWithQueue_, 0);
  sub_2495F07A0((uint64_t)v18, a4 + 168);
  __swift_project_boxed_opaque_existential_1(v15, (uint64_t)v16);
  char v13 = v10;
  sub_249614DCC(&v13, a2, (uint64_t)v18, (uint64_t *)v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  sub_2495F0788(v14, a4 + 208);
  *(void *)(a4 + 248) = a2;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return a4;
}

uint64_t sub_249615284(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2496152E0(uint64_t a1)
{
  return a1;
}

id sub_249615334(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2696C5268);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v13(v12, a1, v8);
  uint64_t v14 = (char *)objc_allocWithZone((Class)type metadata accessor for AsyncTaskDelegate());
  v13(&v14[OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation], (uint64_t)v12, v8);
  uint64_t v15 = &v14[OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler];
  *(void *)uint64_t v15 = a3;
  *((void *)v15 + 1) = a4;
  int64_t v16 = (objc_class *)type metadata accessor for AuthTaskDelegate();
  v19.receiver = v14;
  v19.super_class = v16;
  swift_retain();
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  objc_msgSend(a2, sel_setDelegate_, v17);

  return objc_msgSend(a2, sel_resume);
}

uint64_t sub_2496154D0(uint64_t a1)
{
  return sub_249615510(a1, qword_2696C7C68);
}

uint64_t sub_2496154E8(uint64_t a1)
{
  return sub_249615510(a1, qword_2696C7C80);
}

uint64_t sub_249615510(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24962BF40();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24962BF30();
}

unint64_t destroy for FileTransfer.Error(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s15CTLazuliSupport12FileTransferO5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for FileTransfer.Error(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FileTransfer.Error(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FileTransfer.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFA && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483643);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 4;
  if (v4 >= 6) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FileTransfer.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 4;
    }
  }
  return result;
}

uint64_t sub_2496157A0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2496157B8(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FileTransfer.Error()
{
  return &type metadata for FileTransfer.Error;
}

uint64_t sub_2496157E8(unsigned __int8 *a1, char *a2)
{
  return sub_249611768(*a1, *a2);
}

uint64_t sub_2496157F4()
{
  return sub_24962C780();
}

uint64_t sub_2496158D4()
{
  sub_24962C170();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24961599C()
{
  return sub_24962C780();
}

uint64_t sub_249615A78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_249615C44();
  *a1 = result;
  return result;
}

void sub_249615AA8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 3490893;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000035;
      uint64_t v3 = 0x444D2D3176414B41;
      goto LABEL_3;
    case 2:
      *a1 = 0x3635322D414853;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x2D3231352D414853;
      a1[1] = 0xEB00000000363532;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_249615B48()
{
  return sub_24962C280();
}

uint64_t sub_249615BA8()
{
  return sub_24962C270();
}

unint64_t sub_249615BF8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_24962C260();
  }
  __break(1u);
  return result;
}

uint64_t sub_249615C44()
{
  unint64_t v0 = sub_24962C630();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

void sub_249615C90(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5408);
  uint64_t v182 = *(void *)(v183 - 8);
  MEMORY[0x270FA5388](v183, v4);
  unint64_t v181 = (char *)v178 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5410);
  MEMORY[0x270FA5388](v6 - 8, v7);
  v184 = (char *)v178 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5418);
  uint64_t v186 = *(void *)(v187 - 8);
  MEMORY[0x270FA5388](v187, v9);
  v185 = (char *)v178 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5420);
  MEMORY[0x270FA5388](v11 - 8, v12);
  v188 = (char *)v178 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5428);
  uint64_t v190 = *(void *)(v191 - 8);
  MEMORY[0x270FA5388](v191, v14);
  v189 = (char *)v178 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5430);
  MEMORY[0x270FA5388](v16 - 8, v17);
  v192 = (char *)v178 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5438);
  uint64_t v194 = *(void *)(v19 - 8);
  uint64_t v195 = v19;
  MEMORY[0x270FA5388](v19, v20);
  v193 = (char *)v178 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5440);
  MEMORY[0x270FA5388](v22 - 8, v23);
  v196 = (char *)v178 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5448);
  v198 = *(void (***)(void, void))(v25 - 8);
  uint64_t v199 = v25;
  MEMORY[0x270FA5388](v25, v26);
  v197 = (char *)v178 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5450);
  MEMORY[0x270FA5388](v28 - 8, v29);
  v200 = (char *)v178 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CB0);
  uint64_t v204 = *(void *)(v31 - 8);
  uint64_t v205 = v31;
  MEMORY[0x270FA5388](v31, v32);
  v203 = (char *)v178 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CB8);
  MEMORY[0x270FA5388](v34 - 8, v35);
  v206 = (char *)v178 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5458);
  uint64_t v38 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37, v39);
  uint64_t v41 = (char *)v178 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5460);
  MEMORY[0x270FA5388](v42 - 8, v43);
  uint64_t v45 = (char *)v178 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5468);
  uint64_t v47 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46, v48);
  v207 = (char *)v178 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = (void *)sub_24962C0C0();
  id v51 = objc_msgSend(a1, sel_valueForHTTPHeaderField_, v50);

  if (!v51)
  {

    uint64_t v55 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = 0;
LABEL_32:
    uint64_t v73 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    char v77 = 0;
    goto LABEL_33;
  }
  id v201 = a1;
  uint64_t v202 = a2;
  unint64_t v52 = sub_24962C0F0();
  unint64_t v54 = v53;

  uint64_t v209 = v52;
  unint64_t v210 = v54;
  sub_24962BE70();
  sub_2495FCBE4();
  sub_2495FCC80(&qword_2696C5470, &qword_2696C5458);
  sub_24962C0A0();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v41, v37);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46) != 1)
  {
    os_log_type_t v58 = v207;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v207, v45, v46);
    swift_getKeyPath();
    sub_24962BE80();
    swift_release();
    unint64_t v59 = sub_249615BF8(v209, v52, v54);
    unint64_t v61 = v60;
    uint64_t v63 = v62;
    uint64_t v65 = v64;
    swift_bridgeObjectRelease();
    unint64_t v179 = v59;
    uint64_t v209 = v59;
    unint64_t v210 = v61;
    unint64_t v180 = v61;
    v211 = v63;
    v212 = v65;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CF8);
    uint64_t v66 = v203;
    sub_24962BE70();
    unint64_t v67 = sub_249617520();
    sub_2495FCC80(&qword_2696C4D00, &qword_2696C4CB0);
    uint64_t v68 = v206;
    uint64_t v69 = v205;
    sub_24962C080();
    uint64_t v70 = (uint64_t)v68;
    (*(void (**)(char *, uint64_t))(v204 + 8))(v66, v69);
    uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4CC0);
    uint64_t v72 = *(void *)(v71 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71) == 1)
    {

      swift_bridgeObjectRelease();
      sub_2495F73C0(v70, &qword_2696C4CB8);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v58, v46);
      goto LABEL_7;
    }
    uint64_t v204 = v46;
    uint64_t v205 = v47;
    swift_getKeyPath();
    uint64_t v78 = v70;
    sub_24962BE80();
    swift_release();
    unint64_t v79 = v209;
    unint64_t v80 = v210;
    unint64_t v81 = v63;
    uint64_t v82 = v211;
    uint64_t v83 = v212;
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v78, v71);
    v178[0] = MEMORY[0x24C5A43B0](v79, v80, v82, v83);
    uint64_t v85 = v84;
    swift_bridgeObjectRelease();
    unint64_t v86 = v179;
    unint64_t v87 = v180;
    uint64_t v209 = v179;
    unint64_t v210 = v180;
    v206 = v81;
    v211 = v81;
    v212 = v65;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5480);
    unint64_t v88 = v197;
    sub_24962BE70();
    sub_2495FCC80(&qword_2696C5488, &qword_2696C5448);
    uint64_t v89 = (uint64_t)v200;
    uint64_t v90 = v199;
    sub_24962C080();
    ((void (**)(char *, uint64_t))v198)[1](v88, v90);
    uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5490);
    uint64_t v92 = *(void *)(v91 - 8);
    int v93 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v92 + 48))(v89, 1, v91);
    unint64_t v94 = v67;
    a2 = v202;
    if (v93 == 1)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_2495F73C0(v89, &qword_2696C5450);
      (*(void (**)(char *, uint64_t))(v205 + 8))(v207, v204);
      goto LABEL_30;
    }
    unint64_t v95 = v86;
    uint64_t v199 = v85;
    v178[1] = v94;
    swift_getKeyPath();
    sub_24962BE80();
    swift_release();
    unint64_t v96 = v209;
    unint64_t v97 = v210;
    v203 = v65;
    uint64_t v98 = v89;
    uint64_t v99 = v211;
    uint64_t v100 = v212;
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v98, v91);
    v200 = (char *)MEMORY[0x24C5A43B0](v96, v97, v99, v100);
    uint64_t v102 = v101;
    uint64_t v103 = v203;
    swift_bridgeObjectRelease();
    uint64_t v209 = v95;
    unint64_t v210 = v87;
    v211 = v206;
    v212 = v103;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5498);
    uint64_t v104 = v193;
    sub_24962BE70();
    sub_2495FCC80(&qword_2696C54A0, &qword_2696C5438);
    uint64_t v105 = (uint64_t)v196;
    uint64_t v106 = v195;
    sub_24962C080();
    (*(void (**)(char *, uint64_t))(v194 + 8))(v104, v106);
    uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C54A8);
    uint64_t v108 = *(void *)(v107 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v108 + 48))(v105, 1, v107) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_2495F73C0(v105, &qword_2696C5440);
      (*(void (**)(char *, uint64_t))(v205 + 8))(v207, v204);
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    v198 = v102;
    swift_getKeyPath();
    sub_24962BE80();
    swift_release();
    unint64_t v109 = v209;
    unint64_t v110 = v210;
    uint64_t v111 = (*(uint64_t (**)(uint64_t, uint64_t))(v108 + 8))(v105, v107);
    uint64_t v209 = 44;
    unint64_t v210 = 0xE100000000000000;
    MEMORY[0x270FA5388](v111, v112);
    v178[-2] = &v209;
    swift_bridgeObjectRetain();
    uint64_t v113 = sub_2495F69F4(0x7FFFFFFFFFFFFFFFLL, 1, sub_2495F7DD0, (uint64_t)&v178[-4], v109, v110);
    swift_bridgeObjectRelease();
    int64_t v114 = *(void *)(v113 + 16);
    if (v114)
    {
      uint64_t v208 = MEMORY[0x263F8EE78];
      sub_2495F7AB8(0, v114, 0);
      v197 = (char *)v113;
      uint64_t v115 = (uint64_t *)(v113 + 56);
      do
      {
        uint64_t v116 = *(v115 - 3);
        uint64_t v117 = *(v115 - 2);
        uint64_t v119 = *(v115 - 1);
        uint64_t v118 = *v115;
        swift_bridgeObjectRetain();
        uint64_t v209 = MEMORY[0x24C5A43B0](v116, v117, v119, v118);
        unint64_t v210 = v120;
        uint64_t v121 = sub_24962BB90();
        uint64_t v122 = *(void *)(v121 - 8);
        MEMORY[0x270FA5388](v121, v123);
        uint64_t v125 = (char *)v178 - ((v124 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_24962BB80();
        sub_249617574();
        uint64_t v126 = sub_24962C4B0();
        uint64_t v128 = v127;
        (*(void (**)(char *, uint64_t))(v122 + 8))(v125, v121);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v74 = v208;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2495F7AB8(0, *(void *)(v74 + 16) + 1, 1);
          uint64_t v74 = v208;
        }
        unint64_t v130 = *(void *)(v74 + 16);
        unint64_t v129 = *(void *)(v74 + 24);
        if (v130 >= v129 >> 1)
        {
          sub_2495F7AB8(v129 > 1, v130 + 1, 1);
          uint64_t v74 = v208;
        }
        *(void *)(v74 + 16) = v130 + 1;
        uint64_t v131 = v74 + 16 * v130;
        *(void *)(v131 + 32) = v126;
        *(void *)(v131 + 40) = v128;
        v115 += 4;
        --v114;
      }
      while (v114);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v74 = MEMORY[0x263F8EE78];
    }
    uint64_t v132 = v203;
    unint64_t v133 = v179;
    uint64_t v209 = v179;
    unint64_t v210 = v180;
    v211 = v206;
    v212 = v203;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C54B8);
    unint64_t v134 = v189;
    sub_24962BE70();
    sub_2495FCC80(&qword_2696C54C0, &qword_2696C5428);
    uint64_t v135 = (uint64_t)v192;
    uint64_t v136 = v191;
    sub_24962C080();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v134, v136);
    uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C54C8);
    uint64_t v138 = *(void *)(v137 - 8);
    int v139 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 48))(v135, 1, v137);
    int v140 = v139;
    if (v139 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_2495F73C0(v135, &qword_2696C5430);
      (*(void (**)(char *, uint64_t))(v205 + 8))(v207, v204);
      a2 = v202;
      goto LABEL_29;
    }
    LODWORD(v203) = v139;
    swift_getKeyPath();
    sub_24962BE80();
    swift_release();
    unint64_t v141 = v209;
    unint64_t v142 = v210;
    uint64_t v143 = v132;
    unint64_t v144 = v133;
    uint64_t v145 = v211;
    uint64_t v146 = v212;
    (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v135, v137);
    unint64_t v147 = v143;
    uint64_t v75 = MEMORY[0x24C5A43B0](v141, v142, v145, v146);
    uint64_t v76 = v148;
    swift_bridgeObjectRelease();
    uint64_t v209 = v144;
    unint64_t v210 = v180;
    v211 = v206;
    v212 = v147;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C54D0);
    unint64_t v149 = v185;
    sub_24962BE70();
    sub_2495FCC80(&qword_2696C54D8, &qword_2696C5418);
    uint64_t v150 = (uint64_t)v188;
    uint64_t v151 = v187;
    sub_24962C080();
    (*(void (**)(char *, uint64_t))(v186 + 8))(v149, v151);
    uint64_t v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C54E0);
    uint64_t v153 = *(void *)(v152 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v153 + 48))(v150, 1, v152) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_2495F73C0(v150, &qword_2696C5420);
    }
    else
    {
      swift_getKeyPath();
      sub_24962BE80();
      swift_release();
      unint64_t v154 = v209;
      unint64_t v155 = v210;
      uint64_t v156 = v150;
      uint64_t v157 = v211;
      unint64_t v158 = v212;
      (*(void (**)(uint64_t, uint64_t))(v153 + 8))(v156, v152);
      MEMORY[0x24C5A43B0](v154, v155, v157, v158);
      swift_bridgeObjectRelease();
      uint64_t v159 = sub_249615C44();
      if (v159 != 4)
      {
        v197 = (char *)v159;
        uint64_t v209 = v179;
        unint64_t v210 = v180;
        v211 = v206;
        v212 = v147;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2696C54E8);
        uint64_t v160 = v181;
        sub_24962BE70();
        sub_2495FCC80(&qword_2696C54F0, &qword_2696C5408);
        uint64_t v161 = (uint64_t)v184;
        uint64_t v162 = v183;
        sub_24962C080();
        (*(void (**)(char *, uint64_t))(v182 + 8))(v160, v162);
        swift_bridgeObjectRelease();
        uint64_t v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C54F8);
        uint64_t v164 = *(void *)(v163 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v164 + 48))(v161, 1, v163) == 1)
        {

          sub_2495F73C0(v161, &qword_2696C5410);
          char v77 = 2;
          a2 = v202;
          uint64_t v165 = v204;
          uint64_t v166 = v205;
          id v51 = v198;
          uint64_t v56 = v199;
          uint64_t v55 = v178[0];
        }
        else
        {
          swift_getKeyPath();
          sub_24962BE80();
          swift_release();
          unint64_t v167 = v209;
          unint64_t v168 = v210;
          uint64_t v169 = v161;
          unint64_t v171 = v211;
          uint64_t v170 = v212;
          (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v169, v163);
          uint64_t v172 = MEMORY[0x24C5A43B0](v167, v168, v171, v170);
          uint64_t v174 = v173;
          swift_bridgeObjectRelease();
          if (v172 == 1702195828 && v174 == 0xE400000000000000)
          {

            swift_bridgeObjectRelease();
            char v77 = 1;
            a2 = v202;
            uint64_t v56 = v199;
            uint64_t v55 = v178[0];
          }
          else
          {
            char v175 = sub_24962C6C0();
            id v176 = v201;
            a2 = v202;
            uint64_t v56 = v199;
            uint64_t v55 = v178[0];
            if (v175)
            {

              swift_bridgeObjectRelease();
              char v77 = 1;
            }
            else if (v172 == 0x65736C6166 && v174 == 0xE500000000000000)
            {

              swift_bridgeObjectRelease();
              char v77 = 0;
            }
            else
            {
              char v177 = sub_24962C6C0();

              swift_bridgeObjectRelease();
              char v77 = 0;
              if ((v177 & 1) == 0)
              {
                (*(void (**)(char *, uint64_t))(v205 + 8))(v207, v204);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_28;
              }
            }
          }
          uint64_t v165 = v204;
          uint64_t v166 = v205;
          id v51 = v198;
        }
        (*(void (**)(char *, uint64_t))(v166 + 8))(v207, v165);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v73 = v197;
        uint64_t v57 = v200;
        goto LABEL_33;
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v205 + 8))(v207, v204);
    a2 = v202;
LABEL_28:
    int v140 = (int)v203;
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v140 == 1)
    {
LABEL_31:
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      id v51 = 0;
      goto LABEL_32;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();

  sub_2495F73C0((uint64_t)v45, &qword_2696C5460);
LABEL_7:
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  id v51 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  char v77 = 0;
  a2 = v202;
LABEL_33:
  *(void *)a2 = v55;
  *(void *)(a2 + 8) = v56;
  *(void *)(a2 + 16) = v57;
  *(void *)(a2 + 24) = v51;
  *(void *)(a2 + 32) = v73;
  *(void *)(a2 + 40) = v74;
  *(void *)(a2 + 48) = v75;
  *(void *)(a2 + 56) = v76;
  *(unsigned char *)(a2 + 64) = v77;
}

uint64_t sub_249617514@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 8);
  return result;
}

unint64_t sub_249617520()
{
  unint64_t result = qword_2696C5478;
  if (!qword_2696C5478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5478);
  }
  return result;
}

unint64_t sub_249617574()
{
  unint64_t result = qword_2696C54B0;
  if (!qword_2696C54B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C54B0);
  }
  return result;
}

uint64_t destroy for HTTPDigestAuthenticateInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTTPDigestAuthenticateInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTTPDigestAuthenticateInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HTTPDigestAuthenticateInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPDigestAuthenticateInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPDigestAuthenticateInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPDigestAuthenticateInfo()
{
  return &type metadata for HTTPDigestAuthenticateInfo;
}

uint64_t getEnumTagSinglePayload for HTTPDigestAlgorithm(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HTTPDigestAlgorithm(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x2496179E8);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPDigestAlgorithm()
{
  return &type metadata for HTTPDigestAlgorithm;
}

unint64_t sub_249617A24()
{
  unint64_t result = qword_2696C5500;
  if (!qword_2696C5500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5500);
  }
  return result;
}

unint64_t sub_249617A78()
{
  unint64_t result = qword_2696C5508;
  if (!qword_2696C5508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5508);
  }
  return result;
}

int64_t sub_249617ACC(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    int64_t v3 = result;
    if (result)
    {
      uint64_t v14 = MEMORY[0x263F8EE78];
      sub_2495F7AB8(0, result, 0);
      uint64_t v4 = MEMORY[0x263F8E778];
      uint64_t v5 = MEMORY[0x263F8E7C0];
      do
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D60);
        uint64_t v6 = swift_allocObject();
        *(_OWORD *)(v6 + 16) = xmmword_249630430;
        *(void *)(v6 + 56) = v4;
        *(void *)(v6 + 64) = v5;
        uint64_t v15 = 0;
        MEMORY[0x24C5A50A0](&v15, 8);
        *(unsigned char *)(v6 + 32) = v15;
        uint64_t v7 = sub_24962C110();
        uint64_t v9 = v8;
        unint64_t v11 = *(void *)(v14 + 16);
        unint64_t v10 = *(void *)(v14 + 24);
        if (v11 >= v10 >> 1) {
          sub_2495F7AB8(v10 > 1, v11 + 1, 1);
        }
        *(void *)(v14 + 16) = v11 + 1;
        uint64_t v12 = v14 + 16 * v11;
        *(void *)(v12 + 32) = v7;
        *(void *)(v12 + 40) = v9;
        --v3;
      }
      while (v3);
      uint64_t v2 = a2;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4D68);
    sub_2495FE3E8();
    sub_24962C0B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24962C1B0();
    swift_bridgeObjectRelease();
    return v2;
  }
  return result;
}

uint64_t FileUploadResult.transactionID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24962BE40();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t FileUploadResult.fileTransferInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FileUploadResult() + 20);
  uint64_t v4 = sub_24962BEA0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for FileUploadResult()
{
  uint64_t result = qword_2696C5510;
  if (!qword_2696C5510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FileUploadResult.responseData.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for FileUploadResult() + 24);
  uint64_t v2 = *(void *)v1;
  sub_2495F7E7C(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t *initializeBufferWithCopyOfBuffer for FileUploadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24962BE40();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24962BEA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = *v14;
    unint64_t v16 = v14[1];
    sub_2495F7E7C(*v14, v16);
    *uint64_t v13 = v15;
    v13[1] = v16;
  }
  return a1;
}

uint64_t destroy for FileUploadResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24962BE40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_24962BEA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  uint64_t v8 = *v7;
  unint64_t v9 = v7[1];
  return sub_2495F7470(v8, v9);
}

uint64_t initializeWithCopy for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BE40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24962BEA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (uint64_t *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_2495F7E7C(*v13, v15);
  *uint64_t v12 = v14;
  v12[1] = v15;
  return a1;
}

uint64_t assignWithCopy for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BE40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24962BEA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (uint64_t *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_2495F7E7C(*v13, v15);
  uint64_t v16 = *v12;
  unint64_t v17 = v12[1];
  *uint64_t v12 = v14;
  v12[1] = v15;
  sub_2495F7470(v16, v17);
  return a1;
}

uint64_t initializeWithTake for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BE40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24962BEA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BE40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24962BEA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void *)(a1 + v11);
  unint64_t v13 = *(void *)(a1 + v11 + 8);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  sub_2495F7470(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249618368);
}

uint64_t sub_249618368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BE40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_24962BEA0();
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      uint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
      if (((4 * v14) & 0xC) != 0) {
        return 16 - ((4 * v14) & 0xC | (v14 >> 2));
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2496184A4);
}

uint64_t sub_2496184A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24962BE40();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_24962BEA0();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      unint64_t v15 = (void *)(a1 + *(int *)(a4 + 24));
      *unint64_t v15 = 0;
      v15[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_2496185C4()
{
  uint64_t result = sub_24962BE40();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24962BEA0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t destroy for HTTPBasicAuthenticateResponse()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for HTTPBasicAuthenticateResponse(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HTTPBasicAuthenticateResponse(void *a1, void *a2)
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
  return a1;
}

void *assignWithTake for HTTPBasicAuthenticateResponse(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for HTTPBasicAuthenticateResponse()
{
  return &type metadata for HTTPBasicAuthenticateResponse;
}

uint64_t sub_249618828()
{
  return 0x206369736142;
}

uint64_t sub_249618890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  uint64_t result = sub_24962BBC0();
  if (!result || (uint64_t result = sub_24962BBF0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_24962BBE0();
      a5(0);
      sub_249619A7C(a6, a7);
      return sub_24962BFB0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_249618970(uint64_t a1, unint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24962C030();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24962BFE0();
  uint64_t v22 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249619A7C(&qword_2696C5528, MEMORY[0x263F047F8]);
  sub_24962BFD0();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v21 = v5;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      uint64_t v20 = 0;
      sub_2495F7E7C(a1, a2);
      sub_249618890((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v8, MEMORY[0x263F047F8], &qword_2696C5528, MEMORY[0x263F047F8]);
      sub_2495F7470(a1, a2);
      uint64_t v5 = v21;
      goto LABEL_9;
    case 2uLL:
      uint64_t v20 = 0;
      uint64_t v21 = v5;
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      sub_2495F7E7C(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v15 = v14;
      uint64_t v5 = v21;
      sub_249618890(v15, v13, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v8, MEMORY[0x263F047F8], &qword_2696C5528, MEMORY[0x263F047F8]);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      memset(v24, 0, 14);
      goto LABEL_7;
    default:
      v24[0] = a1;
      LOWORD(v24[1]) = a2;
      BYTE2(v24[1]) = BYTE2(a2);
      BYTE3(v24[1]) = BYTE3(a2);
      BYTE4(v24[1]) = BYTE4(a2);
      BYTE5(v24[1]) = BYTE5(a2);
LABEL_7:
      sub_24962BFB0();
LABEL_8:
      sub_2495F7470(a1, a2);
LABEL_9:
      sub_24962BFC0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      uint64_t v25 = v9;
      uint64_t v26 = sub_249619AC4(&qword_2696C5550, MEMORY[0x263F045C0]);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
      uint64_t v17 = v22;
      (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 16))(boxed_opaque_existential_1, v12, v9);
      __swift_project_boxed_opaque_existential_1(v24, v25);
      sub_24962BC10();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v9);
      uint64_t v18 = v23;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      return v18;
  }
}

uint64_t sub_249618E0C(uint64_t a1, unint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24962C040();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24962BFF0();
  uint64_t v22 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249619A7C(&qword_2696C5558, MEMORY[0x263F04818]);
  sub_24962BFD0();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v21 = v5;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      uint64_t v20 = 0;
      sub_2495F7E7C(a1, a2);
      sub_249618890((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v8, MEMORY[0x263F04818], &qword_2696C5558, MEMORY[0x263F04818]);
      sub_2495F7470(a1, a2);
      uint64_t v5 = v21;
      goto LABEL_9;
    case 2uLL:
      uint64_t v20 = 0;
      uint64_t v21 = v5;
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      sub_2495F7E7C(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v15 = v14;
      uint64_t v5 = v21;
      sub_249618890(v15, v13, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v8, MEMORY[0x263F04818], &qword_2696C5558, MEMORY[0x263F04818]);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      memset(v24, 0, 14);
      goto LABEL_7;
    default:
      v24[0] = a1;
      LOWORD(v24[1]) = a2;
      BYTE2(v24[1]) = BYTE2(a2);
      BYTE3(v24[1]) = BYTE3(a2);
      BYTE4(v24[1]) = BYTE4(a2);
      BYTE5(v24[1]) = BYTE5(a2);
LABEL_7:
      sub_24962BFB0();
LABEL_8:
      sub_2495F7470(a1, a2);
LABEL_9:
      sub_24962BFC0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      uint64_t v25 = v9;
      uint64_t v26 = sub_249619AC4(&qword_2696C5560, MEMORY[0x263F045F0]);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
      uint64_t v17 = v22;
      (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 16))(boxed_opaque_existential_1, v12, v9);
      __swift_project_boxed_opaque_existential_1(v24, v25);
      sub_24962BC10();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v9);
      uint64_t v18 = v23;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      return v18;
  }
}

uint64_t sub_2496192A8(uint64_t a1, unint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24962C050();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24962C060();
  uint64_t v22 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249619A7C(&qword_2696C5540, MEMORY[0x263F04840]);
  sub_24962BFD0();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v21 = v5;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      uint64_t v20 = 0;
      sub_2495F7E7C(a1, a2);
      sub_249618890((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v8, MEMORY[0x263F04840], &qword_2696C5540, MEMORY[0x263F04840]);
      sub_2495F7470(a1, a2);
      uint64_t v5 = v21;
      goto LABEL_9;
    case 2uLL:
      uint64_t v20 = 0;
      uint64_t v21 = v5;
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      sub_2495F7E7C(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v15 = v14;
      uint64_t v5 = v21;
      sub_249618890(v15, v13, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v8, MEMORY[0x263F04840], &qword_2696C5540, MEMORY[0x263F04840]);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      memset(v24, 0, 14);
      goto LABEL_7;
    default:
      v24[0] = a1;
      LOWORD(v24[1]) = a2;
      BYTE2(v24[1]) = BYTE2(a2);
      BYTE3(v24[1]) = BYTE3(a2);
      BYTE4(v24[1]) = BYTE4(a2);
      BYTE5(v24[1]) = BYTE5(a2);
LABEL_7:
      sub_24962BFB0();
LABEL_8:
      sub_2495F7470(a1, a2);
LABEL_9:
      sub_24962BFC0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      uint64_t v25 = v9;
      uint64_t v26 = sub_249619AC4(&qword_2696C5548, MEMORY[0x263F04868]);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
      uint64_t v17 = v22;
      (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 16))(boxed_opaque_existential_1, v12, v9);
      __swift_project_boxed_opaque_existential_1(v24, v25);
      sub_24962BC10();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v9);
      uint64_t v18 = v23;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      return v18;
  }
}

uint64_t sub_249619744(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_24962C010();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v22[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5520);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13, v15);
  uint64_t v17 = (char *)&v22[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[0] = a1;
  v22[1] = a2;
  uint64_t v25 = a3;
  unint64_t v26 = a4;
  sub_2495F7E7C(a3, a4);
  sub_24962C000();
  sub_24962C030();
  sub_249619A7C(&qword_2696C5528, MEMORY[0x263F047F8]);
  sub_2496199E4();
  sub_24962C020();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  uint64_t v23 = v13;
  unint64_t v24 = sub_249619A2C();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v22);
  (*(void (**)(uint64_t *, char *, uint64_t))(v14 + 16))(boxed_opaque_existential_1, v17, v13);
  __swift_project_boxed_opaque_existential_1(v22, v23);
  sub_24962BC10();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  uint64_t v19 = v25;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return v19;
}

unint64_t sub_2496199E4()
{
  unint64_t result = qword_2696C5530;
  if (!qword_2696C5530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5530);
  }
  return result;
}

unint64_t sub_249619A2C()
{
  unint64_t result = qword_2696C5538;
  if (!qword_2696C5538)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696C5520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5538);
  }
  return result;
}

uint64_t sub_249619A7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_249619AC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t FileUploadRequest.init(fileURL:fileContentType:thumbnailURL:thumbnailContentType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_24962BD40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(a5, a1, v10);
  uint64_t v11 = (int *)type metadata accessor for FileUploadRequest();
  sub_2495FA914(a2, a5 + v11[5], &qword_2696C4B08);
  sub_2495FA914(a3, a5 + v11[6], &qword_2696C4AF0);
  return sub_2495FA914(a4, a5 + v11[7], &qword_2696C4B08);
}

uint64_t type metadata accessor for FileUploadRequest()
{
  uint64_t result = qword_2696C5568;
  if (!qword_2696C5568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FileUploadRequest.fileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24962BD40();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t FileUploadRequest.fileContentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FileUploadRequest();
  return sub_2495F7288(v1 + *(int *)(v3 + 20), a1, &qword_2696C4B08);
}

uint64_t FileUploadRequest.thumbnailURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FileUploadRequest();
  return sub_2495F7288(v1 + *(int *)(v3 + 24), a1, &qword_2696C4AF0);
}

uint64_t FileUploadRequest.thumbnailContentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FileUploadRequest();
  return sub_2495F7288(v1 + *(int *)(v3 + 28), a1, &qword_2696C4B08);
}

char *initializeBufferWithCopyOfBuffer for FileUploadRequest(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24962BD40();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v25(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_24962BEE0();
    uint64_t v13 = *(void *)(v12 - 8);
    unint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    if (v26(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v16], 1, v7))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      v25(v17, v18, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v17, 0, 1, v7);
    }
    uint64_t v20 = a3[7];
    uint64_t v21 = &a1[v20];
    uint64_t v22 = &a2[v20];
    if (v26(v22, 1, v12))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v21, v22, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for FileUploadRequest(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_24962BD40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = a1 + a2[5];
  uint64_t v8 = sub_24962BEE0();
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (!v9(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v7, v8);
  }
  uint64_t v10 = a1 + a2[6];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4)) {
    v6(v10, v4);
  }
  uint64_t v11 = a1 + a2[7];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(v11, 1, v8);
  if (!result)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
    return v13(v11, v8);
  }
  return result;
}

char *initializeWithCopy for FileUploadRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v23 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v23(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_24962BEE0();
  uint64_t v12 = *(void *)(v11 - 8);
  unint64_t v24 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v24(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v14], 1, v6))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v23(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  if (v24(v20, 1, v11))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v19, v20, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for FileUploadRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 24);
  v30(a1, a2, v6);
  uint64_t v34 = a3;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_24962BEE0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  uint64_t v31 = v11;
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = *(int *)(v34 + 24);
  uint64_t v32 = a1;
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  int v20 = v19(a1 + v16, 1, v6);
  int v21 = v19((uint64_t)v18, 1, v6);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v17, v18, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v17, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v33 + 8))(v17, v6);
LABEL_12:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  v30((uint64_t)v17, (uint64_t)v18, v6);
LABEL_13:
  uint64_t v23 = *(int *)(v34 + 28);
  unint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  int v26 = v12((void *)(v32 + v23), 1, v10);
  int v27 = v12(v25, 1, v10);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v31 + 24))(v24, v25, v10);
      return v32;
    }
    (*(void (**)(void *, uint64_t))(v31 + 8))(v24, v10);
    goto LABEL_18;
  }
  if (v27)
  {
LABEL_18:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    return v32;
  }
  (*(void (**)(void *, void *, uint64_t))(v31 + 16))(v24, v25, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v24, 0, 1, v10);
  return v32;
}

char *initializeWithTake for FileUploadRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v23 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v23(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_24962BEE0();
  uint64_t v12 = *(void *)(v11 - 8);
  unint64_t v24 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v24(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v14], 1, v6))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v23(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  int v20 = &a2[v18];
  if (v24(v20, 1, v11))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v20, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for FileUploadRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 40);
  v30(a1, a2, v6);
  uint64_t v34 = a3;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_24962BEE0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  uint64_t v31 = v11;
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = *(int *)(v34 + 24);
  uint64_t v32 = a1;
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  int v20 = v19(a1 + v16, 1, v6);
  int v21 = v19((uint64_t)v18, 1, v6);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, const void *, uint64_t))(v33 + 32))(v17, v18, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v17, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v33 + 8))(v17, v6);
LABEL_12:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  v30((uint64_t)v17, (uint64_t)v18, v6);
LABEL_13:
  uint64_t v23 = *(int *)(v34 + 28);
  unint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  int v26 = v12((void *)(v32 + v23), 1, v10);
  int v27 = v12(v25, 1, v10);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v31 + 40))(v24, v25, v10);
      return v32;
    }
    (*(void (**)(void *, uint64_t))(v31 + 8))(v24, v10);
    goto LABEL_18;
  }
  if (v27)
  {
LABEL_18:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    return v32;
  }
  (*(void (**)(void *, void *, uint64_t))(v31 + 32))(v24, v25, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v24, 0, 1, v10);
  return v32;
}

uint64_t getEnumTagSinglePayload for FileUploadRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24961B044);
}

uint64_t sub_24961B044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24962BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for FileUploadRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24961B1AC);
}

uint64_t sub_24961B1AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24962BD40();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4B08);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

void sub_24961B30C()
{
  sub_24962BD40();
  if (v0 <= 0x3F)
  {
    sub_24961B430(319, (unint64_t *)&qword_2696C4FE8, MEMORY[0x270FCDEA0]);
    if (v1 <= 0x3F)
    {
      sub_24961B430(319, (unint64_t *)&qword_2696C4BD8, MEMORY[0x270FA8E28]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_24961B430(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24962C450();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24961B484()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C5578);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696C5578);
  return sub_24962BF30();
}

uint64_t sub_24961B4F8(uint64_t a1, uint64_t a2)
{
  if (*(void *)&v2[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status] == 2)
  {
    uint64_t v3 = v2;
    uint64_t v6 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream;
    uint64_t v7 = *(void **)&v2[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream];
    unint64_t v8 = 0x2696C4000uLL;
    uint64_t v67 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream;
    if (v7)
    {
LABEL_6:
      id v12 = v7;
      if (!objc_msgSend(v12, sel_streamStatus))
      {
        if (*(void *)(v8 + 2560) != -1) {
          swift_once();
        }
        uint64_t v13 = sub_24962BF40();
        __swift_project_value_buffer(v13, (uint64_t)qword_2696C5578);
        id v14 = v12;
        uint64_t v15 = sub_24962BF20();
        os_log_type_t v16 = sub_24962C3F0();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = (uint8_t *)swift_slowAlloc();
          uint64_t v18 = swift_slowAlloc();
          v69[0] = v18;
          *(_DWORD *)uint64_t v17 = 136315138;
          uint64_t v70 = (uint64_t)v14;
          sub_24961C56C();
          id v19 = v14;
          uint64_t v20 = sub_24962C140();
          uint64_t v70 = sub_2495F74C8(v20, v21, v69);
          sub_24962C490();

          unint64_t v8 = 0x2696C4000;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2495EB000, v15, v16, "Opening stream: %s", v17, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5A5090](v18, -1, -1);
          MEMORY[0x24C5A5090](v17, -1, -1);

          objc_msgSend(v14, sel_open, a1);
        }
        else
        {

          objc_msgSend(v14, sel_open, v64);
        }
      }
      if (*(void *)(v8 + 2560) != -1) {
        swift_once();
      }
      uint64_t v23 = sub_24962BF40();
      uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)qword_2696C5578);
      uint64_t v25 = v12;
      int v26 = sub_24962BF20();
      os_log_type_t v27 = sub_24962C3F0();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v66 = v3;
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = v24;
        uint64_t v29 = swift_slowAlloc();
        v69[0] = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        uint64_t v70 = (uint64_t)v25;
        sub_24961C56C();
        uint64_t v30 = v25;
        uint64_t v31 = sub_24962C140();
        uint64_t v70 = sub_2495F74C8(v31, v32, v69);
        sub_24962C490();

        uint64_t v3 = v66;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2495EB000, v26, v27, "Reading from stream %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5A5090](v29, -1, -1);
        MEMORY[0x24C5A5090](v28, -1, -1);
      }
      else
      {
      }
      uint64_t v33 = (uint64_t)-[NSObject read:maxLength:](v25, sel_read_maxLength_, a1, a2, v64);
      id v22 = (id)v33;
      if (v33 < 1)
      {
        if (v33)
        {
          id v37 = [v25 streamError];
          uint64_t v38 = *(void **)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError];
          *(void *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError] = v37;

          uint64_t v34 = v25;
        }
        else
        {
          uint64_t v34 = v25;
          uint64_t v39 = sub_24962BF20();
          uint64_t v40 = sub_24962C3F0();
          if (os_log_type_enabled(v39, (os_log_type_t)v40))
          {
            uint64_t v41 = (uint8_t *)swift_slowAlloc();
            uint64_t v42 = swift_slowAlloc();
            v69[0] = v42;
            *(_DWORD *)uint64_t v41 = 136315138;
            uint64_t v70 = (uint64_t)v34;
            sub_24961C56C();
            uint64_t v65 = a1;
            uint64_t v43 = v34;
            uint64_t v44 = sub_24962C140();
            uint64_t v70 = sub_2495F74C8(v44, v45, v69);
            sub_24962C490();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2495EB000, v39, (os_log_type_t)v40, "Closing stream: %s", v41, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5A5090](v42, -1, -1);
            MEMORY[0x24C5A5090](v41, -1, -1);
          }
          else
          {
          }
          [v34 close];
          uint64_t v46 = *(void **)&v3[v67];
          *(void *)&v3[v67] = 0;

          id v22 = objc_msgSend(v3, sel_read_maxLength_, a1, a2);
        }
      }
      else
      {
        uint64_t v34 = sub_24962BF20();
        os_log_type_t v35 = sub_24962C3F0();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v36 = 134217984;
          v69[0] = (uint64_t)v22;
          sub_24962C490();
          _os_log_impl(&dword_2495EB000, v34, v35, "Read %ld bytes", v36, 0xCu);
          MEMORY[0x24C5A5090](v36, -1, -1);
        }
        else
        {

          uint64_t v34 = v25;
        }
      }
LABEL_44:

      return (uint64_t)v22;
    }
    uint64_t v9 = (unint64_t *)&v2[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streamIterator];
    swift_beginAccess();
    unint64_t v11 = *v9;
    unint64_t v10 = v9[1];
    if (*v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_24962C5D0();
      swift_bridgeObjectRelease();
      if (v10 == v47)
      {
LABEL_5:
        swift_endAccess();
        uint64_t v7 = *(void **)&v3[v6];
        if (v7) {
          goto LABEL_6;
        }
LABEL_39:
        if (*(void *)(v8 + 2560) != -1) {
          swift_once();
        }
        uint64_t v60 = sub_24962BF40();
        __swift_project_value_buffer(v60, (uint64_t)qword_2696C5578);
        uint64_t v34 = sub_24962BF20();
        os_log_type_t v61 = sub_24962C3E0();
        if (os_log_type_enabled(v34, v61))
        {
          uint64_t v62 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v62 = 0;
          _os_log_impl(&dword_2495EB000, v34, v61, "No more streams to read from", v62, 2u);
          MEMORY[0x24C5A5090](v62, -1, -1);
        }
        id v22 = 0;
        goto LABEL_44;
      }
    }
    else if (v10 == *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    unint64_t v48 = *v9;
    if ((*v9 & 0xC000000000000001) == 0)
    {
      if ((v10 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v10 < *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v49 = *(id *)(v48 + 8 * v10 + 32);
        goto LABEL_33;
      }
      __break(1u);
      goto LABEL_49;
    }
    id v49 = (id)MEMORY[0x24C5A47A0](v10);
LABEL_33:
    unint64_t v11 = (unint64_t)v49;
    if (!__OFADD__(v10, 1))
    {
      v9[1] = v10 + 1;
      swift_endAccess();
      if (qword_2696C4A00 == -1) {
        goto LABEL_35;
      }
      goto LABEL_50;
    }
LABEL_49:
    __break(1u);
LABEL_50:
    swift_once();
LABEL_35:
    uint64_t v50 = sub_24962BF40();
    __swift_project_value_buffer(v50, (uint64_t)qword_2696C5578);
    id v51 = (id)v11;
    unint64_t v52 = sub_24962BF20();
    os_log_type_t v53 = sub_24962C3F0();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v68 = a2;
      unint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      v69[0] = v55;
      *(_DWORD *)unint64_t v54 = 136315138;
      uint64_t v70 = (uint64_t)v51;
      sub_24961C56C();
      id v56 = v51;
      uint64_t v57 = sub_24962C140();
      uint64_t v70 = sub_2495F74C8(v57, v58, v69);
      uint64_t v6 = v67;
      sub_24962C490();

      a2 = v68;
      unint64_t v8 = 0x2696C4000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2495EB000, v52, v53, "Advancing to next stream %s", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v55, -1, -1);
      MEMORY[0x24C5A5090](v54, -1, -1);
    }
    else
    {
    }
    unint64_t v59 = *(void **)&v3[v6];
    *(void *)&v3[v6] = v51;

    uint64_t v7 = *(void **)&v3[v6];
    if (v7) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
  return -1;
}

void sub_24961BEF4()
{
  uint64_t v1 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status;
  if (*(void *)(v0 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status) != 2)
  {
    uint64_t v2 = v0;
    if (qword_2696C4A00 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24962BF40();
    __swift_project_value_buffer(v3, (uint64_t)qword_2696C5578);
    unint64_t v4 = sub_24962BF20();
    os_log_type_t v5 = sub_24962C3F0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2495EB000, v4, v5, "Opening stream", v6, 2u);
      MEMORY[0x24C5A5090](v6, -1, -1);
    }

    uint64_t v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streamIterator);
    swift_beginAccess();
    unint64_t v8 = v7[1];
    if ((unint64_t)*v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_24962C5D0();
      swift_bridgeObjectRelease();
      if (v8 == v10) {
        goto LABEL_8;
      }
    }
    else if (v8 == *(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_8:
      id v9 = 0;
LABEL_16:
      swift_endAccess();
      uint64_t v13 = *(void **)(v2 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream);
      *(void *)(v2 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream) = v9;

      *(void *)(v2 + v1) = 2;
      return;
    }
    uint64_t v11 = *v7;
    if ((*v7 & 0xC000000000000001) == 0)
    {
      if ((v8 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v8 < *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v12 = *(id *)(v11 + 8 * v8 + 32);
        goto LABEL_14;
      }
      __break(1u);
      goto LABEL_21;
    }
    id v12 = (id)MEMORY[0x24C5A47A0](v8);
LABEL_14:
    id v9 = v12;
    if (!__OFADD__(v8, 1))
    {
      v7[1] = v8 + 1;
      goto LABEL_16;
    }
LABEL_21:
    __break(1u);
  }
}

void sub_24961C128()
{
  uint64_t v1 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status;
  if (*(void *)(v0 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status) != 6)
  {
    uint64_t v2 = v0;
    if (qword_2696C4A00 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24962BF40();
    __swift_project_value_buffer(v3, (uint64_t)qword_2696C5578);
    unint64_t v4 = sub_24962BF20();
    os_log_type_t v5 = sub_24962C3F0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2495EB000, v4, v5, "Closing stream", v6, 2u);
      MEMORY[0x24C5A5090](v6, -1, -1);
    }

    *(void *)(v2 + v1) = 6;
  }
}

id sub_24961C448()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AggregateInputStream();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AggregateInputStream()
{
  return self;
}

uint64_t sub_24961C50C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C55B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24961C56C()
{
  unint64_t result = qword_2696C55C0;
  if (!qword_2696C55C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696C55C0);
  }
  return result;
}

uint64_t sub_24961C5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4ED8);
  v5[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24961C670, v4, 0);
}

uint64_t sub_24961C670()
{
  uint64_t v1 = *(void **)(v0 + 48);
  if (!v1[14])
  {
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v2 = *(void *)(v0 + 64);
    unint64_t v4 = (char *)v1 + *(void *)(*v1 + 112);
    uint64_t v5 = sub_24962C340();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56B0);
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = *(void *)(v7 + 64);
    uint64_t v9 = swift_task_alloc();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v9, v4, v6);
    unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = 0;
    *(void *)(v11 + 24) = 0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(v11 + v10, v9, v6);
    *(void *)(v11 + ((v8 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v3;
    swift_task_dealloc();
    v1[14] = sub_24961D8AC(v2, (uint64_t)&unk_2696C5700, v11);
    swift_release();
    uint64_t v1 = *(void **)(v0 + 48);
  }
  uint64_t v12 = *(void *)(v0 + 40);
  uint64_t v13 = sub_24960C5D8(&qword_2696C56E8, &qword_2696C56A8);
  uint64_t v14 = swift_task_alloc();
  *(void *)(v0 + 72) = v14;
  *(_OWORD *)(v14 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v14 + 32) = v12;
  *(void *)(v14 + 40) = v1;
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56F0);
  *uint64_t v15 = v0;
  v15[1] = sub_24961C934;
  uint64_t v17 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v17, v1, v13, 0xD000000000000017, 0x800000024962DE30, sub_24962B518, v14, v16);
}

uint64_t sub_24961C934()
{
  uint64_t v2 = (void *)*v1;
  v2[11] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[6];
    return MEMORY[0x270FA2498](sub_24961CA7C, v3, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24961CA7C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24961CAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v38 = a5;
  v36[2] = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56C0);
  uint64_t v10 = v9 - 8;
  uint64_t v11 = *(void *)(*(void *)(v9 - 8) + 64);
  MEMORY[0x270FA5388](v9, v12);
  unint64_t v37 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = (char *)v36 - v37;
  uint64_t v14 = sub_24962BB70();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a2, v14);
  uint64_t v15 = &v13[*(int *)(v10 + 48)];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5718);
  uint64_t v17 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 16);
  v36[0] = v16;
  v36[1] = a1;
  v17(v15, a1);
  uint64_t v18 = &v13[*(int *)(v10 + 44)];
  *(void *)uint64_t v18 = a3;
  *((void *)v18 + 1) = a4;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5728);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388](v19, v22);
  unint64_t v23 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56B8);
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24, v26);
  uint64_t v28 = (char *)v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v38 + *(void *)(*(void *)v38 + 120), v24);
  MEMORY[0x270FA5388](v29, v30);
  sub_2495F7288((uint64_t)v13, (uint64_t)v36 - v37, &qword_2696C56C0);
  swift_retain();
  sub_24962C370();
  uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v28, v24);
  MEMORY[0x270FA5388](v31, v32);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))((char *)v36 - v23, (char *)v36 - v23, v19);
  int v33 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))((char *)v36 - v23, v19);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v20 + 8);
  if (v33 != *MEMORY[0x263F8F668])
  {
    v34((char *)v36 - v23, v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5730);
    sub_24960C5D8(&qword_2696C5738, &qword_2696C5730);
    uint64_t v39 = swift_allocError();
    sub_24962C2F0();
  }
  v34((char *)v36 - v23, v19);
  return sub_2495F73C0((uint64_t)v13, &qword_2696C56C0);
}

uint64_t sub_24961CEC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 88) = a4;
  return MEMORY[0x270FA2498](sub_24961CEE8, 0, 0);
}

uint64_t sub_24961CEE8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5708);
  v0[12] = v1;
  v0[13] = *(void *)(v1 - 8);
  v0[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56B0);
  sub_24962C390();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5710);
  v0[15] = swift_task_alloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[16] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24961D048;
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[12];
  return MEMORY[0x270FA20F8](v3, 0, 0, v4, v0 + 8);
}

uint64_t sub_24961D048()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_24961D500;
  }
  else {
    uint64_t v1 = sub_24961D158;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_24961D158()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56C0);
  v0[17] = v2;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    v0[18] = v5;
    sub_2495FA914(v1, v5, &qword_2696C56C0);
    if (sub_24962C350())
    {
      uint64_t v6 = v5 + *(int *)(v2 + 40);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5718);
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = swift_task_alloc();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v6, v7);
      sub_24962C320();
      sub_24962B6E8();
      uint64_t v10 = swift_allocError();
      sub_24962C070();
      v0[10] = v10;
      sub_24962C2F0();
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
      swift_task_dealloc();
      sub_2495F73C0(v5, &qword_2696C56C0);
      swift_task_dealloc();
      uint64_t v11 = (void *)swift_task_alloc();
      v0[16] = v11;
      void *v11 = v0;
      v11[1] = sub_24961D048;
      uint64_t v12 = v0[15];
      uint64_t v13 = v0[12];
      return MEMORY[0x270FA20F8](v12, 0, 0, v13, v0 + 8);
    }
    else
    {
      uint64_t v15 = (uint64_t (*)(void *, uint64_t))(*(void *)(v5 + *(int *)(v2 + 36))
                                                      + **(int **)(v5 + *(int *)(v2 + 36)));
      uint64_t v14 = (void *)swift_task_alloc();
      v0[19] = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_24961D590;
      return v15(v0 + 2, v5);
    }
  }
}

uint64_t sub_24961D500()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24961D590()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24961D7AC;
  }
  else {
    uint64_t v2 = sub_24961D6A4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24961D6A4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5718);
  sub_24962C300();
  sub_2495F73C0(*(void *)(v0 + 144), &qword_2696C56C0);
  swift_task_dealloc();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24961D048;
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 96);
  return MEMORY[0x270FA20F8](v3, 0, 0, v4, v0 + 64);
}

uint64_t sub_24961D7AC()
{
  v0[9] = v0[20];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5718);
  sub_24962C2F0();
  sub_2495F73C0(v0[18], &qword_2696C56C0);
  swift_task_dealloc();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[16] = v1;
  void *v1 = v0;
  v1[1] = sub_24961D048;
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[12];
  return MEMORY[0x270FA20F8](v2, 0, 0, v3, v0 + 8);
}

uint64_t sub_24961D8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24962C340();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24962C330();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2495F73C0(a1, &qword_2696C4ED8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24962C2E0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24961DA34@<X0>(id a1@<X1>, char *a2@<X0>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  char v7 = *a2;
  id v8 = objc_msgSend(a1, sel_identity);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(v8, sel_impi);

    uint64_t v11 = sub_24962C0F0();
    uint64_t v32 = v12;
    uint64_t v33 = v11;
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }
  id v13 = objc_msgSend(a1, sel_fileTransferCapabilities);
  if (v13
    && (uint64_t v14 = v13, v15 = objc_msgSend(v13, sel_userName), v14, v15))
  {
    uint64_t v31 = sub_24962C0F0();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v17 = 0;
  }
  id v18 = objc_msgSend(a1, sel_fileTransferCapabilities);
  if (v18
    && (uint64_t v19 = v18, v20 = objc_msgSend(v18, sel_password), v19, v20))
  {
    uint64_t v21 = sub_24962C0F0();
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v23 = 0;
  }
  id v24 = objc_msgSend(a1, sel_bsfPort);
  uint64_t v25 = v24;
  uint64_t v26 = a3;
  if (v24)
  {
    id v27 = objc_msgSend(v24, sel_integerValue);
  }
  else
  {
    id v27 = 0;
  }
  BOOL v28 = v25 == 0;
  unsigned __int8 v29 = objc_msgSend(a1, sel_bsfUsesSecureTransport);

  *(unsigned char *)a4 = v7;
  *(void *)(a4 + 8) = v33;
  *(void *)(a4 + 16) = v32;
  *(void *)(a4 + 24) = v31;
  *(void *)(a4 + 32) = v17;
  *(void *)(a4 + 40) = v21;
  *(void *)(a4 + 48) = v23;
  *(void *)(a4 + 56) = v27;
  *(unsigned char *)(a4 + 64) = v28;
  *(unsigned char *)(a4 + 65) = v29;
  return sub_2495F0788(v26, a4 + 72);
}

uint64_t sub_24961DC3C()
{
  uint64_t v0 = sub_24962BF40();
  __swift_allocate_value_buffer(v0, qword_2696C55C8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2696C55C8);
  if (qword_2696C49F8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2696C7C80);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t (*sub_24961DD04())()
{
  return j__swift_endAccess;
}

uint64_t sub_24961DD5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_24961DD80, v3, 0);
}

uint64_t sub_24961DD80()
{
  uint64_t v1 = sub_24962BB70();
  v0[6] = v1;
  v0[7] = *(void *)(v1 - 8);
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  sub_249611E9C(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v3 = swift_task_alloc();
  sub_24962BB50();
  uint64_t v4 = sub_24962BD40();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_2495F73C0(v3, &qword_2696C4AF0);
    swift_task_dealloc();
LABEL_7:
    sub_249613EDC();
    swift_allocError();
    *id v15 = xmmword_249631460;
    swift_willThrow();
    (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
  uint64_t v6 = sub_24962BCE0();
  uint64_t v8 = v7;
  v0[9] = v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_task_dealloc();
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v10 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v11 = v0[3];
  uint64_t v12 = (void *)swift_allocObject();
  v0[10] = v12;
  uint64_t v12[2] = v9;
  uint64_t v12[3] = v6;
  void v12[4] = v8;
  v12[5] = v11;
  v12[6] = v10;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v13 = (void *)swift_task_alloc();
  v0[11] = v13;
  *id v13 = v0;
  v13[1] = sub_24961E0A0;
  return sub_24961F22C(v2, v6, v8, (uint64_t)&unk_2696C5768, (uint64_t)v12);
}

uint64_t sub_24961E0A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)*v4;
  v8[12] = v3;
  swift_task_dealloc();
  uint64_t v9 = v8[5];
  swift_release();
  swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v10 = sub_24961E2B0;
  }
  else
  {
    v8[13] = a3;
    v8[14] = a2;
    v8[15] = a1;
    uint64_t v10 = sub_24961E228;
  }
  return MEMORY[0x270FA2498](v10, v9, 0);
}

uint64_t sub_24961E228()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  uint64_t v3 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v4 = v0[13];
  return v1(v2, v3, v4);
}

uint64_t sub_24961E2B0()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24961E330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *id v13 = v6;
  v13[1] = sub_24962BAAC;
  v13[25] = a6;
  v13[26] = a2;
  v13[23] = a4;
  unsigned char v13[24] = a5;
  v13[21] = a1;
  v13[22] = a3;
  return MEMORY[0x270FA2498](sub_24961FFE8, a2, 0);
}

uint64_t sub_24961E408(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24961E42C, v2, 0);
}

uint64_t sub_24961E42C()
{
  uint64_t v1 = sub_24962BB70();
  v0[5] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[6] = v2;
  uint64_t v3 = swift_task_alloc();
  v0[7] = v3;
  sub_249611E9C(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v4 = swift_task_alloc();
  sub_24962BB50();
  uint64_t v5 = sub_24962BD40();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_2495F73C0(v4, &qword_2696C4AF0);
    swift_task_dealloc();
LABEL_7:
    sub_249613EDC();
    swift_allocError();
    *uint64_t v16 = xmmword_249631460;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
  uint64_t v7 = sub_24962BCE0();
  uint64_t v9 = v8;
  v0[8] = v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = v0[4];
  uint64_t v11 = swift_task_alloc();
  v0[9] = v11;
  (*(void (**)(void))(v6 + 16))();
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  v0[10] = v13;
  *(void *)(v13 + 16) = v10;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v13 + v12, v11, v5);
  swift_retain();
  uint64_t v14 = (void *)swift_task_alloc();
  v0[11] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_24961E79C;
  return sub_24961F22C(v3, v7, v9, (uint64_t)&unk_2696C5758, v13);
}

uint64_t sub_24961E79C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  *(void *)(*v4 + 96) = v3;
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v9 = *(void *)(v8 + 32);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_24961E9B8;
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v12 = *(void *)(v8 + 32);
    swift_release();
    swift_bridgeObjectRelease();
    *(void *)(v8 + 104) = a3;
    swift_task_dealloc();
    sub_2495F7470(a1, a2);
    uint64_t v10 = sub_24961E934;
    uint64_t v11 = v12;
  }
  return MEMORY[0x270FA2498](v10, v11, 0);
}

uint64_t sub_24961E934()
{
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[13];
  return v1(v2);
}

uint64_t sub_24961E9B8()
{
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24961EA40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_24961EB00;
  v7[13] = a3;
  v7[14] = a2;
  v7[12] = a1;
  return MEMORY[0x270FA2498](sub_249623FC8, a2, 0);
}

uint64_t sub_24961EB00(uint64_t a1)
{
  uint64_t v9 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 8);
  if (!v1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xC000000000000000;
    uint64_t v6 = a1;
  }
  return v7(v4, v5, v6);
}

uint64_t sub_24961EC08(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24961EC28, v1, 0);
}

uint64_t sub_24961EC28()
{
  uint64_t v1 = sub_24962BB70();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  uint64_t v2 = swift_task_alloc();
  v0[6] = v2;
  sub_249611E9C(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v3 = swift_task_alloc();
  sub_24962BB50();
  uint64_t v4 = sub_24962BD40();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_2495F73C0(v3, &qword_2696C4AF0);
    swift_task_dealloc();
LABEL_7:
    sub_249613EDC();
    swift_allocError();
    *uint64_t v12 = xmmword_249631460;
    swift_willThrow();
    (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  uint64_t v6 = sub_24962BCE0();
  uint64_t v8 = v7;
  v0[7] = v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_task_dealloc();
  if (!v8) {
    goto LABEL_7;
  }
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[8] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24961EEFC;
  uint64_t v10 = v0[3];
  return sub_24961F22C(v2, v6, v8, (uint64_t)&unk_2696C5748, v10);
}

uint64_t sub_24961EEFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)*v4;
  v8[9] = v3;
  swift_task_dealloc();
  uint64_t v9 = v8[3];
  swift_release();
  swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v10 = sub_24961F0FC;
  }
  else
  {
    v8[10] = a3;
    v8[11] = a2;
    v8[12] = a1;
    uint64_t v10 = sub_24961F074;
  }
  return MEMORY[0x270FA2498](v10, v9, 0);
}

uint64_t sub_24961F074()
{
  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v4 = v0[10];
  return v1(v2, v3, v4);
}

uint64_t sub_24961F0FC()
{
  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24961F17C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2495ECC6C;
  v5[16] = a1;
  v5[17] = a2;
  return MEMORY[0x270FA2498](sub_249625704, a2, 0);
}

uint64_t sub_24961F22C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[15] = a5;
  v6[16] = v5;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5678);
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URLSessionAuthenticator.RequestState();
  v6[19] = v7;
  v6[20] = *(void *)(v7 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24961F344, v5, 0);
}

uint64_t sub_24961F344()
{
  uint64_t v1 = v0[16] + 264;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  if (!*(void *)(*(void *)v1 + 16))
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[20] + 56))(v0[18], 1, 1, v0[19]);
LABEL_7:
    uint64_t v11 = (char **)v0[22];
    uint64_t v12 = v0[19];
    uint64_t v34 = v12;
    uint64_t v35 = v0[17];
    uint64_t v36 = v0[20];
    uint64_t v37 = v0[13];
    uint64_t v38 = v0[12];
    sub_2495F73C0(v0[18], &qword_2696C5678);
    uint64_t v33 = v11;
    v11[1] = 0;
    uint64_t v13 = (char *)v11 + *(int *)(v12 + 24);
    uint64_t v14 = sub_24962BE10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56A8);
    uint64_t v15 = (char *)swift_allocObject();
    swift_defaultActor_initialize();
    *((void *)v15 + 14) = 0;
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56B0);
    uint64_t v16 = *(void *)(v32 - 8);
    uint64_t v17 = swift_task_alloc();
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56B8);
    uint64_t v18 = *(void *)(v31 - 8);
    uint64_t v19 = swift_task_alloc();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56C0);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56C8);
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = swift_task_alloc();
    (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v22, *MEMORY[0x263F8F680], v20);
    sub_24962C360();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v20);
    swift_task_dealloc();
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(&v15[*(void *)(*(void *)v15 + 112)], v17, v32);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(&v15[*(void *)(*(void *)v15 + 120)], v19, v31);
    swift_task_dealloc();
    swift_task_dealloc();
    *uint64_t v33 = v15;
    sub_24962B06C((uint64_t)v33, v35);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v35, 0, 1, v34);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24961FB98(v35, v38, v37);
    swift_endAccess();
    goto LABEL_9;
  }
  uint64_t v4 = v0[12];
  uint64_t v3 = v0[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_249629C58(v4, v3);
  if (v6)
  {
    sub_24962B06C(*(void *)(v2 + 56) + *(void *)(v0[20] + 72) * v5, v0[18]);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  uint64_t v9 = v0[19];
  uint64_t v8 = v0[20];
  uint64_t v10 = v0[18];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v10, v7, 1, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v10, 1, v9) == 1) {
    goto LABEL_7;
  }
  uint64_t v23 = v0[21];
  uint64_t v24 = v0[22];
  sub_24962AFA8(v0[18], v23);
  sub_24962AFA8(v23, v24);
LABEL_9:
  uint64_t v26 = v0[14];
  uint64_t v25 = v0[15];
  v0[23] = *(void *)v0[22];
  uint64_t v27 = swift_allocObject();
  v0[24] = v27;
  *(void *)(v27 + 16) = v26;
  *(void *)(v27 + 24) = v25;
  uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2696C56E0 + dword_2696C56E0);
  swift_retain();
  swift_retain();
  BOOL v28 = (void *)swift_task_alloc();
  v0[25] = v28;
  *BOOL v28 = v0;
  v28[1] = sub_24961F8B8;
  uint64_t v29 = v0[11];
  return v39((uint64_t)(v0 + 8), v29, (uint64_t)&unk_2696C56D8, v27);
}

uint64_t sub_24961F8B8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v4 = sub_24961FAF0;
  }
  else {
    uint64_t v4 = sub_24961FA24;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24961FA24()
{
  sub_24962B00C(v0[22], (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  return v4(v1, v2, v3);
}

uint64_t sub_24961FAF0()
{
  sub_24962B00C(*(void *)(v0 + 176), (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24961FB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5678);
  MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for URLSessionAuthenticator.RequestState();
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 48))(a1, 1) == 1)
  {
    sub_2495F73C0(a1, &qword_2696C5678);
    sub_249629CD0(a2, a3, (uint64_t)v11);
    swift_bridgeObjectRelease();
    return sub_2495F73C0((uint64_t)v11, &qword_2696C5678);
  }
  else
  {
    sub_24962AFA8(a1, (uint64_t)v15);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    sub_24962A414((uint64_t)v15, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v4 = v20;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24961FD50(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *unint64_t v5 = v3;
  v5[1] = sub_24961FE2C;
  return v7(a2);
}

uint64_t sub_24961FE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    uint64_t v10 = *(void **)(v8 + 16);
    *uint64_t v10 = a1;
    v10[1] = a2;
    long long v10[2] = a3;
  }
  uint64_t v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t sub_24961FF50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[25] = a5;
  v6[26] = v5;
  v6[23] = a3;
  v6[24] = a4;
  v6[21] = a1;
  v6[22] = a2;
  return MEMORY[0x270FA2498](sub_24961FFE8, v5, 0);
}

uint64_t sub_24961FFE8()
{
  uint64_t v35 = v0;
  v34[1] = *MEMORY[0x263EF8340];
  if (qword_2696C4A08 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[21];
  uint64_t v2 = sub_24962BF40();
  v0[27] = __swift_project_value_buffer(v2, (uint64_t)qword_2696C55C8);
  uint64_t v3 = sub_24962BB70();
  v0[28] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  v0[29] = v4;
  v0[30] = *(void *)(v4 + 64);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v6, v1, v3);
  uint64_t v33 = swift_task_alloc();
  v7(v33, v1, v3);
  uint64_t v8 = swift_task_alloc();
  v7(v8, v1, v3);
  uint64_t v9 = sub_24962BF20();
  os_log_type_t v10 = sub_24962C3E0();
  if (os_log_type_enabled(v9, v10))
  {
    log = v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v34[0] = v30;
    *(_DWORD *)uint64_t v11 = 136315650;
    uint64_t v12 = sub_24962BAD0();
    if (v13)
    {
      unint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 5522759;
      unint64_t v14 = 0xE300000000000000;
    }
    v0[17] = sub_2495F74C8(v12, v14, v34);
    sub_24962C490();
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v15(v6, v3);
    *(_WORD *)(v11 + 12) = 2080;
    sub_24962B2CC(&qword_2696C50C8, MEMORY[0x270FA7D48]);
    uint64_t v16 = sub_24962C6B0();
    v0[18] = sub_2495F74C8(v16, v17, v34);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v15(v33, v3);
    *(_WORD *)(v11 + 22) = 2080;
    unint64_t v18 = sub_24962BB20();
    if (!v18) {
      unint64_t v18 = sub_249621D04(MEMORY[0x263F8EE78]);
    }
    v0[19] = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5648);
    uint64_t v19 = sub_24962C140();
    v0[20] = sub_2495F74C8(v19, v20, v34);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v15(v8, v3);
    _os_log_impl(&dword_2495EB000, log, v10, "Sending upload: %s %s: %s ", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v30, -1, -1);
    MEMORY[0x24C5A5090](v11, -1, -1);
  }
  else
  {
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v15(v6, v3);
    v15(v33, v3);
    v15(v8, v3);
  }
  v0[31] = v15;
  uint64_t v21 = (void *)v0[26];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v22 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ManualAuthTaskDelegate()), sel_init);
  v0[32] = v22;
  uint64_t v23 = v21 + 23;
  uint64_t v24 = v21[26];
  uint64_t v25 = v21[27];
  __swift_project_boxed_opaque_existential_1(v23, v24);
  uint64_t v32 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))(*(void *)(v25 + 8) + **(int **)(v25 + 8));
  id v26 = v22;
  uint64_t v27 = (void *)swift_task_alloc();
  v0[33] = v27;
  void *v27 = v0;
  v27[1] = sub_249620550;
  uint64_t v28 = v0[21];
  return v32(v28, v22, v24, v25);
}

uint64_t sub_249620550(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v8 = *v4;
  *(void *)(*v4 + 272) = v3;
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v9 = *(void *)(v8 + 208);
    os_log_type_t v10 = sub_249621680;
  }
  else
  {
    uint64_t v11 = *(void **)(v8 + 256);
    uint64_t v12 = *(void *)(v8 + 208);
    sub_2495F7470(a1, a2);

    os_log_type_t v10 = sub_2496206E8;
    uint64_t v9 = v12;
  }
  return MEMORY[0x270FA2498](v10, v9, 0);
}

uint64_t sub_2496206E8()
{
  id v1 = *(id *)(v0 + 256);
  uint64_t v2 = sub_24962BF20();
  os_log_type_t v3 = sub_24962C3F0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(char **)(v0 + 256);
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    uint64_t v8 = *(void **)&v5[OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse];
    if (v8)
    {
      *(void *)(v0 + 128) = v8;
      id v9 = v8;
    }
    else
    {
      *(void *)(v0 + 120) = 0;
    }
    sub_24962C490();
    uint64_t v11 = *(void **)(v0 + 256);
    void *v7 = v8;

    _os_log_impl(&dword_2495EB000, v2, v3, "%@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v7, -1, -1);
    MEMORY[0x24C5A5090](v6, -1, -1);
    os_log_type_t v10 = *(NSObject **)(v0 + 256);
  }
  else
  {

    os_log_type_t v10 = *(NSObject **)(v0 + 256);
    uint64_t v2 = v10;
  }

  uint64_t v12 = *(Class *)((char *)&v10->isa + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_task);
  *(void *)(v0 + 280) = v12;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = sub_24962BF20();
    os_log_type_t v15 = sub_24962C3E0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2495EB000, v14, v15, "Processing initial upload response", v16, 2u);
      MEMORY[0x24C5A5090](v16, -1, -1);
    }
    uint64_t v17 = *(void *)(v0 + 256);

    unint64_t v18 = *(void **)(v17 + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse);
    *(void *)(v0 + 288) = v18;
    id v19 = v18;
    unint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v20;
    *unint64_t v20 = v0;
    v20[1] = sub_249620AE0;
    uint64_t v21 = *(void *)(v0 + 208);
    v20[73] = v21;
    v20[72] = v18;
    v20[71] = v13;
    v20[70] = v0 + 16;
    return MEMORY[0x270FA2498](sub_249621F00, v21, 0);
  }
  else
  {
    id v22 = sub_24962BF20();
    os_log_type_t v23 = sub_24962C400();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_2495EB000, v22, v23, "Initial upload request completed, but task was never set", v24, 2u);
      MEMORY[0x24C5A5090](v24, -1, -1);
    }
    uint64_t v25 = *(void **)(v0 + 256);

    sub_249613EDC();
    swift_allocError();
    *id v26 = xmmword_249631470;
    swift_willThrow();

    uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
    return v27();
  }
}

uint64_t sub_249620AE0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 208);
    BOOL v4 = sub_249621B6C;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 208);

    BOOL v4 = sub_249620C54;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_249620C54()
{
  uint64_t v39 = v0;
  v38[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t)(v0 + 2);
  uint64_t v2 = sub_24962BF20();
  os_log_type_t v3 = sub_24962C3E0();
  if (os_log_type_enabled(v2, v3))
  {
    BOOL v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2495EB000, v2, v3, "Proceeding with upload after processing initial response", v4, 2u);
    MEMORY[0x24C5A5090](v4, -1, -1);
  }
  uint64_t v5 = (void *)v0[38];
  uint64_t v6 = (void (*)(uint64_t))v0[24];
  uint64_t v7 = v0[21];

  uint64_t v8 = swift_task_alloc();
  v0[39] = v8;
  uint64_t v9 = swift_task_alloc();
  v6(v7);
  if (v5)
  {
    os_log_type_t v10 = v5;
    swift_task_dealloc();
    id v11 = v5;
    id v12 = v5;
    id v13 = sub_24962BF20();
    os_log_type_t v14 = sub_24962C400();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v15 = 138412290;
      id v17 = v10;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      v0[12] = v18;
      uint64_t v1 = (uint64_t)(v0 + 2);
      sub_24962C490();
      *uint64_t v16 = v18;

      _os_log_impl(&dword_2495EB000, v13, v14, "Unable to construct final request: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v16, -1, -1);
      MEMORY[0x24C5A5090](v15, -1, -1);
    }
    else
    {
    }
    uint64_t v30 = (void *)v0[35];
    uint64_t v31 = (void *)v0[32];

    swift_willThrow();
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v1);
    uint64_t v32 = (uint64_t (*)(void))v0[1];
    return v32();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v0[29] + 32))(v8, v9, v0[28]);
    swift_task_dealloc();
    uint64_t v19 = v0[5];
    uint64_t v20 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v19);
    uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
    unint64_t v23 = v22;
    swift_bridgeObjectRetain();
    sub_24962BB60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24962BF20();
    os_log_type_t v25 = sub_24962C3F0();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = v8;
      uint64_t v28 = swift_slowAlloc();
      v38[0] = v28;
      *(_DWORD *)id v26 = 136315138;
      swift_bridgeObjectRetain();
      v0[14] = sub_2495F74C8(v21, v23, v38);
      sub_24962C490();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2495EB000, v24, v25, "Auth Response: %s", v26, 0xCu);
      swift_arrayDestroy();
      uint64_t v29 = v28;
      uint64_t v8 = v27;
      MEMORY[0x24C5A5090](v29, -1, -1);
      MEMORY[0x24C5A5090](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v34 = (void *)v0[26];
    uint64_t v35 = v34[26];
    uint64_t v36 = v34[27];
    __swift_project_boxed_opaque_existential_1(v34 + 23, v35);
    uint64_t v37 = (void *)swift_task_alloc();
    v0[40] = v37;
    void *v37 = v0;
    v37[1] = sub_24962119C;
    return sub_2495ECB64(v8, v35, v36);
  }
}

uint64_t sub_24962119C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  uint64_t v6 = (void *)*v4;
  v6[7] = v4;
  v6[8] = a1;
  unsigned __int8 v6[9] = a2;
  v6[10] = a3;
  v6[11] = v3;
  v6[41] = a3;
  v6[42] = v3;
  swift_task_dealloc();
  uint64_t v7 = v5[26];
  if (v3) {
    uint64_t v8 = sub_249621C10;
  }
  else {
    uint64_t v8 = sub_249621300;
  }
  return MEMORY[0x270FA2498](v8, v7, 0);
}

uint64_t sub_249621300()
{
  uint64_t v34 = v0;
  v33[1] = *MEMORY[0x263EF8340];
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = *(id *)(v0 + 328);
    if (objc_msgSend(v2, sel_statusCode) == (id)200)
    {
      BOOL v4 = *(void **)(v0 + 328);
      uint64_t v5 = *(void **)(v0 + 280);
      uint64_t v6 = *(void **)(v0 + 256);
      (*(void (**)(void, void))(v0 + 248))(*(void *)(v0 + 312), *(void *)(v0 + 224));
    }
    else
    {
      swift_bridgeObjectRetain_n();
      id v11 = sub_24962BF20();
      os_log_type_t v12 = sub_24962C400();
      BOOL v13 = os_log_type_enabled(v11, v12);
      unint64_t v14 = *(void *)(v0 + 184);
      if (v13)
      {
        uint64_t v15 = *(void *)(v0 + 176);
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        v33[0] = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 104) = sub_2495F74C8(v15, v14, v33);
        sub_24962C490();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2495EB000, v11, v12, "Failed to authenticate while perfoming upload, clearing out credentials for host %s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5A5090](v17, -1, -1);
        MEMORY[0x24C5A5090](v16, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v18 = *(void **)(v0 + 328);
      uint64_t v19 = *(void **)(v0 + 280);
      uint64_t v20 = *(void **)(v0 + 256);
      uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      uint64_t v32 = *(void *)(v0 + 312);
      uint64_t v21 = *(void *)(v0 + 224);
      uint64_t v23 = *(void *)(v0 + 176);
      unint64_t v22 = *(void *)(v0 + 184);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
      uint64_t v24 = swift_task_alloc();
      uint64_t v25 = sub_24962BE10();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
      sub_249623494(v23, v22, 0, v24);

      sub_2495F73C0(v24, &qword_2696C5618);
      v31(v32, v21);
      swift_task_dealloc();
    }
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 312);
    uint64_t v8 = *(void **)(v0 + 280);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    uint64_t v10 = *(void *)(v0 + 224);

    v9(v7, v10);
  }
  uint64_t v27 = *(void *)(v0 + 64);
  uint64_t v26 = *(void *)(v0 + 72);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
  uint64_t v29 = *(void *)(v0 + 328);
  return v28(v27, v26, v29);
}

uint64_t sub_249621680()
{
  uint64_t v1 = *(void **)(v0 + 272);

  uint64_t v2 = sub_24962BE50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = swift_task_alloc();
  id v5 = v1;
  sub_24962BE60();
  sub_24962B2CC(&qword_2696C5698, MEMORY[0x270FA9A28]);
  char v6 = sub_24962BC50();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v2);
  swift_task_dealloc();
  if (v6)
  {

    id v7 = *(id *)(v0 + 256);
    uint64_t v8 = sub_24962BF20();
    os_log_type_t v9 = sub_24962C3F0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    id v11 = *(char **)(v0 + 256);
    if (v10)
    {
      os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
      BOOL v13 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v12 = 138412290;
      unint64_t v14 = *(void **)&v11[OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse];
      if (v14)
      {
        *(void *)(v0 + 128) = v14;
        id v15 = v14;
      }
      else
      {
        *(void *)(v0 + 120) = 0;
      }
      sub_24962C490();
      uint64_t v17 = *(void **)(v0 + 256);
      *BOOL v13 = v14;

      _os_log_impl(&dword_2495EB000, v8, v9, "%@", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v13, -1, -1);
      MEMORY[0x24C5A5090](v12, -1, -1);
      uint64_t v16 = *(NSObject **)(v0 + 256);
    }
    else
    {

      uint64_t v16 = *(NSObject **)(v0 + 256);
      uint64_t v8 = v16;
    }

    uint64_t v18 = *(Class *)((char *)&v16->isa + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_task);
    *(void *)(v0 + 280) = v18;
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = sub_24962BF20();
      os_log_type_t v21 = sub_24962C3E0();
      if (os_log_type_enabled(v20, v21))
      {
        unint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v22 = 0;
        _os_log_impl(&dword_2495EB000, v20, v21, "Processing initial upload response", v22, 2u);
        MEMORY[0x24C5A5090](v22, -1, -1);
      }
      uint64_t v23 = *(void *)(v0 + 256);

      uint64_t v24 = *(void **)(v23 + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse);
      *(void *)(v0 + 288) = v24;
      id v25 = v24;
      uint64_t v26 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v26;
      *uint64_t v26 = v0;
      v26[1] = sub_249620AE0;
      uint64_t v27 = *(void *)(v0 + 208);
      v26[73] = v27;
      v26[72] = v24;
      v26[71] = v19;
      v26[70] = v0 + 16;
      return MEMORY[0x270FA2498](sub_249621F00, v27, 0);
    }
    uint64_t v28 = sub_24962BF20();
    os_log_type_t v29 = sub_24962C400();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_2495EB000, v28, v29, "Initial upload request completed, but task was never set", v30, 2u);
      MEMORY[0x24C5A5090](v30, -1, -1);
    }
    uint64_t v31 = *(void **)(v0 + 256);

    sub_249613EDC();
    swift_allocError();
    *uint64_t v32 = xmmword_249631470;
    swift_willThrow();
  }
  else
  {
  }
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_249621B6C()
{
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = *(void **)(v0 + 288);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_249621C10()
{
  uint64_t v1 = v0[39];
  uint64_t v2 = (void *)v0[35];
  uint64_t v4 = (void (*)(uint64_t, uint64_t))v0[31];
  uint64_t v3 = (void *)v0[32];
  uint64_t v5 = v0[28];
  swift_willThrow();

  v4(v1, v5);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  char v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

unint64_t sub_249621D04(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5650);
  uint64_t v2 = (void *)sub_24962C600();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  unint64_t result = swift_retain();
  uint64_t v5 = 0;
  char v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v7 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    uint64_t v8 = *(v6 - 2);
    uint64_t v9 = *v6;
    if (!v8)
    {
      swift_bridgeObjectRetain();
LABEL_12:
      swift_release();
      goto LABEL_13;
    }
    uint64_t v10 = *(v6 - 3);
    uint64_t v11 = *(v6 - 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_249629C58(v10, v8);
    if (v12) {
      goto LABEL_15;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v13 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v13 = v10;
    v13[1] = v8;
    unint64_t v14 = (void *)(v2[7] + 16 * result);
    *unint64_t v14 = v11;
    v14[1] = v9;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_16;
    }
    v6 += 4;
    v2[2] = v17;
    ++v5;
    if (v7 == v3) {
      goto LABEL_12;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_249621E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[73] = v3;
  v4[72] = a3;
  v4[71] = a2;
  v4[70] = a1;
  return MEMORY[0x270FA2498](sub_249621F00, v3, 0);
}

uint64_t sub_249621F00()
{
  uint64_t v1 = *(void **)(v0 + 568);
  uint64_t v2 = sub_24962BB70();
  *(void *)(v0 + 592) = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  *(void *)(v0 + 600) = v3;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 608) = v4;
  id v5 = objc_msgSend(v1, sel_originalRequest);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5668);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = v6;
  if (!v5)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v6, 1, 1, v2);
    goto LABEL_11;
  }
  uint64_t v8 = swift_task_alloc();
  sub_24962BB30();

  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v9(v7, v8, v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v7, 0, 1, v2);
  swift_task_dealloc();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2) == 1)
  {
LABEL_11:
    sub_2495F73C0(v7, &qword_2696C5668);
    swift_task_dealloc();
    swift_task_dealloc();
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    id v25 = *(void **)(v0 + 568);
    uint64_t v26 = sub_24962BF40();
    __swift_project_value_buffer(v26, (uint64_t)qword_2696C55C8);
    id v27 = v25;
    uint64_t v28 = sub_24962BF20();
    os_log_type_t v29 = sub_24962C400();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v31 = *(void **)(v0 + 568);
    if (v30)
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = v0;
      uint64_t v33 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 138412290;
      *(void *)(v55 + 544) = v31;
      id v34 = v31;
      sub_24962C490();
      *uint64_t v33 = v31;

      _os_log_impl(&dword_2495EB000, v28, v29, "Unable to retrieve original request when attempting to authenticate: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
      swift_arrayDestroy();
      uint64_t v35 = v33;
      uint64_t v0 = v55;
      MEMORY[0x24C5A5090](v35, -1, -1);
      MEMORY[0x24C5A5090](v32, -1, -1);
    }
    else
    {
    }
    sub_249613EDC();
    swift_allocError();
    *uint64_t v36 = xmmword_249631470;
    swift_willThrow();
    goto LABEL_28;
  }
  uint64_t v10 = *(void *)(v0 + 576);
  v9(v4, v7, v2);
  swift_task_dealloc();
  if (v10)
  {
    uint64_t v11 = *(void **)(v0 + 576);
    self;
    uint64_t v12 = swift_dynamicCastObjCClass();
    *(void *)(v0 + 616) = v12;
    if (v12)
    {
      BOOL v13 = (void *)v12;
      id v14 = v11;
      if (objc_msgSend(v13, sel_statusCode) == (id)401)
      {
        id v15 = v14;
        uint64_t v16 = sub_2495FC488(v13);
        *(void *)(v0 + 624) = v16;
        *(void *)(v0 + 632) = v17;
        *(unsigned char *)(v0 + 249) = v18;
        if (v18 != -1)
        {
          uint64_t v19 = v16;
          uint64_t v20 = v17;
          char v21 = v18;
          unint64_t v22 = (void *)swift_task_alloc();
          *(void *)(v0 + 640) = v22;
          void *v22 = v0;
          v22[1] = sub_2496226C4;
          uint64_t v23 = *(void *)(v0 + 568);
          return sub_2496282A4(v23, v19, v20, v21);
        }
        if (qword_2696C4A08 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_24962BF40();
        __swift_project_value_buffer(v50, (uint64_t)qword_2696C55C8);
        id v51 = sub_24962BF20();
        os_log_type_t v52 = sub_24962C400();
        if (os_log_type_enabled(v51, v52))
        {
          os_log_type_t v53 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v53 = 0;
          _os_log_impl(&dword_2495EB000, v51, v52, "Unable to retrieve auth scheme from HTTP response", v53, 2u);
          MEMORY[0x24C5A5090](v53, -1, -1);
        }

        sub_249613EDC();
        swift_allocError();
        *unint64_t v54 = 0;
        v54[1] = 0;
        swift_willThrow();

        goto LABEL_27;
      }
    }
  }
  if (qword_2696C4A08 != -1) {
    swift_once();
  }
  uint64_t v37 = *(void **)(v0 + 568);
  uint64_t v38 = sub_24962BF40();
  __swift_project_value_buffer(v38, (uint64_t)qword_2696C55C8);
  id v39 = v37;
  uint64_t v40 = sub_24962BF20();
  os_log_type_t v41 = sub_24962C400();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v43 = *(void **)(v0 + 568);
  if (v42)
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    unint64_t v45 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 138412290;
    id v46 = objc_msgSend(v43, sel_response);
    if (v46) {
      *(void *)(v0 + 528) = v46;
    }
    else {
      *(void *)(v0 + 536) = 0;
    }
    sub_24962C490();
    uint64_t v47 = *(void **)(v0 + 568);
    *unint64_t v45 = v46;

    _os_log_impl(&dword_2495EB000, v40, v41, "Unexpected response when attempting to authenticate: %@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v45, -1, -1);
    MEMORY[0x24C5A5090](v44, -1, -1);
  }
  else
  {
  }
  sub_249613EDC();
  swift_allocError();
  *unint64_t v48 = 0;
  v48[1] = 0;
  swift_willThrow();
LABEL_27:
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v2);
  swift_task_dealloc();
LABEL_28:
  id v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_2496226C4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 648) = a1;
  *(void *)(v3 + 656) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(void *)(v3 + 584);
    sub_2496017F0(*(void *)(v3 + 624), *(void *)(v3 + 632), *(unsigned char *)(v3 + 249));
    id v5 = sub_2496233D0;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = *(void *)(v3 + 584);
    id v5 = sub_249622844;
  }
  return MEMORY[0x270FA2498](v5, v6, 0);
}

uint64_t sub_249622844()
{
  uint64_t v121 = v0;
  v120[2] = *MEMORY[0x263EF8340];
  id v1 = objc_msgSend(*(id *)(v0 + 648), sel_user);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void **)(v0 + 648);
    unint64_t v4 = sub_24962C0F0();
    unint64_t v6 = v5;

    id v7 = objc_msgSend(v3, sel_password);
    int v8 = *(unsigned __int8 *)(v0 + 249);
    if (v7)
    {
      uint64_t v9 = v7;
      unint64_t v10 = sub_24962C0F0();
      unint64_t v12 = v11;

      if (v8)
      {
        if (v8 != 1)
        {
          uint64_t v116 = *(void *)(v0 + 608);
          uint64_t v53 = *(void *)(v0 + 600);
          uint64_t v113 = *(void **)(v0 + 648);
          uint64_t v114 = *(void *)(v0 + 592);
          uint64_t v111 = *(void **)(v0 + 576);
          unint64_t v54 = v10;
          uint64_t v55 = *(void **)(v0 + 560);
          v120[0] = v4;
          v120[1] = v6;
          swift_bridgeObjectRetain();
          sub_24962C1B0();
          unint64_t v119 = v6;
          swift_bridgeObjectRetain();
          sub_24962C1B0();
          swift_bridgeObjectRelease();
          uint64_t v56 = sub_249604354(v4, v6);
          unint64_t v58 = v57;
          unint64_t v59 = v12;
          uint64_t v60 = sub_24962BDC0();
          unint64_t v61 = v4;
          uint64_t v63 = v62;
          sub_2495F7470(v56, v58);
          v55[3] = &type metadata for HTTPBasicAuthenticateResponse;
          v55[4] = &off_26FD38F98;
          uint64_t v64 = (void *)swift_allocObject();
          *uint64_t v55 = v64;

          v64[2] = v60;
          v64[3] = v63;
          v64[4] = v61;
          v64[5] = v119;
          v64[6] = v54;
          v64[7] = v59;
          (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v116, v114);
          goto LABEL_33;
        }
        BOOL v13 = *(void **)(v0 + 616);
        id v14 = *(id *)(v0 + 576);
        sub_249615C90(v13, v0 + 328);
        sub_2495FA914(v0 + 328, v0 + 256, &qword_2696C50B0);
        if (*(void *)(v0 + 264))
        {
          unint64_t v112 = v4;
          id v15 = (_OWORD *)(v0 + 184);
          unint64_t v110 = (uint64_t *)(v0 + 472);
          long long v16 = *(_OWORD *)(v0 + 304);
          *(_OWORD *)(v0 + 216) = *(_OWORD *)(v0 + 288);
          *(_OWORD *)(v0 + 232) = v16;
          *(unsigned char *)(v0 + 248) = *(unsigned char *)(v0 + 320);
          long long v17 = *(_OWORD *)(v0 + 272);
          *(_OWORD *)(v0 + 184) = *(_OWORD *)(v0 + 256);
          *(_OWORD *)(v0 + 200) = v17;
          if (qword_2696C4A08 != -1) {
            swift_once();
          }
          unint64_t v118 = v6;
          char v18 = (_OWORD *)(v0 + 16);
          uint64_t v19 = sub_24962BF40();
          __swift_project_value_buffer(v19, (uint64_t)qword_2696C55C8);
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          uint64_t v20 = sub_24962BF20();
          os_log_type_t v21 = sub_24962C3F0();
          if (os_log_type_enabled(v20, v21))
          {
            log = v20;
            unint64_t v22 = (uint8_t *)swift_slowAlloc();
            uint64_t v105 = swift_slowAlloc();
            buf = v22;
            *(_DWORD *)unint64_t v22 = 136315138;
            v120[0] = v105;
            long long v23 = *(_OWORD *)(v0 + 232);
            *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 216);
            *(_OWORD *)(v0 + 448) = v23;
            *(unsigned char *)(v0 + 464) = *(unsigned char *)(v0 + 248);
            long long v24 = *(_OWORD *)(v0 + 200);
            *(_OWORD *)(v0 + 400) = *v15;
            *(_OWORD *)(v0 + 416) = v24;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v25 = sub_24962C140();
            *(void *)(v0 + 552) = sub_2495F74C8(v25, v26, v120);
            sub_24962C490();
            swift_bridgeObjectRelease();
            sub_24962B35C((uint64_t *)(v0 + 328));
            sub_24962B35C((uint64_t *)(v0 + 328));
            uint64_t v20 = log;
            _os_log_impl(&dword_2495EB000, log, v21, "Auth Info: %s", buf, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5A5090](v105, -1, -1);
            MEMORY[0x24C5A5090](buf, -1, -1);
          }
          else
          {
            sub_24962B35C((uint64_t *)(v0 + 328));
            sub_24962B35C((uint64_t *)(v0 + 328));
          }

          uint64_t v108 = *(void *)(v0 + 624);
          uint64_t v109 = *(void *)(v0 + 632);
          uint64_t v83 = *(void *)(v0 + 608);
          uint64_t v107 = v83;
          uint64_t v84 = *(void *)(v0 + 600);
          uint64_t v85 = *(void *)(v0 + 592);
          uint64_t v115 = *(void **)(v0 + 576);
          uint64_t v117 = *(void **)(v0 + 648);
          unint64_t v86 = *(uint64_t **)(v0 + 560);
          uint64_t v87 = sub_249604354(v10, v12);
          unint64_t v89 = v88;
          *(void *)(v0 + 496) = v85;
          *(void *)(v0 + 504) = &off_26FD38D18;
          boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v110);
          (*(void (**)(uint64_t *, uint64_t, uint64_t))(v84 + 16))(boxed_opaque_existential_1, v83, v85);
          v86[3] = (uint64_t)&type metadata for HTTPDigestAuthenticateResponse;
          v86[4] = (uint64_t)&off_26FD38310;
          uint64_t v91 = swift_allocObject();
          *unint64_t v86 = v91;
          long long v92 = *(_OWORD *)(v0 + 232);
          *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 216);
          *(_OWORD *)(v0 + 64) = v92;
          *(unsigned char *)(v0 + 80) = *(unsigned char *)(v0 + 248);
          long long v93 = *(_OWORD *)(v0 + 200);
          *char v18 = *v15;
          *(_OWORD *)(v0 + 32) = v93;
          *(void *)(v0 + 88) = v112;
          *(void *)(v0 + 96) = v118;
          *(void *)(v0 + 104) = v87;
          *(void *)(v0 + 112) = v89;
          sub_2495F07A0((uint64_t)v110, v0 + 120);
          *(void *)(v0 + 160) = 1;
          sub_2495F7E7C(v87, v89);
          int64_t v94 = sub_249617ACC(8, 0);
          uint64_t v96 = v95;
          sub_2495F7470(v87, v89);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
          *(void *)(v0 + 168) = v94;
          *(void *)(v0 + 176) = v96;
          long long v97 = *(_OWORD *)(v0 + 96);
          *(_OWORD *)(v91 + 80) = *(_OWORD *)(v0 + 80);
          *(_OWORD *)(v91 + 96) = v97;
          long long v98 = *(_OWORD *)(v0 + 128);
          *(_OWORD *)(v91 + 112) = *(_OWORD *)(v0 + 112);
          *(_OWORD *)(v91 + 128) = v98;
          long long v99 = *(_OWORD *)(v0 + 32);
          *(_OWORD *)(v91 + 16) = *v18;
          *(_OWORD *)(v91 + 32) = v99;
          long long v100 = *(_OWORD *)(v0 + 64);
          *(_OWORD *)(v91 + 48) = *(_OWORD *)(v0 + 48);
          *(_OWORD *)(v91 + 64) = v100;
          long long v101 = *(_OWORD *)(v0 + 160);
          *(_OWORD *)(v91 + 144) = *(_OWORD *)(v0 + 144);
          *(_OWORD *)(v91 + 160) = v101;
          *(void *)(v91 + 176) = *(void *)(v0 + 176);
          sub_2496017F0(v108, v109, 1u);

          (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v107, v85);
          goto LABEL_33;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_2696C4A08 != -1) {
          swift_once();
        }
        uint64_t v76 = sub_24962BF40();
        __swift_project_value_buffer(v76, (uint64_t)qword_2696C55C8);
        char v77 = sub_24962BF20();
        os_log_type_t v78 = sub_24962C400();
        if (os_log_type_enabled(v77, v78))
        {
          unint64_t v79 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v79 = 0;
          _os_log_impl(&dword_2495EB000, v77, v78, "Unable to parse authenticate header", v79, 2u);
          MEMORY[0x24C5A5090](v79, -1, -1);
        }
        uint64_t v65 = *(void **)(v0 + 648);
        uint64_t v80 = *(void *)(v0 + 632);
        uint64_t v81 = *(void *)(v0 + 624);
        uint64_t v68 = *(void *)(v0 + 608);
        uint64_t v69 = *(void *)(v0 + 600);
        uint64_t v70 = *(void *)(v0 + 592);
        uint64_t v71 = *(void **)(v0 + 576);

        sub_249613EDC();
        swift_allocError();
        *uint64_t v82 = 0;
        v82[1] = 0;
        swift_willThrow();
        uint64_t v73 = v81;
        uint64_t v74 = v80;
        unsigned __int8 v75 = 1;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_2696C4A08 != -1) {
          swift_once();
        }
        uint64_t v43 = *(void *)(v0 + 632);
        uint64_t v44 = *(void *)(v0 + 624);
        uint64_t v45 = sub_24962BF40();
        __swift_project_value_buffer(v45, (uint64_t)qword_2696C55C8);
        sub_2495FB16C(v44, v43, 0);
        id v46 = sub_24962BF20();
        os_log_type_t v47 = sub_24962C400();
        BOOL v48 = os_log_type_enabled(v46, v47);
        uint64_t v49 = *(void *)(v0 + 632);
        uint64_t v50 = *(void *)(v0 + 624);
        if (v48)
        {
          id v51 = (uint8_t *)swift_slowAlloc();
          uint64_t v52 = swift_slowAlloc();
          v120[0] = v52;
          *(_DWORD *)id v51 = 136315138;
          *(void *)(v0 + 520) = sub_2495F74C8(0x747365676944, 0xE600000000000000, v120);
          sub_24962C490();
          sub_2496017F0(v50, v49, 0);
          _os_log_impl(&dword_2495EB000, v46, v47, "Unsupported authentication scheme: %s", v51, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5A5090](v52, -1, -1);
          MEMORY[0x24C5A5090](v51, -1, -1);
        }
        else
        {
          sub_2496017F0(*(void *)(v0 + 624), *(void *)(v0 + 632), 0);
        }

        uint64_t v65 = *(void **)(v0 + 648);
        uint64_t v66 = *(void *)(v0 + 632);
        uint64_t v67 = *(void *)(v0 + 624);
        uint64_t v68 = *(void *)(v0 + 608);
        uint64_t v69 = *(void *)(v0 + 600);
        uint64_t v70 = *(void *)(v0 + 592);
        uint64_t v71 = *(void **)(v0 + 576);
        sub_249613EDC();
        swift_allocError();
        *uint64_t v72 = xmmword_249631480;
        swift_willThrow();
        uint64_t v73 = v67;
        uint64_t v74 = v66;
        unsigned __int8 v75 = 0;
      }
      sub_2496017F0(v73, v74, v75);

      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
      goto LABEL_33;
    }
    sub_2496017F0(*(void *)(v0 + 624), *(void *)(v0 + 632), *(unsigned char *)(v0 + 249));
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2496017F0(*(void *)(v0 + 624), *(void *)(v0 + 632), *(unsigned char *)(v0 + 249));
  }
  if (qword_2696C4A08 != -1) {
    swift_once();
  }
  id v27 = *(void **)(v0 + 648);
  uint64_t v28 = sub_24962BF40();
  __swift_project_value_buffer(v28, (uint64_t)qword_2696C55C8);
  id v29 = v27;
  BOOL v30 = sub_24962BF20();
  os_log_type_t v31 = sub_24962C400();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v33 = *(void **)(v0 + 648);
  if (v32)
  {
    id v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)id v34 = 138412290;
    *(void *)(v0 + 512) = v33;
    id v36 = v33;
    sub_24962C490();
    *uint64_t v35 = v33;

    _os_log_impl(&dword_2495EB000, v30, v31, "URL credential missing username/password: %@", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v35, -1, -1);
    MEMORY[0x24C5A5090](v34, -1, -1);
  }
  else
  {
  }
  uint64_t v37 = *(void **)(v0 + 648);
  uint64_t v38 = *(void *)(v0 + 608);
  uint64_t v39 = *(void *)(v0 + 600);
  uint64_t v40 = *(void *)(v0 + 592);
  os_log_type_t v41 = *(void **)(v0 + 576);
  sub_249613EDC();
  swift_allocError();
  *BOOL v42 = xmmword_249631490;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
LABEL_33:
  swift_task_dealloc();
  uint64_t v102 = *(uint64_t (**)(void))(v0 + 8);
  return v102();
}

uint64_t sub_2496233D0()
{
  uint64_t v1 = *(void *)(v0 + 608);
  uint64_t v2 = *(void *)(v0 + 600);
  uint64_t v3 = *(void *)(v0 + 592);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  unint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

void sub_249623494(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5678);
  uint64_t v12 = MEMORY[0x270FA5388](v10 - 8, v11);
  id v14 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v15);
  long long v17 = (char *)&v79 - v16;
  uint64_t v96 = type metadata accessor for URLSessionAuthenticator.RequestState();
  uint64_t v18 = *(void *)(v96 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v96, v19);
  MEMORY[0x270FA5388](v20, v21);
  if (a3)
  {
    long long v93 = v17;
    uint64_t v85 = (uint64_t)&v79 - v22;
    uint64_t v87 = v23;
    unint64_t v88 = v14;
    uint64_t v95 = a1;
    uint64_t v24 = qword_2696C4A08;
    uint64_t v90 = a3;
    id v25 = a3;
    if (v24 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24962BF40();
    uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_2696C55C8);
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    long long v92 = &v79;
    uint64_t v29 = *(void *)(*(void *)(v28 - 8) + 64);
    MEMORY[0x270FA5388](v28 - 8, v30);
    unint64_t v31 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
    BOOL v32 = (char *)&v79 - v31;
    uint64_t v86 = a4;
    sub_2495F7288(a4, (uint64_t)&v79 - v31, &qword_2696C5618);
    id v33 = v25;
    swift_bridgeObjectRetain_n();
    id v34 = v33;
    uint64_t v89 = v27;
    uint64_t v35 = sub_24962BF20();
    int v36 = sub_24962C3E0();
    BOOL v37 = os_log_type_enabled(v35, (os_log_type_t)v36);
    id v91 = v34;
    if (v37)
    {
      uint64_t v80 = v35;
      int v82 = v36;
      uint64_t v94 = v5;
      uint64_t v84 = v18;
      uint64_t v38 = v34;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v40 = (void *)swift_slowAlloc();
      uint64_t v83 = swift_slowAlloc();
      v99[0] = v83;
      *(_DWORD *)uint64_t v39 = 138412802;
      v98[0] = (uint64_t)v38;
      id v41 = v38;
      sub_24962C490();
      uint64_t v81 = v40;
      *uint64_t v40 = v90;

      *(_WORD *)(v39 + 12) = 2080;
      swift_bridgeObjectRetain();
      v98[0] = sub_2495F74C8(v95, a2, v99);
      sub_24962C490();
      uint64_t v42 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v39 + 22) = 2080;
      MEMORY[0x270FA5388](v42, v43);
      uint64_t v44 = (char *)&v79 - v31;
      sub_2495F7288((uint64_t)&v79 - v31, (uint64_t)&v79 - v31, &qword_2696C5618);
      uint64_t v45 = sub_24962BE10();
      uint64_t v46 = *(void *)(v45 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45) == 1)
      {
        sub_2495F73C0((uint64_t)v44, &qword_2696C5618);
        unint64_t v47 = 0xE300000000000000;
        uint64_t v48 = 4271950;
      }
      else
      {
        uint64_t v48 = sub_24962BDE0();
        unint64_t v47 = v60;
        (*(void (**)(char *, uint64_t))(v46 + 8))(v44, v45);
      }
      unint64_t v61 = v80;
      v98[0] = sub_2495F74C8(v48, v47, v99);
      sub_24962C490();
      swift_bridgeObjectRelease();
      sub_2495F73C0((uint64_t)v32, &qword_2696C5618);
      _os_log_impl(&dword_2495EB000, v61, (os_log_type_t)v82, "Caching credential %@ for host: %s, expiration: %s", (uint8_t *)v39, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
      uint64_t v62 = v81;
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v62, -1, -1);
      uint64_t v63 = v83;
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v63, -1, -1);
      MEMORY[0x24C5A5090](v39, -1, -1);

      uint64_t v5 = v94;
      uint64_t v54 = v95;
      uint64_t v18 = v84;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      sub_2495F73C0((uint64_t)&v79 - v31, &qword_2696C5618);
      uint64_t v54 = v95;
    }
    swift_beginAccess();
    uint64_t v64 = *(void *)(v5 + 264);
    uint64_t v65 = (uint64_t)v93;
    if (*(void *)(v64 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v66 = sub_249629C58(v54, a2);
      if (v67)
      {
        sub_24962B06C(*(void *)(v64 + 56) + *(void *)(v18 + 72) * v66, v65);
        uint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
        v68(v65, 0, 1, v96);
      }
      else
      {
        uint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
        v68(v65, 1, 1, v96);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v65, 1, v96) != 1)
      {
        uint64_t v73 = v85;
        sub_24962AFA8(v65, v85);
        uint64_t v74 = v87;
        sub_24962B06C(v73, v87);
        unsigned __int8 v75 = *(void **)(v74 + 8);
        id v76 = v91;

        *(void *)(v74 + 8) = v90;
        uint64_t v77 = v96;
        sub_24962B134(v86, v74 + *(int *)(v96 + 24));
        uint64_t v78 = (uint64_t)v88;
        sub_24962B06C(v74, (uint64_t)v88);
        v68(v78, 0, 1, v77);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_24961FB98(v78, v54, a2);
        swift_endAccess();

        sub_24962B00C(v73, (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
        sub_24962B00C(v74, (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
        return;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v93, 1, 1, v96);
    }
    sub_2495F73C0(v65, &qword_2696C5678);
    swift_bridgeObjectRetain_n();
    uint64_t v69 = sub_24962BF20();
    os_log_type_t v70 = sub_24962C400();
    if (os_log_type_enabled(v69, v70))
    {
      uint64_t v71 = (uint8_t *)swift_slowAlloc();
      uint64_t v72 = swift_slowAlloc();
      v98[0] = v72;
      *(_DWORD *)uint64_t v71 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v97 = sub_2495F74C8(v54, a2, v98);
      sub_24962C490();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2495EB000, v69, v70, "Unable to retrieve context for host %s", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v72, -1, -1);
      MEMORY[0x24C5A5090](v71, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v94 = v5;
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_24962BF40();
    __swift_project_value_buffer(v49, (uint64_t)qword_2696C55C8);
    swift_bridgeObjectRetain_n();
    uint64_t v50 = sub_24962BF20();
    os_log_type_t v51 = sub_24962C3E0();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      v99[0] = v53;
      *(_DWORD *)uint64_t v52 = 136315138;
      swift_bridgeObjectRetain();
      v98[0] = sub_2495F74C8(a1, a2, v99);
      sub_24962C490();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2495EB000, v50, v51, "Resetting credentials for host %s", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v53, -1, -1);
      MEMORY[0x24C5A5090](v52, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_24961DD04();
    uint64_t v56 = sub_2496290C8(v98, a1, a2);
    uint64_t v58 = v57;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v57, 1, v96))
    {
      unint64_t v59 = *(void **)(v58 + 8);
      *(void *)(v58 + 8) = 0;
    }
    ((void (*)(uint64_t *, void))v56)(v98, 0);
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t *, void))v55)(v99, 0);
  }
}

uint64_t sub_249623F34(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return MEMORY[0x270FA2498](sub_249623FC8, v2, 0);
}

uint64_t sub_249623FC8()
{
  long long v92 = v0;
  v91[1] = *MEMORY[0x263EF8340];
  if (qword_2696C4A08 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v3 = sub_24962BF40();
  __swift_project_value_buffer(v3, (uint64_t)qword_2696C55C8);
  uint64_t v4 = sub_24962BB70();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = swift_task_alloc();
  uint64_t v80 = v5;
  id v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  uint64_t v89 = v6;
  v7(v6, v1, v4);
  uint64_t v8 = sub_24962BD40();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v86 = swift_task_alloc();
  uint64_t v82 = v8;
  uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v77(v86, v2, v8);
  uint64_t v83 = swift_task_alloc();
  v7(v83, v1, v4);
  uint64_t v10 = swift_task_alloc();
  v7(v10, v1, v4);
  uint64_t v11 = sub_24962BF20();
  os_log_type_t v12 = sub_24962C3E0();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v76 = v12;
    uint64_t v74 = v10;
    uint64_t v13 = v0 + 8;
    uint64_t v72 = v0 + 9;
    uint64_t v73 = v0 + 10;
    uint64_t v78 = v0;
    unsigned __int8 v75 = v0 + 11;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    v91[0] = v71;
    *(_DWORD *)uint64_t v14 = 136315906;
    uint64_t v15 = sub_24962BAD0();
    if (v16)
    {
      unint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 5522759;
      unint64_t v17 = 0xE300000000000000;
    }
    v0[7] = sub_2495F74C8(v15, v17, v91);
    sub_24962C490();
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
    v18(v89, v4);
    *(_WORD *)(v14 + 12) = 2080;
    sub_24962B2CC((unint64_t *)&unk_2696C4B38, MEMORY[0x270FA8E70]);
    uint64_t v19 = sub_24962C6B0();
    *uint64_t v13 = sub_2495F74C8(v19, v20, v91);
    sub_24962C490();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v21(v86, v8);
    *(_WORD *)(v14 + 22) = 2080;
    sub_24962B2CC(&qword_2696C50C8, MEMORY[0x270FA7D48]);
    uint64_t v22 = sub_24962C6B0();
    *uint64_t v72 = sub_2495F74C8(v22, v23, v91);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v18(v83, v4);
    *(_WORD *)(v14 + 32) = 2080;
    unint64_t v24 = sub_24962BB20();
    uint64_t v81 = v21;
    if (!v24) {
      unint64_t v24 = sub_249621D04(MEMORY[0x263F8EE78]);
    }
    *uint64_t v73 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5648);
    uint64_t v28 = sub_24962C140();
    *unsigned __int8 v75 = sub_2495F74C8(v28, v29, v91);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v18(v74, v4);
    _os_log_impl(&dword_2495EB000, v11, v76, "Downloading file: %s [dest: %s] %s: %s ", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v71, -1, -1);
    MEMORY[0x24C5A5090](v14, -1, -1);

    uint64_t v0 = v78;
    uint64_t v27 = v8;
    uint64_t v26 = v9;
  }
  else
  {
    id v25 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
    v25(v89, v4);
    uint64_t v26 = v9;
    uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v81(v86, v82);
    v25(v83, v4);
    v25(v10, v4);

    uint64_t v27 = v82;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v30 = swift_task_alloc();
  sub_24962BB50();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v30, 1, v27) == 1)
  {
    sub_2495F73C0(v30, &qword_2696C4AF0);
    swift_task_dealloc();
LABEL_17:
    sub_249613EDC();
    swift_allocError();
    *uint64_t v46 = xmmword_249631460;
    swift_willThrow();
    unint64_t v47 = (uint64_t (*)(void))v0[1];
    return v47();
  }
  uint64_t v90 = sub_24962BCE0();
  uint64_t v32 = v31;
  v81(v30, v27);
  swift_task_dealloc();
  if (!v32) {
    goto LABEL_17;
  }
  uint64_t v34 = v0[13];
  id v33 = (void *)v0[14];
  uint64_t v35 = v0[12];
  uint64_t v36 = v33[26];
  uint64_t v37 = v33[27];
  __swift_project_boxed_opaque_existential_1(v33 + 23, v36);
  unint64_t v88 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 24))(v35, v36, v37);
  v0[15] = v88;
  uint64_t v38 = swift_task_alloc();
  v77(v38, v34, v27);
  uint64_t v39 = sub_24962BF20();
  os_log_type_t v40 = sub_24962C3F0();
  if (os_log_type_enabled(v39, v40))
  {
    id v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v84 = v32;
    uint64_t v42 = swift_slowAlloc();
    v91[0] = v42;
    *(_DWORD *)id v41 = 136315138;
    sub_24962B2CC((unint64_t *)&unk_2696C4B38, MEMORY[0x270FA8E70]);
    uint64_t v43 = sub_24962C6B0();
    v0[6] = sub_2495F74C8(v43, v44, v91);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v81(v38, v27);
    _os_log_impl(&dword_2495EB000, v39, v40, "Attempting to remove pre-existing destination file: %s", v41, 0xCu);
    swift_arrayDestroy();
    uint64_t v45 = v42;
    uint64_t v32 = v84;
    MEMORY[0x24C5A5090](v45, -1, -1);
    MEMORY[0x24C5A5090](v41, -1, -1);
  }
  else
  {
    v81(v38, v27);
  }

  swift_task_dealloc();
  id v49 = objc_msgSend(self, sel_defaultManager);
  uint64_t v50 = (void *)sub_24962BCC0();
  v0[2] = 0;
  unsigned int v51 = objc_msgSend(v49, sel_removeItemAtURL_error_, v50, v0 + 2);

  uint64_t v52 = (void *)v0[2];
  if (v51)
  {
    id v53 = v52;
  }
  else
  {
    uint64_t v54 = v0[13];
    id v55 = v52;
    uint64_t v56 = (void *)sub_24962BC80();

    swift_willThrow();
    uint64_t v57 = swift_task_alloc();
    v77(v57, v54, v27);
    id v58 = v56;
    id v59 = v56;
    unint64_t v60 = sub_24962BF20();
    os_log_type_t v61 = sub_24962C3F0();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v85 = v32;
      uint64_t v62 = swift_slowAlloc();
      uint64_t v79 = (void *)swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      v91[0] = v87;
      *(_DWORD *)uint64_t v62 = 136315394;
      sub_24962B2CC((unint64_t *)&unk_2696C4B38, MEMORY[0x270FA8E70]);
      uint64_t v63 = sub_24962C6B0();
      v0[4] = sub_2495F74C8(v63, v64, v91);
      sub_24962C490();
      swift_bridgeObjectRelease();
      v81(v57, v27);
      *(_WORD *)(v62 + 12) = 2112;
      id v65 = v56;
      uint64_t v66 = _swift_stdlib_bridgeErrorToNSError();
      v0[5] = v66;
      sub_24962C490();
      *uint64_t v79 = v66;
      uint64_t v32 = v85;

      _os_log_impl(&dword_2495EB000, v60, v61, "Failed to remove pre-exisiting destination file %s: %@", (uint8_t *)v62, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v79, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v87, -1, -1);
      MEMORY[0x24C5A5090](v62, -1, -1);
    }
    else
    {

      v81(v57, v27);
    }
    swift_task_dealloc();
  }
  uint64_t v67 = v0[14];
  id v68 = v88;
  sub_24962BD00();
  uint64_t v69 = (void *)sub_24962C0C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v68, sel_set_pathToDownloadTaskFile_, v69);

  os_log_type_t v70 = (void *)swift_allocObject();
  v0[16] = v70;
  v70[2] = v67;
  v70[3] = v90;
  v70[4] = v32;
  swift_retain();
  return MEMORY[0x270FA2498](sub_249624C6C, 0, 0);
}

uint64_t sub_249624C6C()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[17] = v3;
  v3[2] = v2;
  v3[3] = &unk_2696C5690;
  v3[4] = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[18] = v4;
  unint64_t v5 = sub_2496137D4();
  void *v4 = v0;
  v4[1] = sub_249624DA8;
  return MEMORY[0x270FA2360](v0 + 3, 0, 0, 0xD00000000000001BLL, 0x800000024962DE10, sub_24962B2C0, v3, v5);
}

uint64_t sub_249624DA8()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24962502C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_249624EF8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_249624EF8()
{
  uint64_t v1 = v0[14];
  swift_release();
  v0[20] = v0[3];
  return MEMORY[0x270FA2498](sub_249624F98, v1, 0);
}

uint64_t sub_249624F98()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 160);
  return v1(v2);
}

uint64_t sub_24962502C()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2496250C4, v1, 0);
}

uint64_t sub_2496250C4()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_249625158(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *(void *)uint64_t v17 = v8;
  *(void *)(v17 + 8) = sub_24962BAA4;
  *(void *)(v17 + 64) = a5;
  *(void *)(v17 + 72) = a6;
  *(unsigned char *)(v17 + 88) = a4;
  *(void *)(v17 + 48) = a2;
  *(void *)(v17 + 56) = a3;
  *(void *)(v17 + 32) = a8;
  *(void *)(v17 + 40) = a1;
  *(void *)(v17 + 24) = a7;
  return MEMORY[0x270FA2498](sub_249625278, a6, 0);
}

uint64_t sub_249625248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(void *)(v8 + 64) = a7;
  *(void *)(v8 + 72) = v7;
  *(unsigned char *)(v8 + 88) = a6;
  *(void *)(v8 + 48) = a4;
  *(void *)(v8 + 56) = a5;
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  *(void *)(v8 + 24) = a1;
  return MEMORY[0x270FA2498](sub_249625278, v7, 0);
}

uint64_t sub_249625278()
{
  uint64_t v21 = v0;
  if (objc_msgSend(*(id *)(v0 + 64), sel_previousFailureCount))
  {
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24962BF40();
    __swift_project_value_buffer(v1, (uint64_t)qword_2696C55C8);
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_24962BF20();
    os_log_type_t v3 = sub_24962C400();
    BOOL v4 = os_log_type_enabled(v2, v3);
    unint64_t v5 = *(void *)(v0 + 32);
    if (v4)
    {
      uint64_t v6 = *(void *)(v0 + 24);
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v20 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 16) = sub_2495F74C8(v6, v5, &v20);
      sub_24962C490();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2495EB000, v2, v3, "Authentication has failed previously, clearing out credentials for host %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v8, -1, -1);
      MEMORY[0x24C5A5090](v7, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v16 = *(void *)(v0 + 24);
    unint64_t v15 = *(void *)(v0 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    uint64_t v17 = swift_task_alloc();
    uint64_t v18 = sub_24962BE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
    sub_249623494(v16, v15, 0, v17);
    sub_2495F73C0(v17, &qword_2696C5618);
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19(0);
  }
  else
  {
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_2496255B4;
    uint64_t v10 = *(void *)(v0 + 48);
    uint64_t v11 = *(void *)(v0 + 56);
    uint64_t v12 = *(void *)(v0 + 40);
    char v13 = *(unsigned char *)(v0 + 88);
    return sub_2496282A4(v12, v10, v11, v13);
  }
}

uint64_t sub_2496255B4(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v7(a1);
  }
}

uint64_t sub_2496256E4(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](sub_249625704, v1, 0);
}

uint64_t sub_249625704()
{
  uint64_t v46 = v0;
  if (qword_2696C4A08 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = sub_24962BF40();
  *(void *)(v0 + 144) = __swift_project_value_buffer(v2, (uint64_t)qword_2696C55C8);
  uint64_t v3 = sub_24962BB70();
  *(void *)(v0 + 152) = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  *(void *)(v0 + 160) = v4;
  *(void *)(v0 + 168) = *(void *)(v4 + 64);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  *(void *)(v0 + 176) = v7;
  *(void *)(v0 + 184) = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v6, v1, v3);
  uint64_t v44 = swift_task_alloc();
  v7(v44, v1, v3);
  uint64_t v8 = swift_task_alloc();
  v7(v8, v1, v3);
  uint64_t v9 = sub_24962BF20();
  os_log_type_t v10 = sub_24962C3E0();
  if (os_log_type_enabled(v9, v10))
  {
    log = v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    v45[0] = v41;
    *(_DWORD *)uint64_t v11 = 136315650;
    uint64_t v12 = sub_24962BAD0();
    if (v13)
    {
      unint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 5522759;
      unint64_t v14 = 0xE300000000000000;
    }
    *(void *)(v0 + 96) = sub_2495F74C8(v12, v14, v45);
    sub_24962C490();
    swift_bridgeObjectRelease();
    unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v15(v6, v3);
    *(_WORD *)(v11 + 12) = 2080;
    sub_24962B2CC(&qword_2696C50C8, MEMORY[0x270FA7D48]);
    uint64_t v16 = sub_24962C6B0();
    *(void *)(v0 + 104) = sub_2495F74C8(v16, v17, v45);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v15(v44, v3);
    *(_WORD *)(v11 + 22) = 2080;
    unint64_t v18 = sub_24962BB20();
    if (!v18) {
      unint64_t v18 = sub_249621D04(MEMORY[0x263F8EE78]);
    }
    *(void *)(v0 + 112) = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5648);
    uint64_t v19 = sub_24962C140();
    *(void *)(v0 + 120) = sub_2495F74C8(v19, v20, v45);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v15(v8, v3);
    _os_log_impl(&dword_2495EB000, log, v10, "Sending request: %s %s: %s ", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v41, -1, -1);
    MEMORY[0x24C5A5090](v11, -1, -1);
  }
  else
  {
    unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v15(v6, v3);
    v15(v44, v3);
    v15(v8, v3);
  }
  *(void *)(v0 + 192) = v15;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v21 = swift_task_alloc();
  sub_24962BB50();
  uint64_t v22 = sub_24962BD40();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    sub_2495F73C0(v21, &qword_2696C4AF0);
    swift_task_dealloc();
LABEL_17:
    sub_249613EDC();
    swift_allocError();
    *uint64_t v39 = xmmword_249631460;
    swift_willThrow();
    os_log_type_t v40 = *(uint64_t (**)(void))(v0 + 8);
    return v40();
  }
  uint64_t v24 = sub_24962BCE0();
  uint64_t v26 = v25;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
  swift_task_dealloc();
  if (!v26) {
    goto LABEL_17;
  }
  uint64_t v27 = *(void **)(v0 + 136);
  uint64_t v28 = (void *)swift_allocObject();
  void v28[2] = v27;
  v28[3] = v24;
  v28[4] = v26;
  unint64_t v29 = (objc_class *)type metadata accessor for AuthTaskDelegate();
  uint64_t v30 = (char *)objc_allocWithZone(v29);
  uint64_t v31 = &v30[OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler];
  *(void *)uint64_t v31 = &unk_2696C5640;
  *((void *)v31 + 1) = v28;
  *(void *)(v0 + 56) = v30;
  *(void *)(v0 + 64) = v29;
  swift_retain();
  id v32 = objc_msgSendSuper2((objc_super *)(v0 + 56), sel_init);
  *(void *)(v0 + 200) = v32;
  id v33 = v27 + 23;
  uint64_t v35 = v27[26];
  uint64_t v34 = v27[27];
  __swift_project_boxed_opaque_existential_1(v33, v35);
  uint64_t v43 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))(*(void *)(v34 + 8) + **(int **)(v34 + 8));
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_249625E10;
  uint64_t v37 = *(void *)(v0 + 128);
  return v43(v37, v32, v35, v34);
}

uint64_t sub_249625E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  uint64_t v6 = (void *)*v4;
  v6[2] = v4;
  v6[3] = a1;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = v3;
  v6[27] = a3;
  v6[28] = v3;
  swift_task_dealloc();
  uint64_t v7 = v5[17];
  if (v3) {
    uint64_t v8 = sub_249626104;
  }
  else {
    uint64_t v8 = sub_249625F48;
  }
  return MEMORY[0x270FA2498](v8, v7, 0);
}

uint64_t sub_249625F48()
{
  uint64_t v1 = (void **)(v0 + 216);
  id v2 = *(id *)(v0 + 216);
  uint64_t v3 = sub_24962BF20();
  os_log_type_t v4 = sub_24962C3F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void **)(v0 + 216);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    unint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    *(void *)(v0 + 88) = v5;
    id v7 = v5;
    sub_24962C490();
    *unint64_t v14 = v5;

    _os_log_impl(&dword_2495EB000, v3, v4, "%@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v14, -1, -1);
    MEMORY[0x24C5A5090](v6, -1, -1);
    uint64_t v1 = (void **)(v0 + 200);
  }
  else
  {

    uint64_t v3 = *(NSObject **)(v0 + 200);
  }
  uint64_t v8 = *v1;
  uint64_t v9 = *(void *)(v0 + 24);
  uint64_t v10 = *(void *)(v0 + 32);

  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 216);
  return v11(v9, v10, v12);
}

uint64_t sub_249626104()
{
  uint64_t v24 = v0;
  uint64_t v1 = *(void **)(v0 + 224);
  id v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 128);

  uint64_t v5 = swift_task_alloc();
  v2(v5, v4, v3);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_24962BF20();
  os_log_type_t v9 = sub_24962C400();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 152);
    unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v22;
    *(_DWORD *)uint64_t v12 = 136315394;
    sub_24962B2CC(&qword_2696C50C8, MEMORY[0x270FA7D48]);
    uint64_t v13 = sub_24962C6B0();
    *(void *)(v0 + 72) = sub_2495F74C8(v13, v14, &v23);
    sub_24962C490();
    swift_bridgeObjectRelease();
    v20(v5, v11);
    *(_WORD *)(v12 + 12) = 2112;
    id v15 = v10;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v16;
    sub_24962C490();
    void *v21 = v16;

    _os_log_impl(&dword_2495EB000, v8, v9, "Request [%s] failed with error: %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v22, -1, -1);
    MEMORY[0x24C5A5090](v12, -1, -1);
  }
  else
  {
    unint64_t v17 = *(void **)(v0 + 224);
    (*(void (**)(uint64_t, void))(v0 + 192))(v5, *(void *)(v0 + 152));
  }
  swift_task_dealloc();
  swift_willThrow();
  unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_2496263D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *(void *)uint64_t v17 = v8;
  *(void *)(v17 + 8) = sub_2496264C4;
  *(void *)(v17 + 64) = a5;
  *(void *)(v17 + 72) = a6;
  *(unsigned char *)(v17 + 88) = a4;
  *(void *)(v17 + 48) = a2;
  *(void *)(v17 + 56) = a3;
  *(void *)(v17 + 32) = a8;
  *(void *)(v17 + 40) = a1;
  *(void *)(v17 + 24) = a7;
  return MEMORY[0x270FA2498](sub_249625278, a6, 0);
}

uint64_t sub_2496264C4(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_2496265C4()
{
  sub_2496152E0(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 224);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for URLSessionAuthenticator()
{
  return self;
}

uint64_t *sub_249626630(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    id v6 = (void *)a2[1];
    a1[1] = (uint64_t)v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    os_log_type_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24962BE10();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_retain();
    id v13 = v6;
    if (v12(v9, 1, v10))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
      memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  return v5;
}

uint64_t sub_2496267B4(uint64_t a1, uint64_t a2)
{
  swift_release();

  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24962BE10();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_24962688C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  id v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24962BE10();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_retain();
  id v11 = v4;
  if (v10(v7, 1, v8))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    memcpy(v6, v7, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_2496269BC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  id v6 = (void *)a1[1];
  uint64_t v7 = (void *)a2[1];
  a1[1] = v7;
  id v8 = v7;

  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24962BE10();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

_OWORD *sub_249626B60(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  id v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24962BE10();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void *sub_249626C74(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  id v6 = (void *)a1[1];
  a1[1] = a2[1];

  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24962BE10();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_249626E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249626E20);
}

uint64_t sub_249626E20(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_249626ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249626EE8);
}

void *sub_249626EE8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for URLSessionAuthenticator.RequestState()
{
  uint64_t result = qword_2696C5620;
  if (!qword_2696C5620) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_249626FE0()
{
  sub_249627084();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_249627084()
{
  if (!qword_2696C5630)
  {
    sub_24962BE10();
    unint64_t v0 = sub_24962C450();
    if (!v1) {
      atomic_store(v0, &qword_2696C5630);
    }
  }
}

uint64_t destroy for URLSessionAuthenticator.Configuration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 72);
}

uint64_t initializeWithCopy for URLSessionAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v6 = a2 + 72;
  long long v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 96) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(a1 + 72, v6, v8);
  return a1;
}

uint64_t assignWithCopy for URLSessionAuthenticator.Configuration(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for URLSessionAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for URLSessionAuthenticator.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 96);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for URLSessionAuthenticator.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 96) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for URLSessionAuthenticator.Configuration()
{
  return &type metadata for URLSessionAuthenticator.Configuration;
}

uint64_t sub_249627438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[22] = a4;
  v5[23] = v4;
  v5[20] = a2;
  v5[21] = a3;
  v5[19] = a1;
  return MEMORY[0x270FA2498](sub_249627460, v4, 0);
}

uint64_t sub_249627460()
{
  uint64_t v63 = v0;
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v1 + 128);
  if (!v2)
  {
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_24962BF40();
    __swift_project_value_buffer(v23, (uint64_t)qword_2696C55C8);
    uint64_t v24 = sub_24962BF20();
    os_log_type_t v25 = sub_24962C400();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_2495EB000, v24, v25, "Missing IMPI, unable to perform bootstrap authentication", v26, 2u);
      MEMORY[0x24C5A5090](v26, -1, -1);
    }

    sub_249613EDC();
    swift_allocError();
    long long v28 = xmmword_2496314B0;
    goto LABEL_18;
  }
  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t v4 = *(void **)(v0 + 160);
  uint64_t v5 = sub_24962BB70();
  *(void *)(v0 + 192) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v0 + 200) = v6;
  uint64_t v61 = swift_task_alloc();
  *(void *)(v0 + 208) = v61;
  swift_bridgeObjectRetain();
  id v7 = objc_msgSend(v4, sel_originalRequest);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5668);
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = v8;
  if (!v7)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v8, 1, 1, v5);
    goto LABEL_13;
  }
  *(void *)os_log_type_t type = v3;
  uint64_t v10 = swift_task_alloc();
  sub_24962BB30();

  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v11(v9, v10, v5);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v9, 0, 1, v5);
  swift_task_dealloc();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5) == 1)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    sub_2495F73C0(v9, &qword_2696C5668);
    swift_task_dealloc();
    swift_task_dealloc();
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_24962BF40();
    __swift_project_value_buffer(v29, (uint64_t)qword_2696C55C8);
    uint64_t v30 = sub_24962BF20();
    os_log_type_t v31 = sub_24962C400();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v32 = 0;
      _os_log_impl(&dword_2495EB000, v30, v31, "Unable to get original request", v32, 2u);
      MEMORY[0x24C5A5090](v32, -1, -1);
    }

    sub_249613EDC();
    swift_allocError();
    long long v28 = xmmword_249631470;
LABEL_18:
    long long *v27 = v28;
    swift_willThrow();
LABEL_19:
    id v33 = *(uint64_t (**)(void))(v0 + 8);
    return v33();
  }
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v12 = *(void *)(v0 + 176);
  ((void (*)(uint64_t, uint64_t))v11)(v61, v9);
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  sub_24960D9B0(v13, v12);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_24962BF40();
    __swift_project_value_buffer(v35, (uint64_t)qword_2696C55C8);
    uint64_t v36 = sub_24962BF20();
    os_log_type_t v37 = sub_24962C400();
    uint64_t v38 = v61;
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_2495EB000, v36, v37, "Invalid realm parameter", v39, 2u);
      MEMORY[0x24C5A5090](v39, -1, -1);
    }

    sub_249613EDC();
    swift_allocError();
    *os_log_type_t v40 = 0;
    v40[1] = 0;
    goto LABEL_45;
  }
  uint64_t v56 = v14;
  os_log_t log = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v17 = swift_task_alloc();
  sub_24962BB50();
  uint64_t v18 = sub_24962BD40();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_2495F73C0(v17, &qword_2696C4AF0);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    unint64_t v22 = (unint64_t)log;
LABEL_36:
    uint64_t v38 = v61;
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_24962BF40();
    __swift_project_value_buffer(v50, (uint64_t)qword_2696C55C8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unsigned int v51 = sub_24962BF20();
    os_log_type_t v52 = sub_24962C400();
    if (os_log_type_enabled(v51, v52))
    {
      os_log_type_t typea = v52;
      uint64_t v53 = swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      v62[0] = v58;
      *(_DWORD *)uint64_t v53 = 136315394;
      if (v21)
      {
        unint64_t v54 = v21;
      }
      else
      {
        uint64_t v20 = 0;
        unint64_t v54 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 136) = sub_2495F74C8(v20, v54, v62);
      sub_24962C490();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v53 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 144) = sub_2495F74C8(v56, v22, v62);
      sub_24962C490();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2495EB000, v51, typea, "Request FQDN (%s) does not match realm FQDN (%s)", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v58, -1, -1);
      MEMORY[0x24C5A5090](v53, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    sub_249613EDC();
    swift_allocError();
    *id v55 = xmmword_2496314A0;
LABEL_45:
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v38, v5);
    swift_task_dealloc();
    goto LABEL_19;
  }
  uint64_t v41 = sub_24962BCE0();
  uint64_t v21 = v42;
  *(void *)(v0 + 216) = v42;
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  swift_task_dealloc();
  if (!v21)
  {
    swift_bridgeObjectRelease();
    unint64_t v22 = (unint64_t)log;
    uint64_t v20 = v41;
    goto LABEL_36;
  }
  unint64_t v22 = (unint64_t)log;
  uint64_t v20 = v41;
  if ((v41 != v56 || (os_log_t)v21 != log) && (sub_24962C6C0() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  uint64_t v43 = *(void *)(v0 + 184);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v44 = *(unsigned char *)(v1 + 112);
  sub_2495F07A0(v43 + 184, v0 + 24);
  uint64_t v45 = *(void *)(v43 + 168);
  char v46 = *(unsigned char *)(v43 + 176);
  char v47 = *(unsigned char *)(v43 + 177);
  *(unsigned char *)(v0 + 16) = v44;
  *(void *)(v0 + 64) = *(void *)type;
  *(void *)(v0 + 72) = v2;
  *(void *)(v0 + 80) = v45;
  *(unsigned char *)(v0 + 88) = v46;
  *(unsigned char *)(v0 + 89) = v47;
  __swift_project_boxed_opaque_existential_1((void *)(v43 + 224), *(void *)(v43 + 248));
  sub_249629904(v0 + 16, (uint64_t *)(v0 + 96));
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  uint64_t v48 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v48;
  *uint64_t v48 = v0;
  v48[1] = sub_249627E58;
  uint64_t v49 = *(void *)(v0 + 152);
  return sub_249605ECC(v49, v41, v21);
}

uint64_t sub_249627E58()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 184);
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v4 = sub_249628040;
  }
  else {
    uint64_t v4 = sub_249627FA0;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_249627FA0()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  sub_24960C6E8((uint64_t)(v0 + 2));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_249628040()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  sub_24960C6E8((uint64_t)(v0 + 2));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2496280E0()
{
  if (*(void *)(v0 + 144) && *(void *)(v0 + 160))
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F08BB0]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_24962C0C0();
    swift_bridgeObjectRelease();
    uint64_t v3 = (void *)sub_24962C0C0();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v1, sel_initWithUser_password_persistence_, v2, v3, 0);

    return (uint64_t)v4;
  }
  else
  {
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24962BF40();
    __swift_project_value_buffer(v6, (uint64_t)qword_2696C55C8);
    id v7 = sub_24962BF20();
    os_log_type_t v8 = sub_24962C400();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2495EB000, v7, v8, "Missing username or password for Basic HTTP authentication", v9, 2u);
      MEMORY[0x24C5A5090](v9, -1, -1);
    }

    sub_249613EDC();
    swift_allocError();
    *uint64_t v10 = 0xD000000000000011;
    v10[1] = 0x800000024962DDF0;
    return swift_willThrow();
  }
}

uint64_t sub_2496282A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v5 + 136) = a4;
  *(void *)(v5 + 56) = a3;
  *(void *)(v5 + 64) = v4;
  *(void *)(v5 + 40) = a1;
  *(void *)(v5 + 48) = a2;
  *(void *)(v5 + 72) = type metadata accessor for GBAResult(0);
  *(void *)(v5 + 80) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249628340, v4, 0);
}

uint64_t sub_249628340()
{
  uint64_t v49 = v0;
  id v1 = *(void **)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5668);
  uint64_t v2 = swift_task_alloc();
  id v3 = objc_msgSend(v1, sel_originalRequest);
  uint64_t v4 = swift_task_alloc();
  if (v3)
  {
    sub_24962BB30();

    uint64_t v5 = sub_24962BB70();
    uint64_t v6 = *(void *)(v5 - 8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  }
  else
  {
    uint64_t v5 = sub_24962BB70();
    uint64_t v6 = *(void *)(v5 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_2495FA914(v4, v2, &qword_2696C5668);
  sub_24962BB70();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
  {
    swift_task_dealloc();
    sub_2495F73C0(v2, &qword_2696C5668);
LABEL_8:
    swift_task_dealloc();
LABEL_9:
    sub_249613EDC();
    swift_allocError();
    *uint64_t v10 = xmmword_249631460;
    swift_willThrow();
LABEL_10:
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4AF0);
  uint64_t v7 = swift_task_alloc();
  sub_24962BB50();
  uint64_t v8 = sub_24962BD40();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_2495F73C0(v7, &qword_2696C4AF0);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
    swift_task_dealloc();
    goto LABEL_8;
  }
  uint64_t v13 = sub_24962BCE0();
  uint64_t v15 = v14;
  *(void *)(v0 + 88) = v13;
  *(void *)(v0 + 96) = v14;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  unint64_t v16 = v15;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  if (!v15) {
    goto LABEL_9;
  }
  uint64_t v17 = sub_24962919C(v13, v15);
  if (v17)
  {
    uint64_t v18 = v17;
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24962BF40();
    __swift_project_value_buffer(v19, (uint64_t)qword_2696C55C8);
    id v20 = v18;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_24962BF20();
    os_log_type_t v22 = sub_24962C3E0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = (void *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v48[0] = v47;
      *(_DWORD *)uint64_t v23 = 138412546;
      *(void *)(v0 + 24) = v20;
      id v20 = v20;
      sub_24962C490();
      *uint64_t v24 = v18;

      *(_WORD *)(v23 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 32) = sub_2495F74C8(v13, v16, v48);
      sub_24962C490();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2495EB000, v21, v22, "Found cached credential %@ for host %s", (uint8_t *)v23, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4C00);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v24, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v47, -1, -1);
      MEMORY[0x24C5A5090](v23, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_25;
  }
  int v25 = *(unsigned __int8 *)(v0 + 136);
  *(void *)(v0 + 104) = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618) - 8)
                                    + 64);
  uint64_t v26 = swift_task_alloc();
  *(void *)(v0 + 112) = v26;
  if (!v25)
  {
    swift_bridgeObjectRelease();
    if (qword_2696C4A08 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_24962BF40();
    __swift_project_value_buffer(v33, (uint64_t)qword_2696C55C8);
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_24962BF20();
    os_log_type_t v35 = sub_24962C400();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v38 = *(void *)(v0 + 48);
    uint64_t v37 = *(void *)(v0 + 56);
    if (v36)
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v48[0] = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      *(void *)(v0 + 16) = sub_2495F74C8(0x747365676944, 0xE600000000000000, v48);
      sub_24962C490();
      sub_2495FB194(v38, v37, 0);
      _os_log_impl(&dword_2495EB000, v34, v35, "Unsupported authentication scheme: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A5090](v40, -1, -1);
      MEMORY[0x24C5A5090](v39, -1, -1);
    }
    else
    {
      sub_2495FB194(*(void *)(v0 + 48), *(void *)(v0 + 56), 0);
    }

    sub_249613EDC();
    swift_allocError();
    *uint64_t v41 = xmmword_249631480;
    swift_willThrow();
    swift_task_dealloc();
    goto LABEL_10;
  }
  if (v25 != 1)
  {
    uint64_t v42 = (void *)sub_2496280E0();
    uint64_t v43 = sub_24962BE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v26, 1, 1, v43);
    uint64_t v44 = *(void *)(v0 + 112);
    uint64_t v46 = *(void *)(v0 + 88);
    unint64_t v45 = *(void *)(v0 + 96);
    id v20 = v42;
    sub_249623494(v46, v45, v42, v44);

    swift_bridgeObjectRelease();
    sub_2495F73C0(v44, &qword_2696C5618);
    swift_task_dealloc();
LABEL_25:
    swift_task_dealloc();
    id v32 = *(uint64_t (**)(id))(v0 + 8);
    return v32(v20);
  }
  uint64_t v27 = *(void *)(v0 + 56);
  uint64_t v28 = swift_task_alloc();
  *(void *)(v0 + 120) = v28;
  *(void *)uint64_t v28 = v0;
  *(void *)(v28 + 8) = sub_249628CC8;
  uint64_t v29 = *(void *)(v0 + 80);
  uint64_t v30 = *(void *)(v0 + 64);
  long long v31 = *(_OWORD *)(v0 + 40);
  *(void *)(v28 + 176) = v27;
  *(void *)(v28 + 184) = v30;
  *(_OWORD *)(v28 + 160) = v31;
  *(void *)(v28 + 152) = v29;
  return MEMORY[0x270FA2498](sub_249627460, v30, 0);
}

uint64_t sub_249628CC8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24962905C;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 64);
    uint64_t v4 = sub_249628DF0;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_249628DF0()
{
  uint64_t v21 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  int v3 = objc_msgSend(*(id *)(v0 + 40), sel__TLSNegotiatedCipherSuite);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_249604ED4(v3);
  unint64_t v6 = v5;
  sub_24962BDC0();
  sub_2495F7470(v4, v6);
  id v7 = objc_allocWithZone(MEMORY[0x263F08BB0]);
  uint64_t v8 = (void *)sub_24962C0C0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_24962C0C0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v7, sel_initWithUser_password_persistence_, v8, v9, 0);

  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = v2 + *(int *)(v1 + 20);
  uint64_t v13 = sub_24962BE10();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v11, v12, v13);
  sub_24962B00C(v2, type metadata accessor for GBAResult);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  sub_2495FA914(v11, v21, &qword_2696C5618);
  swift_task_dealloc();
  uint64_t v15 = *(void *)(v0 + 112);
  uint64_t v17 = *(void *)(v0 + 88);
  unint64_t v16 = *(void *)(v0 + 96);
  id v18 = v10;
  sub_249623494(v17, v16, v10, v15);

  swift_bridgeObjectRelease();
  sub_2495F73C0(v15, &qword_2696C5618);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(id))(v0 + 8);
  return v19(v18);
}

uint64_t sub_24962905C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void (*sub_2496290C8(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24962A960(v6, a2, a3);
  return sub_249629148;
}

void sub_249629148(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

void *sub_24962919C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5678);
  uint64_t v7 = MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v61 - v11;
  uint64_t v13 = type metadata accessor for URLSessionAuthenticator.RequestState();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v13, v15);
  id v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16, v19);
  uint64_t v21 = (char *)&v61 - v20;
  uint64_t v22 = v2 + 264;
  swift_beginAccess();
  uint64_t v23 = *(void *)(v2 + 264);
  if (!*(void *)(v23 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_7:
    sub_2495F73C0((uint64_t)v12, &qword_2696C5678);
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_249629C58(a1, a2);
  if (v25)
  {
    sub_24962B06C(*(void *)(v23 + 56) + *(void *)(v14 + 72) * v24, (uint64_t)v12);
    uint64_t v26 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56);
    uint64_t v27 = v12;
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v26 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56);
    uint64_t v27 = v12;
    uint64_t v28 = 1;
  }
  uint64_t v74 = v26;
  v26((uint64_t)v27, v28, 1, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    goto LABEL_7;
  }
  sub_24962AFA8((uint64_t)v12, (uint64_t)v21);
  uint64_t v29 = (void *)*((void *)v21 + 1);
  if (!v29)
  {
    sub_24962B00C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
    return v29;
  }
  unint64_t v70 = a2;
  uint64_t v65 = v22;
  uint64_t v66 = v18;
  uint64_t v67 = v9;
  uint64_t v68 = a1;
  uint64_t v31 = sub_24962BE10();
  uint64_t v73 = &v61;
  unint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(void *)(v32 + 64);
  MEMORY[0x270FA5388](v31, v34);
  unint64_t v69 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v71 = (char *)&v61 - v69;
  uint64_t v35 = (uint64_t)&v21[*(int *)(v13 + 24)];
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
  uint64_t v72 = &v61;
  MEMORY[0x270FA5388](v36 - 8, v37);
  uint64_t v39 = (char *)&v61 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2495F7288(v35, (uint64_t)v39, &qword_2696C5618);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v39, 1, v31) == 1)
  {
    id v40 = v29;
    sub_24962B00C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
    sub_2495F73C0((uint64_t)v39, &qword_2696C5618);
    return v29;
  }
  uint64_t v41 = v71;
  uint64_t v42 = (*(uint64_t (**)(char *, char *, uint64_t))(v32 + 32))(v71, v39, v31);
  MEMORY[0x270FA5388](v42, v43);
  uint64_t v72 = (void *)v31;
  uint64_t v44 = (char *)&v61 - v69;
  id v64 = v29;
  sub_24962BE00();
  char v45 = sub_24962BDF0();
  unint64_t v69 = v32;
  uint64_t v46 = *(void (**)(char *, void *))(v32 + 8);
  uint64_t v47 = v44;
  uint64_t v48 = v72;
  v46(v47, v72);
  unint64_t v49 = v70;
  if (v45)
  {
    v46(v41, v48);
    sub_24962B00C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
    return v29;
  }
  uint64_t v63 = v46;
  if (qword_2696C4A08 != -1) {
    swift_once();
  }
  uint64_t v50 = sub_24962BF40();
  __swift_project_value_buffer(v50, (uint64_t)qword_2696C55C8);
  swift_bridgeObjectRetain_n();
  unsigned int v51 = sub_24962BF20();
  os_log_type_t v52 = sub_24962C3E0();
  if (os_log_type_enabled(v51, v52))
  {
    os_log_t v62 = v51;
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    v76[0] = v54;
    *(_DWORD *)uint64_t v53 = 136315138;
    uint64_t v61 = v53 + 4;
    swift_bridgeObjectRetain();
    uint64_t v55 = v68;
    uint64_t v75 = sub_2495F74C8(v68, v49, v76);
    sub_24962C490();
    swift_bridgeObjectRelease_n();
    os_log_t v56 = v62;
    _os_log_impl(&dword_2495EB000, v62, v52, "Credential for %s has expired, resetting", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A5090](v54, -1, -1);
    MEMORY[0x24C5A5090](v53, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v55 = v68;
  }
  uint64_t v58 = (uint64_t)v66;
  uint64_t v57 = (uint64_t)v67;
  sub_24962B06C((uint64_t)v21, (uint64_t)v66);

  *(void *)(v58 + 8) = 0;
  uint64_t v59 = v58 + *(int *)(v13 + 24);
  sub_2495F73C0(v59, &qword_2696C5618);
  unint64_t v60 = v72;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v69 + 56))(v59, 1, 1, v72);
  sub_24962B06C(v58, v57);
  v74(v57, 0, 1, v13);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24961FB98(v57, v55, v49);
  swift_endAccess();

  v63(v71, v60);
  sub_24962B00C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
  sub_24962B00C(v58, (uint64_t (*)(void))type metadata accessor for URLSessionAuthenticator.RequestState);
  return 0;
}

uint64_t sub_249629904@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24962AF4C(a1, (uint64_t)v17);
  sub_24962AF4C((uint64_t)v17, (uint64_t)v15);
  uint64_t v13 = &type metadata for HTTPGBAAuthenticator.DefaultFactory;
  uint64_t v14 = &off_26FD38780;
  uint64_t v3 = type metadata accessor for HTTPGBAAuthenticator(0);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, (uint64_t)&type metadata for HTTPGBAAuthenticator.DefaultFactory);
  MEMORY[0x270FA5388](v5, v5);
  (*(void (**)(void))(v6 + 16))();
  uint64_t v7 = v4 + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_factory;
  *(void *)(v7 + 24) = &type metadata for HTTPGBAAuthenticator.DefaultFactory;
  *(void *)(v7 + 32) = &off_26FD38780;
  sub_24962BE30();
  uint64_t v8 = (_OWORD *)(v4 + OBJC_IVAR____TtC15CTLazuliSupport20HTTPGBAAuthenticator_configuration);
  long long v9 = v16[0];
  v8[2] = v15[2];
  void v8[3] = v9;
  *(_OWORD *)((char *)v8 + 58) = *(_OWORD *)((char *)v16 + 10);
  long long v10 = v15[1];
  *uint64_t v8 = v15[0];
  v8[1] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  uint64_t result = sub_24960C6E8((uint64_t)v17);
  a2[3] = v3;
  a2[4] = (uint64_t)&off_26FD385A8;
  *a2 = v4;
  return result;
}

uint64_t sub_249629A7C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v12 = v5[2];
  uint64_t v13 = v5[3];
  uint64_t v14 = v5[4];
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v15;
  *uint64_t v15 = v6;
  v15[1] = sub_249629B5C;
  return sub_2496263D4(a1, a2, a3, a4, a5, v12, v13, v14);
}

uint64_t sub_249629B5C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unint64_t sub_249629C58(uint64_t a1, uint64_t a2)
{
  sub_24962C760();
  sub_24962C170();
  uint64_t v4 = sub_24962C780();
  return sub_24962A610(a1, a2, v4);
}

uint64_t sub_249629CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_249629C58(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24962A6F4();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for URLSessionAuthenticator.RequestState();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_24962AFA8(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_24962A204(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for URLSessionAuthenticator.RequestState();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_249629E60(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for URLSessionAuthenticator.RequestState();
  uint64_t v43 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8, v6);
  unint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5680);
  int v44 = a2;
  uint64_t v10 = sub_24962C5F0();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v42 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  id v40 = v2;
  int64_t v41 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v41) {
      break;
    }
    unint64_t v24 = v42;
    unint64_t v25 = v42[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v25 = v42[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v44 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v42[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v41) {
              goto LABEL_34;
            }
            unint64_t v25 = v42[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v22);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    uint64_t v30 = *(void *)(v43 + 72);
    uint64_t v31 = *(void *)(v9 + 56) + v30 * v22;
    if (v44)
    {
      sub_24962AFA8(v31, (uint64_t)v8);
    }
    else
    {
      sub_24962B06C(v31, (uint64_t)v8);
      swift_bridgeObjectRetain();
    }
    sub_24962C760();
    sub_24962C170();
    uint64_t result = sub_24962C780();
    uint64_t v32 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1 << v33) & ~*(void *)(v16 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v33) & ~*(void *)(v16 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v16 + 8 * v34);
      }
      while (v38 == -1);
      unint64_t v19 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v20 = (void *)(*(void *)(v11 + 48) + 16 * v19);
    *uint64_t v20 = v29;
    v20[1] = v28;
    uint64_t result = sub_24962AFA8((uint64_t)v8, *(void *)(v11 + 56) + v19 * v30);
    ++*(void *)(v11 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v24 = v42;
  if ((v44 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v39 = 1 << *(unsigned char *)(v9 + 32);
  if (v39 >= 64) {
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v39;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

unint64_t sub_24962A204(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24962C4E0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_24962C760();
        swift_bridgeObjectRetain();
        sub_24962C170();
        uint64_t v9 = sub_24962C780();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for URLSessionAuthenticator.RequestState() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24962A414(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_249629C58(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24962A6F4();
      goto LABEL_7;
    }
    sub_249629E60(v15, a4 & 1);
    unint64_t v22 = sub_249629C58(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24962C6F0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19
        + *(void *)(*(void *)(type metadata accessor for URLSessionAuthenticator.RequestState() - 8) + 72) * v12;
    return sub_24962B0D0(a1, v20);
  }
LABEL_13:
  sub_24962A578(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24962A578(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for URLSessionAuthenticator.RequestState();
  uint64_t result = sub_24962AFA8(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_24962A610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24962C6C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24962C6C0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_24962A6F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URLSessionAuthenticator.RequestState();
  uint64_t v31 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5680);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24962C5E0();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 16);
  if (!v9)
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v29 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v11)
  {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v11);
    uint64_t v9 = *(void *)(v6 + 16);
  }
  uint64_t v30 = v6 + 64;
  int64_t v12 = 0;
  *(void *)(v8 + 16) = v9;
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v25 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v16) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v30 + 8 * v25);
    ++v12;
    if (!v26)
    {
      int64_t v12 = v25 + 1;
      if (v25 + 1 >= v16) {
        goto LABEL_23;
      }
      unint64_t v26 = *(void *)(v30 + 8 * v12);
      if (!v26) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v26 - 1) & v26;
    unint64_t v18 = __clz(__rbit64(v26)) + (v12 << 6);
LABEL_9:
    uint64_t v19 = 16 * v18;
    uint64_t v20 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v18);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = *(void *)(v31 + 72) * v18;
    sub_24962B06C(*(void *)(v6 + 56) + v23, (uint64_t)v5);
    BOOL v24 = (void *)(*(void *)(v8 + 48) + v19);
    *BOOL v24 = v21;
    v24[1] = v22;
    sub_24962AFA8((uint64_t)v5, *(void *)(v8 + 56) + v23);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v16)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v29;
    goto LABEL_25;
  }
  unint64_t v26 = *(void *)(v30 + 8 * v27);
  if (v26)
  {
    int64_t v12 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v30 + 8 * v12);
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void (*sub_24962A960(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  unsigned __int8 v6[9] = sub_24962AD04(v6);
  v6[10] = sub_24962AA80(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24962AA0C;
}

void sub_24962AA0C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_24962AA80(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[1] = a3;
  long long v10[2] = v4;
  *uint64_t v10 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5678);
  int64_t v12 = malloc(*(void *)(*(void *)(v11 - 8) + 64));
  v10[3] = v12;
  uint64_t v13 = *v4;
  unint64_t v15 = sub_249629C58(a2, a3);
  *((unsigned char *)v10 + 40) = v14 & 1;
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
  }
  else
  {
    char v19 = v14;
    uint64_t v20 = *(void *)(v13 + 24);
    if (v20 >= v18 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v15;
      if (v19)
      {
LABEL_8:
        uint64_t v21 = *(void *)(*v5 + 56);
        uint64_t v22 = type metadata accessor for URLSessionAuthenticator.RequestState();
        uint64_t v23 = *(void *)(v22 - 8);
        sub_24962AFA8(v21 + *(void *)(v23 + 72) * v15, (uint64_t)v12);
        uint64_t v24 = 0;
LABEL_12:
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v12, v24, 1, v22);
        return sub_24962ACA0;
      }
LABEL_11:
      uint64_t v22 = type metadata accessor for URLSessionAuthenticator.RequestState();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = 1;
      goto LABEL_12;
    }
    if (v20 >= v18 && (a4 & 1) == 0)
    {
      sub_24962A6F4();
      goto LABEL_7;
    }
    sub_249629E60(v18, a4 & 1);
    unint64_t v25 = sub_249629C58(a2, a3);
    if ((v19 & 1) == (v26 & 1))
    {
      unint64_t v15 = v25;
      v10[4] = v25;
      if (v19) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_24962C6F0();
  __break(1u);
  return result;
}

void sub_24962ACA0(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)(*a1)[3];
  sub_24962AD40((uint64_t)v2, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[2], (*a1)[4], **a1, (*a1)[1]);
  sub_2495F73C0((uint64_t)v2, &qword_2696C5678);
  free(v2);
  free(v1);
}

uint64_t (*sub_24962AD04(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_24962AD34;
}

uint64_t sub_24962AD34(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

unint64_t sub_24962AD40(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a5;
  uint64_t v26 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5678);
  MEMORY[0x270FA5388](v10 - 8, v11);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for URLSessionAuthenticator.RequestState();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14, v16);
  char v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  uint64_t v22 = (char *)&v25 - v21;
  sub_2495F7288(a1, (uint64_t)v13, &qword_2696C5678);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    unint64_t result = sub_2495F73C0((uint64_t)v13, &qword_2696C5678);
    if (a2)
    {
      swift_arrayDestroy();
      return sub_24962A204(a4, *a3);
    }
  }
  else
  {
    sub_24962AFA8((uint64_t)v13, (uint64_t)v22);
    uint64_t v24 = (void *)*a3;
    if (a2)
    {
      return sub_24962AFA8((uint64_t)v22, v24[7] + *(void *)(v15 + 72) * a4);
    }
    else
    {
      sub_24962AFA8((uint64_t)v22, (uint64_t)v19);
      sub_24962A578(a4, v25, v26, (uint64_t)v19, v24);
      return swift_bridgeObjectRetain();
    }
  }
  return result;
}

uint64_t sub_24962AF4C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24962AFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URLSessionAuthenticator.RequestState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24962B00C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24962B06C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URLSessionAuthenticator.RequestState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24962B0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URLSessionAuthenticator.RequestState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24962B134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C5618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24962B1E0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v12 = v5[2];
  uint64_t v13 = v5[3];
  uint64_t v14 = v5[4];
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v15;
  *uint64_t v15 = v6;
  v15[1] = sub_24962BAA8;
  return sub_249625158(a1, a2, a3, a4, a5, v12, v13, v14);
}

id sub_24962B2C0(uint64_t a1)
{
  return sub_249615334(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_24962B2CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24962B314()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t *sub_24962B35C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_24962B3A8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2495F7470(*(void *)(v0 + 104), *(void *)(v0 + 112));
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 184, 7);
}

uint64_t sub_24962B418()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24962B450(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2495EFD7C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2696C56D0 + dword_2696C56D0);
  return v8(a1, a2, v6);
}

uint64_t sub_24962B518(uint64_t a1)
{
  return sub_24961CAE8(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_24962B524()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C56B0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24962B600()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696C56B0) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_2495F0868;
  v4[11] = v3;
  return MEMORY[0x270FA2498](sub_24961CEE8, 0, 0);
}

unint64_t sub_24962B6E8()
{
  unint64_t result = qword_2696C5720;
  if (!qword_2696C5720)
  {
    sub_24962C320();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696C5720);
  }
  return result;
}

uint64_t sub_24962B740(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2495F90B0;
  return sub_24961F17C(a1, v1);
}

uint64_t sub_24962B7D8()
{
  uint64_t v1 = sub_24962BD40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24962B8A4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24962BD40() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2495FB164;
  return sub_24961EA40(a1, v5, v6);
}

uint64_t sub_24962B988()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24962B9D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_2495FB164;
  return sub_24961E330(a1, v4, v5, v6, v7, v8);
}

ValueMetadata *type metadata accessor for URLSessionAuthenticator.DefaultFactory()
{
  return &type metadata for URLSessionAuthenticator.DefaultFactory;
}

uint64_t sub_24962BAB0()
{
  return MEMORY[0x270EEDB80]();
}

uint64_t sub_24962BAC0()
{
  return MEMORY[0x270EEDB98]();
}

uint64_t sub_24962BAD0()
{
  return MEMORY[0x270EEDBA8]();
}

uint64_t sub_24962BAE0()
{
  return MEMORY[0x270EEDBB8]();
}

uint64_t sub_24962BAF0()
{
  return MEMORY[0x270EEDBC8]();
}

uint64_t sub_24962BB00()
{
  return MEMORY[0x270EEDBD8]();
}

uint64_t sub_24962BB10()
{
  return MEMORY[0x270EEDC00]();
}

uint64_t sub_24962BB20()
{
  return MEMORY[0x270EEDC18]();
}

uint64_t sub_24962BB30()
{
  return MEMORY[0x270EEDC40]();
}

uint64_t sub_24962BB40()
{
  return MEMORY[0x270EEDC58]();
}

uint64_t sub_24962BB50()
{
  return MEMORY[0x270EEDC70]();
}

uint64_t sub_24962BB60()
{
  return MEMORY[0x270EEDCA8]();
}

uint64_t sub_24962BB70()
{
  return MEMORY[0x270EEDCB0]();
}

uint64_t sub_24962BB80()
{
  return MEMORY[0x270EEE0A0]();
}

uint64_t sub_24962BB90()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_24962BBA0()
{
  return MEMORY[0x270EEE620]();
}

uint64_t sub_24962BBB0()
{
  return MEMORY[0x270EEE630]();
}

uint64_t sub_24962BBC0()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_24962BBD0()
{
  return MEMORY[0x270EEE650]();
}

uint64_t sub_24962BBE0()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_24962BBF0()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_24962BC00()
{
  return MEMORY[0x270EEE690]();
}

uint64_t sub_24962BC10()
{
  return MEMORY[0x270EEEA58]();
}

uint64_t sub_24962BC20()
{
  return MEMORY[0x270FA1630]();
}

uint64_t sub_24962BC30()
{
  return MEMORY[0x270EEEFD8]();
}

uint64_t sub_24962BC40()
{
  return MEMORY[0x270EEF000]();
}

uint64_t sub_24962BC50()
{
  return MEMORY[0x270EEF120]();
}

uint64_t sub_24962BC60()
{
  return MEMORY[0x270EEF7F8]();
}

uint64_t sub_24962BC70()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_24962BC80()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_24962BC90()
{
  return MEMORY[0x270EEFBE0]();
}

uint64_t sub_24962BCA0()
{
  return MEMORY[0x270EEFC80]();
}

uint64_t sub_24962BCB0()
{
  return MEMORY[0x270EEFCD8]();
}

uint64_t sub_24962BCC0()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_24962BCD0()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_24962BCE0()
{
  return MEMORY[0x270EEFE48]();
}

uint64_t sub_24962BCF0()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_24962BD00()
{
  return MEMORY[0x270EEFE78]();
}

uint64_t sub_24962BD10()
{
  return MEMORY[0x270EEFE90]();
}

uint64_t sub_24962BD20()
{
  return MEMORY[0x270EEFEA0]();
}

uint64_t sub_24962BD30()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_24962BD40()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_24962BD50()
{
  return MEMORY[0x270EEFFA8]();
}

uint64_t sub_24962BD60()
{
  return MEMORY[0x270EF0058]();
}

uint64_t sub_24962BD70()
{
  return MEMORY[0x270EF0068]();
}

uint64_t sub_24962BD80()
{
  return MEMORY[0x270EF0088]();
}

uint64_t sub_24962BD90()
{
  return MEMORY[0x270EF00B8]();
}

uint64_t sub_24962BDA0()
{
  return MEMORY[0x270EF00C8]();
}

uint64_t sub_24962BDB0()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_24962BDC0()
{
  return MEMORY[0x270EF0138]();
}

uint64_t sub_24962BDD0()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_24962BDE0()
{
  return MEMORY[0x270EF06F0]();
}

uint64_t sub_24962BDF0()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_24962BE00()
{
  return MEMORY[0x270EF0BC0]();
}

uint64_t sub_24962BE10()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_24962BE20()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_24962BE30()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_24962BE40()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_24962BE50()
{
  return MEMORY[0x270EF16A0]();
}

uint64_t sub_24962BE60()
{
  return MEMORY[0x270EF16C0]();
}

uint64_t sub_24962BE70()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_24962BE80()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_24962BE90()
{
  return MEMORY[0x270F12FB8]();
}

uint64_t sub_24962BEA0()
{
  return MEMORY[0x270F12FD0]();
}

uint64_t sub_24962BEB0()
{
  return MEMORY[0x270FA1678]();
}

uint64_t sub_24962BEC0()
{
  return MEMORY[0x270FA1760]();
}

uint64_t sub_24962BED0()
{
  return MEMORY[0x270FA17F8]();
}

uint64_t sub_24962BEE0()
{
  return MEMORY[0x270FA1940]();
}

uint64_t sub_24962BEF0()
{
  return MEMORY[0x270F7CAF8]();
}

uint64_t sub_24962BF00()
{
  return MEMORY[0x270F7CB00]();
}

uint64_t sub_24962BF10()
{
  return MEMORY[0x270F7CB08]();
}

uint64_t sub_24962BF20()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24962BF30()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24962BF40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24962BF50()
{
  return MEMORY[0x270FA0A08]();
}

uint64_t sub_24962BF60()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_24962BF70()
{
  return MEMORY[0x270F11078]();
}

uint64_t sub_24962BF80()
{
  return MEMORY[0x270F11088]();
}

uint64_t sub_24962BF90()
{
  return MEMORY[0x270F11098]();
}

uint64_t sub_24962BFA0()
{
  return MEMORY[0x270F11300]();
}

uint64_t sub_24962BFB0()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_24962BFC0()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_24962BFD0()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_24962BFE0()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_24962BFF0()
{
  return MEMORY[0x270EEAAC8]();
}

uint64_t sub_24962C000()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_24962C010()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_24962C020()
{
  return MEMORY[0x270EEAD48]();
}

uint64_t sub_24962C030()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_24962C040()
{
  return MEMORY[0x270EEB0B0]();
}

uint64_t sub_24962C050()
{
  return MEMORY[0x270EEB0D8]();
}

uint64_t sub_24962C060()
{
  return MEMORY[0x270EEB0F0]();
}

uint64_t sub_24962C070()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_24962C080()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t sub_24962C090()
{
  return MEMORY[0x270FA2B48]();
}

uint64_t sub_24962C0A0()
{
  return MEMORY[0x270FA2B50]();
}

uint64_t sub_24962C0B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24962C0C0()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_24962C0D0()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_24962C0E0()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_24962C0F0()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_24962C100()
{
  return MEMORY[0x270EF1A08]();
}

uint64_t sub_24962C110()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_24962C120()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_24962C130()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_24962C140()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24962C150()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24962C160()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24962C170()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24962C180()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24962C190()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24962C1A0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_24962C1B0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24962C1C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24962C1D0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24962C1E0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24962C200()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24962C210()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24962C220()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24962C230()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24962C240()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_24962C250()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24962C260()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24962C270()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24962C280()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24962C290()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24962C2A0()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_24962C2B0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24962C2C0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24962C2D0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24962C2E0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24962C2F0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24962C300()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24962C310()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_24962C320()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_24962C330()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24962C340()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24962C350()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24962C360()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_24962C370()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_24962C380()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_24962C390()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_24962C3B0()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_24962C3C0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24962C3E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24962C3F0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24962C400()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24962C410()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24962C420()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_24962C430()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_24962C440()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_24962C450()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24962C460()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_24962C470()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_24962C480()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_24962C490()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24962C4A0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24962C4B0()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_24962C4C0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24962C4D0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24962C4E0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24962C4F0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24962C500()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24962C510()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24962C520()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24962C530()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24962C540()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24962C550()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24962C560()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24962C570()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24962C580()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24962C590()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24962C5A0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24962C5B0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24962C5C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24962C5D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24962C5E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24962C5F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24962C600()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24962C610()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24962C630()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24962C640()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24962C650()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24962C660()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24962C670()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24962C680()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24962C690()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24962C6A0()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_24962C6B0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24962C6C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24962C6E0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24962C6F0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24962C700()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24962C720()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24962C730()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24962C740()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24962C750()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24962C760()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24962C770()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24962C780()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24962C790()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24962C7A0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24962C7B0()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t sub_24962C7C0()
{
  return MEMORY[0x270F9FFA8]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}