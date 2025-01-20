void sub_21C74D8F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(id, void *, void *);
  id v8;
  id v9;
  id v10;
  uint64_t vars8;

  v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(v10, a3, a4);
  swift_release();
}

void sub_21C74D998(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(v3 + 16) + 16;
  swift_beginAccess();
  v7 = (void *)MEMORY[0x21D4B0160](v6);
  if (v7)
  {
    v8 = v7;
    if (a2)
    {
      objc_msgSend(v7, sel_pregnancyModelDidChangeWithModel_, a2);
LABEL_7:

      return;
    }
    os_log_type_t v9 = sub_21C7819A0();
    v10 = (void *)*MEMORY[0x263F098C8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v9)) {
      goto LABEL_7;
    }
    id v11 = a3;
    id v12 = a3;
    v13 = v10;
    uint64_t v14 = swift_slowAlloc();
    v15 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v21 = v16;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v17 = sub_21C781C10();
    sub_21C74E328(v17, v18, &v21);
    sub_21C781A20();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    if (a3)
    {
      id v19 = a3;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      sub_21C781A20();
    }
    else
    {
      sub_21C781A20();
      uint64_t v20 = 0;
    }
    void *v15 = v20;

    _os_log_impl(&dword_21C74B000, v13, v9, "%s Error when trying to get model from pregnancy state query: %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F180);
    swift_arrayDestroy();
    MEMORY[0x21D4B0100](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21D4B0100](v16, -1, -1);
    MEMORY[0x21D4B0100](v14, -1, -1);
  }
}

void sub_21C74DC5C(void *a1)
{
  v2 = v1;
  swift_getObjectType();
  os_log_type_t v4 = sub_21C7819B0();
  v5 = (os_log_t *)MEMORY[0x263F098C8];
  uint64_t v6 = (void *)*MEMORY[0x263F098C8];
  os_log_type_t v7 = v4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v4))
  {
    id v8 = a1;
    log = v6;
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v9 = 136315138;
    uint64_t v43 = v10;
    uint64_t v44 = 0;
    unint64_t v45 = 0xE000000000000000;
    sub_21C781A70();
    sub_21C7818E0();
    sub_21C781C10();
    sub_21C7818E0();
    swift_bridgeObjectRelease();
    sub_21C7818E0();
    id v11 = objc_msgSend(v8, sel_description);
    sub_21C7818B0();

    sub_21C7818E0();
    swift_bridgeObjectRelease();
    sub_21C7818E0();
    id v12 = (void *)sub_21C7818A0();
    swift_bridgeObjectRelease();
    id v13 = (id)HKSensitiveLogItem();

    sub_21C781A40();
    swift_unknownObjectRelease();
    uint64_t v14 = sub_21C7818C0();
    uint64_t v44 = sub_21C74E328(v14, v15, &v43);
    sub_21C781A20();

    v5 = (os_log_t *)MEMORY[0x263F098C8];
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C74B000, log, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B0100](v10, -1, -1);
    MEMORY[0x21D4B0100](v9, -1, -1);
  }
  uint64_t v16 = OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel;
  uint64_t v17 = *(void *)&v2[OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel];
  if (v17) {
    id v18 = objc_msgSend(*(id *)&v2[OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel], sel_state);
  }
  else {
    id v18 = 0;
  }
  id v19 = objc_msgSend(a1, sel_state);
  os_log_type_t v20 = sub_21C7819B0();
  os_log_t v21 = *v5;
  BOOL v22 = os_log_type_enabled(*v5, v20);
  if (v17) {
    BOOL v23 = v18 == v19;
  }
  else {
    BOOL v23 = 0;
  }
  if (v23)
  {
    if (v22)
    {
      v33 = v21;
      v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)v34 = 136315138;
      uint64_t v43 = v35;
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_21C781A70();
      sub_21C7818E0();
      sub_21C781C10();
      sub_21C7818E0();
      swift_bridgeObjectRelease();
      sub_21C7818E0();
      v36 = (void *)sub_21C7818A0();
      swift_bridgeObjectRelease();
      id v37 = (id)HKSensitiveLogItem();

      sub_21C781A40();
      swift_unknownObjectRelease();
      uint64_t v38 = sub_21C7818C0();
      uint64_t v44 = sub_21C74E328(v38, v39, &v43);
      sub_21C781A20();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C74B000, v33, v20, "%s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B0100](v35, -1, -1);
      MEMORY[0x21D4B0100](v34, -1, -1);
    }
  }
  else
  {
    if (v22)
    {
      id v24 = a1;
      loga = v21;
      v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)v25 = 136315138;
      uint64_t v43 = v40;
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_21C781A70();
      sub_21C7818E0();
      sub_21C781C10();
      sub_21C7818E0();
      swift_bridgeObjectRelease();
      sub_21C7818E0();
      id v26 = objc_msgSend(v24, sel_description);
      sub_21C7818B0();

      sub_21C7818E0();
      swift_bridgeObjectRelease();
      sub_21C7818E0();
      v27 = (void *)sub_21C7818A0();
      swift_bridgeObjectRelease();
      id v28 = (id)HKSensitiveLogItem();

      sub_21C781A40();
      swift_unknownObjectRelease();
      uint64_t v29 = sub_21C7818C0();
      uint64_t v44 = sub_21C74E328(v29, v30, &v43);
      sub_21C781A20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C74B000, loga, v20, "%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B0100](v40, -1, -1);
      MEMORY[0x21D4B0100](v25, -1, -1);
    }
    v31 = *(void **)&v2[v16];
    *(void *)&v2[v16] = a1;
    id v32 = a1;

    if (*(void *)&v2[v16]) {
      objc_msgSend(v2, sel_notifyObservers_);
    }
  }
}

uint64_t sub_21C74E328(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21C74E458(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21C74E3FC((uint64_t)v12, *a3);
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
      sub_21C74E3FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21C74E3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21C74E458(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21C781A30();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21C774CE8(a5, a6);
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
  uint64_t v8 = sub_21C781AA0();
  if (!v8)
  {
    sub_21C781B00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21C781B50();
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

void FIActivityAnalyticsSubmissionWithPayload(void *a1, void *a2)
{
}

uint64_t FIExperienceTypeWithHealthStore(void *a1)
{
  id v8 = 0;
  v1 = [a1 dateOfBirthComponentsWithError:&v8];
  id v2 = v8;
  if (v2)
  {
    _HKInitializeLogging();
    uint64_t v3 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_21C74B000, v3, OS_LOG_TYPE_DEFAULT, "Unable to fetch date of birth, unable to determine fitness experience type", v7, 2u);
    }
    uint64_t v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v4 = FIExperienceTypeForBirthDateComponents(v1, v5);
  }
  return v4;
}

uint64_t FIExperienceTypeForBirthDateComponents(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 date];
  uint64_t v7 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(v5, v6, v4);

  uint64_t v8 = 2;
  if (v7 <= 9) {
    uint64_t v8 = 3;
  }
  if (v7 > 12) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

uint64_t FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(void *a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = objc_msgSend(v5, "hk_gregorianCalendar");
  uint64_t v10 = [v9 dateFromComponents:v8];

  uint64_t v11 = [v6 components:4 fromDate:v10 toDate:v7 options:0];

  uint64_t v12 = [v11 year];
  return v12;
}

void __FIDistanceUnitForHKUnit_block_invoke()
{
  v3[5] = *MEMORY[0x263EF8340];
  v2[0] = @"km";
  v2[1] = @"m";
  v3[0] = &unk_26CD11D18;
  v3[1] = &unk_26CD11D30;
  v2[2] = @"mi";
  v2[3] = @"yd";
  v3[2] = &unk_26CD11D48;
  v3[3] = &unk_26CD11D60;
  v2[4] = @"ft";
  v3[4] = &unk_26CD11D78;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)FIDistanceUnitForHKUnit___distanceUnitsByUnitString;
  FIDistanceUnitForHKUnit___distanceUnitsByUnitString = v0;
}

uint64_t FIDistanceUnitForHKUnit(void *a1)
{
  id v1 = a1;
  if (FIDistanceUnitForHKUnit_onceToken != -1) {
    dispatch_once(&FIDistanceUnitForHKUnit_onceToken, &__block_literal_global_4);
  }
  id v2 = [v1 unitString];
  uint64_t v3 = [(id)FIDistanceUnitForHKUnit___distanceUnitsByUnitString objectForKeyedSubscript:v2];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      FIDistanceUnitForHKUnit_cold_1();
    }
    uint64_t v5 = 2;
  }

  return v5;
}

uint64_t _IsValidUserUnitForQuantityType(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (_IsValidUserUnitForQuantityType_onceToken != -1)
  {
    dispatch_once(&_IsValidUserUnitForQuantityType_onceToken, &__block_literal_global_408);
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = [(id)_IsValidUserUnitForQuantityType___validUnitStringsByQuantityType objectForKeyedSubscript:v5];
  id v7 = [v3 unitString];
  uint64_t v8 = [v6 containsObject:v7];

LABEL_6:
  return v8;
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

id FIRandomKeyForPrefixWithTableName(void *a1, void *a2, void *a3)
{
  id v16 = a1;
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
    uint64_t v8 = 1;
    while (1)
    {
      uint64_t v9 = [NSString stringWithFormat:@"%@_%d", v16, v8];
      uint64_t v10 = [v5 localizedStringForKey:v9 value:@"__key_not_found__" table:v6];
      if ([v10 isEqualToString:@"__key_not_found__"]) {
        break;
      }
      uint64_t v8 = (v8 + 1);
      uint64_t v11 = [v7 arrayByAddingObject:v9];

      id v7 = (void *)v11;
    }

    if ([v7 count])
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = *MEMORY[0x263F098C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEBUG)) {
        FIRandomKeyForPrefixWithTableName_cold_1((uint64_t)v16, v14);
      }
      id v12 = v16;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id FIRandomStringForPrefixWithTableName(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = FIRandomKeyForPrefixWithTableName(v5, v6, v7);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = _FIStringWithExactKeyWithTableName(v8, v6, v7);
    if (![v10 isEqualToString:@"__key_not_found__"]) {
      goto LABEL_7;
    }
  }
  _HKInitializeLogging();
  uint64_t v11 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_FAULT))
  {
    int v13 = 138543874;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_fault_impl(&dword_21C74B000, v11, OS_LOG_TYPE_FAULT, "Unable to find a random string for prefix %{public}@ in bundle %{public}@ with table name %{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

id _FIStringWithExactKeyWithTableName(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v6 localizedStringForKey:v5 value:@"__key_not_found__" table:v7];
    if ([v9 isEqualToString:@"__key_not_found__"])
    {
      if ([v7 isEqualToString:@"Localizable"])
      {
        uint64_t v8 = 0;
LABEL_9:

        goto LABEL_10;
      }
      _FIStringForKeyInDefaultLocalizableTable(v5, v6);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = v9;
    }
    uint64_t v8 = v10;
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

void FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA(void *a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if (a3
    && ([MEMORY[0x263F53C50] sharedConnection],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isHealthDataSubmissionAllowed],
        v7,
        !v8))
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_21C74B000, v9, OS_LOG_TYPE_DEFAULT, "[#analytics] health data submission not allowed. Not sending analytics for event: %@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = v5;
    id v11 = v6;
    AnalyticsSendEventLazy();
  }
}

uint64_t FIDeviceMeetsMinimumOSVersionDaytona()
{
  return FIDeviceMeetsMinimumOSVersion(196608);
}

void sub_21C750ED0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t FIIsTinkerVegaOrFitnessJunior()
{
  uint64_t v0 = [MEMORY[0x263F0A980] sharedBehavior];
  if (([v0 isStandalonePhoneFitnessMode] & 1) != 0 || FIActivityMoveModeUserDefault() == 2) {
    uint64_t active = 1;
  }
  else {
    uint64_t active = FIIsActivePairedDeviceSatellitePaired();
  }

  return active;
}

id FIHKUnitForDistanceUnit(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      id v3 = objc_msgSend(MEMORY[0x263F0A830], "meterUnit", v1);
      goto LABEL_10;
    case 2:
      id v3 = objc_msgSend(MEMORY[0x263F0A830], "meterUnitWithMetricPrefix:", 9, v1);
      goto LABEL_10;
    case 3:
      id v3 = objc_msgSend(MEMORY[0x263F0A830], "mileUnit", v1);
      goto LABEL_10;
    case 4:
      id v3 = objc_msgSend(MEMORY[0x263F0A830], "yardUnit", v1);
      goto LABEL_10;
    case 5:
      id v3 = objc_msgSend(MEMORY[0x263F0A830], "footUnit", v1);
LABEL_10:
      break;
    default:
      id v3 = 0;
      break;
  }
  return v3;
}

uint64_t objectdestroy_96Tm(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t FIDeviceMeetsMinimumOSVersion(uint64_t a1)
{
  uint64_t v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  id v3 = [getNRPairedDeviceRegistryClass() activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  if (!v5)
  {
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  id v6 = v5;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v7 = (uint64_t (*)(id))getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  id v18 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
  {
    int v8 = (void *)NanoRegistryLibrary();
    v16[3] = (uint64_t)dlsym(v8, "NRWatchOSVersionForRemoteDevice");
    getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = (_UNKNOWN *)v16[3];
    id v7 = (uint64_t (*)(id))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
  {
    FIIsDeviceSatellitePaired_cold_1();
    goto LABEL_12;
  }
  uint64_t v9 = v7(v6);

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v10 = (uint64_t (*)(uint64_t, uint64_t))getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  id v18 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  if (!getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr)
  {
    id v11 = (void *)NanoRegistryLibrary();
    v16[3] = (uint64_t)dlsym(v11, "NRVersionIsGreaterThanOrEqual");
    getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = (_UNKNOWN *)v16[3];
    id v10 = (uint64_t (*)(uint64_t, uint64_t))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v10)
  {
LABEL_12:
    uint64_t v14 = (_Unwind_Exception *)FIIsDeviceSatellitePaired_cold_1();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v14);
  }
  uint64_t v12 = v10(v9, a1);
LABEL_10:

  return v12;
}

id getNRPairedDeviceRegistryClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_26441D318;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21C7516C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  NanoRegistryLibrary();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    return (Class)NanoRegistryLibrary();
  }
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __NanoRegistryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26441D540;
    uint64_t v5 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void FIActivityAnalyticsSubmission(void *a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v10 = a2;
  v11[0] = a3;
  uint64_t v5 = NSDictionary;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA(v8, v9, 1);
}

id __FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_21C74B000, v2, OS_LOG_TYPE_DEFAULT, "[#analytics] submission for event: %@, payload: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void **)(a1 + 40);
  return v5;
}

uint64_t _ValidateSample(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(v7, "fi_overlapsStartDate:endDate:", v8, v9);
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Sample %@ does not overlap with startDate:%@ endDate: %@", v7, v8, v9];
    uint64_t v12 = FIIntervalErrorWithDescription(v11);
    FISetOutErrorIfNotNull(a4, v12);
  }
  return v10;
}

void sub_21C753608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21C753BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21C7541F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21C7547BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21C754DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

unint64_t activitySummaryIndexForReporting()
{
  uint64_t v0 = [MEMORY[0x263EFF910] date];
  unint64_t v1 = activitySummaryIndexForReportingForDate(v0);

  return v1;
}

unint64_t activitySummaryIndexForReportingForDate(void *a1)
{
  unint64_t v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  uint64_t v3 = objc_msgSend(v1, "hk_gregorianCalendarWithUTCTimeZone");
  uint64_t v4 = [v3 startOfDayForDate:v2];

  uint64_t v5 = [v3 dateByAddingUnit:16 value:-2 toDate:v4 options:0];
  [v5 timeIntervalSinceReferenceDate];
  unint64_t v7 = llround(v6);

  return v7;
}

id FIActivitySummaryForSummaryIndex(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  double v6 = (void *)[objc_alloc(MEMORY[0x263F43140]) initWithProfile:v5];
  [v6 setShouldIncludePrivateProperties:0];
  unint64_t v7 = HDActivityCacheEntityPredicateForCacheIndex();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __FIActivitySummaryForSummaryIndex_block_invoke;
  v10[3] = &unk_26441CA10;
  v10[4] = &v11;
  v10[5] = a2;
  [v6 enumerateActivitySummariesWithPredicate:v7 error:a3 handler:v10];
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_21C7552F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __FIActivitySummaryForSummaryIndex_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 _activitySummaryIndex] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

uint64_t FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile(void *a1, uint64_t a2)
{
  id v17 = 0;
  id v2 = FIActivitySummaryForSummaryIndex(a1, a2, (uint64_t)&v17);
  id v3 = v17;
  uint64_t v4 = v3;
  if (v2)
  {
    [v2 _standHoursCompletionPercentage];
    double v6 = v5;
    [v2 _exerciseTimeCompletionPercentage];
    uint64_t v8 = 2;
    if (v6 < 1.0) {
      uint64_t v8 = 1;
    }
    if (v7 >= 1.0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v6 >= 1.0;
    }
    [v2 _activeEnergyCompletionPercentage];
    if (v10 >= 1.0 || ([v2 _moveMinutesCompletionPercentage], v11 >= 1.0)) {
      ++v9;
    }
  }
  else
  {
    if (v3)
    {
      int v12 = objc_msgSend(v3, "hk_isDatabaseAccessibilityError");
      _HKInitializeLogging();
      uint64_t v13 = *MEMORY[0x263F098D8];
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_1();
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_2();
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = *MEMORY[0x263F098D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_21C74B000, v14, OS_LOG_TYPE_DEFAULT, "No activity summary found for yesterday", v16, 2u);
      }
    }
    uint64_t v9 = -1;
  }

  return v9;
}

id FIActivitySummaryAnalyticsPayloadForProfileAndSummaryCacheIndex(void *a1, uint64_t a2)
{
  v39[2] = *MEMORY[0x263EF8340];
  id v37 = 0;
  id v2 = FIActivitySummaryForSummaryIndex(a1, a2, (uint64_t)&v37);
  id v3 = v37;
  uint64_t v4 = v3;
  if (v2)
  {
    id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
    v38[0] = @"isMoveRingClosed";
    double v6 = NSNumber;
    [v2 _activeEnergyCompletionPercentage];
    if (v7 >= 1.0)
    {
      BOOL v9 = 1;
    }
    else
    {
      [v2 _moveMinutesCompletionPercentage];
      BOOL v9 = v8 >= 1.0;
    }
    int v12 = [v6 numberWithInt:v9];
    v38[1] = @"dailyGoalPaused";
    v39[0] = v12;
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isPaused"));
    v39[1] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    uint64_t v15 = (void *)[v5 initWithDictionary:v14];

    id v16 = [v2 standHoursGoal];

    if (v16)
    {
      id v17 = NSNumber;
      [v2 _standHoursCompletionPercentage];
      uint64_t v19 = [v17 numberWithInt:v18 >= 1.0];
      [v15 setObject:v19 forKeyedSubscript:@"isStandRingClosed"];

      os_log_type_t v20 = NSNumber;
      os_log_t v21 = [v2 standHoursGoal];
      BOOL v22 = [MEMORY[0x263F0A830] countUnit];
      [v21 doubleValueForUnit:v22];
      id v24 = [v20 numberWithInt:v23 != 12.0];
      [v15 setObject:v24 forKeyedSubscript:@"customizedStand"];
    }
    v25 = [v2 exerciseTimeGoal];

    if (v25)
    {
      id v26 = NSNumber;
      [v2 _exerciseTimeCompletionPercentage];
      id v28 = [v26 numberWithInt:v27 >= 1.0];
      [v15 setObject:v28 forKeyedSubscript:@"isExerciseRingClosed"];

      uint64_t v29 = NSNumber;
      unint64_t v30 = [v2 exerciseTimeGoal];
      v31 = [MEMORY[0x263F0A830] minuteUnit];
      [v30 doubleValueForUnit:v31];
      v33 = [v29 numberWithInt:v32 != 30.0];
      [v15 setObject:v33 forKeyedSubscript:@"customizedExercise"];
    }
  }
  else
  {
    if (v3)
    {
      int v10 = objc_msgSend(v3, "hk_isDatabaseAccessibilityError");
      _HKInitializeLogging();
      double v11 = *MEMORY[0x263F098D8];
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_1();
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_2();
      }
    }
    else
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x263F098D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_21C74B000, v34, OS_LOG_TYPE_DEFAULT, "No activity summary found for yesterday", v36, 2u);
      }
    }
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v25 = _HKActivityCacheDateComponentsFromCacheIndex();
  id v24 = objc_msgSend(v2, "dateFromComponents:");
  id v3 = objc_msgSend(v2, "startOfDayForDate:");
  uint64_t v4 = objc_msgSend(v2, "hk_dateByAddingDays:toDate:", 1, v3);
  id v5 = (void *)MEMORY[0x263F434D0];
  double v6 = (void *)MEMORY[0x263F434A0];
  uint64_t v7 = *MEMORY[0x263F43080];
  double v8 = NSNumber;
  [v3 timeIntervalSinceReferenceDate];
  BOOL v9 = objc_msgSend(v8, "numberWithDouble:");
  int v10 = [v6 predicateWithProperty:v7 greaterThanOrEqualToValue:v9];
  double v11 = (void *)MEMORY[0x263F434A0];
  uint64_t v12 = *MEMORY[0x263F43088];
  uint64_t v13 = NSNumber;
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  uint64_t v15 = [v11 predicateWithProperty:v12 lessThanValue:v14];
  id v16 = [v5 compoundPredicateWithPredicate:v10 otherPredicate:v15];

  id v17 = [MEMORY[0x263F43458] entityEnumeratorWithProfile:v1];
  [v17 setPredicate:v16];
  [v17 setLimitCount:1];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v26[4] = &v28;
  id v27 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_block_invoke;
  v26[3] = &unk_26441CA38;
  char v18 = [v17 enumerateWithError:&v27 handler:v26];
  id v19 = v27;
  os_log_type_t v20 = v19;
  if (v19) {
    char v21 = v18;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    if (objc_msgSend(v19, "hk_isDatabaseAccessibilityError"))
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEBUG)) {
        FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_1();
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
        FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_2();
      }
    }
  }
  uint64_t v22 = *((unsigned __int8 *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v22;
}

void sub_21C755BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id FISampleQuantityInsideDateInterval(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  double v6 = (objc_class *)MEMORY[0x263F08798];
  id v7 = a2;
  id v8 = [v6 alloc];
  uint64_t v9 = [v5 startDate];
  int v10 = [v5 endDate];
  double v11 = (void *)[v8 initWithStartDate:v9 endDate:v10];

  uint64_t v12 = [v11 intersectionWithDateInterval:v7];

  if (v12 && ([v11 duration], v13 >= 2.22044605e-16))
  {
    if (a3) {
      *a3 = v12;
    }
    [v12 duration];
    double v21 = v20;
    [v11 duration];
    double v23 = v21 / v22;
    id v24 = [v5 quantity];
    v25 = [v5 quantity];
    id v26 = [v25 _unit];
    [v24 doubleValueForUnit:v26];
    double v28 = v23 * v27;

    uint64_t v29 = (void *)MEMORY[0x263F0A630];
    uint64_t v15 = [v5 quantity];
    id v16 = [v15 _unit];
    char v18 = v29;
    id v19 = v16;
    double v17 = v28;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F0A630];
    uint64_t v15 = [v5 quantity];
    id v16 = [v15 _unit];
    double v17 = 0.0;
    char v18 = v14;
    id v19 = v16;
  }
  uint64_t v30 = [v18 quantityWithUnit:v19 doubleValue:v17];

  return v30;
}

id FIFilterPauseResumeEvents(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v8, "type", (void)v11) - 1) <= 1) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = (void *)[v2 copy];
  return v9;
}

id FISortEventsByDate(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263EFF980];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithArray:v2];

  [v3 sortUsingComparator:&__block_literal_global_0];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

uint64_t __FISortEventsByDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 dateInterval];
  uint64_t v6 = [v5 startDate];
  id v7 = [v4 dateInterval];

  id v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

id FIFilterSamplesByType(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "quantityType", (void)v16);
        int v13 = [v12 isEqual:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];
  return v14;
}

id FISortSamplesByDate(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263EFF980];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithArray:v2];

  [v3 sortUsingComparator:&__block_literal_global_282];
  id v4 = (void *)[v3 copy];

  return v4;
}

uint64_t __FISortSamplesByDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 endDate];
  id v6 = [v4 endDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id FIThresholdDateInsideSample(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a3;
  id v8 = a2;
  id v9 = a1;
  int v10 = [v9 quantity];
  long long v11 = [v10 _unit];

  long long v12 = [v9 quantity];
  [v12 doubleValueForUnit:v11];
  double v14 = v13;

  [v8 doubleValueForUnit:v11];
  double v16 = v15;

  [v7 doubleValueForUnit:v11];
  double v18 = v17;

  double v19 = (v14 - (v16 - v18)) / v14;
  double v20 = [v9 endDate];
  uint64_t v21 = [v9 startDate];
  [v20 timeIntervalSinceDate:v21];
  double v23 = v22;

  double v24 = v19 * v23;
  if (a4)
  {
    v25 = [v9 endDate];

    double v26 = -v24;
    double v27 = v25;
  }
  else
  {
    v25 = [v9 startDate];

    double v27 = v25;
    double v26 = v24;
  }
  double v28 = [v27 dateByAddingTimeInterval:v26];

  return v28;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

id FILocalizedNameForIndoorAgnosticActivityType()
{
  uint64_t v0 = FIBundle();
  id v1 = _HKWorkoutActivityNameForActivityType();
  id v2 = [v0 localizedStringForKey:v1 value:&stru_26CD0B5F8 table:@"Localizable"];

  return v2;
}

id FILocalizedActivityNameWithWorkout(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 workoutActivityType];
  unint64_t v5 = objc_msgSend(v3, "fi_swimmingLocationType");
  id v6 = [v3 metadata];

  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  int v8 = [v7 BOOLValue];

  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(v4, v5, 0, v8, a2, &stru_26CD0B5F8, 0);
}

id FILocalizedActivityNameWithFormatting(uint64_t a1, unint64_t a2, int a3, int a4)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, a4, &stru_26CD0B5F8, 0);
}

id FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(uint64_t a1, unint64_t a2, int a3, int a4, int a5, void *a6, int a7)
{
  id v13 = a6;
  if ((unint64_t)(a1 - 13) <= 0x3B)
  {
    if (((1 << (a1 - 13)) & 0xEB4508095401889) != 0) {
      goto LABEL_3;
    }
    if (a1 == 46)
    {
      if (a2 >= 3) {
        double v16 = 0;
      }
      else {
        double v16 = off_26441CAE0[a2];
      }
      goto LABEL_8;
    }
  }
  if ((unint64_t)(a1 - 77) <= 7)
  {
    if (((1 << (a1 - 77)) & 0xA9) != 0) {
      goto LABEL_3;
    }
    if (a1 == 83)
    {
      double v16 = @"ACTIVITY_TRANSITION";
      goto LABEL_8;
    }
  }
  if (a1 != 3000)
  {
    double v14 = FILocalizedNameForIndoorAgnosticActivityType();
    if (a5)
    {
      if (v13)
      {
        double v22 = [v13 stringByAppendingString:@"ACTIVITY_OTHER_FORMAT_%@"];
      }
      else
      {
        double v22 = @"ACTIVITY_OTHER_FORMAT_%@";
      }
      double v26 = NSString;
      double v27 = FIBundle();
      double v28 = [v27 localizedStringForKey:v22 value:&stru_26CD0B5F8 table:@"Localizable"];
      double v24 = objc_msgSend(v26, "stringWithFormat:", v28, v14);

      double v18 = @"ACTIVITY_OTHER_FORMAT_%@";
      goto LABEL_19;
    }
    uint64_t v15 = _HKWorkoutActivityNameForActivityType();
    goto LABEL_7;
  }
LABEL_3:
  if (a3) {
    FILocalizationKeyForHKWorkoutActivityType(a1);
  }
  else {
  double v14 = FILocalizationKeyForHKWorkoutActivityTypeAndIsIndoor(a1, a4);
  }
  uint64_t v15 = [@"ACTIVITY_" stringByAppendingString:v14];
LABEL_7:
  double v16 = (__CFString *)v15;

LABEL_8:
  double v17 = &stru_26CD0B5F8;
  if (v16) {
    double v17 = v16;
  }
  double v18 = v17;

  if (v13)
  {
    double v19 = [v13 stringByAppendingString:v18];
  }
  else
  {
    double v19 = v18;
  }
  double v14 = v19;
  if (a7)
  {
    uint64_t v20 = [(__CFString *)v19 stringByAppendingString:@"_PLURAL"];

    double v14 = (void *)v20;
  }
  FIBundle();
  uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  double v22 = v21;
  if (a1 == 46) {
    double v23 = @"Localizable-Ariel";
  }
  else {
    double v23 = @"Localizable";
  }
  double v24 = [(__CFString *)v21 localizedStringForKey:v14 value:&stru_26CD0B5F8 table:v23];
LABEL_19:

  return v24;
}

id FILocalizedActivityNameWithFormattingPrefix(uint64_t a1, unint64_t a2, int a3, int a4, void *a5)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, a4, a5, 0);
}

id FILocalizedNameForActivityType(uint64_t a1, unint64_t a2, int a3)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_26CD0B5F8, 0);
}

id FILocalizedNameForActivityTypePlural(uint64_t a1, unint64_t a2, int a3)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_26CD0B5F8, 1);
}

id FILocalizedNameForAdjectiveOmittedActivityType(unint64_t a1)
{
  if (a1 <= 0x3D)
  {
    if (((1 << a1) & 0xA) != 0)
    {
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"ACTIVITY_FOOTBALL";
      goto LABEL_10;
    }
    if (((1 << a1) & 0x4000000100000) != 0)
    {
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"ACTIVITY_STRENGTH_TRAINING";
      goto LABEL_10;
    }
    if (((1 << a1) & 0x3000000000000000) != 0)
    {
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"ACTIVITY_SKIING";
LABEL_10:
      uint64_t v4 = [v1 localizedStringForKey:v3 value:&stru_26CD0B5F8 table:@"Localizable"];

      goto LABEL_11;
    }
  }
  if (a1 - 77 < 2)
  {
    id v1 = FIBundle();
    id v2 = v1;
    id v3 = @"ACTIVITY_DANCE";
    goto LABEL_10;
  }
  uint64_t v4 = FILocalizedNameForIndoorAgnosticActivityType();
LABEL_11:
  return v4;
}

id FILapsShortDescriptionWithLapCount(uint64_t a1)
{
  id v2 = NSString;
  id v3 = FIBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"LAPS_SHORT_DESCRIPTION" value:&stru_26CD0B5F8 table:@"Localizable"];
  unint64_t v5 = objc_msgSend(v2, "localizedStringWithFormat:", v4, a1);

  return v5;
}

id FIFlightsShortDescriptionWithFlightsCount(uint64_t a1)
{
  id v2 = NSString;
  id v3 = FIBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"FLIGHTS_COUNT_SHORT_DESCRIPTION" value:&stru_26CD0B5F8 table:@"Localizable"];
  unint64_t v5 = objc_msgSend(v2, "localizedStringWithFormat:", v4, a1);

  return v5;
}

id FIPowerShortDescriptionWithPower(double a1)
{
  id v2 = NSString;
  id v3 = FIBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"POWER_SHORT_DESCRIPTION" value:&stru_26CD0B5F8 table:@"Localizable"];
  unint64_t v5 = objc_msgSend(v2, "localizedStringWithFormat:", v4, *(void *)&a1);

  return v5;
}

__CFString *FILocalizedStrokeStyleName(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"STROKE_STYLE_UNKNOWN";
      goto LABEL_10;
    case 1:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"STROKE_STYLE_MIXED";
      goto LABEL_10;
    case 2:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"STROKE_STYLE_FREESTYLE";
      goto LABEL_10;
    case 3:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"STROKE_STYLE_BACKSTROKE";
      goto LABEL_10;
    case 4:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"STROKE_STYLE_BREASTSTROKE";
      goto LABEL_10;
    case 5:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"STROKE_STYLE_BUTTERFLY";
      goto LABEL_10;
    case 6:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"STROKE_STYLE_KICKBOARD";
LABEL_10:
      uint64_t v4 = [v1 localizedStringForKey:v3 value:&stru_26CD0B5F8 table:@"Localizable-Ariel"];

      break;
    default:
      uint64_t v4 = @"STROKE_STYLE_NAME_UNIMPLEMENTED";
      break;
  }
  return v4;
}

id FILocalizedActivityNameComponentsWithFormatting(uint64_t a1, unint64_t a2, int a3, int a4)
{
  v20[2] = *MEMORY[0x263EF8340];
  if (a1 == 71)
  {
    unint64_t v5 = FIBundle();
    id v6 = [v5 localizedStringForKey:@"ACTIVITY_WHEELCHAIR_RUN_PACE_LINE1" value:&stru_26CD0B5F8 table:@"Localizable"];
    v19[0] = v6;
    id v7 = FIBundle();
    int v8 = [v7 localizedStringForKey:@"ACTIVITY_WHEELCHAIR_RUN_PACE_LINE2" value:&stru_26CD0B5F8 table:@"Localizable"];
    v19[1] = v8;
    id v9 = (void *)MEMORY[0x263EFF8C0];
    int v10 = v19;
    goto LABEL_5;
  }
  if (a1 == 70)
  {
    unint64_t v5 = FIBundle();
    id v6 = [v5 localizedStringForKey:@"ACTIVITY_WHEELCHAIR_WALK_PACE_LINE1" value:&stru_26CD0B5F8 table:@"Localizable"];
    v20[0] = v6;
    id v7 = FIBundle();
    int v8 = [v7 localizedStringForKey:@"ACTIVITY_WHEELCHAIR_WALK_PACE_LINE2" value:&stru_26CD0B5F8 table:@"Localizable"];
    v20[1] = v8;
    id v9 = (void *)MEMORY[0x263EFF8C0];
    int v10 = v20;
LABEL_5:
    long long v11 = [v9 arrayWithObjects:v10 count:2];

    goto LABEL_6;
  }
  if (a4)
  {
    unint64_t v5 = FIBundle();
    uint64_t v15 = [v5 localizedStringForKey:@"ACTIVITY_OTHER" value:&stru_26CD0B5F8 table:@"Localizable"];
    v18[0] = v15;
    double v16 = FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_26CD0B5F8, 0);
    v18[1] = v16;
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  }
  else
  {
    unint64_t v5 = FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_26CD0B5F8, 0);
    double v17 = v5;
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  }
LABEL_6:

  return v11;
}

__CFString *FILocalizedMachineName(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"CONNECTED_GYM_MACHINE_UNKNOWN";
      goto LABEL_10;
    case 1:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"CONNECTED_GYM_MACHINE_TREADMILL";
      goto LABEL_10;
    case 2:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"CONNECTED_GYM_MACHINE_ELLIPTICAL";
      goto LABEL_10;
    case 3:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"CONNECTED_GYM_MACHINE_STEPCLIMBER";
      goto LABEL_10;
    case 4:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"CONNECTED_GYM_MACHINE_STAIRCLIMBER";
      goto LABEL_10;
    case 5:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"CONNECTED_GYM_MACHINE_ROWER";
      goto LABEL_10;
    case 6:
      id v1 = FIBundle();
      id v2 = v1;
      id v3 = @"CONNECTED_GYM_MACHINE_BIKE";
LABEL_10:
      uint64_t v4 = [v1 localizedStringForKey:v3 value:&stru_26CD0B5F8 table:@"Localizable"];

      break;
    default:
      uint64_t v4 = @"CONNECTED_GYM_MACHINE_UNIMPLEMENTED";
      break;
  }
  return v4;
}

void sub_21C75A45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21C75B048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FICanonicalQuantityUnitForIntervalType(uint64_t a1)
{
  if (a1 == 1)
  {
    id v1 = [MEMORY[0x263F0A830] meterUnit];
  }
  else
  {
    if (a1 != 2) {
      goto LABEL_9;
    }
    id v1 = [MEMORY[0x263F0A830] secondUnit];
  }
  if (!v1) {
LABEL_9:
  }
    FICanonicalQuantityUnitForIntervalType_cold_1();
  return v1;
}

void sub_21C75C898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_21C75CA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C75CC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C75CDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FILocalizeCount(double a1)
{
  if (FILocalizeCount_onceToken != -1) {
    dispatch_once(&FILocalizeCount_onceToken, &__block_literal_global_3);
  }
  id v2 = (void *)FILocalizeCount___formatter;
  id v3 = [NSNumber numberWithDouble:a1];
  uint64_t v4 = [v2 stringFromNumber:v3];

  return v4;
}

uint64_t __FILocalizeCount_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v1 = (void *)FILocalizeCount___formatter;
  FILocalizeCount___formatter = (uint64_t)v0;

  [(id)FILocalizeCount___formatter setRoundingMode:3];
  id v2 = (void *)FILocalizeCount___formatter;
  return [v2 setMaximumFractionDigits:0];
}

id FILocalizePercentComplete(double a1)
{
  if (FILocalizePercentComplete_onceToken != -1) {
    dispatch_once(&FILocalizePercentComplete_onceToken, &__block_literal_global_289);
  }
  id v2 = (void *)FILocalizePercentComplete___formatter;
  id v3 = [NSNumber numberWithDouble:a1];
  uint64_t v4 = [v2 stringFromNumber:v3];

  return v4;
}

uint64_t __FILocalizePercentComplete_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v1 = (void *)FILocalizePercentComplete___formatter;
  FILocalizePercentComplete___formatter = (uint64_t)v0;

  [(id)FILocalizePercentComplete___formatter setNumberStyle:3];
  [(id)FILocalizePercentComplete___formatter setMaximumFractionDigits:0];
  id v2 = (void *)FILocalizePercentComplete___formatter;
  return [v2 setRoundingMode:2];
}

id FILocalizedDayName(void *a1)
{
  uint64_t v1 = FILocalizedDayName_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&FILocalizedDayName_onceToken, &__block_literal_global_291);
  }
  id v3 = [(id)FILocalizedDayName___formatter stringFromDate:v2];

  return v3;
}

uint64_t __FILocalizedDayName_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)FILocalizedDayName___formatter;
  FILocalizedDayName___formatter = (uint64_t)v0;

  [(id)FILocalizedDayName___formatter setFormattingContext:1];
  id v2 = (void *)FILocalizedDayName___formatter;
  return [v2 setLocalizedDateFormatFromTemplate:@"EEEE"];
}

id FILocalizedMonthName(void *a1)
{
  uint64_t v1 = FILocalizedMonthName_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&FILocalizedMonthName_onceToken, &__block_literal_global_297);
  }
  id v3 = [(id)FILocalizedMonthName___formatter stringFromDate:v2];

  return v3;
}

uint64_t __FILocalizedMonthName_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)FILocalizedMonthName___formatter;
  FILocalizedMonthName___formatter = (uint64_t)v0;

  id v2 = (void *)FILocalizedMonthName___formatter;
  return [v2 setDateFormat:@"LLLL"];
}

id FIRandomStringWithKeyAndPossibleSuffixesWithTableName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  _HKInitializeLogging();
  double v14 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v9;
    __int16 v44 = 2112;
    id v45 = v12;
    _os_log_impl(&dword_21C74B000, v14, OS_LOG_TYPE_DEFAULT, "Working with possible suffixes: %@, key %@, and table name %@", buf, 0x20u);
  }
  if (![v10 count])
  {
    FIRandomStringForPrefixWithTableName(v9, v11, v12);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v10 reverseObjectEnumerator];
  uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v31 = v13;
    id v32 = v10;
    uint64_t v17 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        double v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v20 = [v9 stringByAppendingString:v19];
        uint64_t v21 = FIRandomStringForPrefixWithTableName(v20, v11, v12);
        double v22 = v21;
        if (v21 && ([v21 isEqualToString:@"__key_not_found__"] & 1) == 0)
        {
          if ([v19 containsString:@"NAME"])
          {
            id v34 = 0;
            id v13 = v31;
            id v24 = [NSString stringWithValidatedFormat:v22, @"%@", &v34, v31 validFormatSpecifiers error];
            id v25 = v34;
            double v26 = v25;
            if (v24) {
              BOOL v27 = 1;
            }
            else {
              BOOL v27 = v25 == 0;
            }
            id v10 = v32;
            if (!v27)
            {
              _HKInitializeLogging();
              double v28 = *MEMORY[0x263F098C8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
                FIRandomStringWithKeyAndPossibleSuffixesWithTableName_cold_1((uint64_t)v20, (uint64_t)v26, v28);
              }
            }
          }
          else
          {
            id v24 = v22;
            id v13 = v31;
            id v10 = v32;
          }

          goto LABEL_29;
        }
        _HKInitializeLogging();
        double v23 = *MEMORY[0x263F098C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v20;
          _os_log_impl(&dword_21C74B000, v23, OS_LOG_TYPE_DEFAULT, "Attempted to localize key %@", buf, 0xCu);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    id v24 = 0;
    id v13 = v31;
    id v10 = v32;
  }
  else
  {
    id v24 = 0;
  }
LABEL_29:

  if (!v24)
  {
LABEL_30:
    _HKInitializeLogging();
    uint64_t v29 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C74B000, v29, OS_LOG_TYPE_DEFAULT, "Result of localization is nil, returning original key", buf, 2u);
    }
    id v24 = v9;
  }
LABEL_33:

  return v24;
}

id FIStringByReplacingDynamicPlaceholder(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v5;
  uint64_t v9 = [v8 rangeOfString:v6];
  uint64_t v20 = v8;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    do
    {
      double v14 = v8;
      uint64_t v15 = [v8 stringByReplacingOccurrencesOfString:v6, @"%@", 0, v12, v13 withString options range];
      id v21 = 0;
      id v8 = [NSString stringWithValidatedFormat:v15, @"%@", &v21, v7 validFormatSpecifiers error];
      id v16 = v21;

      if (v8) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v16 == 0;
      }
      if (!v17)
      {
        _HKInitializeLogging();
        double v18 = *MEMORY[0x263F098C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = v6;
          __int16 v24 = 2112;
          id v25 = v16;
          _os_log_error_impl(&dword_21C74B000, v18, OS_LOG_TYPE_ERROR, "Error formatting string with placeholder (%@): %@", buf, 0x16u);
        }
      }
      uint64_t v12 = [v8 rangeOfString:v6];
      uint64_t v13 = v19;
    }
    while (v12 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v8;
}

id _FIStringForKeyInDefaultLocalizableTable(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  id v6 = 0;
  if (v3 && v4)
  {
    id v7 = [v4 localizedStringForKey:v3 value:@"__key_not_found__" table:@"Localizable"];
    if ([v7 isEqualToString:@"__key_not_found__"])
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x263F098C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543874;
        id v11 = v3;
        __int16 v12 = 2114;
        uint64_t v13 = v5;
        __int16 v14 = 2114;
        uint64_t v15 = @"Localizable";
        _os_log_impl(&dword_21C74B000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find the string for key %{public}@ in bundle %{public}@ with table name %{public}@", (uint8_t *)&v10, 0x20u);
      }
      id v6 = 0;
    }
    else
    {
      id v6 = v7;
    }
  }
  return v6;
}

id FILocalizedStringForKey(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  id v3 = [v1 bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_26CD0B5F8 table:@"Localizable"];

  return v4;
}

uint64_t FIMindfulnessDayOffsetFromSunday(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 7) {
    return 0;
  }
  else {
    return a1 - 1;
  }
}

uint64_t FIMindfulnessWeekdaySelectionFromWeekday(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_21C784198[a1 - 1];
  }
}

uint64_t FIMindfulnessWeekdayForCalendarWeekday(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7) {
    return -2;
  }
  return result;
}

uint64_t FIMindfulnessWeekendDaySelectionForCalendar(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "hk_weekendDays");
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __FIMindfulnessWeekendDaySelectionForCalendar_block_invoke;
  v5[3] = &unk_26441CD38;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_21C75DF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FIMindfulnessWeekendDaySelectionForCalendar_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 unsignedIntegerValue];
  if ((unint64_t)(result - 1) > 6) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_21C784198[result - 1];
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v4;
  return result;
}

uint64_t FIMindfulnessWeekdayDaySelectionForCalendar(void *a1)
{
  return ~FIMindfulnessWeekendDaySelectionForCalendar(a1) & 0x7F;
}

void sub_21C75E7BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_21C75F0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t FIDistanceTypeForActivityType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 identifier];
  if (v2 > 45)
  {
    if (v2 <= 59)
    {
      if (v2 == 46)
      {
        if ([v1 hasLocationTypePool]) {
          uint64_t v3 = 3;
        }
        else {
          uint64_t v3 = 4;
        }
      }
      else if (v2 == 52)
      {
LABEL_3:
        uint64_t v3 = 1;
      }
      else
      {
LABEL_15:
        uint64_t v3 = 0;
      }
    }
    else
    {
      switch(v2)
      {
        case '<':
          uint64_t v3 = 6;
          break;
        case '=':
        case 'C':
          uint64_t v3 = 7;
          break;
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'D':
        case 'E':
          goto LABEL_15;
        case 'F':
        case 'G':
          goto LABEL_3;
        default:
          if (v2 != 75) {
            goto LABEL_15;
          }
          goto LABEL_3;
      }
    }
  }
  else
  {
    uint64_t v3 = 2;
    switch(v2)
    {
      case 13:
        break;
      case 14:
      case 15:
      case 17:
      case 18:
      case 19:
      case 20:
      case 22:
      case 23:
      case 26:
      case 28:
      case 29:
      case 30:
      case 32:
      case 33:
      case 34:
      case 38:
      case 40:
        goto LABEL_15;
      case 16:
      case 21:
      case 24:
      case 25:
      case 27:
      case 36:
      case 37:
      case 41:
        goto LABEL_3;
      case 31:
        uint64_t v3 = 8;
        break;
      case 35:
        uint64_t v3 = 9;
        break;
      case 39:
        uint64_t v3 = 10;
        break;
      default:
        if (v2 != 1 && v2 != 3) {
          goto LABEL_15;
        }
        goto LABEL_3;
    }
  }

  return v3;
}

id FIHKQuantityForDistanceUnitAndType(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 2) > 7) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = qword_21C7841D0[a2 - 2];
  }
  double v4 = (double)(unint64_t)FINumberOfUnitsInPaceForPaceFormat(v3);
  id v5 = FIHKUnitForDistanceUnit(a1);
  uint64_t v6 = [MEMORY[0x263F0A630] quantityWithUnit:v5 doubleValue:v4];

  return v6;
}

uint64_t FIPaceFormatForDistanceType(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 7) {
    return 1;
  }
  else {
    return qword_21C7841D0[a1 - 2];
  }
}

BOOL FIDistanceUnitIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 5;
}

uint64_t FIPaceFormatForWorkoutActivityType(void *a1)
{
  uint64_t v1 = FIDistanceTypeForActivityType(a1);
  if ((unint64_t)(v1 - 2) > 7) {
    return 1;
  }
  else {
    return qword_21C7841D0[v1 - 2];
  }
}

double FISpeedForDurationOverDistance(void *a1, double a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F0A830];
  id v4 = a1;
  id v5 = [v3 meterUnit];
  [v4 doubleValueForUnit:v5];
  double v7 = v6;

  return v7 / a2;
}

uint64_t FICurrentLocaleUsesMetricSystem()
{
  id v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 objectForKey:*MEMORY[0x263EFF560]];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

BOOL FIDistanceUnitIsMetric(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t FIHKUnitIsCalorieUnit(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F0A830] kilocalorieUnit];
  if ([v1 isEqual:v2])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [MEMORY[0x263F0A830] largeCalorieUnit];
    uint64_t v3 = [v1 isEqual:v4];
  }
  return v3;
}

id FISplitsForMeasuringSystemIdentifier(void *a1, uint64_t a2)
{
  if (a1)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __FISplitsForMeasuringSystemIdentifier_block_invoke;
    v5[3] = &__block_descriptor_40_e24_B16__0__HKWorkoutEvent_8l;
    v5[4] = a2;
    uint64_t v3 = objc_msgSend(a1, "fi_filteredArrayUsingBlock:", v5);
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

BOOL __FISplitsForMeasuringSystemIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "fi_isSplitEvent"))
  {
    id v4 = [v3 metadata];
    id v5 = [v4 objectForKeyedSubscript:@"_HKPrivateMetadataSplitMeasuringSystem"];
    BOOL v6 = [v5 integerValue] == *(void *)(a1 + 32);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

id FICustomSplits(void *a1)
{
  if (a1)
  {
    uint64_t v2 = objc_msgSend(a1, "fi_filteredArrayUsingBlock:", &__block_literal_global_5);
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

uint64_t __FICustomSplits_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fi_isCustomSplitEvent");
}

void sub_21C760F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t _ValidateSample_0(void *a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  if (a4)
  {
    __int16 v12 = FIIntervalErrorWithDescription(@"Cannot add sample - segment is finalized");
    FISetOutErrorIfNotNull(a5, v12);
LABEL_6:

    uint64_t v13 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v9, "fi_overlapsStartDate:endDate:", v10, v11) & 1) == 0)
  {
    __int16 v12 = [NSString stringWithFormat:@"Sample %@ does not overlap with startDate:%@ endDate: %@", v9, v10, v11];
    __int16 v14 = FIIntervalErrorWithDescription(v12);
    FISetOutErrorIfNotNull(a5, v14);

    goto LABEL_6;
  }
  uint64_t v13 = 1;
LABEL_7:

  return v13;
}

void sub_21C761624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t FINumberOfUnitsInPaceForPaceFormat(uint64_t a1)
{
  uint64_t v1 = 100;
  if (a1 != 2) {
    uint64_t v1 = 1;
  }
  if (a1 == 3) {
    return 500;
  }
  else {
    return v1;
  }
}

double FIPace(void *a1, void *a2, uint64_t a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  if (a3 == 4) {
    FIPace_cold_1();
  }
  id v9 = v8;
  [v7 doubleValueForUnit:v8];
  unint64_t v11 = 100;
  if (a3 != 2) {
    unint64_t v11 = 1;
  }
  if (a3 == 3) {
    unint64_t v11 = 500;
  }
  double v12 = v10 / (double)v11;
  double v13 = 0.0;
  if (v12 > 0.0) {
    double v13 = round(a4 / v12);
  }
  if (v13 > 3600.0 || v12 < 2.22044605e-16) {
    double v15 = 0.0;
  }
  else {
    double v15 = v13;
  }

  return v15;
}

double FIPaceInMetersPerSecond(double a1, double a2)
{
  double result = a1 / a2;
  if (a2 <= 2.22044605e-16) {
    return 0.0;
  }
  return result;
}

uint64_t _FIBoolForStandardDomainAndKey(void *a1, void *a2)
{
  return _FIBoolForStandardDomainAndKeyWithDefaultValue(a1, a2, 0);
}

uint64_t _FIBoolForStandardDomainAndKeyWithDefaultValue(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263EFFA40];
  id v6 = a2;
  id v7 = a1;
  id v8 = [v5 standardUserDefaults];
  id v9 = [v8 persistentDomainForName:v7];

  double v10 = [v9 objectForKey:v6];

  if (v10) {
    a3 = [v10 BOOLValue];
  }

  return a3;
}

void _FIWriteBoolToStandardDomain(void *a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = a1;
  CFPreferencesSetAppValue(v7, (CFPropertyListRef)[v5 numberWithBool:a2], v6);
  CFPreferencesAppSynchronize(v6);
  id v9 = (id)objc_opt_new();
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v7];

  [v9 synchronizeUserDefaultsDomain:v6 keys:v8];
}

id _FINumberForStandardDomainAndKey(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 standardUserDefaults];
  id v7 = [v6 persistentDomainForName:v5];

  id v8 = [v7 objectForKey:v4];

  return v8;
}

void _FIWriteIntegerToStandardDomain(void *a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = a1;
  CFPreferencesSetAppValue(v7, (CFPropertyListRef)[v5 numberWithInteger:a2], v6);
  CFPreferencesAppSynchronize(v6);
  id v9 = (id)objc_opt_new();
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v7];

  [v9 synchronizeUserDefaultsDomain:v6 keys:v8];
}

uint64_t _FIBoolForPerGizmoDomainAndKey(void *a1, void *a2)
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(a1, a2, 0);
}

uint64_t _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(void *a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x263F57520];
  id v6 = a2;
  id v7 = a1;
  id v8 = (void *)[[v5 alloc] initWithDomain:v7];

  id v9 = (id)[v8 synchronize];
  double v10 = [v8 objectForKey:v6];

  if (v10) {
    a3 = [v10 BOOLValue];
  }

  return a3;
}

void _FIWriteBoolToPerGizmoDomain(void *a1, uint64_t a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263F57520];
  id v6 = a3;
  id v7 = a1;
  id v11 = (id)[[v5 alloc] initWithDomain:v6];
  [v11 setBool:a2 forKey:v7];
  id v8 = (id)[v11 synchronize];
  id v9 = objc_opt_new();
  double v10 = [MEMORY[0x263EFFA08] setWithObject:v7];

  [v9 synchronizeNanoDomain:v6 keys:v10];
}

void _FIWriteBoolsToPerGizmoDomain(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        double v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v19);
        double v13 = v12;
        if (v12) {
          objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v12, "BOOLValue"), v11);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = (id)[v5 synchronize];
  double v15 = objc_opt_new();
  uint64_t v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = [v6 allKeys];
  uint64_t v18 = [v16 setWithArray:v17];
  [v15 synchronizeNanoDomain:v4 keys:v18];
}

