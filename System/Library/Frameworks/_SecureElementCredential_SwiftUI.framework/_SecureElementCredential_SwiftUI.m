uint64_t View.transactionTask(_:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  KeyPath = swift_getKeyPath();
  v21 = 0;
  swift_retain();
  swift_retain();
  sub_2466EE1B8(&qword_268F9B6B8);
  sub_2466F44C8();
  v11 = v14;
  v12 = v15;
  v14 = a1;
  v15 = a2;
  v16 = a3;
  v17 = v11;
  v18 = v12;
  v19 = KeyPath;
  v20 = 0;
  MEMORY[0x24C534C60](&v14, a4, &type metadata for CredentialTransactionTaskModifier, a5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t CredentialSession.configuration()()
{
  type metadata accessor for CredentialTransaction.Configuration();
  swift_allocObject();
  swift_retain();
  v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_2466EDFDC;
  return sub_2466EE414(v0);
}

uint64_t sub_2466EDFDC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_2466EE0DC()
{
  uint64_t v0 = sub_2466F4418();
  sub_2466EE2A8(v0, qword_268F9B7D8);
  sub_2466EE30C(v0, (uint64_t)qword_268F9B7D8);
  return sub_2466F4408();
}

uint64_t sub_2466EE15C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2466F4468();
  *a1 = result;
  return result;
}

uint64_t sub_2466EE188(id *a1)
{
  id v1 = *a1;
  return sub_2466F4478();
}

uint64_t sub_2466EE1B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2466EE1FC()
{
  return swift_getWitnessTable();
}

unint64_t sub_2466EE254()
{
  unint64_t result = qword_268F9B6C8;
  if (!qword_268F9B6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268F9B6C8);
  }
  return result;
}

uint64_t *sub_2466EE2A8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2466EE30C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL sub_2466EE344(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2466EE35C()
{
  return sub_2466F4648();
}

uint64_t sub_2466EE3A4()
{
  return sub_2466F4638();
}

uint64_t sub_2466EE3D0()
{
  return sub_2466F4648();
}

uint64_t sub_2466EE414(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_2466EE434, 0, 0);
}

uint64_t sub_2466EE434()
{
  v16 = v0;
  uint64_t v1 = v0[4];
  *(void *)(v1 + 16) = v0[3];
  uint64_t v2 = sub_2466F4368();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = swift_task_alloc();
  swift_retain();
  sub_2466F4358();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1 + OBJC_IVAR____TtCC32_SecureElementCredential_SwiftUI21CredentialTransaction13Configuration_identifier, v4, v2);
  swift_task_dealloc();
  *(unsigned char *)(v1 + OBJC_IVAR____TtCC32_SecureElementCredential_SwiftUI21CredentialTransaction13Configuration_state) = 0;
  if (qword_268F9B6B0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2466F4418();
  sub_2466EE30C(v5, (uint64_t)qword_268F9B7D8);
  swift_retain_n();
  v6 = sub_2466F43F8();
  os_log_type_t v7 = sub_2466F4578();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_2466F4338();
    v0[2] = sub_2466F0D70(v10, v11, &v15);
    sub_2466F45A8();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_2466EC000, v6, v7, "Returning new configuration with identifier %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5350F0](v9, -1, -1);
    MEMORY[0x24C5350F0](v8, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  swift_release();

  v12 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v13 = v0[4];
  return v12(v13);
}

uint64_t sub_2466EE6F4()
{
  v1[5] = v0;
  uint64_t v2 = sub_2466F43D8();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2466EE7C4, 0, 0);
}

uint64_t sub_2466EE7C4()
{
  v22 = v0;
  uint64_t v1 = v0[5];
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtCC32_SecureElementCredential_SwiftUI21CredentialTransaction13Configuration_state))
  {
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2466F4418();
    sub_2466EE30C(v2, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    uint64_t v3 = sub_2466F43F8();
    os_log_type_t v4 = sub_2466F4578();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315138;
      uint64_t v21 = v6;
      uint64_t v7 = sub_2466F4338();
      v0[2] = sub_2466F0D70(v7, v8, &v21);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2466EC000, v3, v4, "Configuration %s has been invalidated", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v6, -1, -1);
      MEMORY[0x24C5350F0](v5, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtCC32_SecureElementCredential_SwiftUI21CredentialTransaction13Configuration_state) = 1;
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2466F4418();
    v0[10] = sub_2466EE30C(v9, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    uint64_t v10 = sub_2466F43F8();
    os_log_type_t v11 = sub_2466F4578();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)v12 = 136315138;
      uint64_t v21 = v13;
      uint64_t v14 = sub_2466F4338();
      v0[4] = sub_2466F0D70(v14, v15, &v21);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2466EC000, v10, v11, "Invalidating configuration %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v13, -1, -1);
      MEMORY[0x24C5350F0](v12, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    v0[11] = *(void *)(v0[5] + 16);
    v20 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F16CA8] + MEMORY[0x263F16CA8]);
    v18 = (void *)swift_task_alloc();
    v0[12] = v18;
    void *v18 = v0;
    v18[1] = sub_2466EEC00;
    uint64_t v19 = v0[9];
    return v20(v19);
  }
}

