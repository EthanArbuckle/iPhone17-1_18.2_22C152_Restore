uint64_t static CredentialSession.isEligible.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = sub_2451BECB0();
  v0[23] = v1;
  v0[24] = *(void *)(v1 - 8);
  v0[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24519DDE8, 0, 0);
}

uint64_t sub_24519DDE8()
{
  uint64_t v2 = v0[24];
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[23];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F65F90], v3);
  char v4 = sub_2451BECC0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    if (qword_268ECB5C8 != -1) {
      swift_once();
    }
    v0[26] = qword_268ECC6C8;
    return MEMORY[0x270FA2498](sub_24519DF64, 0, 0);
  }
  else
  {
    sub_24519E3CC();
    swift_allocError();
    unsigned char *v5 = 15;
    swift_willThrow();
    swift_task_dealloc();
    v6 = (uint64_t (*)(void))v0[1];
    return v6(0);
  }
}

uint64_t sub_24519DF64()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0;
  uint64_t v3 = v0 + 2;
  v1[2] = v2;
  v1[7] = v1 + 28;
  v1[3] = sub_24519E178;
  uint64_t v4 = swift_continuation_init();
  sub_2451BD558();
  v6 = v5;
  v7 = (void **)(v1 + 22);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  v1[14] = sub_24519E700;
  v1[15] = v8;
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 1107296256;
  v1[12] = sub_24519E644;
  v1[13] = &unk_26F9E9848;
  v9 = _Block_copy(v1 + 10);
  swift_release();
  id v10 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);

  sub_2451BEFA0();
  swift_unknownObjectRelease();
  sub_24519E6AC(&qword_268ECB5F0);
  if ((swift_dynamicCast() & 1) == 0) {
    *v7 = 0;
  }
  sub_24519E420(v7, v4);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA23F0](v3);
}

uint64_t sub_24519E178()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 216) = v3;
  if (v3)
  {
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_24519E2D0, 0, 0);
  }
  else
  {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 224);
    swift_task_dealloc();
    v5 = *(uint64_t (**)(uint64_t))(v2 + 8);
    return v5(v4);
  }
}

uint64_t sub_24519E2D0()
{
  uint64_t v1 = *(void **)(v0 + 216);
  *(void *)(v0 + 160) = v1;
  id v2 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  if (swift_dynamicCast() && *(void *)(v0 + 168) == 27)
  {

    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {

    swift_willThrow();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v3(0);
}

unint64_t sub_24519E3CC()
{
  unint64_t result = qword_268ECB5E0;
  if (!qword_268ECB5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB5E0);
  }
  return result;
}

uint64_t sub_24519E420(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_24519E7BC;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BB048;
    v10[3] = &unk_26F9E9898;
    uint64_t v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_computeEligibilityWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 12;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_24519E588(void *a1, uint64_t a2)
{
  if (a1)
  {
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v3 = a1;
    id v4 = a1;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(unsigned char **)(*(void *)(a2 + 64) + 40) = 1;
    return swift_continuation_throwingResume();
  }
}

void sub_24519E644(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24519E6AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24519E6F0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24519E700(void *a1)
{
  return sub_24519E738(a1);
}

uint64_t sub_24519E71C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24519E72C()
{
  return swift_release();
}

uint64_t sub_24519E738(void *a1)
{
  sub_24519E6AC(&qword_268ECB5E8);
  swift_allocError();
  *uint64_t v2 = a1;
  id v3 = a1;

  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_24519E7AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24519E7BC(void *a1)
{
  return sub_24519E588(a1, *(void *)(v1 + 16));
}

uint64_t CredentialSession.enterWiredMode(using:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24519E7EC, v1, 0);
}

uint64_t sub_24519E7EC()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  id v4 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECB670 + dword_268ECB670);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24519E8C0;
  return v4((uint64_t)v4, (int *)&unk_268ECB668);
}

uint64_t sub_24519E8C0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    id v4 = sub_24519E9E4;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 24);
    swift_task_dealloc();
    id v4 = sub_2451A1568;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24519E9E4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24519EA48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 152) = a2;
  *(void *)(v3 + 160) = a3;
  return MEMORY[0x270FA2498](sub_24519EA64, a2, 0);
}

uint64_t sub_24519EA64()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[19] + 112;
  swift_beginAccess();
  sub_2451A12D0(v2, (uint64_t)(v0 + 10));
  uint64_t v3 = swift_task_alloc();
  v0[21] = v3;
  *(void *)(v3 + 16) = v1;
  return MEMORY[0x270FA2498](sub_24519EB08, 0, 0);
}

uint64_t sub_24519EB08()
{
  uint64_t v1 = *(void *)(v0 + 168);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_24519EBC4;
  uint64_t v2 = swift_continuation_init();
  sub_2451AD574(v2, (void **)(v0 + 80), (void (*)(void *, uint64_t))sub_2451A151C, v1);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24519EBC4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v3;
  if (v3)
  {
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_24519ED20, 0, 0);
  }
  else
  {
    sub_2451A133C(v1 + 80);
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_24519ED20()
{
  uint64_t v1 = *(void *)(v0 + 152);
  sub_2451A133C(v0 + 80);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24519ED98, v1, 0);
}

uint64_t sub_24519ED98()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24519EDB0()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24519EE5C;
  *(_OWORD *)(v2 + 152) = v3;
  return MEMORY[0x270FA2498](sub_24519EA64, v3, 0);
}

uint64_t sub_24519EE5C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_24519EF50(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    uint64_t v4 = (void *)sub_2451BEC40();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a2;
    v10[4] = sub_2451A1538;
    v10[5] = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BB048;
    v10[3] = &unk_26F9E9A78;
    uint64_t v6 = _Block_copy(v10);
    swift_release();
    objc_msgSend(v3, sel_setCredentialInWiredModeWith_reply_, v4, v6);
    _Block_release(v6);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_24519F0C8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 40) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24519F1A4;
  return v6(a1);
}

uint64_t sub_24519F1A4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2451A1534, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24519F2D8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 40) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24519F3B4;
  return v6(a1);
}

uint64_t sub_24519F3B4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24519F4E8, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24519F4E8()
{
  v20 = v0;
  uint64_t v1 = (void *)v0[6];
  v0[2] = v1;
  uint64_t v2 = (id *)(v0 + 2);
  id v3 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  int v4 = swift_dynamicCast();
  uint64_t v5 = (void *)v0[6];
  if (v4)
  {

    uint64_t v6 = v0[3];
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2451BECA0();
    sub_2451A1298(v7, (uint64_t)qword_268ECC6A0);
    uint64_t v8 = sub_2451BEC80();
    os_log_type_t v9 = sub_2451BEF30();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v19 = v11;
      *(_DWORD *)id v10 = 136315138;
      uint64_t v12 = sub_2451BED10();
      v0[4] = sub_2451B6A18(v12, v13, &v19);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24519C000, v8, v9, "Throwing public error for internal error with description %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v11, -1, -1);
      MEMORY[0x245699AC0](v10, -1, -1);
    }

    sub_24519E3CC();
    swift_allocError();
    sub_2451B0E10(v6, v14);
    swift_willThrow();
    id v15 = *v2;
  }
  else
  {

    sub_24519E3CC();
    swift_allocError();
    unsigned char *v16 = 21;
    swift_willThrow();
    id v15 = v5;
  }

  v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t CredentialSession.transceive(_:)(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return MEMORY[0x270FA2498](sub_24519F790, v2, 0);
}

uint64_t sub_24519F790()
{
  unint64_t v1 = v0[5];
  uint64_t v2 = v0[4];
  swift_retain();
  sub_24519F9C4(v2, v1);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268ECBAD8 + dword_268ECBAD8);
  id v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *id v3 = v0;
  v3[1] = sub_24519F864;
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v6 = v0[4];
  return v8((uint64_t)(v0 + 2), v4, v6, v5);
}

uint64_t sub_24519F864()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_24519F9AC;
  }
  else {
    uint64_t v4 = sub_24519F990;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24519F990()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24519F9AC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24519F9C4(uint64_t a1, unint64_t a2)
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

void sub_24519FA1C(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    uint64_t v4 = (void *)sub_2451BEC10();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a2;
    v10[4] = sub_2451A14A8;
    v10[5] = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_24519FC78;
    v10[3] = &unk_26F9E9A28;
    uint64_t v6 = _Block_copy(v10);
    swift_release();
    objc_msgSend(v3, sel_transceive_reply_, v4, v6);
    _Block_release(v6);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_24519FBA0(uint64_t result, unint64_t a2, void *a3, uint64_t a4)
{
  if (a3)
  {
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = result;
    sub_24519F9C4(result, a2);
    id v10 = *(uint64_t **)(*(void *)(a4 + 64) + 40);
    *id v10 = v9;
    v10[1] = a2;
    return swift_continuation_throwingResume();
  }
  return result;
}

uint64_t sub_24519FC78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_2451BEC20();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_2451A14B0((uint64_t)v4, v8);

  return swift_release();
}

uint64_t CredentialSession.endWiredMode()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24519FD44, v0, 0);
}

uint64_t sub_24519FD44()
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268ECBAD0 + dword_268ECBAD0);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24519FDF4;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4((uint64_t)v4, v2);
}

uint64_t sub_24519FDF4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 32) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v0) {
    uint64_t v4 = sub_24519FF38;
  }
  else {
    uint64_t v4 = sub_24519FF20;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24519FF20()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24519FF38()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24519FF50(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 256) = a2;
  return MEMORY[0x270FA2498](sub_24519FF6C, a2, 0);
}

uint64_t sub_24519FF6C()
{
  uint64_t v1 = *(void *)(v0 + 256) + 112;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  return MEMORY[0x270FA2498](sub_24519FFF8, 0, 0);
}

uint64_t sub_24519FFF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_2451A0240;
  uint64_t v3 = swift_continuation_init();
  uint64_t v4 = *(void **)(v1 + 80);
  if (v4)
  {
    uint64_t v5 = (void **)(v1 + 248);
    sub_2451A12D0(v1 + 80, v1 + 176);
    uint64_t v6 = swift_allocObject();
    long long v7 = *(_OWORD *)(v1 + 192);
    *(_OWORD *)(v6 + 16) = *(_OWORD *)(v1 + 176);
    *(_OWORD *)(v6 + 32) = v7;
    *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 208);
    *(void *)(v6 + 64) = v3;
    *(void *)(v1 + 160) = sub_2451A147C;
    *(void *)(v1 + 168) = v6;
    *(void *)(v1 + 128) = MEMORY[0x263EF8330];
    *(void *)(v1 + 136) = 1107296256;
    *(void *)(v1 + 144) = sub_24519E644;
    *(void *)(v1 + 152) = &unk_26F9E9988;
    unint64_t v8 = _Block_copy((const void *)(v1 + 128));
    swift_unknownObjectRetain();
    swift_release();
    id v9 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB6B8);
    if ((swift_dynamicCast() & 1) == 0) {
      void *v5 = 0;
    }
    sub_2451A0414(v5, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v12 = v10;
    swift_continuation_throwingResumeWithError();
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2451A0240()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 264) = v3;
  if (v3)
  {
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_2451A0390, 0, 0);
  }
  else
  {
    sub_2451A133C(v1 + 80);
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_2451A0390()
{
  uint64_t v1 = *(void *)(v0 + 256);
  sub_2451A133C(v0 + 80);
  return MEMORY[0x270FA2498](sub_2451A03FC, v1, 0);
}

uint64_t sub_2451A03FC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2451A0414(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_2451A1538;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BB048;
    v10[3] = &unk_26F9E99D8;
    uint64_t v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_endWiredModeWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *unint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t CredentialSession.performCardEmulationTransactionWithCurrentCredential(scene:options:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2451A05A0, v2, 0);
}

uint64_t sub_2451A05A0()
{
  uint64_t v3 = (uint64_t (*)(void))((char *)&dword_268ECBAC8 + dword_268ECBAC8);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2451A0660;
  return v3();
}

uint64_t sub_2451A0660()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v4 = sub_2451A078C;
  }
  else {
    uint64_t v4 = sub_24519FF20;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2451A078C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2451A07A4(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    uint64_t v4 = (void *)sub_2451BEE40();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a2;
    v10[4] = sub_2451A13C8;
    v10[5] = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BB048;
    v10[3] = &unk_26F9E9938;
    uint64_t v6 = _Block_copy(v10);
    swift_release();
    objc_msgSend(v3, sel_armCurrentCredentialForCardEmulationWithSceneIdentifier_reply_, v4, v6);
    _Block_release(v6);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *unint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    swift_continuation_throwingResumeWithError();
  }
}

uint64_t CredentialSession.performTransactionInWiredMode(_:scene:instanceAID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_2451A0950, v5, 0);
}

uint64_t sub_2451A0950()
{
  uint64_t v1 = *(void *)(v0 + 56);
  long long v8 = *(_OWORD *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v4;
  *(_OWORD *)(v5 + 32) = v8;
  *(void *)(v5 + 48) = v3;
  *(void *)(v5 + 56) = v2;
  id v9 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECB670 + dword_268ECB670);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v6;
  void *v6 = v0;
  v6[1] = sub_2451A0A4C;
  return v9((uint64_t)v9, (int *)&unk_268ECB6A0);
}

uint64_t sub_2451A0A4C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 56);
    uint64_t v4 = sub_2451A0B70;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 56);
    swift_task_dealloc();
    uint64_t v4 = sub_24519FF20;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2451A0B70()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451A0BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  v7[19] = a2;
  v7[20] = a3;
  return MEMORY[0x270FA2498](sub_2451A0BF8, a2, 0);
}

uint64_t sub_2451A0BF8()
{
  uint64_t v1 = *(void *)(v0 + 192);
  long long v5 = *(_OWORD *)(v0 + 160);
  long long v6 = *(_OWORD *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 152) + 112;
  swift_beginAccess();
  sub_2451A12D0(v2, v0 + 80);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 200) = v3;
  *(_OWORD *)(v3 + 16) = v5;
  *(_OWORD *)(v3 + 32) = v6;
  *(void *)(v3 + 48) = v1;
  return MEMORY[0x270FA2498](sub_2451A0CB8, 0, 0);
}

uint64_t sub_2451A0CB8()
{
  uint64_t v1 = *(void *)(v0 + 200);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_2451A0D74;
  uint64_t v2 = swift_continuation_init();
  sub_2451AD574(v2, (void **)(v0 + 80), (void (*)(void *, uint64_t))sub_2451A132C, v1);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2451A0D74()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 208) = v3;
  if (v3)
  {
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_2451A0ED0, 0, 0);
  }
  else
  {
    sub_2451A133C(v1 + 80);
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_2451A0ED0()
{
  uint64_t v1 = *(void *)(v0 + 152);
  sub_2451A133C(v0 + 80);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451A0F48, v1, 0);
}

uint64_t sub_2451A0F48()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2451A0F60()
{
  long long v7 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_2451A153C;
  *(void *)(v4 + 184) = v2;
  *(void *)(v4 + 192) = v3;
  *(_OWORD *)(v4 + 168) = v7;
  *(_OWORD *)(v4 + 152) = v5;
  return MEMORY[0x270FA2498](sub_2451A0BF8, v5, 0);
}

void sub_2451A102C(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    uint64_t v4 = (void *)sub_2451BEC40();
    long long v5 = (void *)sub_2451BEC10();
    uint64_t v6 = (void *)sub_2451BEE40();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a2;
    v12[4] = sub_2451A1538;
    v12[5] = v7;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 1107296256;
    v12[2] = sub_2451BB048;
    v12[3] = &unk_26F9E98E8;
    uint64_t v8 = _Block_copy(v12);
    swift_release();
    objc_msgSend(v3, sel_authorizeCredentialInWiredModeWith_instanceAID_sceneIdentifier_reply_, v4, v5, v6, v8);
    _Block_release(v8);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v9 = swift_allocError();
    *uint64_t v10 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v11 = v9;
    swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451A11FC(void *a1)
{
  if (a1)
  {
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v2 = a1;
    id v3 = a1;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2451A1298(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2451A12D0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_2451A132C(void **a1, uint64_t a2)
{
}

uint64_t sub_2451A133C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2451A1390()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451A13A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2451A13B0()
{
  return swift_release();
}

uint64_t sub_2451A13B8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451A13C8(void *a1)
{
  return sub_2451A11FC(a1);
}

uint64_t sub_2451A13E4()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 48)) {
    sub_2451A142C(v0 + 24);
  }

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2451A142C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2451A147C(void *a1)
{
  return sub_2451A858C(a1, v1 + 16, *(void *)(v1 + 64));
}

uint64_t sub_2451A1488()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451A1498()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451A14A8(uint64_t a1, unint64_t a2, void *a3)
{
  return sub_24519FBA0(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_2451A14B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2451A14C4(a1, a2);
  }
  return a1;
}

uint64_t sub_2451A14C4(uint64_t a1, unint64_t a2)
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

void sub_2451A151C(void **a1, uint64_t a2)
{
}

uint64_t sub_2451A1524()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t CredentialSession.performTransaction(using:scene:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_2451A1594, v3, 0);
}

uint64_t sub_2451A1594()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  long long v6 = *(_OWORD *)(v0 + 16);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v6;
  *(void *)(v3 + 40) = v2;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECB670 + dword_268ECB670);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2451A1680;
  return v7((uint64_t)v7, (int *)&unk_268ECB6D0);
}

uint64_t sub_2451A1680()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = sub_2451A17A4;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 40);
    swift_task_dealloc();
    uint64_t v4 = sub_24519FF20;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2451A17A4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451A1808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[21] = a4;
  v5[22] = a5;
  v5[19] = a2;
  v5[20] = a3;
  return MEMORY[0x270FA2498](sub_2451A1828, a2, 0);
}

uint64_t sub_2451A1828()
{
  uint64_t v1 = *(void *)(v0 + 176);
  long long v5 = *(_OWORD *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 152) + 112;
  swift_beginAccess();
  sub_2451A12D0(v2, v0 + 80);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 184) = v3;
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v1;
  return MEMORY[0x270FA2498](sub_2451A18E0, 0, 0);
}

uint64_t sub_2451A18E0()
{
  uint64_t v1 = *(void *)(v0 + 184);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_2451A199C;
  uint64_t v2 = swift_continuation_init();
  sub_2451AD574(v2, (void **)(v0 + 80), (void (*)(void *, uint64_t))sub_2451A2390, v1);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2451A199C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 192) = v3;
  if (v3)
  {
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_2451A1AF8, 0, 0);
  }
  else
  {
    sub_2451A133C(v1 + 80);
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_2451A1AF8()
{
  uint64_t v1 = *(void *)(v0 + 152);
  sub_2451A133C(v0 + 80);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451A1B70, v1, 0);
}

uint64_t sub_2451A1B70()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2451A1B88()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_24519EE5C;
  *(void *)(v4 + 168) = v2;
  *(void *)(v4 + 176) = v3;
  *(_OWORD *)(v4 + 152) = v5;
  return MEMORY[0x270FA2498](sub_2451A1828, v5, 0);
}

void sub_2451A1C44(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    uint64_t v4 = (void *)sub_2451BEC40();
    long long v5 = (void *)sub_2451BEE40();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a2;
    v11[4] = sub_2451A13C8;
    v11[5] = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_2451BB048;
    v11[3] = &unk_26F9E9B88;
    uint64_t v7 = _Block_copy(v11);
    swift_release();
    objc_msgSend(v3, sel_armCredentialForCardEmulation_sceneIdentifier_reply_, v4, v5, v7);
    _Block_release(v7);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v8 = swift_allocError();
    unsigned char *v9 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v10 = v8;
    swift_continuation_throwingResumeWithError();
  }
}

uint64_t CredentialSession.endCardEmulationInternal()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2451A1E08, v0, 0);
}

uint64_t sub_2451A1E08()
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268ECBAC0 + dword_268ECBAC0);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24519FDF4;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4((uint64_t)v4, v2);
}

ValueMetadata *type metadata accessor for CredentialSession.CardEmulationOptions()
{
  return &type metadata for CredentialSession.CardEmulationOptions;
}

uint64_t sub_2451A1EC8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 256) = a2;
  return MEMORY[0x270FA2498](sub_2451A1EE4, a2, 0);
}

uint64_t sub_2451A1EE4()
{
  uint64_t v1 = *(void *)(v0 + 256) + 112;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  return MEMORY[0x270FA2498](sub_2451A1F70, 0, 0);
}

uint64_t sub_2451A1F70()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_2451A0240;
  uint64_t v3 = swift_continuation_init();
  uint64_t v4 = *(void **)(v1 + 80);
  if (v4)
  {
    uint64_t v5 = (void **)(v1 + 248);
    sub_2451A12D0(v1 + 80, v1 + 176);
    uint64_t v6 = swift_allocObject();
    long long v7 = *(_OWORD *)(v1 + 192);
    *(_OWORD *)(v6 + 16) = *(_OWORD *)(v1 + 176);
    *(_OWORD *)(v6 + 32) = v7;
    *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 208);
    *(void *)(v6 + 64) = v3;
    *(void *)(v1 + 160) = sub_2451A147C;
    *(void *)(v1 + 168) = v6;
    *(void *)(v1 + 128) = MEMORY[0x263EF8330];
    *(void *)(v1 + 136) = 1107296256;
    *(void *)(v1 + 144) = sub_24519E644;
    *(void *)(v1 + 152) = &unk_26F9E9AE8;
    uint64_t v8 = _Block_copy((const void *)(v1 + 128));
    swift_unknownObjectRetain();
    swift_release();
    id v9 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB6B8);
    if ((swift_dynamicCast() & 1) == 0) {
      void *v5 = 0;
    }
    sub_2451A21B8(v5, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v12 = v10;
    swift_continuation_throwingResumeWithError();
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2451A21B8(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_2451A1538;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BB048;
    v10[3] = &unk_26F9E9B38;
    uint64_t v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_endCardEmulationWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451A2320()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 48)) {
    sub_2451A142C(v0 + 24);
  }

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2451A2368(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2451A2378()
{
  return swift_release();
}

uint64_t sub_2451A2380()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2451A2390(void **a1, uint64_t a2)
{
}

uint64_t sub_2451A239C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

ValueMetadata *type metadata accessor for SECSessionState()
{
  return &type metadata for SECSessionState;
}

uint64_t sub_2451A23CC()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26F9ED7A0);
  sub_2451A2A50(0, &qword_268ECB6F0);
  sub_24519E6AC(&qword_268ECB6F8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2451BF750;
  uint64_t v1 = sub_2451BED90();
  *(void *)(v0 + 56) = sub_24519E6AC(&qword_268ECB700);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_2451BEE00();
  *(void *)(v0 + 88) = sub_24519E6AC(&qword_268ECB708);
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = sub_2451BEE20();
  *(void *)(v0 + 120) = sub_24519E6AC(&qword_268ECB710);
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_2451A2A50(0, &qword_268ECB718);
  *(void *)(v0 + 152) = sub_24519E6AC(&qword_268ECB720);
  *(void *)(v0 + 128) = v4;
  uint64_t v5 = sub_2451A2A50(0, &qword_268ECB728);
  *(void *)(v0 + 184) = sub_24519E6AC(&qword_268ECB730);
  *(void *)(v0 + 160) = v5;
  uint64_t v6 = sub_2451A2A50(0, &qword_268ECB738);
  *(void *)(v0 + 216) = sub_24519E6AC(&qword_268ECB740);
  *(void *)(v0 + 192) = v6;
  uint64_t v7 = sub_2451A2A50(0, &qword_268ECB748);
  *(void *)(v0 + 248) = sub_24519E6AC(&qword_268ECB750);
  *(void *)(v0 + 224) = v7;
  MEMORY[0x245699470](v0);
  uint64_t result = sub_2451BEF00();
  __break(1u);
  return result;
}

uint64_t sub_2451A2694()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26F9ED1B8);
  sub_2451A2A50(0, &qword_268ECB6F0);
  sub_24519E6AC(&qword_268ECB6F8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2451BF750;
  uint64_t v1 = sub_2451BED90();
  *(void *)(v0 + 56) = sub_24519E6AC(&qword_268ECB700);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_2451BEE00();
  *(void *)(v0 + 88) = sub_24519E6AC(&qword_268ECB708);
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = sub_2451BEE20();
  *(void *)(v0 + 120) = sub_24519E6AC(&qword_268ECB710);
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_2451A2A50(0, &qword_268ECB718);
  *(void *)(v0 + 152) = sub_24519E6AC(&qword_268ECB720);
  *(void *)(v0 + 128) = v4;
  uint64_t v5 = sub_2451A2A50(0, &qword_268ECB728);
  *(void *)(v0 + 184) = sub_24519E6AC(&qword_268ECB730);
  *(void *)(v0 + 160) = v5;
  uint64_t v6 = sub_2451A2A50(0, &qword_268ECB738);
  *(void *)(v0 + 216) = sub_24519E6AC(&qword_268ECB740);
  *(void *)(v0 + 192) = v6;
  uint64_t v7 = sub_2451A2A50(0, &qword_268ECB748);
  *(void *)(v0 + 248) = sub_24519E6AC(&qword_268ECB750);
  *(void *)(v0 + 224) = v7;
  MEMORY[0x245699470](v0);
  uint64_t result = sub_2451BEF00();
  __break(1u);
  return result;
}

BOOL sub_2451A28DC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2451A28F0()
{
  return sub_2451BF0C0();
}

uint64_t sub_2451A2938()
{
  return sub_2451BF0B0();
}

uint64_t sub_2451A2964()
{
  return sub_2451BF0C0();
}

