void sub_226163184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

uint64_t _significantTimeChange(uint64_t a1, void *a2)
{
  return [a2 _handleSignificantTimeChangeNotification:0];
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_5(uint64_t a1, void *a2)
{
  return a2;
}

void sub_226167A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL populateNoiseLevelWithStatistics(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = objc_msgSend(v5, "hk_safeValueForKeyPath:class:error:", @"averageQuantity", objc_opt_class(), a3);
  if (v6)
  {
    v7 = objc_msgSend(v5, "hk_safeValueForKeyPath:class:error:", @"duration", objc_opt_class(), a3);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      v9 = [MEMORY[0x263F0A830] decibelAWeightedSoundPressureLevelUnit];
      [v6 doubleValueForUnit:v9];
      *a1 = v10;

      v11 = [MEMORY[0x263F0A830] secondUnit];
      [v7 doubleValueForUnit:v11];
      a1[1] = v12;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void sub_226167BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22616A44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_22616C23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id _AllProperties()
{
  v2[3] = *MEMORY[0x263EF8340];
  v2[0] = @"start_date";
  v2[1] = @"end_date";
  v2[2] = @"archived_statistics";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:3];
  return v0;
}

void sub_22616C68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22616CCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22616CE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22616EEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_22616F484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_0_2(id a1)
{
  return a1;
}

void sub_226171EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
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

id OUTLINED_FUNCTION_1_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t HDHearingTestDailyAnalyticsEvent.eventName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_eventName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HDHearingTestDailyAnalyticsEvent.isEventSubmissionIHAGated.getter()
{
  return 0;
}

void sub_226177400()
{
  uint64_t v1 = OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent____lazy_storage___firstPartyAudiogramPredicate;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent____lazy_storage___firstPartyAudiogramPredicate);
  if (v2) {
    goto LABEL_4;
  }
  sub_22617D790(0, (unint64_t *)&unk_26ABFB2A8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_226181E70;
  id v4 = (id)HDSampleEntityPredicateForDataType();
  uint64_t v5 = sub_22617D840(0, &qword_26ABFB280);
  *(void *)(v3 + 56) = v5;
  *(void *)(v3 + 32) = v4;
  id v6 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile), sel_metadataManager);
  id v7 = objc_msgSend(v6, sel_predicateWithMetadataKey_exists_, *MEMORY[0x263F0AB68], 1);

  *(void *)(v3 + 88) = v5;
  *(void *)(v3 + 64) = v7;
  BOOL v8 = (void *)sub_22617FDA0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(self, sel_predicateMatchingAllPredicates_, v8);

  if (v9)
  {
    uint64_t v10 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v9;
    v9;

    uint64_t v2 = 0;
LABEL_4:
    id v11 = v2;
    return;
  }
  __break(1u);
}

id HDHearingTestDailyAnalyticsEvent.__allocating_init(profile:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_22617C000(a1);

  return v4;
}

id HDHearingTestDailyAnalyticsEvent.init(profile:)(void *a1)
{
  id v2 = sub_22617C000(a1);

  return v2;
}

uint64_t sub_226177648(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v38 = MEMORY[0x263F8D6C8];
  *(void *)&long long v37 = 1;
  sub_22617C3D4(&v37, v36);
  uint64_t v2 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22617BAD8(v36, 0xD000000000000010, 0x8000000226183FC0, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  char v4 = HKImproveHealthAndActivityAnalyticsAllowed();
  uint64_t v38 = MEMORY[0x263F8D4F8];
  LOBYTE(v37) = v4;
  sub_22617C3D4(&v37, v36);
  char v5 = swift_isUniquelyReferenced_nonNull_native();
  sub_22617BAD8(v36, 0xD000000000000021, 0x8000000226183F90, v5);
  uint64_t v35 = v2;
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(a1, sel_environmentDataSource);
  id v7 = objc_msgSend(v6, sel_activePairedDeviceProductType);

  uint64_t v8 = MEMORY[0x263F8D310];
  if (v7)
  {
    uint64_t v9 = sub_22617FD70();
    uint64_t v11 = v10;

    uint64_t v38 = v8;
    *(void *)&long long v37 = v9;
    *((void *)&v37 + 1) = v11;
    sub_22617C3D4(&v37, v36);
    char v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_22617BAD8(v36, 0xD000000000000016, 0x8000000226183F70, v12);
    uint64_t v35 = v2;
    swift_bridgeObjectRelease();
  }
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A128]), sel_init);
  *(void *)&long long v37 = 0;
  id v14 = objc_msgSend(v13, sel_pairedDevicesWithError_, &v37);
  v15 = (void *)v37;
  if (!v14)
  {
    id v26 = (id)v37;
    swift_bridgeObjectRelease();
    sub_22617FBA0();

    swift_willThrow();
    return v2;
  }
  v16 = v14;
  sub_22617D668(0, &qword_26ABFB270);
  unint64_t v17 = sub_22617FDB0();
  id v18 = v15;

  if (v17 >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_22617FE90();
    if (v19)
    {
LABEL_6:
      uint64_t v20 = 4;
      while (1)
      {
        uint64_t v21 = v20 - 4;
        if ((v17 & 0xC000000000000001) != 0)
        {
          v22 = (void *)MEMORY[0x22A646D60](v20 - 4, v17);
          BOOL v23 = __OFADD__(v21, 1);
          uint64_t v24 = v20 - 3;
          if (v23) {
            goto LABEL_23;
          }
        }
        else
        {
          v22 = *(void **)(v17 + 8 * v20);
          swift_unknownObjectRetain();
          BOOL v23 = __OFADD__(v21, 1);
          uint64_t v24 = v20 - 3;
          if (v23)
          {
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
        }
        if (objc_msgSend(v22, sel_isHearingTestCapable)) {
          break;
        }
        swift_unknownObjectRelease();
        ++v20;
        if (v24 == v19) {
          goto LABEL_14;
        }
      }
      swift_bridgeObjectRelease_n();
      id v27 = objc_msgSend(v22, sel_productName);
      if (v27)
      {
        v28 = v27;
        uint64_t v29 = sub_22617FD70();
        uint64_t v31 = v30;

        uint64_t v38 = MEMORY[0x263F8D310];
        *(void *)&long long v37 = v29;
        *((void *)&v37 + 1) = v31;
        sub_22617C3D4(&v37, v36);
        char v32 = swift_isUniquelyReferenced_nonNull_native();
        sub_22617BAD8(v36, 0xD000000000000024, 0x8000000226183F40, v32);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_22617B488(0xD000000000000024, 0x8000000226183F40, v36);
        sub_22617D5B0((uint64_t)v36, (uint64_t)&qword_26ABFB2B8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D790);
        swift_unknownObjectRelease();
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v19) {
      goto LABEL_6;
    }
  }
LABEL_14:
  swift_bridgeObjectRelease_n();
  uint64_t v38 = MEMORY[0x263F8D310];
  *(void *)&long long v37 = 4271950;
  *((void *)&v37 + 1) = 0xE300000000000000;
  sub_22617C3D4(&v37, v36);
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  sub_22617BAD8(v36, 0xD000000000000024, 0x8000000226183F40, v25);
  swift_bridgeObjectRelease();
LABEL_19:
  id v33 = objc_msgSend(a1, sel_healthDataSource);
  if (v33)
  {
    sub_22617C438((uint64_t)&v35, 1, v33);
    sub_22617866C();
    sub_226178908((uint64_t)&v35);
    sub_2261794D8((uint64_t)&v35);
    swift_unknownObjectRelease();

    return v35;
  }
  else
  {
    uint64_t v2 = v35;
  }
  return v2;
}

uint64_t sub_226177BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_22617C3D4((_OWORD *)a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_22617BAD8(v11, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v10;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE58] + 8;
    uint64_t v9 = MEMORY[0x263F8D8F0];
    sub_22617D5B0(a1, (uint64_t)&unk_26ABFB2B8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D790);
    sub_22617B488(a2, a3, v11);
    swift_bridgeObjectRelease();
    return sub_22617D5B0((uint64_t)v11, (uint64_t)&unk_26ABFB2B8, v8, v9, (uint64_t (*)(void))sub_22617D790);
  }
}

