posix_spawnattr_t copyPOSIXSpawnAttributes()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  sigset_t v9;
  sigset_t v10;
  posix_spawnattr_t v11;

  v11 = 0;
  v9 = -1;
  v10 = -1;
  v0 = posix_spawnattr_init(&v11);
  if (v0)
  {
    v1 = v0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      copyPOSIXSpawnAttributes_cold_4(v1);
    }
  }
  else
  {
    v9 = -1;
    v10 = 0;
    v2 = posix_spawnattr_setsigmask(&v11, &v10);
    if (v2)
    {
      v3 = v2;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        copyPOSIXSpawnAttributes_cold_3(v3);
      }
    }
    else
    {
      v4 = posix_spawnattr_setsigdefault(&v11, &v9);
      if (v4)
      {
        v5 = v4;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          copyPOSIXSpawnAttributes_cold_2(v5);
        }
      }
      else
      {
        v6 = posix_spawnattr_setflags(&v11, 142);
        if (!v6) {
          return v11;
        }
        v7 = v6;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          copyPOSIXSpawnAttributes_cold_1(v7);
        }
      }
    }
  }
  if (v11) {
    posix_spawnattr_destroy(&v11);
  }
  return 0;
}

void sub_22CE7796C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSArray(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t hasEntitlementValue(void *a1, void *a2, void *a3)
{
  v5 = a1;
  id v6 = a2;
  CFErrorRef error = 0;
  v7 = SecTaskCreateFromSelf(0);
  v11 = v7;
  if (!v7)
  {
    v20 = createConditionInducerError((uint64_t)"hasEntitlementValue", 82, -1, 0, @"Failed to create task.", v8, v9, v10, v23);
    v16 = 0;
    goto LABEL_10;
  }
  v12 = (void *)SecTaskCopyValueForEntitlement(v7, v5, &error);
  v16 = v12;
  if (!v12)
  {
    createConditionInducerError((uint64_t)"hasEntitlementValue", 88, -1, error, @"Missing entitlement: %@", v13, v14, v15, (uint64_t)v5);
    v20 = LABEL_9:;
LABEL_10:
    uint64_t v21 = 0;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (([v12 isEqual:v6] & 1) == 0)
  {
    createConditionInducerError((uint64_t)"hasEntitlementValue", 94, -1, 0, @"Unexpected entitlement value (actual, expected): (%@, %@)", v17, v18, v19, (uint64_t)v16);
    goto LABEL_9;
  }
  v20 = 0;
  uint64_t v21 = 1;
  if (a3) {
LABEL_11:
  }
    *a3 = v20;
LABEL_12:
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (v11) {
    CFRelease(v11);
  }

  return v21;
}

id createConditionInducerError(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  uint64_t v14 = (objc_class *)MEMORY[0x263F089D8];
  id v15 = a5;
  v16 = (void *)[[v14 alloc] initWithFormat:v15 arguments:&a9];

  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v18 = v17;
  if (v16) {
    [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v13) {
    [v18 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  if (a1)
  {
    uint64_t v19 = [NSString stringWithUTF8String:a1];
    [v18 setObject:v19 forKeyedSubscript:@"FunctionName"];
  }
  if (a2)
  {
    v20 = [NSNumber numberWithInt:a2];
    [v18 setObject:v20 forKeyedSubscript:@"SourceLine"];
  }
  uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"kCOErrorDomain" code:a3 userInfo:v18];

  return v21;
}

uint64_t safeRemoveItemAtPath(void *a1, void *a2)
{
  id v3 = a1;
  v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (!v5)
  {
    id v8 = 0;
    goto LABEL_6;
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v15 = 0;
  char v7 = [v6 removeItemAtPath:v3 error:&v15];
  id v8 = v15;

  if (v7)
  {
LABEL_6:
    uint64_t v13 = 1;
    goto LABEL_7;
  }
  v12 = createConditionInducerError((uint64_t)"safeRemoveItemAtPath", 157, -1, v8, @"Failed to remove file (%@).", v9, v10, v11, (uint64_t)v3);

  if (a2)
  {
    id v8 = v12;
    uint64_t v13 = 0;
    *a2 = v8;
  }
  else
  {
    uint64_t v13 = 0;
    id v8 = v12;
  }
LABEL_7:

  return v13;
}

uint64_t safeRemoveItemAtPathWithRegex(void *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v10 = v6;
  if (!v5 || !v6)
  {
    createConditionInducerError((uint64_t)"safeRemoveItemAtPathWithRegex", 180, -1, 0, @"Invalid input(s).", v7, v8, v9, v34);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  id v42 = 0;
  uint64_t v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v6 options:1 error:&v42];
  id v15 = v42;
  if (!v11)
  {
    createConditionInducerError((uint64_t)"safeRemoveItemAtPathWithRegex", 188, -1, v15, @"Failed to allocate regex.", v12, v13, v14, v34);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
LABEL_20:
      uint64_t v31 = 0;
      goto LABEL_21;
    }
LABEL_18:
    id v18 = v18;
    uint64_t v31 = 0;
    *a3 = v18;
    goto LABEL_21;
  }
  v16 = [MEMORY[0x263F08850] defaultManager];
  id v41 = v15;
  id v17 = [v16 contentsOfDirectoryAtPath:v5 error:&v41];
  id v18 = v41;

  if (!v17)
  {
    uint64_t v32 = createConditionInducerError((uint64_t)"safeRemoveItemAtPathWithRegex", 194, -1, v18, @"Failed to query files at %@.", v19, v20, v21, (uint64_t)v5);

    id v18 = (id)v32;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  v35 = v10;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = v17;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v27, 0, 0, objc_msgSend(v27, "length")))
        {
          v28 = [MEMORY[0x263F08850] defaultManager];
          v29 = [v5 stringByAppendingPathComponent:v27];
          id v36 = v18;
          [v28 removeItemAtPath:v29 error:&v36];
          id v30 = v36;

          id v18 = v30;
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v24);
  }

  uint64_t v31 = 1;
  uint64_t v10 = v35;
LABEL_21:

  return v31;
}

id copy_calling_process_name()
{
  MEMORY[0x270FA5388]();
  uint64_t v11 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x1000uLL);
  memset(v9, 0, sizeof(v9));
  v0 = [MEMORY[0x263F08D68] currentConnection];
  id v1 = v0;
  if (v0) {
    pid_t v2 = [v0 processIdentifier];
  }
  else {
    pid_t v2 = getpid();
  }
  proc_pidpath(v2, buffer, 0x1000u);
  int v3 = strlen(buffer);
  uint64_t v4 = v3 - 1;
  do
  {
    BOOL v5 = __OFSUB__(v3--, 1);
    if (v3 < 0 != v5) {
      break;
    }
    int v6 = buffer[v4--];
  }
  while (v6 != 47);
  __strlcpy_chk();
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v9);

  return v7;
}