unint64_t sub_2451A29A8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2451A2A40(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2451A29DC(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_2451A29EC()
{
  unint64_t result = qword_268ECB6E8;
  if (!qword_268ECB6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB6E8);
  }
  return result;
}

unint64_t sub_2451A2A40(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

uint64_t sub_2451A2A50(uint64_t a1, unint64_t *a2)
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

ValueMetadata *type metadata accessor for SECPresentmentIntentAssertionState()
{
  return &type metadata for SECPresentmentIntentAssertionState;
}

void *sub_2451A2A9C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

unint64_t sub_2451A2AD0()
{
  unint64_t result = qword_268ECB758;
  if (!qword_268ECB758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB758);
  }
  return result;
}

uint64_t CredentialSession.Credential.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2451BEC70();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t CredentialSession.Credential.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CredentialSession.Credential() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for CredentialSession.Credential()
{
  uint64_t result = qword_268ECB770;
  if (!qword_268ECB770) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t CredentialSession.Credential.state.getter@<X0>(unint64_t *a1@<X8>)
{
  unint64_t v3 = *(void *)(v1 + *(int *)(type metadata accessor for CredentialSession.Credential() + 24));
  *a1 = v3;

  return sub_2451A2C5C(v3);
}

unint64_t sub_2451A2C5C(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2451A2C6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v78 = a2;
  uint64_t v3 = sub_2451BEC70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2451BED00();
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)type metadata accessor for CredentialSession.Credential();
  uint64_t v11 = *((void *)v10 - 1);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2451BED30();
  v76 = (int *)&v13[v10[10]];
  sub_2451BED20();
  uint64_t v14 = sub_2451BED50();
  id v15 = (uint64_t *)&v13[v10[5]];
  *id v15 = v14;
  v15[1] = v16;
  sub_2451BED80();
  sub_2451A339C(v9, &v81);
  v79 = v13;
  if (v81 != 2)
  {
    v75 = a1;
    v76 = v10;
    *(void *)&v13[v10[6]] = v81;
    unint64_t v34 = sub_2451BED70();
    unint64_t v35 = v34;
    if (v34 >> 62) {
      uint64_t v36 = sub_2451BF000();
    }
    else {
      uint64_t v36 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v37 = MEMORY[0x263F8EE78];
    uint64_t v77 = v11;
    if (v36)
    {
      uint64_t v81 = MEMORY[0x263F8EE78];
      sub_2451B71A4(0, v36 & ~(v36 >> 63), 0);
      if (v36 < 0)
      {
        __break(1u);
        goto LABEL_41;
      }
      uint64_t v38 = 0;
      uint64_t v39 = v81;
      do
      {
        if ((v35 & 0xC000000000000001) != 0) {
          id v40 = (id)MEMORY[0x2456994D0](v38, v35);
        }
        else {
          id v40 = *(id *)(v35 + 8 * v38 + 32);
        }
        v41 = v40;
        uint64_t v42 = sub_2451BEE10();
        uint64_t v44 = v43;

        uint64_t v81 = v39;
        unint64_t v46 = *(void *)(v39 + 16);
        unint64_t v45 = *(void *)(v39 + 24);
        if (v46 >= v45 >> 1)
        {
          sub_2451B71A4(v45 > 1, v46 + 1, 1);
          uint64_t v39 = v81;
        }
        ++v38;
        *(void *)(v39 + 16) = v46 + 1;
        uint64_t v47 = v39 + 16 * v46;
        *(void *)(v47 + 32) = v42;
        *(void *)(v47 + 40) = v44;
      }
      while (v36 != v38);
      swift_bridgeObjectRelease();
      uint64_t v11 = v77;
      uint64_t v37 = MEMORY[0x263F8EE78];
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v39 = MEMORY[0x263F8EE78];
    }
    *(void *)&v79[v76[7]] = v39;
    unint64_t v50 = sub_2451BED60();
    unint64_t v51 = v50;
    if (v50 >> 62)
    {
      uint64_t v52 = sub_2451BF000();
      if (v52)
      {
LABEL_23:
        uint64_t v81 = v37;
        sub_2451B71A4(0, v52 & ~(v52 >> 63), 0);
        if ((v52 & 0x8000000000000000) == 0)
        {
          uint64_t v53 = 0;
          uint64_t v54 = v81;
          do
          {
            if ((v51 & 0xC000000000000001) != 0) {
              id v55 = (id)MEMORY[0x2456994D0](v53, v51);
            }
            else {
              id v55 = *(id *)(v51 + 8 * v53 + 32);
            }
            v56 = v55;
            uint64_t v57 = sub_2451BEE10();
            uint64_t v59 = v58;

            uint64_t v81 = v54;
            unint64_t v61 = *(void *)(v54 + 16);
            unint64_t v60 = *(void *)(v54 + 24);
            if (v61 >= v60 >> 1)
            {
              sub_2451B71A4(v60 > 1, v61 + 1, 1);
              uint64_t v54 = v81;
            }
            ++v53;
            *(void *)(v54 + 16) = v61 + 1;
            uint64_t v62 = v54 + 16 * v61;
            *(void *)(v62 + 32) = v57;
            *(void *)(v62 + 40) = v59;
          }
          while (v52 != v53);
          swift_bridgeObjectRelease();
          uint64_t v11 = v77;
          goto LABEL_35;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v52 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v52) {
        goto LABEL_23;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v54 = MEMORY[0x263F8EE78];
LABEL_35:
    v63 = v75;
    v64 = v76;
    uint64_t v65 = (uint64_t)v79;
    *(void *)&v79[v76[8]] = v54;
    uint64_t v66 = v65;
    uint64_t v67 = sub_2451BED40();
    if (!v67)
    {
      char v68 = 1;
LABEL_39:

      *(unsigned char *)(v66 + v64[9]) = v68;
      uint64_t v69 = v78;
      sub_2451A7604(v66, v78);
      (*(void (**)(uint64_t, void, uint64_t, int *))(v11 + 56))(v69, 0, 1, v64);
      return sub_2451A7668(v66);
    }
    if (v67 == 1)
    {
      char v68 = 0;
      goto LABEL_39;
    }
LABEL_42:
    uint64_t result = sub_2451BEFF0();
    __break(1u);
    return result;
  }
  v75 = (void *)v3;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_2451BECA0();
  sub_2451A1298(v17, (uint64_t)qword_268ECC6A0);
  id v18 = a1;
  uint64_t v19 = sub_2451BEC80();
  os_log_type_t v20 = sub_2451BEF50();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    os_log_t v74 = v19;
    uint64_t v22 = swift_slowAlloc();
    int v72 = v21;
    v23 = (uint8_t *)v22;
    uint64_t v73 = swift_slowAlloc();
    uint64_t v81 = v73;
    *(_DWORD *)v23 = 136315138;
    v70 = v23 + 4;
    v71 = v23;
    sub_2451BED30();
    uint64_t v24 = sub_2451BEC30();
    uint64_t v77 = v11;
    v25 = v10;
    unint64_t v27 = v26;
    v28 = *(void (**)(char *, void *))(v4 + 8);
    v29 = v6;
    v30 = v75;
    v28(v29, v75);
    uint64_t v80 = sub_2451B6A18(v24, v27, &v81);
    sub_2451BEF80();

    uint64_t v10 = v25;
    uint64_t v11 = v77;
    swift_bridgeObjectRelease();
    os_log_t v31 = v74;
    v32 = v71;
    _os_log_impl(&dword_24519C000, v74, (os_log_type_t)v72, "Credential %s hidden from public due to LOCKED state", v71, 0xCu);
    uint64_t v33 = v73;
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v33, -1, -1);
    MEMORY[0x245699AC0](v32, -1, -1);
  }
  else
  {

    v28 = *(void (**)(char *, void *))(v4 + 8);
    v30 = v75;
  }
  v48 = v76;
  v28(v79, v30);
  swift_bridgeObjectRelease();
  v28((char *)v48, v30);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v11 + 56))(v78, 1, 1, v10);
}

uint64_t sub_2451A339C@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_2451BECE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2451BED00();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (uint64_t *)((char *)&v62 - v12);
  id v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v66 = a1;
  uint64_t v16 = a1;
  uint64_t v17 = v14;
  v15((char *)&v62 - v12, (uint64_t)v16, v8);
  int v18 = (*(uint64_t (**)(uint64_t *, uint64_t))(v17 + 88))(v13, v8);
  if (v18 != *MEMORY[0x263F65FA8])
  {
    if (v18 == *MEMORY[0x263F65FA0])
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v66, v8);
      uint64_t v48 = 0;
    }
    else if (v18 == *MEMORY[0x263F65F98])
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v66, v8);
      uint64_t v48 = 1;
    }
    else
    {
      uint64_t v65 = a2;
      if (qword_268ECB5C0 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_2451BECA0();
      sub_2451A1298(v49, (uint64_t)qword_268ECC6A0);
      v15(v11, (uint64_t)v66, v8);
      unint64_t v50 = sub_2451BEC80();
      os_log_type_t v51 = sub_2451BEF20();
      int v52 = v51;
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v53 = (uint8_t *)swift_slowAlloc();
        LODWORD(v73) = v52;
        uint64_t v54 = v53;
        os_log_t v74 = v50;
        *(_DWORD *)uint64_t v53 = 134217984;
        int v72 = v53 + 4;
        sub_2451BECF0();
        uint64_t v55 = sub_2451BECD0();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        v56 = *(void (**)(char *, uint64_t))(v17 + 8);
        v56(v11, v8);
        uint64_t v75 = v55;
        unint64_t v50 = v74;
        sub_2451BEF80();
        _os_log_impl(&dword_24519C000, v50, (os_log_type_t)v73, "Unknown internal credential state %ld", v54, 0xCu);
        MEMORY[0x245699AC0](v54, -1, -1);
      }
      else
      {
        v56 = *(void (**)(char *, uint64_t))(v17 + 8);
        v56(v11, v8);
      }
      a2 = v65;

      v56(v66, v8);
      uint64_t result = ((uint64_t (*)(uint64_t *, uint64_t))v56)(v13, v8);
      uint64_t v48 = 2;
    }
    goto LABEL_34;
  }
  uint64_t v64 = v17;
  uint64_t v65 = a2;
  (*(void (**)(uint64_t *, uint64_t))(v17 + 96))(v13, v8);
  uint64_t v19 = *v13;
  if (!((unint64_t)*v13 >> 62))
  {
    uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v20) {
      goto LABEL_4;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    if (qword_268ECB5C0 == -1)
    {
LABEL_31:
      uint64_t v58 = sub_2451BECA0();
      sub_2451A1298(v58, (uint64_t)qword_268ECC6A0);
      uint64_t v59 = sub_2451BEC80();
      os_log_type_t v60 = sub_2451BEF30();
      if (os_log_type_enabled(v59, v60))
      {
        unint64_t v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v61 = 0;
        _os_log_impl(&dword_24519C000, v59, v60, "Credential in installed state without instance info", v61, 2u);
        MEMORY[0x245699AC0](v61, -1, -1);
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v66, v8);
      uint64_t v48 = 2;
      a2 = v65;
LABEL_34:
      *a2 = v48;
      return result;
    }
LABEL_36:
    swift_once();
    goto LABEL_31;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_2451BF000();
  swift_bridgeObjectRelease();
  if (!v57) {
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_2451BF000();
  swift_bridgeObjectRelease();
  if (!v20)
  {
    uint64_t v63 = v8;
    uint64_t v48 = MEMORY[0x263F8EE78];
LABEL_17:
    a2 = v65;
    (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v63);
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_34;
  }
LABEL_4:
  uint64_t v75 = MEMORY[0x263F8EE78];
  sub_2451B7184(0, v20 & ~(v20 >> 63), 0);
  if (v20 < 0)
  {
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v63 = v8;
  uint64_t v21 = 0;
  uint64_t v22 = v75;
  uint64_t v68 = v19;
  unint64_t v69 = v19 & 0xC000000000000001;
  uint64_t v67 = v20;
  while (1)
  {
    if (v20 == v21)
    {
      __break(1u);
      goto LABEL_27;
    }
    uint64_t v23 = v22;
    id v24 = v69 ? (id)MEMORY[0x2456994D0](v21, v19) : *(id *)(v19 + 8 * v21 + 32);
    v25 = v24;
    uint64_t v26 = sub_2451BEDC0();
    uint64_t v73 = v27;
    os_log_t v74 = v26;
    uint64_t v28 = sub_2451BEDB0();
    int v72 = v29;
    uint64_t v30 = sub_2451BEDF0();
    uint64_t v32 = v31;
    uint64_t v33 = sub_2451BEDE0();
    uint64_t v35 = v34;
    uint64_t result = sub_2451BEDA0();
    if (v37 >> 60 == 15) {
      break;
    }
    uint64_t v38 = result;
    uint64_t v8 = v37;
    uint64_t v39 = sub_2451BEDD0();
    uint64_t v70 = v40;
    uint64_t v71 = v39;

    uint64_t v22 = v23;
    uint64_t v75 = v23;
    unint64_t v41 = *(void *)(v23 + 16);
    unint64_t v42 = *(void *)(v22 + 24);
    unint64_t v43 = v41 + 1;
    if (v41 >= v42 >> 1)
    {
      unint64_t v62 = v41 + 1;
      sub_2451B7184(v42 > 1, v41 + 1, 1);
      unint64_t v43 = v62;
      uint64_t v22 = v75;
    }
    ++v21;
    *(void *)(v22 + 16) = v43;
    uint64_t v44 = (void *)(v22 + 96 * v41);
    uint64_t v45 = v73;
    v44[4] = v74;
    v44[5] = v45;
    unint64_t v46 = v72;
    v44[6] = v28;
    v44[7] = v46;
    v44[8] = v30;
    v44[9] = v32;
    v44[10] = v33;
    v44[11] = v35;
    v44[12] = v38;
    v44[13] = v8;
    uint64_t v47 = v70;
    v44[14] = v71;
    v44[15] = v47;
    uint64_t v20 = v67;
    uint64_t v19 = v68;
    if (v67 == v21)
    {
      uint64_t v48 = v22;
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2451A3A60(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_2451BF030(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_2451BF030() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_2451A3B28(uint64_t a1, uint64_t a2)
{
  __s1[3] = *MEMORY[0x263EF8340];
  uint64_t v148 = *(void *)(a1 + 16);
  if (v148 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v148 && a1 != a2)
  {
    uint64_t v2 = 0;
    v141 = (uint64_t *)(a2 + 64);
    v142 = (uint64_t *)(a1 + 64);
    while (1)
    {
      uint64_t v4 = *(v142 - 4);
      unint64_t v5 = *(v142 - 3);
      uint64_t v7 = *(v142 - 2);
      unint64_t v6 = *(v142 - 1);
      uint64_t v156 = *v142;
      uint64_t v8 = v142[2];
      unint64_t v161 = v142[1];
      unint64_t v159 = v142[3];
      unint64_t v9 = v142[5];
      uint64_t v11 = v142[6];
      unint64_t v10 = v142[7];
      unint64_t v12 = *(v141 - 3);
      uint64_t v149 = *(v141 - 4);
      uint64_t v154 = v142[4];
      uint64_t v155 = *(v141 - 2);
      unint64_t v162 = *(v141 - 1);
      uint64_t v153 = *v141;
      unint64_t v160 = v141[1];
      uint64_t v152 = v141[2];
      unint64_t v158 = v141[3];
      unint64_t v13 = v141[5];
      uint64_t v150 = v141[4];
      v142 += 12;
      uint64_t v14 = v141[6];
      unint64_t v157 = v141[7];
      v141 += 12;
      uint64_t v15 = 0;
      switch(v5 >> 62)
      {
        case 1uLL:
          LODWORD(v15) = HIDWORD(v4) - v4;
          if (__OFSUB__(HIDWORD(v4), v4))
          {
            __break(1u);
LABEL_197:
            __break(1u);
LABEL_198:
            __break(1u);
LABEL_199:
            __break(1u);
LABEL_200:
            __break(1u);
LABEL_201:
            __break(1u);
LABEL_202:
            __break(1u);
LABEL_203:
            __break(1u);
LABEL_204:
            __break(1u);
LABEL_205:
            __break(1u);
LABEL_206:
            __break(1u);
LABEL_207:
            __break(1u);
LABEL_208:
            __break(1u);
LABEL_209:
            __break(1u);
LABEL_210:
            __break(1u);
LABEL_211:
            __break(1u);
LABEL_212:
            __break(1u);
LABEL_213:
            __break(1u);
LABEL_214:
            __break(1u);
LABEL_215:
            __break(1u);
LABEL_216:
            __break(1u);
LABEL_217:
            __break(1u);
LABEL_218:
            __break(1u);
LABEL_219:
            __break(1u);
LABEL_220:
            __break(1u);
LABEL_221:
            __break(1u);
LABEL_222:
            __break(1u);
LABEL_223:
            __break(1u);
LABEL_224:
            __break(1u);
LABEL_225:
            __break(1u);
LABEL_226:
            __break(1u);
LABEL_227:
            __break(1u);
LABEL_228:
            __break(1u);
LABEL_229:
            __break(1u);
LABEL_230:
            __break(1u);
LABEL_231:
            __break(1u);
LABEL_232:
            __break(1u);
LABEL_233:
            __break(1u);
LABEL_234:
            __break(1u);
LABEL_235:
            __break(1u);
LABEL_236:
            __break(1u);
LABEL_237:
            __break(1u);
LABEL_238:
            __break(1u);
LABEL_239:
            __break(1u);
LABEL_240:
            __break(1u);
LABEL_241:
            __break(1u);
LABEL_242:
            __break(1u);
LABEL_243:
            __break(1u);
          }
          uint64_t v15 = (int)v15;
          break;
        case 2uLL:
          uint64_t v17 = *(void *)(v4 + 16);
          uint64_t v16 = *(void *)(v4 + 24);
          BOOL v18 = __OFSUB__(v16, v17);
          uint64_t v15 = v16 - v17;
          if (!v18) {
            break;
          }
          goto LABEL_197;
        case 3uLL:
          break;
        default:
          uint64_t v15 = BYTE6(v5);
          break;
      }
      unint64_t v139 = v5;
      unint64_t v140 = v10;
      uint64_t v143 = v11;
      unint64_t v144 = v9;
      uint64_t v151 = v8;
      unint64_t v146 = v6;
      uint64_t v147 = v7;
      uint64_t v145 = v4;
      unint64_t v138 = v12;
      switch(v12 >> 62)
      {
        case 1uLL:
          LODWORD(v19) = HIDWORD(v149) - v149;
          if (__OFSUB__(HIDWORD(v149), v149)) {
            goto LABEL_198;
          }
          uint64_t v19 = (int)v19;
LABEL_19:
          if (v15 != v19) {
            return 0;
          }
          if (v15 < 1)
          {
LABEL_24:
            uint64_t v32 = v14;
            unint64_t v33 = v12;
            uint64_t v34 = v2;
            uint64_t v35 = v7;
            unint64_t v36 = v6;
            sub_24519F9C4(v4, v5);
            uint64_t v37 = v35;
            uint64_t v2 = v34;
            unint64_t v38 = v33;
            sub_24519F9C4(v37, v36);
            sub_24519F9C4(v156, v161);
            uint64_t v39 = v8;
            uint64_t v28 = v32;
            sub_24519F9C4(v39, v159);
            unint64_t v26 = v9;
            sub_24519F9C4(v154, v9);
            uint64_t v40 = v11;
            unint64_t v41 = v10;
            sub_24519F9C4(v11, v10);
            sub_24519F9C4(v149, v38);
            sub_24519F9C4(v155, v162);
            sub_24519F9C4(v153, v160);
            sub_24519F9C4(v152, v158);
            sub_24519F9C4(v150, v13);
            sub_24519F9C4(v28, v157);
          }
          else
          {
            switch(v5 >> 62)
            {
              case 1uLL:
                uint64_t v42 = (int)v4;
                if (v4 >> 32 < (int)v4) {
                  goto LABEL_220;
                }
                uint64_t v43 = v4;
                unint64_t v44 = v5;
                sub_24519F9C4(v4, v5);
                sub_24519F9C4(v147, v146);
                sub_24519F9C4(v156, v161);
                sub_24519F9C4(v151, v159);
                sub_24519F9C4(v154, v144);
                sub_24519F9C4(v11, v10);
                sub_24519F9C4(v149, v12);
                sub_24519F9C4(v155, v162);
                sub_24519F9C4(v153, v160);
                sub_24519F9C4(v152, v158);
                sub_24519F9C4(v150, v13);
                sub_24519F9C4(v14, v157);
                sub_24519F9C4(v43, v44);
                uint64_t v45 = sub_2451BEBB0();
                uint64_t v135 = v14;
                if (!v45) {
                  goto LABEL_29;
                }
                uint64_t v46 = sub_2451BEBD0();
                if (__OFSUB__(v42, v46)) {
                  goto LABEL_232;
                }
                v45 += v42 - v46;
LABEL_29:
                uint64_t v40 = v11;
                sub_2451BEBC0();
                sub_2451A5914(v45, v149, v12, (char *)__s1);
                sub_2451A14C4(v145, v139);
                unint64_t v29 = v144;
                uint64_t v31 = v151;
                uint64_t v25 = v147;
                uint64_t v28 = v135;
                if ((__s1[0] & 1) == 0) {
                  goto LABEL_193;
                }
                goto LABEL_41;
              case 2uLL:
                uint64_t v47 = v11;
                uint64_t v48 = v7;
                uint64_t v137 = *(void *)(v4 + 16);
                uint64_t v136 = *(void *)(v4 + 24);
                unint64_t v49 = v6;
                sub_24519F9C4(v4, v5);
                sub_24519F9C4(v48, v49);
                sub_24519F9C4(v156, v161);
                sub_24519F9C4(v8, v159);
                sub_24519F9C4(v154, v9);
                sub_24519F9C4(v47, v10);
                sub_24519F9C4(v149, v12);
                sub_24519F9C4(v155, v162);
                sub_24519F9C4(v153, v160);
                sub_24519F9C4(v152, v158);
                sub_24519F9C4(v150, v13);
                sub_24519F9C4(v14, v157);
                swift_retain();
                swift_retain();
                uint64_t v50 = sub_2451BEBB0();
                if (v50)
                {
                  uint64_t v51 = sub_2451BEBD0();
                  uint64_t v52 = v137;
                  if (__OFSUB__(v137, v51)) {
                    goto LABEL_233;
                  }
                  v50 += v137 - v51;
                  uint64_t v25 = v147;
                }
                else
                {
                  uint64_t v25 = v147;
                  uint64_t v52 = v137;
                }
                if (__OFSUB__(v136, v52)) {
                  goto LABEL_221;
                }
                sub_2451BEBC0();
                sub_2451A5914(v50, v149, v138, (char *)__s1);
                swift_release();
                swift_release();
                uint64_t v11 = v143;
                uint64_t v28 = v14;
                unint64_t v29 = v9;
                uint64_t v31 = v151;
                if ((__s1[0] & 1) == 0)
                {
LABEL_193:
                  sub_2451A14C4(v149, v138);
                  sub_2451A14C4(v155, v162);
                  sub_2451A14C4(v153, v160);
                  sub_2451A14C4(v152, v158);
                  sub_2451A14C4(v150, v13);
                  sub_2451A14C4(v28, v157);
                  sub_2451A14C4(v145, v139);
                  sub_2451A14C4(v25, v146);
                  sub_2451A14C4(v156, v161);
                  sub_2451A14C4(v31, v159);
                  sub_2451A14C4(v154, v29);
                  sub_2451A14C4(v11, v10);
                  return 0;
                }
                uint64_t v40 = v143;
LABEL_41:
                unint64_t v41 = v10;
                unint64_t v26 = v29;
LABEL_42:
                unint64_t v36 = v146;
                break;
              case 3uLL:
                memset(__s1, 0, 14);
                unint64_t v53 = v12;
                unint64_t v54 = v6;
                sub_24519F9C4(v4, v5);
                unint64_t v55 = v54;
                uint64_t v25 = v147;
                sub_24519F9C4(v147, v55);
                sub_24519F9C4(v156, v161);
                sub_24519F9C4(v8, v159);
                sub_24519F9C4(v154, v9);
                sub_24519F9C4(v11, v10);
                unint64_t v26 = v9;
                uint64_t v28 = v14;
                sub_24519F9C4(v149, v53);
                sub_24519F9C4(v155, v162);
                sub_24519F9C4(v153, v160);
                sub_24519F9C4(v152, v158);
                sub_24519F9C4(v150, v13);
                sub_24519F9C4(v14, v157);
                uint64_t v27 = v149;
                unint64_t v29 = v9;
                unint64_t v30 = v53;
                uint64_t v31 = v151;
                goto LABEL_35;
              default:
                __s1[0] = v4;
                LOWORD(__s1[1]) = v5;
                BYTE2(__s1[1]) = BYTE2(v5);
                BYTE3(__s1[1]) = BYTE3(v5);
                BYTE4(__s1[1]) = BYTE4(v5);
                BYTE5(__s1[1]) = BYTE5(v5);
                unint64_t v22 = v12;
                unint64_t v23 = v6;
                sub_24519F9C4(v4, v5);
                unint64_t v24 = v23;
                uint64_t v25 = v147;
                sub_24519F9C4(v147, v24);
                sub_24519F9C4(v156, v161);
                sub_24519F9C4(v8, v159);
                sub_24519F9C4(v154, v9);
                sub_24519F9C4(v11, v10);
                unint64_t v26 = v9;
                sub_24519F9C4(v149, v22);
                sub_24519F9C4(v155, v162);
                sub_24519F9C4(v153, v160);
                sub_24519F9C4(v152, v158);
                sub_24519F9C4(v150, v13);
                sub_24519F9C4(v14, v157);
                uint64_t v27 = v149;
                uint64_t v28 = v14;
                unint64_t v29 = v9;
                unint64_t v30 = v22;
                uint64_t v31 = v151;
LABEL_35:
                sub_2451A5914((uint64_t)__s1, v27, v30, &v163);
                if ((v163 & 1) == 0) {
                  goto LABEL_193;
                }
                uint64_t v40 = v11;
                unint64_t v41 = v10;
                goto LABEL_42;
            }
          }
          unint64_t v56 = v36 >> 62;
          uint64_t v57 = 0;
          unint64_t v29 = v26;
          unint64_t v10 = v41;
          uint64_t v11 = v40;
          uint64_t v31 = v151;
          switch(v36 >> 62)
          {
            case 1uLL:
              LODWORD(v57) = HIDWORD(v147) - v147;
              if (__OFSUB__(HIDWORD(v147), v147)) {
                goto LABEL_200;
              }
              uint64_t v57 = (int)v57;
LABEL_48:
              switch(v162 >> 62)
              {
                case 1uLL:
                  LODWORD(v60) = HIDWORD(v155) - v155;
                  uint64_t v25 = v147;
                  if (__OFSUB__(HIDWORD(v155), v155)) {
                    goto LABEL_202;
                  }
                  uint64_t v60 = (int)v60;
LABEL_53:
                  if (v57 != v60) {
                    goto LABEL_193;
                  }
                  if (v57 >= 1)
                  {
                    switch((int)v56)
                    {
                      case 1:
                        if (v25 >> 32 < (int)v25) {
                          goto LABEL_222;
                        }
                        uint64_t v63 = v28;
                        sub_24519F9C4(v25, v146);
                        uint64_t v64 = sub_2451BEBB0();
                        if (!v64) {
                          goto LABEL_63;
                        }
                        uint64_t v65 = sub_2451BEBD0();
                        if (__OFSUB__((int)v25, v65)) {
                          goto LABEL_234;
                        }
                        v64 += (int)v25 - v65;
LABEL_63:
                        unint64_t v29 = v144;
                        sub_2451BEBC0();
                        sub_2451A5914(v64, v155, v162, (char *)__s1);
                        sub_2451A14C4(v25, v146);
                        unint64_t v10 = v140;
                        uint64_t v11 = v143;
                        uint64_t v28 = v63;
                        uint64_t v31 = v151;
                        if ((__s1[0] & 1) == 0) {
                          goto LABEL_193;
                        }
                        break;
                      case 2:
                        uint64_t v66 = v28;
                        uint64_t v67 = *(void *)(v25 + 16);
                        uint64_t v68 = *(void *)(v25 + 24);
                        swift_retain();
                        swift_retain();
                        uint64_t v69 = sub_2451BEBB0();
                        if (!v69) {
                          goto LABEL_68;
                        }
                        uint64_t v70 = sub_2451BEBD0();
                        if (__OFSUB__(v67, v70)) {
                          goto LABEL_235;
                        }
                        v69 += v67 - v70;
LABEL_68:
                        if (__OFSUB__(v68, v67)) {
                          goto LABEL_223;
                        }
                        sub_2451BEBC0();
                        sub_2451A5914(v69, v155, v162, (char *)__s1);
                        swift_release();
                        swift_release();
                        unint64_t v10 = v140;
                        uint64_t v11 = v143;
                        unint64_t v29 = v144;
                        uint64_t v31 = v151;
                        uint64_t v28 = v66;
                        if ((__s1[0] & 1) == 0) {
                          goto LABEL_193;
                        }
                        break;
                      case 3:
                        memset(__s1, 0, 14);
                        goto LABEL_72;
                      default:
                        __s1[0] = v25;
                        LODWORD(__s1[1]) = v146;
                        WORD2(__s1[1]) = WORD2(v146);
LABEL_72:
                        sub_2451A5914((uint64_t)__s1, v155, v162, &v163);
                        if (v163) {
                          break;
                        }
                        goto LABEL_193;
                    }
                  }
LABEL_73:
                  uint64_t v71 = 0;
                  switch(v161 >> 62)
                  {
                    case 1uLL:
                      LODWORD(v71) = HIDWORD(v156) - v156;
                      if (__OFSUB__(HIDWORD(v156), v156)) {
                        goto LABEL_204;
                      }
                      uint64_t v71 = (int)v71;
LABEL_78:
                      switch(v160 >> 62)
                      {
                        case 1uLL:
                          LODWORD(v74) = HIDWORD(v153) - v153;
                          if (__OFSUB__(HIDWORD(v153), v153)) {
                            goto LABEL_206;
                          }
                          uint64_t v74 = (int)v74;
LABEL_83:
                          if (v71 != v74) {
                            goto LABEL_193;
                          }
                          if (v71 >= 1)
                          {
                            switch(v161 >> 62)
                            {
                              case 1uLL:
                                if (v156 >> 32 < (int)v156) {
                                  goto LABEL_224;
                                }
                                uint64_t v77 = v28;
                                sub_24519F9C4(v156, v161);
                                uint64_t v78 = sub_2451BEBB0();
                                if (!v78) {
                                  goto LABEL_93;
                                }
                                uint64_t v79 = sub_2451BEBD0();
                                if (__OFSUB__((int)v156, v79)) {
                                  goto LABEL_236;
                                }
                                v78 += (int)v156 - v79;
LABEL_93:
                                unint64_t v29 = v144;
                                sub_2451BEBC0();
                                sub_2451A5914(v78, v153, v160, (char *)__s1);
                                sub_2451A14C4(v156, v161);
                                unint64_t v10 = v140;
                                uint64_t v11 = v143;
                                uint64_t v28 = v77;
                                uint64_t v31 = v151;
                                if ((__s1[0] & 1) == 0) {
                                  goto LABEL_193;
                                }
                                break;
                              case 2uLL:
                                uint64_t v80 = v28;
                                uint64_t v81 = *(void *)(v156 + 16);
                                uint64_t v82 = *(void *)(v156 + 24);
                                swift_retain();
                                swift_retain();
                                uint64_t v83 = sub_2451BEBB0();
                                if (!v83) {
                                  goto LABEL_98;
                                }
                                uint64_t v84 = sub_2451BEBD0();
                                if (__OFSUB__(v81, v84)) {
                                  goto LABEL_237;
                                }
                                v83 += v81 - v84;
LABEL_98:
                                if (__OFSUB__(v82, v81)) {
                                  goto LABEL_225;
                                }
                                sub_2451BEBC0();
                                sub_2451A5914(v83, v153, v160, (char *)__s1);
                                swift_release();
                                swift_release();
                                unint64_t v10 = v140;
                                uint64_t v11 = v143;
                                unint64_t v29 = v144;
                                uint64_t v31 = v151;
                                uint64_t v28 = v80;
                                if ((__s1[0] & 1) == 0) {
                                  goto LABEL_193;
                                }
                                break;
                              case 3uLL:
                                memset(__s1, 0, 14);
                                goto LABEL_102;
                              default:
                                __s1[0] = v156;
                                LODWORD(__s1[1]) = v161;
                                WORD2(__s1[1]) = WORD2(v161);
LABEL_102:
                                sub_2451A5914((uint64_t)__s1, v153, v160, &v163);
                                if (v163) {
                                  break;
                                }
                                goto LABEL_193;
                            }
                          }
LABEL_103:
                          uint64_t v85 = 0;
                          switch(v159 >> 62)
                          {
                            case 1uLL:
                              LODWORD(v85) = HIDWORD(v31) - v31;
                              if (__OFSUB__(HIDWORD(v31), v31)) {
                                goto LABEL_208;
                              }
                              uint64_t v85 = (int)v85;
LABEL_108:
                              switch(v158 >> 62)
                              {
                                case 1uLL:
                                  LODWORD(v88) = HIDWORD(v152) - v152;
                                  if (__OFSUB__(HIDWORD(v152), v152)) {
                                    goto LABEL_210;
                                  }
                                  uint64_t v88 = (int)v88;
LABEL_113:
                                  if (v85 != v88) {
                                    goto LABEL_193;
                                  }
                                  if (v85 >= 1)
                                  {
                                    switch(v159 >> 62)
                                    {
                                      case 1uLL:
                                        if (v31 >> 32 < (int)v31) {
                                          goto LABEL_226;
                                        }
                                        uint64_t v91 = v28;
                                        sub_24519F9C4(v31, v159);
                                        uint64_t v92 = sub_2451BEBB0();
                                        if (!v92) {
                                          goto LABEL_123;
                                        }
                                        uint64_t v93 = sub_2451BEBD0();
                                        if (__OFSUB__((int)v31, v93)) {
                                          goto LABEL_239;
                                        }
                                        v92 += (int)v31 - v93;
LABEL_123:
                                        unint64_t v29 = v144;
                                        sub_2451BEBC0();
                                        sub_2451A5914(v92, v152, v158, (char *)__s1);
                                        sub_2451A14C4(v151, v159);
                                        unint64_t v10 = v140;
                                        uint64_t v11 = v143;
                                        uint64_t v28 = v91;
                                        uint64_t v31 = v151;
                                        if ((__s1[0] & 1) == 0) {
                                          goto LABEL_193;
                                        }
                                        break;
                                      case 2uLL:
                                        uint64_t v94 = v28;
                                        uint64_t v95 = *(void *)(v31 + 16);
                                        uint64_t v96 = *(void *)(v31 + 24);
                                        swift_retain();
                                        swift_retain();
                                        uint64_t v97 = sub_2451BEBB0();
                                        if (!v97) {
                                          goto LABEL_128;
                                        }
                                        uint64_t v98 = sub_2451BEBD0();
                                        if (__OFSUB__(v95, v98)) {
                                          goto LABEL_238;
                                        }
                                        v97 += v95 - v98;
LABEL_128:
                                        if (__OFSUB__(v96, v95)) {
                                          goto LABEL_227;
                                        }
                                        sub_2451BEBC0();
                                        sub_2451A5914(v97, v152, v158, (char *)__s1);
                                        swift_release();
                                        uint64_t v31 = v151;
                                        swift_release();
                                        unint64_t v10 = v140;
                                        uint64_t v11 = v143;
                                        unint64_t v29 = v144;
                                        uint64_t v28 = v94;
                                        if ((__s1[0] & 1) == 0) {
                                          goto LABEL_193;
                                        }
                                        break;
                                      case 3uLL:
                                        memset(__s1, 0, 14);
                                        goto LABEL_132;
                                      default:
                                        __s1[0] = v31;
                                        LODWORD(__s1[1]) = v159;
                                        WORD2(__s1[1]) = WORD2(v159);
LABEL_132:
                                        sub_2451A5914((uint64_t)__s1, v152, v158, &v163);
                                        if (v163) {
                                          break;
                                        }
                                        goto LABEL_193;
                                    }
                                  }
LABEL_133:
                                  uint64_t v99 = 0;
                                  switch(v29 >> 62)
                                  {
                                    case 1uLL:
                                      LODWORD(v99) = HIDWORD(v154) - v154;
                                      if (__OFSUB__(HIDWORD(v154), v154)) {
                                        goto LABEL_212;
                                      }
                                      uint64_t v99 = (int)v99;
LABEL_138:
                                      switch(v13 >> 62)
                                      {
                                        case 1uLL:
                                          LODWORD(v102) = HIDWORD(v150) - v150;
                                          if (__OFSUB__(HIDWORD(v150), v150)) {
                                            goto LABEL_214;
                                          }
                                          uint64_t v102 = (int)v102;
LABEL_143:
                                          if (v99 != v102) {
                                            goto LABEL_193;
                                          }
                                          if (v99 >= 1)
                                          {
                                            switch(v29 >> 62)
                                            {
                                              case 1uLL:
                                                if (v154 >> 32 < (int)v154) {
                                                  goto LABEL_228;
                                                }
                                                uint64_t v105 = v28;
                                                sub_24519F9C4(v154, v144);
                                                uint64_t v106 = sub_2451BEBB0();
                                                if (!v106) {
                                                  goto LABEL_153;
                                                }
                                                uint64_t v107 = sub_2451BEBD0();
                                                if (__OFSUB__((int)v154, v107)) {
                                                  goto LABEL_240;
                                                }
                                                v106 += (int)v154 - v107;
LABEL_153:
                                                unint64_t v29 = v144;
                                                sub_2451BEBC0();
                                                sub_2451A5914(v106, v150, v13, (char *)__s1);
                                                sub_2451A14C4(v154, v144);
                                                unint64_t v10 = v140;
                                                uint64_t v11 = v143;
                                                uint64_t v28 = v105;
                                                uint64_t v25 = v147;
                                                uint64_t v31 = v151;
                                                if ((__s1[0] & 1) == 0) {
                                                  goto LABEL_193;
                                                }
                                                break;
                                              case 2uLL:
                                                uint64_t v108 = v28;
                                                uint64_t v109 = *(void *)(v154 + 16);
                                                uint64_t v110 = *(void *)(v154 + 24);
                                                swift_retain();
                                                swift_retain();
                                                uint64_t v111 = sub_2451BEBB0();
                                                if (!v111) {
                                                  goto LABEL_158;
                                                }
                                                uint64_t v112 = sub_2451BEBD0();
                                                if (__OFSUB__(v109, v112)) {
                                                  goto LABEL_241;
                                                }
                                                v111 += v109 - v112;
LABEL_158:
                                                if (__OFSUB__(v110, v109)) {
                                                  goto LABEL_229;
                                                }
                                                sub_2451BEBC0();
                                                sub_2451A5914(v111, v150, v13, (char *)__s1);
                                                swift_release();
                                                swift_release();
                                                unint64_t v10 = v140;
                                                uint64_t v11 = v143;
                                                unint64_t v29 = v144;
                                                uint64_t v31 = v151;
                                                uint64_t v28 = v108;
                                                if ((__s1[0] & 1) == 0) {
                                                  goto LABEL_193;
                                                }
                                                break;
                                              case 3uLL:
                                                memset(__s1, 0, 14);
                                                goto LABEL_162;
                                              default:
                                                __s1[0] = v154;
                                                LOWORD(__s1[1]) = v29;
                                                BYTE2(__s1[1]) = BYTE2(v29);
                                                BYTE3(__s1[1]) = BYTE3(v29);
                                                BYTE4(__s1[1]) = BYTE4(v29);
                                                BYTE5(__s1[1]) = BYTE5(v29);
LABEL_162:
                                                sub_2451A5914((uint64_t)__s1, v150, v13, &v163);
                                                if (v163) {
                                                  break;
                                                }
                                                goto LABEL_193;
                                            }
                                          }
LABEL_163:
                                          uint64_t v113 = 0;
                                          switch(v10 >> 62)
                                          {
                                            case 1uLL:
                                              LODWORD(v113) = HIDWORD(v11) - v11;
                                              if (__OFSUB__(HIDWORD(v11), v11)) {
                                                goto LABEL_216;
                                              }
                                              uint64_t v113 = (int)v113;
                                              break;
                                            case 2uLL:
                                              uint64_t v115 = *(void *)(v11 + 16);
                                              uint64_t v114 = *(void *)(v11 + 24);
                                              BOOL v18 = __OFSUB__(v114, v115);
                                              uint64_t v113 = v114 - v115;
                                              if (!v18) {
                                                goto LABEL_168;
                                              }
                                              goto LABEL_217;
                                            case 3uLL:
                                              goto LABEL_168;
                                            default:
                                              uint64_t v113 = BYTE6(v10);
                                              goto LABEL_168;
                                          }
                                          break;
                                        case 2uLL:
                                          uint64_t v104 = *(void *)(v150 + 16);
                                          uint64_t v103 = *(void *)(v150 + 24);
                                          BOOL v18 = __OFSUB__(v103, v104);
                                          uint64_t v102 = v103 - v104;
                                          if (!v18) {
                                            goto LABEL_143;
                                          }
                                          goto LABEL_215;
                                        case 3uLL:
                                          if (v99) {
                                            goto LABEL_193;
                                          }
                                          goto LABEL_163;
                                        default:
                                          uint64_t v102 = BYTE6(v13);
                                          goto LABEL_143;
                                      }
                                      break;
                                    case 2uLL:
                                      uint64_t v101 = *(void *)(v154 + 16);
                                      uint64_t v100 = *(void *)(v154 + 24);
                                      BOOL v18 = __OFSUB__(v100, v101);
                                      uint64_t v99 = v100 - v101;
                                      if (!v18) {
                                        goto LABEL_138;
                                      }
                                      goto LABEL_213;
                                    case 3uLL:
                                      goto LABEL_138;
                                    default:
                                      uint64_t v99 = BYTE6(v29);
                                      goto LABEL_138;
                                  }
                                  break;
                                case 2uLL:
                                  uint64_t v90 = *(void *)(v152 + 16);
                                  uint64_t v89 = *(void *)(v152 + 24);
                                  BOOL v18 = __OFSUB__(v89, v90);
                                  uint64_t v88 = v89 - v90;
                                  if (!v18) {
                                    goto LABEL_113;
                                  }
                                  goto LABEL_211;
                                case 3uLL:
                                  if (v85) {
                                    goto LABEL_193;
                                  }
                                  goto LABEL_133;
                                default:
                                  uint64_t v88 = BYTE6(v158);
                                  goto LABEL_113;
                              }
                              break;
                            case 2uLL:
                              uint64_t v87 = *(void *)(v31 + 16);
                              uint64_t v86 = *(void *)(v31 + 24);
                              BOOL v18 = __OFSUB__(v86, v87);
                              uint64_t v85 = v86 - v87;
                              if (!v18) {
                                goto LABEL_108;
                              }
                              goto LABEL_209;
                            case 3uLL:
                              goto LABEL_108;
                            default:
                              uint64_t v85 = BYTE6(v159);
                              goto LABEL_108;
                          }
                          break;
                        case 2uLL:
                          uint64_t v76 = *(void *)(v153 + 16);
                          uint64_t v75 = *(void *)(v153 + 24);
                          BOOL v18 = __OFSUB__(v75, v76);
                          uint64_t v74 = v75 - v76;
                          if (!v18) {
                            goto LABEL_83;
                          }
                          goto LABEL_207;
                        case 3uLL:
                          if (v71) {
                            goto LABEL_193;
                          }
                          goto LABEL_103;
                        default:
                          uint64_t v74 = BYTE6(v160);
                          goto LABEL_83;
                      }
                      break;
                    case 2uLL:
                      uint64_t v73 = *(void *)(v156 + 16);
                      uint64_t v72 = *(void *)(v156 + 24);
                      BOOL v18 = __OFSUB__(v72, v73);
                      uint64_t v71 = v72 - v73;
                      if (!v18) {
                        goto LABEL_78;
                      }
                      goto LABEL_205;
                    case 3uLL:
                      goto LABEL_78;
                    default:
                      uint64_t v71 = BYTE6(v161);
                      goto LABEL_78;
                  }
                  break;
                case 2uLL:
                  uint64_t v62 = *(void *)(v155 + 16);
                  uint64_t v61 = *(void *)(v155 + 24);
                  BOOL v18 = __OFSUB__(v61, v62);
                  uint64_t v60 = v61 - v62;
                  uint64_t v25 = v147;
                  if (!v18) {
                    goto LABEL_53;
                  }
                  goto LABEL_203;
                case 3uLL:
                  uint64_t v25 = v147;
                  if (v57) {
                    goto LABEL_193;
                  }
                  goto LABEL_73;
                default:
                  uint64_t v60 = BYTE6(v162);
                  uint64_t v25 = v147;
                  goto LABEL_53;
              }
              break;
            case 2uLL:
              uint64_t v59 = *(void *)(v147 + 16);
              uint64_t v58 = *(void *)(v147 + 24);
              BOOL v18 = __OFSUB__(v58, v59);
              uint64_t v57 = v58 - v59;
              if (!v18) {
                goto LABEL_48;
              }
              goto LABEL_201;
            case 3uLL:
              goto LABEL_48;
            default:
              uint64_t v57 = BYTE6(v36);
              goto LABEL_48;
          }
LABEL_168:
          switch(v157 >> 62)
          {
            case 1uLL:
              LODWORD(v116) = HIDWORD(v28) - v28;
              if (__OFSUB__(HIDWORD(v28), v28)) {
                goto LABEL_218;
              }
              uint64_t v116 = (int)v116;
LABEL_173:
              if (v113 != v116) {
                goto LABEL_193;
              }
              if (v113 >= 1)
              {
                switch(v10 >> 62)
                {
                  case 1uLL:
                    if (v11 >> 32 < (int)v11) {
                      goto LABEL_230;
                    }
                    uint64_t v124 = v28;
                    sub_24519F9C4(v11, v10);
                    uint64_t v125 = sub_2451BEBB0();
                    if (v125)
                    {
                      uint64_t v126 = sub_2451BEBD0();
                      if (__OFSUB__((int)v11, v126)) {
                        goto LABEL_242;
                      }
                      unint64_t v127 = v138;
                      v125 += (int)v11 - v126;
                    }
                    else
                    {
                      unint64_t v127 = v138;
                    }
                    sub_2451BEBC0();
                    sub_2451A5914(v125, v124, v157, (char *)__s1);
                    sub_2451A14C4(v143, v140);
                    sub_2451A14C4(v149, v127);
                    sub_2451A14C4(v155, v162);
                    sub_2451A14C4(v153, v160);
                    sub_2451A14C4(v152, v158);
                    sub_2451A14C4(v150, v13);
                    sub_2451A14C4(v124, v157);
                    sub_2451A14C4(v145, v139);
                    sub_2451A14C4(v147, v146);
                    sub_2451A14C4(v156, v161);
                    sub_2451A14C4(v151, v159);
                    sub_2451A14C4(v154, v144);
                    uint64_t v133 = v143;
                    unint64_t v134 = v140;
LABEL_191:
                    sub_2451A14C4(v133, v134);
                    if ((__s1[0] & 1) == 0) {
                      return 0;
                    }
                    goto LABEL_8;
                  case 2uLL:
                    uint64_t v128 = v28;
                    uint64_t v129 = *(void *)(v11 + 16);
                    uint64_t v130 = *(void *)(v11 + 24);
                    swift_retain();
                    swift_retain();
                    uint64_t v131 = sub_2451BEBB0();
                    if (!v131) {
                      goto LABEL_184;
                    }
                    uint64_t v132 = sub_2451BEBD0();
                    if (__OFSUB__(v129, v132)) {
                      goto LABEL_243;
                    }
                    v131 += v129 - v132;
LABEL_184:
                    if (__OFSUB__(v130, v129)) {
                      goto LABEL_231;
                    }
                    sub_2451BEBC0();
                    sub_2451A5914(v131, v128, v157, (char *)__s1);
                    swift_release();
                    swift_release();
                    sub_2451A14C4(v149, v138);
                    sub_2451A14C4(v155, v162);
                    sub_2451A14C4(v153, v160);
                    sub_2451A14C4(v152, v158);
                    sub_2451A14C4(v150, v13);
                    sub_2451A14C4(v128, v157);
                    sub_2451A14C4(v145, v139);
                    sub_2451A14C4(v25, v146);
                    sub_2451A14C4(v156, v161);
                    sub_2451A14C4(v151, v159);
                    sub_2451A14C4(v154, v144);
                    uint64_t v133 = v143;
                    unint64_t v134 = v140;
                    goto LABEL_191;
                  case 3uLL:
                    memset(__s1, 0, 14);
                    sub_2451A5914((uint64_t)__s1, v28, v157, &v163);
                    sub_2451A14C4(v149, v138);
                    sub_2451A14C4(v155, v162);
                    sub_2451A14C4(v153, v160);
                    sub_2451A14C4(v152, v158);
                    sub_2451A14C4(v150, v13);
                    sub_2451A14C4(v28, v157);
                    sub_2451A14C4(v145, v139);
                    sub_2451A14C4(v25, v146);
                    sub_2451A14C4(v156, v161);
                    uint64_t v123 = v31;
                    goto LABEL_187;
                  default:
                    __s1[0] = v11;
                    LOWORD(__s1[1]) = v10;
                    BYTE2(__s1[1]) = BYTE2(v10);
                    BYTE3(__s1[1]) = BYTE3(v10);
                    BYTE4(__s1[1]) = BYTE4(v10);
                    BYTE5(__s1[1]) = BYTE5(v10);
                    uint64_t v119 = v28;
                    uint64_t v120 = v28;
                    uint64_t v121 = v31;
                    uint64_t v122 = v120;
                    sub_2451A5914((uint64_t)__s1, v119, v157, &v163);
                    sub_2451A14C4(v149, v138);
                    sub_2451A14C4(v155, v162);
                    sub_2451A14C4(v153, v160);
                    sub_2451A14C4(v152, v158);
                    sub_2451A14C4(v150, v13);
                    sub_2451A14C4(v122, v157);
                    sub_2451A14C4(v145, v139);
                    sub_2451A14C4(v25, v146);
                    sub_2451A14C4(v156, v161);
                    uint64_t v123 = v121;
LABEL_187:
                    sub_2451A14C4(v123, v159);
                    sub_2451A14C4(v154, v29);
                    sub_2451A14C4(v11, v10);
                    if ((v163 & 1) == 0) {
                      return 0;
                    }
                    goto LABEL_8;
                }
              }
LABEL_7:
              sub_2451A14C4(v149, v138);
              sub_2451A14C4(v155, v162);
              sub_2451A14C4(v153, v160);
              sub_2451A14C4(v152, v158);
              sub_2451A14C4(v150, v13);
              sub_2451A14C4(v28, v157);
              sub_2451A14C4(v145, v139);
              sub_2451A14C4(v25, v146);
              sub_2451A14C4(v156, v161);
              sub_2451A14C4(v31, v159);
              sub_2451A14C4(v154, v29);
              sub_2451A14C4(v11, v10);
LABEL_8:
              uint64_t result = 1;
              if (!--v148) {
                return result;
              }
              break;
            case 2uLL:
              uint64_t v118 = *(void *)(v28 + 16);
              uint64_t v117 = *(void *)(v28 + 24);
              BOOL v18 = __OFSUB__(v117, v118);
              uint64_t v116 = v117 - v118;
              if (!v18) {
                goto LABEL_173;
              }
              goto LABEL_219;
            case 3uLL:
              if (!v113) {
                goto LABEL_7;
              }
              goto LABEL_193;
            default:
              uint64_t v116 = BYTE6(v157);
              goto LABEL_173;
          }
          break;
        case 2uLL:
          uint64_t v21 = *(void *)(v149 + 16);
          uint64_t v20 = *(void *)(v149 + 24);
          BOOL v18 = __OFSUB__(v20, v21);
          uint64_t v19 = v20 - v21;
          if (!v18) {
            goto LABEL_19;
          }
          goto LABEL_199;
        case 3uLL:
          if (!v15) {
            goto LABEL_24;
          }
          return 0;
        default:
          uint64_t v19 = BYTE6(v12);
          goto LABEL_19;
      }
    }
  }
  return 1;
}

uint64_t CredentialSession.Credential.InstanceInfo.instanceAID.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24519F9C4(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t CredentialSession.Credential.InstanceInfo.packageAID.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24519F9C4(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t CredentialSession.Credential.InstanceInfo.moduleAID.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24519F9C4(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t CredentialSession.Credential.InstanceInfo.securityDomainAID.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  sub_24519F9C4(v1, *(void *)(v0 + 56));
  return v1;
}

uint64_t CredentialSession.Credential.InstanceInfo.securityDomainKeyInfo.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  sub_24519F9C4(v1, *(void *)(v0 + 72));
  return v1;
}

uint64_t CredentialSession.Credential.InstanceInfo.lifeCycleState.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  sub_24519F9C4(v1, *(void *)(v0 + 88));
  return v1;
}

BOOL sub_2451A57E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2451A5800()
{
  return sub_2451BF0C0();
}

uint64_t sub_2451A5848()
{
  return sub_2451BF0B0();
}

uint64_t sub_2451A5874()
{
  return sub_2451BF0C0();
}

uint64_t CredentialSession.Credential.hash(into:)(uint64_t a1)
{
  uint64_t v2 = sub_2451BEC70();
  unint64_t v3 = sub_2451A62F4();

  return MEMORY[0x270F9D320](a1, v2, v3);
}

uint64_t sub_2451A5914@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_24519F9C4(a2, a3);
      unint64_t v10 = (char *)sub_2451BEBB0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_2451BEBD0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_2451BEBC0();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x2451A5B78);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_2451A14C4(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_2451BEBB0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_2451BEBD0();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_2451BEBC0();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_2451A5B88(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_24519F9C4(a1, a2);
      char v5 = sub_2451A5DB8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_2451A14C4(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_2451A5DB8(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_2451A14C4(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_2451A5914((uint64_t)__s1, a3, a4, &v14);
      sub_2451A14C4(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_2451A5DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_2451BEBB0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_2451BEBD0();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_2451BEBC0();
  sub_2451A5914(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_2451A5E70(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x2451A5FACLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_24519F9C4(a3, a4);
              char v15 = sub_2451A5B88(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s23SecureElementCredential0C7SessionC0C0V12InstanceInfoV2eeoiySbAG_AGtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  unint64_t v4 = a1[3];
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  uint64_t v8 = *a2;
  unint64_t v9 = a2[1];
  uint64_t v10 = a2[2];
  unint64_t v11 = a2[3];
  uint64_t v12 = a2[4];
  unint64_t v13 = a2[5];
  uint64_t v15 = a2[8];
  uint64_t v16 = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      LODWORD(v16) = HIDWORD(v3) - v3;
      if (__OFSUB__(HIDWORD(v3), v3))
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        JUMPOUT(0x2451A6224);
      }
      uint64_t v16 = (int)v16;
LABEL_6:
      unint64_t v45 = a2[7];
      uint64_t v14 = a2[6];
      unint64_t v47 = a1[7];
      uint64_t v46 = a1[6];
      uint64_t v43 = a1[8];
      unint64_t v44 = a1[9];
      unint64_t v40 = a2[11];
      uint64_t v41 = a1[10];
      unint64_t v38 = a1[11];
      uint64_t v39 = a2[10];
      unint64_t v42 = a2[9];
      switch(v9 >> 62)
      {
        case 1uLL:
          LODWORD(v20) = HIDWORD(v8) - v8;
          if (__OFSUB__(HIDWORD(v8), v8)) {
            goto LABEL_26;
          }
          uint64_t v20 = (int)v20;
LABEL_11:
          if (v16 != v20) {
            return 0;
          }
          if (v16 >= 1)
          {
            uint64_t v36 = a1[5];
            uint64_t v37 = a1[4];
            uint64_t v35 = a1[2];
            uint64_t v23 = a2[8];
            unint64_t v24 = a1[3];
            uint64_t v25 = a2[4];
            uint64_t v26 = a2[5];
            uint64_t v27 = a2[2];
            unint64_t v28 = a2[3];
            sub_24519F9C4(v8, v9);
            char v29 = sub_2451A5B88(v3, v2, v8, v9);
            unint64_t v11 = v28;
            uint64_t v10 = v27;
            unint64_t v13 = v26;
            uint64_t v12 = v25;
            unint64_t v4 = v24;
            uint64_t v15 = v23;
            uint64_t v5 = v35;
            unint64_t v7 = v36;
            uint64_t v6 = v37;
            if ((v29 & 1) == 0) {
              return 0;
            }
          }
LABEL_16:
          uint64_t v30 = v6;
          unint64_t v31 = v7;
          uint64_t v32 = v12;
          unint64_t v33 = v13;
          if ((sub_2451A5E70(v5, v4, v10, v11) & 1) == 0
            || (sub_2451A5E70(v30, v31, v32, v33) & 1) == 0
            || (sub_2451A5E70(v46, v47, v14, v45) & 1) == 0
            || (sub_2451A5E70(v43, v44, v15, v42) & 1) == 0)
          {
            return 0;
          }
          return sub_2451A5E70(v41, v38, v39, v40);
        case 2uLL:
          uint64_t v22 = *(void *)(v8 + 16);
          uint64_t v21 = *(void *)(v8 + 24);
          BOOL v19 = __OFSUB__(v21, v22);
          uint64_t v20 = v21 - v22;
          if (!v19) {
            goto LABEL_11;
          }
          goto LABEL_27;
        case 3uLL:
          if (!v16) {
            goto LABEL_16;
          }
          return 0;
        default:
          uint64_t v20 = BYTE6(v9);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v18 = *(void *)(v3 + 16);
      uint64_t v17 = *(void *)(v3 + 24);
      BOOL v19 = __OFSUB__(v17, v18);
      uint64_t v16 = v17 - v18;
      if (!v19) {
        goto LABEL_6;
      }
      goto LABEL_25;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v16 = BYTE6(v2);
      goto LABEL_6;
  }
}

uint64_t _s23SecureElementCredential0C7SessionC0C0V5StateO2eeoiySbAG_AGtFZ_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = *a2;
  if (!*a1)
  {
    if (!v3)
    {
      unint64_t v2 = 0;
      char v4 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v2 != 1)
  {
    if (v3 >= 2)
    {
      sub_2451A2C5C(*a2);
      sub_2451A2C5C(v2);
      char v4 = sub_2451A3B28(v2, v3);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v3 != 1)
  {
LABEL_8:
    sub_2451A2C5C(*a2);
    sub_2451A2C5C(v2);
    char v4 = 0;
    goto LABEL_10;
  }
  unint64_t v2 = 1;
  char v4 = 1;
LABEL_10:
  sub_2451A76C4(v2);
  sub_2451A76C4(v3);
  return v4 & 1;
}

unint64_t sub_2451A62F4()
{
  unint64_t result = qword_268ECB760;
  if (!qword_268ECB760)
  {
    sub_2451BEC70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB760);
  }
  return result;
}

uint64_t _s23SecureElementCredential0C7SessionC0C0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_2451BEC50() & 1) == 0) {
    return 0;
  }
  char v4 = (int *)type metadata accessor for CredentialSession.Credential();
  uint64_t v5 = v4[5];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (!v9 && (sub_2451BF030() & 1) == 0) {
    return 0;
  }
  uint64_t v10 = v4[6];
  unint64_t v11 = *(void *)(a1 + v10);
  unint64_t v12 = *(void *)(a2 + v10);
  if (!v11)
  {
    if (!v12)
    {
LABEL_12:
      sub_2451A76C4(*(void *)(a1 + v10));
      sub_2451A76C4(v11);
      goto LABEL_16;
    }
LABEL_14:
    sub_2451A2C5C(*(void *)(a2 + v10));
    sub_2451A2C5C(v11);
    sub_2451A76C4(v11);
    sub_2451A76C4(v12);
    return 0;
  }
  if (v11 == 1)
  {
    if (v12 != 1) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v12 < 2) {
    goto LABEL_14;
  }
  sub_2451A2C5C(*(void *)(a2 + v10));
  sub_2451A2C5C(v11);
  char v13 = sub_2451A3B28(v11, v12);
  sub_2451A76C4(v11);
  sub_2451A76C4(v12);
  if ((v13 & 1) == 0) {
    return 0;
  }
LABEL_16:
  if ((sub_2451A3A60(*(void **)(a1 + v4[7]), *(void **)(a2 + v4[7])) & 1) == 0
    || (sub_2451A3A60(*(void **)(a1 + v4[8]), *(void **)(a2 + v4[8])) & 1) == 0
    || *(unsigned __int8 *)(a1 + v4[9]) != *(unsigned __int8 *)(a2 + v4[9]))
  {
    return 0;
  }

  return sub_2451BEC50();
}

char *_s10CredentialVwCP(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2451BEC70();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    unint64_t v11 = &a1[v9];
    unint64_t v12 = &a2[v9];
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)unint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    unint64_t v14 = *(void *)&a2[v10];
    swift_bridgeObjectRetain();
    if (v14 >= 2) {
      swift_bridgeObjectRetain();
    }
    *(void *)&a1[v10] = v14;
    uint64_t v15 = a3[8];
    *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
    *(void *)&a1[v15] = *(void *)&a2[v15];
    uint64_t v16 = a3[10];
    a1[a3[9]] = a2[a3[9]];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8(v17, v18, v7);
  }
  return a1;
}

uint64_t _s10CredentialVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2451BEC70();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v7(a1, v4);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + *(int *)(a2 + 24)) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 40);

  return ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v4);
}

uint64_t _s10CredentialVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2451BEC70();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v8);
  unint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  unint64_t v13 = *(void *)(a2 + v9);
  swift_bridgeObjectRetain();
  if (v13 >= 2) {
    swift_bridgeObjectRetain();
  }
  *(void *)(a1 + v9) = v13;
  uint64_t v14 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7(v16, v17, v6);
  return a1;
}

uint64_t _s10CredentialVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2451BEC70();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  void *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[6];
  uint64_t v12 = (unint64_t *)(a1 + v11);
  unint64_t v13 = *(void *)(a2 + v11);
  if (*(void *)(a1 + v11) >= 2uLL)
  {
    if (v13 >= 2)
    {
      *uint64_t v12 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2451A696C(a1 + v11);
      *uint64_t v12 = *(void *)(a2 + v11);
    }
  }
  else
  {
    *uint64_t v12 = v13;
    if (v13 >= 2) {
      swift_bridgeObjectRetain();
    }
  }
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  v7(a1 + a3[10], a2 + a3[10], v6);
  return a1;
}

uint64_t sub_2451A696C(uint64_t a1)
{
  uint64_t v2 = sub_24519E6AC(&qword_268ECB768);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s10CredentialVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2451BEC70();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  v7(a1 + v10, a2 + v10, v6);
  return a1;
}

uint64_t _s10CredentialVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2451BEC70();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  void *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = (unint64_t *)(a1 + v13);
  unint64_t v15 = *(void *)(a2 + v13);
  if (*(void *)(a1 + v13) >= 2uLL)
  {
    if (v15 >= 2)
    {
      unint64_t *v14 = v15;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_2451A696C(a1 + v13);
    unint64_t v15 = *(void *)(a2 + v13);
  }
  unint64_t *v14 = v15;
LABEL_6:
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  v7(a1 + v16, a2 + v16, v6);
  return a1;
}

uint64_t _s10CredentialVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2451A6BD0);
}

