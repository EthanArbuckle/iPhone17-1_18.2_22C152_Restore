void sub_230A4B52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_230A4BC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MDMAnalyticsSendCommandEvent(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __MDMAnalyticsSendCommandEvent_block_invoke(uint64_t a1)
{
  v19[9] = *MEMORY[0x263EF8340];
  id v2 = (id)*MEMORY[0x263F52960];
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = [v3 domain];

    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
    id v2 = (id)v4;
  }
  else
  {
    id v5 = &unk_26E553C68;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    uint64_t v6 = *MEMORY[0x263F52958];
  }
  uint64_t v7 = *MEMORY[0x263F528E8];
  v18[0] = *MEMORY[0x263F528E0];
  v18[1] = v7;
  v19[0] = v6;
  v19[1] = v5;
  uint64_t v8 = *MEMORY[0x263F528F0];
  v19[2] = v2;
  uint64_t v9 = *MEMORY[0x263F52970];
  v18[2] = v8;
  v18[3] = v9;
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v19[3] = v10;
  v18[4] = *MEMORY[0x263F52918];
  v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v19[4] = v11;
  v18[5] = *MEMORY[0x263F52938];
  v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 50)];
  v19[5] = v12;
  v18[6] = *MEMORY[0x263F52940];
  v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 51)];
  v19[6] = v13;
  v18[7] = *MEMORY[0x263F52950];
  v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
  v19[7] = v14;
  v18[8] = *MEMORY[0x263F52948];
  v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 53)];
  v19[8] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:9];

  return v16;
}

uint64_t MDMAnalyticsSendPushEvent()
{
  return AnalyticsSendEventLazy();
}

id __MDMAnalyticsSendPushEvent_block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F52968];
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v8[0] = v2;
  v7[1] = *MEMORY[0x263F52950];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 36)];
  v8[1] = v3;
  v7[2] = *MEMORY[0x263F52948];
  uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 37)];
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void sub_230A4D70C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230A4DB64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230A4DFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
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

void sub_230A4E230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_230A4F17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void sub_230A4F4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_230A4F994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_230A51584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A52590(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = [v2 userInfo];
    uint64_t v4 = [v3 objectForKeyedSubscript:@"error"];

    +[MDMAbstractTunnelParser responseWithError:v4];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x230A52540);
  }
  _Unwind_Resume(exception_object);
}

BOOL MDMKeybagCreateMDMEscrowWithPasscode(void *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = NSString;
  id v4 = a1;
  id v5 = [v3 DMCMakeUUID];
  id v34 = 0;
  id v6 = MDMKeybagCopyEscrowWithAuth(v5, v4, &v34);

  id v7 = v34;
  if (v6)
  {
    v33 = a2;
    id v32 = v6;
    uint64_t v8 = (void *)MEMORY[0x263F38B90];
    uint64_t v9 = [MEMORY[0x263F38B90] dataFromString:v5];
    uint64_t v10 = *MEMORY[0x263F52EA0];
    uint64_t v11 = *MEMORY[0x263F529E8];
    uint64_t v12 = *MEMORY[0x263F16EB8];
    uint64_t v13 = [MEMORY[0x263F52810] sharedConfiguration];
    uint64_t v14 = [v13 personaID];
    id v36 = 0;
    BYTE2(v29) = v14 != 0;
    LOWORD(v29) = 256;
    objc_msgSend(v8, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v9, v10, v11, 0, 0, v12, 0, v29, &v36);
    id v15 = v36;

    if (v15)
    {
      uint64_t v16 = v32;
      uint64_t v17 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v15;
        _os_log_impl(&dword_230A49000, v17, OS_LOG_TYPE_ERROR, "Failed to store MDM escrow secret into keychain. Error: %@", buf, 0xCu);
      }
      a2 = v33;
    }
    else
    {
      v18 = (void *)MEMORY[0x263F38B90];
      uint64_t v19 = *MEMORY[0x263F529E0];
      uint64_t v20 = *MEMORY[0x263F16EA0];
      v21 = [MEMORY[0x263F52810] sharedConfiguration];
      v22 = [v21 personaID];
      id v35 = 0;
      BYTE2(v30) = v22 != 0;
      LOWORD(v30) = 256;
      v23 = v18;
      uint64_t v16 = v32;
      uint64_t v31 = v10;
      objc_msgSend(v23, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v32, v10, v19, 0, 0, v20, 0, v30, &v35);
      id v15 = v35;

      a2 = v33;
      if (!v15)
      {
LABEL_11:

        goto LABEL_12;
      }
      v24 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v15;
        _os_log_impl(&dword_230A49000, v24, OS_LOG_TYPE_ERROR, "Failed to store MDM escrow data into keychain. Error: %@", buf, 0xCu);
      }
      v25 = (void *)MEMORY[0x263F38B90];
      v26 = [MEMORY[0x263F52810] sharedConfiguration];
      v27 = [v26 personaID];
      [v25 removeItemForService:v31 account:v11 label:0 description:0 useSystemKeychain:0 enforcePersonalPersona:v27 != 0 group:0];

      uint64_t v16 = v32;
    }

    goto LABEL_11;
  }