uint64_t sub_2466EEC00()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2466EECFC, 0, 0);
}

uint64_t sub_2466EECFC()
{
  v26 = v0;
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v1, v0[9], v2);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  if (v4 == *MEMORY[0x263F16C90])
  {
    (*(void (**)(void, void))(v0[7] + 96))(v0[8], v0[6]);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[13] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_2466EF164;
    return MEMORY[0x270EFD350]();
  }
  else if (v4 == *MEMORY[0x263F16C98])
  {
    (*(void (**)(void, void))(v0[7] + 96))(v0[8], v0[6]);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[15] = v6;
    void *v6 = v0;
    v6[1] = sub_2466EF334;
    return MEMORY[0x270EFD340]();
  }
  else
  {
    if (v4 == *MEMORY[0x263F16C88])
    {
      swift_retain_n();
      uint64_t v7 = sub_2466F43F8();
      os_log_type_t v8 = sub_2466F4578();
      BOOL v9 = os_log_type_enabled(v7, v8);
      uint64_t v10 = v0[9];
      uint64_t v11 = v0[6];
      uint64_t v12 = v0[7];
      if (v9)
      {
        uint64_t v24 = v0[6];
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315138;
        uint64_t v25 = v14;
        uint64_t v15 = sub_2466F4338();
        v0[3] = sub_2466F0D70(v15, v16, &v25);
        sub_2466F45A8();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_2466EC000, v7, v8, "Configuration %s is being invalidated in management session state, no-op", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5350F0](v14, -1, -1);
        MEMORY[0x24C5350F0](v13, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v24);
      }
      else
      {

        swift_release_n();
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
      }
      swift_task_dealloc();
      swift_task_dealloc();
      v22 = (uint64_t (*)(void))v0[1];
    }
    else
    {
      if (v4 != *MEMORY[0x263F16CA0]) {
        (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
      }
      uint64_t v17 = v0[9];
      uint64_t v18 = v0[6];
      uint64_t v19 = v0[7];
      uint64_t v20 = sub_2466F43E8();
      sub_2466F13C8();
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, *MEMORY[0x263F16CB0], v20);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
      swift_task_dealloc();
      swift_task_dealloc();
      v22 = (uint64_t (*)(void))v0[1];
    }
    return v22();
  }
}