uint64_t sub_2451A6BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2451BEC70();
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

uint64_t _s10CredentialVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2451A6CA8);
}

uint64_t sub_2451A6CA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2451BEC70();
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

uint64_t sub_2451A6D68()
{
  uint64_t result = sub_2451BEC70();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *_s10CredentialV5StateOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t _s10CredentialV5StateOwxx(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *_s10CredentialV5StateOwca(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *_s10CredentialV5StateOwtk(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *_s10CredentialV5StateOwta(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s10CredentialV5StateOwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t _s10CredentialV5StateOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_2451A7020(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2451A703C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CredentialSession.Credential.State()
{
  return &type metadata for CredentialSession.Credential.State;
}

uint64_t _s10CredentialV12InstanceInfoVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s10CredentialV12InstanceInfoVwxx(uint64_t *a1)
{
  sub_2451A14C4(*a1, a1[1]);
  sub_2451A14C4(a1[2], a1[3]);
  sub_2451A14C4(a1[4], a1[5]);
  sub_2451A14C4(a1[6], a1[7]);
  sub_2451A14C4(a1[8], a1[9]);
  uint64_t v2 = a1[10];
  unint64_t v3 = a1[11];

  return sub_2451A14C4(v2, v3);
}

uint64_t *_s10CredentialV12InstanceInfoVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24519F9C4(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_24519F9C4(v6, v7);
  a1[2] = v6;
  a1[3] = v7;
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  sub_24519F9C4(v8, v9);
  a1[4] = v8;
  a1[5] = v9;
  uint64_t v10 = a2[6];
  unint64_t v11 = a2[7];
  sub_24519F9C4(v10, v11);
  a1[6] = v10;
  a1[7] = v11;
  uint64_t v12 = a2[8];
  unint64_t v13 = a2[9];
  sub_24519F9C4(v12, v13);
  a1[8] = v12;
  a1[9] = v13;
  uint64_t v15 = a2[10];
  unint64_t v14 = a2[11];
  sub_24519F9C4(v15, v14);
  a1[10] = v15;
  a1[11] = v14;
  return a1;
}

uint64_t *_s10CredentialV12InstanceInfoVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24519F9C4(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2451A14C4(v6, v7);
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_24519F9C4(v8, v9);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_2451A14C4(v10, v11);
  uint64_t v12 = a2[4];
  unint64_t v13 = a2[5];
  sub_24519F9C4(v12, v13);
  uint64_t v14 = a1[4];
  unint64_t v15 = a1[5];
  a1[4] = v12;
  a1[5] = v13;
  sub_2451A14C4(v14, v15);
  uint64_t v16 = a2[6];
  unint64_t v17 = a2[7];
  sub_24519F9C4(v16, v17);
  uint64_t v18 = a1[6];
  unint64_t v19 = a1[7];
  a1[6] = v16;
  a1[7] = v17;
  sub_2451A14C4(v18, v19);
  uint64_t v20 = a2[8];
  unint64_t v21 = a2[9];
  sub_24519F9C4(v20, v21);
  uint64_t v22 = a1[8];
  unint64_t v23 = a1[9];
  a1[8] = v20;
  a1[9] = v21;
  sub_2451A14C4(v22, v23);
  uint64_t v25 = a2[10];
  unint64_t v24 = a2[11];
  sub_24519F9C4(v25, v24);
  uint64_t v26 = a1[10];
  unint64_t v27 = a1[11];
  a1[10] = v25;
  a1[11] = v24;
  sub_2451A14C4(v26, v27);
  return a1;
}

__n128 _s10CredentialV12InstanceInfoVwtk(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t *_s10CredentialV12InstanceInfoVwta(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_2451A14C4(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_2451A14C4(v6, v7);
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_2451A14C4(v8, v9);
  uint64_t v10 = a1[6];
  unint64_t v11 = a1[7];
  *((_OWORD *)a1 + 3) = a2[3];
  sub_2451A14C4(v10, v11);
  uint64_t v12 = a1[8];
  unint64_t v13 = a1[9];
  *((_OWORD *)a1 + 4) = a2[4];
  sub_2451A14C4(v12, v13);
  uint64_t v14 = a1[10];
  unint64_t v15 = a1[11];
  *((_OWORD *)a1 + 5) = a2[5];
  sub_2451A14C4(v14, v15);
  return a1;
}

uint64_t _s10CredentialV12InstanceInfoVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s10CredentialV12InstanceInfoVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 96) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CredentialSession.Credential.InstanceInfo()
{
  return &type metadata for CredentialSession.Credential.InstanceInfo;
}

unsigned char *_s10CredentialV11AccessLevelOwCP(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t _s10CredentialV11AccessLevelOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s10CredentialV11AccessLevelOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2451A7560);
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

uint64_t sub_2451A7588(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2451A7590(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *_s10CredentialV11AccessLevelOMa()
{
  return &_s10CredentialV11AccessLevelON;
}

unint64_t sub_2451A75B0()
{
  unint64_t result = qword_268ECB780;
  if (!qword_268ECB780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268ECB780);
  }
  return result;
}

uint64_t sub_2451A7604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CredentialSession.Credential();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2451A7668(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CredentialSession.Credential();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2451A76C4(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for SECRemoteProxyObject(uint64_t a1)
{
  uint64_t result = swift_unknownObjectRelease();
  if (*(void *)(a1 + 32))
  {
    return sub_2451A142C(a1 + 8);
  }
  return result;
}

uint64_t initializeWithCopy for SECRemoteProxyObject(uint64_t a1, void *a2)
{
  *(void *)a1 = *a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = a2 + 1;
  uint64_t v6 = a2[4];
  swift_unknownObjectRetain();
  if (v6)
  {
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = v7;
    (**(void (***)(uint64_t, void *, uint64_t))(v6 - 8))(a1 + 8, v5, v6);
  }
  else
  {
    long long v8 = *((_OWORD *)v5 + 1);
    *uint64_t v4 = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 24) = v8;
    *(void *)(a1 + 40) = v5[4];
  }
  return a1;
}

uint64_t assignWithCopy for SECRemoteProxyObject(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v4)
    {
      *(void *)(a1 + 32) = v4;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
      return a1;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 8);
    long long v6 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 8) = v5;
    *(_OWORD *)(a1 + 24) = v6;
    return a1;
  }
  if (!v4)
  {
    sub_2451A142C(a1 + 8);
    goto LABEL_7;
  }
  sub_2451A7898((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  return a1;
}

uint64_t *sub_2451A7898(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *int v3 = v12;
      }
      else
      {
        unint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t result = *a2;
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
          *int v3 = *a2;
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

__n128 initializeWithTake for SECRemoteProxyObject(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SECRemoteProxyObject(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  if (*(void *)(a1 + 32)) {
    sub_2451A142C(a1 + 8);
  }
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SECRemoteProxyObject(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SECRemoteProxyObject(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SECRemoteProxyObject()
{
  return &type metadata for SECRemoteProxyObject;
}

uint64_t sub_2451A7C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2451A7C30, 0, 0);
}

uint64_t sub_2451A7C30()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_2451A7E24(v1, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2451A7D30;
  return v6(v2, v3);
}

uint64_t sub_2451A7D30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_2451A7E24(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2451A7E68(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_2451A7EFC(a1, a2, a3, a4, (uint64_t)&unk_26F9E9E30, (uint64_t)sub_2451A147C, (uint64_t)&unk_26F9E9E48, (void (*)(void *, uint64_t, uint64_t, uint64_t))sub_2451A07A4);
}

uint64_t sub_2451A7EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2451A7EB8()
{
  return swift_release();
}

uint64_t sub_2451A7EC0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_2451A7EFC(a1, a2, a3, a4, (uint64_t)&unk_26F9E9E80, (uint64_t)sub_2451A8158, (uint64_t)&unk_26F9E9E98, (void (*)(void *, uint64_t, uint64_t, uint64_t))sub_24519FA1C);
}

uint64_t sub_2451A7EFC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void *, uint64_t, uint64_t, uint64_t))
{
  int v9 = *a2;
  if (*a2)
  {
    sub_2451A12D0((uint64_t)a2, (uint64_t)v24);
    uint64_t v15 = swift_allocObject();
    long long v16 = v24[1];
    *(_OWORD *)(v15 + 16) = v24[0];
    *(_OWORD *)(v15 + 32) = v16;
    *(_OWORD *)(v15 + 48) = v24[2];
    *(void *)(v15 + 64) = a1;
    v23[4] = a6;
    v23[5] = v15;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 1107296256;
    v23[2] = sub_24519E644;
    v23[3] = a7;
    unint64_t v17 = _Block_copy(v23);
    swift_unknownObjectRetain();
    swift_release();
    id v18 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v17);
    _Block_release(v17);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB6B8);
    if ((swift_dynamicCast() & 1) == 0) {
      v23[0] = 0;
    }
    a8(v23, a1, a3, a4);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v20 = swift_allocError();
    *unint64_t v21 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v22 = v20;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451A8110()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 48)) {
    sub_2451A142C(v0 + 24);
  }

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2451A8158(void *a1)
{
  return sub_2451A85D4(a1, v1 + 16, *(void *)(v1 + 64));
}

uint64_t sub_2451A816C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = a3;
  uint64_t v6 = v4;
  sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2451BECA0();
  uint64_t v12 = sub_2451A1298(v11, (uint64_t)qword_268ECC6A0);
  os_log_type_t v13 = sub_2451BEF30();
  id v14 = a1;
  id v15 = a1;
  long long v16 = sub_2451BEC80();
  if (os_log_type_enabled(v16, v13))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v40 = a2;
    id v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v39 = a4;
    uint64_t v20 = v19;
    v44[0] = v19;
    uint64_t v37 = v12;
    unint64_t v38 = v10;
    *(_DWORD *)id v18 = 136315138;
    swift_getErrorValue();
    uint64_t v21 = sub_2451BF050();
    *(void *)&long long v42 = sub_2451B6A18(v21, v22, v44);
    uint64_t v10 = v38;
    sub_2451BEF80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24519C000, v16, v13, "XPC error %s encountered", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v20;
    a4 = v39;
    MEMORY[0x245699AC0](v23, -1, -1);
    MEMORY[0x245699AC0](v18, -1, -1);
  }
  else
  {
  }
  sub_2451AAE9C(v6 + 8, (uint64_t)&v42);
  if (v43)
  {
    sub_2451AAF64(&v42, (uint64_t)v44);
    uint64_t v24 = sub_2451BEEB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v10, 1, 1, v24);
    sub_2451AB1B8((uint64_t)v44, (uint64_t)&v42);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = 0;
    *(void *)(v25 + 24) = 0;
    sub_2451AAF64(&v42, v25 + 32);
    sub_2451AD7C8((uint64_t)v10, a4, v25);
    swift_release();
    sub_24519E3CC();
    uint64_t v26 = swift_allocError();
    *unint64_t v27 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *unint64_t v28 = v26;
    swift_continuation_throwingResumeWithError();
    return sub_2451A142C((uint64_t)v44);
  }
  else
  {
    sub_2451AAF04((uint64_t)&v42);
    os_log_type_t v30 = sub_2451BEF30();
    unint64_t v31 = sub_2451BEC80();
    os_log_type_t v32 = v30;
    if (os_log_type_enabled(v31, v30))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v33 = 0;
      _os_log_impl(&dword_24519C000, v31, v32, "No parent session", v33, 2u);
      MEMORY[0x245699AC0](v33, -1, -1);
    }

    sub_24519E3CC();
    uint64_t v34 = swift_allocError();
    *uint64_t v35 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v36 = v34;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451A858C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2451A816C(a1, a3, (uint64_t)&unk_26F9EA048, (uint64_t)&unk_268ECB7F0);
}

uint64_t sub_2451A85D4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2451A816C(a1, a3, (uint64_t)&unk_26F9EA228, (uint64_t)&unk_268ECB818);
}

uint64_t sub_2451A861C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2451A816C(a1, a3, (uint64_t)&unk_26F9EA020, (uint64_t)&unk_268ECB7E8);
}

uint64_t sub_2451A8664(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2451A816C(a1, a3, (uint64_t)&unk_26F9E9FF8, (uint64_t)&unk_268ECB7E0);
}

uint64_t sub_2451A86AC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2451A816C(a1, a3, (uint64_t)&unk_26F9E9FD0, (uint64_t)&unk_268ECB7D8);
}

uint64_t CredentialSession.acquirePresentmentAssertion()()
{
  v1[2] = v0;
  v1[3] = type metadata accessor for CredentialSession.State(0);
  v1[4] = swift_task_alloc();
  uint64_t v2 = swift_task_alloc();
  v1[5] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[6] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2451A87D0;
  return sub_2451AEFC4(v2);
}

uint64_t sub_2451A87D0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451A88E0, v1, 0);
}

