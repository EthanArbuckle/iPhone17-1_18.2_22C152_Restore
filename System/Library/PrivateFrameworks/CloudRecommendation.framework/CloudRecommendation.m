uint64_t CECreateError(uint64_t a1)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudexperience" code:a1 userInfo:0];
}

id CECreateErrorWithMessage(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F08320];
  v9[0] = a2;
  v3 = NSDictionary;
  id v4 = a2;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudexperience" code:a1 userInfo:v5];

  return v6;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_24A2CEF04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!iCloudNotificationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __iCloudNotificationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265284618;
    uint64_t v6 = 0;
    iCloudNotificationLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!iCloudNotificationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("INDaemonConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getINDaemonConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudNotificationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudNotificationLibraryCore_frameworkLibrary = result;
  return result;
}

id getINDaemonConnectionClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getINDaemonConnectionClass_softClass_0;
  uint64_t v7 = getINDaemonConnectionClass_softClass_0;
  if (!getINDaemonConnectionClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getINDaemonConnectionClass_block_invoke_0;
    v3[3] = &unk_2652845F8;
    v3[4] = &v4;
    __getINDaemonConnectionClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A2CFAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __iCloudNotificationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2652846C8;
    uint64_t v6 = 0;
    iCloudNotificationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("INDaemonConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getINDaemonConnectionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudNotificationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  iCloudNotificationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

id OUTLINED_FUNCTION_0_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_24A2D5238(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24A2D534C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24A2D568C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
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

void __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _CELogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(a1, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

void sub_24A2D5914(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __47__iCloudStorageController_fetchStorageSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _CELogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__iCloudStorageController_fetchStorageSummary___block_invoke_cold_1(a1, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = [[iCloudStorageSummary alloc] initWithStorageSummary:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

void sub_24A2D5BB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __60__iCloudStorageController_fetchCloudStorageInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __getICQStoragePlanRecommendationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ICQStoragePlanRecommendation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getICQStoragePlanRecommendationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getICQStoragePlanRecommendationClass_block_invoke_cold_1();
    iCloudQuotaLibrary();
  }
}

void iCloudQuotaLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!iCloudQuotaLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __iCloudQuotaLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2652847A8;
    uint64_t v3 = 0;
    iCloudQuotaLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!iCloudQuotaLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __iCloudQuotaLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudQuotaLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getICQCloudStorageDataControllerClass_block_invoke(uint64_t a1)
{
  iCloudQuotaLibrary();
  Class result = objc_getClass("ICQCloudStorageDataController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getICQCloudStorageDataControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getICQCloudStorageDataControllerClass_block_invoke_cold_1();
    return (Class)__getICSHomeDataControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getICSHomeDataControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!iCloudSettingsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __iCloudSettingsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2652847C0;
    uint64_t v6 = 0;
    iCloudSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!iCloudSettingsLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("ICSHomeDataController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getICSHomeDataControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getICSHomeDataControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id _CELogSystem()
{
  if (_CELogSystem_onceToken != -1) {
    dispatch_once(&_CELogSystem_onceToken, &__block_literal_global);
  }
  v0 = (void *)_CELogSystem_log;
  return v0;
}

id _CESignpostLogSystem()
{
  if (_CESignpostLogSystem_onceToken != -1) {
    dispatch_once(&_CESignpostLogSystem_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_CESignpostLogSystem_log;
  return v0;
}

os_signpost_id_t _CESignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

os_signpost_id_t _CESignpostCreateWithObject(NSObject *a1, const void *a2)
{
  os_signpost_id_t v2 = os_signpost_id_make_with_pointer(a1, a2);
  mach_continuous_time();
  return v2;
}

unint64_t _CESignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  if (_CESignpostGetNanoseconds_onceToken[0] != -1) {
    dispatch_once(_CESignpostGetNanoseconds_onceToken, &__block_literal_global_7);
  }
  uint64_t v3 = mach_continuous_time();
  LODWORD(v4) = _CESignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_26978A56C;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

id sub_24A2DA4BC()
{
  id result = objc_msgSend(self, sel_defaultStore);
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    id v2 = objc_msgSend(self, sel_defaultCenter);
    type metadata accessor for ClientRecommendationsCache();
    uint64_t v3 = swift_allocObject();
    id result = (id)sub_24A2DA5B4(v1, (uint64_t)v2);
    qword_26978AE80 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t (*sub_24A2DA55C())()
{
  return j__swift_endAccess;
}

uint64_t sub_24A2DA5B4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269789F78);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(void *)(v2 + 16) = v5;
  *(void *)(v2 + 24) = sub_24A2F58B0();
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(void *)(v2 + 32) = sub_24A2E01C4(MEMORY[0x263F8EE78]);
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  return v2;
}

uint64_t sub_24A2DA644()
{
  sub_24A2DAF14();
  swift_release();

  swift_bridgeObjectRelease();
  sub_24A2DB5BC((uint64_t)(v0 + 5));

  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for ClientRecommendationsCache()
{
  return self;
}

void sub_24A2DA6CC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = (os_unfair_lock_s *)(*(void *)(v3 + 16) + 16);
  os_unfair_lock_lock(v5);
  uint64_t v6 = (os_unfair_lock_s *)sub_24A2E02E0(MEMORY[0x263F8EE78]);
  if (a3 >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A2F5B80();
    lock = v5;
    if (v7) {
      goto LABEL_3;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = *(void *)(v32 + 32);
    *(void *)(v32 + 32) = 0x8000000000000000;
    sub_24A2DB728((uint64_t)v6, a1, a2, isUniquelyReferenced_nonNull_native);
    *(void *)(v32 + 32) = v38;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    os_unfair_lock_unlock(lock);
    return;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  lock = v5;
  if (!v7) {
    goto LABEL_25;
  }
LABEL_3:
  unint64_t v35 = a3;
  unint64_t v36 = a3 & 0xC000000000000001;
  uint64_t v8 = 4;
  while (1)
  {
    uint64_t v5 = (os_unfair_lock_s *)(v8 - 4);
    if (v36) {
      id v11 = (id)MEMORY[0x24C5C0580](v8 - 4, a3);
    }
    else {
      id v11 = *(id *)(a3 + 8 * v8);
    }
    v12 = v11;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v37 = v8 - 3;
    id v13 = objc_msgSend(v11, sel_identifier);
    uint64_t v14 = sub_24A2F58E0();
    uint64_t v16 = v15;

    id v17 = v12;
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    v39 = v6;
    uint64_t v5 = v6;
    unint64_t v20 = sub_24A2EB0BC(v14, v16);
    uint64_t v21 = *(void *)&v6[4]._os_unfair_lock_opaque;
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      goto LABEL_22;
    }
    a3 = v19;
    if (*(void *)&v6[6]._os_unfair_lock_opaque < v23) {
      break;
    }
    if (v18)
    {
      uint64_t v6 = v39;
      if (v19) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = (os_unfair_lock_s *)&v39;
      sub_24A2EBD18();
      uint64_t v6 = v39;
      if (a3)
      {
LABEL_4:
        uint64_t v9 = *(void *)&v6[14]._os_unfair_lock_opaque;
        uint64_t v10 = 8 * v20;

        *(void *)(v9 + v10) = v17;
        goto LABEL_5;
      }
    }
LABEL_17:
    *(void *)&v6[2 * (v20 >> 6) + 16]._os_unfair_lock_opaque |= 1 << v20;
    v26 = (uint64_t *)(*(void *)&v6[12]._os_unfair_lock_opaque + 16 * v20);
    uint64_t *v26 = v14;
    v26[1] = v16;
    *(void *)(*(void *)&v6[14]._os_unfair_lock_opaque + 8 * v20) = v17;
    uint64_t v27 = *(void *)&v6[4]._os_unfair_lock_opaque;
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_23;
    }
    *(void *)&v6[4]._os_unfair_lock_opaque = v29;
    swift_bridgeObjectRetain();
LABEL_5:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v8;
    a3 = v35;
    if (v37 == v7) {
      goto LABEL_25;
    }
  }
  sub_24A2EB530(v23, v18);
  uint64_t v5 = v39;
  unint64_t v24 = sub_24A2EB0BC(v14, v16);
  if ((a3 & 1) == (v25 & 1))
  {
    unint64_t v20 = v24;
    uint64_t v6 = v39;
    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  sub_24A2F5C40();
  __break(1u);
}

void sub_24A2DA9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (os_unfair_lock_s *)(*(void *)(v2 + 16) + 16);
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 32);
  if (!*(void *)(v6 + 16)) {
    goto LABEL_28;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_24A2EB0BC(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_28:
    os_unfair_lock_unlock(v5);
    return;
  }
  uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  int64_t v10 = 0;
  uint64_t v11 = v9 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v9 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    while (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v10 << 6);
      if (v22) {
        goto LABEL_23;
      }
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v15) {
      goto LABEL_27;
    }
    unint64_t v19 = *(void *)(v11 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v15) {
        goto LABEL_27;
      }
      unint64_t v19 = *(void *)(v11 + 8 * v10);
      if (!v19)
      {
        int64_t v10 = v18 + 2;
        if (v18 + 2 >= v15) {
          goto LABEL_27;
        }
        unint64_t v19 = *(void *)(v11 + 8 * v10);
        if (!v19) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v10 << 6);
    if (v22)
    {
LABEL_23:
      id v21 = *(id *)(*(void *)(v9 + 56) + 8 * v17);
      MEMORY[0x24C5C0350]();
      if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24A2F5960();
      }
      sub_24A2F5970();
      sub_24A2F5950();
    }
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v15)
  {
LABEL_27:
    swift_release();
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v11 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v15) {
      goto LABEL_27;
    }
    unint64_t v19 = *(void *)(v11 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_30:
  __break(1u);
}

void sub_24A2DAC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(v4 + 16) + 16);
  os_unfair_lock_lock(v9);
  uint64_t v35 = 0;
  swift_beginAccess();
  uint64_t v10 = *(void *)(v4 + 32);
  if (!*(void *)(v10 + 16)) {
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_24A2EB0BC(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_37:
    os_unfair_lock_unlock(v9);
    return;
  }
  v33 = v9;
  uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v14 = 0;
  uint64_t v34 = v13 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v13 + 64);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      unint64_t v21 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v22 = v21 | (v14 << 6);
      goto LABEL_29;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v23 >= v18) {
      goto LABEL_36;
    }
    unint64_t v24 = *(void *)(v34 + 8 * v23);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v18) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v34 + 8 * v14);
      if (!v24)
      {
        int64_t v14 = v23 + 2;
        if (v23 + 2 >= v18) {
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v34 + 8 * v14);
        if (!v24) {
          break;
        }
      }
    }
LABEL_28:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_29:
    id v26 = *(id *)(*(void *)(v13 + 56) + 8 * v22);
    id v27 = objc_msgSend(v26, sel_bundleID);
    uint64_t v28 = sub_24A2F58E0();
    uint64_t v30 = v29;

    if (v28 == a3 && v30 == a4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v32 = sub_24A2F5C10();
      swift_bridgeObjectRelease();
      if ((v32 & 1) == 0) {
        goto LABEL_12;
      }
    }
    uint64_t v19 = v35;
    if (!v35) {
      uint64_t v19 = MEMORY[0x263F8EE78];
    }
    uint64_t v35 = v19;
    id v20 = v26;
    MEMORY[0x24C5C0350]();
    if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24A2F5960();
    }
    sub_24A2F5970();
    sub_24A2F5950();
LABEL_12:
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v18)
  {
LABEL_36:
    swift_release();
    uint64_t v9 = v33;
    goto LABEL_37;
  }
  unint64_t v24 = *(void *)(v34 + 8 * v25);
  if (v24)
  {
    int64_t v14 = v25;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v14 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v14 >= v18) {
      goto LABEL_36;
    }
    unint64_t v24 = *(void *)(v34 + 8 * v14);
    ++v25;
    if (v24) {
      goto LABEL_28;
    }
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_24A2DAF14()
{
  swift_beginAccess();
  sub_24A2DB510(v0 + 40, (uint64_t)&v4);
  if (v5)
  {
    sub_24A2DB684(&v4, &v6);
    uint64_t v1 = *(void **)(v0 + 80);
    __swift_project_boxed_opaque_existential_0(&v6, *((uint64_t *)&v7 + 1));
    id v2 = v1;
    objc_msgSend(v2, sel_removeObserver_, sub_24A2F5C00());

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
  }
  else
  {
    sub_24A2DB5BC((uint64_t)&v4);
  }
  long long v6 = 0u;
  long long v7 = 0u;
  swift_beginAccess();
  sub_24A2DB61C((uint64_t)&v6, v0 + 40);
  return swift_endAccess();
}

void type metadata accessor for Name(uint64_t a1)
{
}