uint64_t sub_2466EF164()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2466EF448;
  }
  else {
    uint64_t v2 = sub_2466EF278;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2466EF278()
{
  uint64_t v1 = v0[8];
  (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
  uint64_t v2 = sub_2466F4388();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2466EF334()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2466EF504;
  }
  else {
    uint64_t v2 = sub_2466F1D48;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2466EF448()
{
  uint64_t v1 = v0[8];
  (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
  uint64_t v2 = sub_2466F4388();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2466EF504()
{
  uint64_t v1 = v0[8];
  (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
  uint64_t v2 = sub_2466F4388();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t static CredentialTransaction.Configuration.== infix(_:_:)()
{
  return sub_2466F4348() & 1;
}

uint64_t CredentialTransaction.Configuration.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtCC32_SecureElementCredential_SwiftUI21CredentialTransaction13Configuration_identifier;
  uint64_t v2 = sub_2466F4368();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t CredentialTransaction.Configuration.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtCC32_SecureElementCredential_SwiftUI21CredentialTransaction13Configuration_identifier;
  uint64_t v2 = sub_2466F4368();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2466EF700()
{
  return sub_2466F4348() & 1;
}

uint64_t sub_2466EF734(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return MEMORY[0x270FA2498](sub_2466EF758, 0, 0);
}

uint64_t sub_2466EF758()
{
  v26 = v0;
  uint64_t v1 = v0[9];
  unint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 24);
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2466F4418();
    sub_2466EE30C(v4, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_2466F43F8();
    os_log_type_t v6 = sub_2466F4568();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v25[0] = v24;
      *(_DWORD *)uint64_t v7 = 136315650;
      v0[4] = sub_2466F0D70(0xD000000000000022, 0x80000002466F4F50, v25);
      sub_2466F45A8();
      *(_WORD *)(v7 + 12) = 2080;
      uint64_t v8 = sub_2466F4338();
      v0[5] = sub_2466F0D70(v8, v9, v25);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v7 + 22) = 2080;
      swift_bridgeObjectRetain();
      v0[6] = sub_2466F0D70(v3, v2, v25);
      sub_2466F45A8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2466EC000, v5, v6, "%s Configuration %s, scene identifier %s", (uint8_t *)v7, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v24, -1, -1);
      MEMORY[0x24C5350F0](v7, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    v0[10] = *(void *)(*(void *)(v0[9] + 16) + 16);
    swift_retain();
    uint64_t v17 = (void *)swift_task_alloc();
    v0[11] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_2466EFCDC;
    uint64_t v19 = v0[7];
    uint64_t v18 = v0[8];
    return MEMORY[0x270EFD348](v19, v3, v2, v18);
  }
  else
  {
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2466F4418();
    sub_2466EE30C(v10, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    uint64_t v11 = sub_2466F43F8();
    os_log_type_t v12 = sub_2466F4588();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v25[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      v0[2] = sub_2466F0D70(0xD000000000000022, 0x80000002466F4F50, v25);
      sub_2466F45A8();
      *(_WORD *)(v13 + 12) = 2080;
      uint64_t v15 = sub_2466F4338();
      v0[3] = sub_2466F0D70(v15, v16, v25);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2466EC000, v11, v12, "%s Configuration %s no scene identifier", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v14, -1, -1);
      MEMORY[0x24C5350F0](v13, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v20 = sub_2466F43E8();
    sub_2466F13C8();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, *MEMORY[0x263F16CB8], v20);
    swift_willThrow();
    v22 = (uint64_t (*)(void))v0[1];
    return v22();
  }
}

uint64_t sub_2466EFCDC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2466EFE18, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2466EFE18()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2466EFE7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  return MEMORY[0x270FA2498](sub_2466EFEA0, 0, 0);
}

uint64_t sub_2466EFEA0()
{
  uint64_t v27 = v0;
  uint64_t v1 = v0[10];
  unint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 24);
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2466F4418();
    sub_2466EE30C(v4, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_2466F43F8();
    os_log_type_t v6 = sub_2466F4568();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v26[0] = v25;
      *(_DWORD *)uint64_t v7 = 136315650;
      v0[4] = sub_2466F0D70(0xD000000000000031, 0x80000002466F4F80, v26);
      sub_2466F45A8();
      *(_WORD *)(v7 + 12) = 2080;
      uint64_t v8 = sub_2466F4338();
      v0[5] = sub_2466F0D70(v8, v9, v26);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v7 + 22) = 2080;
      swift_bridgeObjectRetain();
      v0[6] = sub_2466F0D70(v3, v2, v26);
      sub_2466F45A8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2466EC000, v5, v6, "%s Configuration %s, scene identifier %s", (uint8_t *)v7, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v25, -1, -1);
      MEMORY[0x24C5350F0](v7, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    v0[11] = *(void *)(*(void *)(v0[10] + 16) + 16);
    swift_retain();
    uint64_t v17 = (void *)swift_task_alloc();
    v0[12] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_2466F0428;
    uint64_t v18 = v0[8];
    uint64_t v19 = v0[9];
    uint64_t v20 = v0[7];
    return MEMORY[0x270EFD358](v20, v3, v2, v18, v19);
  }
  else
  {
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2466F4418();
    sub_2466EE30C(v10, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    uint64_t v11 = sub_2466F43F8();
    os_log_type_t v12 = sub_2466F4588();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v26[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      v0[2] = sub_2466F0D70(0xD000000000000031, 0x80000002466F4F80, v26);
      sub_2466F45A8();
      *(_WORD *)(v13 + 12) = 2080;
      uint64_t v15 = sub_2466F4338();
      v0[3] = sub_2466F0D70(v15, v16, v26);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2466EC000, v11, v12, "%s Configuration %s no scene identifier", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v14, -1, -1);
      MEMORY[0x24C5350F0](v13, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v21 = sub_2466F43E8();
    sub_2466F13C8();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v21 - 8) + 104))(v22, *MEMORY[0x263F16CB8], v21);
    swift_willThrow();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
}

uint64_t sub_2466F0428()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2466F0564, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2466F0564()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2466F05C8(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return MEMORY[0x270FA2498](sub_2466F05E8, 0, 0);
}

uint64_t sub_2466F05E8()
{
  uint64_t v25 = v0;
  uint64_t v1 = v0[8];
  unint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 24);
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2466F4418();
    sub_2466EE30C(v4, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_2466F43F8();
    os_log_type_t v6 = sub_2466F4568();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v24[0] = v23;
      *(_DWORD *)uint64_t v7 = 136315650;
      v0[4] = sub_2466F0D70(0xD00000000000003ELL, 0x80000002466F4FC0, v24);
      sub_2466F45A8();
      *(_WORD *)(v7 + 12) = 2080;
      uint64_t v8 = sub_2466F4338();
      v0[5] = sub_2466F0D70(v8, v9, v24);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v7 + 22) = 2080;
      swift_bridgeObjectRetain();
      v0[6] = sub_2466F0D70(v3, v2, v24);
      sub_2466F45A8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2466EC000, v5, v6, "%s Configuration %s, scene identifier %s", (uint8_t *)v7, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v23, -1, -1);
      MEMORY[0x24C5350F0](v7, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    v0[9] = *(void *)(*(void *)(v0[8] + 16) + 16);
    swift_retain();
    uint64_t v17 = (void *)swift_task_alloc();
    v0[10] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_2466F0B68;
    uint64_t v18 = v0[7];
    return MEMORY[0x270EFD330](v3, v2, v18);
  }
  else
  {
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2466F4418();
    sub_2466EE30C(v10, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    uint64_t v11 = sub_2466F43F8();
    os_log_type_t v12 = sub_2466F4588();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v24[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      v0[2] = sub_2466F0D70(0xD00000000000003ELL, 0x80000002466F4FC0, v24);
      sub_2466F45A8();
      *(_WORD *)(v13 + 12) = 2080;
      uint64_t v15 = sub_2466F4338();
      v0[3] = sub_2466F0D70(v15, v16, v24);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2466EC000, v11, v12, "%s Configuration %s no scene identifier", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v14, -1, -1);
      MEMORY[0x24C5350F0](v13, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v19 = sub_2466F43E8();
    sub_2466F13C8();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v19 - 8) + 104))(v20, *MEMORY[0x263F16CB8], v19);
    swift_willThrow();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
}

uint64_t sub_2466F0B68()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2466F0CA4, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2466F0CA4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t CredentialTransaction.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CredentialTransaction.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2466F0D70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2466F0E44(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2466F1CE8((uint64_t)v12, *a3);
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
      sub_2466F1CE8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2466F1C98((uint64_t)v12);
  return v7;
}

uint64_t sub_2466F0E44(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2466F45B8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2466F1000(a5, a6);
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
  uint64_t v8 = sub_2466F45D8();
  if (!v8)
  {
    sub_2466F45E8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2466F45F8();
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

uint64_t sub_2466F1000(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2466F1098(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2466F1278(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2466F1278(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2466F1098(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2466F1210(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2466F45C8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2466F45E8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2466F44F8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2466F45F8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2466F45E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2466F1210(uint64_t a1, uint64_t a2)
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
  sub_2466EE1B8(&qword_268F9B730);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2466F1278(char a1, int64_t a2, char a3, char *a4)
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
    sub_2466EE1B8(&qword_268F9B730);
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
  uint64_t result = sub_2466F45F8();
  __break(1u);
  return result;
}

unint64_t sub_2466F13C8()
{
  unint64_t result = qword_268F9B6D8[0];
  if (!qword_268F9B6D8[0])
  {
    sub_2466F43E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268F9B6D8);
  }
  return result;
}

uint64_t type metadata accessor for CredentialTransaction()
{
  return self;
}

uint64_t method lookup function for CredentialTransaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CredentialTransaction);
}

uint64_t dispatch thunk of CredentialTransaction.performTransaction(using:options:)(uint64_t a1, uint64_t a2)
{
  int64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 96) + **(int **)(*(void *)v2 + 96));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_2466F1D4C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of CredentialTransaction.performTransactionInWiredMode(using:instanceAID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 104)
                                                          + **(int **)(*(void *)v3 + 104));
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *int64_t v8 = v4;
  v8[1] = sub_2466F1D4C;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of CredentialTransaction.performCardEmulationTransactionWithCurrentCredential(options:)(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 112) + **(int **)(*(void *)v1 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2466F1788;
  return v6(a1);
}

uint64_t sub_2466F1788()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2466F187C()
{
  return type metadata accessor for CredentialTransaction.Configuration();
}

uint64_t type metadata accessor for CredentialTransaction.Configuration()
{
  uint64_t result = qword_268F9B710;
  if (!qword_268F9B710) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2466F18D0()
{
  uint64_t result = sub_2466F4368();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CredentialTransaction.Configuration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CredentialTransaction.Configuration);
}

uint64_t dispatch thunk of CredentialTransaction.Configuration.invalidate()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 136) + **(int **)(*(void *)v0 + 136));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_2466F1D4C;
  return v4();
}