uint64_t sub_226177CF0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_22617FBE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x263F8EE80];
  uint64_t v72 = MEMORY[0x263F8EE80];
  id v11 = objc_msgSend(a1, sel_healthDataSource);
  if (v11)
  {
    char v12 = v11;
    uint64_t v68 = ObjectType;
    v69 = v2;
    uint64_t v70 = v3;
    *(void *)&long long v74 = 0;
    id v13 = objc_msgSend(v11, sel_biologicalSexWithError_, &v74);
    if (v13)
    {
      id v14 = v13;
      id v15 = (id)v74;
      id v16 = (id)HKAnalyticsPropertyValueForBiologicalSex();
      uint64_t v17 = sub_22617FD70();
      v67 = v9;
      id v18 = a1;
      uint64_t v19 = v7;
      uint64_t v20 = v6;
      uint64_t v21 = v12;
      uint64_t v23 = v22;

      uint64_t v75 = MEMORY[0x263F8D310];
      *(void *)&long long v74 = v17;
      *((void *)&v74 + 1) = v23;
      char v12 = v21;
      uint64_t v6 = v20;
      uint64_t v7 = v19;
      a1 = v18;
      uint64_t v9 = v67;
      sub_22617C3D4(&v74, v73);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v71 = v10;
      sub_22617BAD8(v73, 0x6369676F6C6F6962, 0xED00007865536C61, isUniquelyReferenced_nonNull_native);
      uint64_t v72 = v71;

      swift_bridgeObjectRelease();
    }
    else
    {
      id v25 = (id)v74;
      id v26 = (char *)sub_22617FBA0();

      swift_willThrow();
      if (qword_26ABFB260 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_22617FD00();
      __swift_project_value_buffer(v27, (uint64_t)qword_26ABFB2C0);
      v28 = sub_22617FCE0();
      os_log_type_t v29 = sub_22617FDC0();
      if (os_log_type_enabled(v28, v29))
      {
        v69 = v12;
        uint64_t v30 = swift_slowAlloc();
        v67 = v26;
        uint64_t v31 = (uint8_t *)v30;
        uint64_t v66 = swift_slowAlloc();
        *(void *)&long long v74 = v66;
        *(_DWORD *)uint64_t v31 = 136446210;
        v65[1] = v31 + 4;
        uint64_t v32 = sub_22617FF30();
        *(void *)&v73[0] = sub_22617ADF0(v32, v33, (uint64_t *)&v74);
        sub_22617FDF0();
        char v12 = v69;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22615C000, v28, v29, "[%{public}s] Failed to fetch the user's biological sex. A sentinel value will be used.", v31, 0xCu);
        uint64_t v34 = v66;
        swift_arrayDestroy();
        MEMORY[0x22A647630](v34, -1, -1);
        uint64_t v35 = v31;
        id v26 = v67;
        MEMORY[0x22A647630](v35, -1, -1);
      }

      uint64_t v36 = sub_22617FD70();
      uint64_t v75 = MEMORY[0x263F8D310];
      *(void *)&long long v74 = v36;
      *((void *)&v74 + 1) = v37;
      sub_22617C3D4(&v74, v73);
      uint64_t v38 = v72;
      char v39 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v71 = v38;
      sub_22617BAD8(v73, 0x6369676F6C6F6962, 0xED00007865536C61, v39);
      uint64_t v72 = v71;
      swift_bridgeObjectRelease();
    }
    id v40 = objc_msgSend(a1, sel_environmentDataSource);
    id v41 = objc_msgSend(v40, sel_currentDate);

    sub_22617FBC0();
    v42 = (void *)sub_22617FBB0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *(void *)&long long v74 = 0;
    id v43 = objc_msgSend(v12, sel_ageWithCurrentDate_error_, v42, &v74);

    id v44 = (id)v74;
    if (v43)
    {
      uint64_t v45 = sub_22617D840(0, &qword_268122800);
      id v46 = v43;
      v47 = (void *)sub_22617FDE0();
      id v48 = (id)HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();

      if (v48)
      {
        uint64_t v75 = v45;
        *(void *)&long long v74 = v48;
        sub_22617C3D4(&v74, v73);
        uint64_t v49 = v72;
        char v50 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v71 = v49;
        sub_22617BAD8(v73, 6645601, 0xE300000000000000, v50);
        uint64_t v72 = v71;

        swift_bridgeObjectRelease();
      }
      else
      {
        sub_22617B488(6645601, 0xE300000000000000, &v74);
        sub_22617D5B0((uint64_t)&v74, (uint64_t)&qword_26ABFB2B8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D790);
      }
    }
    else
    {
      v51 = v44;
      v52 = (void *)sub_22617FBA0();

      swift_willThrow();
      if (qword_26ABFB260 != -1) {
        swift_once();
      }
      uint64_t v53 = sub_22617FD00();
      __swift_project_value_buffer(v53, (uint64_t)qword_26ABFB2C0);
      v54 = sub_22617FCE0();
      os_log_type_t v55 = sub_22617FDC0();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        uint64_t v57 = swift_slowAlloc();
        *(void *)&long long v74 = v57;
        *(_DWORD *)v56 = 136446210;
        uint64_t v58 = sub_22617FF30();
        *(void *)&v73[0] = sub_22617ADF0(v58, v59, (uint64_t *)&v74);
        sub_22617FDF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22615C000, v54, v55, "[%{public}s] Failed to fetch the user's age. A sentinel value will be used.", v56, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A647630](v57, -1, -1);
        MEMORY[0x22A647630](v56, -1, -1);
      }

      v60 = (void *)*MEMORY[0x263F091B0];
      uint64_t v75 = sub_22617D840(0, &qword_268122800);
      *(void *)&long long v74 = v60;
      sub_22617C3D4(&v74, v73);
      id v61 = v60;
      uint64_t v62 = v72;
      char v63 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v71 = v62;
      sub_22617BAD8(v73, 6645601, 0xE300000000000000, v63);
      uint64_t v72 = v71;
      swift_bridgeObjectRelease();
    }
    sub_22617C438((uint64_t)&v72, 0, v12);
    sub_226179DDC();
    sub_22617A3CC();
    swift_unknownObjectRelease();
    return v72;
  }
  return v10;
}