id _FINumberForPerGizmoDomainAndKey(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F57520];
  id v4 = a2;
  id v5 = a1;
  id v6 = (void *)[[v3 alloc] initWithDomain:v5];

  id v7 = (id)[v6 synchronize];
  uint64_t v8 = [v6 objectForKey:v4];

  return v8;
}

void _FIWriteIntegerToPerGizmoDomain(void *a1, uint64_t a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263F57520];
  id v6 = a3;
  id v7 = a1;
  id v11 = (id)[[v5 alloc] initWithDomain:v6];
  [v11 setInteger:a2 forKey:v7];
  id v8 = (id)[v11 synchronize];
  uint64_t v9 = objc_opt_new();
  double v10 = [MEMORY[0x263EFFA08] setWithObject:v7];

  [v9 synchronizeNanoDomain:v6 keys:v10];
}

__CFString *FIWorkoutSplitMeasurementSystemDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"INVALID_IDENTIFIER(%lu)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_26441D008[a1];
  }
  return v1;
}

id FIGeneralizedActivityTypeKey(uint64_t a1, int a2, uint64_t a3)
{
  if (a1 == 46) {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu.%lu", 46, a3);
  }
  else {
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a1, v8);
  }
  id v5 = v4;
  if (a2)
  {
    uint64_t v6 = [v4 stringByAppendingString:@".indoor"];

    id v5 = (void *)v6;
  }
  return v5;
}

id FIQuantityForGoalTypeAndValue(uint64_t a1, double a2)
{
  switch(a1)
  {
    case 1:
      id v3 = (void *)MEMORY[0x263F0A630];
      uint64_t v4 = [MEMORY[0x263F0A830] meterUnit];
      goto LABEL_7;
    case 2:
      id v3 = (void *)MEMORY[0x263F0A630];
      uint64_t v4 = [MEMORY[0x263F0A830] secondUnit];
      goto LABEL_7;
    case 3:
      id v3 = (void *)MEMORY[0x263F0A630];
      uint64_t v4 = [MEMORY[0x263F0A830] kilocalorieUnit];
LABEL_7:
      id v5 = (void *)v4;
      uint64_t v6 = [v3 quantityWithUnit:v4 doubleValue:a2];

      goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:
  return v6;
}

double FIDoubleValueForQuantityAndGoalType(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2 == 1)
  {
    uint64_t v5 = [MEMORY[0x263F0A830] meterUnit];
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    uint64_t v5 = [MEMORY[0x263F0A830] secondUnit];
    goto LABEL_7;
  }
  double v4 = 0.0;
  if (a2 == 3)
  {
    uint64_t v5 = [MEMORY[0x263F0A830] kilocalorieUnit];
LABEL_7:
    uint64_t v6 = (void *)v5;
    [v3 doubleValueForUnit:v5];
    double v4 = v7;
  }
  return v4;
}

uint64_t FIActivityTypeIsSupported(uint64_t a1)
{
  uint64_t result = 1;
  if (a1 <= 76)
  {
    unint64_t v3 = a1 - 13;
    if (v3 <= 0x3B && ((1 << v3) & 0xE34508281400889) != 0) {
      return result;
    }
    return 0;
  }
  if (a1 != 77 && a1 != 80 && a1 != 3000) {
    return 0;
  }
  return result;
}

uint64_t FIActivityTypeIsCalorimetryOptimized(uint64_t a1)
{
  uint64_t result = 1;
  if ((unint64_t)(a1 - 13) > 0x3B || ((1 << (a1 - 13)) & 0xE34D08281400889) == 0)
  {
    unint64_t v3 = a1 - 77;
    if (v3 > 5 || ((1 << v3) & 0x29) == 0) {
      return 0;
    }
  }
  return result;
}

uint64_t FIIsCategorizedOtherActivityType(uint64_t a1)
{
  return FIActivityTypeIsCalorimetryOptimized(a1) ^ 1;
}

id FIOpenGoalUUIDForActivityType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 effectiveTypeIdentifier];
  unint64_t v3 = 0;
  if (v2 > 56)
  {
    switch(v2)
    {
      case '9':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"CB8860F7-2573-4E06-9526-2B9D29941567";
        goto LABEL_60;
      case ':':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'A':
      case 'C':
      case 'D':
      case 'E':
        goto LABEL_61;
      case ';':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"26AE82DC-AA7D-49B2-A309-91ED198DE5F4";
        goto LABEL_60;
      case '?':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"B13FD43F-7859-47C4-BD87-D2F6D8350DAC";
        goto LABEL_60;
      case 'B':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"62C3D3CF-8A23-4E48-A1B5-FE2098C15338";
        goto LABEL_60;
      case 'F':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"76433BE8-3A5D-41BC-8C67-23C5B3F85081";
        goto LABEL_60;
      case 'G':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"AB8DDB22-313E-436D-954E-112553E197A5";
        goto LABEL_60;
      case 'H':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"C36E60C0-9DF8-4C81-9EF8-994CB1B6E791";
        goto LABEL_60;
      default:
        if (v2 != 77)
        {
          if (v2 != 80) {
            goto LABEL_61;
          }
          if (([v1 isIndoor] & 1) == 0)
          {
            id v4 = objc_alloc(MEMORY[0x263F08C38]);
            uint64_t v5 = @"A6A9C4DD-12C3-4F74-BCF1-85C84F7CB349";
            goto LABEL_60;
          }
          goto LABEL_54;
        }
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"3BE0D7FF-AFAE-4A9F-8E44-74A55D93A959";
        break;
    }
    goto LABEL_60;
  }
  if (v2 > 34)
  {
    switch(v2)
    {
      case ',':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"C5F93E17-7D72-4654-9C80-70B10EF900C6";
        goto LABEL_60;
      case '-':
      case '/':
      case '0':
      case '1':
      case '3':
        goto LABEL_61;
      case '.':
        if ([v1 isIndoor]) {
          goto LABEL_54;
        }
        uint64_t v8 = [v1 swimmingLocationType];
        switch(v8)
        {
          case 0:
            goto LABEL_54;
          case 2:
            id v4 = objc_alloc(MEMORY[0x263F08C38]);
            uint64_t v5 = @"C7D48B54-D31F-4172-B89C-B173A77AF8D9";
            goto LABEL_60;
          case 1:
            id v4 = objc_alloc(MEMORY[0x263F08C38]);
            uint64_t v5 = @"8632810D-5AE8-49AE-8861-23719EAEDC43";
            goto LABEL_60;
        }
LABEL_49:
        if (([v1 isIndoor] & 1) == 0)
        {
          id v4 = objc_alloc(MEMORY[0x263F08C38]);
          uint64_t v5 = @"73009EF0-58A6-40CE-9598-DBF394A80415";
          goto LABEL_60;
        }
        goto LABEL_54;
      case '2':
        goto LABEL_49;
      case '4':
        char v9 = [v1 isIndoor];
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        if (v9) {
          uint64_t v5 = @"51F97983-0223-467C-ADAE-1CFFE5383CBE";
        }
        else {
          uint64_t v5 = @"9CD2ED1B-6C09-4D6B-911F-CFB9C8C418BE";
        }
        goto LABEL_60;
      default:
        if (v2 == 35)
        {
          if ([v1 isIndoor]) {
            goto LABEL_54;
          }
          id v4 = objc_alloc(MEMORY[0x263F08C38]);
          uint64_t v5 = @"0A5FC9FB-CCFF-48D0-BCF3-9766C211FE2D";
        }
        else
        {
          if (v2 != 37) {
            goto LABEL_61;
          }
          char v6 = [v1 isIndoor];
          id v4 = objc_alloc(MEMORY[0x263F08C38]);
          if (v6) {
            uint64_t v5 = @"2583F09E-8522-43F6-9E82-B0701414CF68";
          }
          else {
            uint64_t v5 = @"3D1CE8DF-FB42-48EC-B0B9-28CA40BA65C9";
          }
        }
        break;
    }
    goto LABEL_60;
  }
  if (v2 > 19)
  {
    if (v2 == 20)
    {
      if (([v1 isIndoor] & 1) == 0)
      {
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"D65AB2CF-D621-4FAA-BABB-28670DB18152";
        goto LABEL_60;
      }
    }
    else
    {
      if (v2 != 24) {
        goto LABEL_61;
      }
      if (([v1 isIndoor] & 1) == 0)
      {
        id v4 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v5 = @"329E0317-E58E-4237-8083-4F0BE76357F1";
        goto LABEL_60;
      }
    }
LABEL_54:
    unint64_t v3 = 0;
    goto LABEL_61;
  }
  if (v2 == 13)
  {
    char v7 = [v1 isIndoor];
    id v4 = objc_alloc(MEMORY[0x263F08C38]);
    if (v7) {
      uint64_t v5 = @"E06981DB-4C2C-412A-A22F-7629BFD56505";
    }
    else {
      uint64_t v5 = @"5256B1ED-936D-4419-8F97-4A5CB7A77BE3";
    }
    goto LABEL_60;
  }
  if (v2 != 16) {
    goto LABEL_61;
  }
  if ([v1 isIndoor]) {
    goto LABEL_54;
  }
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v5 = @"63200046-5236-4523-85D7-D5B8B85410E5";
LABEL_60:
  unint64_t v3 = (void *)[v4 initWithUUIDString:v5];
LABEL_61:

  return v3;
}

__CFString *FILocalizationKeyForHKWorkoutActivityTypeAndIsIndoor(uint64_t a1, int a2)
{
  return FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(a1, 0, a2);
}

__CFString *FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(uint64_t a1, char a2, int a3)
{
  char v6 = 0;
  if (a1 <= 34)
  {
    switch(a1)
    {
      case 16:
        char v6 = @"ELLIPTICAL";
        break;
      case 17:
      case 18:
      case 19:
      case 21:
      case 22:
      case 23:
        break;
      case 20:
        char v6 = @"FUNCTIONAL_STRENGTH_TRAINING";
        break;
      case 24:
        char v6 = @"HIKING";
        break;
      case 25:
        int v10 = _os_feature_enabled_impl();
        char v6 = @"HOCKEY";
        if (v10 && (a2 & 1) == 0)
        {
          uint64_t v8 = @"OUTDOOR_HOCKEY";
          char v9 = @"INDOOR_HOCKEY";
          goto LABEL_47;
        }
        break;
      default:
        if (a1 == 13)
        {
          if (a2)
          {
            char v6 = @"CYCLING";
          }
          else
          {
            uint64_t v8 = @"OUTDOOR_CYCLING";
            char v9 = @"INDOOR_CYCLING";
LABEL_47:
            if (a3) {
              uint64_t v8 = v9;
            }
            char v6 = v8;
          }
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case '#':
        int v7 = _os_feature_enabled_impl();
        char v6 = @"ROWING";
        if (v7 && (a2 & 1) == 0)
        {
          uint64_t v8 = @"OUTDOOR_ROWING";
          char v9 = @"INDOOR_ROWING";
          goto LABEL_47;
        }
        break;
      case '$':
      case '&':
      case '(':
      case '*':
      case '+':
      case '-':
      case '/':
      case '0':
      case '1':
      case '2':
      case '3':
      case '5':
      case '6':
      case '7':
      case '8':
      case ':':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'C':
      case 'E':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'N':
      case 'O':
      case 'Q':
      case 'S':
        break;
      case '%':
        if ((a2 & 1) == 0)
        {
          uint64_t v8 = @"OUTDOOR_RUNNING";
          char v9 = @"INDOOR_RUNNING";
          goto LABEL_47;
        }
        char v6 = @"RUNNING";
        break;
      case '\'':
        int v11 = _os_feature_enabled_impl();
        char v6 = @"SKATING_SPORTS";
        if (v11 && (a2 & 1) == 0)
        {
          uint64_t v8 = @"OUTDOOR_SKATING_SPORTS";
          char v9 = @"INDOOR_SKATING_SPORTS";
          goto LABEL_47;
        }
        break;
      case ')':
        int v12 = _os_feature_enabled_impl();
        char v6 = @"SOCCER";
        if (v12 && (a2 & 1) == 0)
        {
          uint64_t v8 = @"OUTDOOR_SOCCER";
          char v9 = @"INDOOR_SOCCER";
          goto LABEL_47;
        }
        break;
      case ',':
        char v6 = @"STEPPER";
        break;
      case '.':
        char v6 = @"SWIMMING";
        break;
      case '4':
        if ((a2 & 1) == 0)
        {
          uint64_t v8 = @"OUTDOOR_WALKING";
          char v9 = @"INDOOR_WALKING";
          goto LABEL_47;
        }
        char v6 = @"WALKING";
        break;
      case '9':
        char v6 = @"YOGA";
        break;
      case ';':
        char v6 = @"CORE_TRAINING";
        break;
      case '?':
        char v6 = @"HIGH_INTENSITY_INTERVAL_TRAINING";
        break;
      case 'A':
        char v6 = @"KICKBOXING";
        break;
      case 'B':
        char v6 = @"PILATES";
        break;
      case 'D':
        char v6 = @"STAIRS";
        break;
      case 'F':
        char v6 = @"WHEELCHAIR_WALK_PACE";
        break;
      case 'G':
        char v6 = @"WHEELCHAIR_RUN_PACE";
        break;
      case 'H':
        char v6 = @"TAI_CHI";
        break;
      case 'M':
        char v6 = @"CARDIO_DANCE";
        break;
      case 'P':
        char v6 = @"COOLDOWN";
        break;
      case 'R':
        char v6 = @"MULTISPORT";
        break;
      case 'T':
        char v6 = @"UNDERWATER_DIVING";
        break;
      default:
        if (a1 == 3000) {
          char v6 = @"OTHER";
        }
        else {
          char v6 = 0;
        }
        break;
    }
  }
  return v6;
}

__CFString *FILocalizationKeyForHKWorkoutActivityType(uint64_t a1)
{
  return FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(a1, 1, 0);
}

id FIStandardFitnessDefaultActivityTypes(int a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __FIStandardFitnessDefaultActivityTypes_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v7 = a2;
  if (FIStandardFitnessDefaultActivityTypes_onceToken != -1) {
    dispatch_once(&FIStandardFitnessDefaultActivityTypes_onceToken, block);
  }
  unint64_t v3 = &FIStandardFitnessDefaultActivityTypes_activityTypes;
  if (a1) {
    unint64_t v3 = &FIStandardFitnessDefaultActivityTypes_wheelchairActivityTypes;
  }
  id v4 = (void *)*v3;
  return v4;
}

id FIFitnessJuniorDefaultActivityTypes()
{
  v6[4] = *MEMORY[0x263EF8340];
  id v0 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:52 isIndoor:0];
  v6[0] = v0;
  id v1 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:37 isIndoor:0];
  v6[1] = v1;
  uint64_t v2 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:13 isIndoor:0];
  v6[2] = v2;
  unint64_t v3 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:24 isIndoor:0];
  v6[3] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

void __FIStandardFitnessDefaultActivityTypes_block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  unint64_t v3 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:52 isIndoor:0];
  [v2 addObject:v3];

  id v4 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:52 isIndoor:1];
  [v2 addObject:v4];

  uint64_t v5 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:37 isIndoor:0];
  [v2 addObject:v5];

  char v6 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:37 isIndoor:1];
  [v2 addObject:v6];

  char v7 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:13 isIndoor:0];
  [v2 addObject:v7];

  uint64_t v8 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:13 isIndoor:1];
  [v2 addObject:v8];

  if (*(unsigned char *)(a1 + 32))
  {
    char v9 = +[FIWorkoutActivityType swimmingOptimizedActivityTypes];
    [v2 addObjectsFromArray:v9];
  }
  int v10 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:82 isIndoor:0];
  [v2 addObject:v10];

  int v11 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:24 isIndoor:0];
  [v2 addObject:v11];

  int v12 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:16 isIndoor:0];
  [v2 addObject:v12];

  double v13 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:44 isIndoor:0];
  [v2 addObject:v13];

  id v14 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:35 isIndoor:_os_feature_enabled_impl()];
  [v2 addObject:v14];

  double v15 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:63 isIndoor:0];
  [v2 addObject:v15];

  uint64_t v16 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:65 isIndoor:0];
  [v2 addObject:v16];

  uint64_t v17 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:20 isIndoor:0];
  [v2 addObject:v17];

  uint64_t v18 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:59 isIndoor:0];
  [v2 addObject:v18];

  long long v19 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:57 isIndoor:0];
  [v2 addObject:v19];

  long long v20 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:66 isIndoor:0];
  [v2 addObject:v20];

  long long v21 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:77 isIndoor:0];
  [v2 addObject:v21];

  long long v22 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:72 isIndoor:0];
  [v2 addObject:v22];

  id v23 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:80 isIndoor:0];
  [v2 addObject:v23];

  uint64_t v24 = (void *)FIStandardFitnessDefaultActivityTypes_activityTypes;
  FIStandardFitnessDefaultActivityTypes_activityTypes = (uint64_t)v2;
  id v25 = v2;

  id v28 = +[FIWorkoutActivityType wheelchairActivityTypes];
  uint64_t v26 = [v28 arrayByAddingObjectsFromArray:FIStandardFitnessDefaultActivityTypes_activityTypes];
  BOOL v27 = (void *)FIStandardFitnessDefaultActivityTypes_wheelchairActivityTypes;
  FIStandardFitnessDefaultActivityTypes_wheelchairActivityTypes = v26;
}

void FIActivityMoveModeAnalyticsSendActivityMoveModeSwitchedInSettings(uint64_t a1)
{
  id v1 = @"Active Energy";
  if (a1 == 2) {
    id v1 = @"Apple Move Time";
  }
  uint64_t v2 = v1;
  id v3 = [@"com.apple.Fitness.analytics.fitnessJr" stringByAppendingString:@".activityMoveModeSwitchedInSettings"];
  FIActivityAnalyticsSubmission(v3, @"newActivityMoveMode", v2);
}

void FIActivityMoveModeAnalyticsSendExperienceType(unint64_t a1)
{
  if (a1 > 3) {
    id v1 = 0;
  }
  else {
    id v1 = off_26441D170[a1];
  }
  id v2 = [@"com.apple.Fitness.analytics.fitnessJr" stringByAppendingString:@".ageBucket"];
  FIActivityAnalyticsSubmission(v2, @"ageBucket", v1);
}

uint64_t FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar(void *a1, void *a2, void *a3)
{
  uint64_t v3 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(a1, a3, a2);
  uint64_t v4 = 2;
  if (v3 <= 9) {
    uint64_t v4 = 3;
  }
  if (v3 > 12) {
    return 1;
  }
  else {
    return v4;
  }
}

uint64_t FIExperienceTypeWithHealthStoreAndDefaultExperienceType(void *a1, uint64_t a2)
{
  uint64_t result = FIExperienceTypeWithHealthStore(a1);
  if (!result) {
    return a2;
  }
  return result;
}

__CFString *FILocalizationTableForExperienceType(uint64_t a1)
{
  id v1 = @"Localizable";
  if (a1 == 2) {
    id v1 = @"Localizable-Modified-tinker";
  }
  if (a1 == 3) {
    return @"Localizable-Simplified-tinker";
  }
  else {
    return v1;
  }
}

id UnitForMoveGoal(void *a1)
{
  if ((unint64_t)a1 >= 2)
  {
    if (a1 == (void *)2)
    {
      a1 = [MEMORY[0x263F0A830] minuteUnit];
    }
  }
  else
  {
    a1 = _HKWorkoutCanonicalEnergyBurnedUnit();
  }
  return a1;
}

uint64_t UnitForExerciseGoal()
{
  return [MEMORY[0x263F0A830] minuteUnit];
}

uint64_t UnitForStandGoal()
{
  return [MEMORY[0x263F0A830] countUnit];
}

double MoveValueForActivitySummary(void *a1)
{
  id v1 = a1;
  id v2 = UnitForMoveGoal((void *)[v1 activityMoveMode]);
  if ([v1 activityMoveMode] == 2) {
    [v1 appleMoveMinutes];
  }
  else {
  uint64_t v3 = [v1 activeEnergyBurned];
  }

  [v3 doubleValueForUnit:v2];
  double v5 = v4;

  return v5;
}

double MoveGoalValueForActivitySummary(void *a1)
{
  id v1 = a1;
  id v2 = UnitForMoveGoal((void *)[v1 activityMoveMode]);
  if ([v1 activityMoveMode] == 2) {
    [v1 appleMoveMinutesGoal];
  }
  else {
  uint64_t v3 = [v1 activeEnergyBurnedGoal];
  }

  [v3 doubleValueForUnit:v2];
  double v5 = v4;

  return v5;
}

void sub_21C76A138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double MovePercentageForActivitySummary(void *a1)
{
  id v1 = a1;
  if ([v1 activityMoveMode] == 2) {
    [v1 _moveMinutesCompletionPercentage];
  }
  else {
    [v1 _activeEnergyCompletionPercentage];
  }
  double v3 = v2;

  return v3;
}

void sub_21C76AA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_21C76B128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C76B828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

id MoveStatisticsForActivitySummary(void *a1)
{
  id v1 = a1;
  if ([v1 activityMoveMode] == 2) {
    [v1 _dailyMoveMinutesStatistics];
  }
  else {
  double v2 = [v1 _dailyEnergyBurnedStatistics];
  }

  return v2;
}

void sub_21C76D1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCMCalorieUserInfoClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CMCalorieUserInfo");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCMCalorieUserInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCMCalorieUserInfoClass_block_invoke_cold_1();
    CoreMotionLibrary();
  }
}

void CoreMotionLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __CoreMotionLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26441D338;
    uint64_t v3 = 0;
    CoreMotionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreMotionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMotionLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCMNatalimeterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CMNatalimeter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCMNatalimeterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCMNatalimeterClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_1_1();
  }
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

BOOL FIInternalCoachingDataCollectionEnabled()
{
  return CFPreferencesGetAppBooleanValue(@"AppleInternalDataCollectionEnabled", @"com.apple.nanolifestyle", 0) != 0;
}

__CFString *FIStringFromDailyGoalType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"FIDailyGoalTypeNone";
  }
  else {
    return off_26441D4C0[a1 - 1];
  }
}

uint64_t FIDailyGoalTypeFromString(void *a1)
{
  id v1 = a1;
  if (FIDailyGoalTypeNameMappings_onceToken != -1) {
    dispatch_once(&FIDailyGoalTypeNameMappings_onceToken, &__block_literal_global_8);
  }
  long long v2 = [(id)FIDailyGoalTypeNameMappings_typeNameMappings objectForKey:v1];
  uint64_t v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void *FISetOutErrorIfNotNull(void *result, id a2)
{
  if (result)
  {
    long long v2 = result;
    uint64_t result = a2;
    void *v2 = result;
  }
  return result;
}

id FIIntervalErrorWithDescription(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = a1;
  long long v2 = NSDictionary;
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v5 = [v1 errorWithDomain:@"com.apple.fitness.intervals" code:0 userInfo:v4];

  return v5;
}

void __FIDailyGoalTypeNameMappings_block_invoke()
{
  id v0 = (void *)FIDailyGoalTypeNameMappings_typeNameMappings;
  FIDailyGoalTypeNameMappings_typeNameMappings = (uint64_t)&unk_26CD12A70;
}

uint64_t FICMotionConditionForWheelchairUse(uint64_t a1)
{
  if (a1 == 2) {
    return 6;
  }
  else {
    return 0;
  }
}

uint64_t FIAgeInYearsForDateOfBirth(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF910];
  id v2 = a1;
  id v3 = [v1 date];
  uint64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v5 = FIAgeInYearsForDateOfBirthWithCurrentDateAndCalendar((uint64_t)v2, (uint64_t)v3, v4);

  return v5;
}

uint64_t FIAgeInYearsForDateOfBirthWithCurrentDateAndCalendar(uint64_t result, uint64_t a2, void *a3)
{
  if (result)
  {
    id v3 = [a3 components:4 fromDate:result toDate:a2 options:0];
    uint64_t v4 = [v3 year];
    if (v4 <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4;
    }

    return v5;
  }
  return result;
}

uint64_t FIAgeInYearsForDateOfBirthComponents(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF910];
  id v2 = a1;
  id v3 = [v1 date];
  uint64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v5 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(v2, v3, v4);

  return v5;
}

id FIStandardDistanceQuantity(void *a1)
{
  int v1 = [a1 _isMetricDistance];
  id v2 = (void *)MEMORY[0x263F0A630];
  if (v1) {
    [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  }
  else {
  id v3 = [MEMORY[0x263F0A830] mileUnit];
  }
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:1.0];

  return v4;
}

id FIGetActivePairedDevice()
{
  id v0 = [getNRPairedDeviceRegistryClass() sharedInstance];
  int v1 = [getNRPairedDeviceRegistryClass() activePairedDeviceSelectorBlock];
  id v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  id v3 = [v2 firstObject];

  return v3;
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  id NRPairedDeviceRegistryClass = getNRPairedDeviceRegistryClass();
  if (objc_opt_respondsToSelector())
  {
    return [NRPairedDeviceRegistryClass isActiveDeviceAltAccount];
  }
  else
  {
    id v2 = FIGetActivePairedDevice();
    uint64_t v3 = FIIsDeviceSatellitePaired(v2);

    return v3;
  }
}

uint64_t FIIsDeviceSatellitePaired(void *a1)
{
  id v1 = a1;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v2 = (void *)getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
  uint64_t v11 = getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
  if (!getNRDevicePropertyIsAltAccountSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)NanoRegistryLibrary();
    v9[3] = (uint64_t)dlsym(v3, "NRDevicePropertyIsAltAccount");
    getNRDevicePropertyIsAltAccountSymbolLoc_ptr = v9[3];
    id v2 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    uint64_t v7 = (_Unwind_Exception *)FIIsDeviceSatellitePaired_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  uint64_t v4 = [v1 valueForProperty:*v2];
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

uint64_t FIDeviceMeetsMinimumOSVersionGlory()
{
  return FIDeviceMeetsMinimumOSVersion(327680);
}

uint64_t FIIsEndRemindersEnabled(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp"];
  id v3 = (id)[v2 synchronize];
  uint64_t v4 = [v2 objectForKey:@"NLPredictedActivityEndEnableNotification"];
  uint64_t v5 = [MEMORY[0x263F01748] isWorkoutEndReminderEnabledWhenDeviceIsInMoveTimeMode:a1 == 2 withCurrentSetting:v4];

  return v5;
}

uint64_t FIIsStartRemindersEnabled(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp"];
  id v5 = (id)[v4 synchronize];
  char v6 = [v4 objectForKey:@"NLPredictedActivityStartEnableNotification"];
  uint64_t v7 = [MEMORY[0x263F01748] isWorkoutStartReminderEnabledWhenDeviceIsSatellitePaired:a1 isInMoveTimeMode:a2 == 2 withCurrentSetting:v6];

  return v7;
}

uint64_t FIIsResumeRemindersEnabled(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp"];
  id v4 = (id)[v3 synchronize];
  id v5 = [v3 objectForKey:@"NLPredictedActivityResumeEnableNotification"];
  uint64_t v6 = [MEMORY[0x263F01748] isWorkoutResumeReminderEnabledWhenDeviceIsInMoveTimeMode:a2 == 2 withCurrentSetting:v5];

  return v6;
}

uint64_t FIIsFitnessTrackingEnabled()
{
  return _FIBoolForStandardDomainAndKeyWithDefaultValue((void *)*MEMORY[0x263F0ADC0], (void *)*MEMORY[0x263F0ADD0], 1);
}

void FISetFitnessTrackingEnabled(uint64_t a1)
{
}

uint64_t FIAreFitnessAppsRestricted()
{
  v17[2] = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.ActivityMonitorApp"];
  uint64_t v1 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.SessionTrackerApp"];
  id v2 = (void *)v1;
  if (v0) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    v17[0] = v0;
    v17[1] = v1;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    uint64_t v4 = v6;
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          char v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "appState", (void)v12);
          char v10 = [v9 isRestricted];

          if (v10)
          {
            uint64_t v4 = 1;
            goto LABEL_17;
          }
          ++v8;
        }
        while (v4 != v8);
        uint64_t v4 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  return v4;
}