uint64_t sub_24A2DB020(uint64_t a1, uint64_t a2)
{
  return sub_24A2DB344(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24A2DB038(uint64_t a1, id *a2)
{
  uint64_t result = sub_24A2F58C0();
  *a2 = 0;
  return result;
}

uint64_t sub_24A2DB0B0(uint64_t a1, id *a2)
{
  char v3 = sub_24A2F58D0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24A2DB130@<X0>(uint64_t *a1@<X8>)
{
  sub_24A2F58E0();
  uint64_t v2 = sub_24A2F58B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A2DB174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24A2F58B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A2DB1BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A2F58E0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A2DB1E8(uint64_t a1)
{
  uint64_t v2 = sub_24A2DB2E8(&qword_269789F60);
  uint64_t v3 = sub_24A2DB2E8(&qword_269789F68);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24A2DB280()
{
  return sub_24A2DB2E8(&qword_269789F48);
}

uint64_t sub_24A2DB2B4()
{
  return sub_24A2DB2E8(&qword_269789F50);
}

uint64_t sub_24A2DB2E8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Name(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A2DB32C(uint64_t a1, uint64_t a2)
{
  return sub_24A2DB344(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24A2DB344(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24A2F58E0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24A2DB388()
{
  sub_24A2F58E0();
  sub_24A2F58F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A2DB3DC()
{
  sub_24A2F58E0();
  sub_24A2F5CB0();
  sub_24A2F58F0();
  uint64_t v0 = sub_24A2F5CD0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A2DB450()
{
  uint64_t v0 = sub_24A2F58E0();
  uint64_t v2 = v1;
  if (v0 == sub_24A2F58E0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24A2F5C10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24A2DB4DC()
{
  return sub_24A2DB2E8(&qword_269789F58);
}

uint64_t sub_24A2DB510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269789F70);
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

uint64_t sub_24A2DB5BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269789F70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A2DB61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269789F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24A2DB684(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

uint64_t sub_24A2DB728(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24A2EB0BC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24A2EBB60();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24A2EB218(v15, a4 & 1);
  unint64_t v21 = sub_24A2EB0BC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_24A2F5C40();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  int64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *int64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A2DB898(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24A2EB0BC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24A2EBD24();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24A2EB53C(v15, a4 & 1);
  unint64_t v21 = sub_24A2EB0BC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_24A2F5C40();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  int64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *int64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

unint64_t sub_24A2DBA08(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  char v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_24A2DBA64(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t CERecommendation.id.getter()
{
  id v1 = objc_msgSend(v0, sel_identifier);
  uint64_t v2 = sub_24A2F58E0();

  return v2;
}

Swift::Bool __swiftcall CERecommendation.hasDataclassAction()()
{
  id v1 = objc_msgSend(v0, sel_actions);
  sub_24A2DBC3C();
  unint64_t v2 = sub_24A2F5930();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C5C0580](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      self;
      uint64_t v8 = swift_dynamicCastObjCClass();
      Swift::Bool v9 = v8 != 0;

      ++v4;
      if (v8) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v7 == v3;
      }
      if (v10) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
  }
  Swift::Bool v9 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_24A2DBC3C()
{
  unint64_t result = qword_269789F88;
  if (!qword_269789F88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269789F88);
  }
  return result;
}

uint64_t sub_24A2DBC7C()
{
  return MEMORY[0x263F8D320];
}

void sub_24A2DBC88(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_identifier);
  uint64_t v4 = sub_24A2F58E0();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t sub_24A2DBCE0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void), uint64_t a6)
{
  uint64_t v12 = sub_24A2F5810();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v16 = *(void *)(a4 + 16);
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  sub_24A2DFD38(v16);
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v12, (uint64_t)qword_26978AE88);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v17, v12);
  swift_bridgeObjectRetain_n();
  int64_t v18 = sub_24A2F57F0();
  os_log_type_t v19 = sub_24A2F5A10();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v36 = a3;
    uint64_t v22 = v21;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v40 = v35;
    *(_DWORD *)uint64_t v22 = 136315906;
    uint64_t v37 = a6;
    uint64_t v23 = sub_24A2F0E74(0xD000000000000076, 0x800000024A2F8C50, &v40);
    uint64_t v38 = a5;
    uint64_t v39 = v23;
    sub_24A2F5AC0();
    HIDWORD(v34) = v20;
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v39 = sub_24A2F0E74(0xD000000000000032, 0x800000024A2F8CD0, &v40);
    sub_24A2F5AC0();
    *(_WORD *)(v22 + 22) = 2080;
    if (a2) {
      uint64_t v24 = 561210745;
    }
    else {
      uint64_t v24 = 2191214;
    }
    if (a2) {
      unint64_t v25 = 0xE400000000000000;
    }
    else {
      unint64_t v25 = 0xE300000000000000;
    }
    uint64_t v39 = sub_24A2F0E74(v24, v25, &v40);
    sub_24A2F5AC0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 32) = 2080;
    uint64_t v26 = sub_24A2E0134(0, &qword_26978A028);
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v28 = MEMORY[0x24C5C0380](v27, v26);
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v39 = sub_24A2F0E74(v28, v30, &v40);
    a5 = v38;
    sub_24A2F5AC0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A2CB000, v18, BYTE4(v34), "%s%s Donated recommendations (didTimeout? %s) %s", (uint8_t *)v22, 0x2Au);
    uint64_t v31 = v35;
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v31, -1, -1);
    uint64_t v32 = v22;
    a3 = v36;
    MEMORY[0x24C5C0F80](v32, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return a5(a1, a3);
}

uint64_t sub_24A2DC0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24A2F5CB0();
    sub_24A2F58F0();
    uint64_t v6 = sub_24A2F5CD0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      char v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24A2F5C10() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24A2F5C10() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24A2DC1E8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A048);
    uint64_t v2 = sub_24A2F5BB0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
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
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    BOOL v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    os_log_type_t v19 = *(void **)(*(void *)(a1 + 56) + 8 * v12);
    *(void *)&v37[0] = *v17;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    v19;
    swift_dynamicCast();
    sub_24A2E0134(0, &qword_26978A018);
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_24A2DB684(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_24A2DB684(v36, v37);
    sub_24A2DB684(v37, &v33);
    uint64_t result = sub_24A2F5B00();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_24A2DB684(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24A2E00D4();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_24A2DC5AC(unint64_t a1, void *a2, uint64_t a3, NSObject *a4, uint64_t a5, NSObject *a6)
{
  uint64_t v76 = a5;
  uint64_t v11 = sub_24A2F57B0();
  uint64_t v78 = *(void *)(v11 - 8);
  uint64_t v79 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v74 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v77 = (char *)&v71 - v14;
  uint64_t v15 = sub_24A2F5780();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  os_log_type_t v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v22 = (char *)&v71 - v21;
  MEMORY[0x270FA5388](v20);
  unint64_t v24 = (char *)&v71 - v23;
  v80 = v19;
  if (a2)
  {
    id v25 = a2;
    if (qword_269789F28 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24A2F5810();
    __swift_project_value_buffer(v26, (uint64_t)qword_26978AE88);
    int64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    uint64_t v73 = a3;
    v27(v24, a3, v15);
    id v28 = a2;
    id v29 = a2;
    long long v30 = sub_24A2F57F0();
    os_log_type_t v31 = sub_24A2F5A20();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v75 = a6;
      v71 = (void *)v33;
      uint64_t v72 = swift_slowAlloc();
      v82[0] = v72;
      *(_DWORD *)uint64_t v32 = 136315394;
      uint64_t v34 = v16;
      uint64_t v35 = v15;
      sub_24A2E00EC(&qword_26978A020, MEMORY[0x263F06EA8]);
      uint64_t v36 = sub_24A2F5BE0();
      uint64_t v81 = sub_24A2F0E74(v36, v37, v82);
      sub_24A2F5AC0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v15);
      *(_WORD *)(v32 + 12) = 2112;
      id v38 = a2;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v81 = v39;
      sub_24A2F5AC0();
      uint64_t v40 = v71;
      void *v71 = v39;
      uint64_t v15 = v35;
      uint64_t v16 = v34;

      _os_log_impl(&dword_24A2CB000, v30, v31, "Could not fetch recommendations from %s due to %@", (uint8_t *)v32, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26978A030);
      swift_arrayDestroy();
      a6 = v75;
      MEMORY[0x24C5C0F80](v40, -1, -1);
      uint64_t v41 = v72;
      swift_arrayDestroy();
      MEMORY[0x24C5C0F80](v41, -1, -1);
      MEMORY[0x24C5C0F80](v32, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v16 + 8))(v24, v15);
    }
    a3 = v73;
  }
  else
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v70 = sub_24A2F5B80();
      swift_bridgeObjectRelease();
      if (!v70) {
        goto LABEL_19;
      }
    }
    else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_19;
    }
    v42 = a4 + 2;
    if (qword_269789F28 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_24A2F5810();
    __swift_project_value_buffer(v43, (uint64_t)qword_26978AE88);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v22, a3, v15);
    swift_bridgeObjectRetain_n();
    v44 = sub_24A2F57F0();
    int v45 = sub_24A2F5A10();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      LODWORD(v72) = v45;
      v75 = v42;
      uint64_t v46 = swift_slowAlloc();
      v71 = (void *)swift_slowAlloc();
      v82[0] = (uint64_t)v71;
      *(_DWORD *)uint64_t v46 = 134218242;
      uint64_t v73 = a3;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v47 = sub_24A2F5B80();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v47 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      uint64_t v81 = v47;
      sub_24A2F5AC0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      sub_24A2E00EC(&qword_26978A020, MEMORY[0x263F06EA8]);
      uint64_t v48 = sub_24A2F5BE0();
      uint64_t v81 = sub_24A2F0E74(v48, v49, v82);
      sub_24A2F5AC0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
      _os_log_impl(&dword_24A2CB000, v44, (os_log_type_t)v72, "Loading %ld recommendations from %s", (uint8_t *)v46, 0x16u);
      v50 = v71;
      swift_arrayDestroy();
      MEMORY[0x24C5C0F80](v50, -1, -1);
      MEMORY[0x24C5C0F80](v46, -1, -1);

      a3 = v73;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
    }
    swift_beginAccess();
    unint64_t v51 = swift_bridgeObjectRetain();
    sub_24A2DCFAC(v51);
    swift_endAccess();
  }
LABEL_19:
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_24A2F5810();
  __swift_project_value_buffer(v52, (uint64_t)qword_26978AE88);
  v54 = v77;
  uint64_t v53 = v78;
  uint64_t v55 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v77, v76, v79);
  v56 = v80;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v80, a3, v15);
  v57 = sub_24A2F57F0();
  os_log_type_t v58 = sub_24A2F5A30();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = swift_slowAlloc();
    uint64_t v73 = v16;
    uint64_t v60 = v59;
    uint64_t v61 = swift_slowAlloc();
    v75 = a6;
    uint64_t v76 = v61;
    v82[0] = v61;
    *(_DWORD *)uint64_t v60 = 134218242;
    v62 = v74;
    sub_24A2F57A0();
    sub_24A2F5790();
    uint64_t v64 = v63;
    v65 = *(void (**)(char *, uint64_t))(v53 + 8);
    v65(v62, v55);
    uint64_t v81 = v64;
    sub_24A2F5AC0();
    v65(v54, v55);
    *(_WORD *)(v60 + 12) = 2080;
    sub_24A2E00EC(&qword_26978A020, MEMORY[0x263F06EA8]);
    v66 = v80;
    uint64_t v67 = sub_24A2F5BE0();
    uint64_t v81 = sub_24A2F0E74(v67, v68, v82);
    sub_24A2F5AC0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v66, v15);
    _os_log_impl(&dword_24A2CB000, v57, v58, "It took %f seconds to check recommendations at %s", (uint8_t *)v60, 0x16u);
    uint64_t v69 = v76;
    swift_arrayDestroy();
    a6 = v75;
    MEMORY[0x24C5C0F80](v69, -1, -1);
    MEMORY[0x24C5C0F80](v60, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v56, v15);
  }

  dispatch_group_leave(a6);
}

uint64_t sub_24A2DCFAC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x24C5C0590](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *id v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24A2DD8C4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24A2F5950();
}

uint64_t sub_24A2DD178(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x24C5C0590](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *id v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24A2DDAF8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24A2F5950();
}

