void sub_217F56CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void __getPHAssetCollectionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollection");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHAssetCollectionClass_block_invoke_cold_1();
    PhotosLibrary();
  }
}

void PhotosLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PhotosLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2642F3778;
    uint64_t v3 = 0;
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PhotosLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHPhotoLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHPhotoLibraryClass_block_invoke_cold_1();
    return (Class)__51__CLFSystemShellSwitcher_sharedSystemShellSwitcher__block_invoke(v3);
  }
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

id CLFSortedCommunicationLimits()
{
  if (CLFSortedCommunicationLimits_onceToken != -1) {
    dispatch_once(&CLFSortedCommunicationLimits_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)CLFSortedCommunicationLimits_SortedCommunicationLimits;
  return v0;
}

void __CLFSortedCommunicationLimits_block_invoke()
{
  v2[3] = *MEMORY[0x263EF8340];
  v2[0] = @"selectedContacts";
  v2[1] = @"contacts";
  v2[2] = @"everyone";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:3];
  v1 = (void *)CLFSortedCommunicationLimits_SortedCommunicationLimits;
  CLFSortedCommunicationLimits_SortedCommunicationLimits = v0;
}

id CLFLegacyAppIconsDirectory()
{
  uint64_t v0 = [NSURL fileURLWithPath:AXCPSharedResourcesDirectory()];
  v1 = [v0 URLByAppendingPathComponent:@"Library/Accessibility/ClarityBoardAppIcons" isDirectory:1];

  return v1;
}

id CLFAppIconsDirectory()
{
  uint64_t v0 = [NSURL fileURLWithPath:AXCPSharedResourcesDirectory()];
  v1 = [v0 URLByAppendingPathComponent:@"Library/Accessibility/ClarityBoard/AppIcons" isDirectory:1];

  return v1;
}

id CLFWallpaperDirectory()
{
  uint64_t v0 = [NSURL fileURLWithPath:AXCPSharedResourcesDirectory()];
  v1 = [v0 URLByAppendingPathComponent:@"Library/Accessibility/ClarityBoard/Wallpaper" isDirectory:1];

  return v1;
}

id CLFWallpaperURL()
{
  uint64_t v0 = CLFWallpaperDirectory();
  v1 = [v0 URLByAppendingPathComponent:@"clarityBoardWallpaper.jpeg"];

  return v1;
}

id CLFAppIconURLForBundleIdentifier(void *a1)
{
  id v1 = a1;
  long long v2 = CLFAppIconsDirectory();
  uint64_t v3 = [v2 URLByAppendingPathComponent:v1];

  uint64_t v4 = [v3 URLByAppendingPathExtension:@"png"];

  return v4;
}

void sub_217F5A2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217F5A5C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_217F5A7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217F5A91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPSubjectClass_block_invoke(uint64_t a1)
{
  AppProtectionLibrary();
  Class result = objc_getClass("APSubject");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAPSubjectClass_block_invoke_cold_1();
  }
  getAPSubjectClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AppProtectionLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AppProtectionLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AppProtectionLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2642F38A0;
    uint64_t v3 = 0;
    AppProtectionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AppProtectionLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppProtectionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppProtectionLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPDCPreflightManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __PrivacyDisclosureCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2642F38B8;
    uint64_t v5 = 0;
    PrivacyDisclosureCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getPDCPreflightManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("PDCPreflightManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getPDCPreflightManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PrivacyDisclosureCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PrivacyDisclosureCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLSApplicationRecordClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2642F38D0;
    uint64_t v5 = 0;
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getLSApplicationRecordClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("LSApplicationRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getLSApplicationRecordClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAPApplicationClass_block_invoke(uint64_t a1)
{
  AppProtectionLibrary();
  Class result = objc_getClass("APApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAPApplicationClass_block_invoke_cold_1();
  }
  getAPApplicationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CLFListLayout.description.getter()
{
  uint64_t v0 = 1684632167;
  uint64_t v1 = sub_217F5C948();
  uint64_t v3 = v2;
  if (v1 == sub_217F5C948() && v3 == v4) {
    goto LABEL_7;
  }
  char v6 = sub_217F5C988();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6) {
    return v0;
  }
  uint64_t v0 = 0x6B63617473;
  uint64_t v8 = sub_217F5C948();
  uint64_t v10 = v9;
  if (v8 == sub_217F5C948() && v10 == v11)
  {
LABEL_7:
    swift_bridgeObjectRelease_n();
    return v0;
  }
  char v13 = sub_217F5C988();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13) {
    return v0;
  }
  uint64_t result = sub_217F5C968();
  __break(1u);
  return result;
}

uint64_t sub_217F5BE04()
{
  return CLFListLayout.description.getter();
}

void type metadata accessor for CLFListLayout()
{
  if (!qword_267BB67B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267BB67B0);
    }
  }
}

uint64_t sub_217F5BE64(uint64_t a1, uint64_t a2)
{
  return sub_217F5C204(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_217F5BE7C(uint64_t a1, id *a2)
{
  uint64_t result = sub_217F5C928();
  *a2 = 0;
  return result;
}

uint64_t sub_217F5BEF4(uint64_t a1, id *a2)
{
  char v3 = sub_217F5C938();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_217F5BF74@<X0>(uint64_t *a1@<X8>)
{
  sub_217F5C948();
  uint64_t v2 = sub_217F5C918();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_217F5BFB8()
{
  uint64_t v0 = sub_217F5C948();
  uint64_t v2 = v1;
  if (v0 == sub_217F5C948() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_217F5C988();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_217F5C044@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_217F5C918();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_217F5C08C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_217F5C948();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_217F5C0B8(uint64_t a1)
{
  uint64_t v2 = sub_217F5C310(&qword_267BB67D0);
  uint64_t v3 = sub_217F5C310(&qword_267BB67D8);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_217F5C150()
{
  return sub_217F5C310(&qword_267BB67B8);
}

uint64_t sub_217F5C184()
{
  return sub_217F5C310(&qword_267BB67C0);
}

uint64_t sub_217F5C1B8()
{
  return sub_217F5C310(&qword_267BB67C8);
}

uint64_t sub_217F5C1EC(uint64_t a1, uint64_t a2)
{
  return sub_217F5C204(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_217F5C204(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_217F5C948();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_217F5C248()
{
  sub_217F5C948();
  sub_217F5C958();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217F5C29C()
{
  sub_217F5C948();
  sub_217F5C998();
  sub_217F5C958();
  uint64_t v0 = sub_217F5C9A8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_217F5C310(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CLFListLayout();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __getPHAssetCollectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHPhotoLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CLFSystemShellSwitcher setClarityBoardEnabled:error:](v0);
}

void __getAPSubjectClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPDCPreflightManagerClass_block_invoke_cold_1(v0);
}

void __getPDCPreflightManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getLSApplicationRecordClass_block_invoke_cold_1(v0);
}

void __getLSApplicationRecordClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAPApplicationClass_block_invoke_cold_1(v0);
}

void __getAPApplicationClass_block_invoke_cold_1()
{
}

uint64_t sub_217F5C918()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_217F5C928()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_217F5C938()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_217F5C948()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_217F5C958()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_217F5C968()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_217F5C988()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_217F5C998()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_217F5C9A8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x270F90508]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t _AXSClarityBoardEnabled()
{
  return MEMORY[0x270F90660]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

uint64_t reboot3()
{
  return MEMORY[0x270EDB180]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}