id sub_2261784F8(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id))
{
  id v7 = a3;
  id v8 = a1;
  a5(v7);

  uint64_t v9 = (void *)sub_22617FD10();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_2261785EC(uint64_t a1)
{
  uint64_t result = sub_22617BF60(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_22617C3E4(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

void sub_22617866C()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  swift_getObjectType();
  uint64_t v1 = self;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_audiogramDataType);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile);
  sub_226177400();
  uint64_t v5 = v4;
  v18[0] = 0;
  uint64_t v6 = (uint64_t)objc_msgSend(v1, sel_countOfSamplesWithType_profile_matchingPredicate_withError_, v2, v3, v4, v18);

  id v7 = v18[0];
  if (v18[0])
  {
    uint64_t v8 = qword_26ABFB260;
    id v9 = v18[0];
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_22617FD00();
    __swift_project_value_buffer(v10, (uint64_t)qword_26ABFB2C0);
    id v11 = sub_22617FCE0();
    os_log_type_t v12 = sub_22617FDC0();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      id v14 = (void *)swift_slowAlloc();
      v18[0] = v14;
      *(_DWORD *)id v13 = 136446210;
      uint64_t v15 = sub_22617FF30();
      sub_22617ADF0(v15, v16, (uint64_t *)v18);
      sub_22617FDF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22615C000, v11, v12, "[%{public}s] Could not read number of first party samples.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A647630](v14, -1, -1);
      MEMORY[0x22A647630](v13, -1, -1);
    }
  }
  else
  {
    uint64_t v17 = MEMORY[0x263F8D4F8];
    uint64_t v19 = MEMORY[0x263F8D4F8];
    v18[0] = (id)(v6 > 0);
    sub_226177BAC((uint64_t)v18, 0xD000000000000016, 0x8000000226184050);
    uint64_t v19 = v17;
    LOBYTE(v18[0]) = v6 > 1;
    sub_226177BAC((uint64_t)v18, 0xD00000000000001FLL, 0x8000000226184070);
  }
}

void sub_226178908(uint64_t a1)
{
  uint64_t v75 = a1;
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_22617FBE0();
  uint64_t v82 = *(void *)(v2 - 8);
  uint64_t v83 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v77 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v76 = (char *)&v70 - v5;
  uint64_t v6 = sub_22617FC30();
  uint64_t v80 = *(void *)(v6 - 8);
  uint64_t v81 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22617FB80();
  uint64_t v78 = *(void *)(v9 - 8);
  uint64_t v79 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v73 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v70 - v12;
  id v14 = self;
  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_audiogramDataType);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile);
  sub_226177400();
  id v18 = v17;
  id v88 = 0;
  id v19 = objc_msgSend(v14, sel_oldestSampleWithType_profile_encodingOptions_predicate_error_, v15, v16, 0, v17, &v88);

  id v20 = v88;
  if (v19)
  {
    id v21 = v88;
    sub_22617FE10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
    id v22 = v88;
  }
  sub_22617D0C8((uint64_t)&v86, (uint64_t)&v88);
  uint64_t v23 = MEMORY[0x263F8EE58];
  if (v91)
  {
    sub_22617D840(0, &qword_268122890);
    int v24 = swift_dynamicCast();
    id v25 = v85;
    if (!v24) {
      id v25 = 0;
    }
    id v84 = v25;
  }
  else
  {
    sub_22617D5B0((uint64_t)&v88, (uint64_t)&qword_26ABFB2B8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D790);
    id v84 = 0;
  }
  sub_226177400();
  uint64_t v27 = v26;
  id v88 = v20;
  id v28 = objc_msgSend(v14, sel_mostRecentSampleWithType_profile_encodingOptions_predicate_anchor_error_, v15, v16, 0, v26, 0, &v88);

  id v74 = v88;
  if (v28)
  {
    sub_22617FE10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
  }
  sub_22617D0C8((uint64_t)&v86, (uint64_t)&v88);
  if (v91)
  {
    sub_22617D840(0, &qword_268122890);
    if (swift_dynamicCast()) {
      os_log_type_t v29 = v85;
    }
    else {
      os_log_type_t v29 = 0;
    }
  }
  else
  {
    sub_22617D5B0((uint64_t)&v88, (uint64_t)&qword_26ABFB2B8, v23 + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D790);
    os_log_type_t v29 = 0;
  }
  uint64_t v30 = (unsigned int *)MEMORY[0x263F07830];
  if (!v84)
  {
    if (qword_26ABFB260 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_22617FD00();
    __swift_project_value_buffer(v43, (uint64_t)qword_26ABFB2C0);
    id v44 = sub_22617FCE0();
    os_log_type_t v45 = sub_22617FDD0();
    if (os_log_type_enabled(v44, v45))
    {
      id v46 = (uint8_t *)swift_slowAlloc();
      v47 = (void *)swift_slowAlloc();
      id v88 = v47;
      *(_DWORD *)id v46 = 136446210;
      uint64_t v48 = sub_22617FF30();
      *(void *)&long long v86 = sub_22617ADF0(v48, v49, (uint64_t *)&v88);
      sub_22617FDF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22615C000, v44, v45, "[%{public}s] Could not find oldest audiogram. Not submiting this data point to analytics.", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A647630](v47, -1, -1);
      MEMORY[0x22A647630](v46, -1, -1);

      if (!v29) {
        goto LABEL_32;
      }
    }
    else
    {

      if (!v29) {
        goto LABEL_32;
      }
    }
LABEL_27:
    id v50 = v29;
    sub_22617FC10();
    sub_22617D7DC(0, &qword_2681228A8, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
    uint64_t v51 = sub_22617FC20();
    uint64_t v52 = *(void *)(v51 - 8);
    unint64_t v53 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_226181E80;
    (*(void (**)(unint64_t, void, uint64_t))(v52 + 104))(v54 + v53, *MEMORY[0x263F07830], v51);
    sub_22617D1C0(v54);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    id v55 = objc_msgSend(v50, sel__creationDate);
    v56 = v76;
    sub_22617FBC0();

    uint64_t v57 = v77;
    sub_22617FBD0();
    uint64_t v58 = v73;
    sub_22617FBF0();
    swift_bridgeObjectRelease();
    uint64_t v59 = v83;
    v60 = *(void (**)(char *, uint64_t))(v82 + 8);
    v60(v57, v83);
    v60(v56, v59);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v8, v81);
    id v61 = (void *)sub_22617FB50();
    LOBYTE(v59) = v62;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v58, v79);
    if (v59)
    {
      id v61 = 0;
      uint64_t v89 = 0;
      uint64_t v90 = 0;
      uint64_t v91 = 0;
    }
    else
    {
      uint64_t v91 = MEMORY[0x263F8D6C8];
    }
    id v88 = v61;
    sub_226177BAC((uint64_t)&v88, 0xD000000000000017, 0x80000002261840B0);

    goto LABEL_37;
  }
  uint64_t v71 = v29;
  id v31 = v84;
  sub_22617FC10();
  sub_22617D7DC(0, &qword_2681228A8, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
  uint64_t v32 = sub_22617FC20();
  uint64_t v33 = *(void *)(v32 - 8);
  unint64_t v34 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_226181E80;
  (*(void (**)(unint64_t, void, uint64_t))(v33 + 104))(v35 + v34, *v30, v32);
  sub_22617D1C0(v35);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  id v36 = objc_msgSend(v31, sel__creationDate);
  uint64_t v37 = v76;
  sub_22617FBC0();

  uint64_t v38 = v77;
  sub_22617FBD0();
  sub_22617FBF0();
  swift_bridgeObjectRelease();
  uint64_t v39 = v83;
  id v40 = *(void (**)(char *, uint64_t))(v82 + 8);
  v40(v38, v83);
  v40(v37, v39);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v8, v81);
  id v41 = (void *)sub_22617FB50();
  LOBYTE(v40) = v42;
  (*(void (**)(char *, uint64_t))(v78 + 8))(v13, v79);
  if (v40)
  {
    id v41 = 0;
    uint64_t v89 = 0;
    uint64_t v90 = 0;
    uint64_t v91 = 0;
  }
  else
  {
    uint64_t v91 = MEMORY[0x263F8D6C8];
  }
  id v88 = v41;
  sub_226177BAC((uint64_t)&v88, 0xD000000000000018, 0x8000000226184090);

  os_log_type_t v29 = v71;
  if (v71) {
    goto LABEL_27;
  }