void sub_24A2DD344(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_24A2E0134(0, &qword_26978A028);
  uint64_t v5 = sub_24A2F5930();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_24A2DD3F4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = swift_beginAccess();
  id v6 = *(void (**)(uint64_t, void, void))(a1 + 16);
  if (v6)
  {
    swift_beginAccess();
    sub_24A2E00DC((uint64_t)v6);
    uint64_t v7 = swift_bridgeObjectRetain();
    v6(v7, a3 & 1, 0);
    sub_24A2DFD38((uint64_t)v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A2DD4A8(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24A2DD4EC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for RecommendationsPluginLoader()
{
  return self;
}

uint64_t sub_24A2DD558()
{
  v5[0] = sub_24A2F5A70();
  uint64_t v1 = *(void *)(v5[0] - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A2F5A50();
  MEMORY[0x270FA5388]();
  sub_24A2F5860();
  MEMORY[0x270FA5388]();
  *(void *)(v0 + 16) = 0xD000000000000014;
  *(void *)(v0 + 24) = 0x800000024A2F8D10;
  strcpy((char *)(v0 + 32), "ClientSources");
  *(_WORD *)(v0 + 46) = -4864;
  *(void *)(v0 + 48) = 5;
  sub_24A2E0134(0, &qword_26978A050);
  sub_24A2F5840();
  v5[1] = MEMORY[0x263F8EE78];
  sub_24A2E00EC(&qword_26978A058, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A060);
  sub_24A2E0170(&qword_26978A068, &qword_26978A060);
  sub_24A2F5AE0();
  (*(void (**)(char *, void, void))(v1 + 104))(v3, *MEMORY[0x263F8F130], v5[0]);
  *(void *)(v0 + 56) = sub_24A2F5A90();
  return v0;
}

void sub_24A2DD80C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24A2F5AC0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_24A2DD8C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24A2E0170(&qword_26978A040, &qword_26978A038);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26978A038);
          uint64_t v12 = sub_24A2EC088(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_24A2E0134(0, &qword_26978A028);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24A2F5BC0();
  __break(1u);
  return result;
}

uint64_t sub_24A2DDAF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24A2E0170((unint64_t *)&unk_26978A080, &qword_26978A078);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26978A078);
          uint64_t v12 = sub_24A2EC0F4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_24A2E0134(0, &qword_26978A070);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24A2F5BC0();
  __break(1u);
  return result;
}

uint64_t sub_24A2DDD2C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void (*a8)(char *, uint64_t), uint64_t a9)
{
  v258 = a4;
  uint64_t v215 = a3;
  uint64_t v214 = a2;
  uint64_t v218 = a1;
  uint64_t v240 = sub_24A2F57B0();
  uint64_t v227 = *(void *)(v240 - 8);
  BOOL v13 = *(void (***)(char *, uint64_t))(v227 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v240);
  v226 = (char *)&v204 - (((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v242 = (char *)&v204 - v15;
  uint64_t v224 = sub_24A2F5730();
  uint64_t v223 = *(void *)(v224 - 8);
  MEMORY[0x270FA5388](v224);
  v230 = (char *)&v204 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v239 = sub_24A2F5830();
  uint64_t v17 = *(void *)(v239 - 8);
  MEMORY[0x270FA5388](v239);
  v238 = (char *)&v204 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v237 = sub_24A2F5860();
  uint64_t v243 = *(void *)(v237 - 8);
  MEMORY[0x270FA5388](v237);
  v236 = (char *)&v204 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v222 = (void **)sub_24A2F5820();
  uint64_t v221 = (uint64_t)*(v222 - 1);
  MEMORY[0x270FA5388](v222);
  v220 = (id *)((char *)&v204 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v249 = (char **)sub_24A2F5880();
  uint64_t v262 = (uint64_t)*(v249 - 1);
  uint64_t v21 = MEMORY[0x270FA5388](v249);
  v219 = (char *)&v204 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v248 = (char *)&v204 - v23;
  uint64_t v24 = sub_24A2F5740();
  v259 = *(void (**)(char *, char *, uint64_t))(v24 - 8);
  uint64_t v260 = v24;
  MEMORY[0x270FA5388](v24);
  v261 = (char *)&v204 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_24A2F5780();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v257 = (char *)&v204 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v225 = (char *)&v204 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v254 = (char *)&v204 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v253 = (char *)&v204 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v256 = (char *)&v204 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v247 = (char *)&v204 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v250 = (char *)&v204 - v41;
  v216 = v42;
  MEMORY[0x270FA5388](v40);
  v245 = (char *)&v204 - v43;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269789F90);
  uint64_t v45 = MEMORY[0x270FA5388](v44 - 8);
  v233 = (char *)&v204 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v235 = (uint8_t *)&v204 - v48;
  MEMORY[0x270FA5388](v47);
  v50 = (char *)&v204 - v49;
  unint64_t v51 = (void *)swift_allocObject();
  v51[2] = a5;
  v51[3] = a6;
  v51[4] = a7;
  v51[5] = a8;
  v213 = a8;
  v241 = v51;
  v51[6] = a9;
  uint64_t v52 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v212 = a9;
  swift_bridgeObjectRetain();
  *(void *)&long long v246 = v52;
  id v53 = objc_msgSend(v52, sel_defaultManager);
  id v54 = objc_msgSend(v53, sel_URLsForDirectory_inDomains_, 5, 8);

  uint64_t v55 = sub_24A2F5930();
  uint64_t v56 = *(void *)(v55 + 16);
  uint64_t v251 = v27;
  uint64_t v244 = v17;
  v217 = v13;
  id v229 = a6;
  uint64_t v228 = a7;
  uint64_t v232 = v26;
  if (v56)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v50, v55 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80)), v26);
    v57 = *(void (**)(void, void, void, void))(v27 + 56);
    unint64_t v58 = (v27 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v59 = v50;
    uint64_t v60 = 0;
  }
  else
  {
    v57 = *(void (**)(void, void, void, void))(v27 + 56);
    unint64_t v58 = (v27 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v59 = v50;
    uint64_t v60 = 1;
  }
  v255 = v57;
  v57(v59, v60, 1, v26);
  uint64_t v61 = (uint64_t)v50;
  swift_bridgeObjectRelease();
  v62 = v258;
  unint64_t v252 = v258[2];
  uint64_t v63 = *MEMORY[0x263F06E30];
  uint64_t v64 = v260;
  v65 = (void (*)(char *, uint64_t, uint64_t))*((void *)v259 + 13);
  v66 = v261;
  v65(v261, v63, v260);
  uint64_t v234 = v61;
  uint64_t v67 = (uint64_t)v235;
  sub_24A2DFB74(v61, (uint64_t)v235);
  swift_bridgeObjectRetain();
  unint64_t v68 = v245;
  sub_24A2F5770();
  dispatch_group_t v231 = (dispatch_group_t)v62[4];
  v65(v66, v63, v64);
  uint64_t v69 = v251;
  uint64_t v71 = v251 + 16;
  uint64_t v70 = *(void (**)(uint64_t, char *, uint64_t))(v251 + 16);
  uint64_t v72 = v232;
  v70(v67, v68, v232);
  unint64_t v252 = v58;
  uint64_t v73 = v255;
  v255(v67, 0, 1, v72);
  swift_bridgeObjectRetain();
  v74 = v250;
  sub_24A2F5770();
  uint64_t v75 = v69;
  uint64_t v76 = v72;
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v77 = sub_24A2F5810();
  uint64_t v78 = __swift_project_value_buffer(v77, (uint64_t)qword_26978AE88);
  uint64_t v79 = v247;
  uint64_t v260 = v71;
  v70((uint64_t)v247, v74, v76);
  v261 = (char *)v78;
  v80 = sub_24A2F57F0();
  os_log_type_t v81 = sub_24A2F5A30();
  BOOL v82 = os_log_type_enabled(v80, v81);
  uint64_t v83 = (uint64_t)v233;
  v259 = (void (*)(char *, char *, uint64_t))v70;
  if (v82)
  {
    v84 = (uint8_t *)swift_slowAlloc();
    uint64_t v85 = swift_slowAlloc();
    uint64_t aBlock = v85;
    *(_DWORD *)v84 = 136315138;
    v235 = v84 + 4;
    uint64_t v86 = sub_24A2F5750();
    uint64_t v264 = sub_24A2F0E74(v86, v87, &aBlock);
    sub_24A2F5AC0();
    swift_bridgeObjectRelease();
    v88 = *(void (**)(char *, uint64_t))(v251 + 8);
    v88(v79, v76);
    os_log_type_t v89 = v81;
    v90 = v88;
    _os_log_impl(&dword_24A2CB000, v80, v89, "Preparing to fetch client donated recommendations from %s", v84, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v85, -1, -1);
    MEMORY[0x24C5C0F80](v84, -1, -1);
  }
  else
  {
    v90 = *(void (**)(char *, uint64_t))(v75 + 8);
    v90(v79, v76);
  }

  v91 = v256;
  v92 = (void *)v246;
  uint64_t v93 = swift_allocObject();
  uint64_t v94 = MEMORY[0x263F8EE78];
  *(void *)(v93 + 16) = MEMORY[0x263F8EE78];
  id v95 = objc_msgSend(v92, sel_defaultManager);
  v96 = v250;
  v97 = (void *)sub_24A2F5A00();

  if (v97)
  {
    dispatch_group_t v231 = dispatch_group_create();
    uint64_t v98 = swift_allocObject();
    *(void *)(v98 + 24) = 0;
    *(void *)(v98 + 16) = 0;
    v99 = (void *)swift_allocObject();
    v99[2] = v98;
    v99[3] = sub_24A2DFB64;
    v235 = (uint8_t *)v93;
    v99[4] = v241;
    swift_beginAccess();
    uint64_t v100 = *(void *)(v98 + 16);
    id v229 = v97;
    *(void *)(v98 + 16) = sub_24A2DFD2C;
    *(void *)(v98 + 24) = v99;
    swift_retain();
    swift_retain();
    sub_24A2DFD38(v100);
    uint64_t v228 = v258[7];
    v101 = v219;
    sub_24A2F5870();
    v102 = v220;
    void *v220 = 5;
    uint64_t v103 = v221;
    v104 = v222;
    (*(void (**)(void *, void, void **))(v221 + 104))(v102, *MEMORY[0x263F8F018], v222);
    MEMORY[0x24C5C02D0](v101, v102);
    (*(void (**)(void *, void **))(v103 + 8))(v102, v104);
    v105 = *(void **)(v262 + 8);
    v262 += 8;
    v258 = v105;
    ((void (*)(char *, char **))v105)(v101, v249);
    uint64_t v106 = swift_allocObject();
    uint64_t v107 = (uint64_t)v235;
    *(void *)(v106 + 16) = v98;
    *(void *)(v106 + 24) = v107;
    v270 = sub_24A2DFD4C;
    uint64_t v271 = v106;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v267 = 1107296256;
    v222 = &v268;
    v268 = sub_24A2DD4A8;
    v269 = &block_descriptor_0;
    v108 = _Block_copy(&aBlock);
    uint64_t v221 = v98;
    swift_retain();
    swift_retain();
    v109 = v236;
    sub_24A2F5840();
    uint64_t v264 = MEMORY[0x263F8EE78];
    uint64_t v110 = sub_24A2E00EC(&qword_269789F98, MEMORY[0x263F8F030]);
    uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269789FA0);
    uint64_t v112 = sub_24A2E0170(&qword_269789FA8, &qword_269789FA0);
    v113 = v238;
    v219 = (char *)v111;
    uint64_t v212 = v112;
    uint64_t v114 = v239;
    v220 = (void *)v110;
    sub_24A2F5AE0();
    v115 = v248;
    MEMORY[0x24C5C04A0](v248, v109, v113, v108);
    _Block_release(v108);
    v116 = *(void (**)(char *, uint64_t))(v244 + 8);
    v244 += 8;
    v213 = v116;
    v116(v113, v114);
    v117 = *(void (**)(char *, uint64_t))(v243 + 8);
    v243 += 8;
    v211 = v117;
    v117(v109, v237);
    ((void (*)(char *, char **))v258)(v115, v249);
    swift_release();
    v118 = v230;
    sub_24A2F59F0();
    sub_24A2F5720();
    v120 = v257;
    v121 = v253;
    if (v265)
    {
      v122 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v251 + 48);
      v249 = (char **)(v251 + 32);
      v258 = (void *)(v251 + 8);
      uint64_t v210 = v227 + 16;
      v209 = v216 + 7;
      v208 = (char *)v217 + 7;
      uint64_t v207 = v227 + 32;
      v217 = (void (**)(char *, uint64_t))(v227 + 8);
      uint64_t v262 = MEMORY[0x263F8EE58] + 8;
      *(void *)&long long v119 = 136315138;
      long long v246 = v119;
      v255 = v73;
      v248 = (char *)(v251 + 48);
      do
      {
        if (swift_dynamicCast())
        {
          v73(v83, 0, 1, v76);
          if ((*v122)(v83, 1, v76) != 1)
          {
            v247 = *v249;
            ((void (*)(char *, uint64_t, uint64_t))v247)(v91, v83, v76);
            v259(v121, v91, v76);
            v123 = sub_24A2F57F0();
            os_log_type_t v124 = sub_24A2F5A10();
            if (os_log_type_enabled(v123, v124))
            {
              v125 = v121;
              uint64_t v126 = swift_slowAlloc();
              uint64_t v127 = swift_slowAlloc();
              uint64_t aBlock = v127;
              *(_DWORD *)uint64_t v126 = v246;
              sub_24A2E00EC(&qword_26978A020, MEMORY[0x263F06EA8]);
              uint64_t v128 = sub_24A2F5BE0();
              *(void *)(v126 + 4) = sub_24A2F0E74(v128, v129, &aBlock);
              swift_bridgeObjectRelease();
              v130 = (void (*)(char *, uint64_t))*v258;
              v131 = v125;
              v91 = v256;
              ((void (*)(char *, uint64_t))*v258)(v131, v76);
              _os_log_impl(&dword_24A2CB000, v123, v124, "Visiting %s", (uint8_t *)v126, 0xCu);
              swift_arrayDestroy();
              uint64_t v132 = v127;
              v120 = v257;
              MEMORY[0x24C5C0F80](v132, -1, -1);
              MEMORY[0x24C5C0F80](v126, -1, -1);
            }
            else
            {
              v130 = (void (*)(char *, uint64_t))*v258;
              ((void (*)(char *, uint64_t))*v258)(v121, v76);
            }

            v133 = v254;
            id v134 = objc_allocWithZone(MEMORY[0x263F086E0]);
            v135 = (void *)sub_24A2F5760();
            v136 = (char *)objc_msgSend(v134, sel_initWithURL_, v135);

            if (v136)
            {
              if (objc_msgSend(v136, sel_principalClass))
              {
                swift_getObjCClassMetadata();
                sub_24A2E0134(0, &qword_269789FB0);
                if (swift_dynamicCastMetatype())
                {
                  sub_24A2F57A0();
                  v137 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
                  v263 = &unk_26FE0A378;
                  uint64_t v138 = swift_dynamicCastObjCProtocolConditional();
                  if (v138)
                  {
                    v139 = (void *)v138;
                    uint64_t v140 = v218;
                    uint64_t v141 = *(void *)(v218 + 16);
                    v216 = v137;
                    if (!v141) {
                      goto LABEL_26;
                    }
                    id v142 = objc_msgSend(v139, sel_bundleID);
                    v143 = v139;
                    uint64_t v144 = sub_24A2F58E0();
                    uint64_t v146 = v145;

                    uint64_t v147 = v144;
                    v139 = v143;
                    LOBYTE(v142) = sub_24A2DC0B0(v147, v146, v140);
                    swift_bridgeObjectRelease();
                    if ((v142 & 1) == 0)
                    {
                      v175 = v216;
                      v137 = v216;
                    }
                    else
                    {
LABEL_26:
                      dispatch_group_enter(v231);
                      sub_24A2E0134(0, &qword_26978A018);
                      v148 = (void *)sub_24A2F5AA0();
                      id v206 = v139;
                      id v149 = objc_msgSend(v139, sel_bundleID);
                      uint64_t v150 = sub_24A2F58E0();
                      uint64_t v152 = v151;

                      uint64_t v153 = v215;
                      if (*(void *)(v215 + 16))
                      {
                        unint64_t v154 = sub_24A2EB0BC(v150, v152);
                        uint64_t v155 = v251;
                        v156 = v256;
                        if (v157)
                        {
                          id v158 = *(id *)(*(void *)(v153 + 56) + 8 * v154);

                          id v204 = v158;
                        }
                        else
                        {
                          id v204 = v148;
                        }
                      }
                      else
                      {
                        id v204 = v148;
                        uint64_t v155 = v251;
                        v156 = v256;
                      }
                      swift_bridgeObjectRelease();
                      sub_24A2DC1E8(v214);
                      uint64_t v205 = sub_24A2F58A0();
                      swift_bridgeObjectRelease();
                      v259(v225, v156, v76);
                      uint64_t v176 = v227;
                      (*(void (**)(char *, char *, uint64_t))(v227 + 16))(v226, v242, v240);
                      unint64_t v177 = (*(unsigned __int8 *)(v155 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v155 + 80);
                      unint64_t v178 = (unint64_t)&v209[v177] & 0xFFFFFFFFFFFFFFF8;
                      unint64_t v179 = (*(unsigned __int8 *)(v176 + 80) + v178 + 8) & ~(unint64_t)*(unsigned __int8 *)(v176 + 80);
                      unint64_t v180 = (unint64_t)&v208[v179] & 0xFFFFFFFFFFFFFFF8;
                      uint64_t v181 = swift_allocObject();
                      ((void (*)(unint64_t, char *, uint64_t))v247)(v181 + v177, v225, v76);
                      *(void *)(v181 + v178) = v235;
                      (*(void (**)(unint64_t, char *, uint64_t))(v176 + 32))(v181 + v179, v226, v240);
                      dispatch_group_t v182 = v231;
                      *(void *)(v181 + v180) = v231;
                      v270 = sub_24A2DFFB4;
                      uint64_t v271 = v181;
                      uint64_t aBlock = MEMORY[0x263EF8330];
                      uint64_t v267 = 1107296256;
                      v268 = sub_24A2DD344;
                      v269 = &block_descriptor_26;
                      v183 = _Block_copy(&aBlock);
                      swift_retain();
                      v137 = (char *)v204;
                      v184 = v182;
                      swift_release();
                      v185 = (char *)v205;
                      objc_msgSend(v206, sel_recommendationsForThresholds_afterTimestamp_completion_, v205, v137, v183);

                      _Block_release(v183);
                      v186 = v216;

                      v175 = v185;
                      v136 = v137;
                      v118 = v230;
                    }

                    v91 = v256;
                  }
                  v122 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v248;

                  (*v217)(v242, v240);
                  v130(v91, v76);
                  v120 = v257;
                  v121 = v253;
                  uint64_t v73 = v255;
                  goto LABEL_14;
                }
              }
              v259(v120, v91, v76);
              v159 = sub_24A2F57F0();
              os_log_type_t v160 = sub_24A2F5A20();
              if (os_log_type_enabled(v159, v160))
              {
                uint64_t v161 = swift_slowAlloc();
                uint64_t v162 = swift_slowAlloc();
                uint64_t aBlock = v162;
                *(_DWORD *)uint64_t v161 = v246;
                uint64_t v163 = sub_24A2F5750();
                *(void *)(v161 + 4) = sub_24A2F0E74(v163, v164, &aBlock);
                swift_bridgeObjectRelease();
                v130(v257, v76);
                _os_log_impl(&dword_24A2CB000, v159, v160, "Principal Class not found for bundle at %s", (uint8_t *)v161, 0xCu);
                swift_arrayDestroy();
                uint64_t v165 = v162;
                v120 = v257;
                MEMORY[0x24C5C0F80](v165, -1, -1);
                uint64_t v166 = v161;
                v91 = v256;
                MEMORY[0x24C5C0F80](v166, -1, -1);

LABEL_36:
                v130(v91, v76);
                v121 = v253;
                uint64_t v73 = v255;
                v122 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v248;
                goto LABEL_14;
              }

              v174 = v120;
            }
            else
            {
              v259(v133, v91, v76);
              v167 = sub_24A2F57F0();
              uint64_t v168 = sub_24A2F5A20();
              if (os_log_type_enabled(v167, (os_log_type_t)v168))
              {
                uint64_t v169 = swift_slowAlloc();
                uint64_t v170 = swift_slowAlloc();
                uint64_t aBlock = v170;
                *(_DWORD *)uint64_t v169 = v246;
                uint64_t v171 = sub_24A2F5750();
                *(void *)(v169 + 4) = sub_24A2F0E74(v171, v172, &aBlock);
                swift_bridgeObjectRelease();
                v130(v254, v76);
                _os_log_impl(&dword_24A2CB000, v167, (os_log_type_t)v168, "Unable to load source bundle at %s", (uint8_t *)v169, 0xCu);
                swift_arrayDestroy();
                uint64_t v173 = v170;
                v91 = v256;
                MEMORY[0x24C5C0F80](v173, -1, -1);
                MEMORY[0x24C5C0F80](v169, -1, -1);

                goto LABEL_36;
              }

              v174 = v133;
            }
            v130(v174, v76);
            goto LABEL_36;
          }
        }
        else
        {
          v73(v83, 1, 1, v76);
        }
        sub_24A2DFC4C(v83);
LABEL_14:
        sub_24A2F5720();
      }
      while (v265);
    }
    (*(void (**)(char *, uint64_t))(v223 + 8))(v118, v224);
    uint64_t v187 = swift_allocObject();
    uint64_t v188 = (uint64_t)v235;
    *(void *)(v187 + 16) = v221;
    *(void *)(v187 + 24) = v188;
    v270 = sub_24A2DFE10;
    uint64_t v271 = v187;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v267 = 1107296256;
    v268 = sub_24A2DD4A8;
    v269 = &block_descriptor_20;
    v189 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    v190 = v236;
    sub_24A2F5840();
    uint64_t v264 = MEMORY[0x263F8EE78];
    v191 = v238;
    uint64_t v192 = v239;
    sub_24A2F5AE0();
    dispatch_group_t v193 = v231;
    sub_24A2F5A40();
    _Block_release(v189);

    v213(v191, v192);
    v211(v190, v237);
    v194 = *(void (**)(char *, uint64_t))(v251 + 8);
    v194(v250, v76);
    v194(v245, v76);
    sub_24A2DFC4C(v234);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    v195 = sub_24A2F57F0();
    os_log_type_t v196 = sub_24A2F5A20();
    if (os_log_type_enabled(v195, v196))
    {
      v197 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v197 = 0;
      _os_log_impl(&dword_24A2CB000, v195, v196, "Unable to initialize bundles enumerator", v197, 2u);
      v198 = v197;
      v96 = v250;
      MEMORY[0x24C5C0F80](v198, -1, -1);
    }

    v199 = sub_24A2F57F0();
    os_log_type_t v200 = sub_24A2F5A10();
    if (os_log_type_enabled(v199, v200))
    {
      v201 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v201 = 0;
      _os_log_impl(&dword_24A2CB000, v199, v200, "Request to fetch recommendations from client donors has been completed.", v201, 2u);
      v202 = v201;
      v96 = v250;
      MEMORY[0x24C5C0F80](v202, -1, -1);
    }

    if ((v94 & 0xC000000000000000) != 0 && sub_24A2F5B80())
    {
      if (qword_269789F20 != -1) {
        swift_once();
      }
      sub_24A2DA6CC((uint64_t)v213, v212, MEMORY[0x263F8EE78]);
    }
    ((void (*)(void, void))v229)(MEMORY[0x263F8EE78], 0);
    v90(v96, v76);
    v90(v245, v76);
    sub_24A2DFC4C(v234);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_24A2DFB1C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_24A2DFB64(unint64_t a1, void *a2)
{
  sub_24A2EFD6C(a1, a2, *(void *)(v2 + 16), *(void (**)(unint64_t, void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_24A2DFB74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269789F90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24A2DFC14()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A2DFC4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269789F90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A2DFCAC()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A2DFCEC()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A2DFD2C(uint64_t a1, char a2, uint64_t a3)
{
  return sub_24A2DBCE0(a1, a2, a3, *(void *)(v3 + 16), *(uint64_t (**)(void, void))(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_24A2DFD38(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24A2DFD4C()
{
  return sub_24A2DD3F4(*(void *)(v0 + 16), *(void *)(v0 + 24), 1);
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

uint64_t objectdestroy_13Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A2DFE10()
{
  return sub_24A2DD3F4(*(void *)(v0 + 16), *(void *)(v0 + 24), 0);
}

uint64_t sub_24A2DFE30()
{
  uint64_t v1 = sub_24A2F5780();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_24A2F57B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v12 = v3 | v8 | 7;
  unint64_t v10 = (*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10 + 8, v12);
}

void sub_24A2DFFB4(unint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_24A2F5780() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(sub_24A2F57B0() - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v10 = *(NSObject **)(v2 + v7);
  uint64_t v11 = *(NSObject **)(v2 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_24A2DC5AC(a1, a2, v2 + v6, v10, v2 + v9, v11);
}

uint64_t sub_24A2E00D4()
{
  return swift_release();
}

uint64_t sub_24A2E00DC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24A2E00EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A2E0134(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24A2E0170(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_24A2E01C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A130);
  uint64_t v2 = (void *)sub_24A2F5BB0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24A2EB0BC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_24A2E02E0(uint64_t a1)
{
  return sub_24A2E054C(a1, &qword_26978A110);
}

unint64_t sub_24A2E02EC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A148);
  uint64_t v2 = sub_24A2F5BB0();
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
    sub_24A2E0C88(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24A2EB0BC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24A2DB684(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24A2E0418(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A138);
  uint64_t v2 = (void *)sub_24A2F5BB0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_24A2EB0BC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_24A2E0534(uint64_t a1)
{
  return sub_24A2E054C(a1, &qword_26978A108);
}

unint64_t sub_24A2E0540(uint64_t a1)
{
  return sub_24A2E054C(a1, &qword_26978A140);
}

unint64_t sub_24A2E054C(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_24A2F5BB0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_24A2EB0BC(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v12 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

unint64_t static RecommendationsError.errorDomain.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t RecommendationsError.errorCode.getter()
{
  return *v0;
}

uint64_t RecommendationsError.rawValue.getter()
{
  return *v0;
}

unint64_t RecommendationsError.errorUserInfo.getter()
{
  int v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A0F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A2F7B30;
  *(void *)(inited + 32) = sub_24A2F58E0();
  *(void *)(inited + 40) = v3;
  unint64_t v4 = 0xD00000000000001FLL;
  if (v1) {
    unint64_t v4 = 0xD00000000000002FLL;
  }
  unint64_t v5 = 0x800000024A2F8DC0;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  if (v1) {
    unint64_t v5 = 0x800000024A2F8D90;
  }
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v5;
  return sub_24A2E02EC(inited);
}

CloudRecommendation::RecommendationsError_optional __swiftcall RecommendationsError.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *int v1 = v2;
  return (CloudRecommendation::RecommendationsError_optional)rawValue;
}

BOOL sub_24A2E075C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_24A2E0778()
{
  unint64_t result = qword_26978A0F8;
  if (!qword_26978A0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26978A0F8);
  }
  return result;
}

uint64_t sub_24A2E07CC()
{
  return sub_24A2F5CD0();
}

uint64_t sub_24A2E0814()
{
  return sub_24A2F5CC0();
}

uint64_t sub_24A2E0840()
{
  return sub_24A2F5CD0();
}

void *sub_24A2E0884@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_24A2E08A4(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_24A2E08B4()
{
  unint64_t result = qword_26978A100;
  if (!qword_26978A100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26978A100);
  }
  return result;
}

unint64_t sub_24A2E0908()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_24A2E0924()
{
  return *v0;
}

uint64_t sub_24A2E0930(uint64_t a1)
{
  unint64_t v2 = sub_24A2E0B8C();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_24A2E096C(uint64_t a1)
{
  unint64_t v2 = sub_24A2E0B8C();
  unint64_t v3 = sub_24A2E0BE0();
  unint64_t v4 = sub_24A2E0C34();
  return MEMORY[0x270EF2658](a1, v2, v3, v4);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecommendationsError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecommendationsError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A2E0B3CLL);
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

uint64_t sub_24A2E0B64(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24A2E0B70(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RecommendationsError()
{
  return &type metadata for RecommendationsError;
}

unint64_t sub_24A2E0B8C()
{
  unint64_t result = qword_26978A118;
  if (!qword_26978A118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26978A118);
  }
  return result;
}

unint64_t sub_24A2E0BE0()
{
  unint64_t result = qword_26978A120;
  if (!qword_26978A120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26978A120);
  }
  return result;
}

unint64_t sub_24A2E0C34()
{
  unint64_t result = qword_26978A128;
  if (!qword_26978A128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26978A128);
  }
  return result;
}

uint64_t sub_24A2E0C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CERecommendationAction.id.getter()
{
  id v1 = objc_msgSend(v0, sel_actionIdentifier);
  uint64_t v2 = sub_24A2F58E0();

  return v2;
}

void sub_24A2E0D48(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_actionIdentifier);
  uint64_t v4 = sub_24A2F58E0();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t sub_24A2E0DA0()
{
  uint64_t v0 = sub_24A2F5810();
  __swift_allocate_value_buffer(v0, qword_26978AE88);
  __swift_project_value_buffer(v0, (uint64_t)qword_26978AE88);
  swift_bridgeObjectRetain();
  return sub_24A2F5800();
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

BOOL static RecommendationsFetcher.FetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RecommendationsFetcher.FetchError.hash(into:)()
{
  return sub_24A2F5CC0();
}

uint64_t RecommendationsFetcher.FetchError.hashValue.getter()
{
  return sub_24A2F5CD0();
}

id sub_24A2E0F2C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RecommendationsFetcher()), sel_init);
  qword_26978A168 = (uint64_t)result;
  return result;
}

id RecommendationsFetcher.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static RecommendationsFetcher.shared.getter()
{
  if (qword_269789F30 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26978A168;
  return v0;
}

uint64_t sub_24A2E1048(void *a1)
{
  return sub_24A2E10B4(a1, 0, 0);
}

uint64_t sub_24A2E10B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24A2F5810();
  __swift_project_value_buffer(v10, (uint64_t)qword_26978AE88);
  char v11 = sub_24A2F57F0();
  os_log_type_t v12 = sub_24A2F5A10();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_24A2CB000, v11, v12, "Clearing recommendations cache", v13, 2u);
    MEMORY[0x24C5C0F80](v13, -1, -1);
  }

  uint64_t v14 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v4;
  v15[5] = a1;
  v15[6] = a2;
  v15[7] = a3;
  id v16 = v4;
  id v17 = a1;
  sub_24A2E00DC(a2);
  sub_24A2E2934((uint64_t)v9, (uint64_t)&unk_26978A180, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_24A2E1294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[334] = a7;
  v7[333] = a6;
  v7[332] = a5;
  v7[331] = a4;
  return MEMORY[0x270FA2498](sub_24A2E12C0, 0, 0);
}

uint64_t sub_24A2E12C0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 2648) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 2680) = v1;
  return MEMORY[0x270FA2498](sub_24A2E12EC, v1, 0);
}

uint64_t sub_24A2E12EC()
{
  uint64_t v1 = (uint64_t (*)())objc_msgSend(*(id *)(v0 + 2656), sel_aa_altDSID);
  if (v1
    || (uint64_t v2 = (uint64_t (*)())objc_msgSend(*(id *)(v0 + 2656), sel_aa_personID),
        (uint64_t v1 = v2) != 0))
  {
    uint64_t v5 = sub_24A2F58E0();
    uint64_t v7 = v6;

    swift_beginAccess();
    sub_24A2F15AC(v5, v7);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v2 = sub_24A2E13FC;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24A2E13FC()
{
  uint64_t v16 = v0[333];
  id v17 = v0 + 322;
  uint64_t v1 = (void *)v0[332];
  uint64_t v2 = (void *)v0[331];
  uint64_t v3 = swift_allocObject();
  v0[336] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  id v4 = v2;
  id v5 = v1;
  swift_retain();
  sub_24A2E0134(255, &qword_26978A388);
  swift_asyncLet_begin();
  uint64_t v6 = swift_allocObject();
  v0[337] = v6;
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v5;
  id v7 = v4;
  id v8 = v5;
  swift_retain();
  swift_asyncLet_begin();
  uint64_t v9 = swift_allocObject();
  v0[338] = v9;
  *(void *)(v9 + 16) = v7;
  *(void *)(v9 + 24) = v8;
  id v10 = v7;
  id v11 = v8;
  swift_retain();
  sub_24A2E0134(255, &qword_26978A450);
  swift_asyncLet_begin();
  uint64_t v12 = swift_allocObject();
  v0[339] = v12;
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v11;
  id v13 = v10;
  id v14 = v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26978A038);
  swift_asyncLet_begin();
  if (v16)
  {
    return MEMORY[0x270FA23E8](v0 + 162, v0 + 329, sub_24A2E16DC, v17);
  }
  else
  {
    return MEMORY[0x270FA23D8](v0 + 2, v0 + 328, sub_24A2E1898, v17);
  }
}

uint64_t sub_24A2E16DC()
{
  v1[340] = v0;
  if (v0)
  {
    return MEMORY[0x270FA23D8](v1 + 2, v1 + 328, sub_24A2E1AB8, v1 + 322);
  }
  else
  {
    uint64_t v2 = (void *)v1[329];
    v1[341] = v2;
    id v3 = v2;
    return MEMORY[0x270FA23E8](v1 + 82, v1 + 330, sub_24A2E17A8, v1 + 322);
  }
}

uint64_t sub_24A2E17A8()
{
  *(void *)(v1 + 2736) = v0;
  if (v0) {
    uint64_t v2 = sub_24A2E1D28;
  }
  else {
    uint64_t v2 = sub_24A2E17DC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24A2E17DC()
{
  uint64_t v1 = (void *)v0[341];
  uint64_t v2 = (void (*)(void *, void *, void))v0[333];
  id v3 = (void *)v0[330];
  id v4 = v3;
  v2(v1, v3, 0);

  return MEMORY[0x270FA23D8](v0 + 2, v0 + 328, sub_24A2E1898, v0 + 322);
}

uint64_t sub_24A2E1898()
{
  return MEMORY[0x270FA2498](sub_24A2E18B4, 0, 0);
}

uint64_t sub_24A2E18B4()
{
  return MEMORY[0x270FA23D8](v0 + 656, v0 + 2640, sub_24A2E18D4, v0 + 16);
}

uint64_t sub_24A2E18D4()
{
  return MEMORY[0x270FA2498](sub_24A2E18F0, 0, 0);
}

uint64_t sub_24A2E18F0()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 1936, v0 + 2616, sub_24A2E1970, v0 + 16);
}

uint64_t sub_24A2E1970()
{
  return MEMORY[0x270FA2498](sub_24A2E198C, 0, 0);
}

uint64_t sub_24A2E198C()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 1296, v0 + 2632, sub_24A2E1A0C, v0 + 16);
}

uint64_t sub_24A2E1A0C()
{
  return MEMORY[0x270FA2498](sub_24A2E1A28, 0, 0);
}

uint64_t sub_24A2E1A28()
{
  swift_release_n();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A2E1AB8()
{
  return MEMORY[0x270FA2498](sub_24A2E1AD4, 0, 0);
}

uint64_t sub_24A2E1AD4()
{
  return MEMORY[0x270FA23D8](v0 + 656, v0 + 2640, sub_24A2E1AF4, v0 + 16);
}

uint64_t sub_24A2E1AF4()
{
  return MEMORY[0x270FA2498](sub_24A2E1B10, 0, 0);
}

uint64_t sub_24A2E1B10()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 1936, v0 + 2616, sub_24A2E1B90, v0 + 16);
}

uint64_t sub_24A2E1B90()
{
  return MEMORY[0x270FA2498](sub_24A2E1BAC, 0, 0);
}

uint64_t sub_24A2E1BAC()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 1296, v0 + 2632, sub_24A2E1C2C, v0 + 16);
}

uint64_t sub_24A2E1C2C()
{
  return MEMORY[0x270FA2498](sub_24A2E1C48, 0, 0);
}

uint64_t sub_24A2E1C48()
{
  uint64_t v1 = (void *)v0[340];
  uint64_t v2 = (void (*)(void, void, void *))v0[333];
  swift_release();
  id v3 = v1;
  v2(0, 0, v1);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24A2E1D28()
{
  return MEMORY[0x270FA23D8](v0 + 16, v0 + 2624, sub_24A2E1DA8, v0 + 2576);
}

uint64_t sub_24A2E1DA8()
{
  return MEMORY[0x270FA2498](sub_24A2E1DC4, 0, 0);
}

uint64_t sub_24A2E1DC4()
{
  return MEMORY[0x270FA23D8](v0 + 656, v0 + 2640, sub_24A2E1DE4, v0 + 16);
}

uint64_t sub_24A2E1DE4()
{
  return MEMORY[0x270FA2498](sub_24A2E1E00, 0, 0);
}

uint64_t sub_24A2E1E00()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 1936, v0 + 2616, sub_24A2E1E80, v0 + 16);
}

uint64_t sub_24A2E1E80()
{
  return MEMORY[0x270FA2498](sub_24A2E1E9C, 0, 0);
}

uint64_t sub_24A2E1E9C()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 1296, v0 + 2632, sub_24A2E1F1C, v0 + 16);
}

uint64_t sub_24A2E1F1C()
{
  return MEMORY[0x270FA2498](sub_24A2E1F38, 0, 0);
}

uint64_t sub_24A2E1F38()
{
  uint64_t v1 = (void *)v0[342];
  uint64_t v2 = (void (*)(void, void, void *))v0[333];
  swift_release();
  id v3 = v1;
  v2(0, 0, v1);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24A2E2018()
{
  swift_unknownObjectRelease();

  if (*(void *)(v0 + 48)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24A2E2070()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_24A2EEEBC;
  *(void *)(v4 + 2672) = v3;
  *(void *)(v4 + 2664) = v2;
  *(_OWORD *)(v4 + 2648) = v5;
  return MEMORY[0x270FA2498](sub_24A2E12C0, 0, 0);
}

uint64_t sub_24A2E2134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24A2E2158, 0, 0);
}

uint64_t sub_24A2E2158()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 40) = v1;
  return MEMORY[0x270FA2498](sub_24A2E2184, v1, 0);
}

uint64_t sub_24A2E2184()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 32));
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E2240;
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = 0;
  return MEMORY[0x270FA2498](sub_24A2E6468, v1, 0);
}

