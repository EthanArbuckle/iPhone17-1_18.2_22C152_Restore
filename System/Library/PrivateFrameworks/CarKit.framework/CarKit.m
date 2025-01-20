void sub_1ABB032A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __CarGeneralLogging_block_invoke()
{
  CarGeneralLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "General");
  return MEMORY[0x1F41817F8]();
}

id CarGeneralLogging()
{
  if (CarGeneralLogging_onceToken != -1) {
    dispatch_once(&CarGeneralLogging_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)CarGeneralLogging_facility;
  return v0;
}

void sub_1ABB03CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1ABB03DE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB04E54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB05044(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CRServiceCreateConnection()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0327240];
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_fetchInstrumentClusterURLsWithReply_ argumentIndex:0 ofReply:1];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.service" options:4096];
  [v4 setRemoteObjectInterface:v0];
  [v4 resume];

  return v4;
}

void CRServiceConnectionPerform(void *a1, void *a2)
{
  v3 = a1;
  id v4 = a2;
  v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", buf, 2u);
  }

  v6 = CRServiceCreateConnection();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __CRServiceConnectionPerform_block_invoke;
  v11[3] = &unk_1E5E3A910;
  id v7 = v4;
  id v12 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v11];
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __CRServiceConnectionPerform_block_invoke_2;
    v9[3] = &unk_1E5E3A938;
    id v10 = v6;
    v3[2](v3, v8, v9);
  }
}

uint64_t __CRServiceConnectionPerform_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __CRServiceConnectionPerform_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void CRServiceConnectionSynchronousPerform(void *a1, void *a2)
{
  v3 = a1;
  id v4 = a2;
  v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", buf, 2u);
  }

  v6 = CRServiceCreateConnection();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRServiceConnectionSynchronousPerform_block_invoke;
  v9[3] = &unk_1E5E3A910;
  id v10 = v4;
  id v7 = v4;
  v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v9];
  if (v3) {
    v3[2](v3, v8);
  }
  [v6 invalidate];
}

uint64_t __CRServiceConnectionSynchronousPerform_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1ABB05B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB05DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB060D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB064C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB06798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB06B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t __CARDatePreferenceDescription_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)CARDatePreferenceDescription__formatter;
  CARDatePreferenceDescription__formatter = (uint64_t)v0;

  [(id)CARDatePreferenceDescription__formatter setDateStyle:1];
  uint64_t v2 = (void *)CARDatePreferenceDescription__formatter;
  return [v2 setTimeStyle:0];
}

__CFString *CARVerifyString(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (__CFString *)v1;
  }
  else
  {
    v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      CARVerifyString_cold_1();
    }

    uint64_t v2 = &stru_1F03060C0;
  }

  return v2;
}

id CARVerifyStringArray(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    id v6 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_3];
  v3 = [v1 filteredArrayUsingPredicate:v2];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      CARVerifyStringArray_cold_1();
    }

    goto LABEL_6;
  }
  id v6 = v1;
LABEL_7:

  return v6;
}

id CARVerifyClass(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      CARVerifyClass_cold_1();
    }

    id v2 = 0;
  }

  return v2;
}

uint64_t CARVerifyBool(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
LABEL_7:
    uint64_t v2 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      CARVerifyBool_cold_1();
    }

    goto LABEL_7;
  }
  uint64_t v2 = [v1 BOOLValue];
LABEL_8:

  return v2;
}

BOOL __CARVerifyStringArray_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void sub_1ABB08F9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void DBZipArchiverCopyFileFinishedHandler(uint64_t a1, const char *a2)
{
  BOMCopierUserData();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [v3 stringWithFileSystemRepresentation:a2 length:strlen(a2)];

  [v5 addObject:v4];
}

id CarAppearanceLogging()
{
  if (CarAppearanceLogging_onceToken != -1) {
    dispatch_once(&CarAppearanceLogging_onceToken, &__block_literal_global_22);
  }
  id v0 = (void *)CarAppearanceLogging_facility;
  return v0;
}

uint64_t __CarAppearanceLogging_block_invoke()
{
  CarAppearanceLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "Appearance");
  return MEMORY[0x1F41817F8]();
}

id CarCertificationOverrideLogging()
{
  if (CarCertificationOverrideLogging_onceToken != -1) {
    dispatch_once(&CarCertificationOverrideLogging_onceToken, &__block_literal_global_25);
  }
  id v0 = (void *)CarCertificationOverrideLogging_facility;
  return v0;
}

uint64_t __CarCertificationOverrideLogging_block_invoke()
{
  CarCertificationOverrideLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "CertificationOverrides");
  return MEMORY[0x1F41817F8]();
}

id CarConnectionTimeLogging()
{
  if (CarConnectionTimeLogging_onceToken != -1) {
    dispatch_once(&CarConnectionTimeLogging_onceToken, &__block_literal_global_28);
  }
  id v0 = (void *)CarConnectionTimeLogging_facility;
  return v0;
}

uint64_t __CarConnectionTimeLogging_block_invoke()
{
  CarConnectionTimeLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "ConnectionTime");
  return MEMORY[0x1F41817F8]();
}

id CarDiagnosticsLogging()
{
  if (CarDiagnosticsLogging_onceToken != -1) {
    dispatch_once(&CarDiagnosticsLogging_onceToken, &__block_literal_global_31);
  }
  id v0 = (void *)CarDiagnosticsLogging_facility;
  return v0;
}

uint64_t __CarDiagnosticsLogging_block_invoke()
{
  CarDiagnosticsLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "Diagnostics");
  return MEMORY[0x1F41817F8]();
}

id CarDNDWDLogging()
{
  if (CarDNDWDLogging_onceToken != -1) {
    dispatch_once(&CarDNDWDLogging_onceToken, &__block_literal_global_34);
  }
  id v0 = (void *)CarDNDWDLogging_facility;
  return v0;
}

uint64_t __CarDNDWDLogging_block_invoke()
{
  CarDNDWDLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "DNDWD");
  return MEMORY[0x1F41817F8]();
}

id CarSilentModeLogging()
{
  if (CarSilentModeLogging_onceToken != -1) {
    dispatch_once(&CarSilentModeLogging_onceToken, &__block_literal_global_37);
  }
  id v0 = (void *)CarSilentModeLogging_facility;
  return v0;
}

uint64_t __CarSilentModeLogging_block_invoke()
{
  CarSilentModeLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "SilentMode");
  return MEMORY[0x1F41817F8]();
}

id CarPairingLogging()
{
  if (CarPairingLogging_onceToken != -1) {
    dispatch_once(&CarPairingLogging_onceToken, &__block_literal_global_40);
  }
  id v0 = (void *)CarPairingLogging_facility;
  return v0;
}

uint64_t __CarPairingLogging_block_invoke()
{
  CarPairingLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "Pairing");
  return MEMORY[0x1F41817F8]();
}

id CarThemeAssetsLogging()
{
  if (CarThemeAssetsLogging_onceToken != -1) {
    dispatch_once(&CarThemeAssetsLogging_onceToken, &__block_literal_global_43_0);
  }
  id v0 = (void *)CarThemeAssetsLogging_facility;
  return v0;
}

uint64_t __CarThemeAssetsLogging_block_invoke()
{
  CarThemeAssetsLogging_facility = (uint64_t)os_log_create("com.apple.carkit", "ThemeAssets");
  return MEMORY[0x1F41817F8]();
}

void sub_1ABB0D638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1ABB0DBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB0DD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB0DED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB0E078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1ABB10FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB111EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB143DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB145F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CRPostBannerToPhone(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F29280];
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v6 interfaceWithProtocol:&unk_1F0327240];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.service" options:4096];
  [v10 setRemoteObjectInterface:v9];
  [v10 resume];
  v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __CRPostBannerToPhone_block_invoke_126;
  v14[3] = &unk_1E5E3B0F0;
  id v15 = v10;
  id v16 = v5;
  id v12 = v10;
  id v13 = v5;
  [v11 postBannerToPhone:v8 notificationMessage:v7 reply:v14];
}