unsigned char *initializeBufferWithCopyOfBuffer for CredentialTransaction.Configuration.State(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CredentialTransaction.Configuration.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CredentialTransaction.Configuration.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2466F1BF0);
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

uint64_t sub_2466F1C18(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2466F1C24(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CredentialTransaction.Configuration.State()
{
  return &type metadata for CredentialTransaction.Configuration.State;
}

unint64_t sub_2466F1C44()
{
  unint64_t result = qword_268F9B728;
  if (!qword_268F9B728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9B728);
  }
  return result;
}

uint64_t sub_2466F1C98(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2466F1CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for CredentialTransactionTaskModifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_2466F1D84(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void destroy for CredentialTransactionTaskModifier(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 48);

  sub_2466F1DE8(v2, v3);
}

void sub_2466F1DE8(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t initializeWithCopy for CredentialTransactionTaskModifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  unsigned int v4 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2466F1D84(v4, v5);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = v5;
  return a1;
}

uint64_t assignWithCopy for CredentialTransactionTaskModifier(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v4 = v2[2];
  *(void *)(a1 + 8) = v2[1];
  *(void *)(a1 + 16) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = v2[3];
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = v2[4];
  swift_retain();
  swift_release();
  char v5 = (void *)v2[5];
  LOBYTE(v2) = *((unsigned char *)v2 + 48);
  sub_2466F1D84(v5, (char)v2);
  unsigned int v6 = *(void **)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = (_BYTE)v2;
  sub_2466F1DE8(v6, v7);
  return a1;
}

__n128 initializeWithTake for CredentialTransactionTaskModifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CredentialTransactionTaskModifier(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  char v4 = *(unsigned char *)(a2 + 48);
  char v5 = *(void **)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = v4;
  sub_2466F1DE8(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CredentialTransactionTaskModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CredentialTransactionTaskModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CredentialTransactionTaskModifier()
{
  return &type metadata for CredentialTransactionTaskModifier;
}

uint64_t sub_2466F2070(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_2466F4F00, 1);
}

uint64_t sub_2466F208C(uint64_t a1)
{
  v1[8] = a1;
  v1[9] = sub_2466F4528();
  v1[10] = sub_2466F4518();
  uint64_t v3 = sub_2466F4508();
  v1[11] = v3;
  v1[12] = v2;
  return MEMORY[0x270FA2498](sub_2466F2128, v3, v2);
}

uint64_t sub_2466F2128()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(uint64_t **)(v0 + 64);
  uint64_t v2 = *v1;
  *(void *)(v0 + 104) = *v1;
  if (!v2
    || (*(unsigned char *)(v2 + OBJC_IVAR____TtCC32_SecureElementCredential_SwiftUI21CredentialTransaction13Configuration_state) & 1) != 0)
  {
    swift_release();
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2466F4418();
    sub_2466EE30C(v3, (uint64_t)qword_268F9B7D8);
    char v4 = sub_2466F43F8();
    os_log_type_t v5 = sub_2466F4578();
    if (os_log_type_enabled(v4, v5))
    {
      char v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_2466EC000, v4, v5, "Invalid configuration in transactionTask modifier", v6, 2u);
      MEMORY[0x24C5350F0](v6, -1, -1);
    }

LABEL_8:
    char v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  uint64_t v9 = (void *)v1[5];
  char v10 = *((unsigned char *)v1 + 48);
  swift_retain();
  sub_2466F1D84(v9, v10);
  uint64_t v11 = (void *)sub_2466F3B24(v9, v10);
  *(void *)(v0 + 112) = v11;
  sub_2466F1DE8(v9, v10);
  if (!v11)
  {
    swift_release();
    if (qword_268F9B6B0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_2466F4418();
    sub_2466EE30C(v24, (uint64_t)qword_268F9B7D8);
    swift_retain_n();
    uint64_t v25 = sub_2466F43F8();
    os_log_type_t v26 = sub_2466F4588();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      uint64_t v41 = v28;
      uint64_t v29 = sub_2466F4338();
      *(void *)(v0 + 32) = sub_2466F0D70(v29, v30, &v41);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2466EC000, v25, v26, "No scene session in CredentialTransactionTaskModifier in configuration %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v28, -1, -1);
      MEMORY[0x24C5350F0](v27, -1, -1);

      swift_release();
    }
    else
    {
      swift_release_n();
    }
    goto LABEL_8;
  }
  if (qword_268F9B6B0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2466F4418();
  sub_2466EE30C(v12, (uint64_t)qword_268F9B7D8);
  swift_retain_n();
  id v13 = v11;
  uint64_t v14 = sub_2466F43F8();
  os_log_type_t v15 = sub_2466F4568();
  unint64_t v16 = (SEL *)&unk_2651E3000;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v41 = v40;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v18 = sub_2466F4338();
    *(void *)(v0 + 48) = sub_2466F0D70(v18, v19, &v41);
    sub_2466F45A8();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v17 + 12) = 2080;
    id v20 = objc_msgSend(v13, sel_persistentIdentifier);
    uint64_t v21 = sub_2466F44E8();
    unint64_t v23 = v22;

    *(void *)(v0 + 56) = sub_2466F0D70(v21, v23, &v41);
    sub_2466F45A8();
    unint64_t v16 = (SEL *)&unk_2651E3000;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2466EC000, v14, v15, "Transaction task successfully created for configuration %s and scene Identifier %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5350F0](v40, -1, -1);
    MEMORY[0x24C5350F0](v17, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  uint64_t v31 = *(void *)(v0 + 64);
  swift_retain();
  id v32 = [v13 v16[13]];
  uint64_t v33 = sub_2466F44E8();
  uint64_t v35 = v34;

  type metadata accessor for CredentialTransaction();
  v36 = (void *)swift_allocObject();
  *(void *)(v0 + 120) = v36;
  v36[2] = v2;
  v36[3] = v33;
  v36[4] = v35;
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v31 + 24);
  *(void *)(v0 + 40) = v36;
  swift_retain();
  sub_2466EE1B8(&qword_268F9B778);
  sub_2466F44D8();
  v37 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v37;
  v37[2] = v2;
  v37[3] = v31;
  v37[4] = v36;
  uint64_t v38 = swift_task_alloc();
  *(void *)(v0 + 136) = v38;
  *(void *)(v38 + 16) = v2;
  *(void *)(v38 + 24) = v36;
  *(void *)(v0 + 144) = sub_2466F4518();
  v39 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v39;
  void *v39 = v0;
  v39[1] = sub_2466F27D8;
  return MEMORY[0x270FA2338]();
}

uint64_t sub_2466F27D8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_2466F295C, v3, v2);
}