uint64_t sub_24A2E2240(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[8] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[5];
  if (v1)
  {
    uint64_t v6 = sub_24A2EEF00;
  }
  else
  {
    v4[9] = a1;
    uint64_t v6 = sub_24A2E237C;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E237C()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2EEEF0, 0, 0);
}

uint64_t sub_24A2E23E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24A2E2408, 0, 0);
}

uint64_t sub_24A2E2408()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 40) = v1;
  return MEMORY[0x270FA2498](sub_24A2E2434, v1, 0);
}

uint64_t sub_24A2E2434()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 32));
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E24F0;
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = 0;
  return MEMORY[0x270FA2498](sub_24A2E72E4, v1, 0);
}

uint64_t sub_24A2E24F0(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[8] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[5];
  if (v1)
  {
    uint64_t v6 = sub_24A2E26B8;
  }
  else
  {
    v4[9] = a1;
    uint64_t v6 = sub_24A2E262C;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E262C()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E2694, 0, 0);
}

uint64_t sub_24A2E2694()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 72);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A2E26B8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A2E271C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24A2E2740, 0, 0);
}

uint64_t sub_24A2E2740()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 40) = v1;
  return MEMORY[0x270FA2498](sub_24A2E276C, v1, 0);
}

uint64_t sub_24A2E276C()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 32));
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E2240;
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = 0;
  return MEMORY[0x270FA2498](sub_24A2E6AF4, v1, 0);
}

uint64_t sub_24A2E2828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24A2E284C, 0, 0);
}

uint64_t sub_24A2E284C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 40) = v1;
  return MEMORY[0x270FA2498](sub_24A2E2878, v1, 0);
}

uint64_t sub_24A2E2878()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 32));
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E2240;
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = 0;
  return MEMORY[0x270FA2498](sub_24A2E7718, v1, 0);
}

uint64_t sub_24A2E2934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A2F59C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A2F59B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24A2EE090(a1, &qword_26978A170);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A2F5980();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_24A2E2BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = sub_24A2F5710();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);
}

uint64_t sub_24A2E2C20(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_24A2E4F2C(a1, a2, a3, a4, (uint64_t)&unk_26FE02108, (void (*)(uint64_t, uint64_t))sub_24A2EEEB4, (uint64_t)&unk_26978A190);
}

uint64_t sub_24A2E2C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 32) = a7;
  *(void *)(v8 + 40) = a8;
  *(unsigned char *)(v8 + 88) = a6;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24A2E2C7C, 0, 0);
}

uint64_t sub_24A2E2C7C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 48) = v1;
  return MEMORY[0x270FA2498](sub_24A2E2CA8, v1, 0);
}

uint64_t sub_24A2E2CA8()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 24));
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E2D6C;
  char v3 = *(unsigned char *)(v0 + 88);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E6468, v1, 0);
}

uint64_t sub_24A2E2D6C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 72) = a1;
  *(void *)(v4 + 80) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 48);
  if (v1) {
    uint64_t v6 = sub_24A2E2F98;
  }
  else {
    uint64_t v6 = sub_24A2E2EA0;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E2EA0()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E2F08, 0, 0);
}

uint64_t sub_24A2E2F08()
{
  uint64_t v1 = (void (*)(void *, void))v0[4];
  uint64_t v2 = (void *)v0[9];
  if (v1)
  {
    id v3 = v2;
    v1(v2, 0);
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24A2E2F98()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E3000, 0, 0);
}

uint64_t sub_24A2E3000()
{
  uint64_t v1 = (void (*)(void, void *))v0[4];
  uint64_t v2 = (void *)v0[10];
  if (v1)
  {
    id v3 = v2;
    v1(0, v2);
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24A2E3238(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 72) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  return MEMORY[0x270FA2498](sub_24A2E325C, 0, 0);
}

uint64_t sub_24A2E325C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24A2E3288, v1, 0);
}

uint64_t sub_24A2E3288()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 16));
  *(void *)(v0 + 40) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E334C;
  char v3 = *(unsigned char *)(v0 + 72);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E6468, v1, 0);
}

uint64_t sub_24A2E334C(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[7] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[4];
  if (v1)
  {
    uint64_t v6 = sub_24A2E35A4;
  }
  else
  {
    v4[8] = a1;
    uint64_t v6 = sub_24A2E3488;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E3488()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E34F0, 0, 0);
}

uint64_t sub_24A2E34F0()
{
  uint64_t v1 = *(void **)(v0 + 64);
  id v2 = objc_msgSend(v1, sel_recommendations);
  sub_24A2E0134(0, &qword_26978A028);
  uint64_t v3 = sub_24A2F5930();

  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_24A2E35A4()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2EEEE8, 0, 0);
}

uint64_t sub_24A2E3790(void *a1, char a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a4;
  uint64_t v10 = swift_task_alloc();
  v4[5] = v10;
  *(void *)uint64_t v10 = v4;
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v9;
  *(unsigned char *)(v10 + 72) = a2;
  *(void *)(v10 + 8) = sub_24A2E3874;
  return MEMORY[0x270FA2498](sub_24A2E325C, 0, 0);
}

uint64_t sub_24A2E3874()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  id v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  sub_24A2E0134(0, &qword_26978A028);
  uint64_t v4 = (void *)sub_24A2F5920();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v4);

  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_24A2E3A08(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_24A2E4F2C(a1, a2, a3, a4, (uint64_t)&unk_26FE02130, (void (*)(uint64_t, uint64_t))sub_24A2EEEB4, (uint64_t)&unk_26978A1B8);
}

uint64_t sub_24A2E3A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 32) = a7;
  *(void *)(v8 + 40) = a8;
  *(unsigned char *)(v8 + 88) = a6;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24A2E3A64, 0, 0);
}

uint64_t sub_24A2E3A64()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 48) = v1;
  return MEMORY[0x270FA2498](sub_24A2E3A90, v1, 0);
}

uint64_t sub_24A2E3A90()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 24));
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E3B54;
  char v3 = *(unsigned char *)(v0 + 88);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E6AF4, v1, 0);
}

uint64_t sub_24A2E3B54(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 72) = a1;
  *(void *)(v4 + 80) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 48);
  if (v1) {
    uint64_t v6 = sub_24A2E3CF0;
  }
  else {
    uint64_t v6 = sub_24A2E3C88;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E3C88()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2EEF08, 0, 0);
}

uint64_t sub_24A2E3CF0()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2EEF0C, 0, 0);
}

void sub_24A2E3EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_24A2F5710();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_24A2E3F68(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 80) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  return MEMORY[0x270FA2498](sub_24A2E3F8C, 0, 0);
}

uint64_t sub_24A2E3F8C()
{
  uint64_t v1 = v0[3];
  v0[4] = sub_24A2E0540(MEMORY[0x263F8EE78]);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  v0[5] = v2;
  return MEMORY[0x270FA2498](sub_24A2E400C, v2, 0);
}

uint64_t sub_24A2E400C()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 16));
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E40D0;
  char v3 = *(unsigned char *)(v0 + 80);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E6AF4, v1, 0);
}

uint64_t sub_24A2E40D0(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 40);
  if (v1) {
    id v6 = sub_24A2E45A4;
  }
  else {
    id v6 = sub_24A2E4204;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E4204()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E426C, 0, 0);
}

uint64_t sub_24A2E426C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 64), sel_ruleset);
  sub_24A2E0134(0, &qword_26978A1D0);
  unint64_t v2 = sub_24A2F5930();

  unint64_t v3 = sub_24A2E4690(v2);
  swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24A2F5B80();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 0;
      unint64_t v34 = v3;
      unint64_t v35 = v3 & 0xC000000000000001;
      uint64_t v33 = v0;
      id v6 = *(void **)(v0 + 32);
      while (1)
      {
        if (v35) {
          id v9 = (id)MEMORY[0x24C5C0580](v5, v3);
        }
        else {
          id v9 = *(id *)(v3 + 8 * v5 + 32);
        }
        uint64_t v10 = v9;
        uint64_t v0 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        unint64_t v3 = v4;
        id v11 = objc_msgSend(v9, sel_recommendationID);
        uint64_t v12 = sub_24A2F58E0();
        uint64_t v14 = v13;

        id v15 = v10;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v18 = sub_24A2EB0BC(v12, v14);
        uint64_t v19 = v6[2];
        BOOL v20 = (v17 & 1) == 0;
        uint64_t v21 = v19 + v20;
        if (__OFADD__(v19, v20)) {
          goto LABEL_26;
        }
        char v22 = v17;
        if (v6[3] >= v21)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            if (v17) {
              goto LABEL_4;
            }
          }
          else
          {
            sub_24A2EBEDC(&qword_26978A140);
            if (v22) {
              goto LABEL_4;
            }
          }
        }
        else
        {
          sub_24A2EB854(v21, isUniquelyReferenced_nonNull_native, &qword_26978A140);
          unint64_t v23 = sub_24A2EB0BC(v12, v14);
          if ((v22 & 1) != (v24 & 1))
          {
            return sub_24A2F5C40();
          }
          unint64_t v18 = v23;
          if (v22)
          {
LABEL_4:
            uint64_t v7 = v6[7];

            *(void *)(v7 + 8 * v18) = v15;
            goto LABEL_5;
          }
        }
        v6[(v18 >> 6) + 8] |= 1 << v18;
        uint64_t v25 = (uint64_t *)(v6[6] + 16 * v18);
        *uint64_t v25 = v12;
        v25[1] = v14;
        *(void *)(v6[7] + 8 * v18) = v15;
        uint64_t v26 = v6[2];
        BOOL v27 = __OFADD__(v26, 1);
        uint64_t v28 = v26 + 1;
        if (v27) {
          goto LABEL_27;
        }
        v6[2] = v28;
        swift_bridgeObjectRetain();