uint64_t FIAreGoalCompletionNotificationsEnabled()
{
  id v0 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.ActivityMonitorApp"];
  uint64_t v1 = [v0 appState];
  uint64_t v2 = [v1 isInstalled];

  if (v2)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.ActivityMonitorApp"];
    uint64_t v4 = [v3 notificationSettings];

    uint64_t v5 = [v4 authorizationStatus];
    id v6 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x263F0ADA0]];
    uint64_t v8 = [v7 objectForKey:@"EnableGoalCompletions"];

    if (v5 == 2)
    {
      if (v8) {
        uint64_t v2 = [v8 BOOLValue];
      }
      else {
        uint64_t v2 = 1;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

uint64_t FIMirrorModeEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"MirrorModeEnabled", 1);
}

void FISetMirrorModeEnabled(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  BOOL v3 = @"MirrorModeEnabled";
  uint64_t v1 = [NSNumber numberWithBool:a1];
  v4[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  _FIWriteBoolsToPerGizmoDomain(v2, @"com.apple.nanolifestyle.sessiontrackerapp");
}

uint64_t FIAlertOnWatchWhenMirrored()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"AlertOnWatchWhenMirrored", 1);
}

void FISetAlertOnWatchWhenMirrored(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  BOOL v3 = @"AlertOnWatchWhenMirrored";
  uint64_t v1 = [NSNumber numberWithBool:a1];
  v4[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  _FIWriteBoolsToPerGizmoDomain(v2, @"com.apple.nanolifestyle.sessiontrackerapp");
}

uint64_t FIShouldTrackTrainingLoad()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"ShouldTrackTrainingLoad", 0);
}

void FISetShouldTrackTrainingLoad(uint64_t a1)
{
  int v1 = a1;
  v11[1] = *MEMORY[0x263EF8340];
  char v10 = @"ShouldTrackTrainingLoad";
  uint64_t v2 = [NSNumber numberWithBool:a1];
  v11[0] = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  _FIWriteBoolsToPerGizmoDomain(v3, @"com.apple.nanolifestyle.sessiontrackerapp");

  if (v1) {
    uint64_t v4 = @"opt-in";
  }
  else {
    uint64_t v4 = @"opt-out";
  }
  v8[0] = @"toggle";
  v8[1] = @"source";
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = [v5 bundleIdentifier];
  v9[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA(@"com.apple.postWorkoutPromptToggle", v7, 1);
}

uint64_t FIShouldShowTrackTrainingLoadPrompt()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"ShouldShowTrackTrainingLoadPrompt", 1);
}

void FISetShouldShowTrackTrainingLoadPrompt(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  BOOL v3 = @"ShouldShowTrackTrainingLoadPrompt";
  int v1 = [NSNumber numberWithBool:a1];
  v4[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  _FIWriteBoolsToPerGizmoDomain(v2, @"com.apple.nanolifestyle.sessiontrackerapp");
}

uint64_t FIHasSeenTrainingLoadOnboarding()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"HasSeenTrainingLoadOnboarding", 0);
}

void FISetHasSeenTrainingLoadOnboarding(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  BOOL v3 = @"HasSeenTrainingLoadOnboarding";
  int v1 = [NSNumber numberWithBool:a1];
  v4[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  _FIWriteBoolsToPerGizmoDomain(v2, @"com.apple.nanolifestyle.sessiontrackerapp");
}

uint64_t FISystemRootDirectory()
{
  if (FISystemRootDirectory_onceToken != -1) {
    dispatch_once(&FISystemRootDirectory_onceToken, &__block_literal_global_10);
  }
  return FISystemRootDirectory_systemRootDirectory;
}

void __FISystemRootDirectory_block_invoke()
{
  FISystemRootDirectory_systemRootDirectory = @"/";
}

id FIBundle()
{
  if (FIBundle_onceToken != -1) {
    dispatch_once(&FIBundle_onceToken, &__block_literal_global_328_0);
  }
  id v0 = (void *)FIBundle___bundle;
  return v0;
}

void __FIBundle_block_invoke()
{
  if (FISystemRootDirectory_onceToken != -1) {
    dispatch_once(&FISystemRootDirectory_onceToken, &__block_literal_global_10);
  }
  id v2 = [(id)FISystemRootDirectory_systemRootDirectory stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/FitnessUI.framework"];
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithPath:v2];
  int v1 = (void *)FIBundle___bundle;
  FIBundle___bundle = v0;
}

id FIAssetsBundle()
{
  if (FIAssetsBundle_onceToken != -1) {
    dispatch_once(&FIAssetsBundle_onceToken, &__block_literal_global_333);
  }
  uint64_t v0 = (void *)FIAssetsBundle___bundle;
  return v0;
}

void __FIAssetsBundle_block_invoke()
{
  if (FISystemRootDirectory_onceToken != -1) {
    dispatch_once(&FISystemRootDirectory_onceToken, &__block_literal_global_10);
  }
  id v2 = [(id)FISystemRootDirectory_systemRootDirectory stringByAppendingPathComponent:@"/System/Library/Health/Assets/FitnessUIAssets.bundle"];
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithPath:v2];
  int v1 = (void *)FIAssetsBundle___bundle;
  FIAssetsBundle___bundle = v0;
}

uint64_t FIDeviceSupportsSwimming()
{
  if (_FIBoolForPerGizmoDomainAndKey(@"com.apple.nanolifestyle.sessiontrackerapp", @"ForceSwimmingSupport"))return 1; {
  int v1 = FIGetActivePairedDevice();
  }
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"61415300-E200-4EDE-9853-BF83E3DE3A8A"];
  uint64_t v3 = [v1 supportsCapability:v2];

  return v3;
}

uint64_t FIIsWorkoutSafetyCheckInEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"WorkoutSafetyCheckInEnabled", 0);
}

void FISetWorkoutSafetyCheckInEnabled(uint64_t a1)
{
}

uint64_t FIIsNextWorkoutSafetyCheckInEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"NextWorkoutSafetyCheckInEnabled", 0);
}

void FISetNextWorkoutSafetyCheckInEnabled(uint64_t a1)
{
}

uint64_t FIIsWorkoutSafetyCheckInTipEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(@"com.apple.nanolifestyle.sessiontrackerapp", @"WorkoutSafetyCheckInTipEnabled", 1);
}

void FISetWorkoutSafetyCheckInTipEnabled(uint64_t a1)
{
}

__n128 FIEffectiveOperatingSystemVersion@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  if (FIEffectiveOperatingSystemVersion_onceToken != -1) {
    dispatch_once(&FIEffectiveOperatingSystemVersion_onceToken, &__block_literal_global_354);
  }
  int v4 = HKNSOperatingSystemVersionsEqual();
  uint64_t v5 = (__n128 *)&FIEffectiveOperatingSystemVersion_moonstoneVersion;
  if (!v4) {
    uint64_t v5 = a1;
  }
  __n128 result = *v5;
  *a2 = *v5;
  a2[1].n128_u64[0] = v5[1].n128_u64[0];
  return result;
}

double __FIEffectiveOperatingSystemVersion_block_invoke()
{
  HKNSOperatingSystemVersionFromString();
  FIEffectiveOperatingSystemVersion_moonstoneVersion = v1;
  qword_26AB0A588 = v2;
  HKNSOperatingSystemVersionFromString();
  double result = *(double *)&v1;
  FIEffectiveOperatingSystemVersion_emptyVersion = v1;
  qword_267C8F378 = v2;
  return result;
}

uint64_t FIIsWorkoutNFCAllDayDefaultEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue((void *)*MEMORY[0x263F0AC80], (void *)*MEMORY[0x263F0AC78], 0);
}

uint64_t FIIsWorkoutNFCAllDayEnabled()
{
  uint64_t v0 = (void *)*MEMORY[0x263F0AC80];
  uint64_t v1 = _FIBoolForPerGizmoDomainAndKeyWithDefaultValue((void *)*MEMORY[0x263F0AC80], (void *)*MEMORY[0x263F0AC78], 0);
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2050000000;
  uint64_t v2 = (void *)getNPKExpressGymKitAvailabilityManagerClass_softClass;
  uint64_t v12 = getNPKExpressGymKitAvailabilityManagerClass_softClass;
  if (!getNPKExpressGymKitAvailabilityManagerClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __getNPKExpressGymKitAvailabilityManagerClass_block_invoke;
    v8[3] = &unk_26441D318;
    v8[4] = &v9;
    __getNPKExpressGymKitAvailabilityManagerClass_block_invoke((uint64_t)v8);
    uint64_t v2 = (void *)v10[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = objc_alloc_init(v3);
  int v5 = [v4 isExpressGymKitAllowed];
  uint64_t v6 = _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(v0, (void *)*MEMORY[0x263F0AC88], v1) & v5;

  return v6;
}

void sub_21C7701E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FISetWorkoutNFCAllDayEnabled(uint64_t a1)
{
  _FIWriteBoolToPerGizmoDomain((void *)*MEMORY[0x263F0AC88], a1, (void *)*MEMORY[0x263F0AC80]);
  uint64_t v1 = (const char *)*MEMORY[0x263F0AC70];
  return notify_post(v1);
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRDevicePropertyIsAltAccountSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyIsAltAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyIsAltAccountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRWatchOSVersionForRemoteDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRVersionIsGreaterThanOrEqualSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRVersionIsGreaterThanOrEqual");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNPKExpressGymKitAvailabilityManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!NanoPassKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    void v4[2] = 3221225472;
    v4[3] = __NanoPassKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26441D558;
    uint64_t v6 = 0;
    NanoPassKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!NanoPassKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NPKExpressGymKitAvailabilityManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getNPKExpressGymKitAvailabilityManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNPKExpressGymKitAvailabilityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPassKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPassKitLibraryCore_frameworkLibrary = result;
  return result;
}

id FIDefaultExerciseGoalQuantityForActivityMoveMode(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F0A630];
  uint64_t v3 = [MEMORY[0x263F0A830] minuteUnit];
  id v4 = (uint64_t *)MEMORY[0x263F0AAA8];
  if (a1 != 2) {
    id v4 = (uint64_t *)MEMORY[0x263F0AA98];
  }
  long long v5 = [v2 quantityWithUnit:v3 doubleValue:(double)*v4];

  return v5;
}

id FIDefaultStandGoalQuantityForActivityMoveMode(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F0A630];
  uint64_t v3 = [MEMORY[0x263F0A830] countUnit];
  id v4 = (uint64_t *)MEMORY[0x263F0AAA0];
  if (a1 != 2) {
    id v4 = (uint64_t *)MEMORY[0x263F0AA90];
  }
  long long v5 = [v2 quantityWithUnit:v3 doubleValue:(double)*v4];

  return v5;
}

uint64_t FIActivityMoveModeWithHealthStore(void *a1)
{
  id v6 = 0;
  uint64_t v1 = [a1 _activityMoveModeWithError:&v6];
  id v2 = v6;
  if (v2)
  {
    _HKInitializeLogging();
    uint64_t v3 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR))
    {
      FIActivityMoveModeWithHealthStore_cold_1((uint64_t)v2, v3);
      if (v1) {
        goto LABEL_4;
      }
LABEL_6:
      uint64_t v4 = 1;
      goto LABEL_7;
    }
  }
  if (!v1) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v4 = [v1 integerValue];
LABEL_7:

  return v4;
}

uint64_t FIActivityMoveModeUserDefault()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)[v0 initWithSuiteName:*MEMORY[0x263F0ADA0]];
  id v2 = [v1 objectForKey:*MEMORY[0x263F09198]];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 integerValue];
  }
  else
  {
    _HKInitializeLogging();
    long long v5 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      FIActivityMoveModeUserDefault_cold_1(v5);
    }
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t FIDefaultActivityMoveModeWithAge(uint64_t a1)
{
  if (a1 >= 13) {
    return 1;
  }
  else {
    return 2;
  }
}

id FIMoveQuantityForActivitySummary(void *a1)
{
  id v1 = a1;
  if ([v1 activityMoveMode] == 2) {
    [v1 appleMoveMinutes];
  }
  else {
  id v2 = [v1 activeEnergyBurned];
  }

  return v2;
}

id FIMoveGoalQuantityForActivitySummary(void *a1)
{
  id v1 = a1;
  if ([v1 activityMoveMode] == 2) {
    [v1 appleMoveMinutesGoal];
  }
  else {
  id v2 = [v1 activeEnergyBurnedGoal];
  }

  return v2;
}

uint64_t FIActivitySummaryHasNonZeroMoveGoal(void *a1)
{
  id v1 = FIMoveGoalQuantityForActivitySummary(a1);
  uint64_t v2 = [v1 _isZero] ^ 1;

  return v2;
}

void FISaveGoalsForNewActivityMoveMode(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  long long v13 = (void *)MEMORY[0x263EFF980];
  id v27 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v26 = a2;
  id v28 = [v13 array];
  if (a1 == 2) {
    [MEMORY[0x263F0A598] moveMinuteGoal];
  }
  else {
  uint64_t v18 = [MEMORY[0x263F0A598] calorieGoal];
  }
  uint64_t v19 = [MEMORY[0x263F0A648] quantitySampleWithType:v18 quantity:v17 startDate:v14 endDate:v14];

  [v28 addObject:v19];
  long long v20 = (void *)MEMORY[0x263F0A648];
  long long v21 = [MEMORY[0x263F0A598] exerciseGoal];
  long long v22 = [v20 quantitySampleWithType:v21 quantity:v16 startDate:v14 endDate:v14];

  [v28 addObject:v22];
  id v23 = (void *)MEMORY[0x263F0A648];
  uint64_t v24 = [MEMORY[0x263F0A598] standGoal];
  id v25 = [v23 quantitySampleWithType:v24 quantity:v15 startDate:v14 endDate:v14];

  [v28 addObject:v25];
  [v26 saveObjects:v28 withCompletion:v27];
}

id FIActivityMoveModeChangeSampleForDateComponents(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F0A598];
  uint64_t v4 = *MEMORY[0x263F0AA60];
  id v5 = a2;
  id v6 = [v3 categoryTypeForIdentifier:v4];
  uint64_t v7 = _HKCacheIndexFromDateComponents();

  uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)v7];
  uint64_t v9 = [MEMORY[0x263F0A150] categorySampleWithType:v6 value:a1 startDate:v8 endDate:v8];

  return v9;
}

__CFString *NLHKActivityMoveModeString(uint64_t a1)
{
  id v1 = @"HKActivityMoveModeNotSet";
  if (a1 == 1) {
    id v1 = @"HKActivityMoveModeActiveEnergy";
  }
  if (a1 == 2) {
    return @"HKActivityMoveModeAppleMoveTime";
  }
  else {
    return v1;
  }
}

id FIDistanceQuantityTypeIdentifierForActivityType(uint64_t a1)
{
  id v1 = (id *)MEMORY[0x263F09DD8];
  uint64_t v2 = (id *)MEMORY[0x263F09DB0];
  if (a1 != 13) {
    uint64_t v2 = (id *)MEMORY[0x263F09DE0];
  }
  if (a1 != 46) {
    id v1 = v2;
  }
  return *v1;
}

uint64_t FIQuantityTypeForActivityType(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F09DD8];
  uint64_t v2 = (void *)MEMORY[0x263F09DB0];
  if (a1 != 13) {
    uint64_t v2 = (void *)MEMORY[0x263F09DE0];
  }
  if (a1 != 46) {
    id v1 = v2;
  }
  return [MEMORY[0x263F0A658] quantityTypeForIdentifier:*v1];
}

uint64_t sub_21C770D80()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267C8F0E0);
  uint64_t v0 = *(void *)(type metadata accessor for PauseRingsPeriod() - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21C7842B0;
  unint64_t v4 = v3 + v2;
  uint64_t v5 = sub_21C781730();
  id v6 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v4, 1, 3, v5);
  v6(v4 + v1, 2, 3, v5);
  v6(v4 + 2 * v1, 3, 3, v5);
  sub_21C781720();
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t, uint64_t))v6)(v4 + 3 * v1, 0, 3, v5);
  qword_267C8F3B8 = v3;
  return result;
}

uint64_t *sub_21C770EF0()
{
  if (qword_267C8F3B0 != -1) {
    swift_once();
  }
  return &qword_267C8F3B8;
}

uint64_t static PauseRingsPeriod.allCases.getter()
{
  if (qword_267C8F3B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static PauseRingsPeriod.allCases.setter(uint64_t a1)
{
  if (qword_267C8F3B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_267C8F3B8 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PauseRingsPeriod.allCases.modify())()
{
  if (qword_267C8F3B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PauseRingsPeriod.localizedTitleForCurrentDate.getter()
{
  uint64_t v1 = sub_21C781810();
  uint64_t v55 = *(void *)(v1 - 8);
  uint64_t v56 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21C7817F0();
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v54 = v4;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21C7816C0();
  uint64_t v51 = *(void *)(v7 - 8);
  uint64_t v52 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v50 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v49 = (char *)&v47 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4A8);
  MEMORY[0x270FA5388](v11 - 8);
  long long v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21C781730();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v48 = (char *)&v47 - v19;
  uint64_t v20 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x270FA5388](v20 - 8);
  long long v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C7719AC(v0, (uint64_t)v22);
  uint64_t v23 = v15;
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  uint64_t v57 = v14;
  switch(v24(v22, 3, v14))
  {
    case 1u:
      id v43 = (void *)sub_21C7818A0();
      long long v13 = (char *)FILocalizedStringForKey(v43);

      if (!v13) {
        goto LABEL_23;
      }
      uint64_t v26 = sub_21C7818B0();

      return v26;
    case 2u:
      PauseRingsPeriod.date()((uint64_t)v13);
      uint64_t v27 = v57;
      if (v24(v13, 1, v57) == 1) {
        goto LABEL_26;
      }
      id v28 = v48;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v48, v13, v27);
      sub_21C781780();
      sub_21C781800();
      uint64_t v29 = v49;
      sub_21C781740();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v3, v56);
      (*(void (**)(char *, uint64_t))(v53 + 8))(v6, v54);
      uint64_t v30 = sub_21C7816A0();
      if (v31)
      {
        unint64_t v59 = 0;
        unint64_t v60 = 0xE000000000000000;
        sub_21C781A70();
        swift_bridgeObjectRelease();
        unint64_t v59 = 0xD00000000000002BLL;
        unint64_t v60 = 0x800000021C7890D0;
        sub_21C774058(&qword_267C8F080, MEMORY[0x263F07490]);
        sub_21C781B70();
        sub_21C7818E0();
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      uint64_t v32 = v30;
      unint64_t v59 = 0;
      unint64_t v60 = 0xE000000000000000;
      sub_21C781A70();
      swift_bridgeObjectRelease();
      unint64_t v59 = 0xD000000000000025;
      unint64_t v60 = 0x800000021C789100;
      uint64_t v58 = v32;
      sub_21C781B70();
      sub_21C7818E0();
      swift_bridgeObjectRelease();
      v33 = (void *)sub_21C7818A0();
      swift_bridgeObjectRelease();
      long long v13 = (char *)FILocalizedStringForKey(v33);

      if (v13)
      {
        uint64_t v26 = sub_21C7818B0();

        (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v52);
        (*(void (**)(char *, uint64_t))(v23 + 8))(v28, v57);
        return v26;
      }
      goto LABEL_22;
    case 3u:
      sub_21C781780();
      sub_21C781800();
      sub_21C781710();
      id v34 = v50;
      sub_21C781740();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v57);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v3, v56);
      (*(void (**)(char *, uint64_t))(v53 + 8))(v6, v54);
      uint64_t v35 = sub_21C781690();
      if (v36) {
        goto LABEL_17;
      }
      uint64_t v37 = v35;
      unint64_t v59 = 0;
      unint64_t v60 = 0xE000000000000000;
      sub_21C781A70();
      swift_bridgeObjectRelease();
      unint64_t v59 = 0xD000000000000022;
      unint64_t v60 = 0x800000021C789050;
      uint64_t v58 = v37;
      sub_21C781B70();
      sub_21C7818E0();
      swift_bridgeObjectRelease();
      unint64_t v38 = v59;
      long long v13 = (char *)v60;
      unint64_t v39 = (void *)sub_21C7818A0();
      id v40 = FILocalizedStringForKey(v39);

      if (!v40) {
        goto LABEL_25;
      }
      uint64_t v26 = sub_21C7818B0();
      __int16 v42 = v41;

      if (v38 == v26 && v13 == v42)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v44 = sub_21C781B80();
        swift_bridgeObjectRelease();
        if ((v44 & 1) == 0)
        {
LABEL_19:
          (*(void (**)(char *, uint64_t))(v51 + 8))(v34, v52);
          return v26;
        }
      }
      swift_bridgeObjectRelease();
LABEL_17:
      id v45 = (void *)sub_21C7818A0();
      long long v13 = (char *)FILocalizedStringForKey(v45);

      if (v13)
      {
        uint64_t v26 = sub_21C7818B0();

        goto LABEL_19;
      }
      goto LABEL_24;
    default:
      id v25 = (void *)sub_21C7818A0();
      long long v13 = (char *)FILocalizedStringForKey(v25);

      if (!v13)
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        sub_21C773FFC((uint64_t)v13, &qword_26AB0A4A8);
LABEL_28:
        sub_21C781B10();
        __break(1u);
        JUMPOUT(0x21C771950);
      }
      uint64_t v26 = sub_21C7818B0();

      sub_21C771A10((uint64_t)v22);
      return v26;
  }
}

uint64_t type metadata accessor for PauseRingsPeriod()
{
  uint64_t result = qword_267C8F540;
  if (!qword_267C8F540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21C7719AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PauseRingsPeriod();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C771A10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PauseRingsPeriod();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PauseRingsPeriod.date()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v117 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F088);
  MEMORY[0x270FA5388](v3 - 8);
  v113 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F090);
  MEMORY[0x270FA5388](v5 - 8);
  v112 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_21C7816C0();
  v116 = *(void (**)(char *, uint64_t))(v114 - 8);
  MEMORY[0x270FA5388](v114);
  uint64_t v8 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4A8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v109 = (void (*)(char *, uint64_t))((char *)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v100 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  v108 = (char *)&v100 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v100 - v17;
  uint64_t v19 = sub_21C7817E0();
  uint64_t v118 = *(void *)(v19 - 8);
  uint64_t v119 = v19;
  MEMORY[0x270FA5388](v19);
  v115 = (char *)&v100 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_21C781730();
  id v25 = *(char **)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  id v28 = (char *)&v100 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  v106 = (char *)&v100 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v111 = (char *)&v100 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v105 = (char *)&v100 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v107 = (char *)&v100 - v36;
  MEMORY[0x270FA5388](v35);
  unint64_t v38 = (char *)&v100 - v37;
  uint64_t v39 = sub_21C7817F0();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v121 = v39;
  uint64_t v122 = v40;
  MEMORY[0x270FA5388](v39);
  __int16 v42 = (char *)&v100 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C7817D0();
  v120 = v38;
  sub_21C781720();
  sub_21C7719AC(v2, (uint64_t)v23);
  id v43 = (unsigned int (*)(char *, uint64_t, uint64_t))*((void *)v25 + 6);
  switch(v43(v23, 3, v24))
  {
    case 1u:
      uint64_t v78 = v118;
      uint64_t v77 = v119;
      v79 = v115;
      (*(void (**)(char *, void, uint64_t))(v118 + 104))(v115, *MEMORY[0x263F07870], v119);
      v80 = v120;
      sub_21C7817C0();
      (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v77);
      (*((void (**)(char *, uint64_t))v25 + 1))(v80, v24);
      return (*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v42, v121);
    case 2u:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F098);
      v110 = v43;
      uint64_t v48 = v118;
      uint64_t v49 = *(void *)(v118 + 72);
      unint64_t v50 = (*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80);
      uint64_t v51 = swift_allocObject();
      *(_OWORD *)(v51 + 16) = xmmword_21C7842C0;
      unint64_t v52 = v51 + v50;
      uint64_t v53 = *MEMORY[0x263F07860];
      uint64_t v54 = *(void (**)(unint64_t, uint64_t, uint64_t))(v48 + 104);
      v111 = v18;
      v104 = v8;
      uint64_t v55 = v119;
      v54(v52, v53, v119);
      uint64_t v56 = *MEMORY[0x263F07830];
      v106 = (char *)(v48 + 104);
      v103 = v54;
      v54(v52 + v49, v56, v55);
      sub_21C7732AC(v51);
      swift_setDeallocating();
      uint64_t v57 = v104;
      uint64_t v58 = v111;
      swift_arrayDestroy();
      swift_deallocClassInstance();
      unint64_t v59 = v120;
      sub_21C781760();
      swift_bridgeObjectRelease();
      sub_21C7817A0();
      unint64_t v60 = (void (*)(char *, uint64_t))((char *)v116 + 8);
      uint64_t v61 = v114;
      v109 = (void (*)(char *, uint64_t))*((void *)v116 + 1);
      v109(v57, v114);
      if (v110(v58, 1, v24) == 1)
      {
        (*((void (**)(char *, uint64_t))v25 + 1))(v59, v24);
LABEL_10:
        (*(void (**)(char *, uint64_t))(v122 + 8))(v42, v121);
        uint64_t v86 = (uint64_t)v58;
        goto LABEL_14;
      }
      v116 = v60;
      v81 = (void (*)(char *, char *, uint64_t))*((void *)v25 + 4);
      v82 = v107;
      v111 = v25 + 32;
      v102 = v81;
      v81(v107, v58, v24);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v112, 1, 1, v121);
      uint64_t v83 = sub_21C781810();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 56))(v113, 1, 1, v83);
      v84 = v82;
      sub_21C7816B0();
      uint64_t v58 = v108;
      sub_21C7817B0();
      v109(v57, v61);
      if (v110(v58, 1, v24) == 1)
      {
        v85 = (void (*)(char *, uint64_t))*((void *)v25 + 1);
        v85(v84, v24);
        v85(v120, v24);
        goto LABEL_10;
      }
      v92 = v105;
      v102(v105, v58, v24);
      uint64_t v93 = v122;
      v94 = v115;
      uint64_t v95 = v119;
      v103((unint64_t)v115, *MEMORY[0x263F07870], v119);
      sub_21C7817C0();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v94, v95);
      v96 = (void (*)(char *, uint64_t))*((void *)v25 + 1);
      v96(v92, v24);
      v96(v84, v24);
      v96(v120, v24);
      return (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v42, v121);
    case 3u:
      v107 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F098);
      v62 = v8;
      uint64_t v63 = v118;
      v110 = v43;
      uint64_t v64 = *(void *)(v118 + 72);
      unint64_t v65 = (*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80);
      uint64_t v66 = swift_allocObject();
      *(_OWORD *)(v66 + 16) = xmmword_21C7842C0;
      unint64_t v67 = v66 + v65;
      uint64_t v68 = *MEMORY[0x263F078A0];
      v69 = *(void (**)(unint64_t, uint64_t, uint64_t))(v63 + 104);
      v104 = v62;
      uint64_t v70 = v119;
      v69(v67, v68, v119);
      uint64_t v71 = *MEMORY[0x263F078A8];
      v105 = (char *)(v63 + 104);
      v103 = v69;
      v69(v67 + v64, v71, v70);
      sub_21C7732AC(v66);
      swift_setDeallocating();
      v72 = v104;
      swift_arrayDestroy();
      swift_deallocClassInstance();
      v73 = v120;
      sub_21C781760();
      swift_bridgeObjectRelease();
      v108 = v42;
      sub_21C7817A0();
      v74 = (void (*)(char *, uint64_t))*((void *)v116 + 1);
      uint64_t v75 = v114;
      v74(v72, v114);
      if (v110(v14, 1, v24) == 1)
      {
        id v25 = v107;
        v76 = v108;
        (*((void (**)(char *, uint64_t))v107 + 1))(v73, v24);
      }
      else
      {
        id v25 = v107;
        v87 = (void (*)(char *, char *, uint64_t))*((void *)v107 + 4);
        v116 = v74;
        v102 = (void (*)(char *, char *, uint64_t))(v107 + 32);
        v101 = v87;
        v87(v111, v14, v24);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v112, 1, 1, v121);
        uint64_t v88 = sub_21C781810();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v113, 1, 1, v88);
        sub_21C7816B0();
        v89 = (char *)v109;
        sub_21C7817B0();
        v116(v72, v75);
        if (v110(v89, 1, v24) != 1)
        {
          v97 = v106;
          v101(v106, v89, v24);
          v98 = v115;
          uint64_t v99 = v119;
          v103((unint64_t)v115, *MEMORY[0x263F07870], v119);
          __int16 v42 = v108;
          sub_21C7817C0();
          (*(void (**)(char *, uint64_t))(v118 + 8))(v98, v99);
          uint64_t v47 = (void (*)(char *, uint64_t))*((void *)v25 + 1);
          v47(v97, v24);
          v47(v111, v24);
LABEL_17:
          v47(v120, v24);
          return (*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v42, v121);
        }
        v76 = v108;
        v90 = (void (*)(char *, uint64_t))*((void *)v25 + 1);
        v90(v111, v24);
        v90(v120, v24);
        uint64_t v14 = v89;
      }
      (*(void (**)(char *, uint64_t))(v122 + 8))(v76, v121);
      uint64_t v86 = (uint64_t)v14;
