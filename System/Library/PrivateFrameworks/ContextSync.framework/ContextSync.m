void sub_2201A4094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncLOIIdentifier()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getBMContextSyncLOIIdentifierSymbolLoc_ptr;
  uint64_t v7 = getBMContextSyncLOIIdentifierSymbolLoc_ptr;
  if (!getBMContextSyncLOIIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)BiomeLibraryLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BMContextSyncLOIIdentifier");
    getBMContextSyncLOIIdentifierSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getBMContextSyncLOIIdentifier_cold_1();
  }
  v2 = *v0;
  return v2;
}

void sub_2201A41A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncDeviceActivityLevelIdentifier()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getBMContextSyncDeviceActivityLevelIdentifierSymbolLoc_ptr;
  uint64_t v7 = getBMContextSyncDeviceActivityLevelIdentifierSymbolLoc_ptr;
  if (!getBMContextSyncDeviceActivityLevelIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)BiomeLibraryLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BMContextSyncDeviceActivityLevelIdentifier");
    getBMContextSyncDeviceActivityLevelIdentifierSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getBMContextSyncDeviceActivityLevelIdentifier_cold_1();
  }
  v2 = *v0;
  return v2;
}

void sub_2201A42AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncCellularAvailabilityStatusIdentifier()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getBMContextSyncCellularAvailabilityStatusIdentifierSymbolLoc_ptr;
  uint64_t v7 = getBMContextSyncCellularAvailabilityStatusIdentifierSymbolLoc_ptr;
  if (!getBMContextSyncCellularAvailabilityStatusIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)BiomeLibraryLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BMContextSyncCellularAvailabilityStatusIdentifier");
    getBMContextSyncCellularAvailabilityStatusIdentifierSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getBMContextSyncCellularAvailabilityStatusIdentifier_cold_1();
  }
  v2 = *v0;
  return v2;
}

void sub_2201A43B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncWalletTransactionIdentifier()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getBMContextSyncWalletTransactionIdentifierSymbolLoc_ptr;
  uint64_t v7 = getBMContextSyncWalletTransactionIdentifierSymbolLoc_ptr;
  if (!getBMContextSyncWalletTransactionIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)BiomeLibraryLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BMContextSyncWalletTransactionIdentifier");
    getBMContextSyncWalletTransactionIdentifierSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getBMContextSyncWalletTransactionIdentifier_cold_1();
  }
  v2 = *v0;
  return v2;
}

void sub_2201A44BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMAppInFocusClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBMAppInFocusClass_softClass;
  uint64_t v7 = getBMAppInFocusClass_softClass;
  if (!getBMAppInFocusClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMAppInFocusClass_block_invoke;
    v3[3] = &unk_26455C250;
    v3[4] = &v4;
    __getBMAppInFocusClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2201A45A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncAppInFocusIdentifier()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getBMContextSyncAppInFocusIdentifierSymbolLoc_ptr;
  uint64_t v7 = getBMContextSyncAppInFocusIdentifierSymbolLoc_ptr;
  if (!getBMContextSyncAppInFocusIdentifierSymbolLoc_ptr)
  {
    id v1 = (void *)BiomeLibraryLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BMContextSyncAppInFocusIdentifier");
    getBMContextSyncAppInFocusIdentifierSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getBMContextSyncAppInFocusIdentifier_cold_1();
  }
  v2 = *v0;
  return v2;
}