LABEL_5:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        ++v5;
        uint64_t v4 = v3;
        BOOL v8 = v0 == v3;
        unint64_t v3 = v34;
        if (v8)
        {
          uint64_t v0 = v33;
          uint64_t v29 = *(void **)(v33 + 64);
          swift_bridgeObjectRelease();

          goto LABEL_30;
        }
      }
    }
  }
  uint64_t v31 = *(void **)(v0 + 64);
  swift_bridgeObjectRelease();

  id v6 = *(void **)(v0 + 32);
LABEL_30:
  uint64_t v32 = *(uint64_t (**)(void *))(v0 + 8);
  return v32(v6);
}

uint64_t sub_24A2E45A4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24A2E4618, 0, 0);
}

uint64_t sub_24A2E4618()
{
  uint64_t v1 = *(void **)(v0 + 72);
  unint64_t v2 = sub_24A2E0540(MEMORY[0x263F8EE78]);

  unint64_t v3 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_24A2E4690(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_24A2F5B80())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C5C0580](i - 4, a1) : *(id *)(a1 + 8 * i);
      uint64_t v5 = v4;
      uint64_t v6 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_recommendationRules);
      sub_24A2E0134(0, &qword_26978A070);
      unint64_t v8 = sub_24A2F5930();

      sub_24A2DD178(v8);
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24A2E4978(void *a1, char a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a4;
  uint64_t v10 = swift_task_alloc();
  v4[5] = v10;
  *(void *)uint64_t v10 = v4;
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v9;
  *(unsigned char *)(v10 + 80) = a2;
  *(void *)(v10 + 8) = sub_24A2E4A5C;
  return MEMORY[0x270FA2498](sub_24A2E3F8C, 0, 0);
}

uint64_t sub_24A2E4A5C()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  unint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  sub_24A2E0134(0, &qword_26978A070);
  id v4 = (void *)sub_24A2F58A0();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v4);

  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_24A2E4C0C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_24A2E4F2C(a1, a2, a3, a4, (uint64_t)&unk_26FE02158, (void (*)(uint64_t, uint64_t))sub_24A2EEEB4, (uint64_t)&unk_26978A1E0);
}

uint64_t sub_24A2E4C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 32) = a7;
  *(void *)(v8 + 40) = a8;
  *(unsigned char *)(v8 + 88) = a6;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24A2E4C68, 0, 0);
}

uint64_t sub_24A2E4C68()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 48) = v1;
  return MEMORY[0x270FA2498](sub_24A2E4C94, v1, 0);
}

uint64_t sub_24A2E4C94()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 24));
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E3B54;
  char v3 = *(unsigned char *)(v0 + 88);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E72E4, v1, 0);
}

uint64_t sub_24A2E4EF8(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_24A2E4F2C(a1, a2, a3, a4, (uint64_t)&unk_26FE02180, (void (*)(uint64_t, uint64_t))sub_24A2E00DC, (uint64_t)&unk_26978A1F0);
}

uint64_t sub_24A2E4F2C(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t), uint64_t a7)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  id v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  *(void *)(v17 + 32) = v7;
  *(void *)(v17 + 40) = a1;
  *(unsigned char *)(v17 + 48) = a2;
  *(void *)(v17 + 56) = a3;
  *(void *)(v17 + 64) = a4;
  id v18 = v7;
  id v19 = a1;
  a6(a3, a4);
  sub_24A2E2934((uint64_t)v15, a7, v17);
  return swift_release();
}

uint64_t sub_24A2E5060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 32) = a7;
  *(void *)(v8 + 40) = a8;
  *(unsigned char *)(v8 + 88) = a6;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24A2E5088, 0, 0);
}

uint64_t sub_24A2E5088()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 48) = v1;
  return MEMORY[0x270FA2498](sub_24A2E50B4, v1, 0);
}

uint64_t sub_24A2E50B4()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 24));
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E5178;
  char v3 = *(unsigned char *)(v0 + 88);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E7718, v1, 0);
}

uint64_t sub_24A2E5178(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 72) = a1;
  *(void *)(v4 + 80) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 48);
  if (v1) {
    uint64_t v6 = sub_24A2E5394;
  }
  else {
    uint64_t v6 = sub_24A2E52AC;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E52AC()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E5314, 0, 0);
}

uint64_t sub_24A2E5314()
{
  uint64_t v1 = (void (*)(void, void))v0[4];
  if (v1) {
    v1(v0[9], 0);
  }
  swift_bridgeObjectRelease();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_24A2E5394()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E53FC, 0, 0);
}

uint64_t sub_24A2E53FC()
{
  uint64_t v1 = (void (*)(void, void *))v0[4];
  uint64_t v2 = (void *)v0[10];
  if (v1)
  {
    id v3 = v2;
    v1(0, v2);
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void sub_24A2E5634(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1)
  {
    sub_24A2E0134(0, &qword_26978A028);
    uint64_t v5 = (void *)sub_24A2F5920();
  }
  if (a2) {
    uint64_t v6 = sub_24A2F5710();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

uint64_t sub_24A2E56E0(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 72) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  return MEMORY[0x270FA2498](sub_24A2E5704, 0, 0);
}

uint64_t sub_24A2E5704()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24A2E5730, v1, 0);
}

uint64_t sub_24A2E5730()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 16));
  *(void *)(v0 + 40) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E57F4;
  char v3 = *(unsigned char *)(v0 + 72);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E7718, v1, 0);
}

uint64_t sub_24A2E57F4(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[7] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[4];
  if (v1)
  {
    uint64_t v6 = sub_24A2E5994;
  }
  else
  {
    v4[8] = a1;
    uint64_t v6 = sub_24A2E5930;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E5930()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24A2E5994()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E59FC, 0, 0);
}

uint64_t sub_24A2E59FC()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = MEMORY[0x263F8EE78];
  return v1(v2);
}

uint64_t sub_24A2E5BE8(void *a1, char a2, void *aBlock, void *a4)
{
  *(unsigned char *)(v4 + 80) = a2;
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  *(void *)(v4 + 32) = _Block_copy(aBlock);
  id v7 = a1;
  id v8 = a4;
  return MEMORY[0x270FA2498](sub_24A2E5C78, 0, 0);
}

uint64_t sub_24A2E5C78()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  *(void *)(v0 + 40) = v1;
  return MEMORY[0x270FA2498](sub_24A2E5CA4, v1, 0);
}

uint64_t sub_24A2E5CA4()
{
  id v1 = sub_24A2E6268(*(void **)(v0 + 16));
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *(void *)uint64_t v2 = v0;
  *(void *)(v2 + 8) = sub_24A2E5D68;
  char v3 = *(unsigned char *)(v0 + 80);
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = v3;
  return MEMORY[0x270FA2498](sub_24A2E7718, v1, 0);
}

uint64_t sub_24A2E5D68(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[8] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[5];
  if (v1)
  {
    uint64_t v6 = sub_24A2E5FD0;
  }
  else
  {
    v4[9] = a1;
    uint64_t v6 = sub_24A2E5EA4;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24A2E5EA4()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E5F0C, 0, 0);
}

uint64_t sub_24A2E5F0C()
{
  uint64_t v1 = *(void (***)(void, void))(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 16);

  sub_24A2E0134(0, &qword_26978A028);
  char v3 = (void *)sub_24A2F5920();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v3);

  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24A2E5FD0()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E6038, 0, 0);
}

uint64_t sub_24A2E6038()
{
  uint64_t v1 = *(void (***)(void, void))(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 16);

  sub_24A2E0134(0, &qword_26978A028);
  char v3 = (void *)sub_24A2F5920();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v3);

  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id RecommendationsFetcher.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers;
  type metadata accessor for DataFetchers();
  uint64_t v2 = swift_allocObject();
  char v3 = v0;
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = sub_24A2E0418(MEMORY[0x263F8EE78]);
  *(void *)&v0[v1] = v2;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for RecommendationsFetcher();
  return objc_msgSendSuper2(&v5, sel_init);
}

id RecommendationsFetcher.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecommendationsFetcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24A2E6268(void *a1)
{
  id v3 = objc_msgSend(a1, sel_aa_altDSID);
  if (v3 || (id result = objc_msgSend(a1, sel_aa_personID), (v3 = result) != 0))
  {
    uint64_t v5 = sub_24A2F58E0();
    uint64_t v7 = v6;

    uint64_t v8 = (uint64_t *)(v1 + 112);
    swift_beginAccess();
    uint64_t v9 = *(void *)(v1 + 112);
    if (*(void *)(v9 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v10 = sub_24A2EB0BC(v5, v7);
      if (v11)
      {
        uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        return (id)v12;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    type metadata accessor for DataFetcher();
    swift_allocObject();
    id v13 = a1;
    uint64_t v12 = sub_24A2EE8C8(v13);

    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v8;
    *uint64_t v8 = 0x8000000000000000;
    sub_24A2DB898(v12, v5, v7, isUniquelyReferenced_nonNull_native);
    *uint64_t v8 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return (id)v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A2E640C()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24A2E6444(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = a1;
  return MEMORY[0x270FA2498](sub_24A2E6468, v1, 0);
}

uint64_t sub_24A2E6468()
{
  *(void *)(v0 + 32) = *(void *)(*(void *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_24A2F57E0();
  sub_24A2EDCF4(&qword_26978A370, MEMORY[0x263F20750]);
  swift_retain();
  uint64_t v2 = sub_24A2F5980();
  return MEMORY[0x270FA2498](sub_24A2E6544, v2, v1);
}

uint64_t sub_24A2E6544()
{
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = sub_24A2F57C0();
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E65D0, v1, 0);
}

uint64_t sub_24A2E65D0()
{
  char v1 = *(unsigned char *)(v0 + 72);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 48) = v3;
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x263F20748] + MEMORY[0x263F20748]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = sub_24A2E0134(0, &qword_26978A388);
  *uint64_t v4 = v0;
  v4[1] = sub_24A2E6728;
  return v7(v0 + 16, 0xD000000000000014, 0x800000024A2F9190, &unk_26978A460, v3, v5);
}

uint64_t sub_24A2E6728()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = sub_24A2EEF14;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 24);
    swift_release();
    swift_release();
    uint64_t v4 = sub_24A2EEEC0;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A2E6858(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 88) = a3;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  return MEMORY[0x270FA2498](sub_24A2E687C, 0, 0);
}

uint64_t sub_24A2E687C()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    void *v2 = v0;
    v2[1] = sub_24A2E69A8;
    char v3 = *(unsigned char *)(v0 + 88);
    return sub_24A2E7B1C(v3);
  }
  else
  {
    sub_24A2EDB74();
    swift_allocError();
    unsigned char *v5 = 0;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_24A2E69A8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24A2EEEEC;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = sub_24A2EEEE4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24A2E6AD0(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = a1;
  return MEMORY[0x270FA2498](sub_24A2E6AF4, v1, 0);
}

uint64_t sub_24A2E6AF4()
{
  *(void *)(v0 + 32) = *(void *)(*(void *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_24A2F57E0();
  sub_24A2EDCF4(&qword_26978A370, MEMORY[0x263F20750]);
  swift_retain();
  uint64_t v2 = sub_24A2F5980();
  return MEMORY[0x270FA2498](sub_24A2E6BD0, v2, v1);
}

uint64_t sub_24A2E6BD0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = sub_24A2F57C0();
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E6C60, v1, 0);
}

uint64_t sub_24A2E6C60()
{
  char v1 = *(unsigned char *)(v0 + 72);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 48) = v3;
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x263F20748]
                                                                                            + MEMORY[0x263F20748]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = sub_24A2E0134(0, &qword_26978A450);
  *uint64_t v4 = v0;
  v4[1] = sub_24A2E6DBC;
  return v7(v0 + 16, 0x6C75526863746566, 0xEC00000074657365, &unk_26978A448, v3, v5);
}

uint64_t sub_24A2E6DBC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = sub_24A2E6F08;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 24);
    swift_release();
    swift_release();
    uint64_t v4 = sub_24A2E6EEC;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A2E6EEC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_24A2E6F08()
{
  swift_release();
  swift_release();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A2E6F74(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 88) = a3;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  return MEMORY[0x270FA2498](sub_24A2E6F98, 0, 0);
}

uint64_t sub_24A2E6F98()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    void *v2 = v0;
    v2[1] = sub_24A2E70C4;
    char v3 = *(unsigned char *)(v0 + 88);
    return sub_24A2E840C(v3);
  }
  else
  {
    sub_24A2EDB74();
    swift_allocError();
    unsigned char *v5 = 0;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_24A2E70C4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24A2E725C;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = sub_24A2E71EC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24A2E71EC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (void *)v0[5];
  swift_release();
  void *v2 = v1;
  char v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24A2E725C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A2E72C0(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = a1;
  return MEMORY[0x270FA2498](sub_24A2E72E4, v1, 0);
}

uint64_t sub_24A2E72E4()
{
  *(void *)(v0 + 32) = *(void *)(*(void *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_24A2F57E0();
  sub_24A2EDCF4(&qword_26978A370, MEMORY[0x263F20750]);
  swift_retain();
  uint64_t v2 = sub_24A2F5980();
  return MEMORY[0x270FA2498](sub_24A2E73C0, v2, v1);
}

uint64_t sub_24A2E73C0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = sub_24A2F57C0();
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E744C, v1, 0);
}

uint64_t sub_24A2E744C()
{
  char v1 = *(unsigned char *)(v0 + 72);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 48) = v3;
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x263F20748] + MEMORY[0x263F20748]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = sub_24A2E0134(0, &qword_26978A388);
  *uint64_t v4 = v0;
  v4[1] = sub_24A2E6728;
  return v7(v0 + 16, 0xD00000000000001DLL, 0x800000024A2F9150, &unk_26978A380, v3, v5);
}

uint64_t sub_24A2E75A4(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 88) = a3;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  return MEMORY[0x270FA2498](sub_24A2E75C8, 0, 0);
}

uint64_t sub_24A2E75C8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    void *v2 = v0;
    v2[1] = sub_24A2E69A8;
    char v3 = *(unsigned char *)(v0 + 88);
    return sub_24A2E8E70(v3);
  }
  else
  {
    sub_24A2EDB74();
    swift_allocError();
    unsigned char *v5 = 0;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_24A2E76F4(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 72) = a1;
  return MEMORY[0x270FA2498](sub_24A2E7718, v1, 0);
}

uint64_t sub_24A2E7718()
{
  *(void *)(v0 + 32) = *(void *)(*(void *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_24A2F57E0();
  sub_24A2EDCF4(&qword_26978A370, MEMORY[0x263F20750]);
  swift_retain();
  uint64_t v2 = sub_24A2F5980();
  return MEMORY[0x270FA2498](sub_24A2E77F4, v2, v1);
}

uint64_t sub_24A2E77F4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = sub_24A2F57C0();
  swift_release();
  return MEMORY[0x270FA2498](sub_24A2E7880, v1, 0);
}

uint64_t sub_24A2E7880()
{
  char v1 = *(unsigned char *)(v0 + 72);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 48) = v3;
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x263F20748] + MEMORY[0x263F20748]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A038);
  *uint64_t v4 = v0;
  v4[1] = sub_24A2E6728;
  return v7(v0 + 16, 0xD00000000000001ALL, 0x800000024A2F9170, &unk_26978A438, v3, v5);
}

uint64_t sub_24A2E79CC(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 88) = a3;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  return MEMORY[0x270FA2498](sub_24A2E79F0, 0, 0);
}

uint64_t sub_24A2E79F0()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    void *v2 = v0;
    v2[1] = sub_24A2E69A8;
    char v3 = *(unsigned char *)(v0 + 88);
    return sub_24A2E9A6C(v3);
  }
  else
  {
    sub_24A2EDB74();
    swift_allocError();
    unsigned char *v5 = 0;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_24A2E7B1C(char a1)
{
  *(void *)(v2 + 184) = v1;
  *(unsigned char *)(v2 + 288) = a1;
  uint64_t v3 = sub_24A2F57B0();
  *(void *)(v2 + 192) = v3;
  *(void *)(v2 + 200) = *(void *)(v3 - 8);
  *(void *)(v2 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A358);
  *(void *)(v2 + 216) = swift_task_alloc();
  *(void *)(v2 + 224) = swift_task_alloc();
  *(void *)(v2 + 232) = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A290);
  *(void *)(v2 + 240) = v4;
  *(void *)(v2 + 248) = *(void *)(v4 - 8);
  *(void *)(v2 + 256) = swift_task_alloc();
  *(void *)(v2 + 264) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A2E7C9C, v1, 0);
}

uint64_t sub_24A2E7C9C()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations;
  *(void *)(v0 + 272) = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations;
  uint64_t v6 = v4 + v5;
  swift_beginAccess();
  uint64_t v7 = &qword_26978A358;
  sub_24A2EDC90(v6, v1, &qword_26978A358);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v8 = (uint64_t *)(v0 + 232);
LABEL_5:
    sub_24A2EE090(*v8, v7);
    if (qword_269789F28 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24A2F5810();
    __swift_project_value_buffer(v15, (uint64_t)qword_26978AE88);
    uint64_t v16 = sub_24A2F57F0();
    os_log_type_t v17 = sub_24A2F5A10();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_24A2CB000, v16, v17, "Fetching fresh recommendations", v18, 2u);
      MEMORY[0x24C5C0F80](v18, -1, -1);
    }
    uint64_t v19 = *(void *)(v0 + 184);

    BOOL v20 = *(void **)(v19 + 112);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 168;
    *(void *)(v0 + 24) = sub_24A2E818C;
    uint64_t v21 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24A2E8408;
    *(void *)(v0 + 104) = &block_descriptor_68;
    *(void *)(v0 + 112) = v21;
    objc_msgSend(v20, sel_fetchRecommendationsWithCompletion_, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  uint64_t v8 = (uint64_t *)(v0 + 264);
  uint64_t v9 = *(double **)(v0 + 264);
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 208);
  uint64_t v12 = *(void *)(v0 + 192);
  uint64_t v7 = &qword_26978A290;
  sub_24A2EDC2C(*(void *)(v0 + 232), (uint64_t)v9, &qword_26978A290);
  sub_24A2F57A0();
  sub_24A2F5790();
  double v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9 || (*(unsigned char *)(v0 + 288) & 1) != 0) {
    goto LABEL_5;
  }
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v23 = *(void *)(v0 + 256);
  uint64_t v22 = *(void *)(v0 + 264);
  uint64_t v24 = sub_24A2F5810();
  __swift_project_value_buffer(v24, (uint64_t)qword_26978AE88);
  sub_24A2EDC90(v22, v23, &qword_26978A290);
  uint64_t v25 = sub_24A2F57F0();
  os_log_type_t v26 = sub_24A2F5A10();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = *(void *)(v0 + 256);
  if (v27)
  {
    uint64_t v29 = *(void *)(v0 + 240);
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 138412290;
    uint64_t v32 = *(void **)(v28 + *(int *)(v29 + 32));
    *(void *)(v0 + 176) = v32;
    id v33 = v32;
    sub_24A2F5AC0();
    *uint64_t v31 = v32;
    sub_24A2EE090(v28, &qword_26978A290);
    _os_log_impl(&dword_24A2CB000, v25, v26, "Reusing cached recommendations %@", v30, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A030);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v31, -1, -1);
    MEMORY[0x24C5C0F80](v30, -1, -1);
  }
  else
  {
    sub_24A2EE090(*(void *)(v0 + 256), &qword_26978A290);
  }
  uint64_t v34 = *(void *)(v0 + 264);
  uint64_t v35 = *(void *)(v0 + 240);

  id v36 = *(id *)(v34 + *(int *)(v35 + 32));
  sub_24A2EE090(v34, &qword_26978A290);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = *(uint64_t (**)(id))(v0 + 8);
  return v37(v36);
}