uint64_t sub_2451A88E0()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  swift_storeEnumTagMultiPayload();
  char v3 = _s23SecureElementCredential0C7SessionC5StateO2eeoiySbAE_AEtFZ_0(v2, v1);
  sub_2451AAC44(v1);
  sub_2451AAC44(v2);
  if (v3)
  {
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2451BECA0();
    sub_2451A1298(v4, (uint64_t)qword_268ECC6A0);
    uint64_t v5 = sub_2451BEC80();
    os_log_type_t v6 = sub_2451BEF30();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24519C000, v5, v6, "Acquiring assertion from invalid state is disallowed", v7, 2u);
      MEMORY[0x245699AC0](v7, -1, -1);
    }

    sub_24519E3CC();
    swift_allocError();
    *uint64_t v8 = 3;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    os_log_type_t v13 = (uint64_t (*)(uint64_t))((char *)&dword_268ECBAB8 + dword_268ECBAB8);
    swift_retain();
    uint64_t v11 = (void *)swift_task_alloc();
    v0[7] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_2451A8AFC;
    uint64_t v12 = v0[2];
    return v13(v12);
  }
}

uint64_t sub_2451A8AFC(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = swift_task_dealloc();
  os_log_type_t v6 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v1) {
    uint64_t v5 = a1;
  }
  return v6(v5);
}

uint64_t sub_2451A8C44(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 224) = a1;
  *(void *)(v2 + 232) = a2;
  return MEMORY[0x270FA2498](sub_2451A8C60, a2, 0);
}

uint64_t sub_2451A8C60()
{
  if (qword_268ECB5C8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 240) = qword_268ECC6C8;
  return MEMORY[0x270FA2498](sub_2451A8CFC, 0, 0);
}

uint64_t sub_2451A8CFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0;
  char v3 = v0 + 2;
  v1[2] = v2;
  v1[7] = v1 + 27;
  v1[3] = sub_2451A8F10;
  uint64_t v4 = swift_continuation_init();
  sub_2451BD558();
  os_log_type_t v6 = v5;
  uint64_t v7 = (void **)(v1 + 26);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  v1[14] = sub_2451AB198;
  v1[15] = v8;
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 1107296256;
  v1[12] = sub_24519E644;
  v1[13] = &unk_26F9EA1A0;
  uint64_t v9 = _Block_copy(v1 + 10);
  swift_release();
  id v10 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);

  sub_2451BEFA0();
  swift_unknownObjectRelease();
  sub_24519E6AC(&qword_268ECB5F0);
  if ((swift_dynamicCast() & 1) == 0) {
    *uint64_t v7 = 0;
  }
  sub_2451A938C(v7, v4);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA23F0](v3);
}

uint64_t sub_2451A8F10()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)v0;
  if (*(void *)(*(void *)v0 + 48))
  {
    swift_willThrow();
    char v3 = (uint64_t (*)(void))v2[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v1[29];
    v1[31] = v1[27];
    return MEMORY[0x270FA2498](sub_2451A905C, v5, 0);
  }
}

uint64_t sub_2451A905C()
{
  uint64_t v21 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  swift_retain_n();
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF10();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v20 = v5;
    sub_2451BEC70();
    sub_2451AB130();
    uint64_t v6 = sub_2451BF020();
    v0[25] = sub_2451B6A18(v6, v7, &v20);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24519C000, v2, v3, "Credential Session [%s] acquired presentment intent assertion", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v5, -1, -1);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v9 = (uint64_t **)v0[28];
  uint64_t v8 = v0[29];
  uint64_t v10 = type metadata accessor for CredentialSession(0);
  v0[19] = v10;
  v0[20] = &off_26F9E9F20;
  v0[16] = v8;
  type metadata accessor for CredentialSession.PresentmentIntentAssertion();
  uint64_t v11 = (uint64_t *)swift_allocObject();
  uint64_t v12 = sub_2451AB0E0((uint64_t)(v0 + 16), v10);
  uint64_t v13 = *(void *)(v10 - 8);
  uint64_t v14 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 16))(v14, v12, v10);
  uint64_t v15 = *v14;
  swift_retain();
  uint64_t v16 = swift_unknownObjectRetain();
  uint64_t v17 = sub_2451AAAC0(v16, v15, v11);
  sub_2451A142C((uint64_t)(v0 + 16));
  swift_task_dealloc();
  *(void *)(v8 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = v17;
  swift_retain();
  swift_release();
  swift_unknownObjectRelease();
  void *v9 = v17;
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_2451A938C(void **a1, uint64_t a2)
{
  os_log_type_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_2451AB1B0;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451AD974;
    v10[3] = &unk_26F9EA1F0;
    uint64_t v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_acquirePresentmentIntentAssertionWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 12;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

void sub_2451A94F4(void *a1, id a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = a2;
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2451BECA0();
    sub_2451A1298(v5, (uint64_t)qword_268ECC6A0);
    uint64_t v6 = sub_2451BEC80();
    os_log_type_t v7 = sub_2451BEF10();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24519C000, v6, v7, "Did not obtain presentment intent assertion", v8, 2u);
      MEMORY[0x245699AC0](v8, -1, -1);
    }

    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    void *v9 = a2;
    swift_continuation_throwingResumeWithError();
  }
  else if (a1)
  {
    **(void **)(*(void *)(a3 + 64) + 40) = swift_dynamicCastObjCProtocolUnconditional();
    id v11 = a1;
    swift_continuation_throwingResume();
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2451BECA0();
    sub_2451A1298(v12, (uint64_t)qword_268ECC6A0);
    uint64_t v13 = sub_2451BEC80();
    os_log_type_t v14 = sub_2451BEF20();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24519C000, v13, v14, "Successfully obtained presentment intent assertion", v15, 2u);
      MEMORY[0x245699AC0](v15, -1, -1);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t CredentialSession.PresentmentIntentAssertion.relinquish()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2451A9778, 0, 0);
}

uint64_t sub_2451A9778()
{
  id v4 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268ECBAB0 + dword_268ECBAB0);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2451A9828;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4((uint64_t)v4, v2);
}

uint64_t sub_2451A9828()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24519FF38;
  }
  else {
    uint64_t v2 = sub_2451A993C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451A993C()
{
  uint64_t v1 = sub_2451A7E24((void *)(*(void *)(v0 + 16) + 64), *(void *)(*(void *)(v0 + 16) + 88));
  uint64_t v2 = *v1;
  *(void *)(v0 + 40) = *v1;
  return MEMORY[0x270FA2498](sub_2451A99B0, v2, 0);
}

uint64_t sub_2451A99B0()
{
  *(void *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451A9A28(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 256) = a2;
  return MEMORY[0x270FA2498](sub_2451A9A48, 0, 0);
}

uint64_t sub_2451A9A48()
{
  uint64_t v1 = *(void *)(v0 + 256) + 16;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  return MEMORY[0x270FA2498](sub_2451A9AD4, 0, 0);
}

uint64_t sub_2451A9AD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_2451A9D1C;
  uint64_t v3 = swift_continuation_init();
  uint64_t v4 = *(void **)(v1 + 80);
  if (v4)
  {
    uint64_t v5 = (void **)(v1 + 248);
    sub_2451A12D0(v1 + 80, v1 + 176);
    uint64_t v6 = swift_allocObject();
    long long v7 = *(_OWORD *)(v1 + 192);
    *(_OWORD *)(v6 + 16) = *(_OWORD *)(v1 + 176);
    *(_OWORD *)(v6 + 32) = v7;
    *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 208);
    *(void *)(v6 + 64) = v3;
    *(void *)(v1 + 160) = sub_2451AB080;
    *(void *)(v1 + 168) = v6;
    *(void *)(v1 + 128) = MEMORY[0x263EF8330];
    *(void *)(v1 + 136) = 1107296256;
    *(void *)(v1 + 144) = sub_24519E644;
    *(void *)(v1 + 152) = &unk_26F9EA100;
    uint64_t v8 = _Block_copy((const void *)(v1 + 128));
    swift_unknownObjectRetain();
    swift_release();
    id v9 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB7A8);
    if ((swift_dynamicCast() & 1) == 0) {
      void *v5 = 0;
    }
    sub_2451A9ED0(v5, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v10 = swift_allocError();
    *id v11 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v12 = v10;
    swift_continuation_throwingResumeWithError();
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2451A9D1C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 264) = v3;
  if (v3)
  {
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_2451A9E6C, 0, 0);
  }
  else
  {
    sub_2451A133C(v1 + 80);
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_2451A9E6C()
{
  sub_2451A133C(v0 + 80);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451A9ED0(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_2451AB0D8;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BB048;
    v10[3] = &unk_26F9EA150;
    uint64_t v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_relinquishAssertionWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 21;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

BOOL static CredentialSession.PresentmentIntentAssertion.State.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CredentialSession.PresentmentIntentAssertion.State.hash(into:)()
{
  return sub_2451BF0B0();
}

uint64_t CredentialSession.PresentmentIntentAssertion.State.hashValue.getter()
{
  return sub_2451BF0C0();
}

uint64_t CredentialSession.PresentmentIntentAssertion.state.getter(uint64_t a1)
{
  *(void *)(v2 + 264) = a1;
  *(void *)(v2 + 272) = v1;
  return MEMORY[0x270FA2498](sub_2451AA0E4, 0, 0);
}

uint64_t sub_2451AA0E4()
{
  uint64_t v1 = *(void *)(v0 + 272) + 16;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  return MEMORY[0x270FA2498](sub_2451AA170, 0, 0);
}

uint64_t sub_2451AA170()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  v0[2] = v0;
  v0[7] = v0 + 32;
  v0[3] = sub_2451AA3C0;
  uint64_t v3 = swift_continuation_init();
  uint64_t v4 = (void *)v1[10];
  if (v4)
  {
    uint64_t v5 = (void **)(v1 + 31);
    sub_2451A12D0((uint64_t)(v1 + 10), (uint64_t)(v1 + 22));
    uint64_t v6 = swift_allocObject();
    long long v7 = *((_OWORD *)v1 + 12);
    *(_OWORD *)(v6 + 16) = *((_OWORD *)v1 + 11);
    *(_OWORD *)(v6 + 32) = v7;
    *(_OWORD *)(v6 + 48) = *((_OWORD *)v1 + 13);
    *(void *)(v6 + 64) = v3;
    v1[20] = sub_2451AACA4;
    v1[21] = v6;
    v1[16] = MEMORY[0x263EF8330];
    v1[17] = 1107296256;
    v1[18] = sub_24519E644;
    v1[19] = &unk_26F9E9EE8;
    uint64_t v8 = _Block_copy(v1 + 16);
    swift_unknownObjectRetain();
    swift_release();
    id v9 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB7A8);
    if ((swift_dynamicCast() & 1) == 0) {
      void *v5 = 0;
    }
    sub_2451AA5B0(v5, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v10 = swift_allocError();
    *id v11 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v12 = v10;
    swift_continuation_throwingResumeWithError();
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2451AA3C0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 280) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2451AA538;
  }
  else
  {
    *(void *)(v1 + 288) = *(void *)(v1 + 256);
    sub_2451A133C(v1 + 80);
    uint64_t v3 = sub_2451AA4EC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2451AA4EC()
{
  unint64_t v1 = *(void *)(v0 + 288);
  if (v1 > 1)
  {
    *(void *)(v0 + 80) = v1;
    return MEMORY[0x270F9FA68](&type metadata for SECPresentmentIntentAssertionState, v0 + 80, &type metadata for SECPresentmentIntentAssertionState, MEMORY[0x263F8D6C8]);
  }
  else
  {
    **(unsigned char **)(v0 + 264) = v1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2451AA538()
{
  unint64_t v1 = *(void **)(v0 + 280);
  sub_2451A133C(v0 + 80);

  **(unsigned char **)(v0 + 264) = 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2451AA5B0(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v11[4] = sub_2451AB050;
    v11[5] = v4;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_2451AA798;
    v11[3] = &unk_26F9EA088;
    uint64_t v5 = _Block_copy(v11);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_getAssertionStateWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2451BECA0();
    sub_2451A1298(v7, (uint64_t)qword_268ECC6A0);
    uint64_t v8 = sub_2451BEC80();
    os_log_type_t v9 = sub_2451BEF10();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_24519C000, v8, v9, "Internal assertion has been invalidated", v10, 2u);
      MEMORY[0x245699AC0](v10, -1, -1);
    }

    **(void **)(*(void *)(a2 + 64) + 40) = 1;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2451AA798(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t CredentialSession.PresentmentIntentAssertion.deinit()
{
  sub_2451A133C(v0 + 16);
  sub_2451A142C(v0 + 64);
  return v0;
}

uint64_t CredentialSession.PresentmentIntentAssertion.__deallocating_deinit()
{
  sub_2451A133C(v0 + 16);
  sub_2451A142C(v0 + 64);

  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t sub_2451AA854()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2451AA874, 0, 0);
}

uint64_t sub_2451AA874()
{
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF10();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24519C000, v2, v3, "PresentmentIntentAssertion invalidated", v4, 2u);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 16);

  uint64_t v6 = sub_2451A7E24((void *)(v5 + 64), *(void *)(v5 + 88));
  uint64_t v7 = *v6;
  *(void *)(v0 + 24) = *v6;
  return MEMORY[0x270FA2498](sub_2451AA9A4, v7, 0);
}

uint64_t sub_2451AA9A4()
{
  *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451AAA18()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24519EE5C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2451AA874, 0, 0);
}

uint64_t *sub_2451AAAC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  v14[3] = type metadata accessor for CredentialSession(0);
  v14[4] = &off_26F9E9F20;
  v14[0] = a2;
  sub_2451AB1B8((uint64_t)v14, (uint64_t)(a3 + 8));
  uint64_t v13 = 0;
  memset(v12, 0, sizeof(v12));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  sub_2451AB21C((uint64_t)v12, (uint64_t)&v9 + 8);
  long long v6 = v10;
  *((_OWORD *)a3 + 1) = v9;
  *((_OWORD *)a3 + 2) = v6;
  *((_OWORD *)a3 + 3) = v11;
  uint64_t v7 = swift_dynamicCastObjCProtocolUnconditional();
  swift_beginAccess();
  *((void *)&v10 + 1) = v5;
  *(void *)&long long v11 = &off_26F9E9F10;
  *(void *)&long long v9 = a3;
  swift_unknownObjectRetain_n();
  swift_retain_n();
  swift_unknownObjectRelease();
  a3[2] = v7;
  sub_2451AAF04((uint64_t)(a3 + 3));
  sub_2451AB1B8((uint64_t)&v9, (uint64_t)(a3 + 3));
  sub_2451A142C((uint64_t)&v9);
  swift_endAccess();
  swift_unknownObjectRelease_n();
  sub_2451A142C((uint64_t)v14);
  swift_release();
  return a3;
}

uint64_t sub_2451AAC44(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CredentialSession.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2451AACA4(void *a1)
{
  return sub_2451A816C(a1, *(void *)(v1 + 64), (uint64_t)&unk_26F9EA0C0, (uint64_t)&unk_268ECB7F8);
}

uint64_t sub_2451AACEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2451AACFC()
{
  return swift_release();
}

unint64_t sub_2451AAD08()
{
  unint64_t result = qword_268ECB7B0;
  if (!qword_268ECB7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB7B0);
  }
  return result;
}

uint64_t type metadata accessor for CredentialSession.PresentmentIntentAssertion()
{
  return self;
}

uint64_t method lookup function for CredentialSession.PresentmentIntentAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CredentialSession.PresentmentIntentAssertion);
}

unsigned char *_s26PresentmentIntentAssertionC5StateOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2451AAE64);
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

ValueMetadata *type metadata accessor for CredentialSession.PresentmentIntentAssertion.State()
{
  return &type metadata for CredentialSession.PresentmentIntentAssertion.State;
}