LABEL_12:
  if (a2 && v7) {
    *a2 = v7;
  }

  return v7 == 0;
}

id MDMKeybagCopyEscrowWithAuth(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (+[MDMMCInterface isPasscodeSet](MDMMCInterface, "isPasscodeSet") && ![v6 length])
  {
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F38AC8];
    v22 = DMCErrorArray();
    uint64_t v14 = objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:errorType:", v21, 37002, v22, *MEMORY[0x263F38A40], 0);
  }
  else
  {
    id v7 = [v6 dataUsingEncoding:4];
    if (v5) {
      [v5 dataUsingEncoding:4];
    }
    else {
    uint64_t v8 = [MEMORY[0x263EFF8F8] data];
    }
    uint64_t EscrowWithAuth = MKBKeyBagCreateEscrowWithAuth();
    if (EscrowWithAuth)
    {
      uint64_t v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F38AC8];
      uint64_t v12 = [NSNumber numberWithInt:EscrowWithAuth];
      uint64_t v13 = DMCErrorArray();
      uint64_t v14 = objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:errorType:", v11, 37003, v13, *MEMORY[0x263F38A40], v12, 0);
    }
    else
    {
      uint64_t v15 = MKBKeyBagCopyData();
      if (v15)
      {
        uint64_t v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = *MEMORY[0x263F38AC8];
        v18 = [NSNumber numberWithInt:v15];
        uint64_t v19 = DMCErrorArray();
        uint64_t v14 = objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:errorType:", v17, 37004, v19, *MEMORY[0x263F38A40], v18, 0);
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
  }
  if (v14)
  {
    id v23 = 0;
    if (a3) {
      *a3 = v14;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

id MDMKeybagRetrieveMDMEscrowDataIfPresent(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F38B90];
  uint64_t v3 = *MEMORY[0x263F52EA0];
  uint64_t v4 = *MEMORY[0x263F529E0];
  id v5 = [MEMORY[0x263F52810] sharedConfiguration];
  id v6 = [v5 personaID];
  id v16 = 0;
  LOBYTE(v15) = v6 != 0;
  id v7 = [v2 dataFromService:v3 account:v4 label:0 description:0 group:0 useSystemKeychain:0 enforcePersonalPersona:v15 outError:&v16];
  id v8 = v16;

  if (!v7)
  {
    if (a1) {
      *a1 = v8;
    }
    uint64_t v9 = *(NSObject **)DMCLogObjects();
    if (v8)
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      uint64_t v10 = "Unable to retrieve escrow keybag from the keychain. Error: %@";
      uint64_t v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      uint64_t v10 = "No escrow keybag found in the keychain.";
      uint64_t v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 2;
    }
    _os_log_impl(&dword_230A49000, v11, v12, v10, buf, v13);
  }
LABEL_10:

  return v7;
}

void MDMKeybagDeleteMDMEscrowData()
{
  v0 = (void *)MEMORY[0x263F38B90];
  uint64_t v1 = *MEMORY[0x263F52EA0];
  uint64_t v2 = *MEMORY[0x263F529E0];
  id v4 = [MEMORY[0x263F52810] sharedConfiguration];
  uint64_t v3 = [v4 personaID];
  [v0 removeItemForService:v1 account:v2 label:0 description:0 useSystemKeychain:0 enforcePersonalPersona:v3 != 0 group:0];
}

void MDMKeybagDeleteMDMEscrowSecret()
{
  v0 = (void *)MEMORY[0x263F38B90];
  uint64_t v1 = *MEMORY[0x263F52EA0];
  uint64_t v2 = *MEMORY[0x263F529E8];
  id v4 = [MEMORY[0x263F52810] sharedConfiguration];
  uint64_t v3 = [v4 personaID];
  [v0 removeItemForService:v1 account:v2 label:0 description:0 useSystemKeychain:0 enforcePersonalPersona:v3 != 0 group:0];
}

id MDMKeybagCreateSupervisionEscrowWithPasscode(void *a1, void *a2)
{
  id v8 = 0;
  id v3 = MDMKeybagCopyEscrowWithAuth(@"com.apple.Chaperone", a1, &v8);
  id v4 = v8;
  id v5 = v4;
  if (v4)
  {
    id v6 = 0;
    if (a2) {
      *a2 = v4;
    }
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

uint64_t MDMKeybagRetrieveSupervisionEscrowSecret()
{
  return [@"com.apple.Chaperone" dataUsingEncoding:4];
}

void sub_230A54170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A54740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
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

void sub_230A54D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_230A571B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230A58B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_230A59194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

Class __getPRSettingsProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ProximityReaderLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ProximityReaderLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264B9D760;
    uint64_t v5 = 0;
    ProximityReaderLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ProximityReaderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getPRSettingsProviderClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("PRSettingsProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getPRSettingsProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ProximityReaderLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ProximityReaderLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_230A63F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_230A6726C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A6F46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A75DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_230A77F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_230A78A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_230A78F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_230A7A328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A7B43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A7B6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A7C6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose((const void *)(v67 - 240), 8);
  _Block_object_dispose((const void *)(v67 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_230A7CEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_230A7DC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_230A7E49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_230A7F468(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_230A802A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A8098C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A81214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_230A82C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A82EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A832D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A835A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A8394C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_230A83AB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_230A83BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A84704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A84BD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_230A85644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_230A8610C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_230A86908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_230A87F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A884BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A88A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A88BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A894EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A896F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230A8A298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void _performBlockOnMainThread(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [MEMORY[0x263F08B88] mainThread];

  if (v2 == v3)
  {
    v1[2](v1);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___performBlockOnMainThread_block_invoke;
    block[3] = &unk_264B9E2C8;
    uint64_t v5 = v1;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

uint64_t ___performBlockOnMainThread_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_230A8DC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230A8DE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230A8E1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230A8E48C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_230A8ED5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getPRSettingsProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[MDMParser _availableOSUpdates:assertion:completionBlock:](v0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t AppAttest_DeviceAttestation_AttestKey()
{
  return MEMORY[0x270F0C770]();
}

uint64_t AppAttest_DeviceAttestation_IsSupported()
{
  return MEMORY[0x270F0C778]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t DEPLogObjects()
{
  return MEMORY[0x270F24E88]();
}

uint64_t DMCBYSetupAssistantFinishedDarwinNotification()
{
  return MEMORY[0x270F24ED0]();
}

uint64_t DMCCTSupportsVoiceRoaming()
{
  return MEMORY[0x270F24ED8]();
}

uint64_t DMCDeviceIsNetworkTethered()
{
  return MEMORY[0x270F24EE0]();
}

uint64_t DMCErrorArray()
{
  return MEMORY[0x270F24EE8]();
}

uint64_t DMCFixPermissionsOfSystemGroupContainerDirectoryAndContents()
{
  return MEMORY[0x270F24EF0]();
}

uint64_t DMCHasMDMMigrated()
{
  return MEMORY[0x270F24F00]();
}

uint64_t DMCIOBluetoothMAC()
{
  return MEMORY[0x270F24F08]();
}

uint64_t DMCIOModelString()
{
  return MEMORY[0x270F24F10]();
}

uint64_t DMCIsDeviceLocked()
{
  return MEMORY[0x270F24F18]();
}

uint64_t DMCIsSetupBuddyDone()
{
  return MEMORY[0x270F24F20]();
}

uint64_t DMCLKLogoutSupportClass()
{
  return MEMORY[0x270F24F28]();
}

uint64_t DMCLocalizedFormat()
{
  return MEMORY[0x270F24F30]();
}

uint64_t DMCLocalizedString()
{
  return MEMORY[0x270F24F38]();
}

uint64_t DMCLockdownSetDeviceName()
{
  return MEMORY[0x270F24F48]();
}

uint64_t DMCLogObjects()
{
  return MEMORY[0x270F24F50]();
}

uint64_t DMCSafelyCopyItemAtPathToDestinationPath()
{
  return MEMORY[0x270F24F58]();
}

uint64_t DMCSendSettingsChangedNotification()
{
  return MEMORY[0x270F24F60]();
}

uint64_t DMCSetSkipBackupAttributeToItemAtPath()
{
  return MEMORY[0x270F24F68]();
}

uint64_t DMCStringForBool()
{
  return MEMORY[0x270F24F70]();
}

uint64_t DMCSystemLostModeRequestPath()
{
  return MEMORY[0x270F24F80]();
}

uint64_t DMCUMUserManagerClass()
{
  return MEMORY[0x270F24F88]();
}

uint64_t DMCUMUserManagerErrorDomain()
{
  return MEMORY[0x270F24F90]();
}

uint64_t DMCUSEnglishString()
{
  return MEMORY[0x270F24F98]();
}

uint64_t DMCUnformattedErrorArray()
{
  return MEMORY[0x270F24FA0]();
}

uint64_t IXCreateUserPresentableError()
{
  return MEMORY[0x270F3D688]();
}

uint64_t MDMAppManagementFilePath()
{
  return MEMORY[0x270F24FA8]();
}

uint64_t MDMDEPTokenSyncActivitiesFilePath()
{
  return MEMORY[0x270F24FB0]();
}

uint64_t MDMDirtyEnrollmentStateFilePath()
{
  return MEMORY[0x270F24FB8]();
}

uint64_t MDMEventsFilePath()
{
  return MEMORY[0x270F24FC0]();
}

uint64_t MDMFilePath()
{
  return MEMORY[0x270F24FC8]();
}

uint64_t MDMLegacyManagedNonStoreBooksDirectory()
{
  return MEMORY[0x270F24FD0]();
}

uint64_t MDMManagedNonStoreBooksDirectory()
{
  return MEMORY[0x270F24FD8]();
}

uint64_t MDMManagedNonStoreBooksManifestPath()
{
  return MEMORY[0x270F24FE0]();
}

uint64_t MDMManagedNonStoreBooksSystemGroupContainer()
{
  return MEMORY[0x270F24FE8]();
}

uint64_t MDMOutstandingActivitiesFilePath()
{
  return MEMORY[0x270F24FF0]();
}

uint64_t MDMPropertiesFilePath()
{
  return MEMORY[0x270F24FF8]();
}

uint64_t MDMPropertiesUserFilePath()
{
  return MEMORY[0x270F25000]();
}

uint64_t MDMSendManagedBooksChangedNotification()
{
  return MEMORY[0x270F47B58]();
}

uint64_t MDMSendManagingOrgInfoChangedNotification()
{
  return MEMORY[0x270F47B60]();
}

uint64_t MDMSystemRestartLogPath()
{
  return MEMORY[0x270F25008]();
}

uint64_t MDMSystemShutDownLogPath()
{
  return MEMORY[0x270F25010]();
}

uint64_t MDMUserFilePath()
{
  return MEMORY[0x270F25018]();
}

uint64_t MDMUserOutstandingActivitiesFilePath()
{
  return MEMORY[0x270F25020]();
}

uint64_t MDMUserXPCProtocolInitialize()
{
  return MEMORY[0x270F47B68]();
}

uint64_t MDMXPCProtocolInitialize()
{
  return MEMORY[0x270F47B70]();
}

uint64_t MISCopyProvisioningProfile()
{
  return MEMORY[0x270F99ED0]();
}

uint64_t MISProvisioningProfileGetExpirationDate()
{
  return MEMORY[0x270F99F00]();
}

uint64_t MISProvisioningProfileGetName()
{
  return MEMORY[0x270F99F08]();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return MEMORY[0x270F99F18]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t MKBKeyBagCopyData()
{
  return MEMORY[0x270F4AE58]();
}

uint64_t MKBKeyBagCreateEscrowWithAuth()
{
  return MEMORY[0x270F4AE60]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SBLockDevice()
{
  return MEMORY[0x270F770F0]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x270F771E8]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x270F05598]();
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055B0](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055C0](interface);
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x270EFD6F0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x270EFD780]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x270EFD960]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

uint64_t TMGetKernelMonotonicClock()
{
  return MEMORY[0x270F23988]();
}

uint64_t TMGetRTCResetCount()
{
  return MEMORY[0x270F23990]();
}

uint64_t TMSetAutomaticTimeZoneEnabled()
{
  return MEMORY[0x270F239C0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t _AXDarkenSystemColors()
{
  return MEMORY[0x270F90520]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryName()
{
  return MEMORY[0x270F906E0]();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x270F90738]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x270F90740]();
}

uint64_t _AXSReduceMotionEnabled()
{
  return MEMORY[0x270F90998]();
}

uint64_t _AXSSetPreferredContentSizeCategoryName()
{
  return MEMORY[0x270F90A60]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

uint64_t tzlink()
{
  return MEMORY[0x270F9BA20]();
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x270EDC418]();
}