uint64_t sub_24A2E818C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 280) = v2;
  uint64_t v3 = *(void *)(v1 + 184);
  if (v2) {
    uint64_t v4 = sub_24A2EEEB0;
  }
  else {
    uint64_t v4 = sub_24A2E82AC;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A2E82AC()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[31];
  uint64_t v4 = v0[27];
  uint64_t v3 = (void *)v0[28];
  uint64_t v5 = v0[23] + v0[34];
  uint64_t v6 = (void *)v0[21];
  *(void *)((char *)v3 + *(int *)(v1 + 32)) = v6;
  void *v3 = 0x40F5180000000000;
  id v7 = v6;
  sub_24A2F57A0();
  (*(void (**)(void *, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  sub_24A2EDC2C((uint64_t)v3, v4, &qword_26978A358);
  swift_beginAccess();
  sub_24A2EDBC8(v4, v5, &qword_26978A358);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(id))v0[1];
  return v8(v7);
}

uint64_t sub_24A2E840C(char a1)
{
  *(void *)(v2 + 184) = v1;
  *(unsigned char *)(v2 + 288) = a1;
  uint64_t v3 = sub_24A2F57B0();
  *(void *)(v2 + 192) = v3;
  *(void *)(v2 + 200) = *(void *)(v3 - 8);
  *(void *)(v2 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A368);
  *(void *)(v2 + 216) = swift_task_alloc();
  *(void *)(v2 + 224) = swift_task_alloc();
  *(void *)(v2 + 232) = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26978A2B0);
  *(void *)(v2 + 240) = v4;
  *(void *)(v2 + 248) = *(void *)(v4 - 8);
  *(void *)(v2 + 256) = swift_task_alloc();
  *(void *)(v2 + 264) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A2E858C, v1, 0);
}

uint64_t sub_24A2E858C()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset;
  *(void *)(v0 + 272) = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset;
  uint64_t v6 = v4 + v5;
  swift_beginAccess();
  id v7 = &qword_26978A368;
  sub_24A2EDC90(v6, v1, &qword_26978A368);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v8 = (uint64_t *)(v0 + 232);
LABEL_5:
    sub_24A2EE090(*v8, v7);
    if (qword_269789F28 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24A2F5810();
    __swift_project_value_buffer(v15, (uint64_t)qword_26978AE88);
    uint64_t v16 = sub_24A2F57F0();
    os_log_type_t v17 = sub_24A2F5A10();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_24A2CB000, v16, v17, "Fetching fresh rulesets", v18, 2u);
      MEMORY[0x24C5C0F80](v18, -1, -1);
    }
    uint64_t v19 = *(void *)(v0 + 184);

    BOOL v20 = *(void **)(v19 + 112);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 168;
    *(void *)(v0 + 24) = sub_24A2E8A7C;
    uint64_t v21 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24A2E8408;
    *(void *)(v0 + 104) = &block_descriptor_66;
    *(void *)(v0 + 112) = v21;
    objc_msgSend(v20, sel_fetchRecommendationsRulesetWithCompletion_, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  uint64_t v8 = (uint64_t *)(v0 + 264);
  uint64_t v9 = *(double **)(v0 + 264);
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 208);
  uint64_t v12 = *(void *)(v0 + 192);
  id v7 = qword_26978A2B0;
  sub_24A2EDC2C(*(void *)(v0 + 232), (uint64_t)v9, qword_26978A2B0);
  sub_24A2F57A0();
  sub_24A2F5790();
  double v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9 || (*(unsigned char *)(v0 + 288) & 1) != 0) {
    goto LABEL_5;
  }
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v23 = *(void *)(v0 + 256);
  uint64_t v22 = *(void *)(v0 + 264);
  uint64_t v24 = sub_24A2F5810();
  __swift_project_value_buffer(v24, (uint64_t)qword_26978AE88);
  sub_24A2EDC90(v22, v23, qword_26978A2B0);
  uint64_t v25 = sub_24A2F57F0();
  os_log_type_t v26 = sub_24A2F5A10();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = *(void *)(v0 + 256);
  if (v27)
  {
    uint64_t v29 = *(void *)(v0 + 240);
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 138412290;
    uint64_t v32 = *(void **)(v28 + *(int *)(v29 + 32));
    *(void *)(v0 + 176) = v32;
    id v33 = v32;
    sub_24A2F5AC0();
    *uint64_t v31 = v32;
    sub_24A2EE090(v28, qword_26978A2B0);
    _os_log_impl(&dword_24A2CB000, v25, v26, "Reusing cached rulesets %@", v30, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A030);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v31, -1, -1);
    MEMORY[0x24C5C0F80](v30, -1, -1);
  }
  else
  {
    sub_24A2EE090(*(void *)(v0 + 256), qword_26978A2B0);
  }
  uint64_t v34 = *(void *)(v0 + 264);
  uint64_t v35 = *(void *)(v0 + 240);

  id v36 = *(id *)(v34 + *(int *)(v35 + 32));
  sub_24A2EE090(v34, qword_26978A2B0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = *(uint64_t (**)(id))(v0 + 8);
  return v37(v36);
}

uint64_t sub_24A2E8A7C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 280) = v2;
  uint64_t v3 = *(void *)(v1 + 184);
  if (v2) {
    uint64_t v4 = sub_24A2E8CF8;
  }
  else {
    uint64_t v4 = sub_24A2E8B9C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A2E8B9C()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[31];
  uint64_t v4 = v0[27];
  uint64_t v3 = (void *)v0[28];
  uint64_t v5 = v0[23] + v0[34];
  uint64_t v6 = (void *)v0[21];
  *(void *)((char *)v3 + *(int *)(v1 + 32)) = v6;
  void *v3 = 0x40F5180000000000;
  id v7 = v6;
  sub_24A2F57A0();
  (*(void (**)(void *, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  sub_24A2EDC2C((uint64_t)v3, v4, &qword_26978A368);
  swift_beginAccess();
  sub_24A2EDBC8(v4, v5, &qword_26978A368);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(id))v0[1];
  return v8(v7);
}

uint64_t sub_24A2E8CF8()
{
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A2E8DB0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A360);
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

uint64_t sub_24A2E8E70(char a1)
{
  *(void *)(v2 + 184) = v1;
  *(unsigned char *)(v2 + 304) = a1;
  uint64_t v3 = sub_24A2F57B0();
  *(void *)(v2 + 192) = v3;
  *(void *)(v2 + 200) = *(void *)(v3 - 8);
  *(void *)(v2 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A358);
  *(void *)(v2 + 216) = swift_task_alloc();
  *(void *)(v2 + 224) = swift_task_alloc();
  *(void *)(v2 + 232) = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A290);
  *(void *)(v2 + 240) = v4;
  *(void *)(v2 + 248) = *(void *)(v4 - 8);
  *(void *)(v2 + 256) = swift_task_alloc();
  *(void *)(v2 + 264) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A2E8FF0, v1, 0);
}

uint64_t sub_24A2E8FF0()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations;
  *(void *)(v0 + 272) = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations;
  uint64_t v6 = v4 + v5;
  swift_beginAccess();
  id v7 = &qword_26978A358;
  sub_24A2EDC90(v6, v1, &qword_26978A358);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    id v8 = (uint64_t *)(v0 + 232);
    goto LABEL_5;
  }
  id v8 = (uint64_t *)(v0 + 264);
  uint64_t v9 = *(double **)(v0 + 264);
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 208);
  uint64_t v12 = *(void *)(v0 + 192);
  id v7 = &qword_26978A290;
  sub_24A2EDC2C(*(void *)(v0 + 232), (uint64_t)v9, &qword_26978A290);
  sub_24A2F57A0();
  sub_24A2F5790();
  double v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9 || (*(unsigned char *)(v0 + 304) & 1) != 0)
  {
LABEL_5:
    sub_24A2EE090(*v8, v7);
    uint64_t v15 = swift_task_alloc();
    *(void *)(v0 + 280) = v15;
    *(void *)uint64_t v15 = v0;
    *(void *)(v15 + 8) = sub_24A2E93E0;
    uint64_t v16 = *(void *)(v0 + 184);
    *(void *)(v15 + 24) = v16;
    *(unsigned char *)(v15 + 72) = 0;
    return MEMORY[0x270FA2498](sub_24A2E6AF4, v16, 0);
  }
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void *)(v0 + 256);
  uint64_t v17 = *(void *)(v0 + 264);
  uint64_t v19 = sub_24A2F5810();
  __swift_project_value_buffer(v19, (uint64_t)qword_26978AE88);
  sub_24A2EDC90(v17, v18, &qword_26978A290);
  BOOL v20 = sub_24A2F57F0();
  os_log_type_t v21 = sub_24A2F5A10();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v23 = *(void *)(v0 + 256);
  if (v22)
  {
    uint64_t v24 = *(void *)(v0 + 240);
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v26 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 138412290;
    BOOL v27 = *(void **)(v23 + *(int *)(v24 + 32));
    *(void *)(v0 + 176) = v27;
    id v28 = v27;
    sub_24A2F5AC0();
    void *v26 = v27;
    sub_24A2EE090(v23, &qword_26978A290);
    _os_log_impl(&dword_24A2CB000, v20, v21, "Reusing cached completed recommendations %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A030);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v26, -1, -1);
    MEMORY[0x24C5C0F80](v25, -1, -1);
  }
  else
  {
    sub_24A2EE090(*(void *)(v0 + 256), &qword_26978A290);
  }
  uint64_t v29 = *(void *)(v0 + 264);
  uint64_t v30 = *(void *)(v0 + 240);

  id v31 = *(id *)(v29 + *(int *)(v30 + 32));
  sub_24A2EE090(v29, &qword_26978A290);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(id))(v0 + 8);
  return v32(v31);
}

uint64_t sub_24A2E93E0(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[36] = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v3[1];
    return v4();
  }
  else
  {
    uint64_t v6 = v3[23];
    return MEMORY[0x270FA2498](sub_24A2E9564, v6, 0);
  }
}

uint64_t sub_24A2E9564()
{
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24A2F5810();
  __swift_project_value_buffer(v1, (uint64_t)qword_26978AE88);
  uint64_t v2 = sub_24A2F57F0();
  os_log_type_t v3 = sub_24A2F5A10();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24A2CB000, v2, v3, "Fetching fresh completed recommendations", v4, 2u);
    MEMORY[0x24C5C0F80](v4, -1, -1);
  }
  uint64_t v5 = v0[36];
  uint64_t v6 = v0[23];

  uint64_t v7 = *(void **)(v6 + 112);
  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_24A2E9728;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24A2E8408;
  v0[13] = &block_descriptor;
  v0[14] = v8;
  objc_msgSend(v7, sel_fetchCompletedRecommendations_completion_, v5, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24A2E9728()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 296) = v2;
  uint64_t v3 = *(void *)(v1 + 184);
  if (v2) {
    uint64_t v4 = sub_24A2E99B4;
  }
  else {
    uint64_t v4 = sub_24A2E9848;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A2E9848()
{
  uint64_t v1 = (void *)v0[36];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v5 = v0[27];
  uint64_t v4 = (void *)v0[28];
  uint64_t v6 = v0[23] + v0[34];
  uint64_t v7 = (void *)v0[21];
  *(void *)((char *)v4 + *(int *)(v2 + 32)) = v7;
  *uint64_t v4 = 0x40F5180000000000;
  id v8 = v7;
  sub_24A2F57A0();

  (*(void (**)(void *, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  sub_24A2EDC2C((uint64_t)v4, v5, &qword_26978A358);
  swift_beginAccess();
  sub_24A2EDBC8(v5, v6, &qword_26978A358);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(id))v0[1];
  return v9(v8);
}

uint64_t sub_24A2E99B4()
{
  uint64_t v1 = *(void **)(v0 + 288);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24A2E9A6C(char a1)
{
  *(void *)(v2 + 56) = v1;
  *(unsigned char *)(v2 + 144) = a1;
  uint64_t v3 = sub_24A2F57B0();
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 72) = *(void *)(v3 - 8);
  *(void *)(v2 + 80) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A338);
  *(void *)(v2 + 88) = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A2A0);
  *(void *)(v2 + 96) = v4;
  *(void *)(v2 + 104) = *(void *)(v4 - 8);
  *(void *)(v2 + 112) = swift_task_alloc();
  *(void *)(v2 + 120) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A2E9BD0, v1, 0);
}

uint64_t sub_24A2E9BD0()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 56)
     + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations;
  swift_beginAccess();
  uint64_t v5 = &qword_26978A338;
  sub_24A2EDC90(v4, v1, &qword_26978A338);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v6 = (uint64_t *)(v0 + 88);
    goto LABEL_5;
  }
  uint64_t v6 = (uint64_t *)(v0 + 120);
  uint64_t v7 = *(double **)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 64);
  uint64_t v5 = &qword_26978A2A0;
  sub_24A2EDC2C(*(void *)(v0 + 88), (uint64_t)v7, &qword_26978A2A0);
  sub_24A2F57A0();
  sub_24A2F5790();
  double v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  if (v12 >= *v7 || (*(unsigned char *)(v0 + 144) & 1) != 0)
  {
LABEL_5:
    sub_24A2EE090(*v6, v5);
    uint64_t v13 = *(void *)(v0 + 56);
    uint64_t v14 = sub_24A2EDCF4(&qword_26978A340, (void (*)(uint64_t))type metadata accessor for DataFetcher);
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v15;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A038);
    *uint64_t v15 = v0;
    v15[1] = sub_24A2EA068;
    uint64_t v17 = *(void *)(v0 + 56);
    return MEMORY[0x270FA2360](v0 + 40, v13, v14, 0xD000000000000037, 0x800000024A2F90B0, sub_24A2EDA14, v17, v16);
  }
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v19 = *(void *)(v0 + 112);
  uint64_t v18 = *(void *)(v0 + 120);
  uint64_t v20 = sub_24A2F5810();
  __swift_project_value_buffer(v20, (uint64_t)qword_26978AE88);
  sub_24A2EDC90(v18, v19, &qword_26978A2A0);
  os_log_type_t v21 = sub_24A2F57F0();
  os_log_type_t v22 = sub_24A2F5A10();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v24 = *(void *)(v0 + 112);
  if (v23)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = v35;
    *(_DWORD *)uint64_t v25 = 136315138;
    uint64_t v26 = sub_24A2E0134(0, &qword_26978A028);
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v28 = MEMORY[0x24C5C0380](v27, v26);
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 48) = sub_24A2F0E74(v28, v30, &v36);
    sub_24A2F5AC0();
    swift_bridgeObjectRelease();
    sub_24A2EE090(v24, &qword_26978A2A0);
    _os_log_impl(&dword_24A2CB000, v21, v22, "Reusing cached client recommendations %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v35, -1, -1);
    MEMORY[0x24C5C0F80](v25, -1, -1);
  }
  else
  {
    sub_24A2EE090(*(void *)(v0 + 112), &qword_26978A2A0);
  }

  uint64_t v31 = *(void *)(v0 + 120);
  uint64_t v32 = *(void *)(v31 + *(int *)(*(void *)(v0 + 96) + 32));
  swift_bridgeObjectRetain();
  sub_24A2EE090(v31, &qword_26978A2A0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v33 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v33(v32);
}

uint64_t sub_24A2EA068()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = sub_24A2EA224;
  }
  else {
    uint64_t v4 = sub_24A2EA194;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A2EA194()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24A2EA224()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A2EA2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A348);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24A2F5810();
  __swift_project_value_buffer(v7, (uint64_t)qword_26978AE88);
  uint64_t v8 = sub_24A2F57F0();
  os_log_type_t v9 = sub_24A2F5A10();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_24A2CB000, v8, v9, "Fetching fresh client recommendations", v10, 2u);
    MEMORY[0x24C5C0F80](v10, -1, -1);
  }

  uint64_t v11 = MEMORY[0x263F8EE78];
  unint64_t v12 = sub_24A2E0534(MEMORY[0x263F8EE78]);
  unint64_t v13 = sub_24A2E0534(v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v15 + ((v6 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  swift_retain();
  sub_24A2EF584(MEMORY[0x263F8EE88], v12, v13, (uint64_t)sub_24A2EDAC4, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24A2EA504(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A338);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)((char *)&v26 - v10);
  if (a2)
  {
    if (qword_269789F28 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_24A2F5810();
    __swift_project_value_buffer(v12, (uint64_t)qword_26978AE88);
    id v13 = a2;
    id v14 = a2;
    uint64_t v15 = sub_24A2F57F0();
    os_log_type_t v16 = sub_24A2F5A20();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      id v19 = a2;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v27 = v20;
      sub_24A2F5AC0();
      *uint64_t v18 = v20;

      _os_log_impl(&dword_24A2CB000, v15, v16, "Error fetching client recommendations: %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26978A030);
      swift_arrayDestroy();
      MEMORY[0x24C5C0F80](v18, -1, -1);
      MEMORY[0x24C5C0F80](v17, -1, -1);
    }
    else
    {
    }
    sub_24A2EDB74();
    uint64_t v24 = swift_allocError();
    *uint64_t v25 = 1;
    uint64_t v27 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A348);
    return sub_24A2F5990();
  }
  else
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A2A0);
    *(void *)((char *)v11 + *(int *)(v21 + 32)) = a1;
    *uint64_t v11 = 0x40F5180000000000;
    swift_bridgeObjectRetain();
    sub_24A2F57A0();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v11, 0, 1, v21);
    sub_24A2EDC2C((uint64_t)v11, (uint64_t)v9, &qword_26978A338);
    uint64_t v22 = a4
        + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations;
    swift_beginAccess();
    sub_24A2EDBC8((uint64_t)v9, v22, &qword_26978A338);
    swift_endAccess();
    uint64_t v27 = a1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A348);
    return sub_24A2F59A0();
  }
}