void __CRPostBannerToPhone_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __CRPostBannerToPhone_block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

uint64_t __CRPostBannerToPhone_block_invoke_126(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

void CRCollectCarPlayDiagnostics(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F29280];
  id v26 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  v14 = [v10 interfaceWithProtocol:&unk_1F0327240];
  id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v14 setClasses:v15 forSelector:sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_ argumentIndex:0 ofReply:0];

  id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v14 setClasses:v16 forSelector:sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_ argumentIndex:1 ofReply:0];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  [v14 setClasses:v19 forSelector:sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_ argumentIndex:2 ofReply:0];

  v20 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v14 setClasses:v20 forSelector:sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_ argumentIndex:3 ofReply:0];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.service" options:4096];
  [v21 setRemoteObjectInterface:v14];
  [v21 resume];
  v22 = [v21 remoteObjectProxyWithErrorHandler:&__block_literal_global_133];
  v23 = CarGeneralLogging();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v23, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit diagnostics service.", buf, 2u);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __CRCollectCarPlayDiagnostics_block_invoke_134;
  v27[3] = &unk_1E5E3B0F0;
  id v28 = v21;
  id v29 = v9;
  id v24 = v21;
  id v25 = v9;
  [v22 handleCarPlayDiagnosticsWithDeviceScreenshotURL:v13 carScreenshotURL:v12 attachmentURLs:v11 activeBundleIdentifier:v26 reply:v27];
}

void __CRCollectCarPlayDiagnostics_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __CRCollectCarPlayDiagnostics_block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

uint64_t __CRCollectCarPlayDiagnostics_block_invoke_134(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

void CRCollectCarPlayDiagnosticsWithAttachments(void *a1, void *a2, void *a3, void *a4)
{
}

id CRSaveStringToTemporaryTextFile(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a1;
  id v6 = [v4 defaultManager];
  id v7 = [v6 temporaryDirectory];
  id v8 = [NSString stringWithFormat:@"%@.XXXXXX", v5];

  id v9 = [v7 URLByAppendingPathComponent:v8];

  id v10 = v9;
  id v11 = mktemp((char *)[v10 fileSystemRepresentation]);
  id v12 = NSString;
  id v13 = [NSString stringWithUTF8String:v11];
  v14 = [v12 stringWithFormat:@"%@.txt", v13];

  id v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0 relativeToURL:0];
  if (v3)
  {
    if ([v3 writeToURL:v15 atomically:1 encoding:4 error:0]) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  id v17 = v16;

  return v17;
}

id CRStringForDate(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F28C10];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [v3 setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
  uint64_t v4 = [v3 stringFromDate:v2];

  return v4;
}

id CRBuildNumberForDevice()
{
  if (CRBuildNumberForDevice_onceToken != -1) {
    dispatch_once(&CRBuildNumberForDevice_onceToken, &__block_literal_global_147);
  }
  id v0 = (void *)CRBuildNumberForDevice_buildVersion;
  return v0;
}

uint64_t __CRBuildNumberForDevice_block_invoke()
{
  CRBuildNumberForDevice_buildVersion = MGGetStringAnswer();
  return MEMORY[0x1F41817F8]();
}

id CRDeviceHardwareIdentifierForDevice()
{
  if (CRDeviceHardwareIdentifierForDevice_onceToken != -1) {
    dispatch_once(&CRDeviceHardwareIdentifierForDevice_onceToken, &__block_literal_global_152);
  }
  id v0 = (void *)CRDeviceHardwareIdentifierForDevice_hardwareIdentifier;
  return v0;
}

uint64_t __CRDeviceHardwareIdentifierForDevice_block_invoke()
{
  CRDeviceHardwareIdentifierForDevice_hardwareIdentifier = MGGetStringAnswer();
  return MEMORY[0x1F41817F8]();
}

id CRFormattedBuildAndDeviceIdentifier()
{
  uint64_t v0 = CRBuildNumberForDevice();
  uint64_t v1 = CRDeviceHardwareIdentifierForDevice();
  id v2 = (void *)v1;
  if (v1 && v0)
  {
    id v3 = [NSString stringWithFormat:@"%@/%@", v1, v0];
  }
  else
  {
    if (!(v1 | v0))
    {
      uint64_t v4 = 0;
      goto LABEL_10;
    }
    if (v1) {
      id v3 = (id)v1;
    }
    else {
      id v3 = (id)v0;
    }
  }
  uint64_t v4 = v3;
LABEL_10:

  return v4;
}

id CRURLEncodedString(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [v3 objectForKey:v8];
        id v10 = NSString;
        id v11 = urlEncode(v8);
        id v12 = urlEncode(v9);
        id v13 = [v10 stringWithFormat:@"%@=%@", v11, v12, (void)v16];

        [v2 addObject:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  v14 = [v2 componentsJoinedByString:@"&"];

  return v14;
}

id urlEncode(void *a1)
{
  id v1 = [a1 description];
  id v2 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
  id v3 = [v1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

void CRLostModeStateChanged(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1AD113EA0]();
  [a2 _updateCarPlayAllowed];
}

uint64_t CRFrameworkBundle()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = objc_opt_class();
  return [v0 bundleForClass:v1];
}

id CRLocalizedStringForKey(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  id v3 = [v1 bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_1F03060C0 table:@"Localizable"];

  return v4;
}

__CFString *CRNullableDescriptionForString(void *a1)
{
  uint64_t v1 = a1;
  if ([(__CFString *)v1 length]) {
    id v2 = v1;
  }
  else {
    id v2 = @"(None)";
  }
  id v3 = v2;

  return v3;
}

id CRLocalizedWiFiVariantKeyForKey(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (MGGetBoolAnswer())
  {
    id v2 = [v1 stringByReplacingOccurrencesOfString:@"WIFI" withString:@"WLAN"];
  }
  return v2;
}

uint64_t CRSettingsDebugUIEnabled()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue((CFStringRef)CRPreferencesSettingsDebugUIKey, CRPreferencesNotMigratedDomain);
  if (!v0) {
    return 0;
  }
  id v1 = (void *)v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 == CFStringGetTypeID())
  {
    uint64_t v3 = [v1 BOOLValue];
  }
  else
  {
    CFTypeID v4 = CFGetTypeID(v1);
    uint64_t v3 = v4 == CFBooleanGetTypeID() && v1 == (void *)*MEMORY[0x1E4F1CFD0];
  }
  CFRelease(v1);
  return v3;
}

uint64_t CRDeviceSupportsAutomaticDNDMotionTrigger()
{
  if (CRDeviceSupportsAutomaticDNDMotionTrigger_onceToken != -1) {
    dispatch_once(&CRDeviceSupportsAutomaticDNDMotionTrigger_onceToken, &__block_literal_global_13);
  }
  return CRDeviceSupportsAutomaticDNDMotionTrigger_supportsMotionTrigger;
}

uint64_t __CRDeviceSupportsAutomaticDNDMotionTrigger_block_invoke()
{
  uint64_t result = MGIsDeviceOfType();
  if (result)
  {
    char v1 = 0;
  }
  else
  {
    uint64_t result = MGIsDeviceOfType();
    char v1 = result ^ 1;
  }
  CRDeviceSupportsAutomaticDNDMotionTrigger_supportsMotionTrigger = v1;
  return result;
}