LABEL_14:
      sub_21C773FFC(v86, &qword_26AB0A4A8);
      return (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))v25 + 7))(v117, 1, 1, v24);
    default:
      (*((void (**)(char *, char *, uint64_t))v25 + 4))(v28, v23, v24);
      uint64_t v45 = v118;
      uint64_t v44 = v119;
      uint64_t v46 = v115;
      (*(void (**)(char *, void, uint64_t))(v118 + 104))(v115, *MEMORY[0x263F07870], v119);
      sub_21C7817C0();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v44);
      uint64_t v47 = (void (*)(char *, uint64_t))*((void *)v25 + 1);
      v47(v28, v24);
      goto LABEL_17;
  }
}

uint64_t PauseRingsPeriod.hash(into:)()
{
  uint64_t v1 = sub_21C781730();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C7719AC(v0, (uint64_t)v7);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 3, v1))
  {
    case 1u:
    case 2u:
    case 3u:
      uint64_t result = sub_21C781BF0();
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
      sub_21C781BF0();
      sub_21C774058(&qword_267C8F0A0, MEMORY[0x263F07490]);
      sub_21C781880();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      break;
  }
  return result;
}

uint64_t PauseRingsPeriod.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21C781730();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C781BE0();
  sub_21C7719AC(v1, (uint64_t)v8);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 3, v2))
  {
    case 1u:
    case 2u:
    case 3u:
      sub_21C781BF0();
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
      sub_21C781BF0();
      sub_21C774058(&qword_267C8F0A0, MEMORY[0x263F07490]);
      sub_21C781880();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
  }
  return sub_21C781C00();
}

uint64_t sub_21C772D0C@<X0>(void *a1@<X8>)
{
  if (qword_267C8F3B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = qword_267C8F3B8;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21C772D94()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21C781730();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C781BE0();
  sub_21C7719AC(v1, (uint64_t)v8);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 3, v2))
  {
    case 1u:
    case 2u:
    case 3u:
      sub_21C781BF0();
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
      sub_21C781BF0();
      sub_21C774058(&qword_267C8F0A0, MEMORY[0x263F07490]);
      sub_21C781880();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      break;
  }
  return sub_21C781C00();
}

uint64_t _s7Fitness16PauseRingsPeriodO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21C781730();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F0C0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_21C7719AC(a1, (uint64_t)v14);
  sub_21C7719AC(a2, v15);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  switch(v16((uint64_t)v14, 3, v4))
  {
    case 1u:
      if (v16(v15, 3, v4) != 1) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 2u:
      if (v16(v15, 3, v4) != 2) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 3u:
      if (v16(v15, 3, v4) != 3) {
        goto LABEL_9;
      }
LABEL_5:
      sub_21C771A10((uint64_t)v14);
      char v17 = 1;
      break;
    default:
      sub_21C7719AC((uint64_t)v14, (uint64_t)v10);
      if (v16(v15, 3, v4))
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_9:
        sub_21C773FFC((uint64_t)v14, &qword_267C8F0C0);
        char v17 = 0;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
        char v17 = sub_21C7816F0();
        uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
        v19(v7, v4);
        v19(v10, v4);
        sub_21C771A10((uint64_t)v14);
      }
      break;
  }
  return v17 & 1;
}

uint64_t sub_21C7732AC(uint64_t a1)
{
  uint64_t v2 = sub_21C7817E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F0C8);
    uint64_t v9 = sub_21C781A60();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_21C774058(&qword_267C8F0D0, MEMORY[0x263F07908]);
      uint64_t v16 = sub_21C781870();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_21C774058(&qword_267C8F0D8, MEMORY[0x263F07908]);
          char v23 = sub_21C781890();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        id v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

unint64_t sub_21C7735C8()
{
  unint64_t result = qword_267C8F0A8;
  if (!qword_267C8F0A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C8F0B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8F0A8);
  }
  return result;
}

uint64_t sub_21C773624()
{
  return sub_21C774058(&qword_267C8F0B8, (void (*)(uint64_t))type metadata accessor for PauseRingsPeriod);
}

uint64_t *initializeBufferWithCopyOfBuffer for PauseRingsPeriod(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_21C781730();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for PauseRingsPeriod(uint64_t a1)
{
  uint64_t v2 = sub_21C781730();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for PauseRingsPeriod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21C781730();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithCopy for PauseRingsPeriod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21C781730();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *initializeWithTake for PauseRingsPeriod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21C781730();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithTake for PauseRingsPeriod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21C781730();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PauseRingsPeriod(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21C773DA4);
}

uint64_t sub_21C773DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21C781730();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PauseRingsPeriod(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21C773E24);
}

uint64_t sub_21C773E24(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_21C781730();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_21C773EA8(uint64_t a1)
{
  uint64_t v2 = sub_21C781730();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 3, v2);
}

uint64_t sub_21C773F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21C781730();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 3, v4);
}

uint64_t sub_21C773F84()
{
  uint64_t result = sub_21C781730();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_21C773FFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21C774058(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21C7740A0()
{
  return 0;
}

id sub_21C7740A8()
{
  id v0 = objc_msgSend(self, sel_weakObjectsHashTable);
  return v0;
}

id sub_21C7740E8(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHealthStore_, a1);

  return v2;
}

id sub_21C774130(void *a1)
{
  *(void *)&v1[OBJC_IVAR___FIPregnancyStateProvider_query] = 0;
  uint64_t v3 = OBJC_IVAR___FIPregnancyStateProvider_observers;
  uint64_t v4 = self;
  uint64_t v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_weakObjectsHashTable);
  *(void *)&v5[OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel] = 0;
  *(void *)&v5[OBJC_IVAR___FIPregnancyStateProvider_healthStore] = a1;
  id v6 = a1;

  v9.receiver = v5;
  v9.super_class = (Class)FIPregnancyStateProvider;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  objc_msgSend(v7, sel_activate);

  return v7;
}

id sub_21C774238()
{
  swift_getObjectType();
  os_log_type_t v1 = sub_21C7819B0();
  id v2 = (void *)*MEMORY[0x263F098C8];
  os_log_type_t v3 = v1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v1))
  {
    uint64_t v4 = v2;
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = sub_21C781C10();
    uint64_t v10 = sub_21C74E328(v7, v8, &v11);
    sub_21C781A20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C74B000, v4, v3, "%s De-init called.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B0100](v6, -1, -1);
    MEMORY[0x21D4B0100](v5, -1, -1);
  }
  objc_msgSend(v0, sel_stopQuery, v10, v11);
  v12.receiver = v0;
  v12.super_class = (Class)FIPregnancyStateProvider;
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

void *sub_21C774444()
{
  os_log_type_t v1 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel);
  id v2 = v1;
  return v1;
}

void *sub_21C774484()
{
  uint64_t result = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel);
  if (result) {
    return (void *)(objc_msgSend(result, sel_state) == (id)1);
  }
  return result;
}

id sub_21C7744F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_addObject_, a1);
}

id sub_21C774528(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_removeObject_, a1);
}

void sub_21C77455C(uint64_t a1)
{
  id v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_allObjects);
  unint64_t v4 = sub_21C781920();

  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21C781B30();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_3:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0) {
        MEMORY[0x21D4AF560](i, v4);
      }
      else {
        swift_unknownObjectRetain();
      }
      uint64_t v7 = (void *)swift_dynamicCastObjCProtocolConditional();
      if (v7) {
        objc_msgSend(v7, sel_pregnancyModelDidChangeWithProvider_model_, v1, a1);
      }
      swift_unknownObjectRelease();
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

void sub_21C774750()
{
  uint64_t ObjectType = swift_getObjectType();
  os_log_type_t v2 = sub_21C7819B0();
  id v3 = (void *)*MEMORY[0x263F098C8];
  os_log_type_t v4 = v2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v2))
  {
    uint64_t v5 = v3;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    aBlock[0] = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_21C781C10();
    sub_21C74E328(v8, v9, aBlock);
    sub_21C781A20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C74B000, v5, v4, "%s Starting pregnancy state query.", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B0100](v7, -1, -1);
    MEMORY[0x21D4B0100](v6, -1, -1);
  }
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = ObjectType;
  id v12 = objc_allocWithZone(MEMORY[0x263F0A490]);
  aBlock[4] = (uint64_t)sub_21C74D998;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21C74D8F8;
  aBlock[3] = (uint64_t)&block_descriptor;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  id v14 = objc_msgSend(v12, sel_initWithUpdateHandler_, v13);
  _Block_release(v13);
  swift_release();
  swift_release();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___FIPregnancyStateProvider_healthStore), sel_executeQuery_, v14);
  uint64_t v15 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_query);
  *(void *)(v0 + OBJC_IVAR___FIPregnancyStateProvider_query) = v14;
}

void sub_21C774A0C()
{
  swift_getObjectType();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_query);
  if (v1)
  {
    os_log_type_t v2 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_healthStore);
    id v11 = v1;
    objc_msgSend(v2, sel_stopQuery_);
    os_log_type_t v3 = sub_21C7819B0();
    os_log_type_t v4 = (void *)*MEMORY[0x263F098C8];
    os_log_type_t v5 = v3;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v3))
    {
      uint64_t v6 = v4;
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v12 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = sub_21C781C10();
      sub_21C74E328(v9, v10, &v12);
      sub_21C781A20();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C74B000, v6, v5, "%s Stopping pregnancy state query.", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B0100](v8, -1, -1);
      MEMORY[0x21D4B0100](v7, -1, -1);
    }
    else
    {
    }
  }
}

void __swiftcall FIPregnancyStateProvider.init()(FIPregnancyStateProvider *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void FIPregnancyStateProvider.init()()
{
}

unint64_t type metadata accessor for FIPregnancyStateProvider()
{
  unint64_t result = qword_267C8F550[0];
  if (!qword_267C8F550[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_267C8F550);
  }
  return result;
}

uint64_t sub_21C774CE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21C774D80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21C774F60(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21C774F60(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21C774D80(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21C774EF8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21C781A80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21C781B00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21C7818F0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21C781B50();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21C781B00();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21C774EF8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F178);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21C774F60(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F178);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_21C781B50();
  __break(1u);
  return result;
}

uint64_t sub_21C7750B4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21C7750EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

BOOL sub_21C775124(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_21C775134()
{
  return sub_21C781BF0();
}

uint64_t sub_21C77515C()
{
  return sub_21C781C00();
}

BOOL sub_21C7751A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21C7751B8()
{
  return sub_21C781C00();
}

uint64_t sub_21C775200()
{
  return sub_21C781BF0();
}

uint64_t sub_21C77522C()
{
  return sub_21C781C00();
}

uint64_t sub_21C7752C0()
{
  return sub_21C7818A0();
}

uint64_t sub_21C77531C()
{
  return sub_21C7818A0();
}

uint64_t sub_21C775378()
{
  return sub_21C7818A0();
}

uint64_t sub_21C7753CC()
{
  return 0x65676E6172;
}

uint64_t sub_21C7753E0()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_21C7753EC()
{
  return 1;
}

uint64_t sub_21C7753F4()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = sub_21C781830();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21C781850();
  uint64_t v5 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  int64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C77FAB4(0, &qword_26AB0A4F8);
  int64_t v8 = (void *)sub_21C7819E0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = ObjectType;
  aBlock[4] = sub_21C77F7EC;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C7774CC;
  aBlock[3] = &block_descriptor_106;
  unint64_t v10 = _Block_copy(aBlock);
  swift_release();
  sub_21C781840();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
  sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
  sub_21C781A50();
  MEMORY[0x21D4AF4C0](0, v7, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v13);
}

void sub_21C7756C0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR___FIPauseRingsCoordinator_state;
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR___FIPauseRingsCoordinator_state);
  *(void *)(v2 + OBJC_IVAR___FIPauseRingsCoordinator_state) = a1;
  sub_21C77C528(v5);
  sub_21C77C528(a1);
  sub_21C77C3EC(v5);
  uint64_t v6 = *(void **)(v2 + v4);
  if (v6 == (void *)1 || v5 == (void *)1) {
    goto LABEL_6;
  }
  if (!v5)
  {
    if (!v6)
    {
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    sub_21C77C3EC(0);
LABEL_6:
    sub_21C7753F4();
    goto LABEL_7;
  }
  if (!v6) {
    goto LABEL_6;
  }
  sub_21C77FAB4(0, &qword_267C8F2A8);
  sub_21C77C528(v5);
  sub_21C77C528(v6);
  char v8 = sub_21C781A10();
  sub_21C77C3EC(v6);
  sub_21C77C3EC(v5);
  if ((v8 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
  sub_21C77C3EC(a1);
  sub_21C77C3EC(v5);
}

void sub_21C7757C4(void *a1)
{
  uint64_t v58 = sub_21C7819D0();
  uint64_t v3 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21C7819C0();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_21C781850();
  MEMORY[0x270FA5388](v7 - 8);
  *(void *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_query] = 0;
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals] = MEMORY[0x263F8EE78];
  uint64_t v9 = v8;
  *(void *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_state] = 1;
  *(void *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_healthStore] = a1;
  uint64_t v55 = sub_21C77FAB4(0, &qword_26AB0A4F8);
  uint64_t v56 = v1;
  id v49 = a1;
  sub_21C781840();
  uint64_t aBlock = v9;
  uint64_t v57 = sub_21C77FDB4(&qword_26AB0A4F0, MEMORY[0x263F8F0F8]);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4D8);
  uint64_t v54 = sub_21C77CE28(&qword_26AB0A4E0, &qword_26AB0A4D8);
  uint64_t v52 = v10;
  sub_21C781A50();
  uint64_t v11 = *MEMORY[0x263F8F130];
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  uint64_t v53 = v3 + 104;
  unint64_t v50 = v5;
  unsigned int v51 = v11;
  uint64_t v13 = v58;
  v12(v5, v11, v58);
  uint64_t v14 = sub_21C781A00();
  uint64_t v15 = v56;
  *(void *)&v56[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue] = v14;
  sub_21C781840();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_21C781A50();
  uint64_t v16 = v50;
  v12(v50, v11, v13);
  *(void *)&v15[OBJC_IVAR___FIPauseRingsCoordinator_syncQueue] = sub_21C781A00();
  sub_21C781840();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_21C781A50();
  v12(v16, v51, v58);
  uint64_t v17 = sub_21C781A00();
  unint64_t v18 = v56;
  *(void *)&v56[OBJC_IVAR___FIPauseRingsCoordinator_metricQueue] = v17;

  v59.receiver = v18;
  v59.super_class = (Class)FIPauseRingsCoordinator;
  id v19 = objc_msgSendSuper2(&v59, sel_init);
  sub_21C77FAB4(0, &qword_26AB0A4E8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v21 = (char *)v19;
  id v22 = objc_msgSend(ObjCClassFromMetadata, sel_pauseRingsScheduleType);
  if (!v22)
  {
    __break(1u);
    goto LABEL_9;
  }
  char v23 = v22;
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v25 = objc_allocWithZone(MEMORY[0x263F0A5A0]);
  uint64_t v64 = sub_21C775FE4;
  uint64_t v65 = v24;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v61 = 1107296256;
  v62 = sub_21C77C318;
  uint64_t v63 = &block_descriptor_0;
  uint64_t v26 = _Block_copy(&aBlock);
  swift_retain();
  id v27 = objc_msgSend(v25, sel_initWithSampleType_predicate_updateHandler_, v23, 0, v26);

  _Block_release(v26);
  swift_release();
  swift_release();
  BOOL v28 = *(void **)&v21[OBJC_IVAR___FIPauseRingsCoordinator_query];
  *(void *)&v21[OBJC_IVAR___FIPauseRingsCoordinator_query] = v27;
  id v29 = v27;

  uint64_t ObjectType = swift_getObjectType();
  id v31 = objc_msgSend(self, sel_sharedBehavior);
  if (!v31)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v32 = v31;
  id v33 = objc_msgSend(v31, sel_features);

  if (!v33)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  unsigned int v34 = objc_msgSend(v33, sel_pauseRings);

  if (!v34)
  {
LABEL_7:

    return;
  }
  sub_21C7818B0();
  id v35 = objc_allocWithZone(MEMORY[0x263F08B30]);
  uint64_t v36 = (void *)sub_21C7818A0();
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v35, sel_initWithKey_ascending_, v36, 1);

  id v38 = objc_msgSend(ObjCClassFromMetadata, sel_pauseRingsScheduleType);
  if (v38)
  {
    uint64_t v39 = v38;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB0A530);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_21C7843C0;
    *(void *)(v40 + 32) = v37;
    uint64_t aBlock = v40;
    sub_21C781930();
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = v21;
    *(void *)(v41 + 24) = ObjectType;
    id v42 = objc_allocWithZone(MEMORY[0x263F0A6E0]);
    sub_21C77FAB4(0, &qword_26AB0A528);
    id v43 = v37;
    uint64_t v44 = v21;
    uint64_t v45 = (void *)sub_21C781910();
    swift_bridgeObjectRelease();
    uint64_t v64 = sub_21C77FE34;
    uint64_t v65 = v41;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v61 = 1107296256;
    v62 = sub_21C77D3E4;
    uint64_t v63 = &block_descriptor_148;
    uint64_t v46 = _Block_copy(&aBlock);
    id v47 = objc_msgSend(v42, sel_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_, v39, 0, 0, v45, v46);

    _Block_release(v46);
    swift_release();
    objc_msgSend(*(id *)&v44[OBJC_IVAR___FIPauseRingsCoordinator_healthStore], sel_executeQuery_, v47);

    goto LABEL_7;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_21C775FAC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21C775FE4()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x21D4B0160](v0 + 16);
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    sub_21C776038();
  }
}

void sub_21C776038()
{
  uint64_t v1 = v0;
  sub_21C7819B0();
  id v2 = (id)*MEMORY[0x263F098C8];
  sub_21C781820();

  sub_21C7818B0();
  id v3 = objc_allocWithZone(MEMORY[0x263F08B30]);
  uint64_t v4 = (void *)sub_21C7818A0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithKey_ascending_, v4, 1);

  sub_21C77FAB4(0, &qword_26AB0A4E8);
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_pauseRingsScheduleType);
  if (v6)
  {
    uint64_t v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB0A530);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_21C7843C0;
    *(void *)(v8 + 32) = v5;
    sub_21C781930();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v1;
    id v10 = objc_allocWithZone(MEMORY[0x263F0A6E0]);
    sub_21C77FAB4(0, &qword_26AB0A528);
    id v11 = v5;
    uint64_t v12 = v1;
    uint64_t v13 = (void *)sub_21C781910();
    swift_bridgeObjectRelease();
    v16[4] = sub_21C77F794;
    v16[5] = v9;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1107296256;
    v16[2] = sub_21C77D3E4;
    v16[3] = &block_descriptor_94;
    uint64_t v14 = _Block_copy(v16);
    id v15 = objc_msgSend(v10, sel_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_, v7, 0, 0, v13, v14);

    _Block_release(v14);
    swift_release();
    objc_msgSend(*(id *)&v12[OBJC_IVAR___FIPauseRingsCoordinator_healthStore], sel_executeQuery_, v15);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21C776424(unint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8 = sub_21C781830();
  uint64_t v28 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_21C781850();
  uint64_t v11 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v14 = sub_21C7819B0();
  id v15 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v14))
  {
    uint64_t v25 = a4;
    uint64_t v26 = a2;
    swift_bridgeObjectRetain_n();
    uint64_t v16 = v15;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 134217984;
    if (a1)
    {
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v18 = sub_21C781B30();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = 0;
    }
    aBlock[0] = v18;
    sub_21C781A20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C74B000, v16, v14, "[PauseRingsCoordinator] Received initial query results (%ld count)...", v17, 0xCu);
    MEMORY[0x21D4B0100](v17, -1, -1);

    a4 = v25;
    a2 = v26;
  }
  id v19 = (void *)swift_allocObject();
  void v19[2] = a3;
  v19[3] = a1;
  v19[4] = a2;
  v19[5] = a4;
  aBlock[4] = sub_21C77FE50;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C7774CC;
  aBlock[3] = &block_descriptor_154;
  uint64_t v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v21 = a3;
  id v22 = a2;
  sub_21C781840();
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
  sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
  sub_21C781A50();
  MEMORY[0x21D4AF4C0](0, v13, v10, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v27);
  return swift_release();
}

id sub_21C7767F8(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_21C781830();
  uint64_t v20 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_21C781850();
  uint64_t v11 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C776B10(a2, a3);
  sub_21C77FAB4(0, &qword_26AB0A4F8);
  os_log_type_t v14 = (void *)sub_21C7819E0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a4;
  aBlock[4] = sub_21C77FE5C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C7774CC;
  aBlock[3] = &block_descriptor_160;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = a1;
  swift_release();
  sub_21C781840();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
  sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
  sub_21C781A50();
  MEMORY[0x21D4AF4C0](0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v19);
  if (*(void *)&v17[OBJC_IVAR___FIPauseRingsCoordinator_query]) {
    return objc_msgSend(*(id *)&v17[OBJC_IVAR___FIPauseRingsCoordinator_healthStore], sel_executeQuery_);
  }
  return result;
}