uint64_t sub_2451AAE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24519E6AC(&qword_268ECB7D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2451AAF04(uint64_t a1)
{
  uint64_t v2 = sub_24519E6AC(&qword_268ECB7D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2451AAF64(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2451AAF80(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_2451A153C;
  return sub_2451A7C10(a1, v4, v5, v1 + 32);
}

uint64_t sub_2451AB040()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451AB050(uint64_t a1)
{
  **(void **)(*(void *)(*(void *)(v1 + 16) + 64) + 40) = a1;
  return swift_continuation_throwingResume();
}

uint64_t sub_2451AB080(void *a1)
{
  return sub_2451A816C(a1, *(void *)(v1 + 64), (uint64_t)&unk_26F9EA048, (uint64_t)&unk_268ECB7F0);
}

uint64_t sub_2451AB0C8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451AB0D8(void *a1)
{
  return sub_2451A11FC(a1);
}

uint64_t sub_2451AB0E0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_2451AB130()
{
  unint64_t result = qword_268ECB810;
  if (!qword_268ECB810)
  {
    sub_2451BEC70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB810);
  }
  return result;
}

uint64_t sub_2451AB188()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451AB198(uint64_t a1)
{
  return sub_24519E734(a1, *(void *)(v1 + 16));
}

uint64_t sub_2451AB1A0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2451AB1B0(void *a1, void *a2)
{
  sub_2451A94F4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2451AB1B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2451AB21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24519E6AC(&qword_268ECB7D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2451AB288()
{
  swift_unknownObjectRelease();
  sub_2451A142C(v0 + 32);

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2451AB2F0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v5;
  void *v5 = v2;
  v5[1] = sub_2451AB394;
  return sub_24519FF50(a1, a2);
}

uint64_t sub_2451AB394()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2451AB50C;
  }
  else {
    uint64_t v2 = sub_2451AB4A8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451AB4A8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451AB50C()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 56);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  int v3 = swift_dynamicCast();
  uint64_t v4 = *(void **)(v0 + 56);
  if (v3)
  {

    uint64_t v5 = *(void *)(v0 + 24);
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2451BECA0();
    sub_2451A1298(v6, (uint64_t)qword_268ECC6A0);
    uint64_t v7 = sub_2451BEC80();
    os_log_type_t v8 = sub_2451BEF30();
    if (os_log_type_enabled(v7, v8))
    {
      long long v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v18 = v10;
      *(_DWORD *)long long v9 = 136315138;
      uint64_t v11 = sub_2451BED10();
      *(void *)(v0 + 32) = sub_2451B6A18(v11, v12, &v18);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24519C000, v7, v8, "Throwing public error for internal error with description %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v10, -1, -1);
      MEMORY[0x245699AC0](v9, -1, -1);
    }

    sub_24519E3CC();
    swift_allocError();
    sub_2451B0E10(v5, v13);
    swift_willThrow();
    uint64_t v14 = *(void **)(v0 + 16);
  }
  else
  {

    sub_24519E3CC();
    swift_allocError();
    *uint64_t v15 = 21;
    swift_willThrow();
    uint64_t v14 = v4;
  }

  swift_release();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_2451AB79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[22] = a3;
  v4[23] = a4;
  v4[21] = a2;
  return MEMORY[0x270FA2498](sub_2451AB7BC, a2, 0);
}

uint64_t sub_2451AB7BC()
{
  uint64_t v1 = *(void *)(v0 + 168) + 112;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2451AB860, 0, 0);
}

uint64_t sub_2451AB860()
{
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v1 = *(void *)(v0 + 184);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_2451AB914;
  uint64_t v3 = swift_continuation_init();
  sub_2451A7E68(v3, (void **)(v0 + 80), v2, v1);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2451AB914()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 192) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2451ABAA8;
  }
  else
  {
    sub_2451A133C(v1 + 80);
    uint64_t v3 = sub_2451ABA38;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2451ABA38()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451ABAA8()
{
  uint64_t v1 = *(void *)(v0 + 168);
  sub_2451A133C(v0 + 80);
  return MEMORY[0x270FA2498](sub_2451ABB14, v1, 0);
}

uint64_t sub_2451ABB14()
{
  return MEMORY[0x270FA2498](sub_2451ABB30, 0, 0);
}

uint64_t sub_2451ABB30()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 192);
  *(void *)(v0 + 80) = v1;
  id v2 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  int v3 = swift_dynamicCast();
  uint64_t v4 = *(void **)(v0 + 192);
  if (v3)
  {

    uint64_t v5 = *(void *)(v0 + 152);
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2451BECA0();
    sub_2451A1298(v6, (uint64_t)qword_268ECC6A0);
    uint64_t v7 = sub_2451BEC80();
    os_log_type_t v8 = sub_2451BEF30();
    if (os_log_type_enabled(v7, v8))
    {
      long long v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v18 = v10;
      *(_DWORD *)long long v9 = 136315138;
      uint64_t v11 = sub_2451BED10();
      *(void *)(v0 + 160) = sub_2451B6A18(v11, v12, &v18);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24519C000, v7, v8, "Throwing public error for internal error with description %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v10, -1, -1);
      MEMORY[0x245699AC0](v9, -1, -1);
    }

    sub_24519E3CC();
    swift_allocError();
    sub_2451B0E10(v5, v13);
    swift_willThrow();
    uint64_t v14 = *(void **)(v0 + 80);
  }
  else
  {

    sub_24519E3CC();
    swift_allocError();
    *uint64_t v15 = 21;
    swift_willThrow();
    uint64_t v14 = v4;
  }

  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_2451ABDD0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v5;
  void *v5 = v2;
  v5[1] = sub_2451ABE74;
  return sub_2451A1EC8(a1, a2);
}

uint64_t sub_2451ABE74()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2451BAFF8;
  }
  else {
    uint64_t v2 = sub_2451BB040;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451ABF88(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v5;
  void *v5 = v2;
  v5[1] = sub_2451ABE74;
  return sub_2451A9A28(a1, a2);
}

uint64_t sub_2451AC02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[24] = a3;
  v4[25] = a4;
  v4[22] = a1;
  v4[23] = a2;
  return MEMORY[0x270FA2498](sub_2451AC04C, a2, 0);
}

uint64_t sub_2451AC04C()
{
  uint64_t v2 = v0[24];
  unint64_t v1 = v0[25];
  uint64_t v3 = v0[23] + 112;
  swift_beginAccess();
  sub_2451A12D0(v3, (uint64_t)(v0 + 10));
  sub_24519F9C4(v2, v1);
  return MEMORY[0x270FA2498](sub_2451AC0F0, 0, 0);
}

uint64_t sub_2451AC0F0()
{
  uint64_t v2 = *(void *)(v0 + 192);
  unint64_t v1 = *(void *)(v0 + 200);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 152;
  *(void *)(v0 + 24) = sub_2451AC1B0;
  uint64_t v3 = swift_continuation_init();
  sub_2451A7EC0(v3, (void **)(v0 + 80), v2, v1);
  sub_2451A14C4(v2, v1);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2451AC1B0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 208) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2451AC354;
  }
  else
  {
    *(_OWORD *)*(void *)(v1 + 176) = *(_OWORD *)(v1 + 152);
    sub_2451A133C(v1 + 80);
    uint64_t v3 = sub_2451AC2E0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2451AC2E0()
{
  uint64_t v1 = v0[24];
  unint64_t v2 = v0[25];
  swift_release();
  sub_2451A14C4(v1, v2);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2451AC354()
{
  uint64_t v1 = *(void *)(v0 + 184);
  sub_2451A133C(v0 + 80);
  return MEMORY[0x270FA2498](sub_2451AC3C0, v1, 0);
}

uint64_t sub_2451AC3C0()
{
  return MEMORY[0x270FA2498](sub_2451AC3DC, 0, 0);
}

uint64_t sub_2451AC3DC()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void **)(v0 + 208);
  *(void *)(v0 + 80) = v1;
  id v2 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  int v3 = swift_dynamicCast();
  uint64_t v4 = *(void **)(v0 + 208);
  if (v3)
  {

    uint64_t v5 = *(void *)(v0 + 152);
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2451BECA0();
    sub_2451A1298(v6, (uint64_t)qword_268ECC6A0);
    uint64_t v7 = sub_2451BEC80();
    os_log_type_t v8 = sub_2451BEF30();
    if (os_log_type_enabled(v7, v8))
    {
      long long v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v20 = v10;
      *(_DWORD *)long long v9 = 136315138;
      uint64_t v11 = sub_2451BED10();
      *(void *)(v0 + 168) = sub_2451B6A18(v11, v12, &v20);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24519C000, v7, v8, "Throwing public error for internal error with description %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v10, -1, -1);
      MEMORY[0x245699AC0](v9, -1, -1);
    }

    uint64_t v14 = *(void *)(v0 + 192);
    unint64_t v13 = *(void *)(v0 + 200);
    sub_24519E3CC();
    swift_allocError();
    sub_2451B0E10(v5, v15);
    swift_willThrow();
    uint64_t v16 = *(void **)(v0 + 80);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 192);
    unint64_t v13 = *(void *)(v0 + 200);

    sub_24519E3CC();
    swift_allocError();
    *uint64_t v17 = 21;
    swift_willThrow();
    uint64_t v16 = v4;
  }

  swift_release();
  sub_2451A14C4(v14, v13);
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_2451AC680(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v3;
  *int v3 = v1;
  v3[1] = sub_2451AC724;
  return sub_2451A8C44(v1 + 16, a1);
}

uint64_t sub_2451AC724()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_2451AC8A0;
  }
  else {
    id v2 = sub_2451AC838;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451AC838()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2451AC8A0()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 64);
  *(void *)(v0 + 24) = v1;
  id v2 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  int v3 = swift_dynamicCast();
  uint64_t v4 = *(void **)(v0 + 64);
  if (v3)
  {

    uint64_t v5 = *(void *)(v0 + 32);
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2451BECA0();
    sub_2451A1298(v6, (uint64_t)qword_268ECC6A0);
    uint64_t v7 = sub_2451BEC80();
    os_log_type_t v8 = sub_2451BEF30();
    if (os_log_type_enabled(v7, v8))
    {
      long long v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v18 = v10;
      *(_DWORD *)long long v9 = 136315138;
      uint64_t v11 = sub_2451BED10();
      *(void *)(v0 + 40) = sub_2451B6A18(v11, v12, &v18);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24519C000, v7, v8, "Throwing public error for internal error with description %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v10, -1, -1);
      MEMORY[0x245699AC0](v9, -1, -1);
    }

    sub_24519E3CC();
    swift_allocError();
    sub_2451B0E10(v5, v13);
    swift_willThrow();
    uint64_t v14 = *(void **)(v0 + 24);
  }
  else
  {

    sub_24519E3CC();
    swift_allocError();
    *uint64_t v15 = 21;
    swift_willThrow();
    uint64_t v14 = v4;
  }

  swift_release();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_2451ACB30()
{
  return MEMORY[0x270FA2498](sub_2451ACB4C, 0, 0);
}

uint64_t sub_2451ACB4C()
{
  type metadata accessor for CredentialSession(0);
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 40) = v1;
  CredentialSession.init()();
  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *id v2 = v0;
  v2[1] = sub_2451ACC14;
  v2[19] = v1;
  return MEMORY[0x270FA2498](sub_2451ADDB8, v1, 0);
}

uint64_t sub_2451ACC14()
{
  id v2 = (void *)*v1;
  v2[7] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2451ACD4C, 0, 0);
  }
  else
  {
    int v3 = (uint64_t (*)(uint64_t))v2[1];
    uint64_t v4 = v2[5];
    return v3(v4);
  }
}

uint64_t sub_2451ACD4C()
{
  uint64_t v20 = v0;
  uint64_t v1 = (void *)v0[7];
  swift_release();
  v0[2] = v1;
  id v2 = (id *)(v0 + 2);
  id v3 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  int v4 = swift_dynamicCast();
  uint64_t v5 = (void *)v0[7];
  if (v4)
  {

    uint64_t v6 = v0[3];
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2451BECA0();
    sub_2451A1298(v7, (uint64_t)qword_268ECC6A0);
    os_log_type_t v8 = sub_2451BEC80();
    os_log_type_t v9 = sub_2451BEF30();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v19 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v12 = sub_2451BED10();
      v0[4] = sub_2451B6A18(v12, v13, &v19);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24519C000, v8, v9, "Throwing public error for internal error with description %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v11, -1, -1);
      MEMORY[0x245699AC0](v10, -1, -1);
    }

    sub_24519E3CC();
    swift_allocError();
    sub_2451B0E10(v6, v14);
    swift_willThrow();
    id v15 = *v2;
  }
  else
  {

    sub_24519E3CC();
    swift_allocError();
    unsigned char *v16 = 21;
    swift_willThrow();
    id v15 = v5;
  }

  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_2451ACFEC(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v3;
  *id v3 = v1;
  v3[1] = sub_2451AD090;
  return sub_2451BB288(v1 + 16, a1);
}

uint64_t sub_2451AD090()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_2451BAFFC;
  }
  else {
    id v2 = sub_2451BB024;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451AD1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a1;
  uint64_t v3 = sub_24519E6AC(&qword_268ECB850);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24519E6AC(&qword_268ECB858);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24519E6AC(&qword_268ECB868);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v20 - v15;
  uint64_t v17 = sub_24519E6AC(&qword_268ECB860);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v3);
  uint64_t v24 = v16;
  type metadata accessor for CredentialSession.Event(0);
  sub_2451BEEE0();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v23, v10, v7);
  sub_2451B7120((uint64_t)v16, (uint64_t)v14, &qword_268ECB868);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v14, v17);
    return sub_2451BAEB8((uint64_t)v16, &qword_268ECB868);
  }
  return result;
}

uint64_t sub_2451AD4A4(uint64_t a1, uint64_t a2)
{
  sub_2451BAEB8(a2, &qword_268ECB868);
  uint64_t v4 = sub_24519E6AC(&qword_268ECB860);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t sub_2451AD574(uint64_t a1, void **a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  return sub_2451AD5C4(a1, a2, a3, a4, (uint64_t)&unk_26F9EA938, (uint64_t)sub_2451BB004, (uint64_t)&unk_26F9EA950);
}

uint64_t sub_2451AD59C(uint64_t a1, void **a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  return sub_2451AD5C4(a1, a2, a3, a4, (uint64_t)&unk_26F9EA848, (uint64_t)sub_2451BADC8, (uint64_t)&unk_26F9EA860);
}

uint64_t sub_2451AD5C4(uint64_t a1, void **a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = *a2;
  if (*a2)
  {
    sub_2451A12D0((uint64_t)a2, (uint64_t)v21);
    uint64_t v12 = swift_allocObject();
    long long v13 = v21[1];
    *(_OWORD *)(v12 + 16) = v21[0];
    *(_OWORD *)(v12 + 32) = v13;
    *(_OWORD *)(v12 + 48) = v21[2];
    *(void *)(v12 + 64) = a1;
    v20[4] = a6;
    v20[5] = v12;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 1107296256;
    v20[2] = sub_24519E644;
    v20[3] = a7;
    uint64_t v14 = _Block_copy(v20);
    swift_unknownObjectRetain();
    swift_release();
    id v15 = objc_msgSend(v8, sel_synchronousRemoteObjectProxyWithErrorHandler_, v14);
    _Block_release(v14);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB6B8);
    if ((swift_dynamicCast() & 1) == 0) {
      v20[0] = 0;
    }
    a3(v20, a1);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v17 = swift_allocError();
    *uint64_t v18 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v19 = v17;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451AD7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2451BEEB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2451BEEA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2451BAEB8(a1, &qword_268ECB7C8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451BEE90();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2451AD974(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t static CredentialSession.startSession()()
{
  uint64_t v1 = sub_2451BECB0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451ADABC, 0, 0);
}

uint64_t sub_2451ADABC()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F65F90], v3);
  char v4 = sub_2451BECC0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    uint64_t v9 = (uint64_t (__cdecl *)())((char *)&dword_268ECB828 + dword_268ECB828);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[5] = v5;
    void *v5 = v0;
    v5[1] = sub_2451ADC34;
    return v9();
  }
  else
  {
    sub_24519E3CC();
    swift_allocError();
    *id v7 = 15;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_2451ADC34(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  uint64_t v5 = swift_task_dealloc();
  id v6 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v1) {
    uint64_t v5 = a1;
  }
  return v6(v5);
}

uint64_t CredentialSession.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  CredentialSession.init()();
  return v0;
}

uint64_t sub_2451ADD98()
{
  *(void *)(v1 + 152) = v0;
  return MEMORY[0x270FA2498](sub_2451ADDB8, v0, 0);
}

uint64_t sub_2451ADDB8()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionStarted;
  v0[20] = OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionStarted;
  if (*(unsigned char *)(v1 + v2) == 1)
  {
    sub_24519E3CC();
    swift_allocError();
    *uint64_t v3 = 3;
    swift_willThrow();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    if (qword_268ECB5C8 != -1) {
      swift_once();
    }
    v0[21] = qword_268ECC6C8;
    swift_retain();
    return MEMORY[0x270FA2498](sub_2451ADEE8, 0, 0);
  }
}

uint64_t sub_2451ADEE8()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[19];
  v0[2] = v0;
  v0[7] = v0 + 10;
  v0[3] = sub_2451ADFA0;
  uint64_t v3 = swift_continuation_init();
  sub_2451BE560(v3, v1, v2);
  swift_release();
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2451ADFA0()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)v0;
  if (*(void *)(*(void *)v0 + 48))
  {
    swift_willThrow();
    uint64_t v3 = (uint64_t (*)(void))v2[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v1[19];
    v1[22] = v1[10];
    return MEMORY[0x270FA2498](sub_2451AE0EC, v5, 0);
  }
}

uint64_t sub_2451AE0EC()
{
  uint64_t v14 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  swift_retain_n();
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF10();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v13 = v5;
    sub_2451BEC70();
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v6 = sub_2451BF020();
    v0[10] = sub_2451B6A18(v6, v7, &v13);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24519C000, v2, v3, "Credential Session [%s] Start Success!", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v5, -1, -1);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v8 = v0[19];
  uint64_t v9 = v0[20];
  *(void *)(qword_268ECC6C8 + 32) = &off_26F9EA2F0;
  swift_unknownObjectWeakAssign();
  v0[18] = &unk_26F9ED888;
  uint64_t v10 = swift_dynamicCastObjCProtocolUnconditional();
  swift_beginAccess();
  v0[13] = type metadata accessor for CredentialSession(0);
  v0[14] = &off_26F9EA2E0;
  v0[10] = v8;
  swift_retain_n();
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  *(void *)(v8 + 112) = v10;
  sub_2451BAEB8(v8 + 120, &qword_268ECB7D0);
  sub_2451AB1B8((uint64_t)(v0 + 10), v8 + 120);
  sub_2451A142C((uint64_t)(v0 + 10));
  swift_unknownObjectRelease();
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_release();
  *(unsigned char *)(v8 + v9) = 1;
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_2451AE424()
{
  *(void *)(v1 + 288) = v0;
  return MEMORY[0x270FA2498](sub_2451AE444, v0, 0);
}

uint64_t sub_2451AE444()
{
  uint64_t v1 = *(void *)(v0 + 288) + 112;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  return MEMORY[0x270FA2498](sub_2451AE4D0, 0, 0);
}

uint64_t sub_2451AE4D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_2451AE718;
  uint64_t v3 = swift_continuation_init();
  uint64_t v4 = *(void **)(v1 + 80);
  if (v4)
  {
    uint64_t v5 = (void **)(v1 + 272);
    sub_2451A12D0(v1 + 80, v1 + 176);
    uint64_t v6 = swift_allocObject();
    long long v7 = *(_OWORD *)(v1 + 192);
    *(_OWORD *)(v6 + 16) = *(_OWORD *)(v1 + 176);
    *(_OWORD *)(v6 + 32) = v7;
    *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 208);
    *(void *)(v6 + 64) = v3;
    *(void *)(v1 + 160) = sub_2451A147C;
    *(void *)(v1 + 168) = v6;
    *(void *)(v1 + 128) = MEMORY[0x263EF8330];
    *(void *)(v1 + 136) = 1107296256;
    *(void *)(v1 + 144) = sub_24519E644;
    *(void *)(v1 + 152) = &unk_26F9EA268;
    uint64_t v8 = _Block_copy((const void *)(v1 + 128));
    swift_unknownObjectRetain();
    swift_release();
    id v9 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB6B8);
    if ((swift_dynamicCast() & 1) == 0) {
      void *v5 = 0;
    }
    sub_2451AED0C(v5, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v12 = v10;
    swift_continuation_throwingResumeWithError();
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2451AE718()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 296) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2451AE994;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 288);
    sub_2451A133C(v1 + 80);
    uint64_t v3 = sub_2451AE84C;
    uint64_t v4 = v5;
  }
  return MEMORY[0x270FA2498](v3, v4, 0);
}

uint64_t sub_2451AE84C()
{
  uint64_t v9 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF50();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24519C000, v2, v3, "signalInvalidationOnEventStream", v4, 2u);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 288);

  *(void *)(v5 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  unsigned __int8 v8 = 7;
  sub_2451B1614(&v8);
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2451AE994()
{
  uint64_t v1 = *(void *)(v0 + 288);
  sub_2451A133C(v0 + 80);
  return MEMORY[0x270FA2498](sub_2451AEA00, v1, 0);
}

uint64_t sub_2451AEA00()
{
  uint64_t v23 = v0;
  unint64_t v1 = 0x268ECB000uLL;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[37];
  uint64_t v3 = sub_2451BECA0();
  sub_2451A1298(v3, (uint64_t)qword_268ECC6A0);
  os_log_type_t v4 = sub_2451BEF30();
  id v5 = v2;
  id v6 = v2;
  uint64_t v7 = sub_2451BEC80();
  os_log_type_t v8 = v4;
  BOOL v9 = os_log_type_enabled(v7, v4);
  uint64_t v10 = (void *)v0[37];
  if (v9)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_getErrorValue();
    uint64_t v13 = sub_2451BF050();
    v0[10] = sub_2451B6A18(v13, v14, &v22);
    unint64_t v1 = 0x268ECB000;
    sub_2451BEF80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24519C000, v7, v8, "Error %s encountered when invalidating session", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v12, -1, -1);
    MEMORY[0x245699AC0](v11, -1, -1);
  }
  else
  {
  }
  if (*(void *)(v1 + 1472) != -1) {
    swift_once();
  }
  sub_2451A1298(v3, (uint64_t)qword_268ECC6A0);
  uint64_t v15 = sub_2451BEC80();
  os_log_type_t v16 = sub_2451BEF50();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_24519C000, v15, v16, "signalInvalidationOnEventStream", v17, 2u);
    MEMORY[0x245699AC0](v17, -1, -1);
  }
  uint64_t v18 = v0[36];

  *(void *)(v18 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  unsigned __int8 v21 = 7;
  sub_2451B1614(&v21);
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_2451AED0C(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_2451BAE50;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451AEE74;
    v10[3] = &unk_26F9EA900;
    id v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_endWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *os_log_type_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451AEE74(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_2451AEEB8()
{
  uint64_t v1 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2451BECA0();
  sub_2451A1298(v2, (uint64_t)qword_268ECC6A0);
  uint64_t v3 = sub_2451BEC80();
  os_log_type_t v4 = sub_2451BEF50();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_24519C000, v3, v4, "signalInvalidationOnEventStream", v5, 2u);
    MEMORY[0x245699AC0](v5, -1, -1);
  }

  *(void *)(v1 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  unsigned __int8 v6 = 7;
  sub_2451B1614(&v6);
}

uint64_t sub_2451AEFC4(uint64_t a1)
{
  v2[39] = a1;
  v2[40] = v1;
  sub_24519E6AC((uint64_t *)&unk_268ECB840);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for CredentialSession.Credential();
  v2[43] = v3;
  v2[44] = *(void *)(v3 - 8);
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451AF0D4, v1, 0);
}

uint64_t sub_2451AF0D4()
{
  uint64_t v1 = *(void *)(v0 + 320) + 112;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  return MEMORY[0x270FA2498](sub_2451AF160, 0, 0);
}

uint64_t sub_2451AF160()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  v0[2] = v0;
  v0[7] = v0 + 35;
  v0[3] = sub_2451AF3B4;
  uint64_t v3 = swift_continuation_init();
  os_log_type_t v4 = (void *)v1[10];
  if (v4)
  {
    uint64_t v5 = (void **)(v1 + 37);
    sub_2451A12D0((uint64_t)(v1 + 10), (uint64_t)(v1 + 22));
    uint64_t v6 = swift_allocObject();
    long long v7 = *((_OWORD *)v1 + 12);
    *(_OWORD *)(v6 + 16) = *((_OWORD *)v1 + 11);
    *(_OWORD *)(v6 + 32) = v7;
    *(_OWORD *)(v6 + 48) = *((_OWORD *)v1 + 13);
    *(void *)(v6 + 64) = v3;
    v1[20] = sub_2451B7114;
    v1[21] = v6;
    v1[16] = MEMORY[0x263EF8330];
    v1[17] = 1107296256;
    v1[18] = sub_24519E644;
    v1[19] = &unk_26F9EA2B8;
    os_log_type_t v8 = _Block_copy(v1 + 16);
    swift_unknownObjectRetain();
    swift_release();
    id v9 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB6B8);
    if ((swift_dynamicCast() & 1) == 0) {
      uint8_t *v5 = 0;
    }
    sub_2451AF9B4(v5, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v12 = v10;
    swift_continuation_throwingResumeWithError();
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2451AF3B4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 376) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2451AF894;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 320);
    *(_OWORD *)(v1 + 384) = *(_OWORD *)(v1 + 280);
    sub_2451A133C(v1 + 80);
    uint64_t v3 = sub_2451AF4F4;
    uint64_t v4 = v5;
  }
  return MEMORY[0x270FA2498](v3, v4, 0);
}

uint64_t sub_2451AF4F4()
{
  uint64_t v1 = *(void *)(v0 + 384);
  switch(v1)
  {
    case 0:
    case 1:

      goto LABEL_22;
    case 2:
      uint64_t v3 = *(void **)(v0 + 392);
      if (!v3) {
        goto LABEL_9;
      }
      uint64_t v4 = *(void *)(v0 + 344);
      uint64_t v5 = *(void *)(v0 + 352);
      uint64_t v6 = *(void *)(v0 + 336);
      id v7 = v3;
      sub_2451A2C6C(v7, v6);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) != 1)
      {
        uint64_t v21 = *(void *)(v0 + 368);
        uint64_t v22 = *(void *)(v0 + 336);
        uint64_t v23 = *(void *)(v0 + 312);

        sub_2451B70AC(v22, v21);
        sub_2451B70AC(v21, v23);
        goto LABEL_22;
      }
      sub_2451BAEB8(*(void *)(v0 + 336), (uint64_t *)&unk_268ECB840);
LABEL_9:
      if (qword_268ECB5C0 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_2451BECA0();
      sub_2451A1298(v8, (uint64_t)qword_268ECC6A0);
      id v9 = sub_2451BEC80();
      os_log_type_t v10 = sub_2451BEF50();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v11 = 0;
        uint64_t v12 = "No valid credential selected";
        goto LABEL_20;
      }
      goto LABEL_21;
    case 3:
      uint64_t v13 = *(void **)(v0 + 392);
      if (!v13) {
        goto LABEL_16;
      }
      uint64_t v14 = *(void *)(v0 + 344);
      uint64_t v15 = *(void *)(v0 + 352);
      uint64_t v16 = *(void *)(v0 + 328);
      id v17 = v13;
      sub_2451A2C6C(v17, v16);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v16, 1, v14) == 1)
      {
        sub_2451BAEB8(*(void *)(v0 + 328), (uint64_t *)&unk_268ECB840);
LABEL_16:
        if (qword_268ECB5C0 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_2451BECA0();
        sub_2451A1298(v18, (uint64_t)qword_268ECC6A0);
        id v9 = sub_2451BEC80();
        os_log_type_t v10 = sub_2451BEF50();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v11 = 0;
          uint64_t v12 = "No credential selected";
LABEL_20:
          _os_log_impl(&dword_24519C000, v9, v10, v12, v11, 2u);
          MEMORY[0x245699AC0](v11, -1, -1);
        }
LABEL_21:
        uint64_t v19 = *(void **)(v0 + 392);
      }
      else
      {
        uint64_t v24 = *(void *)(v0 + 360);
        uint64_t v25 = *(void *)(v0 + 328);
        uint64_t v26 = *(void *)(v0 + 312);

        sub_2451B70AC(v25, v24);
        sub_2451B70AC(v24, v26);
      }
LABEL_22:
      type metadata accessor for CredentialSession.State(0);
      swift_storeEnumTagMultiPayload();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
      return v20();
    default:
      *(void *)(v0 + 304) = v1;
      uint64_t v2 = MEMORY[0x263F8D6C8];
      return MEMORY[0x270F9FA68](&type metadata for SECSessionState, v0 + 304, &type metadata for SECSessionState, v2);
  }
}

uint64_t sub_2451AF894()
{
  uint64_t v1 = *(void *)(v0 + 320);
  sub_2451A133C(v0 + 80);
  return MEMORY[0x270FA2498](sub_2451AF900, v1, 0);
}