id CRAutomaticDNDLocationBundle()
{
  if (CRAutomaticDNDLocationBundle_onceToken != -1) {
    dispatch_once(&CRAutomaticDNDLocationBundle_onceToken, &__block_literal_global_202);
  }
  CFPropertyListRef v0 = (void *)CRAutomaticDNDLocationBundle_bundle;
  return v0;
}

void __CRAutomaticDNDLocationBundle_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F28B50]);
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/LocationBundles/DoNotDisturb.bundle"];
  uint64_t v1 = [v0 initWithURL:v3];
  CFTypeID v2 = (void *)CRAutomaticDNDLocationBundle_bundle;
  CRAutomaticDNDLocationBundle_bundle = v1;
}

uint64_t CRAutomaticDNDLocationServicesStatus()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v0 = (void *)getCLLocationManagerClass_softClass;
  uint64_t v9 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCLLocationManagerClass_block_invoke;
    v5[3] = &unk_1E5E3B130;
    v5[4] = &v6;
    __getCLLocationManagerClass_block_invoke((uint64_t)v5);
    id v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  CFTypeID v2 = CRAutomaticDNDLocationBundle();
  uint64_t v3 = [v1 authorizationStatusForBundle:v2];

  return v3;
}

void sub_1ABB19E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CRAutomaticDNDLocationServicesEnabled()
{
  return CRAutomaticDNDLocationServicesStatus() != 2;
}

uint64_t CRIsInternalInstall()
{
  if (CRIsInternalInstall_onceToken != -1) {
    dispatch_once(&CRIsInternalInstall_onceToken, &__block_literal_global_208);
  }
  return CRIsInternalInstall_isInternal;
}

uint64_t __CRIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CRIsInternalInstall_isInternal = result;
  return result;
}

uint64_t CRDeviceSupportsDNDWhileDriving()
{
  if (CRDeviceSupportsDNDWhileDriving_onceToken != -1) {
    dispatch_once(&CRDeviceSupportsDNDWhileDriving_onceToken, &__block_literal_global_213);
  }
  return CRDeviceSupportsDNDWhileDriving_supportsDNDWhileDriving;
}

uint64_t __CRDeviceSupportsDNDWhileDriving_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CRDeviceSupportsDNDWhileDriving_supportsDNDWhileDriving = result;
  return result;
}

uint64_t CRHardwareSupportedFeatures()
{
  return 0;
}

uint64_t CRIsTestContext()
{
  if (CRIsTestContext_onceToken != -1) {
    dispatch_once(&CRIsTestContext_onceToken, &__block_literal_global_218);
  }
  return CRIsTestContext__isTestingContext;
}

Class __CRIsTestContext_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctestcase.isa);
  CRIsTestContext__isTestingContext = result != 0;
  return result;
}