LABEL_32:
  if (qword_26ABFB260 != -1) {
    swift_once();
  }
  uint64_t v63 = sub_22617FD00();
  __swift_project_value_buffer(v63, (uint64_t)qword_26ABFB2C0);
  v64 = sub_22617FCE0();
  os_log_type_t v65 = sub_22617FDD0();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc();
    v67 = (void *)swift_slowAlloc();
    id v88 = v67;
    *(_DWORD *)uint64_t v66 = 136446210;
    uint64_t v68 = sub_22617FF30();
    *(void *)&long long v86 = sub_22617ADF0(v68, v69, (uint64_t *)&v88);
    sub_22617FDF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22615C000, v64, v65, "[%{public}s] Could not find newest audiogram. Not submiting this data point to analytics.", v66, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A647630](v67, -1, -1);
    MEMORY[0x22A647630](v66, -1, -1);
  }

LABEL_37:
}

void sub_2261794D8(uint64_t a1)
{
  uint64_t v71 = a1;
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_22617FBE0();
  uint64_t v74 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v57 - v6;
  uint64_t v70 = sub_22617FC30();
  uint64_t v73 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_22617FB80();
  uint64_t v72 = *(void *)(v69 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v69);
  v67 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v57 - v12;
  id v14 = self;
  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_audiogramDataType);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile);
  sub_226177400();
  id v18 = v17;
  *(void *)&v76[0] = 0;
  id v19 = objc_msgSend(v14, sel_mostRecentSampleWithType_profile_encodingOptions_predicate_anchor_error_, v15, v16, 0, v17, 0, v76);

  id v20 = *(void **)&v76[0];
  if (v19)
  {
    id v21 = *(id *)&v76[0];
    sub_22617FE10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v76, 0, sizeof(v76));
    id v22 = v20;
  }
  sub_22617D0C8((uint64_t)v76, (uint64_t)&v77);
  if (*((void *)&v78 + 1))
  {
    sub_22617D840(0, &qword_268122890);
    if (swift_dynamicCast())
    {
      uint64_t v66 = v20;
      id v23 = v75;
      uint64_t ObjectType = v2;
      id v24 = v23;
      sub_22617FC10();
      sub_22617D7DC(0, &qword_2681228A8, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
      uint64_t v26 = v25;
      uint64_t v27 = sub_22617FC20();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v29 = *(unsigned __int8 *)(v28 + 80);
      uint64_t v30 = (v29 + 32) & ~v29;
      uint64_t v31 = v30 + *(void *)(v28 + 72);
      uint64_t v64 = v26;
      uint64_t v62 = v31;
      uint64_t v61 = v29 | 7;
      uint64_t v32 = swift_allocObject();
      long long v59 = xmmword_226181E80;
      *(_OWORD *)(v32 + 16) = xmmword_226181E80;
      uint64_t v63 = v30;
      uint64_t v33 = *MEMORY[0x263F07870];
      v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 104);
      v60(v32 + v30, v33, v27);
      sub_22617D1C0(v32);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      id v65 = v24;
      unint64_t v34 = v24;
      uint64_t v35 = ObjectType;
      id v36 = objc_msgSend(v34, sel__creationDate);
      sub_22617FBC0();

      sub_22617FBD0();
      sub_22617FBF0();
      swift_bridgeObjectRelease();
      uint64_t v37 = v74 + 8;
      uint64_t v38 = *(void (**)(char *, uint64_t))(v74 + 8);
      v38(v5, v35);
      uint64_t v74 = v37;
      v38(v7, v35);
      uint64_t v39 = *(void (**)(char *, uint64_t))(v73 + 8);
      v73 += 8;
      uint64_t v58 = v39;
      v39(v9, v70);
      uint64_t v40 = sub_22617FB60();
      LOBYTE(v30) = v41;
      char v42 = *(void (**)(char *, uint64_t))(v72 + 8);
      v72 += 8;
      uint64_t v57 = v42;
      v42(v13, v69);
      if (v30)
      {
        long long v77 = 0u;
        long long v78 = 0u;
      }
      else
      {
        *((void *)&v78 + 1) = MEMORY[0x263F8D4F8];
        LOBYTE(v77) = v40 < 31;
      }
      sub_226177BAC((uint64_t)&v77, 0xD000000000000022, 0x80000002261840D0);
      sub_22617FC10();
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = v59;
      v60(v50 + v63, *MEMORY[0x263F078A0], v27);
      sub_22617D1C0(v50);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      id v51 = v65;
      id v52 = objc_msgSend(v65, sel__creationDate);
      sub_22617FBC0();

      sub_22617FBD0();
      unint64_t v53 = v67;
      sub_22617FBF0();
      swift_bridgeObjectRelease();
      uint64_t v54 = ObjectType;
      v38(v5, ObjectType);
      v38(v7, v54);
      v58(v9, v70);
      uint64_t v55 = sub_22617FB70();
      LOBYTE(v54) = v56;
      v57(v53, v69);
      if (v54)
      {
        long long v77 = 0u;
        long long v78 = 0u;
      }
      else
      {
        *((void *)&v78 + 1) = MEMORY[0x263F8D4F8];
        LOBYTE(v77) = v55 < 1;
      }
      id v20 = v66;
      sub_226177BAC((uint64_t)&v77, 0xD000000000000020, 0x8000000226184100);

      goto LABEL_19;
    }
  }
  else
  {
    sub_22617D5B0((uint64_t)&v77, (uint64_t)&qword_26ABFB2B8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D790);
  }
  if (qword_26ABFB260 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_22617FD00();
  __swift_project_value_buffer(v43, (uint64_t)qword_26ABFB2C0);
  id v44 = sub_22617FCE0();
  os_log_type_t v45 = sub_22617FDD0();
  if (os_log_type_enabled(v44, v45))
  {
    id v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(void *)&long long v77 = v47;
    *(_DWORD *)id v46 = 136446210;
    uint64_t v48 = sub_22617FF30();
    *(void *)&v76[0] = sub_22617ADF0(v48, v49, (uint64_t *)&v77);
    sub_22617FDF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22615C000, v44, v45, "[%{public}s] Could not find newest audiogram. Not submiting this data point to analytics.", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A647630](v47, -1, -1);
    MEMORY[0x22A647630](v46, -1, -1);
  }