id _copySignpostLowSeverityLogHandle()
{
  if (_copySignpostLowSeverityLogHandle_onceToken != -1) {
    dispatch_once(&_copySignpostLowSeverityLogHandle_onceToken, &__block_literal_global);
  }
  v0 = (void *)_copySignpostLowSeverityLogHandle_log;

  return v0;
}

uint64_t ___copySignpostLowSeverityLogHandle_block_invoke()
{
  _copySignpostLowSeverityLogHandle_log = (uint64_t)os_log_create("com.apple.ConditionInducer.LowSeverity", "InduceCondition");

  return MEMORY[0x270F9A758]();
}

void sub_22CE794FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_1_0(id a1)
{
  return a1;
}

void sub_22CE7A0BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _dummySlowNetwork()
{
  v0 = objc_alloc_init(SlowNetworkCondition);
}

void _dummyThermalCondition()
{
  v0 = objc_alloc_init(ThermalNominal);
}

void _dummyGPUPerfStateCondition()
{
  v0 = objc_alloc_init(GPUPerformanceStateDefault);
}

void sub_22CE7DE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_22CE7ECD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_22CE7F1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22CE7F754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t _nlc_connect(_DWORD *a1)
{
  *(void *)sp = 0;
  uint64_t v2 = (mach_port_t *)MEMORY[0x263EF87F0];
  bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.NetworkLinkConditioner", sp);
  if (bootstrap_look_up(*v2, "com.apple.NetworkLinkConditioner", sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100;
  }
  else
  {
    mach_error_t v4 = nlc_connect(sp[0], a1, a1 + 1, &sp[1]);
    if (v4) {
      mach_error("nlc_connect:", v4);
    }
    return sp[1];
  }
}

uint64_t _nlc_disconnect(int *a1)
{
  unsigned int v4 = 0;
  mach_error_t v2 = nlc_disconnect(*a1, a1[1], &v4);
  if (v2) {
    mach_error("nlc_disconnect:", v2);
  }
  mach_port_deallocate(*MEMORY[0x263EF8960], *a1);
  return v4;
}

uint64_t _nlc_start_simulation(mach_port_name_t *a1, long long *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 0;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_simulate(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9) {
    mach_error("_nlc_start_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(mach_port_name_t *a1, long long *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 1;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_stop_simulation(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9) {
    mach_error("_nlc_stop_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(mach_port_name_t *a1, _DWORD *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  a2[1] = 2;
  size_t __n = 208;
  long long v4 = *((_OWORD *)a2 + 11);
  v14[10] = *((_OWORD *)a2 + 10);
  v14[11] = v4;
  v14[12] = *((_OWORD *)a2 + 12);
  long long v5 = *((_OWORD *)a2 + 7);
  v14[6] = *((_OWORD *)a2 + 6);
  v14[7] = v5;
  long long v6 = *((_OWORD *)a2 + 9);
  v14[8] = *((_OWORD *)a2 + 8);
  v14[9] = v6;
  long long v7 = *((_OWORD *)a2 + 3);
  v14[2] = *((_OWORD *)a2 + 2);
  v14[3] = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  v14[4] = *((_OWORD *)a2 + 4);
  v14[5] = v8;
  long long v9 = *((_OWORD *)a2 + 1);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v9;
  bzero(__src, 0x400uLL);
  mach_error_t status = nlc_get_status(*a1, (uint64_t)v14, 0xD0u, __src, &__n, a1[1], (_DWORD *)&__n + 1);
  if (status) {
    mach_error("_nlc_get_status:", status);
  }
  memcpy(a2, __src, __n);
  return HIDWORD(__n);
}

uint64_t nlc_connect(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  memset(v18, 0, sizeof(v18));
  *(_OWORD *)&rcv_name_12[4] = 0u;
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v13 = 5395;
  *(void *)rcv_name_12 = 0x9D4C00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v13);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 40368)
      {
        if (v13 < 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[8] == 1 && rcv_name == 56 && !rcv_name_4 && HIWORD(v18[0]) << 16 == 1114112)
          {
            uint64_t v10 = 0;
            int v11 = v18[3];
            *a2 = *(_DWORD *)&rcv_name_12[12];
            *a3 = v11;
            *a4 = v18[4];
            return v10;
          }
        }
        else if (rcv_name == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[16])
          {
            if (rcv_name_4) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&rcv_name_12[16];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v13);
      return v10;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  return v10;
}

uint64_t nlc_disconnect(int a1, int a2, _DWORD *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x9D4D00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
      return v7;
    }
    if (*(_DWORD *)&rcv_name[16] == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name[16] == 40369)
    {
      if ((v10 & 0x80000000) == 0)
      {
        if (*(_DWORD *)rcv_name == 40)
        {
          if (!*(_DWORD *)&rcv_name[4])
          {
            uint64_t v7 = *(unsigned int *)&rcv_name[28];
            if (!*(_DWORD *)&rcv_name[28])
            {
              *a3 = *(_DWORD *)&rcv_name[32];
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          if (*(_DWORD *)&rcv_name[4]) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = *(unsigned int *)&rcv_name[28];
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return v7;
  }
  mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  return v7;
}

uint64_t nlc_simulate(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  long long v17 = 0u;
  *((void *)&v17 + 1) = *MEMORY[0x263EF80C8];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    mach_port_name_t reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(void *)&long long v17 = 0x9D4E00000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      mach_port_name_t reply_port = rcv_name[3];
    }
    uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40370)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_stop_simulation(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  long long v17 = 0u;
  *((void *)&v17 + 1) = *MEMORY[0x263EF80C8];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    mach_port_name_t reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(void *)&long long v17 = 0x9D4F00000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      mach_port_name_t reply_port = rcv_name[3];
    }
    uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40371)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_get_status(mach_port_name_t a1, uint64_t a2, unsigned int a3, void *a4, _DWORD *a5, mach_port_name_t a6, _DWORD *a7)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)size_t __n = 0u;
  long long v27 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  long long v25 = 0u;
  *((void *)&v25 + 1) = *MEMORY[0x263EF80C8];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(__n[0]) = a3;
    uint64_t v14 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v15 = v14 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v14) = a6;
    mach_port_name_t reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(void *)&long long v25 = 0x9D5000000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      mach_port_name_t reply_port = rcv_name[3];
    }
    uint64_t v17 = mach_msg((mach_msg_header_t *)rcv_name, 3, v15, 0x434u, reply_port, 0, 0);
    uint64_t v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v7;
    }
    if (v17)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v7;
    }
    if (DWORD1(v25) == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (DWORD1(v25) == 40372)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
        {
          if (rcv_name[2]) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = LODWORD(__n[0]) == 0;
          }
          if (!v18 && rcv_name[1] == 36) {
            uint64_t v7 = LODWORD(__n[0]);
          }
          else {
            uint64_t v7 = 4294966996;
          }
          goto LABEL_27;
        }
        if (!rcv_name[2])
        {
          uint64_t v7 = LODWORD(__n[0]);
          if (LODWORD(__n[0])) {
            goto LABEL_27;
          }
          int v21 = HIDWORD(__n[0]);
          if (HIDWORD(__n[0]) <= 0x400)
          {
            uint64_t v7 = 4294966996;
            if (rcv_name[1] - 44 >= HIDWORD(__n[0]))
            {
              unsigned int v22 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (rcv_name[1] == v22 + 44)
              {
                long long v23 = (char *)&rcv_name[-256] + v22;
                memcpy(a4, &__n[1], HIDWORD(__n[0]));
                uint64_t v7 = 0;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }
            goto LABEL_27;
          }
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  return 4294966989;
}

uint64_t SetDVFSStates(mach_port_t a1, uint64_t *input)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = IOConnectCallMethod(a1, dword_268520B18, input, 5u, 0, 0, 0, 0, 0, 0);
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    SetDVFSStates_cold_1(v2);
  }
  return v2;
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void SetDVFSStates_cold_1(mach_error_t a1)
{
  uint64_t v1 = [NSString stringWithUTF8String:mach_error_string(a1)];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_22CE75000, &_os_log_internal, v2, "_setDVFSStates (0x%x - %@)", v3, v4, v5, v6, v7);
}