BOOL CRSizeFromDictionary(const __CFDictionary *a1, CGSize *a2)
{
  unsigned long long v5 = 0uLL;
  BOOL result = CGSizeMakeWithDictionaryRepresentation(a1, (CGSize *)&v5);
  if (result) {
    CGSize v4 = (CGSize)v5;
  }
  else {
    CGSize v4 = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  *a2 = v4;
  return result;
}

uint64_t CRSizeFromAirPlayDictionary(void *a1, void *a2)
{
  id v3 = a1;
  CGSize v4 = v3;
  if (a2)
  {
    uint64_t v5 = [v3 objectForKey:@"widthPixels"];
    if (v5
      && (uint64_t v6 = (void *)v5,
          [v4 objectForKey:@"heightPixels"],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      uint64_t v8 = [v4 objectForKey:@"widthPixels"];
      [v8 doubleValue];
      uint64_t v10 = v9;

      id v11 = [v4 objectForKey:@"heightPixels"];
      [v11 doubleValue];
      uint64_t v13 = v12;

      *a2 = v10;
      a2[1] = v13;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
      *(_OWORD *)a2 = *MEMORY[0x1E4F1DB30];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t CRPhysicalSizeFromAirPlayDictionary(void *a1, void *a2)
{
  id v3 = a1;
  CGSize v4 = v3;
  if (a2)
  {
    uint64_t v5 = [v3 objectForKey:@"widthPhysical"];
    if (v5
      && (uint64_t v6 = (void *)v5,
          [v4 objectForKey:@"heightPhysical"],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      uint64_t v8 = [v4 objectForKey:@"widthPhysical"];
      [v8 doubleValue];
      uint64_t v10 = v9;

      id v11 = [v4 objectForKey:@"heightPhysical"];
      [v11 doubleValue];
      uint64_t v13 = v12;

      *a2 = v10;
      a2[1] = v13;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
      *(_OWORD *)a2 = *MEMORY[0x1E4F1DB30];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t CROriginFromAirPlayDictionary(void *a1, void *a2)
{
  id v3 = a1;
  CGSize v4 = v3;
  if (a2)
  {
    uint64_t v5 = [v3 objectForKey:@"originXPixels"];
    if (v5
      && (uint64_t v6 = (void *)v5,
          [v4 objectForKey:@"originYPixels"],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      uint64_t v8 = [v4 objectForKey:@"originXPixels"];
      [v8 doubleValue];
      uint64_t v10 = v9;

      id v11 = [v4 objectForKey:@"originYPixels"];
      [v11 doubleValue];
      uint64_t v13 = v12;

      *a2 = v10;
      a2[1] = v13;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
      *(_OWORD *)a2 = *MEMORY[0x1E4F1DAD8];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreLocationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5E3B150;
    uint64_t v6 = 0;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    CFTypeID v2 = (void *)v4[0];
    if (!CoreLocationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CLLocationManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    CFTypeID v2 = (void *)__getCLLocationManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCLLocationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreLocationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t _CARDNDEnabledCallback(uint64_t a1, void *a2)
{
  return [a2 _dndStateChanged:1];
}

uint64_t _CARDNDDisabledCallback(uint64_t a1, void *a2)
{
  return [a2 _dndStateChanged:0];
}

uint64_t _CARDNDExitConfirmationEnabledCallback(uint64_t a1, void *a2)
{
  return [a2 _exitConfirmationStateChanged:1];
}

uint64_t _CARDNDExitConfirmationDisabledCallback(uint64_t a1, void *a2)
{
  return [a2 _exitConfirmationStateChanged:0];
}

__CFString *CARStringFromVoiceTriggerMode(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5E3B4F0[a1 + 1];
  }
}

uint64_t NSStringFromEdgeInsets(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"Left: %.1f, right: %.1f, top: %.1f, bottom: %.1f", *(void *)&a2, *(void *)&a4, *(void *)&a1, *(void *)&a3];
}

id CARInteractionModelEntitlements()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.developer.carplay-maps";
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  return v0;
}

void sub_1ABB21D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_1ABB226A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void CRHandleConnectionForBluetoothAddress(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRHandleConnectionForBluetoothAddress_block_invoke;
  v9[3] = &unk_1E5E3B618;
  id v10 = v3;
  id v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRHandleConnectionForBluetoothAddress_block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v11;
  id v5 = v11;
  id v6 = v3;
  CRServiceConnectionPerform(v9, v7);
}

void __CRHandleConnectionForBluetoothAddress_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CRHandleConnectionForBluetoothAddress_block_invoke_2;
  v8[3] = &unk_1E5E3B5F0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 handleDidConnectBluetoothAddress:v6 reply:v8];
}

uint64_t __CRHandleConnectionForBluetoothAddress_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRHandleConnectionForBluetoothAddress_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void CRHandleDisconnectionForBluetoothAddress(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRHandleDisconnectionForBluetoothAddress_block_invoke;
  v9[3] = &unk_1E5E3B618;
  id v10 = v3;
  id v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRHandleDisconnectionForBluetoothAddress_block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v11;
  id v5 = v11;
  id v6 = v3;
  CRServiceConnectionPerform(v9, v7);
}

void __CRHandleDisconnectionForBluetoothAddress_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CRHandleDisconnectionForBluetoothAddress_block_invoke_2;
  v8[3] = &unk_1E5E3B640;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 handleDidDisconnectBluetoothAddress:v6 reply:v8];
}

uint64_t __CRHandleDisconnectionForBluetoothAddress_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRHandleDisconnectionForBluetoothAddress_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void CRBluetoothIndicatesInCar(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CRBluetoothIndicatesInCar_block_invoke;
  v5[3] = &unk_1E5E3B668;
  id v6 = v1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CRBluetoothIndicatesInCar_block_invoke_3;
  v3[3] = &unk_1E5E3A910;
  id v4 = v6;
  id v2 = v6;
  CRServiceConnectionPerform(v5, v3);
}

void __CRBluetoothIndicatesInCar_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRBluetoothIndicatesInCar_block_invoke_2;
  v7[3] = &unk_1E5E3B5F0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 isBluetoothInCarWithReply:v7];
}

uint64_t __CRBluetoothIndicatesInCar_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRBluetoothIndicatesInCar_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void CRConnectBluetoothLE(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a1;
  id v7 = a2;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __CRConnectBluetoothLE_block_invoke;
  v14[3] = &unk_1E5E3B690;
  id v15 = v6;
  id v16 = v7;
  id v17 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __CRConnectBluetoothLE_block_invoke_3;
  v12[3] = &unk_1E5E3A910;
  id v13 = v17;
  id v9 = v17;
  id v10 = v7;
  id v11 = v6;
  CRServiceConnectionPerform(v14, v12);
}

void __CRConnectBluetoothLE_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRConnectBluetoothLE_block_invoke_2;
  v9[3] = &unk_1E5E3B640;
  id v10 = *(id *)(a1 + 48);
  id v11 = v5;
  id v8 = v5;
  [a2 startBluetoothLEPairingForIdentifier:v6 deviceName:v7 reply:v9];
}

uint64_t __CRConnectBluetoothLE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __CRConnectBluetoothLE_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __CRConnectBluetoothLE_block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void CRHandleBluetoothClassicPairingCompleted(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __CRHandleBluetoothClassicPairingCompleted_block_invoke;
  v15[3] = &unk_1E5E3B6B8;
  id v16 = v7;
  id v17 = v8;
  char v19 = a3;
  id v18 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __CRHandleBluetoothClassicPairingCompleted_block_invoke_3;
  v13[3] = &unk_1E5E3A910;
  id v14 = v18;
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  CRServiceConnectionPerform(v15, v13);
}

void __CRHandleBluetoothClassicPairingCompleted_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __CRHandleBluetoothClassicPairingCompleted_block_invoke_2;
  v10[3] = &unk_1E5E3B640;
  id v11 = *(id *)(a1 + 48);
  id v12 = v5;
  id v9 = v5;
  [a2 handleBluetoothClassicPairingCompletedForDeviceAddress:v6 name:v7 preApproved:v8 reply:v10];
}

uint64_t __CRHandleBluetoothClassicPairingCompleted_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __CRHandleBluetoothClassicPairingCompleted_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __CRHandleBluetoothClassicPairingCompleted_block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void CRStartBluetoothClassicPairing(void *a1, char a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __CRStartBluetoothClassicPairing_block_invoke;
  v11[3] = &unk_1E5E3B6E0;
  id v12 = v5;
  char v14 = a2;
  id v13 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRStartBluetoothClassicPairing_block_invoke_3;
  v9[3] = &unk_1E5E3A910;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  CRServiceConnectionPerform(v11, v9);
}

void __CRStartBluetoothClassicPairing_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRStartBluetoothClassicPairing_block_invoke_2;
  v9[3] = &unk_1E5E3B640;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  [a2 startBluetoothClassicPairingForDeviceAddress:v7 deviceName:0 numericCode:0 showBluetoothOnlyOption:v6 reply:v9];
}

uint64_t __CRStartBluetoothClassicPairing_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __CRStartBluetoothClassicPairing_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __CRStartBluetoothClassicPairing_block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void CRConfirmAndContinueBluetoothClassicPairing(void *a1, void *a2, void *a3, char a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __CRConfirmAndContinueBluetoothClassicPairing_block_invoke;
  v19[3] = &unk_1E5E3B708;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  char v24 = a4;
  id v23 = v12;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3;
  v17[3] = &unk_1E5E3A910;
  id v18 = v23;
  id v13 = v23;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  CRServiceConnectionPerform(v19, v17);
}

void __CRConfirmAndContinueBluetoothClassicPairing_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_2;
  v11[3] = &unk_1E5E3B640;
  uint64_t v9 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = v5;
  id v10 = v5;
  [a2 startBluetoothClassicPairingForDeviceAddress:v6 deviceName:v7 numericCode:v9 showBluetoothOnlyOption:v8 reply:v11];
}

uint64_t __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void CRHandleCarPlayConnectionRequest(int a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CRHandleCarPlayConnectionRequest_block_invoke;
  v5[3] = &unk_1E5E3B730;
  int v7 = a1;
  id v6 = v3;
  id v4 = v3;
  CRServiceConnectionPerform(v5, &__block_literal_global_64);
}

uint64_t __CRHandleCarPlayConnectionRequest_block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleCarPlayConnectionRequestForConnectionID:*(unsigned int *)(a1 + 40) startSessionProperties:*(void *)(a1 + 32) reply:&__block_literal_global_17];
}

void __CRHandleCarPlayConnectionRequest_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = CarGeneralLogging();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_DEFAULT, "carkitd successfully handled the start session request", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __CRHandleCarPlayConnectionRequest_block_invoke_2_cold_1();
  }
}

void __CRHandleCarPlayConnectionRequest_block_invoke_62(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __CRHandleCarPlayConnectionRequest_block_invoke_62_cold_1();
  }
}

void CRSaveWiFiCredentialsForAccessoryConnectionIdentifier(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke;
  v11[3] = &unk_1E5E3B758;
  id v12 = v5;
  uint64_t v14 = a1;
  id v13 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_3;
  v9[3] = &unk_1E5E3A910;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  CRServiceConnectionPerform(v11, v9);
}

void __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_2;
  v9[3] = &unk_1E5E3B640;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  [a2 saveWiFiCredentials:v7 forAccessoryConnectionIdentifier:v6 reply:v9];
}

uint64_t __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(v4 + 16))(v4, a2, 0, a3);
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

uint64_t __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void CRAllowsConnectionsForWiFiUUID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRAllowsConnectionsForWiFiUUID_block_invoke;
  v9[3] = &unk_1E5E3B618;
  id v10 = v3;
  id v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRAllowsConnectionsForWiFiUUID_block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v11;
  id v5 = v11;
  id v6 = v3;
  CRServiceConnectionPerform(v9, v7);
}

void __CRAllowsConnectionsForWiFiUUID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CRAllowsConnectionsForWiFiUUID_block_invoke_2;
  v8[3] = &unk_1E5E3B640;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 allowsConnectionsForWiFiUUID:v6 reply:v8];
}

uint64_t __CRAllowsConnectionsForWiFiUUID_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRAllowsConnectionsForWiFiUUID_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void CRAllowsConnectionsForCertificateSerialNumber(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRAllowsConnectionsForCertificateSerialNumber_block_invoke;
  v9[3] = &unk_1E5E3B618;
  id v10 = v3;
  id v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRAllowsConnectionsForCertificateSerialNumber_block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v11;
  id v5 = v11;
  id v6 = v3;
  CRServiceConnectionPerform(v9, v7);
}