LABEL_19:
}

void sub_226179DDC()
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  swift_getObjectType();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_audiogramDataType);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile);
  sub_22617D790(0, (unint64_t *)&unk_26ABFB2A8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_226181E70;
  sub_226177400();
  uint64_t v5 = v4;
  *(void *)(v3 + 56) = sub_22617D840(0, (unint64_t *)&unk_268122898);
  *(void *)(v3 + 32) = v5;
  uint64_t v6 = (void *)sub_22617FBB0();
  id v7 = (id)HDDataEntityPredicateForCreationDate();

  uint64_t v8 = sub_22617D840(0, &qword_26ABFB280);
  *(void *)(v3 + 88) = v8;
  *(void *)(v3 + 64) = v7;
  uint64_t v9 = (void *)sub_22617FDA0();
  swift_bridgeObjectRelease();
  uint64_t v10 = v2;
  id v41 = self;
  id v11 = objc_msgSend(v41, sel_predicateMatchingAllPredicates_, v9);

  uint64_t v12 = self;
  v42[0] = 0;
  id v13 = objc_msgSend(v12, sel_countOfSamplesWithType_profile_matchingPredicate_withError_, v1, v10, v11, v42);

  id v14 = v42[0];
  if (v42[0])
  {
    uint64_t v15 = qword_26ABFB260;
    id v16 = v42[0];
    if (v15 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_22617FD00();
    __swift_project_value_buffer(v17, (uint64_t)qword_26ABFB2C0);
    id v18 = sub_22617FCE0();
    os_log_type_t v19 = sub_22617FDC0();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = v10;
      id v21 = (void *)swift_slowAlloc();
      v42[0] = v21;
      *(_DWORD *)id v20 = 136446210;
      uint64_t v22 = sub_22617FF30();
      sub_22617ADF0(v22, v23, (uint64_t *)v42);
      sub_22617FDF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22615C000, v18, v19, "[%{public}s] Could not read number of first party samples.", v20, 0xCu);
      swift_arrayDestroy();
      id v24 = v21;
      uint64_t v10 = v40;
      MEMORY[0x22A647630](v24, -1, -1);
      MEMORY[0x22A647630](v20, -1, -1);
    }
  }
  else
  {
    uint64_t v43 = MEMORY[0x263F8D6C8];
    v42[0] = v13;
    sub_226177BAC((uint64_t)v42, 0xD00000000000001FLL, 0x8000000226184130);
  }
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_226181E70;
  id v26 = (id)HDSampleEntityPredicateForDataType();
  *(void *)(v25 + 56) = v8;
  *(void *)(v25 + 32) = v26;
  uint64_t v27 = (void *)sub_22617FBB0();
  id v28 = (id)HDDataEntityPredicateForCreationDate();

  *(void *)(v25 + 88) = v8;
  *(void *)(v25 + 64) = v28;
  uint64_t v29 = (void *)sub_22617FDA0();
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend(v41, sel_predicateMatchingAllPredicates_, v29);

  v42[0] = v14;
  id v31 = objc_msgSend(v12, sel_countOfSamplesWithType_profile_matchingPredicate_withError_, v1, v10, v30, v42);

  id v32 = v42[0];
  if (v32)
  {
    if (qword_26ABFB260 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_22617FD00();
    __swift_project_value_buffer(v33, (uint64_t)qword_26ABFB2C0);
    unint64_t v34 = sub_22617FCE0();
    os_log_type_t v35 = sub_22617FDC0();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      v42[0] = v37;
      *(_DWORD *)id v36 = 136446210;
      uint64_t v38 = sub_22617FF30();
      sub_22617ADF0(v38, v39, (uint64_t *)v42);
      sub_22617FDF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22615C000, v34, v35, "[%{public}s] Could not read number of total samples.", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A647630](v37, -1, -1);
      MEMORY[0x22A647630](v36, -1, -1);
    }
  }
  else
  {
    uint64_t v43 = MEMORY[0x263F8D6C8];
    v42[0] = v31;
    sub_226177BAC((uint64_t)v42, 0xD00000000000001ALL, 0x8000000226184150);
  }
}