uint64_t sub_24A2EA864()
{
  sub_24A2EE090(v0 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations, &qword_26978A358);
  sub_24A2EE090(v0+ OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations, &qword_26978A338);
  sub_24A2EE090(v0+ OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations, &qword_26978A358);
  sub_24A2EE090(v0 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset, &qword_26978A368);
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24A2EA91C()
{
  return v0;
}

uint64_t sub_24A2EA928(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24A2EA93C()
{
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_24A2EEEBC;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
  *(unsigned char *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return MEMORY[0x270FA2498](sub_24A2E2C7C, 0, 0);
}

uint64_t sub_24A2EAA04()
{
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_24A2EEEBC;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
  *(unsigned char *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return MEMORY[0x270FA2498](sub_24A2E3A64, 0, 0);
}

uint64_t sub_24A2EAAC8(uint64_t a1, int *a2)
{
  long long v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A2EABA4;
  return v6(a1);
}

uint64_t sub_24A2EABA4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24A2EAC9C(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24A2EEEBC;
  return v6();
}

uint64_t sub_24A2EAD68(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_24A2EEEBC;
  return v7();
}

uint64_t sub_24A2EAE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A2F59C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A2F59B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24A2EE090(a1, &qword_26978A170);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A2F5980();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24A2EAFE0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A2EEF10;
  return v6(a1);
}

unint64_t sub_24A2EB0BC(uint64_t a1, uint64_t a2)
{
  sub_24A2F5CB0();
  sub_24A2F58F0();
  uint64_t v4 = sub_24A2F5CD0();
  return sub_24A2EB134(a1, a2, v4);
}

unint64_t sub_24A2EB134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A2F5C10() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24A2F5C10() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24A2EB218(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A130);
  char v36 = a2;
  uint64_t v6 = sub_24A2F5BA0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24A2F5CB0();
    sub_24A2F58F0();
    uint64_t result = sub_24A2F5CD0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24A2EB530(uint64_t a1, char a2)
{
  return sub_24A2EB854(a1, a2, &qword_26978A110);
}

uint64_t sub_24A2EB53C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A138);
  char v36 = a2;
  uint64_t v6 = sub_24A2F5BA0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_24A2F5CB0();
    sub_24A2F58F0();
    uint64_t result = sub_24A2F5CD0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24A2EB854(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_24A2F5BA0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  char v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_24A2F5CB0();
    sub_24A2F58F0();
    uint64_t result = sub_24A2F5CD0();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  unint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

void *sub_24A2EBB60()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A130);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A2F5B90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
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
      goto LABEL_28;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

id sub_24A2EBD18()
{
  return sub_24A2EBEDC(&qword_26978A110);
}

void *sub_24A2EBD24()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A138);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A2F5B90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
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
      goto LABEL_28;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

id sub_24A2EBEDC(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_24A2F5B90();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t (*sub_24A2EC088(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24A2EC1A4(v6, a2, a3);
  return sub_24A2EC0F0;
}

uint64_t (*sub_24A2EC0F4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24A2EC22C(v6, a2, a3);
  return sub_24A2EC0F0;
}

void sub_24A2EC15C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_24A2EC1A4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C5C0580](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_24A2EC224;
  }
  __break(1u);
  return result;
}

void sub_24A2EC224(id *a1)
{
}

uint64_t (*sub_24A2EC22C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C5C0580](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_24A2EEF04;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A2EC2B0()
{
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_24A2EEEBC;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
  *(unsigned char *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return MEMORY[0x270FA2498](sub_24A2E4C68, 0, 0);
}

uint64_t sub_24A2EC378()
{
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_24A2EEEBC;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
  *(unsigned char *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return MEMORY[0x270FA2498](sub_24A2E5088, 0, 0);
}

uint64_t type metadata accessor for DataFetchers()
{
  return self;
}

uint64_t type metadata accessor for RecommendationsFetcher()
{
  return self;
}

unint64_t sub_24A2EC488()
{
  unint64_t result = qword_26978A208;
  if (!qword_26978A208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26978A208);
  }
  return result;
}

uint64_t method lookup function for RecommendationsFetcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RecommendationsFetcher);
}

uint64_t dispatch thunk of RecommendationsFetcher.refreshCache(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of RecommendationsFetcher.refreshCache(for:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchServerRecommendations(for:shouldIgnoreCache:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchServerRecommendationsAsync(for:shouldIgnoreCache:)(uint64_t a1, uint64_t a2)
{
  long long v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x70);
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24A2EEEB8;
  return v9(a1, a2);
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchRulesets(for:shouldIgnoreCache:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchRulesetsAsync(for:shouldIgnoreCache:)(uint64_t a1, uint64_t a2)
{
  long long v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x80);
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24A2EEEB8;
  return v9(a1, a2);
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchCompletedRecommendations(for:shouldIgnoreCache:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchClientRecommendations(for:shouldIgnoreCache:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchClientRecommendationsAsync(for:shouldIgnoreCache:)(uint64_t a1, uint64_t a2)
{
  long long v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x98);
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24A2EC980;
  return v9(a1, a2);
}

uint64_t sub_24A2EC980(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unsigned char *storeEnumTagSinglePayload for RecommendationsFetcher.FetchError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A2ECB48);
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

ValueMetadata *type metadata accessor for RecommendationsFetcher.FetchError()
{
  return &type metadata for RecommendationsFetcher.FetchError;
}

uint64_t sub_24A2ECB80()
{
  return type metadata accessor for DataFetcher();
}

uint64_t type metadata accessor for DataFetcher()
{
  uint64_t result = qword_26978A250;
  if (!qword_26978A250) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24A2ECBD4()
{
  sub_24A2ECD30(319, &qword_26978A288, &qword_26978A290);
  if (v0 <= 0x3F)
  {
    sub_24A2ECD30(319, &qword_26978A298, &qword_26978A2A0);
    if (v1 <= 0x3F)
    {
      sub_24A2ECD30(319, &qword_26978A2A8, qword_26978A2B0);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_24A2ECD30(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_24A2F5AB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24A2ECD80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24A2ECD88()
{
  uint64_t result = sub_24A2F57B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_24A2ECE64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_24A2F57B0();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  if ((v12 | v8) > 7
    || ((*(_DWORD *)(v11 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((v9 + ((v8 + 8) & ~v8) + v12) & ~v12) + *(void *)(*(void *)(v10 - 8) + 64) > 0x18)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + (((v12 | v8) & 0xF8 ^ 0x1F8) & ((v12 | v8) + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v16 = ~v8;
    *a1 = *a2;
    uint64_t v17 = (char *)a1 + v8;
    uint64_t v18 = (char *)a2 + v8;
    uint64_t v19 = (unint64_t)(v17 + 8) & v16;
    uint64_t v20 = (unint64_t)(v18 + 8) & v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v19, v20, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))((v19 + v9 + v12) & ~v12, (v20 + v9 + v12) & ~v12, v10);
  }
  return a1;
}

uint64_t sub_24A2ED014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A2F57B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5 + 8;
  unint64_t v7 = (a1 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v9 = *(uint64_t (**)(unint64_t))(v8 + 8);
  unint64_t v10 = (v7 + *(void *)(v6 + 56) + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  return v9(v10);
}

void *sub_24A2ED0D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_24A2F57B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 16))((*(void *)(v8 + 48) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(void *)(v8 + 48) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

void *sub_24A2ED1B4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_24A2F57B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v10, v11, v6);
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 24))((*(void *)(v8 + 40) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(void *)(v8 + 40) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

void *sub_24A2ED294(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_24A2F57B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v11, v6);
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 32))((*(void *)(v8 + 32) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(void *)(v8 + 32) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

void *sub_24A2ED374(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_24A2F57B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v10, v11, v6);
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 40))((*(void *)(v8 + 24) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(void *)(v8 + 24) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_24A2ED454(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(sub_24A2F57B0() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = *(void *)(v6 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= v7) {
    unsigned int v13 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v8 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (a2 <= v13) {
    goto LABEL_24;
  }
  uint64_t v14 = ((v11 + ((v10 + 8) & ~v10) + v12) & ~v12) + *(void *)(v8 + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v13)
      {
        uint64_t v21 = ((unint64_t)a1 + v10 + 8) & ~v10;
        if (v7 >= v9)
        {
          int64_t v25 = *(uint64_t (**)(uint64_t))(v6 + 48);
          return v25(v21);
        }
        else
        {
          uint64_t v22 = (v21 + v11 + v12) & ~v12;
          int64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 48);
          return v23(v22, v9);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = ((v11 + ((v10 + 8) & ~v10) + v12) & ~v12) + *(_DWORD *)(v8 + 64);
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v13 + (v20 | v18) + 1;
}

void sub_24A2ED6D4(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(sub_24A2F57B0() - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  if (v11 <= v9) {
    unsigned int v15 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v15 = *(_DWORD *)(v10 + 84);
  }
  size_t v16 = ((v13 + ((v12 + 8) & ~v12) + v14) & ~v14) + *(void *)(v10 + 64);
  if (a3 <= v15)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v15 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v15 < a2)
  {
    unsigned int v18 = ~v15 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x24A2ED9D4);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        uint64_t v22 = (unint64_t)&a1[v12 + 8] & ~v12;
        if (v9 >= v11)
        {
          int64_t v25 = *(void (**)(uint64_t, uint64_t))(v8 + 56);
          v25(v22, a2);
        }
        else
        {
          uint64_t v23 = (v22 + v13 + v14) & ~v14;
          unint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56);
          v24(v23, a2, v11);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for CacheBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24A2EDA14(uint64_t a1)
{
  return sub_24A2EA2AC(a1, v1);
}

uint64_t sub_24A2EDA1C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A348);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24A2EDAC4(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26978A348) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_24A2EA504(a1, a2, v2 + v6, v7);
}

unint64_t sub_24A2EDB74()
{
  unint64_t result = qword_26978A350;
  if (!qword_26978A350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26978A350);
  }
  return result;
}

uint64_t sub_24A2EDBC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A2EDC2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A2EDC90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A2EDCF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A2EDD3C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A2EDD74(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  char v5 = *(unsigned char *)(v1 + 24);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_24A2EEEBC;
  *(unsigned char *)(v6 + 88) = v5;
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = v4;
  return MEMORY[0x270FA2498](sub_24A2E75C8, 0, 0);
}

uint64_t sub_24A2EDE38()
{
  uint64_t v2 = *(void **)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  char v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_24A2EEEBC;
  uint64_t v7 = (uint64_t (*)(void *, char, void *, void *))((char *)&dword_26978A390 + dword_26978A390);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_24A2EDF00()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24A2EEEBC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26978A3A0 + dword_26978A3A0);
  return v6(v2, v3, v4);
}

uint64_t sub_24A2EDFC4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24A2EEEBC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26978A3B0 + dword_26978A3B0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24A2EE090(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24A2EE0EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A2EEEBC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26978A3C0 + dword_26978A3C0);
  return v6(a1, v4);
}

uint64_t sub_24A2EE1A8()
{
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_24A2EE26C;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
  *(unsigned char *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return MEMORY[0x270FA2498](sub_24A2E5088, 0, 0);
}

uint64_t sub_24A2EE26C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24A2EE360()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24A2EE398(void *a1, uint64_t a2)
{
  sub_24A2E5634(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_24A2EE3A8()
{
  uint64_t v2 = *(void **)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_24A2EEEBC;
  uint64_t v7 = (uint64_t (*)(void *, char, void *, void *))((char *)&dword_26978A3E0 + dword_26978A3E0);
  return v7(v2, v3, v5, v4);
}

void sub_24A2EE478(uint64_t a1, uint64_t a2)
{
  sub_24A2E3EF8(a1, a2, *(void *)(v2 + 16));
}

uint64_t objectdestroy_82Tm()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A2EE4E0()
{
  uint64_t v2 = *(void **)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_24A2EEEBC;
  uint64_t v7 = (uint64_t (*)(void *, char, void *, void *))((char *)&dword_26978A408 + dword_26978A408);
  return v7(v2, v3, v5, v4);
}

uint64_t objectdestroy_86Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();

  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_24A2EE648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24A2E2BA0(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_24A2EE650()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_24A2EE688(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  char v5 = *(unsigned char *)(v1 + 24);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_24A2EEEBC;
  *(unsigned char *)(v6 + 88) = v5;
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = v4;
  return MEMORY[0x270FA2498](sub_24A2E79F0, 0, 0);
}

uint64_t sub_24A2EE748(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  char v5 = *(unsigned char *)(v1 + 24);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_24A2EE26C;
  *(unsigned char *)(v6 + 88) = v5;
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = v4;
  return MEMORY[0x270FA2498](sub_24A2E6F98, 0, 0);
}

uint64_t sub_24A2EE808(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  char v5 = *(unsigned char *)(v1 + 24);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_24A2EEEBC;
  *(unsigned char *)(v6 + 88) = v5;
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = v4;
  return MEMORY[0x270FA2498](sub_24A2E687C, 0, 0);
}

uint64_t sub_24A2EE8C8(void *a1)
{
  uint64_t v2 = v1;
  swift_defaultActor_initialize();
  uint64_t v4 = v1 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A290);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  uint64_t v7 = v2
     + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978A2A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v6(v2+ OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations, 1, 1, v5);
  uint64_t v9 = v2 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26978A2B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters;
  sub_24A2F57E0();
  *(void *)(v2 + v11) = sub_24A2F57D0();
  *(void *)(v2 + 112) = objc_msgSend(objc_allocWithZone((Class)CERecommendationDataController), sel_initWithAccount_, a1);
  id v12 = objc_allocWithZone((Class)type metadata accessor for ClientRecommendationsRepository());
  *(void *)(v2 + 120) = sub_24A2F26B0(a1);
  return v2;
}

uint64_t sub_24A2EEA78()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A2EEAB0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A2EEEBC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26978A468 + dword_26978A468);
  return v6(a1, v4);
}

uint64_t sub_24A2EEB68()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A2EEBA8(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_24A2EEEBC;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24A2E2158, 0, 0);
}

uint64_t sub_24A2EEC5C(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_24A2EEEBC;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24A2E2408, 0, 0);
}

uint64_t sub_24A2EED10(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_24A2EEEBC;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24A2E2740, 0, 0);
}

uint64_t sub_24A2EEDC4(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_24A2EEEBC;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24A2E284C, 0, 0);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void (*sub_24A2EEF18(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24A2F187C(v6, a2, a3);
  return sub_24A2EEF98;
}

void sub_24A2EEF98(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

id sub_24A2EEFEC(char a1)
{
  char v18 = a1 & 1;
  sub_24A2E08B4();
  uint64_t v1 = sub_24A2F5BF0();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
  }
  else
  {
    uint64_t v2 = (void *)swift_allocError();
    unsigned char *v3 = v18;
  }
  uint64_t v4 = (void *)sub_24A2F5710();

  id v5 = objc_msgSend(v4, sel_domain);
  sub_24A2F58E0();

  id v6 = objc_msgSend(v4, sel_code);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A0F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A2F7B30;
  *(void *)(inited + 32) = sub_24A2F58E0();
  *(void *)(inited + 40) = v8;
  id v9 = objc_msgSend(v4, sel_localizedDescription);
  uint64_t v10 = sub_24A2F58E0();
  uint64_t v12 = v11;

  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v10;
  *(void *)(inited + 56) = v12;
  sub_24A2E02EC(inited);
  id v13 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v14 = (void *)sub_24A2F58B0();
  swift_bridgeObjectRelease();
  unsigned int v15 = (void *)sub_24A2F58A0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, v6, v15);

  return v16;
}

id ClientRecommendationsRepository.__allocating_init(account:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_24A2F26B0(a1);

  return v4;
}

uint64_t sub_24A2EF214()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24A2EF25C(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_24A2EF2A8())()
{
  return j__swift_endAccess;
}

uint64_t sub_24A2EF304()
{
  uint64_t v0 = sub_24A2F5A70();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A2F5A50();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_24A2F5860();
  MEMORY[0x270FA5388](v5 - 8);
  sub_24A2E0134(0, &qword_26978A050);
  sub_24A2F5850();
  v7[1] = MEMORY[0x263F8EE78];
  sub_24A2F2C4C(&qword_26978A058, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A060);
  sub_24A2F2C94(&qword_26978A068, &qword_26978A060);
  sub_24A2F5AE0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_24A2F5A90();
  qword_26978A4B8 = result;
  return result;
}

id ClientRecommendationsRepository.init(account:)(void *a1)
{
  id v2 = sub_24A2F26B0(a1);

  return v2;
}

uint64_t sub_24A2EF584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a5;
  uint64_t v10 = sub_24A2F5830();
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24A2F5860();
  uint64_t v13 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  unsigned int v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269789F38 != -1) {
    swift_once();
  }
  v21[1] = qword_26978A4B8;
  id v16 = (void *)swift_allocObject();
  v16[2] = v5;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  uint64_t v17 = v23;
  v16[6] = a4;
  v16[7] = v17;
  aBlock[4] = sub_24A2F284C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A2DD4A8;
  aBlock[3] = &block_descriptor_1;
  char v18 = _Block_copy(aBlock);
  id v19 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24A2F5840();
  uint64_t v25 = MEMORY[0x263F8EE78];
  sub_24A2F2C4C(&qword_269789F98, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269789FA0);
  sub_24A2F2C94(&qword_269789FA8, &qword_269789FA0);
  sub_24A2F5AE0();
  MEMORY[0x24C5C04C0](0, v15, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v24);
  return swift_release();
}

void sub_24A2EF8A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void), uint64_t a5)
{
  uint64_t v6 = v5;
  id v12 = objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = (void (*)(char *, uint64_t))sub_24A2F58E0();
    unint64_t v16 = v15;

    uint64_t v17 = (unsigned char *)(v6 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
    swift_beginAccess();
    if ((*v17 & 1) == 0)
    {
      id v34 = a4;
      if (qword_269789F20 != -1) {
        swift_once();
      }
      sub_24A2DA9CC((uint64_t)v14, v16);
      if (v18)
      {
        uint64_t v19 = v18;
        if (qword_269789F28 != -1) {
          swift_once();
        }
        uint64_t v20 = sub_24A2F5810();
        __swift_project_value_buffer(v20, (uint64_t)qword_26978AE88);
        swift_bridgeObjectRetain();
        int v21 = sub_24A2F57F0();
        os_log_type_t v22 = sub_24A2F5A10();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = (uint8_t *)swift_slowAlloc();
          uint64_t v24 = swift_slowAlloc();
          uint64_t v36 = v24;
          *(_DWORD *)uint64_t v23 = 136315138;
          swift_bridgeObjectRetain();
          sub_24A2F0E74((uint64_t)v14, v16, &v36);
          sub_24A2F5AC0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24A2CB000, v21, v22, "Returning cached recommendations for altDSID:%s", v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5C0F80](v24, -1, -1);
          MEMORY[0x24C5C0F80](v23, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v34(v19, 0);
        swift_bridgeObjectRelease();
        return;
      }
      if (qword_269789F28 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_24A2F5810();
      __swift_project_value_buffer(v29, (uint64_t)qword_26978AE88);
      uint64_t v30 = sub_24A2F57F0();
      os_log_type_t v31 = sub_24A2F5A10();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl(&dword_24A2CB000, v30, v31, "No cache found, reaching out to client donors.", v32, 2u);
        MEMORY[0x24C5C0F80](v32, -1, -1);
      }

      a4 = v34;
    }
    uint64_t v33 = *(void **)(v6 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_pluginsLoader);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_24A2DDD2C(a1, a2, a3, v33, a1, a4, a5, v14, v16);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease_n();
    return;
  }
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_24A2F5810();
  __swift_project_value_buffer(v25, (uint64_t)qword_26978AE88);
  char v26 = sub_24A2F57F0();
  os_log_type_t v27 = sub_24A2F5A20();
  if (os_log_type_enabled(v26, v27))
  {
    BOOL v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v28 = 0;
    _os_log_impl(&dword_24A2CB000, v26, v27, "Invalid account. No altDSID found.", v28, 2u);
    MEMORY[0x24C5C0F80](v28, -1, -1);
  }

  id v35 = sub_24A2EEFEC(0);
  a4(MEMORY[0x263F8EE78], v35);
}

void sub_24A2EFD6C(unint64_t a1, void *a2, uint64_t a3, void (*a4)(unint64_t, void), uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24A2F5810();
  __swift_project_value_buffer(v12, (uint64_t)qword_26978AE88);
  uint64_t v13 = sub_24A2F57F0();
  os_log_type_t v14 = sub_24A2F5A10();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl(&dword_24A2CB000, v13, v14, "Request to fetch recommendations from client donors has been completed.", v15, 2u);
    MEMORY[0x24C5C0F80](v15, -1, -1);
  }

  if (!a2)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_24A2F5B80();
      swift_bridgeObjectRelease();
      if (v28) {
        goto LABEL_10;
      }
    }
    else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_10:
      if (qword_269789F20 != -1) {
        swift_once();
      }
      sub_24A2DA6CC(a6, a7, a1);
    }
    a4(a1, 0);
    return;
  }
  swift_bridgeObjectRetain();
  id v16 = a2;
  swift_bridgeObjectRetain();
  id v17 = a2;
  uint64_t v18 = sub_24A2F57F0();
  os_log_type_t v19 = sub_24A2F5A20();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    int v21 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v31 = v22;
    *(_DWORD *)uint64_t v20 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_24A2F59D0();
    uint64_t v29 = a4;
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    sub_24A2F0E74(v23, v25, &v31);
    sub_24A2F5AC0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    id v26 = a2;
    uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
    sub_24A2F5AC0();
    *int v21 = v30;
    a4 = v29;

    _os_log_impl(&dword_24A2CB000, v18, v19, "Unable to fetch recommendations from client donors for bundles:%s error: %@", (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A030);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v22, -1, -1);
    MEMORY[0x24C5C0F80](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  id v27 = sub_24A2EEFEC(1);
  a4(MEMORY[0x263F8EE78], v27);
}

void sub_24A2F0144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void, void), uint64_t a6)
{
  uint64_t v7 = v6;
  id v14 = objc_msgSend(*(id *)(v6 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID);
  if (v14)
  {
    unint64_t v15 = v14;
    uint64_t v16 = sub_24A2F58E0();
    unint64_t v18 = v17;

    os_log_type_t v19 = (unsigned char *)(v7 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
    swift_beginAccess();
    if (*v19)
    {
      swift_bridgeObjectRelease();
LABEL_23:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26978A4D0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24A2F7B30;
      *(void *)(inited + 32) = a1;
      *(void *)(inited + 40) = a2;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_24A2F2894(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = a5;
      *(void *)(v37 + 24) = a6;
      swift_retain();
      sub_24A2EF584(v36, a3, a4, (uint64_t)sub_24A2F2964, v37);
      swift_bridgeObjectRelease();
      swift_release();
      return;
    }
    id v39 = a5;
    if (qword_269789F20 != -1) {
      swift_once();
    }
    sub_24A2DAC2C(v16, v18, a1, a2);
    if (!v24)
    {
      swift_bridgeObjectRelease();
      if (qword_269789F28 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_24A2F5810();
      __swift_project_value_buffer(v31, (uint64_t)qword_26978AE88);
      uint64_t v32 = sub_24A2F57F0();
      os_log_type_t v33 = sub_24A2F5A10();
      if (os_log_type_enabled(v32, v33))
      {
        id v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v34 = 0;
        _os_log_impl(&dword_24A2CB000, v32, v33, "No cache found, reaching out to client donors.", v34, 2u);
        MEMORY[0x24C5C0F80](v34, -1, -1);
      }

      a5 = (void (*)(void, void))v39;
      goto LABEL_23;
    }
    uint64_t v25 = v24;
    if (qword_269789F28 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24A2F5810();
    __swift_project_value_buffer(v26, (uint64_t)qword_26978AE88);
    swift_bridgeObjectRetain();
    id v27 = sub_24A2F57F0();
    os_log_type_t v28 = sub_24A2F5A10();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v40 = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_bridgeObjectRetain();
      sub_24A2F0E74(v16, v18, &v40);
      sub_24A2F5AC0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A2CB000, v27, v28, "Returning cached recommendations for altDSID:%s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C0F80](v30, -1, -1);
      MEMORY[0x24C5C0F80](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(uint64_t, void))v39)(v25, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_269789F28 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24A2F5810();
    __swift_project_value_buffer(v20, (uint64_t)qword_26978AE88);
    int v21 = sub_24A2F57F0();
    os_log_type_t v22 = sub_24A2F5A20();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_24A2CB000, v21, v22, "Invalid account. No altDSID found.", v23, 2u);
      MEMORY[0x24C5C0F80](v23, -1, -1);
    }

    id v38 = sub_24A2EEFEC(0);
    a5(MEMORY[0x263F8EE78], v38);
  }
}

void sub_24A2F0678()
{
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24A2F5810();
  __swift_project_value_buffer(v1, (uint64_t)qword_26978AE88);
  id v2 = sub_24A2F57F0();
  os_log_type_t v3 = sub_24A2F5A10();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24A2CB000, v2, v3, "Clear recommendations cache.", v4, 2u);
    MEMORY[0x24C5C0F80](v4, -1, -1);
  }

  id v5 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_24A2F58E0();
    uint64_t v9 = v8;

    if (qword_269789F20 != -1) {
      swift_once();
    }
    uint64_t v10 = (os_unfair_lock_s *)(*(void *)(qword_26978AE80 + 16) + 16);
    os_unfair_lock_lock(v10);
    swift_beginAccess();
    sub_24A2F14DC(v7, v9);
    swift_endAccess();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    oslog = sub_24A2F57F0();
    os_log_type_t v11 = sub_24A2F5A20();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_24A2CB000, oslog, v11, "Invalid account. No altDSID found.", v12, 2u);
      MEMORY[0x24C5C0F80](v12, -1, -1);
    }
  }
}