uint64_t sub_2466F295C()
{
  uint64_t v1 = *(void **)(v0 + 112);
  swift_release();
  swift_release();

  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2466F29E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  sub_2466F4528();
  v4[6] = sub_2466F4518();
  uint64_t v6 = sub_2466F4508();
  v4[7] = v6;
  v4[8] = v5;
  return MEMORY[0x270FA2498](sub_2466F2A7C, v6, v5);
}

uint64_t sub_2466F2A7C()
{
  id v13 = v0;
  if (qword_268F9B6B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2466F4418();
  sub_2466EE30C(v1, (uint64_t)qword_268F9B7D8);
  swift_retain_n();
  uint64_t v2 = sub_2466F43F8();
  os_log_type_t v3 = sub_2466F4578();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v12 = v5;
    uint64_t v6 = sub_2466F4338();
    v0[2] = sub_2466F0D70(v6, v7, &v12);
    sub_2466F45A8();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_2466EC000, v2, v3, "Performing transaction action for configuration %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5350F0](v5, -1, -1);
    MEMORY[0x24C5350F0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v11 = (uint64_t (*)(uint64_t))(*(void *)(v0[4] + 8) + **(int **)(v0[4] + 8));
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2466F2CF0;
  uint64_t v9 = v0[5];
  return v11(v9);
}

uint64_t sub_2466F2CF0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_2466F2E10, v3, v2);
}