uint64_t sub_2451AF900()
{
  type metadata accessor for CredentialSession.State(0);
  swift_storeEnumTagMultiPayload();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451AF9B4(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_2451BADEC;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451AFB1C;
    v10[3] = &unk_26F9EA8B0;
    uint64_t v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_getSessionStateWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

void sub_2451AFB1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2451AFB94(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  uint64_t v3 = sub_24519E6AC(&qword_268ECB850);
  v2[17] = v3;
  v2[18] = *(void *)(v3 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v4 = sub_24519E6AC(&qword_268ECB858);
  v2[20] = v4;
  v2[21] = *(void *)(v4 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v5 = sub_24519E6AC(&qword_268ECB860);
  v2[23] = v5;
  v2[24] = *(void *)(v5 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  sub_24519E6AC(&qword_268ECB868);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  sub_24519E6AC(&qword_268ECB870);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451AFDA8, v1, 0);
}

uint64_t sub_2451AFDA8()
{
  unint64_t v44 = v0;
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[16] + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStream;
  swift_beginAccess();
  sub_2451B7120(v4, v1, &qword_268ECB870);
  uint64_t v5 = v0 + 30;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v6 = v0[28];
    uint64_t v8 = v0[23];
    uint64_t v7 = v0[24];
    uint64_t v9 = v0[16];
    sub_2451BAEB8(v0[30], &qword_268ECB870);
    uint64_t v10 = v9 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStreamContinuation;
    swift_beginAccess();
    uint64_t v40 = v10;
    sub_2451B7120(v10, v6, &qword_268ECB868);
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v8);
    uint64_t v12 = v0[28];
    uint64_t v41 = v4;
    if (v11)
    {
      sub_2451BAEB8(v12, &qword_268ECB868);
    }
    else
    {
      uint64_t v13 = v0[26];
      uint64_t v15 = v0[23];
      uint64_t v14 = v0[24];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v12, v15);
      sub_2451BAEB8(v12, &qword_268ECB868);
      sub_2451BEED0();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    }
    uint64_t v5 = v0 + 22;
    uint64_t v16 = v0[22];
    uint64_t v39 = v0[27];
    uint64_t v17 = v0[24];
    uint64_t v18 = v0[25];
    uint64_t v37 = v0[29];
    uint64_t v38 = v0[23];
    uint64_t v19 = v0[21];
    uint64_t v36 = v0[20];
    uint64_t v20 = v0[18];
    uint64_t v21 = v0[19];
    uint64_t v22 = v0[17];
    (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v21, *MEMORY[0x263F8F580], v22);
    sub_2451AD1A4(v16, v18, v21);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v37, v16, v36);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v37, 0, 1, v36);
    swift_beginAccess();
    sub_2451B7904(v37, v41, &qword_268ECB870);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v39, v18, v38);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v39, 0, 1, v38);
    swift_beginAccess();
    sub_2451B7904(v39, v40, &qword_268ECB868);
    swift_endAccess();
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_2451BECA0();
    sub_2451A1298(v23, (uint64_t)qword_268ECC6A0);
    os_log_type_t v24 = sub_2451BEF20();
    swift_retain_n();
    uint64_t v25 = sub_2451BEC80();
    BOOL v26 = os_log_type_enabled(v25, v24);
    uint64_t v28 = v0[24];
    uint64_t v27 = v0[25];
    uint64_t v29 = v0[23];
    if (v26)
    {
      uint64_t v42 = v0[23];
      os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v30 = 136315138;
      uint64_t v43 = v31;
      sub_2451BEC70();
      sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
      uint64_t v32 = sub_2451BF020();
      v0[14] = sub_2451B6A18(v32, v33, &v43);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24519C000, v25, v24, "[self=%s] eventStream init", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v31, -1, -1);
      MEMORY[0x245699AC0](v30, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v42);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    }
  }
  (*(void (**)(void, void, void))(v0[21] + 32))(v0[15], *v5, v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

uint64_t sub_2451B0370(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  sub_24519E6AC(&qword_268ECB870);
  v2[14] = swift_task_alloc();
  uint64_t v3 = sub_24519E6AC(&qword_268ECB850);
  v2[15] = v3;
  v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v4 = sub_24519E6AC(&qword_268ECB860);
  v2[18] = v4;
  v2[19] = *(void *)(v4 - 8);
  v2[20] = swift_task_alloc();
  uint64_t v5 = sub_24519E6AC(&qword_268ECB858);
  v2[21] = v5;
  v2[22] = *(void *)(v5 - 8);
  v2[23] = swift_task_alloc();
  sub_24519E6AC(&qword_268ECB868);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451B0564, v1, 0);
}

uint64_t sub_2451B0564()
{
  uint64_t v34 = v0;
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[13] + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2451B7120(v4, v1, &qword_268ECB868);
  uint64_t v5 = v0 + 25;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v5 = v0 + 20;
    uint64_t v6 = v0[20];
    uint64_t v31 = v0[24];
    uint64_t v7 = v0[22];
    uint64_t v8 = v0[23];
    *(void *)type = v0[19];
    uint64_t v9 = v0[17];
    uint64_t v30 = v0[18];
    uint64_t v11 = v0[15];
    uint64_t v10 = v0[16];
    uint64_t v26 = v0[14];
    uint64_t v27 = v0[21];
    uint64_t v28 = v0[13];
    sub_2451BAEB8(v0[25], &qword_268ECB868);
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v9, *MEMORY[0x263F8F580], v11);
    sub_2451AD1A4(v8, v6, v9);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v26, v8, v27);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v27);
    uint64_t v12 = v28 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStream;
    swift_beginAccess();
    sub_2451B7904(v26, v12, &qword_268ECB870);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)type + 16))(v31, v6, v30);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)type + 56))(v31, 0, 1, v30);
    swift_beginAccess();
    sub_2451B7904(v31, v4, &qword_268ECB868);
    swift_endAccess();
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2451BECA0();
    sub_2451A1298(v13, (uint64_t)qword_268ECC6A0);
    os_log_type_t v14 = sub_2451BEF20();
    swift_retain_n();
    uint64_t v15 = sub_2451BEC80();
    BOOL v16 = os_log_type_enabled(v15, v14);
    uint64_t v18 = v0[22];
    uint64_t v17 = v0[23];
    uint64_t v19 = v0[21];
    if (v16)
    {
      uint64_t v32 = v0[21];
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v33 = v21;
      sub_2451BEC70();
      sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
      uint64_t v22 = sub_2451BF020();
      v0[11] = sub_2451B6A18(v22, v23, &v33);
      sub_2451BEF80();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24519C000, v15, v14, "[%s]eventStreamContinuation init", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v21, -1, -1);
      MEMORY[0x245699AC0](v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v32);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
  }
  (*(void (**)(void, void, void))(v0[19] + 32))(v0[12], *v5, v0[18]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

BOOL static CredentialSession.NFCFieldInformation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CredentialSession.NFCFieldInformation.hash(into:)()
{
  return sub_2451BF0B0();
}

uint64_t CredentialSession.NFCFieldInformation.hashValue.getter()
{
  return sub_2451BF0C0();
}

uint64_t CredentialSession.ConnectivityEvent.instanceApplicationIdentifier.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24519F9C4(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t CredentialSession.ConnectivityEvent.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24519F9C4(v1, *(void *)(v0 + 24));
  return v1;
}

unint64_t CredentialSession.ErrorCode.failureReason.getter()
{
  unint64_t result = 0xD00000000000002CLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000033;
      break;
    case 2:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000044;
      break;
    case 4:
      unint64_t result = 0xD00000000000004BLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000058;
      break;
    case 6:
      unint64_t result = 0xD00000000000004ALL;
      break;
    case 7:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 8:
      unint64_t result = 0xD00000000000006BLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000021;
      break;
    case 0xA:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000020;
      break;
    case 0xC:
      unint64_t result = 0xD00000000000003ELL;
      break;
    case 0xD:
      unint64_t result = 0xD000000000000045;
      break;
    case 0xE:
      unint64_t result = 0xD00000000000002FLL;
      break;
    case 0xF:
    case 0x15:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000048;
      break;
    case 0x11:
      unint64_t result = 0x2064696C61766E49;
      break;
    case 0x12:
      unint64_t result = 0xD000000000000078;
      break;
    case 0x13:
      unint64_t result = 0xD00000000000005ALL;
      break;
    case 0x14:
      unint64_t result = 0xD000000000000020;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static CredentialSession.ErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CredentialSession.ErrorCode.hash(into:)()
{
  return sub_2451BF0B0();
}

uint64_t CredentialSession.ErrorCode.hashValue.getter()
{
  return sub_2451BF0C0();
}

BOOL sub_2451B0DDC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2451B0E10@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 5;
  switch(result)
  {
    case 1:
      break;
    case 3:
    case 5:
      char v2 = 6;
      break;
    case 7:
      char v2 = 4;
      break;
    case 8:
    case 9:
    case 29:
      char v2 = 12;
      break;
    case 10:
      char v2 = 3;
      break;
    case 11:
    case 13:
      char v2 = 11;
      break;
    case 15:
      sub_2451BEFF0();
      __break(1u);
      JUMPOUT(0x2451B0F10);
    case 18:
      char v2 = 10;
      break;
    case 22:
      char v2 = 1;
      break;
    case 24:
      char v2 = 13;
      break;
    case 26:
      char v2 = 14;
      break;
    case 27:
      char v2 = 16;
      break;
    case 28:
      char v2 = 19;
      break;
    case 32:
      char v2 = 18;
      break;
    default:
      char v2 = 21;
      break;
  }
  *a2 = v2;
  return result;
}

uint64_t sub_2451B0F90()
{
  uint64_t v0 = sub_2451BECA0();
  sub_2451BAF2C(v0, qword_268ECC6A0);
  sub_2451A1298(v0, (uint64_t)qword_268ECC6A0);
  return sub_2451BEC90();
}

_OWORD *CredentialSession.init()()
{
  uint64_t v1 = sub_2451BEC70();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  sub_2451B7904((uint64_t)v14, (uint64_t)&v11 + 8, &qword_268ECB7D0);
  long long v5 = v12;
  v0[7] = v11;
  v0[8] = v5;
  v0[9] = v13;
  uint64_t v6 = (char *)v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStreamContinuation;
  uint64_t v7 = sub_24519E6AC(&qword_268ECB860);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = (char *)v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStream;
  uint64_t v9 = sub_24519E6AC(&qword_268ECB858);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(void *)((char *)v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionStartedContinuation) = 0;
  *((unsigned char *)v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionStarted) = 0;
  *(void *)((char *)v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  sub_2451BEC60();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))((uint64_t)v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionIdentifier, v4, v1);
  return v0;
}

uint64_t static CredentialSession.== infix(_:_:)()
{
  return sub_2451BEC50();
}

uint64_t CredentialSession.deinit()
{
  sub_2451A133C(v0 + 112);
  sub_2451BAEB8(v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStreamContinuation, &qword_268ECB868);
  sub_2451BAEB8(v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStream, &qword_268ECB870);
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionIdentifier;
  uint64_t v2 = sub_2451BEC70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CredentialSession.__deallocating_deinit()
{
  sub_2451A133C(v0 + 112);
  sub_2451BAEB8(v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStreamContinuation, &qword_268ECB868);
  sub_2451BAEB8(v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStream, &qword_268ECB870);
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionIdentifier;
  uint64_t v2 = sub_2451BEC70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t CredentialSession.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2451B138C()
{
  return v0;
}

uint64_t sub_2451B1398()
{
  return sub_2451BEC50();
}

uint64_t sub_2451B13B4(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  if (*a1)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a2;
    v12[4] = sub_2451BAF24;
    v12[5] = v6;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 1107296256;
    _OWORD v12[2] = sub_2451AD974;
    v12[3] = &unk_26F9EA9A0;
    uint64_t v7 = _Block_copy(v12);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v4, sel_queueSessionWithCallbackProxy_reply_, a3, v7);
    _Block_release(v7);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v9 = swift_allocError();
    *uint64_t v10 = 12;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *long long v11 = v9;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451B1524(uint64_t result, void *a2, uint64_t a3)
{
  if (a2)
  {
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v4 = a2;
    id v5 = a2;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    uint64_t v6 = (void *)result;
    if (result)
    {
      **(void **)(*(void *)(a3 + 64) + 40) = swift_dynamicCastObjCProtocolUnconditional();
      id v7 = v6;
      return swift_continuation_throwingResume();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_2451B1614(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24519E6AC(&qword_268ECB870);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CredentialSession.Event(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v48 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_24519E6AC(&qword_268ECB990);
  uint64_t v46 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v45 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24519E6AC(&qword_268ECB868);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v47 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v14 = (char *)v40 - v13;
  uint64_t v15 = sub_24519E6AC(&qword_268ECB860);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v50 = *a1;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_2451BECA0();
  uint64_t v20 = sub_2451A1298(v19, (uint64_t)qword_268ECC6A0);
  swift_retain_n();
  uint64_t v44 = v20;
  uint64_t v21 = sub_2451BEC80();
  os_log_type_t v22 = sub_2451BEF20();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    v40[1] = v7;
    uint64_t v24 = v23;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v41 = v18;
    uint64_t v26 = v25;
    v52[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v42 = v16;
    sub_2451BEC70();
    uint64_t v43 = v6;
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v27 = sub_2451BF020();
    uint64_t v51 = sub_2451B6A18(v27, v28, v52);
    sub_2451BEF80();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    LOBYTE(v51) = v50;
    uint64_t v29 = sub_2451BEE50();
    uint64_t v51 = sub_2451B6A18(v29, v30, v52);
    uint64_t v16 = v42;
    sub_2451BEF80();
    uint64_t v6 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24519C000, v21, v22, "[%s] invalidateEventStream(reason: %s)", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    uint64_t v31 = v26;
    uint64_t v18 = v41;
    MEMORY[0x245699AC0](v31, -1, -1);
    MEMORY[0x245699AC0](v24, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v32 = v2 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2451B7120(v32, (uint64_t)v14, &qword_268ECB868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_2451BAEB8((uint64_t)v14, &qword_268ECB868);
    uint64_t v33 = sub_2451BEC80();
    os_log_type_t v34 = sub_2451BEF20();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_24519C000, v33, v34, "Previously invalidated", v35, 2u);
      MEMORY[0x245699AC0](v35, -1, -1);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    unsigned char *v48 = v50;
    swift_storeEnumTagMultiPayload();
    uint64_t v36 = v45;
    sub_2451BEEC0();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v36, v49);
    sub_2451BEED0();
    uint64_t v37 = (uint64_t)v47;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v47, 1, 1, v15);
    swift_beginAccess();
    sub_2451B7904(v37, v32, &qword_268ECB868);
    swift_endAccess();
    uint64_t v38 = sub_24519E6AC(&qword_268ECB858);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v6, 1, 1, v38);
    uint64_t v39 = v2 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentEventStream;
    swift_beginAccess();
    sub_2451B7904((uint64_t)v6, v39, &qword_268ECB870);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
}

uint64_t sub_2451B1CD8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = type metadata accessor for CredentialSession.Event(0);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_24519E6AC(&qword_268ECB990);
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  uint64_t v4 = sub_2451BEC70();
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  sub_24519E6AC((uint64_t *)&unk_268ECB840);
  v2[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for CredentialSession.Credential();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v6 = sub_24519E6AC(&qword_268ECB860);
  v2[16] = v6;
  v2[17] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v2[18] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v2[19] = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2451B1F4C;
  return sub_2451B0370(v7);
}

uint64_t sub_2451B1F4C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451B205C, v1, 0);
}

uint64_t sub_2451B205C()
{
  uint64_t v41 = v0;
  unint64_t v1 = v0[2];
  if (v1 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2451BF000();
    uint64_t v3 = v0[2];
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v3 = swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      uint64_t v4 = 0;
      unint64_t v38 = v1 & 0xC000000000000001;
      uint64_t v32 = v3 + 32;
      uint64_t v37 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0[14] + 48);
      uint64_t v33 = (void (**)(uint64_t, uint64_t))(v0[10] + 8);
      uint64_t v35 = (void (**)(uint64_t, uint64_t))(v0[7] + 8);
      uint64_t v36 = v2;
      do
      {
        if (v38)
        {
          id v8 = (id)MEMORY[0x2456994D0](v4, v0[2]);
          uint64_t v9 = v4 + 1;
          if (__OFADD__(v4, 1)) {
            goto LABEL_21;
          }
        }
        else
        {
          id v8 = *(id *)(v32 + 8 * v4);
          uint64_t v9 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
        }
        uint64_t v11 = v0[12];
        uint64_t v10 = v0[13];
        id v12 = v8;
        sub_2451A2C6C(v12, v11);
        if ((*v37)(v11, 1, v10) == 1)
        {
          uint64_t v24 = v0[17];
          uint64_t v23 = v0[18];
          uint64_t v25 = v0[16];
          uint64_t v26 = v0[12];

          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
          sub_2451BAEB8(v26, (uint64_t *)&unk_268ECB840);
          goto LABEL_18;
        }
        sub_2451B70AC(v0[12], v0[15]);
        if (qword_268ECB5C0 != -1) {
          swift_once();
        }
        uint64_t v39 = v9;
        uint64_t v13 = sub_2451BECA0();
        sub_2451A1298(v13, (uint64_t)qword_268ECC6A0);
        id v14 = v12;
        uint64_t v15 = sub_2451BEC80();
        os_log_type_t v16 = sub_2451BEF50();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = v0[11];
          uint64_t v34 = v0[9];
          uint64_t v18 = swift_slowAlloc();
          uint64_t v19 = swift_slowAlloc();
          uint64_t v40 = v19;
          *(_DWORD *)uint64_t v18 = 136315138;
          sub_2451BED30();
          uint64_t v20 = sub_2451BEC30();
          unint64_t v22 = v21;
          (*v33)(v17, v34);
          *(void *)(v18 + 4) = sub_2451B6A18(v20, v22, &v40);
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_24519C000, v15, v16, "Yield event for cred: %s", (uint8_t *)v18, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x245699AC0](v19, -1, -1);
          MEMORY[0x245699AC0](v18, -1, -1);
        }
        else
        {
        }
        unint64_t v1 = v0[18];
        uint64_t v5 = v0[15];
        uint64_t v6 = v0[8];
        uint64_t v7 = v0[6];
        sub_2451BAF90(v5, v0[5], (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential);
        swift_storeEnumTagMultiPayload();
        sub_2451BEEC0();

        (*v35)(v6, v7);
        sub_2451B9304(v5, (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential);
        ++v4;
      }
      while (v39 != v36);
    }
  }
  uint64_t v28 = v0[17];
  uint64_t v27 = v0[18];
  uint64_t v29 = v0[16];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
LABEL_18:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v30 = (uint64_t (*)(void))v0[1];
  return v30();
}

uint64_t sub_2451B24C0()
{
  uint64_t v2 = *v0;
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_2451B24E0, v2, 0);
}

uint64_t sub_2451B24E0()
{
  sub_2451AEEB8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451B2540(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 24) = a1;
  return MEMORY[0x270FA2498](sub_2451B2564, v1, 0);
}

uint64_t sub_2451B2564()
{
  uint64_t v16 = v0;
  if (*(unsigned char *)(v0 + 24))
  {
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2451BECA0();
    sub_2451A1298(v9, (uint64_t)qword_268ECC6A0);
    os_log_type_t v10 = sub_2451BEF20();
    uint64_t v11 = sub_2451BEC80();
    if (os_log_type_enabled(v11, v10))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_24519C000, v11, v10, "XPC interrupted", v12, 2u);
      MEMORY[0x245699AC0](v12, -1, -1);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_sessionStarted) = 0;
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2451BECA0();
    sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
    os_log_type_t v2 = sub_2451BEF20();
    uint64_t v3 = sub_2451BEC80();
    if (os_log_type_enabled(v3, v2))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_24519C000, v3, v2, "XPC invalidated", v4, 2u);
      MEMORY[0x245699AC0](v4, -1, -1);
    }

    uint64_t v5 = sub_2451BEC80();
    os_log_type_t v6 = sub_2451BEF50();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24519C000, v5, v6, "signalInvalidationOnEventStream", v7, 2u);
      MEMORY[0x245699AC0](v7, -1, -1);
    }
    uint64_t v8 = *(void *)(v0 + 16);

    *(void *)(v8 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
    swift_release();
    unsigned __int8 v15 = 7;
    sub_2451B1614(&v15);
  }
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_2451B27E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = type metadata accessor for CredentialSession.Event(0);
  v4[4] = swift_task_alloc();
  uint64_t v5 = sub_24519E6AC(&qword_268ECB990);
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  uint64_t v6 = sub_24519E6AC(&qword_268ECB860);
  v4[8] = v6;
  v4[9] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v4[10] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v4[11] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_2451B2974;
  return sub_2451B0370(v7);
}

uint64_t sub_2451B2974()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451B2A84, v1, 0);
}

uint64_t sub_2451B2A84()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  swift_storeEnumTagMultiPayload();
  sub_2451BEEC0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2451B2CE8(void *a1, void *aBlock, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v8 = (uint64_t (__cdecl *)())((char *)&dword_268ECBA70 + dword_268ECBA70);
  id v5 = a1;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v3[5] = v6;
  void *v6 = v3;
  v6[1] = sub_2451BB000;
  return v8();
}

uint64_t sub_2451B2DB8(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  sub_24519E6AC(&qword_268ECB7C8);
  v2[6] = swift_task_alloc();
  uint64_t v3 = sub_2451BEC70();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451B2EA8, 0, 0);
}

uint64_t sub_2451B2EA8()
{
  uint64_t v48 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF20();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v44 = v3;
    unint64_t v4 = v0[4];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v46 = v43;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v6 = sub_2451BF020();
    v0[2] = sub_2451B6A18(v6, v7, &v46);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_release_n();
    uint64_t v45 = (uint8_t *)v5;
    *(_WORD *)(v5 + 12) = 2080;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_2451BF000();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v9 = MEMORY[0x263F8EE78];
    if (v8)
    {
      uint64_t v47 = MEMORY[0x263F8EE78];
      uint64_t result = sub_2451B71A4(0, v8 & ~(v8 >> 63), 0);
      if (v8 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v42 = v2;
      uint64_t v11 = v0[8];
      if ((v4 & 0xC000000000000001) != 0)
      {
        uint64_t v12 = 0;
        uint64_t v13 = (void (**)(uint64_t, uint64_t))(v11 + 8);
        do
        {
          uint64_t v14 = v0[9];
          uint64_t v15 = v0[7];
          MEMORY[0x2456994D0](v12, v0[4]);
          sub_2451BED30();
          uint64_t v16 = sub_2451BEC30();
          uint64_t v18 = v17;
          (*v13)(v14, v15);
          swift_unknownObjectRelease();
          uint64_t v9 = v47;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2451B71A4(0, *(void *)(v9 + 16) + 1, 1);
            uint64_t v9 = v47;
          }
          unint64_t v20 = *(void *)(v9 + 16);
          unint64_t v19 = *(void *)(v9 + 24);
          if (v20 >= v19 >> 1)
          {
            sub_2451B71A4(v19 > 1, v20 + 1, 1);
            uint64_t v9 = v47;
          }
          ++v12;
          *(void *)(v9 + 16) = v20 + 1;
          uint64_t v21 = v9 + 16 * v20;
          *(void *)(v21 + 32) = v16;
          *(void *)(v21 + 40) = v18;
        }
        while (v8 != v12);
      }
      else
      {
        unint64_t v22 = (id *)(v0[4] + 32);
        uint64_t v23 = (void (**)(uint64_t, uint64_t))(v11 + 8);
        do
        {
          uint64_t v24 = v0[9];
          uint64_t v25 = v0[7];
          id v26 = *v22;
          sub_2451BED30();
          uint64_t v27 = sub_2451BEC30();
          uint64_t v29 = v28;
          (*v23)(v24, v25);

          uint64_t v9 = v47;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2451B71A4(0, *(void *)(v9 + 16) + 1, 1);
            uint64_t v9 = v47;
          }
          unint64_t v31 = *(void *)(v9 + 16);
          unint64_t v30 = *(void *)(v9 + 24);
          if (v31 >= v30 >> 1)
          {
            sub_2451B71A4(v30 > 1, v31 + 1, 1);
            uint64_t v9 = v47;
          }
          *(void *)(v9 + 16) = v31 + 1;
          uint64_t v32 = v9 + 16 * v31;
          *(void *)(v32 + 32) = v27;
          *(void *)(v32 + 40) = v29;
          ++v22;
          --v8;
        }
        while (v8);
      }
      uint64_t v2 = v42;
    }
    uint64_t v33 = MEMORY[0x245699390](v9, MEMORY[0x263F8D310]);
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    v0[3] = sub_2451B6A18(v33, v35, &v46);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24519C000, v2, v44, "[%s] installationCompleted(%s", v45, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v43, -1, -1);
    MEMORY[0x245699AC0](v45, -1, -1);
  }
  else
  {
    swift_release_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v37 = v0[5];
  uint64_t v36 = v0[6];
  uint64_t v38 = v0[4];
  uint64_t v39 = sub_2451BEEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v36, 1, 1, v39);
  uint64_t v40 = (void *)swift_allocObject();
  void v40[2] = 0;
  v40[3] = 0;
  v40[4] = v37;
  v40[5] = v38;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2451AD7C8(v36, (uint64_t)&unk_268ECBA38, (uint64_t)v40);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = (uint64_t (*)(void))v0[1];
  return v41();
}

uint64_t sub_2451B3450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *unint64_t v7 = v5;
  v7[1] = sub_2451A153C;
  return sub_2451B1CD8(a5);
}

uint64_t sub_2451B366C(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  sub_2451BED90();
  uint64_t v4 = sub_2451BEE70();
  v3[4] = v4;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v3[5] = v5;
  void *v5 = v3;
  v5[1] = sub_2451B3744;
  return sub_2451B2DB8(v4);
}

uint64_t sub_2451B3744()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_2451B38A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  sub_24519E6AC(&qword_268ECB7C8);
  v5[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451B3940, 0, 0);
}

uint64_t sub_2451B3940()
{
  unint64_t v19 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  swift_retain_n();
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v18 = v5;
    sub_2451BEC70();
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v6 = sub_2451BF020();
    v0[2] = sub_2451B6A18(v6, v7, &v18);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24519C000, v2, v3, "[%s] received HCI data)", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v5, -1, -1);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v8 = v0[7];
  uint64_t v9 = v0[8];
  uint64_t v11 = v0[5];
  unint64_t v10 = v0[6];
  uint64_t v13 = v0[3];
  unint64_t v12 = v0[4];
  uint64_t v14 = sub_2451BEEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v8;
  v15[5] = v11;
  v15[6] = v10;
  v15[7] = v13;
  v15[8] = v12;
  swift_retain();
  sub_24519F9C4(v11, v10);
  sub_24519F9C4(v13, v12);
  sub_2451AD7C8(v9, (uint64_t)&unk_268ECBA00, (uint64_t)v15);
  swift_release();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_2451B3C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a5;
  v8[3] = a6;
  v8[6] = type metadata accessor for CredentialSession.Event(0);
  v8[7] = swift_task_alloc();
  uint64_t v9 = sub_24519E6AC(&qword_268ECB990);
  v8[8] = v9;
  v8[9] = *(void *)(v9 - 8);
  v8[10] = swift_task_alloc();
  uint64_t v10 = sub_24519E6AC(&qword_268ECB860);
  v8[11] = v10;
  v8[12] = *(void *)(v10 - 8);
  uint64_t v11 = swift_task_alloc();
  v8[13] = v11;
  unint64_t v12 = (void *)swift_task_alloc();
  v8[14] = v12;
  *unint64_t v12 = v8;
  v12[1] = sub_2451B3DD0;
  return sub_2451B0370(v11);
}

uint64_t sub_2451B3DD0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451B3ECC, 0, 0);
}

uint64_t sub_2451B3ECC()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[9];
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[8];
  uint64_t v5 = (uint64_t *)v0[7];
  uint64_t v7 = v0[4];
  unint64_t v6 = v0[5];
  uint64_t v9 = v0[2];
  unint64_t v8 = v0[3];
  uint64_t *v5 = v9;
  v5[1] = v8;
  v5[2] = v7;
  v5[3] = v6;
  swift_storeEnumTagMultiPayload();
  sub_24519F9C4(v9, v8);
  sub_24519F9C4(v7, v6);
  sub_2451BEEC0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v13);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_2451B4170(void *a1, void *a2, void *aBlock, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  id v7 = a1;
  id v8 = a2;
  swift_retain();
  uint64_t v9 = sub_2451BEC20();
  uint64_t v11 = v10;

  v4[4] = v9;
  v4[5] = v11;
  uint64_t v12 = sub_2451BEC20();
  uint64_t v14 = v13;

  v4[6] = v12;
  v4[7] = v14;
  uint64_t v15 = (void *)swift_task_alloc();
  v4[8] = v15;
  *uint64_t v15 = v4;
  v15[1] = sub_2451B4280;
  return sub_2451B38A4(v9, v11, v12, v14);
}

uint64_t sub_2451B4280()
{
  unint64_t v1 = *(void *)(*v0 + 56);
  uint64_t v2 = *(void *)(*v0 + 48);
  unint64_t v3 = *(void *)(*v0 + 40);
  uint64_t v4 = *(void *)(*v0 + 32);
  uint64_t v5 = *(void (***)(void))(*v0 + 24);
  uint64_t v8 = *v0;
  swift_task_dealloc();
  sub_2451A14C4(v2, v1);
  sub_2451A14C4(v4, v3);
  swift_release();
  v5[2](v5);
  _Block_release(v5);
  unint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_2451B4434(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 44) = a1;
  sub_24519E6AC(&qword_268ECB7C8);
  *(void *)(v2 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451B44CC, 0, 0);
}

uint64_t sub_2451B44CC()
{
  uint64_t v17 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  swift_retain_n();
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF20();
  if (os_log_type_enabled(v2, v3))
  {
    int v15 = *(unsigned __int8 *)(v0 + 44);
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v16 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    sub_2451BEC70();
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v6 = sub_2451BF020();
    *(void *)(v0 + 16) = sub_2451B6A18(v6, v7, &v16);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v4 + 12) = 1024;
    *(_DWORD *)(v0 + 40) = v15;
    sub_2451BEF80();
    _os_log_impl(&dword_24519C000, v2, v3, "[%s] rfFieldChanged(%{BOOL}d", (uint8_t *)v4, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v5, -1, -1);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v9 = *(void *)(v0 + 32);
  char v10 = *(unsigned char *)(v0 + 44);
  uint64_t v11 = sub_2451BEEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  *(void *)(v12 + 32) = v8;
  *(unsigned char *)(v12 + 40) = v10;
  swift_retain();
  sub_2451AD7C8(v9, (uint64_t)&unk_268ECB9C8, v12);
  swift_release();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_2451B47D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 88) = a5;
  *(void *)(v5 + 16) = type metadata accessor for CredentialSession.Event(0);
  *(void *)(v5 + 24) = swift_task_alloc();
  uint64_t v6 = sub_24519E6AC(&qword_268ECB990);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = *(void *)(v6 - 8);
  *(void *)(v5 + 48) = swift_task_alloc();
  uint64_t v7 = sub_24519E6AC(&qword_268ECB860);
  *(void *)(v5 + 56) = v7;
  *(void *)(v5 + 64) = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v5 + 72) = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 80) = v9;
  void *v9 = v5;
  v9[1] = sub_2451B4968;
  return sub_2451B0370(v8);
}

uint64_t sub_2451B4968()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451B4A64, 0, 0);
}

uint64_t sub_2451B4A64()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  **(unsigned char **)(v0 + 24) = (*(unsigned char *)(v0 + 88) & 1) == 0;
  swift_storeEnumTagMultiPayload();
  sub_2451BEEC0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2451B4CD4(char a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v3[4] = v5;
  void *v5 = v3;
  v5[1] = sub_2451B4D90;
  return sub_2451B4434(a1);
}

