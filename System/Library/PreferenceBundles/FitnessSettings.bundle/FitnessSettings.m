void sub_299C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;

  v6 = a2;
  v7 = a3;
  _HKInitializeLogging();
  v8 = HKLogDefault;
  if (v7)
  {
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_63E8((uint64_t)v7, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void *)(*(void *)(a1 + 32) + 192);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[FitnessSettingsController] Old personalization privacy preference: %@ new preference: %@", (uint8_t *)&v11, 0x16u);
    }
    v10 = (id *)(*(void *)(a1 + 32) + 192);
    if (*v10 != v6)
    {
      objc_storeStrong(v10, a2);
      [*(id *)(a1 + 32) reloadSpecifiers];
    }
  }
}

id SeymourPrivacyPreferenceProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id SeymourPrivacyPreferenceProvider.init()()
{
  uint64_t v1 = sub_6540();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F24(0, &qword_C830);
  v5 = v0;
  v6 = (void *)sub_6610();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for EventDispatchStrategy.async(_:), v1);
  v13[3] = sub_6530();
  v13[4] = (uint64_t)&protocol witness table for DispatchTimerProvider;
  sub_32E0(v13);
  id v7 = v6;
  sub_6520();
  sub_6570();
  swift_allocObject();
  sub_6560();
  sub_6510();
  swift_unknownObjectRetain();
  sub_6610();
  *(void *)&v5[OBJC_IVAR___CHSeymourPrivacyPreferenceProvider_client] = sub_6500();

  v8 = (objc_class *)type metadata accessor for SeymourPrivacyPreferenceProvider();
  v12.receiver = v5;
  v12.super_class = v8;
  id v9 = objc_msgSendSuper2(&v12, "init");
  swift_release();

  return v9;
}

uint64_t *sub_32E0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for SeymourPrivacyPreferenceProvider()
{
  return self;
}

Swift::Void __swiftcall SeymourPrivacyPreferenceProvider.setPersonalizationPrivacyPreference(_:)(NSNumber a1)
{
  sub_35B4(&qword_C840);
  __chkstk_darwin();
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_65F0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  id v7 = (NSNumber *)swift_allocObject();
  v7[2].super.super.isa = 0;
  v7[3].super.super.isa = 0;
  v7[4].super.super.isa = a1.super.super.isa;
  v7[5].super.super.isa = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  id v9 = a1.super.super.isa;
  v10 = v1;
  if (v8 == 1)
  {
    sub_3FCC((uint64_t)v4);
  }
  else
  {
    sub_65E0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2].super.super.isa)
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_65B0();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      if (v13 | v11)
      {
        v14[0] = 0;
        v14[1] = 0;
        v14[2] = v11;
        v14[3] = v13;
      }
    }
  }
  swift_task_create();
  swift_release();
}

uint64_t sub_35B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_35F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = sub_64B0();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  uint64_t v7 = sub_35B4(&qword_C860);
  v5[7] = v7;
  v5[8] = *(void *)(v7 - 8);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  return _swift_task_switch(sub_3728, 0, 0);
}