void sub_21C776B10(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_21C7817F0();
  uint64_t v5 = *(v4 - 1);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_21C781730();
  uint64_t v9 = *(v8 - 1);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (uint64_t)&v58 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v65 = (uint64_t)&v58 - v19;
  if (!a2)
  {
    if (a1)
    {
      unint64_t v20 = sub_21C77A830(a1);
      if (v20)
      {
        unint64_t v21 = v20;
        uint64_t v22 = v20 & 0xFFFFFFFFFFFFFF8;
        unint64_t v23 = v20 >> 62;
        if (v20 >> 62)
        {
          while (2)
          {
            unint64_t v63 = v23;
            uint64_t v24 = sub_21C781B30();
            unint64_t v23 = v63;
            if (v24)
            {
LABEL_6:
              BOOL v25 = __OFSUB__(v24, 1);
              unint64_t v26 = v24 - 1;
              if (v25) {
                goto LABEL_62;
              }
              unint64_t v63 = v23;
              unint64_t v64 = v21 & 0xC000000000000001;
              uint64_t v62 = v22;
              if ((v21 & 0xC000000000000001) == 0)
              {
                if ((v26 & 0x8000000000000000) != 0)
                {
                  __break(1u);
                }
                else if (v26 < *(void *)(v22 + 16))
                {
                  id v27 = *(id *)(v21 + 8 * v26 + 32);
                  goto LABEL_11;
                }
                __break(1u);
                goto LABEL_66;
              }
LABEL_63:
              id v27 = (id)MEMORY[0x21D4AF560](v26, v21);
LABEL_11:
              uint64_t v28 = v27;
              id v59 = objc_msgSend(v27, sel_endDateIndex);
              id v61 = v28;
              id v60 = objc_msgSend(v28, sel_startDateIndex);
              sub_21C781720();
              uint64_t v29 = (void *)sub_21C7816E0();
              (*(void (**)(char *, void *))(v9 + 8))(v11, v8);
              id v30 = objc_msgSend(self, sel_hk_gregorianCalendar);
              sub_21C781790();

              id v31 = (void *)sub_21C781770();
              (*(void (**)(char *, void *))(v5 + 8))(v7, v4);
              id v32 = (id)_HKActivityCacheDateComponentsFromDate();

              if (v32)
              {
                sub_21C781670();

                uint64_t v33 = sub_21C7816C0();
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v18, 0, 1, v33);
              }
              else
              {
                uint64_t v33 = sub_21C7816C0();
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v18, 1, 1, v33);
              }
              uint64_t v34 = v65;
              uint64_t v9 = v66;
              uint64_t v22 = v64;
              sub_21C77C3FC(v18, v65);
              sub_21C77C464(v34, (uint64_t)v15);
              sub_21C7816C0();
              uint64_t v35 = *(void *)(v33 - 8);
              uint64_t v36 = 0;
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v15, 1, v33) != 1)
              {
                uint64_t v36 = (void *)sub_21C781660();
                (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v33);
              }
              uint64_t v5 = _HKCacheIndexFromDateComponents();

              if (!v63)
              {
                uint64_t v15 = *(char **)(v62 + 16);
                swift_bridgeObjectRetain();
                if (v15) {
                  goto LABEL_18;
                }
                goto LABEL_67;
              }
LABEL_66:
              swift_bridgeObjectRetain();
              uint64_t v15 = (char *)sub_21C781B30();
              if (v15)
              {
LABEL_18:
                uint64_t v18 = 0;
                uint64_t v7 = 0;
                uint64_t v8 = 0;
                uint64_t v62 = v5;
                unint64_t v63 = v21 + 32;
                uint64_t v4 = (void *)MEMORY[0x263F8EE78];
                uint64_t v5 = 1;
                while (1)
                {
                  if (v22) {
                    id v37 = (char *)MEMORY[0x21D4AF560](v18, v21);
                  }
                  else {
                    id v37 = (char *)*(id *)(v63 + 8 * v18);
                  }
                  uint64_t v11 = v37;
                  BOOL v25 = __OFADD__(v18++, 1);
                  if (v25) {
                    goto LABEL_53;
                  }
                  if (v5)
                  {
                    uint64_t v7 = (char *)objc_msgSend(v37, sel_startDateIndex);
                    uint64_t v8 = objc_msgSend(v11, sel_endDateIndex);

                    if ((uint64_t)v8 < (uint64_t)v7) {
                      goto LABEL_61;
                    }
                    if ((char *)v18 == v15) {
                      goto LABEL_48;
                    }
                    if (v22) {
                      id v38 = (char *)MEMORY[0x21D4AF560](v18, v21);
                    }
                    else {
                      id v38 = (char *)*(id *)(v63 + 8 * v18);
                    }
                    uint64_t v11 = v38;
                    BOOL v25 = __OFADD__(v18++, 1);
                    if (v25) {
                      goto LABEL_53;
                    }
                  }
                  if ((uint64_t)v8 >= (uint64_t)objc_msgSend(v11, sel_startDateIndex)) {
                    break;
                  }
LABEL_42:
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                    uint64_t v4 = sub_21C77D49C(0, v4[2] + 1, 1, v4);
                  }
                  uint64_t v5 = v4[2];
                  unint64_t v40 = v4[3];
                  if (v5 >= v40 >> 1) {
                    uint64_t v4 = sub_21C77D49C((void *)(v40 > 1), v5 + 1, 1, v4);
                  }
                  void v4[2] = v5 + 1;
                  uint64_t v41 = &v4[2 * v5];
                  v41[4] = v7;
                  v41[5] = v8;
                  uint64_t v7 = (char *)objc_msgSend(v11, sel_startDateIndex);
                  uint64_t v8 = objc_msgSend(v11, sel_endDateIndex);

                  if ((uint64_t)v8 < (uint64_t)v7)
                  {
                    __break(1u);
LABEL_61:
                    __break(1u);
LABEL_62:
                    __break(1u);
                    goto LABEL_63;
                  }
                  uint64_t v5 = 0;
                  uint64_t v22 = v64;
                  if ((char *)v18 == v15) {
                    goto LABEL_48;
                  }
                }
                uint64_t v8 = objc_msgSend(v11, sel_endDateIndex);

                if ((uint64_t)v8 < (uint64_t)v7)
                {
LABEL_54:
                  __break(1u);
                  continue;
                }
                if ((char *)v18 != v15)
                {
                  while (1)
                  {
                    uint64_t v39 = v22 ? (char *)MEMORY[0x21D4AF560](v18, v21) : (char *)*(id *)(v21 + 8 * v18 + 32);
                    uint64_t v11 = v39;
                    uint64_t v5 = v18 + 1;
                    if (__OFADD__(v18, 1)) {
                      break;
                    }
                    if ((uint64_t)v8 < (uint64_t)objc_msgSend(v39, sel_startDateIndex))
                    {
                      ++v18;
                      goto LABEL_42;
                    }
                    uint64_t v8 = objc_msgSend(v11, sel_endDateIndex);

                    if ((uint64_t)v8 < (uint64_t)v7) {
                      goto LABEL_54;
                    }
                    ++v18;
                    if ((char *)v5 == v15) {
                      goto LABEL_48;
                    }
                  }
LABEL_53:
                  __break(1u);
                  goto LABEL_54;
                }
LABEL_48:
                swift_bridgeObjectRelease();
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v4 = sub_21C77D49C(0, v4[2] + 1, 1, v4);
                }
                unint64_t v43 = v4[2];
                unint64_t v42 = v4[3];
                if (v43 >= v42 >> 1) {
                  uint64_t v4 = sub_21C77D49C((void *)(v42 > 1), v43 + 1, 1, v4);
                }
                void v4[2] = v43 + 1;
                uint64_t v44 = &v4[2 * v43];
                v44[4] = v7;
                v44[5] = v8;
                uint64_t v5 = v62;
                goto LABEL_68;
              }
LABEL_67:
              swift_bridgeObjectRelease();
              uint64_t v4 = (void *)MEMORY[0x263F8EE78];
LABEL_68:
              swift_bridgeObjectRelease();
              *(void *)(v9 + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals) = v4;
              swift_bridgeObjectRelease();
              os_log_type_t v47 = sub_21C7819B0();
              uint64_t v48 = (void *)*MEMORY[0x263F098C8];
              if (v5 < (uint64_t)v60 || v5 >= (uint64_t)v59)
              {
                id v56 = v48;
                sub_21C781820();

                id v51 = 0;
                id v50 = v61;
              }
              else
              {
                os_log_type_t v49 = v47;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v47))
                {
                  id v50 = v61;
                  id v51 = v61;
                  uint64_t v52 = v48;
                  uint64_t v53 = (uint8_t *)swift_slowAlloc();
                  uint64_t v54 = (void *)swift_slowAlloc();
                  *(_DWORD *)uint64_t v53 = 138412290;
                  id v67 = v51;
                  id v55 = v51;
                  sub_21C781A20();
                  *uint64_t v54 = v51;

                  _os_log_impl(&dword_21C74B000, v52, v49, "[PauseRingsCoordinator] State = paused: %@", v53, 0xCu);
                  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F180);
                  swift_arrayDestroy();
                  MEMORY[0x21D4B0100](v54, -1, -1);
                  MEMORY[0x21D4B0100](v53, -1, -1);
                }
                else
                {
                  id v50 = v61;
                  id v51 = v61;
                }
                id v57 = v50;
              }
              sub_21C7756C0(v51);

              sub_21C773FFC(v65, &qword_26AB0A508);
              return;
            }
            break;
          }
        }
        else
        {
          uint64_t v24 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v24) {
            goto LABEL_6;
          }
        }
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_21C7819B0();
  id v45 = (id)*MEMORY[0x263F098C8];
  uint64_t v46 = MEMORY[0x263F8EE78];
  sub_21C781820();

  *(void *)(v66 + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals) = v46;
  swift_bridgeObjectRelease();
  sub_21C7756C0(0);
}

uint64_t sub_21C7774D0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_21C777514()
{
  return objc_msgSend(v0, sel_isPausedForActivitySummary_, 0);
}

void sub_21C77754C(void *a1)
{
  id v40 = a1;
  uint64_t v1 = sub_21C7817F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21C781730();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v40 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v42 = (uint64_t)&v40 - v16;
  id v17 = objc_msgSend(self, sel_sharedBehavior);
  if (!v17) {
    goto LABEL_25;
  }
  uint64_t v18 = v17;
  id v19 = objc_msgSend(v17, sel_features);

  if (!v19)
  {
LABEL_26:
    __break(1u);
    return;
  }
  unsigned int v20 = objc_msgSend(v19, sel_pauseRings);

  if (!v20) {
    return;
  }
  sub_21C781720();
  unint64_t v21 = (void *)sub_21C7816E0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v22 = objc_msgSend(self, sel_hk_gregorianCalendar);
  sub_21C781790();

  unint64_t v23 = (void *)sub_21C781770();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v24 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v24)
  {
    sub_21C781670();

    uint64_t v25 = sub_21C7816C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 0, 1, v25);
  }
  else
  {
    uint64_t v25 = sub_21C7816C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 1, 1, v25);
  }
  uint64_t v26 = v42;
  sub_21C77C3FC((uint64_t)v15, v42);
  sub_21C77C464(v26, (uint64_t)v12);
  sub_21C7816C0();
  uint64_t v27 = *(void *)(v25 - 8);
  uint64_t v28 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v12, 1, v25) != 1)
  {
    uint64_t v28 = (void *)sub_21C781660();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v25);
  }
  _HKCacheIndexFromDateComponents();

  unint64_t v44 = 2;
  uint64_t v29 = v41;
  id v30 = *(NSObject **)&v41[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = &v44;
  *(void *)(v31 + 24) = v29;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_21C77C4CC;
  *(void *)(v32 + 24) = v31;
  aBlock[4] = sub_21C77C4E0;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C777C14;
  aBlock[3] = &block_descriptor_9;
  uint64_t v33 = _Block_copy(aBlock);
  id v34 = v29;
  swift_retain();
  swift_release();
  dispatch_sync(v30, v33);
  _Block_release(v33);
  LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v33)
  {
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v35 = (id)v44;
  if (v44 >= 3)
  {
    id v37 = v40;
    if (!v40)
    {
      sub_21C773FFC(v26, &qword_26AB0A508);
      sub_21C77C508((id)v44);
      swift_release();
      return;
    }
    sub_21C77C518((id)v44);
    id v38 = v37;
    id v39 = objc_msgSend(v35, sel_startDateIndex);
    if ((uint64_t)objc_msgSend(v35, sel_endDateIndex) >= (uint64_t)v39)
    {
      objc_msgSend(v38, sel__activitySummaryIndex);
      objc_msgSend(v38, sel__activitySummaryIndex);
      objc_msgSend(v38, sel_paused);

      sub_21C77C508(v35);
      sub_21C773FFC(v42, &qword_26AB0A508);
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  if (v40)
  {
    id v36 = v40;
    if (objc_msgSend(v36, sel_paused))
    {
      objc_msgSend(v36, sel__activitySummaryIndex);

      sub_21C773FFC(v26, &qword_26AB0A508);
LABEL_22:
      sub_21C77C508((id)v44);
      swift_release();
      return;
    }
    sub_21C773FFC(v26, &qword_26AB0A508);
  }
  else
  {
    sub_21C773FFC(v26, &qword_26AB0A508);
  }
  sub_21C77C508((id)v44);
  swift_release();
}

uint64_t sub_21C777C14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_21C777C90(uint64_t a1)
{
  id v3 = objc_msgSend(self, sel_sharedBehavior);
  if (!v3) {
    goto LABEL_16;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_features);

  if (!v5)
  {
LABEL_17:
    __break(1u);
    return;
  }
  unsigned int v6 = objc_msgSend(v5, sel_pauseRings);

  if (!v6) {
    return;
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v7 = *(NSObject **)&v1[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = &v17;
  *(void *)(v8 + 24) = v1;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_21C77C570;
  *(void *)(v9 + 24) = v8;
  aBlock[4] = sub_21C77FF48;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C777C14;
  aBlock[3] = &block_descriptor_19;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(v17 + 16);
  if (v13)
  {
    uint64_t v14 = (void *)(v17 + 40);
    do
    {
      if (*(v14 - 1) <= a1 && *v14 > a1) {
        break;
      }
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_21C777EFC(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(self, sel_sharedBehavior);
  if (!v5) {
    goto LABEL_22;
  }
  unsigned int v6 = v5;
  id v7 = objc_msgSend(v5, sel_features);

  if (!v7)
  {
LABEL_23:
    __break(1u);
    return;
  }
  unsigned int v8 = objc_msgSend(v7, sel_pauseRings);

  if (!v8) {
    return;
  }
  uint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t v9 = *(NSObject **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &v23;
  *(void *)(v10 + 24) = v2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_21C77C570;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = sub_21C77FF48;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C777C14;
  aBlock[3] = &block_descriptor_29;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v9, v12);
  _Block_release(v12);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v15 = *(void *)(v23 + 16);
  if (v15)
  {
    uint64_t v16 = (uint64_t *)(v23 + 40);
    do
    {
      uint64_t v18 = *(v16 - 1);
      uint64_t v17 = *v16;
      if (v18 <= a1 && v17 > a1 && v18 <= a2 && v17 > a2) {
        break;
      }
      v16 += 2;
      --v15;
    }
    while (v15);
  }
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_21C778188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v27 = sub_21C781830();
  uint64_t v32 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  unsigned int v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21C781850();
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21C781730();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  id v13 = objc_msgSend(self, sel_sharedBehavior);
  if (!v13)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v14 = v13;
  id v15 = objc_msgSend(v13, sel_features);

  if (!v15)
  {
LABEL_7:
    __break(1u);
    return;
  }
  unsigned int v16 = objc_msgSend(v15, sel_pauseRings);

  if (v16)
  {
    uint64_t v26 = *(void *)&v3[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
    unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v18 = (char *)swift_allocObject();
    uint64_t v19 = v28;
    *((void *)v18 + 2) = v3;
    *((void *)v18 + 3) = v19;
    uint64_t v25 = v9;
    *((void *)v18 + 4) = v29;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v18[v17], (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    aBlock[4] = sub_21C77C6BC;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C7774CC;
    aBlock[3] = &block_descriptor_35;
    unsigned int v20 = _Block_copy(aBlock);
    unint64_t v21 = v3;
    sub_21C77CE18(v19);
    id v22 = v25;
    sub_21C781840();
    uint64_t v33 = MEMORY[0x263F8EE78];
    sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
    sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
    uint64_t v23 = v27;
    sub_21C781A50();
    MEMORY[0x21D4AF4C0](0, v22, v6, v20);
    _Block_release(v20);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v23);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v22, v31);
    swift_release();
  }
}

uint64_t sub_21C778590(void *a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
  uint64_t v25 = *(void **)(v2 + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals);
  swift_bridgeObjectRetain_n();
  sub_21C77D70C((uint64_t *)&v25);
  swift_bridgeObjectRelease();
  uint64_t v8 = v25;
  if (a2)
  {
    unint64_t v9 = v25[2];
    if (v9)
    {
      unint64_t v24 = v9 - 1;
      uint64_t v10 = &v25[2 * v9 - 2];
      uint64_t v11 = (char **)v10[4];
      id v3 = (char **)v10[5];
      id v12 = a2;
      id v13 = &selRef_fi_isAfterDate_;
      uint64_t v14 = (char **)objc_msgSend(v12, sel_startDateIndex);
      if ((uint64_t)v14 >= (uint64_t)v11 && (uint64_t)v14 < (uint64_t)v3)
      {
        if (v11 == objc_msgSend(v12, (SEL)&selRef_initWithDomain_ + 1))
        {
          sub_21C77A750(v24);

          if (!a1) {
            goto LABEL_19;
          }
LABEL_10:
          id v15 = a1;
          unsigned int v16 = (char **)objc_msgSend(v15, sel_startDateIndex);
          unint64_t v17 = (char **)objc_msgSend(v15, sel_endDateIndex);
          if ((uint64_t)v17 < (uint64_t)v16)
          {
            __break(1u);
          }
          else
          {
            id v3 = v17;
            a1 = v25;
            if (swift_isUniquelyReferenced_nonNull_native())
            {
LABEL_12:
              unint64_t v19 = a1[2];
              unint64_t v18 = a1[3];
              if (v19 >= v18 >> 1) {
                a1 = sub_21C77D49C((void *)(v18 > 1), v19 + 1, 1, a1);
              }
              a1[2] = v19 + 1;
              unsigned int v20 = &a1[2 * v19];
              v20[4] = v16;
              v20[5] = v3;

              goto LABEL_20;
            }
          }
          a1 = sub_21C77D49C(0, a1[2] + 1, 1, a1);
          goto LABEL_12;
        }
        unint64_t v21 = (char **)objc_msgSend(v12, (SEL)&selRef_initWithDomain_ + 1);
        if ((uint64_t)v21 < (uint64_t)v11)
        {
          __break(1u);
        }
        else
        {
          id v13 = v21;
          if (swift_isUniquelyReferenced_nonNull_native()) {
            goto LABEL_17;
          }
        }
        uint64_t v8 = sub_21C77D778(v8);
LABEL_17:
        if (v9 > v8[2])
        {
          __break(1u);
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
        id v22 = &v8[2 * v24];
        v22[4] = v11;
        v22[5] = v13;

        uint64_t v25 = v8;
        if (!a1) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
    }
  }
  if (a1) {
    goto LABEL_10;
  }
LABEL_19:
  a1 = v25;
LABEL_20:
  *(void *)(v4 + v7) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C7787CC(char a1, void *a2, void *a3, char a4, char a5)
{
  uint64_t v11 = sub_21C781830();
  uint64_t v24 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_21C781850();
  uint64_t v14 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  unsigned int v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = FIIsFitnessTrackingEnabled();
  if (result)
  {
    uint64_t v22 = *(void *)(v5 + OBJC_IVAR___FIPauseRingsCoordinator_metricQueue);
    uint64_t v18 = swift_allocObject();
    *(unsigned char *)(v18 + 16) = a1;
    *(void *)(v18 + 24) = a2;
    *(void *)(v18 + 32) = a3;
    *(unsigned char *)(v18 + 40) = a4 & 1;
    *(unsigned char *)(v18 + 41) = a5 & 1;
    aBlock[4] = sub_21C77F8C8;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C7774CC;
    aBlock[3] = &block_descriptor_112;
    unint64_t v19 = _Block_copy(aBlock);
    id v20 = a3;
    id v21 = a2;
    sub_21C781840();
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
    sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
    sub_21C781A50();
    MEMORY[0x21D4AF4C0](0, v16, v13, v19);
    _Block_release(v19);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v23);
    return swift_release();
  }
  return result;
}

uint64_t sub_21C778AB0()
{
  uint64_t v1 = sub_21C781830();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21C781850();
  uint64_t v5 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = *(void *)(v0 + OBJC_IVAR___FIPauseRingsCoordinator_syncQueue);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_21C77F688;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C7774CC;
  aBlock[3] = &block_descriptor_85;
  unint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_21C781840();
  uint64_t v13 = MEMORY[0x263F8EE78];
  sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
  sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
  sub_21C781A50();
  MEMORY[0x21D4AF4C0](0, v7, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v12);
  swift_release();
  return swift_release();
}

uint64_t sub_21C778D7C(char a1, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v22[0] = a6;
  uint64_t v10 = sub_21C781830();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_21C781850();
  uint64_t v14 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  unsigned int v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = *(void *)&a3[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  *(void *)(v17 + 32) = a3;
  aBlock[4] = a5;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C7774CC;
  aBlock[3] = v22[0];
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = a2;
  id v20 = a3;
  sub_21C781840();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
  sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
  sub_21C781A50();
  MEMORY[0x21D4AF4C0](0, v16, v13, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v23);
  return swift_release();
}

void sub_21C779034(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_21C7791FC(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_21C7816D0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void sub_21C77926C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_21C781830();
  v19[0] = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21C781850();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(self, sel_sharedBehavior);
  if (!v12)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v13 = v12;
  id v14 = objc_msgSend(v12, sel_features);

  if (!v14)
  {
LABEL_7:
    __break(1u);
    return;
  }
  unsigned int v15 = objc_msgSend(v14, sel_pauseRings);

  if (v15)
  {
    unsigned int v16 = (void *)swift_allocObject();
    v16[2] = v2;
    v16[3] = a1;
    v16[4] = a2;
    aBlock[4] = sub_21C77CEC0;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C7774CC;
    aBlock[3] = &block_descriptor_41;
    uint64_t v17 = _Block_copy(aBlock);
    id v18 = v2;
    sub_21C77CE18(a1);
    sub_21C781840();
    v19[1] = MEMORY[0x263F8EE78];
    sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
    sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
    sub_21C781A50();
    MEMORY[0x21D4AF4C0](0, v11, v7, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v19[0] + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
  }
}

uint64_t sub_21C779778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21C7817F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v53 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4A8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21C7816C0();
  uint64_t v52 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  unsigned int v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v51 = (char *)&v47 - v16;
  id v17 = objc_msgSend(self, sel_sharedBehavior);
  if (!v17)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v18 = v17;
  id v19 = objc_msgSend(v17, sel_features);

  if (!v19)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unsigned int v20 = objc_msgSend(v19, sel_pauseRings);

  if (v20)
  {
    uint64_t v48 = v4;
    uint64_t v50 = a1;
    unint64_t v55 = 2;
    id v21 = *(NSObject **)&v1[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = &v55;
    *(void *)(v22 + 24) = v1;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_21C77C4CC;
    *(void *)(v23 + 24) = v22;
    uint64_t v49 = v22;
    aBlock[4] = sub_21C77FF48;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C777C14;
    aBlock[3] = &block_descriptor_51;
    uint64_t v24 = _Block_copy(aBlock);
    uint64_t v25 = v1;
    swift_retain();
    swift_release();
    dispatch_sync(v21, v24);
    _Block_release(v24);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      id v27 = (id)v55;
      if (v55 < 3)
      {
        uint64_t v28 = sub_21C781730();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v50, 1, 1, v28);
        id v29 = v27;
LABEL_14:
        sub_21C77C508(v29);
        return swift_release();
      }
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = v3;
      sub_21C77C528((id)v55);
      sub_21C77C528(v27);
      objc_msgSend(v27, sel_endDateIndex);
      id v35 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
      if (v35)
      {
        id v36 = v35;
        sub_21C781670();

        uint64_t v37 = v52;
        id v38 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
        v38(v11, v15, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v11, 0, 1, v12);
        int v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v11, 1, v12);
        uint64_t v40 = v48;
        if (v39 != 1)
        {
          uint64_t v41 = v51;
          v38(v51, v11, v12);
          id v42 = objc_msgSend(self, sel_hk_gregorianCalendar);
          unint64_t v43 = v53;
          sub_21C781790();

          sub_21C7817A0();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v34);
          uint64_t v44 = sub_21C781730();
          uint64_t v45 = *(void *)(v44 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v33, 1, v44) != 1)
          {
            (*(void (**)(char *, uint64_t))(v37 + 8))(v41, v12);
            sub_21C77C508(v27);
            sub_21C77C508(v27);
            uint64_t v46 = v50;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v50, v33, v44);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v46, 0, 1, v44);
            id v29 = (id)v55;
            goto LABEL_14;
          }
          sub_21C773FFC(v33, &qword_26AB0A4A8);
          goto LABEL_21;
        }
LABEL_19:
        sub_21C773FFC((uint64_t)v11, &qword_26AB0A508);
LABEL_21:
        uint64_t result = sub_21C781B10();
        __break(1u);
        return result;
      }
LABEL_18:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v11, 1, 1, v12);
      goto LABEL_19;
    }
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v30 = sub_21C781730();
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56);
  return v31(a1, 1, 1, v30);
}

uint64_t sub_21C779EB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4A8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21C781730();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v20 - v10;
  id v12 = objc_msgSend(v1, sel_resumeDate);
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  uint64_t v13 = v12;
  sub_21C781700();

  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_21C773FFC((uint64_t)v4, &qword_26AB0A4A8);
    return 0;
  }
  v14(v11, v4, v5);
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v15, sel_setDateStyle_, 1);
  objc_msgSend(v15, sel_setTimeStyle_, 0);
  uint64_t v16 = (void *)sub_21C7816E0();
  id v17 = objc_msgSend(v15, sel_stringFromDate_, v16);

  uint64_t v18 = sub_21C7818B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v18;
}

uint64_t sub_21C77A1DC(unint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = sub_21C781830();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21C781850();
  uint64_t v24 = *(void *)(v10 - 8);
  uint64_t v25 = v10;
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v13 = sub_21C7819B0();
  uint64_t v14 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v13))
  {
    uint64_t v23 = v7;
    swift_bridgeObjectRetain_n();
    id v15 = v14;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 134217984;
    if (a1)
    {
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v17 = sub_21C781B30();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v17 = 0;
    }
    aBlock[0] = v17;
    sub_21C781A20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C74B000, v15, v13, "[PauseRingsCoordinator] Received refresh query results (%ld count)...", v16, 0xCu);
    MEMORY[0x21D4B0100](v16, -1, -1);

    uint64_t v7 = v23;
  }
  uint64_t v18 = (void *)swift_allocObject();
  void v18[2] = a3;
  v18[3] = a1;
  v18[4] = a2;
  aBlock[4] = sub_21C77F7B0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C7774CC;
  aBlock[3] = &block_descriptor_100;
  id v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v20 = a3;
  id v21 = a2;
  sub_21C781840();
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_21C77FDB4(&qword_26AB0A510, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A518);
  sub_21C77CE28(&qword_26AB0A520, &qword_26AB0A518);
  sub_21C781A50();
  MEMORY[0x21D4AF4C0](0, v12, v9, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  return swift_release();
}

void sub_21C77A5A4(char a1, void *a2)
{
  if ((a1 & 1) == 0)
  {
    os_log_type_t v3 = sub_21C7819B0();
    uint64_t v4 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v3))
    {
      id v5 = a2;
      id v6 = a2;
      uint64_t v7 = v4;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      if (a2)
      {
        id v10 = a2;
        uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
        sub_21C781A20();
      }
      else
      {
        sub_21C781A20();
        uint64_t v11 = 0;
      }
      *uint64_t v9 = v11;

      _os_log_impl(&dword_21C74B000, v7, v3, "[PauseRingsCoordinator] Failed to nano sync after updating pause samples: %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F180);
      swift_arrayDestroy();
      MEMORY[0x21D4B0100](v9, -1, -1);
      MEMORY[0x21D4B0100](v8, -1, -1);
    }
  }
}