uint64_t sub_2466F2E10()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2466F2E74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_2466EE1B8(&qword_268F9B790);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268F9B6B0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2466F4418();
  sub_2466EE30C(v6, (uint64_t)qword_268F9B7D8);
  swift_retain_n();
  unint64_t v7 = sub_2466F43F8();
  os_log_type_t v8 = sub_2466F4578();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v17 = v10;
    uint64_t v11 = sub_2466F4338();
    uint64_t v16 = sub_2466F0D70(v11, v12, &v17);
    sub_2466F45A8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2466EC000, v7, v8, "Invalidating configuration due to transaction task cancellation for configuration %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5350F0](v10, -1, -1);
    MEMORY[0x24C5350F0](v9, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v13 = sub_2466F4558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a2;
  swift_retain();
  sub_2466F3518((uint64_t)v5, (uint64_t)&unk_268F9B7A0, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_2466F3108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 56) = a4;
  return MEMORY[0x270FA2498](sub_2466F3128, 0, 0);
}

uint64_t sub_2466F3128()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2466F31BC;
  return sub_2466EE6F4();
}

uint64_t sub_2466F31BC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2466F32F0, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2466F32F0()
{
  uint64_t v16 = v0;
  if (qword_268F9B6B0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = sub_2466F4418();
  sub_2466EE30C(v2, (uint64_t)qword_268F9B7D8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2466F43F8();
  os_log_type_t v6 = sub_2466F4588();
  BOOL v7 = os_log_type_enabled(v5, v6);
  os_log_type_t v8 = (void *)v0[9];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_2466F4618();
    v0[6] = sub_2466F0D70(v11, v12, &v15);
    sub_2466F45A8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2466EC000, v5, v6, "Error %s found when invalidating configuration due to transaction task cancellation", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5350F0](v10, -1, -1);
    MEMORY[0x24C5350F0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2466F3518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2466F4558();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2466F4548();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2466F40B8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2466F4508();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2466F36BC()
{
  return sub_2466F4428();
}

uint64_t sub_2466F36D4()
{
  return sub_2466F4438();
}

uint64_t sub_2466F36EC()
{
  return sub_2466F4448();
}

uint64_t sub_2466F3708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_2466F4558();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  long long v9 = v2[1];
  long long v16 = *v2;
  *(_OWORD *)uint64_t v17 = v9;
  *(_OWORD *)&v17[16] = v2[2];
  char v18 = *((unsigned char *)v2 + 48);
  sub_2466F3974((uint64_t)&v16, (uint64_t)v19, &qword_268F9B740);
  long long v20 = *(_OWORD *)&v17[8];
  sub_2466F3974((uint64_t)&v20, (uint64_t)v22, &qword_268F9B6B8);
  sub_2466F3974((uint64_t)&v20 + 8, (uint64_t)v21, &qword_268F9B750);
  uint64_t v23 = *(void *)&v17[24];
  char v24 = v18;
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)v17;
  *(_OWORD *)(v10 + 16) = v16;
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = *(_OWORD *)&v17[16];
  *(unsigned char *)(v10 + 64) = v18;
  sub_2466F3AC8((uint64_t)v19);
  sub_2466F3AC8((uint64_t)v19);
  swift_retain();
  sub_2466F3AC8((uint64_t)v22);
  sub_2466F3AC8((uint64_t)v21);
  sub_2466F3AF4((uint64_t)&v23);
  sub_2466F4538();
  unint64_t v12 = (char *)(a2 + *(int *)(sub_2466EE1B8(&qword_268F9B760) + 36));
  uint64_t v13 = sub_2466EE1B8(&qword_268F9B768);
  (*(void (**)(char *, unsigned char *, uint64_t))(v6 + 16))(&v12[*(int *)(v13 + 36)], v8, v5);
  sub_2466F3974((uint64_t)v19, (uint64_t)&v12[*(int *)(v13 + 40)], &qword_268F9B740);
  *(void *)unint64_t v12 = &unk_268F9B758;
  *((void *)v12 + 1) = v10;
  uint64_t v14 = sub_2466EE1B8(&qword_268F9B770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a2, a1, v14);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2466F3974(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2466EE1B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2466F39D8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2466F1DE8(*(id *)(v0 + 56), *(unsigned char *)(v0 + 64));

  return MEMORY[0x270FA0238](v0, 65, 7);
}

uint64_t sub_2466F3A34()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_2466F1788;
  return sub_2466F208C(v0 + 16);
}

uint64_t sub_2466F3AC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2466F3AF4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2466F3B24(void *a1, char a2)
{
  uint64_t v2 = a1;
  if (a2)
  {
    id v14 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v3 = sub_2466F4598();
    uint64_t v4 = sub_2466F44A8();
    os_log_type_t v5 = v3;
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v17 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      sub_2466EE1B8(&qword_268F9B7B8);
      uint64_t v8 = sub_2466F4658();
      uint64_t v16 = sub_2466F0D70(v8, v9, &v17);
      sub_2466F45A8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2466EC000, v4, v5, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5350F0](v7, -1, -1);
      MEMORY[0x24C5350F0](v6, -1, -1);
    }

    uint64_t v10 = sub_2466F4498();
    uint64_t v11 = *(void *)(v10 - 8);
    MEMORY[0x270FA5388](v10);
    uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2466F4488();
    swift_getAtKeyPath();
    sub_2466F1DE8(v2, 0);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v17;
  }
  return (uint64_t)v2;
}