void __CRAllowsConnectionsForCertificateSerialNumber_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CRAllowsConnectionsForCertificateSerialNumber_block_invoke_2;
  v8[3] = &unk_1E5E3B640;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 allowsConnectionsForCertificateSerial:v6 reply:v8];
}

uint64_t __CRAllowsConnectionsForCertificateSerialNumber_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRAllowsConnectionsForCertificateSerialNumber_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void CRIsPairedWithCertificateSerialNumber(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRIsPairedWithCertificateSerialNumber_block_invoke;
  v9[3] = &unk_1E5E3B618;
  id v10 = v3;
  id v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRIsPairedWithCertificateSerialNumber_block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v11;
  id v5 = v11;
  id v6 = v3;
  CRServiceConnectionPerform(v9, v7);
}

void __CRIsPairedWithCertificateSerialNumber_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CRIsPairedWithCertificateSerialNumber_block_invoke_2;
  v8[3] = &unk_1E5E3B640;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 isPairedWithCertificateSerial:v6 reply:v8];
}

uint64_t __CRIsPairedWithCertificateSerialNumber_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRIsPairedWithCertificateSerialNumber_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke;
  v9[3] = &unk_1E5E3B618;
  id v10 = v3;
  id v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v11;
  id v5 = v11;
  id v6 = v3;
  CRServiceConnectionPerform(v9, v7);
}

void __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke_2;
  v8[3] = &unk_1E5E3B780;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 isEnhancedIntegrationEnabledWithCertificateSerial:v6 reply:v8];
}

uint64_t __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void CRHandleCarPlayRestrictionChanged()
{
}

void __CRHandleCarPlayRestrictionChanged_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __CRHandleCarPlayRestrictionChanged_block_invoke_2;
  v6[3] = &unk_1E5E3B1C0;
  id v7 = v4;
  id v5 = v4;
  [a2 handleCarPlayRestrictionChangedWithReply:v6];
}

uint64_t __CRHandleCarPlayRestrictionChanged_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void CRIsCarPlayAllowed(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CRIsCarPlayAllowed_block_invoke;
  v5[3] = &unk_1E5E3B668;
  id v6 = v1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CRIsCarPlayAllowed_block_invoke_3;
  v3[3] = &unk_1E5E3A910;
  id v4 = v6;
  id v2 = v6;
  CRServiceConnectionPerform(v5, v3);
}

void __CRIsCarPlayAllowed_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRIsCarPlayAllowed_block_invoke_2;
  v7[3] = &unk_1E5E3B640;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 isCarPlayAllowedWithReply:v7];
}

uint64_t __CRIsCarPlayAllowed_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRIsCarPlayAllowed_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void CRVehicleIdentifierForCertificateSerial(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CRVehicleIdentifierForCertificateSerial_block_invoke;
  v9[3] = &unk_1E5E3B618;
  id v10 = v3;
  id v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CRVehicleIdentifierForCertificateSerial_block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v11;
  id v5 = v11;
  id v6 = v3;
  CRServiceConnectionPerform(v9, v7);
}

void __CRVehicleIdentifierForCertificateSerial_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CRVehicleIdentifierForCertificateSerial_block_invoke_2;
  v8[3] = &unk_1E5E3B7C8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 vehicleIdentifierForCertificateSerial:v6 reply:v8];
}

uint64_t __CRVehicleIdentifierForCertificateSerial_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __CRVehicleIdentifierForCertificateSerial_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void CRFetchInstrumentClusterURLs(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(CARInstrumentClusterURLController);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CRFetchInstrumentClusterURLs_block_invoke;
  v5[3] = &unk_1E5E3B7F0;
  uint64_t v6 = v2;
  id v7 = v1;
  id v3 = v2;
  id v4 = v1;
  [(CARInstrumentClusterURLController *)v3 fetchInstrumentClusterURLs:v5];
}

uint64_t __CRFetchInstrumentClusterURLs_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

void CRFetchScaledDisplays(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CRFetchScaledDisplays_block_invoke;
  v5[3] = &unk_1E5E3AB10;
  id v6 = v3;
  id v4 = v3;
  +[CRScreenScaleHeuristics scaledDisplays:a1 reply:v5];
}

uint64_t __CRFetchScaledDisplays_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void CRFetchCarPlayCapabilities(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CRFetchCarPlayCapabilities_block_invoke;
  v3[3] = &unk_1E5E3B818;
  id v4 = v1;
  id v2 = v1;
  +[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:v3];
}

uint64_t __CRFetchCarPlayCapabilities_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id CARSignpostLogForCategory(unint64_t a1)
{
  if (a1 >= 4) {
    CARSignpostLogForCategory_cold_1();
  }
  if (CARSignpostLogForCategory_onceToken != -1) {
    dispatch_once(&CARSignpostLogForCategory_onceToken, &__block_literal_global_18);
  }
  id v2 = (void *)CARSignpostLogForCategory_logObjects[a1];
  return v2;
}

uint64_t __CARSignpostLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.carkit", "CarKit");
  id v1 = (void *)CARSignpostLogForCategory_logObjects[0];
  CARSignpostLogForCategory_logObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.caraccessoryframework", "CAFData");
  id v3 = (void *)qword_1E98D3440;
  qword_1E98D3440 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.caraccessoryframework", "CAFCore");
  id v5 = (void *)qword_1E98D3448;
  qword_1E98D3448 = (uint64_t)v4;

  qword_1E98D3450 = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFAppLaunch");
  return MEMORY[0x1F41817F8]();
}

void CRCarPlayAppServicePolicyChangedHandler()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"com.apple.carkit.app.policy-changed" object:0 userInfo:0];
}

void sub_1ABB2A134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB2AAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSApplicationRecordClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5E3B920;
    uint64_t v6 = 0;
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    os_log_t v2 = (void *)v4[0];
    if (!CoreServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LSApplicationRecord");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    os_log_t v2 = (void *)__getLSApplicationRecordClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
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

void *__getkAssistantDirectActionEventKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AssistantServicesLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5E3B938;
    uint64_t v7 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    os_log_t v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
    if (AssistantServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  os_log_t v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "kAssistantDirectActionEventKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAssistantDirectActionEventKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

id CRCarPlayNavigationOwnersServiceInterface()
{
  if (CRCarPlayNavigationOwnersServiceInterface_onceToken != -1) {
    dispatch_once(&CRCarPlayNavigationOwnersServiceInterface_onceToken, &__block_literal_global_20);
  }
  id v0 = (void *)CRCarPlayNavigationOwnersServiceInterface_interface;
  return v0;
}

uint64_t __CRCarPlayNavigationOwnersServiceInterface_block_invoke()
{
  CRCarPlayNavigationOwnersServiceInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F03274E0];
  return MEMORY[0x1F41817F8]();
}

id CRCarPlayNavigationOwnerClientInterface()
{
  if (CRCarPlayNavigationOwnerClientInterface_onceToken != -1) {
    dispatch_once(&CRCarPlayNavigationOwnerClientInterface_onceToken, &__block_literal_global_74);
  }
  id v0 = (void *)CRCarPlayNavigationOwnerClientInterface_interface;
  return v0;
}

uint64_t __CRCarPlayNavigationOwnerClientInterface_block_invoke()
{
  CRCarPlayNavigationOwnerClientInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F03213F8];
  return MEMORY[0x1F41817F8]();
}

void sub_1ABB2D210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1ABB2E30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMFAACreateCertificateSerialNumberSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!MFAAuthenticationLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MFAAuthenticationLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5E3B9F0;
    uint64_t v7 = 0;
    MFAAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    os_log_t v2 = (void *)MFAAuthenticationLibraryCore_frameworkLibrary;
    if (MFAAuthenticationLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  os_log_t v2 = (void *)MFAAuthenticationLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "MFAACreateCertificateSerialNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMFAACreateCertificateSerialNumberSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MFAAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MFAAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1ABB2EA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t _CRHandleRemoteControlEvent(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E4F21138]))
  {
    [v7 _dataReceived:a3];
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E4F21140]))
  {
    [v7 _channelInvalidated];
  }
  return MEMORY[0x1F41817F8]();
}