uint64_t sub_21C77A750(unint64_t a1)
{
  os_log_type_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    os_log_type_t v3 = sub_21C77D778(v3);
  }
  unint64_t v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      uint64_t v7 = &v3[2 * a1];
      uint64_t v8 = v7[4];
      memmove(v7 + 4, v7 + 6, 16 * v6);
      v3[2] = v5;
      void *v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_21C781B50();
  __break(1u);
  return result;
}

uint64_t sub_21C77A830(unint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v12 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  sub_21C781AD0();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        MEMORY[0x21D4AF560](i, v1);
        uint64_t v4 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        self;
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        sub_21C781AB0();
        sub_21C781AE0();
        sub_21C781AF0();
        sub_21C781AC0();
        if (v4 == v2) {
          return v12;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = v1 + 32;
      while (1)
      {
        uint64_t v7 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          break;
        }
        uint64_t v8 = *(void **)(v6 + 8 * v5);
        self;
        uint64_t v9 = swift_dynamicCastObjCClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v1 = v9;
        id v10 = v8;
        sub_21C781AB0();
        sub_21C781AE0();
        sub_21C781AF0();
        sub_21C781AC0();
        ++v5;
        if (v7 == v2) {
          return v12;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_21C781B30();
    swift_bridgeObjectRelease();
    sub_21C781AD0();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_21C781B30();
    swift_bridgeObjectRelease();
  }
  return v12;
}

uint64_t sub_21C77AA18(int a1)
{
  LODWORD(v63) = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v67 = (uint64_t)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v64 = (char *)&v58 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v61 = (char *)&v58 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v69 = (uint64_t)&v58 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v60 = (char *)&v58 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v68 = (uint64_t)&v58 - v12;
  uint64_t v13 = sub_21C7817E0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4A8);
  MEMORY[0x270FA5388](v17 - 8);
  id v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_21C7817F0();
  uint64_t v65 = *(void *)(v20 - 8);
  uint64_t v66 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_21C781730();
  uint64_t v59 = *(void *)(v23 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  id v29 = (char *)&v58 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v58 - v30;
  sub_21C781720();
  id v32 = objc_msgSend(self, sel_hk_gregorianCalendar);
  sub_21C781790();

  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F07870], v13);
  uint64_t v62 = v22;
  uint64_t v33 = v23;
  uint64_t v34 = v59;
  sub_21C7817C0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v26, v31, v33);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v19, 1, v33) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v29, v26, v33);
    sub_21C773FFC((uint64_t)v19, &qword_26AB0A4A8);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v26, v33);
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v29, v19, v33);
  }
  unint64_t v63 = v29;
  id v35 = (void *)sub_21C7816E0();
  id v36 = v62;
  uint64_t v37 = (void *)sub_21C781770();
  id v38 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v38)
  {
    uint64_t v39 = (uint64_t)v60;
    sub_21C781670();

    uint64_t v40 = sub_21C7816C0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
  }
  else
  {
    uint64_t v41 = sub_21C7816C0();
    uint64_t v39 = (uint64_t)v60;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v60, 1, 1, v41);
  }
  uint64_t v42 = (uint64_t)v61;
  sub_21C77C3FC(v39, v68);
  unint64_t v43 = (void *)sub_21C7816E0();
  uint64_t v44 = (void *)sub_21C781770();
  id v45 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v45)
  {
    sub_21C781670();

    uint64_t v46 = sub_21C7816C0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v42, 0, 1, v46);
  }
  else
  {
    uint64_t v46 = sub_21C7816C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v42, 1, 1, v46);
  }
  uint64_t v47 = (uint64_t)v64;
  sub_21C77C3FC(v42, v69);
  sub_21C77C464(v68, v47);
  sub_21C7816C0();
  uint64_t v48 = *(void *)(v46 - 8);
  uint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  uint64_t v50 = 0;
  if (v49(v47, 1, v46) != 1)
  {
    uint64_t v50 = (void *)sub_21C781660();
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v46);
  }
  uint64_t v51 = _HKCacheIndexFromDateComponents();

  uint64_t v52 = v67;
  sub_21C77C464(v69, v67);
  if (v49(v52, 1, v46) == 1)
  {
    uint64_t v53 = 0;
  }
  else
  {
    uint64_t v54 = v52;
    uint64_t v53 = (void *)sub_21C781660();
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v54, v46);
  }
  uint64_t v55 = _HKCacheIndexFromDateComponents();

  sub_21C773FFC(v69, &qword_26AB0A508);
  sub_21C773FFC(v68, &qword_26AB0A508);
  id v56 = *(void (**)(char *, uint64_t))(v34 + 8);
  v56(v63, v33);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v36, v66);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v56)(v31, v33);
  if (v55 >= v51) {
    return v51;
  }
  __break(1u);
  return result;
}

id sub_21C77B1F0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v6 = (char *)&v26 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v28 = sub_21C7817F0();
  uint64_t v9 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_21C781730();
  uint64_t v12 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C781720();
  id v15 = objc_msgSend(self, sel_hk_gregorianCalendar);
  sub_21C781790();

  uint64_t v16 = (void *)sub_21C7816E0();
  uint64_t v17 = (void *)sub_21C781770();
  id v18 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v18)
  {
    sub_21C781670();

    uint64_t v19 = sub_21C7816C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 0, 1, v19);
  }
  else
  {
    uint64_t v19 = sub_21C7816C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
  }
  sub_21C77C3FC((uint64_t)v6, (uint64_t)v8);
  sub_21C77C464((uint64_t)v8, (uint64_t)v3);
  sub_21C7816C0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v3, 1, v19) != 1)
  {
    uint64_t v21 = (void *)sub_21C781660();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v3, v19);
  }
  uint64_t v22 = _HKCacheIndexFromDateComponents();

  id v23 = v29;
  id v24 = objc_msgSend(v29, sel_endDateIndex);
  id result = objc_msgSend(v23, sel_startDateIndex);
  if (__OFSUB__(v24, result))
  {
    __break(1u);
  }
  else
  {
    id result = objc_msgSend(v23, sel_startDateIndex);
    if (!__OFSUB__(v22, result))
    {
      sub_21C773FFC((uint64_t)v8, &qword_26AB0A508);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v28);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v27);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21C77B5F4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4A8);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v69 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v71 = (char *)&v64 - v3;
  uint64_t v4 = sub_21C781730();
  uint64_t v73 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v70 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v64 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v74 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v64 - v12;
  uint64_t v14 = sub_21C7816C0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v72 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v64 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v75 = (char *)&v64 - v21;
  uint64_t v22 = sub_21C7817F0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v68 = (char *)&v64 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v64 - v26;
  id v28 = objc_msgSend(self, sel_hk_gregorianCalendar);
  v79 = v27;
  id v29 = v76;
  sub_21C781790();

  objc_msgSend(v29, sel_startDateIndex);
  id v30 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  uint64_t v77 = v23;
  uint64_t v78 = v22;
  if (!v30)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    goto LABEL_8;
  }
  uint64_t v31 = v30;
  uint64_t v65 = v4;
  uint64_t v66 = v8;
  sub_21C781670();

  id v32 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v32(v13, v20, v14);
  uint64_t v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v67(v13, 0, 1, v14);
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v33(v13, 1, v14) == 1)
  {
LABEL_8:
    (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v78);
    uint64_t v49 = &qword_26AB0A508;
LABEL_9:
    uint64_t v50 = (uint64_t)v13;
    goto LABEL_12;
  }
  unint64_t v64 = v20;
  uint64_t v34 = v13;
  id v35 = v32;
  v32(v75, v34, v14);
  objc_msgSend(v29, sel_endDateIndex);
  id v36 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  if (!v36)
  {
    uint64_t v40 = v74;
    v67(v74, 1, 1, v14);
    goto LABEL_11;
  }
  uint64_t v37 = v36;
  id v38 = v64;
  sub_21C781670();

  uint64_t v39 = v38;
  uint64_t v40 = v74;
  v32(v74, v39, v14);
  v67(v40, 0, 1, v14);
  if (v33(v40, 1, v14) == 1)
  {
LABEL_11:
    (*(void (**)(char *, uint64_t))(v15 + 8))(v75, v14);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v78);
    uint64_t v49 = &qword_26AB0A508;
    uint64_t v50 = (uint64_t)v40;
    goto LABEL_12;
  }
  uint64_t v41 = v72;
  v35(v72, v40, v14);
  uint64_t v42 = v71;
  unint64_t v43 = v75;
  uint64_t v44 = v79;
  sub_21C7817A0();
  uint64_t v45 = v73;
  uint64_t v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48);
  uint64_t v47 = v65;
  if (v46(v42, 1, v65) != 1)
  {
    uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
    v53(v66, v42, v47);
    uint64_t v13 = v69;
    sub_21C7817A0();
    if (v46(v13, 1, v47) != 1)
    {
      v53(v70, v13, v47);
      uint64_t v55 = v68;
      sub_21C7817D0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F098);
      uint64_t v56 = sub_21C7817E0();
      uint64_t v57 = *(void *)(v56 - 8);
      unint64_t v58 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
      uint64_t v59 = swift_allocObject();
      *(_OWORD *)(v59 + 16) = xmmword_21C7843D0;
      (*(void (**)(unint64_t, void, uint64_t))(v57 + 104))(v59 + v58, *MEMORY[0x263F07870], v56);
      sub_21C7732AC(v59);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      id v60 = v64;
      sub_21C781750();
      swift_bridgeObjectRelease();
      uint64_t v61 = v78;
      uint64_t v77 = *(void *)(v77 + 8);
      ((void (*)(char *, uint64_t))v77)(v55, v78);
      uint64_t v51 = sub_21C781680();
      uint64_t v62 = *(void (**)(char *, uint64_t))(v15 + 8);
      v62(v60, v14);
      unint64_t v63 = *(void (**)(char *, uint64_t))(v73 + 8);
      v63(v70, v47);
      v63(v66, v47);
      v62(v72, v14);
      v62(v75, v14);
      ((void (*)(char *, uint64_t))v77)(v79, v61);
      return v51;
    }
    (*(void (**)(char *, uint64_t))(v73 + 8))(v66, v47);
    uint64_t v54 = *(void (**)(char *, uint64_t))(v15 + 8);
    v54(v72, v14);
    v54(v75, v14);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v44, v78);
    uint64_t v49 = &qword_26AB0A4A8;
    goto LABEL_9;
  }
  uint64_t v48 = *(void (**)(char *, uint64_t))(v15 + 8);
  v48(v41, v14);
  v48(v43, v14);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v44, v78);
  uint64_t v49 = &qword_26AB0A4A8;
  uint64_t v50 = (uint64_t)v42;
LABEL_12:
  sub_21C773FFC(v50, v49);
  return 0;
}

unint64_t sub_21C77BEC0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F2C8);
  uint64_t v2 = (void *)sub_21C781B40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_21C77E2A4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

void sub_21C77BFDC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F2C0);
    uint64_t v2 = (void *)sub_21C781B40();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_21C77FAF0();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_21C77E2A4(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      uint64_t v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      uint64_t *v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    uint64_t v23 = (uint64_t *)(v2[6] + 16 * v20);
    *uint64_t v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

void __swiftcall FIPauseRingsCoordinator.init()(FIPauseRingsCoordinator *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void FIPauseRingsCoordinator.init()()
{
}

void sub_21C77C318(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  uint64_t v6 = *(void (**)(id, uint64_t (*)(), uint64_t, void *))(a1 + 32);
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_retain();
  id v10 = a2;
  id v9 = a4;
  v6(v10, sub_21C77FF34, v8, a4);
  swift_release();
  swift_release();
}

void sub_21C77C3EC(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_21C77C3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C77C464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C77C4D0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21C77C4E0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_21C77C508(id a1)
{
  if (a1 != (id)2) {
    sub_21C77C3EC(a1);
  }
}

id sub_21C77C518(id result)
{
  if (result != (id)2) {
    return sub_21C77C528(result);
  }
  return result;
}

id sub_21C77C528(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_21C77C538()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21C77C574()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21C77C584()
{
  **(void **)(v0 + 16) = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C77C5D0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21C77C5E0()
{
  uint64_t v1 = sub_21C781730();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);

  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  uint64_t v5 = v3 | 7;
  uint64_t v6 = (v3 + 40) & ~v3;
  uint64_t v7 = v6 + v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v6, v1);
  return MEMORY[0x270FA0238](v0, v7, v5);
}

void sub_21C77C6BC()
{
  uint64_t v1 = *(void *)(sub_21C781730() - 8);
  uint64_t v2 = *(char **)(v0 + 16);
  uint64_t v3 = *(void (**)(void, void))(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  uint64_t v5 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_state];
  if (!v5)
  {
    uint64_t v8 = (void *)sub_21C77E500(v4);
    id v9 = v8;
    sub_21C778590(v8, 0);
    sub_21C7756C0(v8);
    id v10 = v9;
    uint64_t v11 = sub_21C77AA18(0);
    uint64_t v13 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
    uint64_t v14 = *(void *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals];
    uint64_t v15 = *(void *)(v14 + 16);
    if (v15)
    {
      uint64_t v16 = (uint64_t *)(v14 + 40);
      uint64_t v17 = v15 - 1;
      do
      {
        uint64_t v19 = *(v16 - 1);
        uint64_t v18 = *v16;
        BOOL v23 = v19 >= v12 || v11 >= v18 || v19 == v18 || v11 == v12;
        BOOL v24 = v17-- != 0;
        char v25 = v24;
        if (!v23) {
          break;
        }
        v16 += 2;
      }
      while ((v25 & 1) != 0);
      char v26 = !v23;
    }
    else
    {
      char v26 = 0;
    }
    uint64_t v32 = sub_21C77AA18(1);
    uint64_t v34 = *(void *)&v2[v13];
    uint64_t v35 = *(void *)(v34 + 16);
    if (v35)
    {
      id v36 = (uint64_t *)(v34 + 40);
      uint64_t v37 = v35 - 1;
      do
      {
        uint64_t v39 = *(v36 - 1);
        uint64_t v38 = *v36;
        BOOL v43 = v39 >= v33 || v32 >= v38 || v39 == v38 || v32 == v33;
        BOOL v24 = v37-- != 0;
        char v44 = v24;
        if (!v43) {
          break;
        }
        v36 += 2;
      }
      while ((v44 & 1) != 0);
      char v45 = !v43;
    }
    else
    {
      char v45 = 0;
    }
    sub_21C7787CC(0, 0, v8, v26, v45);

    uint64_t v67 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    uint64_t v68 = swift_allocObject();
    *(void *)(v68 + 16) = v2;
    v96 = sub_21C77FB40;
    uint64_t v97 = v68;
    unint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v93 = 1107296256;
    v94 = sub_21C778D78;
    uint64_t v95 = &block_descriptor_124;
    uint64_t v69 = _Block_copy(&aBlock);
    uint64_t v70 = v2;
    swift_release();
    objc_msgSend(v67, sel_saveObject_withCompletion_, v10, v69);
    _Block_release(v69);

    if (!v3) {
      goto LABEL_106;
    }
    goto LABEL_105;
  }
  if (v5 != (void *)1)
  {
    v91 = v3;
    id v27 = v5;
    uint64_t v28 = (void *)sub_21C77EC20(v27);
    id v29 = (void *)sub_21C77E500(v4);
    id v30 = v29;
    unint64_t aBlock = MEMORY[0x263F8EE78];
    if (v28)
    {
      id v31 = v28;
      MEMORY[0x21D4AF3D0](v30);
      if (*(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_21C781940();
      }
      sub_21C781960();
      sub_21C781930();
    }
    else
    {
      uint64_t v46 = v29;
    }
    uint64_t v47 = v30;
    MEMORY[0x21D4AF3D0]();
    if (*(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_21C781940();
    }
    sub_21C781960();
    sub_21C781930();
    unint64_t v48 = aBlock;

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB0A530);
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_21C7843C0;
    *(void *)(v49 + 32) = v27;
    unint64_t aBlock = v49;
    sub_21C781930();
    sub_21C77C528(v5);
    sub_21C77C528(v5);
    uint64_t v50 = v47;
    sub_21C778590(v30, v5);
    sub_21C77C3EC(v5);
    sub_21C7756C0(v30);
    sub_21C77C528(v5);
    uint64_t v51 = v50;
    uint64_t v52 = sub_21C77AA18(0);
    uint64_t v54 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
    uint64_t v55 = *(void *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals];
    uint64_t v56 = *(void *)(v55 + 16);
    if (v56)
    {
      uint64_t v57 = (uint64_t *)(v55 + 40);
      uint64_t v58 = v56 - 1;
      do
      {
        uint64_t v60 = *(v57 - 1);
        uint64_t v59 = *v57;
        BOOL v64 = v60 >= v53 || v52 >= v59 || v60 == v59 || v52 == v53;
        BOOL v24 = v58-- != 0;
        char v65 = v24;
        if (!v64) {
          break;
        }
        v57 += 2;
      }
      while ((v65 & 1) != 0);
      char v66 = !v64;
    }
    else
    {
      char v66 = 0;
    }
    uint64_t v71 = sub_21C77AA18(1);
    uint64_t v73 = *(void *)&v2[v54];
    uint64_t v74 = *(void *)(v73 + 16);
    if (v74)
    {
      uint64_t v75 = (uint64_t *)(v73 + 40);
      uint64_t v76 = v74 - 1;
      do
      {
        uint64_t v78 = *(v75 - 1);
        uint64_t v77 = *v75;
        BOOL v82 = v78 >= v72 || v71 >= v77 || v78 == v77 || v71 == v72;
        BOOL v24 = v76-- != 0;
        char v83 = v24;
        if (!v82) {
          break;
        }
        v75 += 2;
      }
      while ((v83 & 1) != 0);
      char v84 = !v82;
    }
    else
    {
      char v84 = 0;
    }
    sub_21C7787CC(1, v5, v30, v66, v84);

    sub_21C77C3EC(v5);
    v85 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    if (v48 >> 62)
    {
      sub_21C77FAB4(0, &qword_267C8F298);
      swift_bridgeObjectRetain();
      sub_21C781B20();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_21C781B90();
      sub_21C77FAB4(0, &qword_267C8F298);
    }
    swift_bridgeObjectRelease();
    sub_21C77FAB4(0, &qword_267C8F298);
    uint64_t v86 = (void *)sub_21C781910();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (aBlock >> 62)
    {
      sub_21C781B20();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21C781B90();
    }
    swift_bridgeObjectRelease();
    v87 = (void *)sub_21C781910();
    swift_bridgeObjectRelease();
    uint64_t v88 = swift_allocObject();
    *(void *)(v88 + 16) = v2;
    v96 = sub_21C77FB80;
    uint64_t v97 = v88;
    unint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v93 = 1107296256;
    v94 = sub_21C778D78;
    uint64_t v95 = &block_descriptor_130;
    v89 = _Block_copy(&aBlock);
    v90 = v2;
    swift_release();
    objc_msgSend(v85, sel_saveObjects_deleteObjects_associations_completion_, v86, v87, 0, v89);
    _Block_release(v89);

    sub_21C77C3EC(v5);
    uint64_t v3 = v91;
    if (!v91) {
      goto LABEL_106;
    }
LABEL_105:
    v3(1, 0);
LABEL_106:
    sub_21C77C3EC(v5);
    return;
  }
  if (v3)
  {
    sub_21C77F5A4();
    uint64_t v6 = (void *)swift_allocError();
    unsigned char *v7 = 0;
    v3(0, v6);
  }
}

uint64_t sub_21C77CE18(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_21C77CE28(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21C77CE78()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21C77CEC0()
{
  uint64_t v2 = *(char **)(v0 + 16);
  uint64_t v1 = *(void (**)(uint64_t, void *))(v0 + 24);
  uint64_t v3 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_state];
  if (!v3)
  {
    if (!v1) {
      return;
    }
    sub_21C77F5A4();
    uint64_t v4 = (void *)swift_allocError();
    *uint64_t v6 = 2;
    goto LABEL_7;
  }
  if (v3 == (void *)1)
  {
    if (!v1) {
      return;
    }
    sub_21C77F5A4();
    uint64_t v4 = (void *)swift_allocError();
    unsigned char *v5 = 0;
LABEL_7:
    v1(0, v4);

    return;
  }
  id v7 = v3;
  uint64_t v8 = sub_21C77EC20(v7);
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = v7;
    sub_21C778590(v9, v3);
    sub_21C77C3EC(v3);
    id v56 = *(id *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB0A530);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_21C7843C0;
    *(void *)(v11 + 32) = v9;
    sub_21C781930();
    sub_21C77FAB4(0, &qword_267C8F298);
    uint64_t v55 = v9;
    uint64_t v12 = (void *)sub_21C781910();
    swift_bridgeObjectRelease();
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_21C7843C0;
    *(void *)(v13 + 32) = v10;
    sub_21C781930();
    id v14 = v10;
    uint64_t v15 = (void *)sub_21C781910();
    swift_bridgeObjectRelease();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v2;
    uint64_t v61 = sub_21C77F638;
    uint64_t v62 = v16;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v58 = 1107296256;
    uint64_t v59 = sub_21C778D78;
    uint64_t v60 = &block_descriptor_75;
    uint64_t v17 = _Block_copy(&aBlock);
    uint64_t v18 = v2;
    swift_release();
    objc_msgSend(v56, sel_saveObjects_deleteObjects_associations_completion_, v12, v15, 0, v17);
    _Block_release(v17);
  }
  else
  {
    id v19 = v7;
    sub_21C778590(0, v3);
    sub_21C77C3EC(v3);
    unint64_t v20 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v2;
    uint64_t v61 = sub_21C77F5F8;
    uint64_t v62 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v58 = 1107296256;
    uint64_t v59 = sub_21C778D78;
    uint64_t v60 = &block_descriptor_69;
    char v22 = _Block_copy(&aBlock);
    BOOL v23 = v2;
    swift_release();
    objc_msgSend(v20, sel_deleteObject_options_withCompletion_, v19, 2, v22);
    _Block_release(v22);
  }
  id v24 = v7;
  uint64_t v25 = sub_21C77AA18(0);
  uint64_t v27 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
  uint64_t v28 = *(void *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals];
  uint64_t v29 = *(void *)(v28 + 16);
  if (v29)
  {
    id v30 = (uint64_t *)(v28 + 40);
    uint64_t v31 = v29 - 1;
    do
    {
      uint64_t v33 = *(v30 - 1);
      uint64_t v32 = *v30;
      BOOL v37 = v33 >= v26 || v25 >= v32 || v33 == v32 || v25 == v26;
      BOOL v38 = v31-- != 0;
      char v39 = v38;
      if (!v37) {
        break;
      }
      v30 += 2;
    }
    while ((v39 & 1) != 0);
    char v40 = !v37;
  }
  else
  {
    char v40 = 0;
  }
  uint64_t v41 = sub_21C77AA18(1);
  uint64_t v43 = *(void *)&v2[v27];
  uint64_t v44 = *(void *)(v43 + 16);
  if (v44)
  {
    char v45 = (uint64_t *)(v43 + 40);
    uint64_t v46 = v44 - 1;
    do
    {
      uint64_t v48 = *(v45 - 1);
      uint64_t v47 = *v45;
      BOOL v52 = v48 >= v42 || v41 >= v47 || v48 == v47 || v41 == v42;
      BOOL v38 = v46-- != 0;
      char v53 = v38;
      if (!v52) {
        break;
      }
      v45 += 2;
    }
    while ((v53 & 1) != 0);
    char v54 = !v52;
  }
  else
  {
    char v54 = 0;
  }
  sub_21C7787CC(2, v3, 0, v40, v54);
  sub_21C77C3EC(v3);
  sub_21C7756C0(0);
  if (v1) {
    v1(1, 0);
  }
  sub_21C77C3EC(v3);
  sub_21C77C3EC(v3);
}

void sub_21C77D388()
{
  uint64_t v1 = *(void ***)(v0 + 16);
  uint64_t v2 = *(void **)(*(void *)(v0 + 24) + OBJC_IVAR___FIPauseRingsCoordinator_state);
  uint64_t v3 = *v1;
  void *v1 = v2;
  sub_21C77C528(v2);
  sub_21C77C508(v3);
}

uint64_t sub_21C77D3D4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21C77D3E4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  id v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_21C77FAB4(0, &qword_26AB0A500);
    uint64_t v5 = sub_21C781920();
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_21C77D49C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F2A0);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21C77E414(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C77D5AC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F2A0);
    id v10 = (char *)swift_allocObject();
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
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21C781B50();
  __break(1u);
  return result;
}

uint64_t sub_21C77D70C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21C77E400(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_21C77D78C(v5);
  *a1 = v2;
  return result;
}

void *sub_21C77D778(void *a1)
{
  return sub_21C77D49C(0, a1[2], 0, a1);
}

uint64_t sub_21C77D78C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_21C781B60();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v83 = 0;
      uint64_t v84 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v86 = *(void *)(v84 + 16 * i);
        uint64_t v87 = v83;
        do
        {
          if (v86 >= *(void *)(v84 + v87)) {
            break;
          }
          if (!v84) {
            goto LABEL_140;
          }
          uint64_t v88 = (void *)(v84 + v87);
          uint64_t v89 = *(void *)(v84 + v87 + 24);
          *(_OWORD *)(v84 + v87 + 16) = *(_OWORD *)(v84 + v87);
          *uint64_t v88 = v86;
          v88[1] = v89;
          v87 -= 16;
        }
        while (v87 != -16);
        v83 += 16;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  uint64_t v6 = result;
  v98 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      v90 = v12;
      uint64_t v101 = v9;
      if (v13 >= 2)
      {
        uint64_t v91 = *v98;
        do
        {
          unint64_t v92 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v91) {
            goto LABEL_144;
          }
          uint64_t v93 = v90;
          uint64_t v94 = *(void *)&v90[16 * v92 + 32];
          uint64_t v95 = *(void *)&v90[16 * v13 + 24];
          sub_21C77DE5C((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)&v90[16 * v13 + 16]), v91 + 16 * v95, __dst);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v93 = sub_21C77E290((uint64_t)v93);
          }
          if (v92 >= *((void *)v93 + 2)) {
            goto LABEL_133;
          }
          v96 = &v93[16 * v92 + 32];
          *(void *)v96 = v94;
          *((void *)v96 + 1) = v95;
          unint64_t v97 = *((void *)v93 + 2);
          if (v13 > v97) {
            goto LABEL_134;
          }
          memmove(&v93[16 * v13 + 16], &v93[16 * v13 + 32], 16 * (v97 - v13));
          v90 = v93;
          *((void *)v93 + 2) = v97 - 1;
          unint64_t v13 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v101 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v101 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F2D0);
    uint64_t v8 = sub_21C781950();
    *(void *)(v8 + 16) = v7;
    uint64_t v101 = v8;
    __dst = (char *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v99 = *a1 - 16;
  uint64_t v100 = *a1 + 32;
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v102 = v6;
  uint64_t v103 = v3;
  uint64_t v104 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 16 * v10);
      uint64_t v16 = *(void *)(v11 + 16 * v14);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v17 = (uint64_t *)(v100 + 16 * v14);
        uint64_t v18 = v15;
        while (1)
        {
          uint64_t v20 = *v17;
          v17 += 2;
          uint64_t v19 = v20;
          if (v15 < v16 == v20 >= v18) {
            break;
          }
          ++v10;
          uint64_t v18 = v19;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v21 = (long long *)(v99 + 16 * v10);
          uint64_t v22 = v10;
          uint64_t v23 = v14;
          id v24 = (long long *)(v11 + 16 * v14);
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_143;
              }
              long long v25 = *v24;
              *id v24 = *v21;
              *uint64_t v21 = v25;
            }
            ++v23;
            --v21;
            ++v24;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v26 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v26 >= v3) {
      uint64_t v26 = v3;
    }
    if (v26 < v14) {
      break;
    }
    if (v10 != v26)
    {
      uint64_t v27 = v99 + 16 * v10;
      do
      {
        uint64_t v28 = *(void *)(v11 + 16 * v10);
        uint64_t v29 = v14;
        uint64_t v30 = v27;
        do
        {
          if (v28 >= *(void *)v30) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v31 = *(void *)(v30 + 24);
          *(_OWORD *)(v30 + 16) = *(_OWORD *)v30;
          *(void *)uint64_t v30 = v28;
          *(void *)(v30 + 8) = v31;
          v30 -= 16;
          ++v29;
        }
        while (v10 != v29);
        ++v10;
        v27 += 16;
      }
      while (v10 != v26);
      uint64_t v10 = v26;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_21C77E0D8(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v33 = *((void *)v12 + 2);
    unint64_t v32 = *((void *)v12 + 3);
    unint64_t v13 = v33 + 1;
    uint64_t v11 = v104;
    if (v33 >= v32 >> 1)
    {
      BOOL v82 = sub_21C77E0D8((char *)(v32 > 1), v33 + 1, 1, v12);
      uint64_t v11 = v104;
      uint64_t v12 = v82;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v34 = v12 + 32;
    uint64_t v35 = &v12[16 * v33 + 32];
    *(void *)uint64_t v35 = v14;
    *((void *)v35 + 1) = v10;
    if (v33)
    {
      while (1)
      {
        unint64_t v36 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v41 = &v34[16 * v13];
          uint64_t v42 = *((void *)v41 - 8);
          uint64_t v43 = *((void *)v41 - 7);
          BOOL v47 = __OFSUB__(v43, v42);
          uint64_t v44 = v43 - v42;
          if (v47) {
            goto LABEL_119;
          }
          uint64_t v46 = *((void *)v41 - 6);
          uint64_t v45 = *((void *)v41 - 5);
          BOOL v47 = __OFSUB__(v45, v46);
          uint64_t v39 = v45 - v46;
          char v40 = v47;
          if (v47) {
            goto LABEL_120;
          }
          unint64_t v48 = v13 - 2;
          uint64_t v49 = &v34[16 * v13 - 32];
          uint64_t v51 = *(void *)v49;
          uint64_t v50 = *((void *)v49 + 1);
          BOOL v47 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          if (v47) {
            goto LABEL_122;
          }
          BOOL v47 = __OFADD__(v39, v52);
          uint64_t v53 = v39 + v52;
          if (v47) {
            goto LABEL_125;
          }
          if (v53 >= v44)
          {
            uint64_t v71 = &v34[16 * v36];
            uint64_t v73 = *(void *)v71;
            uint64_t v72 = *((void *)v71 + 1);
            BOOL v47 = __OFSUB__(v72, v73);
            uint64_t v74 = v72 - v73;
            if (v47) {
              goto LABEL_129;
            }
            BOOL v64 = v39 < v74;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v65 = *((void *)v12 + 4);
            uint64_t v66 = *((void *)v12 + 5);
            BOOL v47 = __OFSUB__(v66, v65);
            uint64_t v58 = v66 - v65;
            char v59 = v47;
            goto LABEL_77;
          }
          uint64_t v38 = *((void *)v12 + 4);
          uint64_t v37 = *((void *)v12 + 5);
          BOOL v47 = __OFSUB__(v37, v38);
          uint64_t v39 = v37 - v38;
          char v40 = v47;
        }
        if (v40) {
          goto LABEL_121;
        }
        unint64_t v48 = v13 - 2;
        char v54 = &v34[16 * v13 - 32];
        uint64_t v56 = *(void *)v54;
        uint64_t v55 = *((void *)v54 + 1);
        BOOL v57 = __OFSUB__(v55, v56);
        uint64_t v58 = v55 - v56;
        char v59 = v57;
        if (v57) {
          goto LABEL_124;
        }
        uint64_t v60 = &v34[16 * v36];
        uint64_t v62 = *(void *)v60;
        uint64_t v61 = *((void *)v60 + 1);
        BOOL v47 = __OFSUB__(v61, v62);
        uint64_t v63 = v61 - v62;
        if (v47) {
          goto LABEL_127;
        }
        if (__OFADD__(v58, v63)) {
          goto LABEL_128;
        }
        if (v58 + v63 >= v39)
        {
          BOOL v64 = v39 < v63;
LABEL_83:
          if (v64) {
            unint64_t v36 = v48;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v59) {
          goto LABEL_123;
        }
        uint64_t v67 = &v34[16 * v36];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v47 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v47) {
          goto LABEL_126;
        }
        if (v70 < v58) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v75 = v36 - 1;
        if (v36 - 1 >= v13)
        {
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
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        uint64_t v76 = v12;
        uint64_t v77 = &v34[16 * v75];
        uint64_t v78 = *(void *)v77;
        v79 = &v34[16 * v36];
        uint64_t v80 = *((void *)v79 + 1);
        sub_21C77DE5C((char *)(v11 + 16 * *(void *)v77), (char *)(v11 + 16 * *(void *)v79), v11 + 16 * v80, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v80 < v78) {
          goto LABEL_116;
        }
        if (v36 > *((void *)v76 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v77 = v78;
        *(void *)&v34[16 * v75 + 8] = v80;
        unint64_t v81 = *((void *)v76 + 2);
        if (v36 >= v81) {
          goto LABEL_118;
        }
        uint64_t v12 = v76;
        unint64_t v13 = v81 - 1;
        memmove(&v34[16 * v36], v79 + 16, 16 * (v81 - 1 - v36));
        *((void *)v76 + 2) = v81 - 1;
        uint64_t v11 = v104;
        if (v81 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v102;
    uint64_t v3 = v103;
    if (v10 >= v103)
    {
      uint64_t v9 = v101;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  uint64_t result = sub_21C781B00();
  __break(1u);
  return result;
}

uint64_t sub_21C77DE5C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  id v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v16 = &v4[16 * v13];
      uint64_t v22 = v16;
      id v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v17 = (char *)(a3 - 16);
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = v17 + 16;
          uint64_t v20 = *((void *)v18 - 2);
          v18 -= 16;
          if (*((void *)v16 - 2) >= v20)
          {
            uint64_t v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(_OWORD *)uint64_t v17 = *((_OWORD *)v16 - 1);
            }
            uint64_t v18 = v6;
            v16 -= 16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v19 != v6 || v17 >= v6) {
              *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
            }
            id v24 = v18;
            if (v18 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 16;
          uint64_t v6 = v18;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v23 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      id v24 = v7;
    }
LABEL_42:
    sub_21C77E1D4((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_21C781B50();
  __break(1u);
  return result;
}

char *sub_21C77E0D8(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F2D8);
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
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21C77E1D4(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_21C781B50();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_21C77E290(uint64_t a1)
{
  return sub_21C77E0D8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_21C77E2A4(uint64_t a1, uint64_t a2)
{
  sub_21C781BE0();
  sub_21C7818D0();
  uint64_t v4 = sub_21C781C00();
  return sub_21C77E31C(a1, a2, v4);
}

unint64_t sub_21C77E31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21C781B80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21C781B80() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21C77E400(uint64_t a1)
{
  return sub_21C77D5AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_21C77E414(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21C781B50();
  __break(1u);
  return result;
}

uint64_t sub_21C77E500(uint64_t a1)
{
  uint64_t v61 = a1;
  uint64_t v1 = sub_21C7817F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21C781730();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v53 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v52 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v58 = (uint64_t)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v56 = (char *)&v52 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v60 = (char *)&v52 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v52 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v52 - v22;
  MEMORY[0x270FA5388](v21);
  long long v25 = (char *)&v52 - v24;
  sub_21C781720();
  uint64_t v26 = (void *)sub_21C7816E0();
  uint64_t v52 = v6;
  uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v54 = v5;
  v27(v10, v5);
  uint64_t v28 = self;
  id v29 = objc_msgSend(v28, sel_hk_gregorianCalendar);
  sub_21C781790();

  uint64_t v30 = (void *)sub_21C781770();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v57 = v1;
  uint64_t v55 = v31;
  v31(v4, v1);
  id v32 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v32)
  {
    sub_21C781670();

    uint64_t v33 = sub_21C7816C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v23, 0, 1, v33);
  }
  else
  {
    uint64_t v33 = sub_21C7816C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v23, 1, 1, v33);
  }
  sub_21C77C3FC((uint64_t)v23, (uint64_t)v25);
  char v59 = v25;
  sub_21C77C464((uint64_t)v25, (uint64_t)v20);
  sub_21C7816C0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
  unint64_t v36 = 0;
  if (v35(v20, 1, v33) != 1)
  {
    unint64_t v36 = (void *)sub_21C781660();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v33);
  }
  uint64_t v37 = _HKCacheIndexFromDateComponents();

  uint64_t v38 = (void *)sub_21C7816E0();
  id v39 = objc_msgSend(v28, sel_hk_gregorianCalendar);
  sub_21C781790();

  char v40 = (void *)sub_21C781770();
  v55(v4, v57);
  id v41 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v41)
  {
    uint64_t v42 = (uint64_t)v56;
    sub_21C781670();

    uint64_t v43 = 0;
    uint64_t v44 = (uint64_t)v60;
  }
  else
  {
    uint64_t v43 = 1;
    uint64_t v44 = (uint64_t)v60;
    uint64_t v42 = (uint64_t)v56;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v42, v43, 1, v33);
  sub_21C77C3FC(v42, v44);
  uint64_t v45 = v58;
  sub_21C77C464(v44, v58);
  if (v35((char *)v45, 1, v33) == 1)
  {
    uint64_t v46 = 0;
  }
  else
  {
    uint64_t v46 = (void *)sub_21C781660();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v45, v33);
  }
  uint64_t v47 = (uint64_t)v59;
  uint64_t v48 = _HKCacheIndexFromDateComponents();

  if (v37 >= v48)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v53, v61, v54);
    uint64_t v62 = 0;
    unint64_t v63 = 0xE000000000000000;
    sub_21C781A70();
    sub_21C7818E0();
    sub_21C77FDB4(&qword_267C8F080, MEMORY[0x263F07490]);
    sub_21C781B70();
    sub_21C7818E0();
    swift_bridgeObjectRelease();
    sub_21C7818E0();
    uint64_t result = sub_21C781B10();
    __break(1u);
  }
  else
  {
    id v49 = objc_msgSend(self, sel_localDevice);
    id v50 = objc_msgSend(self, sel_pauseRingsScheduleWithStartDateIndex_endDateIndex_device_metadata_, v37, v48, v49, 0);

    sub_21C773FFC(v44, &qword_26AB0A508);
    sub_21C773FFC(v47, &qword_26AB0A508);
    return (uint64_t)v50;
  }
  return result;
}

uint64_t sub_21C77EC20(void *a1)
{
  id v34 = a1;
  uint64_t v1 = sub_21C7817F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21C781730();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A508);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v33 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v33 - v16;
  sub_21C781720();
  uint64_t v18 = (void *)sub_21C7816E0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v19 = objc_msgSend(self, sel_hk_gregorianCalendar);
  sub_21C781790();

  uint64_t v20 = (void *)sub_21C781770();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v21 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v21)
  {
    sub_21C781670();

    uint64_t v22 = sub_21C7816C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v15, 0, 1, v22);
  }
  else
  {
    uint64_t v22 = sub_21C7816C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v15, 1, 1, v22);
  }
  sub_21C77C3FC((uint64_t)v15, (uint64_t)v17);
  sub_21C77C464((uint64_t)v17, (uint64_t)v12);
  sub_21C7816C0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, v22) != 1)
  {
    uint64_t v24 = (void *)sub_21C781660();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v22);
  }
  uint64_t v25 = _HKCacheIndexFromDateComponents();

  id v26 = v34;
  if (v25 < (uint64_t)objc_msgSend(v34, sel_startDateIndex))
  {
    uint64_t result = sub_21C781B10();
    __break(1u);
  }
  else
  {
    id v27 = objc_msgSend(v26, sel_startDateIndex);
    id v28 = objc_msgSend(self, sel_localDevice);
    id v29 = objc_msgSend(self, sel_pauseRingsScheduleWithStartDateIndex_endDateIndex_device_metadata_, v27, v25, v28, 0);

    id v30 = objc_msgSend(v29, sel_startDateIndex);
    id v31 = objc_msgSend(v29, sel_endDateIndex);
    sub_21C773FFC((uint64_t)v17, &qword_26AB0A508);
    if (v30 == v31)
    {

      return 0;
    }
    return (uint64_t)v29;
  }
  return result;
}