void sub_22617A3CC()
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  swift_getObjectType();
  uint64_t v1 = self;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_audiogramDataType);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile);
  sub_226177400();
  uint64_t v5 = v4;
  *(void *)&long long v31 = 0;
  id v6 = objc_msgSend(v1, sel_mostRecentSampleWithType_profile_encodingOptions_predicate_anchor_error_, v2, v3, 0, v4, 0, &v31);

  id v7 = (void *)v31;
  if (v6)
  {
    id v8 = (id)v31;
    sub_22617FE10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v7;
  }
  sub_22617D0C8((uint64_t)&v31, (uint64_t)&v33);
  if (*((void *)&v34 + 1))
  {
    sub_22617D840(0, &qword_268122890);
    if (swift_dynamicCast()) {
      uint64_t v10 = v30;
    }
    else {
      uint64_t v10 = 0;
    }
    if (!v7)
    {
      if (v10)
      {
        id v11 = v10;
        objc_msgSend(v11, sel_leftEarDiagnostic);
        id v12 = (id)HKLocalizedStringForHearingLevelClassification();
        if (v12 && (id v13 = v12, v14 = sub_22617FD70(), v16 = v15, v13, v16))
        {
          *((void *)&v32 + 1) = MEMORY[0x263F8D310];
          *(void *)&long long v31 = v14;
          *((void *)&v31 + 1) = v16;
        }
        else
        {
          long long v31 = 0u;
          long long v32 = 0u;
        }
        sub_22617D0C8((uint64_t)&v31, (uint64_t)&v33);

        sub_226177BAC((uint64_t)&v33, 0xD000000000000019, 0x8000000226184170);
        id v24 = v11;
        objc_msgSend(v24, sel_rightEarDiagnostic);
        id v25 = (id)HKLocalizedStringForHearingLevelClassification();
        if (v25 && (id v26 = v25, v27 = sub_22617FD70(), v29 = v28, v26, v29))
        {
          *((void *)&v32 + 1) = MEMORY[0x263F8D310];
          *(void *)&long long v31 = v27;
          *((void *)&v31 + 1) = v29;
        }
        else
        {
          long long v31 = 0u;
          long long v32 = 0u;
        }
        sub_22617D0C8((uint64_t)&v31, (uint64_t)&v33);

        goto LABEL_27;
      }
LABEL_20:
      long long v33 = 0u;
      long long v34 = 0u;
      sub_226177BAC((uint64_t)&v33, 0xD000000000000019, 0x8000000226184170);
      id v24 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
LABEL_27:
      sub_226177BAC((uint64_t)&v33, 0xD00000000000001ALL, 0x8000000226184190);

      goto LABEL_28;
    }
  }
  else
  {
    sub_22617D5B0((uint64_t)&v33, (uint64_t)&qword_26ABFB2B8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D790);
    if (!v7) {
      goto LABEL_20;
    }
    uint64_t v10 = 0;
  }
  if (qword_26ABFB260 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_22617FD00();
  __swift_project_value_buffer(v17, (uint64_t)qword_26ABFB2C0);
  id v18 = sub_22617FCE0();
  os_log_type_t v19 = sub_22617FDD0();
  if (os_log_type_enabled(v18, v19))
  {
    id v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(void *)&long long v33 = v21;
    *(_DWORD *)id v20 = 136446210;
    uint64_t v22 = sub_22617FF30();
    *(void *)&long long v31 = sub_22617ADF0(v22, v23, (uint64_t *)&v33);
    sub_22617FDF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22615C000, v18, v19, "[%{public}s] Could not find newest audiogram. Not submiting this data point to analytics.", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A647630](v21, -1, -1);
    MEMORY[0x22A647630](v20, -1, -1);
  }

LABEL_28:
}

id HDHearingTestDailyAnalyticsEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDHearingTestDailyAnalyticsEvent.init()()
{
}