uint64_t sub_2451B4D90()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_2451B4ECC(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  sub_24519E6AC(&qword_268ECB7C8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451B4F60, 0, 0);
}

uint64_t sub_2451B4F60()
{
  uint64_t v25 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = sub_2451BECA0();
  sub_2451A1298(v2, (uint64_t)qword_268ECC6A0);
  swift_retain();
  id v3 = v1;
  swift_retain();
  id v4 = v1;
  uint64_t v5 = sub_2451BEC80();
  os_log_type_t v6 = sub_2451BEF20();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[4];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    unint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = v23;
    *(_DWORD *)uint64_t v9 = 136315394;
    sub_2451BEC70();
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v10 = sub_2451BF020();
    v0[2] = sub_2451B6A18(v10, v11, &v24);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2112;
    id v12 = v8;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v13;
    sub_2451BEF80();
    *unint64_t v22 = v13;

    _os_log_impl(&dword_24519C000, v5, v6, "[%s] sessionErrorEvent(%@", (uint8_t *)v9, 0x16u);
    sub_24519E6AC(&qword_268ECB920);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v22, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v23, -1, -1);
    MEMORY[0x245699AC0](v9, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  uint64_t v14 = v0[5];
  uint64_t v15 = v0[6];
  uint64_t v16 = (void *)v0[4];
  uint64_t v17 = sub_2451BEEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v14;
  v18[5] = v16;
  swift_retain();
  id v19 = v16;
  sub_2451AD7C8(v15, (uint64_t)&unk_268ECB988, (uint64_t)v18);
  swift_release();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_2451B52F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[11] = type metadata accessor for CredentialSession.Event(0);
  v5[12] = swift_task_alloc();
  uint64_t v6 = sub_24519E6AC(&qword_268ECB990);
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  uint64_t v7 = sub_24519E6AC(&qword_268ECB860);
  v5[16] = v7;
  v5[17] = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  v5[18] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v5[19] = v9;
  void *v9 = v5;
  v9[1] = sub_2451B5488;
  return sub_2451B0370(v8);
}

uint64_t sub_2451B5488()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451B5584, 0, 0);
}

uint64_t sub_2451B5584()
{
  uint64_t v31 = v0;
  uint64_t v1 = *(void **)(v0 + 80);
  swift_willThrow();
  *(void *)(v0 + 40) = v1;
  uint64_t v2 = (void *)(v0 + 48);
  id v3 = v1;
  sub_24519E6AC(&qword_268ECB5E8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:

    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void **)(v0 + 80);
    uint64_t v6 = sub_2451BECA0();
    sub_2451A1298(v6, (uint64_t)qword_268ECC6A0);
    id v7 = v5;
    id v8 = v5;
    uint64_t v9 = sub_2451BEC80();
    os_log_type_t v10 = sub_2451BEF30();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 128);
    uint64_t v15 = *(void **)(v0 + 80);
    if (v11)
    {
      uint64_t v29 = *(void *)(v0 + 144);
      uint64_t v28 = *(void *)(v0 + 128);
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v30 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_getErrorValue();
      uint64_t v18 = sub_2451BF050();
      *(void *)(v0 + 64) = sub_2451B6A18(v18, v19, &v30);
      sub_2451BEF80();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24519C000, v9, v10, "Unknown error: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245699AC0](v17, -1, -1);
      MEMORY[0x245699AC0](v16, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v29, v28);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
    }
    goto LABEL_13;
  }
  if (*v2 != 17)
  {
    if (*v2 == 16)
    {
      uint64_t v4 = *(void *)(v0 + 72);
      return MEMORY[0x270FA2498](sub_2451B5910, v4, 0);
    }
    goto LABEL_7;
  }
  uint64_t v21 = *(void *)(v0 + 136);
  uint64_t v20 = *(void *)(v0 + 144);
  uint64_t v23 = *(void *)(v0 + 120);
  uint64_t v22 = *(void *)(v0 + 128);
  uint64_t v24 = *(void *)(v0 + 104);
  uint64_t v25 = *(void *)(v0 + 112);
  swift_storeEnumTagMultiPayload();
  sub_2451BEEC0();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);

LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_2451B5910()
{
  uint64_t v8 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF50();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24519C000, v2, v3, "signalInvalidationOnEventStream", v4, 2u);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 72);

  *(void *)(v5 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  unsigned __int8 v7 = 7;
  sub_2451B1614(&v7);
  return MEMORY[0x270FA2498](sub_2451B5A5C, 0, 0);
}

uint64_t sub_2451B5A5C()
{
  (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451B5C74(void *a1, void *aBlock, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v5 = a1;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v3[5] = v6;
  void *v6 = v3;
  v6[1] = sub_2451B5D38;
  return sub_2451B4ECC((uint64_t)v5);
}

uint64_t sub_2451B5D38()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  swift_release();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_2451B5E94(void *a1)
{
  uint64_t v2 = v1;
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2451BECA0();
  sub_2451A1298(v7, (uint64_t)qword_268ECC6A0);
  swift_retain();
  id v8 = a1;
  swift_retain();
  id v9 = a1;
  os_log_type_t v10 = sub_2451BEC80();
  os_log_type_t v11 = sub_2451BEF20();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v24[0] = v22;
    *(_DWORD *)uint64_t v12 = 136315394;
    sub_2451BEC70();
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v14 = sub_2451BF020();
    uint64_t v23 = sub_2451B6A18(v14, v15, v24);
    sub_2451BEF80();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2112;
    if (a1)
    {
      id v16 = a1;
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v23 = v17;
      sub_2451BEF80();
    }
    else
    {
      uint64_t v23 = 0;
      sub_2451BEF80();
      uint64_t v17 = 0;
    }
    *uint64_t v13 = v17;

    _os_log_impl(&dword_24519C000, v10, v11, "[%s] sessionEnded(%@)", (uint8_t *)v12, 0x16u);
    sub_24519E6AC(&qword_268ECB920);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v13, -1, -1);
    uint64_t v18 = v22;
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v18, -1, -1);
    MEMORY[0x245699AC0](v12, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  uint64_t v19 = sub_2451BEEB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v2;
  swift_retain();
  sub_2451AD7C8((uint64_t)v6, (uint64_t)&unk_268ECB918, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_2451B6264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2451B6284, a4, 0);
}

uint64_t sub_2451B6284()
{
  uint64_t v9 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF50();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24519C000, v2, v3, "signalInvalidationOnEventStream", v4, 2u);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 16);

  *(void *)(v5 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  unsigned __int8 v8 = 7;
  sub_2451B1614(&v8);
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2451B6424(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2451B6500;
  return v6(a1);
}

uint64_t sub_2451B6500()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2451B65F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2451A153C;
  return v6();
}

uint64_t sub_2451B66C4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_2451A153C;
  return v7();
}

uint64_t sub_2451B6790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2451BEEB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2451BEEA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2451BAEB8(a1, &qword_268ECB7C8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451BEE90();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2451B693C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2451BB044;
  return v6(a1);
}

uint64_t sub_2451B6A18(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2451B6AEC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2451BAE58((uint64_t)v12, *a3);
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
      sub_2451BAE58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2451A142C((uint64_t)v12);
  return v7;
}

uint64_t sub_2451B6AEC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2451BEF90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2451B6CA8(a5, a6);
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
  uint64_t v8 = sub_2451BEFD0();
  if (!v8)
  {
    sub_2451BEFE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2451BF010();
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

uint64_t sub_2451B6CA8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2451B6D40(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2451B6F20(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2451B6F20(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2451B6D40(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2451B6EB8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2451BEFB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2451BEFE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2451BEE60();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2451BF010();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2451BEFE0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2451B6EB8(uint64_t a1, uint64_t a2)
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
  sub_24519E6AC(&qword_268ECBAA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2451B6F20(char a1, int64_t a2, char a3, char *a4)
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
    sub_24519E6AC(&qword_268ECBAA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_2451BF010();
  __break(1u);
  return result;
}

uint64_t sub_2451B7074(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2451B7084()
{
  return swift_release();
}

uint64_t type metadata accessor for CredentialSession.State(uint64_t a1)
{
  return sub_2451B9384(a1, (uint64_t *)&unk_268ECB8F0);
}

uint64_t sub_2451B70AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CredentialSession.Credential();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2451B7114(void *a1)
{
  return sub_2451A861C(a1, v1 + 16, *(void *)(v1 + 64));
}

uint64_t sub_2451B7120(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_24519E6AC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2451B7184(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2451B71C4(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2451B71A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2451B734C(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2451B71C4(char a1, int64_t a2, char a3, char *a4)
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
    sub_24519E6AC(&qword_268ECBA98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8]) {
      memmove(v12, v13, 96 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[96 * v8] || v12 >= &v13[96 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2451BF010();
  __break(1u);
  return result;
}

uint64_t sub_2451B734C(char a1, int64_t a2, char a3, char *a4)
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
    sub_24519E6AC(&qword_268ECBA40);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_2451BF010();
  __break(1u);
  return result;
}

uint64_t _s23SecureElementCredential0C7SessionC5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a2;
  type metadata accessor for CredentialSession.Credential();
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v34 = (uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  int64_t v7 = (char *)&v34 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v34 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = type metadata accessor for CredentialSession.State(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v34 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v34 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v34 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v34 - v26;
  sub_2451BAF90(a1, (uint64_t)&v34 - v26, type metadata accessor for CredentialSession.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2451B70AC((uint64_t)v27, (uint64_t)v7);
      sub_2451BAF90(v35, (uint64_t)v19, type metadata accessor for CredentialSession.State);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v29 = v34;
        sub_2451B70AC((uint64_t)v19, v34);
        char v30 = sub_2451BEC50();
        sub_2451B9304(v29, (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential);
        uint64_t v31 = (uint64_t)v7;
        uint64_t v32 = (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential;
        goto LABEL_11;
      }
      sub_2451B9304((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential);
      uint64_t v28 = (uint64_t)v19;
      goto LABEL_9;
    case 2u:
      sub_2451BAF90(v35, (uint64_t)v25, type metadata accessor for CredentialSession.State);
      char v30 = swift_getEnumCaseMultiPayload() == 2;
      uint64_t v32 = type metadata accessor for CredentialSession.State;
      uint64_t v31 = (uint64_t)v25;
      goto LABEL_11;
    case 3u:
      sub_2451BAF90(v35, (uint64_t)v16, type metadata accessor for CredentialSession.State);
      char v30 = swift_getEnumCaseMultiPayload() == 3;
      uint64_t v32 = type metadata accessor for CredentialSession.State;
      uint64_t v31 = (uint64_t)v16;
      goto LABEL_11;
    default:
      sub_2451B70AC((uint64_t)v27, (uint64_t)v12);
      sub_2451BAF90(v35, (uint64_t)v22, type metadata accessor for CredentialSession.State);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_2451B9304((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential);
        uint64_t v28 = (uint64_t)v22;
LABEL_9:
        sub_2451B9304(v28, type metadata accessor for CredentialSession.State);
        char v30 = 0;
      }
      else
      {
        sub_2451B70AC((uint64_t)v22, (uint64_t)v10);
        char v30 = sub_2451BEC50();
        sub_2451B9304((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential);
        uint64_t v31 = (uint64_t)v12;
        uint64_t v32 = (uint64_t (*)(void))type metadata accessor for CredentialSession.Credential;
LABEL_11:
        sub_2451B9304(v31, v32);
      }
      return v30 & 1;
  }
}

uint64_t sub_2451B7904(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_24519E6AC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_2451B796C()
{
  unint64_t result = qword_268ECB898;
  if (!qword_268ECB898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB898);
  }
  return result;
}

unint64_t sub_2451B79C4()
{
  unint64_t result = qword_268ECB8A0;
  if (!qword_268ECB8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECB8A0);
  }
  return result;
}

uint64_t sub_2451B7A1C()
{
  return type metadata accessor for CredentialSession(0);
}

uint64_t type metadata accessor for CredentialSession(uint64_t a1)
{
  return sub_2451B9384(a1, (uint64_t *)&unk_268ECB8B0);
}

void sub_2451B7A44()
{
  sub_2451B7F10(319, &qword_268ECB8E0, &qword_268ECB860);
  if (v0 <= 0x3F)
  {
    sub_2451B7F10(319, &qword_268ECB8E8, &qword_268ECB858);
    if (v1 <= 0x3F)
    {
      sub_2451BEC70();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for CredentialSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CredentialSession);
}

uint64_t dispatch thunk of CredentialSession.invalidate()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 144) + **(int **)(*(void *)v0 + 144));
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_24519EE5C;
  return v4();
}

uint64_t dispatch thunk of CredentialSession.state.getter(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 152) + **(int **)(*(void *)v1 + 152));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2451A153C;
  return v6(a1);
}

uint64_t dispatch thunk of CredentialSession.eventStream.getter(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 160) + **(int **)(*(void *)v1 + 160));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24519EE5C;
  return v6(a1);
}

uint64_t dispatch thunk of CredentialSession.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t sub_2451B7EC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_2451B7F10(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_2451B7EC8(a3);
    unint64_t v4 = sub_2451BEF70();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

char *initializeBufferWithCopyOfBuffer for CredentialSession.State(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_2451BEC70();
      uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, (char *)a2, v8);
      uint64_t v10 = (int *)type metadata accessor for CredentialSession.Credential();
      uint64_t v21 = v10[5];
      uint64_t v22 = &a1[v21];
      uint64_t v23 = (uint64_t *)((char *)a2 + v21);
      uint64_t v24 = v23[1];
      *(void *)uint64_t v22 = *v23;
      *((void *)v22 + 1) = v24;
      uint64_t v15 = v10[6];
      unint64_t v16 = *(uint64_t *)((char *)a2 + v15);
      swift_bridgeObjectRetain();
      if (v16 >= 2) {
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v6 + 64));
        return a1;
      }
      uint64_t v8 = sub_2451BEC70();
      uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, (char *)a2, v8);
      uint64_t v10 = (int *)type metadata accessor for CredentialSession.Credential();
      uint64_t v11 = v10[5];
      uint64_t v12 = &a1[v11];
      uint64_t v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v14 = v13[1];
      *(void *)uint64_t v12 = *v13;
      *((void *)v12 + 1) = v14;
      uint64_t v15 = v10[6];
      unint64_t v16 = *(uint64_t *)((char *)a2 + v15);
      swift_bridgeObjectRetain();
      if (v16 >= 2) {
        swift_bridgeObjectRetain();
      }
    }
    *(void *)&a1[v15] = v16;
    *(void *)&a1[v10[7]] = *(uint64_t *)((char *)a2 + v10[7]);
    *(void *)&a1[v10[8]] = *(uint64_t *)((char *)a2 + v10[8]);
    a1[v10[9]] = *((unsigned char *)a2 + v10[9]);
    uint64_t v17 = v10[10];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = (char *)a2 + v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9(v18, v19, v8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CredentialSession.State(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 1)
  {
    uint64_t v3 = sub_2451BEC70();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    v6(a1, v3);
    uint64_t v4 = type metadata accessor for CredentialSession.Credential();
    swift_bridgeObjectRelease();
    if (*(void *)(a1 + *(int *)(v4 + 24)) >= 2uLL) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = a1 + *(int *)(v4 + 40);
    return ((uint64_t (*)(uint64_t, uint64_t))v6)(v5, v3);
  }
  return result;
}

char *initializeWithCopy for CredentialSession.State(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_2451BEC70();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = (int *)type metadata accessor for CredentialSession.Credential();
    uint64_t v19 = v9[5];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)uint64_t v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    uint64_t v14 = v9[6];
    unint64_t v15 = *(void *)&a2[v14];
    swift_bridgeObjectRetain();
    if (v15 >= 2) {
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = sub_2451BEC70();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = (int *)type metadata accessor for CredentialSession.Credential();
    uint64_t v10 = v9[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = v9[6];
    unint64_t v15 = *(void *)&a2[v14];
    swift_bridgeObjectRetain();
    if (v15 >= 2) {
      swift_bridgeObjectRetain();
    }
  }
  *(void *)&a1[v14] = v15;
  *(void *)&a1[v9[7]] = *(void *)&a2[v9[7]];
  *(void *)&a1[v9[8]] = *(void *)&a2[v9[8]];
  a1[v9[9]] = a2[v9[9]];
  uint64_t v16 = v9[10];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8(v17, v18, v7);
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithCopy for CredentialSession.State(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2451B9304((uint64_t)a1, type metadata accessor for CredentialSession.State);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_2451BEC70();
      uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
      v8(a1, a2, v7);
      uint64_t v9 = (int *)type metadata accessor for CredentialSession.Credential();
      uint64_t v18 = v9[5];
      uint64_t v19 = &a1[v18];
      uint64_t v20 = &a2[v18];
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = *((void *)v20 + 1);
      uint64_t v13 = v9[6];
      unint64_t v14 = *(void *)&a2[v13];
      swift_bridgeObjectRetain();
      if (v14 >= 2) {
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = sub_2451BEC70();
      uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
      v8(a1, a2, v7);
      uint64_t v9 = (int *)type metadata accessor for CredentialSession.Credential();
      uint64_t v10 = v9[5];
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      *(void *)uint64_t v11 = *(void *)v12;
      *((void *)v11 + 1) = *((void *)v12 + 1);
      uint64_t v13 = v9[6];
      unint64_t v14 = *(void *)&a2[v13];
      swift_bridgeObjectRetain();
      if (v14 >= 2) {
        swift_bridgeObjectRetain();
      }
    }
    *(void *)&a1[v13] = v14;
    *(void *)&a1[v9[7]] = *(void *)&a2[v9[7]];
    *(void *)&a1[v9[8]] = *(void *)&a2[v9[8]];
    a1[v9[9]] = a2[v9[9]];
    uint64_t v15 = v9[10];
    uint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8(v16, v17, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for CredentialSession.State(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_2451BEC70();
    uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
    v7(a1, a2, v6);
    uint64_t v8 = (int *)type metadata accessor for CredentialSession.Credential();
    *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
    *(void *)&a1[v8[6]] = *(void *)&a2[v8[6]];
    *(void *)&a1[v8[7]] = *(void *)&a2[v8[7]];
    *(void *)&a1[v8[8]] = *(void *)&a2[v8[8]];
    a1[v8[9]] = a2[v8[9]];
    v7(&a1[v8[10]], &a2[v8[10]], v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for CredentialSession.State(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2451B9304((uint64_t)a1, type metadata accessor for CredentialSession.State);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_2451BEC70();
      uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
      v7(a1, a2, v6);
      uint64_t v8 = (int *)type metadata accessor for CredentialSession.Credential();
      *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
      *(void *)&a1[v8[6]] = *(void *)&a2[v8[6]];
      *(void *)&a1[v8[7]] = *(void *)&a2[v8[7]];
      *(void *)&a1[v8[8]] = *(void *)&a2[v8[8]];
      a1[v8[9]] = a2[v8[9]];
      v7(&a1[v8[10]], &a2[v8[10]], v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2451B8BC0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2451B8BD0()
{
  uint64_t result = type metadata accessor for CredentialSession.Credential();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CredentialSession.Event(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v21 = *a2;
      unint64_t v22 = a2[1];
      sub_24519F9C4(*a2, v22);
      *a1 = v21;
      a1[1] = v22;
      uint64_t v24 = a2[2];
      unint64_t v23 = a2[3];
      sub_24519F9C4(v24, v23);
      a1[2] = v24;
      a1[3] = v23;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_2451BEC70();
      uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      uint64_t v10 = (int *)type metadata accessor for CredentialSession.Credential();
      uint64_t v11 = v10[5];
      uint64_t v12 = (uint64_t *)((char *)a1 + v11);
      uint64_t v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v14 = v13[1];
      *uint64_t v12 = *v13;
      v12[1] = v14;
      uint64_t v15 = v10[6];
      unint64_t v16 = *(uint64_t *)((char *)a2 + v15);
      swift_bridgeObjectRetain();
      if (v16 >= 2) {
        swift_bridgeObjectRetain();
      }
      *(uint64_t *)((char *)a1 + v15) = v16;
      *(uint64_t *)((char *)a1 + v10[7]) = *(uint64_t *)((char *)a2 + v10[7]);
      *(uint64_t *)((char *)a1 + v10[8]) = *(uint64_t *)((char *)a2 + v10[8]);
      *((unsigned char *)a1 + v10[9]) = *((unsigned char *)a2 + v10[9]);
      uint64_t v17 = v10[10];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v9((uint64_t *)v18, (uint64_t *)v19, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t destroy for CredentialSession.Event(uint64_t *a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 3)
  {
    sub_2451A14C4(*a1, a1[1]);
    uint64_t v6 = a1[2];
    unint64_t v7 = a1[3];
    return sub_2451A14C4(v6, v7);
  }
  else if (result == 1)
  {
    uint64_t v3 = sub_2451BEC70();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t))(*(void *)(v3 - 8) + 8);
    v8(a1, v3);
    uint64_t v4 = type metadata accessor for CredentialSession.Credential();
    swift_bridgeObjectRelease();
    if (*(unint64_t *)((char *)a1 + *(int *)(v4 + 24)) >= 2) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v5 = (char *)a1 + *(int *)(v4 + 40);
    return ((uint64_t (*)(char *, uint64_t))v8)(v5, v3);
  }
  return result;
}

uint64_t *initializeWithCopy for CredentialSession.Event(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v19 = *a2;
    unint64_t v20 = a2[1];
    sub_24519F9C4(*a2, v20);
    *a1 = v19;
    a1[1] = v20;
    uint64_t v22 = a2[2];
    unint64_t v21 = a2[3];
    sub_24519F9C4(v22, v21);
    a1[2] = v22;
    a1[3] = v21;
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_2451BEC70();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = (int *)type metadata accessor for CredentialSession.Credential();
    uint64_t v10 = v9[5];
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = v9[6];
    unint64_t v15 = *(uint64_t *)((char *)a2 + v14);
    swift_bridgeObjectRetain();
    if (v15 >= 2) {
      swift_bridgeObjectRetain();
    }
    *(uint64_t *)((char *)a1 + v14) = v15;
    *(uint64_t *)((char *)a1 + v9[7]) = *(uint64_t *)((char *)a2 + v9[7]);
    *(uint64_t *)((char *)a1 + v9[8]) = *(uint64_t *)((char *)a2 + v9[8]);
    *((unsigned char *)a1 + v9[9]) = *((unsigned char *)a2 + v9[9]);
    uint64_t v16 = v9[10];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8((uint64_t *)v17, (uint64_t *)v18, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t *assignWithCopy for CredentialSession.Event(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2451B9304((uint64_t)a1, type metadata accessor for CredentialSession.Event);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v18 = *a2;
      unint64_t v19 = a2[1];
      sub_24519F9C4(*a2, v19);
      *a1 = v18;
      a1[1] = v19;
      uint64_t v21 = a2[2];
      unint64_t v20 = a2[3];
      sub_24519F9C4(v21, v20);
      a1[2] = v21;
      a1[3] = v20;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_2451BEC70();
      uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
      v8(a1, a2, v7);
      uint64_t v9 = (int *)type metadata accessor for CredentialSession.Credential();
      uint64_t v10 = v9[5];
      uint64_t v11 = (uint64_t *)((char *)a1 + v10);
      uint64_t v12 = (uint64_t *)((char *)a2 + v10);
      *uint64_t v11 = *v12;
      v11[1] = v12[1];
      uint64_t v13 = v9[6];
      unint64_t v14 = *(uint64_t *)((char *)a2 + v13);
      swift_bridgeObjectRetain();
      if (v14 >= 2) {
        swift_bridgeObjectRetain();
      }
      *(uint64_t *)((char *)a1 + v13) = v14;
      *(uint64_t *)((char *)a1 + v9[7]) = *(uint64_t *)((char *)a2 + v9[7]);
      *(uint64_t *)((char *)a1 + v9[8]) = *(uint64_t *)((char *)a2 + v9[8]);
      *((unsigned char *)a1 + v9[9]) = *((unsigned char *)a2 + v9[9]);
      uint64_t v15 = v9[10];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8((uint64_t *)v16, (uint64_t *)v17, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2451B9304(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for CredentialSession.Event(uint64_t a1)
{
  return sub_2451B9384(a1, (uint64_t *)&unk_268ECB900);
}

uint64_t sub_2451B9384(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unsigned char *initializeWithTake for CredentialSession.Event(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2451BEC70();
    uint64_t v7 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v6 - 8) + 32);
    v7(a1, a2, v6);
    uint64_t v8 = (int *)type metadata accessor for CredentialSession.Credential();
    *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
    *(void *)&a1[v8[6]] = *(void *)&a2[v8[6]];
    *(void *)&a1[v8[7]] = *(void *)&a2[v8[7]];
    *(void *)&a1[v8[8]] = *(void *)&a2[v8[8]];
    a1[v8[9]] = a2[v8[9]];
    v7(&a1[v8[10]], &a2[v8[10]], v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

unsigned char *assignWithTake for CredentialSession.Event(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2451B9304((uint64_t)a1, type metadata accessor for CredentialSession.Event);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2451BEC70();
      uint64_t v7 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v6 - 8) + 32);
      v7(a1, a2, v6);
      uint64_t v8 = (int *)type metadata accessor for CredentialSession.Credential();
      *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
      *(void *)&a1[v8[6]] = *(void *)&a2[v8[6]];
      *(void *)&a1[v8[7]] = *(void *)&a2[v8[7]];
      *(void *)&a1[v8[8]] = *(void *)&a2[v8[8]];
      a1[v8[9]] = a2[v8[9]];
      v7(&a1[v8[10]], &a2[v8[10]], v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s23SecureElementCredential17CredentialSessionC5EventOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t _s23SecureElementCredential17CredentialSessionC5EventOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2451B9678()
{
  uint64_t result = type metadata accessor for CredentialSession.Credential();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CredentialSession.NFCFieldInformation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2451B97ECLL);
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

ValueMetadata *type metadata accessor for CredentialSession.NFCFieldInformation()
{
  return &type metadata for CredentialSession.NFCFieldInformation;
}

uint64_t destroy for CredentialSession.ConnectivityEvent(uint64_t *a1)
{
  sub_2451A14C4(*a1, a1[1]);
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];

  return sub_2451A14C4(v2, v3);
}

uint64_t *initializeWithCopy for CredentialSession.ConnectivityEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24519F9C4(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v7 = a2[2];
  unint64_t v6 = a2[3];
  sub_24519F9C4(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *assignWithCopy for CredentialSession.ConnectivityEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24519F9C4(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2451A14C4(v6, v7);
  uint64_t v9 = a2[2];
  unint64_t v8 = a2[3];
  sub_24519F9C4(v9, v8);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_2451A14C4(v10, v11);
  return a1;
}

__n128 initializeWithTake for CredentialSession.ConnectivityEvent(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t *assignWithTake for CredentialSession.ConnectivityEvent(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_2451A14C4(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_2451A14C4(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for CredentialSession.ConnectivityEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CredentialSession.ConnectivityEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CredentialSession.ConnectivityEvent()
{
  return &type metadata for CredentialSession.ConnectivityEvent;
}

uint64_t getEnumTagSinglePayload for CredentialSession.ErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEB) {
    goto LABEL_17;
  }
  if (a2 + 21 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 21) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 21;
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
      return (*a1 | (v4 << 8)) - 21;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 21;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x16;
  int v8 = v6 - 22;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CredentialSession.ErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 21 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 21) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEA)
  {
    unsigned int v6 = ((a2 - 235) >> 8) + 1;
    *__n128 result = a2 + 21;
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
        JUMPOUT(0x2451B9B8CLL);
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
          *__n128 result = a2 + 21;
        break;
    }
  }
  return result;
}

unsigned char *sub_2451B9BB4(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CredentialSession.ErrorCode()
{
  return &type metadata for CredentialSession.ErrorCode;
}

uint64_t sub_2451B9BCC()
{
  return sub_2451BACC4(40);
}

uint64_t sub_2451B9BD4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_2451A153C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2451B6284, v2, 0);
}

uint64_t sub_2451B9C7C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2451B9CB4(uint64_t a1)
{
  unsigned int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2451A153C;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECB928 + dword_268ECB928);
  return v6(a1, v4);
}

uint64_t sub_2451B9D70()
{
  uint64_t v2 = (void *)v0[2];
  int v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2451A153C;
  unsigned int v6 = (uint64_t (*)(void *, void *, uint64_t))((char *)&dword_268ECB938 + dword_268ECB938);
  return v6(v2, v3, v4);
}

uint64_t sub_2451B9E28()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2451A153C;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268ECB948 + dword_268ECB948);
  return v6(v2, v3, v4);
}

uint64_t sub_2451B9EEC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_2451A153C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268ECB958 + dword_268ECB958);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_2451B9FB8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2451A153C;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECB968 + dword_268ECB968);
  return v6(a1, v4);
}

uint64_t sub_2451BA070()
{
  return sub_2451BA62C(MEMORY[0x263F8EEB0]);
}

uint64_t sub_2451BA088(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2451A153C;
  return sub_2451B52F8(a1, v4, v5, v7, v6);
}

uint64_t sub_2451BA148()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2451BA188()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2451A153C;
  uint64_t v6 = (uint64_t (*)(char, void *, uint64_t))((char *)&dword_268ECB998 + dword_268ECB998);
  return v6(v2, v4, v3);
}

uint64_t sub_2451BA244()
{
  return sub_2451BACC4(41);
}

uint64_t sub_2451BA24C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2451A153C;
  return sub_2451B47D8(a1, v4, v5, v6, v7);
}

uint64_t sub_2451BA310()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2451BA360()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_2451A153C;
  char v7 = (uint64_t (*)(void *, void *, void *, uint64_t))((char *)&dword_268ECB9D0 + dword_268ECB9D0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_2451BA428()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_2451A14C4(*(void *)(v0 + 40), *(void *)(v0 + 48));
  sub_2451A14C4(*(void *)(v0 + 56), *(void *)(v0 + 64));

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2451BA478(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  unint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *unint64_t v11 = v2;
  v11[1] = sub_2451A153C;
  return sub_2451B3C3C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2451BA558()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2451A153C;
  uint64_t v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_268ECBA08 + dword_268ECBA08);
  return v6(v2, v3, v4);
}

uint64_t sub_2451BA614()
{
  return sub_2451BA62C(MEMORY[0x263F8EEA0]);
}

uint64_t sub_2451BA62C(void (*a1)(void))
{
  swift_unknownObjectRelease();
  swift_release();
  a1(*(void *)(v1 + 40));

  return MEMORY[0x270FA0238](v1, 48, 7);
}

uint64_t sub_2451BA684()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2451A153C;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2451A153C;
  return sub_2451B1CD8(v2);
}

uint64_t sub_2451BA770()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2451BA7B8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2451A153C;
  uint64_t v6 = (uint64_t (*)(void *, void *, uint64_t))((char *)&dword_268ECBA50 + dword_268ECBA50);
  return v6(v2, v3, v4);
}

uint64_t sub_2451BA874()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2451BA8B4()
{
  *(void *)(v1 + 24) = v0;
  sub_24519E6AC(&qword_268ECB7C8);
  *(void *)(v1 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451BA948, v0, 0);
}

uint64_t sub_2451BA948()
{
  uint64_t v16 = v0;
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2451BECA0();
  sub_2451A1298(v1, (uint64_t)qword_268ECC6A0);
  swift_retain_n();
  uint64_t v2 = sub_2451BEC80();
  os_log_type_t v3 = sub_2451BEF20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v15 = v5;
    sub_2451BEC70();
    sub_2451BAC74((unint64_t *)&qword_268ECB810, MEMORY[0x263F07508]);
    uint64_t v6 = sub_2451BF020();
    v0[2] = sub_2451B6A18(v6, v7, &v15);
    sub_2451BEF80();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24519C000, v2, v3, "Presentment Intent assertion for [%s] has timed out", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245699AC0](v5, -1, -1);
    MEMORY[0x245699AC0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v8 = v0[3];
  uint64_t v9 = v0[4];
  *(void *)(v8 + OBJC_IVAR____TtC23SecureElementCredential17CredentialSession_currentAssertion) = 0;
  swift_release();
  uint64_t v10 = sub_2451BEEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = sub_2451BAC74(&qword_268ECBA80, (void (*)(uint64_t))type metadata accessor for CredentialSession);
  uint64_t v12 = (void *)swift_allocObject();
  _OWORD v12[2] = v8;
  uint64_t v12[3] = v11;
  v12[4] = v8;
  swift_retain_n();
  sub_2451AD7C8(v9, (uint64_t)&unk_268ECBA88, (uint64_t)v12);
  swift_release();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2451BAC74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2451BACBC()
{
  return sub_2451BACC4(40);
}

uint64_t sub_2451BACC4(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2451BAD10(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_2451A153C;
  return sub_2451B27E4(a1, v4, v5, v6);
}

uint64_t sub_2451BADC8(void *a1)
{
  return sub_2451A86AC(a1, v1 + 16, *(void *)(v1 + 64));
}

uint64_t sub_2451BADD4(uint64_t a1)
{
  return sub_2451AD4A4(a1, *(void *)(v1 + 16));
}

uint64_t sub_2451BADDC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451BADEC(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void **)(*(void *)(*(void *)(v2 + 16) + 64) + 40);
  *os_log_type_t v3 = a1;
  v3[1] = a2;
  id v4 = a2;

  return swift_continuation_throwingResume();
}

uint64_t sub_2451BAE40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451BAE50()
{
  return swift_continuation_throwingResume();
}

uint64_t sub_2451BAE58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2451BAEB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24519E6AC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2451BAF14()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451BAF24(uint64_t a1, void *a2)
{
  return sub_2451B1524(a1, a2, *(void *)(v2 + 16));
}

uint64_t *sub_2451BAF2C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2451BAF90(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2451BB048(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t CredentialSession.listCredentials()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2451BB0D4, v0, 0);
}

uint64_t sub_2451BB0D4()
{
  id v4 = (uint64_t (*)(uint64_t))((char *)&dword_268ECBA90 + dword_268ECBA90);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2451BB188;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4(v2);
}

uint64_t sub_2451BB188(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_2451BB288(uint64_t a1, uint64_t a2)
{
  v2[37] = a1;
  v2[38] = a2;
  sub_24519E6AC((uint64_t *)&unk_268ECB840);
  v2[39] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for CredentialSession.Credential();
  v2[40] = v4;
  v2[41] = *(void *)(v4 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451BB38C, a2, 0);
}

uint64_t sub_2451BB38C()
{
  uint64_t v1 = *(void *)(v0 + 304) + 112;
  swift_beginAccess();
  sub_2451A12D0(v1, v0 + 80);
  return MEMORY[0x270FA2498](sub_2451BB418, 0, 0);
}

uint64_t sub_2451BB418()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  v0[2] = v0;
  v0[7] = v0 + 35;
  v0[3] = sub_2451BB66C;
  uint64_t v3 = swift_continuation_init();
  uint64_t v4 = (void *)v1[10];
  if (v4)
  {
    uint64_t v5 = (void **)(v1 + 36);
    sub_2451A12D0((uint64_t)(v1 + 10), (uint64_t)(v1 + 22));
    uint64_t v6 = swift_allocObject();
    long long v7 = *((_OWORD *)v1 + 12);
    *(_OWORD *)(v6 + 16) = *((_OWORD *)v1 + 11);
    *(_OWORD *)(v6 + 32) = v7;
    *(_OWORD *)(v6 + 48) = *((_OWORD *)v1 + 13);
    *(void *)(v6 + 64) = v3;
    v1[20] = sub_2451BD26C;
    v1[21] = v6;
    v1[16] = MEMORY[0x263EF8330];
    v1[17] = 1107296256;
    v1[18] = sub_24519E644;
    v1[19] = &unk_26F9EAA90;
    uint64_t v8 = _Block_copy(v1 + 16);
    swift_unknownObjectRetain();
    swift_release();
    id v9 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_2451BEFA0();
    swift_unknownObjectRelease();
    sub_24519E6AC(&qword_268ECB6B8);
    if ((swift_dynamicCast() & 1) == 0) {
      void *v5 = 0;
    }
    sub_2451BBAB8(v5, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v12 = v10;
    swift_continuation_throwingResumeWithError();
  }
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2451BB66C()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 352) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2451BB9D4;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = v1[38];
    v1[45] = v1[35];
    sub_2451A133C((uint64_t)(v1 + 10));
    uint64_t v3 = sub_2451BB7A8;
    uint64_t v4 = v5;
  }
  return MEMORY[0x270FA2498](v3, v4, 0);
}

uint64_t sub_2451BB7A8()
{
  unint64_t v1 = v0[45];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2451BF000();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_17:
    unint64_t v8 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  uint64_t v5 = v0[41];
  unint64_t v6 = v1 & 0xC000000000000001;
  uint64_t v7 = v0[45] + 32;
  unint64_t v8 = MEMORY[0x263F8EE78];
  do
  {
    if (v6) {
      id v9 = (id)MEMORY[0x2456994D0](v4, v0[45]);
    }
    else {
      id v9 = *(id *)(v7 + 8 * v4);
    }
    uint64_t v11 = v0[39];
    uint64_t v10 = v0[40];
    sub_2451A2C6C(v9, v11);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v11, 1, v10) == 1)
    {
      sub_2451BCF44(v0[39]);
    }
    else
    {
      uint64_t v13 = v0[42];
      uint64_t v12 = v0[43];
      sub_2451B70AC(v0[39], v12);
      sub_2451B70AC(v12, v13);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v8 = sub_2451BCFBC(0, *(void *)(v8 + 16) + 1, 1, v8);
      }
      unint64_t v15 = *(void *)(v8 + 16);
      unint64_t v14 = *(void *)(v8 + 24);
      if (v15 >= v14 >> 1) {
        unint64_t v8 = sub_2451BCFBC(v14 > 1, v15 + 1, 1, v8);
      }
      uint64_t v16 = v0[42];
      *(void *)(v8 + 16) = v15 + 1;
      sub_2451B70AC(v16, v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v15);
    }
    ++v4;
  }
  while (v2 != v4);
LABEL_18:
  uint64_t v17 = (unint64_t *)v0[37];
  swift_bridgeObjectRelease_n();
  *uint64_t v17 = v8;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_2451BB9D4()
{
  uint64_t v1 = *(void *)(v0 + 304);
  sub_2451A133C(v0 + 80);
  return MEMORY[0x270FA2498](sub_2451BBA40, v1, 0);
}

uint64_t sub_2451BBA40()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451BBAB8(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a2;
    v10[4] = sub_2451BD288;
    v10[5] = v4;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BBCE4;
    v10[3] = &unk_26F9EAAE0;
    uint64_t v5 = _Block_copy(v10);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v3, sel_listCredentialUUIDAndNamesWithReply_, v5);
    _Block_release(v5);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *unint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_2451BBC20(uint64_t result, void *a2, uint64_t a3)
{
  if (result)
  {
    **(void **)(*(void *)(a3 + 64) + 40) = result;
    swift_bridgeObjectRetain();
    return swift_continuation_throwingResume();
  }
  else if (a2)
  {
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v4 = a2;
    id v5 = a2;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2451BBCE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2451BED90();
    uint64_t v4 = sub_2451BEE70();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t CredentialSession.provisionCredential(configurationUUID:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_2451BBDA0, v4, 0);
}

uint64_t sub_2451BBDA0()
{
  uint64_t v2 = v0[4];
  unint64_t v1 = v0[5];
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    uint64_t v4 = v0[6];
    uint64_t v5 = v0[3];
    id v6 = (void *)swift_task_alloc();
    v0[7] = v6;
    v6[2] = v4;
    v6[3] = v5;
    v6[4] = v2;
    v6[5] = v1;
    uint64_t v12 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECB6A8 + dword_268ECB6A8);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[8] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_2451BBF10;
    uint64_t v8 = v0[2];
    return v12(v8, (int *)&unk_268ECBB00);
  }
  else
  {
    sub_24519E3CC();
    swift_allocError();
    *uint64_t v10 = 20;
    swift_willThrow();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_2451BBF10()
{
  uint64_t v2 = (void *)*v1;
  v2[9] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[6];
    return MEMORY[0x270FA2498](sub_2451BC04C, v3, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_2451BC04C()
{
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451BC0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[23] = a4;
  v5[24] = a5;
  v5[21] = a2;
  v5[22] = a3;
  v5[20] = a1;
  sub_24519E6AC((uint64_t *)&unk_268ECB840);
  v5[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451BC150, a2, 0);
}

uint64_t sub_2451BC150()
{
  uint64_t v1 = *(void *)(v0 + 192);
  long long v5 = *(_OWORD *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 168) + 112;
  swift_beginAccess();
  sub_2451A12D0(v2, v0 + 80);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 208) = v3;
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v1;
  return MEMORY[0x270FA2498](sub_2451BC208, 0, 0);
}

uint64_t sub_2451BC208()
{
  uint64_t v1 = *(void *)(v0 + 208);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 152;
  *(void *)(v0 + 24) = sub_2451BC2CC;
  uint64_t v2 = swift_continuation_init();
  sub_2451AD59C(v2, (void **)(v0 + 80), (void (*)(void *, uint64_t))sub_2451BCF38, v1);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2451BC2CC()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2451BC54C;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = (uint64_t)(v1 + 10);
    uint64_t v6 = v1[21];
    v1[28] = v1[19];
    swift_task_dealloc();
    sub_2451A133C(v5);
    uint64_t v3 = sub_2451BC414;
    uint64_t v4 = v6;
  }
  return MEMORY[0x270FA2498](v3, v4, 0);
}

uint64_t sub_2451BC414()
{
  uint64_t v1 = *(void *)(v0 + 200);
  sub_2451A2C6C(*(id *)(v0 + 224), v1);
  uint64_t v2 = type metadata accessor for CredentialSession.Credential();
  int v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  uint64_t v4 = *(void **)(v0 + 224);
  uint64_t v5 = *(void *)(v0 + 200);
  if (v3 == 1)
  {
    sub_2451BCF44(*(void *)(v0 + 200));
    sub_24519E3CC();
    swift_allocError();
    unsigned char *v6 = 4;
    swift_willThrow();
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 160);

    sub_2451B70AC(v5, v8);
  }
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2451BC54C()
{
  uint64_t v1 = *(void *)(v0 + 168);
  sub_2451A133C(v0 + 80);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2451BC5C4, v1, 0);
}

uint64_t sub_2451BC5C4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451BC628(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2451A153C;
  return sub_2451BC0B0(a1, v4, v5, v7, v6);
}

void sub_2451BC6E8(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    uint64_t v4 = (void *)sub_2451BEC40();
    uint64_t v5 = (void *)sub_2451BEE40();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a2;
    v11[4] = sub_2451BCFB4;
    v11[5] = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_2451AD974;
    v11[3] = &unk_26F9EAA40;
    uint64_t v7 = _Block_copy(v11);
    swift_release();
    objc_msgSend(v3, sel_createCredentialWithServerConfigUUID_friendlyName_reply_, v4, v5, v7);
    _Block_release(v7);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v8 = swift_allocError();
    unsigned char *v9 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    *uint64_t v10 = v8;
    swift_continuation_throwingResumeWithError();
  }
}

void *sub_2451BC88C(void *result, void *a2, uint64_t a3)
{
  if (result)
  {
    **(void **)(*(void *)(a3 + 64) + 40) = result;
    id v3 = result;
    return (void *)swift_continuation_throwingResume();
  }
  else if (a2)
  {
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return (void *)swift_continuation_throwingResumeWithError();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CredentialSession.deleteCredential(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2451BC970, v1, 0);
}

uint64_t sub_2451BC970()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  uint64_t v4 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECB670 + dword_268ECB670);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2451BCA44;
  return v4((uint64_t)v4, dword_268ECBB18);
}

uint64_t sub_2451BCA44()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = sub_24519E9E4;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 24);
    swift_task_dealloc();
    uint64_t v4 = sub_24519FF20;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2451BCB68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 152) = a2;
  *(void *)(v3 + 160) = a3;
  return MEMORY[0x270FA2498](sub_2451BCB84, a2, 0);
}