unint64_t sub_21C77F0D8()
{
  unint64_t result = qword_267C8F288;
  if (!qword_267C8F288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8F288);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PauseRingsCoordinatorError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PauseRingsCoordinatorError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21C77F298);
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

uint64_t sub_21C77F2C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21C77F2C8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PauseRingsCoordinatorError()
{
  return &type metadata for PauseRingsCoordinatorError;
}

void *_s5StateOwCP(void *a1, void **a2)
{
  int v3 = *a2;
  LODWORD(v4) = -1;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    unsigned int v4 = *a2;
  }
  if ((v4 + 1) <= 1) {
    id v5 = v3;
  }
  *a1 = v3;
  return a1;
}

void _s5StateOwxx(void **a1)
{
  uint64_t v1 = *a1;
  int v2 = -1;
  if ((unint64_t)v1 < 0xFFFFFFFF) {
    int v2 = (int)v1;
  }
  if ((v2 + 1) <= 1) {
}
  }

void **_s5StateOwca(void **a1, void **a2)
{
  int v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v5) = -1;
  }
  else {
    id v5 = *a1;
  }
  unsigned int v6 = v5 + 1;
  BOOL v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    unsigned int v4 = *a2;
  }
  unsigned int v8 = v4 + 1;
  if (v6 > 1)
  {
    if (v8 <= 1)
    {
      *a1 = v7;
      id v10 = v7;
      return a1;
    }
LABEL_12:
    *a1 = v7;
    return a1;
  }
  if (v8 > 1)
  {

    BOOL v7 = *a2;
    goto LABEL_12;
  }
  *a1 = v7;
  id v9 = v7;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **_s5StateOwta(void **a1, void **a2)
{
  int v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v5) = -1;
  }
  else {
    id v5 = *a1;
  }
  unsigned int v6 = v5 + 1;
  BOOL v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    unsigned int v4 = *a2;
  }
  unsigned int v8 = v4 + 1;
  if (v6 > 1) {
    goto LABEL_11;
  }
  if (v8 > 1)
  {

LABEL_11:
    *a1 = v7;
    return a1;
  }
  *a1 = v7;

  return a1;
}

uint64_t _s5StateOwet(uint64_t *a1, unsigned int a2)
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
  if ((v3 + 1) < 2) {
    LODWORD(v3) = 0;
  }
  if (v3 >= 2) {
    return (v3 - 1);
  }
  else {
    return 0;
  }
}

uint64_t _s5StateOwst(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_21C77F518(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  if ((v1 + 1) >= 2) {
    return v1;
  }
  else {
    return 0;
  }
}

void *sub_21C77F538(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *unint64_t result = a2;
  }
  return result;
}

ValueMetadata *_s5StateOMa()
{
  return &_s5StateON;
}

uint64_t type metadata accessor for FIPauseRingsCoordinator(uint64_t a1)
{
  return sub_21C77FAB4(a1, &qword_26AB0A560);
}

uint64_t sub_21C77F58C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_21C77F59C(char a1, uint64_t a2)
{
  sub_21C7791FC(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_21C77F5A4()
{
  unint64_t result = qword_267C8F290;
  if (!qword_267C8F290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8F290);
  }
  return result;
}

uint64_t sub_21C77F5F8(char a1, void *a2)
{
  return sub_21C778D7C(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_26CD0AA40, (uint64_t)sub_21C77FAFC, (uint64_t)&block_descriptor_118);
}

uint64_t sub_21C77F638(char a1, void *a2)
{
  return sub_21C778D7C(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_26CD0A860, (uint64_t)sub_21C77F67C, (uint64_t)&block_descriptor_81);
}

void sub_21C77F67C()
{
}

void sub_21C77F688()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x21D4B0160](v0 + 16);
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A558]), sel_initWithHealthStore_, *(void *)(v1 + OBJC_IVAR___FIPauseRingsCoordinator_healthStore));
    aBlock[4] = sub_21C77A5A4;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C778D78;
    aBlock[3] = &block_descriptor_88;
    unsigned int v4 = _Block_copy(aBlock);
    objc_msgSend(v3, sel_forceNanoSyncWithOptions_completion_, 0, v4);

    _Block_release(v4);
  }
}

uint64_t sub_21C77F794(uint64_t a1, unint64_t a2, void *a3)
{
  return sub_21C77A1DC(a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_21C77F7A8()
{
  return objectdestroy_96Tm(40);
}

void sub_21C77F7B0()
{
  sub_21C776B10(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_21C77F7DC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21C77F7EC()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_didUpdatePauseStateNotification);
  objc_msgSend(v1, sel_postNotificationName_object_, v0, 0);
}

uint64_t sub_21C77F888()
{
  return MEMORY[0x270FA0238](v0, 42, 7);
}

void sub_21C77F8C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F2B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C7843E0;
  *(void *)(inited + 32) = 0x79546E6F69746361;
  *(void *)(inited + 40) = 0xEA00000000006570;
  *(void *)(inited + 48) = sub_21C781990();
  *(void *)(inited + 56) = 0xD00000000000001ELL;
  *(void *)(inited + 64) = 0x800000021C7899F0;
  if (v2) {
    sub_21C77B1F0();
  }
  *(void *)(inited + 72) = sub_21C781980();
  strcpy((char *)(inited + 80), "pauseDuration");
  *(_WORD *)(inited + 94) = -4864;
  if (v3) {
    sub_21C77B5F4();
  }
  *(void *)(inited + 96) = sub_21C781990();
  *(void *)(inited + 104) = 0xD000000000000015;
  *(void *)(inited + 112) = 0x800000021C789A10;
  *(void *)(inited + 120) = sub_21C781970();
  *(void *)(inited + 128) = 0xD000000000000016;
  *(void *)(inited + 136) = 0x800000021C789A30;
  *(void *)(inited + 144) = sub_21C781970();
  unint64_t v5 = sub_21C77BEC0(inited);
  unsigned int v6 = (void *)sub_21C7818A0();
  sub_21C77BFDC(v5);
  swift_bridgeObjectRelease();
  sub_21C77FAB4(0, &qword_267C8F2B8);
  BOOL v7 = (void *)sub_21C781860();
  swift_bridgeObjectRelease();
  FIActivityAnalyticsSubmissionWithPayload(v6, v7);
}

uint64_t sub_21C77FAB4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21C77FAF0()
{
  return swift_release();
}

void sub_21C77FAFC()
{
}

uint64_t sub_21C77FB08()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21C77FB40(char a1, void *a2)
{
  return sub_21C778D7C(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_26CD0AB80, (uint64_t)sub_21C77FC08, (uint64_t)&block_descriptor_142);
}

uint64_t sub_21C77FB80(char a1, void *a2)
{
  return sub_21C778D7C(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_26CD0AB30, (uint64_t)sub_21C77F67C, (uint64_t)&block_descriptor_136);
}

uint64_t objectdestroy_77Tm()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21C77FC08()
{
}

void sub_21C77FC14(const char *a1)
{
  uint64_t v2 = *(void **)(v1 + 24);
  if (*(unsigned char *)(v1 + 16) == 1 && v2 == 0)
  {
    sub_21C778AB0();
  }
  else
  {
    os_log_type_t v5 = sub_21C7819B0();
    unsigned int v6 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v5))
    {
      id v7 = v2;
      id v8 = v2;
      id v9 = v6;
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)id v10 = 138412290;
      if (v2)
      {
        id v12 = v2;
        uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
        sub_21C781A20();
      }
      else
      {
        sub_21C781A20();
        uint64_t v13 = 0;
      }
      *uint64_t v11 = v13;

      _os_log_impl(&dword_21C74B000, v9, v5, a1, v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C8F180);
      swift_arrayDestroy();
      MEMORY[0x21D4B0100](v11, -1, -1);
      MEMORY[0x21D4B0100](v10, -1, -1);
    }
    sub_21C776038();
  }
}

uint64_t sub_21C77FDB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21C77FDFC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21C77FE34(uint64_t a1, unint64_t a2, void *a3)
{
  return sub_21C776424(a2, a3, *(void **)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_21C77FE48()
{
  return objectdestroy_96Tm(48);
}

id sub_21C77FE50()
{
  return sub_21C7767F8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

void sub_21C77FE5C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v3 = objc_msgSend(self, sel_defaultCenter);
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_initialPauseStateLoadedNotification);
  objc_msgSend(v3, sel_postNotificationName_object_userInfo_, v2, v1, 0);
}

uint64_t sub_21C77FEFC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21C77FF34()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_21C74B000, v0, v1, "Error fetching activity summary: %{public}@", v2, v3, v4, v5, v6);
}

void FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "Error fetching activity summary: %{public}@", v2, v3, v4, v5, v6);
}

void FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_21C74B000, v0, v1, "Error fetching workouts: %{public}@", v2, v3, v4, v5, v6);
}

void FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "Error fetching workouts: %{public}@", v2, v3, v4, v5, v6);
}

void FICanonicalQuantityUnitForIntervalType_cold_1()
{
  __assert_rtn("FICanonicalQuantityUnitForIntervalType", "FIIntervalDefinition.m", 31, "unit != nil");
}

void FIRandomKeyForPrefixWithTableName_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C74B000, a2, OS_LOG_TYPE_DEBUG, "Could not find random key for prefix %@, returning prefix itself", (uint8_t *)&v2, 0xCu);
}

void FIRandomStringWithKeyAndPossibleSuffixesWithTableName_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21C74B000, log, OS_LOG_TYPE_ERROR, "Error formatting prefix (%@) with name: %@", (uint8_t *)&v3, 0x16u);
}

void FIDistanceUnitForHKUnit_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "[WRKT] Attempting to convert invalid HKUnit to FIDistanceUnit: %@, defaulting to Kilometers.", v2, v3, v4, v5, v6);
}

void FIPace_cold_1()
{
  __assert_rtn("FIPace", "FIPaceUtilities.m", 32, "paceFormat != FIPaceFormatSpeed");
}

uint64_t __getCMCalorieUserInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCMNatalimeterClass_block_invoke_cold_1(v0);
}

uint64_t __getCMNatalimeterClass_block_invoke_cold_1()
{
  return FIIsDeviceSatellitePaired_cold_1();
}

uint64_t FIIsDeviceSatellitePaired_cold_1()
{
  return __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
}

uint64_t __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNPKExpressGymKitAvailabilityManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPKExpressGymKitAvailabilityManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return FIActivityMoveModeWithHealthStore_cold_1(v0);
}

void FIActivityMoveModeWithHealthStore_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C74B000, a2, OS_LOG_TYPE_ERROR, "Error reading activity mode characteristic. error=%@", (uint8_t *)&v2, 0xCu);
}

void FIActivityMoveModeUserDefault_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C74B000, log, OS_LOG_TYPE_ERROR, "No activity mode user default. Defaulting to HKActivityMoveModeActiveEnergy.", v1, 2u);
}

uint64_t sub_21C781660()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_21C781670()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_21C781680()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_21C781690()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_21C7816A0()
{
  return MEMORY[0x270EEE870]();
}

uint64_t sub_21C7816B0()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_21C7816C0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_21C7816D0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21C7816E0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21C7816F0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_21C781700()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21C781710()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_21C781720()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21C781730()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21C781740()
{
  return MEMORY[0x270EF1220]();
}

uint64_t sub_21C781750()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_21C781760()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_21C781770()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_21C781780()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_21C781790()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_21C7817A0()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_21C7817B0()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_21C7817C0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_21C7817D0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_21C7817E0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_21C7817F0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_21C781800()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_21C781810()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_21C781820()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_21C781830()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21C781840()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21C781850()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21C781860()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21C781870()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21C781880()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_21C781890()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21C7818A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21C7818B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21C7818C0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21C7818D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21C7818E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21C7818F0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21C781900()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21C781910()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21C781920()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21C781930()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21C781940()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21C781950()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21C781960()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21C781970()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_21C781980()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_21C781990()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_21C7819A0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21C7819B0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21C7819C0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21C7819D0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21C7819E0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21C7819F0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21C781A00()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21C781A10()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21C781A20()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21C781A30()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21C781A40()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21C781A50()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21C781A60()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21C781A70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21C781A80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21C781A90()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21C781AA0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21C781AB0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21C781AC0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21C781AD0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21C781AE0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21C781AF0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21C781B00()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21C781B10()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21C781B20()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_21C781B30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21C781B40()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21C781B50()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21C781B60()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21C781B70()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21C781B80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21C781B90()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_21C781BA0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21C781BB0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21C781BC0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21C781BD0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21C781BE0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21C781BF0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21C781C00()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21C781C10()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t HDActivityCacheEntityPredicateForCacheIndex()
{
  return MEMORY[0x270F31958]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKNSOperatingSystemVersionCompare()
{
  return MEMORY[0x270EF37A8]();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return MEMORY[0x270EF37B0]();
}

uint64_t HKNSOperatingSystemVersionsEqual()
{
  return MEMORY[0x270EF37B8]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromHKSPSleepScheduleState()
{
  return MEMORY[0x270F73170]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPreferencesGetAppIntegerValueWithContainer()
{
  return MEMORY[0x270EE5678]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x270EE5690]();
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x270EF38F8]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x270EF3900]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x270EF3928]();
}

uint64_t _HKGenerateDefaultUnitForQuantityType()
{
  return MEMORY[0x270EF3960]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x270EF39E0]();
}

uint64_t _HKWorkoutActivityTypeIsValid()
{
  return MEMORY[0x270EF39E8]();
}

uint64_t _HKWorkoutCanonicalEnergyBurnedUnit()
{
  return MEMORY[0x270EF39F8]();
}

uint64_t _HKWorkoutSessionLocationTypeName()
{
  return MEMORY[0x270EF3A20]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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