void sub_1ABB2F1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CRRemoteControlSendMessageCompletion(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _sendComplete];
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  return *(void *)a1;
}

void sub_1ABB300DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABB301F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB30534(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1ABB30658(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB30AC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

__CFString *CRCarPlayFeaturesName(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"none";
    goto LABEL_13;
  }
  char v1 = a1;
  if (a1 == -1)
  {
    uint64_t v2 = @"all";
    goto LABEL_13;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  os_log_t v4 = v3;
  if (v1)
  {
    [v3 addObject:@"AlternateScreen"];
    if ((v1 & 2) == 0)
    {
LABEL_7:
      if ((v1 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_7;
  }
  [v4 addObject:@"EnhancedSiri"];
  if ((v1 & 4) == 0)
  {
LABEL_8:
    if ((v1 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v4 addObject:@"HEVC"];
  if ((v1 & 8) == 0)
  {
LABEL_9:
    if ((v1 & 0x10) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    [v4 addObject:@"DataProtocol"];
    if ((v1 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  [v4 addObject:@"GaugeCluster"];
  if ((v1 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v1 & 0x20) != 0) {
LABEL_11:
  }
    [v4 addObject:@"PassengerDisplay"];
LABEL_12:
  uint64_t v2 = [v4 componentsJoinedByString:@"|"];

LABEL_13:
  return v2;
}

id CRCarPlayFeaturesAsAirPlayFeatures(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F0318140];
  uint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"altScreen"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"enhancedSiri"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 addObject:@"hevc"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v3 addObject:@"fileTransfer"];
  [v3 addObject:@"logTransfer"];
  [v3 addObject:@"uiSync"];
  if ((a1 & 0x10) != 0) {
LABEL_6:
  }
    [v3 addObject:@"vehicleStateProtocol"];
LABEL_7:
  return v3;
}

uint64_t CRCarPlayFeaturesAllFerriteFeatures()
{
  return 56;
}

void sub_1ABB3188C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABB31C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1ABB31EF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1ABB32584(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB32650(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB338FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1ABB33C38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_1ABB36078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1ABB36238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB386BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1ABB38964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1ABB3AD24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABB3BFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _adjacentViewAreaForPayload(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 objectForKey:@"adjacentViewAreas"];

  if (v5)
  {
    long long v6 = [v3 objectForKey:@"adjacentViewAreas"];
    if ([v6 count])
    {
      id v7 = [v6 firstObject];
      uint64_t v8 = [v7 unsignedIntegerValue];

      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v5 = [v4 objectAtIndex:v8];
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v5 = 0;
  }
LABEL_7:

  return v5;
}

uint64_t _transitionControlTypeForViewAreaChange(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 displaysTransitionControl];
  uint64_t v6 = 0;
  if (v4 && v5)
  {
    [v3 safeFrame];
    double v8 = v7;
    [v3 safeFrame];
    double v10 = v8 * v9;
    [v4 safeFrame];
    double v12 = v11;
    [v4 safeFrame];
    if (v12 * v13 >= v10) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
  }

  return v6;
}

void CARHandleSuggestUI(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  double v10 = a4;
  double v11 = CarGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v28 = v7;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v9;
    _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_DEFAULT, "In URLS: %{public}@, iOS URLS: %{public}@, info response URLs: %{public}@", buf, 0x20u);
  }

  double v12 = objc_msgSend(v7, "bs_filter:", &__block_literal_global_407);
  double v13 = CarGeneralLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v12;
    _os_log_impl(&dword_1ABB00000, v13, OS_LOG_TYPE_DEFAULT, "Sanitized suggested URLs = %{public}@", buf, 0xCu);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __CARHandleSuggestUI_block_invoke_408;
  v25[3] = &unk_1E5E3C120;
  id v14 = v9;
  id v26 = v14;
  id v15 = objc_msgSend(v8, "bs_filter:", v25);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __CARHandleSuggestUI_block_invoke_2;
  v22[3] = &unk_1E5E3C148;
  id v17 = v12;
  id v23 = v17;
  id v18 = v16;
  id v24 = v18;
  [v15 enumerateObjectsUsingBlock:v22];
  char v19 = CarGeneralLogging();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v28 = v17;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2114;
    id v34 = v18;
    _os_log_impl(&dword_1ABB00000, v19, OS_LOG_TYPE_DEFAULT, "suggestUI URL list %{public}@, app supported list: %{public}@, session list: %{public}@, intersect list %{public}@", buf, 0x2Au);
  }

  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v18 forKey:@"urls"];
  id v21 = CarGeneralLogging();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v20;
    _os_log_impl(&dword_1ABB00000, v21, OS_LOG_TYPE_DEFAULT, "Parameters for suggest UI Command: %{public}@", buf, 0xCu);
  }

  v10[2](v10, v20);
}

BOOL __CARHandleSuggestUI_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 absoluteString];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __CARHandleSuggestUI_block_invoke_408(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 absoluteString];
  if (v3) {
    uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __CARHandleSuggestUI_block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    BOOL v3 = [v5 absoluteString];
    if (v3 && ([*(id *)(a1 + 40) containsObject:v3] & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
  return MEMORY[0x1F41817F8]();
}

void sub_1ABB3EF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CARSesssionStatusChangedCallback()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"CARSessionStatusChangedNotification" object:0 userInfo:0];
}

uint64_t CRSessionStatusInCarNotificationCallback(uint64_t a1, void *a2)
{
  return [a2 _handleInCarNotification];
}

uint64_t CRSessionStatusStartingWiredConnectionNotificationCallback(uint64_t a1, void *a2)
{
  return [a2 _handleStartingWiredConnectionNotification];
}

uint64_t CRSessionStatusAccessoryUpdatedNotificationCallback(uint64_t a1, void *a2)
{
  return [a2 _handleConfigurationUpdated];
}

uint64_t CRSessionStatusCapabilitiesUpdatedNotificationCallback(uint64_t a1, void *a2)
{
  return [a2 _handleCarCapabilitiesUpdated];
}

void sub_1ABB3FB30(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1ABB3FE58(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

float CARGetMinimumScaleForProposedScaleOnDisplay(void *a1, float a2)
{
  id v3 = a1;
  id v4 = [[CARSessionStatus alloc] initAndWaitUntilSessionUpdated];
  id v5 = [v4 currentSession];
  uint64_t v6 = [v5 configuration];
  id v7 = [v6 screenInfoForScreenID:v3];

  float v8 = _CARGetMinimumScaleForScreenInfo(v7, a2);
  return v8;
}

float _CARGetMinimumScaleForScreenInfo(void *a1, float a2)
{
  id v3 = a1;
  if (![v3 screenType])
  {
    float v5 = _CARGetMinimumScaleForProposedScaleForScreenInfo(v3, a2);
    goto LABEL_5;
  }
  float v4 = 2.0;
  if ([v3 screenType] == 1)
  {
    _CARGetMinimumScaleForSecondaryScreenInfo(v3);
LABEL_5:
    float v4 = v5;
  }

  return v4;
}

float _CARGetMinimumScaleForProposedScaleForScreenInfo(void *a1, float a2)
{
  id v3 = a1;
  uint64_t v9 = 0;
  double v10 = (float *)&v9;
  uint64_t v11 = 0x2020000000;
  float v12 = a2;
  float v4 = [v3 viewAreas];

  if (v4)
  {
    float v5 = [v3 viewAreas];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___CARGetMinimumScaleForProposedScaleForScreenInfo_block_invoke;
    v8[3] = &unk_1E5E3C1E0;
    void v8[4] = &v9;
    [v5 enumerateObjectsUsingBlock:v8];
  }
  float v6 = v10[6];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1ABB407B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _CARGetMinimumScaleForSecondaryScreenInfo(void *a1)
{
  id v1 = a1;
  [v1 physicalSize];
  [v1 pixelSize];
}

void figEndpointNotificationCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  float v8 = (void *)MEMORY[0x1AD113EA0]();
  uint64_t v9 = a2;
  id v10 = a3;
  if (figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce != -1) {
    dispatch_once(&figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce, &__block_literal_global_702);
  }
  uint64_t v11 = [(id)figEndpointNotificationCallback_figToCARSessionNotificationMapping objectForKey:v10];
  if (v11)
  {
    id v12 = a5;
    double v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v69 = v11;
      __int16 v70 = 2112;
      id v71 = v12;
      _os_log_impl(&dword_1ABB00000, v13, OS_LOG_TYPE_DEFAULT, "posting session notification %{public}@ %@", buf, 0x16u);
    }

    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:v11 object:v9 userInfo:v12];
    goto LABEL_7;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F20768]])
  {
    id v15 = CarGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      figEndpointNotificationCallback_cold_1();
    }

    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = v16;
    id v17 = @"CARSessionServerConnectionDiedNotification";
LABEL_20:
    [v16 postNotificationName:v17 object:v9];
    goto LABEL_21;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F206D8]])
  {
    id v18 = CarGeneralLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      figEndpointNotificationCallback_cold_2();
    }

    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = v16;
    id v17 = @"CARSessionAuthenticationSucceededNotification";
    goto LABEL_20;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F20718]])
  {
    char v19 = CarGeneralLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      figEndpointNotificationCallback_cold_3();
    }

    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = v16;
    id v17 = @"CARSessionEndpointActivatedNotification";
    goto LABEL_20;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F20788]])
  {
    id v20 = CarGeneralLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = a5;
      _os_log_impl(&dword_1ABB00000, v20, OS_LOG_TYPE_INFO, "vehicle information changed %@", buf, 0xCu);
    }

    id v12 = [a5 objectForKey:*MEMORY[0x1E4F21590]];
    if (!v12) {
      goto LABEL_21;
    }
    if (v9[4])
    {
      id v21 = [v9 inputDeviceManager];
      [v21 vehicleInformationChanged:v12];
    }
    id v22 = [v12 valueForKey:*MEMORY[0x1E4F21598]];

    if (!v22) {
      goto LABEL_21;
    }
    id v23 = CarGeneralLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB00000, v23, OS_LOG_TYPE_INFO, "electronic toll collection state changed", buf, 2u);
    }

    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"CARSessionElectronicTollCollectionStateChangedNotification" object:v9];
    goto LABEL_7;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F207B0]])
  {
    id v24 = CarGeneralLogging();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = a5;
      _os_log_impl(&dword_1ABB00000, v24, OS_LOG_TYPE_DEFAULT, "application URL requested: %@", buf, 0xCu);
    }

    id v12 = [a5 objectForKey:*MEMORY[0x1E4F215A8]];
    [v9 _handleOpenURL:v12];
    goto LABEL_21;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F20770]])
  {
    id v25 = CarGeneralLogging();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = a5;
      _os_log_impl(&dword_1ABB00000, v25, OS_LOG_TYPE_DEFAULT, "Siri requested: %@", buf, 0xCu);
    }

    id v26 = [a5 objectForKey:*MEMORY[0x1E4F21280]];
    objc_msgSend(v9, "_handleSiriRequestEvent:withPayload:", +[CARSession _siriRequestEventForEndpointAction:](CARSession, "_siriRequestEventForEndpointAction:", v26), a5);

    goto LABEL_22;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F206F8]])
  {
    v27 = CarGeneralLogging();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = a5;
      _os_log_impl(&dword_1ABB00000, v27, OS_LOG_TYPE_DEFAULT, "Alternate test Siri requested: %@", buf, 0xCu);
    }

    id v12 = [a5 objectForKey:*MEMORY[0x1E4F20400]];
    id v14 = [v12 objectForKey:*MEMORY[0x1E4F21280]];
    objc_msgSend(v9, "_handleSiriRequestEvent:withPayload:", +[CARSession _siriRequestEventForEndpointAction:](CARSession, "_siriRequestEventForEndpointAction:", v14), v12);
    goto LABEL_7;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F20790]])
  {
    id v28 = CarGeneralLogging();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = a5;
      _os_log_impl(&dword_1ABB00000, v28, OS_LOG_TYPE_DEFAULT, "View area change received: %@", buf, 0xCu);
    }

    [v9 _handleViewAreaChangeWithPayload:a5];
    goto LABEL_22;
  }
  if (![v10 isEqualToString:*MEMORY[0x1E4F20748]])
  {
    if ([v10 isEqualToString:*MEMORY[0x1E4F20758]])
    {
      id v12 = a5;
      v43 = CarGeneralLogging();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v12;
        _os_log_impl(&dword_1ABB00000, v43, OS_LOG_TYPE_DEFAULT, "System night mode changed: %@", buf, 0xCu);
      }

      id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F205B0]];
      v44 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F20670]];
      if (v14)
      {
        v45 = [v9 configuration];
        v46 = [v45 screenInfoForScreenID:v14];

        objc_msgSend(v46, "nightModeChanged:", objc_msgSend(v44, "BOOLValue"));
      }
      [v9 setSystemNightMode:v44];
      v47 = [v9 appearanceManager];
      [v47 handleNightModeUpdateWithParameters:v12];

      [v9 _handleNightModeChange];
      goto LABEL_7;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4F20780]])
    {
      uint64_t v48 = *MEMORY[0x1E4F21588];
      id v49 = a5;
      id v12 = [v49 objectForKeyedSubscript:v48];
      id v14 = [v49 objectForKeyedSubscript:*MEMORY[0x1E4F21580]];

      if (([v9 sessionStatusOptions] & 2) == 0)
      {
LABEL_7:

LABEL_21:
        goto LABEL_22;
      }
      if ([v12 isEqualToString:@"showUI"])
      {
        v50 = CarGeneralLogging();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = v14;
          _os_log_impl(&dword_1ABB00000, v50, OS_LOG_TYPE_DEFAULT, "ShowUI requested with %@", buf, 0xCu);
        }

        [v9 _handleShowUIWithParameters:v14];
        goto LABEL_7;
      }
      if ([v12 isEqualToString:@"stopUI"])
      {
        v54 = CarGeneralLogging();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = v14;
          _os_log_impl(&dword_1ABB00000, v54, OS_LOG_TYPE_DEFAULT, "StopUI requested with %@", buf, 0xCu);
        }

        [v9 _handleStopUIWithParameters:v14];
        goto LABEL_7;
      }
      if ([v12 isEqualToString:@"uiAppearanceUpdate"])
      {
        v56 = CarGeneralLogging();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = v14;
          _os_log_impl(&dword_1ABB00000, v56, OS_LOG_TYPE_DEFAULT, "setAppearanceMode called with %@", buf, 0xCu);
        }

        [v9 _handleAppearanceModeUpdateWithParameters:v14];
        goto LABEL_7;
      }
      if ([v12 isEqualToString:@"mapAppearanceUpdate"])
      {
        v57 = CarGeneralLogging();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = v14;
          _os_log_impl(&dword_1ABB00000, v57, OS_LOG_TYPE_DEFAULT, "setMapAppearanceMode called with %@", buf, 0xCu);
        }

        [v9 _handleMapAppearanceModeUpdateWithParameters:v14];
        goto LABEL_7;
      }
      if ([v12 isEqualToString:@"updateDisplayPanels"])
      {
        [v9 _handleDisplayPanelsUpdateWithParameters:v14];
        goto LABEL_7;
      }
      v58 = CarGeneralLogging();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v69 = v12;
        __int16 v70 = 2112;
        id v71 = v14;
        _os_log_impl(&dword_1ABB00000, v58, OS_LOG_TYPE_DEFAULT, "Received unhandled remote event %@ with %@", buf, 0x16u);
      }

      v55 = [v9 observers];
      [v55 session:v9 receivedUnhandledRemoteEvent:v12 withPayload:v14];
    }
    else
    {
      if (![v10 isEqualToString:*MEMORY[0x1E4F202E8]]) {
        goto LABEL_22;
      }
      id v12 = a5;
      v51 = CarGeneralLogging();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v12;
        _os_log_impl(&dword_1ABB00000, v51, OS_LOG_TYPE_DEFAULT, "Enhanced Siri parameters changed: %@", buf, 0xCu);
      }

      v52 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F20578]];
      id v14 = v52;
      if (v52) {
        uint64_t v53 = [v52 integerValue];
      }
      else {
        uint64_t v53 = -1;
      }
      v9[5] = v53;
      v55 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v55 postNotificationName:@"CARSessionVoiceTriggerModeChangedNotification" object:v9 userInfo:v12];
    }

    goto LABEL_7;
  }
  v61 = v8;
  id v29 = a5;
  id v30 = CarGeneralLogging();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v69 = v29;
    _os_log_impl(&dword_1ABB00000, v30, OS_LOG_TYPE_DEFAULT, "Limited UI changed: %@", buf, 0xCu);
  }

  __int16 v31 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F205B0]];
  v59 = v29;
  id v32 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F205B8]];
  unsigned int v62 = [v32 BOOLValue];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v60 = v9;
  __int16 v33 = [v9 configuration];
  id v34 = [v33 screens];

  uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v64 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v40 = [v39 identifier];
        int v41 = [v40 isEqualToString:v31];

        if (v41) {
          [v39 limitedUIChanged:v62];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v36);
  }

  v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = v60;
  [v42 postNotificationName:@"CARSessionLimitUserInterfacesChangedNotification" object:v60 userInfo:v59];

  float v8 = v61;