uint64_t sub_3728()
{
  uint64_t v1 = *(void *)(v0 + 40);
  unsigned int v2 = [*(id *)(v0 + 16) BOOLValue];
  sub_64A0();
  uint64_t v3 = (void (**)(uint64_t, uint64_t))(v1 + 8);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 32);
  if (v2)
  {
    uint64_t v6 = *(void *)(v0 + 80);
    sub_6480();
    sub_64F0();
    (*v3)(v4, v5);
    uint64_t v7 = swift_task_alloc();
    *(void *)(v0 + 88) = v7;
    *(void *)(v7 + 16) = "/Library/Caches/com.apple.xbs/Sources/CompanionHealth/FitnessSettings/SeymourPrivacyPreferenceProvider.swift";
    *(void *)(v7 + 24) = 108;
    *(unsigned char *)(v7 + 32) = 2;
    *(void *)(v7 + 40) = 31;
    *(void *)(v7 + 48) = v6;
    int v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v8;
    void *v8 = v0;
    v8[1] = sub_39A0;
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 72);
    sub_6480();
    sub_64F0();
    (*v3)(v4, v5);
    uint64_t v10 = swift_task_alloc();
    *(void *)(v0 + 112) = v10;
    *(void *)(v10 + 16) = "/Library/Caches/com.apple.xbs/Sources/CompanionHealth/FitnessSettings/SeymourPrivacyPreferen"
                            "ceProvider.swift";
    *(void *)(v10 + 24) = 108;
    *(unsigned char *)(v10 + 32) = 2;
    *(void *)(v10 + 40) = 35;
    *(void *)(v10 + 48) = v9;
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_3C04;
  }
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_39A0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_3B58;
  }
  else
  {
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v7 = v2 + 56;
    uint64_t v5 = *(void *)(v2 + 56);
    uint64_t v6 = *(void *)(v7 + 8);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    uint64_t v3 = sub_3AE0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_3AE0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_3B58()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[7];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3C04()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_3D48;
  }
  else
  {
    uint64_t v5 = v2[8];
    uint64_t v4 = v2[9];
    uint64_t v6 = v2[7];
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_63E4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_3D48()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3DF8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_3E40()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_3ED8;
  return sub_35F8((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_3ED8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_3FCC(uint64_t a1)
{
  uint64_t v2 = sub_35B4(&qword_C840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SeymourPrivacyPreferenceProvider.fetchPersonalizationPrivacyPreference(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = a2;
  uint64_t v37 = a1;
  uint64_t v4 = sub_35B4(&qword_C858);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v37 - v9;
  uint64_t v40 = sub_35B4(&qword_C860);
  uint64_t v11 = *(void *)(v40 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v40);
  v39 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v13);
  v38 = (char *)&v37 - v15;
  __chkstk_darwin(v14);
  v41 = (char *)&v37 - v16;
  sub_64E0();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_4520;
  *(void *)(v18 + 24) = v17;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  unint64_t v19 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v20 = (v6 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v21 + v19, v8, v4);
  v22 = (uint64_t (**)(uint64_t))(v21 + v20);
  *v22 = sub_541C;
  v22[1] = (uint64_t (*)(uint64_t))v18;
  uint64_t v23 = v42;
  swift_retain();
  v24 = v38;
  sub_64C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v37;
  *(void *)(v25 + 24) = v23;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_5988;
  *(void *)(v26 + 24) = v25;
  v28 = v39;
  uint64_t v27 = v40;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v39, v24, v40);
  unint64_t v29 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v30 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v30 + v29, v28, v27);
  v31 = (uint64_t (**)(uint64_t))(v30 + ((v12 + v29 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v31 = sub_5A00;
  v31[1] = (uint64_t (*)(uint64_t))v26;
  swift_retain();
  v32 = v41;
  sub_64C0();
  v33 = *(void (**)(char *, uint64_t))(v11 + 8);
  v33(v24, v27);
  v34 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_64D0();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = 0;
  *(void *)(v35 + 24) = 0;
  v34(sub_5E68, v35);
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v33)(v32, v27);
}

void sub_4520()
{
  uint64_t v1 = *(void (**)(Class, void))(v0 + 16);
  sub_6490();
  sub_35B4(&qword_C8A0);
  sub_6470();
  sub_5F24(0, &qword_C890);
  Class isa = sub_6620(v3 == 1).super.super.isa;
  v1(isa, 0);
}

void sub_4674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_6460();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id SeymourPrivacyPreferenceProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourPrivacyPreferenceProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_4728(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v34 = a1;
  uint64_t v9 = sub_35B4(&qword_C8A8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v35 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_6590();
  uint64_t v12 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v36 = sub_4AE0(0x65uLL);
  sub_6550();
  uint64_t v15 = sub_6580();
  os_log_type_t v16 = sub_6600();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v31[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v31[0] = v9;
    uint64_t v32 = a5;
    uint64_t v39 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v36;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v20 = sub_6640();
    *(void *)(v18 + 14) = sub_4B6C(v20, v21, &v39);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v32;
    os_log_type_t v22 = v16;
    char v23 = a4;
    _os_log_impl(&dword_0, v15, v22, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    a5 = v32;
    uint64_t v9 = v31[0];
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v33);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v33);
    char v23 = a4;
  }
  v24 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v35, v34, v9);
  unint64_t v25 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v37;
  *(void *)(v26 + 16) = v36;
  *(void *)(v26 + 24) = v27;
  *(void *)(v26 + 32) = v38;
  *(unsigned char *)(v26 + 40) = v23;
  *(void *)(v26 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v26 + v25, v24, v9);
  sub_35B4(&qword_C860);
  v28 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_64D0();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_6214;
  *(void *)(v29 + 24) = v26;
  swift_retain();
  v28(sub_5E68, v29);
  swift_release();
  swift_release();
  return swift_release();
}

unint64_t sub_4AE0(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    uint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_4B6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_4E8C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6378((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_6378((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6328((uint64_t)v12);
  return v7;
}

uint64_t sub_4C40(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = a7;
  int v24 = a6;
  int v26 = a2;
  uint64_t v11 = sub_6590();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6550();
  uint64_t v15 = sub_6580();
  os_log_type_t v16 = sub_6600();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v23[1] = a8;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v23[0] = a1;
    uint64_t v27 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = a3;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v20 = sub_6640();
    *(void *)(v18 + 14) = sub_4B6C(v20, v21, &v27);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v25;
    _os_log_impl(&dword_0, v15, v16, "Finished P->A conversion: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    a1 = v23[0];
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v26)
  {
    uint64_t v27 = a1;
    swift_errorRetain();
    sub_35B4(&qword_C8A8);
    return sub_65C0();
  }
  else
  {
    sub_35B4(&qword_C8A8);
    return sub_65D0();
  }
}

uint64_t sub_4E8C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            uint64_t result = 0;
            __dst[v11] = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = (uint64_t)sub_5034(a5, a6);
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
  uint64_t v8 = sub_6650();
  if (!v8)
  {
    sub_6660();
    __break(1u);
LABEL_17:
    uint64_t result = sub_6670();
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

char *sub_5034(uint64_t a1, unint64_t a2)
{
  objc_super v2 = (char *)sub_50CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_51D0(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_51D0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_50CC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_5168(v2, 0);
      uint64_t result = (void *)sub_6630();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_65A0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_5168(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_35B4(&qword_C8B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_51D0(char *result, int64_t a2, char a3, char *a4)
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
    sub_35B4(&qword_C8B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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

uint64_t sub_52BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_64B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_retain();
  return sub_64C0();
}

uint64_t sub_541C(uint64_t a1)
{
  return sub_52BC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_5424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  swift_errorRetain();

  return sub_64C0();
}

uint64_t sub_54C8(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v8, a5);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);

  return sub_5ECC(v6, 0);
}

uint64_t sub_555C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_35B4(&qword_C860);
  char v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_64D0();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_5EB0, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_5628(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v10 = sub_35B4(&qword_C860);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    a5(a1);
    uint64_t v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_64D0();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a3;
    *(void *)(v16 + 24) = a4;
    swift_retain();
    v15(sub_5E68, v16);
    swift_release();
    swift_release();
    sub_5ECC(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    uint64_t v17 = a1;
    char v18 = 0;
    return a3(&v17);
  }
}

uint64_t sub_57C4(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v8, a5);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);

  return sub_5ECC(v6, 0);
}

uint64_t sub_5858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_35B4(&qword_C858);
  char v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_64D0();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a1;
  v10[5] = a2;
  swift_retain();
  swift_retain();
  v9(sub_5FA4, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_5924()
{
  return sub_5A14(&qword_C858);
}

uint64_t sub_5930(uint64_t a1, uint64_t a2)
{
  return sub_5AD8(a1, a2, &qword_C858, sub_5858);
}

uint64_t sub_5950()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_5988(uint64_t a1)
{
  unint64_t v3 = *(void (**)(Class, uint64_t))(v1 + 16);
  sub_5F24(0, &qword_C890);
  Class isa = sub_6620(0).super.super.isa;
  v3(isa, a1);
}

uint64_t sub_5A00(uint64_t a1)
{
  return sub_5424(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_5A08()
{
  return sub_5A14(&qword_C860);
}

uint64_t sub_5A14(uint64_t *a1)
{
  uint64_t v2 = sub_35B4(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();

  return _swift_deallocObject(v1, v7, v6);
}

uint64_t sub_5AB8(uint64_t a1, uint64_t a2)
{
  return sub_5AD8(a1, a2, &qword_C860, sub_555C);
}

uint64_t sub_5AD8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(sub_35B4(a3) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v4 + v8;
  uint64_t v10 = (uint64_t *)(v4 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];

  return a4(a1, a2, v9, v11, v12);
}

uint64_t sub_5B9C(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  unint64_t v21 = a4;
  uint64_t v22 = a5;
  v20[1] = a3;
  uint64_t v7 = sub_35B4(&qword_C860);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_64B0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_35B4(&qword_C898);
  __chkstk_darwin();
  uint64_t v16 = (void *)((char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_5FB0(a1, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = *v16;
    char v24 = 1;
    swift_errorRetain();
    v21(&v23);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v14, v16, v11);
    a2(v14);
    char v18 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_64D0();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v21;
    *(void *)(v19 + 24) = v22;
    swift_retain();
    v18(sub_5E68, v19);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_5E6C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_5EA4(uint64_t a1, uint64_t a2)
{
  sub_4674(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_5EB0(uint64_t a1)
{
  return sub_5628(*(void *)a1, *(unsigned char *)(a1 + 8), *(uint64_t (**)(uint64_t *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

uint64_t sub_5ECC(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_5ED8()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_5F18(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_54C8(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_5F24(uint64_t a1, unint64_t *a2)
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

uint64_t sub_5F64()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_5FA4(uint64_t a1)
{
  return sub_5B9C(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_5FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_35B4(&qword_C898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_601C()
{
  uint64_t v1 = sub_64B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_60E8(void (*a1)(uint64_t *), uint64_t a2)
{
  void (*v6)(uint64_t *__return_ptr, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t vars8;

  uint64_t v5 = *(void *)(sub_64B0() - 8);
  uint64_t v6 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_57C4(a1, a2, v6, v7, v8);
}

uint64_t sub_6170(uint64_t a1)
{
  return sub_4728(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_6180()
{
  uint64_t v1 = sub_35B4(&qword_C8A8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_6214(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_35B4(&qword_C8A8) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v9 = *(void *)a1;
  int v10 = *(unsigned __int8 *)(a1 + 8);
  int v11 = *(unsigned __int8 *)(v1 + 40);

  return sub_4C40(v9, v10, v4, v5, v6, v11, v7, v8);
}

uint64_t sub_62A0()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_62E0(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_6328(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6378(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_63E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[FitnessSettingsController] Error fetching personalization privacy preference: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_6460()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_6470()
{
  return PortableEnum.unwrapped.getter();
}

uint64_t sub_6480()
{
  return PersonalizationPrivacyPreference.init(state:version:)();
}

uint64_t sub_6490()
{
  return PersonalizationPrivacyPreference.state.getter();
}

uint64_t sub_64A0()
{
  return static PersonalizationPrivacyPreference.Version.current.getter();
}

uint64_t sub_64B0()
{
  return type metadata accessor for PersonalizationPrivacyPreference();
}

uint64_t sub_64C0()
{
  return Promise.init(asyncOperation:)();
}

uint64_t sub_64D0()
{
  return Promise.operation.getter();
}

uint64_t sub_64E0()
{
  return PrivacyPreferenceClient.queryPersonalizationPrivacyPreference()();
}

uint64_t sub_64F0()
{
  return PrivacyPreferenceClient.insertPersonalizationPrivacyPreference(_:)();
}

uint64_t sub_6500()
{
  return PrivacyPreferenceClient.__allocating_init(eventHub:queue:)();
}

uint64_t sub_6510()
{
  return type metadata accessor for PrivacyPreferenceClient();
}

uint64_t sub_6520()
{
  return DispatchTimerProvider.init()();
}

uint64_t sub_6530()
{
  return type metadata accessor for DispatchTimerProvider();
}

uint64_t sub_6540()
{
  return type metadata accessor for EventDispatchStrategy();
}

uint64_t sub_6550()
{
  return static Log.triage.getter();
}

uint64_t sub_6560()
{
  return EventHub.init(queue:dispatchStrategy:timerProvider:)();
}

uint64_t sub_6570()
{
  return type metadata accessor for EventHub();
}

uint64_t sub_6580()
{
  return Logger.logObject.getter();
}

uint64_t sub_6590()
{
  return type metadata accessor for Logger();
}

Swift::Int sub_65A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_65B0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_65C0()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_65D0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_65E0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_65F0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_6600()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6610()
{
  return static OS_dispatch_queue.main.getter();
}

NSNumber sub_6620(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_6630()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_6640()
{
  return StaticString.description.getter();
}

uint64_t sub_6650()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_6660()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_6670()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return _[a1 appPolicy];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_fetchPersonalizationPrivacyPreferenceWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPersonalizationPrivacyPreferenceWithCompletion:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithName_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:target:set:get:detail:cell:edit:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presenterForPrivacySplashWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacySplashWithIdentifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_setAppPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppPolicy:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}