void sub_24A2F08C4(uint64_t a1, unint64_t a2)
{
  if (qword_269789F28 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24A2F5810();
  __swift_project_value_buffer(v5, (uint64_t)qword_26978AE88);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24A2F57F0();
  os_log_type_t v7 = sub_24A2F5A10();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v24[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    v23[0] = sub_24A2F0E74(a1, a2, v24);
    sub_24A2F5AC0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A2CB000, v6, v7, "Remove recommendations %s from client cache.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C0F80](v9, -1, -1);
    MEMORY[0x24C5C0F80](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v10 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID, v23[0]);
  if (v10)
  {
    os_log_type_t v11 = v10;
    uint64_t v12 = sub_24A2F58E0();
    uint64_t v14 = v13;

    if (qword_269789F20 != -1) {
      swift_once();
    }
    unint64_t v15 = (os_unfair_lock_s *)(*(void *)(qword_26978AE80 + 16) + 16);
    os_unfair_lock_lock(v15);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_24A2DA55C();
    unint64_t v17 = sub_24A2EEF18(v23, v12, v14);
    if (*v18)
    {
      os_log_type_t v19 = (void *)sub_24A2F15C4(a1, a2, (void (*)(void))sub_24A2EBD18);
      ((void (*)(void *, void))v17)(v23, 0);
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t *, void))v16)(v24, 0);
    }
    else
    {
      ((void (*)(void *, void))v17)(v23, 0);
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t *, void))v16)(v24, 0);
    }
    os_unfair_lock_unlock(v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = sub_24A2F57F0();
    os_log_type_t v21 = sub_24A2F5A20();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v22 = 0;
      _os_log_impl(&dword_24A2CB000, v20, v21, "Invalid account. No altDSID found.", v22, 2u);
      MEMORY[0x24C5C0F80](v22, -1, -1);
    }
  }
}

id ClientRecommendationsRepository.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ClientRecommendationsRepository.init()()
{
}

id ClientRecommendationsRepository.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClientRecommendationsRepository();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A2F0D68(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24A2F0DA4(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

uint64_t sub_24A2F0DD4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24A2F0DFC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24A2F0E74(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24A2F5AC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24A2F0E74(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A2F0F48(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A2F2BEC((uint64_t)v12, *a3);
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
      sub_24A2F2BEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24A2F0F48(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A2F5AD0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A2F1104(a5, a6);
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
  uint64_t v8 = sub_24A2F5B60();
  if (!v8)
  {
    sub_24A2F5B70();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A2F5BC0();
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

uint64_t sub_24A2F1104(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A2F119C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A2F137C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A2F137C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A2F119C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24A2F1314(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A2F5B30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A2F5B70();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A2F5900();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A2F5BC0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A2F5B70();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A2F1314(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A4E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A2F137C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26978A4E8);
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
  uint64_t result = sub_24A2F5BC0();
  __break(1u);
  return result;
}

unsigned char **sub_24A2F14CC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_24A2F14DC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24A2EB0BC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24A2EBB60();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_24A2F16A4(v6, v9);
  uint64_t *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24A2F15AC(uint64_t a1, uint64_t a2)
{
  return sub_24A2F15C4(a1, a2, (void (*)(void))sub_24A2EBD24);
}

uint64_t sub_24A2F15C4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  size_t v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24A2EB0BC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  uint64_t *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_24A2F16A4(v8, v11);
  uint64_t *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_24A2F16A4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24A2F5AF0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24A2F5CB0();
        swift_bridgeObjectRetain();
        sub_24A2F58F0();
        uint64_t v9 = sub_24A2F5CD0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void (*sub_24A2F187C(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24A2F1B34(v6);
  v6[10] = sub_24A2F199C(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24A2F1928;
}

void sub_24A2F1928(uint64_t a1)
{
  id v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_24A2F199C(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  unint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_24A2EB0BC(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *unint64_t v10 = v19;
        return sub_24A2F1AE4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_24A2EBB60();
      goto LABEL_7;
    }
    sub_24A2EB218(v16, a4 & 1);
    unint64_t v20 = sub_24A2EB0BC(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_24A2F5C40();
  __break(1u);
  return result;
}

void sub_24A2F1AE4(uint64_t **a1)
{
  id v1 = *a1;
  sub_24A2F1B70(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_24A2F1B34(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *id v1 = 0x8000000000000000;
  return sub_24A2F1B64;
}

uint64_t sub_24A2F1B64(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_24A2F1B70(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v8;
    }
    else
    {
      sub_24A2DBA08(a4, a5, a6, v8, (void *)*a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_24A2F16A4(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A2F1C20(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24A2F5CB0();
  swift_bridgeObjectRetain();
  sub_24A2F58F0();
  uint64_t v8 = sub_24A2F5CD0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    char v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24A2F5C10() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24A2F5C10() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24A2F20B0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24A2F1DD0()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A4F0);
  uint64_t v3 = sub_24A2F5B20();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                id v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24A2F5CB0();
      sub_24A2F58F0();
      uint64_t result = sub_24A2F5CD0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

uint64_t sub_24A2F20B0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24A2F1DD0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24A2F224C();
      goto LABEL_22;
    }
    sub_24A2F2400();
  }
  uint64_t v11 = *v4;
  sub_24A2F5CB0();
  sub_24A2F58F0();
  uint64_t result = sub_24A2F5CD0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24A2F5C10(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24A2F5C30();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24A2F5C10();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_24A2F224C()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A4F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A2F5B10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24A2F2400()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A4F0);
  uint64_t v3 = sub_24A2F5B20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
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
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24A2F5CB0();
    swift_bridgeObjectRetain();
    sub_24A2F58F0();
    uint64_t result = sub_24A2F5CD0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_24A2F26B0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_defaultThresholdDictionary;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A4F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A2F7EE0;
  *(void *)(inited + 32) = sub_24A2F58E0();
  *(void *)(inited + 40) = v5;
  sub_24A2E0134(0, &qword_26978A018);
  uint64_t v6 = v1;
  *(void *)(inited + 48) = sub_24A2F5AA0();
  *(void *)(inited + 56) = sub_24A2F58E0();
  *(void *)(inited + 64) = v7;
  *(void *)(inited + 72) = sub_24A2F5AA0();
  *(void *)&v1[v3] = sub_24A2E0534(inited);
  *(void *)&v6[OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account] = a1;
  v6[OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache] = 1;
  type metadata accessor for RecommendationsPluginLoader();
  swift_allocObject();
  id v8 = a1;
  *(void *)&v6[OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_pluginsLoader] = sub_24A2DD558();

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for ClientRecommendationsRepository();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t sub_24A2F27F4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_24A2F284C()
{
  sub_24A2EF8A0(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void (**)(uint64_t, void))(v0 + 48), *(void *)(v0 + 56));
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

uint64_t sub_24A2F2894(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24A2F59E0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24A2F1C20(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24A2F292C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A2F2964()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for ClientRecommendationsRepository()
{
  return self;
}

uint64_t sub_24A2F29B0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24A2F2A04(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = v2;
  return result;
}

uint64_t method lookup function for ClientRecommendationsRepository(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ClientRecommendationsRepository);
}

uint64_t dispatch thunk of ClientRecommendationsRepository.ignoreClientCache.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.ignoreClientCache.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.ignoreClientCache.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.__allocating_init(account:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.fetch(bundles:thresholds:timestamps:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.fetch(bundleID:thresholds:timestamps:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.removeAll()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.remove(identifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t sub_24A2F2BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A2F2C4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A2F2C94(unint64_t *a1, uint64_t *a2)
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

uint64_t __getINDaemonConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[BackupManagerProvider initWithAccount:](v0);
}

void __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_24A2CB000, v5, v6, "%@ Unable to get storage amount needed to sync account: %@", v7, v8, v9, v10, v11);
}

void __47__iCloudStorageController_fetchStorageSummary___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_24A2CB000, v5, v6, "%@ Unable to fetch cloud storage summary: %@", v7, v8, v9, v10, v11);
}

uint64_t __getICQStoragePlanRecommendationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getICQCloudStorageDataControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getICQCloudStorageDataControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getICSHomeDataControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getICSHomeDataControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CERecommendationAction initWithDictionary:](v0);
}

uint64_t sub_24A2F5710()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24A2F5720()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_24A2F5730()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_24A2F5740()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24A2F5750()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_24A2F5760()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24A2F5770()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_24A2F5780()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24A2F5790()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24A2F57A0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24A2F57B0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24A2F57C0()
{
  return MEMORY[0x270F084D8]();
}

uint64_t sub_24A2F57D0()
{
  return MEMORY[0x270F084E0]();
}

uint64_t sub_24A2F57E0()
{
  return MEMORY[0x270F084E8]();
}

uint64_t sub_24A2F57F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A2F5800()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A2F5810()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A2F5820()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_24A2F5830()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24A2F5840()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24A2F5850()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_24A2F5860()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24A2F5870()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24A2F5880()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24A2F5890()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_24A2F58A0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24A2F58B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A2F58C0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24A2F58D0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24A2F58E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A2F58F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A2F5900()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A2F5910()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24A2F5920()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24A2F5930()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24A2F5940()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24A2F5950()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24A2F5960()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24A2F5970()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24A2F5980()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24A2F5990()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24A2F59A0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24A2F59B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24A2F59C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24A2F59D0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24A2F59E0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24A2F59F0()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_24A2F5A00()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_24A2F5A10()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24A2F5A20()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A2F5A30()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A2F5A40()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_24A2F5A50()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24A2F5A60()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_24A2F5A70()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24A2F5A80()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24A2F5A90()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24A2F5AA0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_24A2F5AB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24A2F5AC0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A2F5AD0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A2F5AE0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24A2F5AF0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24A2F5B00()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24A2F5B10()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24A2F5B20()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24A2F5B30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A2F5B40()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24A2F5B50()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24A2F5B60()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A2F5B70()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A2F5B80()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24A2F5B90()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24A2F5BA0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24A2F5BB0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24A2F5BC0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A2F5BE0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24A2F5BF0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_24A2F5C00()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24A2F5C10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A2F5C30()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24A2F5C40()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24A2F5C70()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24A2F5C80()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24A2F5C90()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24A2F5CA0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24A2F5CB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A2F5CC0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A2F5CD0()
{
  return MEMORY[0x270F9FC90]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void bzero(void *a1, size_t a2)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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