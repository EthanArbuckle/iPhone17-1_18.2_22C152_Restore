void sub_1D9667E5C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t vars8;

  v4 = objc_msgSend__getDataClassesFromSealingMap(*(void **)(a1 + 32), a2, a3, a4);
  v10 = v4;
  if (v4)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend_set(MEMORY[0x1E4F1CAD0], v5, v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)qword_1EA8C4DF8;
  qword_1EA8C4DF8 = (uint64_t)v8;
}

void sub_1D966AA4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1D966AA68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D966AA84(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D966AB04(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1D966AEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D966AF30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D966AF40(uint64_t a1)
{
}

void sub_1D966AF48(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1D96739D4((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_1D966AFBC(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 67109120;
    LODWORD(v22) = a2;
    _os_log_impl(&dword_1D9666000, v9, OS_LOG_TYPE_DEFAULT, "success %d", (uint8_t *)&v21, 8u);
  }

  v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v7;
    _os_log_impl(&dword_1D9666000, v10, OS_LOG_TYPE_DEFAULT, "systemhealth %@", (uint8_t *)&v21, 0xCu);
  }

  v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_1D9666000, v11, OS_LOG_TYPE_DEFAULT, "error %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v12 = *(void *)(a1[4] + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v15 = *(void *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v7;
  id v17 = v7;

  objc_msgSend_invalidate(*(void **)(*(void *)(a1[7] + 8) + 40), v18, v19, v20);
}

__CFString *getDeviceChemID()
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v0 = sub_1D966CDA8("IOPMPowerSource", 0, 0);
  if (v0)
  {
    io_object_t v1 = v0;
    CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v0, @"BatteryData", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      CFDictionaryRef v3 = CFProperty;
      CFDictionaryGetValue(CFProperty, @"AlgoChemID");
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = handleForCategory();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v6)
        {
          int v32 = 138412546;
          v33 = @"AlgoChemID";
          __int16 v34 = 2112;
          v35 = v4;
LABEL_11:
          _os_log_impl(&dword_1D9666000, v5, OS_LOG_TYPE_DEFAULT, "Found %@; returning chemID with value %@",
            (uint8_t *)&v32,
            0x16u);
        }
      }
      else
      {
        if (v6)
        {
          int v32 = 138412546;
          v33 = @"AlgoChemID";
          __int16 v34 = 2112;
          v35 = @"ChemID";
          _os_log_impl(&dword_1D9666000, v5, OS_LOG_TYPE_DEFAULT, "%@ not found in battery data; looking for %@",
            (uint8_t *)&v32,
            0x16u);
        }

        CFDictionaryGetValue(v3, @"ChemID");
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v7 = handleForCategory();
        uint64_t v5 = v7;
        if (!v4)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_1D96742AC(v5, v25, v26, v27, v28, v29, v30, v31);
          }
          uint64_t v4 = 0;
          goto LABEL_12;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 138412546;
          v33 = @"ChemID";
          __int16 v34 = 2112;
          v35 = v4;
          goto LABEL_11;
        }
      }
LABEL_12:

      IOObjectRelease(v1);
      CFRelease(v3);
      goto LABEL_13;
    }
    id v17 = handleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1D9674234(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    IOObjectRelease(v1);
  }
  else
  {
    uint64_t v9 = handleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D96741BC(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  uint64_t v4 = 0;
LABEL_13:
  return v4;
}

CFMutableDictionaryRef sub_1D966CDA8(const char *a1, void *a2, const void *a3)
{
  id v7 = a3;
  keys = a2;
  CFMutableDictionaryRef result = IOServiceMatching(a1);
  if (result)
  {
    uint64_t v5 = result;
    if (a2)
    {
      CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&keys, &v7, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(v5, @"IOPropertyMatch", v6);
      if (v6) {
        CFRelease(v6);
      }
    }
    return (CFMutableDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v5);
  }
  return result;
}

id hasHadBatteryRepairUsingCBCC()
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (MGGetProductType() != 1234705395)
  {
    uint64_t v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1D96743D4();
    }

    goto LABEL_18;
  }
  io_registry_entry_t v0 = sub_1D966CDA8("AppleSPUHIDInterface", @"name", @"compass");
  if (!v0)
  {
    uint64_t v21 = handleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1D9674324(v21, v22, v23, v24, v25, v26, v27, v28);
    }