BOOL CallIO(mach_port_t a1, void *inputStruct, void *outputStruct, uint64_t a4)
{
  kern_return_t v5;
  BOOL v6;
  mach_error_t v7;
  size_t outputStructCnt;

  if (!a1) {
    return 0;
  }
  outputStructCnt = 8;
  uint64_t v5 = IOConnectCallStructMethod(a1, 0x41u, inputStruct, 8uLL, outputStruct, &outputStructCnt);
  uint64_t v6 = v5 == 0;
  if (v5)
  {
    uint8_t v7 = v5;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      CallIO_cold_2(a4, v7);
    }
  }
  else if (outputStructCnt != 8)
  {
    CallIO_cold_1();
  }
  return v6;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void CallIO_cold_1()
{
  __assert_rtn("CallIO", "GPUPerformanceState.m", 111, "outSize == sizeof(AGXConsistentPerfStateControl)");
}

void CallIO_cold_2(uint64_t a1, mach_error_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSString stringWithUTF8String:a1];
  uint64_t v4 = [NSString stringWithUTF8String:mach_error_string(a2)];
  v5[0] = 67109890;
  v5[1] = 65;
  __int16 v6 = 2112;
  uint8_t v7 = v3;
  __int16 v8 = 1024;
  mach_error_t v9 = a2;
  __int16 v10 = 2112;
  mach_msg_size_t v11 = v4;
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "IOConnectCallStructMethod method:%u for:%@ failed (0x%x - %@)", (uint8_t *)v5, 0x22u);
}

void copyPOSIXSpawnAttributes_cold_1(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v1, "posix_spawnattr_setflags failed: %d (%s)", v2, v3, v4, v5, v6);
}

void copyPOSIXSpawnAttributes_cold_2(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v1, "posix_spawnattr_setsigdefault failed: %d (%s)", v2, v3, v4, v5, v6);
}

void copyPOSIXSpawnAttributes_cold_3(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v1, "posix_spawnattr_setsigmask failed: %d (%s)", v2, v3, v4, v5, v6);
}

void copyPOSIXSpawnAttributes_cold_4(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v1, "posix_spawnattr_init failed: %d (%s)", v2, v3, v4, v5, v6);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return MEMORY[0x270EE54E0](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x270ED7D08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

int killpg(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F78](*(void *)&a1, *(void *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

const char **__cdecl objc_copyClassNamesForImage(const char *image, unsigned int *outCount)
{
  return (const char **)MEMORY[0x270F9A5C0](image, outCount);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
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

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x270EDAC80](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDAC98](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDACA0](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACA8](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACB8](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x270EDACC8](a1, a2);
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x270EDACE0](a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x270EDACE8](a1, a2);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x270EDB988](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x270EDBB40](*(void *)&a1, a2, *(void *)&a3, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}