uint64_t sub_2451BCB84()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[19] + 112;
  swift_beginAccess();
  sub_2451A12D0(v2, (uint64_t)(v0 + 10));
  uint64_t v3 = swift_task_alloc();
  v0[21] = v3;
  *(void *)(v3 + 16) = v1;
  return MEMORY[0x270FA2498](sub_2451BCC28, 0, 0);
}

uint64_t sub_2451BCC28()
{
  uint64_t v1 = *(void *)(v0 + 168);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_24519EBC4;
  uint64_t v2 = swift_continuation_init();
  sub_2451AD574(v2, (void **)(v0 + 80), (void (*)(void *, uint64_t))sub_2451BCF08, v1);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2451BCCE4()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24519EE5C;
  *(_OWORD *)(v2 + 152) = v3;
  return MEMORY[0x270FA2498](sub_2451BCB84, v3, 0);
}

void sub_2451BCD90(void **a1, uint64_t a2)
{
  long long v3 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    uint64_t v4 = (void *)sub_2451BEC40();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a2;
    v10[4] = sub_2451AB0D8;
    v10[5] = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_2451BB048;
    v10[3] = &unk_26F9EA9F0;
    id v6 = _Block_copy(v10);
    swift_release();
    objc_msgSend(v3, sel_deleteCredential_reply_, v4, v6);
    _Block_release(v6);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24519E3CC();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = 7;
    sub_24519E6AC(&qword_268ECB5E8);
    swift_allocError();
    uint64_t *v9 = v7;
    swift_continuation_throwingResumeWithError();
  }
}

void sub_2451BCF08(void **a1, uint64_t a2)
{
}

uint64_t sub_2451BCF10()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451BCF20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2451BCF30()
{
  return swift_release();
}

void sub_2451BCF38(void **a1, uint64_t a2)
{
}

uint64_t sub_2451BCF44(uint64_t a1)
{
  uint64_t v2 = sub_24519E6AC((uint64_t *)&unk_268ECB840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2451BCFA4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void *sub_2451BCFB4(void *a1, void *a2)
{
  return sub_2451BC88C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2451BCFBC(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_24519E6AC(&qword_268ECBB28);
  uint64_t v10 = *(void *)(type metadata accessor for CredentialSession.Credential() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2451BEFE0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for CredentialSession.Credential() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2451BD290(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2451BD224()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 48)) {
    sub_2451A142C(v0 + 24);
  }

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2451BD26C(void *a1)
{
  return sub_2451A8664(a1, v1 + 16, *(void *)(v1 + 64));
}

uint64_t sub_2451BD278()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451BD288(uint64_t a1, void *a2)
{
  return sub_2451BBC20(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2451BD290(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for CredentialSession.Credential() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2451BF010();
  __break(1u);
  return result;
}

uint64_t sub_2451BD400()
{
  type metadata accessor for SECClient();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 32) = 0;
  uint64_t result = swift_unknownObjectWeakInit();
  qword_268ECC6C8 = v0;
  return result;
}

uint64_t static SECClient.serviceName.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_268ECBB30;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static SECClient.serviceName.setter(uint64_t a1, void *a2)
{
  qword_268ECBB30 = a1;
  off_268ECBB38 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SECClient.serviceName.modify())()
{
  return j__swift_endAccess;
}

void sub_2451BD558()
{
  uint64_t v1 = v0;
  if (*(void *)(v0 + 16))
  {
    if (qword_268ECB5D0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2451BECA0();
    sub_2451A1298(v2, (uint64_t)qword_268ECBB40);
    long long v3 = sub_2451BEC80();
    os_log_type_t v4 = sub_2451BEF10();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_24519C000, v3, v4, "SEC XPC: Already connected", v5, 2u);
      MEMORY[0x245699AC0](v5, -1, -1);
    }

    unint64_t v6 = *(void **)(v1 + 16);
    if (v6) {
      id v7 = v6;
    }
    else {
      __break(1u);
    }
  }
  else
  {
    if (qword_268ECB5C0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2451BECA0();
    sub_2451A1298(v8, (uint64_t)qword_268ECC6A0);
    uint64_t v9 = sub_2451BEC80();
    os_log_type_t v10 = sub_2451BEF10();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl(&dword_24519C000, v9, v10, "SEC XPC: Starting new connection", v11, 2u);
      MEMORY[0x245699AC0](v11, -1, -1);
    }

    swift_beginAccess();
    id v12 = objc_allocWithZone(MEMORY[0x263F08D68]);
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)sub_2451BEE40();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v12, sel_initWithMachServiceName_options_, v13, 4096);

    BOOL v15 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = v14;

    uint64_t v16 = *(void **)(v1 + 16);
    if (v16)
    {
      unint64_t v17 = self;
      id v18 = v16;
      id v19 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_26F9ED6E0);
      unint64_t v20 = (void *)sub_2451A23CC();
      uint64_t v21 = (void *)sub_2451A2694();
      objc_msgSend(v19, sel_setInterface_forSelector_argumentIndex_ofReply_, v21, sel_queueSessionWithCallbackProxy_reply_, 0, 0);

      objc_msgSend(v19, sel_setInterface_forSelector_argumentIndex_ofReply_, v20, sel_queueSessionWithCallbackProxy_reply_, 0, 1);
      id v22 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_26F9ED740);
      objc_msgSend(v19, sel_setInterface_forSelector_argumentIndex_ofReply_, v22, sel_acquirePresentmentIntentAssertionWithReply_, 0, 1);

      objc_msgSend(v18, sel_setRemoteObjectInterface_, v19);
      unint64_t v23 = (void *)sub_2451A2694();
      objc_msgSend(v18, sel_setExportedInterface_, v23);

      objc_msgSend(v18, sel_setExportedObject_, v1);
      uint64_t v37 = sub_2451BE740;
      uint64_t v38 = v1;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v34 = 1107296256;
      uint64_t v35 = sub_2451AEE74;
      uint64_t v36 = &unk_26F9EAB58;
      uint64_t v24 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v18, sel_setInterruptionHandler_, v24);
      _Block_release(v24);
      uint64_t v37 = sub_2451BE794;
      uint64_t v38 = v1;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v34 = 1107296256;
      uint64_t v35 = sub_2451AEE74;
      uint64_t v36 = &unk_26F9EAB80;
      uint64_t v25 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v18, sel_setInvalidationHandler_, v25);
      _Block_release(v25);
      objc_msgSend(v18, sel_activate);
      if (qword_268ECB5D0 != -1) {
        swift_once();
      }
      sub_2451A1298(v8, (uint64_t)qword_268ECBB40);
      uint64_t v26 = sub_2451BEC80();
      os_log_type_t v27 = sub_2451BEF10();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_24519C000, v26, v27, "SEC XPC: Connection activated", v28, 2u);
        MEMORY[0x245699AC0](v28, -1, -1);
      }
    }
    else
    {
      if (qword_268ECB5D0 != -1) {
        swift_once();
      }
      sub_2451A1298(v8, (uint64_t)qword_268ECBB40);
      uint64_t v29 = sub_2451BEC80();
      os_log_type_t v30 = sub_2451BEF40();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_24519C000, v29, v30, "Unable to start a new xpc connection", v31, 2u);
        MEMORY[0x245699AC0](v31, -1, -1);
      }

      sub_24519E3CC();
      swift_allocError();
      unsigned char *v32 = 21;
      swift_willThrow();
    }
  }
}

uint64_t sub_2451BDBB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_2451BDBD0, 0, 0);
}

uint64_t sub_2451BDBD0()
{
  uint64_t v1 = MEMORY[0x245699BA0](*(void *)(v0 + 24) + 24);
  *(void *)(v0 + 32) = v1;
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2451BDC80, v1, 0);
  }
  else
  {
    **(unsigned char **)(v0 + 16) = 1;
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_2451BDC80()
{
  if (qword_268ECB5C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2451BECA0();
  sub_2451A1298(v0, (uint64_t)qword_268ECC6A0);
  os_log_type_t v1 = sub_2451BEF20();
  uint64_t v2 = sub_2451BEC80();
  if (os_log_type_enabled(v2, v1))
  {
    long long v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_24519C000, v2, v1, "XPC interrupted", v3, 2u);
    MEMORY[0x245699AC0](v3, -1, -1);
  }

  swift_unknownObjectRelease();
  return MEMORY[0x270FA2498](sub_2451BEBA4, 0, 0);
}

uint64_t sub_2451BDDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2451BEEB0();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  os_log_type_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  int v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  swift_retain();
  if (v11 == 1)
  {
    sub_2451BE89C((uint64_t)v7);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    sub_2451BEEA0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (v10[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_2451BEE90();
      uint64_t v13 = v14;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = v10;
  sub_24519E6AC(&qword_268ECBB78);
  if (v13 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v13;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2451BDFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_2451BDFFC, 0, 0);
}

uint64_t sub_2451BDFFC()
{
  uint64_t v1 = MEMORY[0x245699BA0](*(void *)(v0 + 24) + 24);
  *(void *)(v0 + 32) = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_2451BE0E0;
    return sub_2451B2540(0);
  }
  else
  {
    **(unsigned char **)(v0 + 16) = 1;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_2451BE0E0()
{
  swift_task_dealloc();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA2498](sub_2451BE1F8, 0, 0);
}

uint64_t sub_2451BE1F8()
{
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 32) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SECClient.deinit()
{
  sub_2451BE248(v0 + 24);
  return v0;
}

uint64_t sub_2451BE248(uint64_t a1)
{
  return a1;
}

uint64_t SECClient.__deallocating_deinit()
{
  sub_2451BE248(v0 + 24);

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for SECClient()
{
  return self;
}

uint64_t method lookup function for SECClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SECClient);
}

uint64_t sub_2451BE2EC()
{
  uint64_t v0 = sub_2451BECA0();
  sub_2451BAF2C(v0, qword_268ECBB40);
  sub_2451A1298(v0, (uint64_t)qword_268ECBB40);
  return sub_2451BEC90();
}

uint64_t sub_2451BE36C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *long long v3 = v2;
  v3[1] = sub_2451BE44C;
  return v5(v2 + 32);
}

uint64_t sub_2451BE44C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  long long v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_2451BE560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2451BD558();
  uint64_t v6 = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  v11[4] = sub_2451AB198;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_24519E644;
  v11[3] = &unk_26F9EAB30;
  uint64_t v8 = _Block_copy(v11);
  swift_release();
  id v9 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);

  sub_2451BEFA0();
  swift_unknownObjectRelease();
  sub_24519E6AC(&qword_268ECB5F0);
  if ((swift_dynamicCast() & 1) == 0) {
    uint64_t v12 = 0;
  }
  sub_2451B13B4(&v12, a1, a3);
  return swift_unknownObjectRelease();
}

uint64_t sub_2451BE718()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2451BE728(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2451BE738()
{
  return swift_release();
}

uint64_t sub_2451BE740()
{
  return sub_2451BDDA8(v0, (uint64_t)&unk_26F9EAC08, (uint64_t)&unk_26F9EAC30, (uint64_t)&unk_268ECBB88);
}

uint64_t sub_2451BE794()
{
  return sub_2451BDDA8(v0, (uint64_t)&unk_26F9EABB8, (uint64_t)&unk_26F9EABE0, (uint64_t)&unk_268ECBB60);
}

uint64_t sub_2451BE7EC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_2451A153C;
  return MEMORY[0x270FA2498](sub_2451BDFFC, 0, 0);
}

uint64_t sub_2451BE89C(uint64_t a1)
{
  uint64_t v2 = sub_24519E6AC(&qword_268ECB7C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2451BE8FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2451BE934(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2451A153C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECBB68 + dword_268ECBB68);
  return v6(a1, v4);
}

uint64_t sub_2451BE9F0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2451BEA30(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_2451A153C;
  return MEMORY[0x270FA2498](sub_2451BDBD0, 0, 0);
}

uint64_t sub_2451BEAE0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24519EE5C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECBB68 + dword_268ECBB68);
  return v6(a1, v4);
}

uint64_t sub_2451BEBB0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2451BEBC0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2451BEBD0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2451BEBE0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2451BEBF0()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_2451BEC00()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2451BEC10()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2451BEC20()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2451BEC30()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2451BEC40()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2451BEC50()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2451BEC60()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2451BEC70()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2451BEC80()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2451BEC90()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2451BECA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2451BECB0()
{
  return MEMORY[0x270F5BFF0]();
}

uint64_t sub_2451BECC0()
{
  return MEMORY[0x270F5BFF8]();
}

uint64_t sub_2451BECD0()
{
  return MEMORY[0x270F5C000]();
}

uint64_t sub_2451BECE0()
{
  return MEMORY[0x270F5C008]();
}

uint64_t sub_2451BECF0()
{
  return MEMORY[0x270F5C010]();
}

uint64_t sub_2451BED00()
{
  return MEMORY[0x270F5C018]();
}

uint64_t sub_2451BED10()
{
  return MEMORY[0x270F5C020]();
}

uint64_t sub_2451BED20()
{
  return MEMORY[0x270F5C058]();
}

uint64_t sub_2451BED30()
{
  return MEMORY[0x270F5C060]();
}

uint64_t sub_2451BED40()
{
  return MEMORY[0x270F5C068]();
}

uint64_t sub_2451BED50()
{
  return MEMORY[0x270F5C070]();
}

uint64_t sub_2451BED60()
{
  return MEMORY[0x270F5C078]();
}

uint64_t sub_2451BED70()
{
  return MEMORY[0x270F5C080]();
}

uint64_t sub_2451BED80()
{
  return MEMORY[0x270F5C088]();
}

uint64_t sub_2451BED90()
{
  return MEMORY[0x270F5C090]();
}

uint64_t sub_2451BEDA0()
{
  return MEMORY[0x270F5C0C8]();
}

uint64_t sub_2451BEDB0()
{
  return MEMORY[0x270F5C0D0]();
}

uint64_t sub_2451BEDC0()
{
  return MEMORY[0x270F5C0D8]();
}

uint64_t sub_2451BEDD0()
{
  return MEMORY[0x270F5C0E0]();
}

uint64_t sub_2451BEDE0()
{
  return MEMORY[0x270F5C0E8]();
}

uint64_t sub_2451BEDF0()
{
  return MEMORY[0x270F5C0F0]();
}

uint64_t sub_2451BEE00()
{
  return MEMORY[0x270F5C0F8]();
}

uint64_t sub_2451BEE10()
{
  return MEMORY[0x270F5C100]();
}

uint64_t sub_2451BEE20()
{
  return MEMORY[0x270F5C108]();
}

uint64_t sub_2451BEE40()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2451BEE50()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2451BEE60()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2451BEE70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2451BEE80()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2451BEE90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2451BEEA0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2451BEEB0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2451BEEC0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_2451BEED0()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_2451BEEE0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_2451BEEF0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2451BEF00()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_2451BEF10()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2451BEF20()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2451BEF30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2451BEF40()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2451BEF50()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2451BEF60()
{
  return MEMORY[0x270EF2068]();
}

uint64_t sub_2451BEF70()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2451BEF80()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2451BEF90()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2451BEFA0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2451BEFB0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2451BEFC0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2451BEFD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2451BEFE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2451BEFF0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2451BF000()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2451BF010()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2451BF020()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2451BF030()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2451BF050()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2451BF060()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2451BF070()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2451BF080()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2451BF090()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2451BF0A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2451BF0B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2451BF0C0()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
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

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x270FA02A0]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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