uint64_t sub_2466F3D3C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2466F3E18;
  return v6(a1);
}

uint64_t sub_2466F3E18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2466F3F10(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2466F1788;
  return sub_2466F29E0(a1, v4, v5, v6);
}

uint64_t sub_2466F3FC4()
{
  return sub_2466F2E74(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2466F3FCC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2466F400C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2466F1D4C;
  v3[7] = v2;
  return MEMORY[0x270FA2498](sub_2466F3128, 0, 0);
}

uint64_t sub_2466F40B8(uint64_t a1)
{
  uint64_t v2 = sub_2466EE1B8(&qword_268F9B790);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2466F4118()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2466F4150(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2466F1D4C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268F9B7A8 + dword_268F9B7A8);
  return v6(a1, v4);
}

unint64_t sub_2466F420C()
{
  unint64_t result = qword_268F9B7C0;
  if (!qword_268F9B7C0)
  {
    sub_2466F42AC(&qword_268F9B760);
    sub_2466F42F4(&qword_268F9B7C8, &qword_268F9B770);
    sub_2466F42F4(&qword_268F9B7D0, &qword_268F9B768);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9B7C0);
  }
  return result;
}

uint64_t sub_2466F42AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2466F42F4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2466F42AC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2466F4338()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_2466F4348()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_2466F4358()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_2466F4368()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_2466F4388()
{
  return MEMORY[0x270EFD338]();
}

