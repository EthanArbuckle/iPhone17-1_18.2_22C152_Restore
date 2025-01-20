uint64_t static Logger.Mobility.generation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AC9D80(&qword_1EBF0ECA8, (uint64_t)qword_1EBF0ECB0, a1);
}

uint64_t sub_1E0AC9CC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1E0B06448();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1EBF0ECD8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1E0B067F8();
  return sub_1E0B06438();
}

uint64_t sub_1E0AC9D80@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1E0B06448();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
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

uint64_t sub_1E0AC9EB4()
{
  uint64_t result = sub_1E0B067F8();
  qword_1EBF0ECC8 = result;
  unk_1EBF0ECD0 = v1;
  return result;
}

uint64_t sub_1E0AC9EE4(uint64_t a1)
{
  return sub_1E0AC9CC8(a1, qword_1EBF0ECB0);
}

id WalkingSteadinessOnboardingAnalyticsManager.__allocating_init(healthStore:detailsProvider:presentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9 = (char *)objc_allocWithZone(v4);
  *(void *)&v9[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_healthStore] = a1;
  v10 = &v9[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation];
  *(void *)v10 = a3;
  *((void *)v10 + 1) = a4;
  *(void *)&v9[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_detailsProvider] = a2;
  v12.receiver = v9;
  v12.super_class = v4;
  return objc_msgSendSuper2(&v12, sel_init);
}

id WalkingSteadinessOnboardingAnalyticsManager.init(healthStore:detailsProvider:presentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&v4[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_healthStore] = a1;
  uint64_t v5 = &v4[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation];
  *(void *)uint64_t v5 = a3;
  *((void *)v5 + 1) = a4;
  *(void *)&v4[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_detailsProvider] = a2;
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAnalyticsManager();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAnalyticsManager()
{
  return self;
}

void sub_1E0ACA000(char *a1, uint64_t *a2, char a3)
{
  uint64_t ObjectType = swift_getObjectType();
  char v6 = *a1;
  uint64_t v7 = *a2;
  v8 = *(void **)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_healthStore];
  char v9 = *((unsigned char *)a2 + 8);
  uint64_t v11 = *(void *)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation];
  uint64_t v10 = *(void *)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation + 8];
  uint64_t v12 = *(void *)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_detailsProvider];
  uint64_t v13 = *(void *)(v12 + 88);
  char v14 = *(unsigned char *)(v12 + 96);
  v15 = (objc_class *)type metadata accessor for WalkingSteadinessAnalyticsOnboardingEventDataSource();
  v16 = objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_healthStore] = v8;
  v17 = &v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_presentation];
  void *v17 = v11;
  v17[1] = v10;
  v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep] = v6;
  v18 = &v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_changedDetailItems];
  *(void *)v18 = v7;
  v18[8] = v9;
  v19 = &v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_defaultDetailItems];
  *(void *)v19 = v13;
  v19[8] = v14;
  v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_acceptDefaults] = a3;
  v28.receiver = v16;
  v28.super_class = v15;
  id v20 = v8;
  swift_bridgeObjectRetain();
  id v21 = objc_msgSendSuper2(&v28, sel_init);
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 16) = v6;
  *(void *)(v22 + 24) = ObjectType;
  aBlock[4] = sub_1E0ACA5C8;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0ACA5D4;
  aBlock[3] = &block_descriptor;
  v23 = _Block_copy(aBlock);
  id v24 = v21;
  swift_release();
  objc_msgSend(v3, sel_submitOnboardingEventWithDataSource_resultHandler_, v24, v23);
  _Block_release(v23);
}

void sub_1E0ACA208(void *a1, char a2)
{
  if (objc_msgSend(a1, sel_status) == (id)1)
  {
    if (qword_1EAD61EF8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1E0B06448();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EAD626A0);
    id v16 = a1;
    uint64_t v5 = sub_1E0B06428();
    os_log_type_t v6 = sub_1E0B068A8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = 0xD000000000000016;
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v17 = v9;
      *(_DWORD *)uint64_t v8 = 136446979;
      uint64_t v10 = sub_1E0B06C58();
      sub_1E0ACB6F4(v10, v11, &v17);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2082;
      sub_1E0ACB6F4(0xD000000000000041, 0x80000001E0B09EC0, &v17);
      sub_1E0B06A68();
      *(_WORD *)(v8 + 22) = 2081;
      unint64_t v12 = 0x80000001E0B09F30;
      switch(a2)
      {
        case 1:
          unint64_t v12 = 0xEE00736C69617465;
          uint64_t v7 = 0x446D7269666E6F63;
          break;
        case 2:
          uint64_t v7 = 0xD000000000000017;
          unint64_t v12 = 0x80000001E0B09F10;
          break;
        case 3:
          unint64_t v12 = 0xED0000736E6F6974;
          uint64_t v7 = 0x6163696669746F6ELL;
          break;
        case 4:
          unint64_t v12 = 0xEA00000000006E6FLL;
          uint64_t v7 = 0x6974656C706D6F63;
          break;
        default:
          break;
      }
      sub_1E0ACB6F4(v7, v12, &v17);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 32) = 2082;
      id v13 = objc_msgSend(v16, sel_error);
      sub_1E0ACAFD8();
      uint64_t v14 = sub_1E0B067B8();
      sub_1E0ACB6F4(v14, v15, &v17);
      sub_1E0B06A68();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AC7000, v5, v6, "[%{public}s.%{public}s] Unable to submit onboarding analytics for step: %{private}s error: %{public}s", (uint8_t *)v8, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v9, -1, -1);
      MEMORY[0x1E4E3C540](v8, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_1E0ACA5B8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E0ACA5C8(void *a1)
{
  sub_1E0ACA208(a1, *(unsigned char *)(v1 + 16));
}

void sub_1E0ACA5D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

id WalkingSteadinessOnboardingAnalyticsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WalkingSteadinessOnboardingAnalyticsManager.init()()
{
}

id WalkingSteadinessOnboardingAnalyticsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAnalyticsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for WalkingSteadinessOnboardingAnalyticsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingAnalyticsManager);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingAnalyticsManager.__allocating_init(healthStore:detailsProvider:presentation:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingAnalyticsManager.submitOnboardingEvent(forStep:changedDetailItems:acceptDefaults:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

void type metadata accessor for HKAppleWalkingSteadinessClassification(uint64_t a1)
{
}

void type metadata accessor for HKError(uint64_t a1)
{
}

uint64_t sub_1E0ACA804(uint64_t a1)
{
  uint64_t v2 = sub_1E0ACAD18(&qword_1EAD62070, type metadata accessor for HKError);
  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_1E0ACA870(uint64_t a1)
{
  uint64_t v2 = sub_1E0ACAD18(&qword_1EAD62070, type metadata accessor for HKError);
  return MEMORY[0x1F40E6E10](a1, v2);
}

uint64_t sub_1E0ACA8E0(uint64_t a1)
{
  uint64_t v2 = sub_1E0ACAD18((unint64_t *)&qword_1EAD620A8, type metadata accessor for HKError);
  return MEMORY[0x1F40E4480](a1, v2);
}

id sub_1E0ACA94C()
{
  return *v0;
}

uint64_t sub_1E0ACA954@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1E0ACA95C()
{
  return sub_1E0B06798();
}

uint64_t sub_1E0ACA96C(uint64_t a1)
{
  uint64_t v2 = sub_1E0ACAD18((unint64_t *)&qword_1EAD620A8, type metadata accessor for HKError);
  return MEMORY[0x1F40E44F0](a1, v2);
}

uint64_t sub_1E0ACA9D8(uint64_t a1)
{
  uint64_t v2 = sub_1E0ACAD18((unint64_t *)&qword_1EAD620A8, type metadata accessor for HKError);
  return MEMORY[0x1F40E44A8](a1, v2);
}

uint64_t sub_1E0ACAA44(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0ACAD18((unint64_t *)&qword_1EAD620A8, type metadata accessor for HKError);
  id v5 = a1;
  return MEMORY[0x1F40E4498](v5, a2, v4);
}

uint64_t sub_1E0ACAAD4()
{
  id v1 = *v0;
  uint64_t v2 = sub_1E0B06A48();

  return v2;
}

uint64_t sub_1E0ACAB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0ACAD18((unint64_t *)&qword_1EAD620A8, type metadata accessor for HKError);
  return MEMORY[0x1F40E44D8](a1, a2, v4);
}

uint64_t sub_1E0ACAB88()
{
  return sub_1E0B06C28();
}

void *sub_1E0ACABE8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1E0ACABF8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1E0ACAC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E0ACAD18((unint64_t *)&qword_1EAD620A8, type metadata accessor for HKError);
  return MEMORY[0x1F40E44B8](a1, a2, a3, v6);
}

uint64_t sub_1E0ACAC88()
{
  return sub_1E0ACAD18(&qword_1EAD62060, type metadata accessor for HKError);
}

uint64_t sub_1E0ACACD0()
{
  return sub_1E0ACAD18(&qword_1EAD62068, type metadata accessor for HKError);
}

uint64_t sub_1E0ACAD18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E0ACAD60()
{
  return sub_1E0ACAD18(&qword_1EAD62070, type metadata accessor for HKError);
}

uint64_t sub_1E0ACADA8()
{
  return sub_1E0ACAD18(&qword_1EAD62078, type metadata accessor for HKError);
}

uint64_t sub_1E0ACADF0()
{
  return sub_1E0ACAD18(&qword_1EAD62080, type metadata accessor for HKError);
}

uint64_t sub_1E0ACAE38()
{
  return sub_1E0ACAD18(&qword_1EAD62088, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_1E0ACAE94()
{
  return sub_1E0ACAD18(&qword_1EAD62090, type metadata accessor for Code);
}

unint64_t sub_1E0ACAEE0()
{
  unint64_t result = qword_1EAD62098;
  if (!qword_1EAD62098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62098);
  }
  return result;
}

uint64_t sub_1E0ACAF34()
{
  return sub_1E0ACAD18(&qword_1EAD620A0, type metadata accessor for Code);
}

uint64_t sub_1E0ACAF7C()
{
  return sub_1E0ACAD18((unint64_t *)&qword_1EAD620A8, type metadata accessor for HKError);
}

BOOL sub_1E0ACAFC4(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_1E0ACAFD8()
{
  if (!qword_1EAD620B0)
  {
    sub_1E0ACB030();
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD620B0);
    }
  }
}

unint64_t sub_1E0ACB030()
{
  unint64_t result = qword_1EAD620B8;
  if (!qword_1EAD620B8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD620B8);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_1E0ACB09C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1E0ACB0E4()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD620D0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD620D0);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void *WalkingSteadinessOnboardingViewControllerFactory.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:detailsProvider:model:)(uint64_t a1, long long *a2, long long *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  sub_1E0ACB27C(a2, (uint64_t)(v10 + 3));
  sub_1E0ACB27C(a3, (uint64_t)(v10 + 10));
  v10[8] = a4;
  v10[9] = a5;
  return v10;
}

void *WalkingSteadinessOnboardingViewControllerFactory.init(healthStore:healthExperienceStore:pinnedContentManager:detailsProvider:model:)(uint64_t a1, long long *a2, long long *a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a1;
  sub_1E0ACB27C(a2, (uint64_t)(v5 + 3));
  sub_1E0ACB27C(a3, (uint64_t)(v5 + 10));
  v5[8] = a4;
  v5[9] = a5;
  return v5;
}

uint64_t sub_1E0ACB27C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1E0ACB294(unsigned char *a1)
{
  uint64_t v2 = v1;
  switch(*a1)
  {
    case 1:
      uint64_t v5 = *(void *)(v1 + 64);
      uint64_t v6 = *(void **)(v2 + 16);
      type metadata accessor for ConfirmDetailsValueFormatterImpl();
      uint64_t v7 = (void *)swift_allocObject();
      v7[4] = 0;
      v7[5] = 0;
      v7[2] = v6;
      uint64_t v8 = self;
      id v9 = v6;
      swift_retain();
      id v10 = objc_msgSend(v8, sel_sharedInstanceForHealthStore_, v9);
      id v11 = objc_msgSend(v10, sel_createHKUnitPreferenceController);

      v7[3] = v11;
      unint64_t v12 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController());
      uint64_t result = (uint64_t)sub_1E0ACBD44(v5, (uint64_t)v7, v12);
      break;
    case 2:
      id v13 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingLevelsViewController());
      uint64_t result = WalkingSteadinessOnboardingLevelsViewController.init()();
      break;
    case 3:
      id v14 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController());
      uint64_t result = (uint64_t)sub_1E0B00368();
      break;
    case 4:
      unint64_t v15 = *(os_unfair_lock_s **)(*(void *)(v1 + 72) + 96);
      swift_retain();
      os_unfair_lock_lock(v15 + 9);
      sub_1E0AF8D80((uint64_t)&v15[4], v27);
      os_unfair_lock_unlock(v15 + 9);
      int v16 = LOBYTE(v27[0]);
      swift_release();
      if (v16 == 2)
      {
        if (qword_1EAD61E90 != -1) {
          swift_once();
        }
        uint64_t v17 = sub_1E0B06448();
        __swift_project_value_buffer(v17, (uint64_t)qword_1EAD620D0);
        v18 = sub_1E0B06428();
        os_log_type_t v19 = sub_1E0B068B8();
        if (os_log_type_enabled(v18, v19))
        {
          id v20 = (uint8_t *)swift_slowAlloc();
          uint64_t v21 = swift_slowAlloc();
          v27[0] = v21;
          *(_DWORD *)id v20 = 136446210;
          uint64_t v22 = sub_1E0B06C58();
          v26[0] = sub_1E0ACB6F4(v22, v23, v27);
          sub_1E0B06A68();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1E0AC7000, v18, v19, "[%{public}s] Setup Complete but notificationsEnabled is nil", v20, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1E4E3C540](v21, -1, -1);
          MEMORY[0x1E4E3C540](v20, -1, -1);
        }

        sub_1E0ACC180(v2 + 24, (uint64_t)v27);
        sub_1E0ACC180(v2 + 80, (uint64_t)v26);
        id v24 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController());
      }
      else
      {
        sub_1E0ACC180(v2 + 24, (uint64_t)v27);
        sub_1E0ACC180(v2 + 80, (uint64_t)v26);
        id v25 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController());
      }
      uint64_t result = (uint64_t)WalkingSteadinessOnboardingSetupCompleteViewController.init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)((uint64_t)v27, v26);
      break;
    default:
      id v3 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController());
      uint64_t result = (uint64_t)WalkingSteadinessOnboardingStartViewController.init()();
      break;
  }
  return result;
}

uint64_t WalkingSteadinessOnboardingViewControllerFactory.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);
  return v0;
}

uint64_t WalkingSteadinessOnboardingViewControllerFactory.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);
  return MEMORY[0x1F4186488](v0, 120, 7);
}

uint64_t sub_1E0ACB6F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1E0ACB7C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E0ACC234((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1E0ACC234((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1E0ACB7C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1E0B06A78();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1E0ACB984(a5, a6);
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
  uint64_t v8 = sub_1E0B06B08();
  if (!v8)
  {
    sub_1E0B06B28();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E0B06B78();
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

uint64_t sub_1E0ACB984(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1E0ACBA1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E0ACBBF8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E0ACBBF8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1E0ACBA1C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1E0ACBB94(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E0B06AD8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1E0B06B28();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E0B06808();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1E0B06B78();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1E0B06B28();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1E0ACBB94(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1E0ACC290();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1E0ACBBF8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1E0ACC290();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_1E0B06B78();
  __break(1u);
  return result;
}

char *sub_1E0ACBD44(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v20[3] = type metadata accessor for ConfirmDetailsValueFormatterImpl();
  v20[4] = &protocol witness table for ConfirmDetailsValueFormatterImpl;
  a3[qword_1EAD620F0] = 1;
  v20[0] = a2;
  *(void *)&a3[qword_1EAD620F8 + 8] = 0;
  swift_unknownObjectWeakInit();
  unint64_t v6 = &a3[qword_1EAD62100];
  *unint64_t v6 = 0xD00000000000002DLL;
  v6[1] = 0x80000001E0B09FE0;
  *(void *)&a3[qword_1EAD62108] = 0;
  sub_1E0ACC180((uint64_t)v20, (uint64_t)v19);
  type metadata accessor for ConfirmDetailsModel();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v8 = v7 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  uint64_t v9 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(unsigned char *)(v7 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1E0ACB27C(v19, v7 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  type metadata accessor for ConfirmDetailsDataSource();
  swift_allocObject();
  uint64_t v10 = a3;
  swift_retain();
  swift_retain();
  *(void *)&v10[qword_1EAD62110] = ConfirmDetailsDataSource.init(detailsProvider:model:)(a1, v7);

  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v11 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v12 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  swift_retain();
  id v13 = (char *)sub_1E0B06298();
  uint64_t v14 = *(void *)&v13[qword_1EAD62110] + qword_1EAD62A28;
  swift_beginAccess();
  *(void *)(v14 + 8) = &protocol witness table for WalkingSteadinessOnboardingConfirmDetailsViewController;
  swift_unknownObjectWeakAssign();
  unint64_t v15 = v13;
  id v16 = objc_msgSend(v15, sel_headerView, 0xE000000000000001);
  LODWORD(v17) = 1036831949;
  objc_msgSend(v16, sel_setTitleHyphenationFactor_, v17);
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  return v15;
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingViewControllerFactory()
{
  return self;
}

uint64_t method lookup function for WalkingSteadinessOnboardingViewControllerFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingViewControllerFactory);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerFactory.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:detailsProvider:model:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerFactory.makeOnboardingViewController(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1E0ACC180(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1E0ACC234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1E0ACC290()
{
  if (!qword_1EAD620E8)
  {
    unint64_t v0 = sub_1E0B06BA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD620E8);
    }
  }
}

char *WalkingSteadinessOnboardingConfirmDetailsViewController.__allocating_init(detailsProvider:valueFormatter:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  uint64_t v8 = sub_1E0ACD0E4(a1, v7, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v8;
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

void WalkingSteadinessOnboardingConfirmDetailsViewController.stage.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + qword_1EAD620F0);
}

uint64_t sub_1E0ACC3BC()
{
  uint64_t v1 = v0 + qword_1EAD620F8;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0ACC40C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + qword_1EAD620F8;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1E0ACC478(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = qword_1EAD620F8;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACC500;
}

char *WalkingSteadinessOnboardingConfirmDetailsViewController.init(detailsProvider:valueFormatter:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  MEMORY[0x1F4188790](v7, v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  id v11 = sub_1E0ACCD08(a1, (uint64_t)v9, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v11;
}

void sub_1E0ACC5FC()
{
  uint64_t v1 = v0;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController();
  objc_msgSendSuper2(&v10, sel_viewDidLoad);
  uint64_t v2 = (void *)sub_1E0B06788();
  id v3 = objc_msgSend(v1, sel_addNextButtonWithBaseIdentifier_, v2);

  uint64_t v4 = qword_1EAD62108;
  uint64_t v5 = *(void **)&v1[qword_1EAD62108];
  *(void *)&v1[qword_1EAD62108] = v3;

  uint64_t v6 = *(void **)&v1[v4];
  if (v6)
  {
    uint64_t v7 = *(uint64_t (**)(void))(**(void **)(*(void *)&v1[qword_1EAD62110] + qword_1EAD62A30) + 112);
    id v8 = v6;
    objc_msgSend(v8, sel_setEnabled_, v7() & 1);
  }
  uint64_t v9 = (void *)sub_1E0B06788();
}

void sub_1E0ACC748(void *a1)
{
  id v1 = a1;
  sub_1E0ACC5FC();
}

uint64_t sub_1E0ACC790(char *a1)
{
  uint64_t v2 = &a1[qword_1EAD620F8];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v2);
  if (result)
  {
    uint64_t v4 = *((void *)v2 + 1);
    swift_getObjectType();
    uint64_t v5 = *(void (**)(void))(v4 + 8);
    uint64_t v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1E0ACC83C(char *a1)
{
  uint64_t v2 = &a1[qword_1EAD620F8];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v2);
  if (result)
  {
    uint64_t v4 = *((void *)v2 + 1);
    swift_getObjectType();
    uint64_t v5 = *(void (**)(void))(v4 + 24);
    uint64_t v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1E0ACC8E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)(v1 + qword_1EAD62110) + qword_1EAD62A30)
     + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1E0ACD228(v3, a1);
}

void sub_1E0ACC958(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + qword_1EAD62108);
  if (v2)
  {
    uint64_t v3 = *(uint64_t (**)(void))(**(void **)(a1 + qword_1EAD62A30) + 112);
    id v4 = v2;
    objc_msgSend(v4, sel_setEnabled_, v3() & 1);
  }
}

void sub_1E0ACCA0C(void *a1)
{
  id v4 = a1;
  id v1 = objc_msgSend(v4, sel_presentedViewController);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);

    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v3 = v4;
  }
}

void WalkingSteadinessOnboardingConfirmDetailsViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

void WalkingSteadinessOnboardingConfirmDetailsViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

uint64_t sub_1E0ACCAEC()
{
  sub_1E0ACD748(v0 + qword_1EAD620F8);
  swift_bridgeObjectRelease();

  return swift_release();
}

id WalkingSteadinessOnboardingConfirmDetailsViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E0ACCB88(uint64_t a1)
{
  sub_1E0ACD748(a1 + qword_1EAD620F8);
  swift_bridgeObjectRelease();

  return swift_release();
}

void sub_1E0ACCBF8(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + qword_1EAD620F0);
}

void sub_1E0ACCC0C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_1E0ACCC94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)(*v1 + qword_1EAD62110) + qword_1EAD62A30)
     + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1E0ACD228(v3, a1);
}

char *sub_1E0ACCD08(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5)
{
  v24[3] = a4;
  v24[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  a3[qword_1EAD620F0] = 1;
  *(void *)&a3[qword_1EAD620F8 + 8] = 0;
  swift_unknownObjectWeakInit();
  objc_super v10 = &a3[qword_1EAD62100];
  void *v10 = 0xD00000000000002DLL;
  v10[1] = 0x80000001E0B09FE0;
  *(void *)&a3[qword_1EAD62108] = 0;
  sub_1E0ACC180((uint64_t)v24, (uint64_t)v23);
  type metadata accessor for ConfirmDetailsModel();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v12 = v11 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  uint64_t v13 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(unsigned char *)(v11 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1E0ACB27C(v23, v11 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  type metadata accessor for ConfirmDetailsDataSource();
  swift_allocObject();
  uint64_t v14 = a3;
  swift_retain();
  swift_retain();
  *(void *)&v14[qword_1EAD62110] = ConfirmDetailsDataSource.init(detailsProvider:model:)(a1, v11);

  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v15 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v16 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  swift_retain();
  double v17 = (char *)sub_1E0B06298();
  uint64_t v18 = *(void *)&v17[qword_1EAD62110] + qword_1EAD62A28;
  swift_beginAccess();
  *(void *)(v18 + 8) = &protocol witness table for WalkingSteadinessOnboardingConfirmDetailsViewController;
  swift_unknownObjectWeakAssign();
  os_log_type_t v19 = v17;
  id v20 = objc_msgSend(v19, sel_headerView, 0xE000000000000001);
  LODWORD(v21) = 1036831949;
  objc_msgSend(v20, sel_setTitleHyphenationFactor_, v21);
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  return v19;
}

char *sub_1E0ACD0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController());
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, a4);
  return sub_1E0ACCD08(a1, (uint64_t)v11, v12, a4, a5);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController()
{
  uint64_t result = qword_1EAD62120;
  if (!qword_1EAD62120) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0ACD228(uint64_t a1, uint64_t a2)
{
  sub_1E0ACD28C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1E0ACD28C()
{
  if (!qword_1EAD62118)
  {
    type metadata accessor for ConfirmDetailsProvider.Details();
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62118);
    }
  }
}

void sub_1E0ACD2E4()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_dismissPresentedViewController);
  id v3 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController());
  uint64_t v4 = WalkingSteadinessOnboardingAboutHealthDetailsViewController.init()();
  id v5 = objc_msgSend(v4, sel_navigationItem);
  objc_msgSend(v5, sel_setRightBarButtonItem_, v2);

  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B78]), sel_initWithRootViewController_, v4);
  objc_msgSend(v1, sel_presentViewController_animated_completion_, v6, 1, 0);
}

uint64_t sub_1E0ACD3E0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + qword_1EAD620F8;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E0ACD43C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + qword_1EAD620F8;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingChangedHealthDetailProviding.details.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1E0ACD4B4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingConfirmDetailsViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingConfirmDetailsViewController);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 48))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 56))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.__allocating_init(detailsProvider:valueFormatter:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + v0
                              + 88))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.details.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 96))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.detailsDataSourceDidUpdate(_:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.detailsDataSourceDidTapLearnMore(_:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 112))();
}

uint64_t sub_1E0ACD740()
{
  return type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController();
}

uint64_t sub_1E0ACD748(uint64_t a1)
{
  return a1;
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

uint64_t MultiselectItem.reuseIdentifier.getter()
{
  return sub_1E0B061D8();
}

unint64_t sub_1E0ACD80C()
{
  unint64_t result = qword_1EAD62130;
  if (!qword_1EAD62130)
  {
    type metadata accessor for MultiselectTableViewCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62130);
  }
  return result;
}

uint64_t MultiselectItem.uniqueIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiselectItem.uniqueIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MultiselectItem.uniqueIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t MultiselectItem.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiselectItem.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiselectItem.state.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

void __swiftcall MultiselectItem.init(title:subtitle:state:identifier:)(HealthMobilityUI::MultiselectItem *__return_ptr retstr, Swift::String title, Swift::String subtitle, Swift::Bool state, Swift::String identifier)
{
  object = subtitle._object;
  uint64_t countAndFlagsBits = subtitle._countAndFlagsBits;
  id v8 = title._object;
  uint64_t v9 = title._countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->uniqueIdentifier = identifier;
  retstr->title._uint64_t countAndFlagsBits = v9;
  retstr->title._object = v8;
  retstr->subtitle._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->subtitle._object = object;
  retstr->state = state;
}

uint64_t sub_1E0ACDA30()
{
  return sub_1E0B061D8();
}

uint64_t sub_1E0ACDA68()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t initializeBufferWithCopyOfBuffer for MultiselectItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MultiselectItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MultiselectItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MultiselectItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for MultiselectItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiselectItem(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MultiselectItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MultiselectItem()
{
  return &type metadata for MultiselectItem;
}

uint64_t sub_1E0ACDD2C()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62140);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62140);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id WalkingSteadinessOnboardingCoordinator.__allocating_init(rootViewController:model:factory:analyticsManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = (char *)objc_allocWithZone(v5);
  *(void *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  *(void *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model] = a3;
  *(void *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_factory] = a4;
  *(void *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_analyticsManager] = a5;
  v14.receiver = v10;
  v14.super_class = v5;
  swift_retain();
  swift_retain();
  id v11 = a5;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  sub_1E0ACE050();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return v12;
}

id WalkingSteadinessOnboardingCoordinator.init(rootViewController:model:factory:analyticsManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model] = a3;
  *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_factory] = a4;
  *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_analyticsManager] = a5;
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingCoordinator();
  swift_retain();
  swift_retain();
  id v9 = a5;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_1E0ACE050();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return v10;
}

void sub_1E0ACE050()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model);
  char v15 = 5;
  (*(void (**)(uint64_t *__return_ptr, char *))(*(void *)v2 + 224))(&v16, &v15);
  if (v16 == 5)
  {
    sub_1E0B06B38();
    __break(1u);
  }
  else
  {
    char v14 = v16;
    id v12 = sub_1E0ACE448(&v14);
    uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController;
    if (MEMORY[0x1E4E3C5D0](v1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController))
    {
      uint64_t v4 = *(void *)(v3 + 8);
      uint64_t ObjectType = swift_getObjectType();
      sub_1E0AD3824(0, (unint64_t *)&qword_1EAD62200, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1E0B07DC0;
      *(void *)(v6 + 32) = v12;
      uint64_t v13 = v6;
      sub_1E0B06828();
      uint64_t v7 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 24);
      id v8 = v12;
      v7(v13, 0, ObjectType, v4);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    if (MEMORY[0x1E4E3C5D0](v3))
    {
      uint64_t v9 = *(void *)(v3 + 8);
      uint64_t v10 = swift_getObjectType();
      id v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v9);
      swift_unknownObjectRelease();
      if (v11)
      {
        objc_msgSend(v11, sel_setDelegate_, v1);
      }
    }
  }
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingCoordinator()
{
  return self;
}

void sub_1E0ACE298(unsigned char *a1, unsigned __int8 *a2, char a3)
{
  void *(*v11)(uint64_t *__return_ptr, uint64_t);
  void *v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  _OWORD v19[2];

  int v5 = *a2;
  LOBYTE(v19[0]) = *a1;
  uint64_t v6 = sub_1E0ACE448((char *)v19);
  uint64_t v7 = v3 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController;
  uint64_t v8 = MEMORY[0x1E4E3C5D0](v3 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController);
  if (v8)
  {
    uint64_t v9 = *(void *)(v7 + 8);
    uint64_t ObjectType = swift_getObjectType();
    memset(v19, 0, sizeof(v19));
    (*(void (**)(void *, _OWORD *, uint64_t, uint64_t))(v9 + 32))(v6, v19, ObjectType, v9);
    swift_unknownObjectRelease();
    uint64_t v8 = sub_1E0AD35BC((uint64_t)v19, (uint64_t)&unk_1EAD621F8, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1E0AD3824);
  }
  uint64_t v18 = v5;
  id v11 = *(void *(**)(uint64_t *__return_ptr, uint64_t))(**(void **)(v3
                                                                               + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model)
                                                                 + 184);
  id v12 = v11((uint64_t *)v19, v8);
  uint64_t v16 = *(void *)&v19[0];
  double v17 = BYTE8(v19[0]);
  if (v5 == 3)
  {
    uint64_t v13 = (a3 & 1) == 0;
  }
  else if (v5 == 1)
  {
    v11(&v14, (uint64_t)v12);
    uint64_t v13 = v15 | (v14 == 0);
  }
  else
  {
    uint64_t v13 = 1;
  }
  sub_1E0ACA000(&v18, &v16, v13 & 1);
}

void *sub_1E0ACE448(char *a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_factory);
  char v13 = *a1;
  uint64_t v3 = (void *)(*(uint64_t (**)(char *))(*(void *)v2 + 128))(&v13);
  uint64_t v5 = v4;
  uint64_t ObjectType = swift_getObjectType();
  id v7 = objc_msgSend(v3, sel_navigationItem);
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v8 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v9 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setBackButtonTitle_, v9, 0xE000000000000000);

  uint64_t v10 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v5 + 24);
  uint64_t v11 = swift_unknownObjectRetain();
  v10(v11, &protocol witness table for WalkingSteadinessOnboardingCoordinator, ObjectType, v5);
  return v3;
}

uint64_t sub_1E0ACE608(void *a1, uint64_t a2)
{
  void (*v15)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t *, id, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  id v24;
  char *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  if (qword_1EAD61E98 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1E0B06448();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EAD62140);
  id v8 = a1;
  uint64_t v9 = sub_1E0B06428();
  os_log_type_t v10 = sub_1E0B068C8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v29 = v27;
    *(_DWORD *)uint64_t v11 = 136446722;
    uint64_t v12 = sub_1E0B06C58();
    sub_1E0ACB6F4(v12, v13, &v29);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    objc_super v28 = sub_1E0ACB6F4(0xD00000000000002FLL, 0x80000001E0B0A3E0, &v29);
    sub_1E0B06A68();
    *(_WORD *)(v11 + 22) = 2082;
    uint64_t v14 = swift_getObjectType();
    char v15 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
    v15(&v28, v14, a2);
    uint64_t v16 = sub_1E0B067B8();
    objc_super v28 = sub_1E0ACB6F4(v16, v17, &v29);
    sub_1E0B06A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v9, v10, "[%{public}s.%{public}s]: Primary button tapped for stage: %{public}s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v27, -1, -1);
    MEMORY[0x1E4E3C540](v11, -1, -1);

    uint64_t v18 = ObjectType;
  }
  else
  {

    uint64_t v18 = ObjectType;
    char v15 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
  }
  os_log_type_t v19 = swift_getObjectType();
  v15(&v29, v19, a2);
  id v20 = v29;
  double v21 = *(void *)&v3[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 16) = v20;
  *(void *)(v22 + 24) = v3;
  *(unsigned char *)(v22 + 32) = 0;
  *(void *)(v22 + 40) = v8;
  *(void *)(v22 + 48) = a2;
  *(void *)(v22 + 56) = v18;
  unint64_t v23 = *(void (**)(uint64_t *, id, uint64_t, uint64_t, uint64_t (*)(), uint64_t))(*(void *)v21
                                                                                                  + 232);
  id v24 = v8;
  id v25 = v3;
  v23(&v29, v24, a2, 1, sub_1E0AD3088, v22);
  return swift_release();
}

uint64_t sub_1E0ACE958(void *a1, uint64_t a2)
{
  void (*v15)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t *, id, uint64_t, void, uint64_t (*)(), uint64_t);
  id v24;
  char *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  if (qword_1EAD61E98 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1E0B06448();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EAD62140);
  id v8 = a1;
  uint64_t v9 = sub_1E0B06428();
  os_log_type_t v10 = sub_1E0B068C8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v29 = v27;
    *(_DWORD *)uint64_t v11 = 136446722;
    uint64_t v12 = sub_1E0B06C58();
    sub_1E0ACB6F4(v12, v13, &v29);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    objc_super v28 = sub_1E0ACB6F4(0xD000000000000031, 0x80000001E0B0A410, &v29);
    sub_1E0B06A68();
    *(_WORD *)(v11 + 22) = 2082;
    uint64_t v14 = swift_getObjectType();
    char v15 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
    v15(&v28, v14, a2);
    uint64_t v16 = sub_1E0B067B8();
    objc_super v28 = sub_1E0ACB6F4(v16, v17, &v29);
    sub_1E0B06A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v9, v10, "[%{public}s.%{public}s]: Secondary button tapped for stage: %{public}s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v27, -1, -1);
    MEMORY[0x1E4E3C540](v11, -1, -1);

    uint64_t v18 = ObjectType;
  }
  else
  {

    uint64_t v18 = ObjectType;
    char v15 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
  }
  os_log_type_t v19 = swift_getObjectType();
  v15(&v29, v19, a2);
  id v20 = v29;
  double v21 = *(void *)&v3[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 16) = v20;
  *(void *)(v22 + 24) = v3;
  *(unsigned char *)(v22 + 32) = 1;
  *(void *)(v22 + 40) = v8;
  *(void *)(v22 + 48) = a2;
  *(void *)(v22 + 56) = v18;
  unint64_t v23 = *(void (**)(uint64_t *, id, uint64_t, void, uint64_t (*)(), uint64_t))(*(void *)v21 + 232);
  id v24 = v8;
  id v25 = v3;
  v23(&v29, v24, a2, 0, sub_1E0AD3088, v22);
  return swift_release();
}

uint64_t sub_1E0ACECB0(unsigned __int8 *a1, char a2, void *a3, char a4, void *a5, uint64_t a6)
{
  uint64_t v81 = a6;
  uint64_t v11 = sub_1E0B066A8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13);
  char v15 = &v72[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_1E0B066D8();
  uint64_t v18 = MEMORY[0x1F4188790](v16, v17);
  unsigned int v21 = *a1;
  if (v21 >> 6)
  {
    int v22 = a4 & 1;
    if (v21 >> 6 == 1)
    {
      uint64_t v23 = swift_allocObject();
      id v24 = a3;
      *(void *)(v23 + 16) = a3;
      *(void *)(v23 + 24) = a5;
      uint64_t v25 = v81;
      *(void *)(v23 + 32) = v81;
      *(unsigned char *)(v23 + 40) = a2;
      *(unsigned char *)(v23 + 41) = v22;
      id v26 = a5;
      v27 = (void (*)(uint64_t))sub_1E0AD3704;
    }
    else
    {
      uint64_t v23 = swift_allocObject();
      id v24 = a3;
      *(void *)(v23 + 16) = a3;
      *(unsigned char *)(v23 + 24) = a2;
      *(unsigned char *)(v23 + 25) = v22;
      v27 = (void (*)(uint64_t))sub_1E0AD3794;
      uint64_t v25 = v81;
    }
    if (a2 == 3)
    {
      BOOL v44 = v22 == 0;
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = v27;
      *(void *)(v45 + 24) = v23;
      v24;
      sub_1E0AD3250((uint64_t)v27);
      sub_1E0AD1AC4(v44, a5, v25, (uint64_t)sub_1E0AD3728, v45);
      sub_1E0AD3718((uint64_t)v27);
      return swift_release();
    }
    else
    {
      id v46 = v24;
      uint64_t v47 = sub_1E0AD3250((uint64_t)v27);
      v27(v47);
      sub_1E0AD3718((uint64_t)v27);
      return sub_1E0AD3718((uint64_t)v27);
    }
  }
  else
  {
    v77 = &v72[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v78 = v20;
    uint64_t v79 = v18;
    uint64_t v80 = v12;
    if (a2 == 3 && v21 == 3)
    {
      objc_super v28 = v15;
      if (qword_1EAD61E98 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_1E0B06448();
      __swift_project_value_buffer(v29, (uint64_t)qword_1EAD62140);
      v30 = sub_1E0B06428();
      os_log_type_t v31 = sub_1E0B068C8();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t aBlock = v33;
        *(_DWORD *)uint64_t v32 = 136446466;
        uint64_t v76 = v32 + 4;
        uint64_t v34 = sub_1E0B06C58();
        uint64_t v82 = sub_1E0ACB6F4(v34, v35, &aBlock);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v32 + 12) = 2082;
        uint64_t v82 = sub_1E0ACB6F4(0xD000000000000028, 0x80000001E0B0A8E0, &aBlock);
        sub_1E0B06A68();
        _os_log_impl(&dword_1E0AC7000, v30, v31, "[%{public}s.%{public}s]: User previously denied notification authorization, alerting but not proceeding", (uint8_t *)v32, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1E4E3C540](v33, -1, -1);
        MEMORY[0x1E4E3C540](v32, -1, -1);
      }

      uint64_t v36 = v80;
      sub_1E0AD31A0();
      v37 = (void *)sub_1E0B069A8();
      v38 = (void *)swift_allocObject();
      v38[2] = a3;
      v38[3] = a5;
      v38[4] = v81;
      v87 = sub_1E0AD369C;
      v88 = v38;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v84 = 1107296256;
      v85 = sub_1E0AD7664;
      v86 = &block_descriptor_66;
      v39 = _Block_copy(&aBlock);
      id v40 = a5;
      id v41 = a3;
      swift_release();
      v42 = v77;
      sub_1E0B066C8();
      uint64_t aBlock = MEMORY[0x1E4FBC860];
      sub_1E0AD3438((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
      sub_1E0AD32E8(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
      sub_1E0AD3260();
      sub_1E0B06A98();
      MEMORY[0x1E4E3BC80](0, v42, v28, v39);
      _Block_release(v39);

      (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v28, v11);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v78 + 8))(v42, v79);
    }
    else
    {
      v48 = v15;
      if (qword_1EAD61E98 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_1E0B06448();
      __swift_project_value_buffer(v49, (uint64_t)qword_1EAD62140);
      id v50 = a5;
      v51 = sub_1E0B06428();
      os_log_type_t v52 = sub_1E0B068C8();
      int v53 = v52;
      v54 = a3;
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v55 = swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        uint64_t aBlock = v75;
        *(_DWORD *)uint64_t v55 = 136446978;
        os_log_t v74 = v51;
        uint64_t v56 = sub_1E0B06C58();
        int v73 = v53;
        uint64_t v82 = sub_1E0ACB6F4(v56, v57, &aBlock);
        uint64_t v76 = v11;
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v55 + 12) = 2082;
        uint64_t v82 = sub_1E0ACB6F4(0xD000000000000028, 0x80000001E0B0A8E0, &aBlock);
        sub_1E0B06A68();
        *(_WORD *)(v55 + 22) = 2080;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v59 = v81;
        (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v81 + 8))(&v82, ObjectType, v81);
        uint64_t v60 = sub_1E0B067B8();
        uint64_t v82 = sub_1E0ACB6F4(v60, v61, &aBlock);
        sub_1E0B06A68();

        swift_bridgeObjectRelease();
        *(_WORD *)(v55 + 32) = 2080;
        LOBYTE(v82) = v21;
        uint64_t v62 = sub_1E0B067B8();
        uint64_t v82 = sub_1E0ACB6F4(v62, v63, &aBlock);
        uint64_t v11 = v76;
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        os_log_t v64 = v74;
        _os_log_impl(&dword_1E0AC7000, v74, (os_log_type_t)v73, "[%{public}s.%{public}s]: Unable to proceed to next stage from %s due to reason: %s", (uint8_t *)v55, 0x2Au);
        uint64_t v65 = v75;
        swift_arrayDestroy();
        MEMORY[0x1E4E3C540](v65, -1, -1);
        MEMORY[0x1E4E3C540](v55, -1, -1);
      }
      else
      {

        uint64_t v59 = v81;
      }
      sub_1E0AD31A0();
      v66 = (void *)sub_1E0B069A8();
      uint64_t v67 = swift_allocObject();
      *(void *)(v67 + 16) = v54;
      *(unsigned char *)(v67 + 24) = v21;
      *(void *)(v67 + 32) = v50;
      *(void *)(v67 + 40) = v59;
      v87 = sub_1E0AD365C;
      v88 = (void *)v67;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v84 = 1107296256;
      v85 = sub_1E0AD7664;
      v86 = &block_descriptor_60;
      v68 = _Block_copy(&aBlock);
      id v69 = v50;
      id v70 = v54;
      swift_release();
      v71 = v77;
      sub_1E0B066C8();
      uint64_t aBlock = MEMORY[0x1E4FBC860];
      sub_1E0AD3438((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
      sub_1E0AD32E8(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
      sub_1E0AD3260();
      sub_1E0B06A98();
      MEMORY[0x1E4E3BC80](0, v71, v48, v68);
      _Block_release(v68);

      (*(void (**)(unsigned char *, uint64_t))(v80 + 8))(v48, v11);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v78 + 8))(v71, v79);
    }
  }
}

uint64_t sub_1E0ACF744(uint64_t a1, void *a2, uint64_t a3, char a4, char a5)
{
  char v7 = a5 & 1;
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(unsigned char *)(v9 + 24) = a4;
  *(unsigned char *)(v9 + 25) = v7;
  uint64_t v10 = swift_retain();
  sub_1E0AD00B8(v10, a2, v11, (uint64_t)sub_1E0AD3814, v9);
  swift_release();
  return swift_release();
}

void sub_1E0ACF810(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v9 = a3 + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x1E4E3C5D0](v9);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    char v12 = a4;
    sub_1E0ACF89C(&v12, a5 & 1, a1, a2);
  }
}

void sub_1E0ACF89C(unsigned char *a1, char a2, uint64_t a3, uint64_t a4)
{
  void *(*v29)(uint64_t *__return_ptr);
  void *v30;
  char v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  unsigned char v49[12];
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  uint64_t aBlock;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  void (*v61)();
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  char v66;
  char v67;

  uint64_t v5 = v4;
  v51 = a3;
  os_log_type_t v52 = a4;
  swift_getObjectType();
  uint64_t v55 = a2 & 1;
  uint64_t v8 = sub_1E0B066A8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  char v12 = &v49[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_1E0B066D8();
  int v53 = *(void *)(v13 - 8);
  v54 = v13;
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = &v49[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v56 = v5;
  uint64_t v17 = *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  int v18 = *a1;
  LOBYTE(v65) = *a1;
  (*(void (**)(uint64_t *__return_ptr, uint64_t *))(*(void *)v17 + 224))(&aBlock, &v65);
  char v19 = aBlock;
  if (aBlock == 5)
  {
    if (qword_1EAD61E98 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1E0B06448();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EAD62140);
    unsigned int v21 = sub_1E0B06428();
    os_log_type_t v22 = sub_1E0B068C8();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t aBlock = v24;
      *(_DWORD *)uint64_t v23 = 136446722;
      uint64_t v25 = sub_1E0B06C58();
      uint64_t v65 = sub_1E0ACB6F4(v25, v26, &aBlock);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      uint64_t v65 = sub_1E0ACB6F4(0xD000000000000035, 0x80000001E0B0A870, &aBlock);
      sub_1E0B06A68();
      *(_WORD *)(v23 + 22) = 2080;
      LOBYTE(v65) = v18;
      uint64_t v27 = sub_1E0B067B8();
      uint64_t v65 = sub_1E0ACB6F4(v27, v28, &aBlock);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AC7000, v21, v22, "[%{public}s.%{public}s]: No stage after %s, finishing", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v24, -1, -1);
      MEMORY[0x1E4E3C540](v23, -1, -1);
    }

    uint64_t v67 = v18;
    uint64_t v29 = *(void *(**)(uint64_t *__return_ptr))(*(void *)v17 + 184);
    v30 = v29(&aBlock);
    uint64_t v65 = aBlock;
    v66 = v58;
    if (v18 == 3)
    {
      os_log_type_t v31 = v55 == 0;
    }
    else if (v18 == 1)
    {
      ((void (*)(uint64_t *__return_ptr, void *))v29)(&v63, v30);
      os_log_type_t v31 = v64 | (v63 == 0);
    }
    else
    {
      os_log_type_t v31 = 1;
    }
    sub_1E0ACA000(&v67, &v65, v31 & 1);
    sub_1E0AD24E0(1, 1, v51, v52);
  }
  else
  {
    if (qword_1EAD61E98 != -1) {
      swift_once();
    }
    os_log_type_t v52 = v9;
    uint64_t v32 = sub_1E0B06448();
    __swift_project_value_buffer(v32, (uint64_t)qword_1EAD62140);
    uint64_t v33 = sub_1E0B06428();
    uint64_t v34 = sub_1E0B06888();
    unint64_t v35 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v36 = swift_slowAlloc();
      v51 = swift_slowAlloc();
      uint64_t aBlock = v51;
      *(_DWORD *)uint64_t v36 = 136446978;
      id v50 = v35;
      v37 = sub_1E0B06C58();
      uint64_t v65 = sub_1E0ACB6F4(v37, v38, &aBlock);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2082;
      uint64_t v65 = sub_1E0ACB6F4(0xD000000000000035, 0x80000001E0B0A870, &aBlock);
      sub_1E0B06A68();
      *(_WORD *)(v36 + 22) = 2080;
      LOBYTE(v65) = v18;
      v39 = sub_1E0B067B8();
      uint64_t v65 = sub_1E0ACB6F4(v39, v40, &aBlock);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 32) = 2080;
      LOBYTE(v65) = v19;
      id v41 = sub_1E0B067B8();
      uint64_t v65 = sub_1E0ACB6F4(v41, v42, &aBlock);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AC7000, v33, (os_log_type_t)v50, "[%{public}s.%{public}s]: Transitioning from %s to %s", (uint8_t *)v36, 0x2Au);
      v43 = v51;
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v43, -1, -1);
      MEMORY[0x1E4E3C540](v36, -1, -1);
    }

    sub_1E0AD31A0();
    BOOL v44 = (void *)sub_1E0B069A8();
    uint64_t v45 = swift_allocObject();
    id v46 = v56;
    *(void *)(v45 + 16) = v56;
    *(unsigned char *)(v45 + 24) = v19;
    *(unsigned char *)(v45 + 25) = v18;
    *(unsigned char *)(v45 + 26) = v55;
    unint64_t v61 = sub_1E0AD3570;
    uint64_t v62 = v45;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    v58 = 1107296256;
    uint64_t v59 = sub_1E0AD7664;
    uint64_t v60 = &block_descriptor_54;
    uint64_t v47 = _Block_copy(&aBlock);
    v48 = v46;
    swift_release();
    sub_1E0B066C8();
    uint64_t aBlock = MEMORY[0x1E4FBC860];
    sub_1E0AD3438((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
    sub_1E0AD32E8(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1E0AD3260();
    sub_1E0B06A98();
    MEMORY[0x1E4E3BC80](0, v16, v12, v47);
    _Block_release(v47);

    (*(void (**)(unsigned char *, uint64_t))(v52 + 8))(v12, v8);
    (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v16, v54);
  }
}

void sub_1E0AD00B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_getObjectType();
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v7 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  swift_retain();
  uint64_t v9 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v40 = sub_1E0AD34B8;
  uint64_t v41 = v8;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v37 = 1107296256;
  v38 = sub_1E0ACA5D4;
  v39 = &block_descriptor_42;
  uint64_t v10 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v9, 0, v10, 0xE000000000000000);
  _Block_release(v10);

  uint64_t v34 = a4;
  uint64_t v13 = (void *)qword_1EAD62608;
  id v14 = v12;
  id v15 = v13;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v16 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v17 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  int v18 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v17, v18, 0, 0xE000000000000000);

  id v20 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v34;
  *(void *)(v21 + 24) = a5;
  swift_retain();
  os_log_type_t v22 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v40 = sub_1E0AD34F8;
  uint64_t v41 = v21;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v37 = 1107296256;
  v38 = sub_1E0ACA5D4;
  v39 = &block_descriptor_48;
  uint64_t v23 = _Block_copy(&aBlock);
  swift_release();
  id v24 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v22, 1, v23, 0xE000000000000000);
  _Block_release(v23);

  objc_msgSend(v19, sel_addAction_, v24);
  if (v14)
  {
    objc_msgSend(v19, sel_addAction_, v14);
  }
  if (qword_1EAD61E98 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1E0B06448();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EAD62140);
  unint64_t v26 = sub_1E0B06428();
  os_log_type_t v27 = sub_1E0B068C8();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t aBlock = v29;
    *(_DWORD *)uint64_t v28 = 136446722;
    uint64_t v30 = sub_1E0B06C58();
    sub_1E0ACB6F4(v30, v31, &aBlock);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2082;
    sub_1E0ACB6F4(0xD000000000000038, 0x80000001E0B0A810, &aBlock);
    sub_1E0B06A68();
    *(_WORD *)(v28 + 22) = 2082;
    uint64_t v32 = sub_1E0B067B8();
    sub_1E0ACB6F4(v32, v33, &aBlock);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v26, v27, "[%{public}s.%{public}s]: Showing warning due to reason %{public}s", (uint8_t *)v28, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v29, -1, -1);
    MEMORY[0x1E4E3C540](v28, -1, -1);
  }

  objc_msgSend(a2, sel_presentViewController_animated_completion_, v19, 1, 0);
}

uint64_t sub_1E0AD0750()
{
  return MEMORY[0x1F411DF08](0xD00000000000001ELL, 0x80000001E0B0A850);
}

void sub_1E0AD076C(unsigned char *a1, void *a2)
{
  uint64_t ObjectType = swift_getObjectType();
  switch(*a1)
  {
    case 1:
      if (qword_1EAD61EC8 != -1) {
        goto LABEL_23;
      }
      goto LABEL_6;
    case 2:
      if (qword_1EAD61EC8 != -1) {
LABEL_23:
      }
        swift_once();
LABEL_6:
      id v6 = (id)qword_1EAD62608;
      swift_bridgeObjectRetain();
      goto LABEL_16;
    case 3:
      if (qword_1EAD61E98 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_1E0B06448();
      __swift_project_value_buffer(v7, (uint64_t)qword_1EAD62140);
      uint64_t v8 = sub_1E0B06428();
      os_log_type_t v9 = sub_1E0B068B8();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v32 = v11;
        *(_DWORD *)uint64_t v10 = 136446722;
        uint64_t v12 = sub_1E0B06C58();
        sub_1E0ACB6F4(v12, v13, &v32);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v10 + 12) = 2082;
        sub_1E0ACB6F4(0xD00000000000002BLL, 0x80000001E0B0A700, &v32);
        sub_1E0B06A68();
        *(_WORD *)(v10 + 22) = 2082;
        uint64_t v14 = sub_1E0B067B8();
        sub_1E0ACB6F4(v14, v15, &v32);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1E0AC7000, v8, v9, "[%{public}s.%{public}s]: Handling notification authorization cannot progress reason %{public}s where it should have been handled in a separate pathway.", (uint8_t *)v10, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1E4E3C540](v11, -1, -1);
        MEMORY[0x1E4E3C540](v10, -1, -1);
      }

      if (qword_1EAD61EC8 != -1) {
        swift_once();
      }
      id v6 = (id)qword_1EAD62608;
      swift_bridgeObjectRetain();
LABEL_16:
      sub_1E0B05E58();
      swift_bridgeObjectRelease();

      if (qword_1EAD61E98 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1E0B06448();
      __swift_project_value_buffer(v16, (uint64_t)qword_1EAD62140);
      uint64_t v17 = sub_1E0B06428();
      os_log_type_t v18 = sub_1E0B068C8();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        unint64_t v31 = a2;
        uint64_t v20 = swift_slowAlloc();
        uint64_t v32 = v20;
        *(_DWORD *)uint64_t v19 = 136446722;
        uint64_t v21 = sub_1E0B06C58();
        sub_1E0ACB6F4(v21, v22, &v32);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v19 + 12) = 2082;
        sub_1E0ACB6F4(0xD00000000000002BLL, 0x80000001E0B0A700, &v32);
        sub_1E0B06A68();
        *(_WORD *)(v19 + 22) = 2082;
        uint64_t v23 = sub_1E0B067B8();
        sub_1E0ACB6F4(v23, v24, &v32);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1E0AC7000, v17, v18, "[%{public}s.%{public}s]: Showing blocking alert due to reason %{public}s", (uint8_t *)v19, 0x20u);
        swift_arrayDestroy();
        uint64_t v25 = v20;
        a2 = v31;
        MEMORY[0x1E4E3C540](v25, -1, -1);
        MEMORY[0x1E4E3C540](v19, -1, -1);
      }

      swift_bridgeObjectRetain();
      unint64_t v26 = (void *)sub_1E0B06788();
      swift_bridgeObjectRelease();
      id v27 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, 0, v26, 1, 0xE000000000000000);

      if (qword_1EAD61EC8 != -1) {
        swift_once();
      }
      id v28 = (id)qword_1EAD62608;
      swift_bridgeObjectRetain();
      sub_1E0B05E58();
      swift_bridgeObjectRelease();

      uint64_t v29 = (void *)sub_1E0B06788();
      swift_bridgeObjectRelease();
      id v30 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v29, 1, 0, 0xE000000000000000);

      objc_msgSend(v27, sel_addAction_, v30);
      objc_msgSend(a2, sel_presentViewController_animated_completion_, v27, 1, 0);
      swift_bridgeObjectRelease();

      break;
    default:
      sub_1E0AD00B8(ObjectType, a2, v5, (uint64_t)sub_1E0AD0F00, 0);
      break;
  }
}

uint64_t sub_1E0AD0F00(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1E0AD0F28(void *a1)
{
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v2 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v3 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v3, v4, 1, 0xE000000000000000);

  id v6 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v8 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  unint64_t v22 = sub_1E0AD3428;
  uint64_t v23 = v7;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_1E0ACA5D4;
  uint64_t v21 = &block_descriptor_32;
  os_log_type_t v9 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v10 = self;
  id v11 = objc_msgSend(v10, sel_actionWithTitle_style_handler_, v8, 1, v9, 0xE000000000000000);
  _Block_release(v9);
  swift_release();

  id v12 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v14 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  unint64_t v22 = sub_1E0AD3430;
  uint64_t v23 = v13;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_1E0ACA5D4;
  uint64_t v21 = &block_descriptor_36;
  unint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  id v16 = objc_msgSend(v10, sel_actionWithTitle_style_handler_, v14, 0, v15, 0xE000000000000000);
  _Block_release(v15);
  swift_release();

  objc_msgSend(v5, sel_addAction_, v11);
  objc_msgSend(v5, sel_addAction_, v16);
  objc_msgSend(v5, sel_setPreferredAction_, v16);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v5, 1, 0);
}

uint64_t sub_1E0AD13E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1E0B062E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E0B06308();
  uint64_t v23 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v9);
  id v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E0B062D8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v12, v14);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)&v23 - v19;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](a2 + 16);
  if (result)
  {
    unint64_t v22 = (void *)result;
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v20, *MEMORY[0x1E4F666A8], v12);
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E4F666B8], v3);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
    sub_1E0B062F8();
    sub_1E0AD3438(&qword_1EAD621F0, MEMORY[0x1E4F666C0]);
    sub_1E0B06158();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v8);

    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v20, v12);
  }
  return result;
}

uint64_t sub_1E0AD16F4(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = sub_1E0B06138();
  uint64_t v3 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33, v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_1E0B062E8();
  uint64_t v7 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30, v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E0B06308();
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1E0B062D8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v15, v17);
  uint64_t v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v21);
  uint64_t v23 = (char *)&v29 - v22;
  swift_beginAccess();
  uint64_t v24 = MEMORY[0x1E4E3C5D0](a2 + 16);
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    (*(void (**)(char *, void, uint64_t))(v16 + 104))(v23, *MEMORY[0x1E4F66690], v15);
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E4F666B8], v30);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v23, v15);
    sub_1E0B062F8();
    sub_1E0AD3438(&qword_1EAD621F0, MEMORY[0x1E4F666C0]);
    uint64_t v26 = v32;
    sub_1E0B06158();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v26);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v23, v15);
  }
  uint64_t v27 = v33;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4F65E98], v33);
  sub_1E0B06128();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v27);
}

uint64_t sub_1E0AD1AC4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = v6;
  v14[5] = a2;
  v14[6] = a3;
  v14[7] = ObjectType;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t (*)(char, void *), void *))(*(void *)v13 + 240);
  swift_retain();
  id v16 = v6;
  id v17 = a2;
  v15(a1, sub_1E0AD3394, v14);
  return swift_release();
}

uint64_t sub_1E0AD1BB8(char a1, void *a2, uint64_t (*a3)(void), uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v61 = a7;
  uint64_t v62 = a5;
  uint64_t v12 = sub_1E0B066A8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  id v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1E0B066D8();
  uint64_t v19 = MEMORY[0x1F4188790](v17, v18);
  uint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    uint64_t v57 = v20;
    uint64_t v58 = v19;
    uint64_t v59 = v13;
    uint64_t v60 = a4;
    uint64_t v56 = a6;
    if (a2)
    {
      id v24 = a2;
      if (qword_1EAD61E98 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_1E0B06448();
      __swift_project_value_buffer(v25, (uint64_t)qword_1EAD62140);
      id v26 = a2;
      id v27 = a2;
      id v28 = sub_1E0B06428();
      os_log_type_t v29 = sub_1E0B068A8();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        aBlock[0] = v54;
        *(_DWORD *)uint64_t v30 = 136446722;
        uint64_t v55 = a3;
        uint64_t v31 = sub_1E0B06C58();
        uint64_t v63 = sub_1E0ACB6F4(v31, v32, aBlock);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2082;
        uint64_t v63 = sub_1E0ACB6F4(0xD00000000000004CLL, 0x80000001E0B0A560, aBlock);
        sub_1E0B06A68();
        *(_WORD *)(v30 + 22) = 2082;
        uint64_t v63 = (uint64_t)a2;
        id v33 = a2;
        sub_1E0ACB030();
        uint64_t v34 = sub_1E0B067B8();
        uint64_t v63 = sub_1E0ACB6F4(v34, v35, aBlock);
        a3 = v55;
        sub_1E0B06A68();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1E0AC7000, v28, v29, "[%{public}s.%{public}s]: Attempted to complete onboarding but received error: %{public}s", (uint8_t *)v30, 0x20u);
        uint64_t v36 = v54;
        swift_arrayDestroy();
        MEMORY[0x1E4E3C540](v36, -1, -1);
        MEMORY[0x1E4E3C540](v30, -1, -1);

LABEL_14:
        sub_1E0AD31A0();
        uint64_t v45 = (void *)sub_1E0B069A8();
        id v46 = (void *)swift_allocObject();
        uint64_t v47 = v61;
        v48 = v62;
        uint64_t v49 = v56;
        v46[2] = v62;
        v46[3] = v49;
        v46[4] = v47;
        aBlock[4] = (uint64_t)sub_1E0AD33E4;
        aBlock[5] = (uint64_t)v46;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1E0AD7664;
        aBlock[3] = (uint64_t)&block_descriptor_26;
        id v50 = _Block_copy(aBlock);
        id v51 = v48;
        id v52 = v49;
        swift_release();
        sub_1E0B066C8();
        aBlock[0] = MEMORY[0x1E4FBC860];
        sub_1E0AD3438((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
        sub_1E0AD32E8(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
        sub_1E0AD3260();
        sub_1E0B06A98();
        MEMORY[0x1E4E3BC80](0, v22, v16, v50);
        _Block_release(v50);

        (*(void (**)(char *, uint64_t))(v59 + 8))(v16, v12);
        (*(void (**)(char *, uint64_t))(v57 + 8))(v22, v58);
        uint64_t v23 = 0;
        return a3(v23);
      }
    }
    else
    {
      if (qword_1EAD61E98 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_1E0B06448();
      __swift_project_value_buffer(v37, (uint64_t)qword_1EAD62140);
      id v28 = sub_1E0B06428();
      os_log_type_t v38 = sub_1E0B068A8();
      if (os_log_type_enabled(v28, v38))
      {
        uint64_t v39 = swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        uint64_t v55 = a3;
        uint64_t v41 = v40;
        aBlock[0] = v40;
        *(_DWORD *)uint64_t v39 = 136446466;
        uint64_t v42 = sub_1E0B06C58();
        uint64_t v63 = sub_1E0ACB6F4(v42, v43, aBlock);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v39 + 12) = 2082;
        uint64_t v63 = sub_1E0ACB6F4(0xD00000000000004CLL, 0x80000001E0B0A560, aBlock);
        sub_1E0B06A68();
        _os_log_impl(&dword_1E0AC7000, v28, v38, "[%{public}s.%{public}s]: Attempted to complete onboarding but received error: UNKNOWN", (uint8_t *)v39, 0x16u);
        swift_arrayDestroy();
        uint64_t v44 = v41;
        a3 = v55;
        MEMORY[0x1E4E3C540](v44, -1, -1);
        MEMORY[0x1E4E3C540](v39, -1, -1);
      }
    }

    goto LABEL_14;
  }
  uint64_t v23 = 1;
  return a3(v23);
}

void sub_1E0AD22A4(uint64_t a1, void *a2)
{
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v3 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, 0, v4, 1, 0xE000000000000000);

  id v5 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v6 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v6, 1, 0, 0xE000000000000000);

  objc_msgSend(v8, sel_addAction_, v7);
  objc_msgSend(a2, sel_presentViewController_animated_completion_, v8, 1, 0);
  swift_bridgeObjectRelease();
}

void sub_1E0AD24E0(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  swift_getObjectType();
  uint64_t v6 = sub_1E0B066A8();
  uint64_t v34 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E0B066D8();
  uint64_t v32 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  MEMORY[0x1F4188790](v10, v11);
  os_log_type_t v38 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EAD61E98 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1E0B06448();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EAD62140);
  uint64_t v14 = sub_1E0B06428();
  os_log_type_t v15 = sub_1E0B06888();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v31 = v6;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)uint64_t v17 = 136446466;
    uint64_t v19 = sub_1E0B06C58();
    uint64_t v39 = sub_1E0ACB6F4(v19, v20, aBlock);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v39 = sub_1E0ACB6F4(0xD000000000000035, 0x80000001E0B0A520, aBlock);
    sub_1E0B06A68();
    _os_log_impl(&dword_1E0AC7000, v14, v15, "[%{public}s.%{public}s]: Onboarding finished", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v18, -1, -1);
    uint64_t v21 = v17;
    uint64_t v6 = v31;
    MEMORY[0x1E4E3C540](v21, -1, -1);
  }

  if (a1)
  {
    sub_1E0AD31A0();
    uint64_t v22 = (void *)sub_1E0B069A8();
    uint64_t v23 = swift_allocObject();
    uint64_t v25 = v35;
    uint64_t v24 = v36;
    *(void *)(v23 + 16) = v35;
    *(unsigned char *)(v23 + 24) = a2 & 1;
    uint64_t v26 = v37;
    *(void *)(v23 + 32) = v24;
    *(void *)(v23 + 40) = v26;
    aBlock[4] = (uint64_t)sub_1E0AD3228;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1E0AD7664;
    aBlock[3] = (uint64_t)&block_descriptor_0;
    id v27 = _Block_copy(aBlock);
    id v28 = v25;
    sub_1E0AD3250(v24);
    swift_release();
    os_log_type_t v29 = v38;
    sub_1E0B066C8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1E0AD3438((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
    sub_1E0AD32E8(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1E0AD3260();
    sub_1E0B06A98();
    MEMORY[0x1E4E3BC80](0, v29, v9, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v33);
  }
}

uint64_t sub_1E0AD2984(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_1E0AD32E8(0, (unint64_t *)&qword_1EAD621E0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = a1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController;
  uint64_t result = MEMORY[0x1E4E3C5D0](a1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController);
  if (result)
  {
    uint64_t v14 = *(void *)(v12 + 8);
    uint64_t ObjectType = swift_getObjectType();
    id v16 = (id)HKMobilityWalkingSteadinessDetailRoomURL();
    sub_1E0B05F08();

    uint64_t v17 = sub_1E0B05F18();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
    (*(void (**)(void, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 40))(a2 & 1, v11, a3, a4, ObjectType, v14);
    swift_unknownObjectRelease();
    return sub_1E0AD35BC((uint64_t)v11, (uint64_t)&qword_1EAD621E0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1E0AD32E8);
  }
  return result;
}

id WalkingSteadinessOnboardingCoordinator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WalkingSteadinessOnboardingCoordinator.init()()
{
}

id WalkingSteadinessOnboardingCoordinator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1E0AD2C80()
{
  swift_getObjectType();
  if (qword_1EAD61E98 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E0B06448();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62140);
  id v1 = sub_1E0B06428();
  os_log_type_t v2 = sub_1E0B068C8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v7 = v4;
    *(_DWORD *)uint64_t v3 = 136446466;
    uint64_t v5 = sub_1E0B06C58();
    sub_1E0ACB6F4(v5, v6, &v7);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2082;
    sub_1E0ACB6F4(0xD00000000000002ELL, 0x80000001E0B0A8B0, &v7);
    sub_1E0B06A68();
    _os_log_impl(&dword_1E0AC7000, v1, v2, "[%{public}s.%{public}s]: User pressed cancel button", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v4, -1, -1);
    MEMORY[0x1E4E3C540](v3, -1, -1);
  }

  sub_1E0AD24E0(1, 0, 0, 0);
}

void sub_1E0AD2E64()
{
  swift_getObjectType();
  if (qword_1EAD61E98 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E0B06448();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62140);
  id v1 = sub_1E0B06428();
  os_log_type_t v2 = sub_1E0B06888();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v7 = v4;
    *(_DWORD *)uint64_t v3 = 136446466;
    uint64_t v5 = sub_1E0B06C58();
    sub_1E0ACB6F4(v5, v6, &v7);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2082;
    sub_1E0ACB6F4(0xD000000000000025, 0x80000001E0B0A910, &v7);
    sub_1E0B06A68();
    _os_log_impl(&dword_1E0AC7000, v1, v2, "[%{public}s.%{public}s]: User dismissed modal view", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v4, -1, -1);
    MEMORY[0x1E4E3C540](v3, -1, -1);
  }

  sub_1E0AD24E0(0, 0, 0, 0);
}

uint64_t sub_1E0AD3048()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1E0AD308C(unsigned __int8 *a1)
{
  return sub_1E0ACECB0(a1, *(unsigned char *)(v1 + 16), *(void **)(v1 + 24), *(unsigned char *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t method lookup function for WalkingSteadinessOnboardingCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingCoordinator);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.__allocating_init(rootViewController:model:factory:analyticsManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.presentationControllerWillDismiss(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.onboardingViewControllerDidTapPrimaryButton(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.onboardingViewControllerDidTapSecondaryButton(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.onboardingViewControllerDidTapCancelButton(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

unint64_t sub_1E0AD31A0()
{
  unint64_t result = qword_1EBF0EA60[0];
  if (!qword_1EBF0EA60[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1EBF0EA60);
  }
  return result;
}

uint64_t sub_1E0AD31E0()
{
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E0AD3228()
{
  return sub_1E0AD2984(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1E0AD3250(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_1E0AD3260()
{
  unint64_t result = qword_1EBF0EC40;
  if (!qword_1EBF0EC40)
  {
    sub_1E0AD32E8(255, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBF0EC40);
  }
  return result;
}

void sub_1E0AD32E8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1E0AD334C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1E0AD3394(char a1, void *a2)
{
  return sub_1E0AD1BB8(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(void **)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_1E0AD33A4()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1E0AD33E4()
{
  sub_1E0AD22A4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1E0AD33F0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E0AD3428(uint64_t a1)
{
  return sub_1E0AD13E8(a1, v1);
}

uint64_t sub_1E0AD3430(uint64_t a1)
{
  return sub_1E0AD16F4(a1, v1);
}

uint64_t sub_1E0AD3438(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E0AD3480()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E0AD34B8()
{
  return (*(uint64_t (**)(uint64_t (*)(), void))(v0 + 16))(sub_1E0AD0750, 0);
}

uint64_t sub_1E0AD34F8()
{
  return (*(uint64_t (**)(uint64_t (*)(), void))(v0 + 16))(nullsub_1, 0);
}

uint64_t sub_1E0AD3538()
{
  return MEMORY[0x1F4186498](v0, 27, 7);
}

void sub_1E0AD3570()
{
  unsigned __int8 v1 = v0[25];
  char v2 = v0[26];
  char v4 = v0[24];
  unsigned __int8 v3 = v1;
  sub_1E0ACE298(&v4, &v3, v2);
}

uint64_t sub_1E0AD35BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_1E0AD361C()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1E0AD365C()
{
  unsigned __int8 v1 = *(void **)(v0 + 32);
  char v2 = *(unsigned char *)(v0 + 24);
  sub_1E0AD076C(&v2, v1);
}

void sub_1E0AD369C()
{
  sub_1E0AD0F28(*(void **)(v0 + 24));
}

uint64_t sub_1E0AD36C4()
{
  return MEMORY[0x1F4186498](v0, 42, 7);
}

uint64_t sub_1E0AD3704()
{
  return sub_1E0ACF744(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40), *(unsigned char *)(v0 + 41));
}

uint64_t sub_1E0AD3718(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1E0AD3728(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(v1 + 16))();
  }
  return result;
}

uint64_t sub_1E0AD375C()
{
  return MEMORY[0x1F4186498](v0, 26, 7);
}

void sub_1E0AD3794()
{
  char v1 = *(unsigned char *)(v0 + 25);
  char v2 = *(unsigned char *)(v0 + 24);
  sub_1E0ACF89C(&v2, v1, 0, 0);
}

uint64_t sub_1E0AD37DC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 26, 7);
}

void sub_1E0AD3814(uint64_t a1, uint64_t a2)
{
  sub_1E0ACF810(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(unsigned char *)(v2 + 25));
}

void sub_1E0AD3824(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1E0AD38C0()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62270);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62270);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  unsigned __int8 v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_1E0AD3988(uint64_t a1, void *a2)
{
  sub_1E0AD3F94(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098((uint64_t)v5, v3);
  swift_endAccess();
  sub_1E0AD3A14();
  return sub_1E0AD47F4((uint64_t)v5, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
}

void sub_1E0AD3A14()
{
  swift_getObjectType();
  uint64_t v1 = (uint64_t)&v0[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item];
  swift_beginAccess();
  sub_1E0AD3F94(v1, (uint64_t)&v25);
  if (*((void *)&v26 + 1))
  {
    sub_1E0AD48AC(0, (unint64_t *)&qword_1EAD62298);
    sub_1E0AD48AC(0, &qword_1EAD62380);
    if (swift_dynamicCast())
    {
      uint64_t v2 = (void *)v22;
      uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView];
      uint64_t ObjectType = swift_getObjectType();
      objc_msgSend(v3, sel_setDelegate_, v22);
      objc_msgSend(v3, sel_setDataSource_, v22);
      objc_msgSend(v3, sel_reloadAllComponents);
      uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(ObjectType, v23);
      uint64_t v6 = *(void *)(v5 + 16);
      if (v6)
      {
        uint64_t v7 = (void *)(v5 + 40);
        do
        {
          objc_msgSend(v3, sel_selectRow_inComponent_animated_, *(v7 - 1), *v7, 0);
          v7 += 2;
          --v6;
        }
        while (v6);
      }
      swift_bridgeObjectRelease();
      sub_1E0AD3F94(v1, (uint64_t)&v22);
      if (v24)
      {
        sub_1E0AD48AC(0, (unint64_t *)&unk_1EAD62390);
        if (swift_dynamicCast())
        {
          if (*((void *)&v26 + 1))
          {
            __swift_project_boxed_opaque_existential_1(&v25, *((uint64_t *)&v26 + 1));
            uint64_t v8 = sub_1E0B062C8();
            uint64_t v10 = v9;
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v25);
            if (v10) {
              uint64_t v11 = v8;
            }
            else {
              uint64_t v11 = 0;
            }
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v27 = 0;
          long long v25 = 0u;
          long long v26 = 0u;
        }
      }
      else
      {
        sub_1E0AD47F4((uint64_t)&v22, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v27 = 0;
      }
      sub_1E0AD47F4((uint64_t)&v25, &qword_1EAD62388, (unint64_t *)&unk_1EAD62390);
      uint64_t v11 = 0;
      uint64_t v10 = 0;
LABEL_21:
      sub_1E0AD4278(v11, v10);
      swift_bridgeObjectRelease();
      if (objc_msgSend(v2, sel_respondsToSelector_, sel_pickerView_didSelectRow_inComponent_))
      {
        swift_unknownObjectRetain();
        objc_msgSend(v2, sel_pickerView_didSelectRow_inComponent_, v3, objc_msgSend(v3, sel_selectedRowInComponent_, 0), 0);
        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      return;
    }
  }
  else
  {
    sub_1E0AD47F4((uint64_t)&v25, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
  }
  if (qword_1EAD61EA0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1E0B06448();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EAD62270);
  uint64_t v13 = v0;
  uint64_t v14 = sub_1E0B06428();
  os_log_type_t v15 = sub_1E0B068A8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(void *)&long long v25 = v17;
    *(_DWORD *)uint64_t v16 = 136446722;
    uint64_t v18 = sub_1E0B06C58();
    sub_1E0ACB6F4(v18, v19, (uint64_t *)&v25);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    sub_1E0ACB6F4(1835365481, 0xE400000000000000, (uint64_t *)&v25);
    sub_1E0B06A68();
    *(_WORD *)(v16 + 22) = 2082;
    sub_1E0AD4850(0, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
    sub_1E0AD47A0();
    uint64_t v20 = sub_1E0B067B8();
    uint64_t v22 = sub_1E0ACB6F4(v20, v21, (uint64_t *)&v25);
    sub_1E0B06A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v14, v15, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that did not conform to PickerTableViewCellSource", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v17, -1, -1);
    MEMORY[0x1E4E3C540](v16, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1E0AD3F40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a1);
}

uint64_t sub_1E0AD3F94(uint64_t a1, uint64_t a2)
{
  sub_1E0AD4850(0, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0AD4010(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098(a1, v3);
  swift_endAccess();
  sub_1E0AD3A14();
  return sub_1E0AD47F4(a1, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
}

uint64_t sub_1E0AD4098(uint64_t a1, uint64_t a2)
{
  sub_1E0AD4850(0, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void (*sub_1E0AD4114(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1E0AD4174;
}

void sub_1E0AD4174(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1E0AD3A14();
  }
}

id PickerTableViewCell.pickerView.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView);
}

void sub_1E0AD4278(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView);
    sub_1E0AD4398();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1E0B07E50;
    *(void *)(v6 + 32) = a1;
    *(void *)(v6 + 40) = a2;
    *(void *)(v6 + 48) = 0x72656B636950;
    *(void *)(v6 + 56) = 0xE600000000000000;
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1E0B06818();
    swift_bridgeObjectRelease();
    id v9 = (id)HKUIJoinStringsForAutomationIdentifier();

    objc_msgSend(v5, sel_setAccessibilityIdentifier_, v9);
  }
  else
  {
    uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView);
    objc_msgSend(v8, sel_setAccessibilityIdentifier_, 0);
  }
}

void sub_1E0AD4398()
{
  if (!qword_1EAD622A8)
  {
    unint64_t v0 = sub_1E0B06BA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD622A8);
    }
  }
}

id PickerTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PickerTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PickerTableViewCell()
{
  return self;
}

void sub_1E0AD44B0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1E0AD44D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a2);
}

uint64_t dispatch thunk of PickerTableViewCellSource.initialSelections.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for PickerTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PickerTableViewCell);
}

uint64_t dispatch thunk of PickerTableViewCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PickerTableViewCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PickerTableViewCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PickerTableViewCell.updateAutomationIdentifiers(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

char *sub_1E0AD462C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = &v2[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = objc_allocWithZone(MEMORY[0x1E4FB1A98]);
  uint64_t v6 = v2;
  id v7 = objc_msgSend(v5, sel_init);
  *(void *)&v6[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView] = v7;

  if (a2)
  {
    uint64_t v8 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for PickerTableViewCell();
  id v9 = (char *)objc_msgSendSuper2(&v17, sel_initWithStyle_reuseIdentifier_, 0, v8);

  uint64_t v10 = OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView;
  uint64_t v11 = *(void **)&v9[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView];
  uint64_t v12 = v9;
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v13 = objc_msgSend(v12, sel_contentView);
  objc_msgSend(v13, sel_addSubview_, v11);

  id v14 = *(id *)&v9[v10];
  id v15 = objc_msgSend(v12, sel_contentView);
  objc_msgSend(v14, sel_hk_alignConstraintsWithView_, v15);

  return v12;
}

unint64_t sub_1E0AD47A0()
{
  unint64_t result = qword_1EAD62378;
  if (!qword_1EAD62378)
  {
    sub_1E0AD4850(255, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62378);
  }
  return result;
}

uint64_t sub_1E0AD47F4(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1E0AD4850(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1E0AD4850(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1E0AD48AC(255, a3);
    unint64_t v4 = sub_1E0B06A58();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1E0AD48AC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_1E0AD4940()
{
}

void OnboardingViewControllerProxy.dismiss(dueToCompletion:deepLinkUrlToUse:completion:)()
{
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.presentationController.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.present(_:animated:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.setViewControllers(_:animated:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.show(_:sender:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.dismiss(dueToCompletion:deepLinkUrlToUse:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.dismiss(animated:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t WeightItem.reuseIdentifier.getter()
{
  return sub_1E0B061D8();
}

unint64_t sub_1E0AD4AA8()
{
  unint64_t result = qword_1EAD623A0;
  if (!qword_1EAD623A0)
  {
    type metadata accessor for TitleValueTableViewCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD623A0);
  }
  return result;
}

uint64_t WeightItem.uniqueIdentifier.getter()
{
  sub_1E0AD4BB8();
  uint64_t v1 = sub_1E0B067B8();
  objc_super v2 = *v0;
  sub_1E0AD4BF4();
  id v3 = v2;
  sub_1E0B067B8();
  swift_bridgeObjectRetain();
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1E0AD4BB8()
{
  unint64_t result = qword_1EAD623A8;
  if (!qword_1EAD623A8)
  {
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD623A8);
  }
  return result;
}

void sub_1E0AD4BF4()
{
  if (!qword_1EAD623B0)
  {
    sub_1E0AD4C4C();
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD623B0);
    }
  }
}

unint64_t sub_1E0AD4C4C()
{
  unint64_t result = qword_1EAD623B8;
  if (!qword_1EAD623B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD623B8);
  }
  return result;
}

uint64_t WeightItem.baseIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WeightItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*WeightItem.baseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t WeightItem.init(weight:valueFormatter:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, void *a3@<X8>)
{
  a3[6] = 0;
  a3[7] = 0;
  *a3 = a1;
  return sub_1E0ACB27C(a2, (uint64_t)(a3 + 1));
}

uint64_t sub_1E0AD4D2C()
{
  return sub_1E0B061D8();
}

uint64_t sub_1E0AD4D68()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E0AD4D98(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*sub_1E0AD4DD0())()
{
  return nullsub_1;
}

uint64_t WeightItem.title.getter()
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t WeightItem.value.getter()
{
  uint64_t v1 = *(void **)v0;
  if (*(void *)v0)
  {
    uint64_t v2 = *(void *)(v0 + 32);
    uint64_t v3 = *(void *)(v0 + 40);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 8), v2);
    char v10 = 0;
    unint64_t v4 = *(uint64_t (**)(char *, id, uint64_t, uint64_t))(v3 + 16);
    id v5 = v1;
    uint64_t v6 = v4(&v10, v5, v2, v3);

    return v6;
  }
  else
  {
    if (qword_1EAD61EC0 != -1) {
      swift_once();
    }
    id v8 = (id)qword_1EAD625F0;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1E0B05E58();
    swift_bridgeObjectRelease();

    return v9;
  }
}

uint64_t sub_1E0AD5004()
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t destroy for WeightItem(id *a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 1));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WeightItem(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = a2 + 8;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  id v10 = v4;
  v9(v5, v6, v8);
  uint64_t v11 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WeightItem(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
        uint64_t result = (uint64_t *)swift_release();
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

uint64_t assignWithTake for WeightItem(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WeightItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WeightItem(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeightItem()
{
  return &type metadata for WeightItem;
}

uint64_t sub_1E0AD5584()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD623C0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD623C0);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_1E0AD564C()
{
}

void sub_1E0AD5670()
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  v6[0] = 0;
  id v1 = objc_msgSend(v0, sel_dateOfBirthComponentsWithError_, v6);
  id v2 = v6[0];
  if (v1)
  {
    long long v3 = v1;
    sub_1E0B05E38();
    id v4 = v2;
  }
  else
  {
    id v5 = v6[0];
    sub_1E0B05EE8();

    swift_willThrow();
  }
}

id sub_1E0AD5734()
{
  return sub_1E0AD578C((SEL *)&selRef__heightCharacteristicQuantityWithError_);
}

id sub_1E0AD5760()
{
  return sub_1E0AD578C((SEL *)&selRef__bodyMassCharacteristicQuantityWithError_);
}

id sub_1E0AD578C(SEL *a1)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  v6[0] = 0;
  id v2 = objc_msgSend(v1, *a1, v6);
  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_1E0B05EE8();

    swift_willThrow();
  }
  return v2;
}

id sub_1E0AD5840(uint64_t a1)
{
  return sub_1E0AD5864(a1);
}

id sub_1E0AD5864(uint64_t a1)
{
  id v2 = v1;
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)v14 - v6;
  sub_1E0AD5CCC(a1, (uint64_t)v14 - v6);
  uint64_t v8 = sub_1E0B05E48();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_1E0B05E28();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  v14[0] = 0;
  unsigned __int8 v11 = objc_msgSend(v2, sel__setDateOfBirthComponents_error_, v10, v14);

  if (v11) {
    return v14[0];
  }
  id v13 = v14[0];
  sub_1E0B05EE8();

  return (id)swift_willThrow();
}

id sub_1E0AD5A28(uint64_t a1)
{
  return sub_1E0AD5A80(a1, (SEL *)&selRef__setBodyMassCharacteristicQuantity_error_);
}

id sub_1E0AD5A54(uint64_t a1)
{
  return sub_1E0AD5A80(a1, (SEL *)&selRef__setHeightCharacteristicQuantity_error_);
}

id sub_1E0AD5A80(uint64_t a1, SEL *a2)
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (objc_msgSend(v2, *a2, a1, v5)) {
    return v5[0];
  }
  id v4 = v5[0];
  sub_1E0B05EE8();

  return (id)swift_willThrow();
}

void ConfirmDetailsProvider.Details.init(dateOfBirthComponents:weight:height:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1E0B05E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a4, 1, 1, v8);
  uint64_t v9 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v10 = *(int *)(v9 + 20);
  *(void *)(a4 + v10) = 0;
  uint64_t v11 = *(int *)(v9 + 24);
  *(void *)(a4 + v11) = 0;
  sub_1E0AD5C2C(a1, a4);

  *(void *)(a4 + v10) = a2;
  *(void *)(a4 + v11) = a3;
}

uint64_t type metadata accessor for ConfirmDetailsProvider.Details()
{
  uint64_t result = qword_1EAD62410;
  if (!qword_1EAD62410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0AD5C2C(uint64_t a1, uint64_t a2)
{
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t ConfirmDetailsProvider.Details.dateOfBirthComponents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AD5CCC(v1, a1);
}

uint64_t sub_1E0AD5CCC(uint64_t a1, uint64_t a2)
{
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ConfirmDetailsProvider.Details.dateOfBirthComponents.setter(uint64_t a1)
{
  return sub_1E0AD5C2C(a1, v1);
}

uint64_t (*ConfirmDetailsProvider.Details.dateOfBirthComponents.modify())()
{
  return nullsub_1;
}

void *ConfirmDetailsProvider.Details.weight.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 20));
  id v2 = v1;
  return v1;
}

void ConfirmDetailsProvider.Details.weight.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 20);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*ConfirmDetailsProvider.Details.weight.modify())()
{
  return nullsub_1;
}

void *ConfirmDetailsProvider.Details.height.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 24));
  id v2 = v1;
  return v1;
}

void ConfirmDetailsProvider.Details.height.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 24);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*ConfirmDetailsProvider.Details.height.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmDetailsProvider.DetailItems.rawValue.getter()
{
  return *(void *)v0;
}

HealthMobilityUI::ConfirmDetailsProvider::DetailItems __swiftcall ConfirmDetailsProvider.DetailItems.init(rawValue:)(HealthMobilityUI::ConfirmDetailsProvider::DetailItems rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ConfirmDetailsProvider.DetailItems.dateOfBirthComponents.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static ConfirmDetailsProvider.DetailItems.weight.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static ConfirmDetailsProvider.DetailItems.height.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void *sub_1E0AD5F3C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1E0AD5F48(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1E0AD5F50@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1E0AD5F64@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1E0AD5F78@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1E0AD5F8C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1E0AD5FBC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1E0AD5FE8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1E0AD600C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1E0AD6020(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1E0AD6034(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1E0AD6048@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1E0AD605C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1E0AD6070(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1E0AD6084(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1E0AD6098()
{
  return *v0 == 0;
}

uint64_t sub_1E0AD60A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1E0AD60C0(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_1E0AD60D8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1E0AD6130()
{
  return sub_1E0B06658();
}

uint64_t ConfirmDetailsProvider.__allocating_init(source:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  uint64_t v6 = sub_1E0AD8BC0(a1, a2, a3);
  swift_release();
  return v6;
}

uint64_t ConfirmDetailsProvider.init(source:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1E0AD8BC0(a1, a2, a3);
  swift_release();
  return v3;
}

uint64_t ConfirmDetailsProvider.aboveAgeThreshold.getter()
{
  return 0;
}

uint64_t sub_1E0AD624C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t v26 = a2;
  uint64_t v27 = v6;
  uint64_t v7 = sub_1E0B066A8();
  uint64_t v31 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E0B066D8();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v30 = v11;
  MEMORY[0x1F4188790](v11, v12);
  id v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x1F4188790](v15 - 8, v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  uint64_t v28 = v3[9];
  sub_1E0AD8F98(a1, (uint64_t)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (*(unsigned __int8 *)(v16 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v21 = (void *)swift_allocObject();
  v21[2] = v26;
  v21[3] = a3;
  v21[4] = v19;
  v21[5] = v3;
  sub_1E0AD9164((uint64_t)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v21 + v20);
  *(void *)((char *)v21 + ((v17 + v20 + 7) & 0xFFFFFFFFFFFFFFF8)) = v27;
  aBlock[4] = sub_1E0AD91C8;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0AD7664;
  aBlock[3] = &block_descriptor_1;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1E0B066C8();
  uint64_t v32 = MEMORY[0x1E4FBC860];
  sub_1E0AD9274((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
  uint64_t v23 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1E0ADA48C(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1E0AD92BC((unint64_t *)&qword_1EBF0EC40, (unint64_t *)&unk_1EBF0EC30, v23);
  sub_1E0B06A98();
  MEMORY[0x1E4E3BC80](0, v14, v10, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v30);
  swift_release();
  return swift_release();
}

uint64_t sub_1E0AD6644(uint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t))
{
  if (qword_1EAD61EA8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1E0B06448();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EAD623C0);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_1E0B06428();
  os_log_type_t v7 = sub_1E0B068C8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v15[0] = v9;
    *(_DWORD *)uint64_t v8 = 136446722;
    uint64_t v10 = sub_1E0B06C58();
    sub_1E0ACB6F4(v10, v11, v15);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    sub_1E0ACB6F4(0xD00000000000001FLL, 0x80000001E0B0AC60, v15);
    sub_1E0B06A68();
    *(_WORD *)(v8 + 22) = 2082;
    swift_bridgeObjectRetain();
    sub_1E0ACB6F4(a1, a2, v15);
    sub_1E0B06A68();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1E0AC7000, v6, v7, "[%{public}s.%{public}s]: Saving changes to characteristic %{public}s", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v9, -1, -1);
    MEMORY[0x1E4E3C540](v8, -1, -1);
  }
  else
  {

    uint64_t v12 = swift_bridgeObjectRelease_n();
  }
  return a3(v12);
}

void sub_1E0AD6B24(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v81 = a6;
  uint64_t v77 = a5;
  uint64_t v83 = a2;
  uint64_t v84 = a1;
  uint64_t v78 = sub_1E0B05E48();
  uint64_t v76 = *(void *)(v78 - 8);
  MEMORY[0x1F4188790](v78, v8);
  os_log_t v74 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ADA2F0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v10, v12);
  id v14 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  uint64_t v18 = MEMORY[0x1F4188790](v16 - 8, v17);
  uint64_t v75 = (uint64_t)&v73 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v20);
  uint64_t v22 = (char *)&v73 - v21;
  sub_1E0ADA48C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, v15);
  MEMORY[0x1F4188790](v23 - 8, v24);
  uint64_t v26 = (char *)&v73 - v25;
  uint64_t v27 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27, v29);
  uint64_t v31 = (char *)&v73 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = a3;
  uint64_t v80 = a4;
  uint64_t v82 = (void **)(a3 + 16);
  v88 = 0;
  swift_retain();
  sub_1E0B06618();
  swift_release();
  uint64_t v32 = v27;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1)
  {
    sub_1E0ADA280((uint64_t)v26, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
    if (qword_1EAD61EA8 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_1E0B06448();
    __swift_project_value_buffer(v33, (uint64_t)qword_1EAD623C0);
    uint64_t v34 = sub_1E0B06428();
    os_log_type_t v35 = sub_1E0B068B8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v87[0] = v37;
      *(_DWORD *)uint64_t v36 = 136446466;
      uint64_t v38 = sub_1E0B06C58();
      uint64_t v85 = sub_1E0ACB6F4(v38, v39, v87);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2082;
      uint64_t v85 = sub_1E0ACB6F4(0xD000000000000021, 0x80000001E0B0AC30, v87);
      sub_1E0B06A68();
      _os_log_impl(&dword_1E0AC7000, v34, v35, "[%{public}s.%{public}s]: Attempted to save new details before we received our first set of details.", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v37, -1, -1);
      MEMORY[0x1E4E3C540](v36, -1, -1);
    }

    goto LABEL_30;
  }
  sub_1E0AD9164((uint64_t)v26, (uint64_t)v31);
  uint64_t v40 = v77;
  sub_1E0AD5CCC(v77, (uint64_t)v22);
  uint64_t v41 = (uint64_t)&v14[*(int *)(v11 + 48)];
  sub_1E0AD5CCC((uint64_t)v31, (uint64_t)v14);
  sub_1E0AD5CCC((uint64_t)v22, v41);
  uint64_t v42 = v76;
  unint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 48);
  uint64_t v44 = v78;
  if (v43((uint64_t)v14, 1, v78) == 1)
  {
    sub_1E0ADA280((uint64_t)v22, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
    int v45 = v43(v41, 1, v44);
    id v46 = v80;
    uint64_t v47 = v32;
    if (v45 == 1)
    {
      uint64_t v48 = sub_1E0ADA280((uint64_t)v14, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
      goto LABEL_15;
    }
  }
  else
  {
    int v73 = v31;
    uint64_t v50 = v75;
    sub_1E0AD5CCC((uint64_t)v14, v75);
    if (v43(v41, 1, v44) != 1)
    {
      id v51 = v74;
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v74, v41, v44);
      sub_1E0AD9274(&qword_1EAD62428, MEMORY[0x1E4F26F90]);
      char v52 = sub_1E0B06778();
      int v53 = *(void (**)(char *, uint64_t))(v42 + 8);
      v53(v51, v44);
      uint64_t v54 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26F90];
      sub_1E0ADA280((uint64_t)v22, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
      v53((char *)v50, v44);
      uint64_t v48 = sub_1E0ADA280((uint64_t)v14, &qword_1EAD623D8, v54);
      id v46 = v80;
      uint64_t v47 = v32;
      uint64_t v31 = v73;
      if (v52) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    sub_1E0ADA280((uint64_t)v22, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v50, v44);
    id v46 = v80;
    uint64_t v47 = v32;
    uint64_t v31 = v73;
  }
  uint64_t v48 = sub_1E0ADA390((uint64_t)v14, (uint64_t (*)(void))sub_1E0ADA2F0);
LABEL_14:
  MEMORY[0x1F4188790](v48, v49);
  *(&v73 - 4) = v46;
  *(&v73 - 3) = (char *)v40;
  *(&v73 - 2) = (char *)&v88;
  uint64_t v48 = sub_1E0AD6644(0x20666F2065746144, 0xED00006874726942, (uint64_t (*)(uint64_t))sub_1E0ADA3F0);
LABEL_15:
  uint64_t v55 = *(int *)(v47 + 20);
  uint64_t v56 = *(void **)&v31[v55];
  uint64_t v57 = *(void **)(v40 + v55);
  if (!v56)
  {
    if (!v57) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!v57
    || (sub_1E0ADA450(0, (unint64_t *)&qword_1EAD623B8),
        id v58 = v57,
        id v59 = v56,
        char v60 = sub_1E0B06A38(),
        v59,
        v58,
        (v60 & 1) == 0))
  {
LABEL_20:
    MEMORY[0x1F4188790](v48, v49);
    *(&v73 - 4) = v46;
    *(&v73 - 3) = (char *)v40;
    *(&v73 - 2) = (char *)&v88;
    uint64_t v48 = sub_1E0AD6644(0x746867696557, 0xE600000000000000, (uint64_t (*)(uint64_t))sub_1E0ADA410);
  }
LABEL_21:
  uint64_t v61 = *(int *)(v47 + 24);
  uint64_t v62 = *(void **)&v31[v61];
  uint64_t v63 = *(void **)(v40 + v61);
  if (v62)
  {
    if (v63)
    {
      sub_1E0ADA450(0, (unint64_t *)&qword_1EAD623B8);
      id v64 = v63;
      id v65 = v62;
      char v66 = sub_1E0B06A38();

      if (v66) {
        goto LABEL_27;
      }
    }
    goto LABEL_26;
  }
  if (v63)
  {
LABEL_26:
    MEMORY[0x1F4188790](v48, v49);
    *(&v73 - 4) = v46;
    *(&v73 - 3) = (char *)v40;
    *(&v73 - 2) = (char *)&v88;
    sub_1E0AD6644(0x746867696548, 0xE600000000000000, (uint64_t (*)(uint64_t))sub_1E0ADA430);
  }
LABEL_27:
  if (v88) {
    sub_1E0AD76A8();
  }
  sub_1E0ADA390((uint64_t)v31, (uint64_t (*)(void))type metadata accessor for ConfirmDetailsProvider.Details);
LABEL_30:
  uint64_t v67 = v82;
  swift_beginAccess();
  v68 = *v67;
  BOOL v69 = *v67 == 0;
  char v70 = *v67 != 0;
  if (v69) {
    v71 = v88;
  }
  else {
    v71 = v68;
  }
  uint64_t v85 = (uint64_t)v71;
  char v86 = v70;
  id v72 = v68;
  v84(&v85);
  sub_1E0ADA384(v71, v70);
}

uint64_t sub_1E0AD74A8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v6);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a2, v6, v7);
  if (!v3 && (*a3 & 2) == 0) {
    *a3 |= 2uLL;
  }
  return result;
}

uint64_t sub_1E0AD7534(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v6);
  uint64_t v8 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(v7 + 40))(*(void *)(a2 + *(int *)(v8 + 20)), v6, v7);
  if (!v3 && (*a3 & 4) == 0) {
    *a3 |= 4uLL;
  }
  return result;
}

uint64_t sub_1E0AD75CC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v6);
  uint64_t v8 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(v7 + 48))(*(void *)(a2 + *(int *)(v8 + 24)), v6, v7);
  if (!v3 && (*a3 & 8) == 0) {
    *a3 |= 8uLL;
  }
  return result;
}

uint64_t sub_1E0AD7664(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1E0AD76A8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_1E0B066A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1E0B066D8();
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16, v8);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = v0[9];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v0;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_1E0ADA224;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0AD7664;
  aBlock[3] = &block_descriptor_19;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  sub_1E0B066C8();
  uint64_t v17 = MEMORY[0x1E4FBC860];
  sub_1E0AD9274((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
  uint64_t v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1E0ADA48C(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1E0AD92BC((unint64_t *)&qword_1EBF0EC40, (unint64_t *)&unk_1EBF0EC30, v13);
  sub_1E0B06A98();
  MEMORY[0x1E4E3BC80](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v16);
  return swift_release();
}

uint64_t sub_1E0AD79AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1E0AD7CD8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  a3(&v4);
  return v4;
}

uint64_t sub_1E0AD7FCC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v34 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0ADA48C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v33 = (uint64_t)&v31 - v9;
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], v6);
  uint64_t v12 = MEMORY[0x1F4188790](v10 - 8, v11);
  id v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12, v15);
  uint64_t v17 = (char *)&v31 - v16;
  sub_1E0AD79AC(0x20666F2065746164, 0xED00006874726962, (uint64_t (*)(void))sub_1E0ADA22C);
  uint64_t v18 = (void *)sub_1E0AD7CD8(0x746867696568, 0xE600000000000000, (void (*)(uint64_t *__return_ptr))sub_1E0ADA248);
  uint64_t v19 = (void *)sub_1E0AD7CD8(0x746867696577, 0xE600000000000000, (void (*)(uint64_t *__return_ptr))sub_1E0ADA264);
  if (*(unsigned char *)(a1 + 96) == 1)
  {
    uint64_t v20 = sub_1E0B05E48();
    BOOL v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v17, 1, v20) != 1;
    if (v18) {
      uint64_t v22 = (2 * v21) | 8;
    }
    else {
      uint64_t v22 = 2 * v21;
    }
    if (v19) {
      v22 |= 4uLL;
    }
    *(void *)(a1 + 88) = v22;
    *(unsigned char *)(a1 + 96) = 0;
  }
  sub_1E0AD5CCC((uint64_t)v17, (uint64_t)v14);
  uint64_t v23 = sub_1E0B05E48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 1, 1, v23);
  uint64_t v24 = *(int *)(v2 + 20);
  *(void *)&v5[v24] = 0;
  uint64_t v32 = v17;
  uint64_t v25 = (uint64_t)v14;
  uint64_t v26 = *(int *)(v2 + 24);
  *(void *)&v5[v26] = 0;
  id v27 = v18;
  swift_retain();
  id v28 = v19;
  sub_1E0AD5C2C(v25, (uint64_t)v5);

  *(void *)&v5[v24] = v19;
  *(void *)&v5[v26] = v18;
  uint64_t v29 = v33;
  sub_1E0AD9164((uint64_t)v5, v33);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v29, 0, 1, v2);
  sub_1E0B06608();

  swift_release();
  sub_1E0ADA280(v29, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  return sub_1E0ADA280((uint64_t)v32, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
}

uint64_t sub_1E0AD83F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v4);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  if (!v2)
  {
    uint64_t v7 = sub_1E0B05E48();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a2, 0, 1, v7);
  }
  return result;
}

uint64_t sub_1E0AD84AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v4);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1E0AD8520@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v4);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t ConfirmDetailsProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();

  swift_release();
  return v0;
}

uint64_t ConfirmDetailsProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();

  swift_release();
  return MEMORY[0x1F4186488](v0, 98, 7);
}

uint64_t _s16HealthMobilityUI22ConfirmDetailsProviderC0E0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0B05E48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ADA2F0();
  uint64_t v10 = v9 - 8;
  MEMORY[0x1F4188790](v9, v11);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  uint64_t v16 = MEMORY[0x1F4188790](v14 - 8, v15);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v16, v19);
  uint64_t v22 = (char *)&v49 - v21;
  MEMORY[0x1F4188790](v20, v23);
  uint64_t v25 = (char *)&v49 - v24;
  uint64_t v49 = a1;
  sub_1E0AD5CCC(a1, (uint64_t)&v49 - v24);
  uint64_t v50 = a2;
  sub_1E0AD5CCC(a2, (uint64_t)v22);
  uint64_t v26 = (uint64_t)&v13[*(int *)(v10 + 56)];
  sub_1E0AD5CCC((uint64_t)v25, (uint64_t)v13);
  sub_1E0AD5CCC((uint64_t)v22, v26);
  id v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v27((uint64_t)v13, 1, v4) != 1)
  {
    sub_1E0AD5CCC((uint64_t)v13, (uint64_t)v18);
    if (v27(v26, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v8, v26, v4);
      sub_1E0AD9274(&qword_1EAD62428, MEMORY[0x1E4F26F90]);
      char v30 = sub_1E0B06778();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v5 + 8);
      v31(v8, v4);
      uint64_t v32 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26F90];
      sub_1E0ADA280((uint64_t)v22, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
      sub_1E0ADA280((uint64_t)v25, &qword_1EAD623D8, v32);
      v31(v18, v4);
      sub_1E0ADA280((uint64_t)v13, &qword_1EAD623D8, v32);
      if ((v30 & 1) == 0) {
        return 0;
      }
      goto LABEL_8;
    }
    uint64_t v29 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26F90];
    sub_1E0ADA280((uint64_t)v22, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
    sub_1E0ADA280((uint64_t)v25, &qword_1EAD623D8, v29);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v18, v4);
LABEL_6:
    sub_1E0ADA390((uint64_t)v13, (uint64_t (*)(void))sub_1E0ADA2F0);
    return 0;
  }
  id v28 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26F90];
  sub_1E0ADA280((uint64_t)v22, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  sub_1E0ADA280((uint64_t)v25, &qword_1EAD623D8, v28);
  if (v27(v26, 1, v4) != 1) {
    goto LABEL_6;
  }
  sub_1E0ADA280((uint64_t)v13, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
LABEL_8:
  uint64_t v33 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v34 = *(int *)(v33 + 20);
  uint64_t v36 = v49;
  uint64_t v35 = v50;
  uint64_t v37 = *(void **)(v49 + v34);
  uint64_t v38 = *(void **)(v50 + v34);
  if (v37)
  {
    if (!v38) {
      return 0;
    }
    sub_1E0ADA450(0, (unint64_t *)&qword_1EAD623B8);
    id v39 = v38;
    id v40 = v37;
    char v41 = sub_1E0B06A38();

    if ((v41 & 1) == 0) {
      return 0;
    }
  }
  else if (v38)
  {
    return 0;
  }
  uint64_t v42 = *(int *)(v33 + 24);
  unint64_t v43 = *(void **)(v36 + v42);
  uint64_t v44 = *(void **)(v35 + v42);
  if (v43)
  {
    if (v44)
    {
      sub_1E0ADA450(0, (unint64_t *)&qword_1EAD623B8);
      id v45 = v44;
      id v46 = v43;
      char v47 = sub_1E0B06A38();

      if (v47) {
        return 1;
      }
    }
  }
  else if (!v44)
  {
    return 1;
  }
  return 0;
}

void sub_1E0AD8B28()
{
  if (!qword_1EAD623E0)
  {
    sub_1E0ADA48C(255, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
    unint64_t v0 = sub_1E0B06628();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD623E0);
    }
  }
}

uint64_t sub_1E0AD8BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v23 = a1;
  sub_1E0ADA48C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v22 = (char *)v20 - v6;
  uint64_t v21 = sub_1E0B06998();
  uint64_t v7 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21, v8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E0B06968();
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v13 = sub_1E0B066D8();
  MEMORY[0x1F4188790](v13 - 8, v14);
  v20[1] = sub_1E0ADA450(0, qword_1EBF0EA60);
  sub_1E0B066C8();
  uint64_t v26 = MEMORY[0x1E4FBC860];
  sub_1E0AD9274(&qword_1EBF0EC58, MEMORY[0x1E4FBCC10]);
  uint64_t v15 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCC10];
  sub_1E0ADA48C(0, &qword_1EBF0EC48, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
  sub_1E0AD92BC(&qword_1EBF0EC50, &qword_1EBF0EC48, v15);
  sub_1E0B06A98();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E4FBCC58], v21);
  *(void *)(v3 + 72) = sub_1E0B069C8();
  uint64_t v16 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v22, 1, 1, v16);
  sub_1E0AD8B28();
  swift_allocObject();
  *(void *)(v3 + 80) = sub_1E0B06638();
  *(void *)(v3 + 88) = 0;
  *(_WORD *)(v3 + 96) = 1;
  uint64_t v17 = v23;
  sub_1E0ACC180(v23, v3 + 16);
  uint64_t v18 = v25;
  *(void *)(v3 + 56) = v24;
  *(void *)(v3 + 64) = v18;
  swift_retain();
  sub_1E0AD76A8();
  __swift_destroy_boxed_opaque_existential_1Tm(v17);
  return v3;
}

uint64_t sub_1E0AD8F60()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E0AD8F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0AD8FFC()
{
  uint64_t v1 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_1E0B05E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
  }

  return MEMORY[0x1F4186498](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_1E0AD9164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1E0AD91C8()
{
  uint64_t v1 = *(void *)(type metadata accessor for ConfirmDetailsProvider.Details() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (void (*)(uint64_t *))v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = (char *)v0[5];
  uint64_t v7 = *(void *)((char *)v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_1E0AD6B24(v3, v4, v5, v6, (uint64_t)v0 + v2, v7);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1E0AD9274(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E0AD92BC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1E0ADA48C(255, a2, a3, MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1E0AD9324()
{
  unint64_t result = qword_1EAD623F0;
  if (!qword_1EAD623F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD623F0);
  }
  return result;
}

unint64_t sub_1E0AD937C()
{
  unint64_t result = qword_1EAD623F8;
  if (!qword_1EAD623F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD623F8);
  }
  return result;
}

unint64_t sub_1E0AD93D4()
{
  unint64_t result = qword_1EAD62400;
  if (!qword_1EAD62400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62400);
  }
  return result;
}

unint64_t sub_1E0AD942C()
{
  unint64_t result = qword_1EAD62408;
  if (!qword_1EAD62408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62408);
  }
  return result;
}

uint64_t dispatch thunk of ConfirmDetailsSource.dateOfBirthComponents()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._heightCharacteristicQuantity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._bodyMassCharacteristicQuantity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._setDate(ofBirthComponents:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._setBodyMassCharacteristicQuantity(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._setHeightCharacteristicQuantity(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t type metadata accessor for ConfirmDetailsProvider()
{
  return self;
}

uint64_t method lookup function for ConfirmDetailsProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfirmDetailsProvider);
}

uint64_t dispatch thunk of ConfirmDetailsProvider.detailsPublisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsProvider.__allocating_init(source:dateGenerator:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ConfirmDetailsProvider.saveUpdatedDetails(_:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmDetailsProvider.Details(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1E0B05E48();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v13;
    uint64_t v14 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = (uint64_t)v14;
    id v15 = v13;
    id v16 = v14;
  }
  return a1;
}

void destroy for ConfirmDetailsProvider.Details(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0B05E48();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }

  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 24));
}

char *initializeWithCopy for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1E0B05E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void **)&a2[v9];
  *(void *)&a1[v9] = v11;
  uint64_t v12 = *(void **)&a2[v10];
  *(void *)&a1[v10] = v12;
  id v13 = v11;
  id v14 = v12;
  return a1;
}

char *assignWithCopy for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1E0B05E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  id v13 = *(void **)&a1[v12];
  id v14 = *(void **)&a2[v12];
  *(void *)&a1[v12] = v14;
  id v15 = v14;

  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = *(void **)&a1[v16];
  uint64_t v18 = *(void **)&a2[v16];
  *(void *)&a1[v16] = v18;
  id v19 = v18;

  return a1;
}

char *initializeWithTake for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1E0B05E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  return a1;
}

char *assignWithTake for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1E0B05E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  id v13 = *(void **)&a1[v12];
  *(void *)&a1[v12] = *(void *)&a2[v12];

  uint64_t v14 = *(int *)(a3 + 24);
  id v15 = *(void **)&a1[v14];
  *(void *)&a1[v14] = *(void *)&a2[v14];

  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsProvider.Details(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0AD9F18);
}

uint64_t sub_1E0AD9F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
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

uint64_t storeEnumTagSinglePayload for ConfirmDetailsProvider.Details(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0ADA028);
}

void sub_1E0ADA028(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1E0ADA48C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
}

void sub_1E0ADA114()
{
  sub_1E0ADA48C(319, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for ConfirmDetailsProvider.DetailItems()
{
  return &type metadata for ConfirmDetailsProvider.DetailItems;
}

uint64_t sub_1E0ADA1EC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E0ADA224()
{
  return sub_1E0AD7FCC(*(void *)(v0 + 16));
}

uint64_t sub_1E0ADA22C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AD83F0(v1, a1);
}

uint64_t sub_1E0ADA248@<X0>(uint64_t *a1@<X8>)
{
  return sub_1E0AD84AC(v1, a1);
}

uint64_t sub_1E0ADA264@<X0>(uint64_t *a1@<X8>)
{
  return sub_1E0AD8520(v1, a1);
}

uint64_t sub_1E0ADA280(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E0ADA48C(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1E0ADA2F0()
{
  if (!qword_1EAD62420)
  {
    sub_1E0ADA48C(255, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EAD62420);
    }
  }
}

void sub_1E0ADA384(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_1E0ADA390(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E0ADA3F0()
{
  return sub_1E0AD74A8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1E0ADA410()
{
  return sub_1E0AD7534(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1E0ADA430()
{
  return sub_1E0AD75CC(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1E0ADA450(uint64_t a1, unint64_t *a2)
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

void sub_1E0ADA48C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.onboardingStatus.getter()
{
  return *v0;
}

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.notificationStatus.getter()
{
  return *(id *)(v0 + 8);
}

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isFitnessTrackingEnabled.getter()
{
  return objc_msgSend(*(id *)(v0 + 8), sel_fitnessTrackingEnabled);
}

BOOL HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isOnboarded.getter()
{
  return objc_msgSend(*v0, sel_state) == (id)1;
}

BOOL HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isNotificationAvailable.getter()
{
  return objc_msgSend(*(id *)(v0 + 8), sel_state) != 0;
}

BOOL HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isDeviceSupported.getter()
{
  return ((unint64_t)objc_msgSend(*(id *)(v0 + 8), sel_notificationUnavailableReasons) & 4) == 0;
}

id HKMobilityWalkingSteadinessFeatureStatusManager.makeFeatureStatusPublisher(queue:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = self;
  id v6 = v2;
  id v7 = a1;
  id result = objc_msgSend(v5, sel_defaultCenter);
  *a2 = v6;
  a2[1] = result;
  a2[2] = v7;
  return result;
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher.init(featureStatusManager:notificationCenter:queue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher.featureStatusManager.getter()
{
  return *v0;
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher.receive<A>(subscriber:)(uint64_t a1)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void **)(v1 + 8);
  uint64_t v5 = *(void **)(v1 + 16);
  uint64_t v6 = _s22FeatureStatusPublisherV5InnerCMa();
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = sub_1E0ADD8EC(a1, v7, v8, v9);

  uint64_t v12[3] = v6;
  v12[4] = swift_getWitnessTable();
  v12[0] = v10;
  sub_1E0B065C8();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
}

uint64_t sub_1E0ADA714@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0ACC180((uint64_t)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x60), a1);
}

uint64_t sub_1E0ADA744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x68);
  swift_beginAccess();
  uint64_t v4 = sub_1E0B06408();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1E0ADA818(uint64_t a1)
{
  uint64_t v3 = (char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x68);
  swift_beginAccess();
  uint64_t v4 = sub_1E0B06408();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1E0ADA8F4())()
{
  return j__swift_endAccess;
}

uint64_t sub_1E0ADA970(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x88)) = a1;
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1E0ADA9A0(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x90)) = a1;
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1E0ADA9D0(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x98)) = a1;
  return swift_release();
}

uint64_t sub_1E0ADAA04()
{
  uint64_t v1 = (void *)(*MEMORY[0x1E4FBC8C8] & *v0);
  uint64_t v2 = sub_1E0B066A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E0B066D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  int v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(void *)((char *)v0 + v1[16]);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v13 = (void *)swift_allocObject();
  v13[2] = v1[10];
  v13[3] = v1[11];
  v13[4] = v12;
  aBlock[4] = sub_1E0ADDFF8;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0AD7664;
  aBlock[3] = &block_descriptor_24;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  sub_1E0B066C8();
  v16[1] = MEMORY[0x1E4FBC860];
  sub_1E0ADE1E4((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
  sub_1E0ADDEF4(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1E0AD3260();
  sub_1E0B06A98();
  MEMORY[0x1E4E3BC80](0, v11, v6, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  swift_release();
  return swift_release();
}

void sub_1E0ADAD4C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1E4E3C5D0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_1E0ADADA0();
  }
}

uint64_t sub_1E0ADADA0()
{
  uint64_t v1 = v0;
  v58[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v3 = (void *)(*MEMORY[0x1E4FBC8C8] & *v0);
  uint64_t v4 = v3[10];
  uint64_t v56 = v3[11];
  sub_1E0B063E8();
  swift_getWitnessTable();
  uint64_t v5 = sub_1E0B06C48();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v48 - v8;
  uint64_t v10 = (void *)((char *)v1 + v3[12]);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1E0B06338();
  int v11 = *(void **)((char *)v1 + *(void *)((*v2 & *v1) + 0x70));
  v58[0] = 0;
  id v12 = objc_msgSend(v11, sel_onboardingStatusWithError_, v58);
  id v13 = v58[0];
  if (v12)
  {
    uint64_t v55 = v4;
    uint64_t v14 = *(void *)((*v2 & *v1) + 0x88);
    id v15 = *(void **)((char *)v1 + v14);
    *(void *)((char *)v1 + v14) = v12;
    id v16 = v12;
    id v17 = v13;

    v58[0] = 0;
    id v18 = objc_msgSend(v11, sel_notificationStatusWithError_, v58);
    id v19 = v58[0];
    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v21 = *(void *)((*v2 & *v1) + 0x90);
      uint64_t v22 = *(void **)((char *)v1 + v21);
      *(void *)((char *)v1 + v21) = v18;
      id v23 = v19;
      id v24 = v20;

      __swift_project_boxed_opaque_existential_1(v10, v10[3]);
      id v25 = v16;
      id v26 = v24;
      sub_1E0B06348();
      v58[0] = v25;
      v58[1] = v26;
      _s22FeatureStatusPublisherV5InnerCMa();
      swift_getWitnessTable();
      sub_1E0B063A8();

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      return sub_1E0ADB428();
    }
    uint64_t v54 = v5;
    id v29 = v58[0];
    id v28 = (void *)sub_1E0B05EE8();

    swift_willThrow();
  }
  else
  {
    uint64_t v54 = v5;
    id v27 = v58[0];
    id v28 = (void *)sub_1E0B05EE8();

    swift_willThrow();
  }
  uint64_t v55 = v6;
  if (qword_1EBF0EC70 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1E0B06448();
  __swift_project_value_buffer(v30, (uint64_t)qword_1EBF0EC78);
  uint64_t v31 = v1;
  id v32 = v28;
  uint64_t v33 = v31;
  id v34 = v28;
  uint64_t v35 = sub_1E0B06428();
  os_log_type_t v36 = sub_1E0B068A8();
  int v37 = v36;
  BOOL v38 = os_log_type_enabled(v35, v36);
  id v53 = v33;
  if (v38)
  {
    uint64_t v39 = swift_slowAlloc();
    int v50 = v37;
    uint64_t v40 = v39;
    char v41 = (void *)swift_slowAlloc();
    id v51 = (void *)swift_slowAlloc();
    v58[0] = v51;
    *(_DWORD *)uint64_t v40 = 138543618;
    os_log_t v49 = v35;
    uint64_t v57 = (uint64_t)v33;
    char v52 = v9;
    uint64_t v42 = v33;
    sub_1E0B06A68();
    *char v41 = v1;

    *(_WORD *)(v40 + 12) = 2082;
    swift_getErrorValue();
    uint64_t v43 = sub_1E0B06BE8();
    uint64_t v57 = sub_1E0ACB6F4(v43, v44, (uint64_t *)v58);
    uint64_t v9 = v52;
    sub_1E0B06A68();
    swift_bridgeObjectRelease();

    uint64_t v35 = v49;
    _os_log_impl(&dword_1E0AC7000, v49, (os_log_type_t)v50, "[%{public}@] Failed to create feature status: %{public}s", (uint8_t *)v40, 0x16u);
    sub_1E0ADDEF4(0, (unint64_t *)&qword_1EBF0ECA0, (uint64_t (*)(uint64_t))sub_1E0ADDE18, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v41, -1, -1);
    id v45 = v51;
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v45, -1, -1);
    MEMORY[0x1E4E3C540](v40, -1, -1);
  }
  else
  {
  }
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1E0B06348();
  v58[0] = v28;
  id v46 = v28;
  _s22FeatureStatusPublisherV5InnerCMa();
  swift_getWitnessTable();
  sub_1E0B063B8();

  (*(void (**)(char *, uint64_t))(v55 + 8))(v9, v54);
  return sub_1E0ADB428();
}

uint64_t sub_1E0ADB428()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v3 = (void *)(*MEMORY[0x1E4FBC8C8] & *v0);
  uint64_t v4 = v3[10];
  uint64_t v5 = v3[11];
  uint64_t v6 = sub_1E0B06408();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)aBlock - v9;
  __swift_project_boxed_opaque_existential_1((void *)((char *)v1 + v3[12]), *(void *)((char *)v1 + v3[12] + 24));
  sub_1E0B06338();
  sub_1E0ADA744((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t))(v7 + 88))(v10, v6) == *MEMORY[0x1E4F66860])
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v10, v6);
    (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v10, v4);
    objc_msgSend(*(id *)((char *)v1 + *(void *)((*v2 & *v1) + 0x70)), sel_addObserver_queue_, v1, *(void *)((char *)v1 + *(void *)((*v2 & *v1) + 0x80)));
    int v11 = *(void **)((char *)v1 + *(void *)((*v2 & *v1) + 0x78));
    id v12 = (void *)sub_1E0B069E8();
    uint64_t v13 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v14 = (void *)swift_allocObject();
    id v14[2] = v4;
    v14[3] = v5;
    v14[4] = v13;
    aBlock[4] = sub_1E0ADDF58;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E0ADBAE4;
    aBlock[3] = &block_descriptor_11;
    id v15 = _Block_copy(aBlock);
    swift_release();
    id v16 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v12, 0, 0, v15);
    _Block_release(v15);
    swift_unknownObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return sub_1E0ADB764(v1);
}

uint64_t sub_1E0ADB764(void *a1)
{
  uint64_t v1 = (void *)((char *)a1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *a1) + 0x60));
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  return sub_1E0B06348();
}

void *sub_1E0ADB7CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1E0B066A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E0B066D8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  id v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  id result = (void *)MEMORY[0x1E4E3C5D0](a2 + 16);
  if (result)
  {
    uint64_t v14 = result;
    v18[1] = *(void *)((char *)result + *(void *)((*MEMORY[0x1E4FBC8C8] & *result) + 0x80));
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    aBlock[4] = sub_1E0ADDF9C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E0AD7664;
    aBlock[3] = &block_descriptor_17;
    id v16 = _Block_copy(aBlock);
    id v17 = v14;
    sub_1E0B066C8();
    v18[2] = MEMORY[0x1E4FBC860];
    sub_1E0ADE1E4((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
    sub_1E0ADDEF4(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1E0AD3260();
    sub_1E0B06A98();
    MEMORY[0x1E4E3BC80](0, v12, v7, v16);
    _Block_release(v16);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1E0ADBAE4(uint64_t a1)
{
  uint64_t v2 = sub_1E0B05E18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void (**)(char *))(a1 + 32);
  sub_1E0B05E08();
  swift_retain();
  v7(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

id sub_1E0ADBBD8()
{
  return objc_msgSend(*(id *)((char *)v0 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70)), sel_removeObserver_, v0);
}

void sub_1E0ADBC10(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  sub_1E0ADE004(v7);
}

void sub_1E0ADBC88(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  sub_1E0ADE0DC(v7);
}

uint64_t sub_1E0ADBD00()
{
  uint64_t v1 = v0;
  uint64_t v2 = *MEMORY[0x1E4FBC8C8] & *v0;
  uint64_t v38 = sub_1E0B06698();
  uint64_t v3 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38, v4);
  char v41 = (uint64_t *)((char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v42 = sub_1E0B066F8();
  uint64_t v6 = *(void *)(v42 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v42, v7);
  uint64_t v39 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v40 = (char *)&v33 - v11;
  uint64_t v36 = sub_1E0B066A8();
  MEMORY[0x1F4188790](v36, v12);
  int v37 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBF0EC70 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1E0B06448();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EBF0EC78);
  uint64_t v15 = v0;
  id v16 = sub_1E0B06428();
  os_log_type_t v17 = sub_1E0B068C8();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v43 = v1;
  if (v18)
  {
    uint64_t v35 = v2;
    id v19 = (uint8_t *)swift_slowAlloc();
    id v34 = (void *)swift_slowAlloc();
    *(_DWORD *)id v19 = 138543362;
    aBlock[0] = v15;
    uint64_t v20 = v15;
    uint64_t v21 = v43;
    sub_1E0B06A68();
    uint64_t v22 = v34;
    *id v34 = v21;

    uint64_t v2 = v35;
    _os_log_impl(&dword_1E0AC7000, v16, v17, "[%{public}@] Enqueuing send feature status", v19, 0xCu);
    sub_1E0ADDEF4(0, (unint64_t *)&qword_1EBF0ECA0, (uint64_t (*)(uint64_t))sub_1E0ADDE18, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v22, -1, -1);
    MEMORY[0x1E4E3C540](v19, -1, -1);
  }
  else
  {
  }
  if (*(void *)((char *)v15 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v15) + 0x98)))
  {
    swift_retain();
    sub_1E0B06718();
    swift_release();
  }
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v24 = (void *)swift_allocObject();
  v24[2] = *(void *)(v2 + 80);
  v24[3] = *(void *)(v2 + 88);
  v24[4] = v23;
  aBlock[4] = sub_1E0ADDED0;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0AD7664;
  aBlock[3] = &block_descriptor_2;
  _Block_copy(aBlock);
  uint64_t v44 = MEMORY[0x1E4FBC860];
  sub_1E0ADE1E4((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
  sub_1E0ADDEF4(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1E0AD3260();
  swift_retain();
  sub_1E0B06A98();
  sub_1E0B06728();
  swift_allocObject();
  uint64_t v25 = sub_1E0B06708();
  swift_release();
  swift_release();
  *(void *)((char *)v15 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v15) + 0x98)) = v25;
  swift_retain();
  swift_release();
  id v26 = v39;
  sub_1E0B066E8();
  id v27 = v41;
  *char v41 = 100;
  uint64_t v28 = v38;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v27, *MEMORY[0x1E4FBCAC8], v38);
  id v29 = v40;
  MEMORY[0x1E4E3BA00](v26, v27);
  (*(void (**)(void *, uint64_t))(v3 + 8))(v27, v28);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v31 = v42;
  v30(v26, v42);
  sub_1E0B06978();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v30)(v29, v31);
}

void sub_1E0ADC37C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1E4E3C5D0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_1E0ADC3D0();
  }
}

void sub_1E0ADC3D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)(*MEMORY[0x1E4FBC8C8] & *v0);
  uint64_t v3 = v2[10];
  uint64_t v4 = v2[11];
  sub_1E0B063E8();
  swift_getWitnessTable();
  uint64_t v5 = sub_1E0B06C48();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = (void *)((char *)v0 + v2[12]);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1E0B06338();
  sub_1E0ADC7C4(&v32);
  uint64_t v11 = v32;
  if (v32)
  {
    uint64_t v31 = v9;
    id v29 = v33;
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_1E0B06348();
    if (qword_1EBF0EC70 != -1) {
      swift_once();
    }
    uint64_t v30 = v11;
    uint64_t v12 = sub_1E0B06448();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EBF0EC78);
    uint64_t v13 = v0;
    uint64_t v14 = sub_1E0B06428();
    os_log_type_t v15 = sub_1E0B068C8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v27 = v4;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v28 = v3;
      os_log_type_t v17 = (uint8_t *)v16;
      BOOL v18 = (void *)swift_slowAlloc();
      uint64_t v25 = v17;
      uint64_t v26 = v6;
      *(_DWORD *)os_log_type_t v17 = 138543362;
      id v32 = v13;
      id v19 = v13;
      uint64_t v6 = v26;
      sub_1E0B06A68();
      void *v18 = v1;

      uint64_t v20 = v25;
      _os_log_impl(&dword_1E0AC7000, v14, v15, "[%{public}@] Sending feature status", v25, 0xCu);
      sub_1E0ADDEF4(0, (unint64_t *)&qword_1EBF0ECA0, (uint64_t (*)(uint64_t))sub_1E0ADDE18, MEMORY[0x1E4FBB718]);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v18, -1, -1);
      MEMORY[0x1E4E3C540](v20, -1, -1);
    }
    else
    {
    }
    uint64_t v22 = v30;
    uint64_t v21 = v31;
    uint64_t v23 = v29;
    id v32 = v30;
    uint64_t v33 = v29;
    _s22FeatureStatusPublisherV5InnerCMa();
    swift_getWitnessTable();
    sub_1E0B063A8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v21, v5);
    sub_1E0ADDE58(v22, v23);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_1E0B06348();
  }
}

void sub_1E0ADC7C4(void *a1@<X8>)
{
  uint64_t v2 = *(void **)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x88));
  if (v2 && (uint64_t v3 = *(void **)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x90))) != 0)
  {
    *a1 = v2;
    a1[1] = v3;
    id v6 = v3;
    id v4 = v2;
    id v5 = v6;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

void sub_1E0ADC874()
{
  uint64_t v1 = v0;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v3 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58);
  sub_1E0B063E8();
  swift_getWitnessTable();
  uint64_t v4 = sub_1E0B06C48();
  os_log_t v45 = *(os_log_t *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v5);
  uint64_t v44 = (char *)&v40 - v6;
  if (qword_1EBF0ECA8 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_1E0B06448();
  __swift_project_value_buffer(v43, (uint64_t)qword_1EBF0ECB0);
  uint64_t v7 = v0;
  uint64_t v8 = sub_1E0B06428();
  os_log_type_t v9 = sub_1E0B068C8();
  id v46 = v8;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v40 = (void *)swift_slowAlloc();
    char v41 = swift_slowAlloc();
    uint64_t v48 = v41;
    *(_DWORD *)uint64_t v10 = 138543618;
    uint64_t v47 = (uint64_t)v7;
    uint64_t v42 = v3;
    uint64_t v11 = v4;
    uint64_t v12 = v7;
    sub_1E0B06A68();
    uint64_t v13 = v40;
    *uint64_t v40 = v1;

    uint64_t v4 = v11;
    *(_WORD *)(v10 + 12) = 2082;
    uint64_t v47 = sub_1E0ACB6F4(0xD000000000000028, 0x80000001E0B0ADA0, (uint64_t *)&v48);
    uint64_t v2 = (void *)MEMORY[0x1E4FBC8C8];
    sub_1E0B06A68();
    uint64_t v14 = v46;
    _os_log_impl(&dword_1E0AC7000, v46, v9, "[%{public}@.%{public}s] Notified that notification settings changed, updating downstream.", (uint8_t *)v10, 0x16u);
    sub_1E0ADDEF4(0, (unint64_t *)&qword_1EBF0ECA0, (uint64_t (*)(uint64_t))sub_1E0ADDE18, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v13, -1, -1);
    os_log_type_t v15 = v41;
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v15, -1, -1);
    MEMORY[0x1E4E3C540](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v16 = (void *)((char *)v7 + *(void *)((*v2 & *v7) + 0x60));
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  sub_1E0B06338();
  os_log_type_t v17 = *(void **)((char *)v7 + *(void *)((*v2 & *v7) + 0x70));
  uint64_t v48 = 0;
  id v18 = objc_msgSend(v17, sel_notificationStatusWithError_, &v48);
  id v19 = v48;
  if (v18)
  {
    uint64_t v20 = *(void *)((*v2 & *v7) + 0x90);
    uint64_t v21 = *(void **)((char *)v7 + v20);
    *(void *)((char *)v7 + v20) = v18;
    uint64_t v22 = v19;

    sub_1E0ADC7C4(&v48);
    uint64_t v23 = v48;
    if (v48)
    {
      uint64_t v24 = v49;
      __swift_project_boxed_opaque_existential_1(v16, v16[3]);
      sub_1E0B06348();
      uint64_t v48 = v23;
      os_log_t v49 = v24;
      _s22FeatureStatusPublisherV5InnerCMa();
      swift_getWitnessTable();
      uint64_t v25 = v44;
      sub_1E0B063A8();
      ((void (*)(char *, uint64_t))v45[1].isa)(v25, v4);
      sub_1E0ADDE58(v23, v24);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(v16, v16[3]);
      sub_1E0B06348();
    }
  }
  else
  {
    uint64_t v26 = v48;
    uint64_t v27 = (void *)sub_1E0B05EE8();

    swift_willThrow();
    if (qword_1EBF0EC70 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v43, (uint64_t)qword_1EBF0EC78);
    uint64_t v28 = v7;
    id v29 = v27;
    uint64_t v30 = v28;
    id v31 = v27;
    id v32 = sub_1E0B06428();
    os_log_type_t v33 = sub_1E0B068A8();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      id v46 = swift_slowAlloc();
      uint64_t v48 = v46;
      *(_DWORD *)uint64_t v34 = 138543618;
      os_log_t v45 = v32;
      uint64_t v47 = (uint64_t)v30;
      uint64_t v36 = v30;
      sub_1E0B06A68();
      *uint64_t v35 = v1;

      *(_WORD *)(v34 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v37 = sub_1E0B06BE8();
      uint64_t v47 = sub_1E0ACB6F4(v37, v38, (uint64_t *)&v48);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();

      id v32 = v45;
      _os_log_impl(&dword_1E0AC7000, v45, v33, "[%{public}@] Failed to create feature status: %{public}s", (uint8_t *)v34, 0x16u);
      sub_1E0ADDEF4(0, (unint64_t *)&qword_1EBF0ECA0, (uint64_t (*)(uint64_t))sub_1E0ADDE18, MEMORY[0x1E4FBB718]);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v35, -1, -1);
      uint64_t v39 = v46;
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v39, -1, -1);
      MEMORY[0x1E4E3C540](v34, -1, -1);
    }
    else
    {
    }
    __swift_project_boxed_opaque_existential_1(v16, v16[3]);
    sub_1E0B06348();
  }
}

id sub_1E0ADD028(void *a1)
{
  id v1 = a1;
  sub_1E0ADD090();

  uint64_t v2 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1E0ADD090()
{
  return 0;
}

void sub_1E0ADD150()
{
}

id sub_1E0ADD194()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s22FeatureStatusPublisherV5InnerCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E0ADD208(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x1E4FBC8C8];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *a1) + 0x60));
  uint64_t v3 = (char *)a1 + *(void *)((*v2 & *a1) + 0x68);
  uint64_t v4 = sub_1E0B06408();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_release();
}

void (*sub_1E0ADD3D0(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1E0ADA8F4();
  return sub_1E0ADD428;
}

void sub_1E0ADD428(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_1E0ADD470()
{
  _s22FeatureStatusPublisherV5InnerCMa();
  return sub_1E0B063A8();
}

uint64_t sub_1E0ADD4D0()
{
  _s22FeatureStatusPublisherV5InnerCMa();
  return sub_1E0B063B8();
}

uint64_t sub_1E0ADD538()
{
  return sub_1E0B063D8();
}

uint64_t sub_1E0ADD590()
{
  return sub_1E0B063C8();
}

uint64_t sub_1E0ADD5DC()
{
  return sub_1E0B06578();
}

uint64_t _s22FeatureStatusPublisherV5InnerCMa()
{
  return __swift_instantiateGenericMetadata();
}

id sub_1E0ADD618(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  v25[2] = a1;
  uint64_t v26 = a2;
  uint64_t v6 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v7 = *MEMORY[0x1E4FBC8C8] & *(void *)v4;
  v25[1] = *(void *)(v7 + 80);
  uint64_t v8 = sub_1E0B06408();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)v25 - v11;
  uint64_t v13 = (uint64_t *)&v5[*(void *)(v7 + 96)];
  uint64_t v14 = sub_1E0B060B8();
  swift_allocObject();
  os_log_type_t v15 = v5;
  uint64_t v16 = sub_1E0B060A8();
  v13[3] = v14;
  v13[4] = sub_1E0ADE1E4(&qword_1EBF0EC68, MEMORY[0x1E4F66F68]);
  *uint64_t v13 = v16;
  *(void *)&v15[*(void *)((*v6 & *(void *)v15) + 0x88)] = 0;
  *(void *)&v15[*(void *)((*v6 & *(void *)v15) + 0x90)] = 0;
  *(void *)&v15[*(void *)((*v6 & *(void *)v15) + 0x98)] = 0;
  sub_1E0B063F8();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v15[*(void *)((*v6 & *(void *)v15) + 0x68)], v12, v8);
  os_log_type_t v17 = v26;
  id v18 = v27;
  *(void *)&v15[*(void *)((*v6 & *(void *)v15) + 0x70)] = v26;
  *(void *)&v15[*(void *)((*v6 & *(void *)v15) + 0x78)] = v18;
  id v19 = v28;
  *(void *)&v15[*(void *)((*v6 & *(void *)v15) + 0x80)] = v28;
  id v20 = v17;
  id v21 = v18;
  id v22 = v19;

  uint64_t v23 = (objc_class *)_s22FeatureStatusPublisherV5InnerCMa();
  v29.receiver = v15;
  v29.super_class = v23;
  return objc_msgSendSuper2(&v29, sel_init);
}

id sub_1E0ADD8EC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = objc_allocWithZone((Class)_s22FeatureStatusPublisherV5InnerCMa());
  return sub_1E0ADD618(a1, a2, a3, a4);
}

uint64_t sub_1E0ADD950()
{
  return MEMORY[0x1E4FBC0F0];
}

void *_s13FeatureStatusVwCP(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void _s13FeatureStatusVwxx(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 8);
}

uint64_t _s13FeatureStatusVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t _s13FeatureStatusVwta(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t _s13FeatureStatusVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13FeatureStatusVwst(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus()
{
  return &type metadata for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus;
}

void *_s22FeatureStatusPublisherVwCP(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

void _s22FeatureStatusPublisherVwxx(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t _s22FeatureStatusPublisherVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 16);
  uint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t _s22FeatureStatusPublisherVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t _s22FeatureStatusPublisherVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s22FeatureStatusPublisherVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher()
{
  return &type metadata for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher;
}

uint64_t sub_1E0ADDCFC()
{
  uint64_t result = sub_1E0B06408();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1E0ADDDBC()
{
  return swift_getWitnessTable();
}

uint64_t sub_1E0ADDDD8(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_1E0ADDDE0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1E0ADDDFC()
{
  return swift_getWitnessTable();
}

unint64_t sub_1E0ADDE18()
{
  unint64_t result = qword_1EBF0EC98;
  if (!qword_1EBF0EC98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBF0EC98);
  }
  return result;
}

void sub_1E0ADDE58(void *a1, void *a2)
{
  if (a1)
  {
  }
}

uint64_t sub_1E0ADDE98()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E0ADDED0()
{
  sub_1E0ADC37C(*(void *)(v0 + 32));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void sub_1E0ADDEF4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void *sub_1E0ADDF58(uint64_t a1)
{
  return sub_1E0ADB7CC(a1, *(void *)(v1 + 32));
}

uint64_t sub_1E0ADDF64()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E0ADDF9C()
{
}

uint64_t sub_1E0ADDFC0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1E0ADDFF8()
{
  sub_1E0ADAD4C(*(void *)(v0 + 32));
}

uint64_t sub_1E0ADE004(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  id v5 = (void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x60));
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1E0B06338();
  uint64_t v6 = *(void *)((*v4 & *v1) + 0x88);
  uint64_t v7 = *(void **)((char *)v1 + v6);
  *(void *)((char *)v2 + v6) = a1;
  id v8 = a1;

  sub_1E0ADBD00();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  return sub_1E0B06348();
}

uint64_t sub_1E0ADE0DC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  id v5 = (void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x60));
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1E0B06338();
  uint64_t v6 = *(void *)((*v4 & *v1) + 0x90);
  uint64_t v7 = *(void **)((char *)v1 + v6);
  *(void *)((char *)v2 + v6) = a1;
  id v8 = a1;

  sub_1E0ADBD00();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  return sub_1E0B06348();
}

void sub_1E0ADE1B4()
{
}

uint64_t sub_1E0ADE1E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

id WalkingSteadinessOnboardingStartViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return WalkingSteadinessOnboardingStartViewController.init()();
}

uint64_t sub_1E0ADE2B0()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62490);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62490);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void WalkingSteadinessOnboardingStartViewController.stage.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_stage);
}

uint64_t sub_1E0ADE38C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0ADE3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1E0ADE448(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACC500;
}

id WalkingSteadinessOnboardingStartViewController.init()()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_baseIdentifier];
  *uint64_t v1 = 0xD000000000000024;
  v1[1] = 0x80000001E0B0AE60;
  v0[OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_stage] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v3 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v4 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v5 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  id v6 = (id)qword_1EBF0EAF0;
  uint64_t v7 = (void *)sub_1E0B06788();
  id v8 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v7, v6, 0, 0xE000000000000000);

  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController();
  id v9 = objc_msgSendSuper2(&v15, sel_initWithTitle_detailText_icon_contentLayout_, v3, v5, v8, 2);

  id v10 = v9;
  id v11 = objc_msgSend(v10, sel_headerView);
  LODWORD(v12) = 1036831949;
  objc_msgSend(v11, sel_setTitleHyphenationFactor_, v12);

  id v13 = objc_msgSend(v10, sel_headerView);
  objc_msgSend(v13, sel_setAllowFullWidthIcon_, 1);

  return v10;
}

void sub_1E0ADE7C8()
{
  uint64_t ObjectType = swift_getObjectType();
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  sub_1E0ADF470(0, (unint64_t *)&qword_1EAD624C0, (uint64_t (*)(uint64_t))sub_1E0ADF23C, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1E0B08490;
  uint64_t v3 = sub_1E0B06468();
  uint64_t v4 = MEMORY[0x1E4FB0F40];
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
  *(void *)(swift_allocObject() + 16) = ObjectType;
  sub_1E0B06918();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = (void *)sub_1E0B06788();

  id v6 = (void *)sub_1E0B06788();
}

void sub_1E0ADE994(void *a1)
{
  id v2 = objc_msgSend(a1, sel_traitCollection);
  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  id v3 = (id)qword_1EBF0EAF0;
  id v4 = v2;
  uint64_t v5 = (void *)sub_1E0B06788();
  id v6 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v5, v3, v4);

  if (v6)
  {
    id v15 = objc_msgSend(a1, sel_headerView);
    objc_msgSend(v15, sel_setIcon_accessibilityLabel_, v6, 0);
  }
  else
  {
    if (qword_1EAD61EB0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1E0B06448();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EAD62490);
    id v15 = a1;
    id v8 = sub_1E0B06428();
    os_log_type_t v9 = sub_1E0B068B8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      id v11 = (void *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v17 = v12;
      *(_DWORD *)uint64_t v10 = 136446466;
      uint64_t v13 = sub_1E0B06C58();
      sub_1E0ACB6F4(v13, v14, &v17);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      id v16 = objc_msgSend(v15, sel_traitCollection);
      sub_1E0B06A68();
      *id v11 = v16;

      _os_log_impl(&dword_1E0AC7000, v8, v9, "[%{public}s] Unable to load icon for %@", (uint8_t *)v10, 0x16u);
      sub_1E0ADF470(0, (unint64_t *)&qword_1EBF0ECA0, (uint64_t (*)(uint64_t))sub_1E0ADDE18, MEMORY[0x1E4FBB718]);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v12, -1, -1);
      MEMORY[0x1E4E3C540](v10, -1, -1);

      return;
    }
  }
}

id WalkingSteadinessOnboardingStartViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = v7;
  uint64_t v12 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v14 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void WalkingSteadinessOnboardingStartViewController.init(title:detailText:symbolName:contentLayout:)()
{
}

id WalkingSteadinessOnboardingStartViewController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  id v11 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v12 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void WalkingSteadinessOnboardingStartViewController.init(title:detailText:icon:contentLayout:)()
{
}

id WalkingSteadinessOnboardingStartViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1E0ADF204(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_stage);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingStartViewController()
{
  return self;
}

unint64_t sub_1E0ADF23C()
{
  unint64_t result = qword_1EAD624C8;
  if (!qword_1EAD624C8)
  {
    sub_1E0ADF278();
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD624C8);
  }
  return result;
}

unint64_t sub_1E0ADF278()
{
  unint64_t result = qword_1EAD624D0;
  if (!qword_1EAD624D0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD624D0);
  }
  return result;
}

uint64_t sub_1E0ADF2D0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E0ADF2E0(void *a1)
{
}

uint64_t sub_1E0ADF2E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E0ADF344(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t method lookup function for WalkingSteadinessOnboardingStartViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingStartViewController);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_1E0ADF470(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1E0ADF4D4()
{
  unint64_t result = 0xD000000000000016;
  switch(*(unsigned char *)(v0
                    + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep))
  {
    case 1:
      unint64_t result = 0x446D7269666E6F63;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x6163696669746F6ELL;
      break;
    case 4:
      unint64_t result = 0x6974656C706D6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0ADF6C0()
{
  return sub_1E0B06B98();
}

uint64_t sub_1E0ADF770()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_presentation);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E0ADF80C()
{
  id v0 = objc_msgSend(self, sel_activeWatchProductType);
  uint64_t v1 = sub_1E0B06798();

  return v1;
}

uint64_t sub_1E0ADF908(void *a1)
{
  if (*(unsigned char *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(unsigned char *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_defaultDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1E0AE019C(MEMORY[0x1E4FBC860]);
      sub_1E0AE02C4();
      sub_1E0B05EC8();
      uint64_t v3 = (void *)sub_1E0B05ED8();

      id v4 = v3;
      uint64_t result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1E0B06848();
}

uint64_t sub_1E0ADFA2C(void *a1)
{
  if (*(unsigned char *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(unsigned char *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_defaultDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1E0AE019C(MEMORY[0x1E4FBC860]);
      sub_1E0AE02C4();
      sub_1E0B05EC8();
      uint64_t v3 = (void *)sub_1E0B05ED8();

      id v4 = v3;
      uint64_t result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1E0B06848();
}

uint64_t sub_1E0ADFB50(void *a1)
{
  if (*(unsigned char *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(unsigned char *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_changedDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1E0AE019C(MEMORY[0x1E4FBC860]);
      sub_1E0AE02C4();
      sub_1E0B05EC8();
      uint64_t v3 = (void *)sub_1E0B05ED8();

      id v4 = v3;
      uint64_t result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1E0B06848();
}

uint64_t sub_1E0ADFC78(void *a1)
{
  if (*(unsigned char *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(unsigned char *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_changedDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1E0AE019C(MEMORY[0x1E4FBC860]);
      sub_1E0AE02C4();
      sub_1E0B05EC8();
      uint64_t v3 = (void *)sub_1E0B05ED8();

      id v4 = v3;
      uint64_t result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1E0B06848();
}

uint64_t sub_1E0ADFDA0()
{
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) == 3
    && *(unsigned char *)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_acceptDefaults) != 2)
  {
    return sub_1E0B06848();
  }
  else
  {
    return 0;
  }
}

id sub_1E0ADFE4C(void *a1)
{
  return sub_1E0ADFF58(a1, (SEL *)&selRef_ageWithHealthStore_error_);
}

id sub_1E0ADFEF8(void *a1)
{
  return sub_1E0ADFF58(a1, (SEL *)&selRef_biologicalSexWithHealthStore_error_);
}

id sub_1E0ADFF58(void *a1, SEL *a2)
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  uint64_t v6 = *(void *)(v2
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_healthStore);
  v14[0] = 0;
  id v7 = objc_msgSend(v5, *a2, v6, v14);
  id v8 = v14[0];
  if (!v7)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)sub_1E0B05EE8();

    swift_willThrow();
    if (a1)
    {
      id v11 = (void *)sub_1E0B05ED8();
      id v12 = v11;
      *a1 = v11;
    }

    return 0;
  }
  return v7;
}

id WalkingSteadinessAnalyticsOnboardingEventDataSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WalkingSteadinessAnalyticsOnboardingEventDataSource.init()()
{
}

id WalkingSteadinessAnalyticsOnboardingEventDataSource.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessAnalyticsOnboardingEventDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1E0AE019C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1E0AE0594();
  uint64_t v2 = sub_1E0B06B58();
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
    sub_1E0AE0678(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1E0AE0600(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1E0AE0748(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1E0AE02C4()
{
  unint64_t result = qword_1EAD620A8;
  if (!qword_1EAD620A8)
  {
    type metadata accessor for HKError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD620A8);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessAnalyticsOnboardingEventDataSource()
{
  return self;
}

uint64_t method lookup function for WalkingSteadinessAnalyticsOnboardingEventDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessAnalyticsOnboardingEventDataSource);
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.stepWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.featureVersionWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.provenanceWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.activeWatchProductTypeWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.hasDefaultHeightWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.hasDefaultWeightWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.acceptDefaultHeightWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.acceptDefaultWeightWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.acceptDefaultNotificationsWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.ageWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.biologicalSexWithError(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

void sub_1E0AE0594()
{
  if (!qword_1EAD62580)
  {
    unint64_t v0 = sub_1E0B06B68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62580);
    }
  }
}

unint64_t sub_1E0AE0600(uint64_t a1, uint64_t a2)
{
  sub_1E0B06C08();
  sub_1E0B067D8();
  uint64_t v4 = sub_1E0B06C28();
  return sub_1E0AE0758(a1, a2, v4);
}

uint64_t sub_1E0AE0678(uint64_t a1, uint64_t a2)
{
  sub_1E0AE06DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1E0AE06DC()
{
  if (!qword_1EAD62588)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EAD62588);
    }
  }
}

_OWORD *sub_1E0AE0748(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1E0AE0758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1E0B06BB8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1E0B06BB8() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1E0B06BB8()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

void sub_1E0AE08A0()
{
  id v0 = objc_msgSend(self, sel_meterUnitWithMetricPrefix_, 5);
  objc_msgSend(self, sel_defaultCentimeterValue);
  id v2 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v0, v1);

  qword_1EAD65450 = (uint64_t)v2;
}

uint64_t sub_1E0AE0940()
{
  return sub_1E0B061D8();
}

unint64_t sub_1E0AE0978()
{
  unint64_t result = qword_1EAD62590;
  if (!qword_1EAD62590)
  {
    type metadata accessor for PickerTableViewCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62590);
  }
  return result;
}

uint64_t sub_1E0AE09D0()
{
  return sub_1E0B067B8();
}

unint64_t sub_1E0AE0A0C()
{
  unint64_t result = qword_1EAD62598;
  if (!qword_1EAD62598)
  {
    type metadata accessor for HeightPickerItem();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62598);
  }
  return result;
}

uint64_t type metadata accessor for HeightPickerItem()
{
  return self;
}

uint64_t sub_1E0AE0A68()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0AE0AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1E0AE0B24(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACCC0C;
}

uint64_t sub_1E0AE0BAC()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits);
  if (v2 == 2)
  {
    uint64_t v3 = v0;
    sub_1E0AE1F28();
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 24);
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter), v4);
    char v10 = 1;
    uint64_t v6 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 8))(&v10, v4, v5);
    id v7 = objc_msgSend(self, sel_footUnit);
    char v8 = sub_1E0B06A38();

    *(unsigned char *)(v3 + v1) = v8 & 1;
  }
  else
  {
    char v8 = v2 & 1;
  }
  return v8 & 1;
}

uint64_t sub_1E0AE0CA0(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  void *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E0AE0D0C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E0AE0D64(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E0AE0DC4())()
{
  return j_j__swift_endAccess;
}

id HeightPickerItem.__allocating_init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  uint64_t v5 = objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight;
  *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight] = 0;
  v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits] = 2;
  id v7 = &v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
  *id v7 = 0;
  v7[1] = 0;
  char v8 = *(void **)&v5[v6];
  *(void *)&v5[v6] = a1;
  uint64_t v9 = v5;
  id v10 = a1;

  sub_1E0ACC180(a2, (uint64_t)&v9[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter]);
  v13.receiver = v9;
  v13.super_class = v2;
  id v11 = objc_msgSendSuper2(&v13, sel_init);

  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v11;
}

id HeightPickerItem.init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight;
  *(void *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight] = 0;
  v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits] = 2;
  uint64_t v6 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
  *uint64_t v6 = 0;
  v6[1] = 0;
  id v7 = *(void **)&v2[v5];
  *(void *)&v2[v5] = a1;
  char v8 = v2;
  id v9 = a1;

  sub_1E0ACC180(a2, (uint64_t)&v8[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter]);
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for HeightPickerItem();
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v10;
}

id HeightPickerItem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HeightPickerItem.init()()
{
}

id HeightPickerItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeightPickerItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E0AE1118()
{
  return sub_1E0B067B8();
}

uint64_t sub_1E0AE1154()
{
  id v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E0AE11B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(*v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E0AE1214())()
{
  return j__swift_endAccess;
}

uint64_t HeightPickerItem.initialSelections.getter()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight);
  if (!v1)
  {
    if (qword_1EAD61EB8 != -1) {
      goto LABEL_13;
    }
    goto LABEL_4;
  }
  id v2 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight);
  while (1)
  {
    id v3 = v1;
    if ((sub_1E0AE0BAC() & 1) == 0) {
      break;
    }
    sub_1E0AE16B0(v2);
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    sub_1E0AE1394();
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1E0B07E50;
    if (!__OFSUB__(v5, 1))
    {
      uint64_t v9 = v8;
      *(void *)(v8 + 32) = v5 - 1;
      *(void *)(v8 + 40) = 0;
      *(void *)(v8 + 48) = v7;
      *(void *)(v8 + 56) = 1;
      goto LABEL_10;
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    swift_once();
LABEL_4:
    id v2 = (id)qword_1EAD65450;
    id v1 = 0;
  }
  sub_1E0AE1394();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1E0B08490;
  sub_1E0AE17BC(v2);
  if (__OFSUB__(v10, 30)) {
    goto LABEL_12;
  }
  *(void *)(v9 + 32) = v10 - 30;
  *(void *)(v9 + 40) = 0;
LABEL_10:

  return v9;
}

void sub_1E0AE1394()
{
  if (!qword_1EAD62920)
  {
    sub_1E0AE13EC();
    unint64_t v0 = sub_1E0B06BA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62920);
    }
  }
}

void sub_1E0AE13EC()
{
  if (!qword_1EAD625D0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EAD625D0);
    }
  }
}

Swift::Int __swiftcall HeightPickerItem.numberOfComponents(in:)(UIPickerView *in)
{
  if (sub_1E0AE0BAC()) {
    return 2;
  }
  else {
    return 1;
  }
}

Swift::Int __swiftcall HeightPickerItem.pickerView(_:numberOfRowsInComponent:)(UIPickerView *_, Swift::Int numberOfRowsInComponent)
{
  char v3 = sub_1E0AE0BAC();
  Swift::Int v4 = 246;
  if (numberOfRowsInComponent) {
    Swift::Int v4 = 0;
  }
  Swift::Int v5 = 12;
  if (numberOfRowsInComponent != 1) {
    Swift::Int v5 = 0;
  }
  if (!numberOfRowsInComponent) {
    Swift::Int v5 = 9;
  }
  if (v3) {
    return v5;
  }
  else {
    return v4;
  }
}

Swift::String_optional __swiftcall HeightPickerItem.pickerView(_:titleForRow:forComponent:)(UIPickerView *_, Swift::Int titleForRow, Swift::Int forComponent)
{
  id v3 = sub_1E0AE18AC(titleForRow, forComponent);
  result.value._object = v4;
  result.value._uint64_t countAndFlagsBits = (uint64_t)v3;
  return result;
}

void sub_1E0AE16B0(void *a1)
{
  id v2 = objc_msgSend(self, sel_inchUnit);
  objc_msgSend(a1, sel_doubleValueForUnit_, v2);
  double v4 = v3;

  double v5 = round(v4);
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.22337204e18)
  {
    sub_1E0B06768();
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_1E0AE17BC(void *a1)
{
  id v2 = objc_msgSend(self, sel_meterUnitWithMetricPrefix_, 5);
  objc_msgSend(a1, sel_doubleValueForUnit_, v2);
  double v4 = v3;

  double v5 = round(v4);
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.22337204e18)
  {
    sub_1E0B06768();
    return;
  }
LABEL_7:
  __break(1u);
}

id sub_1E0AE18AC(uint64_t a1, uint64_t a2)
{
  if ((sub_1E0AE0BAC() & 1) == 0)
  {
    if (a2) {
      return 0;
    }
    id result = objc_msgSend(self, sel_meterUnitWithMetricPrefix_, 5);
    if (!__OFADD__(a1, 30))
    {
      uint64_t v8 = result;
      id v9 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, result, (double)(a1 + 30));

      uint64_t v10 = *(void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 24);
      uint64_t v11 = *(void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 32);
      __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter), v10);
      char v14 = 1;
      uint64_t v12 = (*(uint64_t (**)(char *, id, uint64_t, uint64_t))(v11 + 16))(&v14, v9, v10, v11);

      return (id)v12;
    }
    __break(1u);
    goto LABEL_17;
  }
  if (a2 != 1)
  {
    if (a2) {
      return 0;
    }
    id result = objc_msgSend(self, sel_sharedFormatter);
    if (!result) {
      goto LABEL_18;
    }
    if (!__OFADD__(a1, 1))
    {
      uint64_t v6 = result;
      id v7 = objc_msgSend(result, sel_formattedValueForFeet_, (double)(a1 + 1));
      goto LABEL_12;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id result = objc_msgSend(self, sel_sharedFormatter);
  if (result)
  {
    uint64_t v6 = result;
    id v7 = objc_msgSend(result, sel_formattedValueForInches_, (double)a1);
LABEL_12:
    id v13 = v7;

    if (v13)
    {
      uint64_t v12 = sub_1E0B06798();

      return (id)v12;
    }
    return 0;
  }
LABEL_19:
  __break(1u);
  return result;
}

void _s16HealthMobilityUI16HeightPickerItemC10pickerView_12didSelectRow11inComponentySo08UIPickerH0C_S2itF_0(void *a1, uint64_t a2)
{
  if ((sub_1E0AE0BAC() & 1) == 0)
  {
    BOOL v11 = __OFADD__(a2, 30);
    uint64_t v9 = a2 + 30;
    if (!v11)
    {
      id v10 = objc_msgSend(self, sel_meterUnitWithMetricPrefix_, 5);
      goto LABEL_8;
    }
LABEL_14:
    __break(1u);
    return;
  }
  double v5 = (char *)objc_msgSend(a1, sel_selectedRowInComponent_, 0);
  uint64_t v6 = (uint64_t)(v5 + 1);
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  id v7 = objc_msgSend(a1, sel_selectedRowInComponent_, 1);
  uint64_t v8 = 12 * v6;
  if ((unsigned __int128)(v6 * (__int128)12) >> 64 != (12 * v6) >> 63)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v9 = (uint64_t)v7 + v8;
  if (__OFADD__(v8, v7))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v10 = objc_msgSend(self, sel_inchUnit);
LABEL_8:
  id v12 = v10;
  id v13 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v12, (double)v9);

  char v14 = *(void **)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight);
  *(void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight) = v13;
  id v15 = v13;

  uint64_t v16 = v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v16))
  {
    uint64_t v17 = *(void *)(v16 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v17 + 8))(v2, v15, ObjectType, v17);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1E0AE1C2C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E0AE1C88(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1E0AE1CEC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of HeightPickerItemDelegate.heightPickerItem(_:didSelectHeight:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t method lookup function for HeightPickerItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HeightPickerItem);
}

uint64_t dispatch thunk of HeightPickerItem.reuseIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HeightPickerItem.uniqueIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HeightPickerItem.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HeightPickerItem.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HeightPickerItem.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HeightPickerItem.baseIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HeightPickerItem.baseIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HeightPickerItem.baseIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HeightPickerItem.__allocating_init(initialValue:valueFormatter:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

unint64_t sub_1E0AE1F28()
{
  unint64_t result = qword_1EAD625E0;
  if (!qword_1EAD625E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD625E0);
  }
  return result;
}

uint64_t localized(_:locale:source:value:comment:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = sub_1E0B05E58();
  if (*(void *)(a9 + 16))
  {
    uint64_t v10 = sub_1E0B067A8();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

id sub_1E0AE1FFC()
{
  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EBF0EAF0;
  qword_1EAD625F0 = qword_1EBF0EAF0;
  *(void *)algn_1EAD625F8 = 0xD00000000000001CLL;
  qword_1EAD62600 = 0x80000001E0B0B2C0;
  return v0;
}

HealthMobilityUI::LocalizationSource __swiftcall LocalizationSource.init(bundle:table:)(NSBundle bundle, Swift::String table)
{
  *(NSBundle *)uint64_t v2 = bundle;
  *(Swift::String *)(v2 + 8) = table;
  result.table = table;
  result.bundle = bundle;
  return result;
}

uint64_t static LocalizationSource.main.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EAD625F0;
  uint64_t v3 = *(void *)algn_1EAD625F8;
  uint64_t v4 = qword_1EAD62600;
  *a1 = qword_1EAD625F0;
  a1[1] = v3;
  a1[2] = v4;
  id v5 = v2;
  return swift_bridgeObjectRetain();
}

id sub_1E0AE210C()
{
  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EBF0EAF0;
  qword_1EAD62608 = qword_1EBF0EAF0;
  unk_1EAD62610 = 0xD00000000000001DLL;
  qword_1EAD62618 = 0x80000001E0B0B2A0;
  return v0;
}

uint64_t static LocalizationSource.walkingSteadiness.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EAD62608;
  uint64_t v3 = unk_1EAD62610;
  uint64_t v4 = qword_1EAD62618;
  *a1 = qword_1EAD62608;
  a1[1] = v3;
  a1[2] = v4;
  id v5 = v2;
  return swift_bridgeObjectRetain();
}

id sub_1E0AE2210()
{
  if (qword_1EAD61F78 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EAD654F0;
  qword_1EAD62620 = qword_1EAD654F0;
  *(void *)algn_1EAD62628 = 0xD000000000000014;
  qword_1EAD62630 = 0x80000001E0B0B280;
  return v0;
}

uint64_t static LocalizationSource.healthUI.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EAD61ED0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EAD62620;
  uint64_t v3 = *(void *)algn_1EAD62628;
  uint64_t v4 = qword_1EAD62630;
  *a1 = qword_1EAD62620;
  a1[1] = v3;
  a1[2] = v4;
  id v5 = v2;
  return swift_bridgeObjectRetain();
}

id sub_1E0AE2314()
{
  if (qword_1EAD61F80 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EAD654F8;
  qword_1EAD62638 = qword_1EAD654F8;
  unk_1EAD62640 = 0xD00000000000001DLL;
  qword_1EAD62648 = 0x80000001E0B0B260;
  return v0;
}

uint64_t static LocalizationSource.legacy.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EAD61ED8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EAD62638;
  uint64_t v3 = unk_1EAD62640;
  uint64_t v4 = qword_1EAD62648;
  *a1 = qword_1EAD62638;
  a1[1] = v3;
  a1[2] = v4;
  id v5 = v2;
  return swift_bridgeObjectRetain();
}

uint64_t localized(_:locale:source:value:comment:arguments:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = sub_1E0B05E58();
  if (*(void *)(a9 + 16))
  {
    uint64_t v10 = sub_1E0B067A8();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

uint64_t String.localized(source:locale:value:comment:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = sub_1E0B05E58();
  if (*(void *)(a7 + 16))
  {
    uint64_t v9 = sub_1E0B067A8();
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t LocalizationSource.localized(_:locale:value:comment:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1E0B05E58();
  if (*(void *)(a8 + 16))
  {
    uint64_t v10 = sub_1E0B067A8();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

id HKMobilityLocalizedString()
{
  sub_1E0B06798();
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  return v1;
}

Swift::String __swiftcall localizedStringForObjC(_:)(Swift::String a1)
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1E0B05E58();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v5 = v2;
  uint64_t v6 = v4;
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

id HKMobilityHBXLocalizedString()
{
  sub_1E0B06798();
  if (qword_1EAD61ED8 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD62638;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v1 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  return v1;
}

Swift::String __swiftcall localizedHBXStringForObjC(_:)(Swift::String a1)
{
  if (qword_1EAD61ED8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EAD62638;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1E0B05E58();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v5 = v2;
  uint64_t v6 = v4;
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t destroy for LocalizationSource(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s16HealthMobilityUI18LocalizationSourceVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LocalizationSource(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LocalizationSource(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LocalizationSource()
{
  return &type metadata for LocalizationSource;
}

uint64_t static DeepLink.openMotionAndFitnessSettings()()
{
  return MEMORY[0x1F411DF08](0xD00000000000001ELL, 0x80000001E0B0A850);
}

unint64_t static DeepLink.walkingSteadinessKnowledgeBaseLink.getter()
{
  return 0xD000000000000025;
}

unint64_t static DeepLink.motionAndFitnessSettingsLink.getter()
{
  return 0xD00000000000001ELL;
}

unint64_t static DeepLink.walkingSteadinessRegionGatedLink.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t static DeepLink.heightDataTypeDetailLink.getter()
{
  sub_1E0AE2D60();
  uint64_t v2 = MEMORY[0x1F4188790](v0 - 8, v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2, v5);
  id v7 = (char *)&v15 - v6;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F65870]), sel_init);
  sub_1E0AE2DB8();
  uint64_t v9 = (void *)MEMORY[0x1E4E3BBA0]((id)*MEMORY[0x1E4F2A838]);
  id v10 = objc_msgSend(v8, sel_URLForDataTypeDetailWithObjectType_, v9);

  if (v10)
  {
    sub_1E0B05F08();

    uint64_t v11 = sub_1E0B05F18();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
  }
  else
  {
    uint64_t v11 = sub_1E0B05F18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 1, 1, v11);
  }
  sub_1E0AE2DF8((uint64_t)v4, (uint64_t)v7);
  sub_1E0B05F18();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1E0AE2E5C((uint64_t)v7);
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = sub_1E0B05EF8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }

  return v13;
}

void sub_1E0AE2D60()
{
  if (!qword_1EAD621E0)
  {
    sub_1E0B05F18();
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD621E0);
    }
  }
}

unint64_t sub_1E0AE2DB8()
{
  unint64_t result = qword_1EAD62650;
  if (!qword_1EAD62650)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62650);
  }
  return result;
}

uint64_t sub_1E0AE2DF8(uint64_t a1, uint64_t a2)
{
  sub_1E0AE2D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0AE2E5C(uint64_t a1)
{
  sub_1E0AE2D60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t static DeepLink.healthProfileLink.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t static DeepLink.openWalkingSteadinessAgeGatedLearnMore()()
{
  return MEMORY[0x1F411DF08](0xD000000000000025, 0x80000001E0B0B2E0);
}

uint64_t static DeepLink.openWalkingSteadinessRegionGatedLearnMore()()
{
  return MEMORY[0x1F411DF08](0xD00000000000002FLL, 0x80000001E0B0B310);
}

ValueMetadata *type metadata accessor for DeepLink()
{
  return &type metadata for DeepLink;
}

uint64_t sub_1E0AE2F20(uint64_t a1)
{
  return sub_1E0AC9CC8(a1, qword_1EAD62658);
}

uint64_t static Logger.Mobility.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AC9D80(&qword_1EAD61EE0, (uint64_t)qword_1EAD62658, a1);
}

uint64_t sub_1E0AE2F58(uint64_t a1)
{
  return sub_1E0AC9CC8(a1, qword_1EBF0EC78);
}

uint64_t static Logger.Mobility.plugin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AC9D80(&qword_1EBF0EC70, (uint64_t)qword_1EBF0EC78, a1);
}

uint64_t sub_1E0AE2F90(uint64_t a1)
{
  return sub_1E0AC9CC8(a1, qword_1EAD62670);
}

uint64_t static Logger.Mobility.notification.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AC9D80(&qword_1EAD61EE8, (uint64_t)qword_1EAD62670, a1);
}

uint64_t sub_1E0AE2FC8(uint64_t a1)
{
  return sub_1E0AC9CC8(a1, qword_1EAD62688);
}

uint64_t static Logger.Mobility.view.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AC9D80(&qword_1EAD61EF0, (uint64_t)qword_1EAD62688, a1);
}

uint64_t sub_1E0AE3000(uint64_t a1)
{
  return sub_1E0AC9CC8(a1, qword_1EAD626A0);
}

uint64_t static Logger.Mobility.analytics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AC9D80(&qword_1EAD61EF8, (uint64_t)qword_1EAD626A0, a1);
}

ValueMetadata *type metadata accessor for Logger.Mobility()
{
  return &type metadata for Logger.Mobility;
}

void *WalkingSteadinessOnboardingAboutHealthDetailsViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return WalkingSteadinessOnboardingAboutHealthDetailsViewController.init()();
}

void *WalkingSteadinessOnboardingAboutHealthDetailsViewController.init()()
{
  type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsDataSource();
  swift_allocObject();
  sub_1E0AE8E6C();
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v1 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  swift_retain();
  uint64_t v2 = (void *)sub_1E0B06298();
  objc_msgSend(v2, sel_setModalInPresentation_, 0, 0xE000000000000000);
  swift_release();
  return v2;
}

void sub_1E0AE323C()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_tableView);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setSeparatorStyle_, 0);

    id v3 = objc_msgSend(v0, sel_tableView);
    if (v3)
    {
      uint64_t v4 = v3;
      objc_msgSend(v3, sel_setContentInset_, -7.0, 0.0, 0.0, 0.0);

      id v5 = objc_msgSend(v0, sel_headerView);
      LODWORD(v6) = 1036831949;
      objc_msgSend(v5, sel_setTitleHyphenationFactor_, v6);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1E0AE3334(void *a1)
{
  id v1 = a1;
  sub_1E0AE323C();
}

void WalkingSteadinessOnboardingAboutHealthDetailsViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

void WalkingSteadinessOnboardingAboutHealthDetailsViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

id WalkingSteadinessOnboardingAboutHealthDetailsViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController()
{
  uint64_t result = qword_1EAD626B8;
  if (!qword_1EAD626B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0AE3460()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingAboutHealthDetailsViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingAboutHealthDetailsViewController);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingAboutHealthDetailsViewController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0
                              + class metadata base offset for WalkingSteadinessOnboardingAboutHealthDetailsViewController))();
}

uint64_t sub_1E0AE34D4()
{
  return type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController();
}

void sub_1E0AE34DC()
{
  qword_1EAD626C8 = 0;
}

uint64_t ConfirmDetailsFooterView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView_configuration;
  uint64_t v4 = sub_1E0B06558();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

id sub_1E0AE355C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E0B064E8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v2, v4);
  objc_super v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5, v8);
  id v10 = (char *)&v24 - v9;
  uint64_t v11 = OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel;
  uint64_t v12 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel);
  if (v12)
  {
    id v13 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel);
  }
  else
  {
    sub_1E0B06508();
    char v14 = (void *)sub_1E0B064A8();
    uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
    v15(v10, v2);
    sub_1E0B06508();
    uint64_t v16 = (void *)sub_1E0B064C8();
    v15(v7, v2);
    sub_1E0B06538();
    uint64_t v18 = v17;
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
    objc_msgSend(v19, sel_setNumberOfLines_, 0);
    objc_msgSend(v19, sel_setFont_, v14);
    objc_msgSend(v19, sel_setTextColor_, v16);
    id v20 = v19;
    if (v18)
    {
      id v20 = (void *)sub_1E0B06788();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_setText_, v20);
    }
    id v21 = *(void **)(v1 + v11);
    *(void *)(v1 + v11) = v19;
    id v13 = v19;

    uint64_t v12 = 0;
  }
  id v22 = v12;
  return v13;
}

id sub_1E0AE3784(uint64_t a1, double a2)
{
  *(void *)&v2[OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel] = 0;
  uint64_t v5 = &v2[OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView_configuration];
  uint64_t v6 = sub_1E0B06558();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
  v36.receiver = v2;
  v36.super_class = (Class)type metadata accessor for ConfirmDetailsFooterView();
  id v8 = objc_msgSendSuper2(&v36, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v9 = qword_1EAD61F00;
  id v10 = v8;
  if (v9 != -1) {
    swift_once();
  }
  double v11 = a2 - (*(double *)&qword_1EAD626C8 + *(double *)&qword_1EAD626C8);
  id v12 = sub_1E0AE355C();
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v13 = sub_1E0AE355C();
  objc_msgSend(v13, sel_setPreferredMaxLayoutWidth_, v11);

  id v14 = v10;
  id v15 = sub_1E0AE355C();
  objc_msgSend(v14, sel_addSubview_, v15);

  id v35 = self;
  sub_1E0AE3E74();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1E0B086E0;
  id v17 = sub_1E0AE355C();
  id v18 = objc_msgSend(v17, sel_topAnchor);

  id v19 = objc_msgSend(v14, sel_topAnchor);
  id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v19, 18.0);

  *(void *)(v16 + 32) = v20;
  id v21 = sub_1E0AE355C();
  id v22 = objc_msgSend(v21, sel_leadingAnchor);

  id v23 = objc_msgSend(v14, sel_leadingAnchor);
  id v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, *(double *)&qword_1EAD626C8);

  *(void *)(v16 + 40) = v24;
  id v25 = sub_1E0AE355C();
  id v26 = objc_msgSend(v25, sel_trailingAnchor);

  id v27 = objc_msgSend(v14, sel_trailingAnchor);
  id v28 = objc_msgSend(v26, sel_constraintLessThanOrEqualToAnchor_constant_, v27, -*(double *)&qword_1EAD626C8);

  *(void *)(v16 + 48) = v28;
  id v29 = sub_1E0AE355C();
  id v30 = objc_msgSend(v29, sel_bottomAnchor);

  id v31 = objc_msgSend(v14, sel_bottomAnchor);
  id v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_constant_, v31, -18.0);

  *(void *)(v16 + 56) = v32;
  sub_1E0B06828();
  sub_1E0AE3ED0();
  os_log_type_t v33 = (void *)sub_1E0B06818();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_activateConstraints_, v33);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v14;
}

id ConfirmDetailsFooterView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ConfirmDetailsFooterView.init(frame:)()
{
}

id ConfirmDetailsFooterView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfirmDetailsFooterView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConfirmDetailsFooterView()
{
  uint64_t result = qword_1EAD626D8;
  if (!qword_1EAD626D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0AE3DBC()
{
  return type metadata accessor for ConfirmDetailsFooterView();
}

uint64_t sub_1E0AE3DC4()
{
  uint64_t result = sub_1E0B06558();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ConfirmDetailsFooterView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfirmDetailsFooterView);
}

void sub_1E0AE3E74()
{
  if (!qword_1EAD62200)
  {
    unint64_t v0 = sub_1E0B06BA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62200);
    }
  }
}

unint64_t sub_1E0AE3ED0()
{
  unint64_t result = qword_1EAD626E8;
  if (!qword_1EAD626E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD626E8);
  }
  return result;
}

id WalkingSteadinessOnboardingSetupCompleteViewController.__allocating_init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return WalkingSteadinessOnboardingSetupCompleteViewController.init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)(a1, a2);
}

uint64_t sub_1E0AE3F5C()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD626F0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD626F0);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void WalkingSteadinessOnboardingSetupCompleteViewController.stage.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + qword_1EAD62708);
}

uint64_t sub_1E0AE4038()
{
  uint64_t v1 = v0 + qword_1EAD62710;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0AE4088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + qword_1EAD62710;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1E0AE40F4(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = qword_1EAD62710;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACC500;
}

id WalkingSteadinessOnboardingSetupCompleteViewController.init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)(uint64_t a1, void *a2)
{
  v2[qword_1EAD62708] = 4;
  *(void *)&v2[qword_1EAD62710 + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = &v2[qword_1EAD62718];
  *uint64_t v5 = 0xD000000000000028;
  v5[1] = 0x80000001E0B0B580;
  uint64_t v6 = v2;
  id v7 = (id)HKMobilityWalkingSteadinessType();
  uint64_t v21 = a1;
  sub_1E0ACC180(a1, (uint64_t)v23);
  sub_1E0ACC180((uint64_t)a2, (uint64_t)v22);
  sub_1E0B062B8();
  swift_allocObject();
  *(void *)&v6[qword_1EAD62720] = sub_1E0B062A8();

  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v8 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v9 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v10 = qword_1EBF0EC60;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  id v11 = (id)qword_1EBF0EAF0;
  id v12 = (void *)sub_1E0B06788();
  id v13 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v12, v11, 0, 0xE000000000000000);

  LOWORD(v20) = 0;
  id v14 = (id)sub_1E0B06298();
  id v15 = objc_msgSend(v14, sel_headerView, v20);
  LODWORD(v16) = 1036831949;
  objc_msgSend(v15, sel_setTitleHyphenationFactor_, v16);

  id v17 = objc_msgSend(v14, sel_headerView);
  objc_msgSend(v17, sel_setAllowFullWidthIcon_, 1);

  sub_1E0ADA450(0, (unint64_t *)&qword_1EAD62650);
  id v18 = (void *)MEMORY[0x1E4E3BBA0]((id)*MEMORY[0x1E4F2A5E8]);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_1E0B060D8();

  __swift_destroy_boxed_opaque_existential_1Tm(v21);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a2);
  return v14;
}

void sub_1E0AE4578()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v2 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  sub_1E0AD4398();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1E0B08740;
  uint64_t v4 = *(void *)&v0[qword_1EAD62718 + 8];
  *(void *)(v3 + 32) = *(void *)&v0[qword_1EAD62718];
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = 1701736260;
  *(void *)(v3 + 56) = 0xE400000000000000;
  *(void *)(v3 + 64) = 0x6E6F74747542;
  *(void *)(v3 + 72) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_1E0B06818();
  swift_bridgeObjectRelease();
  id v6 = (id)HKUIJoinStringsForAutomationIdentifier();
}

void sub_1E0AE4748(void *a1)
{
  id v1 = a1;
  sub_1E0AE4578();
}

void sub_1E0AE4790(void *a1, uint64_t a2, uint64_t a3)
{
  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  id v4 = v6.receiver;
  objc_msgSendSuper2(&v6, sel_viewWillAppear_, a3);
  id v5 = objc_msgSend(v4, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setHidesBackButton_, 1);
}

uint64_t sub_1E0AE4824(char *a1)
{
  uint64_t v2 = &a1[qword_1EAD62710];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v2);
  if (result)
  {
    uint64_t v4 = *((void *)v2 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(v4 + 8);
    objc_super v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1E0AE48D0(char *a1)
{
  uint64_t v2 = &a1[qword_1EAD62710];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v2);
  if (result)
  {
    uint64_t v4 = *((void *)v2 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(v4 + 24);
    objc_super v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1E0AE497C(void *a1)
{
  swift_getObjectType();
  v24.receiver = v1;
  v24.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  objc_msgSendSuper2(&v24, sel_traitCollectionDidChange_, a1);
  id v3 = objc_msgSend(v1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_userInterfaceStyle);
  if (a1 && v4 == objc_msgSend(a1, sel_userInterfaceStyle))
  {
  }
  else
  {
    uint64_t v5 = qword_1EBF0EC60;
    id v6 = v3;
    if (v5 != -1) {
      swift_once();
    }
    objc_super v7 = (void *)qword_1EBF0EAF0;
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = (void *)sub_1E0B06788();
    id v11 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v10, v9, v8);

    if (v11)
    {
      id v12 = objc_msgSend(v1, sel_headerView);
      objc_msgSend(v12, sel_setIcon_accessibilityLabel_, v11, 0);
    }
    else
    {
      if (qword_1EAD61F08 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_1E0B06448();
      __swift_project_value_buffer(v13, (uint64_t)qword_1EAD626F0);
      id v14 = v8;
      id v15 = sub_1E0B06428();
      os_log_type_t v16 = sub_1E0B068B8();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        id v18 = (void *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v23 = v22;
        *(_DWORD *)uint64_t v17 = 136446466;
        uint64_t v19 = sub_1E0B06C58();
        sub_1E0ACB6F4(v19, v20, &v23);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2112;
        id v21 = v14;
        sub_1E0B06A68();
        void *v18 = v3;

        _os_log_impl(&dword_1E0AC7000, v15, v16, "[%{public}s] Unable to load icon for %@", (uint8_t *)v17, 0x16u);
        sub_1E0AE4F20();
        swift_arrayDestroy();
        MEMORY[0x1E4E3C540](v18, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x1E4E3C540](v22, -1, -1);
        MEMORY[0x1E4E3C540](v17, -1, -1);
      }
      else
      {
      }
    }
  }
}

void sub_1E0AE4D08(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_1E0AE497C(a3);
}

void WalkingSteadinessOnboardingSetupCompleteViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

void WalkingSteadinessOnboardingSetupCompleteViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

uint64_t sub_1E0AE4DD4()
{
  sub_1E0ACD748(v0 + qword_1EAD62710);
  swift_release();
  return swift_bridgeObjectRelease();
}

id WalkingSteadinessOnboardingSetupCompleteViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E0AE4E60(uint64_t a1)
{
  sub_1E0ACD748(a1 + qword_1EAD62710);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_1E0AE4EC0(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + qword_1EAD62708);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController()
{
  uint64_t result = qword_1EAD62728;
  if (!qword_1EAD62728) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E0AE4F20()
{
  if (!qword_1EBF0ECA0)
  {
    sub_1E0ADA450(255, (unint64_t *)&qword_1EBF0EC98);
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0ECA0);
    }
  }
}

uint64_t sub_1E0AE4F88@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + qword_1EAD62710;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E0AE4FE4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + qword_1EAD62710;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1E0AE5048()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingSetupCompleteViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingSetupCompleteViewController);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 32))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 48))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.__allocating_init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + v0
                              + 56))();
}

uint64_t sub_1E0AE51D8()
{
  return type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
}

uint64_t sub_1E0AE51E0()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62738);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62738);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id sub_1E0AE52A8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  id result = objc_msgSend(v0, sel_setDateStyle_, 2);
  qword_1EAD62750 = (uint64_t)v0;
  return result;
}

id sub_1E0AE530C()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
  qword_1EAD62758 = (uint64_t)result;
  return result;
}

uint64_t sub_1E0AE5340()
{
  uint64_t v0 = sub_1E0B05FD8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  id v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E0B06048();
  __swift_allocate_value_buffer(v5, qword_1EAD62760);
  __swift_project_value_buffer(v5, (uint64_t)qword_1EAD62760);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E4F27B20], v0);
  sub_1E0B05FE8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t DateOfBirthItem.reuseIdentifier.getter()
{
  return sub_1E0B061D8();
}

uint64_t DateOfBirthItem.uniqueIdentifier.getter()
{
  sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v1, v2);
  id v4 = (char *)v10 - v3;
  uint64_t v5 = type metadata accessor for DateOfBirthItem();
  v10[0] = v5;
  sub_1E0AE5640();
  uint64_t v6 = sub_1E0B067B8();
  uint64_t v8 = v7;
  sub_1E0AD5CCC(v0 + *(int *)(v5 + 20), (uint64_t)v4);
  sub_1E0B067B8();
  v10[0] = v6;
  v10[1] = v8;
  swift_bridgeObjectRetain();
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10[0];
}

uint64_t type metadata accessor for DateOfBirthItem()
{
  uint64_t result = qword_1EAD62780;
  if (!qword_1EAD62780) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1E0AE5640()
{
  unint64_t result = qword_1EAD62778;
  if (!qword_1EAD62778)
  {
    type metadata accessor for DateOfBirthItem();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62778);
  }
  return result;
}

uint64_t DateOfBirthItem.baseIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DateOfBirthItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DateOfBirthItem.baseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t DateOfBirthItem.init(dateOfBirthComponents:dateGenerator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for DateOfBirthItem();
  *a4 = 0;
  a4[1] = 0;
  uint64_t result = sub_1E0AE5770(a1, (uint64_t)a4 + *(int *)(v8 + 20));
  uint64_t v10 = (void *)((char *)a4 + *(int *)(v8 + 24));
  void *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t sub_1E0AE5770(uint64_t a1, uint64_t a2)
{
  sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0AE5804()
{
  return sub_1E0B061D8();
}

uint64_t sub_1E0AE586C(uint64_t a1)
{
  sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3, v4);
  uint64_t v6 = (char *)v11 - v5;
  v11[0] = a1;
  sub_1E0AE5640();
  uint64_t v7 = sub_1E0B067B8();
  uint64_t v9 = v8;
  sub_1E0AD5CCC(v1 + *(int *)(a1 + 20), (uint64_t)v6);
  sub_1E0B067B8();
  v11[0] = v7;
  v11[1] = v9;
  swift_bridgeObjectRetain();
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11[0];
}

uint64_t sub_1E0AE5990(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_1E0AE59C8())()
{
  return nullsub_1;
}

uint64_t DateOfBirthItem.title.getter()
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t DateOfBirthItem.value.getter()
{
  uint64_t v1 = sub_1E0B05E48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = type metadata accessor for DateOfBirthItem();
  sub_1E0AD5CCC(v0 + *(int *)(v10 + 20), (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v9, 1, v1) == 1)
  {
    if (qword_1EAD61EC0 != -1) {
      swift_once();
    }
    id v11 = (id)qword_1EAD625F0;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1E0B05E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v9, v1);
    uint64_t v12 = sub_1E0AE5D0C((uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return v12;
}

uint64_t sub_1E0AE5D0C(uint64_t a1)
{
  uint64_t v3 = sub_1E0B05E48();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AE74A4(0, &qword_1EAD62790, MEMORY[0x1E4F27A78], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8, v10);
  char v70 = (char *)&v67 - v11;
  sub_1E0AE74A4(0, (unint64_t *)&qword_1EAD62798, MEMORY[0x1E4F27928], v8);
  MEMORY[0x1F4188790](v12 - 8, v13);
  id v15 = (char *)&v67 - v14;
  uint64_t v16 = sub_1E0B05F88();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v16, v18);
  id v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19, v22);
  BOOL v69 = (char *)&v67 - v23;
  if (qword_1EAD61F28 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1E0B06048();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EAD62760);
  sub_1E0B06008();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_1E0AE75B4((uint64_t)v15, (unint64_t *)&qword_1EAD62798, MEMORY[0x1E4F27928]);
    if (qword_1EAD61F10 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1E0B06448();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EAD62738);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
    id v26 = sub_1E0B06428();
    os_log_type_t v27 = sub_1E0B068B8();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v72 = v29;
      *(_DWORD *)uint64_t v28 = 136446722;
      uint64_t v71 = sub_1E0ACB6F4(0x6942664F65746144, 0xEF6D657449687472, &v72);
      sub_1E0B06A68();
      *(_WORD *)(v28 + 12) = 2082;
      uint64_t v71 = sub_1E0ACB6F4(0xD000000000000020, 0x80000001E0B0B770, &v72);
      sub_1E0B06A68();
      *(_WORD *)(v28 + 22) = 2080;
      sub_1E0AE745C(&qword_1EAD627A0, MEMORY[0x1E4F26F90]);
      uint64_t v30 = sub_1E0B06B98();
      uint64_t v71 = sub_1E0ACB6F4(v30, v31, &v72);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      _os_log_impl(&dword_1E0AC7000, v26, v27, "[%{public}s.%{public}s]: Unable to create date from birth day components: %s", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v29, -1, -1);
      MEMORY[0x1E4E3C540](v28, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }

    return 0;
  }
  id v32 = v69;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v69, v15, v16);
  os_log_type_t v33 = (void *)sub_1E0B05E28();
  uint64_t v34 = type metadata accessor for DateOfBirthItem();
  (*(void (**)(void))(v1 + *(int *)(v34 + 24)))();
  id v35 = (void *)sub_1E0B05F58();
  objc_super v36 = *(void (**)(char *, uint64_t))(v17 + 8);
  v36(v21, v16);
  id v37 = objc_msgSend(v33, sel_hk_ageWithCurrentDate_, v35);

  if (qword_1EAD61F20 != -1) {
    swift_once();
  }
  unint64_t v38 = (void *)qword_1EAD62758;
  uint64_t v39 = (void *)sub_1E0B06868();
  id v40 = objc_msgSend(v38, sel_stringFromNumber_, v39);

  if (!v40)
  {
    if (qword_1EAD61F10 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_1E0B06448();
    __swift_project_value_buffer(v58, (uint64_t)qword_1EAD62738);
    id v59 = sub_1E0B06428();
    os_log_type_t v60 = sub_1E0B068B8();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = swift_slowAlloc();
      uint64_t v62 = v36;
      uint64_t v63 = swift_slowAlloc();
      uint64_t v72 = v63;
      *(_DWORD *)uint64_t v61 = 136446723;
      uint64_t v71 = sub_1E0ACB6F4(0x6942664F65746144, 0xEF6D657449687472, &v72);
      sub_1E0B06A68();
      *(_WORD *)(v61 + 12) = 2082;
      uint64_t v71 = sub_1E0ACB6F4(0xD000000000000020, 0x80000001E0B0B770, &v72);
      sub_1E0B06A68();
      *(_WORD *)(v61 + 22) = 2049;
      uint64_t v71 = (uint64_t)v37;
      sub_1E0B06A68();
      _os_log_impl(&dword_1E0AC7000, v59, v60, "[%{public}s.%{public}s]: Unable to create age string from age: %{private}ld", (uint8_t *)v61, 0x20u);
      swift_arrayDestroy();
      uint64_t v64 = v63;
      objc_super v36 = v62;
      MEMORY[0x1E4E3C540](v64, -1, -1);
      uint64_t v65 = v61;
      id v32 = v69;
      MEMORY[0x1E4E3C540](v65, -1, -1);
    }

    v36(v32, v16);
    return 0;
  }
  v68 = v36;
  uint64_t v41 = sub_1E0B06798();
  uint64_t v43 = v42;

  uint64_t v44 = sub_1E0B05FC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v70, 1, 1, v44);
  sub_1E0AE74A4(0, &qword_1EAD627A8, (uint64_t (*)(uint64_t))sub_1E0AE7508, MEMORY[0x1E4FBBE00]);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1E0B07E50;
  if (qword_1EAD61F18 != -1) {
    swift_once();
  }
  id v46 = (void *)qword_1EAD62750;
  uint64_t v47 = (void *)sub_1E0B05F58();
  id v48 = objc_msgSend(v46, sel_stringFromDate_, v47);

  uint64_t v49 = sub_1E0B06798();
  uint64_t v51 = v50;

  char v52 = v32;
  uint64_t v53 = MEMORY[0x1E4FBB1A0];
  *(void *)(v45 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v54 = sub_1E0AE7560();
  *(void *)(v45 + 32) = v49;
  *(void *)(v45 + 40) = v51;
  *(void *)(v45 + 96) = v53;
  *(void *)(v45 + 104) = v54;
  *(void *)(v45 + 64) = v54;
  *(void *)(v45 + 72) = v41;
  *(void *)(v45 + 80) = v43;
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v55 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  uint64_t v56 = (uint64_t)v70;
  uint64_t v57 = sub_1E0B067A8();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E0AE75B4(v56, &qword_1EAD62790, MEMORY[0x1E4F27A78]);
  v68(v52, v16);
  return v57;
}

uint64_t sub_1E0AE6774()
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t *initializeBufferWithCopyOfBuffer for DateOfBirthItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1E0B05E48();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for DateOfBirthItem(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1E0B05E48();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  return swift_release();
}

void *initializeWithCopy for DateOfBirthItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1E0B05E48();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  return a1;
}

void *assignWithCopy for DateOfBirthItem(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E0B05E48();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for DateOfBirthItem(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E0B05E48();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for DateOfBirthItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1E0B05E48();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DateOfBirthItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0AE7190);
}

uint64_t sub_1E0AE7190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
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

uint64_t storeEnumTagSinglePayload for DateOfBirthItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0AE7298);
}

void sub_1E0AE7298(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1E0AE74A4(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

void sub_1E0AE7388()
{
  sub_1E0AE74A4(319, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1E0AE745C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1E0AE74A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1E0AE7508()
{
  unint64_t result = qword_1EAD627B0;
  if (!qword_1EAD627B0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD627B0);
  }
  return result;
}

unint64_t sub_1E0AE7560()
{
  unint64_t result = qword_1EAD627B8;
  if (!qword_1EAD627B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD627B8);
  }
  return result;
}

uint64_t sub_1E0AE75B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E0AE74A4(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.currentCountry.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AE7638(v1 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, a1);
}

uint64_t sub_1E0AE7638(uint64_t a1, uint64_t a2)
{
  sub_1E0AE769C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1E0AE769C()
{
  if (!qword_1EAD627C0)
  {
    sub_1E0B060E8();
    sub_1E0B060C8();
    sub_1E0AE8CF4(&qword_1EAD627C8, MEMORY[0x1E4F67348]);
    unint64_t v0 = sub_1E0B06C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD627C0);
    }
  }
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.__allocating_init(context:)(uint64_t a1)
{
  sub_1E0AE769C();
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v10[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0B06198();
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1E0B061B8();
  uint64_t v6 = sub_1E0B061A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
  uint64_t v7 = swift_allocObject();
  sub_1E0AE7924((uint64_t)v5, v7 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  return v7;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.__allocating_init(currentCountry:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1E0AE7924(a1, v2 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry);
  return v2;
}

uint64_t type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider()
{
  uint64_t result = qword_1EAD627E0;
  if (!qword_1EAD627E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.init(currentCountry:)(uint64_t a1)
{
  sub_1E0AE7924(a1, v1 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry);
  return v1;
}

uint64_t sub_1E0AE7924(uint64_t a1, uint64_t a2)
{
  sub_1E0AE769C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0AE7988@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4F65F28];
  uint64_t v3 = sub_1E0B06148();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

id sub_1E0AE79FC()
{
  return (id)*MEMORY[0x1E4F29DD8];
}

uint64_t sub_1E0AE7A0C()
{
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1E0B05E58();
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();

  id v4 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1E0B05E58();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();

  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  id v8 = (id)qword_1EBF0EAF0;
  uint64_t v9 = (void *)sub_1E0B06788();
  id v10 = objc_msgSend(self, sel_imageNamed_inBundle_, v9, v8, 0xE000000000000000);

  return MEMORY[0x1F411DE40](v1, v3, v5, v7, v10);
}

id sub_1E0AE7C14()
{
  id v0 = (void *)sub_1E0B06328();
  id v1 = objc_msgSend(v0, sel_areAllRequirementsSatisfied);

  return v1;
}

uint64_t sub_1E0AE7C60()
{
  uint64_t v1 = sub_1E0B06448();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v0;
  sub_1E0B06418();
  type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
  sub_1E0AE8CF4(&qword_1EAD627D0, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider);
  sub_1E0B060F8();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_1E0AE7DA4(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a3;
  uint64_t v8 = *v4;
  sub_1E0AE89E8();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v12);
  int v14 = (char *)&v19[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0B06108();
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  sub_1E0B06358();
  swift_getObjectType();
  sub_1E0B06798();
  sub_1E0B06928();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v18;
  *(void *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a1;
  *(unsigned char *)(v15 + 40) = a2;
  *(void *)(v15 + 48) = v8;
  swift_retain();
  id v16 = a1;
  sub_1E0B069F8();
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
}

uint64_t sub_1E0AE7F80(char a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  int v44 = a6;
  uint64_t v45 = a5;
  sub_1E0AE8C54();
  MEMORY[0x1F4188790](v12, v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AE89E8();
  uint64_t v42 = *(void *)(v16 - 8);
  uint64_t v43 = v16;
  MEMORY[0x1F4188790](v16, v17);
  uint64_t v41 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1E0B06448();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19, v21);
  uint64_t v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_1E0B06418();
    uint64_t v24 = sub_1E0B06428();
    os_log_type_t v25 = sub_1E0B068C8();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v40 = a7;
    if (v26)
    {
      uint64_t v39 = a4;
      uint64_t v27 = swift_slowAlloc();
      unint64_t v38 = a3;
      uint64_t v28 = (uint8_t *)v27;
      uint64_t v29 = swift_slowAlloc();
      v47[0] = v29;
      *(_DWORD *)uint64_t v28 = 136446210;
      id v37 = v28 + 4;
      uint64_t v30 = sub_1E0B06C58();
      uint64_t v46 = sub_1E0ACB6F4(v30, v31, v47);
      sub_1E0B06A68();
      a4 = v39;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AC7000, v24, v25, "[%{public}s] Notification defaults written and synced", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v29, -1, -1);
      id v32 = v28;
      a3 = v38;
      MEMORY[0x1E4E3C540](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    char v33 = v44;
    sub_1E0B06118();
    if (v33)
    {
      sub_1E0B06108();
      __swift_project_boxed_opaque_existential_1(v47, v47[3]);
      sub_1E0B06358();
      swift_getObjectType();
      uint64_t v34 = v41;
      sub_1E0B06938();
      id v35 = (void *)swift_allocObject();
      v35[2] = a3;
      v35[3] = a4;
      v35[4] = v40;
      swift_retain();
      sub_1E0B069F8();
      swift_unknownObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v43);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
    }
    sub_1E0B06178();
    sub_1E0AE8CF4(&qword_1EAD627F8, MEMORY[0x1E4F66030]);
    sub_1E0B06C38();
  }
  else
  {
    if (a2)
    {
      swift_getErrorValue();
      sub_1E0B06BE8();
    }
    else
    {
      v47[0] = 0;
      v47[1] = 0xE000000000000000;
      sub_1E0B06AC8();
      sub_1E0B067E8();
      sub_1E0B06C58();
      sub_1E0B067E8();
      swift_bridgeObjectRelease();
      sub_1E0B067E8();
    }
    sub_1E0B06168();
    swift_storeEnumTagMultiPayload();
  }
  a3(v15);
  return sub_1E0AE8D3C((uint64_t)v15, (uint64_t (*)(void))sub_1E0AE8C54);
}

uint64_t sub_1E0AE844C(char a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  sub_1E0AE8C54();
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E0B06448();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_1E0B06418();
    uint64_t v17 = sub_1E0B06428();
    os_log_type_t v18 = sub_1E0B068C8();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v29 = a4;
    if (v19)
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v28 = a3;
      uint64_t v22 = v21;
      v31[0] = v21;
      *(_DWORD *)uint64_t v20 = 136446210;
      uint64_t v27 = v20 + 4;
      uint64_t v23 = sub_1E0B06C58();
      uint64_t v30 = sub_1E0ACB6F4(v23, v24, v31);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AC7000, v17, v18, "[%{public}s] Onboarding acknowledged written and synced", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v22;
      a3 = v28;
      MEMORY[0x1E4E3C540](v25, -1, -1);
      MEMORY[0x1E4E3C540](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    sub_1E0B06178();
    sub_1E0AE8CF4(&qword_1EAD627F8, MEMORY[0x1E4F66030]);
    sub_1E0B06C38();
  }
  else
  {
    if (a2)
    {
      swift_getErrorValue();
      sub_1E0B06BE8();
    }
    else
    {
      v31[0] = 0;
      v31[1] = 0xE000000000000000;
      sub_1E0B06AC8();
      sub_1E0B067E8();
      sub_1E0B06C58();
      sub_1E0B067E8();
      swift_bridgeObjectRelease();
      sub_1E0B067E8();
    }
    sub_1E0B06168();
    swift_storeEnumTagMultiPayload();
  }
  a3(v11);
  return sub_1E0AE8D3C((uint64_t)v11, (uint64_t (*)(void))sub_1E0AE8C54);
}

uint64_t sub_1E0AE87C0()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.deinit()
{
  sub_1E0AE8D3C(v0 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, (uint64_t (*)(void))sub_1E0AE769C);
  return v0;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.__deallocating_deinit()
{
  sub_1E0AE8D3C(v0 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, (uint64_t (*)(void))sub_1E0AE769C);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1E0AE8880@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AE7638(*v1 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, a1);
}

uint64_t sub_1E0AE8898()
{
  return sub_1E0AE7A0C();
}

uint64_t sub_1E0AE88B0()
{
  uint64_t v1 = sub_1E0B06448();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[1] = *v0;
  sub_1E0B06418();
  type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
  sub_1E0B060F8();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_1E0AE89C4(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_1E0AE7DA4(a1, a2, a3, a4);
}

void sub_1E0AE89E8()
{
  if (!qword_1EAD627D8)
  {
    unint64_t v0 = sub_1E0B06958();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD627D8);
    }
  }
}

uint64_t sub_1E0AE8A40()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1E0AE8A80(char a1, uint64_t a2)
{
  return sub_1E0AE7F80(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_1E0AE8A94()
{
  return type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
}

void sub_1E0AE8A9C()
{
  sub_1E0AE769C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for WalkingSteadinessAdvertisableFeatureSourceProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessAdvertisableFeatureSourceProvider);
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.__allocating_init(currentCountry:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.identifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.featureIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.makeConfiguration(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.queue_determineShouldAdvertise(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.queue_performPrerequisiteWorkIfNecessary(_:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.queue_commitEnablement(_:enabled:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.determinePostCommitWorkItems(_:enabled:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void sub_1E0AE8C54()
{
  if (!qword_1EAD627F0)
  {
    sub_1E0B06178();
    sub_1E0AE8CF4(&qword_1EAD627F8, MEMORY[0x1E4F66030]);
    unint64_t v0 = sub_1E0B06C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD627F0);
    }
  }
}

uint64_t sub_1E0AE8CF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E0AE8D3C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E0AE8D9C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E0AE8DD4(char a1, uint64_t a2)
{
  return sub_1E0AE844C(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsDataSource()
{
  uint64_t result = qword_1EAD62800;
  if (!qword_1EAD62800) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0AE8E2C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1E0AE8E6C()
{
  uint64_t v0 = sub_1E0B05FB8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AE91B0();
  sub_1E0B06218();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1E0B08490;
  sub_1E0B02CF8((uint64_t)&unk_1F3B8D7A8);
  sub_1E0B05FA8();
  sub_1E0B05F98();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v4, v0);
  sub_1E0B06208();
  v7[0] = 0x3C53447961727241;
  v7[1] = 0xE800000000000000;
  sub_1E0B05FA8();
  sub_1E0B05F98();
  v5(v4, v0);
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  sub_1E0B067E8();
  return sub_1E0B061E8();
}

void sub_1E0AE907C()
{
}

void sub_1E0AE9098()
{
}

void sub_1E0AE90B4()
{
}

uint64_t sub_1E0AE90E0()
{
  uint64_t v0 = sub_1E0B061F8();
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1E0AE9110()
{
  return type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsDataSource();
}

uint64_t sub_1E0AE9118()
{
  return sub_1E0B06878();
}

unint64_t sub_1E0AE9158()
{
  unint64_t result = qword_1EAD62810;
  if (!qword_1EAD62810)
  {
    type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62810);
  }
  return result;
}

void sub_1E0AE91B0()
{
  if (!qword_1EAD62818)
  {
    sub_1E0B06218();
    unint64_t v0 = sub_1E0B06BA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62818);
    }
  }
}

uint64_t sub_1E0AE9208(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6E41746867696568;
  }
  else {
    uint64_t v3 = 0x6942664F65746164;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000687472;
  }
  else {
    unint64_t v4 = 0xEF74686769655764;
  }
  if (a2) {
    uint64_t v5 = 0x6E41746867696568;
  }
  else {
    uint64_t v5 = 0x6942664F65746164;
  }
  if (a2) {
    unint64_t v6 = 0xEF74686769655764;
  }
  else {
    unint64_t v6 = 0xEB00000000687472;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1E0B06BB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

HealthMobilityUI::WalkingSteadinessOnboardingAboutHealthDetailsItem_optional __swiftcall WalkingSteadinessOnboardingAboutHealthDetailsItem.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  uint64_t v3 = sub_1E0B06B88();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *BOOL v2 = v5;
  return result;
}

uint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.rawValue.getter()
{
  if (*v0) {
    return 0x6E41746867696568;
  }
  else {
    return 0x6942664F65746164;
  }
}

uint64_t sub_1E0AE9378(char *a1, char *a2)
{
  return sub_1E0AE9208(*a1, *a2);
}

uint64_t sub_1E0AE9384()
{
  return sub_1E0B06C28();
}

uint64_t sub_1E0AE941C()
{
  sub_1E0B067D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E0AE94A0()
{
  return sub_1E0B06C28();
}

HealthMobilityUI::WalkingSteadinessOnboardingAboutHealthDetailsItem_optional sub_1E0AE9534(Swift::String *a1)
{
  return WalkingSteadinessOnboardingAboutHealthDetailsItem.init(rawValue:)(*a1);
}

void sub_1E0AE9540(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6942664F65746164;
  if (*v1) {
    uint64_t v2 = 0x6E41746867696568;
  }
  unint64_t v3 = 0xEB00000000687472;
  if (*v1) {
    unint64_t v3 = 0xEF74686769655764;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.reuseIdentifier.getter()
{
  return 0xD000000000000031;
}

uint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.uniqueIdentifier.getter()
{
  sub_1E0AE966C();
  uint64_t v1 = sub_1E0B067B8();
  sub_1E0B067E8();
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1E0AE966C()
{
  unint64_t result = qword_1EAD62820;
  if (!qword_1EAD62820)
  {
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62820);
  }
  return result;
}

uint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.selectionStyle.getter()
{
  return 0;
}

unint64_t sub_1E0AE96B4()
{
  unint64_t result = qword_1EAD62828;
  if (!qword_1EAD62828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62828);
  }
  return result;
}

unint64_t sub_1E0AE9708()
{
  return 0xD000000000000031;
}

uint64_t sub_1E0AE9728()
{
  return 0;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingAboutHealthDetailsItem(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WalkingSteadinessOnboardingAboutHealthDetailsItem(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E0AE989CLL);
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

uint64_t sub_1E0AE98C4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E0AE98CC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsItem()
{
  return &type metadata for WalkingSteadinessOnboardingAboutHealthDetailsItem;
}

uint64_t sub_1E0AE98E8()
{
  if (*v0)
  {
    if (qword_1EAD61EC8 != -1) {
      swift_once();
    }
  }
  else if (qword_1EAD61EC8 != -1)
  {
    swift_once();
  }
  id v1 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_1E0AE9A30()
{
  if (*v0)
  {
    if (qword_1EAD61EC8 != -1) {
      swift_once();
    }
  }
  else if (qword_1EAD61EC8 != -1)
  {
    swift_once();
  }
  id v1 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_1E0AE9B78()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62830);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62830);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_1E0AE9C40(uint64_t a1, void *a2)
{
  sub_1E0AD3F94(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098((uint64_t)v5, v3);
  swift_endAccess();
  sub_1E0AE9CCC();
  return sub_1E0AEAC6C((uint64_t)v5, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
}

void sub_1E0AE9CCC()
{
  swift_getObjectType();
  uint64_t v1 = sub_1E0B06558();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  uint64_t v6 = (uint64_t)v0 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD3F94(v6, (uint64_t)v29);
  if (v30)
  {
    sub_1E0AEACC8(0, (unint64_t *)&qword_1EAD62298);
    sub_1E0AEACC8(0, &qword_1EAD62870);
    if (swift_dynamicCast())
    {
      if (*((void *)&v32 + 1))
      {
        uint64_t v7 = sub_1E0ACB27C(&v31, (uint64_t)v34);
        MEMORY[0x1E4E3BBD0](v7);
        uint64_t v8 = v35;
        uint64_t v9 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
        sub_1E0B06548();
        uint64_t v10 = v35;
        uint64_t v11 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v10, v11);
        sub_1E0B06498();
        *((void *)&v32 + 1) = v1;
        uint64_t v33 = MEMORY[0x1E4FB0F88];
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v31);
        (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v2 + 16))(boxed_opaque_existential_1, v5, v1);
        MEMORY[0x1E4E3BBC0](&v31);
        sub_1E0AEA59C();
        sub_1E0AD3F94(v6, (uint64_t)v29);
        if (v30)
        {
          sub_1E0AEACC8(0, (unint64_t *)&unk_1EAD62390);
          if (swift_dynamicCast())
          {
            if (*((void *)&v32 + 1))
            {
              __swift_project_boxed_opaque_existential_1(&v31, *((uint64_t *)&v32 + 1));
              uint64_t v13 = sub_1E0B062C8();
              uint64_t v15 = v14;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v31);
              if (v15) {
                uint64_t v16 = v13;
              }
              else {
                uint64_t v16 = 0;
              }
              goto LABEL_20;
            }
          }
          else
          {
            uint64_t v33 = 0;
            long long v31 = 0u;
            long long v32 = 0u;
          }
        }
        else
        {
          sub_1E0AEAC6C((uint64_t)v29, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v33 = 0;
        }
        sub_1E0AEAC6C((uint64_t)&v31, &qword_1EAD62388, (unint64_t *)&unk_1EAD62390);
        uint64_t v16 = 0;
        uint64_t v15 = 0;
LABEL_20:
        sub_1E0AEA83C(v16, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v5, v1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
        return;
      }
    }
    else
    {
      uint64_t v33 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
    }
  }
  else
  {
    sub_1E0AEAC6C((uint64_t)v29, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v33 = 0;
  }
  sub_1E0AEAC6C((uint64_t)&v31, &qword_1EAD62868, &qword_1EAD62870);
  if (qword_1EAD61F30 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1E0B06448();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EAD62830);
  id v18 = v0;
  BOOL v19 = sub_1E0B06428();
  os_log_type_t v20 = sub_1E0B068A8();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v34[0] = v22;
    *(_DWORD *)uint64_t v21 = 136446722;
    uint64_t v23 = sub_1E0B06C58();
    *(void *)&long long v31 = sub_1E0ACB6F4(v23, v24, v34);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2082;
    *(void *)&long long v31 = sub_1E0ACB6F4(1835365481, 0xE400000000000000, v34);
    sub_1E0B06A68();
    *(_WORD *)(v21 + 22) = 2082;
    sub_1E0AEABB8(0, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
    *(void *)&long long v31 = v25;
    sub_1E0AD47A0();
    uint64_t v26 = sub_1E0B067B8();
    *(void *)&long long v31 = sub_1E0ACB6F4(v26, v27, v34);
    sub_1E0B06A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v19, v20, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that did not conform to TitleValueProviding", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v22, -1, -1);
    MEMORY[0x1E4E3C540](v21, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1E0AEA278@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a1);
}

uint64_t sub_1E0AEA2CC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098(a1, v3);
  swift_endAccess();
  sub_1E0AE9CCC();
  return sub_1E0AEAC6C(a1, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
}

void (*sub_1E0AEA354(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1E0AEA3B4;
}

void sub_1E0AEA3B4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1E0AE9CCC();
  }
}

uint64_t type metadata accessor for TitleValueTableViewCell()
{
  return self;
}

id sub_1E0AEA59C()
{
  sub_1E0AEAB60();
  MEMORY[0x1F4188790](v1 - 8, v2);
  uint64_t v4 = (char *)&v16[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E0B06558();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v5, v7);
  uint64_t v10 = (char *)&v16[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E4E3BBB0](v16, v8);
  if (!v17)
  {
    sub_1E0AEAC6C((uint64_t)v16, &qword_1EAD62858, &qword_1EAD62860);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    return (id)sub_1E0AEAC10((uint64_t)v4);
  }
  sub_1E0AEACC8(0, &qword_1EAD62860);
  int v11 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, v11 ^ 1u, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return (id)sub_1E0AEAC10((uint64_t)v4);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v4, v5);
  id result = objc_msgSend(v0, sel_tintColor);
  if (result)
  {
    uint64_t v13 = (void (*)(uint64_t *, void))sub_1E0B06518();
    sub_1E0B064D8();
    v13(v16, 0);
    uint64_t v17 = v5;
    uint64_t v18 = MEMORY[0x1E4FB0F88];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 16))(boxed_opaque_existential_1, v10, v5);
    MEMORY[0x1E4E3BBC0](v16);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1E0AEA83C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1E0AD4398();
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1E0B08740;
    *(void *)(v5 + 32) = a1;
    *(void *)(v5 + 40) = a2;
    *(void *)(v5 + 48) = 0x6C6156656C746954;
    *(void *)(v5 + 56) = 0xEA00000000006575;
    *(void *)(v5 + 64) = 1819043139;
    *(void *)(v5 + 72) = 0xE400000000000000;
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)sub_1E0B06818();
    swift_bridgeObjectRelease();
    id v7 = (id)HKUIJoinStringsForAutomationIdentifier();

    objc_msgSend(v2, sel_setAccessibilityIdentifier_, v7);
  }
  else
  {
    objc_msgSend(v2, sel_setAccessibilityIdentifier_, 0);
  }
}

id TitleValueTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1E0AEA9D0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1E0AEA9F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a2);
}

uint64_t dispatch thunk of TitleValueProviding.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TitleValueProviding.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for TitleValueTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TitleValueTableViewCell);
}

uint64_t dispatch thunk of TitleValueTableViewCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TitleValueTableViewCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TitleValueTableViewCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TitleValueTableViewCell.updateAutomationIdentifiers(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

void sub_1E0AEAB60()
{
  if (!qword_1EAD62850)
  {
    sub_1E0B06558();
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62850);
    }
  }
}

void sub_1E0AEABB8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1E0AEACC8(255, a3);
    unint64_t v4 = sub_1E0B06A58();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1E0AEAC10(uint64_t a1)
{
  sub_1E0AEAB60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E0AEAC6C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1E0AEABB8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1E0AEACC8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t ConfirmDetailsModel.__allocating_init(valueFormatter:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  uint64_t v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1E0ACB27C(a1, v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  return v2;
}

uint64_t sub_1E0AEADD8()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62878);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62878);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_1E0AEAEA0()
{
  if (*v0)
  {
    if (*v0 != 1) {
      goto LABEL_7;
    }
    uint64_t v1 = (void *)sub_1E0B06818();
    id v2 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v2)
    {
LABEL_8:
      sub_1E0B06798();

      return;
    }
    __break(1u);
  }
  uint64_t v3 = (void *)sub_1E0B06818();
  id v2 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v2) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_7:
  uint64_t v4 = (void *)sub_1E0B06818();
  id v2 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v2) {
    goto LABEL_8;
  }
  __break(1u);
}

HealthMobilityUI::ConfirmDetailsModel::Row::HealthDetail_optional __swiftcall ConfirmDetailsModel.Row.HealthDetail.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (HealthMobilityUI::ConfirmDetailsModel::Row::HealthDetail_optional)rawValue;
}

uint64_t ConfirmDetailsModel.Row.HealthDetail.rawValue.getter()
{
  return *v0;
}

BOOL sub_1E0AEAFA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

HealthMobilityUI::ConfirmDetailsModel::Row::HealthDetail_optional sub_1E0AEAFBC(Swift::Int *a1)
{
  return ConfirmDetailsModel.Row.HealthDetail.init(rawValue:)(*a1);
}

void sub_1E0AEAFC4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1E0AEAFD0()
{
  return sub_1E0B06C28();
}

uint64_t sub_1E0AEB018()
{
  return sub_1E0B06C18();
}

uint64_t sub_1E0AEB044()
{
  return sub_1E0B06C28();
}

uint64_t sub_1E0AEB088@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, char *a3@<X8>)
{
  uint64_t v5 = *a2;
  if (sub_1E0B06088())
  {
    uint64_t v6 = sub_1E0B06098();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    char v8 = -4;
LABEL_10:
    *a3 = v8;
    return result;
  }
  uint64_t v9 = sub_1E0B06078();
  uint64_t v10 = sub_1E0B06098();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  if (v5 == 3) {
    goto LABEL_7;
  }
  if (v5 + 1 == v9)
  {
    char v8 = v5 | 0x80;
    goto LABEL_10;
  }
  uint64_t v11 = v9 > v5;
  BOOL v12 = __OFSUB__(v9, v11);
  v9 -= v11;
  if (!v12)
  {
LABEL_7:
    if ((unint64_t)v9 >= 3) {
      char v8 = -4;
    }
    else {
      char v8 = v9;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t ConfirmDetailsModel.Row.hash(into:)()
{
  return sub_1E0B06C18();
}

BOOL static ConfirmDetailsModel.Row.== infix(_:_:)(unsigned __int8 *a1, char *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if ((v2 & 0x80u) == 0) {
    BOOL v4 = v3 >= 0;
  }
  else {
    BOOL v4 = v3 < 0;
  }
  return v2 == v3 && v4;
}

uint64_t ConfirmDetailsModel.Row.hashValue.getter()
{
  return sub_1E0B06C28();
}

uint64_t sub_1E0AEB248()
{
  return sub_1E0B06C28();
}

uint64_t sub_1E0AEB2A0()
{
  return sub_1E0B06C18();
}

uint64_t sub_1E0AEB2E4()
{
  return sub_1E0B06C28();
}

BOOL sub_1E0AEB338(unsigned __int8 *a1, char *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if ((v2 & 0x80u) == 0) {
    BOOL v4 = v3 >= 0;
  }
  else {
    BOOL v4 = v3 < 0;
  }
  return v2 == v3 && v4;
}

uint64_t sub_1E0AEB364()
{
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  uint64_t v4 = MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v4, v7);
  uint64_t v10 = (char *)&v31 - v9;
  MEMORY[0x1F4188790](v8, v11);
  uint64_t v13 = (char *)&v31 - v12;
  sub_1E0AEC08C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], v1);
  MEMORY[0x1F4188790](v14 - 8, v15);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEBCEC(v18, (uint64_t)v13, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  uint64_t v19 = type metadata accessor for ConfirmDetailsProvider.Details();
  os_log_type_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48);
  if (v20(v13, 1, v19))
  {
    sub_1E0AEBC7C((uint64_t)v13, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
    uint64_t v21 = sub_1E0B05E48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 1, 1, v21);
LABEL_4:
    uint64_t v23 = &qword_1EAD623D8;
    unint64_t v24 = (uint64_t (*)())MEMORY[0x1E4F26F90];
    uint64_t v25 = (uint64_t)v17;
LABEL_5:
    sub_1E0AEBC7C(v25, v23, (uint64_t (*)(uint64_t))v24);
    return 0;
  }
  sub_1E0AEBCEC((uint64_t)v13, (uint64_t)v17, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  sub_1E0AEBC7C((uint64_t)v13, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  uint64_t v22 = sub_1E0B05E48();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v17, 1, v22) == 1) {
    goto LABEL_4;
  }
  sub_1E0AEBC7C((uint64_t)v17, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  sub_1E0AEBCEC(v18, (uint64_t)v10, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (v20(v10, 1, v19))
  {
    uint64_t v23 = (unint64_t *)&qword_1EAD62118;
    unint64_t v24 = type metadata accessor for ConfirmDetailsProvider.Details;
    uint64_t v25 = (uint64_t)v10;
    goto LABEL_5;
  }
  unint64_t v27 = *(void **)&v10[*(int *)(v19 + 24)];
  id v28 = v27;
  sub_1E0AEBC7C((uint64_t)v10, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (!v27) {
    return 0;
  }

  sub_1E0AEBCEC(v18, (uint64_t)v6, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (v20(v6, 1, v19))
  {
    uint64_t v23 = (unint64_t *)&qword_1EAD62118;
    unint64_t v24 = type metadata accessor for ConfirmDetailsProvider.Details;
    uint64_t v25 = (uint64_t)v6;
    goto LABEL_5;
  }
  uint64_t v29 = *(void **)&v6[*(int *)(v19 + 20)];
  id v30 = v29;
  sub_1E0AEBC7C((uint64_t)v6, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (!v29) {
    return 0;
  }

  return 1;
}

uint64_t sub_1E0AEB7D4()
{
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v0 + 16);
}

uint64_t sub_1E0AEB81C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1E0AEB880(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4E3C5D0](v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_1E0AEB900;
}

void sub_1E0AEB900(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 24) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_1E0AEB984(uint64_t a1, void *a2)
{
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v10 - v6;
  sub_1E0AEBCEC(a1, (uint64_t)&v10 - v6, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEE108((uint64_t)v7, v8, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  return swift_endAccess();
}

uint64_t sub_1E0AEBA8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1E0AEBCEC(v3, a1, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
}

uint64_t sub_1E0AEBAFC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEE108(a1, v3, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  return swift_endAccess();
}

uint64_t (*sub_1E0AEBB74())()
{
  return j__swift_endAccess;
}

uint64_t ConfirmDetailsModel.init(valueFormatter:)(long long *a1)
{
  *(void *)(v1 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  uint64_t v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1E0ACB27C(a1, v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  return v1;
}

uint64_t sub_1E0AEBC7C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E0AEC08C(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1E0AEBCEC(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_1E0AEC08C(0, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1E0AEBD6C(uint64_t a1)
{
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v14 - v5;
  sub_1E0AD8F98(a1, (uint64_t)&v14 - v5);
  uint64_t v7 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v8 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v6, 0, 1, v7);
  uint64_t v9 = (uint64_t)v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEE108((uint64_t)v6, v9, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  swift_endAccess();
  sub_1E0AD8F98(a1, (uint64_t)v6);
  v8(v6, 0, 1, v7);
  uint64_t v10 = (*(uint64_t (**)(char *))(*v1 + 208))(v6);
  sub_1E0AEBC7C((uint64_t)v6, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  *((unsigned char *)v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  swift_beginAccess();
  if (!MEMORY[0x1E4E3C5D0](v1 + 2)) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v11 = v1[3];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v10, ObjectType, v11);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_1E0AEBF9C(uint64_t a1)
{
  sub_1E0AEC08C(0, &qword_1EAD628A0, (uint64_t (*)(uint64_t))sub_1E0AEC0F0, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E0B08490;
  *(void *)(inited + 32) = &unk_1F3B8D748;
  uint64_t v7 = v1;
  uint64_t v8 = a1;
  uint64_t v4 = sub_1E0AEC1A0((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1E0AEC148, (uint64_t)&v6, inited);
  swift_setDeallocating();
  sub_1E0AEC0F0();
  swift_arrayDestroy();
  return v4;
}

void sub_1E0AEC08C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1E0AEC0F0()
{
  if (!qword_1EAD628A8)
  {
    unint64_t v0 = sub_1E0B06838();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD628A8);
    }
  }
}

uint64_t sub_1E0AEC148@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  v6[1] = *(_OWORD *)(v2 + 16);
  uint64_t result = sub_1E0AEC2CC((void (*)(void *__return_ptr, char *))sub_1E0AEF79C, (uint64_t)v6, v4);
  *a2 = result;
  return result;
}

uint64_t sub_1E0AEC1A0(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v16 = MEMORY[0x1E4FBC860];
    sub_1E0AF6434(0, v5, 0);
    uint64_t v6 = v16;
    for (unint64_t i = (uint64_t *)(a3 + 32); ; ++i)
    {
      uint64_t v14 = *i;
      swift_bridgeObjectRetain();
      a1(&v15, &v14);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      uint64_t v10 = v15;
      uint64_t v16 = v6;
      unint64_t v12 = *(void *)(v6 + 16);
      unint64_t v11 = *(void *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_1E0AF6434(v11 > 1, v12 + 1, 1);
        uint64_t v6 = v16;
      }
      *(void *)(v6 + 16) = v12 + 1;
      *(void *)(v6 + 8 * v12 + 32) = v10;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1E0AEC2CC(void (*a1)(void *__return_ptr, char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v20[1] = a2;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v25 = MEMORY[0x1E4FBC860];
    sub_1E0AF6624(0, v5, 0);
    uint64_t v6 = v25;
    uint64_t v9 = (char *)(a3 + 32);
    while (1)
    {
      char v10 = *v9++;
      char v21 = v10;
      a1(v22, &v21);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v25 = v6;
      unint64_t v12 = *(void *)(v6 + 16);
      unint64_t v11 = *(void *)(v6 + 24);
      if (v12 >= v11 >> 1) {
        sub_1E0AF6624(v11 > 1, v12 + 1, 1);
      }
      uint64_t v13 = v23;
      uint64_t v14 = v24;
      uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
      MEMORY[0x1F4188790](v15, v15);
      uint64_t v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v18 + 16))(v17);
      sub_1E0AEE188(v12, (uint64_t)v17, &v25, v13, v14);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
      uint64_t v6 = v25;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

void sub_1E0AEC488(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v101 = a1;
  uint64_t v99 = *v1;
  uint64_t v3 = sub_1E0B06098();
  uint64_t v100 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3, v4);
  v98 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5, v7);
  v95 = (char *)&v90 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  v94 = (char *)&v90 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11, v13);
  v96 = (char *)&v90 - v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14, v16);
  v93 = (char *)&v90 - v18;
  MEMORY[0x1F4188790](v17, v19);
  char v21 = (char *)&v90 - v20;
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  uint64_t v24 = MEMORY[0x1F4188790](v22 - 8, v23);
  uint64_t v97 = (uint64_t)&v90 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24, v26);
  id v28 = (char *)&v90 - v27;
  uint64_t v29 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29, v31);
  uint64_t v33 = (char *)&v90 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = (uint64_t)v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEBCEC(v34, (uint64_t)v28, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) != 1)
  {
    v92 = v33;
    sub_1E0AEE360((uint64_t)v28, (uint64_t)v33, (uint64_t (*)(void))type metadata accessor for ConfirmDetailsProvider.Details);
    uint64_t v42 = v100;
    uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
    uint64_t v91 = v3;
    v43(v21, v101, v3);
    uint64_t v44 = OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker;
    v102[0] = *((unsigned char *)v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
    sub_1E0AEB088((uint64_t)v21, v102, (char *)v103);
    uint64_t v45 = LOBYTE(v103[0]);
    uint64_t v46 = v42;
    if (LOBYTE(v103[0]) <= 0xFBu)
    {
      if ((v103[0] & 0x80) != 0)
      {
        if (qword_1EAD61F38 != -1) {
          swift_once();
        }
        uint64_t v67 = sub_1E0B06448();
        __swift_project_value_buffer(v67, (uint64_t)qword_1EAD62878);
        v68 = sub_1E0B06428();
        os_log_type_t v69 = sub_1E0B068B8();
        if (os_log_type_enabled(v68, v69))
        {
          uint64_t v70 = swift_slowAlloc();
          uint64_t v71 = swift_slowAlloc();
          v103[0] = v71;
          *(_DWORD *)uint64_t v70 = 136446722;
          uint64_t v72 = sub_1E0B06C58();
          *(void *)v102 = sub_1E0ACB6F4(v72, v73, v103);
          sub_1E0B06A68();
          swift_bridgeObjectRelease();
          *(_WORD *)(v70 + 12) = 2082;
          *(void *)v102 = sub_1E0ACB6F4(0xD000000000000014, 0x80000001E0B0BC70, v103);
          sub_1E0B06A68();
          *(_WORD *)(v70 + 22) = 2082;
          v102[0] = v45 & 0x7F;
          uint64_t v74 = sub_1E0B067B8();
          *(void *)v102 = sub_1E0ACB6F4(v74, v75, v103);
          sub_1E0B06A68();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1E0AC7000, v68, v69, "[%{public}s.%{public}s]: Should not be able to tap on picker %{public}s", (uint8_t *)v70, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x1E4E3C540](v71, -1, -1);
          MEMORY[0x1E4E3C540](v70, -1, -1);
        }
      }
      else
      {
        uint64_t v60 = *((unsigned __int8 *)v2 + v44);
        if (v60 == 3)
        {
          *((unsigned char *)v2 + v44) = v103[0];
          uint64_t v61 = v96;
          MEMORY[0x1E4E3B320](v45 + 1, 0);
          v102[0] = v45 | 0x80;
          uint64_t v62 = (uint64_t)v92;
          uint64_t v63 = v97;
          sub_1E0AD8F98((uint64_t)v92, v97);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v63, 0, 1, v29);
          sub_1E0AED294(v102, v63, v103);
          sub_1E0AEBC7C(v63, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
          swift_beginAccess();
          if (MEMORY[0x1E4E3C5D0](v2 + 2))
          {
            uint64_t v64 = v2[3];
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(uint64_t *, char *, uint64_t, uint64_t))(v64 + 16))(v103, v61, ObjectType, v64);
            swift_unknownObjectRelease();
          }
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v103);
          (*(void (**)(char *, uint64_t))(v46 + 8))(v61, v91);
          uint64_t v66 = v62;
          goto LABEL_28;
        }
        if (LOBYTE(v103[0]) != v60)
        {
          uint64_t v79 = v94;
          MEMORY[0x1E4E3B320](v60 + 1, 0);
          *((unsigned char *)v2 + v44) = v45;
          uint64_t v80 = v95;
          MEMORY[0x1E4E3B320](v45 + 1, 0);
          v102[0] = v45 | 0x80;
          uint64_t v81 = (uint64_t)v92;
          uint64_t v82 = v97;
          sub_1E0AD8F98((uint64_t)v92, v97);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v82, 0, 1, v29);
          sub_1E0AED294(v102, v82, v103);
          sub_1E0AEBC7C(v82, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
          swift_beginAccess();
          if (MEMORY[0x1E4E3C5D0](v2 + 2))
          {
            uint64_t v83 = v2[3];
            uint64_t v84 = swift_getObjectType();
            (*(void (**)(char *, uint64_t, uint64_t))(v83 + 24))(v79, v84, v83);
            swift_unknownObjectRelease();
          }
          uint64_t v85 = MEMORY[0x1E4E3C5D0](v2 + 2);
          uint64_t v86 = v91;
          if (v85)
          {
            uint64_t v87 = v2[3];
            uint64_t v88 = swift_getObjectType();
            (*(void (**)(uint64_t *, char *, uint64_t, uint64_t))(v87 + 16))(v103, v80, v88, v87);
            swift_unknownObjectRelease();
          }
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v103);
          v89 = *(void (**)(char *, uint64_t))(v42 + 8);
          v89(v80, v86);
          v89(v79, v86);
          uint64_t v66 = v81;
          goto LABEL_28;
        }
        *((unsigned char *)v2 + v44) = 3;
        uint64_t v76 = v93;
        MEMORY[0x1E4E3B320](v45 + 1, 0);
        swift_beginAccess();
        if (MEMORY[0x1E4E3C5D0](v2 + 2))
        {
          uint64_t v77 = v2[3];
          uint64_t v78 = swift_getObjectType();
          (*(void (**)(char *, uint64_t, uint64_t))(v77 + 24))(v76, v78, v77);
          swift_unknownObjectRelease();
        }
        (*(void (**)(char *, uint64_t))(v42 + 8))(v76, v91);
      }
    }
    else
    {
      uint64_t v47 = v42;
      if (qword_1EAD61F38 != -1) {
        swift_once();
      }
      uint64_t v48 = sub_1E0B06448();
      __swift_project_value_buffer(v48, (uint64_t)qword_1EAD62878);
      uint64_t v49 = v98;
      uint64_t v50 = v91;
      v43(v98, v101, v91);
      uint64_t v51 = sub_1E0B06428();
      os_log_type_t v52 = sub_1E0B068B8();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = v49;
        uint64_t v54 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        v103[0] = v55;
        *(_DWORD *)uint64_t v54 = 136446722;
        uint64_t v56 = sub_1E0B06C58();
        *(void *)v102 = sub_1E0ACB6F4(v56, v57, v103);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v54 + 12) = 2082;
        *(void *)v102 = sub_1E0ACB6F4(0xD000000000000014, 0x80000001E0B0BC70, v103);
        sub_1E0B06A68();
        *(_WORD *)(v54 + 22) = 2082;
        sub_1E0AEE318(&qword_1EAD628B0, MEMORY[0x1E4F27DE8]);
        uint64_t v58 = sub_1E0B06B98();
        *(void *)v102 = sub_1E0ACB6F4(v58, v59, v103);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v53, v50);
        _os_log_impl(&dword_1E0AC7000, v51, v52, "[%{public}s.%{public}s]: Unable to determine row for index path %{public}s", (uint8_t *)v54, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1E4E3C540](v55, -1, -1);
        MEMORY[0x1E4E3C540](v54, -1, -1);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v42 + 8))(v49, v50);
      }
    }
    uint64_t v66 = (uint64_t)v92;
LABEL_28:
    sub_1E0AEE0AC(v66);
    return;
  }
  sub_1E0AEBC7C((uint64_t)v28, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (qword_1EAD61F38 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_1E0B06448();
  __swift_project_value_buffer(v35, (uint64_t)qword_1EAD62878);
  uint64_t v36 = sub_1E0B06428();
  os_log_type_t v37 = sub_1E0B068A8();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v103[0] = v39;
    *(_DWORD *)uint64_t v38 = 136446466;
    uint64_t v40 = sub_1E0B06C58();
    *(void *)v102 = sub_1E0ACB6F4(v40, v41, v103);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2082;
    *(void *)v102 = sub_1E0ACB6F4(0xD000000000000014, 0x80000001E0B0BC70, v103);
    sub_1E0B06A68();
    _os_log_impl(&dword_1E0AC7000, v36, v37, "[%{public}s.%{public}s]: Attempted to change details before we received them.", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v39, -1, -1);
    MEMORY[0x1E4E3C540](v38, -1, -1);
  }
}

void (*sub_1E0AED13C@<X0>(char *a1@<X0>, uint64_t a2@<X8>))(unsigned char *, void)
{
  uint64_t v5 = sub_1E0B06098();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v10 = *a1;
  if (v10 < 0) {
    unsigned __int8 v11 = (v10 & 0x7F) + 1;
  }
  else {
    unsigned __int8 v11 = v10;
  }
  MEMORY[0x1E4E3B320](v11, 0);
  uint64_t v12 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v12 == 3 || v10 < 0) {
    return (void (*)(unsigned char *, void))(*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v6 + 32))(a2, v9, v5);
  }
  uint64_t v13 = sub_1E0B06078() > v12;
  uint64_t result = (void (*)(unsigned char *, void))sub_1E0B06068();
  if (!__OFADD__(*v15, v13))
  {
    *v15 += v13;
    result(v16, 0);
    return (void (*)(unsigned char *, void))(*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v6 + 32))(a2, v9, v5);
  }
  __break(1u);
  return result;
}

_OWORD *sub_1E0AED294@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v113 = a3;
  uint64_t v114 = a2;
  v115 = a1;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  uint64_t v6 = MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v8 = (char *)&v111 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v6, v9);
  uint64_t v12 = (char *)&v111 - v11;
  uint64_t v14 = MEMORY[0x1F4188790](v10, v13);
  uint64_t v16 = (char *)&v111 - v15;
  uint64_t v18 = MEMORY[0x1F4188790](v14, v17);
  uint64_t v20 = (char *)&v111 - v19;
  uint64_t v22 = MEMORY[0x1F4188790](v18, v21);
  uint64_t v24 = (char *)&v111 - v23;
  MEMORY[0x1F4188790](v22, v25);
  uint64_t v27 = (char *)&v111 - v26;
  sub_1E0AEC08C(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], v3);
  uint64_t v30 = MEMORY[0x1F4188790](v28 - 8, v29);
  uint64_t v32 = (char *)&v111 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v30, v33);
  uint64_t v35 = (char *)&v111 - v34;
  uint64_t v36 = type metadata accessor for DateOfBirthItem();
  MEMORY[0x1F4188790](v36, v37);
  uint64_t v39 = (uint64_t *)((char *)&v111 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v40 = *v115;
  if ((char)*v115 < 0)
  {
    int v43 = v40 & 0x7F;
    if (v43)
    {
      if (v43 == 1)
      {
        sub_1E0AEBCEC(v114, (uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        uint64_t v44 = type metadata accessor for ConfirmDetailsProvider.Details();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 48))(v16, 1, v44) == 1)
        {
          sub_1E0AEBC7C((uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
          uint64_t v45 = 0;
        }
        else
        {
          uint64_t v45 = *(void **)&v16[*(int *)(v44 + 20)];
          id v71 = v45;
          sub_1E0AEE0AC((uint64_t)v16);
        }
        sub_1E0ACC180(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116);
        uint64_t v72 = (objc_class *)type metadata accessor for WeightPickerItem();
        id v73 = objc_allocWithZone(v72);
        uint64_t v74 = (char *)sub_1E0AF0458(v45, (uint64_t)v116);

        unint64_t v75 = &v74[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate];
        swift_beginAccess();
        *((void *)v75 + 1) = &protocol witness table for ConfirmDetailsModel;
        swift_unknownObjectWeakAssign();
        char v119 = 1;
        sub_1E0AEAEA0();
        uint64_t v77 = v76;
        uint64_t v79 = v78;
        uint64_t v80 = &v74[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier];
        swift_beginAccess();
        *(void *)uint64_t v80 = v77;
        *((void *)v80 + 1) = v79;
        swift_bridgeObjectRelease();
        uint64_t v81 = v113;
        v113[3] = v72;
        uint64_t result = (_OWORD *)sub_1E0AEE318(&qword_1EAD628C8, (void (*)(uint64_t))type metadata accessor for WeightPickerItem);
        v81[4] = result;
        *uint64_t v81 = v74;
      }
      else
      {
        uint64_t v53 = (uint64_t)v12;
        sub_1E0AEBCEC(v114, (uint64_t)v12, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        uint64_t v54 = type metadata accessor for ConfirmDetailsProvider.Details();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48))(v12, 1, v54) == 1)
        {
          sub_1E0AEBC7C((uint64_t)v12, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
          uint64_t v55 = 0;
        }
        else
        {
          uint64_t v55 = *(void **)&v12[*(int *)(v54 + 24)];
          id v95 = v55;
          sub_1E0AEE0AC(v53);
        }
        v96 = v113;
        sub_1E0ACC180(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116);
        uint64_t v97 = (objc_class *)type metadata accessor for HeightPickerItem();
        v98 = objc_allocWithZone(v97);
        *(void *)&v98[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate + 8] = 0;
        swift_unknownObjectWeakInit();
        uint64_t v99 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight;
        *(void *)&v98[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight] = 0;
        v98[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits] = 2;
        uint64_t v100 = &v98[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
        *uint64_t v100 = 0;
        v100[1] = 0;
        uint64_t v101 = *(void **)&v98[v99];
        *(void *)&v98[v99] = v55;
        v102 = v98;
        id v103 = v55;

        sub_1E0ACC180((uint64_t)v116, (uint64_t)&v102[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter]);
        v118.receiver = v102;
        v118.super_class = v97;
        v104 = (char *)objc_msgSendSuper2(&v118, sel_init);

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v116);
        v105 = &v104[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate];
        swift_beginAccess();
        *((void *)v105 + 1) = &protocol witness table for ConfirmDetailsModel;
        swift_unknownObjectWeakAssign();
        char v119 = 2;
        sub_1E0AEAEA0();
        uint64_t v107 = v106;
        uint64_t v109 = v108;
        v110 = &v104[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
        swift_beginAccess();
        *(void *)v110 = v107;
        *((void *)v110 + 1) = v109;
        swift_bridgeObjectRelease();
        v96[3] = v97;
        uint64_t result = (_OWORD *)sub_1E0AEE318(&qword_1EAD628C0, (void (*)(uint64_t))type metadata accessor for HeightPickerItem);
        v96[4] = result;
        void *v96 = v104;
      }
    }
    else
    {
      sub_1E0AEBCEC(v114, (uint64_t)v8, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      uint64_t v50 = type metadata accessor for ConfirmDetailsProvider.Details();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v50 - 8) + 48))(v8, 1, v50) == 1)
      {
        sub_1E0AEBC7C((uint64_t)v8, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        uint64_t v51 = sub_1E0B05E48();
        uint64_t v52 = (uint64_t)v32;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v32, 1, 1, v51);
      }
      else
      {
        uint64_t v52 = (uint64_t)v32;
        sub_1E0AEBCEC((uint64_t)v8, (uint64_t)v32, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
        sub_1E0AEE0AC((uint64_t)v8);
      }
      uint64_t v82 = v113;
      uint64_t v83 = *MEMORY[0x1E4F2BF88];
      uint64_t v84 = type metadata accessor for BirthdayPickerItem();
      uint64_t v85 = (void *)swift_allocObject();
      v85[5] = 0;
      v85[3] = 0;
      v85[2] = 0;
      swift_unknownObjectWeakInit();
      uint64_t v86 = (char *)v85 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
      uint64_t v87 = sub_1E0B06048();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56))(v86, 1, 1, v87);
      uint64_t v88 = (uint64_t)v85 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
      uint64_t v89 = sub_1E0B05E48();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v88, 1, 1, v89);
      swift_beginAccess();
      sub_1E0AEE108(v52, v88, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
      swift_endAccess();
      *(void *)((char *)v85 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge) = v83;
      uint64_t v90 = (uint64_t (**)())((char *)v85 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
      *uint64_t v90 = sub_1E0AE5704;
      v90[1] = 0;
      swift_beginAccess();
      v85[5] = &protocol witness table for ConfirmDetailsModel;
      swift_unknownObjectWeakAssign();
      char v119 = 0;
      sub_1E0AEAEA0();
      uint64_t v92 = v91;
      uint64_t v94 = v93;
      swift_beginAccess();
      v85[2] = v92;
      v85[3] = v94;
      swift_bridgeObjectRelease();
      v82[3] = v84;
      uint64_t result = (_OWORD *)sub_1E0AEE318(&qword_1EAD628B8, (void (*)(uint64_t))type metadata accessor for BirthdayPickerItem);
      v82[4] = result;
      *uint64_t v82 = v85;
    }
  }
  else if (*v115)
  {
    if (v40 == 1)
    {
      sub_1E0AEBCEC(v114, (uint64_t)v24, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      uint64_t v41 = type metadata accessor for ConfirmDetailsProvider.Details();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48))(v24, 1, v41) == 1)
      {
        sub_1E0AEBC7C((uint64_t)v24, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        uint64_t v42 = 0;
      }
      else
      {
        uint64_t v42 = *(void **)&v24[*(int *)(v41 + 20)];
        id v56 = v42;
        sub_1E0AEE0AC((uint64_t)v24);
      }
      unint64_t v57 = v113;
      sub_1E0ACC180(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116 + 8);
      *(void *)&v116[0] = v42;
      char v119 = 1;
      sub_1E0AEAEA0();
      *(void *)&long long v117 = v58;
      *((void *)&v117 + 1) = v59;
      v57[3] = &type metadata for WeightItem;
      v57[4] = sub_1E0AEE278();
    }
    else
    {
      sub_1E0AEBCEC(v114, (uint64_t)v20, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      uint64_t v48 = type metadata accessor for ConfirmDetailsProvider.Details();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v48 - 8) + 48))(v20, 1, v48) == 1)
      {
        sub_1E0AEBC7C((uint64_t)v20, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        uint64_t v49 = 0;
      }
      else
      {
        uint64_t v49 = *(void **)&v20[*(int *)(v48 + 24)];
        id v66 = v49;
        sub_1E0AEE0AC((uint64_t)v20);
      }
      unint64_t v57 = v113;
      sub_1E0ACC180(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116 + 8);
      *(void *)&v116[0] = v49;
      char v119 = 2;
      sub_1E0AEAEA0();
      *(void *)&long long v117 = v67;
      *((void *)&v117 + 1) = v68;
      v57[3] = &type metadata for HeightItem;
      v57[4] = sub_1E0AEE220();
    }
    uint64_t result = (_OWORD *)swift_allocObject();
    *unint64_t v57 = result;
    long long v69 = v116[1];
    result[1] = v116[0];
    result[2] = v69;
    long long v70 = v117;
    result[3] = v116[2];
    result[4] = v70;
  }
  else
  {
    sub_1E0AEBCEC(v114, (uint64_t)v27, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
    uint64_t v46 = type metadata accessor for ConfirmDetailsProvider.Details();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 48))(v27, 1, v46) == 1)
    {
      sub_1E0AEBC7C((uint64_t)v27, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      uint64_t v47 = sub_1E0B05E48();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v35, 1, 1, v47);
    }
    else
    {
      sub_1E0AEBCEC((uint64_t)v27, (uint64_t)v35, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
      sub_1E0AEE0AC((uint64_t)v27);
    }
    uint64_t v60 = v113;
    sub_1E0AE5770((uint64_t)v35, (uint64_t)v39 + *(int *)(v36 + 20));
    uint64_t v61 = (uint64_t (**)())((char *)v39 + *(int *)(v36 + 24));
    *uint64_t v61 = sub_1E0AE5704;
    v61[1] = 0;
    LOBYTE(v116[0]) = 0;
    sub_1E0AEAEA0();
    void *v39 = v62;
    v39[1] = v63;
    v60[3] = v36;
    v60[4] = sub_1E0AEE318(&qword_1EAD628E0, (void (*)(uint64_t))type metadata accessor for DateOfBirthItem);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v60);
    return (_OWORD *)sub_1E0AEE360((uint64_t)v39, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for DateOfBirthItem);
  }
  return result;
}

void (*sub_1E0AEDFA0(uint64_t a1, void *a2))(unsigned char *, void)
{
  return sub_1E0AEE720(a2);
}

void (*sub_1E0AEDFA8(uint64_t a1, void *a2))(unsigned char *, void)
{
  return sub_1E0AEE3C8(a2);
}

void (*sub_1E0AEDFB0(uint64_t a1, uint64_t a2))(unsigned char *, void)
{
  return sub_1E0AEEA78(a2);
}

uint64_t ConfirmDetailsModel.deinit()
{
  sub_1E0ACD748(v0 + 16);
  sub_1E0AEBC7C(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  return v0;
}

uint64_t ConfirmDetailsModel.__deallocating_deinit()
{
  sub_1E0ACD748(v0 + 16);
  sub_1E0AEBC7C(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1E0AEE0AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E0AEE108(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_1E0AEC08C(0, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a2, a1, v6);
  return a2;
}

uint64_t sub_1E0AEE188(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_1E0ACB27C(&v12, v10 + 40 * a1 + 32);
}

unint64_t sub_1E0AEE220()
{
  unint64_t result = qword_1EAD628D0;
  if (!qword_1EAD628D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD628D0);
  }
  return result;
}

unint64_t sub_1E0AEE278()
{
  unint64_t result = qword_1EAD628D8;
  if (!qword_1EAD628D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD628D8);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1E0AEE318(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E0AEE360(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void (*sub_1E0AEE3C8(void *a1))(unsigned char *, void)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1E0B06098();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v7, v10);
  long long v12 = &v31[-v11];
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v13 - 8, v14);
  uint64_t v16 = &v31[-v15];
  uint64_t v17 = sub_1E0AEBB74();
  uint64_t v19 = v18;
  uint64_t v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v19, 1, v20))
  {
    uint64_t v21 = *(int *)(v20 + 24);
    uint64_t v22 = *(void **)(v19 + v21);
    *(void *)(v19 + v21) = a1;
    id v23 = a1;
  }
  ((void (*)(void *, void))v17)(v32, 0);
  v31[0] = 2;
  uint64_t v24 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEBCEC(v24, (uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  sub_1E0AED294(v31, (uint64_t)v16, v32);
  sub_1E0AEBC7C((uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  MEMORY[0x1E4E3B320](2, 0);
  uint64_t v25 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v25 != 3)
  {
    uint64_t v26 = sub_1E0B06078() > v25;
    uint64_t result = (void (*)(unsigned char *, void))sub_1E0B06068();
    if (__OFADD__(*v28, v26))
    {
      __break(1u);
      return result;
    }
    *v28 += v26;
    result(v31, 0);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v12, v9, v4);
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v2 + 16))
  {
    uint64_t v29 = *(void *)(v2 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(unsigned char *, void *, uint64_t, uint64_t))(v29 + 8))(v12, v32, ObjectType, v29);
    swift_unknownObjectRelease();
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v12, v4);
  return (void (*)(unsigned char *, void))__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
}

void (*sub_1E0AEE720(void *a1))(unsigned char *, void)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1E0B06098();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v7, v10);
  long long v12 = &v31[-v11];
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v13 - 8, v14);
  uint64_t v16 = &v31[-v15];
  uint64_t v17 = sub_1E0AEBB74();
  uint64_t v19 = v18;
  uint64_t v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v19, 1, v20))
  {
    uint64_t v21 = *(int *)(v20 + 20);
    uint64_t v22 = *(void **)(v19 + v21);
    *(void *)(v19 + v21) = a1;
    id v23 = a1;
  }
  ((void (*)(void *, void))v17)(v32, 0);
  v31[0] = 1;
  uint64_t v24 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEBCEC(v24, (uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  sub_1E0AED294(v31, (uint64_t)v16, v32);
  sub_1E0AEBC7C((uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  MEMORY[0x1E4E3B320](1, 0);
  uint64_t v25 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v25 != 3)
  {
    uint64_t v26 = sub_1E0B06078() > v25;
    uint64_t result = (void (*)(unsigned char *, void))sub_1E0B06068();
    if (__OFADD__(*v28, v26))
    {
      __break(1u);
      return result;
    }
    *v28 += v26;
    result(v31, 0);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v12, v9, v4);
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v2 + 16))
  {
    uint64_t v29 = *(void *)(v2 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(unsigned char *, void *, uint64_t, uint64_t))(v29 + 8))(v12, v32, ObjectType, v29);
    swift_unknownObjectRelease();
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v12, v4);
  return (void (*)(unsigned char *, void))__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
}

void (*sub_1E0AEEA78(uint64_t a1))(unsigned char *, void)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1E0B06098();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v7, v10);
  long long v12 = &v31[-v11];
  sub_1E0AEC08C(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v13 - 8, v14);
  uint64_t v16 = &v31[-v15];
  uint64_t v17 = sub_1E0AEBB74();
  uint64_t v19 = v18;
  uint64_t v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v19, 1, v20))
  {
    sub_1E0AEBC7C(v19, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
    uint64_t v21 = sub_1E0B05E48();
    uint64_t v22 = a1;
    uint64_t v23 = *(void *)(v21 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v19, v22, v21);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v19, 0, 1, v21);
  }
  ((void (*)(void *, void))v17)(v32, 0);
  v31[0] = 0;
  uint64_t v24 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1E0AEBCEC(v24, (uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  sub_1E0AED294(v31, (uint64_t)v16, v32);
  sub_1E0AEBC7C((uint64_t)v16, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  MEMORY[0x1E4E3B320](0, 0);
  uint64_t v25 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v25 != 3)
  {
    uint64_t v26 = sub_1E0B06078() > v25;
    uint64_t result = (void (*)(unsigned char *, void))sub_1E0B06068();
    if (__OFADD__(*v28, v26))
    {
      __break(1u);
      return result;
    }
    *v28 += v26;
    result(v31, 0);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v12, v9, v4);
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v2 + 16))
  {
    uint64_t v29 = *(void *)(v2 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(unsigned char *, void *, uint64_t, uint64_t))(v29 + 8))(v12, v32, ObjectType, v29);
    swift_unknownObjectRelease();
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v12, v4);
  return (void (*)(unsigned char *, void))__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
}

unint64_t sub_1E0AEEE70()
{
  unint64_t result = qword_1EAD628E8;
  if (!qword_1EAD628E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD628E8);
  }
  return result;
}

unint64_t sub_1E0AEEEC8()
{
  unint64_t result = qword_1EAD628F0;
  if (!qword_1EAD628F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD628F0);
  }
  return result;
}

uint64_t sub_1E0AEEF1C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v4);
  uint64_t v6 = *(void *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1E0AEEF78(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1E0AEEFD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1E0AEBCEC(v3, a2, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.update(indexPath:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.insert(item:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.remove(itemAt:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.updateAllItems(newItems:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_1E0AEF09C()
{
  return type metadata accessor for ConfirmDetailsModel();
}

uint64_t type metadata accessor for ConfirmDetailsModel()
{
  uint64_t result = qword_1EAD628F8;
  if (!qword_1EAD628F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E0AEF0F0()
{
  sub_1E0AEC08C(319, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ConfirmDetailsModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfirmDetailsModel);
}

uint64_t dispatch thunk of ConfirmDetailsModel.canProceed.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.mostRecentDetails.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.mostRecentDetails.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.mostRecentDetails.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.__allocating_init(valueFormatter:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.updateDetails(newDetails:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.generateFullSetOfItems(details:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.selected(indexPath:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.determineIndexPath(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.makeItem(for:latestDetails:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.weightPickerItem(_:didSelectWeight:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.heightPickerItem(_:didSelectHeight:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.birthdayPickerItem(_:didSelectBirthdayComponents:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsModel.Row(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x3F) {
    goto LABEL_17;
  }
  if (a2 + 193 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 193) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 193;
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
      return (*a1 | (v4 << 8)) - 193;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 193;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 1) & 0x3E | (*a1 >> 7)) ^ 0x3F;
  if (v6 >= 0x3E) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for ConfirmDetailsModel.Row(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 193 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 193) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x3F) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x3E)
  {
    unsigned int v6 = ((a2 - 63) >> 8) + 1;
    *uint64_t result = a2 - 63;
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
        JUMPOUT(0x1E0AEF598);
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
          *uint64_t result = 4 * (((-a2 >> 1) & 0x1F) - 32 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_1E0AEF5C0(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

unsigned char *sub_1E0AEF5CC(unsigned char *result)
{
  *result &= ~0x80u;
  return result;
}

unsigned char *sub_1E0AEF5DC(unsigned char *result, char a2)
{
  *uint64_t result = *result & 3 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for ConfirmDetailsModel.Row()
{
  return &type metadata for ConfirmDetailsModel.Row;
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsModel.Row.HealthDetail(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ConfirmDetailsModel.Row.HealthDetail(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E0AEF75CLL);
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

unsigned char *sub_1E0AEF784(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmDetailsModel.Row.HealthDetail()
{
  return &type metadata for ConfirmDetailsModel.Row.HealthDetail;
}

_OWORD *sub_1E0AEF79C@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(v2 + 24);
  char v5 = *a1;
  return sub_1E0AED294(&v5, v3, a2);
}

id WeightPickerItem.__allocating_init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = sub_1E0AF0458(a1, a2);

  return v6;
}

void sub_1E0AEF830(uint64_t a1)
{
}

void sub_1E0AEF848(uint64_t a1)
{
}

void sub_1E0AEF858(uint64_t a1)
{
}

void sub_1E0AEF870(double a1, uint64_t a2, void *a3)
{
  id v5 = objc_msgSend(self, sel_poundUnit);
  id v6 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v5, a1);

  *a3 = v6;
}

id sub_1E0AEF8FC()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit);
  }
  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 24);
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter), v5);
    char v11 = 0;
    BOOL v7 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 8))(&v11, v5, v6);
    int v8 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

void sub_1E0AEF9AC()
{
}

void sub_1E0AEF9D8()
{
}

void sub_1E0AEFA04()
{
}

void sub_1E0AEFA30(void *a1, void *a2, void **a3)
{
  uint64_t v4 = v3 + *a1;
  if (*(unsigned char *)(v4 + 8) == 1)
  {
    if (*a2 != -1) {
      swift_once();
    }
    uint64_t v6 = *a3;
    id v7 = sub_1E0AEF8FC();
    objc_msgSend(v6, sel_doubleValueForUnit_, v7);
    double v9 = v8;

    double v10 = round(v9);
    if ((~*(void *)&v10 & 0x7FF0000000000000) != 0)
    {
      if (v10 > -9.22337204e18)
      {
        if (v10 < 9.22337204e18)
        {
          *(void *)uint64_t v4 = (uint64_t)v10;
          *(unsigned char *)(v4 + 8) = 0;
          return;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_11:
    __break(1u);
  }
}

uint64_t sub_1E0AEFB10()
{
  return sub_1E0B067B8();
}

uint64_t sub_1E0AEFB4C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0AEFB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1E0AEFC08(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACCC0C;
}

uint64_t sub_1E0AEFC90(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  void *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E0AEFCFC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E0AEFD54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E0AEFDB4())()
{
  return j_j__swift_endAccess;
}

id WeightPickerItem.init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  id v3 = sub_1E0AF0458(a1, a2);

  return v3;
}

void sub_1E0AEFE40(void *a1, char a2)
{
  id v4 = sub_1E0AEF8FC();
  objc_msgSend(a1, sel_doubleValueForUnit_, v4);
  double v6 = v5;

  double v7 = round(v6);
  if ((~*(void *)&v7 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((a2 & 1) == 0) {
    return;
  }
  sub_1E0AEF9D8();
  uint64_t v9 = v8;
  sub_1E0AEF9AC();
  if (v10 < v9)
  {
LABEL_11:
    __break(1u);
    return;
  }
  sub_1E0B06768();
}

id WeightPickerItem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WeightPickerItem.init()()
{
}

id WeightPickerItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeightPickerItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E0AF0078()
{
  return sub_1E0B067B8();
}

uint64_t sub_1E0AF00B4()
{
  id v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E0AF0110(uint64_t a1, uint64_t a2)
{
  double v5 = (void *)(*v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *double v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E0AF0174())()
{
  return j__swift_endAccess;
}

void WeightPickerItem.initialSelections.getter()
{
  sub_1E0AE1394();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1E0B08490;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight);
  if (v2)
  {
    id v3 = v2;
    sub_1E0AEFE40(v3, 1);
    uint64_t v5 = v4;
  }
  else
  {
    sub_1E0AEFA04();
    uint64_t v5 = v6;
  }
  sub_1E0AEF9D8();
  if (__OFSUB__(v5, v7))
  {
    __break(1u);
  }
  else
  {
    *(void *)(v1 + 32) = v5 - v7;
    *(void *)(v1 + 40) = 0;
  }
}

Swift::Int __swiftcall WeightPickerItem.numberOfComponents(in:)(UIPickerView *in)
{
  return 1;
}

Swift::Int __swiftcall WeightPickerItem.pickerView(_:numberOfRowsInComponent:)(UIPickerView *_, Swift::Int numberOfRowsInComponent)
{
  if (numberOfRowsInComponent) {
    return 0;
  }
  sub_1E0AEF9AC();
  uint64_t v4 = v3;
  sub_1E0AEF9D8();
  Swift::Int v5 = v4 - result;
  if (__OFSUB__(v4, result))
  {
    __break(1u);
    goto LABEL_7;
  }
  Swift::Int result = v5 + 1;
  if (__OFADD__(v5, 1)) {
LABEL_7:
  }
    __break(1u);
  return result;
}

Swift::String_optional __swiftcall WeightPickerItem.pickerView(_:titleForRow:forComponent:)(UIPickerView *_, Swift::Int titleForRow, Swift::Int forComponent)
{
  sub_1E0AF05C0(titleForRow, forComponent);
  result.value._object = v4;
  result.value._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::Void __swiftcall WeightPickerItem.pickerView(_:didSelectRow:inComponent:)(UIPickerView *_, Swift::Int didSelectRow, Swift::Int inComponent)
{
}

id sub_1E0AF0458(void *a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit] = 0;
  Swift::Int v5 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeMaxWeight];
  *(void *)Swift::Int v5 = 0;
  v5[8] = 1;
  uint64_t v6 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeMinWeight];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  uint64_t v7 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeAverageWeight];
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  *(void *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v8 = OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight;
  *(void *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight] = 0;
  uint64_t v9 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = *(void **)&v2[v8];
  *(void *)&v2[v8] = a1;
  char v11 = v2;
  id v12 = a1;

  sub_1E0ACC180(a2, (uint64_t)&v11[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter]);
  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for WeightPickerItem();
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v13;
}

unint64_t sub_1E0AF0564()
{
  unint64_t result = qword_1EAD62908;
  if (!qword_1EAD62908)
  {
    type metadata accessor for WeightPickerItem();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62908);
  }
  return result;
}

uint64_t type metadata accessor for WeightPickerItem()
{
  return self;
}

void sub_1E0AF05C0(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    sub_1E0AEF9AC();
    if (v4 >= a1)
    {
      id v5 = sub_1E0AEF8FC();
      sub_1E0AEF9D8();
      if (__OFADD__(a1, v6))
      {
        __break(1u);
      }
      else
      {
        id v7 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v5, (double)(a1 + v6));

        uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 24);
        uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 32);
        __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter), v8);
        char v10 = 0;
        (*(void (**)(char *, id, uint64_t, uint64_t))(v9 + 16))(&v10, v7, v8, v9);
      }
    }
  }
}

void sub_1E0AF06B8(uint64_t a1)
{
  id v3 = sub_1E0AEF8FC();
  sub_1E0AEF9D8();
  if (__OFADD__(a1, v4))
  {
    __break(1u);
  }
  else
  {
    id v5 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v3, (double)(a1 + v4));

    uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight);
    *(void *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight) = v5;
    id v7 = v5;

    uint64_t v8 = v1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
    swift_beginAccess();
    if (MEMORY[0x1E4E3C5D0](v8))
    {
      uint64_t v9 = *(void *)(v8 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v9 + 8))(v1, v7, ObjectType, v9);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1E0AF07C4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E0AF0820(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1E0AF0884@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of WeightPickerItemDelegate.weightPickerItem(_:didSelectWeight:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t method lookup function for WeightPickerItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WeightPickerItem);
}

uint64_t dispatch thunk of WeightPickerItem.reuseIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of WeightPickerItem.uniqueIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of WeightPickerItem.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of WeightPickerItem.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of WeightPickerItem.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of WeightPickerItem.baseIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of WeightPickerItem.baseIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of WeightPickerItem.baseIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of WeightPickerItem.__allocating_init(initialValue:valueFormatter:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t type metadata accessor for FavoritableObjectTypeDataSource()
{
  uint64_t result = qword_1EAD62960;
  if (!qword_1EAD62960) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0AF0B3C()
{
  return swift_initClassMetadata2();
}

void sub_1E0AF0B7C()
{
}

uint64_t sub_1E0AF0BAC()
{
  uint64_t v0 = sub_1E0B06288();
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1E0AF0BDC()
{
  return type metadata accessor for FavoritableObjectTypeDataSource();
}

id sub_1E0AF0CDC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NoCellNecessary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NoCellNecessary()
{
  return self;
}

uint64_t sub_1E0AF0D48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUIP33_E7FCF198A4429241325AB5C121E51D8015NoCellNecessary_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a1);
}

uint64_t sub_1E0AF0D9C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUIP33_E7FCF198A4429241325AB5C121E51D8015NoCellNecessary_item;
  swift_beginAccess();
  sub_1E0AF0F00(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1E0AF0DF8())()
{
  return j__swift_endAccess;
}

uint64_t sub_1E0AF0E54()
{
  return sub_1E0AF0EBC(&qword_1EAD62978);
}

uint64_t sub_1E0AF0E88()
{
  return sub_1E0AF0EBC(&qword_1EAD62980);
}

uint64_t sub_1E0AF0EBC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NoCellNecessary();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E0AF0F00(uint64_t a1, uint64_t a2)
{
  sub_1E0AF0F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1E0AF0F64()
{
  if (!qword_1EAD62290)
  {
    sub_1E0AF0FBC();
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62290);
    }
  }
}

unint64_t sub_1E0AF0FBC()
{
  unint64_t result = qword_1EAD62298;
  if (!qword_1EAD62298)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62298);
  }
  return result;
}

uint64_t sub_1E0AF1014(uint64_t a1)
{
  sub_1E0AF0F64();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *BirthdayPickerItem.__allocating_init(initialValue:defaultAge:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_allocObject();
  v8[5] = 0;
  v8[2] = 0;
  v8[3] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = (char *)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
  uint64_t v10 = sub_1E0B06048();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (uint64_t)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  uint64_t v12 = sub_1E0B05E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  swift_beginAccess();
  sub_1E0AF2B14(a1, v11, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  swift_endAccess();
  *(void *)((char *)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge) = a2;
  id v13 = (void *)((char *)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
  *id v13 = a3;
  v13[1] = a4;
  return v8;
}

uint64_t sub_1E0AF11DC()
{
  return sub_1E0B061D8();
}

uint64_t sub_1E0AF1214()
{
  return sub_1E0B067B8();
}

uint64_t sub_1E0AF126C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E0AF12CC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E0AF1318(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E0AF136C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1E0AF13C0()
{
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v0 + 32);
}

uint64_t sub_1E0AF1408(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 40) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1E0AF146C(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4E3C5D0](v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  v3[3] = v4;
  v3[4] = v5;
  return sub_1E0AF14EC;
}

void sub_1E0AF14EC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 40) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_1E0AF1570@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E0B05FD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  id v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (void (*)(uint64_t))MEMORY[0x1E4F27CA0];
  sub_1E0AF2360(0, &qword_1EAD629B8, MEMORY[0x1E4F27CA0]);
  uint64_t v11 = MEMORY[0x1F4188790](v9 - 8, v10);
  id v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v11, v14);
  uint64_t v16 = &v22[-v15];
  uint64_t v17 = v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
  swift_beginAccess();
  sub_1E0AF2AA8(v17, (uint64_t)v16, &qword_1EAD629B8, v8);
  uint64_t v18 = sub_1E0B06048();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v19 + 32))(a1, v16, v18);
  }
  uint64_t v20 = (void (*)(uint64_t))MEMORY[0x1E4F27CA0];
  sub_1E0AF1B1C((uint64_t)v16, &qword_1EAD629B8, MEMORY[0x1E4F27CA0]);
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E4F27B20], v3);
  sub_1E0B05FE8();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v19 + 16))(v13, a1, v18);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v19 + 56))(v13, 0, 1, v18);
  swift_beginAccess();
  sub_1E0AF2B14((uint64_t)v13, v17, &qword_1EAD629B8, v20);
  return swift_endAccess();
}

void *BirthdayPickerItem.init(initialValue:defaultAge:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = 0;
  v4[2] = 0;
  v4[3] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = (char *)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
  uint64_t v10 = sub_1E0B06048();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (uint64_t)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  uint64_t v12 = sub_1E0B05E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  swift_beginAccess();
  sub_1E0AF2B14(a1, v11, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  swift_endAccess();
  *(void *)((char *)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge) = a2;
  id v13 = (void *)((char *)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
  *id v13 = a3;
  v13[1] = a4;
  return v4;
}

unint64_t sub_1E0AF19A8()
{
  unint64_t result = qword_1EAD629A8;
  if (!qword_1EAD629A8)
  {
    type metadata accessor for CalendarPickerTableViewCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD629A8);
  }
  return result;
}

unint64_t sub_1E0AF1A00()
{
  unint64_t result = qword_1EAD629B0;
  if (!qword_1EAD629B0)
  {
    type metadata accessor for BirthdayPickerItem();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD629B0);
  }
  return result;
}

uint64_t type metadata accessor for BirthdayPickerItem()
{
  uint64_t result = qword_1EAD629C0;
  if (!qword_1EAD629C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t BirthdayPickerItem.deinit()
{
  swift_bridgeObjectRelease();
  sub_1E0ACD748(v0 + 32);
  sub_1E0AF1B1C(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar, &qword_1EAD629B8, MEMORY[0x1E4F27CA0]);
  sub_1E0AF1B1C(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  swift_release();
  return v0;
}

uint64_t sub_1E0AF1B1C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1E0AF2360(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t BirthdayPickerItem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_1E0ACD748(v0 + 32);
  sub_1E0AF1B1C(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar, &qword_1EAD629B8, MEMORY[0x1E4F27CA0]);
  sub_1E0AF1B1C(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  swift_release();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1E0AF1C48()
{
  return sub_1E0B067B8();
}

uint64_t sub_1E0AF1CA4()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E0AF1CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E0AF1D4C())()
{
  return j__swift_endAccess;
}

uint64_t BirthdayPickerItem.initialDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v2 = sub_1E0B05F88();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = (void (*)(void))v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v42 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E0B06038();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  MEMORY[0x1F4188790](v5, v6);
  int v43 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E0B06048();
  uint64_t v49 = *(void *)(v8 - 8);
  uint64_t v50 = v8;
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AF2360(0, (unint64_t *)&qword_1EAD62798, MEMORY[0x1E4F27928]);
  uint64_t v14 = MEMORY[0x1F4188790](v12 - 8, v13);
  uint64_t v41 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14, v16);
  uint64_t v18 = (char *)&v40 - v17;
  uint64_t v19 = (void (*)(uint64_t))MEMORY[0x1E4F26F90];
  sub_1E0AF2360(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  MEMORY[0x1F4188790](v20 - 8, v21);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = sub_1E0B05E48();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24, v26);
  uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  swift_beginAccess();
  sub_1E0AF2AA8(v29, (uint64_t)v23, &qword_1EAD623D8, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_1E0AF1B1C((uint64_t)v23, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
    uint64_t v30 = v47;
    uint64_t v31 = v48;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v28, v23, v24);
    sub_1E0AF1570((uint64_t)v11);
    sub_1E0B06008();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v11, v50);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    uint64_t v30 = v47;
    uint64_t v31 = v48;
    if ((*(unsigned int (**)(char *, uint64_t, void (*)(void)))(v47 + 48))(v18, 1, v48) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, void (*)(void)))(v30 + 32))(v46, v18, v31);
    }
    sub_1E0AF1B1C((uint64_t)v18, (unint64_t *)&qword_1EAD62798, MEMORY[0x1E4F27928]);
  }
  sub_1E0AF1570((uint64_t)v11);
  uint64_t v32 = v43;
  uint64_t v33 = v44;
  uint64_t v34 = v45;
  uint64_t result = (*(uint64_t (**)(char *, void, uint64_t))(v44 + 104))(v43, *MEMORY[0x1E4F27C20], v45);
  if (__OFSUB__(0, *(void *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge)))
  {
    __break(1u);
    return result;
  }
  uint64_t v36 = *(void (**)(void))(v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
  uint64_t v37 = v11;
  uint64_t v38 = v32;
  uint64_t v39 = v42;
  uint64_t v47 = *(void *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator + 8);
  uint64_t v48 = v36;
  ((void (*)(uint64_t))v36)(result);
  uint64_t v18 = v41;
  sub_1E0B06018();
  (*(void (**)(char *, void (*)(void)))(v30 + 8))(v39, v31);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v38, v34);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v37, v50);
  if ((*(unsigned int (**)(char *, uint64_t, void (*)(void)))(v30 + 48))(v18, 1, v31) == 1)
  {
    v48();
    return sub_1E0AF1B1C((uint64_t)v18, (unint64_t *)&qword_1EAD62798, MEMORY[0x1E4F27928]);
  }
  return (*(uint64_t (**)(uint64_t, char *, void (*)(void)))(v30 + 32))(v46, v18, v31);
}

void sub_1E0AF2360(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1E0B06A58();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t BirthdayPickerItem.calendarPicker(_:didSelectNewDate:)(uint64_t a1, uint64_t a2)
{
  return sub_1E0AF2408(a2);
}

uint64_t sub_1E0AF23BC@<X0>(uint64_t a1@<X8>)
{
  return BirthdayPickerItem.initialDate.getter(a1);
}

uint64_t sub_1E0AF23E0(uint64_t a1, uint64_t a2)
{
  return sub_1E0AF2408(a2);
}

uint64_t sub_1E0AF2408(uint64_t a1)
{
  uint64_t v2 = v1;
  v24[1] = a1;
  uint64_t v25 = (void (*)(uint64_t))MEMORY[0x1E4F26F90];
  sub_1E0AF2360(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)v24 - v5;
  uint64_t v7 = sub_1E0B06048();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E0B05E48();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AF1570((uint64_t)v11);
  uint64_t v17 = (void *)sub_1E0B05FF8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  uint64_t v18 = (void *)sub_1E0B05F58();
  id v19 = objc_msgSend(v17, sel_hk_dateOfBirthDateComponentsWithDate_, v18);

  sub_1E0B05E38();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v6, v16, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v6, 0, 1, v12);
  uint64_t v20 = v2 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  swift_beginAccess();
  sub_1E0AF2B14((uint64_t)v6, v20, &qword_1EAD623D8, v25);
  swift_endAccess();
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v2 + 32))
  {
    uint64_t v21 = *(void *)(v2 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v21 + 8))(v2, v16, ObjectType, v21);
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

uint64_t sub_1E0AF2708@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E0AF2758@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 32;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v4);
  uint64_t v6 = *(void *)(v3 + 40);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1E0AF27B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 40) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of BirthdayPickerItemDelegate.birthdayPickerItem(_:didSelectBirthdayComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1E0AF2824()
{
  return type metadata accessor for BirthdayPickerItem();
}

void sub_1E0AF282C()
{
  sub_1E0AF2360(319, &qword_1EAD629B8, MEMORY[0x1E4F27CA0]);
  if (v0 <= 0x3F)
  {
    sub_1E0AF2360(319, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for BirthdayPickerItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BirthdayPickerItem);
}

uint64_t dispatch thunk of BirthdayPickerItem.reuseIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of BirthdayPickerItem.uniqueIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of BirthdayPickerItem.baseIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of BirthdayPickerItem.baseIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of BirthdayPickerItem.baseIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of BirthdayPickerItem.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of BirthdayPickerItem.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of BirthdayPickerItem.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of BirthdayPickerItem.__allocating_init(initialValue:defaultAge:dateGenerator:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1E0AF2AA8(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1E0AF2360(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1E0AF2B14(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1E0AF2360(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a2, a1, v6);
  return a2;
}

uint64_t HeightItem.init(height:valueFormatter:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, void *a3@<X8>)
{
  a3[6] = 0;
  a3[7] = 0;
  *a3 = a1;
  return sub_1E0ACB27C(a2, (uint64_t)(a3 + 1));
}

uint64_t HeightItem.reuseIdentifier.getter()
{
  return sub_1E0B061D8();
}

uint64_t HeightItem.uniqueIdentifier.getter()
{
  sub_1E0AF2C88();
  uint64_t v1 = sub_1E0B067B8();
  uint64_t v2 = *v0;
  sub_1E0AD4BF4();
  id v3 = v2;
  sub_1E0B067B8();
  swift_bridgeObjectRetain();
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1E0AF2C88()
{
  unint64_t result = qword_1EAD629D0;
  if (!qword_1EAD629D0)
  {
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD629D0);
  }
  return result;
}

uint64_t HeightItem.baseIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HeightItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*HeightItem.baseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t HeightItem.title.getter()
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t HeightItem.value.getter()
{
  uint64_t v1 = *(void **)v0;
  if (*(void *)v0)
  {
    uint64_t v2 = *(void *)(v0 + 32);
    uint64_t v3 = *(void *)(v0 + 40);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 8), v2);
    char v10 = 1;
    uint64_t v4 = *(uint64_t (**)(char *, id, uint64_t, uint64_t))(v3 + 16);
    id v5 = v1;
    uint64_t v6 = v4(&v10, v5, v2, v3);

    return v6;
  }
  else
  {
    if (qword_1EAD61EC0 != -1) {
      swift_once();
    }
    id v8 = (id)qword_1EAD625F0;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1E0B05E58();
    swift_bridgeObjectRelease();

    return v9;
  }
}

uint64_t sub_1E0AF2F68()
{
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return v1;
}

ValueMetadata *type metadata accessor for HeightItem()
{
  return &type metadata for HeightItem;
}

uint64_t sub_1E0AF3050()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD629D8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD629D8);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_1E0AF3118(uint64_t a1, void *a2)
{
  sub_1E0AD3F94(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098((uint64_t)v5, v3);
  swift_endAccess();
  sub_1E0AF31A4();
  return sub_1E0AEAC6C((uint64_t)v5, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
}

void sub_1E0AF31A4()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_1E0B05F88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  uint64_t v7 = (uint64_t)v0 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD3F94(v7, (uint64_t)v30);
  if (v31)
  {
    sub_1E0AEACC8(0, (unint64_t *)&qword_1EAD62298);
    sub_1E0AEACC8(0, &qword_1EAD62A08);
    if (swift_dynamicCast())
    {
      if (*((void *)&v33 + 1))
      {
        sub_1E0ACB27C(&v32, (uint64_t)v35);
        sub_1E0AD3F94(v7, (uint64_t)v30);
        if (v31)
        {
          sub_1E0AEACC8(0, (unint64_t *)&unk_1EAD62390);
          if (swift_dynamicCast())
          {
            if (*((void *)&v33 + 1))
            {
              __swift_project_boxed_opaque_existential_1(&v32, *((uint64_t *)&v33 + 1));
              uint64_t v8 = sub_1E0B062C8();
              uint64_t v10 = v9;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v32);
              if (v10) {
                uint64_t v11 = v8;
              }
              else {
                uint64_t v11 = 0;
              }
              goto LABEL_20;
            }
          }
          else
          {
            uint64_t v34 = 0;
            long long v32 = 0u;
            long long v33 = 0u;
          }
        }
        else
        {
          sub_1E0AEAC6C((uint64_t)v30, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v34 = 0;
        }
        sub_1E0AEAC6C((uint64_t)&v32, &qword_1EAD62388, (unint64_t *)&unk_1EAD62390);
        uint64_t v11 = 0;
        uint64_t v10 = 0;
LABEL_20:
        sub_1E0AF4038(v11, v10);
        swift_bridgeObjectRelease();
        uint64_t v23 = v36;
        uint64_t v24 = v37;
        __swift_project_boxed_opaque_existential_1(v35, v36);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
        id v25 = sub_1E0AF38A0();
        uint64_t v26 = (void *)sub_1E0B05F58();
        objc_msgSend(v25, sel_setDate_animated_, v26, 0);

        uint64_t v27 = v36;
        uint64_t v28 = v37;
        __swift_project_boxed_opaque_existential_1(v35, v36);
        (*(void (**)(void *, unsigned char *, uint64_t, uint64_t))(v28 + 16))(v1, v6, v27, v28);
        (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
        return;
      }
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
    }
  }
  else
  {
    sub_1E0AEAC6C((uint64_t)v30, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 0;
  }
  sub_1E0AEAC6C((uint64_t)&v32, &qword_1EAD62A00, &qword_1EAD62A08);
  if (qword_1EAD61F58 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1E0B06448();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EAD629D8);
  id v13 = v1;
  uint64_t v14 = sub_1E0B06428();
  os_log_type_t v15 = sub_1E0B068A8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v35[0] = v17;
    *(_DWORD *)uint64_t v16 = 136446722;
    uint64_t v18 = sub_1E0B06C58();
    *(void *)&long long v32 = sub_1E0ACB6F4(v18, v19, v35);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    *(void *)&long long v32 = sub_1E0ACB6F4(1835365481, 0xE400000000000000, v35);
    sub_1E0B06A68();
    *(_WORD *)(v16 + 22) = 2082;
    sub_1E0AEABB8(0, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
    *(void *)&long long v32 = v20;
    sub_1E0AD47A0();
    uint64_t v21 = sub_1E0B067B8();
    *(void *)&long long v32 = sub_1E0ACB6F4(v21, v22, v35);
    sub_1E0B06A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v14, v15, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that did not conform to CalendarPickerTableViewCellDataSource", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v17, -1, -1);
    MEMORY[0x1E4E3C540](v16, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1E0AF3730@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a1);
}

uint64_t sub_1E0AF3784(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098(a1, v3);
  swift_endAccess();
  sub_1E0AF31A4();
  return sub_1E0AEAC6C(a1, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
}

void (*sub_1E0AF380C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1E0AF386C;
}

void sub_1E0AF386C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1E0AF31A4();
  }
}

id sub_1E0AF38A0()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker);
  }
  else
  {
    id v4 = sub_1E0AF3904(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1E0AF3904(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_1E0B06048();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E0B05F88();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB16B0]), sel_init);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_setPreferredDatePickerStyle_, 3);
  objc_msgSend(v11, sel_setDatePickerMode_, 1);
  sub_1E0B05F78();
  uint64_t v12 = (void *)sub_1E0B05F58();
  id v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v10, v6);
  objc_msgSend(v11, sel_setMaximumDate_, v12);

  uint64_t v14 = self;
  sub_1E0B06028();
  os_log_type_t v15 = (void *)sub_1E0B05FF8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  id v16 = objc_msgSend(v14, sel_hk_minimumDateForBirthDateWithCalendar_, v15);

  sub_1E0B05F68();
  uint64_t v17 = (void *)sub_1E0B05F58();
  v13(v10, v6);
  objc_msgSend(v11, sel_setMinimumDate_, v17);

  objc_msgSend(v11, sel_addTarget_action_forControlEvents_, v20, sel_pickerDateChanged_, 4096);
  return v11;
}

id sub_1E0AF3BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = &v3[OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker] = 0;
  if (a3)
  {
    uint64_t v6 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for CalendarPickerTableViewCell();
  id v7 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_, a1, v6);

  id v8 = v7;
  id v9 = objc_msgSend(v8, sel_contentView);
  id v10 = sub_1E0AF38A0();
  objc_msgSend(v9, sel_addSubview_, v10);

  id v11 = sub_1E0AF38A0();
  id v12 = objc_msgSend(v8, sel_contentView);
  objc_msgSend(v11, sel_hk_alignConstraintsWithView_, v12);

  return v8;
}

uint64_t sub_1E0AF3DA8(void *a1)
{
  uint64_t v3 = sub_1E0B05F88();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  id v7 = v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  uint64_t v8 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD3F94(v8, (uint64_t)v14);
  if (v15)
  {
    sub_1E0AEACC8(0, (unint64_t *)&qword_1EAD62298);
    sub_1E0AEACC8(0, &qword_1EAD62A08);
    if (swift_dynamicCast())
    {
      uint64_t v9 = *((void *)&v17 + 1);
      if (*((void *)&v17 + 1))
      {
        uint64_t v10 = v18;
        __swift_project_boxed_opaque_existential_1(&v16, *((uint64_t *)&v17 + 1));
        id v11 = objc_msgSend(a1, sel_date);
        sub_1E0B05F68();

        (*(void (**)(uint64_t, unsigned char *, uint64_t, uint64_t))(v10 + 16))(v1, v7, v9, v10);
        (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
      }
    }
    else
    {
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
    }
  }
  else
  {
    sub_1E0AEAC6C((uint64_t)v14, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
  }
  return sub_1E0AEAC6C((uint64_t)&v16, &qword_1EAD62A00, &qword_1EAD62A08);
}

void sub_1E0AF4038(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1E0AD4398();
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1E0B08740;
    *(void *)(v5 + 32) = a1;
    *(void *)(v5 + 40) = a2;
    *(void *)(v5 + 48) = 0x7261646E656C6143;
    *(void *)(v5 + 56) = 0xE800000000000000;
    *(void *)(v5 + 64) = 0x72656B636950;
    *(void *)(v5 + 72) = 0xE600000000000000;
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)sub_1E0B06818();
    swift_bridgeObjectRelease();
    id v7 = (id)HKUIJoinStringsForAutomationIdentifier();

    objc_msgSend(v2, sel_setAccessibilityIdentifier_, v7);
  }
  else
  {
    objc_msgSend(v2, sel_setAccessibilityIdentifier_, 0);
  }
}

id CalendarPickerTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalendarPickerTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CalendarPickerTableViewCell()
{
  return self;
}

void sub_1E0AF4218(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1E0AF423C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a2);
}

uint64_t dispatch thunk of CalendarPickerTableViewCellDataSource.initialDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCellDataSource.calendarPicker(_:didSelectNewDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for CalendarPickerTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CalendarPickerTableViewCell);
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.updateAutomationIdentifiers(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t ConfirmDetailsDataSource.__allocating_init(detailsProvider:model:)(uint64_t a1, uint64_t a2)
{
  return ConfirmDetailsDataSource.init(detailsProvider:model:)(a1, a2);
}

uint64_t sub_1E0AF43F4()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62A10);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62A10);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_1E0AF44BC()
{
  return 1;
}

uint64_t sub_1E0AF44C4()
{
  return sub_1E0B06C28();
}

uint64_t sub_1E0AF4508()
{
  return sub_1E0B06C18();
}

uint64_t sub_1E0AF4530()
{
  return sub_1E0B06C28();
}

void *sub_1E0AF4570@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

uint64_t sub_1E0AF4584()
{
  uint64_t v1 = v0 + qword_1EAD62A28;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0AF45D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + qword_1EAD62A28;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1E0AF4640(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = qword_1EAD62A28;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACCC0C;
}

uint64_t sub_1E0AF46C8()
{
  return (*(uint64_t (**)(void))(**(void **)(v0 + qword_1EAD62A30) + 112))() & 1;
}

uint64_t sub_1E0AF4718@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + qword_1EAD62A30) + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1E0ACD228(v3, a1);
}

uint64_t ConfirmDetailsDataSource.init(detailsProvider:model:)(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = sub_1E0B06218();
  uint64_t v5 = *(void *)(v61 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v62 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AF5120(0);
  MEMORY[0x1F4188790]();
  unint64_t v57 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E0B066B8();
  uint64_t v52 = *(void *)(v8 - 8);
  uint64_t v53 = v8;
  MEMORY[0x1F4188790]();
  uint64_t v51 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AF51B8();
  uint64_t v55 = *(void *)(v10 - 8);
  uint64_t v56 = v10;
  MEMORY[0x1F4188790]();
  uint64_t v54 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AF52CC();
  uint64_t v13 = v12;
  uint64_t v59 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v58 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1E0B05FB8();
  uint64_t v15 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790]();
  long long v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ACD28C();
  MEMORY[0x1F4188790]();
  uint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + qword_1EAD62A28 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v2 + qword_1EAD62A70) = 0;
  *(void *)(v2 + qword_1EAD62A78) = a1;
  uint64_t v50 = v2;
  *(void *)(v2 + qword_1EAD62A30) = a2;
  uint64_t v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  uint64_t v49 = v20;
  v21(v19, 1, 1);
  unint64_t v22 = *(uint64_t (**)(char *))(*(void *)a2 + 208);
  swift_retain();
  swift_retain();
  uint64_t v23 = v22(v19);
  sub_1E0AF6474((uint64_t)v19, (uint64_t (*)(void))sub_1E0ACD28C);
  int64_t v24 = *(void *)(v23 + 16);
  uint64_t v48 = v15;
  if (v24)
  {
    uint64_t v45 = v13;
    uint64_t v46 = a1;
    uint64_t v47 = a2;
    v65[0] = MEMORY[0x1E4FBC860];
    int64_t v60 = v24;
    sub_1E0AF6454(0, v24, 0);
    uint64_t v25 = 0;
    uint64_t v26 = (void (**)(char *, uint64_t))(v15 + 8);
    do
    {
      swift_bridgeObjectRetain_n();
      sub_1E0B05FA8();
      sub_1E0B05F98();
      (*v26)(v17, v63);
      sub_1E0B06208();
      swift_bridgeObjectRelease();
      uint64_t v27 = v65[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1E0AF6454(0, *(void *)(v27 + 16) + 1, 1);
        uint64_t v27 = v65[0];
      }
      unint64_t v29 = *(void *)(v27 + 16);
      unint64_t v28 = *(void *)(v27 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_1E0AF6454(v28 > 1, v29 + 1, 1);
        uint64_t v27 = v65[0];
      }
      ++v25;
      *(void *)(v27 + 16) = v29 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v27+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v29, v62, v61);
      v65[0] = v27;
    }
    while (v60 != v25);
    swift_bridgeObjectRelease();
    a1 = v46;
    uint64_t v13 = v45;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v65[0] = 0;
  v65[1] = 0xE000000000000000;
  sub_1E0B06AC8();
  swift_bridgeObjectRelease();
  strcpy((char *)v65, "MutableArray<");
  HIWORD(v65[1]) = -4864;
  sub_1E0B05FA8();
  sub_1E0B05F98();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v63);
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  sub_1E0B067E8();
  uint64_t v30 = sub_1E0B06238();
  uint64_t v31 = *(void *)(v30 + qword_1EAD62A30);
  swift_beginAccess();
  *(void *)(v31 + 24) = &protocol witness table for ConfirmDetailsDataSource;
  swift_unknownObjectWeakAssign();
  long long v32 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 160);
  uint64_t v33 = swift_retain();
  id v64 = (id)v32(v33);
  sub_1E0AF5264();
  sub_1E0AF6514(&qword_1EAD62A50, (void (*)(uint64_t))sub_1E0AF5264);
  uint64_t v34 = v54;
  sub_1E0B06668();
  swift_release();
  sub_1E0AD31A0();
  uint64_t v36 = v51;
  uint64_t v35 = v52;
  uint64_t v37 = v53;
  (*(void (**)(char *, void, uint64_t))(v52 + 104))(v51, *MEMORY[0x1E4FBCB38], v53);
  uint64_t v38 = (void *)sub_1E0B069D8();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  id v64 = v38;
  uint64_t v39 = sub_1E0B06988();
  uint64_t v40 = (uint64_t)v57;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v57, 1, 1, v39);
  sub_1E0AF6514(&qword_1EAD62A60, (void (*)(uint64_t))sub_1E0AF51B8);
  sub_1E0AF6514(&qword_1EAD62A68, (void (*)(uint64_t))sub_1E0AD31A0);
  uint64_t v41 = v58;
  uint64_t v42 = v56;
  sub_1E0B06678();
  sub_1E0AF6474(v40, (uint64_t (*)(void))sub_1E0AF5120);

  (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v42);
  swift_allocObject();
  swift_weakInit();
  sub_1E0AF6514(&qword_1EAD62A80, (void (*)(uint64_t))sub_1E0AF52CC);
  uint64_t v43 = sub_1E0B06688();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v41, v13);
  *(void *)(v30 + qword_1EAD62A70) = v43;
  swift_release();
  return v30;
}

void sub_1E0AF5120(uint64_t a1)
{
}

void sub_1E0AF5154(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1E0AF51B8()
{
  if (!qword_1EAD62A40)
  {
    sub_1E0AF5264();
    type metadata accessor for ConfirmDetailsProvider.Details();
    sub_1E0AF6514(&qword_1EAD62A50, (void (*)(uint64_t))sub_1E0AF5264);
    unint64_t v0 = sub_1E0B06588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62A40);
    }
  }
}

void sub_1E0AF5264()
{
  if (!qword_1EAD62A48)
  {
    sub_1E0ACD28C();
    unint64_t v0 = sub_1E0B065D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62A48);
    }
  }
}

void sub_1E0AF52CC()
{
  if (!qword_1EAD62A58)
  {
    sub_1E0AF51B8();
    sub_1E0AD31A0();
    sub_1E0AF6514(&qword_1EAD62A60, (void (*)(uint64_t))sub_1E0AF51B8);
    sub_1E0AF6514(&qword_1EAD62A68, (void (*)(uint64_t))sub_1E0AD31A0);
    unint64_t v0 = sub_1E0B065B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62A58);
    }
  }
}

uint64_t sub_1E0AF53B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E0ACD228(a1, a2);
}

uint64_t sub_1E0AF53C0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(uint64_t))(**(void **)(result + qword_1EAD62A30) + 200))(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_1E0AF5454()
{
  (*(void (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 192))();
  uint64_t v1 = (char *)v0 + qword_1EAD62A28;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v1);
  if (result)
  {
    uint64_t v3 = *((void *)v1 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 8))(v0, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1E0AF5524()
{
  (*(void (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 200))();
  uint64_t v1 = (char *)v0 + qword_1EAD62A28;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v1);
  if (result)
  {
    uint64_t v3 = *((void *)v1 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 8))(v0, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1E0AF55F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == 1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void (**)(void, uint64_t))(class metadata base offset for ConfirmDetailsDataSource + *v1 + 208);
    swift_bridgeObjectRetain();
    v4(0, v3);
    swift_bridgeObjectRelease();
    uint64_t v5 = (char *)v1 + qword_1EAD62A28;
    swift_beginAccess();
    if (MEMORY[0x1E4E3C5D0](v5))
    {
      uint64_t v6 = *((void *)v5 + 1);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v6 + 8))(v1, ObjectType, v6);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_1EAD61F60 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1E0B06448();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EAD62A10);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_1E0B06428();
    os_log_type_t v10 = sub_1E0B068B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v15[0] = v12;
      *(_DWORD *)uint64_t v11 = 136446722;
      uint64_t v13 = sub_1E0B06C58();
      uint64_t v16 = sub_1E0ACB6F4(v13, v14, v15);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      uint64_t v16 = sub_1E0ACB6F4(0xD000000000000019, 0x80000001E0B0C090, v15);
      sub_1E0B06A68();
      *(_WORD *)(v11 + 22) = 2048;
      swift_bridgeObjectRelease();
      uint64_t v16 = v2;
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AC7000, v9, v10, "[%{public}s.%{public}s]: Received unexpected number of sections: %ld", (uint8_t *)v11, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v12, -1, -1);
      MEMORY[0x1E4E3C540](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1E0AF58E0()
{
  return sub_1E0B06878();
}

uint64_t sub_1E0AF5A40()
{
  return (*(uint64_t (**)(void))(**(void **)(v0 + qword_1EAD62A30) + 216))();
}

double sub_1E0AF5A8C@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

id sub_1E0AF5A9C(uint64_t a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1E0B06558();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1E0AF655C();
  uint64_t v11 = v10 - 8;
  MEMORY[0x1F4188790](v10, v12);
  unint64_t v14 = &v31[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_1E0B06088();
  uint64_t v16 = &v14[*(int *)(v11 + 56)];
  *unint64_t v14 = v15 != 0;
  uint64_t v17 = sub_1E0B061C8();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(BOOL *, uint64_t, uint64_t))(v18 + 16))(v16, a1, v17);
  if (v15) {
    goto LABEL_2;
  }
  int v20 = (*(uint64_t (**)(BOOL *, uint64_t))(v18 + 88))(v16, v17);
  if (v20 == *MEMORY[0x1E4F661F0])
  {
    if (qword_1EAD61EC8 != -1) {
      swift_once();
    }
    id v21 = (id)qword_1EAD62608;
    swift_bridgeObjectRetain();
    sub_1E0B05E58();
    swift_bridgeObjectRelease();

    id v22 = (id)qword_1EAD62608;
    swift_bridgeObjectRetain();
    sub_1E0B05E58();
    swift_bridgeObjectRelease();

    sub_1E0AF5F7C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v23 = objc_allocWithZone((Class)type metadata accessor for ConfirmDetailsLearnMoreView());
    swift_retain();
    id v19 = sub_1E0AFE394((uint64_t)v9, a2, v3, (uint64_t)&off_1F3B8E8B0);
    swift_release();
  }
  else
  {
    if (v20 != *MEMORY[0x1E4F661E8])
    {
LABEL_2:
      sub_1E0AF6474((uint64_t)v14, (uint64_t (*)(void))sub_1E0AF655C);
      return 0;
    }
    if (qword_1EAD61EC8 != -1) {
      swift_once();
    }
    id v24 = (id)qword_1EAD62608;
    swift_bridgeObjectRetain();
    sub_1E0B05E58();
    swift_bridgeObjectRelease();

    sub_1E0B06478();
    swift_bridgeObjectRetain();
    sub_1E0B06548();
    id v25 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB2950]);
    uint64_t v26 = (void (*)(unsigned char *, void))sub_1E0B064F8();
    sub_1E0B064B8();
    v26(v31, 0);
    id v27 = objc_msgSend(self, sel_labelColor);
    unint64_t v28 = (void (*)(unsigned char *, void))sub_1E0B064F8();
    sub_1E0B064D8();
    v28(v31, 0);
    swift_bridgeObjectRelease();
    id v29 = objc_allocWithZone((Class)type metadata accessor for ConfirmDetailsFooterView());
    return sub_1E0AE3784((uint64_t)v9, a2);
  }
  return v19;
}

id sub_1E0AF5F7C()
{
  sub_1E0B06488();
  swift_bridgeObjectRetain();
  sub_1E0B06548();
  uint64_t v0 = self;
  id result = objc_msgSend(v0, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E4FB2998], 1024);
  if (result)
  {
    uint64_t v2 = (void (*)(unsigned char *, void))sub_1E0B064F8();
    sub_1E0B064B8();
    v2(v10, 0);
    uint64_t v3 = self;
    id v4 = objc_msgSend(v3, sel_labelColor);
    uint64_t v5 = (void (*)(unsigned char *, void))sub_1E0B064F8();
    sub_1E0B064D8();
    v5(v10, 0);
    swift_bridgeObjectRetain();
    sub_1E0B06498();
    id v6 = objc_msgSend(v0, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB2950]);
    uint64_t v7 = (void (*)(unsigned char *, void))sub_1E0B06518();
    sub_1E0B064B8();
    v7(v10, 0);
    id v8 = objc_msgSend(v3, sel_labelColor);
    uint64_t v9 = (uint64_t (*)(unsigned char *, void))sub_1E0B06518();
    sub_1E0B064D8();
    return (id)v9(v10, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1E0AF6178(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F411E758](a1, a2, 1);
}

void ConfirmDetailsDataSource.__allocating_init(arrangedSections:identifier:)()
{
}

void ConfirmDetailsDataSource.init(arrangedSections:identifier:)()
{
}

uint64_t sub_1E0AF61E0()
{
  sub_1E0ACD748(v0 + qword_1EAD62A28);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t ConfirmDetailsDataSource.deinit()
{
  uint64_t v0 = sub_1E0B06278();
  sub_1E0ACD748(v0 + qword_1EAD62A28);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ConfirmDetailsDataSource.__deallocating_deinit()
{
  uint64_t v0 = sub_1E0B06278();
  sub_1E0ACD748(v0 + qword_1EAD62A28);
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1E0AF6330()
{
  uint64_t v1 = v0 + qword_1EAD62A28;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v1);
  if (result)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1E0AF63C0()
{
  return (*(uint64_t (**)(void))(**(void **)(*v0 + qword_1EAD62A30) + 216))();
}

id sub_1E0AF6410(uint64_t a1, double a2)
{
  return sub_1E0AF5A9C(a1, a2);
}

uint64_t sub_1E0AF6434(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E0AF6644(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1E0AF6454(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E0AF67F8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1E0AF6474(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E0AF64D4()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E0AF650C(uint64_t a1)
{
  return sub_1E0AF53C0(a1);
}

uint64_t sub_1E0AF6514(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1E0AF655C()
{
  if (!qword_1EAD62A88)
  {
    sub_1E0AF65CC();
    sub_1E0B061C8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EAD62A88);
    }
  }
}

void sub_1E0AF65CC()
{
  if (!qword_1EAD62A90)
  {
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62A90);
    }
  }
}

uint64_t sub_1E0AF6624(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E0AF6A64(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1E0AF6644(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1E0AF5154(0, &qword_1EAD62AB8, (uint64_t (*)(uint64_t))sub_1E0AF734C, MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_1E0AF734C(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1E0B06B78();
  __break(1u);
  return result;
}

uint64_t sub_1E0AF67F8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  sub_1E0AF5154(0, (unint64_t *)&qword_1EAD62818, MEMORY[0x1E4F66468], MEMORY[0x1E4FBBE00]);
  uint64_t v10 = *(void *)(sub_1E0B06218() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1E0B06218() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  id v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  id v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1E0B06B78();
  __break(1u);
  return result;
}

uint64_t sub_1E0AF6A64(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1E0AF5154(0, &qword_1EAD62AB0, (uint64_t (*)(uint64_t))sub_1E0AF0FBC, MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_1E0AF0FBC();
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1E0B06B78();
  __break(1u);
  return result;
}

uint64_t sub_1E0AF6C30@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + qword_1EAD62A28;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E0AF6C8C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + qword_1EAD62A28;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of ConfirmDetailsDataSourceDelegate.detailsDataSourceDidUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSourceDelegate.detailsDataSourceDidTapLearnMore(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata accessor for ConfirmDetailsDataSource()
{
  uint64_t result = qword_1EAD62A98;
  if (!qword_1EAD62A98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0AF6D64()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ConfirmDetailsDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfirmDetailsDataSource);
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.delegate.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 32))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.delegate.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 40))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.delegate.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 48))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.canProceed.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 56))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.details.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 64))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.__allocating_init(detailsProvider:model:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + v0 + 96))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.update(indexPath:with:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 104))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.remove(itemAt:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 112))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.updateAllItems(newItems:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 120))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.registerCells(for:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 136))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.indexPathSelected(_:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 144))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.supplementaryContentConfiguration(ofKind:at:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 152))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.supplementaryView(ofKind:at:functionalWidth:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.overridableReplace(at:with:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 192))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.overridableRemoveItemAt(indexPath:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 200))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.overridableReplaceItemsForSection(at:newItems:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 208))();
}

uint64_t sub_1E0AF71BC()
{
  return type metadata accessor for ConfirmDetailsDataSource();
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsDataSource.Section(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ConfirmDetailsDataSource.Section(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1E0AF72B4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0AF72DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ConfirmDetailsDataSource.Section()
{
  return &type metadata for ConfirmDetailsDataSource.Section;
}

unint64_t sub_1E0AF72F8()
{
  unint64_t result = qword_1EAD62AA8;
  if (!qword_1EAD62AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62AA8);
  }
  return result;
}

void sub_1E0AF734C(uint64_t a1)
{
}

BOOL static WalkingSteadinessOnboardingModel.CannotProgressReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1E0AF7394()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62AC8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62AC8);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_1E0AF745C()
{
  sub_1E0AFC694();
  MEMORY[0x1F4188790](v1, v2);
  sub_1E0AFC7A0();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = v0;
  sub_1E0AFCAF8(0, &qword_1EAD62B48, MEMORY[0x1E4F1AC28]);
  swift_allocObject();
  v0;
  uint64_t v12 = sub_1E0B06648();
  sub_1E0B06318();
  sub_1E0AFC72C();
  sub_1E0B06668();
  sub_1E0ADA450(0, &qword_1EAD62AE0);
  uint64_t v12 = sub_1E0B06398();
  sub_1E0AFC550();
  sub_1E0AFC64C(&qword_1EAD62B68, (void (*)(uint64_t))sub_1E0AFC694);
  sub_1E0AFC64C(&qword_1EAD62B20, (void (*)(uint64_t))sub_1E0AFC550);
  sub_1E0B06598();
  sub_1E0AFC64C(&qword_1EAD62B70, (void (*)(uint64_t))sub_1E0AFC7A0);
  uint64_t v9 = sub_1E0B06658();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v9;
}

uint64_t sub_1E0AF7758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_1E0AFC694();
  uint64_t v24 = v6;
  MEMORY[0x1F4188790](v6, v7);
  sub_1E0AFC7A0();
  uint64_t v23 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  unint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v11, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18 + v17, (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_1E0AFCAF8(0, &qword_1EAD62B48, MEMORY[0x1E4F1AC28]);
  swift_allocObject();
  uint64_t v25 = sub_1E0B06648();
  sub_1E0B06318();
  sub_1E0AFC72C();
  sub_1E0B06668();
  uint64_t v25 = sub_1E0B06378();
  sub_1E0AFC550();
  sub_1E0AFC64C(&qword_1EAD62B68, (void (*)(uint64_t))sub_1E0AFC694);
  sub_1E0AFC64C(&qword_1EAD62B20, (void (*)(uint64_t))sub_1E0AFC550);
  sub_1E0B06598();
  sub_1E0AFC64C(&qword_1EAD62B70, (void (*)(uint64_t))sub_1E0AFC7A0);
  uint64_t v19 = v23;
  uint64_t v20 = sub_1E0B06658();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v19);
  return v20;
}

uint64_t sub_1E0AF7AF8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v4 = sub_1E0B066A8();
  uint64_t v28 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1E0B066D8();
  uint64_t v8 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27, v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E0B066B8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ADA450(0, qword_1EBF0EA60);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, *MEMORY[0x1E4FBCB28], v12);
  unint64_t v17 = (void *)sub_1E0B069D8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  uint64_t v18 = (void *)swift_allocObject();
  uint64_t v19 = v25;
  uint64_t v20 = v26;
  v18[2] = a3;
  void v18[3] = v19;
  v18[4] = v20;
  aBlock[4] = sub_1E0AFCC90;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0AD7664;
  aBlock[3] = &block_descriptor_56;
  id v21 = _Block_copy(aBlock);
  id v22 = a3;
  swift_retain();
  sub_1E0B066C8();
  uint64_t v29 = MEMORY[0x1E4FBC860];
  sub_1E0AFC64C((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
  sub_1E0AFBB18(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1E0AD3260();
  sub_1E0B06A98();
  MEMORY[0x1E4E3BC80](0, v11, v7, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v27);
  return swift_release();
}

uint64_t sub_1E0AF7EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = a5;
  uint64_t v34 = a1;
  uint64_t v31 = a3;
  uint64_t v35 = a2;
  uint64_t v36 = sub_1E0B066A8();
  uint64_t v39 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36, v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E0B066D8();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  uint64_t v11 = MEMORY[0x1F4188790](v9, v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a4 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v11, v16);
  uint64_t v17 = sub_1E0B066B8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17, v19);
  id v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ADA450(0, qword_1EBF0EA60);
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v21, *MEMORY[0x1E4FBCB28], v17);
  uint64_t v32 = sub_1E0B069D8();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v31, a4);
  unint64_t v22 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v33;
  *(void *)(v23 + 16) = a4;
  *(void *)(v23 + 24) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v23 + v22, (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  uint64_t v25 = (void *)(v23 + ((v15 + v22 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v26 = v35;
  *uint64_t v25 = v34;
  v25[1] = v26;
  aBlock[4] = sub_1E0AFCA74;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0AD7664;
  aBlock[3] = &block_descriptor_3;
  uint64_t v27 = _Block_copy(aBlock);
  swift_retain();
  sub_1E0B066C8();
  uint64_t v40 = MEMORY[0x1E4FBC860];
  sub_1E0AFC64C((unint64_t *)&unk_1EBF0EC20, MEMORY[0x1E4FBCB00]);
  sub_1E0AFBB18(0, (unint64_t *)&unk_1EBF0EC30, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1E0AD3260();
  uint64_t v28 = v36;
  sub_1E0B06A98();
  uint64_t v29 = (void *)v32;
  MEMORY[0x1E4E3BC80](0, v13, v8, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v28);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v38);
  return swift_release();
}

uint64_t sub_1E0AF8338(uint64_t a1, void (*a2)(char *))
{
  sub_1E0AFCAF8(0, &qword_1EAD62B78, MEMORY[0x1E4FBC448]);
  MEMORY[0x1F4188790](v3, v4);
  uint64_t v6 = (char *)&v13 - v5;
  uint64_t v7 = sub_1E0B06318();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ADA450(0, &qword_1EAD62AE0);
  sub_1E0B06388();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v11, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  swift_storeEnumTagMultiPayload();
  a2(v6);
  sub_1E0AFCB98((uint64_t)v6);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_1E0AF8784(uint64_t a1, void (*a2)(char *))
{
  uint64_t v13 = a2;
  sub_1E0AFCAF8(0, &qword_1EAD62B78, MEMORY[0x1E4FBC448]);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v12 - v4;
  uint64_t v6 = sub_1E0B06318();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0B06368();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v10, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  swift_storeEnumTagMultiPayload();
  v13(v5);
  sub_1E0AFCB98((uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_1E0AF8BB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E0AFC954(a1, a2, &qword_1EAD62B50, MEMORY[0x1E4F66798]);
}

uint64_t WalkingSteadinessOnboardingModel.CannotProgressReason.hash(into:)()
{
  return sub_1E0B06C18();
}

uint64_t WalkingSteadinessOnboardingModel.CannotProgressReason.hashValue.getter()
{
  return sub_1E0B06C28();
}

uint64_t WalkingSteadinessOnboardingModel.WarningReason.hash(into:)()
{
  return sub_1E0B06C18();
}

uint64_t static WalkingSteadinessOnboardingModel.WarningReason.== infix(_:_:)()
{
  return 1;
}

uint64_t WalkingSteadinessOnboardingModel.WarningReason.hashValue.getter()
{
  return sub_1E0B06C28();
}

BOOL static WalkingSteadinessOnboardingModel.ProgressionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  if (v2 >> 6)
  {
    if (v2 >> 6 == 1)
    {
      if ((v3 & 0xC0) == 0x40) {
        return 1;
      }
    }
    else if (v3 == 128)
    {
      return 1;
    }
  }
  else if (v3 <= 0x3F)
  {
    return v2 == v3;
  }
  return 0;
}

BOOL sub_1E0AF8D2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  if (!(v2 >> 6))
  {
    if (v3 < 0x40) {
      return v2 == v3;
    }
    return 0;
  }
  if (v2 >> 6 == 1) {
    return (v3 & 0xC0) == 0x40;
  }
  return v3 == 128;
}

uint64_t sub_1E0AF8D80@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(result + 17);
  return result;
}

uint64_t sub_1E0AF8D8C@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *(os_unfair_lock_s **)(v1 + 96);
  swift_retain();
  os_unfair_lock_lock(v3 + 9);
  sub_1E0AF8E10((uint64_t)&v3[4], a1);
  os_unfair_lock_unlock(v3 + 9);
  return swift_release();
}

uint64_t sub_1E0AF8E10@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 16);
  *(void *)a2 = *(void *)(result + 8);
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t WalkingSteadinessOnboardingModel.__allocating_init(featureStatusManager:detailsProvider:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v5 = a1;
  id v6 = objc_msgSend(v5, sel_featureAvailabilityProviding);
  uint64_t v12[3] = sub_1E0ADA450(0, &qword_1EAD62AE0);
  v12[4] = MEMORY[0x1E4F66930];
  v12[0] = v5;
  sub_1E0ACC180((uint64_t)v12, (uint64_t)v11);
  id v7 = v5;
  uint64_t v8 = sub_1E0AF745C();
  uint64_t v9 = (*(uint64_t (**)(unsigned char *, uint64_t, id, uint64_t, uint64_t (*)(), void))(v3 + 192))(v11, v8, v6, a2, sub_1E0AE5704, 0);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);

  return v9;
}

uint64_t WalkingSteadinessOnboardingModel.__allocating_init(featureStatusProvider:featureAvailabilityProvider:detailsProvider:dateProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1(a1, v11);
  MEMORY[0x1F4188790](v13, v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v15);
  uint64_t v17 = sub_1E0AFB594((uint64_t)v15, a2, a3, a4, a5, v5, v11, v12);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v17;
}

void *WalkingSteadinessOnboardingModel.__allocating_init(featureStatusProvider:featureStatusPublisher:featureAvailabilityProvider:detailsProvider:dateProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  uint64_t v12 = sub_1E0AFB944(a1, a2, a3, a4, a5, a6);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v12;
}

void *WalkingSteadinessOnboardingModel.init(featureStatusProvider:featureStatusPublisher:featureAvailabilityProvider:detailsProvider:dateProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v6 = sub_1E0AFB944(a1, a2, a3, a4, a5, a6);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_1E0AF9144()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v2 = *(void *)(result + 96);
    MEMORY[0x1F4188790](result, v1);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 36));
    sub_1E0AFCCBC((unsigned char *)(v2 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 36));
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1E0AF9210()
{
  uint64_t v31 = *v0;
  uint64_t v1 = sub_1E0B06318();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E0B05F88();
  uint64_t v32 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6, v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8, v11);
  uint64_t v33 = (char *)&v29 - v12;
  sub_1E0B05F78();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  uint64_t v13 = sub_1E0B06368();
  uint64_t v30 = v6;
  uint64_t v14 = v0[12];
  MEMORY[0x1F4188790](v13, v15);
  *(&v29 - 2) = (uint64_t)v5;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 36));
  sub_1E0AFC494((unsigned char *)(v14 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 36));
  swift_release();
  uint64_t v16 = v30;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  uint64_t v17 = v32;
  sub_1E0B05F78();
  sub_1E0B05F48();
  double v19 = v18;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v17 + 8);
  v20(v10, v16);
  if (qword_1EAD61F68 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1E0B06448();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EAD62AC8);
  unint64_t v22 = sub_1E0B06428();
  os_log_type_t v23 = sub_1E0B068C8();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v35[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315650;
    uint64_t v26 = sub_1E0B06C58();
    double v34 = COERCE_DOUBLE(sub_1E0ACB6F4(v26, v27, v35));
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    double v34 = COERCE_DOUBLE(sub_1E0ACB6F4(0xD000000000000019, 0x80000001E0B0C330, v35));
    sub_1E0B06A68();
    *(_WORD *)(v24 + 22) = 2048;
    double v34 = round(v19 * 1000.0) / 1000.0;
    sub_1E0B06A68();
    _os_log_impl(&dword_1E0AC7000, v22, v23, "[%s] %s: Feature status fetch execution time: %f seconds.", (uint8_t *)v24, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v25, -1, -1);
    MEMORY[0x1E4E3C540](v24, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t))v20)(v33, v16);
}

void sub_1E0AF982C(unsigned char *a1)
{
  uint64_t v2 = (void *)sub_1E0B06328();
  char v3 = sub_1E0B06A08();

  a1[1] = v3 & 1;
  uint64_t v4 = (void *)sub_1E0B06328();
  char v5 = sub_1E0B06A08();

  *a1 = v5 & 1;
}

unsigned char *sub_1E0AF98D4@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = 0x504030201uLL >> (8 * *result);
  return result;
}

uint64_t sub_1E0AF98F4(unsigned char *a1, void *a2, uint64_t a3, int a4, void (*a5)(long long *), uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v108 = a6;
  uint64_t v109 = a5;
  LODWORD(v104) = a4;
  uint64_t v107 = *v7;
  uint64_t v11 = sub_1E0B05F88();
  uint64_t v102 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v14 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AFBB18(0, &qword_1EAD623D8, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v16 - 8, v17);
  double v19 = (char *)&v102 - v18;
  uint64_t v20 = sub_1E0B05E48();
  uint64_t v105 = *(void *)(v20 - 8);
  uint64_t v106 = v20;
  MEMORY[0x1F4188790](v20, v21);
  id v103 = (char *)&v102 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AFBB18(0, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, v15);
  MEMORY[0x1F4188790](v23 - 8, v24);
  uint64_t v26 = (char *)&v102 - v25;
  uint64_t v27 = type metadata accessor for ConfirmDetailsProvider.Details();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27, v29);
  uint64_t v31 = (char *)&v102 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*a1)
  {
    case 1:
      uint64_t v104 = (uint64_t)v31;
      uint64_t v110 = (uint64_t)a2;
      uint64_t v111 = a3;
      sub_1E0AD48AC(0, &qword_1EAD62AE8);
      sub_1E0AD48AC(0, &qword_1EAD62AF0);
      id v42 = a2;
      if (!swift_dynamicCast())
      {
        uint64_t v114 = 0;
        long long v112 = 0u;
        long long v113 = 0u;
        sub_1E0AFBC80((uint64_t)&v112, (uint64_t (*)(void))sub_1E0AFBB7C);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v26, 1, 1, v27);
LABEL_20:
        sub_1E0AFBBE8((uint64_t)v26, (unint64_t *)&qword_1EAD62118, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        if (qword_1EAD61F68 != -1) {
          swift_once();
        }
        uint64_t v53 = sub_1E0B06448();
        __swift_project_value_buffer(v53, (uint64_t)qword_1EAD62AC8);
        uint64_t v35 = sub_1E0B06428();
        os_log_type_t v54 = sub_1E0B068B8();
        if (os_log_type_enabled(v35, v54))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          *(void *)&long long v112 = v38;
          *(_DWORD *)uint64_t v37 = 136446466;
          uint64_t v55 = sub_1E0B06C58();
          uint64_t v110 = sub_1E0ACB6F4(v55, v56, (uint64_t *)&v112);
          sub_1E0B06A68();
          swift_bridgeObjectRelease();
          *(_WORD *)(v37 + 12) = 2082;
          uint64_t v110 = sub_1E0ACB6F4(0xD000000000000052, 0x80000001E0B0C210, (uint64_t *)&v112);
          sub_1E0B06A68();
          unint64_t v57 = "[%{public}s.%{public}s]: Confirm details screen should provide details";
          goto LABEL_24;
        }
        goto LABEL_26;
      }
      uint64_t v43 = *((void *)&v113 + 1);
      uint64_t v44 = v114;
      __swift_project_boxed_opaque_existential_1(&v112, *((uint64_t *)&v113 + 1));
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v44);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v112);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1) {
        goto LABEL_20;
      }
      uint64_t v45 = v104;
      sub_1E0AD9164((uint64_t)v26, v104);
      sub_1E0AFC954(v45, (uint64_t)v19, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
      uint64_t v47 = v105;
      uint64_t v46 = v106;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v105 + 48))(v19, 1, v106) == 1)
      {
        sub_1E0AFBBE8((uint64_t)v19, &qword_1EAD623D8, MEMORY[0x1E4F26F90]);
LABEL_59:
        uint64_t v95 = v7[8];
        v96 = (void *)swift_allocObject();
        v96[2] = v109;
        v96[3] = v108;
        v96[4] = v7;
        uint64_t v97 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), void *))(*(void *)v95 + 200);
        swift_retain();
        swift_retain();
        uint64_t v98 = v104;
        v97(v104, sub_1E0AFBC74, v96);
        swift_release();
        return sub_1E0AFBC80(v98, (uint64_t (*)(void))type metadata accessor for ConfirmDetailsProvider.Details);
      }
      uint64_t v72 = v103;
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v103, v19, v46);
      uint64_t v73 = *MEMORY[0x1E4F2BF88];
      uint64_t v74 = (void *)sub_1E0B05E28();
      ((void (*)(void))v7[9])();
      unint64_t v75 = (void *)sub_1E0B05F58();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v14, v11);
      id v76 = objc_msgSend(v74, sel_hk_ageWithCurrentDate_, v75);

      if ((uint64_t)v76 >= v73)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v72, v46);
        goto LABEL_59;
      }
      if (qword_1EAD61F68 != -1) {
        swift_once();
      }
      uint64_t v77 = sub_1E0B06448();
      __swift_project_value_buffer(v77, (uint64_t)qword_1EAD62AC8);
      uint64_t v78 = sub_1E0B06428();
      os_log_type_t v79 = sub_1E0B068C8();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        *(void *)&long long v112 = v81;
        *(_DWORD *)uint64_t v80 = 136446210;
        uint64_t v82 = sub_1E0B06C58();
        uint64_t v110 = sub_1E0ACB6F4(v82, v83, (uint64_t *)&v112);
        uint64_t v47 = v105;
        sub_1E0B06A68();
        uint64_t v72 = v103;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1E0AC7000, v78, v79, "[%{public}s] User not old enough to continue onboarding", v80, 0xCu);
        swift_arrayDestroy();
        uint64_t v84 = v81;
        uint64_t v46 = v106;
        MEMORY[0x1E4E3C540](v84, -1, -1);
        MEMORY[0x1E4E3C540](v80, -1, -1);
      }

      LOBYTE(v112) = 1;
      v109(&v112);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v72, v46);
      return sub_1E0AFBC80(v104, (uint64_t (*)(void))type metadata accessor for ConfirmDetailsProvider.Details);
    case 2:
    case 4:
      goto LABEL_27;
    case 3:
      sub_1E0AF9210();
      uint64_t v48 = v7[12];
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v48 + 36));
      sub_1E0AFAC88((unsigned char *)(v48 + 16), &v112);
      os_unfair_lock_unlock((os_unfair_lock_t)(v48 + 36));
      int v49 = v112;
      swift_release();
      if (v49 == 2)
      {
        if (qword_1EAD61F68 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_1E0B06448();
        __swift_project_value_buffer(v50, (uint64_t)qword_1EAD62AC8);
        uint64_t v35 = sub_1E0B06428();
        os_log_type_t v36 = sub_1E0B068B8();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          *(void *)&long long v112 = v38;
          *(_DWORD *)uint64_t v37 = 136446210;
          uint64_t v51 = sub_1E0B06C58();
          uint64_t v110 = sub_1E0ACB6F4(v51, v52, (uint64_t *)&v112);
          sub_1E0B06A68();
          swift_bridgeObjectRelease();
          uint64_t v41 = "[%{public}s] Fitness tracking enabled determination not present at time of progressing from notifications";
          goto LABEL_16;
        }
        goto LABEL_26;
      }
      if ((v49 & 1) == 0)
      {
        if (qword_1EAD61F68 != -1) {
          swift_once();
        }
        uint64_t v60 = sub_1E0B06448();
        __swift_project_value_buffer(v60, (uint64_t)qword_1EAD62AC8);
        uint64_t v61 = sub_1E0B06428();
        os_log_type_t v62 = sub_1E0B06898();
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = swift_slowAlloc();
          uint64_t v64 = swift_slowAlloc();
          *(void *)&long long v112 = v64;
          *(_DWORD *)uint64_t v63 = 136446466;
          uint64_t v65 = sub_1E0B06C58();
          uint64_t v110 = sub_1E0ACB6F4(v65, v66, (uint64_t *)&v112);
          sub_1E0B06A68();
          swift_bridgeObjectRelease();
          *(_WORD *)(v63 + 12) = 2082;
          uint64_t v110 = sub_1E0ACB6F4(0xD000000000000052, 0x80000001E0B0C210, (uint64_t *)&v112);
          sub_1E0B06A68();
          _os_log_impl(&dword_1E0AC7000, v61, v62, "[%{public}s.%{public}s]: Motion & Fitness Tracking disabled, warning", (uint8_t *)v63, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1E4E3C540](v64, -1, -1);
          MEMORY[0x1E4E3C540](v63, -1, -1);
        }

        char v58 = 64;
        goto LABEL_28;
      }
      if (v104)
      {
        uint64_t v67 = (os_unfair_lock_s *)v7[12];
        swift_retain();
        os_unfair_lock_lock(v67 + 9);
        sub_1E0AFAC94((uint64_t)&v67[4], &v112);
        os_unfair_lock_unlock(v67 + 9);
        int v68 = v112;
        swift_release();
        if (v68 == 2)
        {
          if (qword_1EAD61F68 != -1) {
            swift_once();
          }
          uint64_t v69 = sub_1E0B06448();
          __swift_project_value_buffer(v69, (uint64_t)qword_1EAD62AC8);
          uint64_t v35 = sub_1E0B06428();
          os_log_type_t v36 = sub_1E0B068B8();
          if (os_log_type_enabled(v35, v36))
          {
            uint64_t v37 = swift_slowAlloc();
            uint64_t v38 = swift_slowAlloc();
            *(void *)&long long v112 = v38;
            *(_DWORD *)uint64_t v37 = 136446210;
            uint64_t v70 = sub_1E0B06C58();
            uint64_t v110 = sub_1E0ACB6F4(v70, v71, (uint64_t *)&v112);
            sub_1E0B06A68();
            swift_bridgeObjectRelease();
            uint64_t v41 = "[%{public}s] Notifications authorized determination not present at time of progressing from notifications";
LABEL_16:
            _os_log_impl(&dword_1E0AC7000, v35, v36, v41, (uint8_t *)v37, 0xCu);
LABEL_25:
            swift_arrayDestroy();
            MEMORY[0x1E4E3C540](v38, -1, -1);
            MEMORY[0x1E4E3C540](v37, -1, -1);
          }
          goto LABEL_26;
        }
        if ((v68 & 1) == 0)
        {
          if (qword_1EAD61F68 != -1) {
            swift_once();
          }
          uint64_t v88 = sub_1E0B06448();
          __swift_project_value_buffer(v88, (uint64_t)qword_1EAD62AC8);
          uint64_t v89 = sub_1E0B06428();
          os_log_type_t v90 = sub_1E0B068C8();
          if (os_log_type_enabled(v89, v90))
          {
            uint64_t v91 = swift_slowAlloc();
            uint64_t v92 = swift_slowAlloc();
            *(void *)&long long v112 = v92;
            *(_DWORD *)uint64_t v91 = 136446466;
            uint64_t v93 = sub_1E0B06C58();
            uint64_t v110 = sub_1E0ACB6F4(v93, v94, (uint64_t *)&v112);
            sub_1E0B06A68();
            swift_bridgeObjectRelease();
            *(_WORD *)(v91 + 12) = 2082;
            uint64_t v110 = sub_1E0ACB6F4(0xD000000000000052, 0x80000001E0B0C210, (uint64_t *)&v112);
            sub_1E0B06A68();
            _os_log_impl(&dword_1E0AC7000, v89, v90, "[%{public}s.%{public}s]: Notification authorization denied, cannot proceed", (uint8_t *)v91, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1E4E3C540](v92, -1, -1);
            MEMORY[0x1E4E3C540](v91, -1, -1);
          }

          char v58 = 3;
          goto LABEL_28;
        }
        if (qword_1EAD61F68 != -1) {
          swift_once();
        }
        uint64_t v99 = sub_1E0B06448();
        __swift_project_value_buffer(v99, (uint64_t)qword_1EAD62AC8);
        uint64_t v35 = sub_1E0B06428();
        os_log_type_t v54 = sub_1E0B06898();
        if (!os_log_type_enabled(v35, v54))
        {
LABEL_26:

LABEL_27:
          char v58 = 0x80;
LABEL_28:
          LOBYTE(v112) = v58;
          return ((uint64_t (*)(long long *))v109)(&v112);
        }
        uint64_t v37 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(void *)&long long v112 = v38;
        *(_DWORD *)uint64_t v37 = 136446466;
        uint64_t v100 = sub_1E0B06C58();
        uint64_t v110 = sub_1E0ACB6F4(v100, v101, (uint64_t *)&v112);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2082;
        uint64_t v110 = sub_1E0ACB6F4(0xD000000000000052, 0x80000001E0B0C210, (uint64_t *)&v112);
        sub_1E0B06A68();
        unint64_t v57 = "[%{public}s.%{public}s]: Motion & Fitness Tracking enabled and notification authorization authorized, proceeding";
      }
      else
      {
        if (qword_1EAD61F68 != -1) {
          swift_once();
        }
        uint64_t v85 = sub_1E0B06448();
        __swift_project_value_buffer(v85, (uint64_t)qword_1EAD62AC8);
        uint64_t v35 = sub_1E0B06428();
        os_log_type_t v54 = sub_1E0B06898();
        if (!os_log_type_enabled(v35, v54)) {
          goto LABEL_26;
        }
        uint64_t v37 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(void *)&long long v112 = v38;
        *(_DWORD *)uint64_t v37 = 136446466;
        uint64_t v86 = sub_1E0B06C58();
        uint64_t v110 = sub_1E0ACB6F4(v86, v87, (uint64_t *)&v112);
        sub_1E0B06A68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2082;
        uint64_t v110 = sub_1E0ACB6F4(0xD000000000000052, 0x80000001E0B0C210, (uint64_t *)&v112);
        sub_1E0B06A68();
        unint64_t v57 = "[%{public}s.%{public}s]: Secondary button pressed, not enabling notifications";
      }
LABEL_24:
      _os_log_impl(&dword_1E0AC7000, v35, v54, v57, (uint8_t *)v37, 0x16u);
      goto LABEL_25;
    default:
      uint64_t v32 = v7[12];
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v32 + 36));
      sub_1E0AFCC9C((unsigned char *)(v32 + 16), &v112);
      os_unfair_lock_unlock((os_unfair_lock_t)(v32 + 36));
      int v33 = v112;
      swift_release();
      if (v33 == 2)
      {
        if (qword_1EAD61F68 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_1E0B06448();
        __swift_project_value_buffer(v34, (uint64_t)qword_1EAD62AC8);
        uint64_t v35 = sub_1E0B06428();
        os_log_type_t v36 = sub_1E0B068B8();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          *(void *)&long long v112 = v38;
          *(_DWORD *)uint64_t v37 = 136446210;
          uint64_t v39 = sub_1E0B06C58();
          uint64_t v110 = sub_1E0ACB6F4(v39, v40, (uint64_t *)&v112);
          sub_1E0B06A68();
          swift_bridgeObjectRelease();
          uint64_t v41 = "[%{public}s] Fitness tracking enabled determination not present at time of progressing from start";
          goto LABEL_16;
        }
        goto LABEL_26;
      }
      if (v33) {
        goto LABEL_27;
      }
      LOBYTE(v112) = 0;
      return ((uint64_t (*)(long long *))v109)(&v112);
  }
}

uint64_t sub_1E0AFABA8(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    char v9 = 2;
    char v5 = &v9;
  }
  else
  {
    uint64_t v6 = *(os_unfair_lock_s **)(a4 + 96);
    MEMORY[0x1F4188790](a1, a2);
    swift_retain();
    os_unfair_lock_lock(v6 + 9);
    sub_1E0AFC484((uint64_t)&v6[4]);
    os_unfair_lock_unlock(v6 + 9);
    swift_release();
    char v8 = 0x80;
    char v5 = &v8;
  }
  return a2(v5);
}

unsigned char *sub_1E0AFAC88@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1E0AFAC94@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(result + 1);
  return result;
}

uint64_t sub_1E0AFACA0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *v3;
  uint64_t v17 = a2;
  sub_1E0AE89E8();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (os_unfair_lock_s *)v3[12];
  char v18 = a1;
  swift_retain();
  os_unfair_lock_lock(v12 + 9);
  sub_1E0AFBCE0((uint64_t)&v12[4]);
  os_unfair_lock_unlock(v12 + 9);
  swift_release();
  uint64_t v13 = v3[7];
  swift_getObjectType();
  sub_1E0B06938();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v17;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = v13;
  *(unsigned char *)(v14 + 40) = a1 & 1;
  *(void *)(v14 + 48) = v16;
  swift_retain();
  swift_unknownObjectRetain();
  sub_1E0B069F8();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_1E0AFAE84(char a1, void *a2, uint64_t (*a3)(void, void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  sub_1E0AE89E8();
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v15);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_getObjectType();
    sub_1E0B06948();
    char v18 = (void *)swift_allocObject();
    v18[2] = a3;
    void v18[3] = a4;
    v18[4] = a7;
    swift_retain();
    sub_1E0B069F8();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  else
  {
    if (qword_1EAD61F68 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1E0B06448();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EAD62AC8);
    id v21 = a2;
    id v22 = a2;
    uint64_t v23 = sub_1E0B06428();
    os_log_type_t v24 = sub_1E0B068A8();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v32 = a3;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v34[0] = v27;
      *(_DWORD *)uint64_t v25 = 136446466;
      uint64_t v28 = sub_1E0B06C58();
      uint64_t v33 = sub_1E0ACB6F4(v28, v29, v34);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2112;
      if (a2)
      {
        id v30 = a2;
        uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v33 = v31;
        sub_1E0B06A68();
      }
      else
      {
        uint64_t v33 = 0;
        sub_1E0B06A68();
        uint64_t v31 = 0;
      }
      *uint64_t v26 = v31;

      _os_log_impl(&dword_1E0AC7000, v23, v24, "[%{public}s] Error when saving onboarding acknowledgement: %@", (uint8_t *)v25, 0x16u);
      sub_1E0AE4F20();
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v26, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v27, -1, -1);
      MEMORY[0x1E4E3C540](v25, -1, -1);

      a3 = v32;
    }
    else
    {
    }
    return a3(0, a2);
  }
}

uint64_t sub_1E0AFB23C(char a1, void *a2, uint64_t (*a3)(uint64_t, void *))
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = 1;
    char v5 = 0;
  }
  else
  {
    if (qword_1EAD61F68 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1E0B06448();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EAD62AC8);
    id v8 = a2;
    id v9 = a2;
    uint64_t v10 = sub_1E0B06428();
    os_log_type_t v11 = sub_1E0B068A8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v20[0] = v19;
      *(_DWORD *)uint64_t v12 = 136446466;
      uint64_t v14 = sub_1E0B06C58();
      sub_1E0ACB6F4(v14, v15, v20);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2112;
      if (a2)
      {
        id v16 = a2;
        uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
        sub_1E0B06A68();
      }
      else
      {
        sub_1E0B06A68();
        uint64_t v17 = 0;
      }
      *uint64_t v13 = v17;

      _os_log_impl(&dword_1E0AC7000, v10, v11, "[%{public}s] Error when saving onboarding acknowledgement: %@", (uint8_t *)v12, 0x16u);
      sub_1E0AE4F20();
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v13, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v19, -1, -1);
      MEMORY[0x1E4E3C540](v12, -1, -1);
    }
    else
    {
    }
    uint64_t v4 = 0;
    char v5 = a2;
  }
  return a3(v4, v5);
}

uint64_t WalkingSteadinessOnboardingModel.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t WalkingSteadinessOnboardingModel.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186488](v0, 104, 7);
}

uint64_t sub_1E0AFB594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v21[3] = a7;
  v21[4] = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(boxed_opaque_existential_1, a1, a7);
  sub_1E0ACC180((uint64_t)v21, (uint64_t)v20);
  uint64_t v17 = sub_1E0AF7758(a7, a8);
  uint64_t v18 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 192))(v20, v17, a2, a3, a4, a5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  return v18;
}

unint64_t sub_1E0AFB694(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1E0B06B48();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1E0AFC5B8();
      uint64_t result = sub_1E0B06AA8();
      unint64_t v3 = result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1E0B06B48();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  unint64_t v3 = MEMORY[0x1E4FBC870];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  unint64_t v8 = v3 + 56;
  unint64_t v22 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v21 = v1;
  while (v22)
  {
    uint64_t result = MEMORY[0x1E4E3BDB0](v7, v1);
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_26;
    }
LABEL_18:
    sub_1E0B065F8();
    sub_1E0AFC64C(&qword_1EAD62B30, MEMORY[0x1E4F1AB18]);
    uint64_t result = sub_1E0B06748();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)(v8 + 8 * (v12 >> 6));
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_1E0AFC64C(&qword_1EAD62B38, MEMORY[0x1E4F1AB18]);
      do
      {
        uint64_t result = sub_1E0B06778();
        if (result)
        {
          uint64_t result = swift_release();
          unint64_t v1 = v21;
          goto LABEL_11;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)(v8 + 8 * (v12 >> 6));
        uint64_t v15 = 1 << v12;
      }
      while ((v14 & (1 << v12)) != 0);
      unint64_t v1 = v21;
    }
    *(void *)(v8 + 8 * v13) = v15 | v14;
    *(void *)(*(void *)(v3 + 48) + 8 * v12) = v9;
    uint64_t v17 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v17, 1);
    uint64_t v18 = v17 + 1;
    if (v10) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v18;
LABEL_11:
    if (v7 == v5) {
      return v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_28;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1E0AFB944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7 = v6;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1E0B06B48()) {
    unint64_t v13 = sub_1E0AFB694(MEMORY[0x1E4FBC860]);
  }
  else {
    unint64_t v13 = MEMORY[0x1E4FBC870];
  }
  v7[11] = v13;
  sub_1E0ACC180(a1, (uint64_t)(v7 + 2));
  v7[7] = a3;
  v7[8] = a4;
  v7[9] = a5;
  v7[10] = a6;
  sub_1E0AFC4B0();
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 36) = 0;
  *(_WORD *)(v14 + 16) = 514;
  *(void *)(v14 + 24) = 0;
  *(_WORD *)(v14 + 32) = 513;
  v7[12] = v14;
  swift_allocObject();
  swift_weakInit();
  sub_1E0AFC550();
  sub_1E0AFC64C(&qword_1EAD62B20, (void (*)(uint64_t))sub_1E0AFC550);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  sub_1E0B06688();
  swift_release();
  swift_beginAccess();
  sub_1E0B065E8();
  swift_endAccess();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v7;
}

void sub_1E0AFBB18(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1E0AFBB7C()
{
  if (!qword_1EAD62AF8)
  {
    sub_1E0AD48AC(255, &qword_1EAD62AF0);
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62AF8);
    }
  }
}

uint64_t sub_1E0AFBBE8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E0AFBB18(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1E0AFBC58()
{
  return objectdestroyTm_0(MEMORY[0x1E4FBC8D0], 40);
}

uint64_t sub_1E0AFBC74(uint64_t a1)
{
  return sub_1E0AFABA8(a1, *(uint64_t (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1E0AFBC80(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E0AFBCE0(uint64_t result)
{
  *(unsigned char *)(result + 17) = *(unsigned char *)(v1 + 16);
  return result;
}

uint64_t sub_1E0AFBCEC()
{
  return objectdestroyTm_0(MEMORY[0x1E4FBC8F8], 56);
}

uint64_t objectdestroyTm_0(void (*a1)(void), uint64_t a2)
{
  swift_release();
  a1(*(void *)(v2 + 32));
  return MEMORY[0x1F4186498](v2, a2, 7);
}

uint64_t sub_1E0AFBD64(char a1, void *a2)
{
  return sub_1E0AFAE84(a1, a2, *(uint64_t (**)(void, void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), *(void *)(v2 + 48));
}

unint64_t sub_1E0AFBD7C()
{
  unint64_t result = qword_1EAD62B00;
  if (!qword_1EAD62B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62B00);
  }
  return result;
}

unint64_t sub_1E0AFBDD4()
{
  unint64_t result = qword_1EAD62B08;
  if (!qword_1EAD62B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62B08);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingModel()
{
  return self;
}

uint64_t method lookup function for WalkingSteadinessOnboardingModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingModel);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.changedDetailItems.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.__allocating_init(featureStatusProvider:featureStatusPublisher:featureAvailabilityProvider:detailsProvider:dateProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.nextStage(after:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.determineProgressionState(from:viewController:wasPrimaryButtonPressed:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.completeOnboarding(turnOnNotifications:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingModel.CannotProgressReason(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.CannotProgressReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x1E0AFC064);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.CannotProgressReason()
{
  return &type metadata for WalkingSteadinessOnboardingModel.CannotProgressReason;
}

unsigned char *storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.WarningReason(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1E0AFC138);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.WarningReason()
{
  return &type metadata for WalkingSteadinessOnboardingModel.WarningReason;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingModel.ProgressionState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x3E) {
    goto LABEL_17;
  }
  if (a2 + 194 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 194) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 194;
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
      return (*a1 | (v4 << 8)) - 194;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 194;
    }
  }
LABEL_17:
  unsigned int v6 = (*a1 & 0x3C | (*a1 >> 6)) ^ 0x3F;
  if (v6 >= 0x3D) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.ProgressionState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 194 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 194) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x3E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x3D)
  {
    unsigned int v6 = ((a2 - 62) >> 8) + 1;
    *unint64_t result = a2 - 62;
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
        JUMPOUT(0x1E0AFC2E4);
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
          *unint64_t result = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_1E0AFC30C(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 6;
  }
  else {
    return (v1 & 3u) + 2;
  }
}

unsigned char *sub_1E0AFC328(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_1E0AFC338(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    *unint64_t result = *result & 3 | ((_BYTE)a2 << 6);
  }
  else {
    *unint64_t result = (a2 + 2) & 3 | 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.ProgressionState()
{
  return &type metadata for WalkingSteadinessOnboardingModel.ProgressionState;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingModel.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && a1[18]) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *a1;
  if (v3 >= 2) {
    int v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v4 = -2;
  }
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.State()
{
  return &type metadata for WalkingSteadinessOnboardingModel.State;
}

uint64_t sub_1E0AFC440()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E0AFC478(char a1, void *a2)
{
  return sub_1E0AFB23C(a1, a2, *(uint64_t (**)(uint64_t, void *))(v2 + 16));
}

uint64_t sub_1E0AFC484(uint64_t result)
{
  *(void *)(result + 8) = *(void *)(v1 + 16);
  *(unsigned char *)(result + 16) = 0;
  return result;
}

void sub_1E0AFC494(unsigned char *a1)
{
}

void sub_1E0AFC4B0()
{
  if (!qword_1EAD62B10)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1E0B06AF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62B10);
    }
  }
}

uint64_t sub_1E0AFC510()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E0AFC548()
{
  return sub_1E0AF9144();
}

void sub_1E0AFC550()
{
  if (!qword_1EAD62B18)
  {
    sub_1E0B06318();
    unint64_t v0 = sub_1E0B065D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62B18);
    }
  }
}

void sub_1E0AFC5B8()
{
  if (!qword_1EAD62B28)
  {
    sub_1E0B065F8();
    sub_1E0AFC64C(&qword_1EAD62B30, MEMORY[0x1E4F1AB18]);
    unint64_t v0 = sub_1E0B06AB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62B28);
    }
  }
}

uint64_t sub_1E0AFC64C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1E0AFC694()
{
  if (!qword_1EAD62B40)
  {
    sub_1E0AFCAF8(255, &qword_1EAD62B48, MEMORY[0x1E4F1AC28]);
    sub_1E0B06318();
    sub_1E0AFC72C();
    unint64_t v0 = sub_1E0B06588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62B40);
    }
  }
}

unint64_t sub_1E0AFC72C()
{
  unint64_t result = qword_1EAD62B58;
  if (!qword_1EAD62B58)
  {
    sub_1E0AFCAF8(255, &qword_1EAD62B48, MEMORY[0x1E4F1AC28]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62B58);
  }
  return result;
}

void sub_1E0AFC7A0()
{
  if (!qword_1EAD62B60)
  {
    sub_1E0AFC694();
    sub_1E0AFC550();
    sub_1E0AFC64C(&qword_1EAD62B68, (void (*)(uint64_t))sub_1E0AFC694);
    sub_1E0AFC64C(&qword_1EAD62B20, (void (*)(uint64_t))sub_1E0AFC550);
    unint64_t v0 = sub_1E0B065A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62B60);
    }
  }
}

uint64_t sub_1E0AFC88C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1E0AFC914(uint64_t a1, uint64_t a2)
{
  return sub_1E0AF7EB0(a1, a2, v2+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80)), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1E0AFC954(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_1E0AFBB18(0, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1E0AFC9D4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

uint64_t sub_1E0AFCA74()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  return sub_1E0AF8784(v0 + v1, *(void (**)(char *))(v0+ ((*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_1E0AFCAF8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void, void))
{
  if (!*a2)
  {
    sub_1E0AFBB18(255, &qword_1EAD62B50, MEMORY[0x1E4F66798], MEMORY[0x1E4FBB718]);
    unint64_t v7 = a3(a1, v6, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC278]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1E0AFCB98(uint64_t a1)
{
  sub_1E0AFCAF8(0, &qword_1EAD62B78, MEMORY[0x1E4FBC448]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E0AFCC10()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E0AFCC48(uint64_t a1, uint64_t a2)
{
  return sub_1E0AF7AF8(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_1E0AFCC50()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E0AFCC90()
{
  return sub_1E0AF8338(*(void *)(v0 + 16), *(void (**)(char *))(v0 + 24));
}

unsigned char *sub_1E0AFCC9C@<X0>(unsigned char *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1E0AFAC88(a1, a2);
}

void sub_1E0AFCCBC(unsigned char *a1)
{
}

uint64_t WalkingSteadinessOnboardingLevelsViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return WalkingSteadinessOnboardingLevelsViewController.init()();
}

void WalkingSteadinessOnboardingLevelsViewController.stage.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + qword_1EAD62B80);
}

uint64_t sub_1E0AFCD14()
{
  uint64_t v1 = v0 + qword_1EAD62B88;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0AFCD64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + qword_1EAD62B88;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1E0AFCDD0(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = qword_1EAD62B88;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACC500;
}

uint64_t WalkingSteadinessOnboardingLevelsViewController.init()()
{
  *(unsigned char *)(v0 + qword_1EAD62B80) = 2;
  *(void *)(v0 + qword_1EAD62B88 + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v1 = (void *)(v0 + qword_1EAD62B90);
  *uint64_t v1 = 0xD000000000000025;
  v1[1] = 0x80000001E0B0C350;
  type metadata accessor for WalkingSteadinessLevelsDataSource();
  swift_allocObject();
  sub_1E0B02F4C();
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v3 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  return sub_1E0B06298();
}

void sub_1E0AFD044()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingLevelsViewController();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_tableView);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_setSeparatorStyle_, 0);

    id v3 = objc_msgSend(v0, sel_tableView);
    if (v3)
    {
      uint64_t v4 = v3;
      objc_msgSend(v3, sel_setContentInset_, -7.0, 0.0, 0.0, 0.0);

      id v5 = objc_msgSend(v0, sel_headerView);
      LODWORD(v6) = 1036831949;
      objc_msgSend(v5, sel_setTitleHyphenationFactor_, v6);

      uint64_t v7 = (void *)sub_1E0B06788();
      uint64_t v8 = (void *)sub_1E0B06788();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1E0AFD1B4(void *a1)
{
  id v1 = a1;
  sub_1E0AFD044();
}

uint64_t sub_1E0AFD1FC(char *a1)
{
  id v2 = &a1[qword_1EAD62B88];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v2);
  if (result)
  {
    uint64_t v4 = *((void *)v2 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(v4 + 8);
    double v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1E0AFD2A8(char *a1)
{
  id v2 = &a1[qword_1EAD62B88];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v2);
  if (result)
  {
    uint64_t v4 = *((void *)v2 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(v4 + 16);
    double v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1E0AFD354(char *a1)
{
  id v2 = &a1[qword_1EAD62B88];
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v2);
  if (result)
  {
    uint64_t v4 = *((void *)v2 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(v4 + 24);
    double v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

void WalkingSteadinessOnboardingLevelsViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

void WalkingSteadinessOnboardingLevelsViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

uint64_t sub_1E0AFD460()
{
  sub_1E0ACD748(v0 + qword_1EAD62B88);
  return swift_bridgeObjectRelease();
}

id WalkingSteadinessOnboardingLevelsViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingLevelsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E0AFD4DC(uint64_t a1)
{
  sub_1E0ACD748(a1 + qword_1EAD62B88);
  return swift_bridgeObjectRelease();
}

void sub_1E0AFD52C(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + qword_1EAD62B80);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingLevelsViewController()
{
  uint64_t result = qword_1EAD62B98;
  if (!qword_1EAD62B98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0AFD58C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + qword_1EAD62B88;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E3C5D0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E0AFD5E8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + qword_1EAD62B88;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1E0AFD64C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingLevelsViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessOnboardingLevelsViewController);
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 24))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 32))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController
                              + (*MEMORY[0x1E4FBC8C8] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController + v0 + 48))();
}

uint64_t sub_1E0AFD7D0()
{
  return type metadata accessor for WalkingSteadinessOnboardingLevelsViewController();
}

void sub_1E0AFD7D8()
{
  qword_1EAD62BA8 = 0;
}

uint64_t ConfirmDetailsLearnMoreView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_configuration;
  uint64_t v4 = sub_1E0B06558();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

id sub_1E0AFD858()
{
  return sub_1E0AFD8C0(&OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel, MEMORY[0x1E4FB0F70], MEMORY[0x1E4FB0F80]);
}

id sub_1E0AFD88C()
{
  return sub_1E0AFD8C0(&OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel, MEMORY[0x1E4FB0F78], MEMORY[0x1E4FB0F58]);
}

id sub_1E0AFD8C0(uint64_t *a1, void (*a2)(uint64_t), void (*a3)(uint64_t))
{
  uint64_t v7 = v3;
  uint64_t v8 = sub_1E0B064E8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  unint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)&v33 - v16;
  uint64_t v18 = *a1;
  unint64_t v19 = *(void **)(v3 + *a1);
  if (v19)
  {
    id v20 = *(id *)(v3 + *a1);
  }
  else
  {
    uint64_t v34 = a3;
    a2(v15);
    uint64_t v33 = sub_1E0B064A8();
    unint64_t v21 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    uint64_t v22 = v21(v17, v8);
    a2(v22);
    uint64_t v23 = (void *)sub_1E0B064C8();
    uint64_t v24 = v21(v13, v8);
    uint64_t v25 = (void *)v33;
    v34(v24);
    uint64_t v27 = v26;
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
    objc_msgSend(v28, sel_setNumberOfLines_, 0);
    objc_msgSend(v28, sel_setFont_, v25);
    objc_msgSend(v28, sel_setTextColor_, v23);
    unint64_t v29 = v28;
    if (v27)
    {
      unint64_t v29 = (void *)sub_1E0B06788();
      swift_bridgeObjectRelease();
      objc_msgSend(v28, sel_setText_, v29);
    }
    id v30 = *(void **)(v7 + v18);
    *(void *)(v7 + v18) = v28;
    id v20 = v28;

    unint64_t v19 = 0;
  }
  id v31 = v19;
  return v20;
}

id sub_1E0AFDB08()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E0B064E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  double v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel];
  if (v8)
  {
    id v9 = *(id *)&v0[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel];
  }
  else
  {
    sub_1E0B06528();
    uint64_t v10 = (void *)sub_1E0B064A8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v11 = objc_msgSend(v1, sel_tintColor);
    if (qword_1EAD61EC0 != -1) {
      swift_once();
    }
    id v12 = (id)qword_1EAD625F0;
    swift_bridgeObjectRetain();
    sub_1E0B05E58();
    swift_bridgeObjectRelease();

    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
    objc_msgSend(v13, sel_setNumberOfLines_, 0);
    objc_msgSend(v13, sel_setFont_, v10);
    if (v11) {
      objc_msgSend(v13, sel_setTextColor_, v11);
    }
    uint64_t v14 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setText_, v14);

    uint64_t v15 = *(void **)&v1[v7];
    *(void *)&v1[v7] = v13;
    id v9 = v13;

    uint64_t v8 = 0;
  }
  id v16 = v8;
  return v9;
}

id sub_1E0AFDD84()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1D38]), sel_initWithTarget_action_, v0, sel_learnMoreTapped);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id ConfirmDetailsLearnMoreView.__deallocating_deinit()
{
  id v1 = sub_1E0AFDB08();
  id v2 = sub_1E0AFDD84();
  objc_msgSend(v1, sel_removeGestureRecognizer_, v2);

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ConfirmDetailsLearnMoreView()
{
  uint64_t result = qword_1EAD62BD8;
  if (!qword_1EAD62BD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id ConfirmDetailsLearnMoreView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ConfirmDetailsLearnMoreView.init(frame:)()
{
}

uint64_t sub_1E0AFE298()
{
  return type metadata accessor for ConfirmDetailsLearnMoreView();
}

uint64_t sub_1E0AFE2D0()
{
  uint64_t result = sub_1E0B06558();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ConfirmDetailsLearnMoreView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfirmDetailsLearnMoreView);
}

id sub_1E0AFE394(uint64_t a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = &v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate];
  *(void *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer] = 0;
  id v9 = &v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_configuration];
  uint64_t v10 = sub_1E0B06558();
  uint64_t v75 = *(void *)(v10 - 8);
  uint64_t v76 = v10;
  uint64_t v77 = a1;
  (*(void (**)(char *, uint64_t))(v75 + 16))(v9, a1);
  *((void *)v8 + 1) = a4;
  swift_unknownObjectWeakAssign();
  v78.receiver = v4;
  v78.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  id v11 = objc_msgSendSuper2(&v78, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v12 = qword_1EAD61F70;
  id v13 = v11;
  if (v12 != -1) {
    swift_once();
  }
  double v14 = a2 - (*(double *)&qword_1EAD62BA8 + *(double *)&qword_1EAD62BA8);
  id v15 = sub_1E0AFD858();
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v16 = sub_1E0AFD858();
  objc_msgSend(v16, sel_setPreferredMaxLayoutWidth_, v14);

  id v17 = v13;
  id v18 = sub_1E0AFD858();
  objc_msgSend(v17, sel_addSubview_, v18);

  id v19 = sub_1E0AFD88C();
  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v20 = sub_1E0AFD88C();
  objc_msgSend(v20, sel_setPreferredMaxLayoutWidth_, v14);

  id v21 = v17;
  id v22 = sub_1E0AFD88C();
  objc_msgSend(v21, sel_addSubview_, v22);

  id v23 = sub_1E0AFDB08();
  objc_msgSend(v23, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v24 = sub_1E0AFDB08();
  objc_msgSend(v24, sel_setUserInteractionEnabled_, 1);

  id v25 = sub_1E0AFDB08();
  id v26 = sub_1E0AFDD84();
  objc_msgSend(v25, sel_addGestureRecognizer_, v26);

  id v27 = v21;
  id v28 = sub_1E0AFDB08();
  objc_msgSend(v27, sel_addSubview_, v28);

  id v74 = self;
  sub_1E0AE3E74();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1E0B096F0;
  id v30 = sub_1E0AFD858();
  id v31 = objc_msgSend(v30, sel_topAnchor);

  id v32 = objc_msgSend(v27, sel_topAnchor);
  id v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

  *(void *)(v29 + 32) = v33;
  id v34 = sub_1E0AFD858();
  id v35 = objc_msgSend(v34, sel_leadingAnchor);

  id v36 = objc_msgSend(v27, sel_leadingAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_constant_, v36, *(double *)&qword_1EAD62BA8);

  *(void *)(v29 + 40) = v37;
  id v38 = sub_1E0AFD858();
  id v39 = objc_msgSend(v38, sel_trailingAnchor);

  id v40 = objc_msgSend(v27, sel_trailingAnchor);
  id v41 = objc_msgSend(v39, sel_constraintLessThanOrEqualToAnchor_constant_, v40, -*(double *)&qword_1EAD62BA8);

  *(void *)(v29 + 48) = v41;
  id v42 = sub_1E0AFD88C();
  id v43 = objc_msgSend(v42, sel_topAnchor);

  id v44 = sub_1E0AFD858();
  id v45 = objc_msgSend(v44, sel_bottomAnchor);

  id v46 = objc_msgSend(v43, sel_constraintEqualToAnchor_constant_, v45, 4.0);
  *(void *)(v29 + 56) = v46;
  id v47 = sub_1E0AFD88C();
  id v48 = objc_msgSend(v47, sel_leadingAnchor);

  id v49 = objc_msgSend(v27, sel_leadingAnchor);
  id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_constant_, v49, *(double *)&qword_1EAD62BA8);

  *(void *)(v29 + 64) = v50;
  id v51 = sub_1E0AFD88C();
  id v52 = objc_msgSend(v51, sel_trailingAnchor);

  id v53 = objc_msgSend(v27, sel_trailingAnchor);
  id v54 = objc_msgSend(v52, sel_constraintLessThanOrEqualToAnchor_constant_, v53, -*(double *)&qword_1EAD62BA8);

  *(void *)(v29 + 72) = v54;
  id v55 = sub_1E0AFDB08();
  id v56 = objc_msgSend(v55, sel_topAnchor);

  id v57 = sub_1E0AFD88C();
  id v58 = objc_msgSend(v57, sel_bottomAnchor);

  id v59 = objc_msgSend(v56, sel_constraintEqualToAnchor_constant_, v58, 2.0);
  *(void *)(v29 + 80) = v59;
  id v60 = sub_1E0AFDB08();
  id v61 = objc_msgSend(v60, sel_leadingAnchor);

  id v62 = objc_msgSend(v27, sel_leadingAnchor);
  id v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_constant_, v62, *(double *)&qword_1EAD62BA8);

  *(void *)(v29 + 88) = v63;
  id v64 = sub_1E0AFDB08();
  id v65 = objc_msgSend(v64, sel_trailingAnchor);

  id v66 = objc_msgSend(v27, sel_trailingAnchor);
  id v67 = objc_msgSend(v65, sel_constraintLessThanOrEqualToAnchor_constant_, v66, -*(double *)&qword_1EAD62BA8);

  *(void *)(v29 + 96) = v67;
  id v68 = sub_1E0AFDB08();
  id v69 = objc_msgSend(v68, (SEL)&off_1E6D4C620 + 5);

  id v70 = objc_msgSend(v27, (SEL)&off_1E6D4C620 + 5);
  id v71 = objc_msgSend(v69, sel_constraintEqualToAnchor_constant_, v70, -18.0);

  *(void *)(v29 + 104) = v71;
  sub_1E0B06828();
  sub_1E0AE3ED0();
  uint64_t v72 = (void *)sub_1E0B06818();
  swift_bridgeObjectRelease();
  objc_msgSend(v74, sel_activateConstraints_, v72);

  (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v77, v76);
  return v27;
}

unint64_t WalkingSteadinessOnboardingStage.analyticsName.getter()
{
  unint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x446D7269666E6F63;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x6163696669746F6ELL;
      break;
    case 4:
      unint64_t result = 0x6974656C706D6F63;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static WalkingSteadinessOnboardingStage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WalkingSteadinessOnboardingStage.hash(into:)()
{
  return sub_1E0B06C18();
}

void *static WalkingSteadinessOnboardingStage.allCases.getter()
{
  return &unk_1F3B8D8E0;
}

uint64_t WalkingSteadinessOnboardingStage.hashValue.getter()
{
  return sub_1E0B06C28();
}

unint64_t sub_1E0AFECCC()
{
  unint64_t result = qword_1EAD62BE8;
  if (!qword_1EAD62BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62BE8);
  }
  return result;
}

unint64_t sub_1E0AFED24()
{
  unint64_t result = qword_1EAD62BF0;
  if (!qword_1EAD62BF0)
  {
    sub_1E0AFED7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62BF0);
  }
  return result;
}

void sub_1E0AFED7C()
{
  if (!qword_1EAD62BF8)
  {
    unint64_t v0 = sub_1E0B06838();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62BF8);
    }
  }
}

void sub_1E0AFEDD4(void *a1@<X8>)
{
  *a1 = &unk_1F3B8D908;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingStage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WalkingSteadinessOnboardingStage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x1E0AFEF40);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingStage()
{
  return &type metadata for WalkingSteadinessOnboardingStage;
}

uint64_t sub_1E0AFEF78()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

id sub_1E0AFEF88()
{
  type metadata accessor for Dummy();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EBF0EAF0 = (uint64_t)result;
  return result;
}

id static NSBundle.healthMobilityUI.getter()
{
  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EBF0EAF0;
  return v0;
}

uint64_t type metadata accessor for Dummy()
{
  return self;
}

id sub_1E0AFF060(uint64_t a1)
{
  return sub_1E0AFF07C(a1, &qword_1EAD62C08, 0x1E4F67C78, &qword_1EAD654F0);
}

id sub_1E0AFF07C(uint64_t a1, unint64_t *a2, uint64_t a3, void *a4)
{
  sub_1E0ADA450(0, a2);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  *a4 = result;
  return result;
}

id sub_1E0AFF0D4(uint64_t a1)
{
  return sub_1E0AFF07C(a1, &qword_1EAD62C00, 0x1E4F67868, &qword_1EAD654F8);
}

void sub_1E0AFF0F0()
{
  qword_1EAD62C10 = 0x4010000000000000;
}

void sub_1E0AFF100()
{
  qword_1EAD62C18 = 0x4014000000000000;
}

char *sub_1E0AFF110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = v3;
  swift_getObjectType();
  uint64_t v7 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title;
  id v8 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v9 = v4;
  id v10 = objc_msgSend(v8, sel_init);
  objc_msgSend(v10, sel_setNumberOfLines_, 0);
  *(void *)&v4[v7] = v10;
  uint64_t v11 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail;
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v12, sel_setNumberOfLines_, 0);
  *(void *)&v9[v11] = v12;

  if (a3)
  {
    id v13 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v13 = 0;
  }
  v76.receiver = v9;
  v76.super_class = (Class)type metadata accessor for BaseInfoCell();
  id v14 = objc_msgSendSuper2(&v76, sel_initWithStyle_reuseIdentifier_, a1, v13);

  id v15 = (char *)v14;
  id v16 = objc_msgSend(v15, sel_contentView);
  uint64_t v17 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title;
  objc_msgSend(v16, sel_addSubview_, *(void *)&v15[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title]);

  id v18 = objc_msgSend(v15, sel_contentView);
  uint64_t v19 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail;
  objc_msgSend(v18, sel_addSubview_, *(void *)&v15[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail]);

  id v20 = *(void **)&v15[v17];
  id v21 = self;
  id v22 = objc_msgSend(v21, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E4FB2990], 1024);
  objc_msgSend(v20, sel_setFont_, v22);

  id v23 = *(void **)&v15[v19];
  uint64_t v74 = v19;
  id v24 = objc_msgSend(v21, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB28C8]);
  objc_msgSend(v23, sel_setFont_, v24);

  id v25 = *(void **)&v15[v17];
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v26) = 1148846080;
  objc_msgSend(v25, sel_setContentCompressionResistancePriority_forAxis_, 1, v26);
  LODWORD(v27) = 1144750080;
  objc_msgSend(v25, sel_setContentHuggingPriority_forAxis_, 1, v27);
  LODWORD(v28) = 1144750080;
  objc_msgSend(v25, sel_setContentHuggingPriority_forAxis_, 0, v28);
  uint64_t v29 = *(void **)&v15[v19];
  objc_msgSend(v29, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v30) = 1148846080;
  objc_msgSend(v29, sel_setContentCompressionResistancePriority_forAxis_, 1, v30);
  LODWORD(v31) = 1144750080;
  objc_msgSend(v29, sel_setContentHuggingPriority_forAxis_, 1, v31);
  LODWORD(v32) = 1144750080;
  objc_msgSend(v29, sel_setContentHuggingPriority_forAxis_, 0, v32);
  id v75 = self;
  sub_1E0AE3E74();
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1E0B09890;
  id v34 = objc_msgSend(v25, sel_topAnchor);
  id v35 = objc_msgSend(v15, sel_contentView);
  id v36 = objc_msgSend(v35, sel_layoutMarginsGuide);

  id v37 = objc_msgSend(v36, byte_1E6D4C533);
  id v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);

  *(void *)(v33 + 32) = v38;
  id v39 = objc_msgSend(*(id *)&v15[v17], sel_leadingAnchor);
  id v40 = objc_msgSend(v15, sel_contentView);
  id v41 = objc_msgSend(v40, sel_layoutMarginsGuide);

  id v42 = objc_msgSend(v41, sel_leadingAnchor);
  id v43 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v42);

  *(void *)(v33 + 40) = v43;
  id v44 = objc_msgSend(*(id *)&v15[v17], sel_trailingAnchor);
  id v45 = objc_msgSend(v15, sel_contentView);
  id v46 = objc_msgSend(v45, sel_layoutMarginsGuide);

  id v47 = objc_msgSend(v46, sel_trailingAnchor);
  id v48 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v47);

  *(void *)(v33 + 48) = v48;
  id v49 = objc_msgSend(*(id *)&v15[v74], sel_topAnchor);
  id v50 = objc_msgSend(*(id *)&v15[v17], sel_bottomAnchor);
  if (qword_1EAD61F88 != -1) {
    swift_once();
  }
  id v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_constant_, v50, *(double *)&qword_1EAD62C10);

  *(void *)(v33 + 56) = v51;
  id v52 = objc_msgSend(*(id *)&v15[v74], sel_leadingAnchor);
  id v53 = objc_msgSend(v15, sel_contentView);
  id v54 = objc_msgSend(v53, sel_layoutMarginsGuide);

  id v55 = objc_msgSend(v54, sel_leadingAnchor);
  id v56 = objc_msgSend(v52, sel_constraintEqualToAnchor_, v55);

  *(void *)(v33 + 64) = v56;
  id v57 = objc_msgSend(*(id *)&v15[v74], sel_trailingAnchor);
  id v58 = objc_msgSend(v15, sel_contentView);
  id v59 = objc_msgSend(v58, sel_layoutMarginsGuide);

  id v60 = objc_msgSend(v59, sel_trailingAnchor);
  id v61 = objc_msgSend(v57, sel_constraintEqualToAnchor_, v60);

  *(void *)(v33 + 72) = v61;
  id v62 = objc_msgSend(*(id *)&v15[v74], sel_bottomAnchor);
  id v63 = objc_msgSend(v15, sel_contentView);
  id v64 = objc_msgSend(v63, sel_bottomAnchor);

  if (qword_1EAD61F90 != -1) {
    swift_once();
  }
  id v65 = objc_msgSend(v62, sel_constraintEqualToAnchor_constant_, v64, -*(double *)&qword_1EAD62C18);

  *(void *)(v33 + 80) = v65;
  sub_1E0B06828();
  sub_1E0AE3ED0();
  id v66 = (void *)sub_1E0B06818();
  swift_bridgeObjectRelease();
  objc_msgSend(v75, sel_activateConstraints_, v66);

  sub_1E0B001E8();
  uint64_t v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_1E0B07E50;
  uint64_t v68 = sub_1E0B06568();
  uint64_t v69 = MEMORY[0x1E4FB1138];
  *(void *)(v67 + 32) = v68;
  *(void *)(v67 + 40) = v69;
  uint64_t v70 = sub_1E0B06458();
  uint64_t v71 = MEMORY[0x1E4FB0EF0];
  *(void *)(v67 + 48) = v70;
  *(void *)(v67 + 56) = v71;
  uint64_t v72 = v15;
  sub_1E0B06A18();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v72;
}

id sub_1E0AFF984()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseInfoCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BaseInfoCell()
{
  return self;
}

uint64_t sub_1E0AFFA28()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1E0AFFA6C()
{
  uint64_t v1 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v2 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68);
  uint64_t v3 = sub_1E0B06A58();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = &v11[-v6];
  uint64_t v8 = (uint64_t)v0 + qword_1EAD62C30;
  swift_beginAccess();
  sub_1E0AD3F94(v8, (uint64_t)v11);
  sub_1E0AF0F64();
  int v9 = swift_dynamicCast();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v7, v9 ^ 1u, 1, v2);
  (*(void (**)(unsigned char *))((*v1 & *v0) + 0x98))(v7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_1E0AFFC10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_1EAD62C30;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a1);
}

uint64_t sub_1E0AFFC64(uint64_t a1)
{
  uint64_t v3 = v1 + qword_1EAD62C30;
  swift_beginAccess();
  sub_1E0AD4098(a1, v3);
  swift_endAccess();
  sub_1E0AFFA6C();
  return sub_1E0AF1014(a1);
}

uint64_t (*sub_1E0AFFCD4(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1E0AFFD34;
}

uint64_t sub_1E0AFFD34(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_1E0AFFA6C();
  }
  return result;
}

void sub_1E0AFFD68()
{
}

id sub_1E0AFFDC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = &v3[qword_1EAD62C30];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  if (a3)
  {
    uint64_t v6 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for BaseInfoItemCell();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

uint64_t sub_1E0AFFEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E0AFFEC0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1E0AFFDC4);
}

uint64_t sub_1E0AFFEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (a4)
  {
    a4 = sub_1E0B06798();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return a5(a3, a4, v8);
}

uint64_t sub_1E0AFFF1C()
{
  return sub_1E0AF1014(v0 + qword_1EAD62C30);
}

id sub_1E0AFFF2C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseInfoItemCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E0AFFFA0(uint64_t a1)
{
  return sub_1E0AF1014(a1 + qword_1EAD62C30);
}

uint64_t type metadata accessor for BaseInfoItemCell()
{
  return __swift_instantiateGenericMetadata();
}

void (*sub_1E0AFFFD0(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1E0AFFCD4((uint64_t)v2);
  return sub_1E0ADD428;
}

void sub_1E0B0002C(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E4FB2990], 1024);
  objc_msgSend(v2, sel_setFont_, v4);

  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail);
  id v6 = objc_msgSend(v3, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB28C8]);
  objc_msgSend(v5, sel_setFont_, v6);
}

void sub_1E0B00118()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v2, sel_setNumberOfLines_, 0);
  *(void *)&v0[v1] = v2;
  uint64_t v3 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v4, sel_setNumberOfLines_, 0);
  *(void *)&v0[v3] = v4;

  sub_1E0B06B38();
  __break(1u);
}

void sub_1E0B001E8()
{
  if (!qword_1EAD624C0)
  {
    sub_1E0ADF23C();
    unint64_t v0 = sub_1E0B06BA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD624C0);
    }
  }
}

uint64_t sub_1E0B00240()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62CB8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62CB8);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id sub_1E0B00308()
{
  uint64_t v1 = OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow);
  }
  else
  {
    id v4 = sub_1E0B01510();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1E0B00368()
{
  *(void *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow] = 0;
  v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_stage] = 3;
  *(void *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v1 = &v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_baseIdentifier];
  *uint64_t v1 = 0xD000000000000028;
  v1[1] = 0x80000001E0B0B580;
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v3 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  id v4 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  uint64_t v5 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  v36.receiver = v0;
  v36.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController();
  id v6 = objc_msgSendSuper2(&v36, sel_initWithTitle_detailText_icon_contentLayout_, v3, v5, 0, 3, 0xE000000000000000);

  id v7 = v6;
  id v8 = objc_msgSend(v7, sel_headerView);
  LODWORD(v9) = 1036831949;
  objc_msgSend(v8, sel_setTitleHyphenationFactor_, v9);

  id v10 = objc_msgSend(v7, sel_headerView);
  objc_msgSend(v10, sel_setAllowFullWidthIcon_, 1);

  id v11 = objc_msgSend(v7, sel_headerView);
  id v12 = objc_msgSend(v11, sel_customIconContainerView);

  if (v12)
  {
    objc_msgSend(v12, sel_setClipsToBounds_, 0);
    id v13 = sub_1E0B00308();
    objc_msgSend(v12, sel_addSubview_, v13);

    id v14 = self;
    if ((objc_msgSend(v14, sel_hk_currentDeviceHas4InchScreen) & 1) != 0
      || objc_msgSend(v14, sel_hk_currentDeviceHas4Point7InchScreen))
    {
      id v15 = self;
      sub_1E0B01744(0, (unint64_t *)&qword_1EAD62200);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_1E0B086E0;
      id v17 = sub_1E0B00308();
      id v18 = objc_msgSend(v17, sel_topAnchor);

      id v19 = objc_msgSend(v12, sel_topAnchor);
      id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v19, 10.0);

      *(void *)(v16 + 32) = v20;
      id v21 = sub_1E0B00308();
      id v22 = objc_msgSend(v21, sel_leadingAnchor);

      id v23 = objc_msgSend(v12, sel_leadingAnchor);
      id v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

      *(void *)(v16 + 40) = v24;
      id v25 = sub_1E0B00308();
      id v26 = objc_msgSend(v25, sel_trailingAnchor);

      id v27 = objc_msgSend(v12, sel_trailingAnchor);
      id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

      *(void *)(v16 + 48) = v28;
      id v29 = sub_1E0B00308();
      id v30 = objc_msgSend(v29, sel_bottomAnchor);

      id v31 = objc_msgSend(v12, sel_bottomAnchor);
      id v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

      *(void *)(v16 + 56) = v32;
      sub_1E0B06828();
      sub_1E0ADA450(0, (unint64_t *)&qword_1EAD626E8);
      id v33 = (id)sub_1E0B06818();
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_activateConstraints_, v33);
    }
    else
    {
      id v34 = sub_1E0B00308();
      id v33 = v12;
      objc_msgSend(v34, sel_hk_alignConstraintsWithView_, v33);
    }
  }

  return v7;
}

void sub_1E0B00904()
{
  uint64_t ObjectType = swift_getObjectType();
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController();
  objc_msgSendSuper2(&v18, sel_viewDidLoad);
  sub_1E0B001E8();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1E0B08490;
  uint64_t v3 = sub_1E0B06468();
  uint64_t v4 = MEMORY[0x1E4FB0F40];
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
  *(void *)(swift_allocObject() + 16) = ObjectType;
  sub_1E0B06918();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_1EAD61EC8 != -1) {
    swift_once();
  }
  id v5 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v6 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  sub_1E0B01744(0, (unint64_t *)&qword_1EAD622A8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1E0B08740;
  uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_baseIdentifier];
  uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_baseIdentifier
                    + 8];
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
  *(void *)(v7 + 48) = 0x656C62616E45;
  *(void *)(v7 + 56) = 0xE600000000000000;
  *(void *)(v7 + 64) = 0x6E6F74747542;
  *(void *)(v7 + 72) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  id v10 = (void *)sub_1E0B06818();
  swift_bridgeObjectRelease();
  id v11 = (id)HKUIJoinStringsForAutomationIdentifier();

  id v12 = (id)qword_1EAD62608;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v13 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1E0B08740;
  *(void *)(v14 + 32) = v8;
  *(void *)(v14 + 40) = v9;
  *(void *)(v14 + 48) = 0x62616E45746E6F44;
  *(void *)(v14 + 56) = 0xEA0000000000656CLL;
  *(void *)(v14 + 64) = 0x6E6F74747542;
  *(void *)(v14 + 72) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  id v15 = (void *)sub_1E0B06818();
  swift_bridgeObjectRelease();
  id v16 = (id)HKUIJoinStringsForAutomationIdentifier();

  id v17 = (void *)sub_1E0B06788();
}

void sub_1E0B00D3C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_traitCollection);
  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  id v3 = (id)qword_1EBF0EAF0;
  id v4 = v2;
  id v5 = (void *)sub_1E0B06788();
  id v6 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v5, v3, v4);

  if (v6)
  {
    id v15 = objc_msgSend(a1, sel_headerView);
    objc_msgSend(v15, sel_setIcon_accessibilityLabel_, v6, 0);
  }
  else
  {
    if (qword_1EAD61F98 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1E0B06448();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EAD62CB8);
    id v15 = a1;
    uint64_t v8 = sub_1E0B06428();
    os_log_type_t v9 = sub_1E0B068B8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      id v11 = (void *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v17 = v12;
      *(_DWORD *)uint64_t v10 = 136446466;
      uint64_t v13 = sub_1E0B06C58();
      sub_1E0ACB6F4(v13, v14, &v17);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      id v16 = objc_msgSend(v15, sel_traitCollection);
      sub_1E0B06A68();
      *id v11 = v16;

      _os_log_impl(&dword_1E0AC7000, v8, v9, "[%{public}s] Unable to load icon for %@", (uint8_t *)v10, 0x16u);
      sub_1E0AE4F20();
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v12, -1, -1);
      MEMORY[0x1E4E3C540](v10, -1, -1);

      return;
    }
  }
}

id sub_1E0B01300()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController()
{
  return self;
}

void sub_1E0B013B8(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_stage);
}

uint64_t sub_1E0B013CC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x1E4E3C5D0](v1);
}

uint64_t sub_1E0B0141C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1E0B01488(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4E3C5D0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1E0ACCC0C;
}

id sub_1E0B01510()
{
  if (qword_1EBF0EC60 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EBF0EAF0;
  uint64_t v1 = (void *)sub_1E0B06788();
  id v2 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v1, v0, 0);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v2);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setContentMode_, 1);
  id v4 = objc_msgSend(v3, sel_layer);
  id v5 = objc_msgSend(self, sel_blackColor);
  id v6 = objc_msgSend(v5, sel_CGColor);

  objc_msgSend(v4, sel_setShadowColor_, v6);
  id v7 = objc_msgSend(v3, sel_layer);
  LODWORD(v8) = 1041865114;
  objc_msgSend(v7, sel_setShadowOpacity_, v8);

  id v9 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v9, sel_setShadowRadius_, 7.0);

  id v10 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v10, sel_setShadowOffset_, 0.0, 1.0);

  return v3;
}

uint64_t sub_1E0B0172C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E0B0173C(void *a1)
{
}

void sub_1E0B01744(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1E0B06BA8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void *ConfirmDetailsValueFormatterImpl.__allocating_init(healthStore:)(void *a1)
{
  id v2 = (void *)swift_allocObject();
  v2[4] = 0;
  v2[5] = 0;
  v2[2] = a1;
  unint64_t v3 = self;
  id v4 = a1;
  id v5 = objc_msgSend(v3, sel_sharedInstanceForHealthStore_, v4);
  id v6 = objc_msgSend(v5, sel_createHKUnitPreferenceController);

  v2[3] = v6;
  return v2;
}

uint64_t sub_1E0B01830()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62CF0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62CF0);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_1E0B018F8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E20]), sel_init);
  objc_msgSend(v0, sel_setForPersonMassUse_, 1);
  id v1 = objc_msgSend(v0, sel_numberFormatter);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setRoundingMode_, 6);

    qword_1EAD65500 = (uint64_t)v0;
  }
  else
  {
    __break(1u);
  }
}

id sub_1E0B01980(uint64_t a1)
{
  return sub_1E0B019A8(a1, 0x1E4F67BC8, &qword_1EAD65508);
}

id sub_1E0B01994(uint64_t a1)
{
  return sub_1E0B019A8(a1, 0x1E4F67BD0, &qword_1EAD65510);
}

id sub_1E0B019A8(uint64_t a1, uint64_t a2, void *a3)
{
  id result = objc_msgSend(self, sel_sharedFormatter);
  if (result) {
    *a3 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

id sub_1E0B019F0()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (*v0)
  {
    if (qword_1EAD61FB0 != -1) {
      swift_once();
    }
    unsigned int v1 = objc_msgSend((id)qword_1EAD65508, sel_usesImperialUnits);
    uint64_t v2 = self;
    if (v1) {
      id v3 = objc_msgSend(v2, sel_inchUnit);
    }
    else {
      id v3 = objc_msgSend(v2, sel_meterUnitWithMetricPrefix_, 5);
    }
  }
  else
  {
    v5[0] = 14;
    if (qword_1EAD61FA8 != -1) {
      swift_once();
    }

    id v3 = objc_msgSend(self, sel_unitFromMassFormatterUnit_, v5[0]);
  }
  return v3;
}

void sub_1E0B01B60(id a1)
{
  if (*v1 == 1)
  {
    if (qword_1EAD61FB0 != -1) {
      swift_once();
    }
    id v3 = (void *)qword_1EAD65508;
    id v4 = objc_msgSend(self, sel_meterUnitWithMetricPrefix_, 5);
    objc_msgSend(a1, sel_doubleValueForUnit_, v4);

    id v5 = (void *)sub_1E0B06858();
    a1 = objc_msgSend(v3, sel_localizedStringFromHeightInCentimeters_, v5);

    if (a1) {
      goto LABEL_9;
    }
    __break(1u);
  }
  if (qword_1EAD61FB8 != -1) {
    swift_once();
  }
  id v6 = (void *)qword_1EAD65510;
  id v7 = objc_msgSend(self, sel_gramUnitWithMetricPrefix_, 9);
  objc_msgSend(a1, sel_doubleValueForUnit_, v7);

  double v8 = (void *)sub_1E0B06858();
  a1 = objc_msgSend(v6, sel_stringFromWeightInKilograms_, v8);

  if (a1)
  {
LABEL_9:
    sub_1E0B06798();

    return;
  }
  __break(1u);
}

BOOL static ConfirmDetailsValueFormatterImpl.ValueType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ConfirmDetailsValueFormatterImpl.ValueType.hash(into:)()
{
  return sub_1E0B06C18();
}

uint64_t ConfirmDetailsValueFormatterImpl.ValueType.hashValue.getter()
{
  return sub_1E0B06C28();
}

BOOL sub_1E0B01DAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id sub_1E0B01DC4()
{
  unsigned int v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
LABEL_5:
    id v5 = v1;
    return v2;
  }
  id result = objc_msgSend(*(id *)(v0 + 16), sel_displayTypeController);
  if (result)
  {
    id v4 = *(void **)(v0 + 32);
    *(void *)(v0 + 32) = result;
    id v2 = result;

    unsigned int v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_1E0B01E38()
{
  unsigned int v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = *(id *)(v0 + 40);
LABEL_5:
    id v7 = v1;
    return v2;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28DE8]), sel_init);
  objc_msgSend(v3, sel_setForPersonHeightUse_, 1);
  objc_msgSend(v3, sel_setUnitStyle_, 2);
  id result = objc_msgSend(v3, sel_numberFormatter);
  if (result)
  {
    id v5 = result;
    objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

    id v6 = *(void **)(v0 + 40);
    *(void *)(v0 + 40) = v3;
    id v2 = v3;

    unsigned int v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void *ConfirmDetailsValueFormatterImpl.init(healthStore:)(void *a1)
{
  v1[4] = 0;
  v1[5] = 0;
  v1[2] = a1;
  id v3 = self;
  id v4 = a1;
  id v5 = objc_msgSend(v3, sel_sharedInstanceForHealthStore_, v4);
  id v6 = objc_msgSend(v5, sel_createHKUnitPreferenceController);

  v1[3] = v6;
  return v1;
}

id sub_1E0B01F94(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  int v3 = *a1;
  sub_1E0ADA450(0, (unint64_t *)&qword_1EAD62650);
  id v4 = (id *)MEMORY[0x1E4F2A838];
  if (!v3) {
    id v4 = (id *)MEMORY[0x1E4F2A630];
  }
  id v5 = (id)MEMORY[0x1E4E3BBA0](*v4);
  id v6 = sub_1E0B01DC4();
  id v7 = objc_msgSend(v6, sel_displayTypeForObjectType_, v5);

  if (!v7) {
    goto LABEL_10;
  }
  id v8 = objc_msgSend(*(id *)(v2 + 24), sel_unitForDisplayType_, v7);
  if (!v8)
  {

LABEL_10:
    if (qword_1EAD61FA0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1E0B06448();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EAD62CF0);
    id v5 = v5;
    id v16 = sub_1E0B06428();
    os_log_type_t v17 = sub_1E0B068B8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = v25;
      *(_DWORD *)uint64_t v18 = 136446722;
      uint64_t v19 = sub_1E0B06C58();
      sub_1E0ACB6F4(v19, v20, &v26);
      sub_1E0B06A68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2082;
      sub_1E0ACB6F4(0xD000000000000013, 0x80000001E0B0C830, &v26);
      sub_1E0B06A68();
      *(_WORD *)(v18 + 22) = 2082;
      id v21 = objc_msgSend(v5, sel_identifier);
      uint64_t v22 = sub_1E0B06798();
      unint64_t v24 = v23;

      sub_1E0ACB6F4(v22, v24, &v26);
      sub_1E0B06A68();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AC7000, v16, v17, "[%{public}s.%{public}s]: Unable to determine preferred unit for type %{public}s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1E4E3C540](v25, -1, -1);
      MEMORY[0x1E4E3C540](v18, -1, -1);
    }
    else
    {
    }
    LOBYTE(v26) = v3;
    id v9 = sub_1E0B019F0();
    goto LABEL_16;
  }
  id v9 = v8;
  if (v3)
  {
    sub_1E0ADA450(0, (unint64_t *)&qword_1EAD625E0);
    id v10 = self;
    id v11 = objc_msgSend(v10, sel_meterUnit);
    char v12 = sub_1E0B06A38();

    if (v12)
    {
      id v13 = objc_msgSend(v10, sel_meterUnitWithMetricPrefix_, 5);

      return v13;
    }
  }

LABEL_16:
  return v9;
}

uint64_t sub_1E0B02368(unsigned char *a1, void *a2)
{
  uint64_t v3 = v2;
  LOBYTE(v44) = *a1;
  int v5 = v44;
  id v6 = sub_1E0B01F94((unsigned __int8 *)&v44);
  sub_1E0ADA450(0, (unint64_t *)&qword_1EAD62650);
  id v7 = (id *)MEMORY[0x1E4F2A838];
  if (!v5) {
    id v7 = (id *)MEMORY[0x1E4F2A630];
  }
  id v8 = (void *)MEMORY[0x1E4E3BBA0](*v7);
  id v9 = sub_1E0B01DC4();
  id v10 = objc_msgSend(v9, sel_displayTypeForObjectType_, v8);

  if (v10)
  {
    if (v5)
    {
      id v11 = self;
      id v12 = v6;
      id v13 = objc_msgSend(v11, sel_footUnit);
      sub_1E0ADA450(0, (unint64_t *)&qword_1EAD625E0);
      char v14 = sub_1E0B06A38();

      if ((v14 & 1) == 0)
      {
        id v12 = v12;
        id v37 = objc_msgSend(v11, sel_meterUnitWithMetricPrefix_, 5);
        char v38 = sub_1E0B06A38();

        if (v38)
        {
          id v39 = sub_1E0B01E38();
          objc_msgSend(a2, sel_doubleValueForUnit_, v12);
          id v16 = objc_msgSend(v39, sel_stringFromValue_unit_, 9);

          goto LABEL_18;
        }
        goto LABEL_21;
      }
      objc_msgSend(a2, sel_doubleValueForUnit_, v12);
      id v15 = (id)HKFormattedFeetAndInches();
      if (v15)
      {
        id v16 = v15;
LABEL_18:
        uint64_t v40 = sub_1E0B06798();

        return v40;
      }
    }
    else
    {
      id v30 = objc_msgSend(v10, sel_hk_valueFormatterForUnit_, v6);
      objc_msgSend(a2, sel_doubleValueForUnit_, v6);
      id v31 = (void *)sub_1E0B06858();
      id v32 = objc_msgSend(v30, sel_stringFromValue_displayType_unitController_, v31, v10, *(void *)(v3 + 24));

      if (v32)
      {
        uint64_t v33 = sub_1E0B06798();

        return v33;
      }
      __break(1u);
    }
    __break(1u);
LABEL_21:
    uint64_t result = sub_1E0B06B38();
    __break(1u);
    return result;
  }
  if (qword_1EAD61FA0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1E0B06448();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EAD62CF0);
  id v18 = v8;
  uint64_t v19 = sub_1E0B06428();
  os_log_type_t v20 = sub_1E0B068B8();
  if (os_log_type_enabled(v19, v20))
  {
    os_log_type_t type = v20;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v44 = v42;
    *(_DWORD *)uint64_t v21 = 136446722;
    uint64_t v22 = sub_1E0B06C58();
    sub_1E0ACB6F4(v22, v23, &v44);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    id v43 = a2;
    *(_WORD *)(v21 + 12) = 2082;
    sub_1E0ACB6F4(0xD00000000000001DLL, 0x80000001E0B0C850, &v44);
    sub_1E0B06A68();
    *(_WORD *)(v21 + 22) = 2082;
    id v24 = objc_msgSend(v18, sel_identifier);
    uint64_t v25 = sub_1E0B06798();
    id v26 = v6;
    unint64_t v28 = v27;

    uint64_t v29 = v25;
    a2 = v43;
    sub_1E0ACB6F4(v29, v28, &v44);
    sub_1E0B06A68();

    id v6 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v19, type, "[%{public}s.%{public}s]: Unable to determine display type for type %{public}s", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v42, -1, -1);
    MEMORY[0x1E4E3C540](v21, -1, -1);
  }
  else
  {
  }
  LOBYTE(v44) = v5;
  sub_1E0B01B60(a2);
  uint64_t v36 = v35;

  return v36;
}

id *ConfirmDetailsValueFormatterImpl.deinit()
{
  return v0;
}

uint64_t ConfirmDetailsValueFormatterImpl.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 48, 7);
}

id sub_1E0B02978(unsigned __int8 *a1)
{
  return sub_1E0B01F94(a1);
}

uint64_t sub_1E0B0299C(unsigned char *a1, void *a2)
{
  return sub_1E0B02368(a1, a2);
}

unint64_t sub_1E0B029C4()
{
  unint64_t result = qword_1EAD62D08;
  if (!qword_1EAD62D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62D08);
  }
  return result;
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatter.preferredUnit(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatter.formattedValue(for:quantity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for ConfirmDetailsValueFormatterImpl()
{
  return self;
}

uint64_t method lookup function for ConfirmDetailsValueFormatterImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfirmDetailsValueFormatterImpl);
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatterImpl.__allocating_init(healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatterImpl.preferredUnit(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatterImpl.formattedValue(for:quantity:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

unsigned char *storeEnumTagSinglePayload for ConfirmDetailsValueFormatterImpl.ValueType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E0B02BA4);
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

ValueMetadata *type metadata accessor for ConfirmDetailsValueFormatterImpl.ValueType()
{
  return &type metadata for ConfirmDetailsValueFormatterImpl.ValueType;
}

uint64_t sub_1E0B02BDC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v14 = MEMORY[0x1E4FBC860];
    sub_1E0AF6624(0, v1, 0);
    uint64_t v2 = v14;
    unsigned int v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v6 = *v4++;
      uint64_t v5 = v6;
      uint64_t v14 = v2;
      unint64_t v8 = *(void *)(v2 + 16);
      unint64_t v7 = *(void *)(v2 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1E0AF6624(v7 > 1, v8 + 1, 1);
        uint64_t v2 = v14;
      }
      type metadata accessor for HKAppleWalkingSteadinessClassification(0);
      uint64_t v12 = v9;
      uint64_t v13 = sub_1E0B03238(&qword_1EAD62D28, type metadata accessor for HKAppleWalkingSteadinessClassification);
      *(void *)&long long v11 = v5;
      *(void *)(v2 + 16) = v8 + 1;
      sub_1E0ACB27C(&v11, v2 + 40 * v8 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1E0B02CF8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
    sub_1E0AF6624(0, v1, 0);
    uint64_t v2 = v12;
    unsigned int v4 = (char *)(a1 + 32);
    do
    {
      char v5 = *v4;
      uint64_t v12 = v2;
      unint64_t v7 = *(void *)(v2 + 16);
      unint64_t v6 = *(void *)(v2 + 24);
      if (v7 >= v6 >> 1)
      {
        sub_1E0AF6624(v6 > 1, v7 + 1, 1);
        uint64_t v2 = v12;
      }
      id v10 = &type metadata for WalkingSteadinessOnboardingAboutHealthDetailsItem;
      unint64_t v11 = sub_1E0B03280();
      LOBYTE(v9) = v5;
      *(void *)(v2 + 16) = v7 + 1;
      sub_1E0ACB27C(&v9, v2 + 40 * v7 + 32);
      ++v4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t HKAppleWalkingSteadinessClassification.reuseIdentifier.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t HKAppleWalkingSteadinessClassification.uniqueIdentifier.getter()
{
  return 0xD000000000000027;
}

uint64_t HKAppleWalkingSteadinessClassification.selectionStyle.getter()
{
  return 0;
}

unint64_t sub_1E0B02E9C()
{
  return 0xD00000000000001ALL;
}

unint64_t sub_1E0B02EB8()
{
  return HKAppleWalkingSteadinessClassification.uniqueIdentifier.getter();
}

uint64_t type metadata accessor for WalkingSteadinessLevelsDataSource()
{
  uint64_t result = qword_1EAD62D10;
  if (!qword_1EAD62D10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0B02F0C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1E0B02F4C()
{
  uint64_t v0 = sub_1E0B05FB8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  int v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AE91B0();
  sub_1E0B06218();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1E0B08490;
  sub_1E0B02BDC((uint64_t)&unk_1F3B8D770);
  sub_1E0B05FA8();
  sub_1E0B05F98();
  unsigned int v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_1E0B06208();
  v6[0] = 0x3C53447961727241;
  v6[1] = 0xE800000000000000;
  sub_1E0B05FA8();
  sub_1E0B05F98();
  v4(v3, v0);
  sub_1E0B067E8();
  swift_bridgeObjectRelease();
  sub_1E0B067E8();
  return sub_1E0B061E8();
}

void sub_1E0B0315C()
{
}

void sub_1E0B03178()
{
}

void sub_1E0B03194()
{
}

uint64_t sub_1E0B031C0()
{
  return type metadata accessor for WalkingSteadinessLevelsDataSource();
}

uint64_t sub_1E0B031C8()
{
  return sub_1E0B06878();
}

uint64_t sub_1E0B03238(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1E0B03280()
{
  unint64_t result = qword_1EAD62D30;
  if (!qword_1EAD62D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD62D30);
  }
  return result;
}

id sub_1E0B032D4(void *a1, uint64_t a2, uint64_t a3)
{
  char v5 = (void *)sub_1E0B06788();
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for WalkingSteadinessLevelCell();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a3, v5);

  return v6;
}

id sub_1E0B03358(id result, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = result;
    unsigned int v4 = *(void **)&v2[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title];
    char v5 = self;
    id v6 = objc_msgSend(v5, sel_localizedTitleForClassification_, v3);
    objc_msgSend(v4, sel_setText_, v6);

    unint64_t v7 = *(void **)&v2[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail];
    id v8 = objc_msgSend(v5, sel_localizedDescriptionForClassification_, v3);
    objc_msgSend(v7, sel_setText_, v8);

    return objc_msgSend(v2, sel_setSelectionStyle_, 0);
  }
  return result;
}

id sub_1E0B03458()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessLevelCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessLevelCell()
{
  uint64_t result = qword_1EAD62D38;
  if (!qword_1EAD62D38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0B034E0()
{
  return swift_initClassMetadata2();
}

id sub_1E0B03518(uint64_t a1)
{
  return sub_1E0B03358(*(id *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_1E0B03528()
{
  return type metadata accessor for WalkingSteadinessLevelCell();
}

unint64_t sub_1E0B03530()
{
  return 0xD00000000000001ALL;
}

id sub_1E0B0354C(void *a1, uint64_t a2, uint64_t a3)
{
  char v5 = (void *)sub_1E0B06788();
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a3, v5);

  return v6;
}

unsigned char *sub_1E0B035D0(unsigned char *result)
{
  if (*result != 2)
  {
    objc_super v2 = *(void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title];
    sub_1E0AE98E8();
    id v3 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setText_, v3);

    unsigned int v4 = *(void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail];
    sub_1E0AE9A30();
    char v5 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setText_, v5);

    return objc_msgSend(v1, sel_setSelectionStyle_, 0);
  }
  return result;
}

id sub_1E0B036DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell()
{
  uint64_t result = qword_1EAD62D48;
  if (!qword_1EAD62D48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0B03764()
{
  return type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
}

unint64_t sub_1E0B0376C()
{
  return 0xD000000000000031;
}

uint64_t sub_1E0B03788()
{
  uint64_t v0 = sub_1E0B06448();
  __swift_allocate_value_buffer(v0, qword_1EAD62D58);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62D58);
  if (qword_1EAD61EF0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAD62688);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id sub_1E0B03850(uint64_t a1)
{
  return sub_1E0B03878(a1, (SEL *)&selRef_tertiaryLabelColor, &qword_1EAD65528);
}

id sub_1E0B03864(uint64_t a1)
{
  return sub_1E0B03878(a1, (SEL *)&selRef_systemBlueColor, &qword_1EAD65530);
}

id sub_1E0B03878(uint64_t a1, SEL *a2, void *a3)
{
  id result = [self *a2];
  *a3 = result;
  return result;
}

id sub_1E0B038BC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_1E0B03914(void *a1)
{
}

uint64_t (*sub_1E0B03920())()
{
  return j__swift_endAccess;
}

void sub_1E0B0397C(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  id v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  unint64_t v7 = *v6;
  *id v6 = v5;
  id v8 = v5;
}

id sub_1E0B039DC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_1E0B03A34(void *a1)
{
}

void sub_1E0B03A40(void *a1, void *a2)
{
  unsigned int v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  char v5 = *v4;
  void *v4 = a1;
}

uint64_t (*sub_1E0B03A90())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1E0B03AEC(uint64_t a1, void *a2)
{
  sub_1E0AD3F94(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098((uint64_t)v5, v3);
  swift_endAccess();
  sub_1E0B03B60();
  return sub_1E0AF1014((uint64_t)v5);
}

void sub_1E0B03B60()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = (uint64_t)&v0[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item];
  swift_beginAccess();
  sub_1E0AD3F94(v2, (uint64_t)v34);
  if (v34[3])
  {
    sub_1E0AEACC8(0, (unint64_t *)&qword_1EAD62298);
    if (swift_dynamicCast())
    {
      id v3 = objc_msgSend(v1, sel_textLabel);
      if (v3)
      {
        unsigned int v4 = v3;
        char v5 = (void *)sub_1E0B06788();
        objc_msgSend(v4, sel_setText_, v5);
      }
      id v6 = objc_msgSend(v1, sel_detailTextLabel);
      if (v6)
      {
        unint64_t v7 = v6;
        id v8 = (void *)sub_1E0B06788();
        objc_msgSend(v7, sel_setText_, v8);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if (v33)
        {
LABEL_7:
          sub_1E0B04C54();
          id v9 = (id)*MEMORY[0x1E4FB28C8];
          uint64_t v10 = sub_1E0B06A28();

          if (v10)
          {
            unint64_t v11 = (void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage];
            swift_beginAccess();
            uint64_t v12 = *v11;
            *unint64_t v11 = (void *)v10;

            if (qword_1EAD61FD0 != -1) {
              swift_once();
            }
            uint64_t v13 = (void *)qword_1EAD65530;
LABEL_22:
            uint64_t v29 = (void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor];
            swift_beginAccess();
            id v30 = *v29;
            *uint64_t v29 = v13;
            id v31 = v13;

            sub_1E0B04258();
            return;
          }
          __break(1u);
LABEL_24:
          __break(1u);
          return;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v33) {
          goto LABEL_7;
        }
      }
      sub_1E0B04C54();
      id v25 = (id)*MEMORY[0x1E4FB28C8];
      uint64_t v26 = sub_1E0B06A28();

      if (v26)
      {
        unint64_t v27 = (void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage];
        swift_beginAccess();
        unint64_t v28 = *v27;
        *unint64_t v27 = (void *)v26;

        if (qword_1EAD61FC8 != -1) {
          swift_once();
        }
        uint64_t v13 = (void *)qword_1EAD65528;
        goto LABEL_22;
      }
      goto LABEL_24;
    }
  }
  else
  {
    sub_1E0AF1014((uint64_t)v34);
  }
  if (qword_1EAD61FC0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1E0B06448();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EAD62D58);
  id v15 = v1;
  id v16 = sub_1E0B06428();
  os_log_type_t v17 = sub_1E0B068A8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v32 = v19;
    *(_DWORD *)uint64_t v18 = 136446722;
    uint64_t v20 = sub_1E0B06C58();
    v34[0] = sub_1E0ACB6F4(v20, v21, &v32);
    sub_1E0B06A68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v34[0] = sub_1E0ACB6F4(1835365481, 0xE400000000000000, &v32);
    sub_1E0B06A68();
    *(_WORD *)(v18 + 22) = 2082;
    sub_1E0AF0F64();
    v34[0] = v22;
    sub_1E0AD47A0();
    uint64_t v23 = sub_1E0B067B8();
    v34[0] = sub_1E0ACB6F4(v23, v24, &v32);
    sub_1E0B06A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AC7000, v16, v17, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that was not MultiselectItem", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E3C540](v19, -1, -1);
    MEMORY[0x1E4E3C540](v18, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1E0B0409C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a1);
}

uint64_t sub_1E0B040F0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  sub_1E0AD4098(a1, v3);
  swift_endAccess();
  sub_1E0B03B60();
  return sub_1E0AF1014(a1);
}

void (*sub_1E0B04160(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1E0B041C0;
}

void sub_1E0B041C0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1E0B03B60();
  }
}

void sub_1E0B04258()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB28C8]);
  id v4 = objc_msgSend(v2, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB2950]);
  objc_msgSend(v3, sel_pointSize);
  id v6 = objc_msgSend(self, sel_configurationWithPointSize_weight_scale_, 4, 3, v5);
  unint64_t v7 = (id *)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage];
  swift_beginAccess();
  id v8 = objc_msgSend(*v7, sel_imageWithConfiguration_, v6);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v8);
  uint64_t v10 = &v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor];
  swift_beginAccess();
  objc_msgSend(v9, sel_setTintColor_, *(void *)v10);
  objc_msgSend(v1, sel_setAccessoryView_, v9);
  id v11 = objc_msgSend(v1, sel_textLabel);
  if (v11)
  {
    uint64_t v12 = v11;
    objc_msgSend(v11, sel_setFont_, v3);
  }
  id v13 = objc_msgSend(v1, sel_detailTextLabel);
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = v4;
    objc_msgSend(v14, sel_setFont_, v15);

    id v6 = v15;
  }
}

id MultiselectTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultiselectTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MultiselectTableViewCell()
{
  return self;
}

id sub_1E0B04524@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage, a2);
}

void sub_1E0B04530(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_1E0B04550@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor, a2);
}

id keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void **a3@<X8>)
{
  id v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  double v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_1E0B045BC(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1E0B045DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  return sub_1E0AD3F94(v3, a2);
}

uint64_t method lookup function for MultiselectTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MultiselectTableViewCell);
}

uint64_t dispatch thunk of MultiselectTableViewCell.accessoryImage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.accessoryImage.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.accessoryImage.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.tintAccessoryColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.tintAccessoryColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.tintAccessoryColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.updateSymbols()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

void sub_1E0B04858()
{
}

void sub_1E0B0487C(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  sub_1E0B04C54();
  id v4 = (void *)*MEMORY[0x1E4FB28C8];
  double v5 = v2;
  id v6 = v4;
  uint64_t v7 = sub_1E0B06A28();

  if (v7)
  {
    *(void *)&v5[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage] = v7;
    uint64_t v8 = OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor;
    if (qword_1EAD61FC8 != -1) {
      swift_once();
    }
    id v9 = (void *)qword_1EAD65528;
    *(void *)&v5[v8] = qword_1EAD65528;
    uint64_t v10 = &v5[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item];
    *(_OWORD *)uint64_t v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((void *)v10 + 4) = 0;
    id v11 = v9;

    if (a2)
    {
      uint64_t v12 = (void *)sub_1E0B06788();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = 0;
    }
    v28.receiver = v5;
    v28.super_class = (Class)type metadata accessor for MultiselectTableViewCell();
    id v13 = objc_msgSendSuper2(&v28, sel_initWithStyle_reuseIdentifier_, 3, v12);

    id v14 = v13;
    id v15 = objc_msgSend(v14, sel_textLabel);
    if (v15)
    {
      id v16 = v15;
      objc_msgSend(v15, sel_setNumberOfLines_, 0);
    }
    id v17 = objc_msgSend(v14, sel_detailTextLabel);
    if (v17)
    {
      uint64_t v18 = v17;
      id v19 = objc_msgSend(self, sel_secondaryLabelColor);
      objc_msgSend(v18, sel_setTextColor_, v19);
    }
    id v20 = objc_msgSend(v14, sel_detailTextLabel);
    if (v20)
    {
      unint64_t v21 = v20;
      objc_msgSend(v20, sel_setNumberOfLines_, 0);
    }
    sub_1E0B001E8();
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1E0B07E50;
    uint64_t v23 = sub_1E0B06568();
    uint64_t v24 = MEMORY[0x1E4FB1138];
    *(void *)(v22 + 32) = v23;
    *(void *)(v22 + 40) = v24;
    uint64_t v25 = sub_1E0B06458();
    uint64_t v26 = MEMORY[0x1E4FB0EF0];
    *(void *)(v22 + 48) = v25;
    *(void *)(v22 + 56) = v26;
    id v27 = v14;
    sub_1E0B06A18();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void sub_1E0B04B34()
{
  uint64_t v1 = v0;
  sub_1E0B04C54();
  id v2 = (id)*MEMORY[0x1E4FB28C8];
  uint64_t v3 = sub_1E0B06A28();

  if (!v3) {
    __break(1u);
  }
  *(void *)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage] = v3;
  uint64_t v4 = OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor;
  if (qword_1EAD61FC8 != -1) {
    swift_once();
  }
  double v5 = (void *)qword_1EAD65528;
  *(void *)&v1[v4] = qword_1EAD65528;
  id v6 = &v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item];
  *(_OWORD *)id v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  id v7 = v5;

  sub_1E0B06B38();
  __break(1u);
}

unint64_t sub_1E0B04C54()
{
  unint64_t result = qword_1EAD62D88;
  if (!qword_1EAD62D88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD62D88);
  }
  return result;
}

id sub_1E0B04C94(uint64_t a1, uint64_t a2)
{
  sub_1E0B05128(a1, a2, 1954047310, 0xE400000000000000);
  uint64_t v4 = v3;
  if (qword_1EAD61EC0 != -1) {
    swift_once();
  }
  id v5 = (id)qword_1EAD625F0;
  swift_bridgeObjectRetain();
  sub_1E0B05E58();
  swift_bridgeObjectRelease();

  id v6 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  if (v4)
  {
    id v7 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  id v8 = objc_msgSend(v2, sel_addPrimaryFooterButtonWithTitle_automationIdentifier_, v6, v7, 0xE000000000000000);

  return v8;
}

id sub_1E0B04DFC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1E0B05228(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))sub_1E0B04C94);
}

id sub_1E0B04E14(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1E0B04F70(a1, a2, a3, a4, 0x1E4F83A80, (SEL *)&selRef_boldButton, &selRef_primaryFooterButtonTapped);
}

id sub_1E0B04E34(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, SEL *a6, void *a7)
{
  id v10 = [self *a6];
  id v11 = v10;
  if (a4) {
    a4 = (void *)sub_1E0B06788();
  }
  objc_msgSend(v10, sel_setAccessibilityIdentifier_, a4);

  objc_msgSend(v10, sel_addTarget_action_forControlEvents_, v7, *a7, 64);
  uint64_t v12 = (void *)sub_1E0B06788();
  objc_msgSend(v10, sel_setTitle_forState_, v12, 0);

  id v13 = objc_msgSend(v7, sel_buttonTray);
  objc_msgSend(v13, sel_addButton_, v10);

  return v10;
}

id sub_1E0B04F54(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1E0B04F70(a1, a2, a3, a4, 0x1E4F83AB8, (SEL *)&selRef_linkButton, &selRef_secondaryFooterButtonTapped);
}

id sub_1E0B04F70(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, SEL *a6, void *a7)
{
  uint64_t v12 = sub_1E0B06798();
  uint64_t v14 = v13;
  if (a4)
  {
    uint64_t v15 = sub_1E0B06798();
    a4 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v17 = a1;
  id v18 = sub_1E0B04E34(v12, v14, v15, a4, a5, a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

id sub_1E0B0503C(uint64_t a1, uint64_t a2)
{
  sub_1E0B05128(a1, a2, 0x6C65636E6143, 0xE600000000000000);
  uint64_t v4 = v3;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_cancelButtonTapped);
  id v6 = v5;
  if (v4)
  {
    id v7 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  objc_msgSend(v5, sel_setAccessibilityIdentifier_, v7);

  id v8 = objc_msgSend(v2, sel_navigationItem);
  objc_msgSend(v8, sel_setRightBarButtonItem_, v5);

  return v5;
}

uint64_t sub_1E0B05128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    sub_1E0AD4398();
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1E0B08740;
    *(void *)(v8 + 32) = a1;
    *(void *)(v8 + 40) = a2;
    *(void *)(v8 + 48) = a3;
    *(void *)(v8 + 56) = a4;
    *(void *)(v8 + 64) = 0x6E6F74747542;
    *(void *)(v8 + 72) = 0xE600000000000000;
    swift_bridgeObjectRetain();
    id v9 = (void *)sub_1E0B06818();
    swift_bridgeObjectRelease();
    id v10 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v10)
    {
      a1 = sub_1E0B06798();
    }
    else
    {
      return 0;
    }
  }
  return a1;
}

id sub_1E0B05210(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1E0B05228(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))sub_1E0B0503C);
}

id sub_1E0B05228(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = sub_1E0B06798();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a1;
  id v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();
  return v10;
}

id sub_1E0B052B4()
{
  id v1 = objc_msgSend(self, sel_buttonWithType_, 1);
  id v2 = (void *)sub_1E0B06788();
  objc_msgSend(v1, sel_setTitle_forState_, v2, 0);

  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v0, sel_contentViewButtonTapped, 64);
  id v3 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v3, sel_addSubview_, v1);

  id v4 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v1, sel_hk_alignConstraintsWithView_, v4);

  return v1;
}

id sub_1E0B053B8(void *a1)
{
  sub_1E0B06798();
  id v2 = a1;
  id v3 = sub_1E0B052B4();

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerDelegate.onboardingViewControllerDidTapPrimaryButton(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerDelegate.onboardingViewControllerDidTapSecondaryButton(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerDelegate.onboardingViewControllerDidTapCancelButton(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerProtocol.stage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerProtocol.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerProtocol.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

unint64_t static WalkingSteadinessSettingsManager.Constants.suiteName.getter()
{
  return 0xD00000000000002BLL;
}

unint64_t static WalkingSteadinessSettingsManager.Constants.onboardingTileDismissedDateKey.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1E0B054F4(uint64_t a1)
{
  sub_1E0B058C4();
  MEMORY[0x1F4188790](v2 - 8, v3);
  id v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0B0591C(a1, (uint64_t)v5);
  return sub_1E0B056BC((uint64_t)v5);
}

uint64_t sub_1E0B05580@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = (void *)sub_1E0B06788();
  unsigned int v5 = objc_msgSend(v3, sel_hk_keyExists_, v4);

  if (v5)
  {
    uint64_t v6 = (void *)sub_1E0B06788();
    objc_msgSend(v3, sel_doubleForKey_, v6);

    sub_1E0B05F28();
    uint64_t v7 = sub_1E0B05F88();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_1E0B05F88();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }
  return v8(v10, v11, 1, v9);
}

uint64_t sub_1E0B056BC(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1E0B058C4();
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E0B05F88();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0B0591C(a1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1E0B05980((uint64_t)v7);
    uint64_t v13 = *(void **)(v2 + 16);
    uint64_t v14 = (void *)sub_1E0B06788();
    objc_msgSend(v13, sel_removeObjectForKey_, v14);

    return sub_1E0B05980(a1);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
    sub_1E0B05F38();
    double v17 = v16;
    id v18 = *(void **)(v2 + 16);
    id v19 = (void *)sub_1E0B06788();
    objc_msgSend(v18, sel_setDouble_forKey_, v19, v17);

    sub_1E0B05980(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

void sub_1E0B058C4()
{
  if (!qword_1EAD62798)
  {
    sub_1E0B05F88();
    unint64_t v0 = sub_1E0B06A58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD62798);
    }
  }
}

uint64_t sub_1E0B0591C(uint64_t a1, uint64_t a2)
{
  sub_1E0B058C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0B05980(uint64_t a1)
{
  sub_1E0B058C4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*sub_1E0B059DC(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  sub_1E0B058C4();
  size_t v4 = *(void *)(*(void *)(v3 - 8) + 64);
  a1[1] = malloc(v4);
  uint64_t v5 = malloc(v4);
  a1[2] = v5;
  uint64_t v6 = *(void **)(v1 + 16);
  uint64_t v7 = (void *)sub_1E0B06788();
  unsigned int v8 = objc_msgSend(v6, sel_hk_keyExists_, v7);

  if (v8)
  {
    uint64_t v9 = (void *)sub_1E0B06788();
    objc_msgSend(v6, sel_doubleForKey_, v9);

    sub_1E0B05F28();
    uint64_t v10 = sub_1E0B05F88();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1E0B05F88();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  }
  return sub_1E0B05B64;
}

void sub_1E0B05B64(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 16);
  if (a2)
  {
    sub_1E0B0591C((uint64_t)v3, (uint64_t)v2);
    sub_1E0B056BC((uint64_t)v2);
    sub_1E0B05980((uint64_t)v3);
  }
  else
  {
    sub_1E0B056BC((uint64_t)v3);
  }
  free(v3);
  free(v2);
}

void WalkingSteadinessSettingsManager.__allocating_init()()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1E0B06788();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    type metadata accessor for WalkingSteadinessSettingsManager();
    *(void *)(swift_allocObject() + 16) = v2;
  }
  else
  {
    __break(1u);
  }
}

uint64_t WalkingSteadinessSettingsManager.__allocating_init(userDefaults:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessSettingsManager()
{
  return self;
}

uint64_t WalkingSteadinessSettingsManager.init(userDefaults:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t WalkingSteadinessSettingsManager.deinit()
{
  return v0;
}

uint64_t WalkingSteadinessSettingsManager.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1E0B05D14@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0B05580(a1);
}

uint64_t method lookup function for WalkingSteadinessSettingsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WalkingSteadinessSettingsManager);
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.onboardingTileDismissedDate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.onboardingTileDismissedDate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.onboardingTileDismissedDate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.__allocating_init(userDefaults:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for WalkingSteadinessSettingsManager.Constants()
{
  return &type metadata for WalkingSteadinessSettingsManager.Constants;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1E0B05E08()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1E0B05E18()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1E0B05E28()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1E0B05E38()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1E0B05E48()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1E0B05E58()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1E0B05EC8()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1E0B05ED8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1E0B05EE8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1E0B05EF8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1E0B05F08()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1E0B05F18()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1E0B05F28()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1E0B05F38()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1E0B05F48()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1E0B05F58()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1E0B05F68()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1E0B05F78()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1E0B05F88()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1E0B05F98()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1E0B05FA8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1E0B05FB8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1E0B05FC8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1E0B05FD8()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1E0B05FE8()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1E0B05FF8()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1E0B06008()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1E0B06018()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1E0B06028()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1E0B06038()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1E0B06048()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1E0B06058()
{
  return MEMORY[0x1F4165708]();
}

uint64_t sub_1E0B06068()
{
  return MEMORY[0x1F4165710]();
}

uint64_t sub_1E0B06078()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1E0B06088()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1E0B06098()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1E0B060A8()
{
  return MEMORY[0x1F411FF20]();
}

uint64_t sub_1E0B060B8()
{
  return MEMORY[0x1F411FF28]();
}

uint64_t sub_1E0B060C8()
{
  return MEMORY[0x1F41207F8]();
}

uint64_t sub_1E0B060D8()
{
  return MEMORY[0x1F4120850]();
}

uint64_t sub_1E0B060E8()
{
  return MEMORY[0x1F41208A0]();
}

uint64_t sub_1E0B060F8()
{
  return MEMORY[0x1F411D700]();
}

uint64_t sub_1E0B06108()
{
  return MEMORY[0x1F411D708]();
}

uint64_t sub_1E0B06118()
{
  return MEMORY[0x1F411D710]();
}

uint64_t sub_1E0B06128()
{
  return MEMORY[0x1F411D850]();
}

uint64_t sub_1E0B06138()
{
  return MEMORY[0x1F411D858]();
}

uint64_t sub_1E0B06148()
{
  return MEMORY[0x1F411D900]();
}

uint64_t sub_1E0B06158()
{
  return MEMORY[0x1F411D918]();
}

uint64_t sub_1E0B06168()
{
  return MEMORY[0x1F411DB10]();
}

uint64_t sub_1E0B06178()
{
  return MEMORY[0x1F411DB20]();
}

uint64_t sub_1E0B06198()
{
  return MEMORY[0x1F411DE80]();
}

uint64_t sub_1E0B061A8()
{
  return MEMORY[0x1F411DE90]();
}

uint64_t sub_1E0B061B8()
{
  return MEMORY[0x1F411DE98]();
}

uint64_t sub_1E0B061C8()
{
  return MEMORY[0x1F411E128]();
}

uint64_t sub_1E0B061D8()
{
  return MEMORY[0x1F411E220]();
}

uint64_t sub_1E0B061E8()
{
  return MEMORY[0x1F411E2B8]();
}

uint64_t sub_1E0B061F8()
{
  return MEMORY[0x1F411E2C8]();
}

uint64_t sub_1E0B06208()
{
  return MEMORY[0x1F411E6D0]();
}

uint64_t sub_1E0B06218()
{
  return MEMORY[0x1F411E6E0]();
}

uint64_t sub_1E0B06228()
{
  return MEMORY[0x1F411E708]();
}

uint64_t sub_1E0B06238()
{
  return MEMORY[0x1F411E730]();
}

uint64_t sub_1E0B06258()
{
  return MEMORY[0x1F411E768]();
}

uint64_t sub_1E0B06268()
{
  return MEMORY[0x1F411E770]();
}

uint64_t sub_1E0B06278()
{
  return MEMORY[0x1F411E790]();
}

uint64_t sub_1E0B06288()
{
  return MEMORY[0x1F411EAA0]();
}

uint64_t sub_1E0B06298()
{
  return MEMORY[0x1F411EAB8]();
}

uint64_t sub_1E0B062A8()
{
  return MEMORY[0x1F411EC38]();
}

uint64_t sub_1E0B062B8()
{
  return MEMORY[0x1F411EC40]();
}

uint64_t sub_1E0B062C8()
{
  return MEMORY[0x1F411EC50]();
}

uint64_t sub_1E0B062D8()
{
  return MEMORY[0x1F411ECE8]();
}

uint64_t sub_1E0B062E8()
{
  return MEMORY[0x1F411ECF0]();
}

uint64_t sub_1E0B062F8()
{
  return MEMORY[0x1F411ECF8]();
}

uint64_t sub_1E0B06308()
{
  return MEMORY[0x1F411ED00]();
}

uint64_t sub_1E0B06318()
{
  return MEMORY[0x1F411F000]();
}

uint64_t sub_1E0B06328()
{
  return MEMORY[0x1F411F010]();
}

uint64_t sub_1E0B06338()
{
  return MEMORY[0x1F411F018]();
}

uint64_t sub_1E0B06348()
{
  return MEMORY[0x1F411F020]();
}

uint64_t sub_1E0B06358()
{
  return MEMORY[0x1F411F058]();
}

uint64_t sub_1E0B06368()
{
  return MEMORY[0x1F411F060]();
}

uint64_t sub_1E0B06378()
{
  return MEMORY[0x1F411F068]();
}

uint64_t sub_1E0B06388()
{
  return MEMORY[0x1F411F078]();
}

uint64_t sub_1E0B06398()
{
  return MEMORY[0x1F411F080]();
}

uint64_t sub_1E0B063A8()
{
  return MEMORY[0x1F411F0B8]();
}

uint64_t sub_1E0B063B8()
{
  return MEMORY[0x1F411F0C0]();
}

uint64_t sub_1E0B063C8()
{
  return MEMORY[0x1F411F0C8]();
}

uint64_t sub_1E0B063D8()
{
  return MEMORY[0x1F411F0D0]();
}

uint64_t sub_1E0B063E8()
{
  return MEMORY[0x1F411F128]();
}

uint64_t sub_1E0B063F8()
{
  return MEMORY[0x1F411F130]();
}

uint64_t sub_1E0B06408()
{
  return MEMORY[0x1F411F138]();
}

uint64_t sub_1E0B06418()
{
  return MEMORY[0x1F4120C28]();
}

uint64_t sub_1E0B06428()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1E0B06438()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1E0B06448()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E0B06458()
{
  return MEMORY[0x1F4165BA8]();
}

uint64_t sub_1E0B06468()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1E0B06478()
{
  return MEMORY[0x1F4165D60]();
}

uint64_t sub_1E0B06488()
{
  return MEMORY[0x1F4165D68]();
}

uint64_t sub_1E0B06498()
{
  return MEMORY[0x1F4165D88]();
}

uint64_t sub_1E0B064A8()
{
  return MEMORY[0x1F4165DD8]();
}

uint64_t sub_1E0B064B8()
{
  return MEMORY[0x1F4165DE0]();
}

uint64_t sub_1E0B064C8()
{
  return MEMORY[0x1F4165DE8]();
}

uint64_t sub_1E0B064D8()
{
  return MEMORY[0x1F4165DF0]();
}

uint64_t sub_1E0B064E8()
{
  return MEMORY[0x1F4165E08]();
}

uint64_t sub_1E0B064F8()
{
  return MEMORY[0x1F4165E28]();
}

uint64_t sub_1E0B06508()
{
  return MEMORY[0x1F4165E30]();
}

uint64_t sub_1E0B06518()
{
  return MEMORY[0x1F4165EB0]();
}

uint64_t sub_1E0B06528()
{
  return MEMORY[0x1F4165EB8]();
}

uint64_t sub_1E0B06538()
{
  return MEMORY[0x1F4165F28]();
}

uint64_t sub_1E0B06548()
{
  return MEMORY[0x1F4165F30]();
}

uint64_t sub_1E0B06558()
{
  return MEMORY[0x1F4165F68]();
}

uint64_t sub_1E0B06568()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1E0B06578()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1E0B06588()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1E0B06598()
{
  return MEMORY[0x1F40D6678]();
}

uint64_t sub_1E0B065A8()
{
  return MEMORY[0x1F40D6680]();
}

uint64_t sub_1E0B065B8()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1E0B065C8()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1E0B065D8()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1E0B065E8()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1E0B065F8()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1E0B06608()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1E0B06618()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1E0B06628()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1E0B06638()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1E0B06648()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1E0B06658()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1E0B06668()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1E0B06678()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1E0B06688()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1E0B06698()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1E0B066A8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1E0B066B8()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1E0B066C8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1E0B066D8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1E0B066E8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1E0B066F8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1E0B06708()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1E0B06718()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1E0B06728()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1E0B06738()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1E0B06748()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1E0B06758()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1E0B06768()
{
  return MEMORY[0x1F411F180]();
}

uint64_t sub_1E0B06778()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1E0B06788()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E0B06798()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E0B067A8()
{
  return MEMORY[0x1F40E6208]();
}

uint64_t sub_1E0B067B8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E0B067D8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E0B067E8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E0B067F8()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1E0B06808()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E0B06818()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1E0B06828()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1E0B06838()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1E0B06848()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1E0B06858()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1E0B06868()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1E0B06878()
{
  return MEMORY[0x1F411EE68]();
}

uint64_t sub_1E0B06888()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1E0B06898()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1E0B068A8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E0B068B8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1E0B068C8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E0B068D8()
{
  return MEMORY[0x1F40E7960]();
}

uint64_t sub_1E0B068E8()
{
  return MEMORY[0x1F41664E0]();
}

uint64_t sub_1E0B068F8()
{
  return MEMORY[0x1F41664E8]();
}

uint64_t sub_1E0B06908()
{
  return MEMORY[0x1F4166508]();
}

uint64_t sub_1E0B06918()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1E0B06928()
{
  return MEMORY[0x1F411F2B8]();
}

uint64_t sub_1E0B06938()
{
  return MEMORY[0x1F411F2C0]();
}

uint64_t sub_1E0B06948()
{
  return MEMORY[0x1F411F2C8]();
}

uint64_t sub_1E0B06958()
{
  return MEMORY[0x1F411F2D0]();
}

uint64_t sub_1E0B06968()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1E0B06978()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1E0B06988()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1E0B06998()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1E0B069A8()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1E0B069B8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1E0B069C8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1E0B069D8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1E0B069E8()
{
  return MEMORY[0x1F411E008]();
}

uint64_t sub_1E0B069F8()
{
  return MEMORY[0x1F411F340]();
}

uint64_t sub_1E0B06A08()
{
  return MEMORY[0x1F411F358]();
}

uint64_t sub_1E0B06A18()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1E0B06A28()
{
  return MEMORY[0x1F411EF68]();
}

uint64_t sub_1E0B06A38()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1E0B06A48()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1E0B06A58()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1E0B06A68()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1E0B06A78()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1E0B06A98()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1E0B06AA8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1E0B06AB8()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1E0B06AC8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1E0B06AD8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E0B06AE8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E0B06AF8()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1E0B06B08()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E0B06B18()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1E0B06B28()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1E0B06B38()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1E0B06B48()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E0B06B58()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E0B06B68()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1E0B06B78()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1E0B06B88()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1E0B06B98()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E0B06BA8()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1E0B06BB8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E0B06BE8()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1E0B06BF8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E0B06C08()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E0B06C18()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E0B06C28()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1E0B06C38()
{
  return MEMORY[0x1F411F360]();
}

uint64_t sub_1E0B06C48()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1E0B06C58()
{
  return MEMORY[0x1F4186318]();
}

uint64_t HKFormattedFeetAndInches()
{
  return MEMORY[0x1F4121568]();
}

uint64_t HKMobilityWalkingSteadinessDetailRoomURL()
{
  return MEMORY[0x1F411FAF8]();
}

uint64_t HKMobilityWalkingSteadinessType()
{
  return MEMORY[0x1F411FB00]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x1F4121628]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
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