LABEL_22:
}

uint64_t __figEndpointNotificationCallback_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  figEndpointNotificationCallback_figToCARSessionNotificationMapping = objc_msgSend(v0, "initWithObjectsAndKeys:", @"CARSessionScreenBecameAvailableNotification", *MEMORY[0x1E4F20410], @"CARSessionScreenBecameUnavailableNotification", *MEMORY[0x1E4F20418], @"CARSessioniOSHasMainAudioNotification", *MEMORY[0x1E4F20420], @"CARSessionCarHasMainAudioNotification", *MEMORY[0x1E4F20408], @"CARSessionOwnsTurnByTurnNavigationChangedNotification", *MEMORY[0x1E4F20428], @"CARSessionPerformanceReportPostedNotification", *MEMORY[0x1E4F20760], 0);
  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1ABB41AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB41C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1ABB41E44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABB43200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB4360C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CRServiceConnectionPerform(&__block_literal_global_67, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void CARVerifyString_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "object %@ is not a string", v2, v3, v4, v5, v6);
}

void CARVerifyStringArray_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "non-string objects in array: %@", v2, v3, v4, v5, v6);
}

void CARVerifyClass_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1ABB00000, v1, OS_LOG_TYPE_ERROR, "object %@ is not of class %@", v2, 0x16u);
}