LABEL_18:
    id v17 = 0;
    id v7 = 0;
    CFDictionaryRef v6 = 0;
    goto LABEL_11;
  }
  io_object_t v1 = v0;
  CFDictionaryRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, @"compass-battery-compensation", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFDictionaryRef v6 = CFProperty;
  if (CFProperty)
  {
    id v7 = objc_msgSend_convertToHexString(CFProperty, v3, v4, v5);
    id v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      v38 = v7;
      _os_log_impl(&dword_1D9666000, v8, OS_LOG_TYPE_DEFAULT, "CBCC attribute is %@", (uint8_t *)&v37, 0xCu);
    }

    uint64_t v9 = NSNumber;
    if (objc_msgSend_isEqualToString_(v7, v10, @"01000000DB000000B1FFFFFFCEFFFFFF91000000CBFFFFFFE6FFFFFF", v11))
    {
      objc_msgSend_numberWithBool_(v9, v12, 1, v13);
    }
    else
    {
      uint64_t isEqualToString = objc_msgSend_isEqualToString_(v7, v12, @"0100000075100000CDFFFFFFDCFFFFFFA0100000D6FFFFFFE0FFFFFF", v13);
      objc_msgSend_numberWithBool_(v9, v15, isEqualToString, v16);
    id v17 = };
  }
  else
  {
    uint64_t v29 = handleForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1D967439C(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    id v7 = 0;
    id v17 = 0;
  }
  IOObjectRelease(v1);
LABEL_11:
  id v18 = v17;

  return v18;
}

id hasHadBatteryRepair()
{
  if (MGGetProductType() == 1234705395)
  {
    v2 = NSNumber;
    uint64_t hasHadAuthorizedRepairForComponent = objc_msgSend_hasHadAuthorizedRepairForComponent_(CRRepairStatus, v0, 0, v1);
    CFDictionaryRef v6 = objc_msgSend_numberWithBool_(v2, v4, hasHadAuthorizedRepairForComponent, v5);
  }
  else
  {
    id v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D96743D4();
    }

    CFDictionaryRef v6 = 0;
  }
  return v6;
}

uint64_t sub_1D966D260(uint64_t a1, const char *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F338D7B0, a2, (uint64_t)&v20, (uint64_t)v26, 16);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    mach_port_t v5 = *MEMORY[0x1E4F2EEF0];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(&unk_1F338D7B0);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v8 = handleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v7;
          _os_log_impl(&dword_1D9666000, v8, OS_LOG_TYPE_DEFAULT, "Matching service %@", buf, 0xCu);
        }

        id v9 = v7;
        uint64_t v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
        CFDictionaryRef v14 = IOServiceMatching(v13);
        uint64_t MatchingService = IOServiceGetMatchingService(v5, v14);
        if (MatchingService)
        {
          uint64_t v17 = MatchingService;
          id v18 = handleForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v9;
            _os_log_impl(&dword_1D9666000, v18, OS_LOG_TYPE_DEFAULT, "Found service %@", buf, 0xCu);
          }

          return v17;
        }
      }
      uint64_t v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F338D7B0, v16, (uint64_t)&v20, (uint64_t)v26, 16);
      if (v3) {
        continue;
      }
      break;
    }
  }
  return 0;
}

void sub_1D966D808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D966D9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D966D9E0(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    unsigned int v2 = 0;
    do
    {
      uint64_t v3 = handleForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v9 = v2;
        _os_log_impl(&dword_1D9666000, v3, OS_LOG_TYPE_DEFAULT, "Retry Count:%d", buf, 8u);
      }

      sleep(0xAu);
      CFMutableDictionaryRef result = objc_msgSend_copyComponentStatus(*(void **)(v1 + 32), v4, v5, v6);
      *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
      if (*(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v2 >= 9;
      }
      ++v2;
    }
    while (!v7);
  }
  return result;
}

