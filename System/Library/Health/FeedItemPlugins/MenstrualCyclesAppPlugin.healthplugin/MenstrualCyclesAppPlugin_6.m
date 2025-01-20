uint64_t sub_2415D8658()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    type metadata accessor for SetupPregnancyModeFeaturesTileActionHandler();
    sub_2415D8B20(&qword_268D04038, (void (*)(uint64_t))type metadata accessor for SetupPregnancyModeFeaturesTileActionHandler);
    sub_24162E308();
    return swift_release();
  }
  return result;
}

uint64_t sub_2415D86F8(uint64_t a1)
{
  uint64_t v2 = sub_24162E178();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v6 + qword_268D04008;
  uint64_t v8 = type metadata accessor for SetupPregnancyModeFeaturesTileUserData();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)(v6 + qword_268D04010) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v9 = sub_24162DEA8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v9;
}

void sub_2415D8858()
{
  sub_2415D8BA8(v0 + qword_268D04008, (uint64_t (*)(void))sub_2415D8944);
  v1 = *(void **)(v0 + qword_268D04010);
}

uint64_t sub_2415D88AC()
{
  uint64_t v0 = sub_24162DEB8();
  sub_2415D8BA8(v0 + qword_268D04008, (uint64_t (*)(void))sub_2415D8944);

  return swift_deallocClassInstance();
}

void sub_2415D8944()
{
  if (!qword_268D04028)
  {
    type metadata accessor for SetupPregnancyModeFeaturesTileUserData();
    unint64_t v0 = sub_241632C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D04028);
    }
  }
}

uint64_t sub_2415D899C()
{
  return type metadata accessor for SetupPregnancyModeFeaturesTileActionHandler();
}

uint64_t sub_2415D89A4()
{
  return sub_2415D8B20(&qword_268D04030, (void (*)(uint64_t))type metadata accessor for SetupPregnancyModeFeaturesTileActionHandler);
}

uint64_t sub_2415D89F0()
{
  type metadata accessor for SetupPregnancyModeFeaturesTileActionHandler();

  return sub_24162E308();
}

uint64_t sub_2415D8A2C()
{
  return sub_2415D8B20(&qword_268D04038, (void (*)(uint64_t))type metadata accessor for SetupPregnancyModeFeaturesTileActionHandler);
}

uint64_t sub_2415D8A74()
{
  return sub_2415D8B20(&qword_268D04040, (void (*)(uint64_t))type metadata accessor for SetupPregnancyModeFeaturesTileActionHandler);
}

uint64_t sub_2415D8ABC(uint64_t a1, uint64_t a2)
{
  sub_2415D8944();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2415D8B20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2415D8B68()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2415D8BA0()
{
  return sub_2415D8658();
}

uint64_t sub_2415D8BA8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2415D8C08(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2415D8C70(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2415D8CDC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24162FC48();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2415D8D50()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  uint64_t v6 = sub_24162EF98();
  os_log_type_t v7 = sub_2416322E8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v18 = v2;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v20 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v11 = sub_2416333E8();
    uint64_t v19 = sub_2411B6898(v11, v12, &v20);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v6, v7, "[%{public}s] Deallocated", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v10, -1, -1);
    MEMORY[0x245621640](v9, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v13 = *(void **)(v1 + 16);
  objc_msgSend(v13, sel_removeObserver_, v1);

  uint64_t v14 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39MenstrualCyclesOnboardingChangeDetector__isOnboardingCompleted;
  sub_2411AB16C(0, &qword_26B010668, (uint64_t (*)(uint64_t))sub_2411B8770, MEMORY[0x263EFDE58]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  return v1;
}

uint64_t sub_2415D9004()
{
  sub_2415D8D50();

  return swift_deallocClassInstance();
}

uint64_t sub_2415D905C()
{
  return type metadata accessor for MenstrualCyclesOnboardingChangeDetector();
}

void sub_2415D90B4()
{
  sub_2411AB16C(319, &qword_26B010668, (uint64_t (*)(uint64_t))sub_2411B8770, MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_2415D9184@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24162FC48();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2415D9208()
{
  return sub_24162FC58();
}

void sub_2415D9280()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24162EFA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  os_log_type_t v7 = sub_24162EF98();
  os_log_type_t v8 = sub_2416322E8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v19 = v2;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = v3;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v12 = sub_2416333E8();
    uint64_t v20 = sub_2411B6898(v12, v13, aBlock);
    sub_241632C28();
    uint64_t v2 = v19;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v7, v8, "[%{public}s] Observed onboarding completion update", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v11, -1, -1);
    MEMORY[0x245621640](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v14 = (void *)v1[2];
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v1;
  *(void *)(v15 + 24) = v2;
  aBlock[4] = (uint64_t)sub_2411AC390;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2411ABF50;
  aBlock[3] = (uint64_t)&unk_26F578938;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_isAnyOnboardingVersionCompletedWithCompletion_, v16);
  _Block_release(v16);
}

uint64_t sub_2415D9550()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2415D9588()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void *sub_2415D95D4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v36 = sub_24162D678();
  uint64_t v10 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  v35 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_24162B788();
  uint64_t v12 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5[6] = 0;
  v5[7] = a1;
  sub_2411A3DF4(a2, (uint64_t)(v5 + 8));
  uint64_t v37 = a3;
  sub_2411A3DF4(a3, (uint64_t)(v5 + 13));
  if (a4)
  {
    swift_retain();
    id v15 = a1;
    id v16 = a4;
  }
  else
  {
    id v17 = objc_allocWithZone(MEMORY[0x263F451B0]);
    swift_retain();
    id v16 = objc_msgSend(v17, sel_initWithHealthStore_, a1);
  }
  v5[5] = v16;
  swift_unknownObjectRetain();
  swift_release();
  v31 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8E0F8];
  sub_2415DA820(0, (unint64_t *)&qword_268D00EC0, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
  v34 = a4;
  uint64_t v18 = swift_allocObject();
  uint64_t v33 = v10;
  uint64_t v19 = v18;
  long long v30 = xmmword_241637EE0;
  *(_OWORD *)(v18 + 16) = xmmword_241637EE0;
  sub_24162B778();
  sub_24162B738();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v14, v38);
  v29 = v20;
  sub_24162D668();
  v21 = sub_241341D68(v19, 1);
  sub_2411A3DF4(a2, (uint64_t)v42);
  sub_2411A3DF4(v37, (uint64_t)v41);
  uint64_t v28 = type metadata accessor for AddPregnancyItem();
  v22 = (void *)swift_allocObject();
  v22[14] = 0;
  swift_unknownObjectWeakInit();
  id v23 = a1;
  swift_retain();
  sub_24162B778();
  sub_24162B738();
  uint64_t v32 = a2;
  v20(v14, v38);
  unint64_t v39 = 0xD000000000000010;
  unint64_t v40 = 0x8000000241675010;
  sub_241631E08();
  swift_bridgeObjectRelease();
  unint64_t v24 = v40;
  v22[15] = v39;
  v22[16] = v24;
  v22[2] = v23;
  sub_2411B6CD4(v42, (uint64_t)(v22 + 3));
  sub_2411B6CD4(v41, (uint64_t)(v22 + 8));
  v22[14] = &off_26F578A00;
  swift_unknownObjectWeakAssign();
  swift_retain();
  sub_24162CFE8();
  swift_release();
  sub_2415DA820(0, (unint64_t *)&qword_268CFC790, (uint64_t (*)(uint64_t))sub_2411E1530, v31);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = v30;
  *(void *)(v25 + 56) = v28;
  *(void *)(v25 + 64) = sub_2415DA7D8(&qword_268D02500, 255, (void (*)(uint64_t))type metadata accessor for AddPregnancyItem);
  *(void *)(v25 + 32) = v22;
  swift_retain();
  sub_24162B778();
  sub_24162B738();
  v29(v14, v38);
  v26 = v35;
  sub_24162D668();
  sub_24162D798();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v26, v36);
  objc_msgSend((id)swift_unknownObjectRetain(), sel_registerObserver_isUserInitiated_, v21, 1);
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v37);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v32);
  return v21;
}

uint64_t sub_2415D9B14()
{
  swift_unknownObjectRelease();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 64);

  return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 104);
}

uint64_t sub_2415D9B5C()
{
  objc_msgSend(v0[5], sel_unregisterObserver_, v0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)(v0 + 8));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)(v0 + 13));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AddPregnancyDataSource()
{
  return self;
}

uint64_t sub_2415D9BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_241632008();
  *(void *)(v4 + 24) = sub_241631FF8();
  uint64_t v6 = sub_241631FC8();
  return MEMORY[0x270FA2498](sub_2415D9C94, v6, v5);
}

uint64_t sub_2415D9C94()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  uint64_t v2 = *(void **)(v1 + 48);
  if (v2) {
    char v3 = objc_msgSend(v2, sel_state) == (id)1;
  }
  else {
    char v3 = 1;
  }
  sub_241342180(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

void sub_2415D9D20(void *a1)
{
  uint64_t v2 = v1;
  sub_2415DA820(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v29 - v5;
  uint64_t v7 = sub_24162EFA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (HKShowSensitiveLogItems())
  {
    sub_24162EF48();
    uint64_t v11 = sub_24162EF98();
    os_log_type_t v12 = sub_2416322E8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      v31 = v6;
      uint64_t v14 = (uint8_t *)v13;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v33 = v15;
      long long v30 = a1;
      *(_DWORD *)uint64_t v14 = 136315138;
      v29[1] = v14 + 4;
      uint64_t v16 = sub_2416333E8();
      uint64_t v32 = sub_2411B6898(v16, v17, &v33);
      a1 = v30;
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v11, v12, "[%s] Received pregnancy model update", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245621640](v15, -1, -1);
      uint64_t v18 = v14;
      uint64_t v6 = v31;
      MEMORY[0x245621640](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v19 = *(void **)(v2 + 48);
  if (v19)
  {
    sub_2411B9D00(0, &qword_26B00ED70);
    id v20 = a1;
    id v21 = v19;
    char v22 = sub_2416329B8();

    if (v22) {
      return;
    }
    id v23 = *(void **)(v2 + 48);
  }
  else
  {
    id v23 = 0;
  }
  *(void *)(v2 + 48) = a1;

  uint64_t v24 = sub_241632028();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v6, 1, 1, v24);
  sub_241632008();
  id v25 = a1;
  swift_retain();
  uint64_t v26 = sub_241631FF8();
  v27 = (void *)swift_allocObject();
  uint64_t v28 = MEMORY[0x263F8F500];
  v27[2] = v26;
  v27[3] = v28;
  v27[4] = v2;
  sub_241496830((uint64_t)v6, (uint64_t)&unk_268D04080, (uint64_t)v27);
  swift_release();
}

uint64_t sub_2415DA108(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(v2 + 56);
  sub_2411A3DF4(v2 + 104, (uint64_t)v24);
  sub_2411A3DF4(v2 + 64, (uint64_t)v23);
  id v5 = objc_allocWithZone(MEMORY[0x263F46858]);
  id v6 = v4;
  id v7 = objc_msgSend(v5, sel_init);
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  uint64_t v8 = *(void *)(v2 + 40);
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = sub_24162BCE8();
  swift_unknownObjectRetain();
  swift_retain();
  v20[3] = v10;
  v20[4] = &off_26F56DB80;
  v20[0] = sub_24162BCD8();
  type metadata accessor for PregnancyOnboardingCoordinator();
  uint64_t v11 = (uint64_t *)swift_allocObject();
  uint64_t v12 = sub_241192BB0((uint64_t)v20, v10);
  __n128 v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (void *)((char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, __n128))(v16 + 16))(v15, v13);
  uint64_t v17 = *v15;
  swift_retain();
  sub_2413EEA74(v6, (uint64_t)v24, (uint64_t)v23, v17, v7, 4u, 0, (uint64_t)v21, v8, 0, 0, 4u, 0, (uint64_t)sub_2415DA7D0, v9, 0, 0, 0, v11);

  swift_unknownObjectRelease();
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v20);
  swift_release();
  swift_release();
  sub_2415E8510(a2, 1);
  return swift_release();
}

uint64_t sub_2415DA368()
{
  sub_2414AE6E4();
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F43E38], v1);
    sub_24162D038();
    return swift_release();
  }
  return result;
}

uint64_t sub_2415DA490()
{
  return sub_241632438();
}

uint64_t sub_2415DA504()
{
  uint64_t v0 = sub_24162F538();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24162F5A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v1 + 104))(v3, *MEMORY[0x263F81FC8], v0, v6);
  sub_24162F558();
  id v9 = objc_msgSend(self, sel_clearColor);
  sub_24162F578();
  sub_24162F588();
  sub_2411B9D00(0, &qword_268CFC750);
  uint64_t v10 = sub_2416327F8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10;
}

uint64_t sub_2415DA6D8(uint64_t a1, uint64_t a2)
{
  return sub_24162E588();
}

uint64_t sub_2415DA750(uint64_t a1, uint64_t a2)
{
  return sub_2415DA7D8((unint64_t *)&unk_268D04058, a2, (void (*)(uint64_t))type metadata accessor for AddPregnancyDataSource);
}

uint64_t sub_2415DA798()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2415DA7D0()
{
  return sub_2415DA368();
}

uint64_t sub_2415DA7D8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2415DA820(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2415DA884()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2415DA8C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_241201428;
  return sub_2415D9BFC(a1, v4, v5, v6);
}

void sub_2415DA978(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  sub_2415DDA44(v39, a2, a3, a4, a5);
  sub_2415DDC78(v39, v48, a2, a3, a4, a5);
  CGFloat v10 = v48[0];
  CGFloat v11 = v48[1];
  CGFloat v12 = v48[2];
  CGFloat v13 = v48[3];
  CGContextSaveGState(a1);
  uint64_t v14 = self;
  id v15 = objc_msgSend(v14, sel_whiteColor);
  uint64_t v16 = (CGColor *)objc_msgSend(v15, sel_CGColor);

  CGContextSetFillColorWithColor(a1, v16);
  v50.origin.x = v10;
  v50.origin.y = v11;
  v50.size.width = v12;
  v50.size.height = v13;
  CGContextFillRect(a1, v50);
  CGContextRestoreGState(a1);
  CGFloat v17 = v48[4];
  CGFloat v18 = v48[5];
  CGFloat v19 = v48[6];
  CGFloat v20 = v48[7];
  CGContextSaveGState(a1);
  id v21 = objc_msgSend(v14, sel_whiteColor);
  uint64_t v22 = (CGColor *)objc_msgSend(v21, sel_CGColor);

  CGContextSetFillColorWithColor(a1, v22);
  v51.origin.x = v17;
  v51.origin.y = v18;
  v51.size.width = v19;
  v51.size.height = v20;
  CGContextFillRect(a1, v51);
  CGContextRestoreGState(a1);
  CGFloat v23 = v48[8];
  CGFloat v24 = v48[9];
  CGFloat v25 = v48[10];
  CGFloat v26 = v48[11];
  CGContextSaveGState(a1);
  id v27 = objc_msgSend(v14, sel_whiteColor);
  uint64_t v28 = (CGColor *)objc_msgSend(v27, sel_CGColor);

  CGContextSetFillColorWithColor(a1, v28);
  v52.origin.x = v23;
  v52.origin.y = v24;
  v52.size.width = v25;
  v52.size.height = v26;
  CGContextFillRect(a1, v52);
  CGContextRestoreGState(a1);
  CGFloat v29 = v48[12];
  CGFloat v30 = v48[13];
  CGFloat v31 = v48[14];
  CGFloat v32 = v48[15];
  CGContextSaveGState(a1);
  id v33 = objc_msgSend(v14, sel_whiteColor);
  v34 = (CGColor *)objc_msgSend(v33, sel_CGColor);

  CGContextSetFillColorWithColor(a1, v34);
  v53.origin.x = v29;
  v53.origin.y = v30;
  v53.size.width = v31;
  v53.size.height = v32;
  CGContextFillRect(a1, v53);
  CGContextRestoreGState(a1);
  sub_2415DAC38(a1, v39[0], v39[1], v39[2], v39[3]);
  CGFloat v35 = v40;
  CGFloat v36 = v41;
  CGFloat v37 = v42;
  CGFloat v38 = v43;
  sub_2415DAC38(a1, v40, v41, v42, v43);
  sub_2415DAC38(a1, v44, v45, v46, v47);

  sub_2415DAF18(a1, 6, v35, v36, v37, v38);
}

void sub_2415DAC38(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v6 = v5;
  CGContextSaveGState(a1);
  id v12 = objc_msgSend(self, sel_systemGray2Color);
  id v13 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v14 = objc_msgSend(v12, sel_resolvedColorWithTraitCollection_, v13);

  id v15 = (CGColor *)objc_msgSend(v14, sel_CGColor);
  CGContextSetStrokeColorWithColor(a1, v15);

  CGContextSetLineWidth(a1, 0.5);
  if (qword_268CF9360 != -1) {
    swift_once();
  }
  sub_241632198();
  CGContextSetLineCap(a1, kCGLineCapButt);
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  double MinX = CGRectGetMinX(v25);
  if (qword_268CF9308 != -1) {
    swift_once();
  }
  double v17 = MinX + *(double *)&qword_268D23C60 - *(double *)(v6 + 104);
  v26.origin.x = a2;
  v26.origin.y = a3;
  v26.size.width = a4;
  v26.size.height = a5;
  CGFloat v18 = CGRectGetMaxY(v26) + -0.25;
  sub_2415DF48C(0, (unint64_t *)&qword_268D04800, MEMORY[0x263F8E0F8]);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_24163A4F0;
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = a4;
  v27.size.height = a5;
  CGFloat MinY = CGRectGetMinY(v27);
  *(double *)(v19 + 32) = v17;
  *(CGFloat *)(v19 + 40) = MinY;
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  CGFloat MaxX = CGRectGetMaxX(v28);
  v29.origin.x = a2;
  v29.origin.y = a3;
  v29.size.width = a4;
  v29.size.height = a5;
  CGFloat v22 = CGRectGetMinY(v29);
  *(CGFloat *)(v19 + 48) = MaxX;
  *(CGFloat *)(v19 + 56) = v22;
  sub_2416321A8();
  swift_bridgeObjectRelease();
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_24163A4F0;
  *(double *)(v23 + 32) = v17;
  *(CGFloat *)(v23 + 40) = v18;
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = a4;
  v30.size.height = a5;
  *(CGFloat *)(v23 + 48) = CGRectGetMaxX(v30);
  *(CGFloat *)(v23 + 56) = v18;
  sub_2416321A8();
  swift_bridgeObjectRelease();

  CGContextRestoreGState(a1);
}

void sub_2415DAF18(CGContext *a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v7 = v6;
  CGContextSaveGState(a1);
  id v14 = objc_msgSend(self, sel_systemGrayColor);
  id v15 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v16 = objc_msgSend(v14, sel_resolvedColorWithTraitCollection_, v15);

  double v17 = (CGColor *)objc_msgSend(v16, sel_CGColor);
  CGContextSetStrokeColorWithColor(a1, v17);

  CGContextSetLineWidth(a1, 0.5);
  v31.origin.x = a3;
  v31.origin.y = a4;
  v31.size.width = a5;
  v31.size.height = a6;
  double MinX = CGRectGetMinX(v31);
  if (qword_268CF9308 != -1) {
    swift_once();
  }
  double v19 = *(double *)&qword_268D23C60;
  double v20 = *(double *)(v7 + 104);
  v32.origin.x = a3;
  v32.origin.y = a4;
  v32.size.width = a5;
  v32.size.height = a6;
  double MinY = CGRectGetMinY(v32);
  if (qword_268CF92F0 == -1)
  {
    uint64_t v22 = a2 - 1;
    if (!__OFSUB__(a2, 1)) {
      goto LABEL_5;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
  swift_once();
  uint64_t v22 = a2 - 1;
  if (__OFSUB__(a2, 1)) {
    goto LABEL_24;
  }
LABEL_5:
  if (a2 >= 0) {
    uint64_t v23 = a2;
  }
  else {
    uint64_t v23 = a2 + 1;
  }
  if (v22 < 0) {
    goto LABEL_25;
  }
  if (v22)
  {
    double v24 = MinX + v19 - v20;
    double v25 = MinY + *(double *)&qword_268D23C48;
    uint64_t v26 = (v23 >> 1) - 1;
    double v27 = 0.0;
    do
    {
      if (v26)
      {
        if (qword_268CF9320 != -1) {
          swift_once();
        }
        CGLineCap v28 = kCGLineCapRound;
      }
      else
      {
        if (qword_268CF9360 != -1) {
          swift_once();
        }
        CGLineCap v28 = kCGLineCapButt;
      }
      sub_241632198();
      CGContextSetLineCap(a1, v28);
      sub_2415DF48C(0, (unint64_t *)&qword_268D04800, MEMORY[0x263F8E0F8]);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_24163A4F0;
      *(double *)(v29 + 32) = v24;
      *(double *)(v29 + 40) = v25 + v27;
      v33.origin.x = a3;
      v33.origin.y = a4;
      v33.size.width = a5;
      v33.size.height = a6;
      *(CGFloat *)(v29 + 48) = CGRectGetMaxX(v33);
      *(double *)(v29 + 56) = v25 + v27;
      sub_2416321A8();
      swift_bridgeObjectRelease();
      double v27 = v27 + *(double *)&qword_268D23C48;
      --v26;
      --v22;
    }
    while (v22);
  }

  CGContextRestoreGState(a1);
}

void sub_2415DB27C(CGContext *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = v4;
  uint64_t v9 = type metadata accessor for CycleChartDay();
  uint64_t v62 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  CGFloat v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v51 - v13;
  sub_2415DF268();
  uint64_t v64 = v15;
  MEMORY[0x270FA5388](v15);
  double v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  CGRect v68 = *(CGRect *)(a2 + 32);
  v60 = (double *)a2;
  CGFloat x = v68.origin.x;
  CGFloat y = v68.origin.y;
  CGFloat width = v68.size.width;
  CGFloat height = v68.size.height;
  double MinX = CGRectGetMinX(v68);
  if (qword_268CF9308 != -1) {
LABEL_26:
  }
    swift_once();
  double v19 = *(double *)&qword_268D23C60;
  double v20 = *(double *)(v5 + 104);
  CGContextSaveGState(a1);
  CGContextRef v59 = a1;
  CGContextSetLineWidth(a1, 0.5);
  sub_2411FEBF4(v5);
  uint64_t v21 = sub_2415DD900(a4);
  sub_2411FEC40(v5);
  long long v22 = *(_OWORD *)(v5 + 24);
  v66[0] = *(_OWORD *)(v5 + 8);
  v66[1] = v22;
  v61 = (void **)v5;
  uint64_t v67 = *(void *)(v5 + 40);
  uint64_t v23 = v67;
  uint64_t v24 = *((void *)&v66[0] + 1);
  uint64_t v25 = *(void *)&v66[0];
  char v26 = v22;
  sub_2411FEAA0((uint64_t)v66);
  uint64_t v65 = sub_2415DD7C0(v21, v25, v24, v26, v23);
  sub_2411FEADC((uint64_t)v66);
  swift_bridgeObjectRelease();
  a1 = *(CGContext **)(a4 + 16);
  uint64_t v57 = a4;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v63 = a1;
  if (!a1)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    CGRect v50 = v59;
    swift_bridgeObjectRelease();
    CGContextRestoreGState(v50);
    return;
  }
  unint64_t v5 = 0;
  uint64_t v27 = v57 + ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80));
  CGLineCap v28 = (double *)(v65 + 40);
  double MinX = MinX + v19 + v20 * 0.5;
  uint64_t v62 = *(void *)(v62 + 72);
  unint64_t v58 = 0x8000000241658600;
  double v29 = 1.0;
  CGFloat v30 = width;
  CGFloat v31 = height;
  while (1)
  {
    sub_241298090(v27, (uint64_t)v14);
    unint64_t v42 = *(void *)(v65 + 16);
    if (v5 == v42)
    {
      sub_2415DF2FC((uint64_t)v14);
      goto LABEL_24;
    }
    if (v5 >= v42)
    {
      __break(1u);
      goto LABEL_26;
    }
    double v43 = *(v28 - 1);
    int v44 = *(unsigned __int8 *)v28;
    a4 = (uint64_t)&v17[*(int *)(v64 + 48)];
    a1 = (CGContext *)type metadata accessor for CycleChartDay;
    sub_2415DF358((uint64_t)v14, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
    *(double *)a4 = v43;
    *(unsigned char *)(a4 + 8) = v44;
    sub_2415DF358((uint64_t)v17, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
    if (v44 != 1)
    {
      if (v43 > v29)
      {
        uint64_t v32 = *((void *)v60 + 8);
        uint64_t v33 = *((void *)v60 + 9);
        uint64_t v34 = *((void *)v60 + 10);
        uint64_t v35 = *((void *)v60 + 11);
      }
      else
      {
        if (v43 >= 0.0)
        {
          double v46 = v20;
          CGFloat v47 = x;
          v69.origin.CGFloat x = x;
          CGFloat v48 = y;
          v69.origin.CGFloat y = y;
          v69.size.CGFloat width = v30;
          v69.size.CGFloat height = v31;
          CGFloat MinY = CGRectGetMinY(v69);
          v70.origin.CGFloat x = v47;
          v70.origin.CGFloat y = v48;
          v70.size.CGFloat width = v30;
          v70.size.CGFloat height = v31;
          double MaxY = CGRectGetMaxY(v70);
          v71.origin.CGFloat x = v47;
          double v20 = v46;
          v71.origin.CGFloat y = v48;
          double v29 = 1.0;
          v71.size.CGFloat width = v30;
          v71.size.CGFloat height = v31;
          double MidY = MinY + (MaxY - CGRectGetMinY(v71)) * v43;
          goto LABEL_6;
        }
        uint64_t v32 = *(void *)v60;
        uint64_t v33 = *((void *)v60 + 1);
        uint64_t v34 = *((void *)v60 + 2);
        uint64_t v35 = *((void *)v60 + 3);
      }
      double MidY = CGRectGetMidY(*(CGRect *)&v32);
LABEL_6:
      sub_2411B9D00(0, &qword_268D04098);
      if (qword_268CF9338 != -1) {
        swift_once();
      }
      id v37 = sub_2414763F4(MinX, MidY, *(double *)&qword_268D23C90);
      CGFloat v38 = *v61;
      id v39 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
      id v40 = objc_msgSend(v38, sel_resolvedColorWithTraitCollection_, v39);

      CGFloat v41 = (CGColor *)objc_msgSend(v40, sel_CGColor);
      a1 = v59;
      CGContextSetFillColorWithColor(v59, v41);

      objc_msgSend(v37, sel_fill);
      CGContextDrawPath(a1, kCGPathFillStroke);
      goto LABEL_9;
    }
    if (*(void *)&v43 >= 2uLL) {
      goto LABEL_10;
    }
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    a1 = (CGContext *)(id)qword_26B0181A0;
    CGFloat v45 = (void *)sub_241631CC8();
    id v37 = objc_msgSend(self, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v45, a1, 0);

    if (!v37) {
      break;
    }
    sub_2415DBB94(v60, (uint64_t)v11, v37, MinX);
LABEL_9:

LABEL_10:
    ++v5;
    sub_2415DF2FC((uint64_t)v11);
    double MinX = v20 + MinX;
    v27 += v62;
    v28 += 2;
    if (v63 == (CGContext *)v5) {
      goto LABEL_24;
    }
  }
  __break(1u);
}

void sub_2415DB8C4(CGContext *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a3 + 16);
  if (v4)
  {
    v39.origin.CGFloat x = *(CGFloat *)(a2 + 32);
    CGFloat v8 = *(double *)(a2 + 40);
    CGFloat v10 = *(double *)(a2 + 48);
    CGFloat v9 = *(double *)(a2 + 56);
    CGFloat x = v39.origin.x;
    v39.origin.CGFloat y = v8;
    v39.size.CGFloat width = v10;
    v39.size.CGFloat height = v9;
    double MinX = CGRectGetMinX(v39);
    if (qword_268CF9308 == -1)
    {
      if (v4 == 1) {
        return;
      }
      goto LABEL_6;
    }
    swift_once();
    if (v4 != 1)
    {
LABEL_6:
      uint64_t v12 = 0;
      double v13 = *(double *)(v3 + 104);
      double v14 = MinX + *(double *)&qword_268D23C60 + v13 * 0.5;
      uint64_t v15 = a3 + 32;
      uint64_t v16 = (double *)(a3 + 56);
      uint64_t v17 = 1;
      double v37 = v14;
      while (1)
      {
        if (v12 >= v4)
        {
          __break(1u);
          return;
        }
        double v19 = *(v16 - 1);
        uint64_t v20 = v15 + 16 * v12;
        if ((*(unsigned char *)(v20 + 8) & 1) == 0) {
          break;
        }
        uint64_t v18 = v17;
        if (*(unsigned char *)v16) {
          goto LABEL_7;
        }
LABEL_12:
        ++v17;
        v16 += 2;
        uint64_t v12 = v18;
        if (v4 == v17) {
          return;
        }
      }
      if (*(unsigned char *)v16)
      {
LABEL_7:
        if (*(void *)&v19 == 1) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = v12;
        }
        if (v19 == 0.0) {
          uint64_t v18 = v17;
        }
        goto LABEL_12;
      }
      double v21 = *(double *)v20;
      if (*(double *)v20 <= 1.0)
      {
        if (v21 >= 0.0)
        {
          v40.origin.CGFloat x = x;
          v40.origin.CGFloat y = v8;
          v40.size.CGFloat width = v10;
          v40.size.CGFloat height = v9;
          double MinY = CGRectGetMinY(v40);
          v41.origin.CGFloat x = x;
          v41.origin.CGFloat y = v8;
          v41.size.CGFloat width = v10;
          v41.size.CGFloat height = v9;
          double MaxY = CGRectGetMaxY(v41);
          v42.origin.CGFloat x = x;
          v42.origin.CGFloat y = v8;
          v42.size.CGFloat width = v10;
          v42.size.CGFloat height = v9;
          double v29 = MaxY - CGRectGetMinY(v42);
          double v14 = v37;
          double v26 = MinY + v21 * v29;
LABEL_24:
          if (v19 <= 1.0)
          {
            if (v19 >= 0.0)
            {
              v43.origin.CGFloat x = x;
              v43.origin.CGFloat y = v8;
              v43.size.CGFloat width = v10;
              v43.size.CGFloat height = v9;
              double v36 = CGRectGetMinY(v43);
              v44.origin.CGFloat x = x;
              v44.origin.CGFloat y = v8;
              v44.size.CGFloat width = v10;
              v44.size.CGFloat height = v9;
              double v35 = CGRectGetMaxY(v44);
              v45.origin.CGFloat x = x;
              double v14 = v37;
              v45.origin.CGFloat y = v8;
              v45.size.CGFloat width = v10;
              v45.size.CGFloat height = v9;
              double MidY = v36 + (v35 - CGRectGetMinY(v45)) * v19;
              goto LABEL_30;
            }
            CGFloat v30 = *(double *)a2;
            uint64_t v31 = *(void *)(a2 + 8);
            uint64_t v32 = *(void *)(a2 + 16);
            uint64_t v33 = *(void *)(a2 + 24);
          }
          else
          {
            CGFloat v30 = *(double *)(a2 + 64);
            uint64_t v31 = *(void *)(a2 + 72);
            uint64_t v32 = *(void *)(a2 + 80);
            uint64_t v33 = *(void *)(a2 + 88);
          }
          double MidY = CGRectGetMidY(*(CGRect *)&v30);
LABEL_30:
          sub_2415DBE68((CGFloat *)a2, a1, v14 + v13 * (double)v12, v26, v14 + v13 * (double)v17, MidY);
          uint64_t v18 = v17;
          goto LABEL_12;
        }
        CGFloat v22 = *(double *)a2;
        uint64_t v23 = *(void *)(a2 + 8);
        uint64_t v24 = *(void *)(a2 + 16);
        uint64_t v25 = *(void *)(a2 + 24);
      }
      else
      {
        CGFloat v22 = *(double *)(a2 + 64);
        uint64_t v23 = *(void *)(a2 + 72);
        uint64_t v24 = *(void *)(a2 + 80);
        uint64_t v25 = *(void *)(a2 + 88);
      }
      double v26 = CGRectGetMidY(*(CGRect *)&v22);
      goto LABEL_24;
    }
  }
}

void sub_2415DBB94(double *a1, uint64_t a2, void *a3, double a4)
{
  CGFloat v8 = (char *)objc_msgSend(*(id *)(a2 + *(int *)(type metadata accessor for CycleDay() + 20)), sel_fertileWindowLevel);
  if ((unint64_t)(v8 - 1) < 2)
  {
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    id v9 = (id)qword_26B0181A0;
    CGFloat v10 = (void *)sub_241631CC8();
    uint64_t v20 = (char *)objc_msgSend(self, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v10, v9, 0);

    CGFloat v8 = v20;
    if (v20) {
      goto LABEL_12;
    }
    __break(1u);
  }
  if (v8 != (char *)3)
  {
LABEL_11:
    uint64_t v20 = (char *)objc_msgSend(self, sel_whiteColor);
    goto LABEL_12;
  }
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_26B0181A0;
  uint64_t v12 = (void *)sub_241631CC8();
  uint64_t v20 = (char *)objc_msgSend(self, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v12, v11, 0);

  if (!v20)
  {
    __break(1u);
    goto LABEL_11;
  }
LABEL_12:
  CGFloat v13 = a1[4];
  CGFloat v14 = a1[5];
  CGFloat v15 = a1[6];
  CGFloat v16 = a1[7];
  v22.origin.CGFloat x = v13;
  v22.origin.CGFloat y = v14;
  v22.size.CGFloat width = v15;
  v22.size.CGFloat height = v16;
  CGRectGetMidX(v22);
  v23.origin.CGFloat x = v13;
  v23.origin.CGFloat y = v14;
  v23.size.CGFloat width = v15;
  v23.size.CGFloat height = v16;
  double MidY = CGRectGetMidY(v23);
  double v18 = *(double *)(v4 + 104);
  v24.origin.CGFloat x = v13;
  v24.origin.CGFloat y = v14;
  v24.size.CGFloat width = v15;
  v24.size.CGFloat height = v16;
  double Height = CGRectGetHeight(v24);
  if (qword_268CF9338 != -1) {
    swift_once();
  }
  sub_2411FE458(a3, v20, a4 - v18 * 0.5, MidY - Height * 0.5, v18, Height, *(double *)&qword_268D23C90, 0.5, 0.9);
}

void sub_2415DBE68(CGFloat *a1, CGContext *a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  *(double *)&uint64_t v13 = COERCE_DOUBLE(sub_24162EFA8());
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  CGFloat v16 = (char *)&v153 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  double v19 = (char *)&v153 - v18;
  MEMORY[0x270FA5388](v20);
  CGRect v22 = (char *)&v153 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v153 - v24;
  MEMORY[0x270FA5388](v26);
  CGLineCap v28 = (char *)&v153 - v27;
  CGFloat v29 = a1[4];
  CGFloat v30 = a1[5];
  CGFloat v31 = a1[6];
  CGFloat v32 = a1[7];
  v170.origin.CGFloat x = v29;
  v170.origin.CGFloat y = v30;
  v170.size.CGFloat width = v31;
  v170.size.CGFloat height = v32;
  double MinY = CGRectGetMinY(v170);
  v171.origin.CGFloat x = v29;
  v171.origin.CGFloat y = v30;
  CGFloat v33 = a4;
  v171.size.CGFloat width = v31;
  CGFloat v34 = a3;
  v171.size.CGFloat height = v32;
  double MaxY = CGRectGetMaxY(v171);
  double v36 = COERCE_DOUBLE(sub_2415DF03C(a3, a4, a5, a6));
  if (v38)
  {
    sub_24162EF48();
    v61 = sub_24162EF98();
    os_log_type_t v62 = sub_2416322C8();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      v164[0] = v64;
      *(_DWORD *)uint64_t v63 = 136315650;
      double v161 = COERCE_DOUBLE(sub_2411B6898(0x797469746E617551, 0xEB00000000776F52, v164));
      sub_241632C28();
      *(_WORD *)(v63 + 12) = 2080;
      double v161 = a3;
      double v162 = a4;
      type metadata accessor for CGPoint(0);
      double MinY = *(double *)&v13;
      uint64_t v65 = sub_241631D48();
      double v161 = COERCE_DOUBLE(sub_2411B6898(v65, v66, v164));
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v63 + 22) = 2080;
      double v161 = a5;
      double v162 = a6;
      uint64_t v67 = sub_241631D48();
      double v161 = COERCE_DOUBLE(sub_2411B6898(v67, v68, v164));
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v61, v62, "[%s] Was not able to make a line between: %s and %s", (uint8_t *)v63, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x245621640](v64, -1, -1);
      MEMORY[0x245621640](v63, -1, -1);

      (*(void (**)(char *, double))(v14 + 8))(v16, COERCE_DOUBLE(*(void *)&MinY));
      return;
    }

    v77 = *(void (**)(char *, uint64_t))(v14 + 8);
    v78 = v16;
    goto LABEL_16;
  }
  v159.CGFloat x = a5;
  v159.CGFloat y = a6;
  double v39 = 0.0;
  double v40 = v36 + 0.0;
  double v41 = 0.0;
  double v42 = 0.0;
  double v43 = 0.0;
  if (v36 + 0.0 != 0.0)
  {
    double v42 = (MinY + 1.0 - v37) / v40;
    double v43 = v42 * v36 + v37;
    double v39 = (MaxY + -1.0 - v37) / v40;
    double v41 = v39 * v36 + v37;
  }
  double MinY = v36 + 0.0;
  double v155 = v42;
  double v156 = v43;
  double v153 = v41;
  double v154 = v39;
  CGFloat v44 = *a1;
  CGFloat v45 = a1[1];
  CGFloat v46 = a1[2];
  CGFloat v47 = a1[3];
  v172.origin.CGFloat x = *a1;
  v172.origin.CGFloat y = v45;
  v172.size.CGFloat width = v46;
  v172.size.CGFloat height = v47;
  v166.CGFloat x = v34;
  v166.CGFloat y = v33;
  BOOL v48 = CGRectContainsPoint(v172, v166);
  CGFloat v49 = v34;
  CGFloat v50 = v33;
  CGFloat v52 = a1[8];
  CGFloat v51 = a1[9];
  CGFloat v54 = a1[10];
  CGFloat v53 = a1[11];
  CGFloat v157 = v49;
  CGFloat v158 = v50;
  if (v48)
  {
    v173.origin.CGFloat x = v52;
    v173.origin.CGFloat y = v51;
    v173.size.CGFloat width = v54;
    v173.size.CGFloat height = v53;
    CGFloat x = v159.x;
    CGFloat y = v159.y;
    if (CGRectContainsPoint(v173, v159))
    {
      CGContextSaveGState(a2);
      uint64_t v57 = *v6;
      id v58 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
      id v59 = objc_msgSend(v57, sel_resolvedColorWithTraitCollection_, v58);

      v60 = (CGColor *)objc_msgSend(v59, sel_CGColor);
      CGContextSetStrokeColorWithColor(a2, v60);

      if (qword_268CF9318 != -1) {
        swift_once();
      }
      sub_241632198();
      CGContextSetLineCap(a2, kCGLineCapRound);
      sub_2416321B8();
      goto LABEL_47;
    }
    v176.origin.CGFloat x = v44;
    v176.origin.CGFloat y = v45;
    v176.size.CGFloat width = v46;
    v176.size.CGFloat height = v47;
    v167.CGFloat x = x;
    v167.CGFloat y = y;
    if (CGRectContainsPoint(v176, v167))
    {
      CGContextSaveGState(a2);
      v79 = *v6;
      id v80 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
      id v81 = objc_msgSend(v79, sel_resolvedColorWithTraitCollection_, v80);

      v82 = (CGColor *)objc_msgSend(v81, sel_CGColor);
      CGContextSetStrokeColorWithColor(a2, v82);

      if (qword_268CF9318 == -1) {
        goto LABEL_43;
      }
      goto LABEL_54;
    }
    if (MinY == 0.0)
    {
      sub_24162EF48();
      v96 = sub_24162EF98();
      os_log_type_t v97 = sub_2416322C8();
      BOOL v98 = os_log_type_enabled(v96, v97);
      double v99 = v156;
      if (v98)
      {
        uint64_t v100 = swift_slowAlloc();
        uint64_t v101 = swift_slowAlloc();
        v164[0] = v101;
        *(_DWORD *)uint64_t v100 = 136315394;
        double v161 = COERCE_DOUBLE(sub_2411B6898(0x797469746E617551, 0xEB00000000776F52, v164));
        sub_241632C28();
        *(_WORD *)(v100 + 12) = 2080;
        double v161 = v155;
        double v162 = v99;
        char v163 = 1;
        sub_2415DF48C(0, &qword_268D04088, MEMORY[0x263F8D8F0]);
        uint64_t v102 = sub_241631D48();
        double v161 = COERCE_DOUBLE(sub_2411B6898(v102, v103, v164));
        sub_241632C28();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24118E000, v96, v97, "[%s] Missing intersection point: %s", (uint8_t *)v100, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x245621640](v101, -1, -1);
        MEMORY[0x245621640](v100, -1, -1);
      }

      v77 = *(void (**)(char *, uint64_t))(v14 + 8);
      v78 = v28;
LABEL_16:
      v77(v78, v13);
      return;
    }
    CGContextSaveGState(a2);
    v134 = *v6;
    v135 = self;
    id v136 = objc_msgSend(v135, sel_traitCollectionWithUserInterfaceStyle_, 1);
    id v137 = objc_msgSend(v134, sel_resolvedColorWithTraitCollection_, v136);

    v138 = (CGColor *)objc_msgSend(v137, sel_CGColor);
    CGContextSetStrokeColorWithColor(a2, v138);

    if (qword_268CF9318 == -1) {
      goto LABEL_45;
    }
    goto LABEL_55;
  }
  v174.origin.CGFloat x = v52;
  v174.origin.CGFloat y = v51;
  v174.size.CGFloat width = v54;
  v174.size.CGFloat height = v53;
  BOOL v69 = CGRectContainsPoint(v174, *(CGPoint *)&v49);
  v175.origin.CGFloat x = v44;
  v175.origin.CGFloat y = v45;
  v175.size.CGFloat width = v46;
  v175.size.CGFloat height = v47;
  CGFloat v71 = v159.x;
  CGFloat v70 = v159.y;
  BOOL v72 = CGRectContainsPoint(v175, v159);
  if (v69)
  {
    if (v72)
    {
      CGContextSaveGState(a2);
      v73 = *v6;
      id v74 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
      id v75 = objc_msgSend(v73, sel_resolvedColorWithTraitCollection_, v74);

      v76 = (CGColor *)objc_msgSend(v75, sel_CGColor);
      CGContextSetStrokeColorWithColor(a2, v76);

      if (qword_268CF9318 == -1) {
        goto LABEL_43;
      }
      goto LABEL_54;
    }
    v177.origin.CGFloat x = v52;
    v177.origin.CGFloat y = v51;
    v177.size.CGFloat width = v54;
    v177.size.CGFloat height = v53;
    v168.CGFloat x = v71;
    v168.CGFloat y = v70;
    if (!CGRectContainsPoint(v177, v168))
    {
      if (MinY == 0.0)
      {
        sub_24162EF48();
        v113 = sub_24162EF98();
        os_log_type_t v114 = sub_2416322C8();
        BOOL v115 = os_log_type_enabled(v113, v114);
        double v117 = v153;
        double v116 = v154;
        if (v115)
        {
          uint64_t v118 = swift_slowAlloc();
          uint64_t v119 = swift_slowAlloc();
          v164[0] = v119;
          *(_DWORD *)uint64_t v118 = 136315394;
          double v161 = COERCE_DOUBLE(sub_2411B6898(0x797469746E617551, 0xEB00000000776F52, v164));
          sub_241632C28();
          *(_WORD *)(v118 + 12) = 2080;
          double v161 = v116;
          double v162 = v117;
          char v163 = 1;
          sub_2415DF48C(0, &qword_268D04088, MEMORY[0x263F8D8F0]);
          uint64_t v120 = sub_241631D48();
          double v161 = COERCE_DOUBLE(sub_2411B6898(v120, v121, v164));
          sub_241632C28();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24118E000, v113, v114, "[%s] Missing intersection point: %s", (uint8_t *)v118, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x245621640](v119, -1, -1);
          MEMORY[0x245621640](v118, -1, -1);
        }

        v77 = *(void (**)(char *, uint64_t))(v14 + 8);
        v78 = v25;
        goto LABEL_16;
      }
      CGContextSaveGState(a2);
      v134 = *v6;
      v135 = self;
      id v150 = objc_msgSend(v135, sel_traitCollectionWithUserInterfaceStyle_, 1);
      id v151 = objc_msgSend(v134, sel_resolvedColorWithTraitCollection_, v150);

      v152 = (CGColor *)objc_msgSend(v151, sel_CGColor);
      CGContextSetStrokeColorWithColor(a2, v152);

      if (qword_268CF9318 == -1)
      {
LABEL_45:
        sub_241632198();
        CGContextSetLineCap(a2, kCGLineCapRound);
        sub_2416321B8();
        sub_2416321C8();
        CGContextStrokePath(a2);
        CGContextRestoreGState(a2);
        CGContextSaveGState(a2);
        id v139 = objc_msgSend(v135, sel_traitCollectionWithUserInterfaceStyle_, 1);
        id v140 = objc_msgSend(v134, sel_resolvedColorWithTraitCollection_, v139);

        v141 = (CGColor *)objc_msgSend(v140, sel_CGColor);
        CGContextSetStrokeColorWithColor(a2, v141);

        CGContextSetLineCap(a2, kCGLineCapRound);
        goto LABEL_46;
      }
LABEL_55:
      swift_once();
      goto LABEL_45;
    }
    CGContextSaveGState(a2);
    v92 = *v6;
    id v93 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
    id v94 = objc_msgSend(v92, sel_resolvedColorWithTraitCollection_, v93);

    v95 = (CGColor *)objc_msgSend(v94, sel_CGColor);
    CGContextSetStrokeColorWithColor(a2, v95);

    if (qword_268CF9318 == -1) {
      goto LABEL_43;
    }
LABEL_54:
    swift_once();
    goto LABEL_43;
  }
  if (v72)
  {
    if (MinY == 0.0)
    {
      sub_24162EF48();
      v83 = sub_24162EF98();
      os_log_type_t v84 = sub_2416322C8();
      BOOL v85 = os_log_type_enabled(v83, v84);
      double v87 = v155;
      double v86 = v156;
      if (v85)
      {
        uint64_t v88 = swift_slowAlloc();
        uint64_t v89 = swift_slowAlloc();
        v164[0] = v89;
        *(_DWORD *)uint64_t v88 = 136315394;
        double v161 = COERCE_DOUBLE(sub_2411B6898(0x797469746E617551, 0xEB00000000776F52, v164));
        sub_241632C28();
        *(_WORD *)(v88 + 12) = 2080;
        double v161 = v87;
        double v162 = v86;
        char v163 = 1;
        sub_2415DF48C(0, &qword_268D04088, MEMORY[0x263F8D8F0]);
        uint64_t v90 = sub_241631D48();
        double v161 = COERCE_DOUBLE(sub_2411B6898(v90, v91, v164));
        sub_241632C28();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24118E000, v83, v84, "[%s] Missing intersection point: %s", (uint8_t *)v88, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x245621640](v89, -1, -1);
        MEMORY[0x245621640](v88, -1, -1);
      }

      v77 = *(void (**)(char *, uint64_t))(v14 + 8);
      v78 = v22;
      goto LABEL_16;
    }
    CGContextSaveGState(a2);
    v126 = *v6;
    v127 = self;
    id v128 = objc_msgSend(v127, sel_traitCollectionWithUserInterfaceStyle_, 1);
    id v129 = objc_msgSend(v126, sel_resolvedColorWithTraitCollection_, v128);

    v130 = (CGColor *)objc_msgSend(v129, sel_CGColor);
    CGContextSetStrokeColorWithColor(a2, v130);

    CGContextSetLineCap(a2, kCGLineCapRound);
    sub_2416321B8();
    sub_2416321C8();
    CGContextStrokePath(a2);
    CGContextRestoreGState(a2);
    CGContextSaveGState(a2);
    id v131 = objc_msgSend(v127, sel_traitCollectionWithUserInterfaceStyle_, 1);
    id v132 = objc_msgSend(v126, sel_resolvedColorWithTraitCollection_, v131);

    v133 = (CGColor *)objc_msgSend(v132, sel_CGColor);
    CGContextSetStrokeColorWithColor(a2, v133);

    if (qword_268CF9318 == -1)
    {
LABEL_43:
      sub_241632198();
      CGContextSetLineCap(a2, kCGLineCapRound);
      goto LABEL_46;
    }
    goto LABEL_54;
  }
  v178.origin.CGFloat x = v52;
  v178.origin.CGFloat y = v51;
  v178.size.CGFloat width = v54;
  v178.size.CGFloat height = v53;
  v169.CGFloat x = v71;
  v169.CGFloat y = v70;
  if (CGRectContainsPoint(v178, v169))
  {
    if (MinY == 0.0)
    {
      sub_24162EF48();
      v104 = sub_24162EF98();
      os_log_type_t v105 = sub_2416322C8();
      BOOL v106 = os_log_type_enabled(v104, v105);
      double v108 = v153;
      double v107 = v154;
      if (v106)
      {
        uint64_t v109 = swift_slowAlloc();
        uint64_t v110 = swift_slowAlloc();
        v164[0] = v110;
        *(_DWORD *)uint64_t v109 = 136315394;
        double v161 = COERCE_DOUBLE(sub_2411B6898(0x797469746E617551, 0xEB00000000776F52, v164));
        sub_241632C28();
        *(_WORD *)(v109 + 12) = 2080;
        double v161 = v107;
        double v162 = v108;
        char v163 = 1;
        sub_2415DF48C(0, &qword_268D04088, MEMORY[0x263F8D8F0]);
        uint64_t v111 = sub_241631D48();
        double v161 = COERCE_DOUBLE(sub_2411B6898(v111, v112, v164));
        sub_241632C28();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24118E000, v104, v105, "[%s] Missing intersection point: %s", (uint8_t *)v109, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x245621640](v110, -1, -1);
        MEMORY[0x245621640](v109, -1, -1);
      }

      v77 = *(void (**)(char *, uint64_t))(v14 + 8);
      v78 = v19;
      goto LABEL_16;
    }
    CGContextSaveGState(a2);
    v142 = *v6;
    v143 = self;
    id v144 = objc_msgSend(v143, sel_traitCollectionWithUserInterfaceStyle_, 1);
    id v145 = objc_msgSend(v142, sel_resolvedColorWithTraitCollection_, v144);

    v146 = (CGColor *)objc_msgSend(v145, sel_CGColor);
    CGContextSetStrokeColorWithColor(a2, v146);

    CGContextSetLineCap(a2, kCGLineCapRound);
    sub_2416321B8();
    sub_2416321C8();
    CGContextStrokePath(a2);
    CGContextRestoreGState(a2);
    CGContextSaveGState(a2);
    id v147 = objc_msgSend(v143, sel_traitCollectionWithUserInterfaceStyle_, 1);
    id v148 = objc_msgSend(v142, sel_resolvedColorWithTraitCollection_, v147);

    v149 = (CGColor *)objc_msgSend(v148, sel_CGColor);
    CGContextSetStrokeColorWithColor(a2, v149);

    if (qword_268CF9318 == -1) {
      goto LABEL_43;
    }
    goto LABEL_54;
  }
  CGContextSaveGState(a2);
  v122 = *v6;
  id v123 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v124 = objc_msgSend(v122, sel_resolvedColorWithTraitCollection_, v123);

  v125 = (CGColor *)objc_msgSend(v124, sel_CGColor);
  CGContextSetStrokeColorWithColor(a2, v125);

  CGContextSetLineCap(a2, kCGLineCapRound);
LABEL_46:
  sub_2416321B8();
LABEL_47:
  sub_2416321C8();
  CGContextStrokePath(a2);

  CGContextRestoreGState(a2);
}

uint64_t sub_2415DD4E0(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  sub_2415DA978(a1, a2, a3, a4, a5);
  sub_2415DDF2C(a2, a3, a4, a5);
  sub_2415DE270(a2, a3, a4, a5);
  v10.n128_f64[0] = a2;
  v11.n128_f64[0] = a3;
  v12.n128_f64[0] = a4;
  v13.n128_f64[0] = a5;

  return sub_24152F548(a1, 1, v10, v11, v12, v13);
}

uint64_t sub_2415DD5B0(CGContext *a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  long long v11 = v7[4];
  long long v12 = v7[6];
  long long v13 = v7[7];
  long long v28 = v7[5];
  long long v29 = v12;
  long long v30 = v13;
  long long v14 = v7[1];
  *(_OWORD *)uint64_t v25 = *v7;
  long long v15 = v7[2];
  long long v16 = v7[3];
  *(_OWORD *)&v25[16] = v14;
  *(_OWORD *)&v25[32] = v15;
  long long v26 = v16;
  long long v27 = v11;
  sub_2415DDA44(v24, a4, a5, a6, a7);
  uint64_t v17 = *(void *)(a3 + 32);
  sub_2415DB27C(a1, (uint64_t)v24, a2, v17);
  sub_2411FEBF4((uint64_t)v25);
  uint64_t v18 = sub_2415DD900(v17);
  sub_2411FEC40((uint64_t)v25);
  v31[0] = *(_OWORD *)&v25[8];
  v31[1] = *(_OWORD *)&v25[24];
  uint64_t v19 = *(void *)&v25[40];
  uint64_t v32 = *(void *)&v25[40];
  long long v20 = *(_OWORD *)&v25[8];
  char v21 = v25[24];
  sub_2411FEAA0((uint64_t)v31);
  uint64_t v22 = sub_2415DD7C0(v18, v20, *((uint64_t *)&v20 + 1), v21, v19);
  sub_2411FEADC((uint64_t)v31);
  swift_bridgeObjectRelease();
  sub_2415DB8C4(a1, (uint64_t)v24, v22);
  return swift_bridgeObjectRelease();
}

double sub_2415DD6DC()
{
  if (qword_268CF92F0 != -1) {
    swift_once();
  }
  double v0 = *(double *)&qword_268D23C48;
  if (qword_268CF9348 != -1) {
    swift_once();
  }
  double v1 = *(double *)&qword_268D23CA0;
  if (qword_268CF9340 != -1) {
    swift_once();
  }
  return v0 * 8.0 + v1 + v1 + *(double *)&qword_268D23C98 + *(double *)&qword_268D23C98;
}

uint64_t sub_2415DD7C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  int64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_24149DD24(0, v5, 0);
    uint64_t v6 = v22;
    long long v12 = (double *)(a1 + 32);
    double v13 = *(double *)&a3 - *(double *)&a2;
    do
    {
      double v15 = *v12++;
      double v14 = v15;
      if (a4)
      {
        char v16 = 1;
        *(void *)&double v14 = 2;
      }
      else if (*(void *)&v14 >= 3uLL)
      {
        objc_msgSend(*(id *)&v14, sel_doubleValueForUnit_, a5);
        char v16 = 0;
        double v14 = (*(double *)&a3 - v17) / v13;
      }
      else
      {
        char v16 = 1;
      }
      unint64_t v19 = *(void *)(v22 + 16);
      unint64_t v18 = *(void *)(v22 + 24);
      if (v19 >= v18 >> 1) {
        sub_24149DD24(v18 > 1, v19 + 1, 1);
      }
      *(void *)(v22 + 16) = v19 + 1;
      uint64_t v20 = v22 + 16 * v19;
      *(double *)(v20 + 32) = v14;
      *(unsigned char *)(v20 + 40) = v16;
      --v5;
    }
    while (v5);
  }
  return v6;
}

uint64_t sub_2415DD900(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_24149DD58(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = *(void *)(type metadata accessor for CycleChartDay() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      swift_getAtKeyPath();
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      if (v8 >= v7 >> 1) {
        sub_24149DD58(v7 > 1, v8 + 1, 1);
      }
      *(void *)(v11 + 16) = v8 + 1;
      *(void *)(v11 + 8 * v8 + 32) = v10;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

double sub_2415DDA44@<D0>(CGFloat *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a2);
  v33.origin.CGFloat x = a2;
  v33.origin.CGFloat y = a3;
  v33.size.CGFloat width = a4;
  v33.size.CGFloat height = a5;
  double MinY = CGRectGetMinY(v33);
  if (qword_268CF9340 != -1) {
    swift_once();
  }
  double v12 = MinY + *(double *)&qword_268D23C98;
  v34.origin.CGFloat x = a2;
  v34.origin.CGFloat y = a3;
  v34.size.CGFloat width = a4;
  v34.size.CGFloat height = a5;
  CGFloat Width = CGRectGetWidth(v34);
  if (qword_268CF92F0 != -1) {
    swift_once();
  }
  CGFloat v14 = *(double *)&qword_268D23C48;
  v35.origin.CGFloat x = a2;
  v35.origin.CGFloat y = a3;
  v35.size.CGFloat width = a4;
  v35.size.CGFloat height = a5;
  CGFloat v31 = CGRectGetMinX(v35);
  CGFloat v32 = v14;
  v36.origin.CGFloat x = MinX;
  v36.origin.CGFloat y = v12;
  v36.size.CGFloat width = Width;
  v36.size.CGFloat height = v14;
  CGFloat v29 = Width;
  CGFloat v30 = MinX;
  double MaxY = CGRectGetMaxY(v36);
  double v28 = v12;
  CGFloat v16 = a5;
  if (qword_268CF9348 != -1) {
    swift_once();
  }
  double v26 = *(double *)&qword_268D23CA0;
  CGFloat v17 = MaxY + *(double *)&qword_268D23CA0;
  double v24 = MaxY + *(double *)&qword_268D23CA0;
  v37.origin.CGFloat x = a2;
  v37.origin.CGFloat y = a3;
  v37.size.CGFloat width = a4;
  v37.size.CGFloat height = v16;
  CGFloat v18 = a2;
  CGFloat v19 = CGRectGetWidth(v37);
  double v27 = *(double *)&qword_268D23C48;
  CGFloat v20 = *(double *)&qword_268D23C48 * 6.0;
  v38.origin.CGFloat x = v18;
  v38.origin.CGFloat y = a3;
  v38.size.CGFloat width = a4;
  v38.size.CGFloat height = v16;
  CGFloat v25 = CGRectGetMinX(v38);
  v39.origin.CGFloat x = v31;
  v39.origin.CGFloat y = v17;
  v39.size.CGFloat width = v19;
  v39.size.CGFloat height = v20;
  double v21 = v26 + CGRectGetMaxY(v39);
  v40.origin.CGFloat x = v18;
  v40.origin.CGFloat y = a3;
  v40.size.CGFloat width = a4;
  v40.size.CGFloat height = v16;
  CGFloat v22 = CGRectGetWidth(v40);
  *a1 = v30;
  a1[1] = v28;
  a1[2] = v29;
  a1[3] = v32;
  a1[4] = v31;
  a1[5] = v24;
  a1[6] = v19;
  a1[7] = v20;
  a1[8] = v25;
  a1[9] = v21;
  a1[10] = v22;
  double result = v27;
  a1[11] = v27;
  return result;
}

double sub_2415DDC78@<D0>(CGFloat *a1@<X0>, CGFloat *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a3);
  v49.origin.CGFloat x = a3;
  v49.origin.CGFloat y = a4;
  v49.size.CGFloat width = a5;
  v49.size.CGFloat height = a6;
  CGFloat MinY = CGRectGetMinY(v49);
  v50.origin.CGFloat x = a3;
  v50.origin.CGFloat y = a4;
  v50.size.CGFloat width = a5;
  v50.size.CGFloat height = a6;
  CGFloat Width = CGRectGetWidth(v50);
  CGFloat v12 = *a1;
  CGFloat v13 = a1[1];
  v51.size.CGFloat width = a1[2];
  CGFloat v14 = a1[3];
  CGFloat v47 = v51.size.width;
  v51.origin.CGFloat x = *a1;
  CGFloat v36 = v14;
  CGFloat v38 = *a1;
  v51.origin.CGFloat y = v13;
  CGFloat rect = v13;
  v51.size.CGFloat height = v14;
  double v15 = CGRectGetMinY(v51);
  v52.origin.CGFloat x = a3;
  v52.origin.CGFloat y = a4;
  v52.size.CGFloat width = a5;
  v52.size.CGFloat height = a6;
  double v43 = v15 - CGRectGetMinY(v52);
  v53.origin.CGFloat x = a3;
  v53.origin.CGFloat y = a4;
  v53.size.CGFloat width = a5;
  v53.size.CGFloat height = a6;
  CGFloat v42 = CGRectGetMinX(v53);
  v54.origin.CGFloat x = v12;
  v54.origin.CGFloat y = v13;
  v54.size.CGFloat width = v47;
  v54.size.CGFloat height = v14;
  CGFloat MaxY = CGRectGetMaxY(v54);
  v55.origin.CGFloat x = a3;
  v55.origin.CGFloat y = a4;
  v55.size.CGFloat width = a5;
  v55.size.CGFloat height = a6;
  CGFloat v40 = CGRectGetWidth(v55);
  CGFloat v16 = a1[4];
  CGFloat v17 = a1[5];
  CGFloat v18 = a1[6];
  v56.size.CGFloat height = a1[7];
  CGFloat height = v56.size.height;
  CGFloat v29 = v18;
  v56.origin.CGFloat x = v16;
  CGFloat v31 = v17;
  v56.origin.CGFloat y = v17;
  v56.size.CGFloat width = v18;
  double v19 = CGRectGetMinY(v56);
  v57.size.CGFloat height = v36;
  v57.origin.CGFloat x = v38;
  v57.origin.CGFloat y = rect;
  v57.size.CGFloat width = v47;
  double v48 = v19 - CGRectGetMaxY(v57);
  v58.origin.CGFloat x = a3;
  v58.origin.CGFloat y = a4;
  v58.size.CGFloat width = a5;
  v58.size.CGFloat height = a6;
  CGFloat v39 = CGRectGetMinX(v58);
  v59.origin.CGFloat x = v16;
  v59.origin.CGFloat y = v17;
  v59.size.CGFloat width = v18;
  v59.size.CGFloat height = height;
  CGFloat v37 = CGRectGetMaxY(v59);
  v60.origin.CGFloat x = a3;
  v60.origin.CGFloat y = a4;
  v60.size.CGFloat width = a5;
  v60.size.CGFloat height = a6;
  CGFloat recta = CGRectGetWidth(v60);
  v61.origin.CGFloat x = a1[8];
  CGFloat v20 = a1[9];
  CGFloat v21 = a1[10];
  v61.size.CGFloat height = a1[11];
  CGFloat v25 = v61.size.height;
  CGFloat x = v61.origin.x;
  v61.origin.CGFloat y = v20;
  v61.size.CGFloat width = v21;
  double v22 = CGRectGetMinY(v61);
  v62.origin.CGFloat y = v31;
  v62.origin.CGFloat x = v16;
  v62.size.CGFloat width = v29;
  v62.size.CGFloat height = height;
  double v33 = v22 - CGRectGetMaxY(v62);
  v63.origin.CGFloat x = a3;
  v63.origin.CGFloat y = a4;
  v63.size.CGFloat width = a5;
  v63.size.CGFloat height = a6;
  CGFloat v32 = CGRectGetMinX(v63);
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = v20;
  v64.size.CGFloat width = v21;
  v64.size.CGFloat height = v25;
  CGFloat v30 = CGRectGetMaxY(v64);
  v65.origin.CGFloat x = a3;
  v65.origin.CGFloat y = a4;
  v65.size.CGFloat width = a5;
  v65.size.CGFloat height = a6;
  CGFloat v28 = CGRectGetWidth(v65);
  v66.origin.CGFloat x = a3;
  v66.origin.CGFloat y = a4;
  v66.size.CGFloat width = a5;
  v66.size.CGFloat height = a6;
  double v23 = CGRectGetMaxY(v66);
  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = v20;
  v67.size.CGFloat width = v21;
  v67.size.CGFloat height = v25;
  double result = v23 - CGRectGetMaxY(v67);
  *a2 = MinX;
  a2[1] = MinY;
  a2[2] = Width;
  a2[3] = v43;
  a2[4] = v42;
  a2[5] = MaxY;
  a2[6] = v40;
  a2[7] = v48;
  a2[8] = v39;
  a2[9] = v37;
  a2[10] = recta;
  a2[11] = v33;
  a2[12] = v32;
  a2[13] = v30;
  a2[14] = v28;
  a2[15] = result;
  return result;
}

void sub_2415DDF2C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (*(void *)(v4 + 64))
  {
    id v9 = self;
    double v10 = *MEMORY[0x263F81840];
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    id v11 = objc_msgSend(v9, sel_systemFontOfSize_weight_, 7.0, v10);
    sub_2411B9D00(0, (unint64_t *)&qword_268CFA590);
    CGFloat v12 = (void *)sub_241632718();
    id v13 = objc_msgSend(self, sel_darkTextColor);
    sub_241274778(v11, v12, v13);

    id v14 = objc_allocWithZone(MEMORY[0x263F086A0]);
    double v15 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_2411CCDB4();
    CGFloat v16 = (void *)sub_241631B18();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v14, sel_initWithString_attributes_, v15, v16);

    objc_msgSend(v32, sel_boundingRectWithSize_options_context_, 1, 0, 70.0, 1.79769313e308);
    CGFloat v18 = v17;
    CGFloat rect = v19;
    double v21 = v20;
    double v23 = v22;
    v34.origin.CGFloat x = a1;
    v34.origin.CGFloat y = a2;
    v34.size.CGFloat width = a3;
    v34.size.CGFloat height = a4;
    CGFloat v31 = a3;
    double MinY = CGRectGetMinY(v34);
    v35.origin.CGFloat x = a1;
    v35.origin.CGFloat y = a2;
    v35.size.CGFloat width = a3;
    v35.size.CGFloat height = a4;
    CGFloat v25 = a2;
    double Height = CGRectGetHeight(v35);
    v36.origin.CGFloat x = v18;
    v36.origin.CGFloat y = rect;
    v36.size.CGFloat width = v21;
    v36.size.CGFloat height = v23;
    double v27 = MinY + (Height - CGRectGetHeight(v36)) * 0.5;
    if (qword_268CF9358 != -1) {
      swift_once();
    }
    double v28 = v27 + *(double *)&qword_268D23CB0;
    v37.origin.CGFloat x = a1;
    v37.origin.CGFloat y = v25;
    v37.size.CGFloat width = v31;
    v37.size.CGFloat height = a4;
    double MinX = CGRectGetMinX(v37);
    if (qword_268CF9300 != -1) {
      swift_once();
    }
    objc_msgSend(v32, sel_drawWithRect_options_context_, 1, 0, MinX + *(double *)&qword_268D23C58, v28, v21, v23);
  }
}

void sub_2415DE270(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v9 = sub_24162B7E8();
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_241631CA8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  double v15 = (char *)v115 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  CGFloat v18 = (char *)v115 - v17;
  uint64_t v19 = sub_241631C88();
  MEMORY[0x270FA5388](v19 - 8);
  double v21 = (char *)v115 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v22 = *(_OWORD *)(v4 + 24);
  v138[0] = *(_OWORD *)(v4 + 8);
  v138[1] = v22;
  uint64_t v139 = *(void *)(v4 + 40);
  sub_2415DF358((uint64_t)v138, (uint64_t)v140, (uint64_t (*)(void))sub_2415DF3C0);
  sub_2415DF358((uint64_t)v140, (uint64_t)&v141, (uint64_t (*)(void))sub_2415DF3C0);
  if (v143)
  {
    uint64_t v23 = 0;
    uint64_t v119 = 0;
    uint64_t v125 = 0;
    unint64_t v24 = 0xE000000000000000;
    unint64_t v134 = 0xE000000000000000;
    unint64_t v124 = 0xE000000000000000;
  }
  else
  {
    double v25 = v141;
    double v26 = v141 + (v142 - v141) * 0.5;
    uint64_t v23 = sub_2415B59EC(v142);
    unint64_t v24 = v27;
    uint64_t v119 = sub_2415B59EC(v26);
    unint64_t v134 = v28;
    uint64_t v125 = sub_2415B59EC(v25);
    unint64_t v124 = v29;
  }
  sub_2415DDA44(&v135.origin.x, a1, a2, a3, a4);
  sub_241631C78();
  sub_241631C68();
  unint64_t v133 = v24;
  sub_241631C58();
  sub_241631C68();
  sub_241631C98();
  CGFloat v30 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v123 = v13 + 16;
  v122 = v30;
  v30(v15, v18, v12);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v31 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v120 = "MINDER_CANCEL_PROMPT";
  v126 = v15;
  uint64_t v132 = sub_241631D38();
  double v33 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v32 = v13 + 8;
  unint64_t v121 = v33;
  v33(v18, v12);
  CGFloat x = v135.origin.x;
  CGFloat y = v135.origin.y;
  CGFloat width = v135.size.width;
  CGFloat height = v135.size.height;
  double MinX = CGRectGetMinX(v135);
  v144.origin.CGFloat x = x;
  v144.origin.CGFloat y = y;
  v144.size.CGFloat width = width;
  v144.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v144);
  if (qword_268CF9308 != -1) {
    swift_once();
  }
  double v117 = v21;
  uint64_t v118 = v23;
  v127 = v18;
  uint64_t v128 = v32;
  id v129 = v11;
  uint64_t v130 = v12;
  double v40 = *(double *)&qword_268D23C60;
  double v41 = *(double *)(v4 + 104);
  if (qword_268CF9350 != -1) {
    swift_once();
  }
  double v42 = MinX + v40 - v41 - *(double *)&qword_268D23CA8;
  double v43 = self;
  double v44 = *MEMORY[0x263F81840];
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  id v45 = objc_msgSend(v43, sel_systemFontOfSize_weight_, 6.0, v44);
  CGFloat v46 = (void *)sub_24162CC48();
  v115[1] = sub_2411B9D00(0, (unint64_t *)&qword_268CFA590);
  CGFloat v47 = (void *)sub_241632718();
  sub_241274778(v45, v47, v46);

  id v48 = objc_allocWithZone(MEMORY[0x263F086A0]);
  CGRect v49 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  uint64_t v131 = v50;
  sub_2411CCDB4();
  uint64_t v132 = MEMORY[0x263F8EE58] + 8;
  CGRect v51 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v52 = objc_msgSend(v48, sel_initWithString_attributes_, v49, v51);

  objc_msgSend(v52, sel_size);
  objc_msgSend(v52, sel_drawAtPoint_, v42 - v53, MidY - v54 * 0.5);
  swift_bridgeObjectRelease();

  CGFloat v55 = v136.origin.x;
  CGFloat v56 = v136.origin.y;
  CGFloat v57 = v136.size.width;
  CGFloat v58 = v136.size.height;
  double v59 = CGRectGetMinX(v136);
  v145.origin.CGFloat x = v55;
  v145.origin.CGFloat y = v56;
  v145.size.CGFloat width = v57;
  v145.size.CGFloat height = v58;
  double MinY = CGRectGetMinY(v145);
  double v61 = v59 + *(double *)&qword_268D23C60 - v41 - *(double *)&qword_268D23CA8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  id v62 = objc_msgSend(v43, sel_systemFontOfSize_weight_, 6.0, v44);
  CGRect v63 = (void *)sub_24162CC48();
  CGRect v64 = (void *)sub_241632718();
  sub_241274778(v62, v64, v63);

  id v65 = objc_allocWithZone(MEMORY[0x263F086A0]);
  CGRect v66 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  CGRect v67 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v68 = objc_msgSend(v65, sel_initWithString_attributes_, v66, v67);

  objc_msgSend(v68, sel_size);
  objc_msgSend(v68, sel_drawAtPoint_, v61 - v69, MinY - v70 * 0.5);

  v146.origin.CGFloat x = v55;
  v146.origin.CGFloat y = v56;
  v146.size.CGFloat width = v57;
  v146.size.CGFloat height = v58;
  double v71 = CGRectGetMinX(v146);
  v147.origin.CGFloat x = v55;
  v147.origin.CGFloat y = v56;
  v147.size.CGFloat width = v57;
  v147.size.CGFloat height = v58;
  double v72 = CGRectGetMidY(v147);
  double v73 = v71 + *(double *)&qword_268D23C60 - v41 - *(double *)&qword_268D23CA8;
  unint64_t v74 = v134;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  id v116 = v43;
  id v75 = objc_msgSend(v43, sel_systemFontOfSize_weight_, 6.0, v44);
  v76 = (void *)sub_24162CC48();
  v77 = (void *)sub_241632718();
  sub_241274778(v75, v77, v76);

  id v78 = objc_allocWithZone(MEMORY[0x263F086A0]);
  unint64_t v134 = v74;
  v79 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  id v80 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v81 = objc_msgSend(v78, sel_initWithString_attributes_, v79, v80);

  objc_msgSend(v81, sel_size);
  objc_msgSend(v81, sel_drawAtPoint_, v73 - v82, v72 - v83 * 0.5);

  v148.origin.CGFloat x = v55;
  v148.origin.CGFloat y = v56;
  v148.size.CGFloat width = v57;
  v148.size.CGFloat height = v58;
  double v84 = CGRectGetMinX(v148);
  v149.origin.CGFloat x = v55;
  v149.origin.CGFloat y = v56;
  v149.size.CGFloat width = v57;
  v149.size.CGFloat height = v58;
  double MaxY = CGRectGetMaxY(v149);
  double v86 = v84 + *(double *)&qword_268D23C60 - v41 - *(double *)&qword_268D23CA8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  id v87 = objc_msgSend(v43, sel_systemFontOfSize_weight_, 6.0, v44);
  uint64_t v88 = (void *)sub_24162CC48();
  uint64_t v89 = (void *)sub_241632718();
  sub_241274778(v87, v89, v88);

  id v90 = objc_allocWithZone(MEMORY[0x263F086A0]);
  unint64_t v91 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  v92 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v93 = objc_msgSend(v90, sel_initWithString_attributes_, v91, v92);

  objc_msgSend(v93, sel_size);
  objc_msgSend(v93, sel_drawAtPoint_, v86 - v94, MaxY - v95 * 0.5);

  sub_241631C78();
  sub_241631C68();
  sub_241631C58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_241631C68();
  v96 = v127;
  sub_241631C98();
  uint64_t v97 = v130;
  v122(v126, v96, v130);
  id v98 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  v121(v96, v97);
  CGFloat v99 = v137.origin.x;
  CGFloat v100 = v137.origin.y;
  CGFloat v101 = v137.size.width;
  CGFloat v102 = v137.size.height;
  double v103 = CGRectGetMinX(v137);
  v150.origin.CGFloat x = v99;
  v150.origin.CGFloat y = v100;
  v150.size.CGFloat width = v101;
  v150.size.CGFloat height = v102;
  double v104 = CGRectGetMidY(v150);
  double v105 = v103 + *(double *)&qword_268D23C60 - v41 - *(double *)&qword_268D23CA8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  id v106 = objc_msgSend(v116, sel_systemFontOfSize_weight_, 6.0, v44);
  double v107 = (void *)sub_24162CC48();
  double v108 = (void *)sub_241632718();
  sub_241274778(v106, v108, v107);

  id v109 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v110 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  uint64_t v111 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v112 = objc_msgSend(v109, sel_initWithString_attributes_, v110, v111);

  objc_msgSend(v112, sel_size);
  objc_msgSend(v112, sel_drawAtPoint_, v105 - v113, v104 - v114 * 0.5);
  swift_bridgeObjectRelease();
}

uint64_t sub_2415DF03C(double a1, double a2, double a3, double a4)
{
  uint64_t v8 = sub_24162EFA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v12 = a3 - a1;
  if (v12 == 0.0)
  {
    sub_24162EF48();
    uint64_t v13 = sub_24162EF98();
    os_log_type_t v14 = sub_2416322C8();
    if (os_log_type_enabled(v13, v14))
    {
      double v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v19 = v16;
      *(_DWORD *)double v15 = 136315138;
      uint64_t v18 = sub_2411B6898(0xD000000000000033, 0x8000000241675030, &v19);
      sub_241632C28();
      _os_log_impl(&dword_24118E000, v13, v14, "[%s] Vertical lines are not supported", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245621640](v16, -1, -1);
      MEMORY[0x245621640](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    *(double *)&uint64_t result = (a4 - a2) / v12;
  }
  return result;
}

void sub_2415DF268()
{
  if (!qword_268D04090)
  {
    type metadata accessor for CycleChartDay();
    sub_2415DF43C(255, &qword_268D00F08, MEMORY[0x263F8D568], (uint64_t (*)(void, void))type metadata accessor for Determined);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D04090);
    }
  }
}

uint64_t sub_2415DF2FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CycleChartDay();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2415DF358(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_2415DF3C0()
{
  if (!qword_268CFAA48)
  {
    sub_2415DF43C(255, (unint64_t *)&qword_268CFAA50, MEMORY[0x263F8D560], MEMORY[0x263F8D1A0]);
    unint64_t v0 = sub_241632C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268CFAA48);
    }
  }
}

void sub_2415DF43C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, void))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, MEMORY[0x263F8D538]);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_2415DF48C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    type metadata accessor for CGPoint(255);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2415DF4F0(void *a1, uint64_t a2)
{
  uint64_t v59 = a2;
  uint64_t v3 = sub_24162EFA8();
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v50 = (char *)&v49 - v5;
  uint64_t v6 = sub_24162DCA8();
  uint64_t v51 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_24162DDE8();
  uint64_t v52 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  double v54 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24162DDF8();
  uint64_t v55 = *(void *)(v10 - 8);
  uint64_t v56 = v10;
  MEMORY[0x270FA5388](v10);
  double v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  double v15 = (char *)&v49 - v14;
  *(void *)&double v17 = MEMORY[0x270FA5388](v16).n128_u64[0];
  uint64_t v19 = (char *)&v49 - v18;
  id v20 = objc_msgSend(a1, sel_identifier, v17);
  uint64_t v21 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v23 = v22;

  if (v21 == 0xD000000000000038 && v23 == 0x8000000241675150
    || (sub_241633218() & 1) != 0
    || v21 == 0xD000000000000031 && v23 == 0x8000000241675190
    || (sub_241633218() & 1) != 0
    || v21 == 0xD000000000000030 && v23 == 0x80000002416751D0
    || (sub_241633218() & 1) != 0
    || v21 == 0xD000000000000031 && v23 == 0x8000000241675210
    || (sub_241633218() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_24127E348(a1, v59);
    return v24;
  }
  if (v21 == 0xD000000000000021 && v23 == 0x8000000241675250 || (sub_241633218() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = v59;
    sub_24162DDD8();
    static PregnancyDataTypeDetailConfigurationProvider.configuration(mode:)((uint64_t)v19);
    sub_24162DC38();
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v54, v27, v53);
    id v28 = objc_allocWithZone((Class)sub_24162DE78());
    id v29 = a1;
    uint64_t v25 = sub_24162DE68();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v19, v56);
    return v25;
  }
  if (v21 == 0xD000000000000035 && v23 == 0x800000024165ACE0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v30 = sub_241633218();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      uint64_t v66 = 0;
      memset(v65, 0, sizeof(v65));
      sub_2415E0004((uint64_t)v65, (uint64_t)&v60);
      if (v61)
      {
        sub_2411B6CD4(&v60, (uint64_t)v62);
        sub_2411B6854(v62, (uint64_t)v63);
        sub_24162E228();
        uint64_t v46 = v59;
        sub_24162DC38();
        (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v54, v46, v53);
        id v47 = objc_allocWithZone((Class)sub_24162DE78());
        id v48 = a1;
        uint64_t v25 = sub_24162DE68();
        (*(void (**)(char *, uint64_t))(v55 + 8))(v12, v56);
        sub_2415E0094((uint64_t)v65);
        _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v62);
      }
      else
      {
        sub_2415E0094((uint64_t)&v60);
        sub_24162EF68();
        id v40 = a1;
        double v41 = sub_24162EF98();
        os_log_type_t v42 = sub_2416322C8();
        if (os_log_type_enabled(v41, v42))
        {
          double v43 = (uint8_t *)swift_slowAlloc();
          double v44 = (void *)swift_slowAlloc();
          *(_DWORD *)double v43 = 138412290;
          v62[0] = v40;
          id v45 = v40;
          sub_241632C28();
          *double v44 = v40;

          _os_log_impl(&dword_24118E000, v41, v42, "[MenstrualCyclesAppDelegate] No custom detail view controller or configuration provided for %@", v43, 0xCu);
          sub_2415E011C(0, (unint64_t *)&qword_26B0121E0, (uint64_t)&qword_26B012200, 0x263F8C6D0, (void (*)(uint64_t, uint64_t, uint64_t))sub_2411B9D00);
          swift_arrayDestroy();
          MEMORY[0x245621640](v44, -1, -1);
          MEMORY[0x245621640](v43, -1, -1);
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v57 + 8))(v50, v58);
        sub_2415E0094((uint64_t)v65);
        return 0;
      }
      return v25;
    }
  }
  sub_2411B9D00(0, (unint64_t *)&qword_26B010718);
  id v31 = (id)*MEMORY[0x263F09BE0];
  uint64_t v32 = (void *)MEMORY[0x24561F7E0]();
  sub_24162DCB8();

  unsigned int v33 = objc_msgSend(self, sel_isAppleInternalInstall);
  uint64_t v34 = v56;
  if (v33)
  {
    uint64_t v36 = qword_268D01680;
    CGRect v35 = off_268D01688;
    CGRect v63 = &type metadata for InternalKaliLiveOnSettingsComponent;
    unint64_t v64 = sub_2415E0178();
    v62[0] = v36;
    v62[1] = v35;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_24162DCD8();
    uint64_t v37 = v51;
    (*(void (**)(char *, void, uint64_t))(v51 + 104))(v8, *MEMORY[0x263F44380], v6);
    sub_24162E298();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v6);
    _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v62);
  }
  uint64_t v38 = v59;
  sub_24162DC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v54, v38, v53);
  MEMORY[0x24561F7E0](v31);
  id v39 = objc_allocWithZone((Class)sub_24162DE78());
  uint64_t v25 = sub_24162DE68();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v15, v34);
  return v25;
}

uint64_t sub_2415E0004(uint64_t a1, uint64_t a2)
{
  sub_2415E011C(0, &qword_268D040A0, (uint64_t)&unk_268D040A8, MEMORY[0x263F44648], (void (*)(uint64_t, uint64_t, uint64_t))sub_2411BF880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2415E0094(uint64_t a1)
{
  sub_2415E011C(0, &qword_268D040A0, (uint64_t)&unk_268D040A8, MEMORY[0x263F44648], (void (*)(uint64_t, uint64_t, uint64_t))sub_2411BF880);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2415E011C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    a5(255, a3, a4);
    unint64_t v6 = sub_241632C18();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

unint64_t sub_2415E0178()
{
  unint64_t result = qword_268D040B0;
  if (!qword_268D040B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D040B0);
  }
  return result;
}

void sub_2415E027C()
{
  uint64_t v1 = v0;
  id v2 = objc_allocWithZone((Class)type metadata accessor for CycleChartsView());
  uint64_t v3 = swift_retain();
  uint64_t v8 = sub_241626864(v3);
  uint64_t v4 = *(void *)&v8[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v6 = (uint64_t *)(*(void *)(v4 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_daysCountView)
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_8500AFF12A8E9400BC4D6E25DA312FB030CycleChartsDaysCountHeaderView_showPDF);
  uint64_t v7 = *v6;
  *unint64_t v6 = (uint64_t)sub_2415E0FA8;
  v6[1] = v5;
  sub_2411F4090(v7);
  objc_msgSend(v1, sel_setView_, v8);
}

void sub_2415E036C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x245621790](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_2415E0940();
  }
}

void sub_2415E0408()
{
  uint64_t v1 = sub_24162B7E8();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_241631CA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v17[-v7];
  uint64_t v9 = (objc_class *)type metadata accessor for CycleChartsViewController();
  v18.receiver = v0;
  v18.super_class = v9;
  objc_msgSendSuper2(&v18, sel_viewDidLoad);
  sub_241631C38();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v5, v8, v2);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v10 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
  uint64_t v11 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTitle_, v11);

  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 2, v0, sel_presentEditView);
  id v13 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v13, sel_setRightBarButtonItem_, v12);

  id v14 = objc_msgSend(v0, sel_view);
  if (v14)
  {
    double v15 = v14;
    if (qword_26B00F370 != -1) {
      swift_once();
    }
    *(_OWORD *)&v17[8] = xmmword_26B017FC8;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_241631E08();
    uint64_t v16 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setAccessibilityIdentifier_, v16);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2415E079C()
{
  id v1 = UIViewController.resolvedHealthStoreOrBust.getter();
  uint64_t v2 = *(void *)(*(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_model]
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_settings);
  *(void *)(swift_allocObject() + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  sub_2415E0EC0();
  objc_allocWithZone(v4);
  swift_retain();
  uint64_t v5 = v0;
  swift_retain();
  swift_retain();
  uint64_t v6 = (void *)sub_2416305F8();
  objc_msgSend(v6, sel_setModalPresentationStyle_, 2);
  id v7 = objc_msgSend(v5, sel_navigationController);
  if (v7)
  {
    uint64_t v8 = v7;
    objc_msgSend(v7, sel_presentViewController_animated_completion_, v6, 1, 0);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_2415E0940()
{
  uint64_t v28 = sub_241631AC8();
  uint64_t v1 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  id v29 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24124418C(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CycleChartCycle(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v28 - v11;
  uint64_t v30 = v0;
  uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_model);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24162FC48();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    return sub_2415E0DE0((uint64_t)v5, (uint64_t (*)(void))sub_24124418C);
  }
  sub_241232920((uint64_t)v5, (uint64_t)v12);
  double v15 = *(void **)(v13 + 16);
  sub_2413223B8((uint64_t)v12, (uint64_t)v9);
  uint64_t v16 = v29;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v29, &v12[*(int *)(v6 + 28)], v28);
  double v17 = *(void **)(v30 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_calendarCache);
  uint64_t v18 = *(void *)(v13
                  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_basalBodyTemperatureRange
                  + 32);
  long long v19 = *(_OWORD *)(v13
                  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_basalBodyTemperatureRange
                  + 16);
  v32[0] = *(_OWORD *)(v13
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_basalBodyTemperatureRange);
  v32[1] = v19;
  uint64_t v33 = v18;
  uint64_t v21 = *(void **)(v13 + 72);
  id v20 = *(void **)(v13 + 80);
  LODWORD(v28) = *(unsigned __int8 *)(v13 + 88);
  uint64_t v22 = type metadata accessor for CycleChartPDFProvider();
  swift_allocObject();
  id v23 = v15;
  id v24 = v17;
  sub_2411FEAA0((uint64_t)v32);
  id v25 = v21;
  id v26 = v20;
  uint64_t v27 = sub_2412135EC(v23, (uint64_t)v9, v16, v24, (uint64_t)v32, v25, v26, v28);
  v31[3] = v22;
  v31[4] = sub_2415E0D88();
  v31[0] = v27;
  sub_2416324C8();
  sub_2415E0DE0((uint64_t)v12, type metadata accessor for CycleChartCycle);
  return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v31);
}

id sub_2415E0CCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CycleChartsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CycleChartsViewController()
{
  return self;
}

unint64_t sub_2415E0D88()
{
  unint64_t result = qword_268D040D0;
  if (!qword_268D040D0)
  {
    type metadata accessor for CycleChartPDFProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D040D0);
  }
  return result;
}

uint64_t sub_2415E0DE0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2415E0E40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2415E0E78()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2415E0EB8()
{
  return sub_24120B27C(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

void sub_2415E0EC0()
{
  if (!qword_268D040D8)
  {
    sub_2415E0F1C();
    unint64_t v0 = sub_241630608();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D040D8);
    }
  }
}

unint64_t sub_2415E0F1C()
{
  unint64_t result = qword_268D040E0;
  if (!qword_268D040E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D040E0);
  }
  return result;
}

uint64_t sub_2415E0F70()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2415E0FA8()
{
  sub_2415E036C(v0);
}

id sub_2415E0FB0(uint64_t a1, void *a2)
{
  uint64_t v5 = v2;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_241633068()) {
    unint64_t v6 = sub_2411CA178(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v6 = MEMORY[0x263F8EE88];
  }
  *(void *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_subscriptions] = v6;
  *(void *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_model] = a1;
  *(void *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_calendarCache] = a2;
  swift_retain();
  id v7 = a2;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for CycleChartsViewController();
  return objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for CycleFactorSectionDataSource()
{
  uint64_t result = qword_268D040F0;
  if (!qword_268D040F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2415E10C4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2415E1110(uint64_t a1)
{
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162D168();
  sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    char v7 = v31;
    uint64_t v39 = v28;
    uint64_t v40 = v29;
    char v42 = v31;
    char v43 = v32;
    int v8 = (v30 ^ 1) & 1;
    char v41 = (v30 ^ 1) & 1;
    sub_24162EF48();
    swift_bridgeObjectRetain_n();
    objc_super v9 = sub_24162EF98();
    os_log_type_t v10 = sub_2416322E8();
    int v27 = v10;
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v26 = a1;
      uint64_t v12 = v11;
      uint64_t v25 = swift_slowAlloc();
      v33[0] = v25;
      *(_DWORD *)uint64_t v12 = 136446722;
      int v24 = v8;
      uint64_t v13 = sub_2416333E8();
      uint64_t v28 = sub_2411B6898(v13, v14, v33);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      LOBYTE(v28) = v7;
      uint64_t v15 = sub_241631D78();
      uint64_t v28 = sub_2411B6898(v15, v16, v33);
      sub_241632C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 22) = 1024;
      swift_bridgeObjectRelease();
      LODWORD(v28) = v24;
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v9, (os_log_type_t)v27, "[%{public}s] Row %s selected: %{BOOL}d", (uint8_t *)v12, 0x1Cu);
      uint64_t v17 = v25;
      swift_arrayDestroy();
      MEMORY[0x245621640](v17, -1, -1);
      MEMORY[0x245621640](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_beginAccess();
    uint64_t v18 = v39;
    uint64_t v19 = v40;
    char v20 = v41;
    char v21 = v42;
    char v22 = v43;
    uint64_t v37 = &type metadata for OnboardingSelectRow;
    unint64_t v38 = sub_24123D604();
    v33[0] = v18;
    v33[1] = v19;
    char v34 = v20;
    char v35 = v21;
    char v36 = v22;
    sub_24162D7D8();
    return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v33);
  }
  return result;
}

uint64_t sub_2415E14A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v44 = sub_24162BB18();
  uint64_t v43 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v40 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24162D678();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2414BB26C();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2415E53B4(0, &qword_268D01248, (uint64_t (*)(uint64_t))sub_2414BB26C, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v58 = (char *)&v39 - v15;
  uint64_t v41 = v1;
  uint64_t result = sub_24162D728();
  unint64_t v17 = 0;
  uint64_t v18 = *(void *)(result + 16);
  uint64_t v45 = v4 + 16;
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  uint64_t v56 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  uint64_t v55 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  uint64_t v47 = v4;
  uint64_t v53 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v61 = v13;
  uint64_t v57 = result;
  uint64_t v50 = v18;
  uint64_t v49 = v3;
  id v48 = v6;
  uint64_t v51 = v8;
  while (1)
  {
    if (v17 == v18)
    {
      uint64_t v19 = 1;
      uint64_t v20 = v18;
    }
    else
    {
      if ((v17 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      if (v17 >= *(void *)(result + 16)) {
        goto LABEL_23;
      }
      unint64_t v60 = v17 + 1;
      uint64_t v21 = v47;
      unint64_t v22 = v17;
      uint64_t v23 = &v46[*(int *)(v8 + 48)];
      (*(void (**)(char *, unint64_t, uint64_t))(v47 + 16))(v23, result+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v17, v3);
      int v24 = &v61[*(int *)(v8 + 48)];
      *(void *)uint64_t v61 = v22;
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
      uint64_t v13 = v61;
      v25(v24, v23, v3);
      uint64_t v19 = 0;
      uint64_t v20 = v60;
    }
    uint64_t v26 = v58;
    (*v56)(v13, v19, 1, v8);
    sub_2415E5320((uint64_t)v13, (uint64_t)v26);
    if ((*v55)(v26, 1, v8) == 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v38 = 1;
      uint64_t v37 = v42;
      uint64_t v36 = v44;
      uint64_t v35 = v43;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v37, v38, 1, v36);
    }
    unint64_t v60 = v20;
    uint64_t v52 = *(void *)v26;
    (*v59)(v6, &v26[*(int *)(v8 + 48)], v3);
    uint64_t v27 = sub_24162D658();
    uint64_t v28 = *(void *)(v27 + 16);
    if (v28) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_3:
    (*v53)(v6, v3);
    uint64_t v8 = v51;
    uint64_t result = v57;
    uint64_t v18 = v50;
    unint64_t v17 = v60;
  }
  uint64_t v29 = 0;
  uint64_t v54 = v27;
  uint64_t v30 = v27 + 32;
  while (1)
  {
    sub_2411A3DF4(v30, (uint64_t)&v66);
    sub_2411A3DF4((uint64_t)&v66, (uint64_t)v62);
    sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
    sub_2411BF880(0, &qword_268D01228);
    if (swift_dynamicCast()) {
      break;
    }
    uint64_t v65 = 0;
    long long v63 = 0u;
    long long v64 = 0u;
    sub_2415E5568((uint64_t)&v63, &qword_268D04100, &qword_268D01228, (uint64_t)&protocol descriptor for PickerDisplayRow);
    _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v66);
LABEL_13:
    ++v29;
    v30 += 40;
    if (v28 == v29)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = v49;
      unint64_t v6 = v48;
      uint64_t v13 = v61;
      goto LABEL_3;
    }
  }
  uint64_t v32 = *((void *)&v64 + 1);
  uint64_t v31 = v65;
  sub_2411B6854(&v63, *((uint64_t *)&v64 + 1));
  LOBYTE(v31) = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 16))(v32, v31);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v63);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v66);
  if ((v31 & 1) == 0) {
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = v40;
  uint64_t v34 = v52;
  MEMORY[0x245618F80](v29, v52);
  sub_2415E2F84(0, &v66);
  uint64_t v35 = v43;
  uint64_t v36 = v44;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v44);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v66);
  uint64_t result = v29 + 1;
  if (!__OFADD__(v29, 1))
  {
    uint64_t v37 = v42;
    MEMORY[0x245618F80](result, v34);
    sub_24162D6D8();
    (*v53)(v48, v49);
    uint64_t v38 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v37, v38, 1, v36);
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_2415E1B80()
{
  uint64_t v0 = sub_24162BB18();
  uint64_t v1 = *(void *)(v0 - 8);
  __n128 v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x245618F80](0, 0, v2);
  sub_24162D168();
  sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
  if (swift_dynamicCast())
  {
    int v5 = v7[16];
    swift_bridgeObjectRelease();
    if (v5 == 1) {
      sub_2415E1110((uint64_t)v4);
    }
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v1 + 8))(v4, v0);
}

unint64_t sub_2415E1CE8(uint64_t a1)
{
  __n128 v2 = v1;
  uint64_t v57 = *v2;
  sub_2415E53B4(0, (unint64_t *)&qword_26B011D00, MEMORY[0x263F07A30], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v58 = (char *)&v54 - v5;
  uint64_t v6 = sub_24162D678();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24162BB18();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v59 = (char *)&v54 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v55 = (char *)&v54 - v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v54 - v19;
  unint64_t result = sub_24162BAC8();
  unint64_t v22 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v56 = a1;
  uint64_t v23 = sub_24162BB08();
  MEMORY[0x245618F80](v22, v23);
  uint64_t v24 = sub_24162BB08();
  uint64_t v25 = *(void *)(sub_24162D728() + 16);
  swift_bridgeObjectRelease();
  if (v24 >= v25) {
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v20, v10);
  }
  uint64_t v54 = v13;
  uint64_t v26 = v10;
  uint64_t v27 = sub_24162BAC8();
  uint64_t v28 = sub_24162D728();
  unint64_t result = sub_24162BB08();
  if ((result & 0x8000000000000000) != 0) {
    goto LABEL_26;
  }
  if (result >= *(void *)(v28 + 16))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v28+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * result, v6);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_24162D658();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v30 = *(void *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v30 < v27) {
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v20, v26);
  }
  uint64_t v31 = v56;
  char v32 = sub_24162D108();
  uint64_t v33 = v26;
  uint64_t v34 = v54;
  uint64_t v35 = (uint64_t)v58;
  uint64_t v36 = v59;
  if ((v32 & 1) == 0)
  {
LABEL_15:
    sub_2415E14A8(v35);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v35, 1, v33) == 1)
    {
      sub_2415E55D8(v35, (unint64_t *)&qword_26B011D00, MEMORY[0x263F07A30]);
    }
    else
    {
      uint64_t v39 = v55;
      (*(void (**)(void))(v11 + 32))();
      uint64_t v40 = sub_24162BB08();
      uint64_t v41 = sub_24162BB08();
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v36, v39, v33);
      if (v40 == v41)
      {
        uint64_t v59 = (char *)sub_24162BAC8();
        uint64_t v42 = sub_24162BAC8();
        uint64_t v43 = v36;
        uint64_t v44 = *(void (**)(char *, uint64_t))(v11 + 8);
        v44(v43, v33);
        v44(v39, v33);
        if ((uint64_t)v59 < v42) {
          (*(void (**)(char *, uint64_t, uint64_t))(v11 + 24))(v20, v31, v33);
        }
      }
      else
      {
        uint64_t v45 = *(void (**)(char *, uint64_t))(v11 + 8);
        v45(v36, v33);
        v45(v39, v33);
      }
    }
    unint64_t result = sub_24162BAC8();
    unint64_t v46 = result - 1;
    if (!__OFSUB__(result, 1))
    {
      uint64_t v47 = sub_24162BB08();
      MEMORY[0x245618F80](v46, v47);
      sub_2415E2F84(1, v64);
      id v48 = v34;
      uint64_t v49 = v65;
      uint64_t v50 = v66;
      uint64_t v51 = sub_2411B6854(v64, v65);
      *((void *)&v61 + 1) = v49;
      uint64_t v62 = *(void *)(v50 + 8);
      uint64_t v52 = sub_2411B6C70((uint64_t *)&v60);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v49 - 8) + 16))(v52, v51, v49);
      sub_2415E3188(&v60, v63);
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v60);
      sub_24162D7A8();
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v63);
      uint64_t v53 = *(void (**)(char *, uint64_t))(v11 + 8);
      v53(v48, v33);
      v53(v20, v33);
      return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v64);
    }
LABEL_28:
    __break(1u);
    return result;
  }
  sub_24162D168();
  sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
  sub_2411BF880(0, &qword_268D01228);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v62 = 0;
    long long v60 = 0u;
    long long v61 = 0u;
    sub_2415E5568((uint64_t)&v60, &qword_268D04100, &qword_268D01228, (uint64_t)&protocol descriptor for PickerDisplayRow);
    goto LABEL_15;
  }
  sub_2411B6CD4(&v60, (uint64_t)v64);
  uint64_t v37 = v65;
  uint64_t v38 = v66;
  sub_2411B6854(v64, v65);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v38 + 16))(v37, v38) & 1) == 0)
  {
    _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v64);
    uint64_t v36 = v59;
    goto LABEL_15;
  }
  sub_2415E2F84(0, v63);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v63);
  sub_24162D6D8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v20, v33);
  return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v64);
}

uint64_t sub_2415E2410(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24162D678();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t result = sub_24162D728();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (*(void *)(result + 16) <= a1)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, result+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_24162D658();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v11 = v9 + 32;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    while (1)
    {
      sub_2411A3DF4(v11, (uint64_t)v15);
      sub_2411A3DF4((uint64_t)v15, (uint64_t)v14);
      sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
      if (swift_dynamicCast()) {
        break;
      }
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v15);
      v11 += 40;
      if (!--v10)
      {
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
    sub_24126EF94((uint64_t)v13);
    _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v15);
    swift_bridgeObjectRelease_n();
    return sub_24123B3C0(*(unsigned char *)(v2 + qword_268D040E8));
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t sub_2415E2620(int a1, int a2)
{
  int v39 = a2;
  LODWORD(v41) = a1;
  uint64_t v40 = sub_24162D678();
  uint64_t v4 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v38 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t v9 = sub_24162B788();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v2 + qword_268D040E8) = a1;
  v42[0] = 0;
  v42[1] = 0xE000000000000000;
  sub_241632E78();
  swift_bridgeObjectRelease();
  strcpy((char *)v42, "MutableArray<");
  HIWORD(v42[1]) = -4864;
  sub_24162B778();
  sub_24162B738();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v10 + 8);
  v37(v12, v9);
  sub_241631E08();
  uint64_t v13 = v8;
  swift_bridgeObjectRelease();
  sub_241631E08();
  uint64_t v14 = sub_24162D718();
  swift_retain();
  sub_2415E2B5C(a1, 0, (uint64_t)v8);
  if v41 == 2 && (v39)
  {
    sub_2411BF98C(0, (unint64_t *)&qword_268CFC790, (unint64_t *)&qword_268CFF090, MEMORY[0x263F437A0], MEMORY[0x263F8E0F8]);
    uint64_t v15 = swift_allocObject();
    uint64_t v41 = v8;
    uint64_t v16 = (void *)v15;
    *(_OWORD *)(v15 + 16) = xmmword_241637EE0;
    sub_24162B778();
    uint64_t v17 = sub_24162B738();
    uint64_t v19 = v18;
    uint64_t v20 = v37;
    v37(v12, v9);
    v16[7] = &type metadata for OnboardingStandardRow;
    v16[8] = sub_24123D588();
    uint64_t v21 = swift_allocObject();
    v16[4] = v21;
    *(void *)(v21 + 16) = v17;
    *(void *)(v21 + 24) = v19;
    *(void *)(v21 + 32) = v17;
    *(void *)(v21 + 40) = v19;
    *(unsigned char *)(v21 + 48) = 7;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_24162B778();
    sub_24162B738();
    v20(v12, v9);
    unint64_t v22 = v38;
    sub_24162D668();
    sub_2415E53B4(0, (unint64_t *)&qword_268D00EC0, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
    uint64_t v23 = *(void *)(v4 + 72);
    unint64_t v24 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_24163A4F0;
    unint64_t v26 = v25 + v24;
    uint64_t v27 = *(void (**)(unint64_t, char *, uint64_t))(v4 + 16);
    uint64_t v28 = v40;
    uint64_t v29 = v41;
    v27(v26, v41, v40);
    v27(v26 + v23, v22, v28);
    swift_retain();
    sub_24162D738();
    swift_bridgeObjectRelease();
    swift_release_n();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v4 + 8);
    v30(v22, v28);
    v30(v29, v28);
  }
  else
  {
    sub_2415E53B4(0, (unint64_t *)&qword_268D00EC0, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
    unint64_t v31 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_241637EE0;
    uint64_t v33 = v8;
    uint64_t v34 = v40;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 16))(v32 + v31, v33, v40);
    swift_retain();
    sub_24162D738();
    swift_bridgeObjectRelease();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v34);
  }
  return v14;
}

uint64_t sub_2415E2B5C@<X0>(int a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24162B788();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 < 2u)
  {
    sub_2411BF98C(0, (unint64_t *)&qword_268CFC790, (unint64_t *)&qword_268CFF090, MEMORY[0x263F437A0], MEMORY[0x263F8E0F8]);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_241637EE0;
    sub_24162B778();
    uint64_t v11 = sub_24162B738();
    uint64_t v13 = v12;
    uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
    v14(v9, v6);
    *(void *)(v10 + 56) = &type metadata for OnboardingSelectRow;
    *(void *)(v10 + 64) = sub_24123D604();
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v13;
    *(unsigned char *)(v10 + 48) = 0;
    *(unsigned char *)(v10 + 49) = a1;
    *(unsigned char *)(v10 + 50) = 0;
    uint64_t v15 = sub_2415E4ED4(a1);
    uint64_t v35 = v10;
    sub_2414970DC(v15);
LABEL_6:
    sub_24162B778();
    sub_24162B738();
    v14(v9, v6);
    return sub_24162D668();
  }
  if (a1 != 2)
  {
    sub_2411BF98C(0, (unint64_t *)&qword_268CFC790, (unint64_t *)&qword_268CFF090, MEMORY[0x263F437A0], MEMORY[0x263F8E0F8]);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_241637EE0;
    sub_24162B778();
    uint64_t v30 = sub_24162B738();
    uint64_t v32 = v31;
    uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
    v14(v9, v6);
    *(void *)(v29 + 56) = &type metadata for OnboardingSelectRow;
    *(void *)(v29 + 64) = sub_24123D604();
    *(void *)(v29 + 32) = v30;
    *(void *)(v29 + 40) = v32;
    *(_WORD *)(v29 + 48) = 768;
    *(unsigned char *)(v29 + 50) = 0;
    goto LABEL_6;
  }
  sub_2411BF98C(0, (unint64_t *)&qword_268CFC790, (unint64_t *)&qword_268CFF090, MEMORY[0x263F437A0], MEMORY[0x263F8E0F8]);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_24163A4F0;
  sub_24162B778();
  uint64_t v17 = sub_24162B738();
  uint64_t v19 = v18;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v9, v6);
  *(void *)(v16 + 56) = &type metadata for OnboardingSelectRow;
  *(void *)(v16 + 64) = sub_24123D604();
  *(void *)(v16 + 32) = v17;
  *(void *)(v16 + 40) = v19;
  *(unsigned char *)(v16 + 48) = a2 & 1;
  *(_WORD *)(v16 + 49) = 2;
  id v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ManualEntryItem()), sel_init);
  sub_24162B778();
  uint64_t v22 = sub_24162B738();
  uint64_t v24 = v23;
  v20(v9, v6);
  type metadata accessor for ManualEntryContraceptiveTypeDataSource();
  uint64_t v25 = swift_allocObject();
  uint64_t v34 = a3;
  unint64_t v26 = (void *)v25;
  *(void *)(v25 + 24) = 0;
  swift_unknownObjectWeakInit();
  v26[5] = 0;
  v26[6] = 0;
  v26[3] = &off_26F578AF8;
  v26[4] = 0;
  swift_unknownObjectWeakAssign();
  *(void *)(v16 + 96) = &type metadata for OnboardingTypeRow;
  *(void *)(v16 + 104) = sub_24123D7F4();
  uint64_t v27 = swift_allocObject();
  *(void *)(v16 + 72) = v27;
  *(unsigned char *)(v27 + 16) = 0;
  *(void *)(v27 + 24) = v22;
  *(void *)(v27 + 32) = v24;
  *(void *)(v27 + 40) = 8;
  *(void *)(v27 + 48) = v26;
  *(void *)(v27 + 56) = v21;
  *(void *)(v27 + 64) = 0;
  *(void *)(v27 + 72) = 0xE000000000000000;
  uint64_t v28 = sub_2415E4ED4(2);
  uint64_t v35 = v16;
  sub_2414970DC(v28);
  sub_24162B778();
  sub_24162B738();
  v20(v9, v6);
  return sub_24162D668();
}

uint64_t sub_2415E2F84@<X0>(char a1@<W0>, void *a2@<X8>)
{
  sub_24162D168();
  sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
  sub_2411BF880(0, &qword_268D01228);
  if (swift_dynamicCast())
  {
    sub_2411B6CD4(v11, (uint64_t)a2);
    uint64_t v4 = a2[3];
    uint64_t v5 = a2[4];
    sub_241192BB0((uint64_t)a2, v4);
    (*(void (**)(void, uint64_t, uint64_t))(v5 + 24))(a1 & 1, v4, v5);
    uint64_t v6 = a2[3];
    uint64_t v7 = a2[4];
    uint64_t v8 = sub_2411B6854(a2, v6);
    v13[3] = v6;
    v13[4] = *(void *)(*(void *)(v7 + 8) + 8);
    uint64_t v9 = sub_2411B6C70(v13);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(v9, v8, v6);
    sub_24162D7D8();
    return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v13);
  }
  else
  {
    uint64_t v12 = 0;
    memset(v11, 0, sizeof(v11));
    sub_2415E5568((uint64_t)v11, &qword_268D04100, &qword_268D01228, (uint64_t)&protocol descriptor for PickerDisplayRow);
    uint64_t result = sub_241633038();
    __break(1u);
  }
  return result;
}

void *sub_2415E3188@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v27 = sub_24162B788();
  uint64_t v4 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[3];
  uint64_t v7 = a1[4];
  sub_2411B6854(a1, v8);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
  if (v9(v8, v7) == 5)
  {
    sub_2411B6854(a1, a1[3]);
    uint64_t v10 = sub_24162C8A8();
    uint64_t v12 = v11;
    sub_24162B778();
    uint64_t v13 = sub_24162B738();
    uint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v27);
    a2[3] = (uint64_t)&type metadata for OnboardingTypePicker;
    a2[4] = sub_24123D778();
    uint64_t result = (void *)swift_allocObject();
    *a2 = (uint64_t)result;
    result[2] = v13;
    result[3] = v15;
    result[4] = v10;
    result[5] = v12;
  }
  else
  {
    unint64_t v26 = a2;
    sub_2411B6854(a1, a1[3]);
    uint64_t v17 = sub_24162C8A8();
    uint64_t v19 = v18;
    char v20 = v9(v8, v7);
    sub_24162B778();
    uint64_t v21 = sub_24162B738();
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v27);
    uint64_t v35 = 0;
    swift_unknownObjectWeakInit();
    uint64_t v31 = v21;
    uint64_t v32 = v23;
    uint64_t v29 = v21;
    uint64_t v30 = v23;
    uint64_t v33 = v17;
    uint64_t v34 = v19;
    v28[0] = v20;
    sub_2414BB7C4((uint64_t)v28, (uint64_t)v36);
    uint64_t v37 = &off_26F578B18;
    swift_unknownObjectWeakAssign();
    uint64_t v24 = v26;
    v26[3] = (uint64_t)&type metadata for OnboardingDatePickerRow;
    v24[4] = sub_24123D6FC();
    uint64_t v25 = swift_allocObject();
    *uint64_t v24 = v25;
    sub_2414BB7C4((uint64_t)v36, v25 + 16);
    return (void *)_s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  }
  return result;
}

void sub_2415E3428(unsigned __int8 *a1)
{
  int v2 = *a1;
  if (v2 == 3)
  {
    if (*(unsigned __int8 *)(v1 + qword_268D040E8) <= 2u)
    {
LABEL_9:
LABEL_13:
      JUMPOUT(0x245618F80);
    }
  }
  else if (v2 == 2 && *(unsigned __int8 *)(v1 + qword_268D040E8) <= 2u)
  {
    goto LABEL_9;
  }
  sub_241633038();
  __break(1u);
  goto LABEL_13;
}

void sub_2415E3564()
{
}

uint64_t sub_2415E3594()
{
  sub_24162D818();

  return swift_deallocClassInstance();
}

uint64_t sub_2415E35C4()
{
  return type metadata accessor for CycleFactorSectionDataSource();
}

uint64_t sub_2415E35CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t started = type metadata accessor for OnboardingStartDateRow(0);
  MEMORY[0x270FA5388](started);
  long long v64 = (char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24162BB18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v63 = (char *)v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v55 - v11;
  uint64_t v13 = 0;
  if (*((unsigned char *)v2 + qword_268D040E8) != 2)
  {
LABEL_31:
    uint64_t v38 = a1;
    sub_2415E3428((unsigned __int8 *)a1);
    sub_24162D168();
    sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
    sub_2411BF880(0, &qword_268CFBBB8);
    if (!swift_dynamicCast())
    {
      unint64_t v74 = 0;
      long long v72 = 0u;
      long long v73 = 0u;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
      return sub_2415E5568((uint64_t)&v72, &qword_268CFBBB0, &qword_268CFBBB8, (uint64_t)&protocol descriptor for DateRow);
    }
    uint64_t v70 = v13;
    int v39 = v12;
    sub_2411B6CD4(&v72, (uint64_t)&v75);
    uint64_t v40 = v76;
    uint64_t v41 = v77;
    sub_241192BB0((uint64_t)&v75, v76);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(a2, v40, v41);
    sub_2411A3DF4((uint64_t)&v75, (uint64_t)v71);
    uint64_t v42 = (uint64_t)v64;
    if (swift_dynamicCast())
    {
      sub_24126F0A4(v42, type metadata accessor for OnboardingStartDateRow);
      sub_2415E3D5C(a2, v70);
    }
    uint64_t v43 = v39;
    uint64_t result = sub_24162BAC8();
    uint64_t v44 = result + 1;
    if (!__OFADD__(result, 1))
    {
      uint64_t v45 = sub_24162BB08();
      unint64_t v46 = v63;
      MEMORY[0x245618F80](v44, v45);
      sub_2414BB6C4(v38, (uint64_t)v71);
      sub_2411B6854(&v75, v76);
      uint64_t v47 = sub_24162C8A8();
      uint64_t v49 = v48;
      swift_bridgeObjectRelease();
      v71[5] = v47;
      v71[6] = v49;
      uint64_t v50 = v76;
      uint64_t v51 = v77;
      uint64_t v52 = sub_2411B6854(&v75, v76);
      *((void *)&v73 + 1) = v50;
      unint64_t v74 = *(void *)(*(void *)(*(void *)(v51 + 8) + 8) + 8);
      uint64_t v53 = sub_2411B6C70((uint64_t *)&v72);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v50 - 8) + 16))(v53, v52, v50);
      sub_24162D7D8();
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v72);
      *((void *)&v73 + 1) = &type metadata for OnboardingDatePickerRow;
      unint64_t v74 = sub_24123D6FC();
      *(void *)&long long v72 = swift_allocObject();
      sub_2414BB6C4((uint64_t)v71, v72 + 16);
      sub_24162D7D8();
      sub_24126EF94((uint64_t)v71);
      uint64_t v54 = *(void (**)(char *, uint64_t))(v8 + 8);
      v54(v46, v7);
      v54(v43, v7);
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v72);
      return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v75);
    }
    goto LABEL_42;
  }
  uint64_t v59 = (char *)v55 - v11;
  uint64_t v60 = v8;
  uint64_t v61 = v7;
  uint64_t v15 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v58 = a1;
  uint64_t v62 = v2;
  uint64_t v16 = sub_24162D728();
  uint64_t v66 = *(void *)(v16 + 16);
  if (v66)
  {
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)(sub_24162D678() - 8);
    unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    uint64_t v57 = v16;
    unint64_t v69 = v16 + v19;
    uint64_t v68 = *(void *)(v18 + 72);
    uint64_t v56 = a2;
    v55[1] = v5;
    while (1)
    {
      uint64_t v70 = v17;
      uint64_t v20 = sub_24162D658();
      int64_t v21 = *(void *)(v20 + 16);
      if (v21)
      {
        v71[0] = MEMORY[0x263F8EE78];
        sub_24149DD78(0, v21, 0);
        uint64_t v22 = (void *)v71[0];
        uint64_t v67 = v20;
        uint64_t v23 = (void *)(v20 + 32);
        do
        {
          sub_2411B6854(v23, v23[3]);
          uint64_t v24 = sub_24162C8A8();
          uint64_t v26 = v25;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v71[0] = v22;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_24149DD78(0, v22[2] + 1, 1);
            uint64_t v22 = (void *)v71[0];
          }
          unint64_t v29 = v22[2];
          unint64_t v28 = v22[3];
          if (v29 >= v28 >> 1)
          {
            sub_24149DD78(v28 > 1, v29 + 1, 1);
            uint64_t v22 = (void *)v71[0];
          }
          v22[2] = v29 + 1;
          uint64_t v30 = &v22[2 * v29];
          v30[4] = v24;
          v30[5] = v26;
          v23 += 5;
          --v21;
        }
        while (v21);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v22 = (void *)MEMORY[0x263F8EE78];
      }
      uint64_t v31 = v22[2];
      uint64_t v13 = v70;
      if (v31)
      {
        BOOL v32 = v22[4] == v15 && v22[5] == v14;
        if (v32 || (uint64_t result = sub_241633218(), (result & 1) != 0))
        {
LABEL_30:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v7 = v61;
          uint64_t v8 = v60;
          uint64_t v12 = v59;
          a1 = v58;
          a2 = v56;
          goto LABEL_31;
        }
        if (v31 != 1) {
          break;
        }
      }
LABEL_4:
      swift_bridgeObjectRelease();
      uint64_t v17 = v13 + 1;
      if (v17 == v66) {
        goto LABEL_37;
      }
    }
    uint64_t v34 = v22 + 7;
    uint64_t v35 = 1;
    while (1)
    {
      uint64_t v36 = v35 + 1;
      if (__OFADD__(v35, 1)) {
        break;
      }
      if (*(v34 - 1) == v15 && *v34 == v14) {
        goto LABEL_30;
      }
      uint64_t result = sub_241633218();
      if (result) {
        goto LABEL_30;
      }
      v34 += 2;
      ++v35;
      if (v36 == v31) {
        goto LABEL_4;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
    return result;
  }
LABEL_37:

  return swift_bridgeObjectRelease();
}

uint64_t sub_2415E3D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = a1;
  sub_2415E53B4(0, &qword_268CFBBA8, type metadata accessor for OnboardingEndDateRow, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - v4;
  uint64_t v6 = type metadata accessor for OnboardingEndDateRow(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24162BB18();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24162D0D8();
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t result = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x245618F80](result, a2);
    sub_24162D168();
    sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
    int v17 = swift_dynamicCast();
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v17)
    {
      uint64_t v26 = v10;
      v18(v5, 0, 1, v6);
      sub_24126EFE8((uint64_t)v5, (uint64_t)v9);
      unint64_t v19 = &v9[*(int *)(v6 + 32)];
      uint64_t v20 = sub_24162B718();
      int64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24);
      uint64_t v22 = v27;
      v21(v19, v27, v20);
      uint64_t v23 = &v9[*(int *)(v6 + 28)];
      if (sub_24162B678()) {
        v21(v23, v22, v20);
      }
      v28[3] = v6;
      v28[4] = sub_2415E5468((unint64_t *)&unk_268D02F20, (void (*)(uint64_t))type metadata accessor for OnboardingEndDateRow);
      uint64_t v24 = sub_2411B6C70(v28);
      sub_2415E54B0((uint64_t)v9, (uint64_t)v24);
      sub_24162D7D8();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v28);
      return sub_24126F0A4((uint64_t)v9, type metadata accessor for OnboardingEndDateRow);
    }
    else
    {
      v18(v5, 1, 1, v6);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return sub_2415E55D8((uint64_t)v5, &qword_268CFBBA8, type metadata accessor for OnboardingEndDateRow);
    }
  }
  return result;
}

uint64_t sub_2415E4148(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24162B718();
  uint64_t v61 = *(void *)(v4 - 8);
  uint64_t v62 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v59 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = type metadata accessor for OnboardingEndDateRow(0);
  MEMORY[0x270FA5388](v63);
  uint64_t v7 = (char *)v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24162BB18();
  uint64_t v57 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v56 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  long long v64 = (char *)v50 - v11;
  uint64_t v60 = a1;
  uint64_t v12 = sub_24123AAAC();
  uint64_t v14 = v13;
  uint64_t v15 = 0;
  uint64_t v58 = *(unsigned __int8 *)(v2 + qword_268D040E8);
  if (v58 != 2) {
    goto LABEL_31;
  }
  uint64_t v16 = v12;
  uint64_t v17 = sub_24162D728();
  uint64_t v52 = *(void *)(v17 + 16);
  if (!v52)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v50[0] = v7;
  v50[1] = v2;
  uint64_t v18 = sub_24162D678();
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)(v18 - 8);
  uint64_t v21 = *(unsigned __int8 *)(v20 + 80);
  v50[2] = v17;
  uint64_t v55 = v17 + ((v21 + 32) & ~v21);
  uint64_t v54 = *(void *)(v20 + 72);
  uint64_t v51 = v8;
  while (1)
  {
    uint64_t v65 = v19;
    uint64_t v22 = sub_24162D658();
    int64_t v23 = *(void *)(v22 + 16);
    if (v23)
    {
      v66[0] = MEMORY[0x263F8EE78];
      sub_24149DD78(0, v23, 0);
      uint64_t v24 = (void *)v66[0];
      uint64_t v53 = v22;
      uint64_t v25 = (void *)(v22 + 32);
      do
      {
        sub_2411B6854(v25, v25[3]);
        uint64_t v26 = sub_24162C8A8();
        uint64_t v28 = v27;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v66[0] = (uint64_t)v24;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_24149DD78(0, v24[2] + 1, 1);
          uint64_t v24 = (void *)v66[0];
        }
        unint64_t v31 = v24[2];
        unint64_t v30 = v24[3];
        if (v31 >= v30 >> 1)
        {
          sub_24149DD78(v30 > 1, v31 + 1, 1);
          uint64_t v24 = (void *)v66[0];
        }
        v24[2] = v31 + 1;
        BOOL v32 = &v24[2 * v31];
        v32[4] = v26;
        v32[5] = v28;
        v25 += 5;
        --v23;
      }
      while (v23);
      swift_bridgeObjectRelease();
      uint64_t v8 = v51;
      uint64_t v33 = v24[2];
      if (!v33) {
        goto LABEL_4;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = (void *)MEMORY[0x263F8EE78];
      uint64_t v33 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (!v33) {
        goto LABEL_4;
      }
    }
    BOOL v34 = v24[4] == v16 && v24[5] == v14;
    if (v34 || (sub_241633218() & 1) != 0) {
      goto LABEL_30;
    }
    if (v33 != 1) {
      break;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    uint64_t v19 = v65 + 1;
    if (v65 + 1 == v52) {
      goto LABEL_35;
    }
  }
  uint64_t v35 = v24 + 7;
  uint64_t v36 = 1;
  while (1)
  {
    uint64_t v37 = v36 + 1;
    if (__OFADD__(v36, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      sub_241633038();
      __break(1u);
      JUMPOUT(0x2415E4798);
    }
    BOOL v38 = *(v35 - 1) == v16 && *v35 == v14;
    if (v38 || (sub_241633218() & 1) != 0) {
      break;
    }
    v35 += 2;
    ++v36;
    if (v37 == v33) {
      goto LABEL_4;
    }
  }
LABEL_30:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (char *)v50[0];
  uint64_t v15 = v65;
LABEL_31:
  swift_bridgeObjectRelease();
  uint64_t v39 = 3;
  uint64_t v41 = v63;
  uint64_t v40 = v64;
  switch(v58)
  {
    case 2:
      goto LABEL_33;
    case 3:
      goto LABEL_41;
    default:
      uint64_t v39 = 2;
LABEL_33:
      MEMORY[0x245618F80](v39, v15);
      sub_2415E54B0(v60, (uint64_t)v7);
      uint64_t v42 = v59;
      sub_24162B5E8();
      (*(void (**)(char *, char *, uint64_t))(v61 + 40))(&v7[*(int *)(v41 + 28)], v42, v62);
      v7[16] = 0;
      uint64_t v43 = sub_24162BAC8();
      uint64_t v44 = v43 + 1;
      if (__OFADD__(v43, 1)) {
        goto LABEL_40;
      }
      uint64_t v45 = sub_24162BB08();
      unint64_t v46 = v56;
      MEMORY[0x245618F80](v44, v45);
      v66[3] = v41;
      v66[4] = sub_2415E5468((unint64_t *)&unk_268D02F20, (void (*)(uint64_t))type metadata accessor for OnboardingEndDateRow);
      uint64_t v47 = sub_2411B6C70(v66);
      sub_2415E54B0((uint64_t)v7, (uint64_t)v47);
      sub_24162D7D8();
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v66);
      sub_24162D6D8();
      uint64_t v48 = *(void (**)(char *, uint64_t))(v57 + 8);
      v48(v46, v8);
      sub_24126F0A4((uint64_t)v7, type metadata accessor for OnboardingEndDateRow);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v48)(v40, v8);
      break;
  }
  return result;
}

void sub_2415E47A8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = sub_24162BB18();
  MEMORY[0x270FA5388](v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12 && *((unsigned char *)v2 + qword_268D040E8) == 2)
  {
    v61[2] = v5;
    v61[0] = a2;
    uint64_t v62 = v11;
    uint64_t v65 = (char *)v61 - v9;
    uint64_t v63 = v10;
    uint64_t v64 = v8;
    uint64_t v13 = *(void *)(a1 + 32);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    v61[3] = v2;
    uint64_t v14 = sub_24162D728();
    uint64_t v66 = *(void *)(v14 + 16);
    if (v66)
    {
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)(sub_24162D678() - 8);
      unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
      v61[1] = v14;
      unint64_t v70 = v14 + v17;
      uint64_t v69 = *(void *)(v16 + 72);
      do
      {
        uint64_t v18 = sub_24162D658();
        int64_t v19 = *(void *)(v18 + 16);
        if (v19)
        {
          uint64_t v68 = v15;
          *(void *)&long long v75 = MEMORY[0x263F8EE78];
          sub_24149DD78(0, v19, 0);
          uint64_t v20 = (void *)v75;
          uint64_t v67 = v18;
          uint64_t v21 = (void *)(v18 + 32);
          do
          {
            sub_2411B6854(v21, v21[3]);
            uint64_t v22 = sub_24162C8A8();
            uint64_t v24 = v23;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long v75 = v20;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_24149DD78(0, v20[2] + 1, 1);
              uint64_t v20 = (void *)v75;
            }
            unint64_t v27 = v20[2];
            unint64_t v26 = v20[3];
            if (v27 >= v26 >> 1)
            {
              sub_24149DD78(v26 > 1, v27 + 1, 1);
              uint64_t v20 = (void *)v75;
            }
            v20[2] = v27 + 1;
            uint64_t v28 = &v20[2 * v27];
            v28[4] = v22;
            uint64_t v28[5] = v24;
            v21 += 5;
            --v19;
          }
          while (v19);
          swift_bridgeObjectRelease();
          uint64_t v15 = v68;
          uint64_t v29 = v20[2];
          if (!v29) {
            goto LABEL_5;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v20 = (void *)MEMORY[0x263F8EE78];
          uint64_t v29 = *(void *)(MEMORY[0x263F8EE78] + 16);
          if (!v29) {
            goto LABEL_5;
          }
        }
        BOOL v30 = v20[4] == v13 && v12 == v20[5];
        if (v30 || (sub_241633218() & 1) != 0)
        {
LABEL_31:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v35 = v65;
          MEMORY[0x245618F80](1, v15);
          uint64_t v36 = sub_24162BAC8();
          uint64_t v37 = v36 + 1;
          if (!__OFADD__(v36, 1))
          {
            uint64_t v38 = sub_24162BB08();
            uint64_t v39 = v62;
            MEMORY[0x245618F80](v37, v38);
            sub_24162D168();
            sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
            if (swift_dynamicCast())
            {
              uint64_t v40 = *((void *)&v75 + 1);
              uint64_t v41 = v76;
              long long v42 = v77;
              long long v43 = v78;
              char v74 = v75;
              sub_24162D168();
              if (swift_dynamicCast())
              {
                uint64_t v69 = v71[1];
                unint64_t v70 = v71[0];
                LOBYTE(v75) = v74;
                *((void *)&v75 + 1) = v40;
                *(void *)&long long v76 = v41;
                *((void *)&v76 + 1) = v61[0];
                long long v77 = v42;
                long long v78 = v43;
                _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
                swift_retain();
                id v44 = *((id *)&v42 + 1);
                _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
                unint64_t v45 = sub_24123B274();
                uint64_t v68 = v46;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();

                swift_release();
                swift_bridgeObjectRelease();
                long long v72 = &type metadata for OnboardingTypeRow;
                unint64_t v73 = sub_24123D7F4();
                uint64_t v47 = (_OWORD *)swift_allocObject();
                v71[0] = v47;
                long long v48 = v76;
                v47[1] = v75;
                v47[2] = v48;
                long long v49 = v78;
                v47[3] = v77;
                v47[4] = v49;
                _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
                swift_retain();
                id v50 = v44;
                _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
                uint64_t v51 = v65;
                sub_24162D7D8();
                _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v71);
                long long v72 = &type metadata for OnboardingTypePicker;
                unint64_t v73 = sub_24123D778();
                uint64_t v52 = (void *)swift_allocObject();
                v71[0] = v52;
                uint64_t v53 = v69;
                v52[2] = v70;
                v52[3] = v53;
                uint64_t v54 = v68;
                v52[4] = v45;
                v52[5] = v54;
                sub_24162D7D8();
                swift_bridgeObjectRelease();

                swift_release();
                swift_bridgeObjectRelease();
                uint64_t v55 = *(void (**)(char *, uint64_t))(v63 + 8);
                uint64_t v56 = v64;
                v55(v39, v64);
                v55(v51, v56);
                _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v71);
              }
              else
              {
                swift_bridgeObjectRelease();

                swift_release();
                swift_bridgeObjectRelease();
                uint64_t v59 = *(void (**)(char *, uint64_t))(v63 + 8);
                uint64_t v60 = v64;
                v59(v39, v64);
                v59(v65, v60);
              }
            }
            else
            {
              uint64_t v57 = *(void (**)(char *, uint64_t))(v63 + 8);
              uint64_t v58 = v64;
              v57(v39, v64);
              v57(v35, v58);
            }
            return;
          }
LABEL_43:
          __break(1u);
          return;
        }
        if (v29 != 1)
        {
          unint64_t v31 = v20 + 7;
          uint64_t v32 = 1;
          while (1)
          {
            uint64_t v33 = v32 + 1;
            if (__OFADD__(v32, 1)) {
              break;
            }
            BOOL v34 = *(v31 - 1) == v13 && v12 == *v31;
            if (v34 || (sub_241633218() & 1) != 0) {
              goto LABEL_31;
            }
            v31 += 2;
            ++v32;
            if (v33 == v29) {
              goto LABEL_5;
            }
          }
          __break(1u);
          goto LABEL_43;
        }
LABEL_5:
        swift_bridgeObjectRelease();
        ++v15;
      }
      while (v15 != v66);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2415E4ED4(int a1)
{
  int v32 = a1;
  uint64_t v34 = sub_24162B788();
  uint64_t v1 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_24162B718();
  uint64_t v4 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v30 - v8;
  uint64_t v10 = type metadata accessor for OnboardingEndDateRow(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v30 - v14;
  sub_24162B5E8();
  sub_24162B708();
  sub_24162B778();
  uint64_t v16 = sub_24162B738();
  uint64_t v18 = v17;
  int64_t v19 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v30 = v1 + 8;
  unint64_t v31 = v19;
  v19(v3, v34);
  *((void *)v12 + 1) = 0;
  swift_unknownObjectWeakInit();
  *((void *)v12 + 3) = v16;
  *((void *)v12 + 4) = v18;
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  uint64_t v21 = v33;
  v20(&v12[*(int *)(v10 + 28)], v9, v33);
  v12[16] = 0;
  v20(&v12[*(int *)(v10 + 32)], v6, v21);
  sub_24126EFE8((uint64_t)v12, (uint64_t)v15);
  *((void *)v15 + 1) = &off_26F578B08;
  swift_unknownObjectWeakAssign();
  sub_2411BF98C(0, (unint64_t *)&qword_268CFC790, (unint64_t *)&qword_268CFF090, MEMORY[0x263F437A0], MEMORY[0x263F8E0F8]);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_24163A4F0;
  sub_24162B778();
  uint64_t v23 = sub_24162B738();
  uint64_t v25 = v24;
  v31(v3, v34);
  sub_24162B708();
  uint64_t started = type metadata accessor for OnboardingStartDateRow(0);
  *(void *)(v22 + 56) = started;
  *(void *)(v22 + 64) = sub_2415E5468((unint64_t *)&qword_268CFB5A8, (void (*)(uint64_t))type metadata accessor for OnboardingStartDateRow);
  unint64_t v27 = sub_2411B6C70((uint64_t *)(v22 + 32));
  v27[1] = v23;
  v27[2] = v25;
  v20((char *)v27 + *(int *)(started + 28), v9, v33);
  *(unsigned char *)unint64_t v27 = 0;
  *((unsigned char *)v27 + *(int *)(started + 32)) = 1;
  *((unsigned char *)v27 + 1) = v32;
  *(void *)(v22 + 96) = v10;
  *(void *)(v22 + 104) = sub_2415E5468((unint64_t *)&unk_268D02F20, (void (*)(uint64_t))type metadata accessor for OnboardingEndDateRow);
  uint64_t v28 = sub_2411B6C70((uint64_t *)(v22 + 72));
  sub_24126EFE8((uint64_t)v15, (uint64_t)v28);
  return v22;
}

uint64_t sub_2415E52C8()
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2415E5318()
{
  return sub_2415E551C(48);
}

uint64_t sub_2415E5320(uint64_t a1, uint64_t a2)
{
  sub_2415E53B4(0, &qword_268D01248, (uint64_t (*)(uint64_t))sub_2414BB26C, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2415E53B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2415E5418()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_2415E5468(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2415E54B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OnboardingEndDateRow(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2415E5514()
{
  return sub_2415E551C(49);
}

uint64_t sub_2415E551C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2415E5568(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_2411BF98C(0, a2, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_2415E55D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2415E53B4(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

id sub_2415E5648(_OWORD *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_scaleFactor] = 0x3FC999999999999ALL;
  *(void *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_scaleAlphaFactor] = 0x3FB999999999999ALL;
  *(void *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_xScaleFactor] = 0x3FF0000000000000;
  uint64_t v4 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_configuration];
  long long v5 = a1[1];
  *(_OWORD *)uint64_t v4 = *a1;
  *((_OWORD *)v4 + 1) = v5;
  *(_OWORD *)(v4 + 89) = *(_OWORD *)((char *)a1 + 89);
  long long v6 = a1[5];
  *((_OWORD *)v4 + 4) = a1[4];
  *((_OWORD *)v4 + 5) = v6;
  long long v7 = a1[3];
  *((_OWORD *)v4 + 2) = a1[2];
  *((_OWORD *)v4 + 3) = v7;
  sub_2411F6F48((uint64_t)a1);
  v11.receiver = v1;
  v11.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend(v8, sel_setScrollDirection_, 1);
  id v9 = v8;
  objc_msgSend(v9, sel_setMinimumLineSpacing_, 0.0);
  sub_2411F6F74((uint64_t)a1);

  return v9;
}

id sub_2415E5828()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_prepareLayout);
  uint64_t v1 = (double *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_configuration];
  objc_msgSend(v0, sel_setItemSize_, *(double *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_configuration+ 24], *(double *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_configuration+ 16]);
  *(double *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_xScaleFactor] = 0.1 - v1[5] / v1[3];
  return objc_msgSend(v0, sel_setSectionInset_, *v1, 0.0, v1[1], 0.0);
}

uint64_t sub_2415E5918(double a1, double a2, double a3, double a4)
{
  long long v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_24162EFA8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  uint64_t v15 = v5;
  uint64_t v16 = sub_24162EF98();
  os_log_type_t v17 = sub_2416322B8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v52 = ObjectType;
    uint64_t v19 = v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v57 = v20;
    *(_DWORD *)uint64_t v19 = 136446466;
    uint64_t v53 = swift_getObjectType();
    sub_2415E60F0();
    uint64_t v21 = sub_241631D48();
    uint64_t v53 = sub_2411B6898(v21, v22, &v57);
    sub_241632C28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    uint64_t v53 = *(void *)&a1;
    double v54 = a2;
    double v55 = a3;
    double v56 = a4;
    type metadata accessor for CGRect(0);
    uint64_t v51 = v11;
    uint64_t v23 = sub_241631D48();
    uint64_t v53 = sub_2411B6898(v23, v24, &v57);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v16, v17, "[%{public}s] Layout attributes for elements  %{public}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245621640](v20, -1, -1);
    uint64_t v25 = v19;
    ObjectType = v52;
    MEMORY[0x245621640](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v51);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  id v26 = objc_msgSend(v15, sel_collectionView);
  if (!v26) {
    return 0;
  }
  unint64_t v27 = v26;
  v58.receiver = v15;
  v58.super_class = ObjectType;
  id v28 = objc_msgSendSuper2(&v58, sel_layoutAttributesForElementsInRect_, a1, a2, a3, a4);
  if (!v28
    || (uint64_t v29 = v28,
        sub_2415E60B0(),
        unint64_t v30 = sub_241631F28(),
        v29,
        unint64_t v31 = sub_241490168(v30),
        swift_bridgeObjectRelease(),
        !v31))
  {
    swift_bridgeObjectRelease();
    unint64_t v31 = MEMORY[0x263F8EE78];
  }
  objc_msgSend(v15, sel_itemSize);
  double v33 = v32;
  uint64_t v52 = (objc_class *)(v31 >> 62);
  if (!(v31 >> 62))
  {
    uint64_t v34 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    if (v34) {
      goto LABEL_10;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    if (v52)
    {
      sub_2415E60B0();
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      uint64_t v49 = sub_241633058();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      sub_241633228();
      sub_2415E60B0();

      swift_bridgeObjectRelease();
      return v31;
    }
    return v49;
  }
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t result = sub_241633068();
  uint64_t v34 = result;
  if (!result) {
    goto LABEL_22;
  }
LABEL_10:
  if (v34 >= 1)
  {
    uint64_t v36 = 0;
    uint64_t v37 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_xScaleFactor;
    do
    {
      if ((v31 & 0xC000000000000001) != 0) {
        uint64_t v38 = (char *)MEMORY[0x245620370](v36, v31);
      }
      else {
        uint64_t v38 = (char *)*(id *)(v31 + 8 * v36 + 32);
      }
      uint64_t v39 = v38;
      ++v36;
      objc_msgSend(v27, sel_bounds);
      double MidX = CGRectGetMidX(v59);
      objc_msgSend(v39, sel_center);
      double v42 = MidX - v41;
      objc_msgSend(v27, sel_bounds);
      double v43 = CGRectGetMidX(v60);
      objc_msgSend(v39, sel_center);
      double v45 = fmax(v33 - vabdd_f64(v43, v44), 1.0) / v33;
      id v46 = objc_msgSend(v27, sel_effectiveUserInterfaceLayoutDirection);
      BOOL v47 = v42 > 0.0;
      if (v46 == (id)1) {
        BOOL v47 = v42 < 0.0;
      }
      double v48 = 1.0 - v45;
      if (!v47) {
        double v48 = v45 + -1.0;
      }
      *(double *)&v39[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_xTranslationFactor] = v48 * *(double *)&v15[v37];
      *(double *)&v39[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_zoomLevel] = v45 * 0.2 + 0.8;
      *(double *)&v39[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_alphaValue] = (v45 * 0.1 + 0.8 + -0.8) / 0.1;
    }
    while (v34 != v36);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LoggingCardCarouselCollectionViewFlowLayout()
{
  return self;
}

unint64_t sub_2415E60B0()
{
  unint64_t result = qword_268D01100;
  if (!qword_268D01100)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D01100);
  }
  return result;
}

unint64_t sub_2415E60F0()
{
  unint64_t result = qword_268D04128;
  if (!qword_268D04128)
  {
    type metadata accessor for LoggingCardCarouselCollectionViewFlowLayout();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268D04128);
  }
  return result;
}

uint64_t sub_2415E62AC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_systemBackgroundColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v3);

  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel];
  sub_2411B9D00(0, &qword_26B012140);
  long long v5 = (void *)sub_241632898();
  objc_msgSend(v4, sel_setFont_, v5);

  id v6 = objc_msgSend(v2, sel_secondaryLabelColor);
  objc_msgSend(v4, sel_setTextColor_, v6);

  objc_msgSend(v4, sel_setNumberOfLines_, 0);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v4);
  sub_2411BFC90();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24163B1D0;
  id v8 = objc_msgSend(v4, sel_topAnchor);
  id v9 = objc_msgSend(v1, sel_topAnchor);
  if (qword_268CF9A20 != -1) {
    swift_once();
  }
  id v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_constant_, v9, *(double *)&qword_268D04130);

  *(void *)(v7 + 32) = v10;
  id v11 = objc_msgSend(v4, sel_leadingAnchor);
  id v12 = objc_msgSend(v1, sel_leadingAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  *(void *)(v7 + 40) = v13;
  id v14 = objc_msgSend(v1, sel_bottomAnchor);
  id v15 = objc_msgSend(v4, sel_bottomAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, *(double *)&qword_268D04130);

  *(void *)(v7 + 48) = v16;
  id v17 = objc_msgSend(v1, sel_trailingAnchor);
  id v18 = objc_msgSend(v4, sel_trailingAnchor);
  id v19 = objc_msgSend(v17, sel_constraintGreaterThanOrEqualToAnchor_, v18);

  *(void *)(v7 + 56) = v19;
  sub_241631F48();
  uint64_t v20 = self;
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  uint64_t v21 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_activateConstraints_, v21);

  sub_2411E58B4();
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_241637EE0;
  uint64_t v23 = sub_24162F5B8();
  uint64_t v24 = MEMORY[0x263F82018];
  *(void *)(v22 + 32) = v23;
  *(void *)(v22 + 40) = v24;
  sub_241632918();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_2415E66E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CycleHistoryFilterSectionHeaderReusableView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CycleHistoryFilterSectionHeaderReusableView()
{
  return self;
}

void sub_2415E6788()
{
  qword_268D04130 = 0x4024000000000000;
}

void sub_2415E6798(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel);
  sub_2411B9D00(0, &qword_26B012140);
  id v2 = (id)sub_241632898();
  objc_msgSend(v1, sel_setFont_, v2);
}

void (*sub_2415E6840(uint64_t *a1))(id *a1, char a2)
{
  a1[1] = v1;
  id v3 = sub_2415E6A70();
  uint64_t v4 = sub_24162E628();

  *a1 = v4;
  return sub_2415E68A0;
}

void sub_2415E68A0(id *a1, char a2)
{
  if (a2)
  {
    id v2 = *a1;
    id v3 = sub_2415E6A70();
    sub_24162E638();
  }
  else
  {
    id v3 = sub_2415E6A70();
    sub_24162E638();
  }
}

void sub_2415E6928()
{
  uint64_t v1 = v0;
  id v2 = sub_2415E6A70();
  id v3 = (void *)sub_24162E648();

  if (!v3)
  {
    uint64_t v4 = (uint64_t)v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item;
    swift_beginAccess();
    sub_2411FA270(v4, (uint64_t)v7);
    if (v8)
    {
      sub_2411E1530();
      type metadata accessor for MenstrualCyclesOnboardingItem();
      if (swift_dynamicCast())
      {
        sub_24162CFB8();
        sub_24162CF78();
        long long v5 = (void *)sub_241631CC8();
        swift_bridgeObjectRelease();
        objc_msgSend(v1, sel_setAccessibilityIdentifier_, v5);

        id v6 = sub_2415E6A70();
        sub_24125BC18();
        sub_24162E658();
        swift_release();
      }
    }
    else
    {
      sub_241299DB8((uint64_t)v7);
    }
  }
}

id sub_2415E6A70()
{
  uint64_t v1 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)sub_24162E668()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    long long v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2415E6AF4(double a1, double a2, double a3, double a4)
{
  long long v5 = v4;
  swift_getObjectType();
  uint64_t v10 = sub_24162EFA8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = &v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item];
  *(_OWORD *)id v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((void *)v14 + 4) = 0;
  *(void *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView] = 0;
  id v15 = (objc_class *)type metadata accessor for MenstrualCyclesOnboardingItemCell();
  v34.receiver = v5;
  v34.super_class = v15;
  id v16 = objc_msgSendSuper2(&v34, sel_initWithFrame_, a1, a2, a3, a4);
  sub_24162EF48();
  id v17 = sub_24162EF98();
  os_log_type_t v18 = sub_2416322E8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v31 = v10;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v33 = v21;
    *(_DWORD *)uint64_t v20 = 136446210;
    uint64_t v22 = sub_2416333E8();
    uint64_t v32 = sub_2411B6898(v22, v23, &v33);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v17, v18, "[%{public}s] Initializing", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v21, -1, -1);
    MEMORY[0x245621640](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v31);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  id v24 = objc_msgSend(self, sel_secondarySystemGroupedBackgroundColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v24);

  id v25 = objc_msgSend(v16, sel_contentView);
  id v26 = sub_2415E6A70();
  objc_msgSend(v25, sel_addSubview_, v26);

  id v27 = sub_2415E6A70();
  id v28 = objc_msgSend(v16, sel_contentView);
  MEMORY[0x24561FDC0]();

  return v16;
}

void sub_2415E6EAC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (objc_class *)type metadata accessor for MenstrualCyclesOnboardingItemCell();
  v30.receiver = v1;
  v30.super_class = v6;
  objc_msgSendSuper2(&v30, sel_awakeFromNib);
  sub_24162EF48();
  id v7 = v1;
  uint64_t v8 = sub_24162EF98();
  os_log_type_t v9 = sub_2416322E8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v26 = v2;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v29 = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v12 = sub_2416333E8();
    uint64_t v27 = sub_2411B6898(v12, v13, &v29);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    id v14 = objc_msgSend(v7, sel_reuseIdentifier);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v18 = 0;
    }
    uint64_t v27 = v16;
    uint64_t v28 = v18;
    sub_24134E628();
    uint64_t v19 = sub_241631D48();
    uint64_t v27 = sub_2411B6898(v19, v20, &v29);
    sub_241632C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v8, v9, "[%{public}s] %{public}s: loading from nib", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245621640](v11, -1, -1);
    MEMORY[0x245621640](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  id v21 = objc_msgSend(self, sel_secondarySystemGroupedBackgroundColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v21);

  id v22 = objc_msgSend(v7, sel_contentView);
  id v23 = sub_2415E6A70();
  objc_msgSend(v22, sel_addSubview_, v23);

  id v24 = sub_2415E6A70();
  id v25 = objc_msgSend(v7, sel_contentView);
  MEMORY[0x24561FDC0]();
}

id sub_2415E725C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MenstrualCyclesOnboardingItemCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MenstrualCyclesOnboardingItemCell()
{
  return self;
}

uint64_t sub_2415E7300@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item;
  swift_beginAccess();
  return sub_2411FA270(v3, a1);
}

uint64_t sub_2415E7354(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item;
  swift_beginAccess();
  sub_2411FA3DC(a1, v3);
  swift_endAccess();
  sub_2415E6928();
  return sub_241299DB8(a1);
}

void (*sub_2415E73C4(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2415E7424;
}

void sub_2415E7424(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_2415E6928();
  }
}

uint64_t sub_2415E7458()
{
  id v0 = sub_2415E6A70();
  uint64_t v1 = sub_24162E628();

  return v1;
}

void sub_2415E748C()
{
  id v0 = sub_2415E6A70();
  sub_24162E638();
}

void (*sub_2415E74E0(uint64_t **a1))(void *a1)
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2415E6840(v2);
  return sub_241299D70;
}

uint64_t sub_2415E769C()
{
  uint64_t v1 = v0;
  v39[0] = swift_getObjectType();
  uint64_t v2 = sub_24162D2C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = self;
  id v7 = objc_msgSend(v6, sel_clearColor, v39[0]);
  objc_msgSend(v1, sel_setBackgroundColor_, v7);

  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView_headerLabel;
  id v9 = *(id *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView_headerLabel];
  id v10 = objc_msgSend(v6, sel_labelColor);
  objc_msgSend(v9, sel_setTextColor_, v10);

  objc_msgSend(*(id *)&v1[v8], sel_setNumberOfLines_, 0);
  id v11 = *(id *)&v1[v8];
  id v12 = objc_msgSend(v6, sel_clearColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  unint64_t v13 = *(void **)&v1[v8];
  sub_2411B9D00(0, &qword_26B012140);
  id v14 = v13;
  id v15 = (void *)sub_241632898();
  objc_msgSend(v14, sel_setFont_, v15);

  objc_msgSend(*(id *)&v1[v8], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_24162D2B8();
  sub_24162D1C8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v5, v2);
  objc_msgSend(v1, sel_directionalLayoutMargins);
  objc_msgSend(v1, sel_setDirectionalLayoutMargins_);
  sub_24162D2B8();
  sub_24162D1C8();
  v16(v5, v2);
  objc_msgSend(v1, sel_directionalLayoutMargins);
  objc_msgSend(v1, sel_setDirectionalLayoutMargins_);
  objc_msgSend(v1, sel_addSubview_, *(void *)&v1[v8]);
  sub_2411BFC90();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_24163B1D0;
  id v18 = objc_msgSend(*(id *)&v1[v8], sel_leadingAnchor);
  id v19 = objc_msgSend(v1, sel_leadingAnchor);
  id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  *(void *)(v17 + 32) = v20;
  id v21 = objc_msgSend(*(id *)&v1[v8], sel_topAnchor);
  id v22 = objc_msgSend(v1, sel_topAnchor);
  if (qword_268CF9A28 != -1) {
    swift_once();
  }
  id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_constant_, v22, *(double *)&qword_268D04158);

  *(void *)(v17 + 40) = v23;
  id v24 = objc_msgSend(v1, sel_bottomAnchor);
  id v25 = objc_msgSend(*(id *)&v1[v8], sel_bottomAnchor);
  if (qword_268CF9A30 != -1) {
    swift_once();
  }
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v25, *(double *)&qword_268D04160);

  *(void *)(v17 + 48) = v26;
  id v27 = objc_msgSend(v1, sel_trailingAnchor);
  id v28 = objc_msgSend(*(id *)&v1[v8], sel_trailingAnchor);
  id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(void *)(v17 + 56) = v29;
  v39[1] = v17;
  sub_241631F48();
  objc_super v30 = self;
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  uint64_t v31 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v31);

  id v32 = objc_msgSend(*(id *)&v1[v8], sel_widthAnchor);
  id v33 = objc_msgSend(v32, sel_constraintGreaterThanOrEqualToConstant_, 50.0);

  LODWORD(v34) = 1148846080;
  objc_msgSend(v33, sel_setPriority_, v34);
  objc_msgSend(v33, sel_setActive_, 1);
  sub_2411E58B4();
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_241637EE0;
  uint64_t v36 = sub_24162F5B8();
  uint64_t v37 = MEMORY[0x263F82018];
  *(void *)(v35 + 32) = v36;
  *(void *)(v35 + 40) = v37;
  sub_241632918();

  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

id sub_2415E7CDC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HistoryListHeaderView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HistoryListHeaderView()
{
  return self;
}

void sub_2415E7D44()
{
  qword_268D04158 = 0x4038000000000000;
}

void sub_2415E7D54()
{
  qword_268D04160 = 0x4020000000000000;
}

void sub_2415E7D64(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView_headerLabel);
  sub_2411B9D00(0, &qword_26B012140);
  id v2 = v1;
  id v3 = (id)sub_241632898();
  objc_msgSend(v2, sel_setFont_, v3);
}

void sub_2415E7E28(char a1, char a2)
{
  int v4 = a2 & 1;
  int v5 = (a2 & 1) == 0 && a2 != 2;
  sub_2415E9CF4(a1, v5);
  switch(a1)
  {
    case 3:
      sub_2415EA900();
      goto LABEL_5;
    case 5:
      uint64_t v10 = swift_allocObject();
      swift_weakInit();
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v10;
      *(unsigned char *)(v11 + 24) = 5;
      uint64_t v12 = swift_allocObject();
      swift_weakInit();
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v12;
      *(unsigned char *)(v13 + 24) = v4;
      *(void *)(v13 + 32) = sub_2415F3E54;
      *(void *)(v13 + 40) = v11;
      if (v4)
      {
        sub_2411B6854((void *)(v2 + 96), *(void *)(v2 + 120));
        sub_2412D3248(v2 + 96, (uint64_t)&v32);
        uint64_t v26 = swift_allocObject();
        long long v27 = v33;
        *(_OWORD *)(v26 + 16) = v32;
        *(_OWORD *)(v26 + 32) = v27;
        *(void *)(v26 + 48) = v34;
        *(void *)(v26 + 56) = sub_2415F36A4;
        *(void *)(v26 + 64) = v13;
        uint64_t v28 = swift_allocObject();
        *(void *)(v28 + 16) = sub_2415F3E0C;
        *(void *)(v28 + 24) = v26;
        swift_retain_n();
        swift_retain_n();
        swift_retain_n();
        swift_retain();
        swift_retain();
        goto LABEL_31;
      }
      swift_beginAccess();
      uint64_t Strong = swift_weakLoadStrong();
      if (!Strong) {
        goto LABEL_32;
      }
      *(unsigned char *)(Strong + 49) = 0;
      swift_beginAccess();
      uint64_t v15 = swift_weakLoadStrong();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      if (v15)
      {
        char v16 = 5;
        goto LABEL_23;
      }
      goto LABEL_33;
    case 6:
      *(unsigned char *)(v2 + 24) = v4;
      goto LABEL_5;
    case 7:
      *(unsigned char *)(v2 + 48) = v4;
      goto LABEL_5;
    case 8:
      *(unsigned char *)(v2 + 51) = v4;
      goto LABEL_5;
    case 9:
      uint64_t v17 = swift_allocObject();
      swift_weakInit();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v17;
      *(unsigned char *)(v18 + 24) = 9;
      uint64_t v19 = swift_allocObject();
      swift_weakInit();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v19;
      *(unsigned char *)(v20 + 24) = v4;
      *(void *)(v20 + 32) = sub_2415F35DC;
      *(void *)(v20 + 40) = v18;
      if (v4)
      {
        sub_2411B6854((void *)(v2 + 96), *(void *)(v2 + 120));
        sub_2412D3248(v2 + 96, (uint64_t)&v32);
        uint64_t v29 = swift_allocObject();
        long long v30 = v33;
        *(_OWORD *)(v29 + 16) = v32;
        *(_OWORD *)(v29 + 32) = v30;
        *(void *)(v29 + 48) = v34;
        *(void *)(v29 + 56) = sub_2415F3600;
        *(void *)(v29 + 64) = v20;
        uint64_t v31 = swift_allocObject();
        *(void *)(v31 + 16) = sub_2415F3614;
        *(void *)(v31 + 24) = v29;
        swift_retain_n();
        swift_retain_n();
        swift_retain_n();
        swift_retain();
        swift_retain();
LABEL_31:
        sub_24162BCB8();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release();
        swift_release();
        goto LABEL_32;
      }
      swift_beginAccess();
      uint64_t v21 = swift_weakLoadStrong();
      if (!v21)
      {
LABEL_32:
        swift_release();
        return;
      }
      *(unsigned char *)(v21 + 50) = 0;
      swift_beginAccess();
      uint64_t v15 = swift_weakLoadStrong();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      if (v15)
      {
        char v16 = 9;
LABEL_23:
        id v22 = sub_2415EAC90(v16);
        if (v22)
        {
          id v23 = v22;
          objc_msgSend(*(id *)(v15 + 360), sel_showViewController_sender_, v22, v15);
        }
        id v24 = *(void (**)(uint64_t))(v15 + 432);
        if (v24)
        {
          uint64_t v25 = swift_retain();
          v24(v25);
          sub_2411F4090((uint64_t)v24);
        }
        swift_release();
        swift_release();
      }
      else
      {
LABEL_33:
        swift_release();
      }
      swift_release();
      swift_release();
      swift_release_n();
      swift_release();
      swift_release_n();
      return;
    case 12:
      sub_2415EA5A0();
      goto LABEL_5;
    default:
LABEL_5:
      id v6 = sub_2415EAC90(a1);
      if (v6)
      {
        id v7 = v6;
        objc_msgSend(*(id *)(v2 + 360), sel_showViewController_sender_, v6, v2);
      }
      uint64_t v8 = *(void (**)(uint64_t))(v2 + 432);
      if (v8)
      {
        uint64_t v9 = swift_retain();
        v8(v9);
        sub_2411F4090((uint64_t)v8);
      }
      return;
  }
}

uint64_t sub_2415E8460(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_2411CE834();
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2415E8510(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  *((unsigned char *)v2 + 353) = a2;
  id v6 = (objc_class *)type metadata accessor for PregnancyOnboardingIntroductionViewController();
  id v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController_onboardingStep] = 0;
  *(void *)&v7[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController_coordinator] = v3;
  uint64_t v8 = qword_268CF9930;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v9 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  if (qword_268CF9938 != -1) {
    swift_once();
  }
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v10 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  v24.receiver = v7;
  v24.super_class = v6;
  id v11 = objc_msgSendSuper2(&v24, sel_initWithTitle_detailText_icon_contentLayout_, v9, v10, 0, 1);

  uint64_t v12 = (void *)v3[45];
  sub_2411D0524(0, (unint64_t *)&qword_26B0121F0, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_24163B390;
  *(void *)(v13 + 32) = v11;
  v23[0] = v13;
  sub_241631F48();
  sub_2411B9D00(0, (unint64_t *)&qword_268CFD4F0);
  id v14 = v12;
  id v15 = v11;
  char v16 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setViewControllers_animated_, v16, 0, v23[0]);

  objc_msgSend(a1, sel_presentViewController_animated_completion_, v3[45], 1, 0);
  uint64_t v17 = v3[47];
  type metadata accessor for RoomInteractionEvent();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0xD00000000000002ALL;
  *(void *)(v18 + 24) = 0x8000000241659F90;
  *(_WORD *)(v18 + 32) = 3336;
  *(unsigned char *)(v18 + 34) = 2;
  *(void *)(v18 + 40) = 0;
  *(unsigned char *)(v18 + 48) = 0;
  *(void *)(v18 + 56) = v17;
  uint64_t v19 = (void *)v3[49];
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v5;
  v23[4] = sub_2415F292C;
  v23[5] = v20;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 1107296256;
  v23[2] = sub_241328D44;
  v23[3] = &unk_26F578D88;
  uint64_t v21 = _Block_copy(v23);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_submitEvent_completion_, v18, v21);
  _Block_release(v21);

  return swift_release_n();
}

void sub_2415E88AC(void *a1)
{
  uint64_t v2 = v1;
  id v53 = a1;
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = sub_24162EFA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411AD0C4(0, &qword_26B0130C0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v46 - v9;
  uint64_t v11 = sub_24162B718();
  uint64_t v51 = *(void *)(v11 - 8);
  uint64_t v52 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)&v46 - v15;
  id v17 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingCustomizeHealthViewController());
  uint64_t v18 = swift_retain();
  id v54 = sub_241450F00(v18);
  uint64_t v19 = *(void **)(v1 + 64);
  if (*(unsigned char *)(v1 + 72))
  {
    if (*(unsigned char *)(v1 + 72) == 3)
    {
      uint64_t v20 = *(void **)(v1 + 56);
      uint64_t v21 = *(void *)(v1 + 16);
      sub_2413F04DC(v20, *(void **)(v1 + 64), 3);
      swift_retain();
      id v22 = objc_msgSend(v20, sel_startDate);
      sub_24162B6A8();

      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      *(&v46 - 2) = v21;
      *(&v46 - 1) = (uint64_t)v16;
      uint64_t v56 = v21;
      sub_2415F3824((unint64_t *)&qword_268CFA8A0, (void (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel);
      sub_24162BB38();
      swift_release();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v16, v52);
      sub_2411E333C(v20, v19, 3);
      swift_release();
    }
    goto LABEL_7;
  }
  uint64_t v48 = v5;
  uint64_t v49 = (uint64_t *)v7;
  uint64_t v47 = v4;
  id v24 = v19;
  id v25 = objc_msgSend(v24, sel_pregnancyStartDate);
  id v50 = v24;
  if (v25)
  {
    uint64_t v26 = v25;
    sub_24162B6A8();

    uint64_t v27 = v51;
    uint64_t v28 = v52;
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
    v29(v10, v16, v52);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v10, 0, 1, v28);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v10, 1, v28) != 1)
    {
      v29(v13, v10, v28);
      uint64_t v30 = *(void *)(v2 + 16);
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v16, v13, v28);
      uint64_t v31 = swift_getKeyPath();
      uint64_t v49 = &v46;
      MEMORY[0x270FA5388](v31);
      *(&v46 - 2) = v30;
      *(&v46 - 1) = (uint64_t)v16;
      uint64_t v56 = v30;
      sub_2415F3824((unint64_t *)&qword_268CFA8A0, (void (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel);
      swift_retain();
      sub_24162BB38();
      swift_release();
      long long v32 = *(void (**)(char *, uint64_t))(v27 + 8);
      v32(v16, v28);

      swift_release();
      v32(v13, v28);
LABEL_7:
      long long v33 = *(void **)(v2 + 360);
      sub_2411D0524(0, (unint64_t *)&qword_26B0121F0, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = xmmword_24163B390;
      id v35 = v54;
      *(void *)(v34 + 32) = v54;
      uint64_t v56 = v34;
      sub_241631F48();
      sub_2411B9D00(0, (unint64_t *)&qword_268CFD4F0);
      id v36 = v33;
      id v37 = v35;
      uint64_t v38 = (void *)sub_241631F18();
      swift_bridgeObjectRelease();
      objc_msgSend(v36, sel_setViewControllers_animated_, v38, 0);

      objc_msgSend(v53, sel_presentViewController_animated_completion_, *(void *)(v2 + 360), 1, 0);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v51 + 56))(v10, 1, 1, v52);
  }
  sub_2415F3398((uint64_t)v10, &qword_26B0130C0, MEMORY[0x263F07490]);
  uint64_t v39 = v49;
  sub_24162EF48();
  uint64_t v40 = sub_24162EF98();
  os_log_type_t v41 = sub_2416322C8();
  if (os_log_type_enabled(v40, v41))
  {
    double v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v55 = v43;
    uint64_t v56 = v3;
    *(_DWORD *)double v42 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v44 = sub_241631D78();
    uint64_t v56 = sub_2411B6898(v44, v45, &v55);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v40, v41, "[%s] Started review adjusted features flow but no start date available on the model.", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v43, -1, -1);
    MEMORY[0x245621640](v42, -1, -1);
  }
  else
  {
  }
  (*(void (**)(uint64_t *, uint64_t))(v48 + 8))(v39, v47);
}

uint64_t sub_2415E9084(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    return swift_continuation_throwingResume();
  }
  else
  {
    if (a3)
    {
      sub_2411CE834();
      uint64_t v6 = swift_allocError();
      *id v7 = a3;
      id v8 = a3;
      a1 = v3;
      a2 = v6;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2410](a1, a2);
  }
}

uint64_t sub_2415E9120()
{
  *(void *)(v1 + 136) = v0;
  return MEMORY[0x270FA2498](sub_2415E9140, 0, 0);
}

uint64_t sub_2415E9140()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0;
  uint64_t v3 = v0 + 2;
  uint64_t v4 = v0 + 10;
  uint64_t v5 = v0 + 16;
  uint64_t v6 = (void *)v0[17];
  v1[2] = v2;
  v1[7] = v5;
  v1[3] = sub_2415E9288;
  uint64_t v7 = swift_continuation_init();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v1[14] = sub_2415F2898;
  v1[15] = v8;
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 1107296256;
  v1[12] = sub_2411ABF50;
  v1[13] = &unk_26F578D38;
  uint64_t v9 = _Block_copy(v4);
  swift_release();
  objc_msgSend(v6, sel_fetchMedicalIDDataWithCompletion_, v9);
  _Block_release(v9);
  return MEMORY[0x270FA23F0](v3);
}

uint64_t sub_2415E9288()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48))
  {
    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
    return v2();
  }
  else
  {
    uint64_t v4 = *(void *)(*v0 + 128);
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v1 + 8);
    return v5(v4);
  }
}

void sub_2415E93C8()
{
  static PregnancyOnboardingStep.allCases = (uint64_t)&unk_26F567CC0;
}

uint64_t *PregnancyOnboardingStep.allCases.unsafeMutableAddressor()
{
  if (qword_268CF9A38 != -1) {
    swift_once();
  }
  return &static PregnancyOnboardingStep.allCases;
}

uint64_t static PregnancyOnboardingStep.allCases.getter()
{
  if (qword_268CF9A38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
}

uint64_t static PregnancyOnboardingStep.allCases.setter(uint64_t a1)
{
  if (qword_268CF9A38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static PregnancyOnboardingStep.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PregnancyOnboardingStep.allCases.modify())()
{
  if (qword_268CF9A38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t PregnancyOnboardingStep.description.getter(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 7:
      unint64_t result = 0xD000000000000016;
      break;
    case 8:
      unint64_t result = 0x654D776569766552;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0xD000000000000011;
      break;
    case 11:
      unint64_t result = 0x6C6169726F747554;
      break;
    case 12:
      unint64_t result = 0x616D7269666E6F43;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t PregnancyOnboardingStep.hash(into:)()
{
  return sub_241633318();
}

BOOL static PregnancyOnboardingStep.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t PregnancyOnboardingStep.hashValue.getter()
{
  return sub_241633358();
}

unint64_t sub_2415E97A0()
{
  unint64_t result = qword_268D04170;
  if (!qword_268D04170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04170);
  }
  return result;
}

unint64_t sub_2415E97F8()
{
  unint64_t result = qword_268D04178;
  if (!qword_268D04178)
  {
    sub_2411D0524(255, &qword_268D04180, (uint64_t)&type metadata for PregnancyOnboardingStep, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04178);
  }
  return result;
}

uint64_t sub_2415E9874@<X0>(void *a1@<X8>)
{
  if (qword_268CF9A38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = static PregnancyOnboardingStep.allCases;
  return _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
}

unint64_t sub_2415E98F4()
{
  return PregnancyOnboardingStep.description.getter(*v0);
}

uint64_t getEnumTagSinglePayload for PregnancyOnboardingStep(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PregnancyOnboardingStep(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x2415E9A58);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PregnancyOnboardingStep()
{
  return &type metadata for PregnancyOnboardingStep;
}

uint64_t sub_2415E9A90()
{
  sub_2411AD0C4(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v1 - 8);
  int v3 = (char *)v12 - v2;
  uint64_t v4 = sub_241632028();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  unsigned int v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_2415F3398((uint64_t)v3, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520]);
  }
  else
  {
    sub_241632018();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_241631FC8();
      uint64_t v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        v12[3] = v10;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2415E9CF4(int a1, int a2)
{
  int v66 = a2;
  int v63 = a1;
  uint64_t v69 = *v2;
  uint64_t v65 = type metadata accessor for PregnancyFlowMetric(0);
  uint64_t v3 = MEMORY[0x270FA5388](v65);
  uint64_t v67 = (uint64_t)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v55 = (char *)&v54 - v5;
  uint64_t v6 = sub_24162BA68();
  uint64_t v61 = *(void *)(v6 - 8);
  uint64_t v62 = v6;
  MEMORY[0x270FA5388](v6);
  CGRect v60 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24162B718();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  CGRect v59 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411AD0C4(0, &qword_26B0130C0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  id v17 = (char *)&v54 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v54 - v18;
  uint64_t v58 = type metadata accessor for PregnancyAnalyticModel(0);
  uint64_t v20 = MEMORY[0x270FA5388](v58);
  id v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v64 = (uint64_t)&v54 - v23;
  uint64_t v68 = v2;
  uint64_t v24 = v2[2];
  swift_getKeyPath();
  aBlock[0] = v24;
  uint64_t v25 = sub_2415F3824((unint64_t *)&qword_268CFA8A0, (void (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel);
  swift_retain();
  uint64_t v56 = v25;
  sub_24162BB48();
  swift_release();
  uint64_t v26 = v24 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin28PregnancyDatesInputViewModel__pregnancyStartDate;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v19, v26, v8);
  swift_release();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v27(v19, 0, 1, v8);
  uint64_t v57 = v17;
  v27(v17, 1, 1, v8);
  *(void *)id v22 = 0;
  sub_2411ED2F0((uint64_t)v19, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    uint64_t v28 = v59;
    sub_24162B708();
    sub_2415F3398((uint64_t)v14, &qword_26B0130C0, MEMORY[0x263F07490]);
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  }
  else
  {
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    uint64_t v28 = v59;
    v29(v59, v14, v8);
  }
  uint64_t v30 = v58;
  v29(&v22[*(int *)(v58 + 20)], v28, v8);
  uint64_t v31 = (uint64_t)v57;
  sub_2411ED2F0((uint64_t)v57, (uint64_t)&v22[*(int *)(v30 + 24)]);
  long long v32 = v60;
  sub_24162BA58();
  uint64_t v33 = sub_24162BA38();
  uint64_t v35 = v34;
  id v36 = (uint64_t (*)(uint64_t))MEMORY[0x263F07490];
  sub_2415F3398(v31, &qword_26B0130C0, MEMORY[0x263F07490]);
  sub_2415F3398((uint64_t)v19, &qword_26B0130C0, v36);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v32, v62);
  id v37 = (uint64_t *)&v22[*(int *)(v30 + 28)];
  *id v37 = v33;
  v37[1] = v35;
  uint64_t v38 = (uint64_t)v22;
  uint64_t v39 = v64;
  sub_2415F3470(v38, v64, type metadata accessor for PregnancyAnalyticModel);
  unint64_t v40 = PregnancyOnboardingStep.description.getter(v63);
  uint64_t v42 = v41;
  uint64_t v43 = v68;
  LOBYTE(v31) = *((unsigned char *)v68 + 354);
  uint64_t v44 = v68[2];
  swift_getKeyPath();
  aBlock[0] = v44;
  swift_retain();
  sub_24162BB48();
  swift_release();
  LOBYTE(v33) = *(unsigned char *)(v44
                         + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin28PregnancyDatesInputViewModel__selectedInputMethod);
  swift_release();
  uint64_t v45 = (uint64_t)v55;
  sub_2415F3408(v39, (uint64_t)&v55[*(int *)(v65 + 36)], type metadata accessor for PregnancyAnalyticModel);
  *(unsigned char *)uint64_t v45 = 0;
  *(void *)(v45 + 8) = v40;
  *(void *)(v45 + 16) = v42;
  *(unsigned char *)(v45 + 24) = v66;
  *(unsigned char *)(v45 + 25) = v31;
  *(unsigned char *)(v45 + 26) = v33;
  uint64_t v46 = (void *)v43[18];
  uint64_t v47 = v67;
  sub_2415F3408(v45, v67, type metadata accessor for PregnancyFlowMetric);
  type metadata accessor for PregnancyFlowAnalyticsEvent();
  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = v46;
  sub_2415F3470(v47, v48 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27PregnancyFlowAnalyticsEvent_metric, type metadata accessor for PregnancyFlowMetric);
  uint64_t v49 = (void *)v43[49];
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = v69;
  aBlock[4] = sub_2415F34E8;
  aBlock[5] = v50;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_241328D44;
  aBlock[3] = &unk_26F578E00;
  uint64_t v51 = _Block_copy(aBlock);
  id v52 = v46;
  swift_retain();
  swift_release();
  objc_msgSend(v49, sel_submitEvent_completion_, v48, v51);
  _Block_release(v51);
  swift_release_n();
  sub_2415F350C(v45, type metadata accessor for PregnancyFlowMetric);
  return sub_2415F350C(v39, type metadata accessor for PregnancyAnalyticModel);
}

uint64_t sub_2415EA494(char a1, char a2, uint64_t a3, char a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  if (a1)
  {
    id v9 = sub_2415EAC90(a4);
    if (v9)
    {
      id v10 = v9;
      objc_msgSend(*(id *)(v8 + 360), sel_showViewController_sender_, v9, v8);
LABEL_7:
    }
  }
  else if (a2 == 1)
  {
    id v11 = *(id *)(result + 360);
    id v10 = sub_2412D3328(a4);
    objc_msgSend(v11, sel_presentViewController_animated_completion_, v10, 1, 0);

    goto LABEL_7;
  }
  uint64_t v12 = *(void (**)(uint64_t))(v8 + 432);
  if (v12)
  {
    uint64_t v13 = swift_retain();
    v12(v13);
    sub_2411F4090((uint64_t)v12);
  }
  return swift_release();
}

void sub_2415EA5A0()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v0 + 56);
  uint64_t v6 = *(void **)(v0 + 64);
  switch(*(unsigned char *)(v0 + 72))
  {
    case 1:
    case 2:
    case 4:
      sub_2415EB6F4();
      break;
    case 3:
      sub_2415EB3BC(v7, 0);
      sub_2411E333C(v7, v6, 3);
      break;
    default:
      id v8 = v7;
      id v9 = v6;
      id v10 = objc_msgSend(v9, sel_sample);
      if (v10)
      {
        id v11 = v10;
        id v20 = v8;
        sub_2415EB3BC(v11, v7);

        id v12 = v20;
      }
      else
      {
        sub_24162EF48();
        uint64_t v13 = sub_24162EF98();
        os_log_type_t v14 = sub_2416322C8();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = (uint8_t *)swift_slowAlloc();
          id v20 = (id)swift_slowAlloc();
          id v21 = v20;
          *(_DWORD *)uint64_t v15 = 136315138;
          uint64_t v19 = v15 + 4;
          uint64_t v22 = v1;
          swift_getMetatypeMetadata();
          uint64_t v16 = sub_241631D78();
          uint64_t v22 = sub_2411B6898(v16, v17, (uint64_t *)&v21);
          sub_241632C28();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24118E000, v13, v14, "[%s] Started review adjusted features flow but no sample available on the model", v15, 0xCu);
          id v18 = v20;
          swift_arrayDestroy();
          MEMORY[0x245621640](v18, -1, -1);
          MEMORY[0x245621640](v15, -1, -1);
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      break;
  }
}

void sub_2415EA900()
{
  uint64_t v24 = *v0;
  uint64_t v1 = sub_24162B718();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  uint64_t v22 = v0;
  id v23 = v5;
  uint64_t v6 = v0[2];
  uint64_t v7 = v0;
  swift_getKeyPath();
  aBlock[0] = v6;
  sub_2415F3824((unint64_t *)&qword_268CFA8A0, (void (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel);
  swift_retain();
  sub_24162BB48();
  swift_release();
  uint64_t v8 = v6 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin28PregnancyDatesInputViewModel__pregnancyStartDate;
  swift_beginAccess();
  id v9 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v9(v4, v8, v1);
  swift_release();
  uint64_t v21 = sub_24162B668();
  id v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v4, v1);
  uint64_t v11 = v7[2];
  swift_getKeyPath();
  aBlock[0] = v11;
  swift_retain();
  sub_24162BB48();
  swift_release();
  uint64_t v12 = v11 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin28PregnancyDatesInputViewModel__pregnancyEndDate;
  swift_beginAccess();
  v9(v4, v12, v1);
  swift_release();
  uint64_t v13 = (void *)sub_24162B668();
  v10(v4, v1);
  os_log_type_t v14 = (void *)v21;
  id v15 = objc_msgSend(v23, sel_hkmc_categorySampleWithCycleFactor_startDate_endDate_, 2, v21, v13);

  uint64_t v16 = (void *)v22[18];
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v24;
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = v19;
  aBlock[4] = sub_2415F3D84;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_241328D44;
  aBlock[3] = &unk_26F5790F8;
  id v20 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v16, sel_saveObject_withCompletion_, v15, v20);
  _Block_release(v20);
}

id sub_2415EAC90(char a1)
{
  while (2)
  {
    uint64_t v2 = v1;
    char v3 = a1;
    uint64_t v4 = (unsigned char *)(v1 + 352);
    uint64_t v5 = sub_24162EFA8();
    uint64_t v6 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v5);
    uint64_t v8 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v9 = 0;
    switch(v3)
    {
      case 1:
        uint64_t v13 = *(void *)(v2 + 16);
        swift_getKeyPath();
        *(void *)&v52[0] = v13;
        sub_2415F3824((unint64_t *)&qword_268CFA8A0, (void (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel);
        swift_retain();
        sub_24162BB48();
        swift_release();
        int v14 = *(unsigned __int8 *)(v13
                                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin28PregnancyDatesInputViewModel__selectedInputMethod);
        swift_release();
        if (v14 != 4)
        {
          objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingRecordDetailsViewController());
          swift_retain();
          uint64_t v43 = swift_retain();
          return sub_2411F28B8(v43, v14, v2);
        }
        sub_24162EF48();
        id v15 = sub_24162EF98();
        os_log_type_t v16 = sub_2416322C8();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = (uint8_t *)swift_slowAlloc();
          uint64_t v18 = swift_slowAlloc();
          *(void *)&v52[0] = v18;
          *(_DWORD *)uint64_t v17 = 136315138;
          uint64_t v19 = sub_2416333E8();
          v51[1] = sub_2411B6898(v19, v20, (uint64_t *)v52);
          sub_241632C28();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24118E000, v15, v16, "[%s] Attempting to proceed to .recordHealthDetails step without an estimation method selected", v17, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x245621640](v18, -1, -1);
          MEMORY[0x245621640](v17, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return 0;
      case 2:
        id v21 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingCustomizeHealthViewController());
        uint64_t v22 = swift_retain();
        return sub_241450F00(v22);
      case 3:
      case 12:
        return v9;
      case 4:
        id v34 = objc_msgSend(self, sel_sharedBehavior);
        if (!v34)
        {
          __break(1u);
          JUMPOUT(0x2415EB388);
        }
        uint64_t v35 = v34;
        unsigned int v36 = objc_msgSend(v34, sel_isiPad);

        if (v36) {
          goto LABEL_21;
        }
        sub_2411B6854((void *)(v2 + 312), *(void *)(v2 + 336));
        if ((sub_241421C0C() & 1) == 0)
        {
          a1 = 5;
LABEL_45:
          uint64_t v1 = v53;
          continue;
        }
        if (qword_268CF9240 != -1) {
          swift_once();
        }
        id v23 = &xmmword_268D23A00;
LABEL_41:
        long long v44 = v23[7];
        v52[6] = v23[6];
        v52[7] = v44;
        long long v45 = v23[9];
        v52[8] = v23[8];
        v52[9] = v45;
        long long v46 = v23[3];
        v52[2] = v23[2];
        v52[3] = v46;
        long long v47 = v23[5];
        v52[4] = v23[4];
        v52[5] = v47;
        long long v48 = v23[1];
        v52[0] = *v23;
        v52[1] = v48;
        id v49 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingSuggestedFeatureAdjustmentViewController());
        swift_retain();
        sub_241261638((uint64_t)v52);
        return sub_24125F434((uint64_t)v52, v2, 0);
      case 5:
        sub_2411B6854((void *)(v2 + 312), *(void *)(v2 + 336));
        if (sub_241421808())
        {
          if (qword_268CF9248 != -1) {
            swift_once();
          }
          id v23 = &xmmword_268D23AA0;
          goto LABEL_41;
        }
        a1 = 6;
        goto LABEL_45;
      case 6:
        sub_2411B6854((void *)(v2 + 312), *(void *)(v2 + 336));
        if (sub_241421A88())
        {
          if (qword_268CF9250 != -1) {
            swift_once();
          }
          id v23 = &xmmword_268D23B40;
          goto LABEL_41;
        }
        a1 = 7;
        goto LABEL_45;
      case 7:
LABEL_21:
        if (sub_2415F1CD0())
        {
          id v37 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingReviewMentalHealthViewController());
          uint64_t v38 = swift_retain();
          sub_24137931C(v38);
          return (id)v12;
        }
        a1 = 9;
        goto LABEL_45;
      case 8:
        int v24 = *(unsigned __int8 *)(v2 + 368);
        if (v24 == 2)
        {
          unint64_t v25 = sub_24162EDE8();
          if (v25 >> 62) {
            uint64_t v26 = sub_241633068();
          }
          else {
            uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          if (v26 > 0)
          {
LABEL_16:
            uint64_t v27 = *(void *)(v2 + 240);
            id v28 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingReviewMedicationsViewController());
            swift_retain();
            swift_retain();
            sub_24139AB78(v2, v27);
            id v9 = v29;
            swift_release();
            swift_release();
            return v9;
          }
        }
        else if (v24)
        {
          goto LABEL_16;
        }
        a1 = 10;
        goto LABEL_45;
      case 9:
        uint64_t v39 = *(void **)(v2 + 296);
        if (v39 && *v4 == 1)
        {
          id v40 = v39;
          swift_retain();
          id v41 = sub_241380C40();
          swift_release();
          sub_2412617B4(v40, (uint64_t)v41, (uint64_t)v52);
          id v42 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingSuggestedFeatureAdjustmentViewController());
          swift_retain();
          id v9 = sub_24125F434((uint64_t)v52, v2, 0);

          return v9;
        }
        a1 = 8;
        goto LABEL_45;
      case 10:
        uint64_t v30 = objc_allocWithZone((Class)type metadata accessor for OnboardingTimelineTutorialViewController());
        uint64_t v31 = swift_retain();
        return sub_2415F2A00(v31, v30);
      case 11:
        id v32 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingConfirmationViewController());
        uint64_t v33 = swift_retain();
        return sub_241319E50(v33);
      default:
        uint64_t v10 = *(void *)(v2 + 16);
        char v11 = v4[1];
        objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingEstimationMethodSelectionViewController());
        swift_retain();
        swift_retain();
        sub_24154E690(v10, v2, v11);
        return (id)v12;
    }
  }
}

uint64_t sub_2415EB3BC(void *a1, void *a2)
{
  uint64_t v27 = a2;
  uint64_t v29 = a1;
  sub_2411AD0C4(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v26 = (char *)&v26 - v4;
  uint64_t v5 = sub_24162EE78();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v11 = (char *)&v26 - v10;
  uint64_t v28 = v2;
  sub_24162EE68();
  uint64_t v12 = sub_24162EE98();
  os_signpost_type_t v13 = sub_241632628();
  if (sub_241632BC8())
  {
    int v14 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v14(v9, v11, v5);
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    os_signpost_id_t v16 = sub_24162EE58();
    _os_signpost_emit_with_name_impl(&dword_24118E000, v12, v13, v16, "OnboardingCoordinator.completeOnboarding", "", v15, 2u);
    MEMORY[0x245621640](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  else
  {

    int v14 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  }
  v14(v9, v11, v5);
  sub_24162EEE8();
  swift_allocObject();
  uint64_t v17 = sub_24162EED8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  uint64_t v18 = sub_241632028();
  uint64_t v19 = (uint64_t)v26;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v26, 1, 1, v18);
  unint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  id v21 = v29;
  v20[4] = v28;
  void v20[5] = v21;
  uint64_t v22 = v27;
  v20[6] = v27;
  v20[7] = v17;
  id v23 = v22;
  swift_retain();
  id v24 = v21;
  sub_241496830(v19, (uint64_t)&unk_268D04220, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_2415EB6F4()
{
  uint64_t v1 = v0;
  uint64_t v26 = *v0;
  sub_2411AD0C4(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v25 = (char *)&v23 - v3;
  uint64_t v4 = sub_24162EE78();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - v9;
  sub_24162EE68();
  char v11 = sub_24162EE98();
  os_signpost_type_t v12 = sub_241632628();
  if (sub_241632BC8())
  {
    os_signpost_type_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v8, v10, v4);
    int v14 = (uint8_t *)swift_slowAlloc();
    id v24 = v0;
    id v15 = v14;
    *(_WORD *)int v14 = 0;
    os_signpost_id_t v16 = sub_24162EE58();
    _os_signpost_emit_with_name_impl(&dword_24118E000, v11, v12, v16, "OnboardingCoordinator.completeOnboarding", "", v15, 2u);
    uint64_t v17 = v15;
    uint64_t v1 = v24;
    MEMORY[0x245621640](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {

    os_signpost_type_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  }
  v13(v8, v10, v4);
  sub_24162EEE8();
  swift_allocObject();
  uint64_t v18 = sub_24162EED8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  uint64_t v19 = sub_241632028();
  uint64_t v20 = (uint64_t)v25;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v25, 1, 1, v19);
  id v21 = (void *)swift_allocObject();
  _OWORD v21[2] = 0;
  v21[3] = 0;
  v21[4] = v1;
  v21[5] = v18;
  v21[6] = v26;
  swift_retain();
  sub_241496830(v20, (uint64_t)&unk_268D041D0, (uint64_t)v21);
  return swift_release();
}

uint64_t sub_2415EBA48(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = a4;
  uint64_t v6 = sub_241631488();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_2416314A8();
  uint64_t v10 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  os_signpost_type_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24162EFA8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  os_signpost_id_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a3 + 16;
  if (a2 && HKShowSensitiveLogItems())
  {
    uint64_t v37 = v7;
    sub_24162EF48();
    id v17 = a2;
    id v18 = a2;
    uint64_t v19 = sub_24162EF98();
    os_log_type_t v20 = sub_2416322C8();
    uint64_t v38 = v19;
    int v36 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = v14;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      aBlock[0] = v35;
      *(_DWORD *)uint64_t v22 = 136315394;
      uint64_t v34 = v22 + 4;
      uint64_t v23 = sub_2416333E8();
      uint64_t v39 = v13;
      uint64_t v42 = sub_2411B6898(v23, v24, aBlock);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v34 = v22 + 14;
      uint64_t v42 = (uint64_t)a2;
      id v25 = a2;
      sub_2411AD0C4(0, (unint64_t *)&qword_26B010860, (uint64_t (*)(uint64_t))sub_2411CE834, MEMORY[0x263F8D8F0]);
      uint64_t v26 = sub_241631D48();
      uint64_t v42 = sub_2411B6898(v26, v27, aBlock);
      sub_241632C28();
      swift_bridgeObjectRelease();

      uint64_t v28 = v38;
      _os_log_impl(&dword_24118E000, v38, (os_log_type_t)v36, "[%s] Failed to save new pregnancy factor with error: %s", (uint8_t *)v22, 0x16u);
      uint64_t v29 = v35;
      swift_arrayDestroy();
      MEMORY[0x245621640](v29, -1, -1);
      MEMORY[0x245621640](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v39);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
    uint64_t v7 = v37;
  }
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  uint64_t v30 = (void *)sub_2416325A8();
  aBlock[4] = (uint64_t)sub_2415F3D8C;
  aBlock[5] = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2411987F4;
  aBlock[3] = (uint64_t)&unk_26F579120;
  uint64_t v31 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_241631498();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2415F3824((unint64_t *)&qword_26B013080, MEMORY[0x263F8F030]);
  sub_2411AD0C4(0, (unint64_t *)&qword_26B013090, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2411ACDF0();
  sub_241632D08();
  MEMORY[0x24561FA80](0, v12, v9, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v41);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2415EC130();
    return swift_release();
  }
  return result;
}

void sub_2415EBFF8()
{
  swift_beginAccess();
  swift_weakLoadStrong();
  id v0 = objc_allocWithZone((Class)type metadata accessor for PregnancyOnboardingPastPregnancyAddedViewController());
  sub_24121A034();
  uint64_t v2 = v1;
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakAssign();
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v4 = *(id *)(Strong + 360);
    swift_release();
    swift_beginAccess();
    objc_msgSend(v4, sel_showViewController_sender_, v2, swift_weakLoadStrong());

    swift_release();
  }
  else
  {
  }
}

uint64_t sub_2415EC130()
{
  uint64_t v1 = *v0;
  sub_2411AD0C4(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v8 - v3;
  uint64_t v5 = sub_241632028();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  v6[5] = v1;
  swift_retain();
  sub_241496830((uint64_t)v4, (uint64_t)&unk_268D041E8, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_2415EC27C(uint64_t a1, uint64_t a2, char a3, void (*a4)(BOOL, uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if ((a1 & 0xFE) == 2) {
      *(unsigned char *)(result + 49) = a3 & 1;
    }
    a4((a1 & 0xFE) == 2, a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_2415EC320(uint64_t a1, uint64_t a2, char a3, void (*a4)(BOOL, uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if ((a1 & 0xFE) == 2) {
      *(unsigned char *)(result + 50) = a3 & 1;
    }
    a4((a1 & 0xFE) == 2, a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_2415EC3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[12] = a4;
  uint64_t v7 = sub_24162EFA8();
  v6[15] = v7;
  v6[16] = *(void *)(v7 - 8);
  v6[17] = swift_task_alloc();
  uint64_t v8 = sub_24162EEB8();
  v6[18] = v8;
  v6[19] = *(void *)(v8 - 8);
  v6[20] = swift_task_alloc();
  uint64_t v9 = sub_24162EE78();
  v6[21] = v9;
  v6[22] = *(void *)(v9 - 8);
  v6[23] = swift_task_alloc();
  v6[24] = swift_task_alloc();
  uint64_t v10 = sub_241631488();
  v6[25] = v10;
  v6[26] = *(void *)(v10 - 8);
  v6[27] = swift_task_alloc();
  uint64_t v11 = sub_2416314A8();
  v6[28] = v11;
  v6[29] = *(void *)(v11 - 8);
  v6[30] = swift_task_alloc();
  os_signpost_type_t v12 = (void *)swift_task_alloc();
  v6[31] = v12;
  *os_signpost_type_t v12 = v6;
  v12[1] = sub_2415EC638;
  return sub_2415ED180();
}

uint64_t sub_2415EC638()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2415ECB40;
  }
  else {
    uint64_t v2 = sub_2415EC74C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415EC74C()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[27];
  uint64_t v24 = v0[29];
  uint64_t v25 = v0[28];
  uint64_t v4 = v0[25];
  uint64_t v3 = v0[26];
  uint64_t v5 = v0[12];
  sub_2415EC130();
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  uint64_t v23 = (void *)sub_2416325A8();
  v0[6] = (uint64_t)sub_2415F3808;
  v0[7] = v5;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = (uint64_t)sub_2411987F4;
  v0[5] = (uint64_t)&unk_26F578FB8;
  uint64_t v6 = _Block_copy(v0 + 2);
  swift_retain();
  sub_241631498();
  v0[9] = MEMORY[0x263F8EE78];
  sub_2415F3824((unint64_t *)&qword_26B013080, MEMORY[0x263F8F030]);
  sub_2411AD0C4(0, (unint64_t *)&qword_26B013090, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2411ACDF0();
  sub_241632D08();
  MEMORY[0x24561FA80](0, v1, v2, v6);
  _Block_release(v6);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v1, v25);
  swift_release();
  uint64_t v7 = sub_24162EE98();
  sub_24162EEC8();
  os_signpost_type_t v8 = sub_241632618();
  if (sub_241632BC8())
  {
    uint64_t v10 = v0[19];
    uint64_t v9 = v0[20];
    uint64_t v11 = v0[18];
    swift_retain();
    sub_24162EEF8();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v9, v11) == *MEMORY[0x263F90238])
    {
      os_signpost_type_t v12 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v0[19] + 8))(v0[20], v0[18]);
      os_signpost_type_t v12 = "";
    }
    uint64_t v16 = v0[24];
    uint64_t v15 = v0 + 23;
    uint64_t v17 = v0[21];
    uint64_t v18 = v0[22];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v0[23], v16, v17);
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    os_signpost_id_t v20 = sub_24162EE58();
    _os_signpost_emit_with_name_impl(&dword_24118E000, v7, v8, v20, "OnboardingCoordinator.completeOnboarding", v12, v19, 2u);
    MEMORY[0x245621640](v19, -1, -1);

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v14(v16, v17);
  }
  else
  {
    uint64_t v13 = v0[22];

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    uint64_t v15 = v0 + 24;
  }
  v14(*v15, v0[21]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_2415ECB40()
{
  uint64_t v51 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  char v3 = HKShowSensitiveLogItems();
  uint64_t v4 = (void *)v0[32];
  if (v3)
  {
    sub_24162EF48();
    id v5 = v4;
    id v6 = v4;
    uint64_t v7 = sub_24162EF98();
    os_log_type_t v8 = sub_2416322C8();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = (void *)v1[32];
    uint64_t v12 = v1[16];
    uint64_t v11 = v1[17];
    uint64_t v13 = v1[15];
    if (v9)
    {
      uint64_t v48 = v1[15];
      uint64_t v14 = v1[14];
      uint64_t v15 = swift_slowAlloc();
      id v49 = v2;
      uint64_t v16 = (void *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v50 = v45;
      *(_DWORD *)uint64_t v15 = 136315394;
      v1[8] = v14;
      swift_getMetatypeMetadata();
      uint64_t v17 = sub_241631D78();
      v1[10] = sub_2411B6898(v17, v18, &v50);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2112;
      id v19 = v10;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      v1[11] = v20;
      sub_241632C28();
      void *v16 = v20;

      _os_log_impl(&dword_24118E000, v7, v8, "[%s] Unable to complete onboarding with error: %@", (uint8_t *)v15, 0x16u);
      sub_2411A868C(0, (unint64_t *)&qword_26B0121E0, (unint64_t *)&qword_26B012200);
      swift_arrayDestroy();
      uint64_t v21 = v16;
      uint64_t v2 = v49;
      MEMORY[0x245621640](v21, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x245621640](v45, -1, -1);
      MEMORY[0x245621640](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v48);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
  }
  else
  {
  }
  uint64_t v22 = v1 + 24;
  uint64_t v23 = v1[30];
  uint64_t v24 = v1[27];
  uint64_t v46 = v1[29];
  uint64_t v47 = v1[28];
  uint64_t v25 = v1[25];
  uint64_t v26 = v1[26];
  uint64_t v27 = v1[12];
  sub_2415EC130();
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  long long v44 = (void *)sub_2416325A8();
  v1[6] = sub_2415F3808;
  v1[7] = v27;
  v1[2] = MEMORY[0x263EF8330];
  v1[3] = 1107296256;
  v1[4] = sub_2411987F4;
  v1[5] = &unk_26F578FB8;
  uint64_t v28 = _Block_copy(v2);
  swift_retain();
  sub_241631498();
  v1[9] = MEMORY[0x263F8EE78];
  sub_2415F3824((unint64_t *)&qword_26B013080, MEMORY[0x263F8F030]);
  sub_2411AD0C4(0, (unint64_t *)&qword_26B013090, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2411ACDF0();
  sub_241632D08();
  MEMORY[0x24561FA80](0, v23, v24, v28);
  _Block_release(v28);

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v23, v47);
  swift_release();
  uint64_t v29 = sub_24162EE98();
  sub_24162EEC8();
  os_signpost_type_t v30 = sub_241632618();
  if (sub_241632BC8())
  {
    uint64_t v32 = v1[19];
    uint64_t v31 = v1[20];
    uint64_t v33 = v1[18];
    swift_retain();
    sub_24162EEF8();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v32 + 88))(v31, v33) == *MEMORY[0x263F90238])
    {
      uint64_t v34 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(v1[19] + 8))(v1[20], v1[18]);
      uint64_t v34 = "";
    }
    uint64_t v37 = v1[24];
    uint64_t v22 = v1 + 23;
    uint64_t v39 = v1[21];
    uint64_t v38 = v1[22];
    (*(void (**)(void, uint64_t, uint64_t))(v38 + 16))(v1[23], v37, v39);
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    os_signpost_id_t v41 = sub_24162EE58();
    _os_signpost_emit_with_name_impl(&dword_24118E000, v29, v30, v41, "OnboardingCoordinator.completeOnboarding", v34, v40, 2u);
    MEMORY[0x245621640](v40, -1, -1);

    int v36 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    v36(v37, v39);
  }
  else
  {
    uint64_t v35 = v1[22];

    int v36 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  }
  v36(*v22, v1[21]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = (uint64_t (*)(void))v1[1];
  return v42();
}

uint64_t sub_2415ED180()
{
  v1[24] = v0;
  v1[25] = *v0;
  uint64_t v2 = sub_24162EFA8();
  v1[26] = v2;
  v1[27] = *(void *)(v2 - 8);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2415ED284, 0, 0);
}

uint64_t sub_2415ED284()
{
  uint64_t v29 = v0;
  uint64_t v1 = v0[24];
  swift_retain();
  id v2 = sub_241380C40();
  v0[31] = v2;
  swift_release();
  sub_2411D0524(0, (unint64_t *)&qword_26B0121F0, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24163B390;
  *(void *)(v3 + 32) = v2;
  unint64_t v28 = v3;
  sub_241631F48();
  unint64_t v4 = v28;
  v0[16] = v28;
  unint64_t v5 = *(void *)(v1 + 40);
  if (v5 >> 62)
  {
    id v23 = v2;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v24 = sub_241633068();
    swift_bridgeObjectRelease();
    if (!v24) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v7 = v2;
    if (!v6) {
      goto LABEL_7;
    }
  }
  sub_24162EF48();
  os_log_type_t v8 = sub_24162EF98();
  os_log_type_t v9 = sub_2416322E8();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = v0[30];
  uint64_t v12 = v0[26];
  uint64_t v13 = v0[27];
  if (v10)
  {
    uint64_t v27 = v0[30];
    uint64_t v14 = v0[25];
    uint64_t v26 = v0[26];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    unint64_t v28 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v0[15] = v14;
    swift_getMetatypeMetadata();
    uint64_t v17 = sub_241631D78();
    v0[23] = sub_2411B6898(v17, v18, (uint64_t *)&v28);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v8, v9, "[%s] Also saving other cycle factors", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v16, -1, -1);
    MEMORY[0x245621640](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v27, v26);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  unint64_t v19 = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241496BDC(v19);
  unint64_t v4 = v0[16];
LABEL_7:
  uint64_t v20 = *(void **)(v0[24] + 144);
  if (v4 >> 62)
  {
    sub_2411B9D00(0, &qword_268D041F0);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_241633058();
    swift_bridgeObjectRelease();
  }
  else
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_241633228();
    sub_2411B9D00(0, &qword_268D041F0);
  }
  swift_bridgeObjectRelease();
  sub_2411B9D00(0, &qword_268D041F0);
  uint64_t v21 = sub_241631F18();
  v0[32] = v21;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_2415ED6A4;
  uint64_t v22 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2415E9080;
  v0[13] = &unk_2650E80B0;
  v0[14] = v22;
  objc_msgSend(v20, sel_saveObjects_withCompletion_, v21, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2415ED6A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 264) = v1;
  if (v1) {
    id v2 = sub_2415EDB48;
  }
  else {
    id v2 = sub_2415ED7B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415ED7B4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v1;
  void *v1 = v0;
  v1[1] = sub_2415ED84C;
  return sub_2415EF088();
}

uint64_t sub_2415ED84C()
{
  id v2 = (void *)*v1;
  v2[35] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2415EDE48, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v2[36] = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_2415ED9C4;
    uint64_t v4 = v2[31];
    return sub_2415EE858(v4, 0);
  }
}

uint64_t sub_2415ED9C4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2415EDAC0, 0, 0);
}

uint64_t sub_2415EDAC0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2415EDB48()
{
  unint64_t v28 = v0;
  uint64_t v1 = v0;
  uint64_t v4 = v0 + 32;
  uint64_t v3 = (void *)v0[32];
  id v2 = (void *)v4[1];
  swift_willThrow();

  sub_24162EF48();
  id v5 = v2;
  id v6 = v2;
  id v7 = sub_24162EF98();
  os_log_type_t v8 = sub_2416322C8();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (void *)v1[33];
    uint64_t v24 = v1[27];
    uint64_t v10 = v1[25];
    uint64_t v25 = v1[26];
    uint64_t v26 = v1[29];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v11 = 136315394;
    v1[17] = v10;
    swift_getMetatypeMetadata();
    uint64_t v13 = sub_241631D78();
    v1[21] = sub_2411B6898(v13, v14, &v27);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2112;
    id v15 = v9;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v1[22] = v16;
    sub_241632C28();
    *uint64_t v12 = v16;

    _os_log_impl(&dword_24118E000, v7, v8, "[%s] Unable to save sample with error: %@", (uint8_t *)v11, 0x16u);
    sub_2411A868C(0, (unint64_t *)&qword_26B0121E0, (unint64_t *)&qword_26B012200);
    swift_arrayDestroy();
    MEMORY[0x245621640](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x245621640](v23, -1, -1);
    MEMORY[0x245621640](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    uint64_t v17 = (void *)v1[33];
    uint64_t v18 = v1[29];
    uint64_t v19 = v1[26];
    uint64_t v20 = v1[27];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  }
  uint64_t v21 = (void *)swift_task_alloc();
  v1[34] = v21;
  void *v21 = v1;
  v21[1] = sub_2415ED84C;
  return sub_2415EF088();
}

uint64_t sub_2415EDE48()
{
  uint64_t v27 = v0;
  uint64_t v1 = v0;
  id v2 = (void *)v0[35];
  sub_24162EF48();
  id v3 = v2;
  id v4 = v2;
  id v5 = sub_24162EF98();
  os_log_type_t v6 = sub_2416322C8();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (void *)v0[35];
    uint64_t v23 = v0[27];
    uint64_t v8 = v0[25];
    uint64_t v24 = v0[26];
    uint64_t v25 = v0[28];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[18] = v8;
    swift_getMetatypeMetadata();
    uint64_t v11 = sub_241631D78();
    v0[19] = sub_2411B6898(v11, v12, &v26);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v7;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[20] = v14;
    sub_241632C28();
    *uint64_t v10 = v14;

    _os_log_impl(&dword_24118E000, v5, v6, "[%s] Unable to update cycle tracking onboarding record with error: %@", (uint8_t *)v9, 0x16u);
    sub_2411A868C(0, (unint64_t *)&qword_26B0121E0, (unint64_t *)&qword_26B012200);
    swift_arrayDestroy();
    MEMORY[0x245621640](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x245621640](v22, -1, -1);
    MEMORY[0x245621640](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
  }
  else
  {
    id v15 = (void *)v0[35];
    uint64_t v17 = v1[27];
    uint64_t v16 = v1[28];
    uint64_t v18 = v1[26];

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  uint64_t v19 = (void *)swift_task_alloc();
  v1[36] = v19;
  *uint64_t v19 = v1;
  v19[1] = sub_2415ED9C4;
  uint64_t v20 = v1[31];
  return sub_2415EE858(v20, 0);
}

uint64_t sub_2415EE148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a4;
  v7[10] = a7;
  uint64_t v10 = sub_24162EEB8();
  v7[11] = v10;
  v7[12] = *(void *)(v10 - 8);
  v7[13] = swift_task_alloc();
  uint64_t v11 = sub_24162EE78();
  v7[14] = v11;
  v7[15] = *(void *)(v11 - 8);
  v7[16] = swift_task_alloc();
  v7[17] = swift_task_alloc();
  uint64_t v12 = sub_241631488();
  v7[18] = v12;
  v7[19] = *(void *)(v12 - 8);
  v7[20] = swift_task_alloc();
  uint64_t v13 = sub_2416314A8();
  v7[21] = v13;
  v7[22] = *(void *)(v13 - 8);
  v7[23] = swift_task_alloc();
  uint64_t v14 = (void *)swift_task_alloc();
  unsigned char v7[24] = v14;
  *uint64_t v14 = v7;
  v14[1] = sub_2415EE378;
  return sub_2415EE858(a5, a6);
}

uint64_t sub_2415EE378()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2415EE474, 0, 0);
}

uint64_t sub_2415EE474()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v24 = v0[22];
  uint64_t v25 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v5 = v0[9];
  sub_2415EC130();
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  uint64_t v23 = (void *)sub_2416325A8();
  v0[6] = (uint64_t)sub_2415F3808;
  v0[7] = v5;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = (uint64_t)sub_2411987F4;
  v0[5] = (uint64_t)&unk_26F5790A8;
  os_log_type_t v6 = _Block_copy(v0 + 2);
  swift_retain();
  sub_241631498();
  v0[8] = MEMORY[0x263F8EE78];
  sub_2415F3824((unint64_t *)&qword_26B013080, MEMORY[0x263F8F030]);
  sub_2411AD0C4(0, (unint64_t *)&qword_26B013090, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2411ACDF0();
  sub_241632D08();
  MEMORY[0x24561FA80](0, v1, v2, v6);
  _Block_release(v6);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v1, v25);
  swift_release();
  id v7 = sub_24162EE98();
  sub_24162EEC8();
  os_signpost_type_t v8 = sub_241632618();
  if (sub_241632BC8())
  {
    uint64_t v10 = v0[12];
    uint64_t v9 = v0[13];
    uint64_t v11 = v0[11];
    swift_retain();
    sub_24162EEF8();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v9, v11) == *MEMORY[0x263F90238])
    {
      uint64_t v12 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v0[12] + 8))(v0[13], v0[11]);
      uint64_t v12 = "";
    }
    uint64_t v16 = v0[17];
    id v15 = v0 + 16;
    uint64_t v17 = v0[14];
    uint64_t v18 = v0[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v0[16], v16, v17);
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    os_signpost_id_t v20 = sub_24162EE58();
    _os_signpost_emit_with_name_impl(&dword_24118E000, v7, v8, v20, "OnboardingCoordinator.completeOnboarding", v12, v19, 2u);
    MEMORY[0x245621640](v19, -1, -1);

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v14(v16, v17);
  }
  else
  {
    uint64_t v13 = v0[15];

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    id v15 = v0 + 17;
  }
  v14(*v15, v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_2415EE858(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = *v2;
  uint64_t v4 = sub_24162EFA8();
  v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2415EE944, 0, 0);
}

uint64_t sub_2415EE944()
{
  sub_2411B6854((void *)(*(void *)(v0 + 56) + 192), *(void *)(*(void *)(v0 + 56) + 216));
  sub_24162C428();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_2415EEA1C;
  return sub_2415EF788();
}

uint64_t sub_2415EEA1C()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2415EEC68;
  }
  else {
    uint64_t v2 = sub_2415EEB30;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415EEB30()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (*(unsigned char *)(v1 + 24) == 1)
  {
    uint64_t v2 = self;
    uint64_t v3 = (void *)sub_241632148();
    objc_msgSend(v2, sel_setTachycardiaThresholdHeartRate_, v3);

    uint64_t v1 = *(void *)(v0 + 56);
  }
  if (*(unsigned char *)(v1 + 48) == 1)
  {
    sub_2411B6854((void *)(v1 + 312), *(void *)(v1 + 336));
    sub_241421A94();
    uint64_t v1 = *(void *)(v0 + 56);
  }
  if (*(unsigned char *)(v1 + 49) == 1)
  {
    sub_2411B6854((void *)(v1 + 312), *(void *)(v1 + 336));
    sub_241421E84();
    uint64_t v1 = *(void *)(v0 + 56);
  }
  if (*(unsigned char *)(v1 + 50) == 1)
  {
    sub_24162C728();
    objc_msgSend(*(id *)(v1 + 88), sel_onboardToPregnancyRecommendedSettings);
  }
  sub_2415F01E8(*(void **)(v0 + 40), *(void **)(v0 + 48));
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2415EEC68()
{
  uint64_t v29 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = (void *)v0[13];
  sub_24162EF48();
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_24162EF98();
  os_log_type_t v6 = sub_2416322C8();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (void *)v0[13];
    uint64_t v25 = v0[10];
    uint64_t v8 = v0[8];
    uint64_t v26 = v0[9];
    uint64_t v27 = v0[11];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v28 = v24;
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[2] = v8;
    swift_getMetatypeMetadata();
    uint64_t v11 = sub_241631D78();
    v0[3] = sub_2411B6898(v11, v12, &v28);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v7;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v14;
    sub_241632C28();
    *uint64_t v10 = v14;

    _os_log_impl(&dword_24118E000, v5, v6, "[%s] Unable to update Medical ID error: %@", (uint8_t *)v9, 0x16u);
    sub_2411A868C(0, (unint64_t *)&qword_26B0121E0, (unint64_t *)&qword_26B012200);
    swift_arrayDestroy();
    MEMORY[0x245621640](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x245621640](v24, -1, -1);
    MEMORY[0x245621640](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    id v15 = (void *)v0[13];
    uint64_t v17 = v1[10];
    uint64_t v16 = v1[11];
    uint64_t v18 = v1[9];

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  *(unsigned char *)(v1[7] + 51) = 0;
  uint64_t v19 = v1[7];
  if (*(unsigned char *)(v19 + 24))
  {
    os_signpost_id_t v20 = self;
    uint64_t v21 = (void *)sub_241632148();
    objc_msgSend(v20, sel_setTachycardiaThresholdHeartRate_, v21);

    uint64_t v19 = v1[7];
  }
  if (*(unsigned char *)(v19 + 48) == 1)
  {
    sub_2411B6854((void *)(v19 + 312), *(void *)(v19 + 336));
    sub_241421A94();
    uint64_t v19 = v1[7];
  }
  if (*(unsigned char *)(v19 + 49) == 1)
  {
    sub_2411B6854((void *)(v19 + 312), *(void *)(v19 + 336));
    sub_241421E84();
    uint64_t v19 = v1[7];
  }
  if (*(unsigned char *)(v19 + 50) == 1)
  {
    sub_24162C728();
    objc_msgSend(*(id *)(v19 + 88), sel_onboardToPregnancyRecommendedSettings);
  }
  sub_2415F01E8((void *)v1[5], (void *)v1[6]);
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v1[1];
  return v22();
}

id sub_2415EF004(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 360), sel_dismissViewControllerAnimated_completion_, 1, 0);
  id v3 = *(void (**)(uint64_t))(a1 + 400);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    return (id)sub_2411F4090((uint64_t)v3);
  }
  return result;
}

uint64_t sub_2415EF088()
{
  v1[17] = v0;
  v1[18] = *v0;
  uint64_t v2 = sub_24162EFA8();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2415EF170, 0, 0);
}

uint64_t sub_2415EF170()
{
  uint64_t v1 = *(void **)(v0[17] + 232);
  if (objc_msgSend(v1, sel_isAnyOnboardingVersionCompleted))
  {
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    uint64_t v4 = *(void **)(v0[17] + 304);
    uint64_t v5 = v4[5];
    uint64_t v6 = v4[6];
    uint64_t v7 = v4[7];
    id v8 = objc_allocWithZone(MEMORY[0x263F45198]);
    sub_2411B9D00(0, (unint64_t *)&qword_26B012390);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v9 = (void *)sub_241631F18();
    swift_bridgeObjectRelease();
    uint64_t v10 = (void *)sub_241631F18();
    swift_bridgeObjectRelease();
    LODWORD(v13) = 0;
    id v11 = objc_msgSend(v8, sel_initWithUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_menstruationProjectionsEnabled_fertileWindowProjectionsEnabled_deviationDetectionEnabled_fertilityTrackingDisplayTypesVisible_sexualActivityDisplayTypeVisible_heartRateInputSupportedCountryCode_deviationDetectionSupportedCountryCode_wristTemperatureInputSupportedCountryCode_heartRateInputEnabled_wristTemperatureInputEnabled_, 0, 0, 0, v9, v10, 0, v13, v5, v6, v7, 0, 0);
    v0[22] = v11;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    v0[2] = v0;
    v0[7] = v0 + 24;
    v0[3] = sub_2415EF3F0;
    uint64_t v12 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_2415E8460;
    v0[13] = &unk_2650E80E0;
    v0[14] = v12;
    objc_msgSend(v1, sel_setOnboardingCompletedWithInfo_completion_, v11);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
}

uint64_t sub_2415EF3F0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_2415EF70C;
  }
  else {
    uint64_t v2 = sub_2415EF500;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415EF500()
{
  uint64_t v19 = v0;
  uint64_t v1 = v0;
  sub_24162EF48();
  uint64_t v2 = sub_24162EF98();
  os_log_type_t v3 = sub_2416322E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[20];
    uint64_t v5 = v0[18];
    uint64_t v16 = v0[19];
    uint64_t v17 = v0[21];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v18 = v7;
    v0[15] = v5;
    swift_getMetatypeMetadata();
    uint64_t v8 = sub_241631D78();
    v0[16] = sub_2411B6898(v8, v9, &v18);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v2, v3, "[%s] Saved partial CT onboarding record and set needCycleTrackingEducation to true", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v7, -1, -1);
    MEMORY[0x245621640](v6, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v17, v16);
  }
  else
  {
    uint64_t v11 = v0[20];
    uint64_t v10 = v0[21];
    uint64_t v12 = v1[19];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  uint64_t v13 = (void *)v1[22];
  sub_2411B6854((void *)(v1[17] + 256), *(void *)(v1[17] + 280));
  sub_24159A6D0(1);

  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v1[1];
  return v14();
}

uint64_t sub_2415EF70C()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2415EF788()
{
  v1[24] = v0;
  v1[25] = *v0;
  uint64_t v2 = sub_24162EFA8();
  v1[26] = v2;
  v1[27] = *(void *)(v2 - 8);
  v1[28] = swift_task_alloc();
  uint64_t v3 = sub_24162B718();
  v1[29] = v3;
  v1[30] = *(void *)(v3 - 8);
  v1[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2415EF8CC, 0, 0);
}

uint64_t sub_2415EF8CC()
{
  uint64_t v1 = v0[24];
  if (*(unsigned char *)(v1 + 51) == 1)
  {
    uint64_t v2 = *(void *)(v1 + 248);
    v0[32] = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[33] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2415EF9D4;
    v3[17] = v2;
    return MEMORY[0x270FA2498](sub_2415E9140, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_2415EF9D4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 272) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2415EFB1C, 0, 0);
  }
}

uint64_t sub_2415EFB1C()
{
  uint64_t v32 = v0;
  uint64_t v1 = v0;
  if (v0[34])
  {
    uint64_t v28 = v0 + 2;
    uint64_t v29 = v0 + 36;
    uint64_t v2 = v0[31];
    id v30 = (id)v0[32];
    uint64_t v4 = v0[29];
    uint64_t v3 = v0[30];
    uint64_t v27 = v0[24];
    uint64_t v5 = *(void *)(v27 + 16);
    id v26 = (id)v0[34];
    swift_getKeyPath();
    v0[22] = v5;
    sub_2415F3824((unint64_t *)&qword_268CFA8A0, (void (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel);
    swift_retain();
    sub_24162BB48();
    swift_release();
    uint64_t v6 = v5 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin28PregnancyDatesInputViewModel__pregnancyStartDate;
    swift_beginAccess();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v25(v2, v6, v4);
    swift_release();
    uint64_t v7 = (void *)sub_24162B668();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v8(v2, v4);
    objc_msgSend(v26, sel_setPregnancyStartDate_, v7);

    uint64_t v9 = *(void *)(v27 + 16);
    swift_getKeyPath();
    v1[21] = v9;
    swift_retain();
    sub_24162BB48();
    swift_release();
    uint64_t v10 = v9 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin28PregnancyDatesInputViewModel__estimatedDueDate;
    swift_beginAccess();
    v25(v2, v10, v4);
    swift_release();
    uint64_t v11 = (void *)sub_24162B668();
    v8(v2, v4);
    objc_msgSend(v26, sel_setPregnancyEstimatedDueDate_, v11);

    v1[2] = v1;
    v1[7] = v29;
    v1[3] = sub_2415EFFDC;
    uint64_t v12 = swift_continuation_init();
    v1[10] = MEMORY[0x263EF8330];
    v1[11] = 0x40000000;
    v1[12] = sub_2415E8460;
    v1[13] = &unk_2650E80C8;
    v1[14] = v12;
    objc_msgSend(v30, sel_updateMedicalIDData_completion_, v26);
    return MEMORY[0x270FA23F0](v28);
  }
  else
  {
    sub_24162EF48();
    uint64_t v13 = sub_24162EF98();
    os_log_type_t v14 = sub_2416322C8();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v17 = v0[27];
    uint64_t v16 = v0[28];
    uint64_t v18 = v0[26];
    if (v15)
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v31 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v21 = sub_2416333E8();
      v1[23] = sub_2411B6898(v21, v22, &v31);
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v13, v14, "[%s] Medical ID came back nil. Failed to update Medical ID.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245621640](v20, -1, -1);
      MEMORY[0x245621640](v19, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v1[1];
    return v23();
  }
}

uint64_t sub_2415EFFDC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 280) = v1;
  if (v1) {
    uint64_t v2 = sub_2415F0164;
  }
  else {
    uint64_t v2 = sub_2415F00EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415F00EC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2415F0164()
{
  uint64_t v1 = *(void **)(v0 + 272);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_2415F01E8(void *a1, void *a2)
{
  uint64_t v5 = *v2;
  sub_2411AD0C4(0, &qword_26B0130C0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v73 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v74 = (uint64_t)&v68 - v9;
  MEMORY[0x270FA5388](v10);
  long long v75 = (char *)&v68 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v80 = (uint64_t)&v68 - v13;
  uint64_t v14 = sub_24162B788();
  uint64_t v71 = *(void *)(v14 - 8);
  uint64_t v72 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v79 = (uint64_t)&v68 - v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v68 - v20;
  uint64_t v77 = sub_24162EFA8();
  uint64_t v22 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v24 = (char *)&v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  id v25 = a1;
  id v26 = sub_24162EF98();
  os_log_type_t v27 = sub_2416322E8();
  BOOL v28 = os_log_type_enabled(v26, v27);
  long long v76 = v5;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    id v81 = v25;
    uint64_t v30 = v29;
    uint64_t v69 = swift_slowAlloc();
    v83[0] = v69;
    *(_DWORD *)uint64_t v30 = 136315394;
    aBlock[0] = v5;
    swift_getMetatypeMetadata();
    unint64_t v70 = v16;
    uint64_t v31 = sub_241631D78();
    aBlock[0] = (id)sub_2411B6898(v31, v32, v83);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    id v33 = objc_msgSend(v81, sel_UUID, v30 + 14);
    sub_24162B768();

    uint64_t v34 = sub_24162B738();
    uint64_t v35 = a2;
    unint64_t v37 = v36;
    (*(void (**)(char *, uint64_t))(v71 + 8))(v21, v72);
    aBlock[0] = (id)sub_2411B6898(v34, v37, v83);
    uint64_t v16 = v70;
    sub_241632C28();

    a2 = v35;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v26, v27, "[%s] Saving setup record for sample UUID: %s", (uint8_t *)v30, 0x16u);
    uint64_t v38 = v69;
    swift_arrayDestroy();
    MEMORY[0x245621640](v38, -1, -1);
    uint64_t v39 = v30;
    id v25 = v81;
    MEMORY[0x245621640](v39, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v77);
  id v40 = objc_msgSend(self, sel_sharedBehavior);
  uint64_t v41 = v78;
  if (v40)
  {
    uint64_t v42 = v40;
    unsigned __int8 v43 = objc_msgSend(v40, sel_isiPad);

    v83[0] = MEMORY[0x263F8EE88];
    if (*(unsigned char *)(v41 + 48) == 1)
    {
      sub_2414A26F0(aBlock, (id)*MEMORY[0x263F450D8]);
    }
    if (*(unsigned char *)(v41 + 51) == 1)
    {
      sub_2414A26F0(aBlock, (id)*MEMORY[0x263F450E0]);
    }
    uint64_t v44 = swift_allocObject();
    if (a2)
    {
      id v45 = a2;
      id v46 = objc_msgSend(v45, sel_version);
      id v47 = objc_msgSend(v45, sel_sampleUUID);
      sub_24162B768();

      uint64_t v48 = v80;
      sub_24162B708();
      uint64_t v49 = sub_24162B718();
      uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56);
      uint64_t v51 = 1;
      v50(v48, 0, 1, v49);
      if ((v43 & 1) == 0)
      {
        sub_24162B708();
        uint64_t v51 = 0;
      }
      uint64_t v52 = (uint64_t)v75;
      v50((uint64_t)v75, v51, 1, v49);
      id v53 = objc_msgSend(v45, sel_postPregnancyFeatureAdjustmentCompletionLog);
      type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
      sub_2415F3824((unint64_t *)&unk_268D00F40, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
      sub_241631B38();

      id v54 = objc_allocWithZone(MEMORY[0x263F451A8]);
      id v55 = sub_2415F39B8((uint64_t)v46, v79, v80, v52);
    }
    else
    {
      id v46 = objc_msgSend(self, sel_currentVersion);
      id v56 = objc_msgSend(v25, sel_UUID);
      sub_24162B768();

      uint64_t v57 = v74;
      sub_24162B708();
      uint64_t v58 = sub_24162B718();
      CGRect v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56);
      uint64_t v60 = 1;
      v59(v57, 0, 1, v58);
      if ((v43 & 1) == 0)
      {
        sub_24162B708();
        uint64_t v60 = 0;
      }
      uint64_t v61 = (uint64_t)v73;
      v59((uint64_t)v73, v60, 1, v58);
      sub_2414E5598(MEMORY[0x263F8EE78]);
      id v62 = objc_allocWithZone(MEMORY[0x263F451A8]);
      id v55 = sub_2415F39B8((uint64_t)v46, (uint64_t)v16, v74, v61);
    }

    *(void *)(v44 + 16) = v55;
    int v63 = *(void **)(v41 + 136);
    uint64_t v64 = (void *)swift_allocObject();
    uint64_t v65 = v76;
    v64[2] = v44;
    void v64[3] = v65;
    aBlock[4] = sub_2415F3C08;
    aBlock[5] = v64;
    aBlock[0] = (id)MEMORY[0x263EF8330];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_241328D44;
    aBlock[3] = &unk_26F579058;
    int v66 = _Block_copy(aBlock);
    id v67 = v55;
    swift_retain();
    swift_release();
    objc_msgSend(v63, sel_persistSetupRecord_completion_, v67, v66);
    _Block_release(v66);
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2415F0AB8(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24162EFA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v39 - v13;
  if (a1)
  {
    sub_24162EF48();
    swift_retain_n();
    uint64_t v15 = sub_24162EF98();
    os_log_type_t v16 = sub_2416322E8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v42 = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v41 = a4;
      swift_getMetatypeMetadata();
      uint64_t v19 = sub_241631D78();
      uint64_t v41 = sub_2411B6898(v19, v20, &v42);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_beginAccess();
      uint64_t v39 = v8;
      uint64_t v40 = *(void *)(a3 + 16);
      uint64_t v21 = (void *)v40;
      sub_2411B9D00(0, (unint64_t *)&unk_26B011350);
      id v22 = v21;
      uint64_t v23 = sub_241631D78();
      uint64_t v40 = sub_2411B6898(v23, v24, &v42);
      sub_241632C28();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v15, v16, "[%s] Successfully saved new setup record %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245621640](v18, -1, -1);
      MEMORY[0x245621640](v17, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v39);
    }

    swift_release_n();
    unint64_t v37 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    uint64_t v38 = v14;
  }
  else
  {
    sub_24162EF48();
    id v26 = a2;
    id v27 = a2;
    BOOL v28 = sub_24162EF98();
    os_log_type_t v29 = sub_2416322C8();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v42 = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v41 = a4;
      swift_getMetatypeMetadata();
      uint64_t v39 = v8;
      uint64_t v32 = sub_241631D78();
      uint64_t v41 = sub_2411B6898(v32, v33, &v42);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      uint64_t v41 = (uint64_t)a2;
      id v34 = a2;
      sub_2411AD0C4(0, (unint64_t *)&qword_26B010860, (uint64_t (*)(uint64_t))sub_2411CE834, MEMORY[0x263F8D8F0]);
      uint64_t v35 = sub_241631D48();
      uint64_t v41 = sub_2411B6898(v35, v36, &v42);
      sub_241632C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24118E000, v28, v29, "[%s] Error saving setup record: %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245621640](v31, -1, -1);
      MEMORY[0x245621640](v30, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v39);
    }

    unint64_t v37 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    uint64_t v38 = v11;
  }
  return v37(v38, v8);
}

uint64_t sub_2415F0F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[20] = a4;
  v5[21] = a5;
  uint64_t v6 = sub_24162EFA8();
  v5[22] = v6;
  v5[23] = *(void *)(v6 - 8);
  v5[24] = swift_task_alloc();
  v5[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2415F1038, 0, 0);
}

uint64_t sub_2415F1038()
{
  uint64_t v19 = v0;
  sub_24162EF48();
  uint64_t v1 = sub_24162EF98();
  os_log_type_t v2 = sub_2416322E8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[23];
    uint64_t v16 = v0[22];
    uint64_t v17 = v0[25];
    uint64_t v4 = v0[21];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v18 = v6;
    v0[15] = v4;
    swift_getMetatypeMetadata();
    uint64_t v7 = sub_241631D78();
    v0[19] = sub_2411B6898(v7, v8, &v18);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v1, v2, "[%s] Triggering nanosync", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v6, -1, -1);
    MEMORY[0x245621640](v5, -1, -1);

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v9(v17, v16);
  }
  else
  {
    uint64_t v10 = v0[25];
    uint64_t v11 = v0[22];
    uint64_t v12 = v0[23];

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v9(v10, v11);
  }
  v0[26] = v9;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A558]), sel_initWithHealthStore_, *(void *)(v0[20] + 144));
  v0[27] = v13;
  v0[2] = v0;
  v0[3] = sub_2415F12D4;
  uint64_t v14 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2415E9080;
  v0[13] = &unk_2650E8098;
  v0[14] = v14;
  objc_msgSend(v13, sel_forceNanoSyncWithOptions_completion_, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2415F12D4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    os_log_type_t v2 = sub_2415F1454;
  }
  else {
    os_log_type_t v2 = sub_2415F13E4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415F13E4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2415F1454()
{
  BOOL v28 = v0;
  uint64_t v1 = v0;
  uint64_t v4 = v0 + 27;
  uint64_t v3 = (void *)v0[27];
  os_log_type_t v2 = (void *)v4[1];
  swift_willThrow();

  sub_24162EF48();
  id v5 = v2;
  id v6 = v2;
  uint64_t v7 = sub_24162EF98();
  os_log_type_t v8 = sub_2416322C8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (void *)v1[28];
    uint64_t v25 = v1[24];
    id v26 = (void (*)(uint64_t, uint64_t))v1[26];
    uint64_t v10 = v1[21];
    uint64_t v24 = v1[22];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v11 = 136315394;
    v1[16] = v10;
    swift_getMetatypeMetadata();
    uint64_t v13 = sub_241631D78();
    v1[17] = sub_2411B6898(v13, v14, &v27);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2112;
    id v15 = v9;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v1[18] = v16;
    sub_241632C28();
    *uint64_t v12 = v16;

    _os_log_impl(&dword_24118E000, v7, v8, "[%s] Unable to trigger nanosync with error: %@", (uint8_t *)v11, 0x16u);
    sub_2411A868C(0, (unint64_t *)&qword_26B0121E0, (unint64_t *)&qword_26B012200);
    swift_arrayDestroy();
    MEMORY[0x245621640](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x245621640](v23, -1, -1);
    MEMORY[0x245621640](v11, -1, -1);

    v26(v25, v24);
  }
  else
  {
    uint64_t v17 = (void *)v1[28];
    uint64_t v18 = (void (*)(uint64_t, uint64_t))v1[26];
    uint64_t v19 = v1[24];
    uint64_t v20 = v1[22];

    v18(v19, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v1[1];
  return v21();
}

uint64_t sub_2415F1738()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_2411E333C(*(void **)(v0 + 56), *(void **)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();

  sub_2415F3D94(v0 + 96);
  swift_unknownObjectRelease();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 152);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 192);

  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 256);

  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 312);

  swift_unknownObjectRelease();
  sub_2411F4090(*(void *)(v0 + 400));
  sub_2411F4090(*(void *)(v0 + 416));
  sub_2411F4090(*(void *)(v0 + 432));
  uint64_t v1 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30PregnancyOnboardingCoordinator_signposter;
  uint64_t v2 = sub_24162EEA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_2415F1874()
{
  sub_2415F1738();

  return swift_deallocClassInstance();
}

uint64_t sub_2415F18CC()
{
  return type metadata accessor for PregnancyOnboardingCoordinator();
}

uint64_t type metadata accessor for PregnancyOnboardingCoordinator()
{
  uint64_t result = qword_268D04198;
  if (!qword_268D04198) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2415F1920()
{
  uint64_t result = sub_24162EEA8();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_2415F1A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2415F1A64, 0, 0);
}

uint64_t sub_2415F1A64()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 248);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2415F1B14;
  v2[17] = v1;
  return MEMORY[0x270FA2498](sub_2415E9140, 0, 0);
}

uint64_t sub_2415F1B14(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    id v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x270FA2498](sub_2415F1C60, 0, 0);
  }
}

uint64_t sub_2415F1C60()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = *(void **)(v1 + 296);
  *(void *)(v1 + 296) = v0[4];

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2415F1CD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24162EFA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411B6854(v0 + 39, v0[42]);
  unsigned int v7 = sub_241422098();
  int v8 = sub_24162C718();
  unsigned int v9 = v8 & objc_msgSend((id)v1[11], sel_periodicPromptedAssessmentNotificationsEnabled);
  sub_24162EF48();
  uint64_t v10 = sub_24162EF98();
  os_log_type_t v11 = sub_2416322E8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    unsigned int v21 = v7;
    uint64_t v14 = v13;
    uint64_t v22 = v13;
    uint64_t v23 = v2;
    *(_DWORD *)uint64_t v12 = 136446722;
    swift_getMetatypeMetadata();
    uint64_t v15 = sub_241631D78();
    uint64_t v23 = sub_2411B6898(v15, v16, &v22);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 1024;
    LODWORD(v23) = v21 & 1;
    sub_241632C28();
    *(_WORD *)(v12 + 18) = 1024;
    int v17 = v9 ^ 1;
    LODWORD(v23) = v17;
    sub_241632C28();
    _os_log_impl(&dword_24118E000, v10, v11, "[%{public}s] Determining if we should show mental health settings: feature availability:(%{BOOL}d) shouldShowSetting:(%{BOOL}d)", (uint8_t *)v12, 0x18u);
    swift_arrayDestroy();
    uint64_t v18 = v14;
    unsigned int v7 = v21;
    MEMORY[0x245621640](v18, -1, -1);
    MEMORY[0x245621640](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    int v17 = v9 ^ 1;
  }
  return v7 & v17;
}

void sub_2415F1F8C()
{
  sub_2415E9CF4(11, 0);
  sub_2415E9CF4(11, 0);
  id v1 = sub_2415EAC90(11);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(*(id *)(v0 + 360), sel_showViewController_sender_, v1, v0);
  }
  uint64_t v3 = *(void (**)(uint64_t))(v0 + 432);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_2411F4090((uint64_t)v3);
  }
}

void sub_2415F202C()
{
}

void sub_2415F2050(void *a1)
{
  uint64_t v2 = v1;
  id v21 = a1;
  uint64_t v3 = sub_24162EFA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (HKShowSensitiveLogItems())
  {
    sub_24162EF48();
    unsigned int v7 = sub_24162EF98();
    os_log_type_t v8 = sub_2416322E8();
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v23 = v10;
      *(_DWORD *)unsigned int v9 = 136315138;
      uint64_t v20 = v9 + 4;
      uint64_t v11 = sub_2416333E8();
      uint64_t v22 = sub_2411B6898(v11, v12, &v23);
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v7, v8, "[%s] Received pregnancy model update", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245621640](v10, -1, -1);
      MEMORY[0x245621640](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v13 = *(void **)(v2 + 384);
  if (v13)
  {
    sub_2411B9D00(0, &qword_26B00ED70);
    id v14 = v21;
    id v15 = v13;
    char v16 = sub_2416329B8();

    if (v16) {
      return;
    }
    int v17 = *(void **)(v2 + 384);
  }
  else
  {
    int v17 = 0;
  }
  *(void *)(v2 + 384) = v21;

  id v18 = v21;

  id v19 = v18;
}

void destroy for PregnancyOnboardingCoordinator.FlowPresentationMode(uint64_t a1)
{
}

uint64_t _s24MenstrualCyclesAppPlugin30PregnancyOnboardingCoordinatorC20FlowPresentationModeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2413F04DC(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PregnancyOnboardingCoordinator.FlowPresentationMode(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2413F04DC(*(id *)a2, v4, v5);
  id v6 = *(void **)a1;
  unsigned int v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2411E333C(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for PregnancyOnboardingCoordinator.FlowPresentationMode(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2411E333C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PregnancyOnboardingCoordinator.FlowPresentationMode(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PregnancyOnboardingCoordinator.FlowPresentationMode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2415F24DC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_2415F24F4(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)uint64_t result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PregnancyOnboardingCoordinator.FlowPresentationMode()
{
  return &type metadata for PregnancyOnboardingCoordinator.FlowPresentationMode;
}

uint64_t sub_2415F251C(char a1, void *a2, uint64_t a3, const char *a4)
{
  uint64_t v8 = sub_24162EFA8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_24162EF48();
    id v13 = a2;
    id v14 = a2;
    id v15 = sub_24162EF98();
    os_log_type_t v16 = sub_2416322C8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      id v26 = a4;
      uint64_t v18 = v17;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v27 = v19;
      uint64_t v28 = a3;
      *(_DWORD *)uint64_t v18 = 136315394;
      swift_getMetatypeMetadata();
      uint64_t v20 = sub_241631D78();
      uint64_t v28 = sub_2411B6898(v20, v21, &v27);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v28 = (uint64_t)a2;
      id v22 = a2;
      sub_2411AD0C4(0, (unint64_t *)&qword_26B010860, (uint64_t (*)(uint64_t))sub_2411CE834, MEMORY[0x263F8D8F0]);
      uint64_t v23 = sub_241631D48();
      uint64_t v28 = sub_2411B6898(v23, v24, &v27);
      sub_241632C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24118E000, v15, v16, v26, (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245621640](v19, -1, -1);
      MEMORY[0x245621640](v18, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return result;
}

uint64_t sub_2415F27C4(void *a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    sub_2411CE834();
    uint64_t v5 = swift_allocError();
    *char v6 = a2;
    id v7 = a2;
    return MEMORY[0x270FA2410](a3, v5);
  }
  else
  {
    uint64_t v11 = a1;
    uint64_t v8 = *(void *)(*(void *)(a3 + 64) + 40);
    id v9 = a1;
    sub_2415F28A0((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2415F2888()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2415F2898(void *a1, void *a2)
{
  return sub_2415F27C4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2415F28A0(uint64_t a1, uint64_t a2)
{
  sub_2411A868C(0, &qword_268D041B0, &qword_26B011C98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2415F291C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2415F292C(char a1, void *a2)
{
  return sub_2415F251C(a1, a2, *(void *)(v2 + 16), "[%s] Error submitting analytics event: %s");
}

uint64_t sub_2415F2950()
{
  return sub_2415F3874(40);
}

uint64_t sub_2415F2958()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unsigned int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unsigned int v3 = v1;
  v3[1] = sub_241201428;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2415F1A64, 0, 0);
}

id sub_2415F2A00(uint64_t a1, unsigned char *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_24162B7E8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v27 = sub_241631CA8();
  uint64_t v5 = *(void *)(v27 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v27);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v26 - v9;
  v30[3] = type metadata accessor for PregnancyOnboardingCoordinator();
  v30[4] = &off_26F578CF8;
  v30[0] = a1;
  *(void *)&a2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_currentStepCount] = 0;
  a2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_animatingStep] = 0;
  uint64_t v11 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_stepLabel;
  unint64_t v12 = a2;
  *(void *)&a2[v11] = sub_2414EABEC();
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_footerButton] = 0;
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController____lazy_storage___cycleTimelineViewController] = 0;
  uint64_t v13 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_calendarCache;
  *(void *)&v12[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A130]), sel_init);
  id v14 = &v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_infoViews];
  uint64_t v15 = MEMORY[0x263F8EE78];
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_infoViews] = MEMORY[0x263F8EE78];
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_infoViewBottomConstraints] = v15;
  sub_2411A3DF4((uint64_t)v30, (uint64_t)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_tutorialProvider]);
  uint64_t v16 = byte_26F566320;
  v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_currentStep] = byte_26F566320;
  sub_241324098(byte_26F566320);
  uint64_t v17 = swift_beginAccess();
  MEMORY[0x24561F3D0](v17);
  if (*(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_241631F68();
  }
  sub_241631F98();
  sub_241631F48();
  swift_endAccess();
  sub_241324098(byte_26F566321);
  uint64_t v18 = swift_beginAccess();
  MEMORY[0x24561F3D0](v18);
  if (*(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_241631F68();
  }
  sub_241631F98();
  sub_241631F48();
  swift_endAccess();
  sub_241324098(byte_26F566322);
  uint64_t v19 = swift_beginAccess();
  MEMORY[0x24561F3D0](v19);
  if (*(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_241631F68();
  }
  sub_241631F98();
  sub_241631F48();
  swift_endAccess();
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_timelineSteps] = &unk_26F566300;
  uint64_t v20 = *(void **)&v12[v13];
  type metadata accessor for OnboardingCycleLoggingDataProvider();
  swift_allocObject();
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_cycleTimelineDataProvider] = sub_2415C3A64(v20, v16);

  sub_241631C38();
  uint64_t v21 = v27;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v27);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v21);
  uint64_t v23 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  v29.receiver = v12;
  v29.super_class = ObjectType;
  id v24 = objc_msgSendSuper2(&v29, sel_initWithTitle_detailText_symbolName_contentLayout_, v23, 0, 0, 2);

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v30);
  return v24;
}

uint64_t sub_2415F2EB4(uint64_t a1, unsigned char *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_24162B7E8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v32 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_241631CA8();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v34 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v31 = (char *)&v29 - v9;
  v39[3] = type metadata accessor for MenstrualCyclesOnboardingCoordinator();
  CGFloat v39[4] = &off_26F56F360;
  v39[0] = a1;
  *(void *)&a2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_currentStepCount] = 0;
  a2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_animatingStep] = 0;
  uint64_t v10 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_stepLabel;
  uint64_t v11 = a2;
  *(void *)&a2[v10] = sub_2414EABEC();
  *(void *)&v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_footerButton] = 0;
  *(void *)&v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController____lazy_storage___cycleTimelineViewController] = 0;
  uint64_t v12 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_calendarCache;
  *(void *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A130]), sel_init);
  uint64_t v13 = &v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_infoViews];
  uint64_t v14 = MEMORY[0x263F8EE78];
  *(void *)&v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_infoViews] = MEMORY[0x263F8EE78];
  *(void *)&v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_infoViewBottomConstraints] = v14;
  sub_2411A3DF4((uint64_t)v39, (uint64_t)&v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_tutorialProvider]);
  uint64_t v15 = sub_241335A00();
  uint64_t v16 = v15;
  uint64_t v17 = *((void *)v15 + 2);
  if (v17)
  {
    uint64_t v18 = v15[32];
    v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_currentStep] = v18;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v19 = 0;
    do
    {
      sub_241324098(v16[v19 + 32]);
      uint64_t v20 = swift_beginAccess();
      MEMORY[0x24561F3D0](v20);
      if (*(void *)((*v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_241631F68();
      }
      ++v19;
      sub_241631F98();
      sub_241631F48();
      swift_endAccess();
    }
    while (v17 != v19);
    swift_bridgeObjectRelease();
    *(void *)&v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_timelineSteps] = v16;
    uint64_t v21 = *(void **)&v11[v12];
    type metadata accessor for OnboardingCycleLoggingDataProvider();
    swift_allocObject();
    *(void *)&v11[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_cycleTimelineDataProvider] = sub_2415C3A64(v21, v18);

    id v22 = v31;
    sub_241631C38();
    uint64_t v24 = v33;
    uint64_t v23 = v34;
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v22, v34);
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    id v25 = (id)qword_26B0181A0;
    sub_24162B7D8();
    sub_241631D38();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
    uint64_t v26 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
    v36.receiver = v11;
    v36.super_class = ObjectType;
    id v27 = objc_msgSendSuper2(&v36, sel_initWithTitle_detailText_symbolName_contentLayout_, v26, 0, 0, 2);

    _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v39);
    return (uint64_t)v27;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    sub_241632E78();
    sub_241631E08();
    sub_2416333E8();
    sub_241631E08();
    swift_bridgeObjectRelease();
    sub_241631E08();
    uint64_t result = sub_241633038();
    __break(1u);
  }
  return result;
}

uint64_t sub_2415F3398(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2411AD0C4(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2415F3408(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2415F3470(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2415F34D8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2415F34E8(char a1, void *a2)
{
  return sub_2415F251C(a1, a2, *(void *)(v2 + 16), "[%s] Failed to submit onboarding analytics event with error: %s");
}

uint64_t sub_2415F350C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2415F356C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2415F35A4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_2415F35DC(char a1, char a2)
{
  return sub_2415EA494(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24));
}

uint64_t sub_2415F3600(uint64_t a1)
{
  return sub_2415EC320(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void (**)(BOOL, uint64_t))(v1 + 32));
}

uint64_t sub_2415F3614(uint64_t a1)
{
  return sub_2412D1FE8(a1, v1 + 16, *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_2415F3620()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2415F3658(void *a1)
{
  return sub_2412D1FB0(a1, *(uint64_t (**)(id))(v1 + 16));
}

uint64_t sub_2415F3664()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2415F36A4(uint64_t a1)
{
  return sub_2415EC27C(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void (**)(BOOL, uint64_t))(v1 + 32));
}

uint64_t sub_2415F36B8()
{
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 16);
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2415F36F8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2415F3740(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_241201428;
  return sub_2415EC3C4(a1, v4, v5, v6, v7, v8);
}

id sub_2415F3808()
{
  return sub_2415EF004(v0);
}

uint64_t sub_2415F3824(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2415F386C()
{
  return sub_2415F3874(48);
}

uint64_t sub_2415F3874(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2415F38C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24120151C;
  return sub_2415F0F68(a1, v4, v5, v7, v6);
}

uint64_t sub_2415F3980()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2415F39B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = (void *)sub_24162B748();
  uint64_t v6 = sub_24162B718();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  uint64_t v9 = 0;
  if (v8(a3, 1, v6) != 1)
  {
    uint64_t v9 = (void *)sub_24162B668();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  }
  if (v8(a4, 1, v6) == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (void *)sub_24162B668();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a4, v6);
  }
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_2415F3824((unint64_t *)&unk_268D00F40, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t v11 = (void *)sub_2416320E8();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v17, sel_initWithVersion_sampleUUID_educationalStepsReviewDate_configurationStepsReviewDate_pregnancyAdjustedFeaturesSet_postPregnancyFeatureAdjustmentCompletionLog_, a1, v18, v9, v10, v11, v12);

  uint64_t v14 = sub_24162B788();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a2, v14);
  return v13;
}

uint64_t sub_2415F3C08(char a1, void *a2)
{
  return sub_2415F0AB8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2415F3C18()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2415F3C70(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24120151C;
  return sub_2415EE148(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_2415F3D4C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2415F3D84(uint64_t a1, void *a2)
{
  return sub_2415EBA48(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_2415F3D8C()
{
}

uint64_t sub_2415F3D94(uint64_t a1)
{
  return a1;
}

uint64_t sub_2415F3DF0()
{
  return sub_24137DD90(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2415F3E58()
{
  return sub_2415F3DF0();
}

id sub_2415F3E74(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CycleChartCycle(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = (uint64_t)v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_cycle;
  swift_beginAccess();
  sub_2413223B8(v7, (uint64_t)v6);
  if (*a1 == *v6)
  {
    sub_2411B9D00(0, (unint64_t *)&qword_26B012200);
    if (sub_2416329B8())
    {
      sub_241631AC8();
      sub_24128B9FC();
      sub_241632C68();
      if (!v9)
      {
        sub_241632C68();
        if (!v9
          && (MEMORY[0x245618DD0]((char *)a1 + *(int *)(v4 + 32), (char *)v6 + *(int *)(v4 + 32)) & 1) != 0
          && (MEMORY[0x245618DD0]((char *)a1 + *(int *)(v4 + 36), (char *)v6 + *(int *)(v4 + 36)) & 1) != 0)
        {
          return (id)sub_2412328C4((uint64_t)v6);
        }
      }
    }
  }
  sub_2412328C4((uint64_t)v6);
  return objc_msgSend(v2, sel_setNeedsDisplay);
}

uint64_t sub_2415F4080()
{
  swift_getObjectType();
  uint64_t v1 = sub_2416333E8();
  sub_241631E08();
  swift_beginAccess();
  sub_241631A88();
  swift_endAccess();
  sub_2416331D8();
  sub_241631E08();
  swift_bridgeObjectRelease();
  return v1;
}

id sub_2415F4130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getObjectType();
  swift_release();
  sub_2413223B8(a1, (uint64_t)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_cycle]);
  uint64_t v8 = &v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_dayIndex];
  uint64_t v9 = sub_241631AC8();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a2, v9);
  *(void *)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin10CycleChart_rows] = a4;
  v17.receiver = v4;
  v17.super_class = (Class)type metadata accessor for CycleChart();
  id v11 = objc_msgSendSuper2(&v17, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2411B9D00(0, (unint64_t *)&qword_268CFDCF0);
  id v12 = v11;
  sub_2416325D8();
  sub_241632918();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  id v13 = self;
  id v14 = v12;
  id v15 = objc_msgSend(v13, sel_systemBackgroundColor);
  objc_msgSend(v14, sel_setBackgroundColor_, v15);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  sub_2412328C4(a1);
  return v14;
}

void sub_2415F437C(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_24162EFA8();
  unint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_241631AC8();
  uint64_t v15 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v60 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for CycleChartCycle(0);
  MEMORY[0x270FA5388](v17 - 8);
  CGRect v59 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70.receiver = v5;
  v70.super_class = ObjectType;
  objc_msgSendSuper2(&v70, sel_drawRect_, a1, a2, a3, a4);
  uint64_t v19 = UIGraphicsGetCurrentContext();
  if (v19)
  {
    uint64_t v20 = v19;
    objc_msgSend(v5, sel_bounds);
    uint64_t v58 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin10CycleChart_rows;
    uint64_t v57 = *(void *)(*(void *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin10CycleChart_rows] + 16);
    if (v57)
    {
      double v24 = v21;
      double MaxY = v22;
      double v26 = v23;
      id v27 = &v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_dayIndex];
      id v56 = &v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_cycle];
      swift_beginAccess();
      id v55 = v27;
      swift_beginAccess();
      unint64_t v28 = 0;
      id v54 = (void (**)(char *, char *, uint64_t))(v15 + 16);
      id v53 = (void (**)(char *, uint64_t))(v15 + 8);
      double v29 = 0.0;
      uint64_t v30 = 32;
      id v62 = v5;
      uint64_t v31 = (uint64_t)v59;
      uint64_t v32 = v60;
      uint64_t v33 = v61;
      while (1)
      {
        uint64_t v34 = *(void *)&v5[v58];
        unint64_t v35 = *(void *)(v34 + 16);
        if (v28 >= v35) {
          break;
        }
        sub_2411A3DF4(v34 + v30, (uint64_t)v64);
        unint64_t v63 = v35 - 1;
        CGContextSaveGState(v20);
        v71.origin.CGFloat x = v24;
        v71.origin.CGFloat y = MaxY;
        v71.size.CGFloat width = v26;
        v71.size.CGFloat height = v29;
        double MaxY = CGRectGetMaxY(v71);
        uint64_t v37 = v65;
        uint64_t v36 = v66;
        sub_2411B6854(v64, v65);
        double v29 = (*(double (**)(uint64_t))(*(void *)(v36 + 8) + 72))(v37);
        uint64_t v39 = v65;
        uint64_t v38 = v66;
        sub_2411B6854(v64, v65);
        sub_2413223B8((uint64_t)v56, v31);
        (*v54)(v32, v55, v33);
        id v40 = objc_msgSend(v5, sel_traitCollection);
        (*(void (**)(CGContext *, uint64_t, char *, id, uint64_t, double, double, double, double))(*(void *)(v38 + 8) + 104))(v20, v31, v32, v40, v39, v24, MaxY, v26, v29);

        (*v53)(v32, v33);
        sub_2412328C4(v31);
        CGContextRestoreGState(v20);
        CGContextSaveGState(v20);
        if (v28 != v63)
        {
          uint64_t v41 = v65;
          uint64_t v42 = v66;
          sub_2411B6854(v64, v65);
          id v43 = objc_msgSend(v62, sel_traitCollection);
          sub_2413F1CF0(v20, v43, v41, v42, v24, MaxY, v26, v29);
        }
        ++v28;
        CGContextRestoreGState(v20);
        _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v64);
        v30 += 40;
        uint64_t v5 = v62;
        if (v57 == v28) {
          goto LABEL_8;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_8:
    }
  }
  else
  {
    sub_24162EF48();
    uint64_t v44 = v5;
    id v45 = sub_24162EF98();
    os_log_type_t v46 = sub_2416322C8();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = swift_slowAlloc();
      unint64_t v63 = v12;
      uint64_t v48 = (uint8_t *)v47;
      uint64_t v49 = swift_slowAlloc();
      v67[0] = v49;
      *(_DWORD *)uint64_t v48 = 136446210;
      id v62 = (char *)(v48 + 4);
      uint64_t v68 = sub_2416333E8();
      unint64_t v69 = v50;
      sub_241631E08();
      swift_beginAccess();
      uint64_t v51 = sub_241631A88();
      swift_endAccess();
      v64[0] = v51;
      sub_2416331D8();
      sub_241631E08();
      swift_bridgeObjectRelease();
      v64[0] = sub_2411B6898(v68, v69, v67);
      sub_241632C28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v45, v46, "[%{public}s] Skipping drawing with no current context", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245621640](v49, -1, -1);
      MEMORY[0x245621640](v48, -1, -1);

      (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v11);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
}

void sub_2415F4A80()
{
}

uint64_t sub_2415F4AB0()
{
  sub_2412328C4(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_cycle);
  uint64_t v1 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_dayIndex;
  uint64_t v2 = sub_241631AC8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t sub_2415F4BAC()
{
  return type metadata accessor for CycleChartDayBackgroundView();
}

uint64_t type metadata accessor for CycleChartDayBackgroundView()
{
  uint64_t result = qword_268D04228;
  if (!qword_268D04228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2415F4C00()
{
  uint64_t result = type metadata accessor for CycleChartCycle(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_241631AC8();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_2415F4CCC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_2415FC2D4();
    uint64_t v2 = sub_2416330C8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_241205EDC(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_241205EDC(v35, v36);
    sub_241205EDC(v36, &v32);
    uint64_t result = sub_241632DF8();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_241205EDC(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2411B96D4();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2415F5074(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_24134CD3C();
    uint64_t v2 = sub_2416330C8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v3 = a1 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t v8 = v2 + 64;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v10 + 1;
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v6 = (v14 - 1) & v14;
    int64_t v10 = v15;
LABEL_28:
    uint64_t v17 = sub_241632148();
    uint64_t v18 = sub_241632148();
    uint64_t result = sub_2416329A8();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v8 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = 8 * v11;
    *(void *)(*(void *)(v2 + 48) + v12) = v17;
    *(void *)(*(void *)(v2 + 56) + v12) = v18;
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_2411B96D4();
    return v2;
  }
  uint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2415F532C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_241408A60();
    uint64_t v2 = sub_2416330C8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v29 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t result = swift_retain();
  int64_t v30 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v30 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v11);
    int64_t v13 = v30 + 1;
    if (!v12)
    {
      int64_t v13 = v30 + 2;
      if (v30 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v29 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v30 + 3;
        if (v30 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v29 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v30 + 4;
          if (v30 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v29 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v30 = v13;
LABEL_28:
    int64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v33[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    int64_t v15 = *(void **)&v33[0];
    *(void *)&v32[0] = v16;
    sub_2411B9D00(0, (unint64_t *)&qword_26B012200);
    id v17 = v15;
    id v18 = v16;
    swift_dynamicCast();
    uint64_t v19 = *(void *)&v33[0];
    sub_241205EDC((_OWORD *)((char *)v33 + 8), v31);
    sub_241205EDC(v31, v33);
    sub_241205EDC(v33, v32);
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    sub_241633308();
    sub_241631DC8();
    uint64_t v20 = sub_241633358();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v6 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v8 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v19;
    uint64_t result = (uint64_t)sub_241205EDC(v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_37:
    swift_release();
    sub_2411B96D4();
    return v2;
  }
  unint64_t v12 = *(void *)(v29 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v30 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

char *sub_2415F56DC(void *a1, char a2)
{
  v27[1] = swift_getObjectType();
  uint64_t v5 = sub_24162B718();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_viewModels] = MEMORY[0x263F8EE78];
  *(void *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_factorSubviews] = v9;
  uint64_t v10 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_noFactorsLabel;
  id v11 = objc_allocWithZone(MEMORY[0x263F828E0]);
  unint64_t v12 = v2;
  *(void *)&v2[v10] = objc_msgSend(v11, sel_init);
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView____lazy_storage___shortMonthDayYearDateFormatter] = 0;
  uint64_t v13 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_disclosureIndicator;
  sub_2411B9D00(0, (unint64_t *)&qword_268CFB650);
  id v14 = sub_24139840C();
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v14);

  id v16 = objc_msgSend(self, sel_tertiaryLabelColor);
  objc_msgSend(v15, sel_setTintColor_, v16);

  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v12[v13] = v15;
  *(void *)&v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_analysis] = a1;
  v12[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_shouldShowDisclosureIndicator] = a2;
  id v17 = a1;

  id v18 = (objc_class *)type metadata accessor for CycleFactorsSectionView();
  v28.receiver = v12;
  v28.super_class = v18;
  uint64_t v19 = (char *)objc_msgSendSuper2(&v28, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_24162B6B8();
  uint64_t v20 = sub_241293924((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)&v19[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_viewModels] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_2415F5A08(v21);
  swift_bridgeObjectRelease();
  sub_2411E58B4();
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_241637EE0;
  uint64_t v23 = sub_24162F5B8();
  uint64_t v24 = MEMORY[0x263F82018];
  *(void *)(v22 + 32) = v23;
  *(void *)(v22 + 40) = v24;
  unint64_t v25 = v19;
  sub_241632918();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v25;
}

void sub_2415F5A08(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_24162D2C8();
  uint64_t v5 = (char **)*(v4 - 1);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t)&v151 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CycleFactorsSectionViewModel(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  id v11 = (char *)&v151 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B00F370 != -1) {
    swift_once();
  }
  long long v167 = xmmword_26B017FC8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  sub_241631E08();
  unint64_t v12 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setAccessibilityIdentifier_, v12);

  if (v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_shouldShowDisclosureIndicator] == 1)
  {
    objc_msgSend(v2, sel_addSubview_, *(void *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_disclosureIndicator]);
    sub_2415F73B8();
  }
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
    sub_2415F76E8();
    return;
  }
  char v163 = (SEL *)v2;
  v164 = v5;
  id v162 = v4;
  id v14 = (uint64_t *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_factorSubviews];
  uint64_t v15 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v16 = *(void *)(v9 + 72);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  do
  {
    sub_2415FC008(v15, (uint64_t)v11);
    id v17 = objc_allocWithZone((Class)type metadata accessor for CycleFactorsSectionSingleFactorView(0));
    unint64_t v18 = (unint64_t)sub_2415F7EEC((uint64_t)v11);
    uint64_t v19 = swift_beginAccess();
    MEMORY[0x24561F3D0](v19);
    if (*(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_241631F68();
    }
    sub_241631F98();
    sub_241631F48();
    swift_endAccess();
    v15 += v16;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  uint64_t v20 = *v14;
  uint64_t v21 = v164;
  if ((unint64_t)*v14 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v22 = sub_241633068();
    uint64_t v23 = v163;
    if (!v22) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v22 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v23 = v163;
    if (!v22) {
      goto LABEL_22;
    }
  }
  if (v22 < 1)
  {
    __break(1u);
    goto LABEL_129;
  }
  uint64_t v24 = 0;
  unint64_t v18 = (unint64_t)&selRef_numberOfComponentsInPickerView_;
  do
  {
    if ((v20 & 0xC000000000000001) != 0) {
      id v25 = (id)MEMORY[0x245620370](v24, v20);
    }
    else {
      id v25 = *(id *)(v20 + 8 * v24 + 32);
    }
    BOOL v26 = v25;
    ++v24;
    [(SEL *)v23 addSubview:v25];
  }
  while (v22 != v24);
LABEL_22:
  swift_bridgeObjectRelease();
  sub_24162D2B8();
  sub_24162D1C8();
  objc_super v28 = v21[1];
  uint64_t v27 = (SEL *)(v21 + 1);
  unint64_t v29 = (unint64_t)v162;
  ((void (*)(uint64_t, id))v28)(v7, v162);
  int64_t v30 = (SEL *)&selRef_numberOfComponentsInPickerView_;
  [(SEL *)v23 directionalLayoutMargins];
  [(SEL *)v23 setDirectionalLayoutMargins:sel_setDirectionalLayoutMargins_];
  sub_24162D2B8();
  sub_24162D1C8();
  ((void (*)(uint64_t, unint64_t))v28)(v7, v29);
  [(SEL *)v23 directionalLayoutMargins];
  [(SEL *)v23 setDirectionalLayoutMargins:sel_setDirectionalLayoutMargins_];
  uint64_t v20 = *v14;
  if ((unint64_t)*v14 >> 62) {
    goto LABEL_123;
  }
  unint64_t v31 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v32 = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
LABEL_24:
  uint64_t v22 = (uint64_t)&selRef_numberOfComponentsInPickerView_;
  uint64_t v7 = (uint64_t)&selRef_mainScreen;
  if (!v31)
  {
    swift_bridgeObjectRelease();
    uint64_t v49 = 1;
    goto LABEL_33;
  }
  if ((v20 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_131;
    }
    long long v33 = (SEL *)*(id *)(v20 + 32);
    goto LABEL_28;
  }
LABEL_129:
  long long v33 = (SEL *)MEMORY[0x245620370](0, v20);
LABEL_28:
  int64_t v30 = v33;
  swift_bridgeObjectRelease();
  [(SEL *)v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v34 = [v23 *(SEL *)(v22 + 664)];
  id v35 = [v34 *(SEL *)(v7 + 1416)];

  if (v35 == (id)2) {
    double v36 = 8.0;
  }
  else {
    double v36 = 0.0;
  }
  uint64_t v37 = self;
  sub_2411BFC90();
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_24163ADC0;
  id v39 = [(SEL *)v30 topAnchor];
  id v40 = [(SEL *)v23 topAnchor];
  id v41 = objc_msgSend(v39, sel_constraintEqualToAnchor_constant_, v40, v36);

  *(void *)(v38 + 32) = v41;
  id v42 = [(SEL *)v30 leadingAnchor];
  id v43 = [(SEL *)v23 leadingAnchor];
  uint64_t v27 = v23;
  id v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v43);

  *(void *)(v38 + 40) = v44;
  id v45 = [(SEL *)v30 trailingAnchor];
  unint64_t v29 = (unint64_t)[(SEL *)v23 trailingAnchor];
  unint64_t v18 = (unint64_t)objc_msgSend(v45, sel_constraintEqualToAnchor_, v29);

  *(void *)(v38 + 48) = v18;
  *(void *)&long long v167 = v38;
  sub_241631F48();
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  os_log_type_t v46 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v37, sel_activateConstraints_, v46);

  type metadata accessor for UILayoutPriority(0);
  uint64_t v7 = 1065353216;
  float v165 = 1.0;
  int v166 = 1132068864;
  sub_2415FBF78((unint64_t *)&qword_26B012118, type metadata accessor for UILayoutPriority);
  sub_24162EFB8();
  LODWORD(v47) = v167;
  [(SEL *)v30 setContentHuggingPriority:1 forAxis:v47];
  float v165 = 1.0;
  int v166 = 1148846080;
  sub_24162EFC8();
  LODWORD(v48) = v167;
  [(SEL *)v30 setContentCompressionResistancePriority:1 forAxis:v48];

  uint64_t v49 = 2;
LABEL_33:
  uint64_t v159 = v49;
  if ((unint64_t)*v14 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v50 = sub_241633068();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v50 = *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v23 = v163;
  if (v50 < 2) {
    goto LABEL_40;
  }
  uint64_t v51 = *v14;
  if (!((unint64_t)*v14 >> 62))
  {
    uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v53 = v52 - 1;
    if (!__OFSUB__(v52, 1)) {
      goto LABEL_38;
    }
LABEL_138:
    __break(1u);
    goto LABEL_139;
  }
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v52 = sub_241633068();
  swift_bridgeObjectRelease();
  uint64_t v53 = v52 - 1;
  if (__OFSUB__(v52, 1)) {
    goto LABEL_138;
  }
LABEL_38:
  if (v53 < 1)
  {
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  if (v53 != 1)
  {
    id v158 = self;
    double v156 = (SEL *)self;
    type metadata accessor for UILayoutPriority(0);
    unint64_t v29 = 0;
    LOBYTE(v7) = 0;
    uint64_t v153 = v159 - 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v154 = v54;
    v152 = (void *)(v52 - 2);
    id v55 = &selRef_numberOfComponentsInPickerView_;
    long long v157 = xmmword_24163B1D0;
    long long v155 = xmmword_24163ADC0;
    while (1)
    {
      uint64_t v20 = (uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
      id v56 = objc_msgSend(v158, sel_hk_activitySeparatorDefaultColor);
      objc_msgSend((id)v20, sel_setBackgroundColor_, v56);

      if (v7) {
      int64_t v30 = (SEL *)(id)v20;
      }
      [(SEL *)v23 addSubview:v30];
      objc_msgSend(v30, v55[200], 0);
      uint64_t v57 = *v14;
      BOOL v58 = (*v14 & 0xC000000000000001) == 0;
      v164 = (char **)(v29 + 1);
      if (v58)
      {
        if (v29 + 1 >= *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
          unint64_t v32 = sub_241633068();
          unint64_t v31 = v32;
          goto LABEL_24;
        }
        id v98 = *(id *)(v57 + 8 * v29 + 40);
      }
      else
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        id v98 = (id)MEMORY[0x245620370](v29 + 1, v57);
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v98, v55[200], 0);

      id v59 = [(SEL *)v30 heightAnchor];
      id v60 = objc_msgSend(v59, sel_constraintEqualToConstant_, 0.5);

      sub_2411BFC90();
      id v62 = v61;
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = v157;
      id v63 = [(SEL *)v30 topAnchor];
      unint64_t v18 = *v14;
      BOOL v58 = (*v14 & 0xC000000000000001) == 0;
      id v161 = v60;
      id v162 = v62;
      if (v58)
      {
        if (v29 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_115;
        }
        CGFloat v99 = (char *)*(id *)(v18 + 8 * v29 + 32);
      }
      else
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        CGFloat v99 = (char *)MEMORY[0x245620370](v29, v18);
        swift_bridgeObjectRelease();
      }
      id v64 = objc_msgSend(v99, sel_bottomAnchor);

      id v65 = objc_msgSend(v63, sel_constraintEqualToAnchor_, v64);
      *(void *)(v20 + 32) = v65;
      id v66 = [(SEL *)v30 leadingAnchor];
      id v67 = v163;
      id v68 = [(SEL *)v163 layoutMarginsGuide];
      id v69 = objc_msgSend(v68, sel_leadingAnchor);

      id v70 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v69);
      *(void *)(v20 + 40) = v70;
      id v71 = [(SEL *)v30 trailingAnchor];
      uint64_t v23 = v30;

      id v72 = [(SEL *)v67 trailingAnchor];
      unint64_t v18 = (unint64_t)objc_msgSend(v71, sel_constraintEqualToAnchor_, v72);

      id v73 = v161;
      *(void *)(v20 + 48) = v18;
      *(void *)(v20 + 56) = v73;
      *(void *)&long long v167 = v20;
      sub_241631F48();
      sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
      int64_t v30 = (SEL *)v73;
      uint64_t v74 = (void *)sub_241631F18();
      swift_bridgeObjectRelease();
      uint64_t v27 = v156;
      [(SEL *)v156 activateConstraints:v74];

      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = v155;
      uint64_t v75 = *v14;
      if ((*v14 & 0xC000000000000001) != 0)
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        id v76 = (id)MEMORY[0x245620370](v164, v75);
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((unint64_t)v164 >= *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_116;
        }
        id v76 = *(id *)(v75 + 8 * v29 + 40);
      }
      id v77 = objc_msgSend(v76, sel_topAnchor);

      unint64_t v18 = *v14;
      BOOL v58 = (*v14 & 0xC000000000000001) == 0;
      v160 = v23;
      if (v58)
      {
        if (v29 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_117;
        }
        CGFloat v100 = (char *)*(id *)(v18 + 8 * v29 + 32);
      }
      else
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        CGFloat v100 = (char *)MEMORY[0x245620370](v29, v18);
        swift_bridgeObjectRelease();
      }
      id v78 = objc_msgSend(v100, sel_bottomAnchor);

      unint64_t v18 = (unint64_t)v164;
      if (qword_268CF9A40 != -1) {
        swift_once();
      }
      id v79 = objc_msgSend(v77, sel_constraintEqualToAnchor_constant_, v78, *(double *)&qword_268D04238);

      *(void *)(v20 + 32) = v79;
      uint64_t v80 = *v14;
      if ((*v14 & 0xC000000000000001) != 0)
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        id v81 = (id)MEMORY[0x245620370](v18, v80);
        swift_bridgeObjectRelease();
        uint64_t v23 = v163;
      }
      else
      {
        uint64_t v23 = v163;
        if (v18 >= *(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_118;
        }
        id v81 = *(id *)(v80 + 8 * v29 + 40);
      }
      id v82 = objc_msgSend(v81, sel_leadingAnchor);

      id v83 = [(SEL *)v23 leadingAnchor];
      unint64_t v18 = (unint64_t)objc_msgSend(v82, sel_constraintEqualToAnchor_, v83);

      *(void *)(v20 + 40) = v18;
      uint64_t v84 = *v14;
      if ((*v14 & 0xC000000000000001) != 0)
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        id v85 = (id)MEMORY[0x245620370](v164, v84);
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((unint64_t)v164 >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_119;
        }
        id v85 = *(id *)(v84 + 8 * v29 + 40);
      }
      id v86 = objc_msgSend(v85, sel_trailingAnchor);

      id v87 = [(SEL *)v23 trailingAnchor];
      id v88 = objc_msgSend(v86, sel_constraintEqualToAnchor_, v87);

      *(void *)(v20 + 48) = v88;
      *(void *)&long long v167 = v20;
      sub_241631F48();
      uint64_t v89 = (void *)sub_241631F18();
      swift_bridgeObjectRelease();
      [(SEL *)v27 activateConstraints:v89];

      uint64_t v90 = *v14;
      if ((*v14 & 0xC000000000000001) != 0)
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        unint64_t v18 = (unint64_t)v164;
        id v91 = (id)MEMORY[0x245620370](v164, v90);
        swift_bridgeObjectRelease();
        uint64_t v20 = v154;
      }
      else
      {
        unint64_t v18 = (unint64_t)v164;
        uint64_t v20 = v154;
        if ((unint64_t)v164 >= *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_120;
        }
        id v91 = *(id *)(v90 + 8 * v29 + 40);
      }
      int v166 = 1132068864;
      float v92 = (float)(uint64_t)(v159 + v29);
      float v165 = v92;
      sub_2415FBF78((unint64_t *)&qword_26B012118, type metadata accessor for UILayoutPriority);
      sub_24162EFB8();
      LODWORD(v93) = v167;
      objc_msgSend(v91, sel_setContentHuggingPriority_forAxis_, 1, v93);

      uint64_t v94 = *v14;
      if ((*v14 & 0xC000000000000001) != 0)
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        id v95 = (id)MEMORY[0x245620370](v18, v94);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v18 >= *(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_121;
        }
        id v95 = *(id *)(v94 + 8 * v29 + 40);
      }
      v96 = (char *)(v153 + v29);
      int v166 = 1148846080;
      float v165 = v92;
      sub_24162EFC8();
      LODWORD(v97) = v167;
      objc_msgSend(v95, sel_setContentCompressionResistancePriority_forAxis_, 1, v97);

      if (!v96) {
        goto LABEL_122;
      }
      ++v29;
      uint64_t v7 = 1;
      id v55 = &selRef_numberOfComponentsInPickerView_;
      if (v152 == (void *)v29)
      {
        v159 += v29;
        LODWORD(v22) = 1;
        goto LABEL_81;
      }
    }
  }
LABEL_40:
  LODWORD(v22) = 0;
LABEL_81:
  uint64_t v20 = *v14;
  if ((unint64_t)*v14 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v101 = sub_241633068();
    if (v101)
    {
LABEL_83:
      unint64_t v32 = v101 - 1;
      if (!__OFSUB__(v101, 1))
      {
        if ((v20 & 0xC000000000000001) == 0)
        {
          if ((v32 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v32 < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v102 = *(id *)(v20 + 8 * v32 + 32);
            goto LABEL_88;
          }
          __break(1u);
          goto LABEL_135;
        }
LABEL_132:
        id v102 = (id)MEMORY[0x245620370](v32, v20);
LABEL_88:
        uint64_t v7 = (uint64_t)v102;
        swift_bridgeObjectRelease();
        if (!((unint64_t)*v14 >> 62))
        {
          uint64_t v103 = *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          goto LABEL_90;
        }
LABEL_135:
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        uint64_t v103 = sub_241633068();
        swift_bridgeObjectRelease();
LABEL_90:
        double v104 = &selRef_numberOfComponentsInPickerView_;
        if (v103 < 2) {
          goto LABEL_108;
        }
        id v105 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
        id v106 = objc_msgSend(self, sel_hk_activitySeparatorDefaultColor);
        objc_msgSend(v105, sel_setBackgroundColor_, v106);

        if (v22) {
        int64_t v30 = (SEL *)v105;
        }
        [(SEL *)v23 addSubview:v30];
        [(SEL *)v30 setTranslatesAutoresizingMaskIntoConstraints:0];
        objc_msgSend((id)v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        id v107 = [(SEL *)v30 heightAnchor];
        unint64_t v18 = (unint64_t)objc_msgSend(v107, sel_constraintEqualToConstant_, 0.5);

        sub_2411BFC90();
        unint64_t v29 = v108;
        uint64_t v52 = swift_allocObject();
        *(_OWORD *)(v52 + 16) = xmmword_24163B1D0;
        v160 = v30;
        uint64_t v27 = (SEL *)[(SEL *)v30 topAnchor];
        uint64_t v51 = *v14;
        if (!((unint64_t)*v14 >> 62))
        {
          uint64_t v109 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
          BOOL v110 = __OFSUB__(v109, 2);
          unint64_t v111 = v109 - 2;
          if (!v110) {
            goto LABEL_95;
          }
          goto LABEL_142;
        }
LABEL_140:
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        uint64_t v149 = sub_241633068();
        swift_bridgeObjectRelease();
        BOOL v110 = __OFSUB__(v149, 2);
        unint64_t v111 = v149 - 2;
        if (!v110)
        {
LABEL_95:
          uint64_t v51 = *v14;
          BOOL v58 = (*v14 & 0xC000000000000001) == 0;
          v164 = (char **)v29;
          id v162 = (id)v18;
          if (v58)
          {
            if ((v111 & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (v111 < *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              id v112 = *(id *)(v51 + 8 * v111 + 32);
              goto LABEL_100;
            }
            __break(1u);
            goto LABEL_146;
          }
LABEL_143:
          _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
          id v112 = (id)MEMORY[0x245620370](v111, v51);
          swift_bridgeObjectRelease();
LABEL_100:
          double v113 = self;
          id v114 = objc_msgSend(v112, sel_bottomAnchor);

          id v115 = [(SEL *)v27 constraintEqualToAnchor:v114];
          *(void *)(v52 + 32) = v115;
          id v116 = v160;
          id v117 = [(SEL *)v160 leadingAnchor];
          uint64_t v118 = v163;
          id v119 = [(SEL *)v163 layoutMarginsGuide];
          id v120 = objc_msgSend(v119, sel_leadingAnchor);

          id v121 = objc_msgSend(v117, sel_constraintEqualToAnchor_, v120);
          *(void *)(v52 + 40) = v121;
          id v122 = [(SEL *)v116 trailingAnchor];

          id v123 = [(SEL *)v118 trailingAnchor];
          id v124 = objc_msgSend(v122, sel_constraintEqualToAnchor_, v123);

          id v125 = v162;
          *(void *)(v52 + 48) = v124;
          *(void *)(v52 + 56) = v125;
          *(void *)&long long v167 = v52;
          sub_241631F48();
          sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
          unint64_t v29 = (unint64_t)v125;
          v126 = (void *)sub_241631F18();
          swift_bridgeObjectRelease();
          int64_t v30 = (SEL *)&selRef_numberOfComponentsInPickerView_;
          id v162 = v113;
          objc_msgSend(v113, sel_activateConstraints_, v126);

          uint64_t v52 = swift_allocObject();
          *(_OWORD *)(v52 + 16) = xmmword_24163ADC0;
          unint64_t v18 = (unint64_t)objc_msgSend((id)v7, sel_topAnchor);
          uint64_t v51 = *v14;
          if (!((unint64_t)*v14 >> 62))
          {
            uint64_t v127 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
            BOOL v110 = __OFSUB__(v127, 2);
            unint64_t v128 = v127 - 2;
            if (!v110) {
              goto LABEL_102;
            }
            goto LABEL_148;
          }
LABEL_146:
          _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
          uint64_t v150 = sub_241633068();
          swift_bridgeObjectRelease();
          BOOL v110 = __OFSUB__(v150, 2);
          unint64_t v128 = v150 - 2;
          if (!v110)
          {
LABEL_102:
            uint64_t v51 = *v14;
            BOOL v58 = (*v14 & 0xC000000000000001) == 0;
            id v161 = (id)v29;
            if (v58)
            {
              if ((v128 & 0x8000000000000000) != 0)
              {
                __break(1u);
              }
              else if (v128 < *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                id v129 = *(id *)(v51 + 8 * v128 + 32);
LABEL_107:
                double v104 = &selRef_numberOfComponentsInPickerView_;
                id v130 = objc_msgSend(v129, sel_bottomAnchor);

                id v131 = objc_msgSend((id)v18, sel_constraintEqualToAnchor_, v130);
                *(void *)(v52 + 32) = v131;
                id v132 = objc_msgSend((id)v7, sel_leadingAnchor);
                unint64_t v133 = v163;
                id v134 = [(SEL *)v163 leadingAnchor];
                id v135 = objc_msgSend(v132, sel_constraintEqualToAnchor_, v134);

                *(void *)(v52 + 40) = v135;
                id v136 = objc_msgSend((id)v7, sel_trailingAnchor);
                id v137 = [(SEL *)v133 trailingAnchor];
                uint64_t v22 = (uint64_t)objc_msgSend(v136, sel_constraintEqualToAnchor_, v137);

                *(void *)(v52 + 48) = v22;
                *(void *)&long long v167 = v52;
                sub_241631F48();
                uint64_t v23 = v133;
                v138 = (void *)sub_241631F18();
                swift_bridgeObjectRelease();
                objc_msgSend(v162, v30[205], v138);

                type metadata accessor for UILayoutPriority(0);
                int v166 = 1132068864;
                float v139 = (float)v159;
                float v165 = (float)v159;
                sub_2415FBF78((unint64_t *)&qword_26B012118, type metadata accessor for UILayoutPriority);
                sub_24162EFB8();
                LODWORD(v140) = v167;
                LOBYTE(v22) = 1;
                objc_msgSend((id)v7, sel_setContentHuggingPriority_forAxis_, 1, v140);
                int v166 = 1148846080;
                float v165 = v139;
                sub_24162EFC8();
                LODWORD(v141) = v167;
                objc_msgSend((id)v7, sel_setContentCompressionResistancePriority_forAxis_, 1, v141);

LABEL_108:
                id v142 = [(SEL *)v23 traitCollection];
                id v143 = objc_msgSend(v142, sel_horizontalSizeClass);

                if (v143 == (id)2) {
                  double v144 = -8.0;
                }
                else {
                  double v144 = 0.0;
                }
                id v145 = [(id)v7 v104[248]];
                id v146 = [v23 v104[248]];
                id v147 = objc_msgSend(v145, sel_constraintEqualToAnchor_constant_, v146, v144);

                LODWORD(v148) = 1144750080;
                objc_msgSend(v147, sel_setPriority_, v148);
                objc_msgSend(v147, sel_setActive_, 1);

                if (v22) {
                  goto LABEL_112;
                }
                return;
              }
              __break(1u);
              return;
            }
LABEL_149:
            _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
            id v129 = (id)MEMORY[0x245620370](v128, v51);
            swift_bridgeObjectRelease();
            goto LABEL_107;
          }
LABEL_148:
          __break(1u);
          goto LABEL_149;
        }
LABEL_142:
        __break(1u);
        goto LABEL_143;
      }
LABEL_131:
      __break(1u);
      goto LABEL_132;
    }
  }
  else
  {
    uint64_t v101 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    if (v101) {
      goto LABEL_83;
    }
  }
  swift_bridgeObjectRelease();
  if (v22) {
LABEL_112:
  }
}

void sub_2415F73B8()
{
  unint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v3 = objc_msgSend(v2, sel_trailingAnchor);

  uint64_t v4 = self;
  sub_2411BFC90();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_24163B390;
  uint64_t v6 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_disclosureIndicator;
  id v7 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_disclosureIndicator], sel_trailingAnchor);
  id v8 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v3);

  *(void *)(v5 + 32) = v8;
  sub_241631F48();
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  uint64_t v9 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v9);

  uint64_t v10 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_factorSubviews];
  swift_beginAccess();
  uint64_t v11 = *(void *)v10;
  if (!(*(void *)v10 >> 62))
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    id v18 = objc_msgSend(*(id *)&v1[v6], sel_topAnchor);
    id v19 = objc_msgSend(v1, sel_topAnchor);
    id v17 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v19, 16.0);

    objc_msgSend(v17, sel_setActive_, 1);
    goto LABEL_9;
  }
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  if (!sub_241633068()) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v11 & 0xC000000000000001) != 0)
  {
    uint64_t v13 = (char *)MEMORY[0x245620370](0, v11);
    goto LABEL_6;
  }
  if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v13 = (char *)*(id *)(v11 + 32);
LABEL_6:
    id v14 = v13;
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(*(id *)&v1[v6], sel_firstBaselineAnchor);
    id v16 = objc_msgSend(*(id *)&v14[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel], sel_firstBaselineAnchor);
    id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

    objc_msgSend(v17, sel_setActive_, 1);
LABEL_9:

    LODWORD(v20) = 1148846080;
    objc_msgSend(*(id *)&v1[v6], sel_setContentHuggingPriority_forAxis_, 0, v20);
    LODWORD(v21) = 1148846080;
    objc_msgSend(*(id *)&v1[v6], sel_setContentCompressionResistancePriority_forAxis_, 0, v21);

    return;
  }
  __break(1u);
}

void sub_2415F76E8()
{
  unint64_t v1 = v0;
  uint64_t v52 = (void *)sub_24162D2C8();
  uint64_t v2 = *(v52 - 1);
  MEMORY[0x270FA5388](v52);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24162B7E8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_241631CA8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v51 - v11;
  uint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_noFactorsLabel];
  sub_2411B9D00(0, &qword_26B012140);
  id v14 = (void *)sub_241632898();
  objc_msgSend(v13, sel_setFont_, v14);

  sub_241631C38();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v15 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  id v16 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setText_, v16);

  objc_msgSend(v13, sel_setNumberOfLines_, 0);
  objc_msgSend(v1, sel_addSubview_, v13);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_24162D2B8();
  sub_24162D1C8();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  (*(void (**)(char *, void *))(v2 + 8))(v4, v52);
  objc_msgSend(v1, sel_setDirectionalLayoutMargins_, v18, v20, v22, v24);
  id v25 = objc_msgSend(v1, sel_traitCollection);
  id v26 = objc_msgSend(v25, sel_horizontalSizeClass);

  if (v26 == (id)2) {
    double v27 = 16.0;
  }
  else {
    double v27 = 0.0;
  }
  id v28 = objc_msgSend(v1, sel_traitCollection);
  id v29 = objc_msgSend(v28, sel_horizontalSizeClass);

  if (v29 == (id)2)
  {
    id v30 = objc_msgSend(v1, sel_topAnchor);
  }
  else
  {
    id v31 = objc_msgSend(v1, sel_layoutMarginsGuide);
    id v30 = objc_msgSend(v31, sel_topAnchor);
  }
  uint64_t v52 = self;
  sub_2411BFC90();
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_24163B1D0;
  id v33 = objc_msgSend(v13, sel_topAnchor);
  id v34 = objc_msgSend(v33, sel_constraintEqualToAnchor_constant_, v30, v27);

  *(void *)(v32 + 32) = v34;
  id v35 = objc_msgSend(v13, sel_leadingAnchor);
  id v36 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v37 = objc_msgSend(v36, sel_leadingAnchor);

  id v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
  *(void *)(v32 + 40) = v38;
  id v39 = objc_msgSend(v13, sel_trailingAnchor);
  id v40 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v41 = objc_msgSend(v40, sel_trailingAnchor);

  id v42 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v41);
  *(void *)(v32 + 48) = v42;
  id v43 = objc_msgSend(v13, sel_bottomAnchor);
  id v44 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v45 = objc_msgSend(v44, sel_bottomAnchor);

  id v46 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v45);
  *(void *)(v32 + 56) = v46;
  uint64_t v53 = v32;
  sub_241631F48();
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  double v47 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v52, sel_activateConstraints_, v47);

  if (v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_shouldShowDisclosureIndicator] == 1)
  {
    id v48 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_disclosureIndicator], sel_firstBaselineAnchor);
    id v49 = objc_msgSend(v13, sel_firstBaselineAnchor);
    id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v49);

    objc_msgSend(v50, sel_setActive_, 1);
  }
}

id sub_2415F7E24(uint64_t a1)
{
  return sub_2415F8FC4(a1, type metadata accessor for CycleFactorsSectionView);
}

uint64_t type metadata accessor for CycleFactorsSectionView()
{
  return self;
}

id sub_2415F7EEC(uint64_t a1)
{
  swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel;
  id v4 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_subtitleLabel;
  *(void *)&v5[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  sub_2415FC008(a1, (uint64_t)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_viewModel]);

  v19.receiver = v5;
  v19.super_class = (Class)type metadata accessor for CycleFactorsSectionSingleFactorView(0);
  id v7 = objc_msgSendSuper2(&v19, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2415F8270();
  uint64_t v8 = qword_26B00F370;
  id v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  long long v18 = xmmword_26B017FC8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  swift_bridgeObjectRelease();
  unint64_t v17 = sub_2411D662C();
  uint64_t v16 = MEMORY[0x263F8D310];
  sub_241632C98();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setAccessibilityIdentifier_, v10, v16, v17, v17, v17, 0, 0xE000000000000000, 32, 0xE100000000000000, v18);

  sub_2411E58B4();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_241637EE0;
  uint64_t v12 = sub_24162F5B8();
  uint64_t v13 = MEMORY[0x263F82018];
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v13;
  id v14 = v9;
  sub_241632918();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  sub_2412F2760(a1);
  return v14;
}

void sub_2415F8270()
{
  unint64_t v1 = v0;
  *(void *)&long long v94 = sub_24162D2C8();
  uint64_t v92 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  id v91 = (char *)&v88 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = (void *)sub_24162B718();
  uint64_t v3 = *(v96 - 1);
  MEMORY[0x270FA5388](v96);
  id v95 = (char *)&v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v88 - v6;
  MEMORY[0x270FA5388](v8);
  double v93 = (char *)&v88 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v88 - v11;
  uint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel];
  sub_2411B9D00(0, &qword_26B012140);
  id v14 = (void *)sub_241632898();
  objc_msgSend(v13, sel_setFont_, v14);

  id v15 = *(char **)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_subtitleLabel];
  uint64_t v16 = (void *)sub_241632898();
  objc_msgSend(v15, sel_setFont_, v16);

  unint64_t v17 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_viewModel];
  long long v18 = (void *)sub_241631CC8();
  objc_msgSend(v13, sel_setText_, v18);

  uint64_t v90 = v17;
  objc_super v19 = (void *)sub_241631CC8();
  objc_msgSend(v15, sel_setText_, v19);

  objc_msgSend(v13, sel_setNumberOfLines_, 0);
  objc_msgSend(v15, sel_setNumberOfLines_, 0);
  uint64_t v89 = type metadata accessor for CycleFactorsSectionViewModel(0);
  double v20 = &v17[*(int *)(v89 + 28)];
  uint64_t v21 = v3;
  double v22 = v96;
  (*(void (**)(char *, char *, void *))(v3 + 16))(v12, v20, v96);
  double v23 = v7;
  sub_24162B708();
  double v24 = v95;
  sub_2414B0600(1, (uint64_t)v95);
  id v25 = v93;
  sub_2414AFDC0((uint64_t)v93);
  id v26 = *(void (**)(char *, void *))(v21 + 8);
  v26(v24, v22);
  v26(v23, v22);
  id v27 = objc_allocWithZone((Class)type metadata accessor for IntervalPillView(0));
  id v28 = (char *)sub_2415F91C8(v12, v25);
  objc_msgSend(v1, sel_addSubview_, v13);
  objc_msgSend(v1, sel_addSubview_, v15);
  objc_msgSend(v1, sel_addSubview_, v28);
  v96 = v13;
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  double v93 = v15;
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v95 = v28;
  objc_msgSend(v28, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v29 = v91;
  sub_24162D2B8();
  sub_24162D1C8();
  id v30 = *(void (**)(char *, uint64_t))(v92 + 8);
  uint64_t v31 = v94;
  v30(v29, v94);
  objc_msgSend(v1, sel_directionalLayoutMargins);
  objc_msgSend(v1, sel_setDirectionalLayoutMargins_);
  sub_24162D2B8();
  sub_24162D1C8();
  v30(v29, v31);
  objc_msgSend(v1, sel_directionalLayoutMargins);
  uint64_t v32 = v1;
  objc_msgSend(v1, sel_setDirectionalLayoutMargins_);
  if (v90[*(int *)(v89 + 36)] == 1)
  {
    if (qword_268CF9A58 != -1) {
      swift_once();
    }
    id v33 = &qword_268D04250;
  }
  else
  {
    if (qword_268CF9A50 != -1) {
      swift_once();
    }
    id v33 = &qword_268D04248;
  }
  double v34 = *(double *)v33;
  sub_2411BFC90();
  uint64_t v35 = swift_allocObject();
  long long v94 = xmmword_24163ADC0;
  *(_OWORD *)(v35 + 16) = xmmword_24163ADC0;
  id v36 = v96;
  id v37 = objc_msgSend(v96, sel_topAnchor);
  id v38 = objc_msgSend(v1, sel_topAnchor);
  id v39 = objc_msgSend(v37, sel_constraintEqualToAnchor_constant_, v38, v34);

  *(void *)(v35 + 32) = v39;
  id v40 = objc_msgSend(v36, sel_leadingAnchor);
  id v41 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v42 = objc_msgSend(v41, sel_leadingAnchor);

  id v43 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v42);
  *(void *)(v35 + 40) = v43;
  id v44 = objc_msgSend(v1, sel_layoutMarginsGuide);
  id v45 = objc_msgSend(v44, sel_trailingAnchor);

  id v46 = objc_msgSend(v36, sel_trailingAnchor);
  id v47 = objc_msgSend(v45, sel_constraintGreaterThanOrEqualToAnchor_, v46);

  *(void *)(v35 + 48) = v47;
  uint64_t v99 = v35;
  sub_241631F48();
  id v48 = self;
  uint64_t v49 = sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  id v50 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v48, sel_activateConstraints_, v50);

  LODWORD(v51) = 1132068864;
  objc_msgSend(v36, sel_setContentHuggingPriority_forAxis_, 1, v51);
  LODWORD(v52) = 1148846080;
  objc_msgSend(v36, sel_setContentCompressionResistancePriority_forAxis_, 1, v52);
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = v94;
  uint64_t v54 = v93;
  id v55 = objc_msgSend(v93, sel_topAnchor);
  id v56 = objc_msgSend(v36, sel_bottomAnchor);
  if (qword_268CF9A40 != -1) {
    swift_once();
  }
  id v57 = objc_msgSend(v55, sel_constraintEqualToAnchor_constant_, v56, *(double *)&qword_268D04238);

  *(void *)(v53 + 32) = v57;
  id v58 = objc_msgSend(v54, sel_leadingAnchor);
  id v59 = objc_msgSend(v32, sel_layoutMarginsGuide);
  id v60 = objc_msgSend(v59, sel_leadingAnchor);

  id v61 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v60);
  *(void *)(v53 + 40) = v61;
  id v62 = objc_msgSend(v32, sel_layoutMarginsGuide);
  id v63 = objc_msgSend(v62, sel_trailingAnchor);

  id v64 = objc_msgSend(v54, sel_trailingAnchor);
  id v65 = objc_msgSend(v63, sel_constraintGreaterThanOrEqualToAnchor_, v64);

  *(void *)(v53 + 48) = v65;
  uint64_t v99 = v53;
  sub_241631F48();
  *(void *)&long long v94 = v49;
  id v66 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  v96 = v48;
  objc_msgSend(v48, sel_activateConstraints_, v66);

  type metadata accessor for UILayoutPriority(0);
  int v97 = 1065353216;
  int v98 = 1132068864;
  sub_2415FBF78((unint64_t *)&qword_26B012118, type metadata accessor for UILayoutPriority);
  sub_24162EFB8();
  LODWORD(v67) = v99;
  objc_msgSend(v54, sel_setContentHuggingPriority_forAxis_, 1, v67);
  int v97 = 1065353216;
  int v98 = 1148846080;
  sub_24162EFC8();
  LODWORD(v68) = v99;
  objc_msgSend(v54, sel_setContentCompressionResistancePriority_forAxis_, 1, v68);
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_24163B1D0;
  id v70 = v95;
  id v71 = objc_msgSend(v95, sel_topAnchor);
  id v72 = objc_msgSend(v54, sel_bottomAnchor);
  if (qword_268CF9A48 != -1) {
    swift_once();
  }
  id v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_constant_, v72, *(double *)&qword_268D04240);

  *(void *)(v69 + 32) = v73;
  id v74 = objc_msgSend(v70, sel_leadingAnchor);
  id v75 = objc_msgSend(v32, sel_layoutMarginsGuide);
  id v76 = objc_msgSend(v75, sel_leadingAnchor);

  id v77 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v76);
  *(void *)(v69 + 40) = v77;
  id v78 = objc_msgSend(v32, sel_layoutMarginsGuide);
  id v79 = objc_msgSend(v78, sel_trailingAnchor);

  id v80 = objc_msgSend(v70, sel_trailingAnchor);
  id v81 = objc_msgSend(v79, sel_constraintGreaterThanOrEqualToAnchor_, v80);

  *(void *)(v69 + 48) = v81;
  id v82 = objc_msgSend(v32, sel_bottomAnchor);
  id v83 = objc_msgSend(v70, sel_bottomAnchor);
  if (qword_268CF9A50 != -1) {
    swift_once();
  }
  id v84 = objc_msgSend(v82, sel_constraintEqualToAnchor_constant_, v83, *(double *)&qword_268D04248);

  *(void *)(v69 + 56) = v84;
  uint64_t v99 = v69;
  sub_241631F48();
  id v85 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v96, sel_activateConstraints_, v85);

  int v97 = 0x40000000;
  int v98 = 1132068864;
  sub_24162EFB8();
  LODWORD(v86) = v99;
  objc_msgSend(v70, sel_setContentHuggingPriority_forAxis_, 1, v86);
  int v97 = 0x40000000;
  int v98 = 1148846080;
  sub_24162EFC8();
  LODWORD(v87) = v99;
  objc_msgSend(v70, sel_setContentCompressionResistancePriority_forAxis_, 1, v87);
}

id sub_2415F8FA8()
{
  return sub_2415F8FC4(0, (uint64_t (*)(void))type metadata accessor for CycleFactorsSectionSingleFactorView);
}

id sub_2415F8FC4(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_2415F9058()
{
  return type metadata accessor for CycleFactorsSectionSingleFactorView(0);
}

uint64_t type metadata accessor for CycleFactorsSectionSingleFactorView(uint64_t a1)
{
  return sub_2411B6BD4(a1, (uint64_t *)&unk_268D042B0);
}

uint64_t sub_2415F9080()
{
  uint64_t result = type metadata accessor for CycleFactorsSectionViewModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CycleFactorsSectionViewModel(uint64_t a1)
{
  return sub_2411B6BD4(a1, (uint64_t *)&unk_268D042F0);
}

id sub_2415F9140()
{
  uint64_t v1 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2415F91C8(char *a1, char *a2)
{
  swift_getObjectType();
  uint64_t v5 = sub_24162EFA8();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24162B718();
  uint64_t v9 = *(void *)(v8 - 8);
  __n128 v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_maxDays] = 60;
  *(void *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel] = 0;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v9 + 16);
  v13(&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_startDate], (uint64_t)a1, v8, v10);
  ((void (*)(char *, char *, uint64_t))v13)(&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_endDate], a2, v8);
  id v14 = a2;
  id v15 = (objc_class *)type metadata accessor for IntervalPillView(0);
  v43.receiver = v2;
  v43.super_class = v15;
  id v16 = objc_msgSendSuper2(&v43, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2414AFDC0((uint64_t)v12);
  char v17 = sub_24162B688();
  long long v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v12, v8);
  if (v17)
  {
    sub_2415FAED0();
    id v19 = sub_2415F9140();
    sub_2415F97FC(v19);

    sub_2411E58B4();
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_241637EE0;
    uint64_t v21 = sub_24162F5B8();
    uint64_t v22 = MEMORY[0x263F82018];
    *(void *)(v20 + 32) = v21;
    *(void *)(v20 + 40) = v22;
    id v23 = v16;
    sub_241632918();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();

    v18(v14, v8);
    v18(a1, v8);
  }
  else
  {
    sub_24162EF48();
    id v24 = v16;
    id v25 = sub_24162EF98();
    os_log_type_t v26 = sub_2416322E8();
    if (os_log_type_enabled(v25, v26))
    {
      id v38 = v14;
      id v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      id v37 = a1;
      *(_DWORD *)id v27 = 136446210;
      v34[1] = v27 + 4;
      uint64_t v35 = v27;
      uint64_t ObjectType = swift_getObjectType();
      sub_2415FBFC0(0, &qword_268D04310, type metadata accessor for IntervalPillView, MEMORY[0x263F8EEC8]);
      uint64_t v28 = sub_241631D48();
      uint64_t ObjectType = sub_2411B6898(v28, v29, &v42);
      sub_241632C28();

      swift_bridgeObjectRelease();
      id v30 = v35;
      _os_log_impl(&dword_24118E000, v25, v26, "[%{public}s] Factor start date is after today's date, so IntervalPillView will be a frame of size .zero", v35, 0xCu);
      uint64_t v31 = v36;
      swift_arrayDestroy();
      MEMORY[0x245621640](v31, -1, -1);
      MEMORY[0x245621640](v30, -1, -1);

      v18(v38, v8);
      uint64_t v32 = v37;
    }
    else
    {

      v18(v14, v8);
      uint64_t v32 = a1;
    }
    v18(v32, v8);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v40);
  }
  return v16;
}

uint64_t sub_2415F97FC(void *a1)
{
  id v138 = a1;
  uint64_t v1 = sub_24162B7E8();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v127 = (char *)&v127 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_241631CA8();
  uint64_t v130 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  float v139 = (char *)&v127 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v129 = (char *)&v127 - v5;
  uint64_t v146 = sub_24162BA08();
  unint64_t v151 = *(void *)(v146 - 8);
  MEMORY[0x270FA5388](v146);
  id v7 = (char *)&v127 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_24162B138();
  uint64_t v147 = *(void *)(v148 - 8);
  MEMORY[0x270FA5388](v148);
  double v141 = (char *)&v127 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v142 = (char *)&v127 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v149 = (char *)&v127 - v12;
  MEMORY[0x270FA5388](v13);
  double v140 = (char *)&v127 - v14;
  sub_24162B9A8();
  sub_2415FBEA4(0, (unint64_t *)&unk_26B012600, MEMORY[0x263F07908]);
  uint64_t v145 = v15;
  uint64_t v16 = sub_24162B9E8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v143 = *(void *)(v17 + 72);
  uint64_t v18 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = (v18 + 32) & ~v18;
  uint64_t v144 = v18 | 7;
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_241637EE0;
  unsigned int v137 = *MEMORY[0x263F07870];
  uint64_t v21 = *(void (**)(uint64_t))(v17 + 104);
  v21(v20 + v19);
  sub_2411C9AF4(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v135 = v150 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_startDate;
  uint64_t v134 = v150 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_endDate;
  sub_24162B868();
  swift_bridgeObjectRelease();
  unint64_t v133 = *(void (**)(char *, uint64_t))(v151 + 8);
  v151 += 8;
  uint64_t v22 = v146;
  v133(v7, v146);
  sub_24162B9A8();
  uint64_t v23 = v143;
  uint64_t v131 = v19;
  uint64_t v132 = v19 + 2 * v143;
  uint64_t v24 = swift_allocObject();
  long long v150 = xmmword_24163A4F0;
  *(_OWORD *)(v24 + 16) = xmmword_24163A4F0;
  uint64_t v25 = v24 + v19;
  unsigned int v136 = *MEMORY[0x263F078A8];
  v21(v25);
  ((void (*)(uint64_t, void, uint64_t))v21)(v25 + v23, v137, v16);
  sub_2411C9AF4(v24);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_24162B868();
  swift_bridgeObjectRelease();
  uint64_t v26 = v22;
  id v27 = v133;
  v133(v7, v26);
  sub_24162B9A8();
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v150;
  uint64_t v29 = v28 + v131;
  ((void (*)(uint64_t, void, uint64_t))v21)(v28 + v131, *MEMORY[0x263F078A0], v16);
  ((void (*)(uint64_t, void, uint64_t))v21)(v29 + v143, v136, v16);
  id v30 = v142;
  sub_2411C9AF4(v28);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_24162B868();
  swift_bridgeObjectRelease();
  v27(v7, v146);
  unint64_t v158 = MEMORY[0x263F8EE78];
  sub_2415FBEA4(0, &qword_268D04300, (void (*)(uint64_t))sub_2415FBEF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v150;
  uint64_t v32 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  sub_2411B9D00(0, &qword_26B012140);
  id v33 = v32;
  uint64_t v34 = sub_241632898();
  uint64_t v35 = (void *)*MEMORY[0x263F81500];
  *(void *)(inited + 40) = v34;
  *(void *)(inited + 48) = v35;
  uint64_t v36 = self;
  id v37 = v35;
  *(void *)(inited + 56) = objc_msgSend(v36, sel_systemIndigoColor);
  unint64_t v38 = sub_2414E5104(inited);
  uint64_t v39 = swift_initStackObject();
  *(_OWORD *)(v39 + 16) = v150;
  *(void *)(v39 + 32) = v33;
  id v40 = v33;
  *(void *)(v39 + 40) = sub_241632898();
  *(void *)(v39 + 48) = v37;
  id v41 = v37;
  uint64_t v42 = v140;
  *(void *)(v39 + 56) = objc_msgSend(v36, sel_systemIndigoColor);
  unint64_t v43 = sub_2414E5104(v39);
  uint64_t v44 = sub_24162B098();
  if ((v45 & 1) != 0 || v44 > 60)
  {
    uint64_t v47 = sub_24162B0D8();
    if ((v48 & 1) != 0 || v47 > 0)
    {
      id v46 = v141;
      uint64_t v49 = v141;
      id v50 = v30;
    }
    else
    {
      id v46 = v141;
      uint64_t v49 = v141;
      id v50 = v149;
    }
    (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v49, v50, v148);
  }
  else
  {
    id v46 = v141;
    (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v141, v42, v148);
  }
  double v51 = v139;
  uint64_t v52 = sub_24162B0D8();
  if ((v53 & 1) == 0 && v52 >= 1)
  {
    uint64_t v156 = v52;
    uint64_t v54 = sub_2416331D8();
    uint64_t v56 = v55;
    sub_2411B9D00(0, &qword_268CFD1C8);
    uint64_t v57 = sub_2414760F4();
    if (v58)
    {
      uint64_t v156 = v57;
      uint64_t v157 = v58;
      uint64_t v154 = 32;
      unint64_t v155 = 0xE100000000000000;
      uint64_t v152 = 41154;
      unint64_t v153 = 0xA200000000000000;
      sub_2411D662C();
      sub_241632C98();
      swift_bridgeObjectRelease();
      unint64_t v151 = v43;
      sub_2415F532C(v43);
      *(void *)&long long v150 = v38;
      uint64_t v146 = sub_2415F532C(v38);
      id v59 = objc_allocWithZone(MEMORY[0x263F089B8]);
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      id v60 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      uint64_t v145 = v54;
      sub_2415FBF78(&qword_268CFFFF0, type metadata accessor for Key);
      uint64_t v61 = sub_241631B18();
      uint64_t v144 = v56;
      id v62 = (void *)v61;
      swift_bridgeObjectRelease();
      id v63 = objc_msgSend(v59, sel_initWithString_attributes_, v60, v62);

      id v64 = (void *)sub_241631B18();
      id v65 = objc_msgSend(v63, sel_string);
      _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();

      id v66 = objc_allocWithZone(NSString);
      double v67 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      id v68 = objc_msgSend(v66, sel_initWithString_, v67);

      uint64_t v69 = (void *)sub_241631CC8();
      id v70 = objc_msgSend(v68, sel_rangeOfString_, v69);
      uint64_t v72 = v71;

      objc_msgSend(v63, sel_addAttributes_range_, v64, v70, v72);
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F086A0]), sel_initWithAttributedString_, v63);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      MEMORY[0x24561F3D0]();
      if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_241631F68();
      }
      sub_241631F98();
      sub_241631F48();
      id v30 = v142;
      id v46 = v141;
      uint64_t v42 = v140;
      double v51 = v139;
      unint64_t v43 = v151;
      unint64_t v38 = v150;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v73 = sub_24162B0F8();
  if ((v74 & 1) == 0 && v73 >= 1)
  {
    uint64_t v156 = v73;
    uint64_t v75 = sub_2416331D8();
    uint64_t v77 = v76;
    sub_2411B9D00(0, &qword_268CFD1C8);
    uint64_t v78 = sub_241475DF4();
    if (v79)
    {
      uint64_t v156 = v78;
      uint64_t v157 = v79;
      uint64_t v154 = 32;
      unint64_t v155 = 0xE100000000000000;
      uint64_t v152 = 41154;
      unint64_t v153 = 0xA200000000000000;
      sub_2411D662C();
      sub_241632C98();
      swift_bridgeObjectRelease();
      unint64_t v151 = v43;
      sub_2415F532C(v43);
      *(void *)&long long v150 = v38;
      uint64_t v146 = sub_2415F532C(v38);
      id v80 = objc_allocWithZone(MEMORY[0x263F089B8]);
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      id v81 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      uint64_t v145 = v75;
      sub_2415FBF78(&qword_268CFFFF0, type metadata accessor for Key);
      uint64_t v82 = sub_241631B18();
      uint64_t v144 = v77;
      id v83 = (void *)v82;
      swift_bridgeObjectRelease();
      id v84 = objc_msgSend(v80, sel_initWithString_attributes_, v81, v83);

      id v85 = (void *)sub_241631B18();
      id v86 = objc_msgSend(v84, sel_string);
      _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();

      id v87 = objc_allocWithZone(NSString);
      uint64_t v88 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      id v89 = objc_msgSend(v87, sel_initWithString_, v88);

      uint64_t v90 = (void *)sub_241631CC8();
      id v91 = objc_msgSend(v89, sel_rangeOfString_, v90);
      uint64_t v93 = v92;

      objc_msgSend(v84, sel_addAttributes_range_, v85, v91, v93);
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F086A0]), sel_initWithAttributedString_, v84);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      MEMORY[0x24561F3D0]();
      if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_241631F68();
      }
      sub_241631F98();
      sub_241631F48();
      id v30 = v142;
      id v46 = v141;
      uint64_t v42 = v140;
      double v51 = v139;
      unint64_t v43 = v151;
      unint64_t v38 = v150;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v94 = sub_24162B098();
  if ((v95 & 1) != 0 || v94 < 1) {
    goto LABEL_30;
  }
  uint64_t v156 = v94;
  sub_2416331D8();
  uint64_t v97 = v96;
  sub_2411B9D00(0, &qword_268CFD1C8);
  uint64_t v98 = sub_2414757C4();
  if (!v99)
  {
    swift_bridgeObjectRelease();
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  uint64_t v156 = v98;
  uint64_t v157 = v99;
  uint64_t v154 = 32;
  unint64_t v155 = 0xE100000000000000;
  uint64_t v152 = 41154;
  unint64_t v153 = 0xA200000000000000;
  sub_2411D662C();
  sub_241632C98();
  uint64_t v101 = v100;
  swift_bridgeObjectRelease();
  unint64_t v151 = v43;
  sub_2415F532C(v43);
  sub_2415F532C(v38);
  swift_bridgeObjectRelease();
  id v102 = objc_allocWithZone(MEMORY[0x263F089B8]);
  *(void *)&long long v150 = v101;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v103 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_2415FBF78(&qword_268CFFFF0, type metadata accessor for Key);
  uint64_t v146 = v97;
  double v104 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v105 = objc_msgSend(v102, sel_initWithString_attributes_, v103, v104);

  id v106 = (void *)sub_241631B18();
  id v107 = objc_msgSend(v105, sel_string);
  _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();

  id v108 = objc_allocWithZone(NSString);
  uint64_t v109 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  id v110 = objc_msgSend(v108, sel_initWithString_, v109);

  unint64_t v111 = (void *)sub_241631CC8();
  id v112 = objc_msgSend(v110, sel_rangeOfString_, v111);
  uint64_t v114 = v113;

  objc_msgSend(v105, sel_addAttributes_range_, v106, v112, v114);
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F086A0]), sel_initWithAttributedString_, v105);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  MEMORY[0x24561F3D0]();
  if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_241631F68();
  }
  sub_241631F98();
  sub_241631F48();
  id v30 = v142;
  id v46 = v141;
  uint64_t v42 = v140;
  double v51 = v139;
  unint64_t v43 = v151;
LABEL_31:
  if ((MEMORY[0x245618540](v46, v42) & 1) == 0)
  {
    if (v158 >> 62)
    {
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      uint64_t v115 = sub_241633068();
      swift_bridgeObjectRelease();
      if (v115 == 1) {
        goto LABEL_39;
      }
    }
    else if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
    {
      goto LABEL_39;
    }
    MEMORY[0x245618540](v46, v149);
    id v116 = (void (**)(char *, char *, uint64_t))(v130 + 16);
    id v117 = v129;
    sub_241631C38();
    uint64_t v118 = v128;
    (*v116)(v51, v117, v128);
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    id v119 = (id)qword_26B0181A0;
    sub_24162B7D8();
    sub_241631D38();
    (*(void (**)(char *, uint64_t))(v130 + 8))(v129, v118);
  }
LABEL_39:
  sub_2411B9D00(0, &qword_268CFE798);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  id v120 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  id v121 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  sub_2415F532C(v43);
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_2415FBF78(&qword_268CFFFF0, type metadata accessor for Key);
  id v122 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  id v123 = (id)HKUIJoinAttributedStringsWithFormatAndAttributes();

  objc_msgSend(v138, sel_setAttributedText_, v123);
  id v124 = *(void (**)(char *, uint64_t))(v147 + 8);
  uint64_t v125 = v148;
  v124(v46, v148);
  swift_bridgeObjectRelease();
  v124(v30, v125);
  v124(v149, v125);
  return ((uint64_t (*)(char *, uint64_t))v124)(v42, v125);
}

void sub_2415FAED0()
{
  id v1 = objc_msgSend(v0, sel_traitCollection);
  id v2 = objc_msgSend(v1, sel_accessibilityContrast);

  uint64_t v3 = self;
  uint64_t v4 = &selRef_hkmc_highContrastCycleFactorsTimeIntervalBackgroundColor;
  if (v2 != (id)1) {
    uint64_t v4 = &selRef_hkmc_cycleFactorsTimeIntervalBackgroundColor;
  }
  id v5 = [v3 *v4];
  objc_msgSend(v0, sel_setBackgroundColor_, v5);

  id v6 = objc_msgSend(v0, sel_layer);
  if (qword_268CF9A70 != -1) {
    swift_once();
  }
  objc_msgSend(v6, sel_setCornerRadius_, *(double *)&qword_268D04268);

  if (qword_268CF9A78 != -1) {
    swift_once();
  }
  objc_msgSend(v0, sel_directionalLayoutMargins);
  objc_msgSend(v0, sel_setDirectionalLayoutMargins_);
  objc_msgSend(v0, sel_directionalLayoutMargins);
  objc_msgSend(v0, sel_setDirectionalLayoutMargins_);
  id v7 = sub_2415F9140();
  objc_msgSend(v0, sel_addSubview_, v7);

  id v8 = sub_2415F9140();
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  uint64_t v9 = self;
  sub_2411BFC90();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24163B1D0;
  id v11 = sub_2415F9140();
  id v12 = objc_msgSend(v11, sel_topAnchor);

  id v13 = objc_msgSend(v0, sel_topAnchor);
  if (qword_268CF9A60 != -1) {
    swift_once();
  }
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_constant_, v13, *(double *)&qword_268D04258);

  *(void *)(v10 + 32) = v14;
  id v15 = sub_2415F9140();
  id v16 = objc_msgSend(v15, sel_leadingAnchor);

  id v17 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v18 = objc_msgSend(v17, sel_leadingAnchor);

  id v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(void *)(v10 + 40) = v19;
  id v20 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v21 = objc_msgSend(v20, sel_trailingAnchor);

  id v22 = sub_2415F9140();
  id v23 = objc_msgSend(v22, sel_trailingAnchor);

  id v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(void *)(v10 + 48) = v24;
  id v25 = objc_msgSend(v0, sel_bottomAnchor);
  id v26 = sub_2415F9140();
  id v27 = objc_msgSend(v26, sel_bottomAnchor);

  if (qword_268CF9A68 != -1) {
    swift_once();
  }
  id v28 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v27, *(double *)&qword_268D04260);

  *(void *)(v10 + 56) = v28;
  sub_241631F48();
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  id v29 = (id)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_activateConstraints_, v29);
}

id sub_2415FB3A0()
{
  return sub_2415F8FC4(0, (uint64_t (*)(void))type metadata accessor for IntervalPillView);
}

uint64_t sub_2415FB46C()
{
  return type metadata accessor for IntervalPillView(0);
}

uint64_t type metadata accessor for IntervalPillView(uint64_t a1)
{
  return sub_2411B6BD4(a1, (uint64_t *)&unk_268D042E0);
}

uint64_t sub_2415FB494()
{
  uint64_t result = sub_24162B718();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *sub_2415FB53C(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    id v7 = a1;
    id v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    uint64_t v9 = a2[4];
    *((void *)a1 + 3) = a2[3];
    *((void *)a1 + 4) = v9;
    uint64_t v10 = a3[7];
    id v16 = &a1[v10];
    uint64_t v11 = (uint64_t)a2 + v10;
    uint64_t v12 = sub_24162B718();
    id v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    id v14 = v4;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    v13(v16, v11, v12);
    v13(&v7[a3[8]], (uint64_t)a2 + a3[8], v12);
    v7[a3[9]] = *((unsigned char *)a2 + a3[9]);
  }
  return v7;
}

uint64_t sub_2415FB680(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_24162B718();
  id v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  id v6 = (char *)a1 + *(int *)(a2 + 32);

  return v8(v6, v5);
}

char *sub_2415FB740(char *a1, uint64_t a2, int *a3)
{
  id v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v8 = *(void *)(a2 + 24);
  *((void *)a1 + 2) = *(void *)(a2 + 16);
  *((void *)a1 + 3) = v8;
  *((void *)a1 + 4) = *(void *)(a2 + 32);
  uint64_t v9 = a3[7];
  id v15 = &a1[v9];
  uint64_t v10 = a2 + v9;
  uint64_t v11 = sub_24162B718();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v7;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v12(v15, v10, v11);
  v12(&a1[a3[8]], a2 + a3[8], v11);
  a1[a3[9]] = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_2415FB838(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  id v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24162B718();
  id v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v13(a1 + a3[8], a2 + a3[8], v12);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_2415FB944(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24162B718();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + a3[8], a2 + a3[8], v9);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_2415FBA14(uint64_t a1, char *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v7 = *((void *)a2 + 2);
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *((void *)a2 + 4);
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24162B718();
  id v13 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  v13(a1 + a3[8], &a2[a3[8]], v12);
  *(unsigned char *)(a1 + a3[9]) = a2[a3[9]];
  return a1;
}

uint64_t sub_2415FBAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2415FBB10);
}

uint64_t sub_2415FBB10(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24162B718();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2415FBBC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2415FBBD4);
}

void *sub_2415FBBD4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24162B718();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2415FBC7C()
{
  uint64_t result = sub_24162B718();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_2415FBD30()
{
  qword_268D04238 = 0x4000000000000000;
}

void sub_2415FBD40()
{
  qword_268D04240 = 0x4018000000000000;
}

void sub_2415FBD50()
{
  qword_268D04248 = 0x402E000000000000;
}

void sub_2415FBD60()
{
  qword_268D04250 = 0x4014000000000000;
}

void sub_2415FBD70()
{
  qword_268D04258 = 0x4008000000000000;
}

void sub_2415FBD80()
{
  qword_268D04260 = 0x4010000000000000;
}

void sub_2415FBD90()
{
  qword_268D04268 = 0x4034000000000000;
}

void sub_2415FBDA0()
{
  qword_268D04270 = 0x4028000000000000;
}

void sub_2415FBDB0(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_noFactorsLabel);
  sub_2411B9D00(0, &qword_26B012140);
  id v2 = (id)sub_241632898();
  objc_msgSend(v1, sel_setFont_, v2);
}

void sub_2415FBE5C()
{
  id v0 = sub_2415F9140();
  sub_2415F97FC(v0);
}

void sub_2415FBEA4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2416331E8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_2415FBEF8()
{
  if (!qword_268D04308)
  {
    type metadata accessor for Key(255);
    sub_2411B9D00(255, (unint64_t *)&qword_26B012200);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D04308);
    }
  }
}

uint64_t sub_2415FBF78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2415FBFC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    uint64_t result = a4(v7);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2415FC008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CycleFactorsSectionViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2415FC06C()
{
  uint64_t v1 = v0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_viewModels] = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_factorSubviews] = v2;
  uint64_t v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_noFactorsLabel;
  *(void *)&v1[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  *(void *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView____lazy_storage___shortMonthDayYearDateFormatter] = 0;
  uint64_t v4 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23CycleFactorsSectionView_disclosureIndicator;
  sub_2411B9D00(0, (unint64_t *)&qword_268CFB650);
  id v5 = sub_24139840C();
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v5);

  id v7 = objc_msgSend(self, sel_tertiaryLabelColor);
  objc_msgSend(v6, sel_setTintColor_, v7);

  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v1[v4] = v6;

  sub_241633038();
  __break(1u);
}

void sub_2415FC1CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel);
  sub_2411B9D00(0, &qword_26B012140);
  uint64_t v3 = (void *)sub_241632898();
  objc_msgSend(v2, sel_setFont_, v3);

  uint64_t v4 = *(void **)(a1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_subtitleLabel);
  id v5 = (id)sub_241632898();
  objc_msgSend(v4, sel_setFont_, v5);
}

void sub_2415FC2D4()
{
  if (!qword_268D018A8)
  {
    unint64_t v0 = sub_2416330D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D018A8);
    }
  }
}

uint64_t sub_2415FC340(char a1, uint64_t a2)
{
  *(void *)(v3 + 120) = a2;
  *(void *)(v3 + 128) = v2;
  *(unsigned char *)(v3 + 161) = a1;
  return MEMORY[0x270FA2498](sub_2415FC364, 0, 0);
}

uint64_t sub_2415FC364()
{
  id v1 = objc_msgSend(*(id *)(v0 + 128), sel_featureIdentifier);
  uint64_t v2 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v4 = v3;
  if (v2 != _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() || v4 != v5)
  {
    char v7 = sub_241633218();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v7) {
      goto LABEL_8;
    }
    __break(1u);
  }
  swift_bridgeObjectRelease_n();

LABEL_8:
  id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, (*(unsigned char *)(v0 + 161) & 1) == 0);
  *(void *)(v0 + 136) = v8;
  id v9 = (id)HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier();
  if (!v9)
  {
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    id v9 = (id)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 144) = v9;
  uint64_t v10 = *(void **)(v0 + 128);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 160;
  *(void *)(v0 + 24) = sub_2415FC568;
  uint64_t v11 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_2415FCA8C;
  *(void *)(v0 + 104) = &unk_2650E80F8;
  *(void *)(v0 + 112) = v11;
  objc_msgSend(v10, sel_setFeatureSettingNumber_forKey_completion_, v8, v9, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2415FC568()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_2415FC6E0;
  }
  else {
    uint64_t v2 = sub_2415FC678;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415FC678()
{
  uint64_t v1 = *(void **)(v0 + 136);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2415FC6E0()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = (void *)v0[17];
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2415FC758(char a1, uint64_t a2)
{
  *(void *)(v3 + 120) = a2;
  *(void *)(v3 + 128) = v2;
  *(unsigned char *)(v3 + 161) = a1;
  return MEMORY[0x270FA2498](sub_2415FC77C, 0, 0);
}

uint64_t sub_2415FC77C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 128), sel_featureIdentifier);
  uint64_t v2 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v4 = v3;
  if (v2 != _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() || v4 != v5)
  {
    char v7 = sub_241633218();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v7) {
      goto LABEL_8;
    }
    __break(1u);
  }
  swift_bridgeObjectRelease_n();

LABEL_8:
  id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, *(unsigned __int8 *)(v0 + 161));
  *(void *)(v0 + 136) = v8;
  id v9 = (id)HKFeatureSettingsKeyForDeviationDetectionTypeEnabled();
  if (!v9)
  {
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    id v9 = (id)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 144) = v9;
  uint64_t v10 = *(void **)(v0 + 128);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 160;
  *(void *)(v0 + 24) = sub_2415FC97C;
  uint64_t v11 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_2415FCA8C;
  *(void *)(v0 + 104) = &unk_2650E8110;
  *(void *)(v0 + 112) = v11;
  objc_msgSend(v10, sel_setFeatureSettingNumber_forKey_completion_, v8, v9, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2415FC97C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_2415FCBA4;
  }
  else {
    uint64_t v2 = sub_2415FCBA8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2415FCA8C(uint64_t a1, char a2, void *a3)
{
  sub_2415FCB4C();
  uint64_t v6 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_2411CE834();
    uint64_t v7 = swift_allocError();
    *id v8 = a3;
    id v9 = a3;
    return MEMORY[0x270FA2410](v6, v7);
  }
  else
  {
    **(unsigned char **)(*(void *)(v6 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

unint64_t sub_2415FCB4C()
{
  unint64_t result = qword_268D04320;
  if (!qword_268D04320)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, &qword_268D04320);
  }
  return result;
}

uint64_t sub_2415FCE8C()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_24162D2C8();
  uint64_t v37 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_clearColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v7);

  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView], sel_setEditable_, 0);
  objc_msgSend(*(id *)&v1[v8], sel_setSelectable_, 1);
  objc_msgSend(*(id *)&v1[v8], sel_setDelegate_, v1);
  id v9 = *(id *)&v1[v8];
  id v10 = objc_msgSend(v6, sel_clearColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v10);

  objc_msgSend(*(id *)&v1[v8], sel_setScrollEnabled_, 0);
  id v11 = objc_msgSend(*(id *)&v1[v8], sel_textContainer);
  objc_msgSend(v11, sel_setLineFragmentPadding_, 0.0);

  objc_msgSend(*(id *)&v1[v8], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, *(void *)&v1[v8]);
  sub_2411BFC90();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_24163B1D0;
  id v13 = objc_msgSend(*(id *)&v1[v8], sel_leadingAnchor);
  id v14 = objc_msgSend(v1, sel_leadingAnchor);
  sub_24162D2B8();
  sub_24162D1C8();
  double v16 = v15;
  id v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v5, v2);
  id v18 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14, v16);

  *(void *)(v12 + 32) = v18;
  id v19 = objc_msgSend(*(id *)&v1[v8], sel_topAnchor);
  id v20 = objc_msgSend(v1, sel_topAnchor);
  id v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

  *(void *)(v12 + 40) = v21;
  id v22 = objc_msgSend(v1, sel_bottomAnchor);
  id v23 = objc_msgSend(*(id *)&v1[v8], sel_bottomAnchor);
  id v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

  *(void *)(v12 + 48) = v24;
  id v25 = objc_msgSend(v1, sel_trailingAnchor);
  id v26 = objc_msgSend(*(id *)&v1[v8], sel_trailingAnchor);
  sub_24162D2B8();
  sub_24162D1C8();
  double v28 = v27;
  v17(v5, v37);
  id v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, v28);

  *(void *)(v12 + 56) = v29;
  uint64_t v39 = v12;
  sub_241631F48();
  id v30 = self;
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  uint64_t v31 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v31);

  sub_2411F5424(0, (unint64_t *)&qword_268CFA920, (void (*)(uint64_t))sub_2411E590C);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_241637EE0;
  uint64_t v33 = sub_24162F5B8();
  uint64_t v34 = MEMORY[0x263F82018];
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v34;
  sub_241632918();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_2415FD374()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2411B9D00(0, &qword_26B012140);
  id v39 = (id)sub_241632898();
  uint64_t v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView;
  id v4 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView), sel_text);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v38 = v3;
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();

    sub_2411F5424(0, (unint64_t *)&qword_268CFA900, (void (*)(uint64_t))sub_2411E0CA8);
    uint64_t inited = swift_initStackObject();
    id v7 = (void **)MEMORY[0x263F814F0];
    *(_OWORD *)(inited + 16) = xmmword_24163A4F0;
    uint64_t v8 = *v7;
    *(void *)(inited + 32) = *v7;
    *(void *)(inited + 40) = v39;
    id v9 = (void *)*MEMORY[0x263F81500];
    *(void *)(inited + 64) = v2;
    *(void *)(inited + 72) = v9;
    id v10 = self;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    id v11 = v8;
    id v40 = v39;
    id v36 = v9;
    id v37 = v10;
    id v12 = objc_msgSend(v10, sel_secondaryLabelColor);
    uint64_t v13 = sub_2411B9D00(0, (unint64_t *)&qword_268CFA910);
    *(void *)(inited + 104) = v13;
    *(void *)(inited + 80) = v12;
    sub_2414E42B8(inited);
    id v14 = objc_allocWithZone(MEMORY[0x263F089B8]);
    uint64_t v15 = v1;
    double v16 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_2411CCDB4();
    id v17 = (void *)sub_241631B18();
    swift_bridgeObjectRelease();
    id v18 = objc_msgSend(v14, sel_initWithString_attributes_, v16, v17);

    uint64_t v19 = v15;
    if (*(void *)(v15
                   + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_highlightedText
                   + 8))
    {
      id v20 = v18;
      uint64_t v21 = swift_initStackObject();
      *(_OWORD *)(v21 + 16) = xmmword_24163A4F0;
      *(void *)(v21 + 32) = v36;
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      id v22 = v36;
      *(void *)(v21 + 40) = objc_msgSend(v37, sel_hk_appKeyColor);
      id v23 = (void *)*MEMORY[0x263F81520];
      uint64_t v24 = MEMORY[0x263F8D310];
      *(void *)(v21 + 64) = v13;
      *(void *)(v21 + 72) = v23;
      *(void *)(v21 + 104) = v24;
      *(void *)(v21 + 80) = 0x2F2F3A706174;
      *(void *)(v21 + 88) = 0xE600000000000000;
      id v25 = v23;
      sub_2414E42B8(v21);
      id v26 = (void *)sub_241631B18();
      swift_bridgeObjectRelease();
      id v27 = objc_allocWithZone(NSString);
      double v28 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      id v29 = objc_msgSend(v27, sel_initWithString_, v28);

      id v30 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      id v31 = objc_msgSend(v29, sel_rangeOfString_, v30);
      uint64_t v33 = v32;

      objc_msgSend(v20, sel_addAttributes_range_, v26, v31, v33);
    }
    else
    {
      swift_bridgeObjectRelease();
      id v20 = v18;
    }
    id v34 = *(id *)(v19 + v38);
    id v35 = v20;
    objc_msgSend(v34, sel_setAttributedText_, v35);
  }
  else
  {
  }
}

id sub_2415FD7A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TappableCollectionViewFooterView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TappableCollectionViewFooterView()
{
  return self;
}

void sub_2415FD864()
{
}

uint64_t sub_2415FD888(uint64_t a1, id a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_24162B448();
  if (v8)
  {
    if (v7 == 7364980 && v8 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v9 = sub_241633218();
      swift_bridgeObjectRelease();
      if ((v9 & 1) == 0) {
        return 0;
      }
    }
    id v10 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView), sel_text);
    if (v10)
    {
      id v11 = v10;
      _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();

      if (*(void *)(v4
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_highlightedText
                     + 8))
      {
        id v12 = objc_allocWithZone(NSString);
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        uint64_t v13 = (void *)sub_241631CC8();
        swift_bridgeObjectRelease();
        id v14 = objc_msgSend(v12, sel_initWithString_, v13);

        uint64_t v15 = (void *)sub_241631CC8();
        swift_bridgeObjectRelease();
        id v16 = objc_msgSend(v14, sel_rangeOfString_, v15);
        uint64_t v18 = v17;

        if (v16 == a2 && v18 == a3)
        {
          id v20 = *(void (**)(uint64_t))(v4
                                               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_tapCompletion);
          uint64_t v21 = swift_retain();
          v20(v21);
          swift_release();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  return 0;
}

double sub_2415FDA44()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CycleChartsModel() + 32));
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v24 = MEMORY[0x263F8EE78];
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_24149DD04(0, v2, 0);
    uint64_t v4 = v1 + 32;
    do
    {
      sub_2411A3DF4(v4, (uint64_t)v21);
      uint64_t v6 = v22;
      uint64_t v5 = v23;
      sub_2411B6854(v21, v22);
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(v5 + 16) + 24))(v6);
      if (v8)
      {
        if (v7)
        {
          if (v7 == 1)
          {
            double v9 = 17.5;
          }
          else
          {
            if (qword_268CF92F0 != -1) {
              swift_once();
            }
            double v9 = *(double *)&qword_268D23C48 + *(double *)&qword_268D23C48 + -1.0;
          }
        }
        else
        {
          if (qword_268CF92F0 != -1) {
            swift_once();
          }
          double v9 = *(double *)&qword_268D23C48;
        }
      }
      else
      {
        double v9 = *(double *)&v7;
      }
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v21);
      uint64_t v3 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24149DD04(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v24;
      }
      unint64_t v11 = *(void *)(v3 + 16);
      unint64_t v10 = *(void *)(v3 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_24149DD04(v10 > 1, v11 + 1, 1);
        uint64_t v3 = v24;
      }
      *(void *)(v3 + 16) = v11 + 1;
      *(double *)(v3 + 8 * v11 + 32) = v9;
      v4 += 40;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = *(void *)(v3 + 16);
  if (!v12)
  {
    double v14 = 0.0;
    goto LABEL_29;
  }
  if (v12 == 1)
  {
    uint64_t v13 = 0;
    double v14 = 0.0;
LABEL_27:
    uint64_t v17 = v12 - v13;
    uint64_t v18 = (double *)(v3 + 8 * v13 + 32);
    do
    {
      double v19 = *v18++;
      double v14 = v14 + v19;
      --v17;
    }
    while (v17);
    goto LABEL_29;
  }
  uint64_t v13 = v12 & 0x7FFFFFFFFFFFFFFELL;
  uint64_t v15 = (double *)(v3 + 40);
  double v14 = 0.0;
  uint64_t v16 = v12 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v14 = v14 + *(v15 - 1) + *v15;
    v15 += 2;
    v16 -= 2;
  }
  while (v16);
  if (v12 != v13) {
    goto LABEL_27;
  }
LABEL_29:
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2415FDCB8()
{
  uint64_t v1 = v0;
  sub_2415FDE00();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_241637EE0;
  uint64_t v3 = type metadata accessor for CycleChartsModel();
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(v3 + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  *(void *)(v2 + 56) = &type metadata for CycleDayHeaderRow;
  *(void *)(v2 + 64) = &off_26F575448;
  double v9 = (void *)swift_allocObject();
  *(void *)(v2 + 32) = v9;
  v9[2] = v5;
  v9[3] = v6;
  v9[4] = v7;
  v9[5] = v8;
  uint64_t v10 = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241496C7C(v10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241637EE0;
  uint64_t v12 = *(int *)(v3 + 28);
  *(void *)(inited + 56) = &type metadata for CycleDateFooterRow;
  *(void *)(inited + 64) = &off_26F56CB20;
  *(_OWORD *)(inited + 32) = *(_OWORD *)(v1 + v12);
  sub_241496C7C(inited);
  return v2;
}

void sub_2415FDE00()
{
  if (!qword_268D03530)
  {
    sub_24122BF2C();
    unint64_t v0 = sub_2416331E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D03530);
    }
  }
}

uint64_t sub_2415FDE58()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2415FDE68()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_241633308();
  sub_241631DC8();
  if (!v1)
  {
    sub_241633328();
    if (*(void *)(v0 + 40)) {
      goto LABEL_3;
    }
LABEL_5:
    sub_241633328();
    return sub_241633358();
  }
  sub_241633328();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631DC8();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 40)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_241633328();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631DC8();
  swift_bridgeObjectRelease();
  return sub_241633358();
}

uint64_t sub_2415FDF58(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_24160199C(v7, v8) & 1;
}

uint64_t sub_2415FDFA4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 40);
  sub_241631DC8();
  if (!v1)
  {
    sub_241633328();
    if (v2) {
      goto LABEL_3;
    }
    return sub_241633328();
  }
  sub_241633328();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631DC8();
  swift_bridgeObjectRelease();
  if (!v2) {
    return sub_241633328();
  }
LABEL_3:
  sub_241633328();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631DC8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2415FE080()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 40);
  sub_241633308();
  sub_241631DC8();
  if (!v1)
  {
    sub_241633328();
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    sub_241633328();
    return sub_241633358();
  }
  sub_241633328();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631DC8();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_5;
  }
LABEL_3:
  sub_241633328();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631DC8();
  swift_bridgeObjectRelease();
  return sub_241633358();
}

id sub_2415FE164()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t)v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleStatisticsHorizontalCell_item;
  swift_beginAccess();
  sub_2416035C4(v6, (uint64_t)&v24, (uint64_t)&qword_268CFFE30, (uint64_t)sub_2411E1530, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241601A70);
  if (*((void *)&v25 + 1))
  {
    sub_2411E1530();
    type metadata accessor for CycleStatisticsSummaryItem();
    if (swift_dynamicCast())
    {
      swift_release();
      return objc_msgSend(v1, sel_setNeedsUpdateConfiguration);
    }
  }
  else
  {
    sub_241603638((uint64_t)&v24, (uint64_t)&qword_268CFFE30, (uint64_t)sub_2411E1530, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_241601A70);
  }
  sub_24162EF48();
  id v8 = v1;
  double v9 = sub_24162EF98();
  os_log_type_t v10 = sub_2416322C8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v3;
    uint64_t v12 = v11;
    uint64_t v21 = swift_slowAlloc();
    v23[0] = v21;
    *(_DWORD *)uint64_t v12 = 136446466;
    uint64_t v13 = sub_2416333E8();
    *(void *)&long long v24 = sub_2411B6898(v13, v14, v23);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v20 = v2;
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
    sub_2416035C4(v6, (uint64_t)&v24, (uint64_t)&qword_268CFFE30, (uint64_t)sub_2411E1530, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241601A70);
    sub_241601A70(0, (unint64_t *)&qword_268CFFE30, (uint64_t (*)(uint64_t))sub_2411E1530, v15);
    uint64_t v16 = sub_241631D78();
    *(void *)&long long v24 = sub_2411B6898(v16, v17, v23);
    sub_241632C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v9, v10, "[%{public}s] Received unexpected item %s.", (uint8_t *)v12, 0x16u);
    uint64_t v18 = v21;
    swift_arrayDestroy();
    MEMORY[0x245621640](v18, -1, -1);
    MEMORY[0x245621640](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  swift_beginAccess();
  sub_2412309A4((uint64_t)&v24, v6);
  return (id)swift_endAccess();
}

id sub_2415FE588(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_241601A70(0, (unint64_t *)&unk_268D000D0, MEMORY[0x263F81EE0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = &v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleStatisticsHorizontalCell_item];
  *(_OWORD *)uint64_t v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((void *)v13 + 4) = 0;
  v21.receiver = v4;
  v21.super_class = ObjectType;
  id v14 = objc_msgSendSuper2(&v21, sel_initWithFrame_, a1, a2, a3, a4);
  sub_24162F128();
  uint64_t v15 = sub_24162F168();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 0, 1, v15);
  MEMORY[0x24561FB60](v12);
  objc_msgSend(v14, sel_setAutomaticallyUpdatesBackgroundConfiguration_, 1);
  uint64_t v16 = self;
  id v17 = v14;
  id v18 = objc_msgSend(v16, sel_tertiarySystemBackgroundColor);
  objc_msgSend(v17, sel_setBackgroundColor_, v18);

  *(void *)(swift_allocObject() + 16) = v17;
  id v19 = v17;
  sub_2416326A8();

  return v19;
}

uint64_t sub_2415FE790()
{
  sub_241601B1C();
  v2[3] = v0;
  v2[4] = sub_241603140(&qword_268D04390, (void (*)(uint64_t))sub_241601B1C);
  sub_2411B6C70(v2);
  sub_241601BE0(0);
  sub_241602D5C(&qword_268D04380, sub_241601BE0, (void (*)(void))sub_241601D10);
  sub_241630788();
  return MEMORY[0x24561FB40](v2);
}

uint64_t sub_2415FE898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_241630898();
  uint64_t v26 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CycleStatisticsHorizontalView();
  MEMORY[0x270FA5388](v7);
  double v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_241601C5C(0);
  uint64_t v27 = *(void *)(v10 - 8);
  uint64_t v28 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241601C14(0);
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleStatisticsHorizontalCell_item;
  swift_beginAccess();
  sub_2416035C4(v18, (uint64_t)&v30, (uint64_t)&qword_268CFFE30, (uint64_t)sub_2411E1530, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241601A70);
  if (!v31)
  {
    sub_241603638((uint64_t)&v30, (uint64_t)&qword_268CFFE30, (uint64_t)sub_2411E1530, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_241601A70);
    goto LABEL_7;
  }
  sub_2411E1530();
  type metadata accessor for CycleStatisticsSummaryItem();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:
    uint64_t v22 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(a2, v22, 1, v14);
  }
  uint64_t v24 = v29;
  uint64_t v25 = a2;
  uint64_t v19 = *(void *)(v29 + 16);
  *(void *)((char *)v9 + *(int *)(v7 + 20)) = swift_getKeyPath();
  sub_241601A70(0, &qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  *double v9 = v19;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241630888();
  uint64_t v20 = sub_241601CDC();
  sub_241630E18();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
  sub_2416034F0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for CycleStatisticsHorizontalView);
  if (qword_26B00F370 != -1) {
    swift_once();
  }
  long long v30 = xmmword_26B017FC8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  *(void *)&long long v30 = v7;
  *((void *)&v30 + 1) = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_241630D28();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v21);
  a2 = v25;
  sub_241602E30((uint64_t)v17, v25, (uint64_t (*)(void))sub_241601C14);
  uint64_t v22 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(a2, v22, 1, v14);
}

uint64_t type metadata accessor for CycleStatisticsHorizontalCell()
{
  return self;
}

ValueMetadata *type metadata accessor for CycleStatisticRow()
{
  return &type metadata for CycleStatisticRow;
}

unint64_t sub_2415FEEC8()
{
  unint64_t result = qword_268D04350;
  if (!qword_268D04350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04350);
  }
  return result;
}

uint64_t sub_2415FEF1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleStatisticsHorizontalCell_item;
  swift_beginAccess();
  return sub_2416035C4(v3, a1, (uint64_t)&qword_268CFFE30, (uint64_t)sub_2411E1530, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241601A70);
}

uint64_t sub_2415FEFB4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleStatisticsHorizontalCell_item;
  swift_beginAccess();
  sub_2411FA3DC(a1, v3);
  swift_endAccess();
  sub_2415FE164();
  return sub_241603638(a1, (uint64_t)&qword_268CFFE30, (uint64_t)sub_2411E1530, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_241601A70);
}

id (*sub_2415FF068(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2415FF0C8;
}

id sub_2415FF0C8(uint64_t a1, char a2)
{
  id result = (id)swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_2415FE164();
  }
  return result;
}

uint64_t sub_2415FF0FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  sub_241602790(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241602B00(0);
  uint64_t v64 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v59 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v60 = (uint64_t)&v58 - v8;
  sub_241602990(0, &qword_268D043F8, (uint64_t (*)(uint64_t))sub_241602B8C, (uint64_t (*)(uint64_t))sub_241602B00, MEMORY[0x263F19B20]);
  uint64_t v61 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v63 = (uint64_t)&v58 - v10;
  sub_241602BB4(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241602B8C(0);
  uint64_t v62 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v58 = (uint64_t)&v58 - v18;
  uint64_t v19 = sub_241630128();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v58 - v24;
  type metadata accessor for CycleStatisticsHorizontalView();
  uint64_t v26 = v1;
  sub_241428880((uint64_t)v25);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, *MEMORY[0x263F18CB8], v19);
  sub_241603140(&qword_268D021D8, MEMORY[0x263F18D80]);
  char v27 = sub_241631BB8();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v20 + 8);
  v28(v22, v19);
  v28(v25, v19);
  uint64_t v29 = sub_241630488();
  if (v27)
  {
    *(void *)uint64_t v4 = v29;
    *((void *)v4 + 1) = 0;
    v4[16] = 1;
    sub_241602F80(0, &qword_268D04450, &qword_268D043B0, (uint64_t (*)(uint64_t))sub_2416027C0);
    sub_2415FFEE4(v26, (uint64_t)&v4[*(int *)(v30 + 44)]);
    char v31 = sub_2416309B8();
    sub_24162FE78();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    uint64_t v40 = v59;
    sub_241603258((uint64_t)v4, v59, (uint64_t (*)(void))sub_241602790);
    uint64_t v41 = v40 + *(int *)(v64 + 36);
    *(unsigned char *)uint64_t v41 = v31;
    *(void *)(v41 + 8) = v33;
    *(void *)(v41 + 16) = v35;
    *(void *)(v41 + 24) = v37;
    *(void *)(v41 + 32) = v39;
    *(unsigned char *)(v41 + 40) = 0;
    sub_2416034F0((uint64_t)v4, (uint64_t (*)(void))sub_241602790);
    uint64_t v42 = v60;
    sub_241602E30(v40, v60, (uint64_t (*)(void))sub_241602B00);
    sub_241603258(v42, v63, (uint64_t (*)(void))sub_241602B00);
    swift_storeEnumTagMultiPayload();
    sub_241602ECC(&qword_268D04430, sub_241602B8C, (void (*)(void))sub_241602E98);
    sub_241602ECC(&qword_268D04440, sub_241602B00, (void (*)(void))sub_241602F4C);
    sub_241630638();
    unint64_t v43 = sub_241602B00;
    uint64_t v44 = v42;
  }
  else
  {
    *(void *)uint64_t v13 = v29;
    *((void *)v13 + 1) = 0;
    v13[16] = 1;
    sub_241602F80(0, &qword_268D04428, &qword_268D04410, (uint64_t (*)(uint64_t))sub_241602C84);
    sub_2415FF848(v26, (uint64_t)&v13[*(int *)(v45 + 44)]);
    char v46 = sub_2416309B8();
    sub_24162FE78();
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    uint64_t v54 = v53;
    sub_241603258((uint64_t)v13, (uint64_t)v16, (uint64_t (*)(void))sub_241602BB4);
    uint64_t v55 = &v16[*(int *)(v62 + 36)];
    *uint64_t v55 = v46;
    *((void *)v55 + 1) = v48;
    *((void *)v55 + 2) = v50;
    *((void *)v55 + 3) = v52;
    *((void *)v55 + 4) = v54;
    v55[40] = 0;
    sub_2416034F0((uint64_t)v13, (uint64_t (*)(void))sub_241602BB4);
    uint64_t v56 = v58;
    sub_241602E30((uint64_t)v16, v58, (uint64_t (*)(void))sub_241602B8C);
    sub_241603258(v56, v63, (uint64_t (*)(void))sub_241602B8C);
    swift_storeEnumTagMultiPayload();
    sub_241602ECC(&qword_268D04430, sub_241602B8C, (void (*)(void))sub_241602E98);
    sub_241602ECC(&qword_268D04440, sub_241602B00, (void (*)(void))sub_241602F4C);
    sub_241630638();
    unint64_t v43 = sub_241602B8C;
    uint64_t v44 = v56;
  }
  return sub_2416034F0(v44, (uint64_t (*)(void))v43);
}

uint64_t sub_2415FF848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  sub_241601A70(0, &qword_268CFDDF8, MEMORY[0x263F1B518], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v40 - v4;
  uint64_t v6 = type metadata accessor for CycleStatisticsHorizontalView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  sub_241488934();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = (uint64_t)sub_241488934;
  sub_241602B28(0, &qword_268D00BE8, (void (*)(uint64_t))sub_241488934);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v42 = (uint64_t)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v40 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v40 - v18;
  *(void *)uint64_t v11 = sub_2416305A8();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  sub_2416032C0();
  uint64_t v20 = *(void *)(*(void *)a1 + 16);
  uint64_t v44 = 0;
  uint64_t v45 = v20;
  swift_getKeyPath();
  sub_241603258(a1, (uint64_t)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for CycleStatisticsHorizontalView);
  unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = swift_allocObject();
  sub_241602E30((uint64_t)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, (uint64_t (*)(void))type metadata accessor for CycleStatisticsHorizontalView);
  sub_24144ADD0();
  sub_241601A70(0, &qword_268D00B60, (uint64_t (*)(uint64_t))sub_241488ACC, MEMORY[0x263F1BAC8]);
  sub_241377F10();
  sub_241489070();
  sub_2416312E8();
  uint64_t v23 = sub_241631408();
  sub_241477DE0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v16, 0.0, 1, 0.0, 1, v23, v24);
  sub_2416034F0((uint64_t)v11, (uint64_t (*)(void))sub_241488934);
  sub_241603550((uint64_t)v16, (uint64_t)v19, (uint64_t)&qword_268D00BE8, v41, MEMORY[0x263F19110], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241602B28);
  sub_241367288();
  if (!sub_24139840C()) {
    id v25 = objc_msgSend(self, sel_hk_disclosureChevronImage);
  }
  sub_241631048();
  uint64_t v26 = *MEMORY[0x263F1B510];
  uint64_t v27 = sub_241631098();
  uint64_t v28 = *(void *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v5, v26, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v5, 0, 1, v27);
  uint64_t v41 = sub_241631078();
  swift_release();
  sub_241603638((uint64_t)v5, (uint64_t)&qword_268CFDDF8, MEMORY[0x263F1B518], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_241601A70);
  uint64_t v40 = sub_241630F68();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = sub_241630F68();
  uint64_t v31 = swift_getKeyPath();
  uint64_t v32 = MEMORY[0x263F19110];
  uint64_t v33 = v42;
  sub_2416035C4((uint64_t)v19, v42, (uint64_t)&qword_268D00BE8, (uint64_t)sub_241488934, MEMORY[0x263F19110], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241602B28);
  uint64_t v34 = v43;
  sub_2416035C4(v33, v43, (uint64_t)&qword_268D00BE8, (uint64_t)sub_241488934, v32, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241602B28);
  sub_241602C84();
  uint64_t v36 = (void *)(v34 + *(int *)(v35 + 48));
  uint64_t v37 = v40;
  *uint64_t v36 = v41;
  v36[1] = KeyPath;
  v36[2] = v37;
  _OWORD v36[3] = v31;
  v36[4] = v30;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v38 = MEMORY[0x263F19110];
  sub_241603638((uint64_t)v19, (uint64_t)&qword_268D00BE8, (uint64_t)sub_241488934, MEMORY[0x263F19110], (uint64_t (*)(void))sub_241602B28);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_241603638(v33, (uint64_t)&qword_268D00BE8, (uint64_t)sub_241488934, v38, (uint64_t (*)(void))sub_241602B28);
}

uint64_t sub_2415FFEE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_241601A70(0, &qword_268CFDDF8, MEMORY[0x263F1B518], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v29 - v5;
  sub_241602874();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v29 - v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v29 - v14;
  *(void *)uint64_t v12 = sub_241630498();
  *((void *)v12 + 1) = 0x4030000000000000;
  v12[16] = 0;
  sub_241602F80(0, &qword_268D04458, &qword_268D043C8, (uint64_t (*)(uint64_t))sub_241602928);
  sub_2416002C0(a1, &v12[*(int *)(v16 + 44)]);
  sub_241602E30((uint64_t)v12, (uint64_t)v15, (uint64_t (*)(void))sub_241602874);
  sub_241367288();
  if (!sub_24139840C()) {
    id v17 = objc_msgSend(self, sel_hk_disclosureChevronImage);
  }
  sub_241631048();
  uint64_t v18 = *MEMORY[0x263F1B510];
  uint64_t v19 = sub_241631098();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 104))(v6, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v6, 0, 1, v19);
  uint64_t v21 = sub_241631078();
  swift_release();
  sub_241603638((uint64_t)v6, (uint64_t)&qword_268CFDDF8, MEMORY[0x263F1B518], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_241601A70);
  uint64_t v22 = sub_241630F68();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = sub_241630F68();
  uint64_t v25 = swift_getKeyPath();
  sub_241603258((uint64_t)v15, (uint64_t)v9, (uint64_t (*)(void))sub_241602874);
  sub_241603258((uint64_t)v9, a2, (uint64_t (*)(void))sub_241602874);
  sub_2416027C0();
  uint64_t v27 = (uint64_t *)(a2 + *(int *)(v26 + 48));
  uint64_t *v27 = v21;
  v27[1] = KeyPath;
  void v27[2] = v22;
  v27[3] = v25;
  v27[4] = v24;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2416034F0((uint64_t)v15, (uint64_t (*)(void))sub_241602874);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_2416034F0((uint64_t)v9, (uint64_t (*)(void))sub_241602874);
}

uint64_t sub_2416002C0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CycleStatisticsHorizontalView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  sub_2414889DC();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v24 - v13;
  uint64_t v15 = *(void *)(*(void *)a1 + 16);
  v24[0] = 0;
  v24[1] = v15;
  swift_getKeyPath();
  sub_241603258(a1, (uint64_t)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for CycleStatisticsHorizontalView);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  sub_241602E30((uint64_t)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(void))type metadata accessor for CycleStatisticsHorizontalView);
  sub_24144ADD0();
  sub_241601A70(0, &qword_268D00B60, (uint64_t (*)(uint64_t))sub_241488ACC, MEMORY[0x263F1BAC8]);
  sub_241377F10();
  sub_241489070();
  sub_2416312E8();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v18(v11, v14, v8);
  LOBYTE(v24[0]) = 1;
  v18(a2, v11, v8);
  sub_241602928();
  uint64_t v20 = &a2[*(int *)(v19 + 48)];
  char v21 = v24[0];
  *(void *)uint64_t v20 = 0;
  v20[8] = v21;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v22)(v11, v8);
}

uint64_t sub_2416005B4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v115 = a3;
  uint64_t v5 = (uint64_t (*)(uint64_t))MEMORY[0x263F1B7B8];
  sub_241602990(0, &qword_268D04460, (uint64_t (*)(uint64_t))sub_241602AD8, MEMORY[0x263F1B7B8], MEMORY[0x263F19B20]);
  uint64_t v100 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v104 = (uint64_t)&v92 - v7;
  uint64_t v105 = sub_2416312C8();
  uint64_t v99 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v98 = (char *)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241602AD8(0);
  uint64_t v102 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v92 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v93 = (uint64_t)&v92 - v12;
  uint64_t v97 = sub_241630128();
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  char v95 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v94 = (uint64_t)&v92 - v15;
  sub_241602990(0, (unint64_t *)&qword_268D00BC8, (uint64_t (*)(uint64_t))sub_241602AD8, v5, MEMORY[0x263F19B28]);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v103 = (uint64_t)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v101 = (char *)&v92 - v19;
  sub_241601A70(0, &qword_268D00BB0, (uint64_t (*)(uint64_t))sub_241488EC0, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v114 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v113 = (char *)&v92 - v23;
  uint64_t v24 = sub_241630898();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v92 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241602A14(0);
  uint64_t v111 = v28;
  uint64_t v110 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v92 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241602990(0, (unint64_t *)&qword_268D00B70, (uint64_t (*)(uint64_t))sub_241602A14, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
  MEMORY[0x270FA5388](v31 - 8);
  uint64_t v112 = (uint64_t)&v92 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  id v108 = (char *)&v92 - v34;
  MEMORY[0x270FA5388](v35);
  uint64_t v117 = (uint64_t)&v92 - v36;
  unint64_t v37 = *a1;
  uint64_t v38 = sub_2416305A8();
  uint64_t v116 = a2;
  sub_2416014BC(a2, v37, (uint64_t)&v122);
  char v39 = v123[0];
  uint64_t v40 = *(void *)&v123[8];
  long long v41 = v122;
  long long v42 = *(_OWORD *)&v123[16];
  long long v43 = *(_OWORD *)v124;
  long long v44 = *(_OWORD *)&v124[16];
  long long v45 = *(_OWORD *)&v124[32];
  long long v122 = (unint64_t)v38;
  v123[0] = 1;
  *(_OWORD *)&v123[8] = v41;
  v123[24] = v39;
  *(void *)id v124 = v40;
  *(_OWORD *)&v124[8] = v42;
  *(_OWORD *)&v124[24] = v43;
  *(_OWORD *)&v124[40] = v44;
  long long v125 = v45;
  sub_241630888();
  sub_241488CE0(0);
  uint64_t v47 = v46;
  uint64_t v48 = sub_241488E8C();
  uint64_t v109 = v30;
  uint64_t v107 = v47;
  uint64_t v106 = v48;
  sub_241630E18();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  uint64_t v49 = *(void *)&v124[8];
  long long v50 = *(_OWORD *)&v124[16];
  long long v51 = *(_OWORD *)&v124[32];
  uint64_t v52 = *(void *)&v124[48];
  long long v53 = v125;
  sub_24120EFBC(*(uint64_t *)&v123[8], *(uint64_t *)&v123[16], v123[24]);
  swift_bridgeObjectRelease();
  sub_24120FDF0(v49, v50, SBYTE8(v50), v51);
  sub_24120FDF0(*((uint64_t *)&v51 + 1), v52, v53, *((uint64_t *)&v53 + 1));
  if (qword_26B00F370 != -1) {
    swift_once();
  }
  long long v122 = xmmword_26B017FC8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  uint64_t result = sub_241631E08();
  if ((v37 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v55 = v116;
  if (v37 >= *(void *)(*(void *)v116 + 16))
  {
LABEL_13:
    __break(1u);
    return result;
  }
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  swift_bridgeObjectRelease();
  uint64_t v120 = 32;
  unint64_t v121 = 0xE100000000000000;
  uint64_t v118 = 0;
  unint64_t v119 = 0xE000000000000000;
  sub_2411D662C();
  sub_241632C98();
  swift_bridgeObjectRelease();
  *(void *)&long long v122 = v107;
  *((void *)&v122 + 1) = v106;
  swift_getOpaqueTypeConformance2();
  uint64_t v56 = (uint64_t)v108;
  uint64_t v57 = v111;
  uint64_t v58 = v109;
  sub_241630D28();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v58, v57);
  sub_241603064(v56, v117);
  if (v37 == *(void *)(*(void *)v55 + 16) - 1)
  {
    sub_241488EC0(0);
    uint64_t v60 = (uint64_t)v113;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v113, 1, 1, v59);
    uint64_t v61 = (uint64_t)v114;
  }
  else
  {
    type metadata accessor for CycleStatisticsHorizontalView();
    uint64_t v62 = v94;
    sub_241428880(v94);
    uint64_t v63 = v96;
    uint64_t v64 = v95;
    uint64_t v65 = v97;
    (*(void (**)(char *, void, uint64_t))(v96 + 104))(v95, *MEMORY[0x263F18CB8], v97);
    char v66 = sub_241630118();
    double v67 = *(void (**)(char *, uint64_t))(v63 + 8);
    v67(v64, v65);
    v67((char *)v62, v65);
    id v68 = v98;
    sub_2416312B8();
    uint64_t v61 = (uint64_t)v114;
    uint64_t v60 = (uint64_t)v113;
    if (v66)
    {
      sub_2416313F8();
      sub_24162FFB8();
      uint64_t v69 = v99;
      uint64_t v70 = (uint64_t)v92;
      uint64_t v71 = v105;
      (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v92, v68, v105);
      uint64_t v72 = (long long *)(v70 + *(int *)(v102 + 36));
      long long v73 = *(_OWORD *)v123;
      *uint64_t v72 = v122;
      v72[1] = v73;
      v72[2] = *(_OWORD *)&v123[16];
      (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v71);
      uint64_t v74 = v93;
      sub_241602E30(v70, v93, (uint64_t (*)(void))sub_241602AD8);
      sub_241603258(v74, v104, (uint64_t (*)(void))sub_241602AD8);
      swift_storeEnumTagMultiPayload();
      sub_241602ECC(&qword_268D04468, sub_241602AD8, (void (*)(void))sub_24160310C);
      sub_24160310C();
      uint64_t v75 = (uint64_t)v101;
      sub_241630638();
      sub_2416034F0(v74, (uint64_t (*)(void))sub_241602AD8);
    }
    else
    {
      uint64_t v76 = v99;
      uint64_t v77 = v105;
      (*(void (**)(uint64_t, char *, uint64_t))(v99 + 16))(v104, v68, v105);
      swift_storeEnumTagMultiPayload();
      sub_241602ECC(&qword_268D04468, sub_241602AD8, (void (*)(void))sub_24160310C);
      sub_24160310C();
      uint64_t v75 = (uint64_t)v101;
      sub_241630638();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v68, v77);
    }
    uint64_t v78 = (uint64_t (*)(uint64_t))MEMORY[0x263F1B7B8];
    uint64_t v79 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F19B28];
    uint64_t v80 = v103;
    sub_241603188(v75, v103, (unint64_t *)&qword_268D00BC8, (uint64_t (*)(uint64_t))sub_241602AD8, MEMORY[0x263F1B7B8], MEMORY[0x263F19B28]);
    *(void *)uint64_t v61 = 0;
    *(unsigned char *)(v61 + 8) = 1;
    sub_241488EF4();
    uint64_t v82 = v81;
    sub_241603188(v80, v61 + *(int *)(v81 + 48), (unint64_t *)&qword_268D00BC8, (uint64_t (*)(uint64_t))sub_241602AD8, v78, v79);
    uint64_t v83 = v61 + *(int *)(v82 + 64);
    *(void *)uint64_t v83 = 0;
    *(unsigned char *)(v83 + 8) = 1;
    sub_2416031FC(v75, (unint64_t *)&qword_268D00BC8, (uint64_t (*)(uint64_t))sub_241602AD8, v78, v79);
    sub_2416031FC(v80, (unint64_t *)&qword_268D00BC8, (uint64_t (*)(uint64_t))sub_241602AD8, v78, v79);
    sub_241488EC0(0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56))(v61, 0, 1, v84);
    sub_241603550(v61, v60, (uint64_t)&qword_268D00BB0, (uint64_t)sub_241488EC0, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241601A70);
  }
  id v85 = (uint64_t (*)(uint64_t))MEMORY[0x263F1A470];
  id v86 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F18E28];
  uint64_t v87 = v112;
  sub_241603188(v117, v112, (unint64_t *)&qword_268D00B70, (uint64_t (*)(uint64_t))sub_241602A14, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
  uint64_t v88 = MEMORY[0x263F8D8F0];
  sub_2416035C4(v60, v61, (uint64_t)&qword_268D00BB0, (uint64_t)sub_241488EC0, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241601A70);
  uint64_t v89 = v60;
  uint64_t v90 = v115;
  sub_241603188(v87, v115, (unint64_t *)&qword_268D00B70, (uint64_t (*)(uint64_t))sub_241602A14, v85, v86);
  sub_241488ACC(0);
  sub_2416035C4(v61, v90 + *(int *)(v91 + 48), (uint64_t)&qword_268D00BB0, (uint64_t)sub_241488EC0, v88, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_241601A70);
  sub_241603638(v89, (uint64_t)&qword_268D00BB0, (uint64_t)sub_241488EC0, v88, (uint64_t (*)(void))sub_241601A70);
  sub_2416031FC(v117, (unint64_t *)&qword_268D00B70, (uint64_t (*)(uint64_t))sub_241602A14, v85, v86);
  sub_241603638(v61, (uint64_t)&qword_268D00BB0, (uint64_t)sub_241488EC0, v88, (uint64_t (*)(void))sub_241601A70);
  return sub_2416031FC(v87, (unint64_t *)&qword_268D00B70, (uint64_t (*)(uint64_t))sub_241602A14, v85, v86);
}

uint64_t sub_2416014BC@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)result;
  if (*(void *)(*(void *)result + 16) <= a2)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v74 = v3 + 32;
  unint64_t v75 = a2;
  sub_2411D662C();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v4 = sub_241630C28();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_241630F88();
  uint64_t v9 = sub_241630BA8();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_24120EFBC(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_2416309D8();
  uint64_t v14 = sub_241630BE8();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  swift_release();
  sub_24120EFBC(v9, v11, v13 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v21 = v75;
  uint64_t v69 = v3;
  unint64_t v22 = *(void *)(v3 + 16);
  if (v22 > v75)
  {
    char v70 = v18;
    uint64_t v71 = v16;
    uint64_t v72 = v20;
    uint64_t v76 = v14;
    uint64_t v23 = v3 + 32;
    if (*(void *)(v74 + 48 * v75 + 24))
    {
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      uint64_t v24 = sub_241630C28();
      uint64_t v26 = v25;
      char v28 = v27 & 1;
      sub_2416309E8();
      uint64_t v29 = sub_241630BE8();
      uint64_t v31 = v30;
      char v33 = v32;
      swift_release();
      char v34 = v33 & 1;
      sub_24120EFBC(v24, v26, v28);
      swift_bridgeObjectRelease();
      uint64_t v35 = sub_241630BD8();
      uint64_t v37 = v36;
      char v39 = v38 & 1;
      sub_24120EFBC(v29, v31, v34);
      swift_bridgeObjectRelease();
      sub_241630F88();
      uint64_t v40 = sub_241630BA8();
      uint64_t v42 = v41;
      char v44 = v43;
      uint64_t v46 = v45;
      swift_release();
      uint64_t v47 = v44 & 1;
      sub_24120EFBC(v35, v37, v39);
      swift_bridgeObjectRelease();
      uint64_t v23 = v3 + 32;
      unint64_t v21 = v75;
      if (*(void *)(v3 + 16) > v75) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v42 = 0;
      uint64_t v47 = 0;
      uint64_t v46 = 0;
      if (v22 > v75)
      {
LABEL_6:
        uint64_t v68 = v47;
        uint64_t v69 = v46;
        uint64_t v74 = v42;
        unint64_t v75 = v40;
        if (*(void *)(v23 + 48 * v21 + 40))
        {
          _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
          uint64_t v48 = sub_241630C28();
          uint64_t v50 = v49;
          char v52 = v51 & 1;
          sub_2416309D8();
          uint64_t v53 = sub_241630BE8();
          uint64_t v55 = v54;
          char v57 = v56;
          swift_release();
          char v58 = v57 & 1;
          sub_24120EFBC(v48, v50, v52);
          swift_bridgeObjectRelease();
          sub_241630F78();
          uint64_t v59 = sub_241630BA8();
          uint64_t v66 = v60;
          uint64_t v67 = v59;
          char v62 = v61;
          uint64_t v65 = v63;
          swift_release();
          uint64_t v64 = v62 & 1;
          sub_24120EFBC(v53, v55, v58);
          swift_bridgeObjectRelease();
LABEL_11:
          *(void *)a3 = v76;
          *(void *)(a3 + 8) = v71;
          *(unsigned char *)(a3 + 16) = v70 & 1;
          *(void *)(a3 + 24) = v72;
          *(void *)(a3 + 32) = v75;
          *(void *)(a3 + 40) = v74;
          *(void *)(a3 + 48) = v68;
          *(void *)(a3 + 56) = v69;
          *(void *)(a3 + 64) = v67;
          *(void *)(a3 + 72) = v66;
          *(void *)(a3 + 80) = v64;
          *(void *)(a3 + 88) = v65;
          sub_24120F7E4(v76, v71, v70 & 1);
          _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
          sub_24144B128(v75, v74, v68, v69);
          sub_24144B128(v67, v66, v64, v65);
          sub_24120FDF0(v67, v66, v64, v65);
          sub_24120FDF0(v75, v74, v68, v69);
          sub_24120EFBC(v76, v71, v70 & 1);
          return swift_bridgeObjectRelease();
        }
LABEL_10:
        uint64_t v66 = 0;
        uint64_t v67 = 0;
        uint64_t v64 = 0;
        uint64_t v65 = 0;
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_241601944@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_241630428();
  *a1 = result;
  return result;
}

uint64_t sub_241601970()
{
  return sub_241630438();
}

uint64_t sub_24160199C(void *a1, void *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v5 = sub_241633218();
    uint64_t result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a2[3];
  if (!v7)
  {
    if (v8) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v8) {
    return 0;
  }
  BOOL v9 = a1[2] == a2[2] && v7 == v8;
  if (v9 || (v10 = sub_241633218(), uint64_t result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    uint64_t v11 = a1[5];
    uint64_t v12 = a2[5];
    if (v11)
    {
      if (v12 && (a1[4] == a2[4] && v11 == v12 || (sub_241633218() & 1) != 0)) {
        return 1;
      }
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

void sub_241601A70(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_241601AD4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_241601B0C()
{
  return sub_2415FE790();
}

uint64_t sub_241601B14@<X0>(uint64_t a1@<X8>)
{
  return sub_2415FE898(*(void *)(v1 + 16), a1);
}

void sub_241601B1C()
{
  if (!qword_268D04358)
  {
    sub_241601BE0(255);
    sub_241602D5C(&qword_268D04380, sub_241601BE0, (void (*)(void))sub_241601D10);
    unint64_t v0 = sub_241630798();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D04358);
    }
  }
}

void sub_241601BE0(uint64_t a1)
{
}

void sub_241601C14(uint64_t a1)
{
}

void sub_241601C5C(uint64_t a1)
{
}

uint64_t type metadata accessor for CycleStatisticsHorizontalView()
{
  uint64_t result = qword_268D04398;
  if (!qword_268D04398) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_241601CDC()
{
  return sub_241603140(&qword_268D04378, (void (*)(uint64_t))type metadata accessor for CycleStatisticsHorizontalView);
}

unint64_t sub_241601D10()
{
  unint64_t result = qword_268D04388;
  if (!qword_268D04388)
  {
    sub_241601C14(255);
    type metadata accessor for CycleStatisticsHorizontalView();
    sub_241601CDC();
    swift_getOpaqueTypeConformance2();
    sub_241603140((unint64_t *)&qword_268CFBC98, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04388);
  }
  return result;
}

uint64_t *sub_241601DF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    char v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    char v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    unint64_t v8 = (uint64_t *)((char *)a2 + v6);
    sub_241601A70(0, &qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_241630128();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v5;
}

uint64_t sub_241601F44(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_241601A70(0, &qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_241630128();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_241602028(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (void *)((char *)a2 + v4);
  sub_241601A70(0, &qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_241630128();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  }
  else
  {
    void *v5 = *v6;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_241602128(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    unint64_t v8 = (void *)((char *)a2 + v6);
    uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x263F18D80];
    char v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_241603638((uint64_t)a1 + v6, (uint64_t)&qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_241601A70);
    sub_241601A70(0, &qword_268CFBA10, v9, v10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_241630128();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v7, v8, v11);
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

void *sub_241602274(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  sub_241601A70(0, &qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  uint64_t v8 = v7;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_241630128();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v5, v6, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

void *sub_241602374(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x263F18D80];
    char v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_241603638((uint64_t)a1 + v6, (uint64_t)&qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_241601A70);
    sub_241601A70(0, &qword_268CFBA10, v9, v10);
    uint64_t v12 = v11;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_241630128();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v7, v8, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2416024C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2416024DC);
}

uint64_t sub_2416024DC(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    sub_241601A70(0, &qword_268CFBF20, MEMORY[0x263F18D80], MEMORY[0x263F185D0]);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2416025BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2416025D0);
}

void *sub_2416025D0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    sub_241601A70(0, &qword_268CFBF20, MEMORY[0x263F18D80], MEMORY[0x263F185D0]);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_2416026A8()
{
  sub_241601A70(319, &qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_241602774()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_241602790(uint64_t a1)
{
}

void sub_2416027C0()
{
  if (!qword_268D043B8)
  {
    sub_241602874();
    sub_241602990(255, &qword_268D043E0, (uint64_t (*)(uint64_t))sub_241562E2C, (uint64_t (*)(uint64_t))sub_24121310C, MEMORY[0x263F18E28]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D043B8);
    }
  }
}

void sub_241602874()
{
  if (!qword_268D043C0)
  {
    sub_241601A70(255, &qword_268D043C8, (uint64_t (*)(uint64_t))sub_241602928, MEMORY[0x263F1BAC8]);
    sub_241602DCC(&qword_268D043D8, &qword_268D043C8, (uint64_t (*)(uint64_t))sub_241602928);
    unint64_t v0 = sub_2416311C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D043C0);
    }
  }
}

void sub_241602928()
{
  if (!qword_268D043D0)
  {
    sub_2414889DC();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D043D0);
    }
  }
}

void sub_241602990(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4(255);
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_241602A14(uint64_t a1)
{
}

void sub_241602A48(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    a3(255);
    a4();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v7) {
      atomic_store(OpaqueTypeMetadata2, a2);
    }
  }
}

void sub_241602AD8(uint64_t a1)
{
}

void sub_241602B00(uint64_t a1)
{
}

void sub_241602B28(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_241630188();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_241602B8C(uint64_t a1)
{
}

void sub_241602BB4(uint64_t a1)
{
}

void sub_241602BE4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  if (!*a2)
  {
    sub_241601A70(255, a3, a4, MEMORY[0x263F1BAC8]);
    sub_241602DCC(a5, a3, a4);
    unint64_t v9 = sub_2416311C8();
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_241602C84()
{
  if (!qword_268D04418)
  {
    sub_241602B28(255, &qword_268D00BE8, (void (*)(uint64_t))sub_241488934);
    sub_241602990(255, &qword_268D043E0, (uint64_t (*)(uint64_t))sub_241562E2C, (uint64_t (*)(uint64_t))sub_24121310C, MEMORY[0x263F18E28]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D04418);
    }
  }
}

uint64_t sub_241602D5C(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_241602DCC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_241601A70(255, a2, a3, MEMORY[0x263F1BAC8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_241602E30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_241602E98()
{
  return sub_241603140(&qword_268D04438, sub_241602BB4);
}

uint64_t sub_241602ECC(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_241602F4C()
{
  return sub_241603140(&qword_268D04448, sub_241602790);
}

void sub_241602F80(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*a2)
  {
    sub_241601A70(255, a3, a4, MEMORY[0x263F1BAC8]);
    unint64_t v5 = sub_241630028();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_241603004@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_241630428();
  *a1 = result;
  return result;
}

uint64_t sub_241603030()
{
  return sub_241630438();
}

uint64_t sub_241603064(uint64_t a1, uint64_t a2)
{
  sub_241602990(0, (unint64_t *)&qword_268D00B70, (uint64_t (*)(uint64_t))sub_241602A14, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24160310C()
{
  return sub_241603140(&qword_268D04470, MEMORY[0x263F1B7B8]);
}

uint64_t sub_241603140(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_241603188(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t), uint64_t (*a6)(uint64_t, uint64_t, uint64_t))
{
  sub_241602990(0, a3, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_2416031FC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  sub_241602990(0, a2, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_241603258(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2416032C0()
{
  if (!qword_268D04478)
  {
    sub_2414889DC();
    unint64_t v0 = sub_241630028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D04478);
    }
  }
}

uint64_t sub_24160332C()
{
  uint64_t v1 = (int *)(type metadata accessor for CycleStatisticsHorizontalView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[7];
  sub_241601A70(0, &qword_268CFBA10, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_241630128();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_241603470@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for CycleStatisticsHorizontalView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_2416005B4(a1, v6, a2);
}

uint64_t sub_2416034F0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_241603550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a2, a1, v8);
  return a2;
}

uint64_t sub_2416035C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_241603638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

unint64_t sub_24160369C()
{
  unint64_t result = qword_268D04480;
  if (!qword_268D04480)
  {
    sub_241602990(255, &qword_268D04488, (uint64_t (*)(uint64_t))sub_241602B8C, (uint64_t (*)(uint64_t))sub_241602B00, MEMORY[0x263F19B28]);
    sub_241602ECC(&qword_268D04430, sub_241602B8C, (void (*)(void))sub_241602E98);
    sub_241602ECC(&qword_268D04440, sub_241602B00, (void (*)(void))sub_241602F4C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04480);
  }
  return result;
}

void *sub_2416037D0(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_241545B6C((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_241633008();

  if (!v4) {
    return 0;
  }
  sub_2411B9D00(0, (unint64_t *)&unk_268D04520);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_2416038A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24162B718();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_24162BA08();
  MEMORY[0x270FA5388](v4 - 8);
  sub_241607460(0, (unint64_t *)&unk_26B00F1B0, MEMORY[0x263F090E8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v16[-v9];
  uint64_t v11 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource____lazy_storage___today;
  swift_beginAccess();
  sub_2411CE5A0(v11, (uint64_t)v10);
  uint64_t v12 = sub_241631AC8();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v13 + 32))(a1, v10, v12);
  }
  sub_2411CE634((uint64_t)v10);
  id v14 = objc_msgSend(*(id *)(v1 + 64), sel_currentCalendar);
  sub_24162B928();

  sub_24162B708();
  sub_241631A68();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16))(v7, a1, v12);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v7, 0, 1, v12);
  swift_beginAccess();
  sub_2413AE29C((uint64_t)v7, v11);
  return swift_endAccess();
}

void sub_241603B68()
{
  sub_241316C40(0, (unint64_t *)&qword_268D012A0, MEMORY[0x263F43E48]);
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = *(void **)(v0 + 72);
  if (!v10) {
    goto LABEL_9;
  }
  id v11 = v10;
  id v12 = objc_msgSend(v11, sel_cycles);
  if (!v12)
  {

LABEL_9:
    (*(void (**)(char *, void, uint64_t, __n128))(v3 + 104))(v5, *MEMORY[0x263F43E38], v2, v7);
    sub_24162D038();
    return;
  }
  uint64_t v13 = v12;
  sub_2411B9D00(0, (unint64_t *)&qword_26B00E610);
  unint64_t v14 = sub_241631F28();

  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_isOnboardingCompleted) & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v16 = (unsigned int *)MEMORY[0x263F43E38];
    goto LABEL_12;
  }
  if (v14 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v15 = sub_241633068();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_11;
  }
  uint64_t v16 = (unsigned int *)MEMORY[0x263F43E40];
LABEL_12:
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v9, *v16, v2);
  sub_24162D038();
}

uint64_t sub_241603D88()
{
  sub_2411CE634((uint64_t)v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource____lazy_storage___today);
  swift_unknownObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

id *sub_241603E08()
{
  swift_release();
  swift_bridgeObjectRelease();

  sub_2411CE634((uint64_t)v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource____lazy_storage___today);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_241603E90()
{
  sub_241603E08();

  return swift_deallocClassInstance();
}

uint64_t sub_241603EE8()
{
  return type metadata accessor for CycleHistoryDataSource();
}

uint64_t type metadata accessor for CycleHistoryDataSource()
{
  uint64_t result = qword_268D044C8;
  if (!qword_268D044C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_241603F3C()
{
  sub_241607460(319, (unint64_t *)&unk_26B00F1B0, MEMORY[0x263F090E8], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void *sub_241604054(uint64_t a1, uint64_t a2)
{
  return sub_241606EC4(a2);
}

uint64_t sub_24160407C()
{
  return sub_24162E588();
}

void sub_2416040F4(void *a1)
{
  type metadata accessor for CycleHistoryCell();
  sub_24160722C(&qword_268CFC2C8, (void (*)(uint64_t))type metadata accessor for CycleHistoryCell);
  sub_241632438();
  type metadata accessor for TileHeaderCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  type metadata accessor for TileHeaderItem();
  sub_24122C268();
  id v3 = (id)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v3);
}

void sub_2416041D8(void *a1)
{
  uint64_t v67 = type metadata accessor for CycleHistorySingleCycleModel(0);
  MEMORY[0x270FA5388](v67);
  uint64_t v68 = (void *)((char *)v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v66 = type metadata accessor for CycleHistorySingleCycleViewModel(0);
  MEMORY[0x270FA5388](v66);
  uint64_t v5 = (char *)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v76 = (void *)MEMORY[0x263F8EE78];
  uint64_t v69 = v1;
  LODWORD(v7) = *(unsigned __int8 *)(v1
                                   + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_shouldShowTileHeader);
  if (v7 == 1)
  {
    uint64_t v8 = sub_241605594();
    uint64_t v9 = sub_24158C34C(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v11 = v9[2];
    unint64_t v10 = v9[3];
    if (v11 >= v10 >> 1) {
      uint64_t v9 = sub_24158C34C((void *)(v10 > 1), v11 + 1, 1, v9);
    }
    uint64_t v71 = type metadata accessor for TileHeaderItem();
    uint64_t v72 = sub_24160722C(&qword_268CFD2D0, (void (*)(uint64_t))type metadata accessor for TileHeaderItem);
    *(void *)&long long v70 = v8;
    v9[2] = v11 + 1;
    sub_2411B6CD4(&v70, (uint64_t)&v9[5 * v11 + 4]);
    uint64_t v76 = v9;
  }
  id v12 = objc_msgSend(a1, sel_cycles);
  if (!v12) {
    goto LABEL_62;
  }
  uint64_t v13 = v12;
  sub_2411B9D00(0, (unint64_t *)&qword_26B00E610);
  uint64_t v14 = sub_241631F28();

  int64_t v15 = (unint64_t)v14 >> 62;
  if ((unint64_t)v14 >> 62) {
    goto LABEL_60;
  }
  uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v16)
  {
LABEL_61:
    swift_bridgeObjectRelease();
LABEL_62:
    sub_24162CFE8();
    sub_24162D758();
    swift_release();
    swift_bridgeObjectRelease();
    sub_241603B68();
    return;
  }
  while (v16 < 0)
  {
    uint64_t v17 = 3;
    if (v15) {
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v18 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
    if (v18 < v17) {
      goto LABEL_64;
    }
    if ((v14 & 0xC000000000000001) != 0)
    {
      uint64_t v20 = 0;
      do
      {
        uint64_t v21 = v20 + 1;
        sub_241632E98();
        uint64_t v20 = v21;
      }
      while (v17 != v21);
    }
    if (v15)
    {
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      uint64_t v22 = sub_241633078();
      uint64_t v65 = v23;
      int64_t v15 = v24;
      unint64_t v26 = v25;
      swift_bridgeObjectRelease_n();
      uint64_t v17 = v26 >> 1;
    }
    else
    {
      uint64_t v22 = v14 & 0xFFFFFFFFFFFFFF8;
      uint64_t v65 = (v14 & 0xFFFFFFFFFFFFFF8) + 32;
    }
    if (__OFSUB__(v17, v15)) {
      goto LABEL_65;
    }
    v59[1] = v59;
    unint64_t v75 = v6;
    swift_unknownObjectRetain();
    sub_241632F38();
    uint64_t v14 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_viewModelProviders;
    uint64_t v60 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_pregnancyModelProvider;
    v59[2] = v22;
    swift_unknownObjectRetain();
    if (v15 == v17)
    {
LABEL_54:
      swift_unknownObjectRelease();
      unint64_t v57 = v75;
      swift_unknownObjectRelease();
      uint64_t v58 = sub_241292B18(v57);
      swift_release();
      sub_2414970DC(v58);
      swift_unknownObjectRelease();
      goto LABEL_62;
    }
    unint64_t v6 = 0;
    char v27 = (uint64_t *)(v69 + v14);
    BOOL v28 = __OFSUB__(v17 - v15, 1);
    BOOL v64 = v28;
    unsigned int v62 = v7 ^ 1;
    uint64_t v61 = v17 - 1;
    v59[3] = MEMORY[0x263F8EE50] + 8;
    uint64_t v63 = v17;
    while (v15 < v17)
    {
      if (__OFADD__(v6, 1)) {
        goto LABEL_56;
      }
      uint64_t v29 = v68;
      uint64_t v30 = (uint64_t)v68 + *(int *)(v67 + 20);
      id v31 = *(id *)(v65 + 8 * v15);
      uint64_t v32 = v30;
      uint64_t v33 = v69;
      sub_2416038A8(v32);
      char v34 = *(void **)(v33 + 64);
      id v35 = objc_msgSend(v34, sel_currentCalendar);
      sub_24162B928();

      *uint64_t v29 = v31;
      swift_beginAccess();
      uint64_t v14 = *v27;
      if ((*v27 & 0xC000000000000001) != 0)
      {
        id v36 = v31;
        uint64_t v37 = sub_241633008();
        if (!v37) {
          goto LABEL_40;
        }
        uint64_t v14 = v37;
        uint64_t v73 = v37;
        sub_2411B9D00(0, (unint64_t *)&unk_268D04520);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v38 = v74;
        swift_unknownObjectRelease();

        if (v38) {
          goto LABEL_39;
        }
      }
      else if (*(void *)(v14 + 16))
      {
        unint64_t v39 = sub_241545B6C((uint64_t)v31);
        if ((v40 & 1) == 0)
        {
LABEL_40:

          goto LABEL_41;
        }
        id v38 = *(id *)(*(void *)(v14 + 56) + 8 * v39);

        if (v38)
        {
LABEL_39:
          swift_endAccess();
          goto LABEL_49;
        }
      }
LABEL_41:
      swift_endAccess();
      uint64_t v41 = *(void **)(v69 + 40);
      uint64_t v14 = *(void *)(v69 + v60);
      double v42 = *(double *)(v69 + 56);
      id v7 = *(id *)(v69 + 48);
      id v43 = v41;
      swift_unknownObjectRetain();
      sub_24152E030(v42);
      if ((unsigned __int128)(v44 * (__int128)10) >> 64 != (10 * v44) >> 63) {
        goto LABEL_58;
      }
      id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F45200]), sel_initWithHealthStore_analysisProvider_pregnancyModelProvider_maximumActiveDuration_minimumBufferDuration_shouldFetchCycleFactors_calendarCache_, v7, v43, v14, 10 * v44, 10, 1, v34);

      swift_unknownObjectRelease();
      swift_beginAccess();
      uint64_t v14 = *v27;
      if ((*v27 & 0xC000000000000001) != 0)
      {
        if (v14 >= 0) {
          v14 &= 0xFFFFFFFFFFFFFF8uLL;
        }
        id v45 = v31;
        id v46 = v38;
        uint64_t v47 = sub_241632D88();
        if (__OFADD__(v47, 1)) {
          goto LABEL_59;
        }
        uint64_t *v27 = sub_2416065BC(v14, v47 + 1);
      }
      else
      {
        id v48 = v31;
        id v49 = v38;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v74 = (void *)*v27;
      uint64_t *v27 = 0x8000000000000000;
      uint64_t v14 = (uint64_t)&v74;
      sub_241349B18((uint64_t)v38, v31, isUniquelyReferenced_nonNull_native);
      uint64_t *v27 = (uint64_t)v74;
      swift_bridgeObjectRelease();
      swift_endAccess();

LABEL_49:
      if (v64) {
        goto LABEL_57;
      }
      int64_t v51 = v15 + 1;
      if (v6) {
        char v52 = 0;
      }
      else {
        char v52 = v62;
      }
      BOOL v53 = v61 == v15;
      sub_2416073F8((uint64_t)v68, (uint64_t)v5, type metadata accessor for CycleHistorySingleCycleModel);
      uint64_t v54 = (int *)v66;
      *(void *)&v5[*(int *)(v66 + 20)] = v38;
      v5[v54[6]] = 51;
      v5[v54[7]] = v6 == 0;
      v5[v54[8]] = v53;
      v5[v54[9]] = 1;
      v5[v54[10]] = v52;
      v5[v54[11]] = 0;
      LODWORD(v7) = v69;
      uint64_t v55 = *(void *)(v69 + 56);
      type metadata accessor for CycleHistoryItem();
      char v56 = (void *)swift_allocObject();
      v56[3] = 0;
      swift_unknownObjectWeakInit();
      v56[5] = 0;
      swift_unknownObjectWeakInit();
      v56[7] = 0;
      swift_unknownObjectWeakInit();
      sub_2416073F8((uint64_t)v5, (uint64_t)v56 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryItem_viewModel, type metadata accessor for CycleHistorySingleCycleViewModel);
      *(void *)((char *)v56 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryItem_index) = v6;
      *(void *)((char *)v56 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryItem_containerWidth) = v55;
      v56[3] = &off_26F5792E8;
      swift_unknownObjectWeakAssign();
      v56[5] = &off_26F5792D8;
      swift_unknownObjectWeakAssign();

      uint64_t v14 = (uint64_t)&v75;
      sub_241632F18();
      sub_241632F48();
      sub_241632F58();
      sub_241632F28();
      ++v6;
      ++v15;
      uint64_t v17 = v63;
      if (v63 == v51) {
        goto LABEL_54;
      }
    }
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v16 = sub_241633068();
    swift_bridgeObjectRelease();
    if (!v16) {
      goto LABEL_61;
    }
  }
  if (v16 >= 3) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = v16;
  }
  if (!v15) {
    goto LABEL_13;
  }
LABEL_15:
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v19 = sub_241633068();
  swift_bridgeObjectRelease();
  if ((v19 & 0x8000000000000000) == 0)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v18 = sub_241633068();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
}

uint64_t sub_241604B20(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v20 = *v1;
  uint64_t v22 = sub_241631488();
  uint64_t v25 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2416314A8();
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24162AF38();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  uint64_t v21 = sub_2416325A8();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v14 = (v11 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v15 + v13, v12, v9);
  *(void *)(v15 + v14) = v2;
  *(void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8)) = v20;
  aBlock[4] = sub_241607360;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2411987F4;
  aBlock[3] = &unk_26F579348;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_241631498();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24160722C((unint64_t *)&qword_26B013080, MEMORY[0x263F8F030]);
  sub_241607460(0, (unint64_t *)&qword_26B013090, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2411ACDF0();
  uint64_t v17 = v22;
  sub_241632D08();
  uint64_t v18 = (void *)v21;
  MEMORY[0x24561FA80](0, v8, v5, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v8, v24);
}

void sub_241604F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = a3;
  uint64_t v51 = a1;
  sub_241607460(0, (unint64_t *)&unk_26B00F1B0, MEMORY[0x263F090E8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v43 - v5;
  uint64_t v7 = sub_24162B718();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_24162BA08();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_241631AC8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v54 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24162AF38();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24162EFA8();
  uint64_t v52 = *(void *)(v18 - 8);
  uint64_t v53 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v22 = v51;
  uint64_t v51 = v14;
  v21(v17, v22, v14);
  uint64_t v23 = sub_24162EF98();
  os_log_type_t v24 = sub_2416322E8();
  int v49 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    id v48 = v6;
    uint64_t v26 = v25;
    uint64_t v45 = swift_slowAlloc();
    v56[0] = v45;
    *(_DWORD *)uint64_t v26 = 136446466;
    os_log_t v44 = v23;
    uint64_t v27 = sub_2416333E8();
    uint64_t v47 = v12;
    uint64_t v55 = sub_2411B6898(v27, v28, v56);
    uint64_t v50 = v11;
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v43 = v26 + 14;
    uint64_t v29 = (void *)sub_24162AF28();
    uint64_t v30 = a2;
    uint64_t v31 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    id v46 = v10;
    unint64_t v33 = v32;

    uint64_t v34 = v31;
    a2 = v30;
    uint64_t v12 = v47;
    uint64_t v55 = sub_2411B6898(v34, v33, v56);
    uint64_t v11 = v50;
    sub_241632C28();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v51);
    os_log_t v35 = v44;
    _os_log_impl(&dword_24118E000, v44, (os_log_type_t)v49, "[%{public}s] Updating due to time notification: %s", (uint8_t *)v26, 0x16u);
    uint64_t v36 = v45;
    swift_arrayDestroy();
    MEMORY[0x245621640](v36, -1, -1);
    uint64_t v37 = v26;
    uint64_t v6 = v48;
    MEMORY[0x245621640](v37, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v51);
  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v53);
  id v38 = objc_msgSend(*(id *)(a2 + 64), sel_currentCalendar);
  sub_24162B928();

  sub_24162B708();
  unint64_t v39 = v54;
  sub_241631A68();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v6, v39, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v6, 0, 1, v11);
  uint64_t v40 = a2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource____lazy_storage___today;
  swift_beginAccess();
  sub_2413AE29C((uint64_t)v6, v40);
  swift_endAccess();
  uint64_t v41 = *(void **)(a2 + 72);
  if (v41)
  {
    id v42 = v41;
    sub_2416041D8(v42);
  }
}

void *sub_241605594()
{
  uint64_t v0 = sub_24162B7E8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_241631CA8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v16 - v6;
  sub_241631C38();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v9 = sub_241631D38();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  id v12 = objc_msgSend(self, sel_systemIndigoColor);
  if (qword_26B00F370 != -1) {
    swift_once();
  }
  v16[0] = xmmword_26B017FC8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  long long v13 = v16[0];
  type metadata accessor for TileHeaderItem();
  uint64_t v14 = (void *)swift_allocObject();
  v14[5] = 0;
  v14[3] = 0;
  v14[2] = 0;
  swift_unknownObjectWeakInit();
  v14[7] = 0;
  swift_unknownObjectWeakInit();
  v14[9] = 0;
  swift_unknownObjectWeakInit();
  v14[10] = v9;
  v14[11] = v11;
  v14[12] = v12;
  swift_beginAccess();
  *((_OWORD *)v14 + 1) = v13;
  swift_bridgeObjectRelease();
  v14[5] = &off_26F5792E8;
  swift_unknownObjectWeakAssign();
  v14[7] = &off_26F5792D8;
  swift_unknownObjectWeakAssign();
  return v14;
}

void sub_2416058CC(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_24162F338();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_24162B7E8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_241631CA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v27 - v10;
  id v12 = *(void **)(v1 + 72);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_msgSend(v13, sel_cycles);
    if (v14)
    {
      uint64_t v15 = v14;
      id v29 = v13;
      sub_2411B9D00(0, (unint64_t *)&qword_26B00E610);
      unint64_t v16 = sub_241631F28();

      if (v16 >> 62)
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        uint64_t v17 = sub_241633068();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      id v13 = v29;
      if (v17 >= 2)
      {
        unint64_t v28 = a1;
        sub_241631C38();
        v27[0] = *(void *)(v6 + 16);
        ((void (*)(char *, char *, uint64_t))v27[0])(v8, v11, v5);
        if (qword_26B0131F0 != -1) {
          swift_once();
        }
        id v18 = (id)qword_26B0181A0;
        sub_24162B7D8();
        uint64_t v19 = sub_241631D38();
        v27[1] = v20;
        void v27[2] = v19;
        uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
        v21(v11, v5);
        sub_241631C38();
        ((void (*)(char *, char *, uint64_t))v27[0])(v8, v11, v5);
        id v22 = (id)qword_26B0181A0;
        sub_24162B7D8();
        sub_241631D38();
        v21(v11, v5);
        swift_allocObject();
        swift_weakInit();
        swift_retain();
        sub_24162F2C8();
        uint64_t v23 = sub_24162CAE8();
        swift_allocObject();
        uint64_t v24 = sub_24162CAC8();
        swift_release();
        a1 = v28;
        v28[3] = v23;
        a1[4] = sub_24160722C(&qword_268CFD2C0, MEMORY[0x263F43AA8]);

        goto LABEL_13;
      }
    }
  }
  sub_241631C38();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v25 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  sub_24162F2C8();
  uint64_t v26 = sub_24162CAE8();
  swift_allocObject();
  uint64_t v24 = sub_24162CAC8();
  a1[3] = v26;
  a1[4] = sub_24160722C(&qword_268CFD2C0, MEMORY[0x263F43AA8]);
LABEL_13:
  *a1 = v24;
}

uint64_t sub_241605EDC(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    sub_24160D9E8(a1);
    return swift_release();
  }
  return result;
}

void sub_241605F64(uint64_t *a1@<X8>)
{
}

void sub_241605F88(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24162EFA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  id v9 = a2;
  uint64_t v10 = sub_24162EF98();
  os_log_type_t v11 = sub_2416322E8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v22 = v5;
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = v13;
    *(_DWORD *)id v12 = 136446210;
    uint64_t v21 = v12 + 4;
    uint64_t ObjectType = swift_getObjectType();
    sub_24144FD04();
    uint64_t v14 = sub_241631D48();
    uint64_t ObjectType = sub_2411B6898(v14, v15, &v24);
    sub_241632C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v10, v11, "[%{public}s] Showing the Cycle History View Controller", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v13, -1, -1);
    MEMORY[0x245621640](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  unint64_t v16 = *(void **)(v3 + 40);
  uint64_t v17 = *(void *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_pregnancyModelProvider);
  id v18 = *(void **)(v3 + 64);
  objc_allocWithZone((Class)type metadata accessor for CycleHistoryTableViewController());
  id v19 = v16;
  swift_unknownObjectRetain();
  id v20 = sub_24145AA98(v19, v17, v18);
  objc_msgSend(v9, sel_showViewController_sender_, v20, v3);
}

uint64_t sub_241606220(int a1)
{
  int v17 = a1;
  uint64_t v1 = sub_24162BB18();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241316C40(0, (unint64_t *)&unk_268D04510, MEMORY[0x263F43E58]);
  sub_2412FA5E8();
  uint64_t result = sub_24162D0D8();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = result;
    if (result)
    {
      uint64_t v7 = 0;
      id v8 = (void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v16 = v1;
      do
      {
        MEMORY[0x245618F80](v7, 0);
        sub_24162D168();
        (*v8)(v4, v1);
        sub_2411A3DF4((uint64_t)v20, (uint64_t)v19);
        sub_2411E1530();
        type metadata accessor for CycleHistoryItem();
        if (swift_dynamicCast())
        {
          uint64_t v9 = v18;
          if (MEMORY[0x245621790](v18 + 48))
          {
            uint64_t v10 = *(void *)(v9 + 56);
LABEL_12:
            uint64_t ObjectType = swift_getObjectType();
            uint64_t v13 = *(void (**)(void, unsigned char *, uint64_t, uint64_t))(v10 + 8);
            uint64_t v14 = v10;
            uint64_t v1 = v16;
            v13(v17 & 1, v20, ObjectType, v14);
            swift_release();
            swift_unknownObjectRelease();
LABEL_13:
            uint64_t result = _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v20);
            goto LABEL_5;
          }
        }
        else
        {
          sub_2411A3DF4((uint64_t)v20, (uint64_t)v19);
          type metadata accessor for TileHeaderItem();
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_13;
          }
          uint64_t v11 = v18;
          if (MEMORY[0x245621790](v18 + 64))
          {
            uint64_t v10 = *(void *)(v11 + 72);
            goto LABEL_12;
          }
        }
        _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v20);
        uint64_t result = swift_release();
LABEL_5:
        ++v7;
      }
      while (v6 != v7);
    }
  }
  return result;
}

void sub_241606498(uint64_t a1, char a2)
{
}

uint64_t sub_2416064C0()
{
  return sub_24160722C((unint64_t *)&unk_268D044E0, (void (*)(uint64_t))type metadata accessor for CycleHistoryDataSource);
}

uint64_t sub_241606508(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_241632D88();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v3 = sub_2416065BC(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_241349B18(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_2416065BC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_24134CB0C();
    uint64_t v2 = sub_2416330B8();
    uint64_t v18 = v2;
    sub_241632FE8();
    uint64_t v3 = sub_241633018();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_2411B9D00(0, (unint64_t *)&qword_26B00E610);
      do
      {
        swift_dynamicCast();
        sub_2411B9D00(0, (unint64_t *)&unk_268D04520);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_2413480A0(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_2416329A8();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_241633018();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

void *sub_24160680C(void *a1, uint64_t a2, uint64_t a3, char a4, void *a5, uint64_t a6, uint64_t a7, char a8, double a9, uint64_t a10, void *a11)
{
  uint64_t v12 = v11;
  *(void *)(v12 + 72) = 0;
  uint64_t v20 = v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource____lazy_storage___today;
  uint64_t v21 = sub_241631AC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  *(void *)(v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_viewModelProviders) = MEMORY[0x263F8EE80];
  *(void *)(v12 + 40) = a1;
  *(unsigned char *)(v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_isOnboardingCompleted) = a4;
  *(void *)(v12 + 48) = a5;
  *(double *)(v12 + 56) = a9;
  *(unsigned char *)(v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_shouldShowTileHeader) = a8;
  *(void *)(v12 + 64) = a11;
  sub_2411A3DF4(a7, (uint64_t)v34);
  sub_2411A3DF4(a6, (uint64_t)v33);
  type metadata accessor for CycleLogNavigationHandler();
  swift_allocObject();
  swift_retain();
  id v22 = a1;
  id v23 = a5;
  id v24 = a11;
  *(void *)(v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_navigationHandler) = sub_241610DF8(a10, a2, a3, a4, (uint64_t)v34, (uint64_t)v33);
  *(void *)(v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_pregnancyModelProvider) = *(void *)(a10 + 32);
  swift_unknownObjectRetain();
  swift_release();
  sub_241607460(0, (unint64_t *)&qword_268D00EC0, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
  sub_24162D678();
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_241637EE0;
  sub_24162D668();
  uint64_t v26 = sub_241341D68(v25, 1);
  uint64_t v27 = self;
  swift_retain();
  id v28 = objc_msgSend(v27, sel_defaultCenter);
  objc_msgSend(v28, sel_addObserver_selector_name_object_, v26, sel_significantTimeChangeDidOccur_, *MEMORY[0x263F83390], 0);

  id v29 = objc_msgSend(v27, sel_defaultCenter);
  objc_msgSend(v29, sel_addObserver_selector_name_object_, v26, sel_significantTimeChangeDidOccur_, *MEMORY[0x263EFF3C8], 0);

  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(a7);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(a6);
  return v26;
}

void sub_241606B44(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24162EFA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2416314D8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  *uint64_t v11 = sub_2416325A8();
  (*(void (**)(uint64_t *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F0E0], v8);
  char v12 = sub_241631508();
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    sub_24162EF48();
    char v13 = sub_24162EF98();
    os_log_type_t v14 = sub_2416322E8();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v25 = v16;
      *(_DWORD *)uint64_t v15 = 136446466;
      uint64_t v23 = v4;
      uint64_t v17 = sub_2416333E8();
      uint64_t v24 = sub_2411B6898(v17, v18, &v25);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      char v19 = a1 & 1;
      LOBYTE(v24) = a1 & 1;
      uint64_t v20 = sub_241631D78();
      uint64_t v24 = sub_2411B6898(v20, v21, &v25);
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v13, v14, "[%{public}s] Received availability update to: %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245621640](v16, -1, -1);
      MEMORY[0x245621640](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v23);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      char v19 = a1 & 1;
    }
    *(unsigned char *)(v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_isOnboardingCompleted) = v19;
    sub_241603B68();
  }
  else
  {
    __break(1u);
  }
}

void *sub_241606EC4(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v1 = sub_24162F4A8();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_24162F548();
  uint64_t v19 = *(void *)(v2 - 8);
  uint64_t v20 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24162F538();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24162F5A8();
  uint64_t v9 = *(void *)(v22 - 8);
  __n128 v10 = MEMORY[0x270FA5388](v22);
  char v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *MEMORY[0x263F81FC8];
  os_log_type_t v14 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 104);
  v14(v8, v13, v5, v10);
  sub_24162F558();
  id v15 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  sub_24162F578();
  if ((*(unsigned char *)(v21 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CycleHistoryDataSource_shouldShowTileHeader) & 1) == 0)
  {
    (*(void (**)(char *, void, uint64_t))(v19 + 104))(v4, *MEMORY[0x263F82000], v20);
    sub_24162F568();
  }
  sub_24162F598();
  ((void (*)(char *, uint64_t, uint64_t))v14)(v8, v13, v5);
  sub_24162F488();
  sub_24162F528();
  sub_2411B9D00(0, &qword_268CFC750);
  uint64_t v16 = (void *)sub_2416327F8();
  objc_msgSend(v16, sel_setContentInsetsReference_, 3);
  objc_msgSend(v16, sel_setContentInsets_, 0.0, 0.0, 10.0, 0.0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v22);
  return v16;
}

uint64_t sub_24160722C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_241607274()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2416072AC(void *a1)
{
  return sub_241605EDC(a1);
}

uint64_t sub_2416072B4()
{
  uint64_t v1 = sub_24162AF38();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_241607360()
{
  uint64_t v1 = *(void *)(sub_24162AF38() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_241604F1C(v0 + v2, v4, v5);
}

uint64_t sub_2416073F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_241607460(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void *sub_2416074C4(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    __n128 v10 = (char *)a2 + v8;
    uint64_t v11 = sub_241631AC8();
    char v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(type metadata accessor for CycleDay() + 20);
    os_log_type_t v14 = *(void **)&v10[v13];
    *(void *)&v9[v13] = v14;
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)v7 + v15;
    uint64_t v17 = (char *)a2 + v15;
    id v18 = v14;
    v12(v16, v17, v11);
    uint64_t v19 = a3[9];
    *((unsigned char *)v7 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    uint64_t v20 = *(void **)((char *)a2 + v19);
    *(void *)((char *)v7 + v19) = v20;
    uint64_t v21 = a3[10];
    uint64_t v22 = *(void **)((char *)a2 + v21);
    *(void *)((char *)v7 + v21) = v22;
    id v23 = v20;
    id v24 = v22;
  }
  return v7;
}

void sub_24160762C(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_241631AC8();
  unint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);

  v6(a1 + a2[7], v5);
  uint64_t v7 = *(void **)(a1 + a2[10]);
}

void *sub_241607704(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_241631AC8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(type metadata accessor for CycleDay() + 20);
  uint64_t v13 = *(void **)&v9[v12];
  *(void *)&v8[v12] = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  id v17 = v13;
  v11(v15, v16, v10);
  uint64_t v18 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  uint64_t v19 = *(void **)((char *)a2 + v18);
  *(void *)((char *)a1 + v18) = v19;
  uint64_t v20 = a3[10];
  uint64_t v21 = *(void **)((char *)a2 + v20);
  *(void *)((char *)a1 + v20) = v21;
  id v22 = v19;
  id v23 = v21;
  return a1;
}

char *sub_241607818(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  *((void *)a1 + 1) = *((void *)a2 + 1);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_241631AC8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(type metadata accessor for CycleDay() + 20);
  uint64_t v12 = *(void **)&v8[v11];
  uint64_t v13 = *(void **)&v7[v11];
  *(void *)&v7[v11] = v12;
  id v14 = v12;

  v10(&a1[a3[7]], &a2[a3[7]], v9);
  a1[a3[8]] = a2[a3[8]];
  uint64_t v15 = a3[9];
  uint64_t v16 = *(void **)&a2[v15];
  id v17 = *(void **)&a1[v15];
  *(void *)&a1[v15] = v16;
  id v18 = v16;

  uint64_t v19 = a3[10];
  uint64_t v20 = *(void **)&a2[v19];
  uint64_t v21 = *(void **)&a1[v19];
  *(void *)&a1[v19] = v20;
  id v22 = v20;

  return a1;
}

char *sub_241607950(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_241631AC8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = type metadata accessor for CycleDay();
  *(void *)&v7[*(int *)(v11 + 20)] = *(void *)&v8[*(int *)(v11 + 20)];
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  uint64_t v12 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  return a1;
}

char *sub_241607A38(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_241631AC8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(type metadata accessor for CycleDay() + 20);
  uint64_t v12 = *(void **)&v7[v11];
  *(void *)&v7[v11] = *(void *)&v8[v11];

  v10(&a1[a3[7]], &a2[a3[7]], v9);
  uint64_t v13 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  id v14 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  uint64_t v15 = a3[10];
  uint64_t v16 = *(void **)&a1[v15];
  *(void *)&a1[v15] = *(void *)&a2[v15];

  return a1;
}

uint64_t sub_241607B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_241607B64);
}

uint64_t sub_241607B64(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for CycleDay();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_241631AC8();
      id v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_241607C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_241607CA4);
}

void *sub_241607CA4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for CycleDay();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_241631AC8();
      id v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 28);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for CycleLogModel()
{
  uint64_t result = qword_268D04538;
  if (!qword_268D04538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_241607E1C()
{
  uint64_t result = type metadata accessor for CycleDay();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_241631AC8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_241607F10(unsigned __int8 *a1, uint64_t a2, void *a3)
{
  return sub_241607F44(*a1, a3);
}

uint64_t sub_241607F44(uint64_t a1, void *a2)
{
  switch((char)a1)
  {
    case 1:
      uint64_t v4 = sub_2411B6854(a2, a2[3]);
      sub_2416083E4(1, *v4, v2);
      goto LABEL_7;
    case 2:
      uint64_t v5 = sub_2411B6854(a2, a2[3]);
      sub_2416083E4(2, *v5, v2);
      goto LABEL_7;
    case 3:
      uint64_t v6 = *(void *)(v2 + 8);
      MEMORY[0x270FA5388](a1);
      v10[2] = v2;
      v10[3] = v7;
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      sub_241394B7C((void (*)(void *__return_ptr, id *))sub_24160A450, (uint64_t)v10, v6);
      swift_bridgeObjectRelease();
      return sub_24162D668();
    case 4:
      uint64_t v9 = sub_2411B6854(a2, a2[3]);
      sub_241609568(*v9, v2);
      goto LABEL_7;
    case 5:
      goto LABEL_7;
    default:
      int v3 = sub_2411B6854(a2, a2[3]);
      sub_2416083E4(0, *v3, v2);
LABEL_7:
      return sub_24162D668();
  }
}

id sub_2416081AC@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v35 = a3;
  uint64_t v34 = sub_241631AC8();
  uint64_t v7 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v13 = *a1;
  uint64_t v33 = type metadata accessor for CycleLogDataItem();
  a4[3] = v33;
  a4[4] = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
  id v14 = sub_2411B6C70(a4);
  uint64_t v15 = HKMCDisplayTypeIdentifier.editableReportTitle.getter();
  uint64_t v31 = v16;
  uint64_t v32 = v15;
  uint64_t v17 = sub_2414766C8();
  uint64_t v29 = v18;
  uint64_t v30 = v17;
  uint64_t v19 = type metadata accessor for CycleLogModel();
  uint64_t v20 = a2 + *(int *)(v19 + 24);
  uint64_t v21 = a2;
  id v22 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v23 = v34;
  v22(v12, v20, v34);
  v22(v9, v21 + *(int *)(v19 + 28), v23);
  sub_24162E778();
  LOBYTE(v19) = sub_24162E768();
  uint64_t v24 = v33;
  sub_24160A470(v21, (uint64_t)v14 + *(int *)(v33 + 36), (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_2411A3DF4(v35, (uint64_t)v14 + *(int *)(v24 + 40));
  uint64_t v25 = v31;
  *id v14 = v32;
  v14[1] = v25;
  uint64_t v26 = v29;
  v14[2] = v30;
  v14[3] = v26;
  *((unsigned char *)v14 + 32) = 3;
  *((unsigned char *)v14 + 33) = (v19 & 1) == 0;
  v14[5] = (uint64_t)v13;
  return v13;
}

void *sub_2416083E4(int a1, uint64_t a2, uint64_t a3)
{
  int v140 = a1;
  uint64_t v125 = sub_24162EFA8();
  uint64_t v124 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125);
  id v123 = (char *)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_241631AC8();
  uint64_t v138 = *(void *)(v6 - 8);
  uint64_t v139 = v6;
  MEMORY[0x270FA5388](v6);
  unsigned int v137 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unsigned int v136 = (char *)&v123 - v9;
  uint64_t v133 = type metadata accessor for CycleLogDataItem();
  MEMORY[0x270FA5388](v133);
  v126 = (char *)&v123 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v132 = (uint64_t)&v123 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v127 = (char *)&v123 - v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v123 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v123 - v19;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v123 - v22;
  uint64_t v24 = type metadata accessor for CycleDay();
  uint64_t v25 = v24 - 8;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v123 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v145[3] = type metadata accessor for CycleLogNavigationHandler();
  v145[4] = &off_26F579410;
  v145[0] = a2;
  uint64_t v135 = type metadata accessor for CycleLogModel();
  uint64_t v28 = a3;
  uint64_t v29 = a3 + *(int *)(v135 + 24);
  sub_24160A470(v29, (uint64_t)v27, (uint64_t (*)(void))type metadata accessor for CycleDay);
  uint64_t v30 = *(void **)&v27[*(int *)(v25 + 28)];
  swift_retain();
  id v130 = objc_msgSend(v30, sel_menstruationLevel);
  sub_24160A4D8((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for CycleDay);
  sub_24160A470(v29, (uint64_t)v27, (uint64_t (*)(void))type metadata accessor for CycleDay);
  id v31 = *(id *)&v27[*(int *)(v25 + 28)];
  id v32 = objc_msgSend(v31, sel_bleedingInPregnancyLevel);

  uint64_t v128 = (uint64_t)v32;
  LODWORD(v129) = v32 == (id)1;
  sub_24160A4D8((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for CycleDay);
  uint64_t v134 = v29;
  sub_24160A470(v29, (uint64_t)v27, (uint64_t (*)(void))type metadata accessor for CycleDay);
  id v33 = *(id *)&v27[*(int *)(v25 + 28)];
  id v34 = objc_msgSend(v33, sel_bleedingAfterPregnancyLevel);

  sub_24160A4D8((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for CycleDay);
  if (v140 == 2)
  {
    int v49 = (void *)*MEMORY[0x263F44F58];
    uint64_t v131 = HKMCDisplayTypeIdentifier.editableReportTitle.getter();
    uint64_t v125 = v50;
    uint64_t v51 = sub_2414766C8();
    uint64_t v53 = v52;
    uint64_t v54 = v139;
    uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v138 + 16);
    v55(v136, v134, v139);
    v55(v137, a3 + *(int *)(v135 + 28), v54);
    sub_24162E778();
    char v56 = sub_24162E768();
    uint64_t v35 = v133;
    sub_24160A470(a3, (uint64_t)&v17[*(int *)(v133 + 36)], (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_2411A3DF4((uint64_t)v145, (uint64_t)&v17[*(int *)(v35 + 40)]);
    uint64_t v57 = v125;
    *(void *)uint64_t v17 = v131;
    *((void *)v17 + 1) = v57;
    *((void *)v17 + 2) = v51;
    *((void *)v17 + 3) = v53;
    unsigned char v17[32] = 2;
    v17[33] = (v56 & 1) == 0;
    *((void *)v17 + 5) = v49;
    id v58 = v49;
    uint64_t v45 = sub_24158C34C(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v60 = v45[2];
    unint64_t v59 = v45[3];
    if (v60 >= v59 >> 1) {
      uint64_t v45 = sub_24158C34C((void *)(v59 > 1), v60 + 1, 1, v45);
    }
    uint64_t v143 = v35;
    uint64_t v144 = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
    uint64_t v61 = sub_2411B6C70((uint64_t *)&v142);
    sub_24160A470((uint64_t)v17, (uint64_t)v61, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    v45[2] = v60 + 1;
    sub_2411B6CD4(&v142, (uint64_t)&v45[5 * v60 + 4]);
    sub_24160A4D8((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    if (v130 != (id)4)
    {
      if (v128 != 1) {
        goto LABEL_39;
      }
      LODWORD(v131) = 0;
      goto LABEL_29;
    }
    LODWORD(v131) = 0;
    goto LABEL_18;
  }
  LODWORD(v131) = v34 == (id)1;
  if (v140 == 1)
  {
    unsigned int v62 = (void *)*MEMORY[0x263F44F60];
    uint64_t v129 = HKMCDisplayTypeIdentifier.editableReportTitle.getter();
    uint64_t v128 = v63;
    uint64_t v64 = sub_2414766C8();
    uint64_t v66 = v65;
    uint64_t v67 = v139;
    uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t))(v138 + 16);
    v68(v136, v134, v139);
    v68(v137, a3 + *(int *)(v135 + 28), v67);
    sub_24162E778();
    char v69 = sub_24162E768();
    uint64_t v35 = v133;
    sub_24160A470(a3, (uint64_t)&v20[*(int *)(v133 + 36)], (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_2411A3DF4((uint64_t)v145, (uint64_t)&v20[*(int *)(v35 + 40)]);
    uint64_t v70 = v128;
    *(void *)uint64_t v20 = v129;
    *((void *)v20 + 1) = v70;
    *((void *)v20 + 2) = v64;
    *((void *)v20 + 3) = v66;
    v20[32] = 1;
    v20[33] = (v69 & 1) == 0;
    *((void *)v20 + 5) = v62;
    id v71 = v62;
    uint64_t v45 = sub_24158C34C(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v73 = v45[2];
    unint64_t v72 = v45[3];
    if (v73 >= v72 >> 1) {
      uint64_t v45 = sub_24158C34C((void *)(v72 > 1), v73 + 1, 1, v45);
    }
    uint64_t v143 = v35;
    uint64_t v144 = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
    uint64_t v74 = sub_2411B6C70((uint64_t *)&v142);
    sub_24160A470((uint64_t)v20, (uint64_t)v74, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    v45[2] = v73 + 1;
    sub_2411B6CD4(&v142, (uint64_t)&v45[5 * v73 + 4]);
    sub_24160A4D8((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    if (v130 != (id)4) {
      goto LABEL_25;
    }
    LODWORD(v129) = 0;
LABEL_18:
    uint64_t v80 = (void *)*MEMORY[0x263F44F80];
    id v130 = (id)HKMCDisplayTypeIdentifier.editableReportTitle.getter();
    uint64_t v128 = v81;
    uint64_t v82 = sub_2414766C8();
    uint64_t v84 = v83;
    uint64_t v85 = v139;
    id v86 = *(void (**)(char *, uint64_t, uint64_t))(v138 + 16);
    v86(v136, v134, v139);
    v86(v137, v28 + *(int *)(v135 + 28), v85);
    sub_24162E778();
    char v87 = sub_24162E768();
    uint64_t v35 = v133;
    uint64_t v88 = (uint64_t)v126;
    sub_24160A470(v28, (uint64_t)&v126[*(int *)(v133 + 36)], (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_2411A3DF4((uint64_t)v145, v88 + *(int *)(v35 + 40));
    uint64_t v89 = v128;
    *(void *)uint64_t v88 = v130;
    *(void *)(v88 + 8) = v89;
    *(void *)(v88 + 16) = v82;
    *(void *)(v88 + 24) = v84;
    *(unsigned char *)(v88 + 32) = v140;
    *(unsigned char *)(v88 + 33) = (v87 & 1) == 0;
    *(void *)(v88 + 40) = v80;
    id v90 = v80;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v45 = sub_24158C34C(0, v45[2] + 1, 1, v45);
    }
    unint64_t v92 = v45[2];
    unint64_t v91 = v45[3];
    if (v92 >= v91 >> 1) {
      uint64_t v45 = sub_24158C34C((void *)(v91 > 1), v92 + 1, 1, v45);
    }
    uint64_t v143 = v35;
    uint64_t v144 = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
    uint64_t v93 = sub_2411B6C70((uint64_t *)&v142);
    sub_24160A470(v88, (uint64_t)v93, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    v45[2] = v92 + 1;
    sub_2411B6CD4(&v142, (uint64_t)&v45[5 * v92 + 4]);
    sub_24160A4D8(v88, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    if (v129) {
      goto LABEL_29;
    }
LABEL_25:
    if (!v131) {
      goto LABEL_39;
    }
    goto LABEL_34;
  }
  uint64_t v35 = v133;
  if (!(_BYTE)v140)
  {
    uint64_t v36 = (void *)*MEMORY[0x263F44F80];
    id v130 = (id)HKMCDisplayTypeIdentifier.editableReportTitle.getter();
    uint64_t v129 = v37;
    v126 = (char *)sub_2414766C8();
    uint64_t v39 = v38;
    uint64_t v40 = v139;
    uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v138 + 16);
    v41(v136, v134, v139);
    v41(v137, v28 + *(int *)(v135 + 28), v40);
    sub_24162E778();
    char v42 = sub_24162E768();
    sub_24160A470(v28, (uint64_t)&v23[*(int *)(v35 + 36)], (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_2411A3DF4((uint64_t)v145, (uint64_t)&v23[*(int *)(v35 + 40)]);
    uint64_t v43 = v129;
    *(void *)uint64_t v23 = v130;
    *((void *)v23 + 1) = v43;
    *((void *)v23 + 2) = v126;
    *((void *)v23 + 3) = v39;
    v23[32] = 0;
    v23[33] = (v42 & 1) == 0;
    *((void *)v23 + 5) = v36;
    id v44 = v36;
    uint64_t v45 = sub_24158C34C(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v47 = v45[2];
    unint64_t v46 = v45[3];
    if (v47 >= v46 >> 1) {
      uint64_t v45 = sub_24158C34C((void *)(v46 > 1), v47 + 1, 1, v45);
    }
    uint64_t v143 = v35;
    uint64_t v144 = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
    id v48 = sub_2411B6C70((uint64_t *)&v142);
    sub_24160A470((uint64_t)v23, (uint64_t)v48, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    v45[2] = v47 + 1;
    sub_2411B6CD4(&v142, (uint64_t)&v45[5 * v47 + 4]);
    sub_24160A4D8((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    goto LABEL_24;
  }
  unint64_t v75 = v123;
  sub_24162EF48();
  uint64_t v76 = sub_24162EF98();
  os_log_type_t v77 = sub_2416322C8();
  if (os_log_type_enabled(v76, v77))
  {
    uint64_t v78 = (uint8_t *)swift_slowAlloc();
    uint64_t v79 = swift_slowAlloc();
    *(void *)&long long v142 = v79;
    *(_DWORD *)uint64_t v78 = 136315138;
    uint64_t v141 = sub_2411B6898(0x676F4C656C637943, 0xED00006C65646F4DLL, (uint64_t *)&v142);
    sub_241632C28();
    _os_log_impl(&dword_24118E000, v76, v77, "[%s] Received unexpected section enum case. Expected a section that needs bleeding types configured.", v78, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v79, -1, -1);
    MEMORY[0x245621640](v78, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v124 + 8))(v75, v125);
  uint64_t v45 = (void *)MEMORY[0x263F8EE78];
  if (v130 == (id)4) {
    goto LABEL_18;
  }
LABEL_24:
  if (v128 != 1) {
    goto LABEL_25;
  }
LABEL_29:
  uint64_t v94 = (void *)*MEMORY[0x263F44F60];
  id v130 = (id)HKMCDisplayTypeIdentifier.editableReportTitle.getter();
  uint64_t v129 = v95;
  uint64_t v128 = sub_2414766C8();
  uint64_t v97 = v96;
  uint64_t v98 = *(void (**)(char *, uint64_t, uint64_t))(v138 + 16);
  uint64_t v99 = v35;
  uint64_t v100 = v139;
  v98(v136, v134, v139);
  uint64_t v101 = v100;
  uint64_t v35 = v99;
  v98(v137, v28 + *(int *)(v135 + 28), v101);
  sub_24162E778();
  char v102 = sub_24162E768();
  uint64_t v103 = (uint64_t)v127;
  sub_24160A470(v28, (uint64_t)&v127[*(int *)(v99 + 36)], (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_2411A3DF4((uint64_t)v145, v103 + *(int *)(v99 + 40));
  uint64_t v104 = v129;
  *(void *)uint64_t v103 = v130;
  *(void *)(v103 + 8) = v104;
  *(void *)(v103 + 16) = v128;
  *(void *)(v103 + 24) = v97;
  *(unsigned char *)(v103 + 32) = v140;
  *(unsigned char *)(v103 + 33) = (v102 & 1) == 0;
  *(void *)(v103 + 40) = v94;
  id v105 = v94;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v45 = sub_24158C34C(0, v45[2] + 1, 1, v45);
  }
  unint64_t v107 = v45[2];
  unint64_t v106 = v45[3];
  if (v107 >= v106 >> 1) {
    uint64_t v45 = sub_24158C34C((void *)(v106 > 1), v107 + 1, 1, v45);
  }
  uint64_t v143 = v99;
  uint64_t v144 = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
  id v108 = sub_2411B6C70((uint64_t *)&v142);
  sub_24160A470(v103, (uint64_t)v108, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
  v45[2] = v107 + 1;
  sub_2411B6CD4(&v142, (uint64_t)&v45[5 * v107 + 4]);
  sub_24160A4D8(v103, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
  if (v131)
  {
LABEL_34:
    uint64_t v109 = (void *)*MEMORY[0x263F44F58];
    uint64_t v131 = HKMCDisplayTypeIdentifier.editableReportTitle.getter();
    id v130 = v110;
    uint64_t v129 = sub_2414766C8();
    uint64_t v112 = v111;
    uint64_t v113 = v139;
    uint64_t v114 = *(void (**)(char *, uint64_t, uint64_t))(v138 + 16);
    v114(v136, v134, v139);
    v114(v137, v28 + *(int *)(v135 + 28), v113);
    sub_24162E778();
    LOBYTE(v114) = sub_24162E768();
    uint64_t v115 = v132;
    sub_24160A470(v28, v132 + *(int *)(v35 + 36), (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_2411A3DF4((uint64_t)v145, v115 + *(int *)(v35 + 40));
    id v116 = v130;
    *(void *)uint64_t v115 = v131;
    *(void *)(v115 + 8) = v116;
    *(void *)(v115 + 16) = v129;
    *(void *)(v115 + 24) = v112;
    *(unsigned char *)(v115 + 32) = v140;
    *(unsigned char *)(v115 + 33) = (v114 & 1) == 0;
    *(void *)(v115 + 40) = v109;
    id v117 = v109;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v45 = sub_24158C34C(0, v45[2] + 1, 1, v45);
    }
    unint64_t v119 = v45[2];
    unint64_t v118 = v45[3];
    if (v119 >= v118 >> 1) {
      uint64_t v45 = sub_24158C34C((void *)(v118 > 1), v119 + 1, 1, v45);
    }
    uint64_t v143 = v35;
    uint64_t v144 = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
    uint64_t v120 = sub_2411B6C70((uint64_t *)&v142);
    uint64_t v121 = v132;
    sub_24160A470(v132, (uint64_t)v120, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
    v45[2] = v119 + 1;
    sub_2411B6CD4(&v142, (uint64_t)&v45[5 * v119 + 4]);
    sub_24160A4D8(v121, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
  }
LABEL_39:
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v145);
  return v45;
}

uint64_t sub_241609568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24162B7E8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v55 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_241631CA8();
  uint64_t v61 = *(void *)(v6 - 8);
  uint64_t v62 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v59 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v60 = (char *)&v55 - v9;
  uint64_t v10 = sub_24162E058();
  uint64_t v57 = *(void *)(v10 - 8);
  uint64_t v58 = v10;
  MEMORY[0x270FA5388](v10);
  char v56 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for CycleDay() - 8;
  MEMORY[0x270FA5388](v69);
  uint64_t v68 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_241631AC8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v55 - v18;
  uint64_t v67 = type metadata accessor for CycleLogDataItem();
  MEMORY[0x270FA5388](v67);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70[3] = type metadata accessor for CycleLogNavigationHandler();
  v70[4] = &off_26F579410;
  v70[0] = a1;
  uint64_t v22 = (void *)*MEMORY[0x263F44F70];
  swift_retain();
  uint64_t v23 = HKMCDisplayTypeIdentifier.editableReportTitle.getter();
  uint64_t v65 = v24;
  uint64_t v66 = v23;
  uint64_t v25 = a2;
  uint64_t v26 = sub_2414766C8();
  uint64_t v63 = v27;
  uint64_t v64 = v26;
  uint64_t v28 = type metadata accessor for CycleLogModel();
  uint64_t v29 = v25 + *(int *)(v28 + 24);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v30(v19, v29, v13);
  v30(v16, v25 + *(int *)(v28 + 28), v13);
  uint64_t v31 = (uint64_t)v21;
  uint64_t v32 = v67;
  sub_24162E778();
  LOBYTE(v13) = sub_24162E768();
  sub_24160A470(v25, (uint64_t)&v21[*(int *)(v32 + 36)], (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_2411A3DF4((uint64_t)v70, (uint64_t)&v21[*(int *)(v32 + 40)]);
  uint64_t v33 = v65;
  *(void *)uint64_t v21 = v66;
  *((void *)v21 + 1) = v33;
  uint64_t v34 = v63;
  *((void *)v21 + 2) = v64;
  *((void *)v21 + 3) = v34;
  v21[32] = 4;
  LOBYTE(v34) = (v13 & 1) == 0;
  uint64_t v35 = (uint64_t)v68;
  v21[33] = v34;
  *((void *)v21 + 5) = v22;
  sub_24160A470(v29, v35, (uint64_t (*)(void))type metadata accessor for CycleDay);
  uint64_t v36 = *(void **)(v35 + *(int *)(v69 + 28));
  id v37 = v22;
  id v38 = v36;
  id v39 = objc_msgSend(v38, sel_cycleFactors);
  if (!v39)
  {

    sub_24160A4D8(v35, (uint64_t (*)(void))type metadata accessor for CycleDay);
LABEL_9:
    sub_24160A538();
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_241637EE0;
    *(void *)(v49 + 56) = v32;
    *(void *)(v49 + 64) = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
    uint64_t v53 = sub_2411B6C70((uint64_t *)(v49 + 32));
    sub_2415D0400(v31, (uint64_t)v53);
    goto LABEL_10;
  }
  uint64_t v40 = v39;
  sub_2411B9D00(0, (unint64_t *)&qword_26B012390);
  unint64_t v41 = sub_241631F28();

  sub_24160A4D8(v35, (uint64_t (*)(void))type metadata accessor for CycleDay);
  if (v41 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v42 = sub_241633068();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v44 = v61;
  uint64_t v43 = v62;
  unint64_t v46 = v59;
  uint64_t v45 = v60;
  swift_bridgeObjectRelease();
  if (v42) {
    goto LABEL_9;
  }
  sub_241631C38();
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v46, v45, v43);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v47 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v43);
  id v48 = v56;
  sub_24162E048();
  sub_24160A538();
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_24163A4F0;
  *(void *)(v49 + 56) = v32;
  *(void *)(v49 + 64) = sub_24160A590(&qword_268D04550, (void (*)(uint64_t))type metadata accessor for CycleLogDataItem);
  uint64_t v50 = sub_2411B6C70((uint64_t *)(v49 + 32));
  sub_24160A470(v31, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
  uint64_t v51 = v58;
  *(void *)(v49 + 96) = v58;
  *(void *)(v49 + 104) = sub_24160A590(&qword_268D04558, MEMORY[0x263F44568]);
  uint64_t v52 = sub_2411B6C70((uint64_t *)(v49 + 72));
  (*(void (**)(uint64_t *, char *, uint64_t))(v57 + 32))(v52, v48, v51);
  sub_24160A4D8(v31, (uint64_t (*)(void))type metadata accessor for CycleLogDataItem);
LABEL_10:
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v70);
  return v49;
}

uint64_t sub_241609CF8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v52 = type metadata accessor for CycleLogModel();
  MEMORY[0x270FA5388](v52);
  uint64_t v56 = (uint64_t)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v55 = (uint64_t)v51 - v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v54 = (uint64_t)v51 - v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v53 = (uint64_t)v51 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v51 - v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v51 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v51 - v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v51 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)v51 - v24;
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)v51 - v27;
  BOOL v29 = sub_24149C628(*a1, *a2);
  sub_24160A470((uint64_t)a1, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A470((uint64_t)a2, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  if (!v29)
  {
    sub_24160A4D8((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A4D8((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A470((uint64_t)a1, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A470((uint64_t)a2, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
LABEL_9:
    sub_24160A4D8((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A4D8((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A470((uint64_t)a1, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A470((uint64_t)a2, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    goto LABEL_10;
  }
  char v30 = sub_24149C69C(*((void *)v28 + 1), *((void *)v25 + 1));
  sub_24160A4D8((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A4D8((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A470((uint64_t)a1, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A470((uint64_t)a2, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  uint64_t v31 = v52;
  if ((v30 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v32 = *(int *)(v52 + 24);
  uint64_t v33 = &v22[v32];
  uint64_t v34 = &v19[v32];
  v51[3] = sub_241631AC8();
  uint64_t v35 = sub_24160A590((unint64_t *)&unk_268CFC5C0, MEMORY[0x263F090E8]);
  v51[1] = v33;
  void v51[2] = v34;
  uint64_t v36 = v31;
  sub_241632C68();
  if (v57) {
    goto LABEL_9;
  }
  v51[0] = v35;
  sub_2411B9D00(0, (unint64_t *)&qword_26B012200);
  type metadata accessor for CycleDay();
  char v37 = sub_2416329B8();
  sub_24160A4D8((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A4D8((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A470((uint64_t)a1, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A470((uint64_t)a2, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  if ((v37 & 1) == 0)
  {
LABEL_10:
    sub_24160A4D8((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A4D8((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    uint64_t v39 = v53;
    sub_24160A470((uint64_t)a1, v53, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    uint64_t v40 = v54;
    sub_24160A470((uint64_t)a2, v54, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    goto LABEL_11;
  }
  sub_241632C68();
  uint64_t v38 = v57;
  sub_24160A4D8((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A4D8((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  uint64_t v39 = v53;
  sub_24160A470((uint64_t)a1, v53, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  uint64_t v40 = v54;
  sub_24160A470((uint64_t)a2, v54, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  if (v38)
  {
LABEL_11:
    sub_24160A4D8(v40, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    sub_24160A4D8(v39, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    uint64_t v48 = (uint64_t)a1;
    uint64_t v44 = v55;
    sub_24160A470(v48, v55, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    uint64_t v49 = (uint64_t)a2;
    uint64_t v46 = v56;
    sub_24160A470(v49, v56, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
    goto LABEL_12;
  }
  int v41 = *(unsigned __int8 *)(v39 + *(int *)(v36 + 32));
  sub_24160A4D8(v39, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  int v42 = *(unsigned __int8 *)(v40 + *(int *)(v36 + 32));
  sub_24160A4D8(v40, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  uint64_t v43 = (uint64_t)a1;
  uint64_t v44 = v55;
  sub_24160A470(v43, v55, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  uint64_t v45 = (uint64_t)a2;
  uint64_t v46 = v56;
  sub_24160A470(v45, v56, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  if (v41 != v42)
  {
LABEL_12:
    char v47 = 0;
    goto LABEL_13;
  }
  char v47 = sub_2416329B8();
LABEL_13:
  sub_24160A4D8(v44, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  sub_24160A4D8(v46, (uint64_t (*)(void))type metadata accessor for CycleLogModel);
  return v47 & 1;
}

unsigned char *storeEnumTagSinglePayload for CycleLogModel.Section(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x24160A3C0);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CycleLogModel.Section()
{
  return &type metadata for CycleLogModel.Section;
}

unint64_t sub_24160A3FC()
{
  unint64_t result = qword_268D04548;
  if (!qword_268D04548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04548);
  }
  return result;
}

id sub_24160A450@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2416081AC(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_24160A470(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24160A4D8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_24160A538()
{
  if (!qword_268CFC790)
  {
    sub_2411E1530();
    unint64_t v0 = sub_2416331E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268CFC790);
    }
  }
}

uint64_t sub_24160A590(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24160A5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24162B7E8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_241631CA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v16[-v10];
  switch(a2)
  {
    case 2:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (!a1) {
        goto LABEL_12;
      }
      goto LABEL_10;
    case 3:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (a1) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 4:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (a1) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 5:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (a1)
      {
LABEL_10:
        sub_241631C38();
        (*v12)(v8, v11, v5);
        if (qword_26B0131F0 == -1) {
          goto LABEL_13;
        }
      }
      else
      {
LABEL_12:
        sub_241631C38();
        (*v12)(v8, v11, v5);
        if (qword_26B0131F0 == -1) {
          goto LABEL_13;
        }
      }
      swift_once();
LABEL_13:
      id v14 = (id)qword_26B0181A0;
      sub_24162B7D8();
      uint64_t v13 = sub_241631D38();
      (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
      return v13;
    default:
      return 0;
  }
}

uint64_t sub_24160A944(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24162B7E8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_241631CA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v16[-v10];
  switch(a2)
  {
    case 1:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (!a1) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 2:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (a1) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 3:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (a1) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 4:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (a1) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 5:
      uint64_t v12 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16);
      if (a1)
      {
LABEL_12:
        sub_241631C38();
        (*v12)(v8, v11, v5);
        if (qword_26B0131F0 == -1) {
          goto LABEL_15;
        }
      }
      else
      {
LABEL_14:
        sub_241631C38();
        (*v12)(v8, v11, v5);
        if (qword_26B0131F0 == -1) {
          goto LABEL_15;
        }
      }
      swift_once();
LABEL_15:
      id v14 = (id)qword_26B0181A0;
      sub_24162B7D8();
      uint64_t v13 = sub_241631D38();
      (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
      return v13;
    default:
      return 0;
  }
}

uint64_t sub_24160AD40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24162B7E8();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_241631CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v15[-v9];
  switch(a2)
  {
    case 1:
      uint64_t v11 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
      goto LABEL_8;
    case 2:
      uint64_t v11 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
      goto LABEL_8;
    case 3:
      uint64_t v11 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
      goto LABEL_8;
    case 4:
      uint64_t v11 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
      goto LABEL_8;
    case 5:
      uint64_t v11 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
LABEL_8:
      sub_241631C38();
      (*v11)(v7, v10, v4);
      if (qword_26B0131F0 != -1) {
        swift_once();
      }
      id v13 = (id)qword_26B0181A0;
      sub_24162B7D8();
      uint64_t v12 = sub_241631D38();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
      break;
    default:
      uint64_t v12 = 0;
      break;
  }
  return v12;
}

uint64_t type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController()
{
  uint64_t result = qword_268D04580;
  if (!qword_268D04580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24160B0B4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24160B10C(uint64_t a1)
{
  swift_getObjectType();
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  uint64_t v6 = sub_24162EF98();
  os_log_type_t v7 = sub_2416322C8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v16 = a1;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v11 = sub_2416333E8();
    uint64_t v17 = sub_2411B6898(v11, v12, &v18);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v6, v7, "[%{public}s]: Customizing the chart image provider is not supported", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v10, -1, -1);
    MEMORY[0x245621640](v9, -1, -1);

    uint64_t v13 = v16;
  }
  else
  {

    uint64_t v13 = a1;
  }
  sub_24160D6D4(v13, (uint64_t (*)(void))sub_24160C958);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_24160B330(char *a1, uint64_t a2, void *a3)
{
  *(void *)&a1[qword_268D04560] = 0;
  *(void *)&a1[qword_268D04568] = 0;
  id v4 = a3;

  sub_241633038();
  __break(1u);
}

void sub_24160B3B4()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v1, sel_setLargeTitleDisplayMode_, 2);

  id v2 = objc_msgSend(v0, sel_navigationItem);
  sub_24125E028(*((unsigned char *)v0 + qword_268D04570));
  uint64_t v3 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setTitle_, v3);

  id v4 = objc_msgSend(v0, sel_collectionView);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v6);
  }
  else
  {
    __break(1u);
  }
}

void sub_24160B4E8(void *a1)
{
  id v1 = a1;
  sub_24160B3B4();
}

UIImage *sub_24160B530()
{
  char v1 = v0[qword_268D04570];
  sub_241337D24(v1);
  id v2 = sub_24160B7B0();
  swift_bridgeObjectRelease();
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v3, sel_frame);
    CGFloat Width = v4;
    double v7 = v6;
    objc_msgSend(v3, sel_bounds);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

LABEL_6:
    v33.CGFloat width = Width;
    v33.CGFloat height = v7;
    UIGraphicsBeginImageContextWithOptions(v33, 1, 0.0);
    id v31 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
    objc_msgSend(v31, sel_setFill);

    v38.origin.CGFloat x = 0.0;
    v38.origin.CGFloat y = 0.0;
    v38.size.CGFloat width = Width;
    v38.size.CGFloat height = v7;
    UIRectFill(v38);
    objc_msgSend(v3, sel_drawViewHierarchyInRect_afterScreenUpdates_, 1, v9, v11, v13, v15);
    uint64_t v32 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return v32;
  }
  sub_2414CE920(v1);
  id v16 = sub_24160B7B0();
  swift_bridgeObjectRelease();
  if (!v16) {
    return 0;
  }
  id v3 = v16;
  uint64_t result = (UIImage *)objc_msgSend(v0, sel_collectionView);
  if (result)
  {
    uint64_t v18 = result;
    [(UIImage *)result frame];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v34.origin.CGFloat x = v20;
    v34.origin.CGFloat y = v22;
    v34.size.CGFloat width = v24;
    v34.size.CGFloat height = v26;
    CGFloat Width = CGRectGetWidth(v34);
    objc_msgSend(v3, sel_frame);
    double v7 = CGRectGetHeight(v35) * 2.5 + 24.0;
    objc_msgSend(v3, sel_bounds);
    double v13 = v27;
    double v15 = v28;
    v36.origin.CGFloat x = 0.0;
    v36.origin.CGFloat y = 0.0;
    v36.size.CGFloat width = Width;
    v36.size.CGFloat height = v7;
    double MidX = CGRectGetMidX(v36);
    v37.origin.CGFloat x = 0.0;
    v37.origin.CGFloat y = 0.0;
    v37.size.CGFloat width = Width;
    v37.size.CGFloat height = v7;
    double MidY = CGRectGetMidY(v37);

    double v9 = MidX - v13 * 0.5;
    double v11 = MidY - v15 * 0.5;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

id sub_24160B7B0()
{
  sub_24160C9C0(0, (unint64_t *)&qword_26B011D00, MEMORY[0x263F07A30]);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v13 - v2;
  uint64_t v4 = sub_24162BB18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24160B9E8((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_24160CFB4((uint64_t)v3, (unint64_t *)&qword_26B011D00, MEMORY[0x263F07A30]);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  id result = objc_msgSend(v0, sel_collectionView);
  if (result)
  {
    double v10 = result;
    double v11 = (void *)sub_24162BA88();
    id v12 = objc_msgSend(v10, sel_cellForItemAtIndexPath_, v11);

    if (v12)
    {
      id v8 = objc_msgSend(v12, sel_contentView);
    }
    else
    {
      id v8 = 0;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_24160B9E8@<X0>(uint64_t a1@<X8>)
{
  sub_24162E488();
  sub_24162DBD8();
  uint64_t v2 = sub_24162D0E8();
  swift_release();
  uint64_t v3 = sub_24160D368(v2, (uint64_t (*)(uint64_t, char *))sub_24160D010);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = sub_24162BB18();
  uint64_t v6 = *(void *)(v5 - 8);
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, v3+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v7, 1, v5);
  return swift_bridgeObjectRelease();
}

void sub_24160BB20()
{
}

void sub_24160BB50(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_24160BB84()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(void **)(v0 + qword_268D04578);
}

id sub_24160BBD4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24160BC0C(uint64_t a1)
{
  swift_unknownObjectRelease();
  objc_super v2 = *(void **)(a1 + qword_268D04578);
}

uint64_t sub_24160BC68()
{
  return type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController();
}

void *sub_24160BC70()
{
  uint64_t v1 = (void **)(*v0 + qword_268D04560);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_24160BCC4(void *a1)
{
  id v3 = (void **)(*v1 + qword_268D04560);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_24160BD1C())()
{
  return j__swift_endAccess;
}

id sub_24160BD7C@<X0>(void *a1@<X8>)
{
  id v4 = *v1;
  a1[3] = type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController();
  a1[4] = sub_24160CF6C(&qword_268D04590, (void (*)(uint64_t))type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController);
  *a1 = v4;

  return v4;
}

uint64_t sub_24160BE08(uint64_t a1)
{
  return sub_24160B10C(a1);
}

void (*sub_24160BE2C(void *a1))(uint64_t *a1, char a2)
{
  id v3 = malloc(0x58uLL);
  *a1 = v3;
  id v4 = *v1;
  v3[10] = v4;
  v3[3] = type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController();
  v3[4] = sub_24160CF6C(&qword_268D04590, (void (*)(uint64_t))type metadata accessor for SharedMenstrualCyclesProjectionDetailViewController);
  *id v3 = v4;
  id v5 = v4;
  return sub_24160BED8;
}

void sub_24160BED8(uint64_t *a1, char a2)
{
  objc_super v2 = (void *)*a1;
  if (a2)
  {
    sub_24160C8F4(*a1, (uint64_t)v2 + 40);
    sub_24160B10C((uint64_t)v2 + 40);
    sub_24160D6D4((uint64_t)v2, (uint64_t (*)(void))sub_24160C958);
  }
  else
  {
    sub_24160B10C(*a1);
  }

  free(v2);
}

uint64_t sub_24160BF60()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_24160BFB0(uint64_t a1)
{
  id v3 = (void *)(*v1 + qword_268D04568);
  swift_beginAccess();
  *id v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_24160C008())()
{
  return j_j__swift_endAccess;
}

UIImage *sub_24160C068()
{
  return sub_24160B530();
}

uint64_t sub_24160C08C()
{
  return sub_24125E028(*(unsigned char *)(*v0 + qword_268D04570));
}

uint64_t sub_24160C0A0(void *a1)
{
  uint64_t v2 = v1;
  char v4 = *(unsigned char *)(v1 + 16);
  sub_2416324B8();
  sub_2411B6854(v34, v34[3]);
  id v5 = (void *)sub_24162BCA8();
  id v6 = *(id *)(v2 + 24);
  sub_24127F144((uint64_t)v5, 1, 0, v4);

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v34);
  sub_24160CA5C(0, &qword_268D045B0, (uint64_t (*)(uint64_t))sub_24160CA14, sub_24160CB10, MEMORY[0x263F444D0]);
  swift_allocObject();
  uint64_t v7 = sub_24162DFD8();
  id v8 = sub_24160C3A0(a1);
  uint64_t v10 = v9;
  LOBYTE(v5) = *(unsigned char *)(v2 + 16);
  uint64_t v11 = sub_24125E2BC((char)v5);
  uint64_t v13 = v12;
  uint64_t v14 = sub_24125E554((char)v5);
  uint64_t v16 = v15;
  type metadata accessor for AboutTextDataSource();
  swift_allocObject();
  uint64_t v17 = sub_2411E0E18(v11, v13, v14, v16);
  swift_retain();
  uint64_t v18 = sub_24158D0A8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v20 = v18[2];
  unint64_t v19 = v18[3];
  unint64_t v21 = v20 + 1;
  if (v20 >= v19 >> 1) {
    uint64_t v18 = sub_24158D0A8((void *)(v19 > 1), v20 + 1, 1, v18);
  }
  unint64_t v22 = sub_24160CD64();
  v18[2] = v21;
  double v23 = &v18[2 * v20];
  v23[4] = v7;
  v23[5] = v22;
  if (v8)
  {
    unint64_t v24 = v18[3];
    int64_t v25 = v20 + 2;
    swift_unknownObjectRetain();
    if (v21 >= v24 >> 1) {
      uint64_t v18 = sub_24158D0A8((void *)(v24 > 1), v25, 1, v18);
    }
    v18[2] = v25;
    CGFloat v26 = &v18[2 * v21];
    v26[4] = v8;
    v26[5] = v10;
    unint64_t v21 = v18[2];
  }
  unint64_t v27 = v18[3];
  swift_retain();
  if (v21 >= v27 >> 1) {
    uint64_t v18 = sub_24158D0A8((void *)(v27 > 1), v21 + 1, 1, v18);
  }
  v18[2] = v21 + 1;
  uint64_t v28 = MEMORY[0x263F440A0];
  BOOL v29 = &v18[2 * v21];
  v29[4] = v17;
  v29[5] = v28;
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  if (*(unsigned char *)(v2 + 16)) {
    char v30 = &unk_26F567CF0;
  }
  else {
    char v30 = &unk_26F567D18;
  }
  id v31 = a1;
  uint64_t v32 = sub_24160CE00((uint64_t)v30);
  swift_bridgeObjectRelease();

  v34[0] = v18;
  sub_241497BC0(v32);
  return v34[0];
}

id sub_24160C3A0(void *a1)
{
  id v34 = a1;
  uint64_t v1 = sub_24162DDE8();
  uint64_t v32 = *(void *)(v1 - 8);
  uint64_t v33 = v1;
  MEMORY[0x270FA5388](v1);
  id v31 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24160C9C0(0, (unint64_t *)&qword_26B00F250, MEMORY[0x263F43C08]);
  MEMORY[0x270FA5388](v3 - 8);
  BOOL v29 = (char *)&v27 - v4;
  uint64_t v5 = sub_24162DD58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24162D978();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v27 - v14;
  sub_2411B9D00(0, (unint64_t *)&qword_26B0125F0);
  uint64_t v16 = (void *)MEMORY[0x24561F7D0]((id)*MEMORY[0x263F09380]);
  id v17 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  sub_24162D968();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
  sub_2411B9D00(0, &qword_268D045A8);
  id v18 = v16;
  sub_2416322F8();
  sub_24162DD38();
  id v19 = objc_msgSend(v34, sel_resolvedHealthStore);
  if (v19)
  {
    uint64_t v27 = v9;
    uint64_t v28 = v5;
    sub_2416324D8();
    id v20 = *(id *)(v30 + 24);
    unint64_t v21 = (void *)sub_24162BDA8();

    if (v21)
    {
      uint64_t v22 = sub_24162CCF8();
      uint64_t v23 = (uint64_t)v29;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v29, 1, 1, v22);
      sub_24162CFC8();

      sub_24160CFB4(v23, (unint64_t *)&qword_26B00F250, MEMORY[0x263F43C08]);
    }
    sub_2416324B8();
    sub_2411A3DF4((uint64_t)v36, (uint64_t)v35);
    id v24 = v19;
    sub_2416324E8();
    int64_t v25 = v31;
    sub_24162DDA8();
    id v19 = (id)sub_24162DD48();

    (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v33);
    _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v36);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v28);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
  return v19;
}

uint64_t sub_24160C870()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SharedMenstrualCyclesProjectionDetailDataSourceProvider()
{
  return self;
}

uint64_t sub_24160C8CC(void *a1)
{
  return sub_24160C0A0(a1);
}

uint64_t sub_24160C8F4(uint64_t a1, uint64_t a2)
{
  sub_24160C958();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24160C958()
{
  if (!qword_268D04598)
  {
    sub_2411BF880(255, &qword_268D045A0);
    unint64_t v0 = sub_241632C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D04598);
    }
  }
}

void sub_24160C9C0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_241632C18();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_24160CA14(uint64_t a1)
{
}

void sub_24160CA5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_24160CADC()
{
  return sub_24160CF6C((unint64_t *)&unk_268CFBD48, (void (*)(uint64_t))sub_24127F5F4);
}

uint64_t sub_24160CB10()
{
  return sub_24160CF6C(&qword_268D045C0, sub_24160CA14);
}

unint64_t sub_24160CB44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_24162D658();
  v10[2] = a3;
  v10[3] = a4;
  void v10[4] = a1;
  unint64_t v8 = sub_24160D018(v7, (void (*)(uint64_t, uint64_t))sub_24160D6C8, (uint64_t)v10);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_24160CBC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_2411A3DF4(a2, (uint64_t)v21);
  sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
  sub_24162C708();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_8;
  }
  id v11 = objc_msgSend(v20, sel_uniqueIdentifier);
  uint64_t v12 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v14 = v13;

  if (v12 == a3 && v14 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v16 = sub_241633218();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {

LABEL_8:
      uint64_t v17 = sub_24162BB18();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a6, 1, 1, v17);
    }
  }
  MEMORY[0x245618FA0](a1, a5);

  uint64_t v19 = sub_24162BB18();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a6, 0, 1, v19);
}

unint64_t sub_24160CD64()
{
  unint64_t result = qword_268D045C8;
  if (!qword_268D045C8)
  {
    sub_24160CA5C(255, &qword_268D045B0, (uint64_t (*)(uint64_t))sub_24160CA14, sub_24160CB10, MEMORY[0x263F444D0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D045C8);
  }
  return result;
}

uint64_t sub_24160CE00(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_24149DED4(0, v1, 0);
    uint64_t v2 = v15;
    unint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_2416324B8();
      sub_2411B6854(v14, v14[3]);
      uint64_t v6 = (void *)sub_24162BCA8();
      id v7 = objc_allocWithZone((Class)type metadata accessor for MenstrualCyclesSharingSingleArticleFetchedResultsController());
      uint64_t v8 = sub_24129A4F0(v6, v5);
      _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v14);
      uint64_t v15 = v2;
      unint64_t v10 = *(void *)(v2 + 16);
      unint64_t v9 = *(void *)(v2 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_24149DED4(v9 > 1, v10 + 1, 1);
        uint64_t v2 = v15;
      }
      uint64_t v11 = sub_24160CF6C(&qword_268D045D0, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesSharingSingleArticleFetchedResultsController);
      *(void *)(v2 + 16) = v10 + 1;
      uint64_t v12 = v2 + 16 * v10;
      *(void *)(v12 + 32) = v8;
      *(void *)(v12 + 40) = v11;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_24160CF6C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24160CFB4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_24160C9C0(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_24160D010(uint64_t a1, uint64_t a2)
{
  return sub_24160CB44(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

unint64_t sub_24160D018(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  sub_24160C9C0(0, (unint64_t *)&qword_26B011D00, MEMORY[0x263F07A30]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v28 - v7;
  uint64_t v9 = sub_24162BB18();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v32 = (char *)v28 - v14;
  uint64_t v15 = *(void *)(a1 + 16);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v28[1] = a1;
  if (v15)
  {
    uint64_t v40 = v12;
    uint64_t v16 = 0;
    uint64_t v17 = a1 + 32;
    CGRect v35 = &v39;
    CGRect v36 = &v37;
    uint64_t v33 = (void (**)(char *, char *, uint64_t))(v10 + 32);
    id v34 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    unint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v30 = v10;
    uint64_t v31 = a3;
    uint64_t v29 = v15;
    do
    {
      uint64_t v19 = (uint64_t)v36;
      sub_2411A3DF4(v17, (uint64_t)v36);
      uint64_t v38 = v16;
      id v20 = (long long *)v19;
      uint64_t v21 = (uint64_t)v35;
      sub_2411B6CD4(v20, (uint64_t)v35);
      a2(v16, v21);
      sub_24160D6D4((uint64_t)&v38, (uint64_t (*)(void))sub_2414BB8E0);
      if ((*v34)(v8, 1, v9) == 1)
      {
        sub_24160CFB4((uint64_t)v8, (unint64_t *)&qword_26B011D00, MEMORY[0x263F07A30]);
      }
      else
      {
        uint64_t v22 = a2;
        uint64_t v23 = v32;
        id v24 = *v33;
        (*v33)(v32, v8, v9);
        v24(v40, v23, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v18 = sub_24158D060(0, *(void *)(v18 + 16) + 1, 1, v18);
        }
        unint64_t v26 = *(void *)(v18 + 16);
        unint64_t v25 = *(void *)(v18 + 24);
        if (v26 >= v25 >> 1) {
          unint64_t v18 = sub_24158D060(v25 > 1, v26 + 1, 1, v18);
        }
        *(void *)(v18 + 16) = v26 + 1;
        v24((char *)(v18+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v26), v40, v9);
        a2 = v22;
        uint64_t v15 = v29;
      }
      ++v16;
      v17 += 40;
    }
    while (v15 != v16);
  }
  else
  {
    unint64_t v18 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_24160D368(uint64_t a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v48 = a2;
  sub_2414BB26C();
  uint64_t v47 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v46 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v39 - v6);
  uint64_t v8 = *(void *)(a1 + 16);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v45 = v8;
  uint64_t v39 = a1;
  if (!v8)
  {
    unint64_t v13 = MEMORY[0x263F8EE78];
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  uint64_t v9 = 0;
  uint64_t v44 = sub_24162D678();
  uint64_t v10 = *(void *)(v44 - 8);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v42 = v10 + 16;
  uint64_t v43 = v11;
  uint64_t v12 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  uint64_t v40 = *(void *)(v10 + 72);
  int v41 = (void (**)(char *, char *, uint64_t))(v10 + 32);
  unint64_t v13 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v14 = v47;
    uint64_t v15 = &v46[*(int *)(v47 + 48)];
    uint64_t v16 = v44;
    v43(v15, v12, v44);
    uint64_t v17 = (char *)v7 + *(int *)(v14 + 48);
    *uint64_t v7 = v9;
    (*v41)(v17, v15, v16);
    uint64_t v18 = v48(v9, v17);
    sub_24160D6D4((uint64_t)v7, (uint64_t (*)(void))sub_2414BB26C);
    uint64_t v19 = *(void *)(v18 + 16);
    int64_t v20 = *(void *)(v13 + 16);
    int64_t v21 = v20 + v19;
    if (__OFADD__(v20, v19)) {
      break;
    }
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v21 <= *(void *)(v13 + 24) >> 1)
    {
      if (*(void *)(v18 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v20 <= v21) {
        int64_t v23 = v20 + v19;
      }
      else {
        int64_t v23 = v20;
      }
      unint64_t v13 = sub_24158D060(isUniquelyReferenced_nonNull_native, v23, 1, v13);
      if (*(void *)(v18 + 16))
      {
LABEL_14:
        uint64_t v24 = *(void *)(v13 + 16);
        uint64_t v25 = (*(void *)(v13 + 24) >> 1) - v24;
        uint64_t v26 = *(void *)(sub_24162BB18() - 8);
        uint64_t v27 = *(void *)(v26 + 72);
        if (v25 < v19) {
          goto LABEL_27;
        }
        unint64_t v28 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
        unint64_t v29 = v13 + v28 + v27 * v24;
        unint64_t v30 = v18 + v28;
        uint64_t v31 = v27 * v19;
        unint64_t v32 = v29 + v31;
        unint64_t v33 = v30 + v31;
        if (v30 < v32 && v29 < v33) {
          goto LABEL_29;
        }
        swift_arrayInitWithCopy();
        if (v19)
        {
          uint64_t v35 = *(void *)(v13 + 16);
          BOOL v36 = __OFADD__(v35, v19);
          uint64_t v37 = v35 + v19;
          if (v36) {
            goto LABEL_28;
          }
          *(void *)(v13 + 16) = v37;
        }
        goto LABEL_4;
      }
    }
    if (v19) {
      goto LABEL_26;
    }
LABEL_4:
    ++v9;
    swift_bridgeObjectRelease();
    v12 += v40;
    if (v45 == v9) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = sub_2416330E8();
  __break(1u);
  return result;
}

uint64_t sub_24160D6C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24160CBC4(a1, a2, v3[2], v3[3], v3[4], a3);
}

uint64_t sub_24160D6D4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24160D734()
{
  uint64_t v1 = sub_24162B7E8();
  MEMORY[0x270FA5388](v1 - 8);
  v29[1] = (char *)v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_241631CA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v29 - v8;
  uint64_t v10 = *(void *)(v0 + 16);
  uint64_t v12 = *(void **)(v10 + 24);
  uint64_t v11 = *(void **)(v10 + 32);
  uint64_t v13 = *(void *)(v0 + 32);
  uint64_t v14 = *(void *)(v0 + 40);
  int v15 = *(unsigned __int8 *)(v0 + 144);
  id v16 = objc_allocWithZone((Class)type metadata accessor for LocalSettingsModel());
  id v17 = v12;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  id v18 = objc_msgSend(v16, sel_init);
  type metadata accessor for OptionsModel();
  swift_allocObject();
  uint64_t v19 = v13;
  uint64_t v20 = v3;
  int64_t v21 = sub_2412ABC60(v17, v11, v18, v19, v14, v15);
  sub_241631C38();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v23 = sub_241631D38();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v20);
  void v29[2] = sub_2413A7564;
  v29[3] = v21;
  char v30 = 0;
  uint64_t v31 = v23;
  uint64_t v32 = v25;
  sub_241432300();
  id v27 = objc_allocWithZone(v26);
  return sub_2416315E8();
}

uint64_t sub_24160D9E8(void *a1)
{
  uint64_t v3 = *v1;
  sub_241318A48();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_241632028();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  _OWORD v8[3] = 0;
  v8[4] = a1;
  v8[5] = v1;
  v8[6] = v3;
  id v9 = a1;
  swift_retain();
  sub_241496830((uint64_t)v6, (uint64_t)&unk_268D045F8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_24160DB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = sub_24162EFA8();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24160DBE0, 0, 0);
}

uint64_t sub_24160DBE0()
{
  *(void *)(v0 + 72) = sub_241632008();
  *(void *)(v0 + 80) = sub_241631FF8();
  uint64_t v2 = sub_241631FC8();
  return MEMORY[0x270FA2498](sub_24160DC78, v2, v1);
}

uint64_t sub_24160DC78()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 88) = objc_msgSend(v1, sel_viewController);
  return MEMORY[0x270FA2498](sub_24160DD00, 0, 0);
}

uint64_t sub_24160DD00()
{
  id v16 = v0;
  if (v0[11])
  {
    v0[12] = sub_241631FF8();
    uint64_t v2 = sub_241631FC8();
    return MEMORY[0x270FA2498](sub_24160DF38, v2, v1);
  }
  else
  {
    sub_24162EF48();
    uint64_t v3 = sub_24162EF98();
    os_log_type_t v4 = sub_2416322C8();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v7 = v0[7];
    uint64_t v6 = v0[8];
    uint64_t v8 = v0[6];
    if (v5)
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v15 = v10;
      *(_DWORD *)uint64_t v9 = 136446210;
      uint64_t v11 = sub_2416333E8();
      v0[2] = sub_2411B6898(v11, v12, &v15);
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v3, v4, "[%{public}s] Tried to present PDF Viewer without a parent view controller", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245621640](v10, -1, -1);
      MEMORY[0x245621640](v9, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    }
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_24160DF38()
{
  swift_release();
  sub_24160E014();
  return MEMORY[0x270FA2498](sub_24160DFAC, 0, 0);
}

uint64_t sub_24160DFAC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24160E014()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  BOOL v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (void *)v1[17];
  if (v6)
  {
    id v7 = v6;
    sub_24160E2F0();
    uint64_t v8 = v1[2];
    id v9 = *(id *)(v8 + 24);
    id v10 = objc_msgSend(v9, sel_healthStore);
    uint64_t v11 = *(void **)(v8 + 40);
    uint64_t v12 = type metadata accessor for TwelveMonthCycleHistoryPDFProvider();
    swift_allocObject();
    id v13 = v7;
    uint64_t v14 = sub_24161CA58(v9, v10, v13, v11);
    v1[6] = v14;
    swift_retain();
    swift_release();
    v22[3] = v12;
    v22[4] = sub_24161126C();
    v22[0] = (uint64_t)v14;
    swift_retain();
    sub_2416324C8();

    swift_release();
    return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v22);
  }
  else
  {
    sub_24162EF48();
    id v16 = sub_24162EF98();
    os_log_type_t v17 = sub_2416322C8();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v22[0] = v19;
      *(_DWORD *)id v18 = 136446210;
      uint64_t v20 = sub_2416333E8();
      v22[5] = sub_2411B6898(v20, v21, v22);
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v16, v17, "[%{public}s] Tried to present PDF with nil analysis", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245621640](v19, -1, -1);
      MEMORY[0x245621640](v18, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_24160E2F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_241318A48();
  MEMORY[0x270FA5388](v3 - 8);
  BOOL v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_241632028();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  _OWORD v8[3] = 0;
  v8[4] = v1;
  v8[5] = v2;
  LODWORD(v2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  swift_retain();
  if (v2 == 1)
  {
    sub_241611198((uint64_t)v5, (uint64_t (*)(void))sub_241318A48);
  }
  else
  {
    sub_241632018();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    if (v8[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_241631FC8();
      uint64_t v11 = v10;
      swift_unknownObjectRelease();
      if (v11 | v9)
      {
        v13[0] = 0;
        v13[1] = 0;
        v13[2] = v9;
        v13[3] = v11;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24160E54C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[19] = a4;
  v5[20] = a5;
  uint64_t v6 = sub_24162EFA8();
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  uint64_t v7 = sub_24162BA08();
  v5[24] = v7;
  v5[25] = *(void *)(v7 - 8);
  v5[26] = swift_task_alloc();
  uint64_t v8 = sub_24162B718();
  v5[27] = v8;
  v5[28] = *(void *)(v8 - 8);
  v5[29] = swift_task_alloc();
  sub_2416111F8(0, (unint64_t *)&qword_268CFCD10, MEMORY[0x263F09010]);
  v5[30] = v9;
  v5[31] = *(void *)(v9 - 8);
  v5[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24160E73C, 0, 0);
}

uint64_t sub_24160E73C()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[25];
  uint64_t v14 = v0[24];
  uint64_t v15 = v0[19];
  uint64_t v16 = v0[27];
  sub_24162B6B8();
  sub_24162B9A8();
  id v5 = sub_24161C4C0();
  id v6 = (id)HKMCDeviationSampleTypes();
  sub_2411B9D00(0, (unint64_t *)&qword_26B0125F0);
  unint64_t v7 = sub_241631F28();

  id v8 = v5;
  sub_241610BAC(v7, (uint64_t)v8);

  swift_bridgeObjectRelease();
  sub_241460734();
  sub_2416111F8(0, (unint64_t *)&qword_268CFB1A0, MEMORY[0x263F06408]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_241637EE0;
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x245618650](KeyPath, 0);
  sub_2411B9D00(0, (unint64_t *)&qword_26B012390);
  sub_2416318C8();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v14);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v16);
  id v10 = objc_msgSend(*(id *)(*(void *)(v15 + 16) + 24), sel_healthStore);
  v0[33] = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[34] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24160E9E8;
  uint64_t v12 = v0[30];
  return MEMORY[0x270EF3200](v10, v12);
}

uint64_t sub_24160E9E8(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 280) = a1;
  *(void *)(v4 + 288) = v1;
  swift_task_dealloc();

  if (v1) {
    id v5 = sub_24160EEBC;
  }
  else {
    id v5 = sub_24160EB24;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24160EB24()
{
  unint64_t v1 = v0[35];
  if (v1 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v2 = sub_241633068();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = v0[19];
  swift_bridgeObjectRelease();
  if (v2) {
    char v4 = 4;
  }
  else {
    char v4 = 5;
  }
  type metadata accessor for RoomInteractionEvent();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0xD00000000000002ALL;
  *(void *)(v5 + 24) = 0x8000000241659F90;
  *(unsigned char *)(v5 + 32) = 8;
  v0[37] = v5;
  *(unsigned char *)(v5 + 33) = v4;
  *(unsigned char *)(v5 + 34) = 2;
  *(void *)(v5 + 40) = 0;
  *(unsigned char *)(v5 + 48) = 0;
  *(void *)(v5 + 56) = 0;
  id v6 = *(void **)(v3 + 24);
  v0[2] = v0;
  v0[7] = v0 + 39;
  v0[3] = sub_24160ECE8;
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2415E8460;
  v0[13] = &unk_2650E8128;
  v0[14] = v7;
  swift_retain();
  objc_msgSend(v6, sel_submitEvent_completion_, v5, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24160ECE8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 304) = v1;
  if (v1) {
    uint64_t v2 = sub_24160EF64;
  }
  else {
    uint64_t v2 = sub_24160EDF8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24160EDF8()
{
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[30];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24160EEBC()
{
  (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[30]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24160EF64()
{
  char v30 = v0;
  uint64_t v1 = (void *)v0[38];
  swift_willThrow();
  swift_release();
  sub_24162EF48();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24162EF98();
  os_log_type_t v5 = sub_2416322C8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[38];
    uint64_t v27 = v0[30];
    uint64_t v28 = v0[32];
    uint64_t v7 = v0[22];
    uint64_t v25 = v0[23];
    uint64_t v26 = v0[31];
    uint64_t v24 = v0[21];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v29[0] = v9;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v10 = sub_2416333E8();
    v0[16] = sub_2411B6898(v10, v11, v29);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    v0[17] = v6;
    id v12 = v6;
    sub_2411CE834();
    uint64_t v13 = sub_241631D58();
    v0[18] = sub_2411B6898(v13, v14, v29);
    sub_241632C28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24118E000, v4, v5, "[%{public}s] Error submitting analytics event: %{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245621640](v9, -1, -1);
    MEMORY[0x245621640](v8, -1, -1);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v25, v24);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {
    uint64_t v15 = (void *)v0[38];
    uint64_t v17 = v0[31];
    uint64_t v16 = v0[32];
    uint64_t v18 = v0[30];
    uint64_t v20 = v0[22];
    uint64_t v19 = v0[23];
    uint64_t v21 = v0[21];

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_24160F26C()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 56);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v0 + 96);

  return v0;
}

uint64_t sub_24160F2C4()
{
  sub_24160F26C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CycleLogNavigationHandler()
{
  return self;
}

void sub_24160F31C(void *a1, uint64_t a2)
{
  uint64_t v190 = a2;
  id v188 = a1;
  uint64_t v3 = sub_241631AC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v188 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CycleDay();
  MEMORY[0x270FA5388](v7);
  uint64_t v196 = (uint64_t)&v188 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v206 = (char *)&v188 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v188 - v12;
  MEMORY[0x270FA5388](v14);
  v205 = (char *)&v188 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v188 - v17;
  uint64_t v19 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE27loggingCarouselDisplayTypesSayABGvgZ_0();
  swift_retain();
  sub_2416109E4(v19);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v3;
  swift_release();
  uint64_t v210 = v21;
  uint64_t v191 = v2;
  uint64_t v23 = *(void *)(v2 + 16);
  uint64_t v24 = (char *)(v23 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleLoggingDataProvider_currentDay);
  swift_beginAccess();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v200 = v24;
  v25(v6, (uint64_t)v24, v22);
  uint64_t v198 = v23;
  id v26 = objc_msgSend(*(id *)(v23 + 176), sel_dayViewModelAtIndex_, sub_241631A88());
  uint64_t v194 = v4 + 16;
  v193 = v25;
  v25(v18, (uint64_t)v6, v22);
  uint64_t v201 = v7;
  uint64_t v27 = *(int *)(v7 + 20);
  *(void *)&v18[v27] = v26;
  uint64_t v28 = *(void (**)(char *, uint64_t))(v4 + 8);
  v192 = v6;
  uint64_t v202 = v4 + 8;
  v197 = v28;
  v28(v6, v22);
  id v29 = *(id *)&v18[v27];
  sub_241611198((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for CycleDay);
  id v30 = objc_msgSend(v29, sel_defaultLoggingBleedingType);

  uint64_t v189 = v22;
  if (v30 == (id)2)
  {
    uint64_t v48 = v192;
    uint64_t v49 = (void (*)(char *, char *, uint64_t))v193;
    v193(v192, (uint64_t)v200, v22);
    uint64_t v50 = v198;
    id v51 = objc_msgSend(*(id *)(v198 + 176), sel_dayViewModelAtIndex_, sub_241631A88(), v188);
    uint64_t v52 = v205;
    v49(v205, v48, v22);
    uint64_t v53 = *(int *)(v201 + 20);
    *(void *)&v52[v53] = v51;
    uint64_t v54 = v197;
    v197(v48, v22);
    id v55 = *(id *)&v52[v53];
    id v56 = objc_msgSend(v55, sel_menstruationLevel);

    BOOL v47 = v56 != (id)4;
    sub_241611198((uint64_t)v52, (uint64_t (*)(void))type metadata accessor for CycleDay);
    v49(v48, v200, v22);
    id v57 = objc_msgSend(*(id *)(v50 + 176), sel_dayViewModelAtIndex_, sub_241631A88());
    uint64_t v58 = v206;
    v49(v206, v48, v22);
    uint64_t v59 = *(int *)(v201 + 20);
    *(void *)&v58[v59] = v57;
    v54(v48, v22);
    id v60 = *(id *)&v58[v59];
    id v61 = objc_msgSend(v60, sel_daySummary);
    uint64_t v62 = (uint64_t)v58;
    if (v61)
    {
      uint64_t v63 = v61;
      unsigned int v64 = objc_msgSend(v61, sel_intermenstrualBleeding);

      int v65 = v64 ^ 1;
    }
    else
    {

      int v65 = 1;
    }
    LODWORD(v207) = v65;
    sub_241611198(v62, (uint64_t (*)(void))type metadata accessor for CycleDay);
    uint64_t v80 = v192;
    uint64_t v81 = (void (*)(char *, char *, uint64_t))v193;
    v193(v192, (uint64_t)v200, v22);
    id v82 = objc_msgSend(*(id *)(v198 + 176), sel_dayViewModelAtIndex_, sub_241631A88());
    BOOL v36 = v205;
    v81(v205, v80, v22);
    uint64_t v83 = *(int *)(v201 + 20);
    *(void *)&v36[v83] = v82;
    v197(v80, v22);
    id v84 = *(id *)&v36[v83];
    id v85 = objc_msgSend(v84, sel_bleedingInPregnancyLevel);

    LODWORD(v206) = 0;
    BOOL v42 = v85 != (id)1;
    goto LABEL_15;
  }
  if (v30 == (id)1)
  {
    uint64_t v66 = v192;
    uint64_t v67 = (void (*)(char *, char *, uint64_t))v193;
    v193(v192, (uint64_t)v200, v22);
    id v68 = objc_msgSend(*(id *)(v198 + 176), sel_dayViewModelAtIndex_, sub_241631A88(), v188);
    uint64_t v69 = v205;
    v67(v205, v66, v22);
    uint64_t v70 = *(int *)(v201 + 20);
    *(void *)&v69[v70] = v68;
    v197(v66, v22);
    id v71 = *(id *)&v69[v70];
    id v72 = objc_msgSend(v71, sel_menstruationLevel);

    BOOL v47 = v72 != (id)4;
    sub_241611198((uint64_t)v69, (uint64_t (*)(void))type metadata accessor for CycleDay);
    v67(v66, v200, v22);
    id v73 = objc_msgSend(*(id *)(v198 + 176), sel_dayViewModelAtIndex_, sub_241631A88());
    v67(v13, v66, v22);
    uint64_t v74 = *(int *)(v201 + 20);
    *(void *)&v13[v74] = v73;
    v197(v66, v22);
    id v75 = *(id *)&v13[v74];
    sub_241611198((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for CycleDay);
    id v76 = objc_msgSend(v75, sel_daySummary);
    if (v76)
    {
      os_log_type_t v77 = v76;
      unsigned int v78 = objc_msgSend(v76, sel_intermenstrualBleeding);

      int v79 = v78 ^ 1;
    }
    else
    {

      int v79 = 1;
    }
    LODWORD(v207) = v79;
    id v86 = v192;
    char v87 = (void (*)(char *, char *, uint64_t))v193;
    v193(v192, (uint64_t)v200, v22);
    id v88 = objc_msgSend(*(id *)(v198 + 176), sel_dayViewModelAtIndex_, sub_241631A88());
    BOOL v36 = v205;
    v87(v205, v86, v22);
    uint64_t v89 = *(int *)(v201 + 20);
    *(void *)&v36[v89] = v88;
    v197(v86, v22);
    id v90 = *(id *)&v36[v89];
    id v46 = objc_msgSend(v90, sel_bleedingAfterPregnancyLevel);

    BOOL v42 = 0;
    goto LABEL_14;
  }
  if (!v30)
  {
    uint64_t v31 = v192;
    uint64_t v32 = v200;
    unint64_t v33 = (void (*)(char *, char *, uint64_t))v193;
    v193(v192, (uint64_t)v200, v22);
    uint64_t v34 = v198;
    id v35 = objc_msgSend(*(id *)(v198 + 176), sel_dayViewModelAtIndex_, sub_241631A88(), v188);
    BOOL v36 = v205;
    v33(v205, v31, v22);
    uint64_t v37 = *(int *)(v201 + 20);
    *(void *)&v36[v37] = v35;
    uint64_t v38 = v197;
    v197(v31, v22);
    id v39 = *(id *)&v36[v37];
    id v40 = objc_msgSend(v39, sel_bleedingInPregnancyLevel);

    sub_241611198((uint64_t)v36, (uint64_t (*)(void))type metadata accessor for CycleDay);
    v33(v31, v32, v22);
    int v41 = *(void **)(v34 + 176);
    BOOL v42 = v40 != (id)1;
    id v43 = objc_msgSend(v41, sel_dayViewModelAtIndex_, sub_241631A88());
    v33(v36, v31, v22);
    uint64_t v44 = *(int *)(v201 + 20);
    *(void *)&v36[v44] = v43;
    v38(v31, v22);
    id v45 = *(id *)&v36[v44];
    id v46 = objc_msgSend(v45, sel_bleedingAfterPregnancyLevel);

    LODWORD(v207) = 0;
    BOOL v47 = 0;
LABEL_14:
    LODWORD(v206) = v46 != (id)1;
LABEL_15:
    sub_241611198((uint64_t)v36, (uint64_t (*)(void))type metadata accessor for CycleDay);
    goto LABEL_16;
  }
  LODWORD(v206) = 0;
  BOOL v42 = 0;
  LODWORD(v207) = 0;
  BOOL v47 = 0;
LABEL_16:
  unint64_t v91 = (void *)v210;
  uint64_t v92 = *(void *)(v210 + 16);
  if (!v92)
  {
    int64_t v121 = 0;
    goto LABEL_55;
  }
  v205 = (char *)*MEMORY[0x263F44F80];
  uint64_t v204 = *MEMORY[0x263F44F78];
  uint64_t v203 = *MEMORY[0x263F44F60];
  uint64_t v199 = *MEMORY[0x263F44F58];
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v93 = 0;
  while (1)
  {
    uint64_t v94 = (void *)v91[v93 + 4];
    if (v47) {
      break;
    }
    id v102 = v94;
    if ((v207 & 1) == 0) {
      goto LABEL_34;
    }
LABEL_29:
    uint64_t v103 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    uint64_t v105 = v104;
    if (v103 == _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() && v105 == v106) {
      goto LABEL_50;
    }
    char v108 = sub_241633218();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v108) {
      goto LABEL_51;
    }
LABEL_34:
    if (v42)
    {
      uint64_t v109 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
      uint64_t v111 = v110;
      if (v109 == _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() && v111 == v112) {
        goto LABEL_50;
      }
      char v114 = sub_241633218();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v114) {
        goto LABEL_51;
      }
    }
    if (v206)
    {
      uint64_t v115 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
      uint64_t v117 = v116;
      if (v115 != _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() || v117 != v118)
      {
        char v120 = sub_241633218();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v120) {
          goto LABEL_103;
        }
        goto LABEL_19;
      }

      swift_bridgeObjectRelease_n();
LABEL_103:
      swift_bridgeObjectRelease();
      uint64_t v123 = v93 + 1;
      if (!__OFADD__(v93, 1)) {
        goto LABEL_52;
      }
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
      return;
    }

LABEL_19:
    if (v92 == ++v93)
    {
      swift_bridgeObjectRelease();
      goto LABEL_54;
    }
  }
  uint64_t v95 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v97 = v96;
  if (v95 != _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() || v97 != v98)
  {
    char v100 = sub_241633218();
    id v101 = v94;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v100) {
      goto LABEL_51;
    }
    if ((v207 & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  id v122 = v94;
LABEL_50:
  swift_bridgeObjectRelease_n();
LABEL_51:
  swift_bridgeObjectRelease();

  uint64_t v123 = v93 + 1;
  if (__OFADD__(v93, 1)) {
    goto LABEL_105;
  }
LABEL_52:
  if (v123 != v92)
  {
    BOOL v195 = v42;
    uint64_t v151 = v93 + 5;
    uint64_t v92 = v93;
    while (1)
    {
      unint64_t v154 = v151 - 4;
      if ((unint64_t)(v151 - 4) >= v91[2]) {
        goto LABEL_106;
      }
      unint64_t v155 = (void *)v91[v151];
      if (!v47) {
        break;
      }
      uint64_t v156 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
      uint64_t v158 = v157;
      if (v156 == _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() && v158 == v159)
      {
        id v152 = v155;
LABEL_63:
        swift_bridgeObjectRelease_n();
LABEL_64:

        goto LABEL_65;
      }
      char v161 = sub_241633218();
      id v162 = v155;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v161) {
        goto LABEL_64;
      }
      if (v207) {
        goto LABEL_76;
      }
LABEL_81:
      if (v195)
      {
        uint64_t v170 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
        uint64_t v172 = v171;
        if (v170 == _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() && v172 == v173) {
          goto LABEL_63;
        }
        char v174 = sub_241633218();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v174) {
          goto LABEL_64;
        }
      }
      if (v206)
      {
        uint64_t v175 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
        uint64_t v177 = v176;
        if (v175 == _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() && v177 == v178)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_65;
        }
        char v179 = sub_241633218();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v179) {
          goto LABEL_65;
        }
      }
      else
      {
      }
      if (v154 != v92)
      {
        if (v92 < 0) {
          goto LABEL_109;
        }
        unint64_t v180 = v91[2];
        if (v92 >= v180) {
          goto LABEL_110;
        }
        if (v154 >= v180) {
          goto LABEL_111;
        }
        v181 = (void *)v91[v151];
        id v182 = (id)v91[v92 + 4];
        id v183 = v181;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v91 = sub_2414AA9D0(v91);
        }
        v184 = &v91[v92];
        v185 = (void *)v184[4];
        v184[4] = v183;

        if (v154 >= v91[2]) {
          goto LABEL_112;
        }
        v186 = (void *)v91[v151];
        v91[v151] = v182;

        uint64_t v210 = (uint64_t)v91;
      }
      if (__OFADD__(v92++, 1)) {
        goto LABEL_107;
      }
LABEL_65:
      uint64_t v153 = v151 - 3;
      ++v151;
      if (v153 == v91[2]) {
        goto LABEL_54;
      }
    }
    id v163 = v155;
    if ((v207 & 1) == 0) {
      goto LABEL_81;
    }
LABEL_76:
    uint64_t v164 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    uint64_t v166 = v165;
    if (v164 == _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0() && v166 == v167) {
      goto LABEL_63;
    }
    char v169 = sub_241633218();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v169) {
      goto LABEL_64;
    }
    goto LABEL_81;
  }
  uint64_t v92 = v93;
LABEL_54:
  int64_t v121 = v91[2];
  if (v121 < v92) {
    goto LABEL_108;
  }
LABEL_55:
  sub_2414ADF58(v92, v121);
  uint64_t v207 = v210;
  uint64_t v124 = v191;
  uint64_t v125 = *(void **)(v191 + 136);
  v126 = v192;
  uint64_t v127 = v189;
  uint64_t v128 = (void (*)(uint64_t, char *, uint64_t))v193;
  v193(v192, (uint64_t)v200, v189);
  uint64_t v129 = (void *)v198;
  id v130 = *(void **)(v198 + 176);
  v206 = v125;
  v205 = (char *)v188;
  id v131 = objc_msgSend(v130, sel_dayViewModelAtIndex_, sub_241631A88());
  uint64_t v132 = v196;
  v128(v196, v126, v127);
  uint64_t v133 = *(int *)(v201 + 20);
  *(void *)(v132 + v133) = v131;
  v197(v126, v127);
  uint64_t v134 = type metadata accessor for CycleLogModel();
  uint64_t v135 = (void *)v129[3];
  id v136 = *(id *)(v190 + *(int *)(v134 + 36));
  id v137 = objc_msgSend(v135, sel_healthStore);
  sub_2411A3DF4(v124 + 56, (uint64_t)v209);
  uint64_t v138 = v129[4];
  uint64_t v139 = (void *)v129[5];
  int v140 = *(void **)(v132 + v133);
  swift_unknownObjectRetain();
  id v141 = v139;
  id v142 = objc_msgSend(v140, sel_daySummary);
  if (v142)
  {
    if (v125) {
      goto LABEL_57;
    }
LABEL_59:
    id v144 = 0;
    id v143 = v206;
  }
  else
  {
    uint64_t v145 = self;
    id v142 = objc_msgSend(v145, sel_emptyDaySummaryWithDayIndex_, sub_241631A88());
    if (!v125) {
      goto LABEL_59;
    }
LABEL_57:
    id v143 = v206;
    id v144 = objc_msgSend(v206, sel_recentSymptoms, v188);
  }
  id v146 = objc_msgSend(v143, sel_recentBasalBodyTemperature, v188);
  id v147 = objc_msgSend(v146, sel_mostRecent);

  sub_2411A3DF4((uint64_t)v209, (uint64_t)v208);
  id v148 = objc_allocWithZone((Class)type metadata accessor for LoggingCardCarouselViewController());
  uint64_t v149 = v205;
  long long v150 = (char *)sub_24158F77C(v205, v207, (uint64_t)v144, v147, v142, v136, v137, (uint64_t)v208, v138, v141);

  swift_unknownObjectRelease();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v209);
  sub_241611198(v196, (uint64_t (*)(void))type metadata accessor for CycleDay);
  *(void *)&v150[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_loggingCardCarouselViewControllerDelegate
                 + 8] = &off_26F579400;
  swift_unknownObjectWeakAssign();
}

char *sub_241610614()
{
  uint64_t v1 = v0;
  uint64_t v30 = sub_241631AC8();
  uint64_t v2 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CycleDay();
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24162BA08();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1[2];
  uint64_t v13 = *(void *)(v12 + 32);
  uint64_t v14 = *(void **)(v12 + 176);
  uint64_t v15 = *(void **)(v12 + 40);
  id v32 = *(id *)(v12 + 24);
  uint64_t v33 = v13;
  uint64_t v16 = (uint64_t)v8;
  uint64_t v17 = v1;
  swift_unknownObjectRetain();
  id v31 = v14;
  id v18 = objc_msgSend(v15, sel_currentCalendar);
  uint64_t v34 = v11;
  sub_24162B928();

  uint64_t v19 = v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleLoggingDataProvider_currentDay;
  swift_beginAccess();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v21 = v30;
  v20(v4, v19, v30);
  id v22 = objc_msgSend(*(id *)(v12 + 176), sel_dayViewModelAtIndex_, sub_241631A88());
  v20((char *)v16, (uint64_t)v4, v21);
  *(void *)(v16 + *(int *)(v6 + 28)) = v22;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v21);
  uint64_t v23 = (void *)v17[17];
  if (v23)
  {
    id v24 = objc_msgSend(v23, sel_ongoingCycleFactors);
    sub_2411B9D00(0, (unint64_t *)&qword_26B012390);
    unint64_t v25 = sub_241631F28();
  }
  else
  {
    unint64_t v25 = MEMORY[0x263F8EE78];
  }
  id v26 = (void *)v17[4];
  uint64_t v27 = v17[5];
  sub_2411A3DF4((uint64_t)(v17 + 12), (uint64_t)v35);
  objc_allocWithZone((Class)type metadata accessor for CycleFactorsDaySummaryCollectionViewController());
  swift_retain();
  swift_retain();
  return sub_2414CC5F8(v32, v33, v31, (uint64_t)v34, v16, v25, v26, v27, (uint64_t)v35);
}

void sub_241610984(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_startDate);
  sub_24162B6A8();
}

void sub_2416109E4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return;
  }
  unint64_t v2 = 0;
  uint64_t v3 = a1 + 32;
  uint64_t v4 = MEMORY[0x263F8EE78];
  do
  {
    if (v2 <= v1) {
      unint64_t v5 = v1;
    }
    else {
      unint64_t v5 = v2;
    }
    unint64_t v6 = v2;
    while (1)
    {
      if (v5 == v6)
      {
        __break(1u);
        return;
      }
      uint64_t v7 = *(void **)(v3 + 8 * v6);
      swift_getKeyPath();
      swift_getKeyPath();
      id v8 = v7;
      sub_24162FC48();
      swift_release();
      swift_release();
      if (*(void *)(v14 + 16))
      {
        uint64_t v9 = sub_241545650(v8);
        if (v10) {
          break;
        }
      }

      swift_bridgeObjectRelease();
LABEL_8:
      ++v6;

      if (v1 == v6) {
        return;
      }
    }
    int v11 = *(unsigned __int8 *)(*(void *)(v14 + 56) + v9);

    swift_bridgeObjectRelease();
    if (v11 != 1) {
      goto LABEL_8;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_24149E0D8(0, *(void *)(v4 + 16) + 1, 1);
    }
    unint64_t v13 = *(void *)(v4 + 16);
    unint64_t v12 = *(void *)(v4 + 24);
    if (v13 >= v12 >> 1) {
      sub_24149E0D8(v12 > 1, v13 + 1, 1);
    }
    unint64_t v2 = v6 + 1;
    *(void *)(v4 + 16) = v13 + 1;
    *(void *)(v4 + 8 * v13 + 32) = v8;
  }
  while (v1 - 1 != v6);
}

uint64_t sub_241610BAC(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v21 = a2;
  sub_2416111F8(0, (unint64_t *)&qword_268CFCD40, MEMORY[0x263F08FD0]);
  uint64_t v20 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v18 - v7;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    if (!v9) {
      return v10;
    }
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24149DF94(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0) {
      break;
    }
    uint64_t v12 = 0;
    uint64_t v10 = v22;
    unint64_t v18 = v3;
    unint64_t v19 = a1 & 0xC000000000000001;
    unint64_t v13 = a1;
    while (v9 != v12)
    {
      if (v19) {
        id v14 = (id)MEMORY[0x245620370](v12, a1);
      }
      else {
        id v14 = *(id *)(a1 + 8 * v12 + 32);
      }
      uint64_t v15 = v14;
      sub_2411B9D00(0, (unint64_t *)&qword_26B012390);
      sub_241631848();

      uint64_t v22 = v10;
      unint64_t v17 = *(void *)(v10 + 16);
      unint64_t v16 = *(void *)(v10 + 24);
      unint64_t v3 = v17 + 1;
      if (v17 >= v16 >> 1)
      {
        sub_24149DF94(v16 > 1, v17 + 1, 1);
        uint64_t v10 = v22;
      }
      ++v12;
      *(void *)(v10 + 16) = v3;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v17, v8, v20);
      a1 = v13;
      if (v9 == v12) {
        return v10;
      }
    }
    __break(1u);
LABEL_15:
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v9 = sub_241633068();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_241610DF8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  *(void *)(v7 + 48) = 0;
  *(void *)(v7 + 136) = 0;
  *(void *)(v7 + 16) = a1;
  unint64_t v13 = (void *)*MEMORY[0x263F09930];
  id v14 = *(void **)(a1 + 24);
  swift_retain();
  id v15 = v13;
  id v16 = objc_msgSend(v14, sel_healthStore);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A0C0]), sel_initWithLoggingCategory_healthDataSource_, v15, v16);

  *(void *)(v7 + 24) = v17;
  *(void *)(v7 + 32) = a2;
  *(void *)(v7 + 40) = a3;
  *(unsigned char *)(v7 + 144) = a4;
  sub_2411A3DF4(a5, v7 + 56);
  sub_2411A3DF4(a6, v7 + 96);
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v18 = (void *)sub_2416325A8();
  objc_msgSend(v14, sel_addObserver_queue_, v7, v18);
  swift_release();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(a6);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(a5);
  return v7;
}

void sub_241610F60(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2416314D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  *uint64_t v7 = sub_2416325A8();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F0E0], v4);
  char v8 = sub_241631508();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    uint64_t v9 = *(void **)(v2 + 136);
    *(void *)(v2 + 136) = a1;
    id v10 = a1;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_241611098()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2416110D8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *char v8 = v2;
  v8[1] = sub_241201428;
  return sub_24160E54C(a1, v4, v5, v7, v6);
}

uint64_t sub_241611198(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_2416111F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_2411B9D00(255, (unint64_t *)&qword_26B012390);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_24161126C()
{
  unint64_t result = qword_268D045E8;
  if (!qword_268D045E8)
  {
    type metadata accessor for TwelveMonthCycleHistoryPDFProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268D045E8);
  }
  return result;
}

uint64_t sub_2416112C4()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24161130C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_241201428;
  return sub_24160DB1C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2416113D8()
{
  return swift_initClassMetadata2();
}

void sub_24161141C()
{
  v30.receiver = v0;
  v30.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v30, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[qword_268D04600];
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v2, sel_frame);
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    id v11 = objc_msgSend(v0, sel_contentView);
    objc_msgSend(v11, sel_bounds);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v31.origin.CGFloat x = v4;
    v31.origin.CGFloat y = v6;
    v31.size.CGFloat width = v8;
    v31.size.CGFloat height = v10;
    v32.origin.CGFloat x = v13;
    v32.origin.CGFloat y = v15;
    v32.size.CGFloat width = v17;
    v32.size.CGFloat height = v19;
    if (!CGRectEqualToRect(v31, v32))
    {
      id v20 = v2;
      id v21 = objc_msgSend(v0, sel_contentView);
      objc_msgSend(v21, sel_bounds);
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;

      objc_msgSend(v20, sel_setFrame_, v23, v25, v27, v29);
      objc_msgSend(v20, sel_setNeedsDisplay);
    }
  }
}

void sub_241611598(void *a1)
{
  id v1 = a1;
  sub_24161141C();
}

id sub_2416115E0(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[qword_268D04600] = 0;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_241611654(double a1, double a2, double a3, double a4)
{
  return sub_2416115E0(a1, a2, a3, a4);
}

id sub_241611678(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[qword_268D04600] = 0;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);

  return v4;
}

id sub_2416116D8(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_241611678(a3);
}

void sub_241611700(uint64_t a1)
{
}

uint64_t type metadata accessor for CycleChartDayCell()
{
  return sub_2411D9FC0();
}

uint64_t type metadata accessor for CycleFactorsReminderActionHandler()
{
  uint64_t result = qword_26B00F750;
  if (!qword_26B00F750) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_241611774()
{
  sub_241613558();
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

void sub_241611814()
{
  uint64_t v13 = sub_24162CCF8();
  uint64_t v0 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24162E178();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  objc_super v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  double v9 = (char *)&v12 - v8;
  type metadata accessor for CycleFactorsReminderActionHandler();
  sub_24161382C(&qword_26B00F748, (void (*)(uint64_t))type metadata accessor for CycleFactorsReminderActionHandler);
  sub_24162E308();
  type metadata accessor for ReviewCycleFactorsEvent();
  sub_24162DE98();
  sub_24162E148();
  CGFloat v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v9, v3);
  sub_24162D3B8();
  swift_release();
  sub_24162DE98();
  sub_24162E148();
  v10(v6, v3);
  objc_super v11 = (void *)sub_24162D3A8();
  swift_release();
  sub_24120825C(0, 1, (uint64_t)v2, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v13);
  sub_241611A7C();
}

void sub_241611A7C()
{
  uint64_t v32 = *v0;
  uint64_t v1 = sub_24162E178();
  uint64_t v33 = *(void *)(v1 - 8);
  uint64_t v34 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24162CCF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24162EFA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  objc_super v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  swift_retain_n();
  uint64_t v12 = sub_24162EF98();
  os_log_type_t v13 = sub_2416322E8();
  int v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v31 = v8;
    uint64_t v16 = v15;
    uint64_t v30 = swift_slowAlloc();
    v36[0] = v30;
    *(_DWORD *)uint64_t v16 = 136446466;
    int v29 = v14;
    uint64_t v17 = sub_2416333E8();
    uint64_t v32 = v9;
    uint64_t v18 = v5;
    uint64_t v35 = sub_2411B6898(v17, v19, v36);
    void v28[2] = v36;
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    v28[1] = v16 + 14;
    sub_24162DE98();
    sub_24162E148();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v3, v34);
    sub_24162D3B8();
    swift_release();
    sub_24161382C((unint64_t *)&qword_268CFAB48, MEMORY[0x263F43C08]);
    uint64_t v20 = sub_2416331D8();
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v4);
    uint64_t v35 = sub_2411B6898(v20, v22, v36);
    sub_241632C28();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v12, (os_log_type_t)v29, "[%{public}s] Dismissing tile from %s", (uint8_t *)v16, 0x16u);
    uint64_t v23 = v30;
    swift_arrayDestroy();
    MEMORY[0x245621640](v23, -1, -1);
    MEMORY[0x245621640](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v31);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  sub_2411B9D00(0, (unint64_t *)&qword_268CFC640);
  double v24 = (void *)sub_241632428();
  v36[0] = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  v36[1] = v25;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  sub_241631CC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v26 = objc_allocWithZone((Class)sub_24162C988());
  double v27 = (void *)sub_24162C978();
  objc_msgSend(v24, sel_addOperation_, v27);
}

uint64_t sub_241611F5C()
{
  uint64_t v147 = *(void *)v0;
  uint64_t v139 = sub_24162CCF8();
  uint64_t v137 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  id v146 = (char *)&v129 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24162EFA8();
  uint64_t v154 = *(void *)(v2 - 8);
  uint64_t v155 = v2;
  MEMORY[0x270FA5388](v2);
  id v142 = (char *)&v129 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v145 = (char *)&v129 - v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v138 = (char *)&v129 - v7;
  MEMORY[0x270FA5388](v8);
  int v140 = (char *)&v129 - v9;
  MEMORY[0x270FA5388](v10);
  id v141 = (char *)&v129 - v11;
  sub_241613558();
  MEMORY[0x270FA5388](v12 - 8);
  id v143 = (char *)&v129 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v136 = (uint64_t)&v129 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v151 = (char *)&v129 - v17;
  uint64_t v18 = type metadata accessor for CycleFactorsReminderUserData();
  uint64_t v19 = *(void *)(v18 - 8);
  id v152 = (id)v18;
  uint64_t v153 = v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v148 = (uint64_t)&v129 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v129 - v22;
  MEMORY[0x270FA5388](v24);
  id v26 = (char *)&v129 - v25;
  MEMORY[0x270FA5388](v27);
  id v144 = (char *)&v129 - v28;
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v129 - v30;
  uint64_t v32 = sub_24162E178();
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v129 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v149 = (char *)&v129 - v37;
  MEMORY[0x270FA5388](v38);
  id v40 = (char *)&v129 - v39;
  int v41 = v0;
  sub_24162DE98();
  uint64_t v42 = sub_24162E158();
  unint64_t v44 = v43;
  BOOL v47 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v46 = v33 + 8;
  id v45 = v47;
  uint64_t v150 = v32;
  uint64_t v48 = v32;
  unint64_t v49 = v44;
  v47(v40, v48);
  if (v49 >> 60 == 15)
  {
    uint64_t v50 = (uint64_t)v151;
    (*(void (**)(char *, uint64_t, uint64_t, id))(v153 + 56))(v151, 1, 1, v152);
    uint64_t v51 = (uint64_t)&v41[qword_26B00F730];
    swift_beginAccess();
    sub_241613698(v50, v51);
    swift_endAccess();
    uint64_t v52 = v145;
    sub_24162EF48();
    swift_retain_n();
    uint64_t v53 = sub_24162EF98();
    os_log_type_t v54 = sub_2416322E8();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v156 = (char *)v56;
      *(_DWORD *)uint64_t v55 = 136446466;
      uint64_t v57 = sub_2416333E8();
      uint64_t v158 = sub_2411B6898(v57, v58, (uint64_t *)&v156);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2080;
      sub_24162DE98();
      uint64_t v59 = sub_241631D48();
      uint64_t v158 = sub_2411B6898(v59, v60, (uint64_t *)&v156);
      sub_241632C28();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v53, v54, "[%{public}s] Context contains nil user data: %s", (uint8_t *)v55, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245621640](v56, -1, -1);
      MEMORY[0x245621640](v55, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v154 + 8))(v52, v155);
  }
  else
  {
    uint64_t v61 = (uint64_t)v151;
    uint64_t v129 = v23;
    id v130 = v26;
    id v131 = v35;
    uint64_t v135 = v45;
    uint64_t v132 = v46;
    uint64_t v145 = v41;
    sub_24162ADF8();
    swift_allocObject();
    sub_241251FD0(v42, v49);
    sub_24162ADE8();
    sub_24161382C(&qword_268D04688, (void (*)(uint64_t))type metadata accessor for CycleFactorsReminderUserData);
    uint64_t v62 = (uint64_t)v144;
    id v63 = v152;
    sub_24162ADD8();
    uint64_t v64 = v42;
    id v65 = v63;
    unint64_t v134 = v49;
    uint64_t v133 = v64;
    sub_241251EC8(v64, v49);
    swift_release();
    uint64_t v67 = v31;
    sub_2416137C4(v62, (uint64_t)v31, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
    sub_24161375C((uint64_t)v31, v61, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
    uint64_t v68 = v153;
    (*(void (**)(uint64_t, void, uint64_t, id))(v153 + 56))(v61, 0, 1, v65);
    uint64_t v69 = v136;
    sub_2416137C4(v61, v136, (uint64_t (*)(void))sub_241613558);
    uint64_t v70 = v145;
    uint64_t v71 = (uint64_t)&v145[qword_26B00F730];
    swift_beginAccess();
    sub_241613698(v69, v71);
    swift_endAccess();
    id v72 = v141;
    sub_24162EF48();
    uint64_t v151 = v67;
    uint64_t v73 = (uint64_t)v67;
    uint64_t v74 = (uint64_t)v130;
    sub_24161375C(v73, (uint64_t)v130, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
    id v75 = sub_24162EF98();
    os_log_type_t v76 = sub_2416322E8();
    int v77 = v76;
    BOOL v78 = os_log_type_enabled(v75, v76);
    uint64_t v79 = v148;
    uint64_t v80 = (uint64_t)v143;
    if (v78)
    {
      uint64_t v81 = swift_slowAlloc();
      id v144 = (char *)swift_slowAlloc();
      uint64_t v156 = v144;
      *(_DWORD *)uint64_t v81 = 136446466;
      uint64_t v82 = sub_2416333E8();
      uint64_t v158 = sub_2411B6898(v82, v83, (uint64_t *)&v156);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v81 + 12) = 2080;
      LODWORD(v142) = v77;
      sub_24161375C(v74, (uint64_t)v129, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
      uint64_t v84 = sub_241631D78();
      uint64_t v158 = sub_2411B6898(v84, v85, (uint64_t *)&v156);
      uint64_t v68 = v153;
      sub_241632C28();
      swift_bridgeObjectRelease();
      sub_2416136FC(v74, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
      _os_log_impl(&dword_24118E000, v75, (os_log_type_t)v142, "[%{public}s] Updating user data to %s", (uint8_t *)v81, 0x16u);
      id v86 = v144;
      swift_arrayDestroy();
      MEMORY[0x245621640](v86, -1, -1);
      MEMORY[0x245621640](v81, -1, -1);

      char v87 = *(void (**)(char *, uint64_t))(v154 + 8);
      v87(v141, v155);
      uint64_t v88 = (uint64_t)v151;
      uint64_t v70 = v145;
    }
    else
    {

      sub_2416136FC(v74, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
      char v87 = *(void (**)(char *, uint64_t))(v154 + 8);
      v87(v72, v155);
      uint64_t v88 = (uint64_t)v151;
    }
    sub_2416136FC(v88, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
    uint64_t v89 = (uint64_t)&v70[qword_26B00F730];
    swift_beginAccess();
    sub_24161375C(v89, v80, (uint64_t (*)(void))sub_241613558);
    if ((*(unsigned int (**)(uint64_t, uint64_t, id))(v68 + 48))(v80, 1, v65) == 1)
    {
      sub_2416136FC(v80, (uint64_t (*)(void))sub_241613558);
      id v90 = v138;
      sub_24162EF48();
      unint64_t v91 = sub_24162EF98();
      os_log_type_t v92 = sub_2416322C8();
      if (os_log_type_enabled(v91, v92))
      {
        uint64_t v93 = (uint8_t *)swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        uint64_t v156 = (char *)v94;
        *(_DWORD *)uint64_t v93 = 136446210;
        uint64_t v95 = sub_2416333E8();
        uint64_t v157 = sub_2411B6898(v95, v96, (uint64_t *)&v156);
        sub_241632C28();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24118E000, v91, v92, "[%{public}s] Not presenting factors review flow due to nil userData", v93, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245621640](v94, -1, -1);
        MEMORY[0x245621640](v93, -1, -1);

        sub_241251EC8(v133, v134);
      }
      else
      {
        sub_241251EC8(v133, v134);
      }
      return ((uint64_t (*)(char *, uint64_t))v87)(v90, v155);
    }
    else
    {
      uint64_t v151 = (char *)v87;
      sub_2416137C4(v80, v79, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
      uint64_t v97 = v149;
      sub_24162DE98();
      sub_24162E148();
      uint64_t v98 = v150;
      uint64_t v99 = v135;
      v135(v97, v150);
      char v100 = (void *)sub_24162D3A8();
      swift_release();
      id v101 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A130]), sel_init);
      type metadata accessor for OnboardingUserInfo();
      swift_allocObject();
      uint64_t v102 = sub_2413ADD10(v101, v100, 0, 0, 0);

      sub_24125DE44();
      uint64_t v103 = (void *)sub_2416317B8();
      uint64_t v104 = *(void **)(v102 + 24);
      *(void *)(v102 + 24) = v103;
      id v105 = v103;

      sub_2413A78B8();
      swift_retain();
      sub_24162DE98();
      sub_24162E148();
      v99(v97, v98);
      sub_24162D3C8();
      swift_release();
      uint64_t v106 = v131;
      sub_24162DE98();
      sub_24162E148();
      v99(v106, v98);
      uint64_t v107 = (uint64_t)v146;
      sub_24162D3B8();
      swift_release();
      id v108 = objc_allocWithZone((Class)type metadata accessor for CycleFactorsReviewNavigationController());
      uint64_t v153 = v102;
      id v109 = sub_2412982B0(v102, (uint64_t)&v156, v107);
      uint64_t v110 = *(void **)&v70[qword_26B00F728];
      *(void *)&v70[qword_26B00F728] = v109;
      id v111 = v109;

      uint64_t v112 = v140;
      sub_24162EF48();
      uint64_t v113 = sub_24162EF98();
      os_log_type_t v114 = sub_2416322E8();
      BOOL v115 = os_log_type_enabled(v113, v114);
      id v152 = v111;
      if (v115)
      {
        uint64_t v116 = (uint8_t *)swift_slowAlloc();
        uint64_t v117 = swift_slowAlloc();
        uint64_t v156 = (char *)v117;
        *(_DWORD *)uint64_t v116 = 136446210;
        uint64_t v118 = sub_2416333E8();
        uint64_t v157 = sub_2411B6898(v118, v119, (uint64_t *)&v156);
        sub_241632C28();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24118E000, v113, v114, "[%{public}s] Presenting factors review flow", v116, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245621640](v117, -1, -1);
        MEMORY[0x245621640](v116, -1, -1);
      }

      ((void (*)(char *, uint64_t))v151)(v112, v155);
      uint64_t v120 = v137;
      int64_t v121 = v131;
      type metadata accessor for ReviewCycleFactorsEvent();
      id v122 = v149;
      sub_24162DE98();
      sub_24162E148();
      uint64_t v123 = v150;
      uint64_t v124 = v135;
      v135(v122, v150);
      uint64_t v125 = (uint64_t)v146;
      sub_24162D3B8();
      swift_release();
      sub_24162DE98();
      sub_24162E148();
      v124(v121, v123);
      v126 = (void *)sub_24162D3A8();
      swift_release();
      sub_24120825C(0, 0, v125, (uint64_t)v126);

      (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v125, v139);
      sub_24162DE98();
      uint64_t v127 = (void *)sub_24162E168();
      v124(v122, v123);
      uint64_t v128 = v152;
      objc_msgSend(v127, sel_showViewController_sender_, v152, 0);
      swift_release();

      sub_241251EC8(v133, v134);
      return sub_2416136FC(v148, (uint64_t (*)(void))type metadata accessor for CycleFactorsReminderUserData);
    }
  }
}

uint64_t sub_24161330C(uint64_t a1)
{
  uint64_t v2 = sub_24162E178();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v6 + qword_26B00F730;
  uint64_t v8 = type metadata accessor for CycleFactorsReminderUserData();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)(v6 + qword_26B00F728) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v9 = sub_24162DEA8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v9;
}

void sub_24161346C()
{
  sub_2416136FC(v0 + qword_26B00F730, (uint64_t (*)(void))sub_241613558);
  uint64_t v1 = *(void **)(v0 + qword_26B00F728);
}

uint64_t sub_2416134C0()
{
  uint64_t v0 = sub_24162DEB8();
  sub_2416136FC(v0 + qword_26B00F730, (uint64_t (*)(void))sub_241613558);

  return swift_deallocClassInstance();
}

void sub_241613558()
{
  if (!qword_26B00F430)
  {
    type metadata accessor for CycleFactorsReminderUserData();
    unint64_t v0 = sub_241632C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B00F430);
    }
  }
}

uint64_t sub_2416135B0()
{
  return type metadata accessor for CycleFactorsReminderActionHandler();
}

uint64_t sub_2416135B8()
{
  return sub_24161382C(&qword_26B00F738, (void (*)(uint64_t))type metadata accessor for CycleFactorsReminderActionHandler);
}

uint64_t sub_241613608()
{
  return sub_24161382C(&qword_26B00F748, (void (*)(uint64_t))type metadata accessor for CycleFactorsReminderActionHandler);
}

uint64_t sub_241613650()
{
  return sub_24161382C(&qword_26B00F740, (void (*)(uint64_t))type metadata accessor for CycleFactorsReminderActionHandler);
}

uint64_t sub_241613698(uint64_t a1, uint64_t a2)
{
  sub_241613558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2416136FC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24161375C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2416137C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24161382C(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_241613878()
{
  uint64_t v1 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController____lazy_storage___periodLengthViewController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController____lazy_storage___periodLengthViewController);
  if (v2)
  {
    uint64_t v3 = *(char **)(v0
                  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController____lazy_storage___periodLengthViewController);
  }
  else
  {
    uint64_t v4 = sub_2416138DC(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    uint64_t v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

char *sub_2416138DC(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v1 = sub_24162B7E8();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_241631CA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - v7;
  sub_241631C38();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v5, v8, v2);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v10 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v24 = sub_241631D38();
  uint64_t v12 = v11;
  uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v8, v2);
  sub_241631C38();
  v9(v5, v8, v2);
  id v14 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v15 = sub_241631D38();
  uint64_t v17 = v16;
  v13(v8, v2);
  uint64_t v18 = v25;
  uint64_t v19 = *(void *)(v25
                  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_userInfo);
  sub_2411A3DF4(v25 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pinnedContentManager, (uint64_t)v27);
  *(void *)((char *)objc_allocWithZone((Class)type metadata accessor for MenstrualCyclesOnboardingPeriodLengthViewController())
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin51MenstrualCyclesOnboardingPeriodLengthViewController____lazy_storage___typicalCycleViewController) = 0;
  sub_2411A3DF4((uint64_t)v27, (uint64_t)v26);
  swift_retain();
  uint64_t v20 = (char *)sub_241528CC4(1, 20, 0, v24, v12, v15, v17, v19, (uint64_t)v26);
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v27);
  uint64_t v21 = v18 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_delegate;
  MEMORY[0x245621790](v18 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_delegate);
  *(void *)&v20[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_delegate + 8] = *(void *)(v21 + 8);
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v20;
}

uint64_t sub_241613C30()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24162B7E8();
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v44 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_241631CA8();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v43 = (char *)&v41 - v7;
  uint64_t v8 = sub_24162BA08();
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24162B718();
  uint64_t v49 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416150D0(0, (unint64_t *)&unk_26B00F1B0, MEMORY[0x263F090E8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = sub_241631AC8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v50 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  PeriodViewController = (objc_class *)type metadata accessor for MenstrualCyclesOnboardingLastPeriodViewController();
  v51.receiver = v0;
  v51.super_class = PeriodViewController;
  objc_msgSendSuper2(&v51, sel_viewDidLoad);
  id v21 = sub_241528A48();
  objc_msgSend(v21, sel_addTarget_action_forControlEvents_, v1, sel_datePickerChangedWithPicker_, 4096);

  uint64_t v22 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_userInfo;
  uint64_t v23 = *(void *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_userInfo];
  if ((*(unsigned char *)(v23
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18OnboardingUserInfo_startOfLastMenstrualPeriodDayFromAnalysis) & 1) == 0)
  {
    id v24 = sub_241528C44();
    objc_msgSend(v24, sel_setEnabled_, 0);

    uint64_t v23 = *(void *)&v1[v22];
  }
  uint64_t v25 = v23 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18OnboardingUserInfo_startOfLastMenstrualPeriodDayIndex;
  swift_beginAccess();
  sub_2411CE5A0(v25, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1) {
    return sub_2411CE634((uint64_t)v16);
  }
  uint64_t v27 = *(void (**)(char *, char *))(v18 + 32);
  uint64_t v41 = v17;
  v27(v50, v16);
  id v28 = objc_msgSend(*(id *)(v23 + 16), sel_currentCalendar);
  sub_24162B928();

  sub_241631AB8();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v48);
  id v29 = sub_241528A48();
  uint64_t v30 = (void *)sub_24162B668();
  objc_msgSend(v29, sel_setDate_, v30);

  (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v11);
  if (*(unsigned char *)(*(void *)&v1[v22]
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18OnboardingUserInfo_startOfLastMenstrualPeriodDayFromAnalysis) == 1)
  {
    swift_retain();
    uint64_t v31 = sub_2413ABD78();
    uint64_t v33 = v32;
    swift_release();
    if (v33)
    {
      id v34 = sub_241528BA8();
      uint64_t v35 = v43;
      sub_241631C38();
      uint64_t v37 = v45;
      uint64_t v36 = v46;
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v42, v35, v46);
      if (qword_26B0131F0 != -1) {
        swift_once();
      }
      id v38 = (id)qword_26B0181A0;
      sub_24162B7D8();
      sub_241631D38();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v36);
      sub_2416150D0(0, (unint64_t *)&qword_26B012400, (uint64_t (*)(uint64_t))sub_241223B64, MEMORY[0x263F8E0F8]);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_241637EE0;
      *(void *)(v39 + 56) = MEMORY[0x263F8D310];
      *(void *)(v39 + 64) = sub_2411C0A14();
      *(void *)(v39 + 32) = v31;
      *(void *)(v39 + 40) = v33;
      sub_241631D28();
      swift_bridgeObjectRelease();
      id v40 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v34, sel_setText_, v40);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v50, v41);
}

uint64_t sub_24161432C(char a1)
{
  uint64_t v3 = sub_24162B7E8();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_241631CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)&double v9 = MEMORY[0x270FA5388](v8).n128_u64[0];
  uint64_t v11 = &v20[-v10];
  id v12 = objc_msgSend(v1, sel_navigationItem, v9);
  sub_241631C38();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v7, v11, v4);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v11, v4);
  uint64_t v14 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setBackButtonTitle_, v14);

  uint64_t v15 = sub_241613878();
  objc_msgSend(v1, sel_showViewController_sender_, v15, 0);

  uint64_t v16 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_delegate];
  uint64_t result = MEMORY[0x245621790](&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_delegate]);
  if (result)
  {
    uint64_t v18 = *((void *)v16 + 1);
    uint64_t ObjectType = swift_getObjectType();
    sub_2414FC4D4(2, a1 & 1, ObjectType, v18);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2416145D8()
{
  uint64_t v1 = sub_24162EFA8();
  uint64_t v40 = *(void *)(v1 - 8);
  uint64_t v41 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v42 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416150D0(0, (unint64_t *)&unk_26B00F1B0, MEMORY[0x263F090E8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v36 = (char *)v34 - v4;
  uint64_t v39 = sub_24162B7F8();
  uint64_t v5 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24162BA08();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v35 = sub_24162B718();
  MEMORY[0x270FA5388](v35);
  uint64_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_241631AC8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = sub_241528A48();
  id v16 = objc_msgSend(v15, sel_date);

  sub_24162B6A8();
  uint64_t v17 = v39;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F07740], v39);
  sub_24162B808();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  v34[1] = v10;
  sub_241631A68();
  uint64_t v18 = *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_userInfo];
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v20 = (uint64_t)v36;
  uint64_t v37 = v14;
  v19(v36, v14, v11);
  uint64_t v38 = v12;
  uint64_t v39 = v11;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
  uint64_t v21 = v18 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18OnboardingUserInfo_startOfLastMenstrualPeriodDayIndex;
  swift_beginAccess();
  swift_retain();
  sub_2413AE29C(v20, v21);
  swift_endAccess();
  swift_release();
  sub_24162EF48();
  uint64_t v22 = v0;
  uint64_t v23 = sub_24162EF98();
  os_log_type_t v24 = sub_2416322E8();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    v44[0] = v26;
    *(_DWORD *)uint64_t v25 = 136446466;
    uint64_t ObjectType = swift_getObjectType();
    sub_241615098();
    uint64_t v27 = sub_241631D48();
    uint64_t ObjectType = sub_2411B6898(v27, v28, v44);
    sub_241632C28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2082;
    id v29 = sub_241528A48();
    id v30 = objc_msgSend(v29, sel_date);

    sub_24162B6A8();
    uint64_t v31 = sub_241631D78();
    uint64_t ObjectType = sub_2411B6898(v31, v32, v44);
    sub_241632C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v23, v24, "[%{public}s] Selected last menstrual period date: %{public}s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245621640](v26, -1, -1);
    MEMORY[0x245621640](v25, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v41);
  sub_24161432C(0);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v37, v39);
}

uint64_t sub_241614BEC()
{
  uint64_t v1 = sub_24162EFA8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416150D0(0, (unint64_t *)&unk_26B00F1B0, MEMORY[0x263F090E8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_userInfo];
  uint64_t v9 = sub_241631AC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  uint64_t v10 = v8 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18OnboardingUserInfo_startOfLastMenstrualPeriodDayIndex;
  swift_beginAccess();
  swift_retain();
  sub_2413AE29C((uint64_t)v7, v10);
  swift_endAccess();
  swift_release();
  sub_24162EF48();
  uint64_t v11 = v0;
  uint64_t v12 = sub_24162EF98();
  os_log_type_t v13 = sub_2416322E8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v21 = v1;
    uint64_t v16 = v15;
    v23[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    uint64_t ObjectType = swift_getObjectType();
    sub_241615098();
    uint64_t v17 = sub_241631D48();
    uint64_t ObjectType = sub_2411B6898(v17, v18, v23);
    sub_241632C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v12, v13, "[%{public}s] Selected last menstrual period date: None", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v16, -1, -1);
    MEMORY[0x245621640](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v21);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return sub_24161432C(1);
}

uint64_t sub_241614F38(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v6 = a1;
  sub_241632CE8();
  uint64_t v7 = swift_unknownObjectRelease();
  a4(v7);

  return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v9);
}

void sub_241615020()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController____lazy_storage___periodLengthViewController));
}

id sub_241615030()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MenstrualCyclesOnboardingLastPeriodViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MenstrualCyclesOnboardingLastPeriodViewController()
{
  return self;
}

unint64_t sub_241615098()
{
  unint64_t result = qword_268D04698;
  if (!qword_268D04698)
  {
    type metadata accessor for MenstrualCyclesOnboardingLastPeriodViewController();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268D04698);
  }
  return result;
}

void sub_2416150D0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t *sub_241615134(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5, void *a6)
{
  uint64_t v7 = v6;
  uint64_t v49 = a6;
  id v50 = a3;
  uint64_t v51 = a5;
  uint64_t v52 = a1;
  LODWORD(v45) = a4;
  uint64_t v9 = *v7;
  uint64_t v10 = sub_24162EFA8();
  uint64_t v47 = *(void *)(v10 - 8);
  uint64_t v48 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24162C1C8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411C3D50();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v40 = v17;
  uint64_t v41 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (char *)v7 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20SummaryTileGenerator_domain;
  uint64_t v22 = sub_24162C128();
  uint64_t v43 = *(void *)(v22 - 8);
  uint64_t v44 = v22;
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t))(v43 + 16);
  uint64_t v46 = a2;
  uint64_t v24 = v23(v21, a2);
  uint64_t v39 = v9;
  id v42 = sub_2416156BC(v24, (uint64_t)v50, v45, v51, v49);
  uint64_t v54 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v52, v13);
  unint64_t v25 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v26 = (v15 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = swift_allocObject();
  uint64_t v45 = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v27 + v25, v16, v13);
  unint64_t v28 = (void *)(v27 + v26);
  *unint64_t v28 = 0xD00000000000001DLL;
  v28[1] = 0x8000000241656800;
  sub_2411C1788();
  sub_2411C07A8();
  sub_2416178E0(&qword_26B012EB8, (void (*)(uint64_t))sub_2411C1788);
  sub_24162FCE8();
  swift_release();
  sub_2416178E0(&qword_26B012E38, (void (*)(uint64_t))sub_2411C3D50);
  uint64_t v29 = v40;
  uint64_t v30 = sub_24162FCB8();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v20, v29);
  v7[2] = v30;
  sub_24162EF48();
  uint64_t v31 = sub_24162EF98();
  os_log_type_t v32 = sub_2416322E8();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v54 = v34;
    *(_DWORD *)uint64_t v33 = 136446210;
    uint64_t v35 = sub_2416333E8();
    uint64_t v53 = sub_2411B6898(v35, v36, &v54);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v31, v32, "[%{public}s] Initialized", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v34, -1, -1);
    MEMORY[0x245621640](v33, -1, -1);
  }

  swift_release();
  uint64_t v37 = sub_24162BA08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v37 - 8) + 8))(v51, v37);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v46, v44);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v52, v13);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v48);
  return v7;
}

id sub_2416156BC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  id v218 = a5;
  uint64_t v191 = a4;
  uint64_t v217 = a2;
  sub_2411C85F4(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v184 = (char *)v179 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v200 = (char *)v179 - v9;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2411C092C(0, &qword_26B00F200, MEMORY[0x263F062D0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v194 = (char *)v179 - v12;
  sub_2411C092C(0, (unint64_t *)&qword_26B012220, MEMORY[0x263F45770], v10);
  MEMORY[0x270FA5388](v13 - 8);
  v193 = (char *)v179 - v14;
  uint64_t v190 = sub_241631AC8();
  uint64_t v199 = *(void *)(v190 - 8);
  MEMORY[0x270FA5388](v190);
  uint64_t v189 = (char *)v179 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = sub_24162B718();
  uint64_t v197 = *(void *)(v196 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v196);
  id v183 = (char *)v179 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v185 = (char *)v179 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  id v188 = (char *)v179 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v187 = (char *)v179 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v192 = (char *)v179 - v25;
  MEMORY[0x270FA5388](v24);
  BOOL v195 = (char *)v179 - v26;
  uint64_t v213 = type metadata accessor for SummaryTileUserData();
  MEMORY[0x270FA5388](v213);
  unint64_t v28 = (char *)v179 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411C092C(0, (unint64_t *)&unk_26B012F00, (uint64_t (*)(uint64_t))sub_2411C0990, MEMORY[0x263EFDDF8]);
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)v179 - v32;
  uint64_t v34 = sub_24162B7E8();
  MEMORY[0x270FA5388](v34 - 8);
  v209 = (char *)v179 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_241631CA8();
  uint64_t v211 = *(void *)(v36 - 8);
  uint64_t v212 = v36;
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  uint64_t v216 = (uint64_t)v179 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  uint64_t v210 = (char **)((char *)v179 - v39);
  uint64_t v40 = sub_24162BD98();
  uint64_t v206 = *(void *)(v40 - 8);
  uint64_t v207 = v40;
  MEMORY[0x270FA5388](v40);
  v208 = (char *)v179 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = sub_24162C018();
  uint64_t v214 = *(void *)(v205 - 8);
  uint64_t v42 = MEMORY[0x270FA5388](v205);
  uint64_t v204 = (char *)v179 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  uint64_t v203 = (char *)v179 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  uint64_t v198 = (char *)v179 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  id v50 = (char *)v179 - v49;
  uint64_t v51 = MEMORY[0x270FA5388](v48);
  v186 = (char *)v179 - v52;
  MEMORY[0x270FA5388](v51);
  uint64_t v54 = (char *)v179 - v53;
  uint64_t v55 = sub_24162EFA8();
  uint64_t v56 = MEMORY[0x270FA5388](v55);
  uint64_t v57 = MEMORY[0x270FA5388](v56);
  uint64_t v59 = (char *)v179 - v58;
  uint64_t v60 = MEMORY[0x270FA5388](v57);
  uint64_t v62 = (char *)v179 - v61;
  uint64_t v63 = MEMORY[0x270FA5388](v60);
  uint64_t v67 = (char *)v179 - v66;
  if ((a3 & 1) == 0)
  {
    v220 = (char *)MEMORY[0x263F8EE78];
    sub_2411C0990(0);
    sub_24162FB98();
    sub_2412DF320();
    uint64_t v70 = sub_24162FCB8();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
    return (id)v70;
  }
  v179[1] = v65;
  uint64_t v201 = v64;
  uint64_t v202 = v63;
  unint64_t v180 = v33;
  uint64_t v182 = v31;
  uint64_t v181 = v30;
  uint64_t v68 = v217;
  if (v217)
  {
    id v69 = v218;
    if (!v218) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v69 = v218;
  if (v218)
  {
LABEL_7:
    if (!((unint64_t)objc_msgSend(v69, sel_state) | v68))
    {
      sub_24162EF48();
      uint64_t v84 = sub_24162EF98();
      os_log_type_t v85 = sub_2416322E8();
      if (os_log_type_enabled(v84, v85))
      {
        id v86 = (uint8_t *)swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        v220 = (char *)v87;
        *(_DWORD *)id v86 = 136446210;
        uint64_t v88 = sub_2416333E8();
        uint64_t v219 = sub_2411B6898(v88, v89, (uint64_t *)&v220);
        sub_241632C28();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24118E000, v84, v85, "[%{public}s] Submitting no data feed item", v86, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245621640](v87, -1, -1);
        MEMORY[0x245621640](v86, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v201 + 8))(v62, v202);
      uint64_t v90 = v214;
      uint64_t v92 = v211;
      uint64_t v91 = v212;
      uint64_t v93 = v210;
      uint64_t v94 = v216;
      type metadata accessor for SummaryTileViewController();
      (*(void (**)(char *, void, uint64_t))(v206 + 104))(v208, *MEMORY[0x263F45538], v207);
      sub_24162BDD8();
      sub_24162BDF8();
      sub_241631C38();
      (*(void (**)(uint64_t, char **, uint64_t))(v92 + 16))(v94, v93, v91);
      if (qword_26B0131F0 != -1) {
        swift_once();
      }
      id v95 = (id)qword_26B0181A0;
      sub_24162B7D8();
      sub_241631D38();
      (*(void (**)(char **, uint64_t))(v92 + 8))(v93, v91);
      sub_24162BEA8();
      sub_24162BFB8();
      sub_24162BE98();
      id result = objc_msgSend(self, sel_categoryWithID_, 8);
      if (result)
      {
        uint64_t v97 = result;
        sub_24162BF88();

        uint64_t v98 = v198;
        uint64_t v99 = v205;
        (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v198, v50, v205);
        unint64_t v100 = sub_2411BB0F4(0, 1, 1, MEMORY[0x263F8EE78]);
        unint64_t v102 = *(void *)(v100 + 16);
        unint64_t v101 = *(void *)(v100 + 24);
        if (v102 >= v101 >> 1) {
          unint64_t v100 = sub_2411BB0F4(v101 > 1, v102 + 1, 1, v100);
        }
        *(void *)(v100 + 16) = v102 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v90 + 32))(v100+ ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80))+ *(void *)(v90 + 72) * v102, v98, v99);
        v220 = (char *)v100;
        sub_2411C0990(0);
        uint64_t v103 = v180;
        sub_24162FB98();
        sub_2412DF320();
        uint64_t v104 = v181;
        uint64_t v70 = sub_24162FCB8();
        (*(void (**)(char *, uint64_t))(v182 + 8))(v103, v104);
        (*(void (**)(char *, uint64_t))(v90 + 8))(v50, v99);
        return (id)v70;
      }
      __break(1u);
      goto LABEL_51;
    }
LABEL_8:
    sub_24162EF48();
    id v71 = (id)v68;
    id v72 = sub_24162EF98();
    os_log_type_t v73 = sub_2416322E8();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      uint64_t v198 = (char *)swift_slowAlloc();
      v220 = v198;
      *(_DWORD *)uint64_t v74 = 136446466;
      uint64_t v75 = sub_2416333E8();
      uint64_t v219 = sub_2411B6898(v75, v76, (uint64_t *)&v220);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v74 + 12) = 2080;
      v186 = (char *)(v74 + 14);
      uint64_t v219 = v68;
      sub_241617988();
      id v77 = v71;
      uint64_t v78 = sub_241631D78();
      uint64_t v219 = sub_2411B6898(v78, v79, (uint64_t *)&v220);
      sub_241632C28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v72, v73, "[%{public}s] Submitting data feed item with day summary: %s", (uint8_t *)v74, 0x16u);
      uint64_t v80 = v198;
      swift_arrayDestroy();
      MEMORY[0x245621640](v80, -1, -1);
      MEMORY[0x245621640](v74, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v201 + 8))(v59, v202);
    uint64_t v81 = v216;
    sub_2411B9D00(0, (unint64_t *)&qword_26B012378);
    id v82 = v71;
    id v83 = v69;
    sub_2416318B8();
    sub_2411B9D00(0, &qword_26B00ED70);
    sub_2416318B8();
    sub_24162AE28();
    swift_allocObject();
    sub_24162AE18();
    sub_2416178E0(&qword_26B010B00, (void (*)(uint64_t))type metadata accessor for SummaryTileUserData);
    uint64_t v105 = sub_24162AE08();
    unint64_t v107 = v106;
    swift_release();
    sub_241617928((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for SummaryTileUserData);
    type metadata accessor for SummaryTileViewController();
    (*(void (**)(char *, void, uint64_t))(v206 + 104))(v208, *MEMORY[0x263F45520], v207);
    sub_241251FD0(v105, v107);
    sub_24162BDD8();
    id v108 = v203;
    unint64_t v215 = v107;
    uint64_t v216 = v105;
    sub_24162BDF8();
    id v109 = v210;
    sub_241631C38();
    uint64_t v111 = v211;
    uint64_t v110 = v212;
    (*(void (**)(uint64_t, char **, uint64_t))(v211 + 16))(v81, v109, v212);
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    id v112 = (id)qword_26B0181A0;
    sub_24162B7D8();
    sub_241631D38();
    (*(void (**)(char **, uint64_t))(v111 + 8))(v109, v110);
    sub_24162BEA8();
    sub_24162BFB8();
    id result = objc_msgSend(self, sel_categoryWithID_, 8);
    uint64_t v113 = v214;
    if (result)
    {
      os_log_type_t v114 = result;
      sub_24162BF88();

      uint64_t v115 = (uint64_t)v200;
      uint64_t v116 = v199;
      if (v217)
      {
        id v117 = v82;
        uint64_t v118 = &selRef_mainScreen;
        objc_msgSend(v117, sel_dayIndex);
        unint64_t v119 = v189;
        sub_241631A78();
        uint64_t v120 = v195;
        sub_241631AB8();
        id v122 = *(void (**)(char *, uint64_t))(v116 + 8);
        uint64_t v54 = (char *)(v116 + 8);
        int64_t v121 = v122;
        uint64_t v123 = v190;
        v122(v119, v190);
        id v218 = v117;
        if (!__OFADD__(objc_msgSend(v117, sel_dayIndex), 1))
        {
          sub_241631A78();
          uint64_t v124 = v187;
          sub_241631AB8();
          v121(v119, v123);
          uint64_t v125 = v192;
          sub_24162B618();
          uint64_t v126 = v197;
          uint64_t v127 = *(void (**)(char *, uint64_t))(v197 + 8);
          uint64_t v128 = v196;
          v127(v124, v196);
          uint64_t v129 = *(void (**)(char *, char *, uint64_t))(v126 + 16);
          v129(v124, v120, v128);
          v129(v188, v125, v128);
          id v130 = v194;
          sub_24162AEB8();
          uint64_t v131 = sub_24162AEE8();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v131 - 8) + 56))(v130, 0, 1, v131);
          sub_24162C3A8();
          uint64_t v132 = v203;
          sub_24162BF48();

          v127(v125, v128);
          uint64_t v133 = v120;
          id v108 = v132;
          v127(v133, v128);
LABEL_44:
          uint64_t v172 = v205;
          (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v204, v108, v205);
          unint64_t v173 = sub_2411BB0F4(0, 1, 1, MEMORY[0x263F8EE78]);
          unint64_t v175 = *(void *)(v173 + 16);
          unint64_t v174 = *(void *)(v173 + 24);
          if (v175 >= v174 >> 1) {
            unint64_t v173 = sub_2411BB0F4(v174 > 1, v175 + 1, 1, v173);
          }
          uint64_t v176 = v181;
          uint64_t v177 = v182;
          uint64_t v178 = v180;
          *(void *)(v173 + 16) = v175 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v113 + 32))(v173+ ((*(unsigned __int8 *)(v113 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80))+ *(void *)(v113 + 72) * v175, v204, v172);
          v220 = (char *)v173;
          sub_2411C0990(0);
          sub_24162FB98();
          sub_2412DF320();
          uint64_t v70 = sub_24162FCB8();
          sub_2411EDEA8(v216, v215);
          (*(void (**)(char *, uint64_t))(v177 + 8))(v178, v176);
          (*(void (**)(char *, uint64_t))(v113 + 8))(v108, v172);
          return (id)v70;
        }
        __break(1u);
        goto LABEL_49;
      }
      if (!v218) {
        goto LABEL_44;
      }
      id v149 = v83;
      id v150 = objc_msgSend(v149, sel_pregnancyStartDate);
      if (v150)
      {
        uint64_t v151 = v150;
        id v152 = v195;
        sub_24162B6A8();

        uint64_t v153 = v197;
        uint64_t v154 = *(void (**)(uint64_t, char *, uint64_t))(v197 + 32);
        uint64_t v155 = v196;
        v154(v115, v152, v196);
        uint64_t v156 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v153 + 56);
        v156(v115, 0, 1, v155);
        uint64_t v157 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v153 + 48);
        if (v157(v115, 1, v155) != 1)
        {
          v154((uint64_t)v185, (char *)v115, v155);
          id v158 = objc_msgSend(v149, sel_behavioralWashoutEndDate);
          if (v158)
          {
            uint64_t v159 = v158;
            v160 = v195;
            sub_24162B6A8();

            char v161 = v160;
            uint64_t v162 = (uint64_t)v184;
            v154((uint64_t)v184, v161, v155);
            v156(v162, 0, 1, v155);
            int v163 = v157(v162, 1, v155);
            uint64_t v113 = v214;
            if (v163 != 1)
            {
              v154((uint64_t)v183, (char *)v162, v155);
              uint64_t v164 = v155;
              uint64_t v165 = v197;
              uint64_t v166 = *(void (**)(char *, char *, uint64_t))(v197 + 16);
              uint64_t v167 = v185;
              v166(v161, v185, v155);
              CGPoint v168 = v183;
              v166(v192, v183, v164);
              char v169 = v194;
              sub_24162AEB8();
              uint64_t v170 = sub_24162AEE8();
              (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v170 - 8) + 56))(v169, 0, 1, v170);
              sub_24162C3A8();
              id v108 = v203;
              sub_24162BF48();

              uint64_t v171 = *(void (**)(char *, uint64_t))(v165 + 8);
              v171(v168, v164);
              v171(v167, v164);
              goto LABEL_44;
            }
          }
          else
          {
            uint64_t v162 = (uint64_t)v184;
            v156((uint64_t)v184, 1, 1, v155);
            uint64_t v113 = v214;
          }

          (*(void (**)(char *, uint64_t))(v197 + 8))(v185, v155);
          sub_241617928(v162, (uint64_t (*)(void))sub_2411C85F4);
LABEL_43:
          id v108 = v203;
          goto LABEL_44;
        }
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v197 + 56))(v115, 1, 1, v196);
      }

      sub_241617928(v115, (uint64_t (*)(void))sub_2411C85F4);
      uint64_t v113 = v214;
      goto LABEL_43;
    }
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  sub_24162EF48();
  unint64_t v134 = sub_24162EF98();
  os_log_type_t v135 = sub_2416322E8();
  if (os_log_type_enabled(v134, v135))
  {
    uint64_t v136 = (uint8_t *)swift_slowAlloc();
    uint64_t v137 = swift_slowAlloc();
    v220 = (char *)v137;
    *(_DWORD *)uint64_t v136 = 136446210;
    uint64_t v138 = sub_2416333E8();
    uint64_t v219 = sub_2411B6898(v138, v139, (uint64_t *)&v220);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v134, v135, "[%{public}s] Submitting no data feed item", v136, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v137, -1, -1);
    MEMORY[0x245621640](v136, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v201 + 8))(v67, v202);
  uint64_t v123 = v182;
  uint64_t v113 = v214;
  uint64_t v115 = v211;
  uint64_t v120 = (char *)v212;
  type metadata accessor for SummaryTileViewController();
  (*(void (**)(char *, void, uint64_t))(v206 + 104))(v208, *MEMORY[0x263F45538], v207);
  sub_24162BDD8();
  sub_24162BDF8();
  uint64_t v118 = v210;
  sub_241631C38();
  (*(void (**)(uint64_t, char **, char *))(v115 + 16))(v216, v118, v120);
  if (qword_26B0131F0 != -1) {
LABEL_49:
  }
    swift_once();
  id v140 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(char **, char *))(v115 + 8))(v118, v120);
  sub_24162BEA8();
  sub_24162BFB8();
  sub_24162BE98();
  id result = objc_msgSend(self, sel_categoryWithID_, 8);
  if (result)
  {
    id v141 = result;
    sub_24162BF88();

    id v142 = v186;
    uint64_t v143 = v205;
    (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v186, v54, v205);
    unint64_t v144 = sub_2411BB0F4(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v146 = *(void *)(v144 + 16);
    unint64_t v145 = *(void *)(v144 + 24);
    if (v146 >= v145 >> 1) {
      unint64_t v144 = sub_2411BB0F4(v145 > 1, v146 + 1, 1, v144);
    }
    *(void *)(v144 + 16) = v146 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v113 + 32))(v144+ ((*(unsigned __int8 *)(v113 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80))+ *(void *)(v113 + 72) * v146, v142, v143);
    v220 = (char *)v144;
    sub_2411C0990(0);
    uint64_t v147 = v180;
    sub_24162FB98();
    sub_2412DF320();
    uint64_t v148 = v181;
    uint64_t v70 = sub_24162FCB8();
    (*(void (**)(char *, uint64_t))(v123 + 8))(v147, v148);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v54, v143);
    return (id)v70;
  }
LABEL_52:
  __break(1u);
  return result;
}

uint64_t sub_2416174AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  uint64_t v6 = sub_24162EF98();
  os_log_type_t v7 = sub_2416322E8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = v2;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v11 = sub_2416333E8();
    uint64_t v18 = sub_2411B6898(v11, v12, &v19);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v6, v7, "[%{public}s] Deallocated", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v10, -1, -1);
    MEMORY[0x245621640](v9, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_release();
  uint64_t v13 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20SummaryTileGenerator_domain;
  uint64_t v14 = sub_24162C128();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  return v1;
}

uint64_t sub_241617714()
{
  sub_2416174AC();

  return swift_deallocClassInstance();
}

uint64_t sub_24161776C()
{
  return type metadata accessor for SummaryTileGenerator();
}

uint64_t type metadata accessor for SummaryTileGenerator()
{
  uint64_t result = qword_26B012A58;
  if (!qword_26B012A58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2416177C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20SummaryTileGenerator_domain;
  uint64_t v4 = sub_24162C128();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_241617838()
{
  uint64_t v1 = sub_24162C1C8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2416178E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_241617928(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_241617988()
{
  if (!qword_26B012380)
  {
    sub_2411B9D00(255, (unint64_t *)&qword_26B012378);
    unint64_t v0 = sub_241632C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B012380);
    }
  }
}

uint64_t sub_2416179F0()
{
  if (*(void *)(v0 + 72))
  {
    uint64_t v1 = *(void *)(v0 + 72);
  }
  else
  {
    type metadata accessor for RelativeDaysAgoFormatter();
    uint64_t v1 = swift_allocObject();
    *(void *)(v1 + 16) = 0;
    *(void *)(v1 + 24) = 0;
    *(void *)(v0 + 72) = v1;
    swift_retain();
  }
  swift_retain();
  return v1;
}

void sub_241617A48()
{
  sub_241316C40(0, (unint64_t *)&qword_268D012A0, MEMORY[0x263F43E48]);
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = *(void **)(v0 + 64);
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_msgSend(v11, sel_statistics);
    id v13 = objc_msgSend(v12, sel_numberOfCycles);

    id v14 = objc_msgSend(v11, sel_cycles);
    if (v14)
    {
      uint64_t v15 = v14;
      sub_2411B9D00(0, (unint64_t *)&qword_26B00E610);
      unint64_t v16 = sub_241631F28();

      if (v16 >> 62)
      {
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        uint64_t v17 = sub_241633068();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      BOOL v18 = v17 != 0;
    }
    else
    {
      BOOL v18 = 0;
    }
    if ((uint64_t)v13 > 0) {
      BOOL v18 = 1;
    }
    if ((*(unsigned char *)(v0 + 80) & v18) != 0) {
      uint64_t v19 = (unsigned int *)MEMORY[0x263F43E40];
    }
    else {
      uint64_t v19 = (unsigned int *)MEMORY[0x263F43E38];
    }
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v9, *v19, v2);
    sub_24162D038();
  }
  else
  {
    (*(void (**)(char *, void, uint64_t, __n128))(v3 + 104))(v5, *MEMORY[0x263F43E38], v2, v7);
    sub_24162D038();
  }
}

uint64_t sub_241617C98(char *a1, char *a2)
{
  return sub_24149579C(*a1, *a2);
}

uint64_t sub_241617CA4()
{
  return sub_241633358();
}

uint64_t sub_241617D2C()
{
  sub_241631DC8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_241617DA0()
{
  return sub_241633358();
}

uint64_t sub_241617E24@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_241633108();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_241617E84(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x746E6F7A69726F68;
  if (*v1) {
    uint64_t v2 = 0x6C61636974726576;
  }
  unint64_t v3 = 0xEA00000000006C61;
  if (*v1) {
    unint64_t v3 = 0xE800000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_241617EC8()
{
  uint64_t v0 = sub_24162B7E8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_241631CA8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  __n128 v7 = &v11[-v6];
  sub_241631C38();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 16))(v4, v7, v1);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v9 = sub_241631D38();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

uint64_t sub_2416180F8()
{
  uint64_t v0 = sub_24162B7E8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_241631CA8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  __n128 v7 = &v11[-v6];
  sub_241631C38();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 16))(v4, v7, v1);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v9 = sub_241631D38();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

uint64_t sub_241618328()
{
  return swift_release();
}

uint64_t sub_241618368()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CycleStatisticsDataSource()
{
  return self;
}

void *sub_2416183EC(uint64_t a1, uint64_t a2)
{
  return sub_24161AD1C(a2);
}

uint64_t sub_241618414()
{
  return sub_24162E588();
}

uint64_t sub_241618470@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24162F338();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24162B7E8();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_241631CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  __n128 v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v15[-v9];
  sub_241631C38();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v7, v10, v4);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  if (qword_26B00F370 != -1) {
    swift_once();
  }
  *(_OWORD *)&v15[8] = xmmword_26B017FC8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  sub_24162F2C8();
  uint64_t v12 = sub_24162CAE8();
  swift_allocObject();
  uint64_t v13 = sub_24162CAC8();
  a1[3] = v12;
  uint64_t result = sub_24161B0BC(&qword_268CFD2C0, 255, MEMORY[0x263F43AA8]);
  a1[4] = result;
  *a1 = v13;
  return result;
}

uint64_t sub_2416187A0@<X0>(uint64_t *a1@<X8>)
{
  return sub_241618470(a1);
}

uint64_t sub_2416187BC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_statistics);
  id v3 = objc_msgSend(a1, sel_cycles);
  if (!v3) {
    goto LABEL_18;
  }
  uint64_t v4 = v3;
  sub_2411B9D00(0, (unint64_t *)&qword_26B00E610);
  unint64_t v5 = sub_241631F28();

  if (v5 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v36 = sub_241633068();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
LABEL_4:
  id v6 = v2;
  uint64_t v49 = v2;
  __n128 v7 = (void *)sub_241619610(0, v2, v5);
  id v47 = v6;

  swift_bridgeObjectRelease();
  uint64_t v8 = v7[9];
  uint64_t v44 = v7[8];
  uint64_t v9 = v7[10];
  uint64_t v10 = v7[11];
  uint64_t v11 = v7[12];
  uint64_t v12 = v7[13];
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v13 = sub_24158D1B4(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v15 = v13[2];
  unint64_t v14 = v13[3];
  if (v15 >= v14 >> 1) {
    uint64_t v13 = sub_24158D1B4((void *)(v14 > 1), v15 + 1, 1, v13);
  }
  v13[2] = v15 + 1;
  unint64_t v16 = &v13[6 * v15];
  v16[4] = v44;
  v16[5] = v8;
  v16[6] = v9;
  v16[7] = v10;
  v16[8] = v11;
  v16[9] = v12;
  uint64_t v17 = v47;
  id v18 = objc_msgSend(v47, sel_menstruationLengthMedian);

  if (v18)
  {
    id v19 = v47;
    uint64_t v20 = (void *)sub_241619610(1, v49, 0);

    uint64_t v21 = v20[9];
    uint64_t v22 = v20[11];
    uint64_t v42 = v20[10];
    uint64_t v45 = v20[8];
    uint64_t v23 = v20[13];
    uint64_t v41 = v20[12];
    unint64_t v25 = v13[2];
    unint64_t v24 = v13[3];
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    if (v25 >= v24 >> 1) {
      uint64_t v13 = sub_24158D1B4((void *)(v24 > 1), v25 + 1, 1, v13);
    }
    v13[2] = v25 + 1;
    uint64_t v26 = &v13[6 * v25];
    v26[4] = v45;
    v26[5] = v21;
    v26[6] = v42;
    v26[7] = v22;
    v26[8] = v41;
    v26[9] = v23;
    swift_release();
    uint64_t v17 = v47;
    id v2 = v49;
  }
  else
  {
    id v2 = v49;
  }
  id v27 = objc_msgSend(v17, sel_cycleLengthMedian);

  if (v27)
  {
    id v28 = v17;
    uint64_t v29 = (void *)sub_241619610(2, v2, 0);

    uint64_t v30 = v29[9];
    uint64_t v31 = v29[11];
    uint64_t v46 = v29[10];
    id v48 = (id)v29[8];
    uint64_t v32 = v29[13];
    uint64_t v43 = v29[12];
    unint64_t v34 = v13[2];
    unint64_t v33 = v13[3];
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    if (v34 >= v33 >> 1) {
      uint64_t v13 = sub_24158D1B4((void *)(v33 > 1), v34 + 1, 1, v13);
    }
    v13[2] = v34 + 1;
    uint64_t v35 = &v13[6 * v34];
    v35[4] = v48;
    v35[5] = v30;
    v35[6] = v46;
    v35[7] = v31;
    v35[8] = v43;
    v35[9] = v32;
    swift_release();
    swift_release();
    id v2 = v49;
  }
  else
  {
    swift_release();
  }
LABEL_19:
  uint64_t v37 = type metadata accessor for CycleStatisticsSummaryItem();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 32) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v38 + 16) = v13;
  *(void *)(v38 + 32) = &off_26F579610;
  swift_unknownObjectWeakAssign();
  sub_24162CFE8();
  sub_24161B104(0, (unint64_t *)&qword_268CFC790, (unint64_t *)&qword_268CFF090);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_241637EE0;
  *(void *)(v39 + 56) = v37;
  *(void *)(v39 + 64) = sub_24161B0BC(&qword_268D03048, 255, (void (*)(uint64_t))type metadata accessor for CycleStatisticsSummaryItem);
  *(void *)(v39 + 32) = v38;
  swift_retain();
  sub_24162D758();
  swift_release();
  swift_bridgeObjectRelease();
  sub_241617A48();

  return swift_release();
}

void sub_241618C64(void *a1)
{
  sub_24161B104(0, (unint64_t *)&qword_268CFC790, (unint64_t *)&qword_268CFF090);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_241637EE0;
  id v3 = sub_2416192D8();
  *(void *)(v2 + 56) = type metadata accessor for TileHeaderItem();
  *(void *)(v2 + 64) = sub_24161B0BC(&qword_268CFD2D0, 255, (void (*)(uint64_t))type metadata accessor for TileHeaderItem);
  *(void *)(v2 + 32) = v3;
  id v4 = objc_msgSend(a1, sel_statistics);
  id v5 = objc_msgSend(a1, sel_cycles);
  if (!v5) {
    goto LABEL_17;
  }
  id v6 = v5;
  sub_2411B9D00(0, (unint64_t *)&qword_26B00E610);
  unint64_t v7 = sub_241631F28();

  if (v7 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v23 = sub_241633068();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_4;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_16;
  }
LABEL_4:
  id v8 = v4;
  uint64_t v9 = sub_241619610(0, v4, v7);

  swift_bridgeObjectRelease();
  *(void *)(v9 + 24) = &off_26F579610;
  swift_unknownObjectWeakAssign();
  *(void *)(v9 + 40) = &off_26F579600;
  swift_unknownObjectWeakAssign();
  unint64_t v11 = *(void *)(v2 + 16);
  unint64_t v10 = *(void *)(v2 + 24);
  swift_retain();
  if (v11 >= v10 >> 1) {
    uint64_t v2 = (uint64_t)sub_24158C34C((void *)(v10 > 1), v11 + 1, 1, (void *)v2);
  }
  uint64_t v24 = type metadata accessor for CycleStatisticsItem();
  uint64_t v27 = v24;
  uint64_t v12 = sub_24161B0BC((unint64_t *)&qword_268D01A40, 255, (void (*)(uint64_t))type metadata accessor for CycleStatisticsItem);
  uint64_t v28 = v12;
  *(void *)&long long v26 = v9;
  *(void *)(v2 + 16) = v11 + 1;
  sub_2411B6CD4(&v26, v2 + 40 * v11 + 32);
  id v13 = objc_msgSend(v8, sel_menstruationLengthMedian);

  if (v13)
  {
    id v14 = v8;
    uint64_t v15 = sub_241619610(1, v4, 0);

    *(void *)(v15 + 24) = &off_26F579610;
    swift_unknownObjectWeakAssign();
    *(void *)(v15 + 40) = &off_26F579600;
    swift_unknownObjectWeakAssign();
    unint64_t v17 = *(void *)(v2 + 16);
    unint64_t v16 = *(void *)(v2 + 24);
    swift_retain();
    if (v17 >= v16 >> 1) {
      uint64_t v2 = (uint64_t)sub_24158C34C((void *)(v16 > 1), v17 + 1, 1, (void *)v2);
    }
    uint64_t v27 = v24;
    uint64_t v28 = v12;
    *(void *)&long long v26 = v15;
    *(void *)(v2 + 16) = v17 + 1;
    sub_2411B6CD4(&v26, v2 + 40 * v17 + 32);
    swift_release();
  }
  id v18 = objc_msgSend(v8, sel_cycleLengthMedian, v24);

  if (v18)
  {
    id v19 = v8;
    uint64_t v20 = sub_241619610(2, v4, 0);

    *(void *)(v20 + 24) = &off_26F579610;
    swift_unknownObjectWeakAssign();
    *(void *)(v20 + 40) = &off_26F579600;
    swift_unknownObjectWeakAssign();
    unint64_t v22 = *(void *)(v2 + 16);
    unint64_t v21 = *(void *)(v2 + 24);
    swift_retain();
    if (v22 >= v21 >> 1) {
      uint64_t v2 = (uint64_t)sub_24158C34C((void *)(v21 > 1), v22 + 1, 1, (void *)v2);
    }
    uint64_t v27 = v25;
    uint64_t v28 = v12;
    *(void *)&long long v26 = v20;
    *(void *)(v2 + 16) = v22 + 1;
    sub_2411B6CD4(&v26, v2 + 40 * v22 + 32);
    swift_release();
  }
  swift_release();
LABEL_17:
  sub_24162CFE8();
  sub_24162D758();
  swift_release();
  swift_bridgeObjectRelease();
  sub_241617A48();
}

unsigned char *storeEnumTagSinglePayload for CycleStatisticsDataSource.SectionStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x241619248);
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

ValueMetadata *type metadata accessor for CycleStatisticsDataSource.SectionStyle()
{
  return &type metadata for CycleStatisticsDataSource.SectionStyle;
}

unint64_t sub_241619284()
{
  unint64_t result = qword_268D046A0;
  if (!qword_268D046A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D046A0);
  }
  return result;
}

void *sub_2416192D8()
{
  uint64_t v0 = sub_24162B7E8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_241631CA8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned int v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)v16 - v6;
  sub_241631C38();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_26B0181A0;
  sub_24162B7D8();
  uint64_t v9 = sub_241631D38();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  id v12 = objc_msgSend(self, sel_systemIndigoColor);
  if (qword_26B00F370 != -1) {
    swift_once();
  }
  v16[0] = xmmword_26B017FC8;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241631E08();
  long long v13 = v16[0];
  type metadata accessor for TileHeaderItem();
  id v14 = (void *)swift_allocObject();
  v14[5] = 0;
  v14[3] = 0;
  v14[2] = 0;
  swift_unknownObjectWeakInit();
  v14[7] = 0;
  swift_unknownObjectWeakInit();
  v14[9] = 0;
  swift_unknownObjectWeakInit();
  v14[10] = v9;
  v14[11] = v11;
  v14[12] = v12;
  swift_beginAccess();
  *((_OWORD *)v14 + 1) = v13;
  swift_bridgeObjectRelease();
  v14[5] = &off_26F579610;
  swift_unknownObjectWeakAssign();
  v14[7] = &off_26F579600;
  swift_unknownObjectWeakAssign();
  return v14;
}

uint64_t sub_241619610(int a1, void *a2, unint64_t a3)
{
  unint64_t v86 = a3;
  uint64_t v5 = sub_241631CA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v83 - v10;
  uint64_t v12 = sub_24162B718();
  uint64_t v87 = *(void *)(v12 - 8);
  uint64_t v88 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v94 = (char *)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24162BA08();
  uint64_t v89 = *(void *)(v14 - 8);
  uint64_t v90 = v14;
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_241631AC8();
  uint64_t v95 = *(void *)(v17 - 8);
  uint64_t v96 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v91 = (char *)&v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v93 = (char *)&v83 - v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v92 = (char *)&v83 - v22;
  uint64_t v23 = sub_24162B7E8();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  long long v26 = (char *)&v83 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    uint64_t v32 = sub_241617EC8();
    uint64_t v34 = v33;
    sub_241631C38();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    uint64_t v35 = v5;
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    id v36 = (id)qword_26B0181A0;
    sub_24162B7D8();
    uint64_t v37 = sub_241631D38();
    uint64_t v39 = v38;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v35);
    type metadata accessor for CycleStatisticsItem();
    uint64_t v40 = (void *)swift_allocObject();
    v40[3] = 0;
    swift_unknownObjectWeakInit();
    v40[5] = 0;
    swift_unknownObjectWeakInit();
    v40[7] = 0;
    swift_unknownObjectWeakInit();
    v40[8] = v32;
    v40[9] = v34;
    v40[10] = v37;
    v40[11] = v39;
    v40[12] = 0;
    v40[13] = 0;
    return (uint64_t)v40;
  }
  uint64_t v84 = v5;
  id v27 = objc_allocWithZone(MEMORY[0x263F08790]);
  id v99 = a2;
  id v28 = objc_msgSend(v27, sel_init);
  sub_24162B7D8();
  uint64_t v29 = (void *)sub_24162B7A8();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  objc_msgSend(v28, sel_setLocale_, v29);

  uint64_t v30 = (void *)sub_241631CC8();
  objc_msgSend(v28, sel_setLocalizedDateFormatFromTemplate_, v30);

  id v97 = v28;
  if ((_BYTE)a1)
  {
    if (a1 == 1) {
      id v31 = objc_msgSend(v99, sel_menstruationLengthMedian);
    }
    else {
      id v31 = objc_msgSend(v99, sel_cycleLengthMedian);
    }
    id v64 = v31;
    if (!v64)
    {
      uint64_t v65 = 0;
      uint64_t v53 = 0;
      uint64_t v55 = 0;
      goto LABEL_20;
    }
    int v85 = a1;
    sub_241631C38();
    uint64_t v66 = v84;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v84);
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    id v67 = (id)qword_26B0181A0;
    sub_24162B7D8();
    sub_241631D38();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v66);
    sub_24161B104(0, (unint64_t *)&qword_26B012400, (unint64_t *)&qword_26B012420);
    uint64_t v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_241637EE0;
    id v69 = objc_msgSend(v64, sel_integerValue);
    uint64_t v70 = MEMORY[0x263F8D750];
    *(void *)(v68 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v68 + 64) = v70;
    *(void *)(v68 + 32) = v69;
    uint64_t v53 = sub_241631CD8();
    uint64_t v55 = v71;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_18:
    uint64_t v65 = 0;
    id v64 = 0;
LABEL_20:
    uint64_t v72 = sub_241617EC8();
    uint64_t v74 = v73;

    type metadata accessor for CycleStatisticsItem();
    uint64_t v40 = (void *)swift_allocObject();
    v40[3] = 0;
    swift_unknownObjectWeakInit();
    v40[5] = 0;
    swift_unknownObjectWeakInit();
    v40[7] = 0;
    swift_unknownObjectWeakInit();
    v40[8] = v72;
    v40[9] = v74;
    v40[10] = v53;
    v40[11] = v55;
    v40[12] = v65;
    v40[13] = v64;
    return (uint64_t)v40;
  }
  int v85 = a1;
  id v41 = objc_msgSend(v99, sel_lastMenstruationStartDayIndex);
  if (v41)
  {
    id v42 = v41;
    objc_msgSend(v41, sel_integerValue);
    goto LABEL_10;
  }
  unint64_t v76 = v86;
  if (!v86)
  {
LABEL_31:
    sub_241631C38();
    uint64_t v80 = v84;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v84);
    if (qword_26B0131F0 != -1) {
      swift_once();
    }
    id v81 = (id)qword_26B0181A0;
    sub_24162B7D8();
    uint64_t v53 = sub_241631D38();
    uint64_t v55 = v82;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v80);
    goto LABEL_18;
  }
  if (!(v86 >> 62))
  {
    uint64_t v77 = *(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    if (v77) {
      goto LABEL_25;
    }
    goto LABEL_30;
  }
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t result = sub_241633068();
  if (!result)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
LABEL_25:
  if ((v76 & 0xC000000000000001) != 0)
  {
    id v78 = (id)MEMORY[0x245620370](0, v76);
    goto LABEL_28;
  }
  if (*(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v78 = *(id *)(v76 + 32);
LABEL_28:
    unint64_t v79 = v78;
    swift_bridgeObjectRelease();
    id v42 = objc_msgSend(v79, sel_menstruationSegment);

    objc_msgSend(v42, sel_days);
LABEL_10:

    uint64_t v43 = v92;
    sub_241631A78();
    sub_2416180F8();
    sub_24161B104(0, (unint64_t *)&qword_26B012400, (unint64_t *)&qword_26B012420);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_241637EE0;
    uint64_t v45 = *(void **)(v98 + 56);
    id v46 = objc_msgSend(v45, sel_currentCalendar);
    sub_24162B928();

    id v47 = v94;
    sub_241631AB8();
    id v48 = (void *)sub_24162B668();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v47, v88);
    id v49 = objc_msgSend(v28, sel_stringFromDate_, v48);

    uint64_t v50 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    uint64_t v52 = v51;

    (*(void (**)(char *, uint64_t))(v89 + 8))(v16, v90);
    *(void *)(v44 + 56) = MEMORY[0x263F8D310];
    *(void *)(v44 + 64) = sub_2411C0A14();
    *(void *)(v44 + 32) = v50;
    *(void *)(v44 + 40) = v52;
    uint64_t v53 = sub_241631D28();
    uint64_t v55 = v54;
    swift_bridgeObjectRelease();
    id v56 = objc_msgSend(v45, sel_currentCalendar);
    sub_24162B928();

    sub_24162B708();
    uint64_t v57 = v91;
    sub_241631A68();
    uint64_t v58 = v93;
    sub_241631A38();
    uint64_t v59 = v96;
    uint64_t v60 = *(void (**)(char *, uint64_t))(v95 + 8);
    v60(v57, v96);
    sub_2416179F0();
    uint64_t v61 = sub_241631A88();
    uint64_t v62 = sub_2412E95CC(v61);
    id v64 = v63;
    swift_release();
    v60(v58, v59);
    v60(v43, v59);
    if (v64) {
      uint64_t v65 = v62;
    }
    else {
      uint64_t v65 = 0;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

void sub_24161A128(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24162EFA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  id v9 = a2;
  uint64_t v10 = sub_24162EF98();
  os_log_type_t v11 = sub_2416322E8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v22 = v5;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = v3;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t ObjectType = swift_getObjectType();
    sub_24144FD04();
    uint64_t v15 = sub_241631D48();
    uint64_t ObjectType = sub_2411B6898(v15, v16, &v25);
    sub_241632C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v10, v11, "[%{public}s] Showing the Statistics View Controller", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v14, -1, -1);
    uint64_t v17 = v13;
    uint64_t v3 = v23;
    MEMORY[0x245621640](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v18 = *(void **)(v3 + 48);
  uint64_t v19 = *(void **)(v3 + 56);
  id v20 = objc_allocWithZone((Class)type metadata accessor for StatisticsViewAllTableViewController());
  id v21 = sub_24140C3BC(v18, v19);
  objc_msgSend(v9, sel_showViewController_sender_, v21, v3);
}

uint64_t sub_24161A3A4(int a1)
{
  int v13 = a1;
  uint64_t v14 = sub_24162BB18();
  uint64_t v1 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241316C40(0, (unint64_t *)&unk_268D04510, MEMORY[0x263F43E58]);
  sub_2412FA5E8();
  uint64_t result = sub_24162D0D8();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = result;
    if (result)
    {
      uint64_t v6 = 0;
      uint64_t v7 = (void (**)(char *, uint64_t))(v1 + 8);
      do
      {
        MEMORY[0x245618F80](v6, 0);
        sub_24162D168();
        (*v7)(v3, v14);
        sub_2411A3DF4((uint64_t)v17, (uint64_t)v16);
        sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
        type metadata accessor for CycleStatisticsItem();
        if (swift_dynamicCast())
        {
          uint64_t v8 = v15;
          if (MEMORY[0x245621790](v15 + 48))
          {
            uint64_t v9 = *(void *)(v8 + 56);
LABEL_12:
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(void, unsigned char *, uint64_t, uint64_t))(v9 + 8))(v13 & 1, v17, ObjectType, v9);
            swift_release();
            swift_unknownObjectRelease();
LABEL_13:
            uint64_t result = _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v17);
            goto LABEL_5;
          }
        }
        else
        {
          sub_2411A3DF4((uint64_t)v17, (uint64_t)v16);
          type metadata accessor for TileHeaderItem();
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_13;
          }
          uint64_t v10 = v15;
          if (MEMORY[0x245621790](v15 + 64))
          {
            uint64_t v9 = *(void *)(v10 + 72);
            goto LABEL_12;
          }
        }
        _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v17);
        uint64_t result = swift_release();
LABEL_5:
        ++v6;
      }
      while (v5 != v6);
    }
  }
  return result;
}

void sub_24161A630(uint64_t a1, char a2)
{
}

uint64_t sub_24161A658(uint64_t a1, uint64_t a2)
{
  return sub_24161B0BC(&qword_268D046A8, a2, (void (*)(uint64_t))type metadata accessor for CycleStatisticsDataSource);
}

void *sub_24161A6A0(void *a1, char a2, void *a3, char a4)
{
  uint64_t v5 = v4;
  *(void *)(v5 + 64) = 0;
  *(void *)(v5 + 72) = 0;
  *(unsigned char *)(v5 + 80) = a2;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 56) = a3;
  *(unsigned char *)(v5 + 40) = a4 & 1;
  sub_2413E5D78();
  sub_24162D678();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_241637EE0;
  id v9 = a1;
  id v10 = a3;
  sub_241632E78();
  swift_bridgeObjectRelease();
  sub_241631E08();
  swift_bridgeObjectRelease();
  sub_24162D668();

  return sub_241341D68(v8, 1);
}

void sub_24161A840(void *a1)
{
  type metadata accessor for CycleStatisticsCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = (void *)sub_241631CC8();
  objc_msgSend(a1, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v3);

  type metadata accessor for TileHeaderCell();
  uint64_t v4 = swift_getObjCClassFromMetadata();
  type metadata accessor for TileHeaderItem();
  sub_24122C268();
  uint64_t v5 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_registerClass_forCellWithReuseIdentifier_, v4, v5);

  type metadata accessor for CycleStatisticsHorizontalCell();
  uint64_t v6 = swift_getObjCClassFromMetadata();
  sub_24161B0BC(&qword_268D03040, 255, (void (*)(uint64_t))type metadata accessor for CycleStatisticsHorizontalCell);
  sub_24162CD08();
  id v7 = (id)sub_241631CC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_registerClass_forCellWithReuseIdentifier_, v6, v7);
}

void sub_24161A9A4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24162EFA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2416314D8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  *os_log_type_t v11 = sub_2416325A8();
  (*(void (**)(uint64_t *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F0E0], v8);
  char v12 = sub_241631508();
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    sub_24162EF48();
    int v13 = sub_24162EF98();
    os_log_type_t v14 = sub_2416322E8();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v25 = v16;
      *(_DWORD *)uint64_t v15 = 136446466;
      uint64_t v23 = v4;
      uint64_t v17 = sub_2416333E8();
      uint64_t v24 = sub_2411B6898(v17, v18, &v25);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      char v19 = a1 & 1;
      LOBYTE(v24) = a1 & 1;
      uint64_t v20 = sub_241631D78();
      uint64_t v24 = sub_2411B6898(v20, v21, &v25);
      sub_241632C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v13, v14, "[%{public}s] Received availability update to: %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245621640](v16, -1, -1);
      MEMORY[0x245621640](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v23);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      char v19 = a1 & 1;
    }
    *(unsigned char *)(v2 + 80) = v19;
    sub_241617A48();
  }
  else
  {
    __break(1u);
  }
}

void *sub_24161AD1C(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_24162F548();
  uint64_t v20 = *(void *)(v1 - 8);
  uint64_t v21 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24162F4A8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_24162F538();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24162F5A8();
  uint64_t v9 = *(void *)(v23 - 8);
  __n128 v10 = MEMORY[0x270FA5388](v23);
  char v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *MEMORY[0x263F81FC8];
  os_log_type_t v14 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 104);
  v14(v8, v13, v5, v10);
  sub_24162F558();
  id v15 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  sub_24162F578();
  ((void (*)(char *, uint64_t, uint64_t))v14)(v8, v13, v5);
  sub_24162F488();
  sub_24162F528();
  sub_24162F598();
  if (*(unsigned char *)(v22 + 40))
  {
    char v16 = sub_241633218();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v3, *MEMORY[0x263F82000], v21);
  sub_24162F568();
LABEL_6:
  sub_2411B9D00(0, &qword_268CFC750);
  uint64_t v17 = (void *)sub_2416327F8();
  objc_msgSend(v17, sel_setContentInsetsReference_, 3);
  objc_msgSend(v17, sel_setContentInsets_, 0.0, 0.0, 20.0, 0.0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v23);
  return v17;
}

uint64_t sub_24161B0BC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_24161B104(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_2411BF880(255, a3);
    unint64_t v4 = sub_2416331E8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24161B15C(uint64_t a1)
{
  uint64_t v2 = sub_24162B7E8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_241631CA8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v13[-v8];
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      sub_241631C38();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v7, v9, v3);
      if (qword_26B0131F0 != -1) {
        swift_once();
      }
      id v11 = (id)qword_26B0181A0;
      sub_24162B7D8();
      uint64_t v10 = sub_241631D38();
      (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
      break;
    default:
      uint64_t v10 = 0;
      break;
  }
  return v10;
}

uint64_t sub_24161B3DC(uint64_t a1)
{
  uint64_t v2 = sub_24162B7E8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_241631CA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v13[-v8];
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      sub_241631C38();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v6, v9, v3);
      if (qword_26B0131F0 != -1) {
        swift_once();
      }
      id v11 = (id)qword_26B0181A0;
      sub_24162B7D8();
      uint64_t v10 = sub_241631D38();
      (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
      break;
    default:
      uint64_t v10 = 0;
      break;
  }
  return v10;
}

uint64_t sub_24161B65C(uint64_t a1)
{
  uint64_t v2 = sub_24162B7E8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_241631CA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v13[-v8];
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      sub_241631C38();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v6, v9, v3);
      if (qword_26B0131F0 != -1) {
        swift_once();
      }
      id v11 = (id)qword_26B0181A0;
      sub_24162B7D8();
      uint64_t v10 = sub_241631D38();
      (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
      break;
    default:
      uint64_t v10 = 0;
      break;
  }
  return v10;
}

void sub_24161B8DC()
{
  qword_268D24500 = (uint64_t)&unk_26F565FE0;
}

uint64_t *sub_24161B8F0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    id v11 = (char *)a2 + v9;
    uint64_t v12 = sub_24162F338();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    v13(v10, v11, v12);
    uint64_t v14 = a3[7];
    id v15 = (char *)v4 + v14;
    char v16 = (char *)a2 + v14;
    uint64_t v17 = sub_241632B78();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = a3[8];
    uint64_t v19 = *(void **)((char *)a2 + v18);
    *(uint64_t *)((char *)v4 + v18) = (uint64_t)v19;
    id v20 = v19;
  }
  return v4;
}

void sub_24161BA50(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_24162F338();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = sub_241632B78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = *(void **)(a1 + a2[8]);
}

void *sub_24161BB24(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24162F338();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v12(v9, v10, v11);
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  id v15 = (char *)a2 + v13;
  uint64_t v16 = sub_241632B78();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = a3[8];
  uint64_t v18 = *(void **)((char *)a2 + v17);
  *(void *)((char *)a1 + v17) = v18;
  id v19 = v18;
  return a1;
}

void *sub_24161BC34(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24162F338();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_241632B78();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[8];
  id v15 = *(void **)((char *)a2 + v14);
  uint64_t v16 = *(void **)((char *)a1 + v14);
  *(void *)((char *)a1 + v14) = v15;
  id v17 = v15;

  return a1;
}

_OWORD *sub_24161BD58(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24162F338();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_241632B78();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void *sub_24161BE38(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24162F338();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_241632B78();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[8];
  id v17 = *(void **)((char *)a1 + v16);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);

  return a1;
}

uint64_t sub_24161BF38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24161BF4C);
}

uint64_t sub_24161BF4C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24162F338();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_241632B78();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_24161C078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24161C08C);
}

uint64_t sub_24161C08C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_24162F338();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_241632B78();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for HeaderWithActionButtonItem()
{
  uint64_t result = qword_268D046B0;
  if (!qword_268D046B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24161C204()
{
  uint64_t result = sub_24162F338();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_241632B78();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24161C2F0()
{
  return sub_24162CD08();
}

uint64_t sub_24161C328(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_24161C360())()
{
  return nullsub_1;
}

uint64_t sub_24161C380(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_241633218() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = a1[3];
  uint64_t v6 = a2[3];
  if (v5)
  {
    if (!v6) {
      return 0;
    }
    BOOL v7 = a1[2] == a2[2] && v5 == v6;
    if (!v7 && (sub_241633218() & 1) == 0) {
      return 0;
    }
  }
  else if (v6)
  {
    return 0;
  }
  uint64_t v8 = type metadata accessor for HeaderWithActionButtonItem();
  if ((MEMORY[0x24561C780]((char *)a1 + *(int *)(v8 + 24), (char *)a2 + *(int *)(v8 + 24)) & 1) != 0
    && (sub_241632B08() & 1) != 0)
  {
    sub_2411D2B70();
    return sub_2416329B8() & 1;
  }
  return 0;
}

unint64_t sub_24161C468()
{
  unint64_t result = qword_268D03900;
  if (!qword_268D03900)
  {
    type metadata accessor for HeaderWithActionButtonCollectionViewCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D03900);
  }
  return result;
}

id sub_24161C4C0()
{
  uint64_t v0 = sub_24162B9E8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411C85F4(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - v9;
  (*(void (**)(char *, void, uint64_t, __n128))(v1 + 104))(v3, *MEMORY[0x263F078A0], v0, v8);
  sub_24162B968();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2411ED2F0((uint64_t)v10, (uint64_t)v6);
  uint64_t v11 = sub_24162B718();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    uint64_t v13 = (void *)sub_24162B668();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  id v14 = objc_msgSend(self, sel_predicateForSamplesWithStartDate_endDate_options_, v13, 0, 2);

  sub_2411E7908((uint64_t)v10);
  return v14;
}

uint64_t sub_24161C708(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v25 = a1;
  unint64_t v26 = a4;
  uint64_t v5 = sub_24162B9E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  __n128 v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241621DDC(0, &qword_26B0130C0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v12 = sub_24162B718();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v17 = MEMORY[0x270FA5388](v16);
  id v19 = (char *)&v24 - v18;
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v8, *MEMORY[0x263F078A0], v5, v17);
  sub_24162B968();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a3, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v19, v15, v12);
    uint64_t v20 = sub_2411E7908((uint64_t)v11);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v19, v11, v12);
  }
  MEMORY[0x270FA5388](v20);
  unint64_t v21 = v26;
  *(&v24 - 2) = v25;
  *(&v24 - 1) = (uint64_t)v19;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v22 = sub_2414951C4((uint64_t (*)(id *))sub_2416219A0, (uint64_t)(&v24 - 4), v21);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v12);
  return v22;
}

char *sub_24161CA58(void *a1, void *a2, void *a3, void *a4)
{
  id v140 = a3;
  id v155 = a2;
  uint64_t v120 = *(void *)v4;
  sub_241621DDC(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v119 = (char *)&v119 - v8;
  sub_24121530C();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v123 = (uint64_t)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v122 = (uint64_t)&v119 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v142 = (uint64_t)&v119 - v14;
  sub_241621AC8(0, (unint64_t *)&qword_26B0121D0, MEMORY[0x263F8D870]);
  uint64_t v144 = v15;
  uint64_t v143 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v121 = (uint64_t)&v119 - v16;
  uint64_t v17 = sub_241631AC8();
  uint64_t v153 = *(void *)(v17 - 8);
  uint64_t v154 = v17;
  MEMORY[0x270FA5388](v17);
  id v141 = (char *)&v119 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  id v158 = (char *)&v119 - v20;
  uint64_t v136 = sub_24162D328();
  uint64_t v135 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  uint64_t v137 = (char *)&v119 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_24162B7F8();
  uint64_t v131 = *(void *)(v132 - 8);
  MEMORY[0x270FA5388](v132);
  id v130 = (char *)&v119 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24162B7E8();
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v133 = (char *)&v119 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_241631CA8();
  uint64_t v157 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v148 = (char *)&v119 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v119 - v28;
  uint64_t v30 = sub_241631C88();
  MEMORY[0x270FA5388](v30 - 8);
  uint64_t v152 = sub_24162B718();
  uint64_t v156 = *(void *)(v152 - 8);
  MEMORY[0x270FA5388](v152);
  unint64_t v146 = (char *)&v119 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&v119 - v33;
  uint64_t v35 = sub_24162BA08();
  uint64_t v36 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v138 = (char *)&v119 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v119 - v39;
  *(void *)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_dayProviderSubscription] = 0;
  *((void *)v4 + 3) = a1;
  id v149 = a1;
  id v145 = a4;
  id v41 = objc_msgSend(a4, sel_currentCalendar);
  sub_24162B928();

  id v42 = &v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_gregorianCalendar];
  uint64_t v147 = v36;
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
  uint64_t v159 = v40;
  uint64_t v134 = v35;
  v43(&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_gregorianCalendar], v40, v35);
  id v150 = v4;
  id v44 = v155;
  *(void *)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_healthStore] = v155;
  id v45 = v44;
  sub_24162B6B8();
  uint64_t v151 = v34;
  id v155 = v42;
  MEMORY[0x24561A950](v34, 0, v42);
  uint64_t v129 = sub_24162D318();
  uint64_t v46 = sub_24162DA78();
  id v139 = v45;
  uint64_t v47 = sub_24162DA48();
  uint64_t v161 = v46;
  uint64_t v162 = MEMORY[0x263F442B0];
  uint64_t v160 = v47;
  sub_241631C78();
  uint64_t v48 = v25;
  unint64_t v128 = 0xD000000000000021;
  sub_241631C68();
  sub_241631C58();
  uint64_t v49 = v157;
  swift_bridgeObjectRelease();
  sub_241631C68();
  uint64_t v50 = v148;
  sub_241631C98();
  uint64_t v127 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  v127(v50, v29, v48);
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v51 = (id)qword_26B0181A0;
  sub_24162B7D8();
  unint64_t v126 = 0x8000000241656B70;
  sub_241631D38();
  uint64_t v124 = v52;
  uint64_t v53 = *(void (**)(char *, uint64_t))(v49 + 8);
  uint64_t v157 = v49 + 8;
  uint64_t v125 = v53;
  v53(v29, v48);
  sub_241621DDC(0, &qword_268CFAED0, MEMORY[0x263F43F70], MEMORY[0x263F8E0F8]);
  uint64_t v54 = sub_24162D498();
  uint64_t v55 = v29;
  uint64_t v56 = *(void *)(v54 - 8);
  unint64_t v57 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_241637EE0;
  (*(void (**)(unint64_t, void, uint64_t))(v56 + 104))(v58 + v57, *MEMORY[0x263F43F60], v54);
  sub_2411C9E64(v58);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v59 = v131;
  uint64_t v60 = v130;
  uint64_t v61 = v132;
  (*(void (**)(char *, void, uint64_t))(v131 + 104))(v130, *MEMORY[0x263F07740], v132);
  uint64_t v62 = v159;
  sub_24162B808();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v61);
  uint64_t v63 = v129;
  uint64_t v64 = sub_24162D308();
  sub_241631C38();
  v127(v148, v55, v48);
  id v65 = (id)qword_26B0181A0;
  sub_24162B7D8();
  sub_241631D38();
  v125(v55, v48);
  uint64_t v161 = v63;
  uint64_t v162 = MEMORY[0x263F43ED0];
  uint64_t v160 = v64;
  uint64_t v66 = type metadata accessor for PDFCycleTrackingPage();
  id v67 = v137;
  *(void *)uint64_t v137 = v66;
  (*(void (**)(char *, void, uint64_t))(v135 + 104))(v67, *MEMORY[0x263F43ED8], v136);
  id v68 = objc_allocWithZone((Class)sub_24162D868());
  uint64_t v148 = (char *)v64;
  swift_retain();
  uint64_t v69 = sub_24162D858();
  uint64_t v71 = v150;
  uint64_t v70 = v151;
  *(void *)&v150[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_pdfViewController] = v69;
  uint64_t v72 = v152;
  (*(void (**)(char *, char *, uint64_t))(v156 + 16))(v146, v70, v152);
  uint64_t v73 = *(char **)(v147 + 16);
  uint64_t v74 = v134;
  uint64_t v157 = v147 + 16;
  uint64_t v137 = v73;
  ((void (*)(char *, id, uint64_t))v73)(v62, v155, v134);
  uint64_t v75 = v158;
  sub_241631A68();
  uint64_t v76 = v154;
  uint64_t v77 = *(void (**)(char *, char *, uint64_t))(v153 + 16);
  v77(&v71[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_today], v75, v154);
  id v78 = v140;
  id v79 = objc_msgSend(v140, sel_cycles);
  if (v79)
  {
    uint64_t v80 = v79;
    sub_2413D2BF0();
    unint64_t v81 = sub_241631F28();

    uint64_t v82 = (uint64_t)v159;
    sub_24162B9A8();
    uint64_t v83 = (uint64_t)v146;
    sub_24162B6B8();
    unint64_t v84 = sub_24161C708((uint64_t)v155, v82, v83, v81);
    (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v83, v72);
    (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v82, v74);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v84 = MEMORY[0x263F8EE78];
  }
  type metadata accessor for CycleChartsPDFModelProvider();
  id v85 = v78;
  id v86 = objc_msgSend(v149, sel_healthStore);
  uint64_t v87 = (uint64_t)v141;
  uint64_t v88 = (uint64_t)v158;
  v77(v141, v158, v76);
  uint64_t v89 = (uint64_t)v159;
  uint64_t v90 = (void (*)(char *, char *, uint64_t))v137;
  ((void (*)(char *, id, uint64_t))v137)(v159, v155, v74);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  uint64_t v91 = (uint64_t)v138;
  sub_24162B9A8();
  uint64_t v92 = sub_24122BB00(v85, v86, v84, v87, v89, v91);
  id v155 = v85;

  uint64_t v93 = v150;
  *((void *)v150 + 2) = v92;
  uint64_t v94 = v142;
  sub_241365BDC(v88, v84, v142);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v143 + 48))(v94, 1, v144) == 1)
  {
    sub_241621B64(v94, (uint64_t (*)(void))sub_24121530C);
    uint64_t v95 = sub_241632028();
    uint64_t v96 = (uint64_t)v119;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v119, 1, 1, v95);
    sub_241632008();
    swift_retain();
    uint64_t v97 = sub_241631FF8();
    uint64_t v98 = (void *)swift_allocObject();
    uint64_t v99 = MEMORY[0x263F8F500];
    v98[2] = v97;
    v98[3] = v99;
    v98[4] = v93;
    sub_241496830(v96, (uint64_t)&unk_268D046F8, (uint64_t)v98);
    swift_release();

    swift_release();
  }
  else
  {
    uint64_t v100 = v94;
    uint64_t v101 = v121;
    sub_2411FED54(v100, v121);
    sub_241622228((unint64_t *)&unk_268CFC5C0, MEMORY[0x263F090E8]);
    id v102 = v149;
    id v149 = v102;
    id v103 = v139;
    sub_241632C68();
    uint64_t v104 = v160;
    id v105 = objc_allocWithZone(MEMORY[0x263F45200]);
    id v106 = objc_msgSend(v105, sel_initWithHealthStore_analysisProvider_pregnancyModelProvider_maximumActiveDuration_minimumBufferDuration_shouldFetchCycleFactors_calendarCache_, v103, v102, 0, v104, 0, 0, v145);

    uint64_t v107 = (uint64_t)v159;
    v90(v159, &v93[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_gregorianCalendar], v74);
    type metadata accessor for CycleChartDayProvider();
    swift_allocObject();
    id v108 = v103;
    id v109 = v106;
    uint64_t v110 = sub_241513F80(v109, v108, v107);

    uint64_t v160 = v110[4];
    uint64_t v111 = (void *)swift_allocObject();
    v111[2] = v93;
    v111[3] = v110;
    v111[4] = v120;
    uint64_t v112 = swift_allocObject();
    *(void *)(v112 + 16) = sub_24162195C;
    *(void *)(v112 + 24) = v111;
    sub_2412170FC();
    sub_241622228(&qword_268CFAEE0, (void (*)(uint64_t))sub_2412170FC);
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v113 = sub_24162FDD8();
    swift_release();
    swift_release();
    *(void *)&v93[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_dayProviderSubscription] = v113;
    swift_release();
    uint64_t v114 = v122;
    sub_2411FEDB8(v101, v122);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v143 + 56))(v114, 0, 1, v144);
    uint64_t v115 = v123;
    sub_241621BC4(v114, v123, (uint64_t (*)(void))sub_24121530C);
    sub_241291B64(v115);
    sub_241621BC4(v114, v115, (uint64_t (*)(void))sub_24121530C);
    sub_2416315A8();
    sub_241621B64(v114, (uint64_t (*)(void))sub_24121530C);
    swift_release();

    swift_release();
    sub_241621C2C(v101, (unint64_t *)&qword_26B0121D0, MEMORY[0x263F8D870]);
  }
  uint64_t v116 = v156;
  id v117 = v151;
  (*(void (**)(char *, uint64_t))(v153 + 8))(v158, v154);
  (*(void (**)(char *, uint64_t))(v116 + 8))(v117, v152);
  return v93;
}

uint64_t sub_24161DD00()
{
  v0[2] = sub_241632008();
  v0[3] = sub_241631FF8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_24161DDB8;
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v3 = MEMORY[0x263F8EE78];
  return sub_24161DF54(v3, v2);
}

uint64_t sub_24161DDB8()
{
  swift_task_dealloc();
  uint64_t v1 = sub_241631FC8();
  return MEMORY[0x270FA2498](sub_24161DEF4, v1, v0);
}

uint64_t sub_24161DEF4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24161DF54(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  v3[13] = *v2;
  uint64_t v4 = sub_24162EFA8();
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  uint64_t v5 = sub_24162D898();
  v3[17] = v5;
  v3[18] = *(void *)(v5 - 8);
  v3[19] = swift_task_alloc();
  uint64_t v6 = sub_24162D328();
  v3[20] = v6;
  v3[21] = *(void *)(v6 - 8);
  v3[22] = swift_task_alloc();
  uint64_t v7 = sub_24162CE68();
  v3[23] = v7;
  v3[24] = *(void *)(v7 - 8);
  v3[25] = swift_task_alloc();
  uint64_t v8 = sub_24162CE88();
  v3[26] = v8;
  v3[27] = *(void *)(v8 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v9 = sub_24162CE08();
  v3[29] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[30] = v10;
  v3[31] = *(void *)(v10 + 64);
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  sub_241632008();
  v3[34] = sub_241631FF8();
  uint64_t v12 = sub_241631FC8();
  v3[35] = v12;
  v3[36] = v11;
  return MEMORY[0x270FA2498](sub_24161E258, v12, v11);
}

uint64_t sub_24161E258()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[30];
  uint64_t v18 = v0[32];
  uint64_t v19 = v0[31];
  uint64_t v17 = v0[29];
  uint64_t v24 = v0[28];
  uint64_t v26 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v25 = v0[26];
  uint64_t v4 = v0[23];
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[21];
  uint64_t v7 = (uint64_t *)v0[22];
  uint64_t v16 = v0[20];
  uint64_t v8 = v0[18];
  uint64_t v23 = v0[17];
  uint64_t v20 = v0[11];
  uint64_t v21 = v0[10];
  uint64_t v22 = v0[19];
  sub_2416200BC(v1);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v3, *MEMORY[0x263F43D68], v4);
  *uint64_t v7 = type metadata accessor for PDFCycleTrackingPage();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v7, *MEMORY[0x263F43ED8], v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v18, v1, v17);
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v10 = (v19 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v11 + v9, v18, v17);
  *(void *)(v11 + v10) = v20;
  *(void *)(v11 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8)) = v21;
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v22, *MEMORY[0x263F440C0], v23);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_24162CE78();
  uint64_t v12 = MEMORY[0x263F43D78];
  v0[5] = v25;
  v0[6] = v12;
  uint64_t v13 = sub_2411B6C70(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v26 + 16))(v13, v24, v25);
  uint64_t v27 = (uint64_t (*)(uint64_t *))((int)*MEMORY[0x263F440A8] + MEMORY[0x263F440A8]);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[37] = (uint64_t)v14;
  *uint64_t v14 = v0;
  v14[1] = sub_24161E50C;
  return v27(v0 + 2);
}

uint64_t sub_24161E50C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_24161E720;
  }
  else
  {
    _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_24161E628;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_24161E628()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v4 = v0[28];
  uint64_t v6 = v0[26];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24161E720()
{
  uint64_t v36 = v0;
  uint64_t v1 = (void *)v0[38];
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)(v0 + 2));
  sub_24162EF48();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24162EF98();
  os_log_type_t v5 = sub_2416322D8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[38];
    uint64_t v31 = v0[29];
    uint64_t v33 = v0[33];
    uint64_t v29 = v0[28];
    uint64_t v30 = v0[30];
    uint64_t v27 = v0[27];
    uint64_t v28 = v0[26];
    uint64_t v7 = v0[15];
    uint64_t v25 = v0[14];
    uint64_t v26 = v0[16];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v35 = v9;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v10 = sub_2416333E8();
    v0[7] = sub_2411B6898(v10, v11, &v35);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    v0[8] = v6;
    id v12 = v6;
    sub_2411BF880(0, (unint64_t *)&qword_26B012410);
    uint64_t v13 = sub_241631D48();
    v0[9] = sub_2411B6898(v13, v14, &v35);
    sub_241632C28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24118E000, v4, v5, "[%{public}s] Failed to configure PDF view controller: %{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245621640](v9, -1, -1);
    MEMORY[0x245621640](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v26, v25);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v33, v31);
  }
  else
  {
    uint64_t v15 = (void *)v0[38];
    uint64_t v16 = v0[30];
    uint64_t v32 = v0[29];
    uint64_t v34 = v0[33];
    uint64_t v17 = v0[27];
    uint64_t v18 = v0[28];
    uint64_t v19 = v0[26];
    uint64_t v20 = v0[15];
    uint64_t v21 = v0[16];
    uint64_t v22 = v0[14];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v34, v32);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_24161EA90(uint64_t a1, uint64_t a2)
{
  sub_241621DDC(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - v5;
  uint64_t v7 = sub_24162EFA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  unint64_t v11 = sub_24162EF98();
  os_log_type_t v12 = sub_2416322B8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v25 = v7;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = a1;
    unint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v29 = v15;
    *(_DWORD *)unint64_t v14 = 136446210;
    uint64_t v26 = v6;
    uint64_t v16 = sub_2416333E8();
    uint64_t v28 = sub_2411B6898(v16, v17, &v29);
    uint64_t v6 = v26;
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v11, v12, "[%{public}s] Days updated, configuring", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v15, -1, -1);
    uint64_t v18 = v14;
    a1 = v27;
    MEMORY[0x245621640](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v25);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v19 = sub_241632028();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
  sub_241632008();
  swift_retain();
  swift_retain();
  uint64_t v20 = sub_241631FF8();
  uint64_t v21 = (void *)swift_allocObject();
  uint64_t v22 = MEMORY[0x263F8F500];
  _OWORD v21[2] = v20;
  void v21[3] = v22;
  v21[4] = a1;
  v21[5] = a2;
  sub_241496830((uint64_t)v6, (uint64_t)&unk_268D04708, (uint64_t)v21);
  uint64_t result = swift_release();
  if (*(void *)(a1
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_dayProviderSubscription))
  {
    swift_retain();
    sub_24162FA88();
    return swift_release();
  }
  return result;
}

uint64_t sub_24161EDE0()
{
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_gregorianCalendar;
  uint64_t v2 = sub_24162BA08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_pdfViewController));
  uint64_t v3 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_today;
  uint64_t v4 = sub_241631AC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_24161EF04()
{
  return type metadata accessor for TwelveMonthCycleHistoryPDFProvider();
}

uint64_t type metadata accessor for TwelveMonthCycleHistoryPDFProvider()
{
  uint64_t result = qword_268D046E0;
  if (!qword_268D046E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24161EF58()
{
  uint64_t result = sub_24162BA08();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_241631AC8();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

id sub_24161F048()
{
  return objc_retain(*(id *)(*v0
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_pdfViewController));
}

uint64_t sub_24161F05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_241632008();
  v5[3] = sub_241631FF8();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_24161F118;
  return sub_24161F254(a5);
}

uint64_t sub_24161F118()
{
  swift_task_dealloc();
  uint64_t v1 = sub_241631FC8();
  return MEMORY[0x270FA2498](sub_2416222D8, v1, v0);
}

uint64_t sub_24161F254(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  sub_241621AC8(0, (unint64_t *)&qword_268CFCC20, MEMORY[0x263F8D1A0]);
  v2[11] = swift_task_alloc();
  v2[12] = *(void *)(type metadata accessor for CycleChartPDFModel(0) - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for CycleChartCycle(0);
  v2[15] = v3;
  v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  sub_241621DDC(0, (unint64_t *)&unk_268D04810, (uint64_t (*)(uint64_t))type metadata accessor for CycleChartsModel, MEMORY[0x263F8D8F0]);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  sub_241632008();
  v2[21] = sub_241631FF8();
  uint64_t v5 = sub_241631FC8();
  v2[22] = v5;
  v2[23] = v4;
  return MEMORY[0x270FA2498](sub_24161F470, v5, v4);
}

uint64_t sub_24161F470()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(*(void *)(v0 + 80) + 16);
  uint64_t v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartsPDFModelProvider_fertilityChart;
  *(void *)(v0 + 192) = v2;
  *(void *)(v0 + 200) = v3;
  uint64_t v4 = v2 + v3;
  swift_beginAccess();
  sub_241216E80(v4, v1);
  uint64_t v5 = type metadata accessor for CycleChartsModel();
  *(void *)(v0 + 208) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v0 + 216) = v6;
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  *(void *)(v0 + 224) = v7;
  *(void *)(v0 + 232) = (v6 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  uint64_t result = v7(v1, 1, v5);
  if (result == 1)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v9 = *(uint64_t **)(v0 + 160);
  uint64_t v10 = *v9;
  *(void *)(v0 + 240) = *v9;
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  sub_241621B64((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
  uint64_t v11 = *(void *)(v10 + 16);
  *(void *)(v0 + 248) = v11;
  if (v11)
  {
    uint64_t v12 = *(void *)(v0 + 128);
    uint64_t v13 = *(void *)(v0 + 136);
    uint64_t v14 = *(void *)(v0 + 120);
    uint64_t v15 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_healthStore;
    uint64_t v16 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_gregorianCalendar;
    uint64_t v17 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_today;
    *(void *)(v0 + 256) = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_gregorianCalendar;
    *(void *)(v0 + 264) = v17;
    uint64_t v18 = *(void *)(v0 + 72);
    uint64_t v19 = *(void *)(v0 + 80);
    *(void *)(v0 + 272) = *(void *)(v19 + v15);
    LODWORD(v15) = *(_DWORD *)(v12 + 80);
    *(_DWORD *)(v0 + 352) = v15;
    uint64_t v20 = *(void *)(v12 + 72);
    uint64_t v21 = MEMORY[0x263F8EE78];
    *(void *)(v0 + 288) = 0;
    *(void *)(v0 + 296) = v21;
    *(void *)(v0 + 280) = v20;
    uint64_t v22 = *(void *)(v0 + 88);
    sub_241621BC4(*(void *)(v0 + 240) + ((v15 + 32) & ~(unint64_t)v15), v13, type metadata accessor for CycleChartCycle);
    sub_24136561C((char *)(v13 + *(int *)(v14 + 24)), v22);
    swift_retain();
    uint64_t v23 = sub_241621094(v22, v18);
    *(void *)(v0 + 304) = v23;
    *(void *)(v0 + 312) = 0;
    swift_release();
    sub_241621C2C(v22, (unint64_t *)&qword_268CFCC20, MEMORY[0x263F8D1A0]);
    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_24161F8E8;
    uint64_t v25 = *(void *)(v0 + 272);
    uint64_t v26 = *(void *)(v0 + 136);
    uint64_t v27 = *(void *)(v0 + 112);
    return sub_2413FB764(v27, v25, v26, v23, v19 + v16, v19 + v17);
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 328) = MEMORY[0x263F8EE78];
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
  uint64_t v29 = *(void *)(v0 + 208);
  uint64_t v30 = *(void *)(v0 + 216);
  uint64_t v31 = *(void *)(v0 + 152);
  uint64_t v32 = *(void *)(v0 + 192) + *(void *)(v0 + 200);
  sub_241621DDC(0, &qword_268CFAF00, (uint64_t (*)(uint64_t))type metadata accessor for CycleChartsModel, MEMORY[0x263F8E0F8]);
  uint64_t v33 = *(void *)(v30 + 72);
  unint64_t v34 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v35 = swift_allocObject();
  *(void *)(v0 + 336) = v35;
  *(_OWORD *)(v35 + 16) = xmmword_24163A4F0;
  sub_241216E80(v32, v31);
  uint64_t result = v28(v31, 1, v29);
  if (result == 1) {
    goto LABEL_12;
  }
  uint64_t v36 = v35 + v34;
  uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
  uint64_t v38 = *(void *)(v0 + 208);
  uint64_t v39 = *(void *)(v0 + 192);
  uint64_t v40 = *(void *)(v0 + 144);
  sub_241622270(*(void *)(v0 + 152), v36, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
  uint64_t v41 = v39 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartsPDFModelProvider_symptomsChart;
  swift_beginAccess();
  sub_241216E80(v41, v40);
  uint64_t result = v37(v40, 1, v38);
  if (result == 1)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  sub_241622270(*(void *)(v0 + 144), v36 + v33, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
  id v42 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v42;
  *id v42 = v0;
  v42[1] = sub_24161FE9C;
  uint64_t v43 = MEMORY[0x263F8EE78];
  return sub_24161DF54(v35, v43);
}

uint64_t sub_24161F8E8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 184);
  uint64_t v3 = *(void *)(v1 + 176);
  return MEMORY[0x270FA2498](sub_24161FA2C, v3, v2);
}

uint64_t sub_24161FA2C()
{
  sub_241621BC4(*(void *)(v0 + 112), *(void *)(v0 + 104), type metadata accessor for CycleChartPDFModel);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v2 = *(void *)(v0 + 296);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v2 = sub_24158D2FC(0, *(void *)(v2 + 16) + 1, 1, *(void *)(v0 + 296));
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24158D2FC(v3 > 1, v4 + 1, 1, v2);
  }
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 96);
  uint64_t v10 = *(void *)(v0 + 288) + 1;
  *(void *)(v2 + 16) = v4 + 1;
  sub_241622270(v7, v2+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v4, type metadata accessor for CycleChartPDFModel);
  sub_241621B64(v8, type metadata accessor for CycleChartPDFModel);
  sub_241621B64(v6, type metadata accessor for CycleChartCycle);
  if (v10 == v5)
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 328) = v2;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
    uint64_t v13 = *(void *)(v0 + 208);
    uint64_t v12 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 152);
    uint64_t v15 = *(void *)(v0 + 192) + *(void *)(v0 + 200);
    sub_241621DDC(0, &qword_268CFAF00, (uint64_t (*)(uint64_t))type metadata accessor for CycleChartsModel, MEMORY[0x263F8E0F8]);
    unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v40 = *(void *)(v12 + 72);
    uint64_t v17 = swift_allocObject();
    *(void *)(v0 + 336) = v17;
    *(_OWORD *)(v17 + 16) = xmmword_24163A4F0;
    sub_241216E80(v15, v14);
    uint64_t result = v11(v14, 1, v13);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v19 = v17 + v16;
      uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
      uint64_t v21 = *(void *)(v0 + 208);
      uint64_t v22 = *(void *)(v0 + 192);
      uint64_t v23 = *(void *)(v0 + 144);
      sub_241622270(*(void *)(v0 + 152), v19, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
      uint64_t v24 = v22 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartsPDFModelProvider_symptomsChart;
      swift_beginAccess();
      sub_241216E80(v24, v23);
      uint64_t result = v20(v23, 1, v21);
      if (result != 1)
      {
        sub_241622270(*(void *)(v0 + 144), v19 + v40, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
        uint64_t v25 = (void *)swift_task_alloc();
        *(void *)(v0 + 344) = v25;
        *uint64_t v25 = v0;
        v25[1] = sub_24161FE9C;
        return sub_24161DF54(v17, v2);
      }
    }
    __break(1u);
    return result;
  }
  uint64_t v26 = *(void *)(v0 + 312);
  uint64_t v27 = *(void *)(v0 + 280);
  uint64_t v28 = *(void *)(v0 + 288) + 1;
  *(void *)(v0 + 288) = v28;
  *(void *)(v0 + 296) = v2;
  uint64_t v29 = *(void *)(v0 + 256);
  uint64_t v41 = *(void *)(v0 + 264);
  uint64_t v30 = *(void *)(v0 + 136);
  uint64_t v31 = *(void *)(v0 + 120);
  uint64_t v33 = *(void *)(v0 + 80);
  uint64_t v32 = *(void *)(v0 + 88);
  uint64_t v34 = *(void *)(v0 + 72);
  sub_241621BC4(*(void *)(v0 + 240)+ ((*(unsigned __int8 *)(v0 + 352) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 352))+ v27 * v28, v30, type metadata accessor for CycleChartCycle);
  sub_24136561C((char *)(v30 + *(int *)(v31 + 24)), v32);
  swift_retain();
  uint64_t v35 = sub_241621094(v32, v34);
  *(void *)(v0 + 304) = v35;
  *(void *)(v0 + 312) = v26;
  swift_release();
  sub_241621C2C(v32, (unint64_t *)&qword_268CFCC20, MEMORY[0x263F8D1A0]);
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_24161F8E8;
  uint64_t v37 = *(void *)(v0 + 272);
  uint64_t v38 = *(void *)(v0 + 136);
  uint64_t v39 = *(void *)(v0 + 112);
  return sub_2413FB764(v39, v37, v38, v35, v33 + v29, v33 + v41);
}

uint64_t sub_24161FE9C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 184);
  uint64_t v3 = *(void *)(v1 + 176);
  return MEMORY[0x270FA2498](sub_24161FFFC, v3, v2);
}

uint64_t sub_24161FFFC()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2416200BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  sub_241621DDC(0, &qword_268CFAF08, MEMORY[0x263F43AC8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v30 = (char *)&v29 - v3;
  uint64_t v4 = type metadata accessor for PDFCoverPageBodyProvider();
  uint64_t v5 = v4 - 8;
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v31 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (id *)((char *)&v29 - v9);
  uint64_t v11 = type metadata accessor for PDFCoverPageHeaderProvider();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v29 - v16;
  sub_2414F3450(*(id *)(v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_healthStore), (uint64_t)&v29 - v16);
  id v29 = *(id *)(v1 + 24);
  id v18 = v29;
  uint64_t v19 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34TwelveMonthCycleHistoryPDFProvider_gregorianCalendar;
  uint64_t v20 = (char *)v10 + *(int *)(v5 + 28);
  uint64_t v21 = sub_24162BA08();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v20, v19, v21);
  *uint64_t v10 = v18;
  uint64_t v22 = sub_24162CB38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v30, 1, 1, v22);
  sub_241621BC4((uint64_t)v17, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for PDFCoverPageHeaderProvider);
  unint64_t v23 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v24 = swift_allocObject();
  sub_241622270((uint64_t)v14, v24 + v23, (uint64_t (*)(void))type metadata accessor for PDFCoverPageHeaderProvider);
  sub_241621BC4((uint64_t)v10, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for PDFCoverPageBodyProvider);
  unint64_t v25 = (*(unsigned __int8 *)(v31 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  uint64_t v26 = swift_allocObject();
  sub_241622270((uint64_t)v7, v26 + v25, (uint64_t (*)(void))type metadata accessor for PDFCoverPageBodyProvider);
  id v27 = v29;
  sub_24162CDF8();
  sub_241621B64((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for PDFCoverPageBodyProvider);
  return sub_241621B64((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for PDFCoverPageHeaderProvider);
}

void *sub_2416204C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = a3;
  uint64_t v37 = a2;
  sub_241621DDC(0, &qword_268CFAF08, MEMORY[0x263F43AC8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v44 = (char *)&v36 - v5;
  uint64_t v6 = sub_24162CB88();
  uint64_t v47 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CycleChartPDFModel(0);
  uint64_t v46 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v48 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24162CE08();
  uint64_t v12 = *(void *)(v11 - 8);
  __n128 v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v12 + 16);
  v16(v15, a1, v11, v13);
  uint64_t v17 = sub_24158D344(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v19 = v17[2];
  unint64_t v18 = v17[3];
  if (v19 >= v18 >> 1) {
    uint64_t v17 = sub_24158D344((void *)(v18 > 1), v19 + 1, 1, v17);
  }
  uint64_t v50 = v11;
  uint64_t v51 = MEMORY[0x263F43D18];
  uint64_t v20 = sub_2411B6C70((uint64_t *)&v49);
  ((void (*)(uint64_t *, char *, uint64_t))v16)(v20, v15, v11);
  v17[2] = v19 + 1;
  sub_2411B6CD4(&v49, (uint64_t)&v17[5 * v19 + 4]);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t v41 = *(void *)(v37 + 16);
  if (v41)
  {
    uint64_t v21 = *(void *)(v43 + 16);
    uint64_t v40 = v37 + ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80));
    uint64_t v39 = *(void *)(v46 + 72);
    uint64_t v22 = (void (**)(uint64_t *, char *, uint64_t))(v47 + 16);
    unint64_t v23 = (void (**)(char *, uint64_t))(v47 + 8);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v24 = 0;
    uint64_t v25 = (uint64_t)v48;
    uint64_t v38 = v21;
    do
    {
      sub_241621BC4(v40 + v39 * v24, v25, type metadata accessor for CycleChartPDFModel);
      if (v21)
      {
        uint64_t v42 = v24;
        uint64_t v26 = *(void *)(type metadata accessor for CycleChartsModel() - 8);
        uint64_t v27 = v43 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
        uint64_t v47 = *(void *)(v26 + 72);
        uint64_t v28 = sub_24162CB38();
        uint64_t v29 = *(void *)(v28 - 8);
        uint64_t v30 = *(void *)(v29 + 56);
        uint64_t v45 = v29 + 56;
        uint64_t v46 = v30;
        _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
        do
        {
          uint64_t v31 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v46)(v44, 1, 1, v28);
          MEMORY[0x270FA5388](v31);
          sub_24162CB78();
          unint64_t v33 = v17[2];
          unint64_t v32 = v17[3];
          if (v33 >= v32 >> 1) {
            uint64_t v17 = sub_24158D344((void *)(v32 > 1), v33 + 1, 1, v17);
          }
          uint64_t v50 = v6;
          uint64_t v51 = MEMORY[0x263F43AD0];
          uint64_t v34 = sub_2411B6C70((uint64_t *)&v49);
          (*v22)(v34, v8, v6);
          v17[2] = v33 + 1;
          sub_2411B6CD4(&v49, (uint64_t)&v17[5 * v33 + 4]);
          (*v23)(v8, v6);
          v27 += v47;
          --v21;
        }
        while (v21);
        swift_bridgeObjectRelease();
        uint64_t v25 = (uint64_t)v48;
        uint64_t v21 = v38;
        uint64_t v24 = v42;
      }
      ++v24;
      sub_241621B64(v25, type metadata accessor for CycleChartPDFModel);
    }
    while (v24 != v41);
    swift_bridgeObjectRelease();
  }
  return v17;
}

uint64_t sub_241620A60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CycleChartsModel();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CycleChartPDFModel(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241621BC4(a1, (uint64_t)v9, type metadata accessor for CycleChartPDFModel);
  sub_241621BC4(a2, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
  uint64_t v10 = type metadata accessor for PDFCycleChartView();
  uint64_t v11 = swift_allocObject();
  sub_241622270((uint64_t)v9, v11 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17PDFCycleChartView_pdfModel, type metadata accessor for CycleChartPDFModel);
  sub_241622270((uint64_t)v6, v11 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17PDFCycleChartView_cycleChartsModel, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
  v17[3] = v10;
  v17[4] = sub_241622228(&qword_268CFAF20, (void (*)(uint64_t))type metadata accessor for PDFCycleChartView);
  v17[0] = v11;
  uint64_t v12 = sub_24162D4D8();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v17);
  sub_241621E48();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_241637EE0;
  *(void *)(v13 + 32) = v12;
  uint64_t v14 = MEMORY[0x24561A980]();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_241620C60()
{
  v5[3] = sub_24162E008();
  v5[4] = MEMORY[0x263F44500];
  uint64_t v0 = sub_2411B6C70(v5);
  sub_24155E424((uint64_t)v0);
  uint64_t v1 = sub_24162D4D8();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v5);
  sub_241621E48();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_241637EE0;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = MEMORY[0x24561A980]();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_241620CF8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PDFCoverPageHeaderProvider();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241621BC4(a1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PDFCoverPageHeaderProvider);
  sub_241621ECC(0, &qword_268D04720, &qword_268D04728, MEMORY[0x263F44030], MEMORY[0x263F8E0F8]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_241637EE0;
  *(void *)(v5 + 56) = v2;
  *(void *)(v5 + 64) = sub_241622228(&qword_268D04740, (void (*)(uint64_t))type metadata accessor for PDFCoverPageHeaderProvider);
  uint64_t v6 = sub_2411B6C70((uint64_t *)(v5 + 32));
  sub_241621BC4((uint64_t)v4, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PDFCoverPageHeaderProvider);
  uint64_t v7 = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  sub_241621B64((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PDFCoverPageHeaderProvider);
  return v7;
}

uint64_t sub_241620E78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PDFCoverPageBodyProvider();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241621BC4(a1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PDFCoverPageBodyProvider);
  sub_241621ECC(0, &qword_268D04720, &qword_268D04728, MEMORY[0x263F44030], MEMORY[0x263F8E0F8]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_241637EE0;
  *(void *)(v5 + 56) = v2;
  *(void *)(v5 + 64) = sub_241622228(&qword_268D04738, (void (*)(uint64_t))type metadata accessor for PDFCoverPageBodyProvider);
  uint64_t v6 = sub_2411B6C70((uint64_t *)(v5 + 32));
  sub_241621BC4((uint64_t)v4, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PDFCoverPageBodyProvider);
  uint64_t v7 = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  sub_241621B64((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PDFCoverPageBodyProvider);
  return v7;
}

uint64_t sub_241620FFC()
{
  sub_241621ECC(0, &qword_268D04720, &qword_268D04728, MEMORY[0x263F44030], MEMORY[0x263F8E0F8]);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_241637EE0;
  *(void *)(v0 + 56) = &type metadata for PDFCoverPageFooterProvider;
  *(void *)(v0 + 64) = sub_2416221D4();
  uint64_t v1 = _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_241621094(uint64_t a1, uint64_t a2)
{
  uint64_t v64 = a2;
  uint64_t v3 = sub_241631AC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v59 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v63 = (char *)&v55 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v62 = (char *)&v55 - v9;
  uint64_t v10 = type metadata accessor for CycleChartDay();
  uint64_t v60 = *(void *)(v10 - 8);
  uint64_t v61 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v74 = (uint64_t)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241215380();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v55 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v65 = (uint64_t)&v55 - v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v70 = (char *)&v55 - v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v55 - v23;
  __n128 v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v55 - v27;
  id v67 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v4 + 16);
  uint64_t v68 = v4 + 16;
  v67((char *)&v55 - v27, a1, v3, v26);
  uint64_t v71 = (void (**)(char *, uint64_t))v4;
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  uint64_t v29 = v4 + 56;
  v30((uint64_t)v28, 0, 1, v3);
  uint64_t v31 = v30;
  v30((uint64_t)v24, 1, 1, v3);
  uint64_t v66 = a1;
  uint64_t v32 = sub_24139358C((uint64_t)v28, (uint64_t)v24);
  sub_241621B64((uint64_t)v24, (uint64_t (*)(void))sub_241215380);
  sub_241621B64((uint64_t)v28, (uint64_t (*)(void))sub_241215380);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v32)
  {
    uint64_t v76 = MEMORY[0x263F8EE78];
    sub_24149DE84(0, v32 & ~(v32 >> 63), 0);
    uint64_t v34 = (char *)v32;
    uint64_t v35 = (uint64_t)v70;
    ((void (*)(char *, uint64_t, uint64_t))v67)(v70, v66, v3);
    uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v31)(v35, 0, 1, v3);
    if (v32 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v72 = (void (**)(char *, uint64_t, uint64_t))(v71 + 4);
      uint64_t v73 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 6);
      ++v71;
      uint64_t v57 = v29;
      uint64_t v58 = v17;
      uint64_t v56 = v31;
      while (1)
      {
        uint64_t v70 = v34;
        uint64_t v38 = (uint64_t)v14;
        uint64_t v39 = v35;
        uint64_t v40 = v65;
        sub_241621BC4(v35, v65, (uint64_t (*)(void))sub_241215380);
        uint64_t v41 = *v73;
        uint64_t result = (*v73)(v40, 1, v3);
        if (result == 1) {
          break;
        }
        uint64_t v42 = *v72;
        uint64_t v43 = v62;
        (*v72)(v62, v40, v3);
        uint64_t v44 = v63;
        uint64_t v69 = v42;
        v42(v63, (uint64_t)v43, v3);
        uint64_t v45 = *(void **)(v64 + 16);
        uint64_t v46 = v74;
        ((void (*)(uint64_t, char *, uint64_t))v67)(v74, v44, v3);
        id v47 = objc_msgSend(v45, sel_dayViewModelAtIndex_, sub_241631A88());
        *(void *)(v46 + *(int *)(type metadata accessor for CycleDay() + 20)) = v47;
        sub_2416315D8();
        uint64_t v48 = *v71;
        (*v71)(v44, v3);
        uint64_t v49 = v76;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24149DE84(0, *(void *)(v49 + 16) + 1, 1);
          uint64_t v49 = v76;
        }
        uint64_t v14 = (char *)v38;
        unint64_t v51 = *(void *)(v49 + 16);
        unint64_t v50 = *(void *)(v49 + 24);
        if (v51 >= v50 >> 1)
        {
          sub_24149DE84(v50 > 1, v51 + 1, 1);
          uint64_t v49 = v76;
        }
        *(void *)(v49 + 16) = v51 + 1;
        sub_241622270(v74, v49+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v51, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
        uint64_t v35 = v39;
        sub_241621BC4(v39, v38, (uint64_t (*)(void))sub_241215380);
        uint64_t result = v41(v38, 1, v3);
        if (result == 1) {
          goto LABEL_18;
        }
        uint64_t v52 = v59;
        v69(v59, v38, v3);
        sub_241621AC8(0, (unint64_t *)&qword_268CFCC20, MEMORY[0x263F8D1A0]);
        sub_241622228((unint64_t *)&unk_268CFC5A0, MEMORY[0x263F090E8]);
        char v53 = sub_241631C28();
        uint64_t v54 = (uint64_t)v58;
        if (v53)
        {
          v48(v52, v3);
          uint64_t v36 = 1;
        }
        else
        {
          uint64_t v75 = 1;
          sub_241622228((unint64_t *)&unk_268CFC5C0, MEMORY[0x263F090E8]);
          sub_241632C58();
          v48(v52, v3);
          uint64_t v36 = 0;
        }
        uint64_t v37 = v70;
        v56(v54, v36, 1, v3);
        sub_241621B64(v39, (uint64_t (*)(void))sub_241215380);
        sub_241622270(v54, v39, (uint64_t (*)(void))sub_241215380);
        uint64_t v34 = v37 - 1;
        if (!v34)
        {
          sub_241621B64(v39, (uint64_t (*)(void))sub_241215380);
          return v76;
        }
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
  }
  return result;
}

uint64_t sub_241621828()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_241621868()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_241201428;
  return sub_24161DD00();
}

uint64_t sub_24162191C()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24162195C()
{
  return sub_24161EA90(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_241621968()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

BOOL sub_2416219A0(id *a1)
{
  return sub_2413E68F0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2416219C0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_241621A08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24120151C;
  return sub_24161F05C(a1, v4, v5, v7, v6);
}

void sub_241621AC8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_241631AC8();
    uint64_t v7 = sub_241622228((unint64_t *)&qword_26B0121C0, MEMORY[0x263F090E8]);
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_241621B64(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_241621BC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_241621C2C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  sub_241621AC8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_241621C88()
{
  uint64_t v1 = sub_24162CE08();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

void *sub_241621D44()
{
  uint64_t v1 = *(void *)(sub_24162CE08() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_2416204C0(v0 + v2, v4, v5);
}

void sub_241621DDC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_241621E40()
{
  return sub_241620A60(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_241621E48()
{
  if (!qword_268D036C0)
  {
    sub_241621ECC(255, &qword_268CFAF18, (unint64_t *)&qword_268D03690, MEMORY[0x263F43C48], MEMORY[0x263F8D488]);
    unint64_t v0 = sub_2416331E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D036C0);
    }
  }
}

void sub_241621ECC(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_2411BF880(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_241621F34()
{
  uint64_t v1 = *(void *)(type metadata accessor for PDFCoverPageHeaderProvider() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_24162D9A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24162200C()
{
  return sub_241622158((uint64_t (*)(void))type metadata accessor for PDFCoverPageHeaderProvider, sub_241620CF8);
}

uint64_t sub_241622038()
{
  uint64_t v1 = (int *)(type metadata accessor for PDFCoverPageBodyProvider() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_24162BA08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24162212C()
{
  return sub_241622158((uint64_t (*)(void))type metadata accessor for PDFCoverPageBodyProvider, sub_241620E78);
}

uint64_t sub_241622158(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *(void *)(a1(0) - 8);
  uint64_t v4 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a2(v4);
}

unint64_t sub_2416221D4()
{
  unint64_t result = qword_268D04730;
  if (!qword_268D04730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04730);
  }
  return result;
}

uint64_t sub_241622228(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_241622270(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2416222DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24162FC48();
  swift_release();
  swift_release();
  if (v4) {
    goto LABEL_4;
  }
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_getActivePairedDevice);

  if (v1)
  {

LABEL_4:
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24162FC48();
    swift_release();
    swift_release();
    return v3;
  }
  return 0;
}

uint64_t sub_2416223EC()
{
  return sub_2412A05E0();
}

uint64_t sub_241622400()
{
  uint64_t v0 = sub_24162B7E8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_241631CA8();
  MEMORY[0x270FA5388](v1 - 8);
  sub_241631C38();
  if (qword_26B0131F0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26B0181A0;
  sub_24162B7D8();
  return sub_241631D38();
}

uint64_t sub_241622568(char a1)
{
  sub_241624468(0, (unint64_t *)&qword_26B00F1C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v10[-v4];
  swift_getKeyPath();
  swift_getKeyPath();
  v10[15] = a1;
  swift_retain();
  sub_24162FC58();
  swift_getKeyPath();
  swift_getKeyPath();
  v10[14] = 1;
  swift_retain();
  sub_24162FC58();
  id v6 = objc_msgSend(*(id *)(v1 + 16), sel_featureIdentifier);
  uint64_t v7 = sub_241632028();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = v1;
  *(unsigned char *)(v8 + 40) = a1;
  *(void *)(v8 + 48) = v6;
  swift_retain();
  sub_241496830((uint64_t)v5, (uint64_t)&unk_268D047A0, v8);
  return swift_release();
}

uint64_t sub_241622744()
{
  return sub_2412A05E0();
}

uint64_t sub_241622758()
{
  return sub_2412A05E0();
}

uint64_t sub_24162276C()
{
  return sub_2412A05E0();
}

void *sub_241622780(char a1, void *a2)
{
  uint64_t v35 = *v2;
  sub_24162436C(0, (unint64_t *)&qword_26B0116F0, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v34 - v8;
  *(void *)((char *)v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel_anySampleFromWatchQuery) = 0;
  uint64_t v10 = (char *)v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__hasSensorSampleFromAppleWatch;
  LOBYTE(aBlock[0]) = 0;
  swift_retain();
  sub_24162FC08();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v11(v10, v9, v6);
  uint64_t v12 = (char *)v2
      + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__meetsSettingInteractionRequirements;
  LOBYTE(aBlock[0]) = 0;
  sub_24162FC08();
  v11(v12, v9, v6);
  uint64_t v13 = (char *)v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__isSavingOnSetting;
  LOBYTE(aBlock[0]) = 0;
  sub_24162FC08();
  v11(v13, v9, v6);
  uint64_t v14 = (char *)v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__optimisticFeatureOnSetting;
  LOBYTE(aBlock[0]) = 0;
  sub_24162FC08();
  v11(v14, v9, v6);
  char v15 = a1 & 1;
  *((unsigned char *)v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel_sensorInputType) = a1 & 1;
  if (a1) {
    uint64_t v16 = (id *)MEMORY[0x263F097B0];
  }
  else {
    uint64_t v16 = (id *)MEMORY[0x263F097A8];
  }
  if (a1) {
    uint64_t v17 = (void **)MEMORY[0x263F09BE0];
  }
  else {
    uint64_t v17 = (void **)MEMORY[0x263F09E38];
  }
  swift_release();
  id v18 = *v16;
  id v19 = a2;
  uint64_t v20 = sub_2412A0660(v18, v19);
  sub_2411B9D00(0, (unint64_t *)&qword_26B010718);
  uint64_t v21 = *v17;
  swift_retain();
  uint64_t v22 = (void *)MEMORY[0x24561F7E0](v21);
  id v23 = objc_msgSend(self, sel__predicateForObjectsFromAppleWatches);
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = v15;
  uint64_t v25 = v35;
  *(void *)(v24 + 24) = v20;
  *(void *)(v24 + 32) = v25;
  id v26 = objc_allocWithZone(MEMORY[0x263F0A6E0]);
  aBlock[4] = sub_241624400;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_241624188;
  aBlock[3] = &unk_26F579840;
  uint64_t v27 = _Block_copy(aBlock);
  swift_retain();
  id v28 = objc_msgSend(v26, sel_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_, v22, v23, 1, 0, v27);

  _Block_release(v27);
  swift_release();
  uint64_t v29 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel_anySampleFromWatchQuery;
  uint64_t v30 = *(void **)((char *)v20
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel_anySampleFromWatchQuery);
  *(void *)((char *)v20 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel_anySampleFromWatchQuery) = v28;

  uint64_t v31 = *(void **)((char *)v20 + v29);
  if (v31)
  {
    id v32 = v31;
    objc_msgSend(v19, sel_executeQuery_, v32);
  }
  swift_release();

  return v20;
}

uint64_t sub_241622B70(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = a6;
  char v9 = a4 & 1;
  uint64_t v10 = sub_241631488();
  uint64_t v24 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_2416314A8();
  uint64_t v13 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  char v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2411B9D00(0, (unint64_t *)&qword_26B0130B0);
  uint64_t v16 = (void *)sub_2416325A8();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(unsigned char *)(v17 + 24) = v9;
  *(void *)(v17 + 32) = a3;
  *(void *)(v17 + 40) = a5;
  *(void *)(v17 + 48) = v22;
  aBlock[4] = sub_241624454;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2411987F4;
  aBlock[3] = &unk_26F579890;
  id v18 = _Block_copy(aBlock);
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  id v19 = a3;
  swift_retain();
  swift_release();
  sub_241631498();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2411ACE78();
  sub_241624468(0, (unint64_t *)&qword_26B013090, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2411ACDF0();
  sub_241632D08();
  MEMORY[0x24561FA80](0, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v23);
}

uint64_t sub_241622E60(unint64_t a1, char a2, void *a3)
{
  uint64_t v6 = sub_24162EFA8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (a1 >> 62)
    {
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      uint64_t v10 = sub_241633068();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v32) = v10 != 0;
    swift_retain();
    return sub_24162FC58();
  }
  else
  {
    sub_24162EF48();
    id v12 = a3;
    id v13 = a3;
    uint64_t v14 = sub_24162EF98();
    os_log_type_t v15 = sub_2416322C8();
    int v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      id v28 = (void *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v32 = v30;
      *(_DWORD *)uint64_t v17 = 136446722;
      int v29 = v16;
      uint64_t v18 = sub_2416333E8();
      uint64_t v31 = sub_2411B6898(v18, v19, &v32);
      sub_241632C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2112;
      sub_2411B9D00(0, (unint64_t *)&qword_26B010718);
      uint64_t v20 = (id *)MEMORY[0x263F09E38];
      if (a2) {
        uint64_t v20 = (id *)MEMORY[0x263F09BE0];
      }
      uint64_t v21 = MEMORY[0x24561F7E0](*v20);
      uint64_t v31 = v21;
      sub_241632C28();
      uint64_t v22 = v28;
      *id v28 = v21;
      *(_WORD *)(v17 + 22) = 2080;
      uint64_t v31 = (uint64_t)a3;
      id v23 = a3;
      sub_241624468(0, (unint64_t *)&qword_26B010860, (uint64_t (*)(uint64_t))sub_2411CE834, MEMORY[0x263F8D8F0]);
      uint64_t v24 = sub_241631D48();
      uint64_t v31 = sub_2411B6898(v24, v25, &v32);
      sub_241632C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24118E000, v14, (os_log_type_t)v29, "[%{public}s] Failed to retrieve %@ samples: %s", (uint8_t *)v17, 0x20u);
      sub_2411CB3A0();
      swift_arrayDestroy();
      MEMORY[0x245621640](v22, -1, -1);
      uint64_t v26 = v30;
      swift_arrayDestroy();
      MEMORY[0x245621640](v26, -1, -1);
      MEMORY[0x245621640](v17, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_241623244(uint64_t a1)
{
  id v2 = (void *)sub_24162E7E8();
  objc_msgSend(v2, sel_areAllRequirementsSatisfied);

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24162FC58();
  uint64_t v3 = (void *)sub_24162E7E8();
  objc_msgSend(v3, sel_areAllRequirementsSatisfied);

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24162FC58();
  return sub_2412A0FF4(a1);
}

uint64_t sub_241623358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(unsigned char *)(v6 + 121) = a5;
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a6;
  uint64_t v7 = sub_24162EFA8();
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  sub_24162436C(0, (unint64_t *)&qword_268CFD2E8, MEMORY[0x263F8D4F8], MEMORY[0x263F44B40]);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 88) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24162349C, 0, 0);
}

uint64_t sub_24162349C()
{
  uint64_t ObjectType = swift_getObjectType();
  sub_241632548();
  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v2;
  *id v2 = v0;
  v2[1] = sub_241623568;
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 121);
  return MEMORY[0x270F35298](v4, v3, ObjectType);
}

uint64_t sub_241623568()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  uint64_t v3 = *(void *)(*(void *)v1 + 88);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_2416237A0;
  }
  else {
    uint64_t v5 = sub_2416236D8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2416236D8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 120) = 0;
  swift_retain();
  sub_24162FC58();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2416237A0()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = *(void **)(v0 + 48);
  sub_24162EF48();
  id v3 = v1;
  id v4 = v2;
  id v5 = v1;
  id v6 = v4;
  uint64_t v7 = sub_24162EF98();
  os_log_type_t v8 = sub_2416322C8();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = *(void **)(v0 + 112);
    uint64_t v25 = *(void *)(v0 + 64);
    uint64_t v10 = *(void **)(v0 + 48);
    uint64_t v26 = *(void *)(v0 + 56);
    uint64_t v27 = *(void *)(v0 + 72);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v28 = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v13 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    *(void *)(v0 + 16) = sub_2411B6898(v13, v14, &v28);
    sub_241632C28();
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 12) = 2082;
    *(void *)(v0 + 24) = v9;
    id v15 = v9;
    sub_2411CE834();
    uint64_t v16 = sub_241631D58();
    *(void *)(v0 + 32) = sub_2411B6898(v16, v17, &v28);
    sub_241632C28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24118E000, v7, v8, "[NanoMenstrualCyclesSettings] Failed to update feature setting for %{public}s: %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245621640](v12, -1, -1);
    MEMORY[0x245621640](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    uint64_t v18 = *(void **)(v0 + 112);
    uint64_t v20 = *(void *)(v0 + 64);
    uint64_t v19 = *(void *)(v0 + 72);
    uint64_t v22 = *(void **)(v0 + 48);
    uint64_t v21 = *(void *)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 120) = 0;
  swift_retain();
  sub_24162FC58();
  swift_task_dealloc();
  swift_task_dealloc();
  id v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_241623A94()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__hasSensorSampleFromAppleWatch;
  sub_24162436C(0, (unint64_t *)&qword_26B0116F0, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  uint64_t v3 = v2;
  id v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v2 - 8), v1, v2);
  v6(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__meetsSettingInteractionRequirements, v3);
  v6(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__isSavingOnSetting, v3);
  uint64_t v4 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__optimisticFeatureOnSetting;

  return ((uint64_t (*)(uint64_t, uint64_t))v6)(v4, v3);
}

uint64_t sub_241623BB0()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18FeatureStatusModel__meetsSettingVisibilityRequirements;
  sub_24162436C(0, (unint64_t *)&qword_26B0116F0, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v4(v1, v2);
  v4(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18FeatureStatusModel__meetsUsageRequirements, v3);
  v4(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18FeatureStatusModel__isOnboardingRecordPresent, v3);

  v4(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__hasSensorSampleFromAppleWatch, v3);
  v4(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__meetsSettingInteractionRequirements, v3);
  v4(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__isSavingOnSetting, v3);
  v4(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24SensorFeatureStatusModel__optimisticFeatureOnSetting, v3);
  return v0;
}

uint64_t sub_241623D30()
{
  sub_241623BB0();

  return swift_deallocClassInstance();
}

uint64_t sub_241623D88()
{
  return type metadata accessor for SensorFeatureStatusModel();
}

uint64_t type metadata accessor for SensorFeatureStatusModel()
{
  uint64_t result = qword_268D04770;
  if (!qword_268D04770) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_241623DDC()
{
  sub_24162436C(319, (unint64_t *)&qword_26B0116F0, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unsigned char *storeEnumTagSinglePayload for SensorInputType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x241623F74);
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

ValueMetadata *type metadata accessor for SensorInputType()
{
  return &type metadata for SensorInputType;
}

void sub_241623FAC(void *a1@<X8>)
{
  *a1 = &unk_26F567D90;
}

unint64_t sub_241623FC0()
{
  unint64_t result = qword_268D04780;
  if (!qword_268D04780)
  {
    sub_24162436C(255, &qword_268D04788, (uint64_t)&type metadata for SensorInputType, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D04780);
  }
  return result;
}

unint64_t sub_241624040()
{
  unint64_t result = qword_268D04790;
  if (!qword_268D04790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268D04790);
  }
  return result;
}

uint64_t sub_241624094@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24162FC48();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_241624114()
{
  return sub_24162FC58();
}

uint64_t sub_241624188(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_2411B9D00(0, (unint64_t *)&qword_26B0123B0);
    uint64_t v5 = sub_241631F28();
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_241624258()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2416242A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_241201428;
  return sub_241623358(a1, v4, v5, v6, v7, v8);
}

void sub_24162436C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2416243C8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_241624400(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_241622B70(a1, a2, a3, *(unsigned char *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_24162440C()
{
  swift_bridgeObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_241624454()
{
  return sub_241622E60(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void **)(v0 + 32));
}

void sub_241624468(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2416244D4()
{
  sub_241624F8C(0, &qword_268D03EF8, MEMORY[0x263F81DF8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - v1;
  uint64_t v3 = sub_24162F068();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24162F008();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2413B2C5C();
  sub_241624F8C(0, &qword_268D03F08, MEMORY[0x263F81E08], MEMORY[0x263F8E0F8]);
  sub_24162F088();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_241637EE0;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F81DE8], v7);
  uint64_t v11 = sub_24162F018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v2, 1, 1, v11);
  sub_24162F058();
  sub_24162F028();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_241632728();
}

uint64_t sub_2416247F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;
  swift_beginAccess();
  sub_2411FA270(v1, (uint64_t)v3);
  if (v4)
  {
    sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
    sub_2411BF880(0, &qword_268CFF098);
    if (swift_dynamicCast())
    {
      if (*((void *)&v6 + 1))
      {
        sub_2411B6854(&v5, *((uint64_t *)&v6 + 1));
        sub_24162D548();
        return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v5);
      }
    }
    else
    {
      uint64_t v7 = 0;
      long long v5 = 0u;
      long long v6 = 0u;
    }
  }
  else
  {
    sub_241230E38((uint64_t)v3, (unint64_t *)&qword_268CFFE30, (unint64_t *)&qword_268CFF090);
    long long v5 = 0u;
    long long v6 = 0u;
    uint64_t v7 = 0;
  }
  return sub_241230E38((uint64_t)&v5, &qword_268CFF0A0, &qword_268CFF098);
}

void sub_24162494C()
{
  uint64_t v1 = sub_24162EFA8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (uint64_t)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item];
  swift_beginAccess();
  sub_2411FA270(v5, (uint64_t)v19);
  if (v19[3])
  {
    sub_2411BF880(0, (unint64_t *)&qword_268CFF090);
    type metadata accessor for TextItem();
    if (swift_dynamicCast())
    {
      long long v6 = *(void **)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_textLabel];
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      uint64_t v7 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_setText_, v7);

      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      uint64_t v8 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setAccessibilityIdentifier_, v8);
      swift_release();

      return;
    }
  }
  else
  {
    sub_241230E38((uint64_t)v19, (unint64_t *)&qword_268CFFE30, (unint64_t *)&qword_268CFF090);
  }
  sub_24162EF48();
  uint64_t v9 = v0;
  uint64_t v10 = sub_24162EF98();
  os_log_type_t v11 = sub_2416322C8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v18 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    sub_2411FA270(v5, (uint64_t)v19);
    sub_2411BF934(0, (unint64_t *)&qword_268CFFE30, (unint64_t *)&qword_268CFF090);
    uint64_t v15 = sub_241631D58();
    v19[0] = sub_2411B6898(v15, v16, &v18);
    sub_241632C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v10, v11, "Incorrect view model for TextItemCell: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245621640](v14, -1, -1);
    MEMORY[0x245621640](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_241624CB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;
  swift_beginAccess();
  return sub_2411FA270(v3, a1);
}

uint64_t sub_241624D0C(uint64_t a1)
{
  sub_2411FA270(a1, (uint64_t)v5);
  uint64_t v3 = v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;
  swift_beginAccess();
  sub_2412309A4((uint64_t)v5, v3);
  swift_endAccess();
  sub_24162494C();
  return sub_241230E38(a1, (unint64_t *)&qword_268CFFE30, (unint64_t *)&qword_268CFF090);
}

void (*sub_241624DA0(void *a1))(void *a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_2413B32B0();
  return sub_241624DFC;
}

void sub_241624DFC(void *a1, char a2)
{
  uint64_t v3 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  if ((a2 & 1) == 0) {
    sub_24162494C();
  }

  free(v3);
}

id sub_241624F10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TextItemCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TextItemCell()
{
  return self;
}

uint64_t sub_241624F68()
{
  return sub_2416247F0();
}

void sub_241624F8C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

id sub_241624FF0()
{
  objc_msgSend(self, sel_preferredHeight);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F46A60]), sel_initWithFrame_shouldSupportRTL_, HKUICalendarLocaleIsRightToLeft(), 0.0, 0.0, 0.0, v0);
  objc_msgSend(v1, sel_layoutMargins);
  objc_msgSend(v1, sel_setLayoutMargins_);
  id v2 = v1;
  objc_msgSend(v2, sel_layoutMargins);
  objc_msgSend(v2, sel_setLayoutMargins_);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F83050]), sel_initWithContentView_, v2);
  return v3;
}

id sub_2416250DC(void *a1)
{
  id v2 = v1;
  uint64_t v4 = type metadata accessor for CycleChartCycle(0);
  MEMORY[0x270FA5388](v4);
  long long v6 = (uint64_t *)((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = (uint64_t)v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_cycle;
  swift_beginAccess();
  sub_24162645C(v7, (uint64_t)v6, type metadata accessor for CycleChartCycle);
  if (*a1 == *v6)
  {
    sub_2411B9D00(0, (unint64_t *)&qword_26B012200);
    if (sub_2416329B8())
    {
      sub_241631AC8();
      sub_241626528((unint64_t *)&unk_268CFC5C0, MEMORY[0x263F090E8]);
      sub_241632C68();
      if (!v9)
      {
        sub_241632C68();
        if (!v9
          && (MEMORY[0x245618DD0]((char *)a1 + *(int *)(v4 + 32), (char *)v6 + *(int *)(v4 + 32)) & 1) != 0
          && (MEMORY[0x245618DD0]((char *)a1 + *(int *)(v4 + 36), (char *)v6 + *(int *)(v4 + 36)) & 1) != 0)
        {
          return (id)sub_2416263FC((uint64_t)v6, type metadata accessor for CycleChartCycle);
        }
      }
    }
  }
  sub_2416263FC((uint64_t)v6, type metadata accessor for CycleChartCycle);
  return objc_msgSend(v2, sel_setNeedsDisplay);
}

uint64_t sub_2416252EC(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = type metadata accessor for CycleChartDay();
  MEMORY[0x270FA5388](v4);
  long long v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v12 - v8;
  uint64_t v10 = (uint64_t)v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_day;
  swift_beginAccess();
  sub_24162645C(v10, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
  swift_beginAccess();
  sub_2416264C4(a1, v10);
  swift_endAccess();
  sub_24162645C(v10, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
  sub_241631AC8();
  sub_241626528((unint64_t *)&unk_268CFC5C0, MEMORY[0x263F090E8]);
  sub_241632C68();
  if (!v12[0]
    && (sub_2411B9D00(0, (unint64_t *)&qword_26B012200),
        type metadata accessor for CycleDay(),
        (sub_2416329B8() & 1) != 0)
    && (type metadata accessor for SleepingWristTemperatureBaselineRelativeDataSource(),
        sub_241626528(&qword_268CFF600, (void (*)(uint64_t))type metadata accessor for SleepingWristTemperatureBaselineRelativeDataSource), (sub_241631578() & 1) != 0))
  {
    sub_2416263FC((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
  }
  else
  {
    sub_2416263FC((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
    objc_msgSend(v2, sel_setNeedsDisplay);
  }
  sub_2416263FC(a1, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
  return sub_2416263FC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
}

uint64_t sub_24162558C(uint64_t a1)
{
  uint64_t v19 = a1;
  uint64_t v3 = type metadata accessor for CycleChartDay();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_241631AC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)(v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayIndex);
  uint64_t v18 = v1;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 24))(v10, a1, v6);
  swift_endAccess();
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayProvider);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v12(v9, v10, v6);
  uint64_t v13 = *(void **)(v11 + 16);
  v12(v5, v9, v6);
  id v14 = objc_msgSend(v13, sel_dayViewModelAtIndex_, sub_241631A88());
  *(void *)&v5[*(int *)(type metadata accessor for CycleDay() + 20)] = v14;
  sub_2416315D8();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  sub_2416252EC((uint64_t)v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v15)(v19, v6);
}

uint64_t sub_241625818()
{
  swift_getObjectType();
  uint64_t v1 = sub_2416333E8();
  sub_241631E08();
  swift_beginAccess();
  sub_241631A88();
  swift_endAccess();
  sub_2416331D8();
  sub_241631E08();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_241625924(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_24162EFA8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for CycleChartDay();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_241631AC8();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for CycleChartCycle(0);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v73 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = v5;
  v80.receiver = v5;
  v80.super_class = ObjectType;
  objc_msgSendSuper2(&v80, sel_drawRect_, a1, a2, a3, a4);
  uint64_t v24 = UIGraphicsGetCurrentContext();
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = v17;
    uint64_t v27 = v68;
    objc_msgSend(v68, sel_bounds);
    uint64_t v31 = *(void *)&v27[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin10CycleChart_rows];
    uint64_t v32 = *(void *)(v31 + 16);
    if (v32)
    {
      double v33 = v28;
      double MaxY = v29;
      double v35 = v30;
      uint64_t v36 = &v68[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_cycle];
      uint64_t v37 = &v68[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayIndex];
      uint64_t v65 = *(void *)&v68[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayProvider];
      uint64_t v38 = v31 + 32;
      uint64_t v60 = v31;
      _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
      id v67 = v36;
      swift_beginAccess();
      uint64_t v66 = v37;
      swift_beginAccess();
      uint64_t v64 = (void (**)(char *, char *, uint64_t))(v19 + 16);
      uint64_t v63 = (void (**)(char *, uint64_t))(v19 + 8);
      double v39 = 0.0;
      uint64_t v62 = v15;
      uint64_t v61 = v18;
      uint64_t v40 = (uint64_t)v26;
      uint64_t v41 = (uint64_t)v73;
      uint64_t v72 = v25;
      do
      {
        uint64_t v71 = v32;
        sub_2411A3DF4(v38, (uint64_t)v74);
        CGContextSaveGState(v72);
        v81.origin.CGFloat x = v33;
        v81.origin.CGFloat y = MaxY;
        v81.size.CGFloat width = v35;
        v81.size.CGFloat height = v39;
        double MaxY = CGRectGetMaxY(v81);
        uint64_t v43 = v75;
        uint64_t v42 = v76;
        sub_2411B6854(v74, v75);
        double v39 = (*(double (**)(uint64_t))(*(void *)(v42 + 8) + 72))(v43);
        uint64_t v44 = v75;
        uint64_t v69 = v76;
        uint64_t v70 = sub_2411B6854(v74, v75);
        sub_24162645C((uint64_t)v67, v41, type metadata accessor for CycleChartCycle);
        uint64_t v45 = *v64;
        uint64_t v46 = v61;
        (*v64)(v21, v66, v61);
        uint64_t v47 = v65;
        uint64_t v48 = *(void **)(v65 + 16);
        v45((char *)v40, v21, v46);
        id v49 = objc_msgSend(v48, sel_dayViewModelAtIndex_, sub_241631A88());
        *(void *)(v40 + *(int *)(type metadata accessor for CycleDay() + 20)) = v49;
        sub_2416315D8();
        (*v63)(v21, v46);
        id v50 = objc_msgSend(v68, sel_traitCollection);
        unint64_t v51 = v72;
        (*(void (**)(CGContext *, char *, uint64_t, uint64_t, id, uint64_t, double, double, double, double))(*(void *)(v69 + 8) + 120))(v72, v73, v40, v47, v50, v44, v33, MaxY, v35, v39);

        uint64_t v41 = (uint64_t)v73;
        sub_2416263FC(v40, (uint64_t (*)(void))type metadata accessor for CycleChartDay);
        sub_2416263FC(v41, type metadata accessor for CycleChartCycle);
        uint64_t v52 = v71;
        CGContextRestoreGState(v51);
        _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v74);
        v38 += 40;
        uint64_t v32 = v52 - 1;
      }
      while (v32);

      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
  else
  {
    sub_24162EF48();
    char v53 = v68;
    uint64_t v54 = sub_24162EF98();
    os_log_type_t v55 = sub_2416322C8();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = (char *)swift_slowAlloc();
      uint64_t v77 = v73;
      *(_DWORD *)uint64_t v56 = 136446210;
      uint64_t v72 = (CGContext *)(v56 + 4);
      uint64_t v78 = sub_2416333E8();
      unint64_t v79 = v57;
      sub_241631E08();
      swift_beginAccess();
      uint64_t v58 = sub_241631A88();
      swift_endAccess();
      v74[0] = v58;
      sub_2416331D8();
      sub_241631E08();
      swift_bridgeObjectRelease();
      v74[0] = sub_2411B6898(v78, v79, (uint64_t *)&v77);
      sub_241632C28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24118E000, v54, v55, "[%{public}s] Skipping drawing with no current context", v56, 0xCu);
      uint64_t v59 = v73;
      swift_arrayDestroy();
      MEMORY[0x245621640](v59, -1, -1);
      MEMORY[0x245621640](v56, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

void sub_2416260DC()
{
}

uint64_t sub_24162610C()
{
  sub_2416263FC(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_cycle, type metadata accessor for CycleChartCycle);
  uint64_t v1 = v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayIndex;
  uint64_t v2 = sub_241631AC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2416263FC(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_day, (uint64_t (*)(void))type metadata accessor for CycleChartDay);

  return swift_release();
}

uint64_t sub_241626298()
{
  return type metadata accessor for CycleChartDayView();
}

uint64_t type metadata accessor for CycleChartDayView()
{
  uint64_t result = qword_268D047B0;
  if (!qword_268D047B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2416262EC()
{
  uint64_t result = type metadata accessor for CycleChartCycle(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_241631AC8();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for CycleChartDay();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t sub_2416263FC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24162645C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2416264C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CycleChartDay();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_241626528(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_241626570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4;
  uint64_t v32 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = type metadata accessor for CycleChartDay();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for CycleChartCycle;
  sub_24162645C(a1, (uint64_t)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_cycle], type metadata accessor for CycleChartCycle);
  uint64_t v11 = &v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayIndex];
  uint64_t v12 = sub_241631AC8();
  uint64_t v13 = *(void *)(v12 - 8);
  id v14 = *(void (**)(char *, uint64_t))(v13 + 16);
  uint64_t v15 = v11;
  uint64_t v16 = v12;
  uint64_t v30 = v12;
  v14(v15, a2);
  *(void *)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayProvider] = a3;
  uint64_t v17 = *(void **)(a3 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v14)(v10, a2, v16);
  uint64_t v18 = v4;
  swift_retain();
  id v19 = objc_msgSend(v17, sel_dayViewModelAtIndex_, sub_241631A88());
  *(void *)&v10[*(int *)(type metadata accessor for CycleDay() + 20)] = v19;
  sub_2416315D8();
  sub_2412980F4((uint64_t)v10, (uint64_t)&v18[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_day]);

  *(void *)&v18[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin10CycleChart_rows] = v28;
  uint64_t v20 = (objc_class *)type metadata accessor for CycleChart();
  v33.receiver = v18;
  v33.super_class = v20;
  id v21 = objc_msgSendSuper2(&v33, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2411B9D00(0, (unint64_t *)&qword_268CFDCF0);
  id v22 = v21;
  sub_2416325D8();
  sub_241632918();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v23 = self;
  id v24 = v22;
  id v25 = objc_msgSend(v23, sel_clearColor);
  objc_msgSend(v24, sel_setBackgroundColor_, v25);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, v30);
  sub_2416263FC(v32, v31);
  return v24;
}

char *sub_241626864(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_2414F0CAC(0);
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2414F0D44();
  uint64_t v46 = *(void *)(v6 - 8);
  uint64_t v47 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v45 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241628AB4(0);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView;
  id v14 = objc_allocWithZone((Class)type metadata accessor for CycleChartsHeaderView());
  uint64_t v15 = v1;
  *(void *)&v1[v13] = objc_msgSend(v14, sel_init);
  uint64_t v16 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_impactFeedbackGenerator;
  *(void *)&v15[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82830]), sel_initWithStyle_, 1);
  uint64_t v17 = &v15[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame];
  *(_OWORD *)uint64_t v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  *(void *)&v15[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastFooterBordersHeight] = 0;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_241633068()) {
    unint64_t v18 = sub_2411CA178(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v18 = MEMORY[0x263F8EE88];
  }
  *(void *)&v15[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_subscriptions] = v18;
  *(void *)&v15[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_model] = a1;
  type metadata accessor for CycleChartsCollectionView();
  uint64_t v19 = swift_retain_n();
  uint64_t v49 = a1;
  *(void *)&v15[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView] = sub_2414EC76C(v19);

  v51.receiver = v15;
  v51.super_class = ObjectType;
  uint64_t v48 = ObjectType;
  uint64_t v20 = (char *)objc_msgSendSuper2(&v51, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v21 = *(void *)&v20[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView];
  id v22 = v20;
  objc_msgSend(v22, sel_addSubview_, v21);
  uint64_t v23 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView;
  objc_msgSend(v22, sel_addSubview_, *(void *)&v22[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView]);
  sub_241627044();
  id v24 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v22, sel_setBackgroundColor_, v24);

  objc_msgSend(*(id *)&v22[v23], sel_setDelegate_, v22);
  sub_2411BFC90();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24163A670;
  swift_beginAccess();
  uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263EFDE58];
  sub_241628938(0, &qword_268CFB6D8, (uint64_t (*)(uint64_t))sub_24124418C, MEMORY[0x263EFDE58]);
  sub_24162FC18();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_241628A6C((unint64_t *)&unk_268D04830, sub_241628AB4);
  uint64_t v27 = sub_24162FDD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(void *)(inited + 32) = v27;
  swift_beginAccess();
  sub_241628938(0, &qword_268CFB6E0, (uint64_t (*)(uint64_t))sub_241244224, v26);
  uint64_t v28 = v42;
  sub_24162FC18();
  swift_endAccess();
  type metadata accessor for CycleChartsModel();
  sub_241628A6C(&qword_268D04820, sub_2414F0CAC);
  uint64_t v29 = v44;
  uint64_t v30 = v45;
  sub_24162FCC8();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v29);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_241628A6C(&qword_268D04840, (void (*)(uint64_t))sub_2414F0D44);
  uint64_t v31 = v47;
  uint64_t v32 = sub_24162FDD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v30, v31);
  *(void *)(inited + 40) = v32;
  unint64_t v50 = inited;
  sub_241631F48();
  unint64_t v33 = v50;
  if (v50 >> 62)
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    uint64_t v35 = sub_241633068();
    swift_bridgeObjectRelease();
    if (v35) {
      goto LABEL_5;
    }
LABEL_9:
    unint64_t v34 = MEMORY[0x263F8EE88];
    goto LABEL_10;
  }
  if (!*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v34 = sub_2411CA178(v33);
LABEL_10:
  swift_bridgeObjectRelease();
  *(void *)&v22[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_subscriptions] = v34;
  swift_bridgeObjectRelease();
  sub_2411B9D00(0, (unint64_t *)&qword_268CFDCF0);
  uint64_t v36 = v22;
  sub_2416325D8();
  sub_241632918();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_241628938(0, (unint64_t *)&qword_268CFA920, (uint64_t (*)(uint64_t))sub_2411E590C, MEMORY[0x263F8E0F8]);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_241637EE0;
  uint64_t v38 = sub_24162F5B8();
  uint64_t v39 = MEMORY[0x263F82018];
  *(void *)(v37 + 32) = v38;
  *(void *)(v37 + 40) = v39;
  uint64_t v40 = v36;
  sub_241632918();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return v40;
}

id sub_241627044()
{
  unint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView];
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  unint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView];
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_setLayoutMargins_, 9.0);
  id v37 = self;
  sub_2411BFC90();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_241640E50;
  id v4 = objc_msgSend(v1, sel_topAnchor);
  id v5 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v6 = objc_msgSend(v5, (SEL)&selRef_navigationItem + 3);

  id v7 = objc_msgSend(v4, sel_constraintEqualToAnchor_, v6);
  *(void *)(v3 + 32) = v7;
  id v8 = objc_msgSend(v1, sel_trailingAnchor);
  id v9 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v10 = objc_msgSend(v9, (SEL)&selRef_CGContext + 4);

  id v11 = objc_msgSend(v8, (SEL)&selRef_commit + 6, v10);
  *(void *)(v3 + 40) = v11;
  id v12 = objc_msgSend(v1, sel_leadingAnchor);
  id v13 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v14 = objc_msgSend(v13, sel_leadingAnchor);

  id v15 = objc_msgSend(v12, (SEL)&selRef_commit + 6, v14);
  *(void *)(v3 + 48) = v15;
  id v16 = objc_msgSend(v2, sel_topAnchor);
  id v17 = objc_msgSend(v1, sel_bottomAnchor);
  id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v17, 9.0);

  *(void *)(v3 + 56) = v18;
  id v19 = objc_msgSend(v2, sel_trailingAnchor);
  id v20 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v21 = objc_msgSend(v20, sel_trailingAnchor);

  id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v21);
  *(void *)(v3 + 64) = v22;
  id v23 = objc_msgSend(v2, sel_leadingAnchor);
  id v24 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v25 = objc_msgSend(v24, sel_leadingAnchor);

  id v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v25);
  *(void *)(v3 + 72) = v26;
  id v27 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v28 = objc_msgSend(v27, sel_bottomAnchor);

  id v29 = objc_msgSend(v2, sel_bottomAnchor);
  id v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

  *(void *)(v3 + 80) = v30;
  sub_241631F48();
  sub_2411B9D00(0, (unint64_t *)&qword_26B012130);
  uint64_t v31 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();
  objc_msgSend(v37, sel_activateConstraints_, v31);

  LODWORD(v32) = 1148846080;
  objc_msgSend(v1, sel_setContentHuggingPriority_forAxis_, 1, v32);
  LODWORD(v33) = 1148846080;
  objc_msgSend(v1, sel_setContentCompressionResistancePriority_forAxis_, 1, v33);
  LODWORD(v34) = 1132068864;
  objc_msgSend(v2, sel_setContentHuggingPriority_forAxis_, 1, v34);
  LODWORD(v35) = 1132068864;

  return objc_msgSend(v2, sel_setContentCompressionResistancePriority_forAxis_, 1, v35);
}

void sub_241627528(uint64_t a1, uint64_t a2)
{
  sub_24124418C(0);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x245621790](a2 + 16);
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(v7 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView);
    sub_241628A04(a1, (uint64_t)v6, (uint64_t (*)(void))sub_24124418C);
    uint64_t v10 = v9 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_activeCycle;
    swift_beginAccess();
    sub_241628B30((uint64_t)v6, v10);
    swift_endAccess();
    sub_24132090C();
    sub_2416289A4((uint64_t)v6, (uint64_t (*)(void))sub_24124418C);
  }
}

uint64_t sub_241627650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_241628A04(a1, a2, (uint64_t (*)(void))sub_241244224);
}

void sub_241627680(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24162B718();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x245621790](a2 + 16);
  if (v7)
  {
    id v8 = (char *)v7;
    sub_24162B6B8();
    sub_24162B6E8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    id v9 = objc_allocWithZone(NSString);
    uint64_t v10 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v9, sel_initWithString_, v10);

    sub_241628938(0, (unint64_t *)&qword_268CFA900, (uint64_t (*)(uint64_t))sub_2411E0CA8, MEMORY[0x263F8E0F8]);
    uint64_t inited = swift_initStackObject();
    id v13 = (void **)MEMORY[0x263F814F0];
    *(_OWORD *)(inited + 16) = xmmword_24163A4F0;
    id v14 = *v13;
    *(void *)(inited + 32) = v14;
    uint64_t v15 = *MEMORY[0x263F835B8];
    uint64_t v16 = *MEMORY[0x263F81788];
    uint64_t v17 = *MEMORY[0x263F81840];
    id v18 = v14;
    id v19 = sub_2415D17B8(v15, 0, v16, v17, 0);
    uint64_t v20 = sub_2411B9D00(0, &qword_26B012140);
    *(void *)(inited + 40) = v19;
    id v21 = (void *)*MEMORY[0x263F81500];
    *(void *)(inited + 64) = v20;
    *(void *)(inited + 72) = v21;
    id v22 = self;
    id v23 = v21;
    id v24 = objc_msgSend(v22, sel_secondaryLabelColor);
    *(void *)(inited + 104) = sub_2411B9D00(0, (unint64_t *)&qword_268CFA910);
    *(void *)(inited + 80) = v24;
    sub_2414E42B8(inited);
    type metadata accessor for Key(0);
    sub_241628A6C(&qword_268CFFFF0, type metadata accessor for Key);
    id v25 = (void *)sub_241631B18();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_sizeWithAttributes_, v25);
    double v27 = v26;

    double v28 = v27 + 4.0 + 4.0;
    double v29 = *(double *)&v8[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastFooterBordersHeight];
    *(double *)&v8[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastFooterBordersHeight] = v28;
    if (v29 != v28) {
      objc_msgSend(v8, sel_setNeedsDisplay);
    }
  }
}

void sub_2416279BC()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CycleChartCycle(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24124418C(0);
  *(void *)&double v7 = MEMORY[0x270FA5388](v6 - 8).n128_u64[0];
  id v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_model];
  id v11 = *(void **)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView];
  id v12 = objc_msgSend(v11, sel_traitCollection, v7);
  id v13 = objc_msgSend(v12, sel_horizontalSizeClass);

  id v14 = *(id *)(v10 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_horizontalSizeClass);
  *(void *)(v10 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_horizontalSizeClass) = v13;
  if (v14 != v13) {
    sub_24124280C();
  }
  sub_24124280C();
  objc_msgSend(v1, sel_setNeedsLayout);
  id v15 = objc_msgSend(v11, sel_collectionViewLayout);
  type metadata accessor for CycleChartsCollectionViewLayout();
  uint64_t v16 = swift_dynamicCastClass();
  if (v16)
  {
    uint64_t v17 = (char *)v16;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24162FC48();
    swift_release();
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2))
    {
      sub_2416289A4((uint64_t)v9, (uint64_t (*)(void))sub_24124418C);
      uint64_t v18 = 0;
    }
    else
    {
      sub_241628A04((uint64_t)v9, (uint64_t)v5, type metadata accessor for CycleChartCycle);
      sub_2416289A4((uint64_t)v9, (uint64_t (*)(void))sub_24124418C);
      uint64_t v18 = *v5;
      sub_2416289A4((uint64_t)v5, type metadata accessor for CycleChartCycle);
    }
    id v19 = &v17[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_pendingScrollToSectionIndex];
    *(void *)id v19 = v18;
    v19[8] = 0;
    objc_msgSend(v17, sel_invalidateLayout);
  }
  else
  {

    __break(1u);
  }
}

void sub_241627CAC()
{
  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_layoutSubviews);
  unint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView];
  objc_msgSend(v1, sel_frame);
  v15.origin.CGFloat x = v2;
  v15.origin.CGFloat y = v3;
  v15.size.CGFloat width = v4;
  v15.size.CGFloat height = v5;
  CGRect v13 = *(CGRect *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame];
  *(CGRect *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame] = v15;
  if (!CGRectEqualToRect(v13, v15)) {
    objc_msgSend(v0, sel_setNeedsDisplay);
  }
  uint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_model];
  objc_msgSend(v1, sel_bounds);
  CGFloat Width = CGRectGetWidth(v14);
  double v8 = *(double *)(v6 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_preferredMaxLayoutWidth);
  *(CGFloat *)(v6 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_preferredMaxLayoutWidth) = Width;
  if (v8 != Width) {
    sub_24124280C();
  }
  id v9 = objc_msgSend(v1, sel_traitCollection);
  id v10 = objc_msgSend(v9, sel_horizontalSizeClass);

  id v11 = *(id *)(v6 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_horizontalSizeClass);
  *(void *)(v6 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleChartsModelProvider_horizontalSizeClass) = v10;
  if (v11 != v10) {
    sub_24124280C();
  }
}

CGContext *sub_241627E2C(double a1, double a2, double a3, double a4)
{
  CGFloat v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_24162EFA8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  CGRect v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50.receiver = v5;
  v50.super_class = ObjectType;
  objc_msgSendSuper2(&v50, sel_drawRect_, a1, a2, a3, a4);
  sub_24162EF48();
  CGRect v15 = sub_24162EF98();
  os_log_type_t v16 = sub_2416322B8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v47 = v5;
    uint64_t v19 = v18;
    uint64_t v49 = v18;
    *(_DWORD *)uint64_t v17 = 136446210;
    uint64_t v20 = sub_2416333E8();
    uint64_t v48 = sub_2411B6898(v20, v21, &v49);
    sub_241632C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24118E000, v15, v16, "[%{public}s] Drawing", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v19;
    CGFloat v5 = v47;
    MEMORY[0x245621640](v22, -1, -1);
    MEMORY[0x245621640](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t result = UIGraphicsGetCurrentContext();
  if (result)
  {
    id v24 = result;
    CGFloat v25 = *(double *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame];
    CGFloat v26 = *(double *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame + 8];
    CGFloat v27 = *(double *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame + 16];
    CGFloat v28 = *(double *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame + 24];
    id v29 = objc_msgSend(v5, sel_traitCollection);
    objc_msgSend(v29, sel_displayScale);
    double v31 = v30;

    if (v31 > 1.0) {
      double v32 = 1.0 / v31;
    }
    else {
      double v32 = 1.0;
    }
    double v33 = v32 * 0.5;
    double v34 = self;
    id v35 = objc_msgSend(v34, sel_systemGrayColor);
    id v36 = objc_msgSend(v5, sel_traitCollection);
    id v37 = objc_msgSend(v35, sel_resolvedColorWithTraitCollection_, v36);

    uint64_t v38 = (CGColor *)objc_msgSend(v37, sel_CGColor);
    CGContextSetStrokeColorWithColor(v24, v38);

    id v39 = objc_msgSend(v34, sel_systemBackgroundColor);
    uint64_t v40 = (CGColor *)objc_msgSend(v39, sel_CGColor);

    CGContextSetFillColorWithColor(v24, v40);
    CGContextSetLineWidth(v24, v32);
    v51.origin.CGFloat x = v25;
    v51.origin.CGFloat y = v26;
    v51.size.CGFloat width = v27;
    v51.size.CGFloat height = v28;
    CGFloat v41 = CGRectGetMinX(v51) - v32 * 0.5;
    v52.origin.CGFloat x = v25;
    v52.origin.CGFloat y = v26;
    v52.size.CGFloat width = v27;
    v52.size.CGFloat height = v28;
    double v42 = v33 + CGRectGetMaxX(v52);
    v53.origin.CGFloat x = v25;
    v53.origin.CGFloat y = v26;
    v53.size.CGFloat width = v27;
    v53.size.CGFloat height = v28;
    CGFloat v43 = CGRectGetMinY(v53) - v33;
    v54.origin.CGFloat x = v25;
    v54.origin.CGFloat y = v26;
    v54.size.CGFloat width = v27;
    v54.size.CGFloat height = v28;
    double v44 = v33
        + CGRectGetMaxY(v54)
        - *(double *)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastFooterBordersHeight];
    sub_241628938(0, (unint64_t *)&qword_268D04800, (uint64_t (*)(uint64_t))type metadata accessor for CGPoint, MEMORY[0x263F8E0F8]);
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_24163BB30;
    *(CGFloat *)(v45 + 32) = v41;
    *(double *)(v45 + 40) = v44;
    *(CGFloat *)(v45 + 48) = v41;
    *(CGFloat *)(v45 + 56) = v43;
    *(CGFloat *)(v45 + 64) = v41;
    *(CGFloat *)(v45 + 72) = v43;
    *(double *)(v45 + 80) = v42;
    *(CGFloat *)(v45 + 88) = v43;
    *(double *)(v45 + 96) = v42;
    *(CGFloat *)(v45 + 104) = v43;
    *(double *)(v45 + 112) = v42;
    *(double *)(v45 + 120) = v44;
    sub_2416321A8();

    return (CGContext *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for CycleChartsView()
{
  return self;
}

void sub_241628470()
{
}

void sub_241628494()
{
  uint64_t v1 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CycleChartsHeaderView()), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_impactFeedbackGenerator;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82830]), sel_initWithStyle_, 1);
  CGFloat v3 = &v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastCollectionViewBordersFrame];
  *(_OWORD *)CGFloat v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_lastFooterBordersHeight] = 0;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_241633068()) {
    unint64_t v4 = sub_2411CA178(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v4 = MEMORY[0x263F8EE88];
  }
  *(void *)&v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_subscriptions] = v4;

  sub_241633038();
  __break(1u);
}

void sub_2416285A8()
{
  sub_24121530C();
  MEMORY[0x270FA5388](v1 - 8);
  CGFloat v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v23 - v5;
  uint64_t v7 = type metadata accessor for CycleChartCycle(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  CGFloat v25 = (void *)((char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24124418C(0);
  *(void *)&double v11 = MEMORY[0x270FA5388](v10 - 8).n128_u64[0];
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v0;
  id v15 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView), sel_collectionViewLayout, v11);
  type metadata accessor for CycleChartsCollectionViewLayout();
  if (swift_dynamicCastClass())
  {
    uint64_t v16 = sub_2412B0DD0();
    char v18 = v17;

    if ((v18 & 1) == 0)
    {
      uint64_t v24 = v16;
      uint64_t v19 = *(void *)(v14 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_model);
      swift_getKeyPath();
      swift_getKeyPath();
      v23[1] = v19;
      sub_24162FC48();
      swift_release();
      swift_release();
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7))
      {
        unint64_t v21 = v25;
        sub_241628A04((uint64_t)v13, (uint64_t)v25, type metadata accessor for CycleChartCycle);
        sub_2416289A4((uint64_t)v13, (uint64_t (*)(void))sub_24124418C);
        uint64_t v22 = *v21;
        sub_2416289A4((uint64_t)v21, type metadata accessor for CycleChartCycle);
        uint64_t v20 = v24;
        if (v22 == v24) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
      sub_2416289A4((uint64_t)v13, (uint64_t (*)(void))sub_24124418C);
      uint64_t v20 = v24;
      if (v24)
      {
LABEL_5:
        sub_241246940(v20);
        objc_msgSend(*(id *)(v14 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_impactFeedbackGenerator), sel_impactOccurred);
      }
    }
LABEL_6:
    swift_retain();
    sub_2414EBCD4((uint64_t)v6);
    sub_241628A04((uint64_t)v6, (uint64_t)v3, (uint64_t (*)(void))sub_24121530C);
    sub_241291B64((uint64_t)v3);
    sub_241628A04((uint64_t)v6, (uint64_t)v3, (uint64_t (*)(void))sub_24121530C);
    sub_2416315A8();
    sub_2416289A4((uint64_t)v6, (uint64_t (*)(void))sub_24121530C);
    swift_release();
    return;
  }

  __break(1u);
}

void sub_241628938(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2416289A4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_241628A04(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_241628A6C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_241628AB4(uint64_t a1)
{
}

uint64_t sub_241628AE8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_241628B20(uint64_t a1)
{
  sub_241627528(a1, v1);
}

void sub_241628B28(uint64_t a1)
{
  sub_241627680(a1, v1);
}

uint64_t sub_241628B30(uint64_t a1, uint64_t a2)
{
  sub_24124418C(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_241628B94()
{
  id v1 = objc_msgSend(v0, sel_collectionView);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_24162BAF8();
    objc_msgSend(v2, sel_bounds);
    CGRectGetWidth(v3);
  }
}

void sub_241628C64(unsigned char *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_24162EFA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162EF48();
  unint64_t v8 = sub_24162EF98();
  os_log_type_t v9 = sub_2416322E8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v16 = v4;
    uint64_t v12 = sub_2416333E8();
    uint64_t v17 = sub_2411B6898(v12, v13, &v18);
    sub_241632C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 1024;
    LODWORD(v17) = *a1 & 1;
    sub_241632C28();
    _os_log_impl(&dword_24118E000, v8, v9, "[%{public}s] Will set new configuration with regularHorizontalSizeClass %{BOOL}d", (uint8_t *)v10, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x245621640](v11, -1, -1);
    MEMORY[0x245621640](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if ((*a1 & 1) != *((unsigned char *)v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config))
  {
    uint64_t v14 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CycleTimelineCollectionViewLayoutInvalidationContext()), sel_init);
    v14[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateForHorizontalSizeChanges] = 1;
    objc_msgSend(v2, sel_invalidateLayoutWithContext_, v14);
  }
}

id sub_241628FC4(uint64_t a1)
{
  CGRect v3 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight];
  *(void *)CGRect v3 = 0;
  v3[8] = 1;
  uint64_t v4 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v5 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomAreaOffset];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomArea];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  uint64_t v7 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_computedAttributes;
  unint64_t v8 = v1;
  *(void *)&v1[v7] = sub_2414E4A94(MEMORY[0x263F8EE78]);
  os_log_type_t v9 = &v8[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config];
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)os_log_type_t v9 = *(_OWORD *)a1;
  *((_OWORD *)v9 + 1) = v10;
  long long v11 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v9 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v9 + 5) = v11;
  long long v12 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v9 + 3) = v12;
  *((void *)v9 + 18) = *(void *)(a1 + 144);
  long long v13 = *(_OWORD *)(a1 + 128);
  long long v14 = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v9 + 7) = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v9 + 8) = v13;
  *((_OWORD *)v9 + 6) = v14;

  v16.receiver = v8;
  v16.super_class = (Class)type metadata accessor for CycleTimelineCollectionViewLayout();
  return objc_msgSendSuper2(&v16, sel_init);
}

void sub_24162914C()
{
  id v1 = v0;
  uint64_t v2 = sub_24162EFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for CycleTimelineCollectionViewLayout();
  v63.receiver = v1;
  v63.super_class = v6;
  objc_msgSendSuper2(&v63, sel_prepareLayout);
  id v7 = objc_msgSend(v1, sel_collectionView);
  if (v7)
  {
    unint64_t v8 = v7;
    os_log_type_t v9 = &selRef_numberOfComponentsInPickerView_;
    objc_msgSend(v7, sel_bounds);
    double v12 = v11;
    long long v13 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight];
    if (v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight + 8] == 1)
    {
      *(void *)long long v13 = v10;
      v13[8] = 0;
    }
    long long v14 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize];
    if (v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize + 16] == 1)
    {
      id v15 = objc_msgSend(v8, sel_numberOfItemsInSection_, 0);
      if (__OFSUB__(v15, 1))
      {
        __break(1u);
        return;
      }
      uint64_t v16 = *(void *)v13;
      if (v13[8]) {
        uint64_t v16 = 0;
      }
      *(double *)long long v14 = (*(double *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config
                                     + 32]
                      + *(double *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config
                                     + 8])
                     * (double)((unint64_t)v15 - 1)
                     + *(double *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config
                                    + 32]
                     + *(double *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config
                                    + 64]
                     + 2.0;
      *((void *)v14 + 1) = v16;
      v14[16] = 0;
    }
    uint64_t v17 = (double *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config];
    uint64_t v18 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomAreaOffset];
    uint64_t v19 = &selRef_mainScreen;
    if (v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomAreaOffset + 16] == 1)
    {
      uint64_t v56 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config];
      unint64_t v57 = v13;
      *(double *)uint64_t v18 = (v12 - (v17[4] + v17[8] + 2.0)) * 0.5;
      *((void *)v18 + 1) = 0;
      v18[16] = 0;
      sub_24162EF48();
      uint64_t v20 = v1;
      id v21 = v8;
      uint64_t v22 = v20;
      id v23 = v21;
      uint64_t v24 = sub_24162EF98();
      os_log_type_t v25 = sub_2416322B8();
      int v55 = v25;
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v62 = v53;
        *(_DWORD *)uint64_t v26 = 136446466;
        v50[1] = v26 + 4;
        id v27 = objc_msgSend(v22, sel_description);
        uint64_t v54 = v2;
        id v28 = v27;
        uint64_t v29 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
        os_log_t v51 = v24;
        uint64_t v52 = v3;
        uint64_t v30 = v29;
        unint64_t v32 = v31;

        uint64_t v58 = sub_2411B6898(v30, v32, &v62);
        sub_241632C28();

        swift_bridgeObjectRelease();
        *(_WORD *)(v26 + 12) = 2080;
        uint64_t v19 = &selRef_mainScreen;
        objc_msgSend(v23, sel_contentInset);
        uint64_t v58 = v33;
        uint64_t v59 = v34;
        uint64_t v60 = v35;
        uint64_t v61 = v36;
        type metadata accessor for UIEdgeInsets(0);
        uint64_t v37 = sub_241631D48();
        uint64_t v58 = sub_2411B6898(v37, v38, &v62);
        sub_241632C28();

        swift_bridgeObjectRelease();
        os_log_t v39 = v51;
        _os_log_impl(&dword_24118E000, v51, (os_log_type_t)v55, "[%{public}s] New collection view contentInset: %s", (uint8_t *)v26, 0x16u);
        uint64_t v40 = v53;
        swift_arrayDestroy();
        MEMORY[0x245621640](v40, -1, -1);
        uint64_t v41 = v26;
        os_log_type_t v9 = &selRef_numberOfComponentsInPickerView_;
        MEMORY[0x245621640](v41, -1, -1);

        (*(void (**)(char *, uint64_t))(v52 + 8))(v5, v54);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        uint64_t v19 = &selRef_mainScreen;
      }
      uint64_t v17 = (double *)v56;
      long long v13 = v57;
    }
    objc_msgSend(v8, sel_contentOffset);
    float64x2_t v44 = 0uLL;
    if (v18[16] & 1) != 0 || (v13[8])
    {
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      char v47 = 1;
    }
    else
    {
      char v47 = 0;
      uint64_t v46 = *(void *)v13;
      v42.f64[1] = v43;
      float64x2_t v44 = vaddq_f64(v42, *(float64x2_t *)v18);
      uint64_t v45 = *((void *)v17 + 4);
    }
    uint64_t v48 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomArea];
    *(float64x2_t *)uint64_t v48 = v44;
    *((void *)v48 + 2) = v45;
    *((void *)v48 + 3) = v46;
    v48[32] = v47;
    id v49 = v8;
    [v49 v9[110]];
    CGRectGetWidth(v64);
    [v49 v19[126]];
    objc_msgSend(v49, sel_setContentInset_);
  }
}

void (*sub_241629688(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5))(void *, void)
{
  uint64_t v11 = sub_24162BB18();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v38 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v35 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v35 - v18;
  v40.origin.CGFloat x = a2;
  v40.origin.CGFloat y = a3;
  v40.size.CGFloat width = a4;
  v40.size.CGFloat height = a5;
  double MinX = CGRectGetMinX(v40);
  v41.origin.CGFloat x = a2;
  v41.origin.CGFloat y = a3;
  v41.size.CGFloat width = a4;
  v41.size.CGFloat height = a5;
  CGRectGetMinY(v41);
  id v36 = a1;
  uint64_t v37 = v5;
  sub_24162A348(a1, MinX);
  id v21 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v22 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v35 = v12 + 32;
  unint64_t v23 = MEMORY[0x263F8EE78];
  while (1)
  {
    v21(v16, v19, v11);
    sub_24162A614((uint64_t)v16, (uint64_t)v39);
    CGFloat v24 = *(double *)v39;
    CGFloat v25 = *(double *)&v39[1];
    CGFloat v26 = *(double *)&v39[2];
    CGFloat v27 = *(double *)&v39[3];
    id v28 = *v22;
    (*v22)(v16, v11);
    v42.origin.CGFloat x = v24;
    v42.origin.CGFloat y = v25;
    v42.size.CGFloat width = v26;
    v42.size.CGFloat height = v27;
    double v29 = CGRectGetMinX(v42);
    v43.origin.CGFloat x = a2;
    v43.origin.CGFloat y = a3;
    v43.size.CGFloat width = a4;
    v43.size.CGFloat height = a5;
    if (v29 > CGRectGetMaxX(v43)
      || (uint64_t v30 = sub_24162BAF8(), v30 >= (uint64_t)objc_msgSend(v36, sel_numberOfItemsInSection_, 0, v35)))
    {
      v28(v19, v11);
      return (void (*)(void *, void))v23;
    }
    v21(v38, v19, v11);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v23 = sub_24158D060(0, *(void *)(v23 + 16) + 1, 1, v23);
    }
    unint64_t v32 = *(void *)(v23 + 16);
    unint64_t v31 = *(void *)(v23 + 24);
    if (v32 >= v31 >> 1) {
      unint64_t v23 = sub_24158D060(v31 > 1, v32 + 1, 1, v23);
    }
    *(void *)(v23 + 16) = v32 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v23+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v32, v38, v11);
    uint64_t result = (void (*)(void *, void))sub_24162BAE8();
    if (__OFADD__(*v34, 1)) {
      break;
    }
    ++*v34;
    result(v39, 0);
  }
  __break(1u);
  return result;
}

char *sub_241629AC4(uint64_t a1)
{
  uint64_t v3 = sub_24162BB18();
  uint64_t v4 = *(void *)(v3 - 8);
  *(void *)&double v5 = MEMORY[0x270FA5388](v3).n128_u64[0];
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(v1, sel_collectionView, v5);
  if (!v8) {
    return 0;
  }
  os_log_type_t v9 = v8;
  uint64_t v10 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_computedAttributes];
  swift_beginAccess();
  uint64_t v11 = *(void *)v10;
  if (*(void *)(*(void *)v10 + 16))
  {
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    unint64_t v12 = sub_2415457BC(a1);
    if (v13)
    {
      uint64_t v14 = *(char **)(*(void *)(v11 + 56) + 8 * v12);
      uint64_t v15 = v14;

      swift_bridgeObjectRelease();
      return v14;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = sub_241629CF4(v9, a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  swift_beginAccess();
  if (v14)
  {
    uint64_t v16 = v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *(void *)v10;
    *(void *)uint64_t v10 = 0x8000000000000000;
    sub_241349F58((uint64_t)v16, (uint64_t)v7, isUniquelyReferenced_nonNull_native);
    *(void *)uint64_t v10 = v21;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  else
  {
    uint64_t v18 = (void *)sub_2412B633C((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  swift_endAccess();

  return v14;
}

char *sub_241629CF4(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24162BAF8();
  id v7 = objc_msgSend(a1, sel_numberOfItemsInSection_, 0);
  id v8 = 0;
  if (v6 < (uint64_t)v7)
  {
    type metadata accessor for CycleTimelineCollectionViewLayoutAttributes();
    os_log_type_t v9 = (void *)sub_24162BA88();
    id v8 = (char *)objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_layoutAttributesForCellWithIndexPath_, v9);

    sub_24162A614(a2, (uint64_t)v13);
    double v10 = v13[4];
    char v11 = v14;
    objc_msgSend(v8, sel_setFrame_, v13[0], v13[1], v13[2], v13[3]);
    memmove(&v8[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes_configuration], (const void *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config), 0x98uLL);
    if ((v11 & 1) == 0) {
      *(double *)&v8[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes_zoomLevel] = v10;
    }
  }
  return v8;
}

uint64_t sub_241629F0C(void *a1)
{
  v16.receiver = v1;
  v16.super_class = (Class)type metadata accessor for CycleTimelineCollectionViewLayout();
  objc_msgSendSuper2(&v16, sel_invalidateLayoutWithContext_, a1);
  type metadata accessor for CycleTimelineCollectionViewLayoutInvalidationContext();
  uint64_t result = swift_dynamicCastClass();
  if (result)
  {
    uint64_t v4 = (void *)result;
    if (*(unsigned char *)(result
                  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateForHorizontalSizeChanges) == 1)
    {
      double v5 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight];
      *(void *)double v5 = 0;
      v5[8] = 1;
      uint64_t v6 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize];
      *(void *)uint64_t v6 = 0;
      *((void *)v6 + 1) = 0;
      v6[16] = 1;
      id v7 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomArea];
      *(_OWORD *)id v7 = 0u;
      *((_OWORD *)v7 + 1) = 0u;
      v7[32] = 1;
      id v8 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomAreaOffset];
      *(void *)id v8 = 0;
      *((void *)v8 + 1) = 0;
      v8[16] = 1;
    }
    id v9 = a1;
    if (objc_msgSend(v4, sel_invalidateEverything))
    {
      double v10 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomArea];
      *(_OWORD *)double v10 = 0u;
      *((_OWORD *)v10 + 1) = 0u;
      v10[32] = 1;
    }
    if ((objc_msgSend(v4, sel_invalidateEverything) & 1) != 0
      || objc_msgSend(v4, sel_invalidateDataSourceCounts))
    {
      char v11 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize];
      *(void *)char v11 = 0;
      *((void *)v11 + 1) = 0;
      unsigned char v11[16] = 1;
    }
    if ((objc_msgSend(v4, sel_invalidateEverything) & 1) != 0
      || *((unsigned char *)v4
         + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateItemHeight) == 1)
    {
      unint64_t v12 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight];
      *(void *)unint64_t v12 = 0;
      v12[8] = 1;
    }
    if ((objc_msgSend(v4, sel_invalidateEverything) & 1) != 0
      || *((unsigned char *)v4
         + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateZoomArea) == 1)
    {
      char v13 = &v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomAreaOffset];
      *(void *)char v13 = 0;
      *((void *)v13 + 1) = 0;
      unsigned char v13[16] = 1;
    }
    unint64_t v14 = sub_2414E4A94(MEMORY[0x263F8EE78]);
    uint64_t v15 = (unint64_t *)&v1[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_computedAttributes];
    swift_beginAccess();
    *uint64_t v15 = v14;

    return swift_bridgeObjectRelease();
  }
  return result;
}

unsigned char *sub_24162A184(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CycleTimelineCollectionViewLayoutInvalidationContext()), sel_init);
  id v10 = objc_msgSend(v4, sel_collectionView);
  if (v10)
  {
    char v11 = v10;
    objc_msgSend(v10, sel_bounds);
    if (v14 == a3 && v15 == a4)
    {
    }
    else
    {
      CGFloat v17 = v12;
      CGFloat v18 = v13;
      CGFloat v19 = v14;
      CGFloat v20 = v15;
      CGFloat Height = CGRectGetHeight(*(CGRect *)&v12);
      v27.origin.CGFloat y = a2;
      double v22 = Height;
      v27.origin.CGFloat x = a1;
      CGFloat rect = v27.origin.y;
      v27.size.CGFloat width = a3;
      v27.size.CGFloat height = a4;
      if (v22 != CGRectGetHeight(v27)) {
        v9[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateItemHeight] = 1;
      }
      v28.origin.CGFloat x = v17;
      v28.origin.CGFloat y = v18;
      v28.size.CGFloat width = v19;
      v28.size.CGFloat height = v20;
      double Width = CGRectGetWidth(v28);
      v29.origin.CGFloat x = a1;
      v29.origin.CGFloat y = rect;
      v29.size.CGFloat width = a3;
      v29.size.CGFloat height = a4;
      double v24 = CGRectGetWidth(v29);

      if (Width != v24) {
        v9[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateZoomArea] = 1;
      }
    }
  }
  return v9;
}

void sub_24162A348(void *a1, double a2)
{
  double v3 = *(double *)(v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config + 8)
     + *(double *)(v2 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config + 32);
  if (v3 == 0.0) {
    goto LABEL_6;
  }
  double v4 = floor(a2 / v3);
  if ((~*(void *)&v4 & 0x7FF0000000000000) != 0)
  {
    if (v4 > -9.22337204e18)
    {
      if (v4 < 9.22337204e18)
      {
        if (!__OFSUB__(objc_msgSend(a1, sel_numberOfItemsInSection_, 0), 1))
        {
LABEL_6:
LABEL_13:
          JUMPOUT(0x245618FA0);
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  goto LABEL_11;
}

id sub_24162A5AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CycleTimelineCollectionViewLayout();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CycleTimelineCollectionViewLayout()
{
  return self;
}

void sub_24162A614(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  CGFloat v12 = (char *)&v46 - v11;
  double v13 = (double *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config);
  double v14 = *(double *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config + 8);
  double v15 = *(double *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_config + 32);
  uint64_t v16 = sub_24162BAF8();
  double v17 = (v14 + v15) * (double)v16;
  double v18 = v13[4];
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight + 8)) {
    double v19 = 0.0;
  }
  else {
    double v19 = *(double *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight);
  }
  CGFloat v20 = (CGFloat *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomArea);
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomArea + 32))
  {
    double v21 = 0.0;
    char v22 = 1;
LABEL_18:
    *(double *)a2 = v17;
    *(void *)(a2 + 8) = 0;
    *(double *)(a2 + 16) = v18;
    *(double *)(a2 + 24) = v19;
    *(double *)(a2 + 32) = v21;
    *(unsigned char *)(a2 + 40) = v22;
    return;
  }
  CGFloat v24 = v20[2];
  CGFloat v23 = v20[3];
  CGFloat v25 = *v20;
  CGFloat v26 = v20[1];
  uint64_t v27 = 0;
  v52.origin.double x = *v20;
  v52.origin.CGFloat y = v26;
  v52.size.CGFloat width = v24;
  v52.size.CGFloat height = v23;
  double v28 = (v14 + v15) * (double)v16;
  double v48 = v19;
  double v49 = v18;
  CGRect v53 = CGRectIntersection(v52, *(CGRect *)(&v18 - 2));
  double x = v53.origin.x;
  CGFloat y = v53.origin.y;
  CGFloat width = v53.size.width;
  CGFloat height = v53.size.height;
  if (CGRectIsNull(v53))
  {
    v54.origin.double x = v25;
    v54.origin.CGFloat y = v26;
    v54.size.CGFloat width = v24;
    v54.size.CGFloat height = v23;
    if (CGRectGetMaxX(v54) <= v17)
    {
      double v17 = v17 + v13[8] + 2.0;
      *(void *)&double v21 = 1;
    }
    else
    {
      double v21 = 0.0;
    }
    char v22 = 1;
    double v18 = v49;
LABEL_16:
    double v19 = v48;
    goto LABEL_18;
  }
  double v46 = v17;
  v55.origin.double x = v25;
  v55.origin.CGFloat y = v26;
  v55.size.CGFloat width = v24;
  v55.size.CGFloat height = v23;
  if (CGRectGetMinX(v55) >= x)
  {
    v58.origin.double x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    CGFloat v44 = CGRectGetWidth(v58);
    char v22 = 0;
    double v45 = v44 / v13[4];
    double v19 = v48;
    double v18 = v49 + v45 * (v13[8] + 2.0);
    double v21 = v45;
    double v17 = v46;
    goto LABEL_18;
  }
  unint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v32(v12, a1, v6);
  uint64_t v33 = (void (*)(void *, void))sub_24162BAE8();
  if (!__OFSUB__(*v34, 1))
  {
    --*v34;
    v33(v50, 0);
    v32(v9, (uint64_t)v12, v6);
    sub_24162A614(v50, v9);
    CGFloat v35 = *(double *)v50;
    CGFloat v36 = *(double *)&v50[1];
    CGFloat v37 = *(double *)&v50[2];
    CGFloat v38 = *(double *)&v50[3];
    double v39 = *(double *)&v50[4];
    int v40 = v51;
    CGRect v41 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41(v9, v6);
    v56.origin.double x = v35;
    v56.origin.CGFloat y = v36;
    v56.size.CGFloat width = v37;
    v56.size.CGFloat height = v38;
    double v17 = CGRectGetMaxX(v56) + v13[1];
    double v42 = v13[4] + v13[8] + 2.0;
    v57.origin.double x = v35;
    v57.origin.CGFloat y = v36;
    v57.size.CGFloat width = v37;
    v57.size.CGFloat height = v38;
    double v43 = CGRectGetWidth(v57);
    v41(v12, v6);
    char v22 = 0;
    double v18 = v49 + v42 - v43;
    double v21 = 1.0 - v39;
    if (v40) {
      double v21 = 1.0;
    }
    goto LABEL_16;
  }
  __break(1u);
}

uint64_t sub_24162A9B4(uint64_t a1, void *a2)
{
  id v28 = a2;
  uint64_t v3 = sub_24162BB18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v27 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241227EB0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v9 = *(void *)(a1 + 16);
  v20[2] = a1;
  if (v9)
  {
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v10 = v4 + 16;
    CGFloat v26 = v11;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v23 = *(void *)(v10 + 56);
    CGFloat v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 32);
    double v21 = (uint64_t (**)(char *, uint64_t))(v10 - 8);
    char v22 = (void (**)(char *, char *, uint64_t))(v10 + 16);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    CGFloat v25 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 40);
    v20[1] = (v10 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      v26(v8, v12, v3);
      double v13 = *v25;
      (*v25)(v8, 0, 1, v3);
      if ((*v24)(v8, 1, v3) == 1) {
        break;
      }
      double v14 = v27;
      (*v22)(v27, v8, v3);
      double v15 = (void *)sub_24162BA88();
      id v16 = objc_msgSend(v28, sel_layoutAttributesForItemAtIndexPath_, v15);

      uint64_t v17 = (*v21)(v14, v3);
      if (v16)
      {
        MEMORY[0x24561F3D0](v17);
        if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_241631F68();
        }
        sub_241631F98();
        sub_241631F48();
      }
      v12 += v23;
      if (!--v9)
      {
        v13(v8, 1, 1, v3);
        break;
      }
    }
  }
  else
  {
    double v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    v18(v8, 1, 1, v3);
  }
  swift_bridgeObjectRelease();
  return v29;
}

void sub_24162AC90()
{
  id v1 = &v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_itemHeight];
  *(void *)id v1 = 0;
  v1[8] = 1;
  uint64_t v2 = &v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  v2[16] = 1;
  uint64_t v3 = &v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomAreaOffset];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = &v0[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_zoomArea];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_computedAttributes;
  *(void *)&v0[v5] = sub_2414E4A94(MEMORY[0x263F8EE78]);

  sub_241633038();
  __break(1u);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24162AD88()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_24162AD98()
{
  return MEMORY[0x270EEDCF8]();
}

uint64_t sub_24162ADA8()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_24162ADB8()
{
  return MEMORY[0x270EEDD28]();
}

uint64_t sub_24162ADC8()
{
  return MEMORY[0x270EEDD38]();
}

uint64_t sub_24162ADD8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24162ADE8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24162ADF8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24162AE08()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24162AE18()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24162AE28()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24162AE38()
{
  return MEMORY[0x270EEDF50]();
}

uint64_t sub_24162AE48()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_24162AE58()
{
  return MEMORY[0x270EEDFF0]();
}

uint64_t sub_24162AE68()
{
  return MEMORY[0x270EEE058]();
}

uint64_t sub_24162AE78()
{
  return MEMORY[0x270EEE068]();
}

uint64_t sub_24162AE88()
{
  return MEMORY[0x270EEE070]();
}

uint64_t sub_24162AE98()
{
  return MEMORY[0x270EEE2C8]();
}

uint64_t sub_24162AEA8()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_24162AEB8()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_24162AEC8()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_24162AED8()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_24162AEE8()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_24162AEF8()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_24162AF08()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24162AF18()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_24162AF28()
{
  return MEMORY[0x270EEE390]();
}

uint64_t sub_24162AF38()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24162AF48()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_24162AF58()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_24162AF68()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_24162AF78()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_24162AF88()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_24162AF98()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_24162AFA8()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_24162AFB8()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_24162AFC8()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_24162AFD8()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_24162AFF8()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_24162B008()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_24162B018()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_24162B028()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24162B038()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24162B048()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24162B058()
{
  return MEMORY[0x270EEE700]();
}

uint64_t sub_24162B068()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_24162B078()
{
  return MEMORY[0x270EEE748]();
}

uint64_t sub_24162B088()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_24162B098()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_24162B0A8()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_24162B0B8()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_24162B0C8()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_24162B0D8()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_24162B0E8()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_24162B0F8()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_24162B108()
{
  return MEMORY[0x270EEE870]();
}

uint64_t sub_24162B118()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_24162B128()
{
  return MEMORY[0x270EEE8B0]();
}

uint64_t sub_24162B138()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24162B148()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24162B158()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_24162B168()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24162B178()
{
  return MEMORY[0x270EEE980]();
}

uint64_t sub_24162B188()
{
  return MEMORY[0x270EEE9A8]();
}

uint64_t sub_24162B198()
{
  return MEMORY[0x270F816C0]();
}

uint64_t sub_24162B1A8()
{
  return MEMORY[0x270F816C8]();
}

uint64_t sub_24162B1B8()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_24162B1C8()
{
  return MEMORY[0x270EEEC10]();
}

uint64_t sub_24162B1D8()
{
  return MEMORY[0x270EEEC18]();
}

uint64_t sub_24162B1E8()
{
  return MEMORY[0x270EEEC20]();
}

uint64_t sub_24162B1F8()
{
  return MEMORY[0x270EEEC28]();
}

uint64_t sub_24162B208()
{
  return MEMORY[0x270EEED68]();
}

uint64_t sub_24162B218()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24162B228()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_24162B238()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_24162B248()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_24162B258()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_24162B268()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_24162B278()
{
  return MEMORY[0x270EEF318]();
}

uint64_t sub_24162B288()
{
  return MEMORY[0x270EEF388]();
}

uint64_t sub_24162B298()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_24162B2A8()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_24162B318()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_24162B328()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_24162B338()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24162B348()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24162B358()
{
  return MEMORY[0x270EEF938]();
}

uint64_t sub_24162B368()
{
  return MEMORY[0x270EEF950]();
}

uint64_t sub_24162B378()
{
  return MEMORY[0x270EEF9B8]();
}

uint64_t sub_24162B388()
{
  return MEMORY[0x270EEF9D0]();
}

uint64_t sub_24162B398()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_24162B3A8()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_24162B3B8()
{
  return MEMORY[0x270EEFA30]();
}

uint64_t sub_24162B3C8()
{
  return MEMORY[0x270EEFAD0]();
}

uint64_t sub_24162B3D8()
{
  return MEMORY[0x270EEFAE0]();
}

uint64_t sub_24162B3E8()
{
  return MEMORY[0x270EEFB10]();
}

uint64_t sub_24162B3F8()
{
  return MEMORY[0x270EEFB28]();
}

uint64_t sub_24162B408()
{
  return MEMORY[0x270F31B90]();
}

uint64_t sub_24162B418()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_24162B428()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24162B438()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24162B448()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_24162B458()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24162B468()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24162B478()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24162B488()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24162B498()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_24162B4A8()
{
  return MEMORY[0x270EF02E8]();
}

uint64_t sub_24162B4B8()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_24162B4C8()
{
  return MEMORY[0x270EF0330]();
}

uint64_t sub_24162B4D8()
{
  return MEMORY[0x270EF0340]();
}

uint64_t sub_24162B4E8()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_24162B4F8()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_24162B508()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_24162B518()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_24162B528()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_24162B538()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_24162B548()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_24162B558()
{
  return MEMORY[0x270EF0560]();
}

uint64_t sub_24162B568()
{
  return MEMORY[0x270EF0568]();
}

uint64_t sub_24162B578()
{
  return MEMORY[0x270EF0570]();
}

uint64_t sub_24162B588()
{
  return MEMORY[0x270EF0578]();
}

uint64_t sub_24162B598()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_24162B5A8()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_24162B5B8()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_24162B5C8()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_24162B5D8()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_24162B5E8()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_24162B5F8()
{
  return MEMORY[0x270F31BD0]();
}

uint64_t sub_24162B608()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24162B618()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24162B628()
{
  return MEMORY[0x270EF08A8]();
}

uint64_t sub_24162B638()
{
  return MEMORY[0x270EF08C0]();
}

uint64_t sub_24162B648()
{
  return MEMORY[0x270EF08C8]();
}

uint64_t sub_24162B658()
{
  return MEMORY[0x270EF08E0]();
}

uint64_t sub_24162B668()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24162B678()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24162B688()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24162B698()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24162B6A8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24162B6B8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24162B6C8()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_24162B6D8()
{
  return MEMORY[0x270EF0C00]();
}

uint64_t sub_24162B6E8()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_24162B6F8()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_24162B708()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24162B718()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24162B728()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24162B738()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24162B748()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t _s24MenstrualCyclesAppPlugin34ReviewPregnancyInMedicalIDUserDataV23__derived_struct_equalsySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24162B768()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24162B778()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24162B788()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24162B798()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_24162B7A8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_24162B7B8()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_24162B7C8()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_24162B7D8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24162B7E8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24162B7F8()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_24162B808()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_24162B818()
{
  return MEMORY[0x270EF10F0]();
}

uint64_t sub_24162B828()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_24162B838()
{
  return MEMORY[0x270EF1120]();
}

uint64_t sub_24162B848()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_24162B858()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_24162B868()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_24162B878()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_24162B888()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_24162B898()
{
  return MEMORY[0x270EF12B0]();
}

uint64_t sub_24162B8A8()
{
  return MEMORY[0x270F34F08]();
}

uint64_t sub_24162B8B8()
{
  return MEMORY[0x270F34F10]();
}

uint64_t sub_24162B8C8()
{
  return MEMORY[0x270F34F20]();
}

uint64_t sub_24162B8D8()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_24162B8E8()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_24162B8F8()
{
  return MEMORY[0x270EF1328]();
}

uint64_t sub_24162B908()
{
  return MEMORY[0x270EF1330]();
}

uint64_t sub_24162B918()
{
  return MEMORY[0x270EF1340]();
}

uint64_t sub_24162B928()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_24162B938()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_24162B948()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_24162B958()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_24162B968()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24162B978()
{
  return MEMORY[0x270EF13B0]();
}

uint64_t sub_24162B988()
{
  return MEMORY[0x270EF13B8]();
}

uint64_t sub_24162B998()
{
  return MEMORY[0x270EF13C8]();
}

uint64_t sub_24162B9A8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24162B9B8()
{
  return MEMORY[0x270EF13F0]();
}

uint64_t sub_24162B9C8()
{
  return MEMORY[0x270EF1400]();
}

uint64_t sub_24162B9D8()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_24162B9E8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24162B9F8()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_24162BA08()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24162BA18()
{
  return MEMORY[0x270EF1490]();
}

uint64_t sub_24162BA28()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_24162BA38()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_24162BA48()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_24162BA58()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_24162BA68()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_24162BA78()
{
  return MEMORY[0x270EF16D0]();
}

uint64_t sub_24162BA88()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_24162BA98()
{
  return MEMORY[0x270EF16F8]();
}

uint64_t sub_24162BAA8()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_24162BAB8()
{
  return MEMORY[0x270F816E8]();
}

uint64_t sub_24162BAC8()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_24162BAD8()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_24162BAE8()
{
  return MEMORY[0x270F81710]();
}

uint64_t sub_24162BAF8()
{
  return MEMORY[0x270F81718]();
}

uint64_t sub_24162BB08()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_24162BB18()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_24162BB28()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t sub_24162BB38()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_24162BB48()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_24162BB58()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_24162BB68()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_24162BB78()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_24162BB88()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_24162BB98()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_24162BBB8()
{
  return MEMORY[0x270EF17B8]();
}

uint64_t sub_24162BBC8()
{
  return MEMORY[0x270EF17D0]();
}

uint64_t sub_24162BBD8()
{
  return MEMORY[0x270EF17E0]();
}

uint64_t sub_24162BBE8()
{
  return MEMORY[0x270F32640]();
}

uint64_t sub_24162BBF8()
{
  return MEMORY[0x270F32648]();
}

uint64_t sub_24162BC08()
{
  return MEMORY[0x270F32650]();
}

uint64_t sub_24162BC18()
{
  return MEMORY[0x270F73300]();
}

uint64_t sub_24162BC28()
{
  return MEMORY[0x270F73308]();
}

uint64_t sub_24162BC38()
{
  return MEMORY[0x270F73310]();
}

uint64_t sub_24162BC48()
{
  return MEMORY[0x270F733D8]();
}

uint64_t sub_24162BC58()
{
  return MEMORY[0x270F733E0]();
}

uint64_t sub_24162BC68()
{
  return MEMORY[0x270F73400]();
}

uint64_t sub_24162BC78()
{
  return MEMORY[0x270F73408]();
}

uint64_t sub_24162BC88()
{
  return MEMORY[0x270F36168]();
}

uint64_t sub_24162BCA8()
{
  return MEMORY[0x270F36180]();
}

uint64_t sub_24162BCB8()
{
  return MEMORY[0x270F36190]();
}

uint64_t sub_24162BCC8()
{
  return MEMORY[0x270F361B0]();
}

uint64_t sub_24162BCD8()
{
  return MEMORY[0x270F361B8]();
}

uint64_t sub_24162BCE8()
{
  return MEMORY[0x270F361C0]();
}

uint64_t sub_24162BCF8()
{
  return MEMORY[0x270F361C8]();
}

uint64_t sub_24162BD08()
{
  return MEMORY[0x270F361D0]();
}

uint64_t sub_24162BD18()
{
  return MEMORY[0x270F36218]();
}

uint64_t sub_24162BD28()
{
  return MEMORY[0x270F36228]();
}

uint64_t sub_24162BD38()
{
  return MEMORY[0x270F36230]();
}

uint64_t sub_24162BD48()
{
  return MEMORY[0x270F36238]();
}

uint64_t sub_24162BD58()
{
  return MEMORY[0x270F36260]();
}

uint64_t sub_24162BD68()
{
  return MEMORY[0x270F362A0]();
}

uint64_t sub_24162BD78()
{
  return MEMORY[0x270F362A8]();
}

uint64_t sub_24162BD88()
{
  return MEMORY[0x270F362B0]();
}

uint64_t sub_24162BD98()
{
  return MEMORY[0x270F362C0]();
}

uint64_t sub_24162BDA8()
{
  return MEMORY[0x270F36320]();
}

uint64_t sub_24162BDB8()
{
  return MEMORY[0x270F36328]();
}

uint64_t sub_24162BDC8()
{
  return MEMORY[0x270F36338]();
}

uint64_t sub_24162BDD8()
{
  return MEMORY[0x270F36340]();
}

uint64_t sub_24162BDE8()
{
  return MEMORY[0x270F36348]();
}

uint64_t sub_24162BDF8()
{
  return MEMORY[0x270F31BE8]();
}

uint64_t sub_24162BE08()
{
  return MEMORY[0x270F32660]();
}

uint64_t sub_24162BE18()
{
  return MEMORY[0x270F32678]();
}

uint64_t sub_24162BE28()
{
  return MEMORY[0x270F32680]();
}

uint64_t sub_24162BE38()
{
  return MEMORY[0x270F32688]();
}

uint64_t sub_24162BE48()
{
  return MEMORY[0x270F36390]();
}

uint64_t sub_24162BE58()
{
  return MEMORY[0x270F363A8]();
}

uint64_t sub_24162BE68()
{
  return MEMORY[0x270F363B8]();
}

uint64_t sub_24162BE78()
{
  return MEMORY[0x270F363D0]();
}

uint64_t sub_24162BE88()
{
  return MEMORY[0x270F363D8]();
}

uint64_t sub_24162BE98()
{
  return MEMORY[0x270F363E8]();
}

uint64_t sub_24162BEA8()
{
  return MEMORY[0x270F363F8]();
}

uint64_t sub_24162BEB8()
{
  return MEMORY[0x270F36400]();
}

uint64_t sub_24162BEC8()
{
  return MEMORY[0x270F36408]();
}

uint64_t sub_24162BED8()
{
  return MEMORY[0x270F36418]();
}

uint64_t sub_24162BEE8()
{
  return MEMORY[0x270F36420]();
}

uint64_t sub_24162BEF8()
{
  return MEMORY[0x270F36438]();
}

uint64_t sub_24162BF08()
{
  return MEMORY[0x270F36440]();
}

uint64_t sub_24162BF18()
{
  return MEMORY[0x270F36448]();
}

uint64_t sub_24162BF28()
{
  return MEMORY[0x270F36450]();
}

uint64_t sub_24162BF38()
{
  return MEMORY[0x270F36468]();
}

uint64_t sub_24162BF48()
{
  return MEMORY[0x270F36470]();
}

uint64_t sub_24162BF58()
{
  return MEMORY[0x270F36478]();
}

uint64_t sub_24162BF68()
{
  return MEMORY[0x270F36480]();
}

uint64_t sub_24162BF78()
{
  return MEMORY[0x270F36488]();
}

uint64_t sub_24162BF88()
{
  return MEMORY[0x270F36490]();
}

uint64_t sub_24162BF98()
{
  return MEMORY[0x270F36498]();
}

uint64_t sub_24162BFA8()
{
  return MEMORY[0x270F364A0]();
}

uint64_t sub_24162BFB8()
{
  return MEMORY[0x270F364B0]();
}

uint64_t sub_24162BFC8()
{
  return MEMORY[0x270F364B8]();
}

uint64_t sub_24162BFD8()
{
  return MEMORY[0x270F364C0]();
}

uint64_t sub_24162BFE8()
{
  return MEMORY[0x270F364C8]();
}

uint64_t sub_24162BFF8()
{
  return MEMORY[0x270F364D8]();
}

uint64_t sub_24162C008()
{
  return MEMORY[0x270F364F0]();
}

uint64_t sub_24162C018()
{
  return MEMORY[0x270F36500]();
}

uint64_t sub_24162C028()
{
  return MEMORY[0x270F31BF0]();
}

uint64_t sub_24162C038()
{
  return MEMORY[0x270F36528]();
}

uint64_t sub_24162C048()
{
  return MEMORY[0x270F36538]();
}

uint64_t sub_24162C058()
{
  return MEMORY[0x270F36540]();
}

uint64_t sub_24162C068()
{
  return MEMORY[0x270F36560]();
}

uint64_t sub_24162C078()
{
  return MEMORY[0x270F36570]();
}

uint64_t sub_24162C088()
{
  return MEMORY[0x270F36578]();
}

uint64_t sub_24162C098()
{
  return MEMORY[0x270F36588]();
}

uint64_t sub_24162C0A8()
{
  return MEMORY[0x270F36590]();
}

uint64_t sub_24162C0B8()
{
  return MEMORY[0x270F365A0]();
}

uint64_t sub_24162C0D8()
{
  return MEMORY[0x270F30EC8]();
}

uint64_t sub_24162C0E8()
{
  return MEMORY[0x270F365D8]();
}

uint64_t sub_24162C0F8()
{
  return MEMORY[0x270F365F0]();
}

uint64_t sub_24162C108()
{
  return MEMORY[0x270F365F8]();
}

uint64_t sub_24162C118()
{
  return MEMORY[0x270F36600]();
}

uint64_t sub_24162C128()
{
  return MEMORY[0x270F36608]();
}

uint64_t sub_24162C138()
{
  return MEMORY[0x270F36610]();
}

uint64_t sub_24162C148()
{
  return MEMORY[0x270F36618]();
}

uint64_t sub_24162C158()
{
  return MEMORY[0x270F36620]();
}

uint64_t sub_24162C168()
{
  return MEMORY[0x270F36628]();
}

uint64_t sub_24162C178()
{
  return MEMORY[0x270F36630]();
}

uint64_t sub_24162C188()
{
  return MEMORY[0x270F36638]();
}

uint64_t sub_24162C198()
{
  return MEMORY[0x270F36640]();
}

uint64_t sub_24162C1A8()
{
  return MEMORY[0x270F36650]();
}

uint64_t sub_24162C1B8()
{
  return MEMORY[0x270F36658]();
}

uint64_t sub_24162C1C8()
{
  return MEMORY[0x270F36660]();
}

uint64_t sub_24162C1D8()
{
  return MEMORY[0x270F366D8]();
}

uint64_t sub_24162C1E8()
{
  return MEMORY[0x270F366F0]();
}

uint64_t sub_24162C208()
{
  return MEMORY[0x270F36728]();
}

uint64_t sub_24162C218()
{
  return MEMORY[0x270F367C8]();
}

uint64_t sub_24162C228()
{
  return MEMORY[0x270F367D0]();
}

uint64_t sub_24162C238()
{
  return MEMORY[0x270F36820]();
}

uint64_t sub_24162C248()
{
  return MEMORY[0x270F36848]();
}

uint64_t sub_24162C258()
{
  return MEMORY[0x270F36850]();
}

uint64_t sub_24162C268()
{
  return MEMORY[0x270F36870]();
}

uint64_t sub_24162C278()
{
  return MEMORY[0x270F368A8]();
}

uint64_t sub_24162C288()
{
  return MEMORY[0x270F368C8]();
}

uint64_t sub_24162C298()
{
  return MEMORY[0x270F368D8]();
}

uint64_t sub_24162C2A8()
{
  return MEMORY[0x270F368F0]();
}

uint64_t sub_24162C2B8()
{
  return MEMORY[0x270F36908]();
}

uint64_t sub_24162C2C8()
{
  return MEMORY[0x270F36910]();
}

uint64_t sub_24162C2D8()
{
  return MEMORY[0x270F36928]();
}

uint64_t sub_24162C2E8()
{
  return MEMORY[0x270F36930]();
}

uint64_t sub_24162C2F8()
{
  return MEMORY[0x270F36948]();
}

uint64_t sub_24162C308()
{
  return MEMORY[0x270F36960]();
}

uint64_t sub_24162C318()
{
  return MEMORY[0x270F36970]();
}

uint64_t sub_24162C328()
{
  return MEMORY[0x270F36978]();
}

uint64_t sub_24162C338()
{
  return MEMORY[0x270F36980]();
}

uint64_t sub_24162C348()
{
  return MEMORY[0x270F36988]();
}

uint64_t sub_24162C358()
{
  return MEMORY[0x270F36990]();
}

uint64_t sub_24162C368()
{
  return MEMORY[0x270F36998]();
}

uint64_t sub_24162C378()
{
  return MEMORY[0x270F369A0]();
}

uint64_t sub_24162C388()
{
  return MEMORY[0x270F369B0]();
}

uint64_t sub_24162C398()
{
  return MEMORY[0x270F369B8]();
}

uint64_t sub_24162C3A8()
{
  return MEMORY[0x270F369C0]();
}

uint64_t sub_24162C3B8()
{
  return MEMORY[0x270F369C8]();
}

uint64_t sub_24162C3C8()
{
  return MEMORY[0x270F369D0]();
}

uint64_t sub_24162C3D8()
{
  return MEMORY[0x270F369E0]();
}

uint64_t sub_24162C3E8()
{
  return MEMORY[0x270F36A10]();
}

uint64_t sub_24162C3F8()
{
  return MEMORY[0x270F36A28]();
}

uint64_t sub_24162C408()
{
  return MEMORY[0x270F36A50]();
}

uint64_t sub_24162C418()
{
  return MEMORY[0x270F36A58]();
}

uint64_t sub_24162C428()
{
  return MEMORY[0x270F36A60]();
}

uint64_t sub_24162C438()
{
  return MEMORY[0x270F36A68]();
}

uint64_t sub_24162C448()
{
  return MEMORY[0x270F36A70]();
}

uint64_t sub_24162C458()
{
  return MEMORY[0x270F36AA0]();
}

uint64_t sub_24162C468()
{
  return MEMORY[0x270F36AB8]();
}

uint64_t sub_24162C478()
{
  return MEMORY[0x270F36AC8]();
}

uint64_t sub_24162C488()
{
  return MEMORY[0x270F36AF8]();
}

uint64_t sub_24162C498()
{
  return MEMORY[0x270F36B28]();
}

uint64_t sub_24162C4A8()
{
  return MEMORY[0x270F36B30]();
}

uint64_t sub_24162C4B8()
{
  return MEMORY[0x270F36B38]();
}

uint64_t sub_24162C4C8()
{
  return MEMORY[0x270F36B40]();
}

uint64_t sub_24162C4D8()
{
  return MEMORY[0x270F36B50]();
}

uint64_t sub_24162C4E8()
{
  return MEMORY[0x270F36B60]();
}

uint64_t sub_24162C4F8()
{
  return MEMORY[0x270F36B70]();
}

uint64_t sub_24162C508()
{
  return MEMORY[0x270F36B80]();
}

uint64_t sub_24162C518()
{
  return MEMORY[0x270F36B88]();
}

uint64_t sub_24162C528()
{
  return MEMORY[0x270F36B90]();
}

uint64_t sub_24162C538()
{
  return MEMORY[0x270F36BA0]();
}

uint64_t sub_24162C548()
{
  return MEMORY[0x270F36C08]();
}

uint64_t sub_24162C558()
{
  return MEMORY[0x270F36C38]();
}

uint64_t sub_24162C568()
{
  return MEMORY[0x270F36C40]();
}

uint64_t sub_24162C578()
{
  return MEMORY[0x270F36C48]();
}

uint64_t sub_24162C588()
{
  return MEMORY[0x270F36CB8]();
}

uint64_t sub_24162C598()
{
  return MEMORY[0x270F36CC0]();
}

uint64_t sub_24162C5A8()
{
  return MEMORY[0x270F36CC8]();
}

uint64_t sub_24162C5B8()
{
  return MEMORY[0x270F36CD0]();
}

uint64_t sub_24162C5C8()
{
  return MEMORY[0x270F36CD8]();
}

uint64_t sub_24162C5D8()
{
  return MEMORY[0x270F36CE0]();
}

uint64_t sub_24162C5E8()
{
  return MEMORY[0x270F36D18]();
}

uint64_t sub_24162C5F8()
{
  return MEMORY[0x270F36D28]();
}

uint64_t sub_24162C608()
{
  return MEMORY[0x270F36D30]();
}

uint64_t sub_24162C618()
{
  return MEMORY[0x270F36D38]();
}

uint64_t sub_24162C628()
{
  return MEMORY[0x270F36D40]();
}

uint64_t sub_24162C658()
{
  return MEMORY[0x270F32698]();
}

uint64_t sub_24162C668()
{
  return MEMORY[0x270F36FD0]();
}

uint64_t sub_24162C678()
{
  return MEMORY[0x270F36FD8]();
}

uint64_t sub_24162C688()
{
  return MEMORY[0x270F36FE0]();
}

uint64_t sub_24162C698()
{
  return MEMORY[0x270F36FE8]();
}

uint64_t sub_24162C6A8()
{
  return MEMORY[0x270F36FF8]();
}

uint64_t sub_24162C6B8()
{
  return MEMORY[0x270F37008]();
}

uint64_t sub_24162C6C8()
{
  return MEMORY[0x270F37010]();
}

uint64_t sub_24162C6D8()
{
  return MEMORY[0x270F36DC8]();
}

uint64_t sub_24162C6E8()
{
  return MEMORY[0x270F36DD0]();
}

uint64_t sub_24162C6F8()
{
  return MEMORY[0x270F36DD8]();
}

uint64_t sub_24162C708()
{
  return MEMORY[0x270F36DE8]();
}

uint64_t sub_24162C718()
{
  return MEMORY[0x270F4A538]();
}

uint64_t sub_24162C728()
{
  return MEMORY[0x270F4A540]();
}

uint64_t sub_24162C738()
{
  return MEMORY[0x270F4A550]();
}

uint64_t sub_24162C748()
{
  return MEMORY[0x270F4A558]();
}

uint64_t sub_24162C758()
{
  return MEMORY[0x270F376B8]();
}

uint64_t sub_24162C768()
{
  return MEMORY[0x270F30F10]();
}

uint64_t sub_24162C778()
{
  return MEMORY[0x270F30F18]();
}

uint64_t sub_24162C788()
{
  return MEMORY[0x270F30F28]();
}

uint64_t sub_24162C798()
{
  return MEMORY[0x270F30F30]();
}

uint64_t sub_24162C7A8()
{
  return MEMORY[0x270F30F60]();
}

uint64_t sub_24162C7B8()
{
  return MEMORY[0x270F30F78]();
}

uint64_t sub_24162C7C8()
{
  return MEMORY[0x270F30F88]();
}

uint64_t sub_24162C7D8()
{
  return MEMORY[0x270F30F90]();
}

uint64_t sub_24162C7E8()
{
  return MEMORY[0x270F30FB0]();
}

uint64_t sub_24162C7F8()
{
  return MEMORY[0x270F30FB8]();
}

uint64_t sub_24162C808()
{
  return MEMORY[0x270F31D70]();
}

uint64_t sub_24162C818()
{
  return MEMORY[0x270F31D80]();
}

uint64_t sub_24162C828()
{
  return MEMORY[0x270F31DA8]();
}

uint64_t sub_24162C838()
{
  return MEMORY[0x270F31DE8]();
}

uint64_t sub_24162C848()
{
  return MEMORY[0x270F31DF0]();
}

uint64_t sub_24162C858()
{
  return MEMORY[0x270F31E68]();
}

uint64_t sub_24162C868()
{
  return MEMORY[0x270F31E88]();
}

uint64_t sub_24162C878()
{
  return MEMORY[0x270F31EB0]();
}

uint64_t sub_24162C888()
{
  return MEMORY[0x270F31EB8]();
}

uint64_t sub_24162C898()
{
  return MEMORY[0x270F32108]();
}

uint64_t sub_24162C8A8()
{
  return MEMORY[0x270F32170]();
}

uint64_t sub_24162C8B8()
{
  return MEMORY[0x270F321C0]();
}

uint64_t sub_24162C8C8()
{
  return MEMORY[0x270F321D0]();
}

uint64_t sub_24162C8D8()
{
  return MEMORY[0x270F321D8]();
}

uint64_t sub_24162C8E8()
{
  return MEMORY[0x270F322B8]();
}

uint64_t sub_24162C8F8()
{
  return MEMORY[0x270F322C0]();
}

uint64_t sub_24162C908()
{
  return MEMORY[0x270F32308]();
}

uint64_t sub_24162C918()
{
  return MEMORY[0x270F32330]();
}

uint64_t sub_24162C928()
{
  return MEMORY[0x270F32440]();
}

uint64_t sub_24162C938()
{
  return MEMORY[0x270F32448]();
}

uint64_t sub_24162C948()
{
  return MEMORY[0x270F32450]();
}

uint64_t sub_24162C958()
{
  return MEMORY[0x270F32458]();
}

uint64_t sub_24162C968()
{
  return MEMORY[0x270F32460]();
}

uint64_t sub_24162C978()
{
  return MEMORY[0x270F370D0]();
}

uint64_t sub_24162C988()
{
  return MEMORY[0x270F370D8]();
}

uint64_t sub_24162C998()
{
  return MEMORY[0x270F30E18]();
}

uint64_t sub_24162C9A8()
{
  return MEMORY[0x270F30E98]();
}

uint64_t sub_24162C9B8()
{
  return MEMORY[0x270F30EA0]();
}

uint64_t sub_24162C9C8()
{
  return MEMORY[0x270F30EA8]();
}

uint64_t sub_24162C9D8()
{
  return MEMORY[0x270F30EB0]();
}

uint64_t sub_24162C9E8()
{
  return MEMORY[0x270F30EB8]();
}

uint64_t sub_24162C9F8()
{
  return MEMORY[0x270F326D8]();
}

uint64_t sub_24162CA08()
{
  return MEMORY[0x270F326E0]();
}

uint64_t sub_24162CA28()
{
  return MEMORY[0x270F32700]();
}

uint64_t sub_24162CA38()
{
  return MEMORY[0x270F32780]();
}

uint64_t sub_24162CA48()
{
  return MEMORY[0x270F32798]();
}

uint64_t sub_24162CA58()
{
  return MEMORY[0x270F327A0]();
}

uint64_t sub_24162CA68()
{
  return MEMORY[0x270F327A8]();
}

uint64_t sub_24162CA78()
{
  return MEMORY[0x270F327B8]();
}

uint64_t sub_24162CA88()
{
  return MEMORY[0x270F327D8]();
}

uint64_t sub_24162CA98()
{
  return MEMORY[0x270F32820]();
}

uint64_t sub_24162CAA8()
{
  return MEMORY[0x270F32828]();
}

uint64_t sub_24162CAB8()
{
  return MEMORY[0x270F32830]();
}

uint64_t sub_24162CAC8()
{
  return MEMORY[0x270F328A8]();
}

uint64_t sub_24162CAD8()
{
  return MEMORY[0x270F328B0]();
}

uint64_t sub_24162CAE8()
{
  return MEMORY[0x270F328B8]();
}

uint64_t sub_24162CAF8()
{
  return MEMORY[0x270F328E8]();
}

uint64_t sub_24162CB08()
{
  return MEMORY[0x270F328F0]();
}

uint64_t sub_24162CB18()
{
  return MEMORY[0x270F328F8]();
}

uint64_t sub_24162CB28()
{
  return MEMORY[0x270F32900]();
}

uint64_t sub_24162CB38()
{
  return MEMORY[0x270F32910]();
}

uint64_t sub_24162CB48()
{
  return MEMORY[0x270F32928]();
}

uint64_t sub_24162CB58()
{
  return MEMORY[0x270F32938]();
}

uint64_t sub_24162CB68()
{
  return MEMORY[0x270F32948]();
}

uint64_t sub_24162CB78()
{
  return MEMORY[0x270F32960]();
}

uint64_t sub_24162CB88()
{
  return MEMORY[0x270F32968]();
}

uint64_t sub_24162CB98()
{
  return MEMORY[0x270F32980]();
}

uint64_t sub_24162CBA8()
{
  return MEMORY[0x270F32988]();
}

uint64_t sub_24162CBB8()
{
  return MEMORY[0x270F329B0]();
}

uint64_t sub_24162CBC8()
{
  return MEMORY[0x270F329C0]();
}

uint64_t sub_24162CBD8()
{
  return MEMORY[0x270F329C8]();
}

uint64_t sub_24162CBE8()
{
  return MEMORY[0x270F329D0]();
}

uint64_t sub_24162CBF8()
{
  return MEMORY[0x270F329E8]();
}

uint64_t sub_24162CC08()
{
  return MEMORY[0x270F32A00]();
}

uint64_t sub_24162CC18()
{
  return MEMORY[0x270F32A08]();
}

uint64_t sub_24162CC28()
{
  return MEMORY[0x270F32A10]();
}

uint64_t sub_24162CC38()
{
  return MEMORY[0x270F32A18]();
}

uint64_t sub_24162CC48()
{
  return MEMORY[0x270F32A90]();
}

uint64_t sub_24162CC58()
{
  return MEMORY[0x270F32AE0]();
}

uint64_t sub_24162CC68()
{
  return MEMORY[0x270F32AE8]();
}

uint64_t sub_24162CC78()
{
  return MEMORY[0x270F32AF0]();
}

uint64_t sub_24162CC88()
{
  return MEMORY[0x270F32AF8]();
}

uint64_t sub_24162CC98()
{
  return MEMORY[0x270F32B08]();
}

uint64_t sub_24162CCA8()
{
  return MEMORY[0x270F32B10]();
}

uint64_t sub_24162CCB8()
{
  return MEMORY[0x270F32B80]();
}

uint64_t sub_24162CCC8()
{
  return MEMORY[0x270F32B88]();
}

uint64_t sub_24162CCD8()
{
  return MEMORY[0x270F32B90]();
}

uint64_t sub_24162CCE8()
{
  return MEMORY[0x270F32BD8]();
}

uint64_t sub_24162CCF8()
{
  return MEMORY[0x270F32BE0]();
}

uint64_t sub_24162CD08()
{
  return MEMORY[0x270F32BE8]();
}

uint64_t sub_24162CD18()
{
  return MEMORY[0x270F32BF0]();
}

uint64_t sub_24162CD28()
{
  return MEMORY[0x270F32BF8]();
}

uint64_t sub_24162CD38()
{
  return MEMORY[0x270F32C00]();
}

uint64_t sub_24162CD48()
{
  return MEMORY[0x270F32C50]();
}

uint64_t sub_24162CD58()
{
  return MEMORY[0x270F32C60]();
}

uint64_t sub_24162CD68()
{
  return MEMORY[0x270F32C68]();
}

uint64_t sub_24162CD78()
{
  return MEMORY[0x270F32C70]();
}

uint64_t sub_24162CD88()
{
  return MEMORY[0x270F32C80]();
}

uint64_t sub_24162CD98()
{
  return MEMORY[0x270F32C90]();
}

uint64_t sub_24162CDA8()
{
  return MEMORY[0x270F32D18]();
}

uint64_t sub_24162CDB8()
{
  return MEMORY[0x270F32D20]();
}

uint64_t sub_24162CDC8()
{
  return MEMORY[0x270F32D28]();
}

uint64_t sub_24162CDD8()
{
  return MEMORY[0x270F32D80]();
}

uint64_t sub_24162CDE8()
{
  return MEMORY[0x270F32D88]();
}

uint64_t sub_24162CDF8()
{
  return MEMORY[0x270F32DC8]();
}

uint64_t sub_24162CE08()
{
  return MEMORY[0x270F32DD0]();
}

uint64_t sub_24162CE18()
{
  return MEMORY[0x270F32E40]();
}

uint64_t sub_24162CE28()
{
  return MEMORY[0x270F32E50]();
}

uint64_t sub_24162CE38()
{
  return MEMORY[0x270F32E58]();
}

uint64_t sub_24162CE48()
{
  return MEMORY[0x270F32E60]();
}

uint64_t sub_24162CE58()
{
  return MEMORY[0x270F32E90]();
}

uint64_t sub_24162CE68()
{
  return MEMORY[0x270F32EA0]();
}

uint64_t sub_24162CE78()
{
  return MEMORY[0x270F32EA8]();
}

uint64_t sub_24162CE88()
{
  return MEMORY[0x270F32EB0]();
}

uint64_t sub_24162CE98()
{
  return MEMORY[0x270F32EB8]();
}

uint64_t sub_24162CEA8()
{
  return MEMORY[0x270F32EC0]();
}

uint64_t sub_24162CEB8()
{
  return MEMORY[0x270F32ED0]();
}

uint64_t sub_24162CEC8()
{
  return MEMORY[0x270F32EE8]();
}

uint64_t sub_24162CED8()
{
  return MEMORY[0x270F32F30]();
}

uint64_t sub_24162CEE8()
{
  return MEMORY[0x270F32F38]();
}

uint64_t sub_24162CEF8()
{
  return MEMORY[0x270F32F40]();
}

uint64_t sub_24162CF08()
{
  return MEMORY[0x270F32F48]();
}

uint64_t sub_24162CF18()
{
  return MEMORY[0x270F32F50]();
}

uint64_t sub_24162CF28()
{
  return MEMORY[0x270F32F58]();
}

uint64_t sub_24162CF38()
{
  return MEMORY[0x270F32F60]();
}

uint64_t sub_24162CF48()
{
  return MEMORY[0x270F32F68]();
}

uint64_t sub_24162CF58()
{
  return MEMORY[0x270F32F70]();
}

uint64_t sub_24162CF68()
{
  return MEMORY[0x270F32F78]();
}

uint64_t sub_24162CF78()
{
  return MEMORY[0x270F32F90]();
}

uint64_t sub_24162CF88()
{
  return MEMORY[0x270F32F98]();
}

uint64_t sub_24162CF98()
{
  return MEMORY[0x270F32FA0]();
}

uint64_t sub_24162CFA8()
{
  return MEMORY[0x270F32FA8]();
}

uint64_t sub_24162CFB8()
{
  return MEMORY[0x270F32FB0]();
}

uint64_t sub_24162CFC8()
{
  return MEMORY[0x270F32FD0]();
}

uint64_t sub_24162CFD8()
{
  return MEMORY[0x270F32FD8]();
}

uint64_t sub_24162CFE8()
{
  return MEMORY[0x270F32FE0]();
}

uint64_t sub_24162CFF8()
{
  return MEMORY[0x270F32FE8]();
}

uint64_t sub_24162D008()
{
  return MEMORY[0x270F32FF0]();
}

uint64_t sub_24162D018()
{
  return MEMORY[0x270F32FF8]();
}

uint64_t sub_24162D028()
{
  return MEMORY[0x270F33000]();
}

uint64_t sub_24162D038()
{
  return MEMORY[0x270F33008]();
}

uint64_t sub_24162D048()
{
  return MEMORY[0x270F33010]();
}

uint64_t sub_24162D058()
{
  return MEMORY[0x270F33018]();
}

uint64_t sub_24162D068()
{
  return MEMORY[0x270F33020]();
}

uint64_t sub_24162D078()
{
  return MEMORY[0x270F33028]();
}

uint64_t sub_24162D088()
{
  return MEMORY[0x270F33038]();
}

uint64_t sub_24162D098()
{
  return MEMORY[0x270F33040]();
}

uint64_t sub_24162D0A8()
{
  return MEMORY[0x270F33048]();
}

uint64_t sub_24162D0B8()
{
  return MEMORY[0x270F33050]();
}

uint64_t sub_24162D0C8()
{
  return MEMORY[0x270F33058]();
}

uint64_t sub_24162D0D8()
{
  return MEMORY[0x270F33060]();
}

uint64_t sub_24162D0E8()
{
  return MEMORY[0x270F33068]();
}

uint64_t sub_24162D0F8()
{
  return MEMORY[0x270F33070]();
}

uint64_t sub_24162D108()
{
  return MEMORY[0x270F33078]();
}

uint64_t sub_24162D118()
{
  return MEMORY[0x270F33080]();
}

uint64_t sub_24162D128()
{
  return MEMORY[0x270F33088]();
}

uint64_t sub_24162D138()
{
  return MEMORY[0x270F33090]();
}

uint64_t sub_24162D148()
{
  return MEMORY[0x270F330A0]();
}

uint64_t sub_24162D158()
{
  return MEMORY[0x270F330A8]();
}

uint64_t sub_24162D168()
{
  return MEMORY[0x270F330B8]();
}

uint64_t sub_24162D178()
{
  return MEMORY[0x270F330C0]();
}

uint64_t sub_24162D188()
{
  return MEMORY[0x270F330D0]();
}

uint64_t sub_24162D198()
{
  return MEMORY[0x270F330F0]();
}

uint64_t sub_24162D1A8()
{
  return MEMORY[0x270F330F8]();
}

uint64_t sub_24162D1B8()
{
  return MEMORY[0x270F33100]();
}

uint64_t sub_24162D1C8()
{
  return MEMORY[0x270F33108]();
}

uint64_t sub_24162D1D8()
{
  return MEMORY[0x270F33118]();
}

uint64_t sub_24162D1E8()
{
  return MEMORY[0x270F33128]();
}

uint64_t sub_24162D1F8()
{
  return MEMORY[0x270F33138]();
}

uint64_t sub_24162D208()
{
  return MEMORY[0x270F33140]();
}

uint64_t sub_24162D218()
{
  return MEMORY[0x270F33148]();
}

uint64_t sub_24162D228()
{
  return MEMORY[0x270F33150]();
}

uint64_t sub_24162D238()
{
  return MEMORY[0x270F33158]();
}

uint64_t sub_24162D248()
{
  return MEMORY[0x270F33160]();
}

uint64_t sub_24162D258()
{
  return MEMORY[0x270F33168]();
}

uint64_t sub_24162D268()
{
  return MEMORY[0x270F33170]();
}

uint64_t sub_24162D278()
{
  return MEMORY[0x270F33178]();
}

uint64_t sub_24162D288()
{
  return MEMORY[0x270F33180]();
}

uint64_t sub_24162D298()
{
  return MEMORY[0x270F33190]();
}

uint64_t sub_24162D2A8()
{
  return MEMORY[0x270F33198]();
}

uint64_t sub_24162D2B8()
{
  return MEMORY[0x270F331A8]();
}

uint64_t sub_24162D2C8()
{
  return MEMORY[0x270F331B0]();
}

uint64_t sub_24162D2D8()
{
  return MEMORY[0x270F331B8]();
}

uint64_t sub_24162D2E8()
{
  return MEMORY[0x270F331C0]();
}

uint64_t sub_24162D2F8()
{
  return MEMORY[0x270F331C8]();
}

uint64_t sub_24162D308()
{
  return MEMORY[0x270F331E0]();
}

uint64_t sub_24162D318()
{
  return MEMORY[0x270F331E8]();
}

uint64_t sub_24162D328()
{
  return MEMORY[0x270F331F0]();
}

uint64_t sub_24162D338()
{
  return MEMORY[0x270F33218]();
}

uint64_t sub_24162D348()
{
  return MEMORY[0x270F33220]();
}

uint64_t sub_24162D358()
{
  return MEMORY[0x270F33228]();
}

uint64_t sub_24162D368()
{
  return MEMORY[0x270F33230]();
}

uint64_t sub_24162D378()
{
  return MEMORY[0x270F33238]();
}

uint64_t sub_24162D388()
{
  return MEMORY[0x270F33240]();
}

uint64_t sub_24162D398()
{
  return MEMORY[0x270F33248]();
}

uint64_t sub_24162D3A8()
{
  return MEMORY[0x270F33250]();
}

uint64_t sub_24162D3B8()
{
  return MEMORY[0x270F33258]();
}

uint64_t sub_24162D3C8()
{
  return MEMORY[0x270F33260]();
}

uint64_t sub_24162D3D8()
{
  return MEMORY[0x270F33270]();
}

uint64_t sub_24162D3E8()
{
  return MEMORY[0x270F33278]();
}

uint64_t sub_24162D3F8()
{
  return MEMORY[0x270F33280]();
}

uint64_t sub_24162D408()
{
  return MEMORY[0x270F33288]();
}

uint64_t sub_24162D418()
{
  return MEMORY[0x270F33290]();
}

uint64_t sub_24162D428()
{
  return MEMORY[0x270F33298]();
}

uint64_t sub_24162D438()
{
  return MEMORY[0x270F332A0]();
}

uint64_t sub_24162D448()
{
  return MEMORY[0x270F332B0]();
}

uint64_t sub_24162D458()
{
  return MEMORY[0x270F332D8]();
}

uint64_t sub_24162D468()
{
  return MEMORY[0x270F332E0]();
}

uint64_t sub_24162D478()
{
  return MEMORY[0x270F332E8]();
}

uint64_t sub_24162D488()
{
  return MEMORY[0x270F33308]();
}

uint64_t sub_24162D498()
{
  return MEMORY[0x270F33310]();
}

uint64_t sub_24162D4A8()
{
  return MEMORY[0x270F33318]();
}

uint64_t sub_24162D4B8()
{
  return MEMORY[0x270F33320]();
}

uint64_t sub_24162D4C8()
{
  return MEMORY[0x270F33338]();
}

uint64_t sub_24162D4D8()
{
  return MEMORY[0x270F33340]();
}

uint64_t sub_24162D4E8()
{
  return MEMORY[0x270F33370]();
}

uint64_t sub_24162D4F8()
{
  return MEMORY[0x270F33378]();
}

uint64_t sub_24162D508()
{
  return MEMORY[0x270F33380]();
}

uint64_t sub_24162D518()
{
  return MEMORY[0x270F33388]();
}

uint64_t sub_24162D528()
{
  return MEMORY[0x270F33390]();
}

uint64_t sub_24162D538()
{
  return MEMORY[0x270F33398]();
}

uint64_t sub_24162D548()
{
  return MEMORY[0x270F333B8]();
}

uint64_t sub_24162D558()
{
  return MEMORY[0x270F333D0]();
}

uint64_t sub_24162D568()
{
  return MEMORY[0x270F333D8]();
}

uint64_t sub_24162D578()
{
  return MEMORY[0x270F333E0]();
}

uint64_t sub_24162D588()
{
  return MEMORY[0x270F333E8]();
}

uint64_t sub_24162D598()
{
  return MEMORY[0x270F33448]();
}

uint64_t sub_24162D5A8()
{
  return MEMORY[0x270F33458]();
}

uint64_t sub_24162D5B8()
{
  return MEMORY[0x270F33460]();
}

uint64_t sub_24162D5C8()
{
  return MEMORY[0x270F33468]();
}

uint64_t sub_24162D5E8()
{
  return MEMORY[0x270F334D0]();
}

uint64_t sub_24162D5F8()
{
  return MEMORY[0x270F334F0]();
}

uint64_t sub_24162D608()
{
  return MEMORY[0x270F334F8]();
}

uint64_t sub_24162D618()
{
  return MEMORY[0x270F33500]();
}

uint64_t sub_24162D628()
{
  return MEMORY[0x270F33508]();
}

uint64_t sub_24162D638()
{
  return MEMORY[0x270F33510]();
}

uint64_t sub_24162D648()
{
  return MEMORY[0x270F33518]();
}

uint64_t sub_24162D658()
{
  return MEMORY[0x270F33528]();
}

uint64_t sub_24162D668()
{
  return MEMORY[0x270F33530]();
}

uint64_t sub_24162D678()
{
  return MEMORY[0x270F33538]();
}

uint64_t sub_24162D688()
{
  return MEMORY[0x270F33550]();
}

uint64_t sub_24162D698()
{
  return MEMORY[0x270F33558]();
}

uint64_t sub_24162D6A8()
{
  return MEMORY[0x270F335E8]();
}

uint64_t sub_24162D6B8()
{
  return MEMORY[0x270F335F8]();
}

uint64_t sub_24162D6C8()
{
  return MEMORY[0x270F33600]();
}

uint64_t sub_24162D6D8()
{
  return MEMORY[0x270F33608]();
}

uint64_t sub_24162D6E8()
{
  return MEMORY[0x270F33618]();
}

uint64_t sub_24162D6F8()
{
  return MEMORY[0x270F33620]();
}

uint64_t sub_24162D708()
{
  return MEMORY[0x270F33628]();
}

uint64_t sub_24162D718()
{
  return MEMORY[0x270F33630]();
}

uint64_t sub_24162D728()
{
  return MEMORY[0x270F33638]();
}

uint64_t sub_24162D738()
{
  return MEMORY[0x270F33640]();
}

uint64_t sub_24162D748()
{
  return MEMORY[0x270F33648]();
}

uint64_t sub_24162D758()
{
  return MEMORY[0x270F33650]();
}

uint64_t sub_24162D768()
{
  return MEMORY[0x270F33658]();
}

uint64_t sub_24162D778()
{
  return MEMORY[0x270F33660]();
}

uint64_t sub_24162D788()
{
  return MEMORY[0x270F33668]();
}

uint64_t sub_24162D798()
{
  return MEMORY[0x270F33670]();
}

uint64_t sub_24162D7A8()
{
  return MEMORY[0x270F33678]();
}

uint64_t sub_24162D7B8()
{
  return MEMORY[0x270F33680]();
}

uint64_t sub_24162D7C8()
{
  return MEMORY[0x270F33688]();
}

uint64_t sub_24162D7D8()
{
  return MEMORY[0x270F33698]();
}

uint64_t sub_24162D7E8()
{
  return MEMORY[0x270F336A0]();
}

uint64_t sub_24162D7F8()
{
  return MEMORY[0x270F336A8]();
}

uint64_t sub_24162D808()
{
  return MEMORY[0x270F336B0]();
}

uint64_t sub_24162D818()
{
  return MEMORY[0x270F336B8]();
}

uint64_t sub_24162D828()
{
  return MEMORY[0x270F336C8]();
}

uint64_t sub_24162D838()
{
  return MEMORY[0x270F336D8]();
}

uint64_t sub_24162D848()
{
  return MEMORY[0x270F336E0]();
}

uint64_t sub_24162D858()
{
  return MEMORY[0x270F336F8]();
}

uint64_t sub_24162D868()
{
  return MEMORY[0x270F33700]();
}

uint64_t sub_24162D878()
{
  return MEMORY[0x270F33708]();
}

uint64_t sub_24162D888()
{
  return MEMORY[0x270F33710]();
}

uint64_t sub_24162D898()
{
  return MEMORY[0x270F33718]();
}

uint64_t sub_24162D8A8()
{
  return MEMORY[0x270F337B0]();
}

uint64_t sub_24162D8B8()
{
  return MEMORY[0x270F337C0]();
}

uint64_t sub_24162D8C8()
{
  return MEMORY[0x270F337E0]();
}

uint64_t sub_24162D8D8()
{
  return MEMORY[0x270F337E8]();
}

uint64_t sub_24162D8E8()
{
  return MEMORY[0x270F337F8]();
}

uint64_t sub_24162D8F8()
{
  return MEMORY[0x270F33800]();
}

uint64_t sub_24162D908()
{
  return MEMORY[0x270F33808]();
}

uint64_t sub_24162D918()
{
  return MEMORY[0x270F33810]();
}

uint64_t sub_24162D928()
{
  return MEMORY[0x270F33848]();
}

uint64_t sub_24162D938()
{
  return MEMORY[0x270F33850]();
}

uint64_t sub_24162D948()
{
  return MEMORY[0x270F33868]();
}

uint64_t sub_24162D958()
{
  return MEMORY[0x270F33880]();
}

uint64_t sub_24162D968()
{
  return MEMORY[0x270F33910]();
}

uint64_t sub_24162D978()
{
  return MEMORY[0x270F33918]();
}

uint64_t sub_24162D988()
{
  return MEMORY[0x270F33980]();
}

uint64_t sub_24162D998()
{
  return MEMORY[0x270F33988]();
}

uint64_t sub_24162D9A8()
{
  return MEMORY[0x270F33990]();
}

uint64_t sub_24162D9B8()
{
  return MEMORY[0x270F33998]();
}

uint64_t sub_24162D9C8()
{
  return MEMORY[0x270F339A8]();
}

uint64_t sub_24162D9D8()
{
  return MEMORY[0x270F339D0]();
}

uint64_t sub_24162D9E8()
{
  return MEMORY[0x270F33A00]();
}

uint64_t sub_24162D9F8()
{
  return MEMORY[0x270F33A08]();
}

uint64_t sub_24162DA08()
{
  return MEMORY[0x270F33A60]();
}

uint64_t sub_24162DA18()
{
  return MEMORY[0x270F33A68]();
}

uint64_t sub_24162DA28()
{
  return MEMORY[0x270F33A80]();
}

uint64_t sub_24162DA38()
{
  return MEMORY[0x270F33A98]();
}

uint64_t sub_24162DA48()
{
  return MEMORY[0x270F33AE8]();
}

uint64_t sub_24162DA58()
{
  return MEMORY[0x270F33AF0]();
}

uint64_t sub_24162DA68()
{
  return MEMORY[0x270F33AF8]();
}

uint64_t sub_24162DA78()
{
  return MEMORY[0x270F33B00]();
}

uint64_t sub_24162DA88()
{
  return MEMORY[0x270F33B08]();
}

uint64_t sub_24162DA98()
{
  return MEMORY[0x270F33B10]();
}

uint64_t sub_24162DAA8()
{
  return MEMORY[0x270F33B28]();
}

uint64_t sub_24162DAB8()
{
  return MEMORY[0x270F33B30]();
}

uint64_t sub_24162DAC8()
{
  return MEMORY[0x270F33B50]();
}

uint64_t sub_24162DAD8()
{
  return MEMORY[0x270F33B58]();
}

uint64_t sub_24162DAE8()
{
  return MEMORY[0x270F33BB8]();
}

uint64_t sub_24162DAF8()
{
  return MEMORY[0x270F33BC0]();
}

uint64_t sub_24162DB08()
{
  return MEMORY[0x270F33BC8]();
}

uint64_t sub_24162DB18()
{
  return MEMORY[0x270F33BD0]();
}

uint64_t sub_24162DB28()
{
  return MEMORY[0x270F33BD8]();
}

uint64_t sub_24162DB38()
{
  return MEMORY[0x270F33BE0]();
}

uint64_t sub_24162DB48()
{
  return MEMORY[0x270F33BE8]();
}

uint64_t sub_24162DB58()
{
  return MEMORY[0x270F33BF8]();
}

uint64_t sub_24162DB68()
{
  return MEMORY[0x270F33C18]();
}

uint64_t sub_24162DB78()
{
  return MEMORY[0x270F33C20]();
}

uint64_t sub_24162DB88()
{
  return MEMORY[0x270F33C28]();
}

uint64_t sub_24162DB98()
{
  return MEMORY[0x270F33C30]();
}

uint64_t sub_24162DBA8()
{
  return MEMORY[0x270F33C38]();
}

uint64_t sub_24162DBB8()
{
  return MEMORY[0x270F33C40]();
}

uint64_t sub_24162DBC8()
{
  return MEMORY[0x270F33C48]();
}

uint64_t sub_24162DBD8()
{
  return MEMORY[0x270F33C50]();
}

uint64_t sub_24162DBE8()
{
  return MEMORY[0x270F33C58]();
}

uint64_t sub_24162DBF8()
{
  return MEMORY[0x270F33C60]();
}

uint64_t sub_24162DC08()
{
  return MEMORY[0x270F33C68]();
}

uint64_t sub_24162DC18()
{
  return MEMORY[0x270F33CA8]();
}

uint64_t sub_24162DC28()
{
  return MEMORY[0x270F33CB8]();
}

uint64_t sub_24162DC38()
{
  return MEMORY[0x270F33CC0]();
}

uint64_t sub_24162DC48()
{
  return MEMORY[0x270F33CC8]();
}

uint64_t sub_24162DC58()
{
  return MEMORY[0x270F33CD8]();
}

uint64_t sub_24162DC68()
{
  return MEMORY[0x270F33D38]();
}

uint64_t sub_24162DC78()
{
  return MEMORY[0x270F33D60]();
}

uint64_t sub_24162DC88()
{
  return MEMORY[0x270F33D68]();
}

uint64_t sub_24162DC98()
{
  return MEMORY[0x270F33D70]();
}

uint64_t sub_24162DCA8()
{
  return MEMORY[0x270F33D78]();
}

uint64_t sub_24162DCB8()
{
  return MEMORY[0x270F33D80]();
}

uint64_t sub_24162DCC8()
{
  return MEMORY[0x270F33DA0]();
}

uint64_t sub_24162DCD8()
{
  return MEMORY[0x270F33DB0]();
}

uint64_t sub_24162DCE8()
{
  return MEMORY[0x270F33DE8]();
}

uint64_t sub_24162DCF8()
{
  return MEMORY[0x270F33E08]();
}

uint64_t sub_24162DD08()
{
  return MEMORY[0x270F33E10]();
}

uint64_t sub_24162DD18()
{
  return MEMORY[0x270F33E20]();
}

uint64_t sub_24162DD28()
{
  return MEMORY[0x270F33E28]();
}

uint64_t sub_24162DD38()
{
  return MEMORY[0x270F33E40]();
}

uint64_t sub_24162DD48()
{
  return MEMORY[0x270F33E48]();
}

uint64_t sub_24162DD58()
{
  return MEMORY[0x270F33E50]();
}

uint64_t sub_24162DD68()
{
  return MEMORY[0x270F33E70]();
}

uint64_t sub_24162DD78()
{
  return MEMORY[0x270F33E78]();
}

uint64_t sub_24162DD88()
{
  return MEMORY[0x270F33E80]();
}

uint64_t sub_24162DD98()
{
  return MEMORY[0x270F33ED0]();
}

uint64_t sub_24162DDA8()
{
  return MEMORY[0x270F33ED8]();
}

uint64_t sub_24162DDB8()
{
  return MEMORY[0x270F33EE0]();
}

uint64_t sub_24162DDC8()
{
  return MEMORY[0x270F33EE8]();
}

uint64_t sub_24162DDD8()
{
  return MEMORY[0x270F33EF8]();
}

uint64_t sub_24162DDE8()
{
  return MEMORY[0x270F33F00]();
}

uint64_t sub_24162DDF8()
{
  return MEMORY[0x270F33F08]();
}

uint64_t sub_24162DE08()
{
  return MEMORY[0x270F33F10]();
}

uint64_t sub_24162DE18()
{
  return MEMORY[0x270F33F50]();
}

uint64_t sub_24162DE28()
{
  return MEMORY[0x270F33F58]();
}

uint64_t sub_24162DE38()
{
  return MEMORY[0x270F33F60]();
}

uint64_t sub_24162DE48()
{
  return MEMORY[0x270F33F68]();
}

uint64_t sub_24162DE68()
{
  return MEMORY[0x270F34010]();
}

uint64_t sub_24162DE78()
{
  return MEMORY[0x270F34038]();
}

uint64_t _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0()
{
  return MEMORY[0x270F34058]();
}

uint64_t sub_24162DE98()
{
  return MEMORY[0x270F340A0]();
}

uint64_t sub_24162DEA8()
{
  return MEMORY[0x270F340A8]();
}

uint64_t sub_24162DEB8()
{
  return MEMORY[0x270F340B0]();
}

uint64_t sub_24162DEC8()
{
  return MEMORY[0x270F340D0]();
}

uint64_t sub_24162DED8()
{
  return MEMORY[0x270F340E0]();
}

uint64_t sub_24162DEE8()
{
  return MEMORY[0x270F340E8]();
}

uint64_t sub_24162DEF8()
{
  return MEMORY[0x270F340F0]();
}

uint64_t sub_24162DF08()
{
  return MEMORY[0x270F340F8]();
}

uint64_t sub_24162DF18()
{
  return MEMORY[0x270F34108]();
}

uint64_t sub_24162DF28()
{
  return MEMORY[0x270F34110]();
}

uint64_t sub_24162DF38()
{
  return MEMORY[0x270F34120]();
}

uint64_t sub_24162DF48()
{
  return MEMORY[0x270F34128]();
}

uint64_t sub_24162DF58()
{
  return MEMORY[0x270F34130]();
}

uint64_t sub_24162DF68()
{
  return MEMORY[0x270F34160]();
}

uint64_t sub_24162DF78()
{
  return MEMORY[0x270F34168]();
}

uint64_t sub_24162DF88()
{
  return MEMORY[0x270F34170]();
}

uint64_t sub_24162DF98()
{
  return MEMORY[0x270F34178]();
}

uint64_t sub_24162DFA8()
{
  return MEMORY[0x270F34190]();
}

uint64_t sub_24162DFB8()
{
  return MEMORY[0x270F34198]();
}

uint64_t sub_24162DFC8()
{
  return MEMORY[0x270F341A8]();
}

uint64_t sub_24162DFD8()
{
  return MEMORY[0x270F341B0]();
}

uint64_t sub_24162DFE8()
{
  return MEMORY[0x270F341F8]();
}

uint64_t sub_24162DFF8()
{
  return MEMORY[0x270F34200]();
}

uint64_t sub_24162E008()
{
  return MEMORY[0x270F34208]();
}

uint64_t sub_24162E018()
{
  return MEMORY[0x270F342A0]();
}

uint64_t sub_24162E028()
{
  return MEMORY[0x270F342A8]();
}

uint64_t sub_24162E038()
{
  return MEMORY[0x270F342B0]();
}

uint64_t sub_24162E048()
{
  return MEMORY[0x270F342C8]();
}

uint64_t sub_24162E058()
{
  return MEMORY[0x270F342D0]();
}

uint64_t sub_24162E068()
{
  return MEMORY[0x270F342D8]();
}

uint64_t sub_24162E078()
{
  return MEMORY[0x270F342E0]();
}

uint64_t sub_24162E098()
{
  return MEMORY[0x270F342F8]();
}

uint64_t sub_24162E0A8()
{
  return MEMORY[0x270F34300]();
}

uint64_t sub_24162E0B8()
{
  return MEMORY[0x270F34328]();
}

uint64_t sub_24162E0C8()
{
  return MEMORY[0x270F34330]();
}

uint64_t sub_24162E0D8()
{
  return MEMORY[0x270F343E0]();
}

uint64_t sub_24162E0E8()
{
  return MEMORY[0x270F343E8]();
}

uint64_t sub_24162E0F8()
{
  return MEMORY[0x270F343F8]();
}

uint64_t sub_24162E108()
{
  return MEMORY[0x270F34418]();
}

uint64_t sub_24162E118()
{
  return MEMORY[0x270F344D8]();
}

uint64_t sub_24162E128()
{
  return MEMORY[0x270F344E0]();
}

uint64_t sub_24162E138()
{
  return MEMORY[0x270F344E8]();
}

uint64_t sub_24162E148()
{
  return MEMORY[0x270F344F0]();
}

uint64_t sub_24162E158()
{
  return MEMORY[0x270F344F8]();
}

uint64_t sub_24162E168()
{
  return MEMORY[0x270F34500]();
}

uint64_t sub_24162E178()
{
  return MEMORY[0x270F34510]();
}

uint64_t sub_24162E188()
{
  return MEMORY[0x270F34548]();
}

uint64_t sub_24162E198()
{
  return MEMORY[0x270F34550]();
}

uint64_t sub_24162E1A8()
{
  return MEMORY[0x270F34558]();
}

uint64_t sub_24162E1B8()
{
  return MEMORY[0x270F34560]();
}

uint64_t sub_24162E1C8()
{
  return MEMORY[0x270F345C8]();
}

uint64_t sub_24162E1D8()
{
  return MEMORY[0x270F345D0]();
}

uint64_t sub_24162E1E8()
{
  return MEMORY[0x270F345D8]();
}

uint64_t sub_24162E1F8()
{
  return MEMORY[0x270F345E8]();
}

uint64_t sub_24162E208()
{
  return MEMORY[0x270F345F0]();
}

uint64_t sub_24162E218()
{
  return MEMORY[0x270F34640]();
}

uint64_t sub_24162E228()
{
  return MEMORY[0x270F34648]();
}

uint64_t sub_24162E238()
{
  return MEMORY[0x270F34650]();
}

uint64_t sub_24162E248()
{
  return MEMORY[0x270F346D8]();
}

uint64_t sub_24162E258()
{
  return MEMORY[0x270F346E0]();
}

uint64_t sub_24162E268()
{
  return MEMORY[0x270F34738]();
}

uint64_t sub_24162E278()
{
  return MEMORY[0x270F34740]();
}

uint64_t sub_24162E288()
{
  return MEMORY[0x270F34748]();
}

uint64_t sub_24162E298()
{
  return MEMORY[0x270F34758]();
}

uint64_t sub_24162E2A8()
{
  return MEMORY[0x270F34760]();
}

uint64_t sub_24162E2B8()
{
  return MEMORY[0x270F34780]();
}

uint64_t sub_24162E2C8()
{
  return MEMORY[0x270F34788]();
}

uint64_t sub_24162E2D8()
{
  return MEMORY[0x270F34790]();
}

uint64_t sub_24162E2E8()
{
  return MEMORY[0x270F347A8]();
}

uint64_t sub_24162E2F8()
{
  return MEMORY[0x270F347B0]();
}

uint64_t sub_24162E308()
{
  return MEMORY[0x270F347B8]();
}

uint64_t sub_24162E318()
{
  return MEMORY[0x270F347C0]();
}

uint64_t sub_24162E328()
{
  return MEMORY[0x270F347C8]();
}

uint64_t sub_24162E338()
{
  return MEMORY[0x270F347D0]();
}

uint64_t sub_24162E348()
{
  return MEMORY[0x270F347D8]();
}

uint64_t sub_24162E358()
{
  return MEMORY[0x270F34818]();
}

uint64_t sub_24162E368()
{
  return MEMORY[0x270F34820]();
}

uint64_t sub_24162E378()
{
  return MEMORY[0x270F34828]();
}

uint64_t sub_24162E388()
{
  return MEMORY[0x270F34830]();
}

uint64_t sub_24162E398()
{
  return MEMORY[0x270F34848]();
}

uint64_t sub_24162E3A8()
{
  return MEMORY[0x270F34858]();
}

uint64_t sub_24162E3B8()
{
  return MEMORY[0x270F34898]();
}

uint64_t sub_24162E3C8()
{
  return MEMORY[0x270F348A0]();
}

uint64_t sub_24162E3D8()
{
  return MEMORY[0x270F348A8]();
}

uint64_t sub_24162E3E8()
{
  return MEMORY[0x270F348B0]();
}

uint64_t sub_24162E3F8()
{
  return MEMORY[0x270F348C0]();
}

uint64_t sub_24162E408()
{
  return MEMORY[0x270F348D8]();
}

uint64_t sub_24162E418()
{
  return MEMORY[0x270F348E0]();
}

uint64_t sub_24162E428()
{
  return MEMORY[0x270F348E8]();
}

uint64_t sub_24162E438()
{
  return MEMORY[0x270F348F0]();
}

uint64_t sub_24162E448()
{
  return MEMORY[0x270F34900]();
}

uint64_t sub_24162E458()
{
  return MEMORY[0x270F34948]();
}

uint64_t sub_24162E468()
{
  return MEMORY[0x270F34958]();
}

uint64_t sub_24162E478()
{
  return MEMORY[0x270F34960]();
}

uint64_t sub_24162E488()
{
  return MEMORY[0x270F34968]();
}

uint64_t sub_24162E498()
{
  return MEMORY[0x270F34970]();
}

uint64_t sub_24162E4A8()
{
  return MEMORY[0x270F34978]();
}

uint64_t sub_24162E4B8()
{
  return MEMORY[0x270F34980]();
}

uint64_t sub_24162E4C8()
{
  return MEMORY[0x270F34988]();
}

uint64_t sub_24162E4D8()
{
  return MEMORY[0x270F34990]();
}

uint64_t sub_24162E4E8()
{
  return MEMORY[0x270F349D8]();
}

uint64_t sub_24162E4F8()
{
  return MEMORY[0x270F349E0]();
}

uint64_t sub_24162E508()
{
  return MEMORY[0x270F34A18]();
}

uint64_t sub_24162E518()
{
  return MEMORY[0x270F34A20]();
}

uint64_t sub_24162E528()
{
  return MEMORY[0x270F34A28]();
}

uint64_t sub_24162E538()
{
  return MEMORY[0x270F34A30]();
}

uint64_t sub_24162E548()
{
  return MEMORY[0x270F34AA8]();
}

uint64_t sub_24162E558()
{
  return MEMORY[0x270F34AB8]();
}

uint64_t sub_24162E568()
{
  return MEMORY[0x270F34AD0]();
}

uint64_t sub_24162E578()
{
  return MEMORY[0x270F34AD8]();
}

uint64_t sub_24162E588()
{
  return MEMORY[0x270F34B08]();
}

uint64_t sub_24162E598()
{
  return MEMORY[0x270F34B70]();
}

uint64_t sub_24162E5A8()
{
  return MEMORY[0x270F34B78]();
}

uint64_t sub_24162E5B8()
{
  return MEMORY[0x270F34B80]();
}

uint64_t sub_24162E5C8()
{
  return MEMORY[0x270F34B88]();
}

uint64_t sub_24162E5D8()
{
  return MEMORY[0x270F34B90]();
}

uint64_t sub_24162E5E8()
{
  return MEMORY[0x270F34B98]();
}

uint64_t sub_24162E5F8()
{
  return MEMORY[0x270F34BA0]();
}

uint64_t sub_24162E608()
{
  return MEMORY[0x270F34BA8]();
}

uint64_t sub_24162E618()
{
  return MEMORY[0x270F34BB0]();
}

uint64_t sub_24162E628()
{
  return MEMORY[0x270F34BB8]();
}

uint64_t sub_24162E638()
{
  return MEMORY[0x270F34BC0]();
}

uint64_t sub_24162E648()
{
  return MEMORY[0x270F34BC8]();
}

uint64_t sub_24162E658()
{
  return MEMORY[0x270F34BD0]();
}

uint64_t sub_24162E668()
{
  return MEMORY[0x270F34BD8]();
}

uint64_t sub_24162E678()
{
  return MEMORY[0x270F34BF0]();
}

uint64_t sub_24162E688()
{
  return MEMORY[0x270F34BF8]();
}

uint64_t sub_24162E698()
{
  return MEMORY[0x270F34C00]();
}

uint64_t sub_24162E6A8()
{
  return MEMORY[0x270F34C08]();
}

uint64_t sub_24162E6B8()
{
  return MEMORY[0x270F34C10]();
}

uint64_t sub_24162E6C8()
{
  return MEMORY[0x270F34C18]();
}

uint64_t sub_24162E6D8()
{
  return MEMORY[0x270F34C30]();
}

uint64_t sub_24162E6E8()
{
  return MEMORY[0x270F34C38]();
}

uint64_t sub_24162E6F8()
{
  return MEMORY[0x270F34C40]();
}

uint64_t sub_24162E708()
{
  return MEMORY[0x270F34C48]();
}

uint64_t sub_24162E718()
{
  return MEMORY[0x270F34CA0]();
}

uint64_t sub_24162E728()
{
  return MEMORY[0x270F34CB0]();
}

uint64_t sub_24162E738()
{
  return MEMORY[0x270F34CB8]();
}

uint64_t sub_24162E748()
{
  return MEMORY[0x270F34CC0]();
}

uint64_t sub_24162E758()
{
  return MEMORY[0x270F34CC8]();
}

uint64_t sub_24162E768()
{
  return MEMORY[0x270F34F30]();
}

uint64_t sub_24162E778()
{
  return MEMORY[0x270F34F38]();
}

uint64_t sub_24162E788()
{
  return MEMORY[0x270F34F40]();
}

uint64_t sub_24162E798()
{
  return MEMORY[0x270F34F58]();
}

uint64_t sub_24162E7A8()
{
  return MEMORY[0x270F34F70]();
}

uint64_t sub_24162E7B8()
{
  return MEMORY[0x270F34F78]();
}

uint64_t sub_24162E7C8()
{
  return MEMORY[0x270F34F98]();
}

uint64_t sub_24162E7D8()
{
  return MEMORY[0x270F34FA0]();
}

uint64_t sub_24162E7E8()
{
  return MEMORY[0x270F34FB0]();
}

uint64_t sub_24162E7F8()
{
  return MEMORY[0x270F35008]();
}

uint64_t sub_24162E808()
{
  return MEMORY[0x270F35018]();
}

uint64_t sub_24162E818()
{
  return MEMORY[0x270F35028]();
}

uint64_t sub_24162E828()
{
  return MEMORY[0x270F35030]();
}

uint64_t sub_24162E848()
{
  return MEMORY[0x270F35088]();
}

uint64_t sub_24162E858()
{
  return MEMORY[0x270F350C0]();
}

uint64_t sub_24162E868()
{
  return MEMORY[0x270F350D0]();
}

uint64_t sub_24162E878()
{
  return MEMORY[0x270F37018]();
}

uint64_t sub_24162E888()
{
  return MEMORY[0x270F37020]();
}

uint64_t sub_24162E898()
{
  return MEMORY[0x270F357D0]();
}

uint64_t sub_24162E8A8()
{
  return MEMORY[0x270F357D8]();
}

uint64_t sub_24162E8B8()
{
  return MEMORY[0x270F35868]();
}

uint64_t sub_24162E8C8()
{
  return MEMORY[0x270F35870]();
}

uint64_t sub_24162E8D8()
{
  return MEMORY[0x270F35878]();
}

uint64_t sub_24162E8E8()
{
  return MEMORY[0x270F35948]();
}

uint64_t sub_24162E8F8()
{
  return MEMORY[0x270F35A70]();
}

uint64_t sub_24162E908()
{
  return MEMORY[0x270F35A78]();
}

uint64_t sub_24162E918()
{
  return MEMORY[0x270F35A80]();
}

uint64_t sub_24162E928()
{
  return MEMORY[0x270F35AD8]();
}

uint64_t sub_24162E938()
{
  return MEMORY[0x270F35AE0]();
}

uint64_t sub_24162E948()
{
  return MEMORY[0x270F35AE8]();
}

uint64_t sub_24162E958()
{
  return MEMORY[0x270F35B28]();
}

uint64_t sub_24162E968()
{
  return MEMORY[0x270F35B30]();
}

uint64_t sub_24162E978()
{
  return MEMORY[0x270F35B38]();
}

uint64_t sub_24162E988()
{
  return MEMORY[0x270F35B40]();
}

uint64_t sub_24162E9A8()
{
  return MEMORY[0x270F35ED0]();
}

uint64_t sub_24162E9B8()
{
  return MEMORY[0x270F35ED8]();
}

uint64_t sub_24162E9C8()
{
  return MEMORY[0x270F35EE0]();
}

uint64_t sub_24162E9D8()
{
  return MEMORY[0x270F35EE8]();
}

uint64_t sub_24162E9E8()
{
  return MEMORY[0x270F35EF0]();
}

uint64_t sub_24162E9F8()
{
  return MEMORY[0x270F35EF8]();
}

uint64_t sub_24162EA08()
{
  return MEMORY[0x270F35F00]();
}

uint64_t sub_24162EA18()
{
  return MEMORY[0x270F35F18]();
}

uint64_t sub_24162EA28()
{
  return MEMORY[0x270F35F28]();
}

uint64_t sub_24162EA38()
{
  return MEMORY[0x270F35F40]();
}

uint64_t sub_24162EA58()
{
  return MEMORY[0x270F36DF8]();
}

uint64_t sub_24162EA68()
{
  return MEMORY[0x270F36E10]();
}

uint64_t sub_24162EA78()
{
  return MEMORY[0x270F35F50]();
}

uint64_t sub_24162EA88()
{
  return MEMORY[0x270F35F68]();
}

uint64_t sub_24162EA98()
{
  return MEMORY[0x270F35F88]();
}

uint64_t sub_24162EAA8()
{
  return MEMORY[0x270F35FA8]();
}

uint64_t sub_24162EAB8()
{
  return MEMORY[0x270F35FB0]();
}

uint64_t sub_24162EAC8()
{
  return MEMORY[0x270F35FF8]();
}

uint64_t sub_24162EAD8()
{
  return MEMORY[0x270F36000]();
}

uint64_t sub_24162EAE8()
{
  return MEMORY[0x270F36020]();
}

uint64_t sub_24162EAF8()
{
  return MEMORY[0x270F36048]();
}

uint64_t sub_24162EB08()
{
  return MEMORY[0x270F36060]();
}

uint64_t sub_24162EB18()
{
  return MEMORY[0x270F36068]();
}

uint64_t sub_24162EB28()
{
  return MEMORY[0x270F36070]();
}

uint64_t sub_24162EB38()
{
  return MEMORY[0x270F36080]();
}

uint64_t sub_24162EB48()
{
  return MEMORY[0x270F36088]();
}

uint64_t sub_24162EB58()
{
  return MEMORY[0x270F36090]();
}

uint64_t sub_24162EB68()
{
  return MEMORY[0x270F36098]();
}

uint64_t sub_24162EB78()
{
  return MEMORY[0x270F360A0]();
}

uint64_t sub_24162EB88()
{
  return MEMORY[0x270F360A8]();
}

uint64_t sub_24162EB98()
{
  return MEMORY[0x270F360B0]();
}

uint64_t sub_24162EBA8()
{
  return MEMORY[0x270F360C8]();
}

uint64_t sub_24162EBB8()
{
  return MEMORY[0x270F360D0]();
}

uint64_t sub_24162EBC8()
{
  return MEMORY[0x270F36110]();
}

uint64_t sub_24162EBD8()
{
  return MEMORY[0x270F36118]();
}

uint64_t sub_24162EBE8()
{
  return MEMORY[0x270F36120]();
}

uint64_t sub_24162EBF8()
{
  return MEMORY[0x270F36128]();
}

uint64_t sub_24162EC08()
{
  return MEMORY[0x270F36130]();
}

uint64_t sub_24162EC18()
{
  return MEMORY[0x270F38590]();
}

uint64_t sub_24162EC28()
{
  return MEMORY[0x270F38598]();
}

uint64_t sub_24162EC38()
{
  return MEMORY[0x270F388E0]();
}

uint64_t sub_24162EC48()
{
  return MEMORY[0x270F388E8]();
}

uint64_t sub_24162EC58()
{
  return MEMORY[0x270F38AF0]();
}

uint64_t sub_24162EC68()
{
  return MEMORY[0x270F38AF8]();
}

uint64_t sub_24162EC78()
{
  return MEMORY[0x270F38B00]();
}

uint64_t sub_24162EC88()
{
  return MEMORY[0x270F38BE0]();
}

uint64_t sub_24162EC98()
{
  return MEMORY[0x270F38BE8]();
}

uint64_t sub_24162ECA8()
{
  return MEMORY[0x270F38BF8]();
}

uint64_t sub_24162ECB8()
{
  return MEMORY[0x270F38C00]();
}

uint64_t sub_24162ECC8()
{
  return MEMORY[0x270F38C08]();
}

uint64_t sub_24162ECD8()
{
  return MEMORY[0x270F38C60]();
}

uint64_t sub_24162ECE8()
{
  return MEMORY[0x270F38C68]();
}

uint64_t sub_24162ECF8()
{
  return MEMORY[0x270F35D68]();
}

uint64_t sub_24162ED08()
{
  return MEMORY[0x270F35D70]();
}

uint64_t sub_24162ED18()
{
  return MEMORY[0x270F35D78]();
}

uint64_t sub_24162ED28()
{
  return MEMORY[0x270F35D80]();
}

uint64_t sub_24162ED38()
{
  return MEMORY[0x270F35D88]();
}

uint64_t sub_24162ED48()
{
  return MEMORY[0x270F35D90]();
}

uint64_t sub_24162ED58()
{
  return MEMORY[0x270F35D98]();
}

uint64_t sub_24162ED68()
{
  return MEMORY[0x270F35DA8]();
}

uint64_t sub_24162ED78()
{
  return MEMORY[0x270F35DB0]();
}

uint64_t sub_24162ED88()
{
  return MEMORY[0x270F30ED8]();
}

uint64_t sub_24162ED98()
{
  return MEMORY[0x270F30EE0]();
}

uint64_t sub_24162EDA8()
{
  return MEMORY[0x270F30EE8]();
}

uint64_t sub_24162EDB8()
{
  return MEMORY[0x270F30EF8]();
}

uint64_t sub_24162EDC8()
{
  return MEMORY[0x270F355F0]();
}

uint64_t sub_24162EDD8()
{
  return MEMORY[0x270F35698]();
}

uint64_t sub_24162EDE8()
{
  return MEMORY[0x270F371E8]();
}

uint64_t sub_24162EDF8()
{
  return MEMORY[0x270F37208]();
}

uint64_t sub_24162EE08()
{
  return MEMORY[0x270F37210]();
}

uint64_t sub_24162EE18()
{
  return MEMORY[0x270F37258]();
}

uint64_t sub_24162EE28()
{
  return MEMORY[0x270F37270]();
}

uint64_t sub_24162EE38()
{
  return MEMORY[0x270F37278]();
}

uint64_t sub_24162EE48()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24162EE58()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_24162EE68()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_24162EE78()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_24162EE88()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_24162EE98()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_24162EEA8()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_24162EEB8()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_24162EEC8()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_24162EED8()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_24162EEE8()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_24162EEF8()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_24162EF08()
{
  return MEMORY[0x270F36E38]();
}

uint64_t sub_24162EF18()
{
  return MEMORY[0x270F36E40]();
}

uint64_t sub_24162EF28()
{
  return MEMORY[0x270F36E48]();
}

uint64_t sub_24162EF38()
{
  return MEMORY[0x270F36E60]();
}

uint64_t sub_24162EF48()
{
  return MEMORY[0x270F36E68]();
}

uint64_t sub_24162EF58()
{
  return MEMORY[0x270F36E78]();
}

uint64_t sub_24162EF68()
{
  return MEMORY[0x270F36E98]();
}

uint64_t sub_24162EF78()
{
  return MEMORY[0x270F36EB0]();
}

uint64_t sub_24162EF88()
{
  return MEMORY[0x270F35100]();
}

uint64_t sub_24162EF98()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24162EFA8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24162EFB8()
{
  return MEMORY[0x270F81748]();
}

uint64_t sub_24162EFC8()
{
  return MEMORY[0x270F81750]();
}

uint64_t sub_24162EFD8()
{
  return MEMORY[0x270F81760]();
}

uint64_t sub_24162EFE8()
{
  return MEMORY[0x270F81768]();
}

uint64_t sub_24162EFF8()
{
  return MEMORY[0x270F81940]();
}

uint64_t sub_24162F008()
{
  return MEMORY[0x270F81960]();
}

uint64_t sub_24162F018()
{
  return MEMORY[0x270F81978]();
}

uint64_t sub_24162F028()
{
  return MEMORY[0x270F81990]();
}

uint64_t sub_24162F038()
{
  return MEMORY[0x270F81998]();
}

uint64_t sub_24162F048()
{
  return MEMORY[0x270F819A0]();
}

uint64_t sub_24162F058()
{
  return MEMORY[0x270F819A8]();
}

uint64_t sub_24162F068()
{
  return MEMORY[0x270F819B0]();
}

uint64_t sub_24162F078()
{
  return MEMORY[0x270F819C8]();
}

uint64_t sub_24162F088()
{
  return MEMORY[0x270F819D0]();
}

uint64_t sub_24162F098()
{
  return MEMORY[0x270F81A18]();
}

uint64_t sub_24162F0A8()
{
  return MEMORY[0x270F81C48]();
}

uint64_t sub_24162F0B8()
{
  return MEMORY[0x270F81C58]();
}

uint64_t sub_24162F0C8()
{
  return MEMORY[0x270F81C60]();
}

uint64_t sub_24162F0D8()
{
  return MEMORY[0x270F81C68]();
}

uint64_t sub_24162F0E8()
{
  return MEMORY[0x270F81C80]();
}

uint64_t sub_24162F0F8()
{
  return MEMORY[0x270F81C90]();
}

uint64_t sub_24162F108()
{
  return MEMORY[0x270F81CC8]();
}

uint64_t sub_24162F118()
{
  return MEMORY[0x270F81CD0]();
}

uint64_t sub_24162F128()
{
  return MEMORY[0x270F81CD8]();
}

uint64_t sub_24162F138()
{
  return MEMORY[0x270F81CE0]();
}

uint64_t sub_24162F148()
{
  return MEMORY[0x270F81CF8]();
}

uint64_t sub_24162F158()
{
  return MEMORY[0x270F81D08]();
}

uint64_t sub_24162F168()
{
  return MEMORY[0x270F81D10]();
}

uint64_t sub_24162F178()
{
  return MEMORY[0x270F81D18]();
}

uint64_t sub_24162F188()
{
  return MEMORY[0x270F81D28]();
}

uint64_t sub_24162F198()
{
  return MEMORY[0x270F81D58]();
}

uint64_t sub_24162F1A8()
{
  return MEMORY[0x270F81D68]();
}

uint64_t sub_24162F1B8()
{
  return MEMORY[0x270F81D70]();
}

uint64_t sub_24162F1C8()
{
  return MEMORY[0x270F81D80]();
}

uint64_t sub_24162F1D8()
{
  return MEMORY[0x270F81D88]();
}

uint64_t sub_24162F1E8()
{
  return MEMORY[0x270F81D98]();
}

uint64_t sub_24162F1F8()
{
  return MEMORY[0x270F81DA0]();
}

uint64_t sub_24162F208()
{
  return MEMORY[0x270F81DA8]();
}

uint64_t sub_24162F218()
{
  return MEMORY[0x270F81DB0]();
}

uint64_t sub_24162F228()
{
  return MEMORY[0x270F81DB8]();
}

uint64_t sub_24162F238()
{
  return MEMORY[0x270F81DC0]();
}

uint64_t sub_24162F248()
{
  return MEMORY[0x270F81DC8]();
}

uint64_t sub_24162F258()
{
  return MEMORY[0x270F81DD8]();
}

uint64_t sub_24162F268()
{
  return MEMORY[0x270F81DF0]();
}

uint64_t sub_24162F278()
{
  return MEMORY[0x270F81DF8]();
}

uint64_t sub_24162F288()
{
  return MEMORY[0x270F81E50]();
}

uint64_t sub_24162F298()
{
  return MEMORY[0x270F81E60]();
}

uint64_t sub_24162F2A8()
{
  return MEMORY[0x270F81E68]();
}

uint64_t sub_24162F2B8()
{
  return MEMORY[0x270F81E80]();
}

uint64_t sub_24162F2C8()
{
  return MEMORY[0x270F81E88]();
}

uint64_t sub_24162F2D8()
{
  return MEMORY[0x270F81E98]();
}

uint64_t sub_24162F2E8()
{
  return MEMORY[0x270F81EA8]();
}

uint64_t sub_24162F2F8()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t sub_24162F308()
{
  return MEMORY[0x270F81EC8]();
}

uint64_t sub_24162F318()
{
  return MEMORY[0x270F81ED0]();
}

uint64_t sub_24162F328()
{
  return MEMORY[0x270F81ED8]();
}

uint64_t sub_24162F338()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_24162F348()
{
  return MEMORY[0x270F81EF0]();
}

uint64_t sub_24162F358()
{
  return MEMORY[0x270F81F60]();
}

uint64_t sub_24162F368()
{
  return MEMORY[0x270F81F70]();
}

uint64_t sub_24162F378()
{
  return MEMORY[0x270F81F98]();
}

uint64_t sub_24162F388()
{
  return MEMORY[0x270F81FA8]();
}

uint64_t sub_24162F398()
{
  return MEMORY[0x270F81FB0]();
}

uint64_t sub_24162F3A8()
{
  return MEMORY[0x270F81FC8]();
}

uint64_t sub_24162F3B8()
{
  return MEMORY[0x270F81FE0]();
}

uint64_t sub_24162F3C8()
{
  return MEMORY[0x270F81FF0]();
}

uint64_t sub_24162F3D8()
{
  return MEMORY[0x270F82000]();
}

uint64_t sub_24162F3E8()
{
  return MEMORY[0x270F82018]();
}

uint64_t sub_24162F3F8()
{
  return MEMORY[0x270F82028]();
}

uint64_t sub_24162F408()
{
  return MEMORY[0x270F82040]();
}

uint64_t sub_24162F418()
{
  return MEMORY[0x270F82058]();
}

uint64_t sub_24162F428()
{
  return MEMORY[0x270F82068]();
}

uint64_t sub_24162F438()
{
  return MEMORY[0x270F82090]();
}

uint64_t sub_24162F448()
{
  return MEMORY[0x270F82098]();
}

uint64_t sub_24162F458()
{
  return MEMORY[0x270F820A0]();
}

uint64_t sub_24162F468()
{
  return MEMORY[0x270F820B0]();
}

uint64_t sub_24162F478()
{
  return MEMORY[0x270F820B8]();
}

uint64_t sub_24162F488()
{
  return MEMORY[0x270F820C0]();
}

uint64_t sub_24162F498()
{
  return MEMORY[0x270F820C8]();
}

uint64_t sub_24162F4A8()
{
  return MEMORY[0x270F820D8]();
}

uint64_t sub_24162F4B8()
{
  return MEMORY[0x270F82138]();
}

uint64_t sub_24162F4C8()
{
  return MEMORY[0x270F82148]();
}

uint64_t sub_24162F4D8()
{
  return MEMORY[0x270F82150]();
}

uint64_t sub_24162F4E8()
{
  return MEMORY[0x270F82158]();
}

uint64_t sub_24162F4F8()
{
  return MEMORY[0x270F82270]();
}

uint64_t sub_24162F508()
{
  return MEMORY[0x270F82280]();
}

uint64_t sub_24162F518()
{
  return MEMORY[0x270F822D0]();
}

uint64_t sub_24162F528()
{
  return MEMORY[0x270F82340]();
}

uint64_t sub_24162F538()
{
  return MEMORY[0x270F82348]();
}

uint64_t sub_24162F548()
{
  return MEMORY[0x270F82358]();
}

uint64_t sub_24162F558()
{
  return MEMORY[0x270F82360]();
}

uint64_t sub_24162F568()
{
  return MEMORY[0x270F82370]();
}

uint64_t sub_24162F578()
{
  return MEMORY[0x270F82378]();
}

uint64_t sub_24162F588()
{
  return MEMORY[0x270F82380]();
}

uint64_t sub_24162F598()
{
  return MEMORY[0x270F82390]();
}

uint64_t sub_24162F5A8()
{
  return MEMORY[0x270F82398]();
}

uint64_t sub_24162F5B8()
{
  return MEMORY[0x270F823A0]();
}

uint64_t sub_24162F5C8()
{
  return MEMORY[0x270EE2B40]();
}

uint64_t sub_24162F5D8()
{
  return MEMORY[0x270EE2B48]();
}

uint64_t sub_24162F5E8()
{
  return MEMORY[0x270EE2B58]();
}

uint64_t sub_24162F5F8()
{
  return MEMORY[0x270EE2B60]();
}

uint64_t sub_24162F608()
{
  return MEMORY[0x270EE2B68]();
}

uint64_t sub_24162F618()
{
  return MEMORY[0x270EE2B70]();
}

uint64_t sub_24162F628()
{
  return MEMORY[0x270EE2B78]();
}

uint64_t sub_24162F638()
{
  return MEMORY[0x270EE2B90]();
}

uint64_t sub_24162F648()
{
  return MEMORY[0x270EE2BA8]();
}

uint64_t sub_24162F658()
{
  return MEMORY[0x270EE2BB8]();
}

uint64_t sub_24162F668()
{
  return MEMORY[0x270EE2BF0]();
}

uint64_t sub_24162F678()
{
  return MEMORY[0x270EE2C20]();
}

uint64_t sub_24162F688()
{
  return MEMORY[0x270EE2C28]();
}

uint64_t sub_24162F698()
{
  return MEMORY[0x270EE2C50]();
}

uint64_t sub_24162F6A8()
{
  return MEMORY[0x270EE2C58]();
}

uint64_t sub_24162F6B8()
{
  return MEMORY[0x270EE2C70]();
}

uint64_t sub_24162F6C8()
{
  return MEMORY[0x270EE2C78]();
}

uint64_t sub_24162F6D8()
{
  return MEMORY[0x270EE2C98]();
}

uint64_t sub_24162F6E8()
{
  return MEMORY[0x270EE2CA0]();
}

uint64_t sub_24162F6F8()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_24162F708()
{
  return MEMORY[0x270EE2D30]();
}

uint64_t sub_24162F718()
{
  return MEMORY[0x270EE2D88]();
}

uint64_t sub_24162F728()
{
  return MEMORY[0x270EE2D90]();
}

uint64_t sub_24162F738()
{
  return MEMORY[0x270EE2DB0]();
}

uint64_t sub_24162F748()
{
  return MEMORY[0x270EE2DB8]();
}

uint64_t sub_24162F758()
{
  return MEMORY[0x270EE2DD8]();
}

uint64_t sub_24162F768()
{
  return MEMORY[0x270EE2DE0]();
}

uint64_t sub_24162F778()
{
  return MEMORY[0x270EE2E00]();
}

uint64_t sub_24162F788()
{
  return MEMORY[0x270EE2E48]();
}

uint64_t sub_24162F798()
{
  return MEMORY[0x270EE2ED8]();
}

uint64_t sub_24162F7A8()
{
  return MEMORY[0x270EE2EE0]();
}

uint64_t sub_24162F7B8()
{
  return MEMORY[0x270EE2EE8]();
}

uint64_t sub_24162F7C8()
{
  return MEMORY[0x270EE2EF0]();
}

uint64_t sub_24162F7D8()
{
  return MEMORY[0x270EE2F98]();
}

uint64_t sub_24162F7E8()
{
  return MEMORY[0x270EE2FA8]();
}

uint64_t sub_24162F7F8()
{
  return MEMORY[0x270EE2FC0]();
}

uint64_t sub_24162F808()
{
  return MEMORY[0x270EE2FD0]();
}

uint64_t sub_24162F818()
{
  return MEMORY[0x270EE2FD8]();
}

uint64_t sub_24162F828()
{
  return MEMORY[0x270EE3010]();
}

uint64_t sub_24162F838()
{
  return MEMORY[0x270EE3040]();
}

uint64_t sub_24162F848()
{
  return MEMORY[0x270EE3048]();
}

uint64_t sub_24162F858()
{
  return MEMORY[0x270EE3058]();
}

uint64_t sub_24162F868()
{
  return MEMORY[0x270F36EC0]();
}

uint64_t sub_24162F878()
{
  return MEMORY[0x270EE3840]();
}

uint64_t sub_24162F888()
{
  return MEMORY[0x270EE3848]();
}

uint64_t sub_24162F898()
{
  return MEMORY[0x270F36EC8]();
}

uint64_t sub_24162F8A8()
{
  return MEMORY[0x270EE3850]();
}

uint64_t sub_24162F8B8()
{
  return MEMORY[0x270EE3858]();
}

uint64_t sub_24162F8C8()
{
  return MEMORY[0x270F36ED0]();
}

uint64_t sub_24162F8D8()
{
  return MEMORY[0x270EE3860]();
}

uint64_t sub_24162F8E8()
{
  return MEMORY[0x270EE3868]();
}

uint64_t sub_24162F8F8()
{
  return MEMORY[0x270EE3878]();
}

uint64_t sub_24162F908()
{
  return MEMORY[0x270EE3880]();
}

uint64_t sub_24162F918()
{
  return MEMORY[0x270EE38B0]();
}

uint64_t sub_24162F928()
{
  return MEMORY[0x270EE3900]();
}

uint64_t sub_24162F938()
{
  return MEMORY[0x270EE3930]();
}

uint64_t sub_24162F948()
{
  return MEMORY[0x270EE3948]();
}

uint64_t sub_24162F958()
{
  return MEMORY[0x270EE3950]();
}

uint64_t sub_24162F968()
{
  return MEMORY[0x270EE3968]();
}

uint64_t sub_24162F978()
{
  return MEMORY[0x270EE3988]();
}

uint64_t sub_24162F988()
{
  return MEMORY[0x270EE3998]();
}

uint64_t sub_24162F998()
{
  return MEMORY[0x270EE39C0]();
}

uint64_t sub_24162F9A8()
{
  return MEMORY[0x270EE39C8]();
}

uint64_t sub_24162F9B8()
{
  return MEMORY[0x270EE39D8]();
}

uint64_t sub_24162F9C8()
{
  return MEMORY[0x270EE3A40]();
}

uint64_t sub_24162F9D8()
{
  return MEMORY[0x270EE3A48]();
}

uint64_t sub_24162F9E8()
{
  return MEMORY[0x270EE3A78]();
}

uint64_t sub_24162F9F8()
{
  return MEMORY[0x270EE3A88]();
}

uint64_t sub_24162FA08()
{
  return MEMORY[0x270EE3A90]();
}

uint64_t sub_24162FA18()
{
  return MEMORY[0x270EE3AB8]();
}

uint64_t sub_24162FA28()
{
  return MEMORY[0x270EE3AC0]();
}

uint64_t sub_24162FA38()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t sub_24162FA48()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_24162FA58()
{
  return MEMORY[0x270F34CD0]();
}

uint64_t sub_24162FA68()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_24162FA78()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_24162FA88()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_24162FA98()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_24162FAA8()
{
  return MEMORY[0x270EE3BD0]();
}

uint64_t sub_24162FAB8()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_24162FAC8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24162FAD8()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_24162FAE8()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_24162FAF8()
{
  return MEMORY[0x270EE3C78]();
}

uint64_t sub_24162FB08()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_24162FB18()
{
  return MEMORY[0x270EE3C90]();
}

uint64_t sub_24162FB28()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_24162FB38()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t sub_24162FB48()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_24162FB58()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_24162FB68()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_24162FB78()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_24162FB88()
{
  return MEMORY[0x270EE3D18]();
}

uint64_t sub_24162FB98()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_24162FBA8()
{
  return MEMORY[0x270EE3D50]();
}

uint64_t sub_24162FBB8()
{
  return MEMORY[0x270EE3D68]();
}

uint64_t sub_24162FBC8()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_24162FBD8()
{
  return MEMORY[0x270EE3D90]();
}

uint64_t sub_24162FBE8()
{
  return MEMORY[0x270EE3D98]();
}

uint64_t sub_24162FBF8()
{
  return MEMORY[0x270EE3DA0]();
}

uint64_t sub_24162FC08()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24162FC18()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_24162FC28()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_24162FC38()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_24162FC48()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24162FC58()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24162FC68()
{
  return MEMORY[0x270EE3DE8]();
}

uint64_t sub_24162FC78()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24162FC88()
{
  return MEMORY[0x270F36F00]();
}

uint64_t sub_24162FC98()
{
  return MEMORY[0x270F36F10]();
}

uint64_t sub_24162FCA8()
{
  return MEMORY[0x270F36F18]();
}

uint64_t sub_24162FCB8()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_24162FCC8()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_24162FCD8()
{
  return MEMORY[0x270EE3E50]();
}

uint64_t sub_24162FCE8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_24162FCF8()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_24162FD08()
{
  return MEMORY[0x270EE3EA0]();
}

uint64_t sub_24162FD18()
{
  return MEMORY[0x270EE3EB8]();
}

uint64_t sub_24162FD28()
{
  return MEMORY[0x270EE3EC8]();
}

uint64_t sub_24162FD38()
{
  return MEMORY[0x270EE3ED0]();
}

uint64_t sub_24162FD48()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_24162FD58()
{
  return MEMORY[0x270EE3F40]();
}

uint64_t sub_24162FD68()
{
  return MEMORY[0x270EE3F58]();
}

uint64_t sub_24162FD78()
{
  return MEMORY[0x270EE3F60]();
}

uint64_t sub_24162FD88()
{
  return MEMORY[0x270EE3F68]();
}

uint64_t sub_24162FD98()
{
  return MEMORY[0x270EE3F70]();
}

uint64_t sub_24162FDA8()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_24162FDB8()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_24162FDC8()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_24162FDD8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24162FDE8()
{
  return MEMORY[0x270EE4010]();
}

uint64_t sub_24162FDF8()
{
  return MEMORY[0x270EE4018]();
}

uint64_t sub_24162FE08()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_24162FE18()
{
  return MEMORY[0x270EE4030]();
}

uint64_t sub_24162FE28()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_24162FE38()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24162FE48()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24162FE58()
{
  return MEMORY[0x270EFECD8]();
}

uint64_t sub_24162FE68()
{
  return MEMORY[0x270EFECE0]();
}

uint64_t sub_24162FE78()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24162FE88()
{
  return MEMORY[0x270F35DB8]();
}

uint64_t sub_24162FE98()
{
  return MEMORY[0x270EFEDC8]();
}

uint64_t sub_24162FEA8()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_24162FEB8()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_24162FEC8()
{
  return MEMORY[0x270EFEEC0]();
}

uint64_t sub_24162FED8()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_24162FEE8()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24162FEF8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24162FF08()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24162FF18()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_24162FF28()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24162FF38()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_24162FF48()
{
  return MEMORY[0x270EFF180]();
}

uint64_t sub_24162FF58()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_24162FF68()
{
  return MEMORY[0x270EFF230]();
}

uint64_t sub_24162FF78()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24162FF88()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24162FF98()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24162FFA8()
{
  return MEMORY[0x270EFF558]();
}

uint64_t sub_24162FFB8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24162FFC8()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_24162FFD8()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_24162FFE8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24162FFF8()
{
  return MEMORY[0x270EFF818]();
}

uint64_t sub_241630008()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_241630018()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_241630028()
{
  return MEMORY[0x270EFF918]();
}

uint64_t sub_241630038()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_241630048()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_241630058()
{
  return MEMORY[0x270EFFAE0]();
}

uint64_t sub_241630068()
{
  return MEMORY[0x270EFFB00]();
}

uint64_t sub_241630078()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_241630088()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_241630098()
{
  return MEMORY[0x270EFFB70]();
}

uint64_t sub_2416300A8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2416300B8()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_2416300C8()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_2416300D8()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_2416300E8()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_2416300F8()
{
  return MEMORY[0x270EFFDB0]();
}

uint64_t sub_241630108()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_241630118()
{
  return MEMORY[0x270EFFEC0]();
}

uint64_t sub_241630128()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_241630138()
{
  return MEMORY[0x270F00068]();
}

uint64_t sub_241630148()
{
  return MEMORY[0x270F00070]();
}

uint64_t sub_241630158()
{
  return MEMORY[0x270F000E0]();
}

uint64_t sub_241630168()
{
  return MEMORY[0x270F00118]();
}

uint64_t sub_241630178()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_241630188()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_241630198()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_2416301A8()
{
  return MEMORY[0x270F001D8]();
}

uint64_t sub_2416301B8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2416301C8()
{
  return MEMORY[0x270F00618]();
}

uint64_t sub_2416301D8()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_2416301E8()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_2416301F8()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_241630208()
{
  return MEMORY[0x270F00698]();
}

uint64_t sub_241630218()
{
  return MEMORY[0x270F00820]();
}

uint64_t sub_241630228()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_241630238()
{
  return MEMORY[0x270F00838]();
}

uint64_t sub_241630248()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_241630258()
{
  return MEMORY[0x270F35DC0]();
}

uint64_t sub_241630268()
{
  return MEMORY[0x270F35DC8]();
}

uint64_t sub_241630278()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_241630288()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_241630298()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2416302A8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_2416302B8()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_2416302C8()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_2416302D8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2416302E8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2416302F8()
{
  return MEMORY[0x270F00B68]();
}

uint64_t sub_241630308()
{
  return MEMORY[0x270F00B70]();
}

uint64_t sub_241630318()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_241630328()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_241630338()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_241630348()
{
  return MEMORY[0x270F00BD0]();
}

uint64_t sub_241630358()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_241630368()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_241630378()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_241630388()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_241630398()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_2416303A8()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_2416303B8()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_2416303C8()
{
  return MEMORY[0x270F00E28]();
}

uint64_t sub_2416303D8()
{
  return MEMORY[0x270F00E30]();
}

uint64_t sub_2416303E8()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_2416303F8()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_241630408()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_241630418()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_241630428()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_241630438()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_241630448()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_241630458()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_241630468()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_241630478()
{
  return MEMORY[0x270F01028]();
}

uint64_t sub_241630488()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_241630498()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2416304A8()
{
  return MEMORY[0x270F011B8]();
}

uint64_t sub_2416304B8()
{
  return MEMORY[0x270F011C0]();
}

uint64_t sub_2416304C8()
{
  return MEMORY[0x270F011D0]();
}

uint64_t sub_2416304D8()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_2416304E8()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2416304F8()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_241630508()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_241630518()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_241630528()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_241630538()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_241630548()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_241630558()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_241630568()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_241630578()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_241630588()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_241630598()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2416305A8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2416305B8()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_2416305C8()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_2416305D8()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_2416305E8()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_2416305F8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_241630608()
{
  return MEMORY[0x270F016D0]();
}

uint64_t sub_241630618()
{
  return MEMORY[0x270F017E8]();
}

uint64_t sub_241630628()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_241630638()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_241630648()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_241630658()
{
  return MEMORY[0x270F01880]();
}

uint64_t sub_241630668()
{
  return MEMORY[0x270F01888]();
}

uint64_t sub_241630678()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_241630688()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_241630698()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_2416306A8()
{
  return MEMORY[0x270F01A50]();
}

uint64_t sub_2416306B8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_2416306C8()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_2416306D8()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_2416306E8()
{
  return MEMORY[0x270F01B98]();
}

uint64_t sub_2416306F8()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_241630708()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_241630718()
{
  return MEMORY[0x270F01C30]();
}

uint64_t sub_241630728()
{
  return MEMORY[0x270F01C58]();
}

uint64_t sub_241630738()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_241630748()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_241630758()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_241630768()
{
  return MEMORY[0x270F01E00]();
}

uint64_t sub_241630778()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_241630788()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_241630798()
{
  return MEMORY[0x270F01E38]();
}

uint64_t sub_2416307A8()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_2416307B8()
{
  return MEMORY[0x270F01F00]();
}

uint64_t sub_2416307C8()
{
  return MEMORY[0x270F01F10]();
}

uint64_t sub_2416307D8()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_2416307E8()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_2416307F8()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_241630808()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_241630818()
{
  return MEMORY[0x270F020D8]();
}

uint64_t sub_241630828()
{
  return MEMORY[0x270F02238]();
}

uint64_t sub_241630838()
{
  return MEMORY[0x270F02258]();
}

uint64_t sub_241630848()
{
  return MEMORY[0x270F02358]();
}

uint64_t sub_241630858()
{
  return MEMORY[0x270F02360]();
}

uint64_t sub_241630868()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_241630878()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_241630888()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_241630898()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_2416308A8()
{
  return MEMORY[0x270F023D0]();
}

uint64_t sub_2416308B8()
{
  return MEMORY[0x270F02750]();
}

uint64_t sub_2416308C8()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_2416308D8()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_2416308E8()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_2416308F8()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_241630908()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_241630918()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_241630928()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_241630938()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_241630948()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_241630958()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_241630968()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_241630978()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_241630988()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_241630998()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_2416309A8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2416309B8()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_2416309C8()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_2416309D8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2416309E8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_2416309F8()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_241630A08()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_241630A18()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_241630A28()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_241630A38()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_241630A48()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_241630A58()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_241630A68()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_241630A78()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_241630A88()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_241630A98()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_241630AA8()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_241630AB8()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_241630AC8()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_241630AD8()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_241630AE8()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_241630AF8()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_241630B08()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_241630B18()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_241630B28()
{
  return MEMORY[0x270F02D78]();
}

uint64_t sub_241630B38()
{
  return MEMORY[0x270F02DB8]();
}

uint64_t sub_241630B48()
{
  return MEMORY[0x270F02DC0]();
}

uint64_t sub_241630B58()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_241630B68()
{
  return MEMORY[0x270F02DE8]();
}

uint64_t sub_241630B78()
{
  return MEMORY[0x270F02E08]();
}

uint64_t sub_241630B88()
{
  return MEMORY[0x270F02E10]();
}

uint64_t sub_241630B98()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_241630BA8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_241630BB8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_241630BC8()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_241630BD8()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_241630BE8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_241630BF8()
{
  return MEMORY[0x270F03220]();
}

uint64_t sub_241630C08()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_241630C18()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_241630C28()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_241630C38()
{
  return MEMORY[0x270F34CE8]();
}

uint64_t sub_241630C48()
{
  return MEMORY[0x270EE3070]();
}

uint64_t sub_241630C58()
{
  return MEMORY[0x270EE3088]();
}

uint64_t sub_241630C68()
{
  return MEMORY[0x270EE3090]();
}

uint64_t sub_241630C78()
{
  return MEMORY[0x270EE3098]();
}

uint64_t sub_241630C88()
{
  return MEMORY[0x270EE30A8]();
}

uint64_t sub_241630C98()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_241630CA8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_241630CB8()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_241630CC8()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_241630CD8()
{
  return MEMORY[0x270F03370]();
}

uint64_t sub_241630CE8()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_241630CF8()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_241630D08()
{
  return MEMORY[0x270F03590]();
}

uint64_t sub_241630D18()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_241630D28()
{
  return MEMORY[0x270F03630]();
}

uint64_t sub_241630D38()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_241630D48()
{
  return MEMORY[0x270F037B0]();
}

uint64_t sub_241630D58()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_241630D68()
{
  return MEMORY[0x270F03870]();
}

uint64_t sub_241630D78()
{
  return MEMORY[0x270F03938]();
}

uint64_t sub_241630D88()
{
  return MEMORY[0x270F03968]();
}

uint64_t sub_241630D98()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_241630DA8()
{
  return MEMORY[0x270F039D0]();
}

uint64_t sub_241630DB8()
{
  return MEMORY[0x270F03A00]();
}

uint64_t sub_241630DC8()
{
  return MEMORY[0x270F03A40]();
}

uint64_t sub_241630DD8()
{
  return MEMORY[0x270F03A58]();
}

uint64_t sub_241630DE8()
{
  return MEMORY[0x270F03A60]();
}

uint64_t sub_241630DF8()
{
  return MEMORY[0x270F03A68]();
}

uint64_t sub_241630E08()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_241630E18()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_241630E28()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_241630E38()
{
  return MEMORY[0x270F03CE8]();
}

uint64_t sub_241630E48()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_241630E58()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_241630E68()
{
  return MEMORY[0x270F03F00]();
}

uint64_t sub_241630E78()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_241630E88()
{
  return MEMORY[0x270F03FD0]();
}

uint64_t sub_241630E98()
{
  return MEMORY[0x270F03FE0]();
}

uint64_t sub_241630EA8()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_241630EB8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_241630EC8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_241630ED8()
{
  return MEMORY[0x270F04140]();
}

uint64_t sub_241630EE8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_241630EF8()
{
  return MEMORY[0x270F04210]();
}

uint64_t sub_241630F08()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_241630F18()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_241630F28()
{
  return MEMORY[0x270F042E8]();
}

uint64_t sub_241630F38()
{
  return MEMORY[0x270F04300]();
}

uint64_t sub_241630F48()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_241630F58()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_241630F68()
{
  return MEMORY[0x270F736F0]();
}

uint64_t sub_241630F78()
{
  return MEMORY[0x270F736F8]();
}

uint64_t sub_241630F88()
{
  return MEMORY[0x270F73700]();
}

uint64_t sub_241630F98()
{
  return MEMORY[0x270F34CF0]();
}

uint64_t sub_241630FA8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_241630FB8()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_241630FC8()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_241630FD8()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_241630FE8()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_241630FF8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_241631008()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_241631018()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_241631028()
{
  return MEMORY[0x270F045D0]();
}

uint64_t sub_241631038()
{
  return MEMORY[0x270F045D8]();
}

uint64_t sub_241631048()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_241631058()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_241631068()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_241631078()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_241631088()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_241631098()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_2416310A8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_2416310B8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2416310C8()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_2416310D8()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2416310E8()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_2416310F8()
{
  return MEMORY[0x270F04788]();
}

uint64_t sub_241631108()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_241631118()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_241631128()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_241631138()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_241631148()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_241631158()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_241631168()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_241631178()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_241631188()
{
  return MEMORY[0x270F048E0]();
}

uint64_t sub_241631198()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_2416311A8()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_2416311B8()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_2416311C8()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_2416311D8()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_2416311E8()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_2416311F8()
{
  return MEMORY[0x270F049E8]();
}

uint64_t sub_241631208()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_241631218()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_241631228()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_241631238()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_241631248()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_241631258()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_241631268()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_241631278()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_241631288()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_241631298()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_2416312A8()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_2416312B8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_2416312C8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_2416312D8()
{
  return MEMORY[0x270EE3100]();
}

uint64_t sub_2416312E8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2416312F8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_241631308()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_241631318()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_241631328()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_241631338()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_241631348()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_241631358()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_241631368()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_241631378()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_241631388()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_241631398()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_2416313A8()
{
  return MEMORY[0x270F04E98]();
}

uint64_t sub_2416313B8()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_2416313C8()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_2416313D8()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_2416313E8()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_2416313F8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_241631408()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_241631418()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_241631428()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_241631438()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_241631448()
{
  return MEMORY[0x270F05208]();
}

uint64_t sub_241631458()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_241631468()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_241631478()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_241631488()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_241631498()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2416314A8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2416314B8()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2416314C8()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2416314D8()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_2416314E8()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_2416314F8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_241631508()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_241631518()
{
  return MEMORY[0x270F37DD8]();
}

uint64_t sub_241631528()
{
  return MEMORY[0x270F37DF8]();
}

uint64_t sub_241631538()
{
  return MEMORY[0x270F37E00]();
}

uint64_t sub_241631548()
{
  return MEMORY[0x270F37E08]();
}

uint64_t sub_241631558()
{
  return MEMORY[0x270F37E10]();
}

uint64_t sub_241631568()
{
  return MEMORY[0x270F37E18]();
}

uint64_t sub_241631578()
{
  return MEMORY[0x270F37E20]();
}

uint64_t sub_241631588()
{
  return MEMORY[0x270F37E28]();
}

uint64_t sub_241631598()
{
  return MEMORY[0x270F37E30]();
}

uint64_t sub_2416315A8()
{
  return MEMORY[0x270F37E38]();
}

uint64_t sub_2416315B8()
{
  return MEMORY[0x270F37E40]();
}

uint64_t sub_2416315C8()
{
  return MEMORY[0x270F37E48]();
}

uint64_t sub_2416315D8()
{
  return MEMORY[0x270F37E50]();
}

uint64_t sub_2416315E8()
{
  return MEMORY[0x270F37E60]();
}

uint64_t sub_2416315F8()
{
  return MEMORY[0x270F37E68]();
}

uint64_t sub_241631608()
{
  return MEMORY[0x270F37EB8]();
}

uint64_t sub_241631618()
{
  return MEMORY[0x270F37EC0]();
}

uint64_t sub_241631628()
{
  return MEMORY[0x270F37EC8]();
}

uint64_t sub_241631638()
{
  return MEMORY[0x270F37ED8]();
}

uint64_t sub_241631648()
{
  return MEMORY[0x270F37EF0]();
}

uint64_t sub_241631658()
{
  return MEMORY[0x270F37EF8]();
}

uint64_t sub_241631668()
{
  return MEMORY[0x270F37F00]();
}

uint64_t sub_241631678()
{
  return MEMORY[0x270F37F08]();
}

uint64_t sub_241631688()
{
  return MEMORY[0x270F37F10]();
}

uint64_t sub_241631698()
{
  return MEMORY[0x270F37F20]();
}

uint64_t sub_2416316A8()
{
  return MEMORY[0x270F37F28]();
}

uint64_t sub_2416316B8()
{
  return MEMORY[0x270F37F30]();
}

uint64_t sub_2416316C8()
{
  return MEMORY[0x270F37F38]();
}

uint64_t sub_2416316D8()
{
  return MEMORY[0x270F37F80]();
}

uint64_t sub_2416316E8()
{
  return MEMORY[0x270F37F88]();
}

uint64_t sub_241631708()
{
  return MEMORY[0x270F37F98]();
}

uint64_t sub_241631718()
{
  return MEMORY[0x270F37FA0]();
}

uint64_t sub_241631728()
{
  return MEMORY[0x270F37FB0]();
}

uint64_t sub_241631738()
{
  return MEMORY[0x270F37FB8]();
}

uint64_t sub_241631748()
{
  return MEMORY[0x270F37FE0]();
}

uint64_t sub_241631758()
{
  return MEMORY[0x270F37FE8]();
}

uint64_t sub_241631768()
{
  return MEMORY[0x270F37FF0]();
}

uint64_t sub_241631778()
{
  return MEMORY[0x270F38048]();
}

uint64_t sub_241631788()
{
  return MEMORY[0x270F38050]();
}

uint64_t sub_241631798()
{
  return MEMORY[0x270F380E0]();
}

uint64_t sub_2416317A8()
{
  return MEMORY[0x270F380E8]();
}

uint64_t sub_2416317B8()
{
  return MEMORY[0x270EF30B8]();
}

uint64_t sub_2416317C8()
{
  return MEMORY[0x270EF30C0]();
}

uint64_t sub_2416317D8()
{
  return MEMORY[0x270EF30C8]();
}

uint64_t sub_2416317E8()
{
  return MEMORY[0x270EF30D0]();
}

uint64_t sub_2416317F8()
{
  return MEMORY[0x270EF30D8]();
}

uint64_t sub_241631808()
{
  return MEMORY[0x270EF30E0]();
}

uint64_t sub_241631818()
{
  return MEMORY[0x270EF30E8]();
}

uint64_t sub_241631828()
{
  return MEMORY[0x270EF30F0]();
}

uint64_t sub_241631838()
{
  return MEMORY[0x270EF3108]();
}

uint64_t sub_241631848()
{
  return MEMORY[0x270EF3130]();
}

uint64_t sub_241631858()
{
  return MEMORY[0x270EF3148]();
}

uint64_t sub_241631868()
{
  return MEMORY[0x270EF3150]();
}

uint64_t sub_241631878()
{
  return MEMORY[0x270EF3168]();
}

uint64_t sub_241631888()
{
  return MEMORY[0x270EF3188]();
}

uint64_t sub_241631898()
{
  return MEMORY[0x270EF3190]();
}

uint64_t sub_2416318A8()
{
  return MEMORY[0x270EF3198]();
}

uint64_t sub_2416318B8()
{
  return MEMORY[0x270EF31A0]();
}

uint64_t sub_2416318C8()
{
  return MEMORY[0x270EF31F8]();
}

uint64_t sub_2416318E8()
{
  return MEMORY[0x270EF3208]();
}

uint64_t sub_2416318F8()
{
  return MEMORY[0x270EF3230]();
}

uint64_t sub_241631908()
{
  return MEMORY[0x270EF3238]();
}

uint64_t sub_241631918()
{
  return MEMORY[0x270EF3240]();
}

uint64_t sub_241631928()
{
  return MEMORY[0x270EF3248]();
}

uint64_t sub_241631938()
{
  return MEMORY[0x270EF3250]();
}

uint64_t sub_241631948()
{
  return MEMORY[0x270EF3258]();
}

uint64_t sub_241631968()
{
  return MEMORY[0x270EF32B8]();
}

uint64_t sub_241631978()
{
  return MEMORY[0x270EF32C0]();
}

uint64_t sub_241631998()
{
  return MEMORY[0x270EF32F8]();
}

uint64_t sub_2416319A8()
{
  return MEMORY[0x270EF3300]();
}

uint64_t sub_2416319B8()
{
  return MEMORY[0x270EF3308]();
}

uint64_t sub_2416319C8()
{
  return MEMORY[0x270EF3310]();
}

uint64_t sub_2416319D8()
{
  return MEMORY[0x270F35118]();
}

uint64_t sub_2416319E8()
{
  return MEMORY[0x270EF3320]();
}

uint64_t sub_2416319F8()
{
  return MEMORY[0x270EF3328]();
}

uint64_t sub_241631A08()
{
  return MEMORY[0x270EF3330]();
}

uint64_t sub_241631A18()
{
  return MEMORY[0x270EF3338]();
}

uint64_t sub_241631A28()
{
  return MEMORY[0x270EF3340]();
}

uint64_t sub_241631A38()
{
  return MEMORY[0x270EF3348]();
}

uint64_t sub_241631A48()
{
  return MEMORY[0x270EF3350]();
}

uint64_t sub_241631A58()
{
  return MEMORY[0x270EF3358]();
}

uint64_t sub_241631A68()
{
  return MEMORY[0x270EF3360]();
}

uint64_t sub_241631A78()
{
  return MEMORY[0x270EF3368]();
}

uint64_t sub_241631A88()
{
  return MEMORY[0x270EF3370]();
}

uint64_t sub_241631A98()
{
  return MEMORY[0x270EF3378]();
}

uint64_t sub_241631AA8()
{
  return MEMORY[0x270EF3380]();
}

uint64_t sub_241631AB8()
{
  return MEMORY[0x270EF3388]();
}

uint64_t sub_241631AC8()
{
  return MEMORY[0x270EF3390]();
}

uint64_t sub_241631AD8()
{
  return MEMORY[0x270F075F0]();
}

uint64_t sub_241631AE8()
{
  return MEMORY[0x270F075F8]();
}

uint64_t sub_241631AF8()
{
  return MEMORY[0x270F07600]();
}

uint64_t sub_241631B08()
{
  return MEMORY[0x270EF17F8]();
}

uint64_t sub_241631B18()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_241631B28()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_241631B38()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_241631B48()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_241631B58()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_241631B68()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_241631B78()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_241631B88()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_241631B98()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_241631BA8()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_241631BB8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_241631BC8()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_241631BD8()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_241631BE8()
{
  return MEMORY[0x270F32520]();
}

uint64_t sub_241631BF8()
{
  return MEMORY[0x270EF33A8]();
}

uint64_t sub_241631C08()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_241631C18()
{
  return MEMORY[0x270F9D560]();
}

uint64_t sub_241631C28()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_241631C38()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_241631C48()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_241631C58()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_241631C68()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_241631C78()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_241631C88()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_241631C98()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_241631CA8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_241631CB8()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_241631CC8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_241631CD8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_241631CE8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_241631CF8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_241631D18()
{
  return MEMORY[0x270EF1A28]();
}

uint64_t sub_241631D28()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_241631D38()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_241631D48()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_241631D58()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_241631D68()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_241631D78()
{
  return MEMORY[0x270F36F20]();
}

uint64_t sub_241631D88()
{
  return MEMORY[0x270F36F28]();
}

uint64_t sub_241631D98()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_241631DA8()
{
  return MEMORY[0x270F32528]();
}

uint64_t sub_241631DB8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_241631DC8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_241631DD8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_241631DE8()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_241631DF8()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_241631E08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_241631E18()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_241631E28()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_241631E38()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_241631E58()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_241631E68()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_241631E78()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_241631E88()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_241631E98()
{
  return MEMORY[0x270EF1B60]();
}

uint64_t sub_241631EA8()
{
  return MEMORY[0x270EF1B70]();
}

uint64_t sub_241631EB8()
{
  return MEMORY[0x270F32548]();
}

uint64_t sub_241631EC8()
{
  return MEMORY[0x270EE4040]();
}

uint64_t sub_241631ED8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_241631EE8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_241631EF8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_241631F08()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_241631F18()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_241631F28()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_241631F38()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_241631F48()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_241631F58()
{
  return MEMORY[0x270F36F38]();
}

uint64_t sub_241631F68()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_241631F78()
{
  return MEMORY[0x270F35B70]();
}

uint64_t sub_241631F88()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_241631F98()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_241631FA8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_241631FB8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_241631FC8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_241631FF8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_241632008()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_241632018()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_241632028()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_241632038()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_241632048()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_241632058()
{
  return MEMORY[0x270F9DD68]();
}

uint64_t sub_241632068()
{
  return MEMORY[0x270F32558]();
}

uint64_t sub_241632078()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2416320A8()
{
  return MEMORY[0x270EF1C60]();
}

uint64_t sub_2416320B8()
{
  return MEMORY[0x270EF1C70]();
}

uint64_t sub_2416320C8()
{
  return MEMORY[0x270EF1C78]();
}

uint64_t sub_2416320E8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2416320F8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_241632108()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_241632118()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_241632128()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_241632138()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_241632148()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_241632158()
{
  return MEMORY[0x270EF1D48]();
}

uint64_t sub_241632168()
{
  return MEMORY[0x270EF33B0]();
}

uint64_t sub_241632178()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_241632188()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_241632198()
{
  return MEMORY[0x270EE5828]();
}

uint64_t sub_2416321A8()
{
  return MEMORY[0x270EE5838]();
}

uint64_t sub_2416321B8()
{
  return MEMORY[0x270EE5860]();
}

uint64_t sub_2416321C8()
{
  return MEMORY[0x270EE5878]();
}

uint64_t sub_2416321D8()
{
  return MEMORY[0x270EE5888]();
}

uint64_t sub_2416321E8()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_2416321F8()
{
  return MEMORY[0x270FA1278]();
}

uint64_t sub_241632208()
{
  return MEMORY[0x270F36F58]();
}

uint64_t sub_241632218()
{
  return MEMORY[0x270F35138]();
}

uint64_t sub_241632228()
{
  return MEMORY[0x270F35140]();
}

uint64_t sub_241632238()
{
  return MEMORY[0x270F35148]();
}

uint64_t sub_241632248()
{
  return MEMORY[0x270F35150]();
}

uint64_t sub_241632258()
{
  return MEMORY[0x270F35158]();
}

uint64_t sub_241632268()
{
  return MEMORY[0x270F351B0]();
}

uint64_t sub_241632278()
{
  return MEMORY[0x270F351D8]();
}

uint64_t sub_241632288()
{
  return MEMORY[0x270F351E8]();
}

uint64_t sub_241632298()
{
  return MEMORY[0x270F351F0]();
}

uint64_t sub_2416322A8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2416322B8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2416322C8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2416322D8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2416322E8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2416322F8()
{
  return MEMORY[0x270F32590]();
}

uint64_t sub_241632308()
{
  return MEMORY[0x270EF33E8]();
}

uint64_t sub_241632318()
{
  return MEMORY[0x270EF33F8]();
}

uint64_t sub_241632328()
{
  return MEMORY[0x270F325A0]();
}

uint64_t sub_241632338()
{
  return MEMORY[0x270F325A8]();
}

uint64_t sub_241632348()
{
  return MEMORY[0x270F36F60]();
}

uint64_t sub_241632358()
{
  return MEMORY[0x270F36F68]();
}

uint64_t sub_241632368()
{
  return MEMORY[0x270EF3400]();
}

uint64_t sub_241632378()
{
  return MEMORY[0x270EF3408]();
}

uint64_t sub_241632388()
{
  return MEMORY[0x270EF3410]();
}

uint64_t sub_241632398()
{
  return MEMORY[0x270EF3420]();
}

uint64_t sub_2416323A8()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_2416323B8()
{
  return MEMORY[0x270F824A8]();
}

uint64_t sub_2416323C8()
{
  return MEMORY[0x270F824B0]();
}

uint64_t sub_2416323D8()
{
  return MEMORY[0x270EF3440]();
}

uint64_t sub_2416323E8()
{
  return MEMORY[0x270EF3458]();
}

uint64_t sub_2416323F8()
{
  return MEMORY[0x270EF3460]();
}

uint64_t sub_241632408()
{
  return MEMORY[0x270EF3468]();
}

uint64_t sub_241632418()
{
  return MEMORY[0x270EF3488]();
}

uint64_t sub_241632428()
{
  return MEMORY[0x270F36F88]();
}

uint64_t sub_241632438()
{
  return MEMORY[0x270F34D40]();
}

uint64_t sub_241632448()
{
  return MEMORY[0x270F824D8]();
}

uint64_t sub_241632458()
{
  return MEMORY[0x270F824E0]();
}

uint64_t sub_241632468()
{
  return MEMORY[0x270F824E8]();
}

uint64_t sub_241632478()
{
  return MEMORY[0x270F824F0]();
}

uint64_t sub_241632488()
{
  return MEMORY[0x270F824F8]();
}

uint64_t sub_241632498()
{
  return MEMORY[0x270F82508]();
}

uint64_t sub_2416324A8()
{
  return MEMORY[0x270F34D58]();
}

uint64_t sub_2416324B8()
{
  return MEMORY[0x270F34D60]();
}

uint64_t sub_2416324C8()
{
  return MEMORY[0x270F34D68]();
}

uint64_t sub_2416324D8()
{
  return MEMORY[0x270F34D80]();
}

uint64_t sub_2416324E8()
{
  return MEMORY[0x270F34D88]();
}

uint64_t sub_2416324F8()
{
  return MEMORY[0x270F82568]();
}

uint64_t sub_241632508()
{
  return MEMORY[0x270F82578]();
}

uint64_t sub_241632518()
{
  return MEMORY[0x270F34DA0]();
}

uint64_t sub_241632528()
{
  return MEMORY[0x270F35230]();
}

uint64_t sub_241632538()
{
  return MEMORY[0x270F35238]();
}

uint64_t sub_241632548()
{
  return MEMORY[0x270F35240]();
}

uint64_t sub_241632558()
{
  return MEMORY[0x270F35248]();
}

uint64_t sub_241632568()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_241632578()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_241632588()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_241632598()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_2416325A8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2416325B8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2416325C8()
{
  return MEMORY[0x270F825A0]();
}

uint64_t sub_2416325D8()
{
  return MEMORY[0x270F825C0]();
}

uint64_t sub_2416325E8()
{
  return MEMORY[0x270F825C8]();
}

uint64_t sub_2416325F8()
{
  return MEMORY[0x270F825D0]();
}

uint64_t sub_241632608()
{
  return MEMORY[0x270F34DB0]();
}

uint64_t sub_241632618()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_241632628()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_241632638()
{
  return MEMORY[0x270F34DD8]();
}

uint64_t sub_241632648()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_241632658()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_241632668()
{
  return MEMORY[0x270F82650]();
}

uint64_t sub_241632678()
{
  return MEMORY[0x270F82658]();
}

uint64_t sub_241632688()
{
  return MEMORY[0x270F82668]();
}

uint64_t sub_241632698()
{
  return MEMORY[0x270F82670]();
}

uint64_t sub_2416326A8()
{
  return MEMORY[0x270F82678]();
}

uint64_t sub_2416326B8()
{
  return MEMORY[0x270F82688]();
}

uint64_t sub_2416326C8()
{
  return MEMORY[0x270F82698]();
}

uint64_t sub_2416326D8()
{
  return MEMORY[0x270F826A8]();
}

uint64_t sub_2416326E8()
{
  return MEMORY[0x270F826B0]();
}

uint64_t sub_2416326F8()
{
  return MEMORY[0x270F34DF0]();
}

uint64_t sub_241632708()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_241632718()
{
  return MEMORY[0x270F34E08]();
}

uint64_t sub_241632728()
{
  return MEMORY[0x270F826D0]();
}

uint64_t sub_241632738()
{
  return MEMORY[0x270F38168]();
}

uint64_t sub_241632748()
{
  return MEMORY[0x270EF3508]();
}

uint64_t sub_241632758()
{
  return MEMORY[0x270EF3518]();
}

uint64_t sub_241632768()
{
  return MEMORY[0x270EF3520]();
}

uint64_t sub_241632778()
{
  return MEMORY[0x270EF3528]();
}

uint64_t sub_241632788()
{
  return MEMORY[0x270EF3538]();
}

uint64_t sub_241632798()
{
  return MEMORY[0x270EF3548]();
}

uint64_t sub_2416327A8()
{
  return MEMORY[0x270EF3550]();
}

uint64_t sub_2416327B8()
{
  return MEMORY[0x270EF3558]();
}

uint64_t sub_2416327C8()
{
  return MEMORY[0x270EF3560]();
}

uint64_t sub_2416327D8()
{
  return MEMORY[0x270EF3568]();
}

uint64_t sub_2416327E8()
{
  return MEMORY[0x270F34E20]();
}

uint64_t sub_2416327F8()
{
  return MEMORY[0x270F82708]();
}

uint64_t sub_241632808()
{
  return MEMORY[0x270F35BB0]();
}

uint64_t sub_241632818()
{
  return MEMORY[0x270F35BD0]();
}

uint64_t sub_241632828()
{
  return MEMORY[0x270F35288]();
}

uint64_t sub_241632848()
{
  return MEMORY[0x270EF3588]();
}

uint64_t sub_241632858()
{
  return MEMORY[0x270F34E58]();
}

uint64_t sub_241632868()
{
  return MEMORY[0x270F352B0]();
}

uint64_t sub_241632878()
{
  return MEMORY[0x270F097A0]();
}

uint64_t sub_241632888()
{
  return MEMORY[0x270EF2080]();
}

uint64_t sub_241632898()
{
  return MEMORY[0x270F34E68]();
}

uint64_t sub_2416328A8()
{
  return MEMORY[0x270F30FC8]();
}

uint64_t sub_2416328B8()
{
  return MEMORY[0x270F30FD0]();
}

uint64_t sub_2416328C8()
{
  return MEMORY[0x270F34E70]();
}

uint64_t sub_2416328D8()
{
  return MEMORY[0x270F34E78]();
}

uint64_t sub_2416328E8()
{
  return MEMORY[0x270F34E80]();
}

uint64_t sub_2416328F8()
{
  return MEMORY[0x270F35BD8]();
}

uint64_t sub_241632908()
{
  return MEMORY[0x270F828C8]();
}

uint64_t sub_241632918()
{
  return MEMORY[0x270F828E0]();
}

uint64_t sub_241632928()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_241632938()
{
  return MEMORY[0x270F34E90]();
}

uint64_t sub_241632948()
{
  return MEMORY[0x270F35DD0]();
}

uint64_t sub_241632958()
{
  return MEMORY[0x270F35DD8]();
}

uint64_t sub_241632968()
{
  return MEMORY[0x270F35DE0]();
}

uint64_t sub_241632978()
{
  return MEMORY[0x270F34EA8]();
}

uint64_t sub_241632988()
{
  return MEMORY[0x270F32628]();
}

uint64_t sub_241632998()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2416329A8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2416329B8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2416329C8()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2416329D8()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_2416329E8()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_2416329F8()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_241632A08()
{
  return MEMORY[0x270F35C18]();
}

uint64_t sub_241632A18()
{
  return MEMORY[0x270F82978]();
}

uint64_t sub_241632A28()
{
  return MEMORY[0x270F82980]();
}

uint64_t sub_241632A38()
{
  return MEMORY[0x270F82998]();
}

uint64_t sub_241632A48()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_241632A58()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_241632A68()
{
  return MEMORY[0x270F829D8]();
}

uint64_t sub_241632A78()
{
  return MEMORY[0x270F829F0]();
}

uint64_t sub_241632A88()
{
  return MEMORY[0x270F829F8]();
}

uint64_t sub_241632A98()
{
  return MEMORY[0x270F82A00]();
}

uint64_t sub_241632AA8()
{
  return MEMORY[0x270F82A10]();
}

uint64_t sub_241632AB8()
{
  return MEMORY[0x270F82A18]();
}

uint64_t sub_241632AC8()
{
  return MEMORY[0x270F82A30]();
}

uint64_t sub_241632AD8()
{
  return MEMORY[0x270F82A58]();
}

uint64_t sub_241632AE8()
{
  return MEMORY[0x270F82A68]();
}

uint64_t sub_241632AF8()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_241632B08()
{
  return MEMORY[0x270F82AA8]();
}

uint64_t sub_241632B18()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t sub_241632B28()
{
  return MEMORY[0x270F82AE0]();
}

uint64_t sub_241632B38()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_241632B48()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_241632B58()
{
  return MEMORY[0x270F82B18]();
}

uint64_t sub_241632B68()
{
  return MEMORY[0x270F82B28]();
}

uint64_t sub_241632B78()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_241632B88()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_241632B98()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_241632BA8()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_241632BB8()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_241632BC8()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_241632BD8()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_241632BE8()
{
  return MEMORY[0x270F36FA8]();
}

uint64_t sub_241632BF8()
{
  return MEMORY[0x270F36FB8]();
}

uint64_t sub_241632C08()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_241632C18()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_241632C28()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_241632C38()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_241632C48()
{
  return MEMORY[0x270F9E568]();
}

uint64_t sub_241632C58()
{
  return MEMORY[0x270F9E570]();
}

uint64_t sub_241632C68()
{
  return MEMORY[0x270F9E578]();
}

uint64_t sub_241632C78()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_241632C88()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_241632C98()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_241632CA8()
{
  return MEMORY[0x270EF24F0]();
}

uint64_t sub_241632CB8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_241632CC8()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_241632CD8()
{
  return MEMORY[0x270EF25E0]();
}

uint64_t sub_241632CE8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_241632D08()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_241632D18()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_241632D28()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_241632D38()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_241632D48()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_241632D58()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_241632D68()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_241632D78()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_241632D88()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_241632D98()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_241632DA8()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_241632DC8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_241632DD8()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_241632DE8()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_241632DF8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_241632E08()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_241632E18()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_241632E28()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_241632E38()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_241632E48()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_241632E58()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_241632E68()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_241632E78()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_241632E88()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_241632E98()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_241632EA8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_241632EB8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_241632EC8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_241632ED8()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_241632EE8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_241632EF8()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_241632F08()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_241632F18()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_241632F28()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_241632F38()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_241632F48()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_241632F58()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_241632F68()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_241632F78()
{
  return MEMORY[0x270FA2210]();
}

uint64_t sub_241632F88()
{
  return MEMORY[0x270FA2218]();
}

uint64_t sub_241632F98()
{
  return MEMORY[0x270FA2220]();
}

uint64_t sub_241632FA8()
{
  return MEMORY[0x270FA2228]();
}

uint64_t sub_241632FB8()
{
  return MEMORY[0x270FA2230]();
}

uint64_t sub_241632FC8()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_241632FD8()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t sub_241632FE8()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_241632FF8()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_241633008()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_241633018()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_241633028()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_241633038()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_241633048()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t sub_241633058()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_241633068()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_241633078()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_241633088()
{
  return MEMORY[0x270F9F090]();
}

uint64_t sub_241633098()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2416330A8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2416330B8()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2416330C8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2416330D8()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_2416330E8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2416330F8()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_241633108()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_241633118()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_241633128()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_241633138()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_241633148()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_241633158()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_241633168()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_241633178()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_241633188()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_241633198()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2416331A8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2416331B8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2416331C8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2416331D8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2416331E8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2416331F8()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_241633208()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_241633218()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_241633228()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_241633238()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_241633248()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_241633258()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_241633268()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_241633298()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2416332A8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2416332B8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2416332C8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2416332D8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2416332E8()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_2416332F8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_241633308()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_241633318()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_241633328()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_241633338()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_241633348()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_241633358()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_241633368()
{
  return MEMORY[0x270EE4060]();
}

uint64_t sub_241633378()
{
  return MEMORY[0x270EE4068]();
}

uint64_t sub_241633388()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_241633398()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2416333A8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2416333B8()
{
  return MEMORY[0x270F9FDD0]();
}

uint64_t sub_2416333E8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x270F18A30]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextResetClip(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

size_t CGPDFPageGetPageNumber(CGPDFPageRef page)
{
  return MEMORY[0x270EE6DA0](page);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.double x = v1;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x270EF35F8]();
}

uint64_t HKDateFormatterFromTemplate()
{
  return MEMORY[0x270F381B8]();
}

uint64_t HKDisplayCategoryIdentifierToString()
{
  return MEMORY[0x270F381D0]();
}

uint64_t HKFeatureSettingsKeyForDeviationDetectionTypeEnabled()
{
  return MEMORY[0x270F35C40]();
}

uint64_t HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier()
{
  return MEMORY[0x270F35C48]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x270EF3710]();
}

uint64_t HKMCAllNotificationCategories()
{
  return MEMORY[0x270F35C60]();
}

uint64_t HKMCCycleChartMainTypes()
{
  return MEMORY[0x270F35C78]();
}

uint64_t HKMCCycleFactorsTypes()
{
  return MEMORY[0x270F35C80]();
}

uint64_t HKMCCycleTrackingSampleTypes()
{
  return MEMORY[0x270F35C88]();
}

uint64_t HKMCDaySummaryBleedingFlowHasFlow()
{
  return MEMORY[0x270F35C98]();
}

uint64_t HKMCDeviationSampleTypes()
{
  return MEMORY[0x270F35CC8]();
}

uint64_t HKMCMenstrualSymptomFromDataTypeCode()
{
  return MEMORY[0x270F35D08]();
}

uint64_t HKMCSymptomSampleTypes()
{
  return MEMORY[0x270F35D30]();
}

uint64_t HKMCTodayIndex()
{
  return MEMORY[0x270F35D38]();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return MEMORY[0x270EF37D0]();
}

uint64_t HKRollingBaselineConfigurationForQuantityType()
{
  return MEMORY[0x270EF37F8]();
}

uint64_t HKSPSleepFocusOnboardingURL()
{
  return MEMORY[0x270F73088]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x270EF3818]();
}

uint64_t HKUICalendarLocaleIsRightToLeft()
{
  return MEMORY[0x270F382F0]();
}

uint64_t HKUIEqualCGFloats()
{
  return MEMORY[0x270F38310]();
}

uint64_t HKUIFloorToScreenScale()
{
  return MEMORY[0x270F38318]();
}

uint64_t HKUIJoinAttributedStringsWithFormatAndAttributes()
{
  return MEMORY[0x270F38328]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x270F38330]();
}

uint64_t HKUIOnePixel()
{
  return MEMORY[0x270F38398]();
}

uint64_t HKUnionDayIndexRange()
{
  return MEMORY[0x270EF38A8]();
}

BOOL UIAccessibilityIsGrayscaleEnabled(void)
{
  return MEMORY[0x270F82C20]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKStatisticsOptionBaselineRelativeQuantities()
{
  return MEMORY[0x270EF39C0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t health_dispatch_get_current_workloop()
{
  return MEMORY[0x270F32638]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x270FA0388]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}