id HDHearingTestDailyAnalyticsEvent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDHearingTestDailyAnalyticsEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22617A9BC(uint64_t a1, uint64_t a2)
{
  return sub_22617AC58(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_22617A9D4(uint64_t a1, id *a2)
{
  uint64_t result = sub_22617FD50();
  *a2 = 0;
  return result;
}

uint64_t sub_22617AA4C(uint64_t a1, id *a2)
{
  char v3 = sub_22617FD60();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22617AACC@<X0>(uint64_t *a1@<X8>)
{
  sub_22617FD70();
  uint64_t v2 = sub_22617FD40();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22617AB10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_22617FD40();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22617AB58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22617FD70();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22617AB84(uint64_t a1)
{
  uint64_t v2 = sub_22617D568(&qword_268122950, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v3 = sub_22617D568(&qword_268122958, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22617AC40(uint64_t a1, uint64_t a2)
{
  return sub_22617AC58(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_22617AC58(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_22617FD70();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22617AC9C()
{
  sub_22617FD70();
  sub_22617FD80();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22617ACF0()
{
  sub_22617FD70();
  sub_22617FF10();
  sub_22617FD80();
  uint64_t v0 = sub_22617FF20();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22617AD64()
{
  uint64_t v0 = sub_22617FD70();
  uint64_t v2 = v1;
  if (v0 == sub_22617FD70() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_22617FEF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22617ADF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22617AEC4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22617D068((uint64_t)v12, *a3);
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
      sub_22617D068((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_22617AEC4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22617FE00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22617B080(a5, a6);
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
  uint64_t v8 = sub_22617FE70();
  if (!v8)
  {
    sub_22617FE80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22617FED0();
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

uint64_t sub_22617B080(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22617B118(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22617B318(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22617B318(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22617B118(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22617B290(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22617FE50();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22617FE80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22617FD90();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22617FED0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22617FE80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22617B290(uint64_t a1, uint64_t a2)
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
  sub_22617D790(0, &qword_268122888, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22617B318(char a1, int64_t a2, char a3, char *a4)
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
    sub_22617D790(0, &qword_268122888, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
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
  uint64_t result = sub_22617FED0();
  __break(1u);
  return result;
}

double sub_22617B488@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_22617B58C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_22617BD7C();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_22617C3D4((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_22617B900(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_22617B58C(uint64_t a1, uint64_t a2)
{
  sub_22617FF10();
  sub_22617FD80();
  uint64_t v4 = sub_22617FF20();
  return sub_22617BC98(a1, a2, v4);
}

uint64_t sub_22617B604(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_22617D154();
  uint64_t v6 = sub_22617FEB0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      id v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_22617C3D4(v24, v35);
      }
      else
      {
        sub_22617D068((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_22617FF10();
      sub_22617FD80();
      uint64_t result = sub_22617FF20();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_22617C3D4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_22617B900(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_22617FE20();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_22617FF10();
        swift_bridgeObjectRetain();
        sub_22617FD80();
        uint64_t v10 = sub_22617FF20();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            _OWORD *v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_22617BAD8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_22617B58C(a2, a3);
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
      sub_22617BD7C();
      goto LABEL_7;
    }
    sub_22617B604(v15, a4 & 1);
    unint64_t v21 = sub_22617B58C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_22617FF00();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
    return sub_22617C3D4(a1, v19);
  }
LABEL_13:
  sub_22617BC2C(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_22617BC2C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_22617C3D4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_22617BC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22617FEF0() & 1) == 0)
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
      while (!v14 && (sub_22617FEF0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_22617BD7C()
{
  uint64_t v1 = v0;
  sub_22617D154();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22617FEA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_22617D068(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_22617C3D4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_22617BF60(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

id sub_22617C000(void *a1)
{
  uint64_t v25 = a1;
  uint64_t v26 = sub_22617FBE0();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_22617FC20();
  uint64_t v5 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22617FC30();
  uint64_t v28 = *(void *)(v8 - 8);
  uint64_t v29 = v8;
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22617D7DC(0, (unint64_t *)&unk_26ABFB220, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)&v24 - v11;
  int64_t v13 = &v1[OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_eventName];
  *int64_t v13 = 0xD000000000000023;
  v13[1] = 0x80000002261841B0;
  v1[OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_isEventSubmissionIHAGated] = 0;
  uint64_t v14 = OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_audiogramDataType;
  sub_22617D840(0, &qword_26ABFB278);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v16 = v1;
  uint64_t v17 = (void *)ObjCClassFromMetadata;
  uint64_t v18 = v26;
  *(void *)&v1[v14] = objc_msgSend(v17, sel_audiogramSampleType);
  *(void *)&v16[OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent____lazy_storage___firstPartyAudiogramPredicate] = 0;
  sub_22617FC10();
  uint64_t v19 = v27;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F078A0], v27);
  sub_22617FBD0();
  sub_22617FC00();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v29);
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v12, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v16[OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_oneYearAgo], v12, v18);
    unint64_t v21 = v25;
    *(void *)&v16[OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile] = v25;
    id v22 = v21;

    unint64_t v23 = (objc_class *)type metadata accessor for HDHearingTestDailyAnalyticsEvent();
    v30.receiver = v16;
    v30.super_class = v23;
    return objc_msgSendSuper2(&v30, sel_init);
  }
  return result;
}

_OWORD *sub_22617C3D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22617C3E4(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_22617C438(uint64_t a1, int a2, void *a3)
{
  int v65 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_22617FC50();
  uint64_t v61 = *(void *)(v5 - 8);
  uint64_t v62 = v5;
  MEMORY[0x270FA5388](v5);
  v60 = (char *)v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22617FC90();
  uint64_t v63 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)v57 - v11;
  uint64_t v13 = sub_22617FC80();
  uint64_t v64 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22617FCB0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v67 = (char *)v57 - v21;
  id v22 = objc_msgSend(a3, sel_featureStatusProviderForIdentifier_, *MEMORY[0x263F09768]);
  if (!v22 || (v71[0] = v22, sub_22617D668(0, &qword_26ABFB288), sub_22617D610(), (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v70 = 0;
    long long v68 = 0u;
    long long v69 = 0u;
    return sub_22617D5B0((uint64_t)&v68, (uint64_t)&unk_2681228C8, (uint64_t)sub_22617D610, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D7DC);
  }
  if (!*((void *)&v69 + 1)) {
    return sub_22617D5B0((uint64_t)&v68, (uint64_t)&unk_2681228C8, (uint64_t)sub_22617D610, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_22617D7DC);
  }
  v57[0] = v7;
  uint64_t v59 = v16;
  uint64_t v58 = v17;
  v57[1] = a1;
  sub_22617D6BC(&v68, (uint64_t)v71);
  __swift_project_boxed_opaque_existential_1(v71, v71[3]);
  unint64_t v23 = v67;
  sub_22617FCD0();
  uint64_t v25 = v58;
  uint64_t v26 = v59;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v20, v23, v59);
  int v27 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v20, v26);
  if (v27 == *MEMORY[0x263F44990])
  {
    (*(void (**)(char *, uint64_t))(v25 + 96))(v20, v26);
    uint64_t v28 = v64;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v15, v20, v13);
    uint64_t v29 = v57[0];
    if (v65)
    {
      uint64_t v30 = sub_22617FC70();
      uint64_t v31 = sub_2261785EC(v30);
      unint64_t v33 = v32;
      swift_bridgeObjectRelease();
      *((void *)&v69 + 1) = MEMORY[0x263F8D310];
      uint64_t v34 = 4271950;
      if (v33) {
        uint64_t v34 = v31;
      }
      unint64_t v35 = 0xE300000000000000;
      if (v33) {
        unint64_t v35 = v33;
      }
      *(void *)&long long v68 = v34;
      *((void *)&v68 + 1) = v35;
      sub_226177BAC((uint64_t)&v68, 0xD000000000000015, 0x8000000226183F20);
      uint64_t v36 = MEMORY[0x263F8D4F8];
      *((void *)&v69 + 1) = MEMORY[0x263F8D4F8];
      LOBYTE(v68) = 1;
      sub_226177BAC((uint64_t)&v68, 0xD000000000000017, 0x8000000226183FE0);
      uint64_t v37 = (void *)sub_22617FCC0();
      unsigned __int8 v38 = objc_msgSend(v37, sel_areAllRequirementsSatisfied);

      *((void *)&v69 + 1) = v36;
      LOBYTE(v68) = v38;
      sub_226177BAC((uint64_t)&v68, 0xD000000000000017, 0x8000000226184000);
      sub_22617FC40();
      unint64_t v39 = (void *)sub_22617FCA0();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v12, v29);
      id v40 = objc_msgSend(v39, sel_highestPriorityUnsatisfiedRequirement);

      if (v40)
      {
        type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
        *((void *)&v69 + 1) = v41;
        *(void *)&long long v68 = v40;
      }
      else
      {
        long long v68 = 0u;
        long long v69 = 0u;
      }
      uint64_t v56 = v64;
      sub_226177BAC((uint64_t)&v68, 0xD000000000000023, 0x8000000226184020);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v15, v13);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v67, v59);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v13);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v67, v26);
    }
  }
  else
  {
    char v42 = v23;
    uint64_t v43 = v57[0];
    if (v27 == *MEMORY[0x263F44988])
    {
      uint64_t v44 = v59;
      (*(void (**)(char *, uint64_t))(v25 + 96))(v20, v59);
      id v46 = v60;
      uint64_t v45 = v61;
      uint64_t v47 = v20;
      uint64_t v48 = v62;
      (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v60, v47, v62);
      if (v65)
      {
        *((void *)&v69 + 1) = MEMORY[0x263F8D310];
        *(void *)&long long v68 = 4271950;
        *((void *)&v68 + 1) = 0xE300000000000000;
        sub_226177BAC((uint64_t)&v68, 0xD000000000000015, 0x8000000226183F20);
        uint64_t v49 = MEMORY[0x263F8D4F8];
        *((void *)&v69 + 1) = MEMORY[0x263F8D4F8];
        LOBYTE(v68) = 0;
        sub_226177BAC((uint64_t)&v68, 0xD000000000000017, 0x8000000226183FE0);
        *((void *)&v69 + 1) = v49;
        LOBYTE(v68) = 0;
        sub_226177BAC((uint64_t)&v68, 0xD000000000000017, 0x8000000226184000);
        sub_22617FC40();
        uint64_t v50 = (void *)sub_22617FCA0();
        (*(void (**)(char *, uint64_t))(v63 + 8))(v10, v43);
        id v51 = objc_msgSend(v50, sel_highestPriorityUnsatisfiedRequirement);

        if (v51)
        {
          type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
          *((void *)&v69 + 1) = v52;
          *(void *)&long long v68 = v51;
        }
        else
        {
          long long v68 = 0u;
          long long v69 = 0u;
        }
        sub_226177BAC((uint64_t)&v68, 0xD000000000000023, 0x8000000226184020);
        (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v48);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v67, v59);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v48);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v42, v44);
      }
    }
    else
    {
      unint64_t v53 = *(void (**)(char *, uint64_t))(v25 + 8);
      uint64_t v54 = v42;
      uint64_t v55 = v59;
      v53(v54, v59);
      v53(v20, v55);
    }
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v71);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for HDHearingTestDailyAnalyticsEvent()
{
  uint64_t result = qword_26ABFB248;
  if (!qword_26ABFB248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22617CEE4()
{
  return type metadata accessor for HDHearingTestDailyAnalyticsEvent();
}

uint64_t sub_22617CEEC()
{
  uint64_t result = sub_22617FBE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HDHearingTestDailyAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDHearingTestDailyAnalyticsEvent);
}

uint64_t dispatch thunk of HDHearingTestDailyAnalyticsEvent.__allocating_init(profile:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of HDHearingTestDailyAnalyticsEvent.makeUnrestrictedEventPayload(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HDHearingTestDailyAnalyticsEvent.makeIHAGatedEventPayload(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t sub_22617D068(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22617D0C8(uint64_t a1, uint64_t a2)
{
  sub_22617D790(0, &qword_26ABFB2B8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22617D154()
{
  if (!qword_26ABFB2A0)
  {
    unint64_t v0 = sub_22617FEC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABFB2A0);
    }
  }
}

uint64_t sub_22617D1C0(uint64_t a1)
{
  uint64_t v2 = sub_22617FC20();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_22617D4D4();
    uint64_t v9 = sub_22617FE30();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_22617D568(&qword_2681228B8, MEMORY[0x263F07908]);
      uint64_t v16 = sub_22617FD20();
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
          sub_22617D568(&qword_2681228C0, MEMORY[0x263F07908]);
          char v23 = sub_22617FD30();
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
        uint64_t v25 = v37;
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

void sub_22617D4D4()
{
  if (!qword_2681228B0)
  {
    sub_22617FC20();
    sub_22617D568(&qword_2681228B8, MEMORY[0x263F07908]);
    unint64_t v0 = sub_22617FE40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2681228B0);
    }
  }
}

uint64_t sub_22617D568(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22617D5B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

unint64_t sub_22617D610()
{
  unint64_t result = qword_26ABFB230;
  if (!qword_26ABFB230)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABFB230);
  }
  return result;
}

uint64_t sub_22617D668(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_22617D6BC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(uint64_t a1)
{
}

void sub_22617D790(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_22617D7DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_22617D840(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22617D87C()
{
  return sub_22617D568(&qword_268122938, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_22617D8C4()
{
  return sub_22617D568(&qword_268122940, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_22617D90C()
{
  return sub_22617D568(&qword_268122948, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_22617D954()
{
  uint64_t v0 = sub_22617FD00();
  __swift_allocate_value_buffer(v0, qword_26ABFB2C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26ABFB2C0);
  sub_22617FD70();
  return sub_22617FCF0();
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

uint64_t sub_22617FB50()
{
  return MEMORY[0x270EEE6D0]();
}

uint64_t sub_22617FB60()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_22617FB70()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_22617FB80()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22617FB90()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22617FBA0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22617FBB0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22617FBC0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22617FBD0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22617FBE0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22617FBF0()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_22617FC00()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_22617FC10()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22617FC20()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22617FC30()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22617FC40()
{
  return MEMORY[0x270F34F48]();
}

uint64_t sub_22617FC50()
{
  return MEMORY[0x270F34F50]();
}

uint64_t sub_22617FC60()
{
  return MEMORY[0x270F34F60]();
}

uint64_t sub_22617FC70()
{
  return MEMORY[0x270F34F68]();
}

uint64_t sub_22617FC80()
{
  return MEMORY[0x270F34F78]();
}

uint64_t sub_22617FC90()
{
  return MEMORY[0x270F34F88]();
}

uint64_t sub_22617FCA0()
{
  return MEMORY[0x270F34F90]();
}

uint64_t sub_22617FCB0()
{
  return MEMORY[0x270F34FA0]();
}

uint64_t sub_22617FCC0()
{
  return MEMORY[0x270F34FB0]();
}

uint64_t sub_22617FCD0()
{
  return MEMORY[0x270F35008]();
}

uint64_t sub_22617FCE0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22617FCF0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22617FD00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22617FD10()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22617FD20()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22617FD30()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22617FD40()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22617FD50()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22617FD60()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22617FD70()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22617FD80()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22617FD90()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22617FDA0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22617FDB0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22617FDC0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22617FDD0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22617FDE0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_22617FDF0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22617FE00()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22617FE10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22617FE20()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22617FE30()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22617FE40()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_22617FE50()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22617FE60()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22617FE70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22617FE80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22617FE90()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22617FEA0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22617FEB0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22617FEC0()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_22617FED0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22617FEF0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22617FF00()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22617FF10()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22617FF20()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22617FF30()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t HDCategorySampleEntityPredicateForValue()
{
  return MEMORY[0x270F31978]();
}

uint64_t HDDataEntityPredicateForCreationDate()
{
  return MEMORY[0x270F31988]();
}

uint64_t HDSQLiteBindDataToProperty()
{
  return MEMORY[0x270F31A48]();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return MEMORY[0x270F31A50]();
}

uint64_t HDSQLiteColumnWithNameAsData()
{
  return MEMORY[0x270F31AD0]();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return MEMORY[0x270F31AD8]();
}

uint64_t HDSampleEntityPredicateForDataType()
{
  return MEMORY[0x270F319F8]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x270F31A08]();
}

uint64_t HDSampleEntityPredicateForEndDate()
{
  return MEMORY[0x270F31A10]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x270F31A18]();
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge()
{
  return MEMORY[0x270EF35E8]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x270EF35F8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKDateMax()
{
  return MEMORY[0x270EF3688]();
}

uint64_t HKDateMin()
{
  return MEMORY[0x270EF3698]();
}

uint64_t HKHeadphoneAudioExposureEventType()
{
  return MEMORY[0x270F34EE0]();
}

uint64_t HKHeadphoneAudioExposureType()
{
  return MEMORY[0x270F34EE8]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x270EF3710]();
}

uint64_t HKLocalizedStringForHearingLevelClassification()
{
  return MEMORY[0x270EF3748]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x270EF3800]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x270EF3860]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKHearingTestAlgorithmVersionString()
{
  return MEMORY[0x270EF3968]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

uint64_t _HKStatisticsOptionAttenuateSamples()
{
  return MEMORY[0x270EF39B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t combineNoiseLevelDatums()
{
  return MEMORY[0x270F31A30]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}