void sub_1D966DF20()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  id v1 = objc_alloc(MEMORY[0x1E4F29268]);
  uint64_t v3 = objc_msgSend_initWithMachServiceName_options_(v1, v2, @"com.apple.corerepair.preflightControl", 0);
  uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v4, (uint64_t)&unk_1F338FBB0, v5);
  objc_msgSend_setRemoteObjectInterface_(v3, v7, (uint64_t)v6, v8);

  objc_msgSend_resume(v3, v9, v10, v11);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D966E0EC;
  v25[3] = &unk_1E6B6F928;
  uint64_t v12 = v0;
  uint64_t v26 = v12;
  uint64_t v15 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v3, v13, (uint64_t)v25, v14);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1D966E158;
  v22[3] = &unk_1E6B6F950;
  id v23 = v3;
  uint64_t v16 = v12;
  uint64_t v24 = v16;
  id v17 = v3;
  objc_msgSend_queryRepairDeltaWithReply_(v15, v18, (uint64_t)v22, v19);

  dispatch_time_t v20 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v16, v20))
  {
    long long v21 = handleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1D9674528();
    }
  }
}

void sub_1D966E0EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1D967455C((uint64_t)v3, v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1D966E158(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = v8;
  if (v7 && !v8 && (a2 & 1) != 0)
  {
    uint64_t v52 = a1;
    uint64_t v13 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v53 = v7;
    id obj = v7;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v55, (uint64_t)v61, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v56 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          long long v22 = objc_msgSend_objectForKeyedSubscript_(v21, v16, @"key", v17);
          uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v21, v23, @"identifier", v24);
          uint64_t v28 = (void *)v25;
          if (v22) {
            BOOL v29 = v25 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (!v29)
          {
            uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v13, v26, (uint64_t)v22, v27);

            if (!v30)
            {
              uint64_t v34 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v31, v32, v33);
              objc_msgSend_setObject_forKeyedSubscript_(v13, v35, (uint64_t)v34, (uint64_t)v22);
            }
            id v36 = [NSString alloc];
            id v37 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            uint64_t v39 = objc_msgSend_initWithBase64EncodedString_options_(v37, v38, (uint64_t)v28, 0);
            v41 = objc_msgSend_initWithData_encoding_(v36, v40, (uint64_t)v39, 4);

            v44 = objc_msgSend_objectForKeyedSubscript_(v13, v42, (uint64_t)v22, v43);
            objc_msgSend_addObject_(v44, v45, (uint64_t)v41, v46);
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v55, (uint64_t)v61, 16);
      }
      while (v18);
    }

    v47 = handleForCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v13;
      _os_log_impl(&dword_1D9666000, v47, OS_LOG_TYPE_DEFAULT, "delta components: %@", buf, 0xCu);
    }

    v48 = qword_1EBE27770;
    qword_1EBE27770 = (uint64_t)v13;
    a1 = v52;
    id v7 = v53;
    uint64_t v12 = 0;
  }
  else
  {
    v48 = handleForCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_1D96745D4(a2, (uint64_t)v12, v48);
    }
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v49, v50, v51);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1D966EA0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D966EE04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D967196C(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (sub_1D9672424((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t sub_1D96719E4(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = sub_1D967222C((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = sub_1D96726C8(&v7, 4u, (uint64_t)&unk_1D9675548, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (sub_1D967196C(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D9671AC8(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = sub_1D96726C8(a1, 2u, (uint64_t)&unk_1D9675860, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = sub_1D9672424(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D9671B4C(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = sub_1D96725FC(a1, 7u, (uint64_t)&unk_1D9675638, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (sub_1D967196C(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u, v8 = 0u,
        }
                            uint64_t result = sub_1D9671AC8((unint64_t *)(a2 + 80), (char **)&v7),
                            !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = sub_1D9671C0C(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D9671C0C(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = sub_1D96725FC(result, 2u, (uint64_t)&unk_1D9675830, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (sub_1D967196C(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1D9671C90(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = sub_1D9671B4C(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = sub_1D96725FC(a1, 6u, (uint64_t)&unk_1D96755A8, a2, 0x90uLL, 0);
      if (!result)
      {
        if (sub_1D967196C(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = sub_1D9671AC8(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t sub_1D9671D9C(void *a1, unint64_t a2)
{
  return sub_1D9671DB8(a1, 5uLL, (uint64_t)&unk_1D96756E0, a2, 0x494D344Du);
}

uint64_t sub_1D9671DB8(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = sub_1D96725FC((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (sub_1D967196C(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = sub_1D9672424((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_1D9671E68(void *a1, unint64_t a2)
{
  return sub_1D9671DB8(a1, 3uLL, (uint64_t)&unk_1D96757B8, a2, 0x494D344Du);
}

uint64_t sub_1D9671E84(void *a1, unint64_t a2)
{
  return sub_1D9671DB8(a1, 4uLL, (uint64_t)&unk_1D9675758, a2, 0x494D3443u);
}

uint64_t sub_1D9671EA0(void *a1, unint64_t a2)
{
  return sub_1D9671DB8(a1, 3uLL, (uint64_t)&unk_1D96757B8, a2, 0x494D3443u);
}

uint64_t sub_1D9671EBC(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = sub_1D96725FC(result, 2u, (uint64_t)&unk_1D9675800, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (sub_1D967196C(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1D9671F40(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_1D9671F78(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = sub_1D9671F40(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

double sub_1D9671FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!sub_1D96719E4(v9, (unint64_t)&v5)
        && !sub_1D9671C90((uint64_t)&v6, a3 + 88)
        && !sub_1D9671D9C(&v7, a3 + 232)
        && !sub_1D9671EBC((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

uint64_t sub_1D96720D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D96720EC(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_1D96720EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = sub_1D9671E84(&v15, v10);
      }
      else {
        uint64_t result = sub_1D9671EA0(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = sub_1D9671D9C(&v15, v9);
      }
      else {
        uint64_t result = sub_1D9671E68(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = sub_1D9672234((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t sub_1D967222C(uint64_t a1, unint64_t *a2)
{
  return sub_1D9672234(a1, a2, 0);
}

uint64_t sub_1D9672234(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  BOOL v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  long long v5 = &v4[v3];
  long long v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    unint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    unint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t sub_1D9672424(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = sub_1D96724A8(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t sub_1D96724A8(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unint64_t v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

unint64_t *sub_1D9672510(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_1D967253C(unint64_t *a1, unint64_t *a2)
{
  _OWORD v10[2] = *MEMORY[0x1E4F143B8];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = sub_1D9672234((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_1D96725FC(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  memset(v12, 170, 24);
  uint64_t result = sub_1D9672234(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return sub_1D96726C8(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t sub_1D96726C8(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    BOOL v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = sub_1D967253C(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t sub_1D967299C(__CFArray **a1)
{
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  CFAllocatorRef v27;
  CFBooleanRef cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  uint64_t v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    unint64_t v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, @"InternalComponent", (const void *)*MEMORY[0x1E4F1CFD0]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x1E4F2EF00], v3, &existing);
    if (MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      BOOL v25 = a1;
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      io_object_t v6 = IOIteratorNext(existing);
      if (v6)
      {
        io_registry_entry_t v7 = v6;
        __int16 v27 = v5;
        do
        {
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, @"InternalComponent", v5, 0);
          if (!CFProperty)
          {
            uint64_t v23 = 0;
LABEL_38:
            unint64_t v16 = -536870206;
            goto LABEL_40;
          }
          CFBooleanRef v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            uint64_t v23 = 0;
            Mutable = 0;
            unint64_t v22 = v9;
            unint64_t v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          if (!Mutable) {
            goto LABEL_45;
          }
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            unint64_t v16 = RegistryEntryID;
            uint64_t v23 = 0;
LABEL_49:
            unint64_t v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          unint64_t v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            uint64_t v23 = 0;
            unint64_t v16 = -536870181;
            goto LABEL_49;
          }
          unsigned __int16 v13 = v12;
          CFDictionaryAddValue(Mutable, @"IORegistryEntryID", v12);
          unint64_t v14 = IORegistryEntryCreateCFProperty(v7, @"flags", v5, 0);
          if (v14) {
            CFDictionaryAddValue(Mutable, @"flags", v14);
          }
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          unint64_t v15 = BYTE2(valuePtr) << 16;
          unint64_t v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            unsigned __int16 v17 = @"Battery";
          }
          else
          {
            if (v15 != 196608)
            {
              uint64_t v23 = 0;
              unint64_t v19 = 0;
              uint64_t v21 = 0;
              unint64_t v22 = 0;
              __int16 v18 = 0;
              goto LABEL_25;
            }
            unsigned __int16 v17 = @"TouchController";
          }
          CFDictionaryAddValue(Mutable, @"ComponentName", v17);
          __int16 v18 = IORegistryEntryCreateCFProperty(v7, @"authErrorDescription", v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, @"authErrorDescription", v18);
            unint64_t v19 = IORegistryEntryCreateCFProperty(v7, @"AuthPassed", v5, 0);
            if (v19) {
              CFDictionaryAddValue(Mutable, @"AuthPassed", v19);
            }
            long long v20 = IORegistryEntryCreateCFProperty(v7, @"isTrusted", v5, 0);
            uint64_t v21 = v20;
            if (v20) {
              CFDictionaryAddValue(Mutable, @"isTrusted", v20);
            }
            unint64_t v22 = IORegistryEntryCreateCFProperty(v7, @"isTrustedForUI", v5, 0);
            if (v22) {
              CFDictionaryAddValue(Mutable, @"isTrustedForUI", v22);
            }
            unint64_t v16 = 0;
            uint64_t v23 = Mutable;
          }
          else
          {
            uint64_t v23 = 0;
            unint64_t v19 = 0;
            uint64_t v21 = 0;
            unint64_t v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14) {
            CFRelease(v14);
          }
          if (v18) {
            CFRelease(v18);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (v21) {
            CFRelease(v21);
          }
          if (v22) {
            goto LABEL_34;
          }
LABEL_35:
          if (Mutable)
          {
            CFAllocatorRef v5 = v27;
            if (!v16) {
              goto LABEL_40;
            }
            CFRelease(Mutable);
            goto LABEL_38;
          }
          CFAllocatorRef v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          io_registry_entry_t v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      uint64_t v1 = 0;
      *BOOL v25 = theArray;
    }
  }
  return v1;
}

void sub_1D9672DA4()
{
  sub_1D966AB04(*MEMORY[0x1E4F143B8]);
  sub_1D966AAF8();
  sub_1D966AA68(&dword_1D9666000, v0, v1, "Local sealing manifest populate failed, error = %@", v2, v3, v4, v5, v6);
}

void sub_1D9672E0C()
{
  sub_1D966AAE0();
  sub_1D966AA84(&dword_1D9666000, v0, v1, "Failed to verify local %@ data; error: %@");
}

void sub_1D9672E78()
{
  sub_1D966AAE0();
  sub_1D966AA84(&dword_1D9666000, v0, v1, "Failed to read local %@ data; error: %@");
}

void sub_1D9672EE4()
{
  sub_1D966AAC8();
  sub_1D966AA68(&dword_1D9666000, v0, v1, "Cannot copy %@ data from device", v2, v3, v4, v5, v6);
}

void sub_1D9672F4C(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "Failed to get payload; stat: %d", (uint8_t *)v2, 8u);
}

void sub_1D9672FC4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "Failed to parse cert as img4; stat: %d",
    (uint8_t *)v2,
    8u);
}

void sub_1D967303C()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to get local sealing manifest", v2, v3, v4, v5, v6);
}

void sub_1D9673070()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Classes is not an array", v2, v3, v4, v5, v6);
}

void sub_1D96730A4(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *a1;
  sub_1D966AA68(&dword_1D9666000, a2, a3, "Failed to decode sealing manifest: %@", a5, a6, a7, a8, 2u);
}

void sub_1D9673120(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *a1;
  sub_1D966AA68(&dword_1D9666000, a2, a3, "Failed to decode sealing map: %@", a5, a6, a7, a8, 2u);
}

void sub_1D967319C()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Data class is nil", v2, v3, v4, v5, v6);
}

void sub_1D96731D0()
{
  sub_1D966AB04(*MEMORY[0x1E4F143B8]);
  sub_1D966AAF8();
  sub_1D966AA68(&dword_1D9666000, v0, v1, "Failed to get DataInstance:%@", v2, v3, v4, v5, v6);
}

void sub_1D9673238()
{
  sub_1D966AB04(*MEMORY[0x1E4F143B8]);
  sub_1D966AAF8();
  sub_1D966AA68(&dword_1D9666000, v0, v1, "Copy manifest data failed, error = %@", v2, v3, v4, v5, v6);
}

void sub_1D96732A0()
{
  sub_1D966AAC8();
  sub_1D966AA68(&dword_1D9666000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_1D9673308()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Local Sealing manifest fetch failed", v2, v3, v4, v5, v6);
}

void sub_1D967333C()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "DataInstances and Classes count mismatch", v2, v3, v4, v5, v6);
}

void sub_1D9673370()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to read EAN", v2, v3, v4, v5, v6);
}

void sub_1D96733A4(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4);
  sub_1D966AAC8();
  _os_log_error_impl(&dword_1D9666000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%@", v6, 0xCu);
}

void sub_1D9673438(void *a1, char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v9 = 134218240;
  uint64_t v10 = objc_msgSend_count(a1, a2, (uint64_t)a3, a4);
  __int16 v11 = 2048;
  uint64_t v12 = objc_msgSend_count(a2, v6, v7, v8);
  _os_log_error_impl(&dword_1D9666000, a3, OS_LOG_TYPE_ERROR, "Live classes: %lu. Live instances: %lu", (uint8_t *)&v9, 0x16u);
}

void sub_1D96734E8()
{
  sub_1D966AAC8();
  sub_1D966AA68(&dword_1D9666000, v0, v1, "Missing live data: %@", v2, v3, v4, v5, v6);
}

void sub_1D9673550()
{
  sub_1D966AAD4();
  v3[0] = 67109378;
  v3[1] = v1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_1D9666000, v2, OS_LOG_TYPE_ERROR, "Read live data: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_1D96735E8()
{
  sub_1D966AAD4();
  sub_1D966AAB0();
  sub_1D966AA84(&dword_1D9666000, v1, v2, "Failed to read sealed property of %@: %@");
}

void sub_1D967365C()
{
  sub_1D966AAD4();
  sub_1D966AAB0();
  sub_1D966AA84(&dword_1D9666000, v1, v2, "Failed to read live property of %@: %@");
}

void sub_1D96736D0()
{
  sub_1D966AAD4();
  sub_1D966AAB0();
  sub_1D966AA84(&dword_1D9666000, v1, v2, "Failed to read sealed instances of %@: %@");
}

void sub_1D9673744()
{
  sub_1D966AAD4();
  sub_1D966AAB0();
  sub_1D966AA84(&dword_1D9666000, v1, v2, "Failed to read live instances of %@: %@");
}

void sub_1D96737B8(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_1D966AA68(&dword_1D9666000, a2, a3, "Failed to read live sensor number, error: %@", a5, a6, a7, a8, 2u);
}

void sub_1D9673834()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to create amfdr", v2, v3, v4, v5, v6);
}

void sub_1D9673868()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to create property value string", v2, v3, v4, v5, v6);
}

void sub_1D967389C()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to get 'SrvT' property", v2, v3, v4, v5, v6);
}

void sub_1D96738D0()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to read seal data", v2, v3, v4, v5, v6);
}

void sub_1D9673904()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "No EAN support.", v2, v3, v4, v5, v6);
}

void sub_1D9673938()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to create fdrLocal", v2, v3, v4, v5, v6);
}

void sub_1D967396C()
{
  sub_1D966AB04(*MEMORY[0x1E4F143B8]);
  sub_1D966AAF8();
  sub_1D966AA68(&dword_1D9666000, v0, v1, "Failed to get local manifest properties, error: %@", v2, v3, v4, v5, v6);
}

void sub_1D96739D4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "Error:%@", (uint8_t *)&v2, 0xCu);
}

void sub_1D9673A4C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9673AB8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D9666000, log, OS_LOG_TYPE_ERROR, "Faild to read OS Boot Hash from %@; error: %@",
    (uint8_t *)&v3,
    0x16u);
}

void sub_1D9673B40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9673BB0(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  int v3 = @"diagnostic-boot-intent";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "readNVRAMValueForKey %@ failed: %@", (uint8_t *)&v2, 0x16u);
}

void sub_1D9673C3C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9673CA8()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Failed to get boot intent purpose", v2, v3, v4, v5, v6);
}

void sub_1D9673CDC()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "SSR boot intent not found", v2, v3, v4, v5, v6);
}

void sub_1D9673D10()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Unexpected SSR boot intent purpose format", v2, v3, v4, v5, v6);
}

void sub_1D9673D44()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Unexpected SSR boot intent format", v2, v3, v4, v5, v6);
}

void sub_1D9673D78(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "Unable to find Application after:%d retries", (uint8_t *)v2, 8u);
}

void sub_1D9673DF0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D9666000, log, OS_LOG_TYPE_ERROR, "re building DB failed", v1, 2u);
}

void sub_1D9673E34()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Server cert validity check failed!", v2, v3, v4, v5, v6);
}

void sub_1D9673E68(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "SecTrustSetAnchorCertificates failed: %d", (uint8_t *)v2, 8u);
}

void sub_1D9673EE0()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "No policy.", v2, v3, v4, v5, v6);
}

void sub_1D9673F14()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "No server trust.", v2, v3, v4, v5, v6);
}

void sub_1D9673F48()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "No protection space.", v2, v3, v4, v5, v6);
}

void sub_1D9673F7C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9673FE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9674058(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9674090(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D96740FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D9666000, log, OS_LOG_TYPE_DEBUG, "SpTS:\n %@\n %@", (uint8_t *)&v3, 0x16u);
}

void sub_1D9674184(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D96741BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9674234(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D96742AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D9674324(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D967439C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D96743D4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1D966D118();
  _os_log_error_impl(&dword_1D9666000, v0, OS_LOG_TYPE_ERROR, "Product type %lx is not the expected product type %x", v1, 0x12u);
}

void sub_1D9674448(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch Internal Component Auth Status:%d", (uint8_t *)v2, 8u);
}

void sub_1D96744C0()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "IOREG Auth Component Timeout", v2, v3, v4, v5, v6);
}

void sub_1D96744F4()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "IOREG Auth Component Not Populated", v2, v3, v4, v5, v6);
}

void sub_1D9674528()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "queryRepairDelta timeout", v2, v3, v4, v5, v6);
}

void sub_1D967455C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D9666000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1D96745D4(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1D9666000, log, OS_LOG_TYPE_ERROR, "queryRepairDelta failed: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_1D9674660()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Cannot find camera service", v2, v3, v4, v5, v6);
}

void sub_1D9674694()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Audio failed with Speaker issue.", v2, v3, v4, v5, v6);
}

void sub_1D96746C8()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Audio failed with Codec issue.", v2, v3, v4, v5, v6);
}

void sub_1D96746FC()
{
  sub_1D966AAA4();
  sub_1D966AA4C(&dword_1D9666000, v0, v1, "Cannot find matched camera service", v2, v3, v4, v5, v6);
}

uint64_t AMFDRCreateTypeWithOptions()
{
  return MEMORY[0x1F417A558]();
}

uint64_t AMFDRCreateWithOptions()
{
  return MEMORY[0x1F417A560]();
}

uint64_t AMFDRDataCopyManifest()
{
  return MEMORY[0x1F417A568]();
}

uint64_t AMFDRDataCopySealingManifestProperty()
{
  return MEMORY[0x1F417A570]();
}

uint64_t AMFDRSealingManifestCopyDataClassesInstancesAndProperties()
{
  return MEMORY[0x1F417A578]();
}

uint64_t AMFDRSealingManifestCopyInstanceForClass()
{
  return MEMORY[0x1F417A580]();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return MEMORY[0x1F417A588]();
}

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return MEMORY[0x1F417A590]();
}

uint64_t AMFDRSealingMapCopyDataClassesAndInstancesWithAttribute()
{
  return MEMORY[0x1F417A598]();
}

uint64_t AMFDRSealingMapCopyDataClassesWithAttribute()
{
  return MEMORY[0x1F417A5A0]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x1F417A5A8]();
}

uint64_t AMFDRSealingMapCopyManifestProperties()
{
  return MEMORY[0x1F417A5B0]();
}

uint64_t AMFDRSealingMapCopyMultiInstanceForClass()
{
  return MEMORY[0x1F417A5B8]();
}

uint64_t AMFDRSealingMapCopyPropertyWithTag()
{
  return MEMORY[0x1F417A5C0]();
}

uint64_t AMFDRSealingMapPopulateSealingManifest()
{
  return MEMORY[0x1F417A5C8]();
}

uint64_t AMFDRSetOption()
{
  return MEMORY[0x1F417A5D0]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x1F417DDB0]();
}

uint64_t BC__getInfo()
{
  return MEMORY[0x1F4188778]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1F40E91F8](*(void *)&entry, entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

uint64_t SecPolicyCreateAppleAST2Service()
{
  return MEMORY[0x1F40F6FD0]();
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1F40F7190](trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F7230](trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

uint64_t ZhuGeCopyValue()
{
  return MEMORY[0x1F410A128]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t handleForCategory()
{
  return MEMORY[0x1F4114BF8]();
}

uint64_t isVeridianUpdateRequired()
{
  return MEMORY[0x1F4188780]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}