uint64_t sub_2466F43D8()
{
  return MEMORY[0x270EFD360]();
}

uint64_t sub_2466F43E8()
{
  return MEMORY[0x270EFD368]();
}

uint64_t sub_2466F43F8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2466F4408()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2466F4418()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2466F4428()
{
  return MEMORY[0x270EFF518]();
}

uint64_t sub_2466F4438()
{
  return MEMORY[0x270EFF528]();
}

uint64_t sub_2466F4448()
{
  return MEMORY[0x270EFF530]();
}

uint64_t sub_2466F4458()
{
  return MEMORY[0x270F001B0]();
}

uint64_t sub_2466F4468()
{
  return MEMORY[0x270F00958]();
}

uint64_t sub_2466F4478()
{
  return MEMORY[0x270F00968]();
}

uint64_t sub_2466F4488()
{
  return MEMORY[0x270F00ED0]();
}

uint64_t sub_2466F4498()
{
  return MEMORY[0x270F00EE8]();
}

uint64_t sub_2466F44A8()
{
  return MEMORY[0x270F029E8]();
}

uint64_t sub_2466F44B8()
{
  return MEMORY[0x270F04168]();
}

uint64_t sub_2466F44C8()
{
  return MEMORY[0x270F04810]();
}

uint64_t sub_2466F44D8()
{
  return MEMORY[0x270F04838]();
}

uint64_t sub_2466F44E8()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_2466F44F8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2466F4508()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2466F4518()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2466F4528()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2466F4538()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2466F4548()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2466F4558()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2466F4568()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2466F4578()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2466F4588()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2466F4598()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2466F45A8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2466F45B8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2466F45C8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2466F45D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2466F45E8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2466F45F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2466F4618()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_2466F4628()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2466F4638()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2466F4648()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2466F4658()
{
  return MEMORY[0x270FA0128]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}