void CARVerifyBool_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "object %@ is not a BOOL number", v2, v3, v4, v5, v6);
}

void __CRPostBannerToPhone_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "CarPlay service diagnostics error: %@", (uint8_t *)&v2, 0xCu);
}

void __CRCollectCarPlayDiagnostics_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "CarPlay diagnostics error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __getCLLocationManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CARAutomaticDNDStatus _performCARPreferencesBlock:forReading:](v0);
}

void __CRConnectBluetoothLE_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "CRConnectBluetoothLE failed to call carkitd: %@", v2, v3, v4, v5, v6);
}

void __CRHandleBluetoothClassicPairingCompleted_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "CARBluetoothClassicDiscoverer handleBluetoothClassicPairingCompleted failed to call carkitd: %@", v2, v3, v4, v5, v6);
}

void __CRStartBluetoothClassicPairing_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "CRStartBluetoothClassicPairing failed to call carkitd: %@", v2, v3, v4, v5, v6);
}

void __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "CRConfirmAndContinueBluetoothClassicPairing failed to call carkitd: %@", v2, v3, v4, v5, v6);
}

void __CRHandleCarPlayConnectionRequest_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "carkitd failed to handle the start session request: %@", v2, v3, v4, v5, v6);
}

void __CRHandleCarPlayConnectionRequest_block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "failed to send carkitd the start session request: %@", v2, v3, v4, v5, v6);
}

void CARSignpostLogForCategory_cold_1()
{
}

uint64_t __getLSApplicationRecordClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[CRVehicleAccessoryManager _certificateSerialNumberForAccessory:](v0);
}

void figEndpointNotificationCallback_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "AirPlay endpoint server connection died", v2, v3, v4, v5, v6);
}

void figEndpointNotificationCallback_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1ABB00000, v0, v1, "AirPlay authentication succeeded", v2, v3, v4, v5, v6);
}

void figEndpointNotificationCallback_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1ABB00000, v0, v1, "Endpoint activated", v2, v3, v4, v5, v6);
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1F410CFE0]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x1F410CFF0]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1F410D028]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x1F410D030]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1F410C2B0]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSNSStringFromCGPoint()
{
  return MEMORY[0x1F410C480]();
}

uint64_t BSNSStringFromCGSize()
{
  return MEMORY[0x1F410C490]();
}

uint64_t BSStringFromCGPoint()
{
  return MEMORY[0x1F410C658]();
}

uint64_t BSStringFromCGSize()
{
  return MEMORY[0x1F410C668]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1F40DB920]();
}

uint64_t CMBaseObjectIsMemberOfClass()
{
  return MEMORY[0x1F40DB938]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1F40DBCA8]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1F40DBCB8]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1F40DBCD8]();
}

uint64_t FigEndpointCopyActiveCarPlayEndpoint()
{
  return MEMORY[0x1F40DD430]();
}

uint64_t FigEndpointExtendedGetClassID()
{
  return MEMORY[0x1F40DD458]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x1F40DD468]();
}

uint64_t FigEndpointRemoteControlSessionGetCMBaseObject()
{
  return MEMORY[0x1F40DD510]();
}

uint64_t FigNotificationCenterAddWeakListeners()
{
  return MEMORY[0x1F40DDD98]();
}

uint64_t FigNotificationCenterRemoveWeakListeners()
{
  return MEMORY[0x1F40DDDB8]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1F40E8AB8](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1F40E8AC8]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1F40E8B38]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8D20](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x1F40E8D40](service);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x1F417CE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

BOOL NSEdgeInsetsEqual(NSEdgeInsets aInsets, NSEdgeInsets bInsets)
{
  return MEMORY[0x1F40E7090](*(__n128 *)&aInsets.top, *(__n128 *)&aInsets.left, *(__n128 *)&aInsets.bottom, *(__n128 *)&aInsets.right, *(__n128 *)&bInsets.top, *(__n128 *)&bInsets.left, *(__n128 *)&bInsets.bottom, *(__n128 *)&bInsets.right);
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x1F40E7220](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
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
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCE28](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}