void sub_2201A46A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncLOIClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBMContextSyncLOIClass_softClass;
  uint64_t v7 = getBMContextSyncLOIClass_softClass;
  if (!getBMContextSyncLOIClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMContextSyncLOIClass_block_invoke;
    v3[3] = &unk_26455C250;
    v3[4] = &v4;
    __getBMContextSyncLOIClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2201A484C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_softClass;
  uint64_t v7 = getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_softClass;
  if (!getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_block_invoke;
    v3[3] = &unk_26455C250;
    v3[4] = &v4;
    __getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2201A4ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncDeviceActivityLevelClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBMContextSyncDeviceActivityLevelClass_softClass;
  uint64_t v7 = getBMContextSyncDeviceActivityLevelClass_softClass;
  if (!getBMContextSyncDeviceActivityLevelClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMContextSyncDeviceActivityLevelClass_block_invoke;
    v3[3] = &unk_26455C250;
    v3[4] = &v4;
    __getBMContextSyncDeviceActivityLevelClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2201A4BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncCellularAvailabilityStatusClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBMContextSyncCellularAvailabilityStatusClass_softClass;
  uint64_t v7 = getBMContextSyncCellularAvailabilityStatusClass_softClass;
  if (!getBMContextSyncCellularAvailabilityStatusClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMContextSyncCellularAvailabilityStatusClass_block_invoke;
    v3[3] = &unk_26455C250;
    v3[4] = &v4;
    __getBMContextSyncCellularAvailabilityStatusClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2201A4DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncWalletTransactionClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBMContextSyncWalletTransactionClass_softClass;
  uint64_t v7 = getBMContextSyncWalletTransactionClass_softClass;
  if (!getBMContextSyncWalletTransactionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMContextSyncWalletTransactionClass_block_invoke;
    v3[3] = &unk_26455C250;
    v3[4] = &v4;
    __getBMContextSyncWalletTransactionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2201A4FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMContextSyncAppInFocusClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBMContextSyncAppInFocusClass_softClass;
  uint64_t v7 = getBMContextSyncAppInFocusClass_softClass;
  if (!getBMContextSyncAppInFocusClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMContextSyncAppInFocusClass_block_invoke;
    v3[3] = &unk_26455C250;
    v3[4] = &v4;
    __getBMContextSyncAppInFocusClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2201A52B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2201A5500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBMContextSyncLOIIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  result = dlsym(v2, "BMContextSyncLOIIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMContextSyncLOIIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BiomeLibraryLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!BiomeLibraryLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __BiomeLibraryLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26455C270;
    uint64_t v4 = 0;
    BiomeLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BiomeLibraryLibraryCore_frameworkLibrary;
  if (!BiomeLibraryLibraryCore_frameworkLibrary) {
    BiomeLibraryLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __BiomeLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeLibraryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBMActivityLevelClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMActivityLevel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMActivityLevelClass_block_invoke_cold_1();
  }
  getBMActivityLevelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBMContextSyncDeviceActivityLevelIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  Class result = dlsym(v2, "BMContextSyncDeviceActivityLevelIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMContextSyncDeviceActivityLevelIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDeviceCellularAvailabilityStatusClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMDeviceCellularAvailabilityStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDeviceCellularAvailabilityStatusClass_block_invoke_cold_1();
  }
  getBMDeviceCellularAvailabilityStatusClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBMContextSyncCellularAvailabilityStatusIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  Class result = dlsym(v2, "BMContextSyncCellularAvailabilityStatusIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMContextSyncCellularAvailabilityStatusIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

Class __getBMWalletTransactionClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMWalletTransaction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMWalletTransactionClass_block_invoke_cold_1();
  }
  getBMWalletTransactionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBMContextSyncWalletTransactionIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  Class result = dlsym(v2, "BMContextSyncWalletTransactionIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMContextSyncWalletTransactionIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMAppInFocusClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMAppInFocus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMAppInFocusClass_block_invoke_cold_1();
  }
  getBMAppInFocusClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBMContextSyncAppInFocusIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  Class result = dlsym(v2, "BMContextSyncAppInFocusIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMContextSyncAppInFocusIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMContextSyncLOIClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMContextSyncLOI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMContextSyncLOIClass_block_invoke_cold_1();
  }
  getBMContextSyncLOIClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMContextSyncDeviceActivityLevelDeviceActivityState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_block_invoke_cold_1();
  }
  getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

Class __getBMContextSyncDeviceActivityLevelClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMContextSyncDeviceActivityLevel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMContextSyncDeviceActivityLevelClass_block_invoke_cold_1();
  }
  getBMContextSyncDeviceActivityLevelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMContextSyncCellularAvailabilityStatusClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMContextSyncCellularAvailabilityStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMContextSyncCellularAvailabilityStatusClass_block_invoke_cold_1();
  }
  getBMContextSyncCellularAvailabilityStatusClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMContextSyncWalletTransactionClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMContextSyncWalletTransaction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMContextSyncWalletTransactionClass_block_invoke_cold_1();
  }
  getBMContextSyncWalletTransactionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMContextSyncAppInFocusClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  Class result = objc_getClass("BMContextSyncAppInFocus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMContextSyncAppInFocusClass_block_invoke_cold_1();
  }
  getBMContextSyncAppInFocusClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBiomeLibrarySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  Class result = dlsym(v2, "BiomeLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBiomeLibrarySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2201A63B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
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

void sub_2201A67F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2201A6B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2201A7008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2201A7438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2201A785C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2201A7C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2201A7FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2201AB838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2201ABAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2201ABDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2201AC060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t GetMessageIntentFromDistributedContextClientIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.duetactivityscheduler.remotedeviceactivitymonitor"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"com.apple.nanocompass.bloom"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"com.apple.powerui"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"com.apple.healthlited.PhoneAppFocusListener"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void getBMContextSyncLOIIdentifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getBMContextSyncLOIIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 21, @"%s", dlerror());

  __break(1u);
}

void getBMContextSyncDeviceActivityLevelIdentifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getBMContextSyncDeviceActivityLevelIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 31, @"%s", dlerror());

  __break(1u);
}

void getBMContextSyncCellularAvailabilityStatusIdentifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getBMContextSyncCellularAvailabilityStatusIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 26, @"%s", dlerror());

  __break(1u);
}

void getBMContextSyncWalletTransactionIdentifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getBMContextSyncWalletTransactionIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 37, @"%s", dlerror());

  __break(1u);
}

void getBMContextSyncAppInFocusIdentifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getBMContextSyncAppInFocusIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 42, @"%s", dlerror());

  __break(1u);
}

void BiomeLibraryLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *BiomeLibraryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMDistributedContextEventTranslation.m", 17, @"%s", *a1);

  __break(1u);
}

void __getBMActivityLevelClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMActivityLevelClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 30, @"Unable to find class %s", "BMActivityLevel");

  __break(1u);
}

void __getBMDeviceCellularAvailabilityStatusClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMDeviceCellularAvailabilityStatusClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 25, @"Unable to find class %s", "BMDeviceCellularAvailabilityStatus");

  __break(1u);
}

void __getBMWalletTransactionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMWalletTransactionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 36, @"Unable to find class %s", "BMWalletTransaction");

  __break(1u);
}

void __getBMAppInFocusClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMAppInFocusClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 41, @"Unable to find class %s", "BMAppInFocus");

  __break(1u);
}

void __getBMContextSyncLOIClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMContextSyncLOIClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 22, @"Unable to find class %s", "BMContextSyncLOI");

  __break(1u);
}

void __getBMContextSyncDeviceActivityLevelDeviceActivityStateClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMContextSyncDeviceActivityLevelDeviceActivityStateClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 33, @"Unable to find class %s", "BMContextSyncDeviceActivityLevelDeviceActivityState");

  __break(1u);
}

void __getBMContextSyncDeviceActivityLevelClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMContextSyncDeviceActivityLevelClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 32, @"Unable to find class %s", "BMContextSyncDeviceActivityLevel");

  __break(1u);
}

void __getBMContextSyncCellularAvailabilityStatusClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMContextSyncCellularAvailabilityStatusClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 27, @"Unable to find class %s", "BMContextSyncCellularAvailabilityStatus");

  __break(1u);
}

void __getBMContextSyncWalletTransactionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMContextSyncWalletTransactionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 38, @"Unable to find class %s", "BMContextSyncWalletTransaction");

  __break(1u);
}

void __getBMContextSyncAppInFocusClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMContextSyncAppInFocusClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 43, @"Unable to find class %s", "BMContextSyncAppInFocus");

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x270F3C9A8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x270F10A10]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}