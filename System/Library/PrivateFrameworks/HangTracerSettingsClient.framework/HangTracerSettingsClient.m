uint64_t keyWithPrefix(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@.%@", a2, a1];
}

id arrayOfCFPrefsWithPrefix(const __CFString *a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = a2;
  v6 = [NSString stringWithFormat:@"%@.", a3];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  CFArrayRef v8 = CFPreferencesCopyKeyList(a1, v5, (CFStringRef)*MEMORY[0x263EFFE50]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CFArrayRef v9 = v8;
  uint64_t v10 = [(__CFArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v14 hasPrefix:v6]) {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [(__CFArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v7;
}

id getPrefWithOverrideProfile(void *a1, void *a2)
{
  v3 = a1;
  v4 = NSString;
  id v5 = a2;
  v6 = [v4 stringWithFormat:@"HTProfile.%@", v3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v8 = v7;
  }
  else
  {
    CFArrayRef v9 = (void *)CFPreferencesCopyValue(v3, (CFStringRef)*MEMORY[0x263F42798], (CFStringRef)*MEMORY[0x263F428C8], (CFStringRef)*MEMORY[0x263EFFE50]);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      id v8 = v9;
    }
    else {
      id v8 = 0;
    }
  }

  return v8;
}

id HTTerminationAllAvailableReasons()
{
  if (HTTerminationAllAvailableReasons_onceToken != -1) {
    dispatch_once(&HTTerminationAllAvailableReasons_onceToken, &__block_literal_global);
  }
  v0 = (void *)HTTerminationAllAvailableReasons_allReasons;

  return v0;
}

void __HTTerminationAllAvailableReasons_block_invoke()
{
  id v5 = [MEMORY[0x263EFF980] array];
  unint64_t v0 = 2;
  do
  {
    v1 = [NSNumber numberWithUnsignedLongLong:v0];
    [v5 addObject:v1];

    unint64_t v2 = v0 >> 41;
    v0 *= 2;
  }
  while (!v2);
  uint64_t v3 = [v5 copy];
  v4 = (void *)HTTerminationAllAvailableReasons_allReasons;
  HTTerminationAllAvailableReasons_allReasons = v3;
}

__CFString *HTTerminationReasonDisplayName(unint64_t a1)
{
  return exitNamespaceDisplayString(__clz(__rbit64(a1)) & 0x3F);
}

id HTTerminationSubReasonDisplayName(unint64_t a1, int64_t a2)
{
  switch(a1)
  {
    case 0x100000uLL:
      unint64_t v4 = __clz(__rbit64(a2));
      if (!a2) {
        unint64_t v4 = -1;
      }
      if (a2 == 0x100000) {
        uint64_t v3 = 1001;
      }
      else {
        uint64_t v3 = v4;
      }
      break;
    case 0x8000uLL:
      if (a2 > 255)
      {
        if (a2 > 4095)
        {
          if (a2 >= 0x4000)
          {
            if (a2 == 0x4000)
            {
              uint64_t v3 = 97132013;
              break;
            }
            if (a2 == 0x8000)
            {
              uint64_t v3 = 2970726673;
              break;
            }
          }
          else
          {
            if (a2 == 4096)
            {
              uint64_t v3 = 562215635;
              break;
            }
            if (a2 == 0x2000)
            {
              uint64_t v3 = 562215636;
              break;
            }
          }
          goto LABEL_71;
        }
        if (a2 <= 1023)
        {
          if (a2 == 256)
          {
            uint64_t v3 = 3490524077;
            break;
          }
          if (a2 == 512)
          {
            uint64_t v3 = 2970405393;
            break;
          }
          goto LABEL_71;
        }
        if (a2 != 1024)
        {
          if (a2 == 2048)
          {
            uint64_t v3 = 562215634;
            break;
          }
          goto LABEL_71;
        }
        unsigned __int16 v8 = 25858;
LABEL_82:
        uint64_t v3 = v8 | 0xDEAD0000;
        break;
      }
      if (a2 > 15)
      {
        if (a2 > 63)
        {
          if (a2 != 64)
          {
            if (a2 == 128)
            {
              uint64_t v3 = 562215597;
              break;
            }
            goto LABEL_71;
          }
          goto LABEL_70;
        }
        if (a2 == 16)
        {
LABEL_44:
          uint64_t v3 = 3221229823;
          break;
        }
        if (a2 == 32)
        {
LABEL_69:
          unsigned __int16 v8 = 4300;
          goto LABEL_82;
        }
LABEL_71:
        unint64_t v9 = __clz(__rbit64(a2));
        if (a2) {
          uint64_t v3 = v9;
        }
        else {
          uint64_t v3 = -1;
        }
        break;
      }
      if (a2 == 2)
      {
        uint64_t v3 = 0;
        break;
      }
      if (a2 == 4)
      {
LABEL_68:
        uint64_t v3 = 2343432205;
        break;
      }
      if (a2 != 8) {
        goto LABEL_71;
      }
LABEL_52:
      unsigned __int16 v8 = -1519;
      goto LABEL_82;
    case 0x400uLL:
      if (a2 > 255)
      {
        if (a2 <= 2047)
        {
          switch(a2)
          {
            case 256:
              uint64_t v3 = 439025681;
              goto LABEL_83;
            case 512:
              uint64_t v3 = 1539435073;
              goto LABEL_83;
            case 1024:
              uint64_t v3 = 1539435076;
              goto LABEL_83;
          }
        }
        else if (a2 >= 0x2000)
        {
          if (a2 == 0x2000)
          {
            uint64_t v3 = 3306925314;
            break;
          }
          if (a2 == 0x4000)
          {
            uint64_t v3 = 3306925315;
            break;
          }
        }
        else
        {
          if (a2 == 2048)
          {
            uint64_t v3 = 1539435077;
            break;
          }
          if (a2 == 4096)
          {
            uint64_t v3 = 3306925313;
            break;
          }
        }
        goto LABEL_71;
      }
      if (a2 > 15)
      {
        if (a2 <= 63)
        {
          if (a2 != 16)
          {
            if (a2 == 32)
            {
              uint64_t v3 = 4227595259;
              break;
            }
            goto LABEL_71;
          }
LABEL_70:
          uint64_t v3 = 732775916;
          break;
        }
        if (a2 != 64)
        {
          if (a2 == 128)
          {
            uint64_t v3 = 95805101;
            break;
          }
          goto LABEL_71;
        }
        goto LABEL_69;
      }
      if (a2 != 2)
      {
        if (a2 != 4)
        {
          if (a2 == 8) {
            goto LABEL_44;
          }
          goto LABEL_71;
        }
        goto LABEL_68;
      }
      goto LABEL_52;
    default:
      unint64_t v5 = __clz(__rbit64(a2));
      if (a2) {
        unint64_t v6 = v5 + 1;
      }
      else {
        unint64_t v6 = 0;
      }
      uint64_t v7 = -2;
      if (a1 != 2) {
        uint64_t v7 = -1;
      }
      uint64_t v3 = v6 + v7;
      break;
  }
LABEL_83:
  uint64_t v10 = exitReasonDisplayString(__clz(__rbit64(a1)) & 0x3F, v3);
  return v10;
}

uint64_t HTTerminationSubReasonShiftingForReason(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

id HTTerminationAllAvailableSubReasonsForReason(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFFA68];
  if (a1 >= 0x8000)
  {
    if (a1 < 0x400000)
    {
      if (a1 == 0x8000)
      {
        uint64_t v2 = [MEMORY[0x263EFF980] array];
        unint64_t v26 = 2;
        do
        {
          v27 = [NSNumber numberWithUnsignedLongLong:v26];
          [v2 addObject:v27];

          BOOL v15 = v26 > 0x4000;
          v26 *= 2;
        }
        while (!v15);
        goto LABEL_76;
      }
      if (a1 == 0x40000)
      {
        uint64_t v2 = [MEMORY[0x263EFF980] array];
        unint64_t v28 = 2;
        do
        {
          v29 = [NSNumber numberWithUnsignedLongLong:v28];
          [v2 addObject:v29];

          BOOL v5 = v28 >= 0x11;
          v28 *= 2;
        }
        while (!v5);
        goto LABEL_76;
      }
      if (a1 != 0x100000) {
        goto LABEL_77;
      }
      uint64_t v2 = [MEMORY[0x263EFF980] array];
      unint64_t v10 = 2;
      do
      {
        uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v10];
        [v2 addObject:v11];

        BOOL v5 = v10 >= 3;
        v10 *= 2;
      }
      while (!v5);
      uint64_t v12 = &unk_2701CBD98;
    }
    else
    {
      if (a1 <= 0x7FFFFFF)
      {
        if (a1 == 0x400000)
        {
          uint64_t v2 = [MEMORY[0x263EFF980] array];
          unint64_t v20 = 2;
          do
          {
            uint64_t v21 = [NSNumber numberWithUnsignedLongLong:v20];
            [v2 addObject:v21];

            BOOL v5 = v20 >= 3;
            v20 *= 2;
          }
          while (!v5);
        }
        else
        {
          if (a1 != 0x800000) {
            goto LABEL_77;
          }
          uint64_t v2 = [MEMORY[0x263EFF980] array];
          unint64_t v6 = 2;
          do
          {
            uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v6];
            [v2 addObject:v7];

            BOOL v5 = v6 >= 0x11;
            v6 *= 2;
          }
          while (!v5);
        }
        goto LABEL_76;
      }
      if (a1 == 0x8000000)
      {
        uint64_t v2 = [MEMORY[0x263EFF980] array];
        unint64_t v32 = 2;
        do
        {
          v33 = [NSNumber numberWithUnsignedLongLong:v32];
          [v2 addObject:v33];

          BOOL v5 = v32 >= 5;
          v32 *= 2;
        }
        while (!v5);
        goto LABEL_76;
      }
      if (a1 != 0x100000000) {
        goto LABEL_77;
      }
      uint64_t v2 = [MEMORY[0x263EFF980] array];
      unint64_t v16 = 2;
      do
      {
        long long v17 = [NSNumber numberWithUnsignedLongLong:v16];
        [v2 addObject:v17];

        BOOL v15 = v16 > 0x2000;
        v16 *= 2;
      }
      while (!v15);
      [v2 addObject:&unk_2701CBD98];
      uint64_t v12 = &unk_2701CBDB0;
    }
  }
  else
  {
    if (a1 <= 63)
    {
      switch(a1)
      {
        case 2:
          uint64_t v2 = [MEMORY[0x263EFF980] array];
          unint64_t v22 = 2;
          do
          {
            v23 = [NSNumber numberWithUnsignedLongLong:v22];
            [v2 addObject:v23];

            BOOL v15 = v22 > 0x8000;
            v22 *= 2;
          }
          while (!v15);
          break;
        case 4:
          uint64_t v2 = [MEMORY[0x263EFF980] array];
          unint64_t v24 = 2;
          do
          {
            v25 = [NSNumber numberWithUnsignedLongLong:v24];
            [v2 addObject:v25];

            BOOL v5 = v24 >= 0x40000001;
            v24 *= 2;
          }
          while (!v5);
          break;
        case 8:
          uint64_t v2 = [MEMORY[0x263EFF980] array];
          unint64_t v8 = 2;
          do
          {
            unint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8];
            [v2 addObject:v9];

            BOOL v5 = v8 >= 9;
            v8 *= 2;
          }
          while (!v5);
          break;
        default:
          goto LABEL_77;
      }
      goto LABEL_76;
    }
    if (a1 > 511)
    {
      if (a1 == 512)
      {
        uint64_t v2 = [MEMORY[0x263EFF980] array];
        unint64_t v30 = 2;
        do
        {
          v31 = [NSNumber numberWithUnsignedLongLong:v30];
          [v2 addObject:v31];

          BOOL v15 = v30 > 0x40000;
          v30 *= 2;
        }
        while (!v15);
      }
      else
      {
        if (a1 != 1024) {
          goto LABEL_77;
        }
        uint64_t v2 = [MEMORY[0x263EFF980] array];
        unint64_t v13 = 2;
        do
        {
          v14 = [NSNumber numberWithUnsignedLongLong:v13];
          [v2 addObject:v14];

          BOOL v15 = v13 > 0x2000;
          v13 *= 2;
        }
        while (!v15);
      }
      goto LABEL_76;
    }
    if (a1 != 64)
    {
      if (a1 != 128) {
        goto LABEL_77;
      }
      uint64_t v2 = [MEMORY[0x263EFF980] array];
      unint64_t v3 = 2;
      do
      {
        unint64_t v4 = [NSNumber numberWithUnsignedLongLong:v3];
        [v2 addObject:v4];

        BOOL v5 = v3 >= 0x101;
        v3 *= 2;
      }
      while (!v5);
      goto LABEL_76;
    }
    uint64_t v2 = [MEMORY[0x263EFF980] array];
    unint64_t v18 = 2;
    do
    {
      long long v19 = [NSNumber numberWithUnsignedLongLong:v18];
      [v2 addObject:v19];

      BOOL v5 = v18 >= 0x41;
      v18 *= 2;
    }
    while (!v5);
    uint64_t v12 = &unk_2701CBD80;
  }
  [v2 addObject:v12];
LABEL_76:
  v1 = (void *)[v2 copy];

LABEL_77:

  return v1;
}

void HTAnalyticsSendEventLazy(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  BOOL v5 = (void (*)(id, id))getAnalyticsSendEventLazySymbolLoc_ptr;
  uint64_t v11 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v7[3] = &unk_265353D48;
    v7[4] = &v8;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)v7);
    BOOL v5 = (void (*)(id, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    unint64_t v6 = (_Unwind_Exception *)HTAnalyticsSendEventLazy_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v5(v3, v4);
}

uint64_t CoreAnalyticsLibraryCore()
{
  if (!CoreAnalyticsLibraryCore_frameworkLibrary) {
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreAnalyticsLibraryCore_frameworkLibrary;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreAnalyticsLibraryCore();
  if (!v2)
  {
    id v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HTLevelForHangDuration(double a1)
{
  uint64_t v2 = [MEMORY[0x263F427A8] sharedPrefs];
  unint64_t v3 = [v2 runloopHangTimeoutDurationMSec];

  if ((double)v3 * 0.555555556 <= a1) {
    return 2;
  }
  else {
    return (double)v3 * 0.222222222 <= a1;
  }
}

id stringFromXpcDictionary(void *a1, id a2)
{
  id v3 = a2;
  id v4 = a1;
  string = xpc_dictionary_get_string(v4, (const char *)[v3 UTF8String]);

  if (string)
  {
    unint64_t v6 = [NSString stringWithUTF8String:string];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

void sub_250BBAE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id location,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
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

void sub_250BBB0B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_250BBB25C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __requestWithLogFile_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 dataUsingEncoding:4];
  [v2 appendData:v3];
}

Class __getNEVPNManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!NetworkExtensionLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __NetworkExtensionLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265353EF8;
    uint64_t v6 = 0;
    NetworkExtensionLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!NetworkExtensionLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("NEVPNManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getNEVPNManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNEVPNManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NetworkExtensionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NetworkExtensionLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_250BBC618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id getDataTypePaths()
{
  if (getDataTypePaths_onceToken != -1) {
    dispatch_once(&getDataTypePaths_onceToken, &__block_literal_global_3);
  }
  unint64_t v0 = (void *)getDataTypePaths__dataPathsArray;

  return v0;
}

void sub_250BBD4F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42(uint64_t a1)
{
}

void __getDataTypePaths_block_invoke()
{
  id v3 = (id)objc_opt_new();
  for (uint64_t i = 0; i != 3; ++i)
    [v3 addObject:off_2653540B0[_kAllHangsDataTypes[i]]];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  uint64_t v2 = (void *)getDataTypePaths__dataPathsArray;
  getDataTypePaths__dataPathsArray = v1;
}

uint64_t __filterDeveloperAppsPredicate_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 processRecord];
  if (v3)
  {
    id v4 = [v2 processRecord];
    uint64_t v5 = [v4 isDeveloperApp];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_250BBE25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_250BBE744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id savedSettingPrefixedDefaultsKey(uint64_t a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = *MEMORY[0x263F42828];
  id v3 = keyWithPrefix(a1, *MEMORY[0x263F42830]);
  id v4 = [v1 stringWithFormat:@"%@.%@", v2, v3];

  return v4;
}

void __bootSessionUUID_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  memset(v3, 0, sizeof(v3));
  size_t v2 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", v3, &v2, 0, 0))
  {
    uint64_t v0 = [NSString stringWithUTF8String:v3];
    uint64_t v1 = (void *)bootSessionUUID_bootUUID;
    bootSessionUUID_bootUUID = v0;
  }
}

id shared_ht_log_handle()
{
  if (shared_ht_log_handle_onceToken != -1) {
    dispatch_once(&shared_ht_log_handle_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)shared_ht_log_handle___ht_log_handle;

  return v0;
}

uint64_t __shared_ht_log_handle_block_invoke()
{
  shared_ht_log_handle___ht_log_handle = (uint64_t)os_log_create("com.apple.hangtracer", "");

  return MEMORY[0x270F9A758]();
}

uint64_t applyTailspinConfig(uint64_t a1)
{
  size_t v2 = shared_ht_log_handle();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_250BB6000, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: change tailspin config", buf, 2u);
    }

    return tailspin_config_apply_sync();
  }
  else
  {
    if (v3)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_250BB6000, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: provided desiredConfig is null", v5, 2u);
    }

    return 0;
  }
}

uint64_t configureTailspinForSelfEnableConfig()
{
  uint64_t v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v2 = 0;
    _os_log_impl(&dword_250BB6000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForSelfEnableConfig not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForEPL()
{
  uint64_t v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v2 = 0;
    _os_log_impl(&dword_250BB6000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForEPL not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForThirdPartyDevelopment(int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  size_t v2 = arrayOfCFPrefsWithPrefix((const __CFString *)*MEMORY[0x263F42798], (void *)*MEMORY[0x263F428C8], *MEMORY[0x263F42820]);
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = shared_ht_log_handle();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      return 0;
    }
    int v12 = 136315138;
    unint64_t v13 = "configureTailspinForThirdPartyDevelopment";
    uint64_t v5 = "%s: Not configuring tailspin since EPL is active";
    uint64_t v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
LABEL_4:
    _os_log_impl(&dword_250BB6000, v6, v7, v5, (uint8_t *)&v12, 0xCu);
    goto LABEL_5;
  }
  uint64_t v9 = tailspin_config_create_with_default_config();
  if (!v9)
  {
    uint64_t v4 = shared_ht_log_handle();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v12 = 136315138;
    unint64_t v13 = "configureTailspinForThirdPartyDevelopment";
    uint64_t v5 = "%s: Failed to create tailspin config object";
    uint64_t v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_4;
  }
  uint64_t v10 = v9;
  if (a1)
  {
    tailspin_enabled_set();
    tailspin_buffer_size_set();
    tailspin_oncore_sampling_period_set();
    tailspin_full_sampling_period_set();
  }
  uint64_t v11 = applyTailspinConfig(v10);
  MEMORY[0x253383D90](v10);
  return v11;
}

id HTSettingsBundle()
{
  uint64_t v0 = (void *)HTSettingsBundle_bundle;
  if (!HTSettingsBundle_bundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    size_t v2 = (void *)HTSettingsBundle_bundle;
    HTSettingsBundle_bundle = v1;

    uint64_t v0 = (void *)HTSettingsBundle_bundle;
  }

  return v0;
}

id HTUISettingsGroupTitle()
{
  uint64_t v0 = (void *)HTUISettingsGroupTitle_str;
  if (!HTUISettingsGroupTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Performance Testing" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUISettingsGroupTitle_str;
    HTUISettingsGroupTitle_str = v2;

    uint64_t v0 = (void *)HTUISettingsGroupTitle_str;
  }

  return v0;
}

id HTUISettingsTitle()
{
  uint64_t v0 = (void *)HTUISettingsTitle_str;
  if (!HTUISettingsTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Hang Detection" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUISettingsTitle_str;
    HTUISettingsTitle_str = v2;

    uint64_t v0 = (void *)HTUISettingsTitle_str;
  }

  return v0;
}

id HTUIActivationToggleTitle()
{
  uint64_t v0 = (void *)HTUIActivationToggleTitle_str;
  if (!HTUIActivationToggleTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Enable Hang Detection" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIActivationToggleTitle_str;
    HTUIActivationToggleTitle_str = v2;

    uint64_t v0 = (void *)HTUIActivationToggleTitle_str;
  }

  return v0;
}

id HTUIActivationToggleFooterPartJoiner_Part1_Part2()
{
  uint64_t v0 = (void *)HTUIActivationToggleFooterPartJoiner_Part1_Part2_str;
  if (!HTUIActivationToggleFooterPartJoiner_Part1_Part2_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"HTUIActivationToggleFooterPartJoiner" value:@"%@ %@" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIActivationToggleFooterPartJoiner_Part1_Part2_str;
    HTUIActivationToggleFooterPartJoiner_Part1_Part2_str = v2;

    uint64_t v0 = (void *)HTUIActivationToggleFooterPartJoiner_Part1_Part2_str;
  }

  return v0;
}

id HTUIActivationToggleFooterPart1()
{
  uint64_t v0 = (void *)HTUIActivationToggleFooterPart1_string;
  if (!HTUIActivationToggleFooterPart1_string)
  {
    uint64_t v1 = NSString;
    uint64_t v2 = HTSettingsBundle();
    uint64_t v3 = [v2 localizedStringForKey:@"HTUIActivationToggleFooterPart1" value:@"Detect and capture diagnostic logs for hangs greater than %ld milliseconds in monitored apps." table:&stru_2701C7158];
    uint64_t v4 = objc_msgSend(v1, "localizedStringWithFormat:", v3, 250);
    uint64_t v5 = (void *)HTUIActivationToggleFooterPart1_string;
    HTUIActivationToggleFooterPart1_string = v4;

    uint64_t v0 = (void *)HTUIActivationToggleFooterPart1_string;
  }

  return v0;
}

id HTUIActivationToggleFooterPart2()
{
  uint64_t v0 = (void *)HTUIActivationToggleFooterPart2_str;
  if (!HTUIActivationToggleFooterPart2_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"HTUIActivationToggleFooterPart2" value:@"Learn More…" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIActivationToggleFooterPart2_str;
    HTUIActivationToggleFooterPart2_str = v2;

    uint64_t v0 = (void *)HTUIActivationToggleFooterPart2_str;
  }

  return v0;
}

id HTUIActivationToggleFooterShort()
{
  uint64_t v0 = (void *)HTUIActivationToggleFooterShort_str;
  if (!HTUIActivationToggleFooterShort_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"HTUIActivationToggleFooterShort" value:@"Detect and capture diagnostics for hangs in monitored apps. [Learn More…](https://apple.com)" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIActivationToggleFooterShort_str;
    HTUIActivationToggleFooterShort_str = v2;

    uint64_t v0 = (void *)HTUIActivationToggleFooterShort_str;
  }

  return v0;
}

id HTUIThresholdFooter()
{
  uint64_t v0 = (void *)HTUIThresholdFooter_string;
  if (!HTUIThresholdFooter_string)
  {
    uint64_t v1 = NSString;
    uint64_t v2 = HTSettingsBundle();
    uint64_t v3 = [v2 localizedStringForKey:@"Detect hangs crossing this duration threshold.\nThe default is %ld milliseconds." value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v4 = objc_msgSend(v1, "localizedStringWithFormat:", v3, 500);
    uint64_t v5 = (void *)HTUIThresholdFooter_string;
    HTUIThresholdFooter_string = v4;

    uint64_t v0 = (void *)HTUIThresholdFooter_string;
  }

  return v0;
}

__CFString *HTUIInternalRedirect()
{
  uint64_t v0 = (__CFString *)HTUIInternalRedirect_str;
  if (!HTUIInternalRedirect_str)
  {
    HTUIInternalRedirect_str = @"\n\nINTERNAL: Hang detection is enabled for all apps on internal builds. Open *Internal Settings* to turn on the HUD and see recent hang logs.";

    uint64_t v0 = @"\n\nINTERNAL: Hang detection is enabled for all apps on internal builds. Open *Internal Settings* to turn on the HUD and see recent hang logs.";
  }

  return v0;
}

id HTUILogsSectionTitle()
{
  uint64_t v0 = (void *)HTUILogsSectionTitle_str;
  if (!HTUILogsSectionTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Available Hang Logs" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILogsSectionTitle_str;
    HTUILogsSectionTitle_str = v2;

    uint64_t v0 = (void *)HTUILogsSectionTitle_str;
  }

  return v0;
}

id HTUIAppsSectionTitle()
{
  uint64_t v0 = (void *)HTUIAppsSectionTitle_str;
  if (!HTUIAppsSectionTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Monitored Apps" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIAppsSectionTitle_str;
    HTUIAppsSectionTitle_str = v2;

    uint64_t v0 = (void *)HTUIAppsSectionTitle_str;
  }

  return v0;
}

id HTUIAppsSectionFooter()
{
  uint64_t v0 = (void *)HTUIAppsSectionFooter_str;
  if (!HTUIAppsSectionFooter_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Only apps installed by Xcode, by TestFlight, or via the enterprise program are monitored for hangs.", &stru_2701C7158, &stru_2701C7158 value table];
    uint64_t v3 = (void *)HTUIAppsSectionFooter_str;
    HTUIAppsSectionFooter_str = v2;

    uint64_t v0 = (void *)HTUIAppsSectionFooter_str;
  }

  return v0;
}

__CFString *HTUIAppsSectionFooterInternal()
{
  uint64_t v0 = (__CFString *)HTUIAppsSectionFooterInternal_str;
  if (!HTUIAppsSectionFooterInternal_str)
  {
    HTUIAppsSectionFooterInternal_str = @"All apps are monitored on internal builds.";

    uint64_t v0 = @"All apps are monitored on internal builds.";
  }

  return v0;
}

id HTUILogsThresholdSelectorTitle()
{
  uint64_t v0 = (void *)HTUILogsThresholdSelectorTitle_str;
  if (!HTUILogsThresholdSelectorTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Hang Threshold" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILogsThresholdSelectorTitle_str;
    HTUILogsThresholdSelectorTitle_str = v2;

    uint64_t v0 = (void *)HTUILogsThresholdSelectorTitle_str;
  }

  return v0;
}

id HTUIDurationLabel()
{
  uint64_t v0 = (void *)HTUIDurationLabel_str;
  if (!HTUIDurationLabel_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Duration" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIDurationLabel_str;
    HTUIDurationLabel_str = v2;

    uint64_t v0 = (void *)HTUIDurationLabel_str;
  }

  return v0;
}

id HTUITimestampLabel()
{
  uint64_t v0 = (void *)HTUITimestampLabel_str;
  if (!HTUITimestampLabel_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Timestamp" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUITimestampLabel_str;
    HTUITimestampLabel_str = v2;

    uint64_t v0 = (void *)HTUITimestampLabel_str;
  }

  return v0;
}

id HTUIFileFormatTailspin()
{
  uint64_t v0 = (void *)HTUIFileFormatTailspin_str;
  if (!HTUIFileFormatTailspin_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Tailspin" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIFileFormatTailspin_str;
    HTUIFileFormatTailspin_str = v2;

    uint64_t v0 = (void *)HTUIFileFormatTailspin_str;
  }

  return v0;
}

id HTUIFileFormatSpindump()
{
  uint64_t v0 = (void *)HTUIFileFormatSpindump_str;
  if (!HTUIFileFormatSpindump_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Spindump" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIFileFormatSpindump_str;
    HTUIFileFormatSpindump_str = v2;

    uint64_t v0 = (void *)HTUIFileFormatSpindump_str;
  }

  return v0;
}

id HTUIFileFormatSpindumpSymbolicated()
{
  uint64_t v0 = (void *)HTUIFileFormatSpindumpSymbolicated_str;
  if (!HTUIFileFormatSpindumpSymbolicated_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Spindump (Symbolicated)" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIFileFormatSpindumpSymbolicated_str;
    HTUIFileFormatSpindumpSymbolicated_str = v2;

    uint64_t v0 = (void *)HTUIFileFormatSpindumpSymbolicated_str;
  }

  return v0;
}

id HTUIPlaceholderUnknownProcess()
{
  uint64_t v0 = (void *)HTUIPlaceholderUnknownProcess_str;
  if (!HTUIPlaceholderUnknownProcess_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Unknown Process" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIPlaceholderUnknownProcess_str;
    HTUIPlaceholderUnknownProcess_str = v2;

    uint64_t v0 = (void *)HTUIPlaceholderUnknownProcess_str;
  }

  return v0;
}

id HTUIPlaceholderNoLogs()
{
  uint64_t v0 = (void *)HTUIPlaceholderNoLogs_str;
  if (!HTUIPlaceholderNoLogs_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"No hangs detected" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIPlaceholderNoLogs_str;
    HTUIPlaceholderNoLogs_str = v2;

    uint64_t v0 = (void *)HTUIPlaceholderNoLogs_str;
  }

  return v0;
}

id HTUIPlaceholderNoApps()
{
  uint64_t v0 = (void *)HTUIPlaceholderNoApps_str;
  if (!HTUIPlaceholderNoApps_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"No monitored apps" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIPlaceholderNoApps_str;
    HTUIPlaceholderNoApps_str = v2;

    uint64_t v0 = (void *)HTUIPlaceholderNoApps_str;
  }

  return v0;
}

id HTUISelectButton()
{
  uint64_t v0 = (void *)HTUISelectButton_str;
  if (!HTUISelectButton_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Select" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUISelectButton_str;
    HTUISelectButton_str = v2;

    uint64_t v0 = (void *)HTUISelectButton_str;
  }

  return v0;
}

id HTUIShareButton()
{
  uint64_t v0 = (void *)HTUIShareButton_str;
  if (!HTUIShareButton_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Share" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIShareButton_str;
    HTUIShareButton_str = v2;

    uint64_t v0 = (void *)HTUIShareButton_str;
  }

  return v0;
}

__CFString *HTUISymbolicateFileButton()
{
  uint64_t v0 = (__CFString *)HTUISymbolicateFileButton_str;
  if (!HTUISymbolicateFileButton_str)
  {
    HTUISymbolicateFileButton_str = @"Symbolicate";

    uint64_t v0 = @"Symbolicate";
  }

  return v0;
}

__CFString *HTUISeeSymbolicatedFileButton()
{
  uint64_t v0 = (__CFString *)HTUISeeSymbolicatedFileButton_str;
  if (!HTUISeeSymbolicatedFileButton_str)
  {
    HTUISeeSymbolicatedFileButton_str = @"View Symbolicated Log";

    uint64_t v0 = @"View Symbolicated Log";
  }

  return v0;
}

id HTUIFetchingAppsErrorTitle()
{
  uint64_t v0 = (void *)HTUIFetchingAppsErrorTitle_str;
  if (!HTUIFetchingAppsErrorTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Unable to load apps" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIFetchingAppsErrorTitle_str;
    HTUIFetchingAppsErrorTitle_str = v2;

    uint64_t v0 = (void *)HTUIFetchingAppsErrorTitle_str;
  }

  return v0;
}

id HTUIFetchingAppsErrorMessage()
{
  uint64_t v0 = (void *)HTUIFetchingAppsErrorMessage_str;
  if (!HTUIFetchingAppsErrorMessage_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"There was an error trying to fetch the list of developer apps that are currently being monitored." value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIFetchingAppsErrorMessage_str;
    HTUIFetchingAppsErrorMessage_str = v2;

    uint64_t v0 = (void *)HTUIFetchingAppsErrorMessage_str;
  }

  return v0;
}

id HTUIFetchingHangsErrorTitle()
{
  uint64_t v0 = (void *)HTUIFetchingHangsErrorTitle_str;
  if (!HTUIFetchingHangsErrorTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Unable to load hang events" value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIFetchingHangsErrorTitle_str;
    HTUIFetchingHangsErrorTitle_str = v2;

    uint64_t v0 = (void *)HTUIFetchingHangsErrorTitle_str;
  }

  return v0;
}

id HTUIFetchingHangsErrorMessage()
{
  uint64_t v0 = (void *)HTUIFetchingHangsErrorMessage_str;
  if (!HTUIFetchingHangsErrorMessage_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"There was an error trying to find the list of hangs that occurred recently." value:&stru_2701C7158 table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIFetchingHangsErrorMessage_str;
    HTUIFetchingHangsErrorMessage_str = v2;

    uint64_t v0 = (void *)HTUIFetchingHangsErrorMessage_str;
  }

  return v0;
}

id HTUIDialogCancelButton()
{
  uint64_t v0 = (void *)HTUIDialogCancelButton_str;
  if (!HTUIDialogCancelButton_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"HTUIDialogCancelButton" value:@"Cancel" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIDialogCancelButton_str;
    HTUIDialogCancelButton_str = v2;

    uint64_t v0 = (void *)HTUIDialogCancelButton_str;
  }

  return v0;
}

id HTUIDialogOKButton()
{
  uint64_t v0 = (void *)HTUIDialogOKButton_str;
  if (!HTUIDialogOKButton_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"HTUIDialogOKButton" value:@"OK" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUIDialogOKButton_str;
    HTUIDialogOKButton_str = v2;

    uint64_t v0 = (void *)HTUIDialogOKButton_str;
  }

  return v0;
}

id HTUILearnMoreTitle()
{
  uint64_t v0 = (void *)HTUILearnMoreTitle_str;
  if (!HTUILearnMoreTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_00" value:@"About Hang Detection" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreTitle_str;
    HTUILearnMoreTitle_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreTitle_str;
  }

  return v0;
}

id HTUILearnMoreWhatAreHangsTitle()
{
  uint64_t v0 = (void *)HTUILearnMoreWhatAreHangsTitle_str;
  if (!HTUILearnMoreWhatAreHangsTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_01" value:@"Hang Detection" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreWhatAreHangsTitle_str;
    HTUILearnMoreWhatAreHangsTitle_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreWhatAreHangsTitle_str;
  }

  return v0;
}

id HTUILearnMoreWhatAreHangsContent()
{
  uint64_t v0 = (void *)HTUILearnMoreWhatAreHangsContent_str;
  if (!HTUILearnMoreWhatAreHangsContent_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_02", @"A hang occurs when the main thread of an app becomes unresponsive, and is unable to process user interactions or updates to the UI. When you turn on Hang Detection, iOS monitors responsiveness in your app and generates diagnostics to help identify parts of your app that spend too much time on the main thread after initial frame rendering. This feature supports apps installed directly through Xcode and signed with a development certificate, beta versions of apps you install with TestFlight, and apps distributed through the enterprise program.\n\nHang Detection is only available while the device is in Developer Mode.", &stru_2701C7158 value table];
    uint64_t v3 = (void *)HTUILearnMoreWhatAreHangsContent_str;
    HTUILearnMoreWhatAreHangsContent_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreWhatAreHangsContent_str;
  }

  return v0;
}

id HTUILearnMoreHUDTitle()
{
  uint64_t v0 = (void *)HTUILearnMoreHUDTitle_str;
  if (!HTUILearnMoreHUDTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_03" value:@"Overlay" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreHUDTitle_str;
    HTUILearnMoreHUDTitle_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreHUDTitle_str;
  }

  return v0;
}

id HTUILearnMoreHUDContent()
{
  uint64_t v0 = (void *)HTUILearnMoreHUDContent_str;
  if (!HTUILearnMoreHUDContent_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_04", @"When a hang occurs in a monitored app, an overlay appears at the top of the screen indicating how much time has elapsed since the app became unresponsive. Hang Detection stops monitoring hangs that exceed 10 seconds, and captures diagnostics to record the beginning of the hang.\n\nUsing this overlay is a great way to differentiate hangs from functional issues with similar symptoms, and helps you keep track of your app’s responsiveness while testing.", &stru_2701C7158 value table];
    uint64_t v3 = (void *)HTUILearnMoreHUDContent_str;
    HTUILearnMoreHUDContent_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreHUDContent_str;
  }

  return v0;
}

id HTUILearnMoreLogLimitTitle()
{
  uint64_t v0 = (void *)HTUILearnMoreLogLimitTitle_str;
  if (!HTUILearnMoreLogLimitTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_05" value:@"Diagnostic Logs" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreLogLimitTitle_str;
    HTUILearnMoreLogLimitTitle_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreLogLimitTitle_str;
  }

  return v0;
}

id HTUILearnMoreLogLimitContent()
{
  uint64_t v0 = (void *)HTUILearnMoreLogLimitContent_str;
  if (!HTUILearnMoreLogLimitContent_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_06", @"Hang Detection automatically collects diagnostic logs. Log processing occurs in the background at a low priority and may take longer if the system is busy. When logs are available for sharing with others, Notification Center displays a passive notification. Note that logs are a best effort and Hang Detection may not create logs for every hang.", &stru_2701C7158 value table];
    uint64_t v3 = (void *)HTUILearnMoreLogLimitContent_str;
    HTUILearnMoreLogLimitContent_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreLogLimitContent_str;
  }

  return v0;
}

id HTUILearnMoreFileTypesTitle()
{
  uint64_t v0 = (void *)HTUILearnMoreFileTypesTitle_str;
  if (!HTUILearnMoreFileTypesTitle_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_07" value:@"Each hang event generates two files:" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreFileTypesTitle_str;
    HTUILearnMoreFileTypesTitle_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreFileTypesTitle_str;
  }

  return v0;
}

id HTUILearnMoreFileTypesIPS()
{
  uint64_t v0 = (void *)HTUILearnMoreFileTypesIPS_str;
  if (!HTUILearnMoreFileTypesIPS_str)
  {
    uint64_t v2 = v1 = HTSettingsBundle();
    uint64_t v3 = (void *)HTUILearnMoreFileTypesIPS_str;
    HTUILearnMoreFileTypesIPS_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreFileTypesIPS_str;
  }

  return v0;
}

id HTUILearnMoreFileTypesTailspin()
{
  uint64_t v0 = (void *)HTUILearnMoreFileTypesTailspin_str;
  if (!HTUILearnMoreFileTypesTailspin_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_09" value:@"A tailspin file you can open in Instruments to view detailed thread interaction within your app’s process and overall usage of system resources at the time of the hang." table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreFileTypesTailspin_str;
    HTUILearnMoreFileTypesTailspin_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreFileTypesTailspin_str;
  }

  return v0;
}

id HTUILearnMoreFileTypesShare()
{
  uint64_t v0 = (void *)HTUILearnMoreFileTypesShare_str;
  if (!HTUILearnMoreFileTypesShare_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_10" value:@"You can share both files to your Mac or send them to the app developer for further analysis." table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreFileTypesShare_str;
    HTUILearnMoreFileTypesShare_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreFileTypesShare_str;
  }

  return v0;
}

id HTUILearnMoreURLPrefix()
{
  uint64_t v0 = (void *)HTUILearnMoreURLPrefix_str;
  if (!HTUILearnMoreURLPrefix_str)
  {
    uint64_t v1 = HTSettingsBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"LearnMore_11" value:@"Learn more about Hangs at" table:&stru_2701C7158];
    uint64_t v3 = (void *)HTUILearnMoreURLPrefix_str;
    HTUILearnMoreURLPrefix_str = v2;

    uint64_t v0 = (void *)HTUILearnMoreURLPrefix_str;
  }

  return v0;
}

__CFString *HTUILearnMoreURL()
{
  uint64_t v0 = (__CFString *)HTUILearnMoreURL_str;
  if (!HTUILearnMoreURL_str)
  {
    HTUILearnMoreURL_str = @"https://developer.apple.com/documentation/xcode/improving-app-responsiveness";

    uint64_t v0 = @"https://developer.apple.com/documentation/xcode/improving-app-responsiveness";
  }

  return v0;
}

__CFString *HTUIInternalSettingsTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalSettingsTitle_str;
  if (!HTUIInternalSettingsTitle_str)
  {
    HTUIInternalSettingsTitle_str = @"HangTracer";

    uint64_t v0 = @"HangTracer";
  }

  return v0;
}

__CFString *HTUIInternalIntro()
{
  uint64_t v0 = (__CFString *)HTUIInternalIntro_str;
  if (!HTUIInternalIntro_str)
  {
    HTUIInternalIntro_str = @"HangTracer monitors the main thread in foreground apps and captures diagnostics.";

    uint64_t v0 = @"HangTracer monitors the main thread in foreground apps and captures diagnostics.";
  }

  return v0;
}

__CFString *HTUIInternalHUDTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalHUDTitle_str;
  if (!HTUIInternalHUDTitle_str)
  {
    HTUIInternalHUDTitle_str = @"Heads-Up Display";

    uint64_t v0 = @"Heads-Up Display";
  }

  return v0;
}

__CFString *HTUIInternalToggleTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalToggleTitle_str;
  if (!HTUIInternalToggleTitle_str)
  {
    HTUIInternalToggleTitle_str = @"HangTracer HUD";

    uint64_t v0 = @"HangTracer HUD";
  }

  return v0;
}

id HTUIInternalThresholdFooter()
{
  uint64_t v0 = (void *)HTUIInternalThresholdFooter_string;
  if (!HTUIInternalThresholdFooter_string)
  {
    uint64_t v1 = objc_msgSend(NSString, "localizedStringWithFormat:", @"Turn on the Heads-Up Display to be notified when apps are unresponsive to input. Increase the %ldms threshold to focus on the most critical hangs.", 500);
    uint64_t v2 = (void *)HTUIInternalThresholdFooter_string;
    HTUIInternalThresholdFooter_string = v1;

    uint64_t v0 = (void *)HTUIInternalThresholdFooter_string;
  }

  return v0;
}

__CFString *HTUIInternalIntroWithProcessTerminations()
{
  uint64_t v0 = (__CFString *)HTUIInternalIntroWithProcessTerminations_str;
  if (!HTUIInternalIntroWithProcessTerminations_str)
  {
    HTUIInternalIntroWithProcessTerminations_str = @"Get further insights into system stability with the *Process Terminations HUD*.";

    uint64_t v0 = @"Get further insights into system stability with the *Process Terminations HUD*.";
  }

  return v0;
}

__CFString *HTUISymbolicating()
{
  uint64_t v0 = (__CFString *)HTUISymbolicating_str;
  if (!HTUISymbolicating_str)
  {
    HTUISymbolicating_str = @"Symbolicating…";

    uint64_t v0 = @"Symbolicating…";
  }

  return v0;
}

__CFString *HTUISymbolicationErrorTitle()
{
  uint64_t v0 = (__CFString *)HTUISymbolicationErrorTitle_str;
  if (!HTUISymbolicationErrorTitle_str)
  {
    HTUISymbolicationErrorTitle_str = @"Unable to symbolicate log";

    uint64_t v0 = @"Unable to symbolicate log";
  }

  return v0;
}

__CFString *HTUISymbolicationErrorMessage()
{
  uint64_t v0 = (__CFString *)HTUISymbolicationErrorMessage_str;
  if (!HTUISymbolicationErrorMessage_str)
  {
    HTUISymbolicationErrorMessage_str = @"There was an error trying to symbolicate the log file. Ensure that you are connected to the internal network and try again.";

    uint64_t v0 = @"There was an error trying to symbolicate the log file. Ensure that you are connected to the internal network and try again.";
  }

  return v0;
}

__CFString *HTUISymbolicationErrorButton_VPNName()
{
  uint64_t v0 = (__CFString *)HTUISymbolicationErrorButton_VPNName_str;
  if (!HTUISymbolicationErrorButton_VPNName_str)
  {
    HTUISymbolicationErrorButton_VPNName_str = @"Turn On %@";

    uint64_t v0 = @"Turn On %@";
  }

  return v0;
}

__CFString *HTUIInternalForceQuitsTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalForceQuitsTitle_str;
  if (!HTUIInternalForceQuitsTitle_str)
  {
    HTUIInternalForceQuitsTitle_str = @"Force-Quit Detection";

    uint64_t v0 = @"Force-Quit Detection";
  }

  return v0;
}

__CFString *HTUIInternalForceQuitsToggleTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalForceQuitsToggleTitle_str;
  if (!HTUIInternalForceQuitsToggleTitle_str)
  {
    HTUIInternalForceQuitsToggleTitle_str = @"Detect Force-Quit Apps";

    uint64_t v0 = @"Detect Force-Quit Apps";
  }

  return v0;
}

__CFString *HTUIInternalForceQuitsFooterOFF()
{
  uint64_t v0 = (__CFString *)HTUIInternalForceQuitsFooterOFF_str;
  if (!HTUIInternalForceQuitsFooterOFF_str)
  {
    HTUIInternalForceQuitsFooterOFF_str = @"Receive a notification and capture tailspin logs each time you quit and relaunch an app. Report any app issue right from the notification.";

    uint64_t v0 = @"Receive a notification and capture tailspin logs each time you quit and relaunch an app. Report any app issue right from the notification.";
  }

  return v0;
}

id HTUIInternalForceQuitsFooterON()
{
  uint64_t v0 = (void *)HTUIInternalForceQuitsFooterON_string;
  if (!HTUIInternalForceQuitsFooterON_string)
  {
    uint64_t v1 = NSString;
    uint64_t v2 = HTUIInternalForceQuitsFooterOFF();
    uint64_t v3 = [v1 localizedStringWithFormat:@"%@\n\nOnly apps force-quit and relaunched within this duration will be detected. The default is %d seconds.", v2, 3];
    uint64_t v4 = (void *)HTUIInternalForceQuitsFooterON_string;
    HTUIInternalForceQuitsFooterON_string = v3;

    uint64_t v0 = (void *)HTUIInternalForceQuitsFooterON_string;
  }

  return v0;
}

__CFString *HTUIInternalForceQuitsProcessTerminationsLink()
{
  uint64_t v0 = (__CFString *)HTUIInternalForceQuitsProcessTerminationsLink_str;
  if (!HTUIInternalForceQuitsProcessTerminationsLink_str)
  {
    HTUIInternalForceQuitsProcessTerminationsLink_str = @"See *Process Terminations* to get an indication when background processes exit.";

    uint64_t v0 = @"See *Process Terminations* to get an indication when background processes exit.";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsTitle_str;
  if (!HTUIInternalTerminationsTitle_str)
  {
    HTUIInternalTerminationsTitle_str = @"Process Terminations";

    uint64_t v0 = @"Process Terminations";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsToggleTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsToggleTitle_str;
  if (!HTUIInternalTerminationsToggleTitle_str)
  {
    HTUIInternalTerminationsToggleTitle_str = @"Process Terminations HUD";

    uint64_t v0 = @"Process Terminations HUD";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsFooter()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsFooter_str;
  if (!HTUIInternalTerminationsFooter_str)
  {
    HTUIInternalTerminationsFooter_str = @"Show process terminations in the Heads-Up Display to monitor system stability in real-time.\nSelect which processes and termination reasons are included in the HUD.\n\nGet further insights into app performance with the *HangTracer HUD*.";

    uint64_t v0 = @"Show process terminations in the Heads-Up Display to monitor system stability in real-time.\nSelect which processes and termination reasons are included in the HUD.\n\nGet further insights into app performance with the *HangTracer HUD*.";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsProcessesTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsProcessesTitle_str;
  if (!HTUIInternalTerminationsProcessesTitle_str)
  {
    HTUIInternalTerminationsProcessesTitle_str = @"Monitored Processes";

    uint64_t v0 = @"Monitored Processes";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsAllProcessesToggle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsAllProcessesToggle_str;
  if (!HTUIInternalTerminationsAllProcessesToggle_str)
  {
    HTUIInternalTerminationsAllProcessesToggle_str = @"All Processes";

    uint64_t v0 = @"All Processes";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsCriticalProcessesToggle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsCriticalProcessesToggle_str;
  if (!HTUIInternalTerminationsCriticalProcessesToggle_str)
  {
    HTUIInternalTerminationsCriticalProcessesToggle_str = @"Critical Processes";

    uint64_t v0 = @"Critical Processes";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsCriticalProcessesFooter()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsCriticalProcessesFooter_str;
  if (!HTUIInternalTerminationsCriticalProcessesFooter_str)
  {
    HTUIInternalTerminationsCriticalProcessesFooter_str = @"Includes processes considered critical for performance and stability. *See list…*";

    uint64_t v0 = @"Includes processes considered critical for performance and stability. *See list…*";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1_str;
  if (!HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1_str)
  {
    HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1_str = @"The following background processes are critical for performance and stability.";

    uint64_t v0 = @"The following background processes are critical for performance and stability.";
  }

  return v0;
}

id HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2()
{
  uint64_t v0 = (void *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string;
  if (!HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string)
  {
    uint64_t v1 = NSString;
    uint64_t v2 = HTUIInternalTerminationsCriticalProcessesToggle();
    uint64_t v3 = [v1 localizedStringWithFormat:@"Turn on “%@” to get notified in the Heads-Up Display whenever they are terminated.", v2];
    uint64_t v4 = (void *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string;
    HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string = v3;

    uint64_t v0 = (void *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string;
  }

  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessButton()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsAddProcessButton_str;
  if (!HTUIInternalTerminationsAddProcessButton_str)
  {
    HTUIInternalTerminationsAddProcessButton_str = @"Add Process";

    uint64_t v0 = @"Add Process";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessDialogTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsAddProcessDialogTitle_str;
  if (!HTUIInternalTerminationsAddProcessDialogTitle_str)
  {
    HTUIInternalTerminationsAddProcessDialogTitle_str = @"Monitor New Process";

    uint64_t v0 = @"Monitor New Process";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessDialogMessage()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsAddProcessDialogMessage_str;
  if (!HTUIInternalTerminationsAddProcessDialogMessage_str)
  {
    HTUIInternalTerminationsAddProcessDialogMessage_str = @"Enter the exact name of the process.";

    uint64_t v0 = @"Enter the exact name of the process.";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessDialogConfirmation()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsAddProcessDialogConfirmation_str;
  if (!HTUIInternalTerminationsAddProcessDialogConfirmation_str)
  {
    HTUIInternalTerminationsAddProcessDialogConfirmation_str = @"Monitor";

    uint64_t v0 = @"Monitor";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessPlaceholder()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsAddProcessPlaceholder_str;
  if (!HTUIInternalTerminationsAddProcessPlaceholder_str)
  {
    HTUIInternalTerminationsAddProcessPlaceholder_str = @"contactsd";

    uint64_t v0 = @"contactsd";
  }

  return v0;
}

uint64_t HTUIInternalTerminationsAddProcessConfirmationTitle(uint64_t a1)
{
  return [NSString localizedStringWithFormat:@"Do you want to start monitoring “%@”?", a1];
}

__CFString *HTUIInternalTerminationsAddProcessConfirmationMessage()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsAddProcessConfirmationMessage_str;
  if (!HTUIInternalTerminationsAddProcessConfirmationMessage_str)
  {
    HTUIInternalTerminationsAddProcessConfirmationMessage_str = @"Make sure the name is correct. This process does not seem to be currently running.";

    uint64_t v0 = @"Make sure the name is correct. This process does not seem to be currently running.";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsNoProcessesFooter()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsNoProcessesFooter_str;
  if (!HTUIInternalTerminationsNoProcessesFooter_str)
  {
    HTUIInternalTerminationsNoProcessesFooter_str = @"Select processes to start monitoring terminations.";

    uint64_t v0 = @"Select processes to start monitoring terminations.";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsRemoveProcessSwipeTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsRemoveProcessSwipeTitle_str;
  if (!HTUIInternalTerminationsRemoveProcessSwipeTitle_str)
  {
    HTUIInternalTerminationsRemoveProcessSwipeTitle_str = @"Stop Monitoring";

    uint64_t v0 = @"Stop Monitoring";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsRemoveProcessMenuTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsRemoveProcessMenuTitle_str;
  if (!HTUIInternalTerminationsRemoveProcessMenuTitle_str)
  {
    HTUIInternalTerminationsRemoveProcessMenuTitle_str = @"Stop Monitoring";

    uint64_t v0 = @"Stop Monitoring";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsReasonsTitle()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsReasonsTitle_str;
  if (!HTUIInternalTerminationsReasonsTitle_str)
  {
    HTUIInternalTerminationsReasonsTitle_str = @"Monitored Exit Reasons";

    uint64_t v0 = @"Monitored Exit Reasons";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsSelectAllButton()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsSelectAllButton_str;
  if (!HTUIInternalTerminationsSelectAllButton_str)
  {
    HTUIInternalTerminationsSelectAllButton_str = @"Select All";

    uint64_t v0 = @"Select All";
  }

  return v0;
}

__CFString *HTUIInternalTerminationsUnselectAllButton()
{
  uint64_t v0 = (__CFString *)HTUIInternalTerminationsUnselectAllButton_str;
  if (!HTUIInternalTerminationsUnselectAllButton_str)
  {
    HTUIInternalTerminationsUnselectAllButton_str = @"Unselect All";

    uint64_t v0 = @"Unselect All";
  }

  return v0;
}

uint64_t HTUIAsteriskedRangeFromString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 localizedStandardRangeOfString:@"*"];
  if ([v1 length] <= (unint64_t)(v2 + 1))
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(v1, "substringFromIndex:");
    uint64_t v4 = [v3 localizedStandardRangeOfString:@"*"];

    if (v2 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

__CFString *exitNamespaceString(unsigned int a1)
{
  if (a1 >= 0x2A)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2653541D0[(char)a1];
  }

  return v1;
}

__CFString *exitNamespaceDisplayString(unsigned int a1)
{
  char v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    uint64_t v3 = off_265354320[v1];
  }
  else
  {
    uint64_t v2 = exitNamespaceString(a1);
    uint64_t v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *exitReasonStringForNamespaceSignal(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SIG%d", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_265354450[(int)a1 - 1];
  }

  return v1;
}

__CFString *exitReasonStringForNamespaceJetsam(uint64_t a1)
{
  if (a1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_265354548[(int)a1];
  }

  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceJetsam(uint64_t a1)
{
  int v1 = a1 - 2;
  if (a1 - 2) < 0xE && ((0x2655u >> v1))
  {
    uint64_t v3 = off_2653545C8[v1];
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceJetsam(a1);
    uint64_t v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *exitReasonStringForNamespaceSpringBoard(uint64_t a1)
{
  if (a1 > 3221229822)
  {
    if (a1 <= 3306925314)
    {
      switch(a1)
      {
        case 3221229823:
          uint64_t v2 = @"thermal pressure";
          return v2;
        case 3306925313:
          uint64_t v2 = @"cpu violation";
          return v2;
        case 3306925314:
          uint64_t v2 = @"walltime violation";
          return v2;
      }
    }
    else if (a1 > 3735943696)
    {
      if (a1 == 3735943697)
      {
        uint64_t v2 = @"user quit";
        return v2;
      }
      if (a1 == 4227595259)
      {
        uint64_t v2 = @"force quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3306925315)
      {
        uint64_t v2 = @"system busy";
        return v2;
      }
      if (a1 == 3735883980)
      {
        uint64_t v2 = @"resource exclusion";
        return v2;
      }
    }
LABEL_62:
    objc_msgSend(NSString, "stringWithFormat:", @"%#llx", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101:
        uint64_t v2 = @"application assertion";
        return v2;
      case 439025681:
        uint64_t v2 = @"input ui scene";
        return v2;
      case 732775916:
        uint64_t v2 = @"secure draw violation";
        return v2;
    }
    goto LABEL_62;
  }
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      uint64_t v2 = @"legacy clear the board";
      return v2;
    }
    if (a1 == 2343432205)
    {
      uint64_t v2 = @"watchdog";
      return v2;
    }
    goto LABEL_62;
  }
  if (a1 != 1539435073)
  {
    if (a1 == 1539435076)
    {
      uint64_t v2 = @"clear the board";
      return v2;
    }
    goto LABEL_62;
  }
  uint64_t v2 = @"languages changed";
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceSpringBoard(uint64_t a1)
{
  if (a1 > 1539435076)
  {
    if (a1 != 1539435077)
    {
      if (a1 == 3306925313)
      {
        uint64_t v1 = @"CPU Violation";
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    uint64_t v1 = @"Legacy Clear the Board";
  }
  else
  {
    if (a1 != 439025681)
    {
      if (a1 == 1539435076)
      {
        uint64_t v1 = @"Clear the Board";
        goto LABEL_11;
      }
LABEL_8:
      uint64_t v2 = exitReasonStringForNamespaceSpringBoard(a1);
      uint64_t v1 = [v2 capitalizedString];

      goto LABEL_11;
    }
    uint64_t v1 = @"InputUI Scene";
  }
LABEL_11:

  return v1;
}

__CFString *exitReasonStringForNamespaceCodeSigning(uint64_t a1)
{
  if ((a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_265354638[(int)a1 - 1];
  }

  return v1;
}

id exitReasonDisplayStringForNamespaceCodeSigning(uint64_t a1)
{
  uint64_t v1 = exitReasonStringForNamespaceCodeSigning(a1);
  uint64_t v2 = [v1 capitalizedString];

  return v2;
}

__CFString *exitReasonStringForNamespaceExec(uint64_t a1)
{
  if ((a1 - 1) >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_265354658[(int)a1 - 1];
  }

  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceExec(uint64_t a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) < 0x13 && ((0x55F7Fu >> v1))
  {
    uint64_t v3 = off_2653546F0[v1];
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceExec(a1);
    uint64_t v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *exitReasonStringForNamespaceGuard(uint64_t a1)
{
  if ((a1 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_265354788[(int)a1 - 1];
  }

  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceGuard(uint64_t a1)
{
  if (a1 == 5)
  {
    int v1 = @"JIT";
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceGuard(a1);
    int v1 = [v2 capitalizedString];
  }

  return v1;
}

__CFString *exitReasonStringForNamespaceLibXPC(uint64_t a1)
{
  if ((a1 - 1) >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%u", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_2653547B0[(int)a1 - 1];
  }

  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceLibXPC(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      int v1 = @"Unknown IPC";
      break;
    case 6:
      int v1 = @"Sandbox Filtered IPC";
      break;
    case 4:
      int v1 = @"SIGTERM Timeout";
      break;
    default:
      uint64_t v2 = exitReasonStringForNamespaceLibXPC(a1);
      int v1 = [v2 capitalizedString];

      break;
  }

  return v1;
}

__CFString *exitReasonStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 9 && ((0x17Fu >> v1))
  {
    uint64_t v2 = off_2653547F8[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 7 && ((0x47u >> v1))
  {
    uint64_t v3 = off_265354840[v1];
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceDYLD(a1);
    uint64_t v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *exitReasonStringForNamespaceRunningBoard(uint64_t a1)
{
  if (a1 <= 2343432204)
  {
    if (a1 <= 562215633)
    {
      switch(a1)
      {
        case 0:
          uint64_t v2 = @"none";
          return v2;
        case 97132013:
          uint64_t v2 = @"conditions changed";
          return v2;
        case 562215597:
          uint64_t v2 = @"assertion timeout";
          return v2;
      }
    }
    else
    {
      if (a1 <= 562215635)
      {
        if (a1 == 562215634)
        {
          uint64_t v2 = @"background task assertion timeout";
        }
        else
        {
          uint64_t v2 = @"background url session completion timeout";
        }
        return v2;
      }
      if (a1 == 562215636)
      {
        uint64_t v2 = @"background fetch completion timeout";
        return v2;
      }
      if (a1 == 732775916)
      {
        uint64_t v2 = @"security violation";
        return v2;
      }
    }
LABEL_66:
    objc_msgSend(NSString, "stringWithFormat:", @"%#llx", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 > 3490524076)
  {
    if (a1 > 3735905537)
    {
      if (a1 == 3735905538)
      {
        uint64_t v2 = @"termination assertion";
        return v2;
      }
      if (a1 == 3735943697)
      {
        uint64_t v2 = @"user initiated quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3490524077)
      {
        uint64_t v2 = @"max assertions violation";
        return v2;
      }
      if (a1 == 3735883980)
      {
        uint64_t v2 = @"resource exclusion";
        return v2;
      }
    }
    goto LABEL_66;
  }
  if (a1 > 2970726672)
  {
    if (a1 == 2970726673)
    {
      uint64_t v2 = @"process exited";
      return v2;
    }
    if (a1 == 3221229823)
    {
      uint64_t v2 = @"thermal pressure";
      return v2;
    }
    goto LABEL_66;
  }
  if (a1 != 2343432205)
  {
    if (a1 == 2970405393)
    {
      uint64_t v2 = @"max states violation";
      return v2;
    }
    goto LABEL_66;
  }
  uint64_t v2 = @"watchdog violation";
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceRunningBoard(uint64_t a1)
{
  if (a1 <= 2970405392)
  {
    if (!a1)
    {
      uint64_t v1 = @"None Provided";
      goto LABEL_13;
    }
    if (a1 == 562215635)
    {
      uint64_t v1 = @"Background URL Session Completion Timeout";
      goto LABEL_13;
    }
  }
  else
  {
    switch(a1)
    {
      case 2970405393:
        uint64_t v1 = @"Maximum States Violation";
        goto LABEL_13;
      case 3490524077:
        uint64_t v1 = @"Maximum Assertions Violation";
        goto LABEL_13;
      case 3735943697:
        uint64_t v1 = @"User-Initiated Quit";
        goto LABEL_13;
    }
  }
  uint64_t v2 = exitReasonStringForNamespaceRunningBoard(a1);
  uint64_t v1 = [v2 capitalizedString];

LABEL_13:

  return v1;
}

__CFString *exitReasonStringForNamespaceLibSystem(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_265354878[a1 - 1];
  }

  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceLibSystem(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1))
  {
    uint64_t v3 = off_2653548A0[v1];
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceLibSystem(a1);
    uint64_t v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *exitReasonStringForNamespaceEndpointSecurity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2653548C8[a1 - 1];
  }

  return v1;
}

id exitReasonDisplayStringForNamespaceEndpointSecurity(uint64_t a1)
{
  uint64_t v1 = exitReasonStringForNamespaceEndpointSecurity(a1);
  uint64_t v2 = [v1 capitalizedString];

  return v2;
}

__CFString *exitReasonStringForNamespaceWatchdog(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = @"service timeout";
      break;
    case 1001:
      uint64_t v2 = @"chronokit";
      break;
    case 2:
      uint64_t v2 = @"timeout no diags";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceWatchdog(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = @"Service Timeout Diagnostics Unavailable";
  }
  else if (a1 == 1001)
  {
    uint64_t v1 = @"ChronoKit";
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceWatchdog(a1);
    uint64_t v1 = [v2 capitalizedString];
  }

  return v1;
}

__CFString *exitReasonStringForNamespaceWatchKit(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"api violation";
  }
  else if (a1 == 2)
  {
    uint64_t v2 = @"internal error";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceWatchKit(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = @"API Violation";
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceWatchKit(a1);
    uint64_t v1 = [v2 capitalizedString];
  }

  return v1;
}

__CFString *exitReasonStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0x15 && ((0x183FFFu >> v1))
  {
    uint64_t v2 = off_2653548E0[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1 = a1 - 11;
  if (unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1))
  {
    uint64_t v3 = off_265354988[v1];
  }
  else
  {
    uint64_t v2 = exitReasonStringForNamespaceBacklightServices(a1);
    uint64_t v3 = [v2 capitalizedString];
  }

  return v3;
}

id exitReasonString(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = exitReasonStringForNamespaceJetsam(a2);
      break;
    case 2:
      uint64_t v2 = exitReasonStringForNamespaceSignal(a2);
      break;
    case 3:
      uint64_t v2 = exitReasonStringForNamespaceCodeSigning(a2);
      break;
    case 6:
      uint64_t v2 = exitReasonStringForNamespaceDYLD(a2);
      break;
    case 7:
      uint64_t v2 = exitReasonStringForNamespaceLibXPC(a2);
      break;
    case 9:
      uint64_t v2 = exitReasonStringForNamespaceExec(a2);
      break;
    case 10:
      uint64_t v2 = exitReasonStringForNamespaceSpringBoard(a2);
      break;
    case 15:
      uint64_t v2 = exitReasonStringForNamespaceRunningBoard(a2);
      break;
    case 18:
      uint64_t v2 = exitReasonDisplayStringForNamespaceLibSystem(a2);
      break;
    case 20:
      uint64_t v2 = exitReasonStringForNamespaceWatchdog(a2);
      break;
    case 22:
      uint64_t v2 = exitReasonStringForNamespaceWatchKit(a2);
      break;
    case 23:
      uint64_t v2 = exitReasonStringForNamespaceGuard(a2);
      break;
    case 27:
      uint64_t v2 = exitReasonStringForNamespaceEndpointSecurity(a2);
      break;
    case 32:
      uint64_t v2 = exitReasonStringForNamespaceBacklightServices(a2);
      break;
    default:
      uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a2);
      break;
  }

  return v2;
}

id exitReasonDisplayString(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = exitReasonDisplayStringForNamespaceJetsam(a2);
      break;
    case 2:
      uint64_t v2 = exitReasonStringForNamespaceSignal(a2);
      break;
    case 3:
      uint64_t v2 = exitReasonDisplayStringForNamespaceCodeSigning(a2);
      break;
    case 6:
      uint64_t v2 = exitReasonDisplayStringForNamespaceDYLD(a2);
      break;
    case 7:
      uint64_t v2 = exitReasonDisplayStringForNamespaceLibXPC(a2);
      break;
    case 9:
      uint64_t v2 = exitReasonDisplayStringForNamespaceExec(a2);
      break;
    case 10:
      uint64_t v2 = exitReasonDisplayStringForNamespaceSpringBoard(a2);
      break;
    case 15:
      uint64_t v2 = exitReasonDisplayStringForNamespaceRunningBoard(a2);
      break;
    case 18:
      uint64_t v2 = exitReasonDisplayStringForNamespaceLibSystem(a2);
      break;
    case 20:
      uint64_t v2 = exitReasonDisplayStringForNamespaceWatchdog(a2);
      break;
    case 22:
      uint64_t v2 = exitReasonDisplayStringForNamespaceWatchKit(a2);
      break;
    case 23:
      uint64_t v2 = exitReasonDisplayStringForNamespaceGuard(a2);
      break;
    case 27:
      uint64_t v2 = exitReasonDisplayStringForNamespaceEndpointSecurity(a2);
      break;
    case 32:
      uint64_t v2 = exitReasonDisplayStringForNamespaceBacklightServices(a2);
      break;
    default:
      uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%#llx", a2);
      break;
  }

  return v2;
}

char *HTDeveloperSettings.availableThresholdsValues.getter()
{
  id v1 = objc_msgSend(v0, sel_availableThresholdsValues);
  sub_250BC53A4();
  unint64_t v2 = sub_250BCC2A0();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_250BCC2F0();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = sub_250BC53E4(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x253383610](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      id v9 = objc_msgSend(v7, sel_integerValue);

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        sub_250BC53E4((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(void *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

unint64_t sub_250BC53A4()
{
  unint64_t result = qword_269AF53B8;
  if (!qword_269AF53B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF53B8);
  }
  return result;
}

char *sub_250BC53E4(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_250BC5404(a1, a2, a3, *v3);
  __CFString *v3 = result;
  return result;
}

char *sub_250BC5404(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF53C0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
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

uint64_t HTTerminationReason.displayName.getter(unint64_t a1)
{
  id v1 = HTTerminationReasonDisplayName(a1);
  uint64_t v2 = sub_250BCC280();

  return v2;
}

uint64_t HTTerminationReason.subReasons.getter(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  if (a1 >= 0x8000)
  {
    if (a1 < 0x400000)
    {
      switch(a1)
      {
        case 0x8000:
          swift_beginAccess();
          uint64_t v49 = qword_269AF5430;
          swift_beginAccess();
          uint64_t v3 = (char *)MEMORY[0x263F8EE78];
          do
          {
            while (1)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58F0);
              }
              unint64_t v51 = *((void *)v3 + 2);
              unint64_t v50 = *((void *)v3 + 3);
              if (v51 >= v50 >> 1) {
                uint64_t v3 = sub_250BC999C((char *)(v50 > 1), v51 + 1, 1, v3, &qword_269AF58F0);
              }
              *((void *)v3 + 2) = v51 + 1;
              *(void *)&v3[8 * v51 + 32] = v49;
              unint64_t v52 = 2 * v49;
              if ((unint64_t)qword_269AF5438 >= 0x40) {
                break;
              }
              v49 *= 2;
              if (1 << qword_269AF5438 < v52) {
                goto LABEL_166;
              }
            }
            uint64_t v49 = 0;
          }
          while (!v52);
LABEL_166:
          v34 = (unint64_t *)&unk_269AF54D0;
          v35 = type metadata accessor for HTRunningBoardTerminationReason;
          v36 = type metadata accessor for HTRunningBoardTerminationReason;
          goto LABEL_170;
        case 0x40000:
          swift_beginAccess();
          uint64_t v53 = qword_269AF5440;
          swift_beginAccess();
          uint64_t v3 = (char *)MEMORY[0x263F8EE78];
          do
          {
            while (1)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58F8);
              }
              unint64_t v55 = *((void *)v3 + 2);
              unint64_t v54 = *((void *)v3 + 3);
              if (v55 >= v54 >> 1) {
                uint64_t v3 = sub_250BC999C((char *)(v54 > 1), v55 + 1, 1, v3, &qword_269AF58F8);
              }
              *((void *)v3 + 2) = v55 + 1;
              *(void *)&v3[8 * v55 + 32] = v53;
              unint64_t v56 = 2 * v53;
              if ((unint64_t)qword_269AF5448 >= 0x40) {
                break;
              }
              v53 *= 2;
              if (1 << qword_269AF5448 < v56) {
                goto LABEL_167;
              }
            }
            uint64_t v53 = 0;
          }
          while (!v56);
LABEL_167:
          v34 = (unint64_t *)&unk_269AF54C8;
          v35 = type metadata accessor for HTLibSystemTerminationReason;
          v36 = type metadata accessor for HTLibSystemTerminationReason;
          goto LABEL_170;
        case 0x100000:
          swift_beginAccess();
          uint64_t v15 = qword_269AF5450;
          swift_beginAccess();
          uint64_t v3 = (char *)MEMORY[0x263F8EE78];
          do
          {
            while (1)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF5900);
              }
              unint64_t v17 = *((void *)v3 + 2);
              unint64_t v16 = *((void *)v3 + 3);
              unint64_t v18 = v17 + 1;
              if (v17 >= v16 >> 1) {
                uint64_t v3 = sub_250BC999C((char *)(v16 > 1), v17 + 1, 1, v3, &qword_269AF5900);
              }
              *((void *)v3 + 2) = v18;
              *(void *)&v3[8 * v17 + 32] = v15;
              unint64_t v19 = 2 * v15;
              if ((unint64_t)qword_269AF5458 >= 0x40) {
                break;
              }
              v15 *= 2;
              if (1 << qword_269AF5458 < v19) {
                goto LABEL_133;
              }
            }
            uint64_t v15 = 0;
          }
          while (!v19);
LABEL_133:
          unint64_t v57 = *((void *)v3 + 3);
          if (v18 >= v57 >> 1) {
            uint64_t v3 = sub_250BC999C((char *)(v57 > 1), v17 + 2, 1, v3, &qword_269AF5900);
          }
          *((void *)v3 + 2) = v17 + 2;
          *(void *)&v3[8 * v18 + 32] = 0x100000;
          v34 = (unint64_t *)&unk_269AF54C0;
          v35 = type metadata accessor for HTWatchdogTerminationReason;
          v36 = type metadata accessor for HTWatchdogTerminationReason;
          goto LABEL_170;
      }
    }
    else if (a1 > 0x7FFFFFF)
    {
      if (a1 == 0x8000000)
      {
        swift_beginAccess();
        uint64_t v62 = qword_269AF5480;
        swift_beginAccess();
        uint64_t v3 = (char *)MEMORY[0x263F8EE78];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF5918);
            }
            unint64_t v64 = *((void *)v3 + 2);
            unint64_t v63 = *((void *)v3 + 3);
            if (v64 >= v63 >> 1) {
              uint64_t v3 = sub_250BC999C((char *)(v63 > 1), v64 + 1, 1, v3, &qword_269AF5918);
            }
            *((void *)v3 + 2) = v64 + 1;
            *(void *)&v3[8 * v64 + 32] = v62;
            unint64_t v65 = 2 * v62;
            if ((unint64_t)qword_269AF5488 >= 0x40) {
              break;
            }
            v62 *= 2;
            if (1 << qword_269AF5488 < v65) {
              goto LABEL_169;
            }
          }
          uint64_t v62 = 0;
        }
        while (!v65);
LABEL_169:
        v34 = (unint64_t *)&unk_269AF54A8;
        v35 = type metadata accessor for HTEndpointSecurityTerminationReason;
        v36 = type metadata accessor for HTEndpointSecurityTerminationReason;
        goto LABEL_170;
      }
      if (a1 == 0x100000000)
      {
        swift_beginAccess();
        uint64_t v24 = qword_269AF5490;
        swift_beginAccess();
        uint64_t v3 = (char *)MEMORY[0x263F8EE78];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF5920);
            }
            unint64_t v26 = *((void *)v3 + 2);
            unint64_t v25 = *((void *)v3 + 3);
            unint64_t v27 = v26 + 1;
            if (v26 >= v25 >> 1) {
              uint64_t v3 = sub_250BC999C((char *)(v25 > 1), v26 + 1, 1, v3, &qword_269AF5920);
            }
            *((void *)v3 + 2) = v27;
            *(void *)&v3[8 * v26 + 32] = v24;
            unint64_t v28 = 2 * v24;
            if ((unint64_t)qword_269AF5498 >= 0x40) {
              break;
            }
            v24 *= 2;
            if (1 << qword_269AF5498 < v28) {
              goto LABEL_155;
            }
          }
          uint64_t v24 = 0;
        }
        while (!v28);
LABEL_155:
        unint64_t v66 = *((void *)v3 + 3);
        unint64_t v67 = v26 + 2;
        if (v27 >= v66 >> 1) {
          uint64_t v3 = sub_250BC999C((char *)(v66 > 1), v26 + 2, 1, v3, &qword_269AF5920);
        }
        *((void *)v3 + 2) = v67;
        *(void *)&v3[8 * v27 + 32] = 0x100000;
        unint64_t v68 = *((void *)v3 + 3);
        if ((uint64_t)(v26 + 3) > (uint64_t)(v68 >> 1)) {
          uint64_t v3 = sub_250BC999C((char *)(v68 > 1), v26 + 3, 1, v3, &qword_269AF5920);
        }
        *((void *)v3 + 2) = v26 + 3;
        *(void *)&v3[8 * v67 + 32] = 0x200000;
        v34 = (unint64_t *)&unk_269AF54A0;
        v35 = type metadata accessor for HTBacklightServicesTerminationReason;
        v36 = type metadata accessor for HTBacklightServicesTerminationReason;
        goto LABEL_170;
      }
    }
    else
    {
      if (a1 == 0x400000)
      {
        swift_beginAccess();
        uint64_t v37 = qword_269AF5460;
        swift_beginAccess();
        uint64_t v3 = (char *)MEMORY[0x263F8EE78];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF5908);
            }
            unint64_t v39 = *((void *)v3 + 2);
            unint64_t v38 = *((void *)v3 + 3);
            if (v39 >= v38 >> 1) {
              uint64_t v3 = sub_250BC999C((char *)(v38 > 1), v39 + 1, 1, v3, &qword_269AF5908);
            }
            *((void *)v3 + 2) = v39 + 1;
            *(void *)&v3[8 * v39 + 32] = v37;
            unint64_t v40 = 2 * v37;
            if ((unint64_t)qword_269AF5468 >= 0x40) {
              break;
            }
            v37 *= 2;
            if (1 << qword_269AF5468 < v40) {
              goto LABEL_163;
            }
          }
          uint64_t v37 = 0;
        }
        while (!v40);
LABEL_163:
        v34 = (unint64_t *)&unk_269AF54B8;
        v35 = type metadata accessor for HTWatchKitTerminationReason;
        v36 = type metadata accessor for HTWatchKitTerminationReason;
        goto LABEL_170;
      }
      if (a1 == 0x800000)
      {
        swift_beginAccess();
        uint64_t v7 = qword_269AF5470;
        swift_beginAccess();
        uint64_t v3 = (char *)MEMORY[0x263F8EE78];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF5910);
            }
            unint64_t v9 = *((void *)v3 + 2);
            unint64_t v8 = *((void *)v3 + 3);
            if (v9 >= v8 >> 1) {
              uint64_t v3 = sub_250BC999C((char *)(v8 > 1), v9 + 1, 1, v3, &qword_269AF5910);
            }
            *((void *)v3 + 2) = v9 + 1;
            *(void *)&v3[8 * v9 + 32] = v7;
            unint64_t v10 = 2 * v7;
            if ((unint64_t)qword_269AF5478 >= 0x40) {
              break;
            }
            v7 *= 2;
            if (1 << qword_269AF5478 < v10) {
              goto LABEL_93;
            }
          }
          uint64_t v7 = 0;
        }
        while (!v10);
LABEL_93:
        v34 = (unint64_t *)&unk_269AF54B0;
        v35 = type metadata accessor for HTGuardTerminationReason;
        v36 = type metadata accessor for HTGuardTerminationReason;
        goto LABEL_170;
      }
    }
  }
  else if (a1 <= 63)
  {
    switch(a1)
    {
      case 2:
        swift_beginAccess();
        uint64_t v3 = (char *)MEMORY[0x263F8EE78];
        uint64_t v41 = qword_269AF53C8;
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58B8);
            }
            unint64_t v43 = *((void *)v3 + 2);
            unint64_t v42 = *((void *)v3 + 3);
            if (v43 >= v42 >> 1) {
              uint64_t v3 = sub_250BC999C((char *)(v42 > 1), v43 + 1, 1, v3, &qword_269AF58B8);
            }
            *((void *)v3 + 2) = v43 + 1;
            *(void *)&v3[8 * v43 + 32] = v41;
            if (qword_269AF5C60 != -1) {
              swift_once();
            }
            unint64_t v44 = 2 * v41;
            swift_beginAccess();
            if ((unint64_t)qword_269AF5C68 >= 0x40) {
              break;
            }
            v41 *= 2;
            if (1 << qword_269AF5C68 < v44) {
              goto LABEL_164;
            }
          }
          uint64_t v41 = 0;
        }
        while (!v44);
LABEL_164:
        v34 = (unint64_t *)&unk_269AF5508;
        v35 = type metadata accessor for HTJetsamTerminationReason;
        v36 = type metadata accessor for HTJetsamTerminationReason;
        goto LABEL_170;
      case 4:
        swift_beginAccess();
        uint64_t v45 = qword_269AF53D0;
        swift_beginAccess();
        uint64_t v3 = (char *)MEMORY[0x263F8EE78];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58C0);
            }
            unint64_t v47 = *((void *)v3 + 2);
            unint64_t v46 = *((void *)v3 + 3);
            if (v47 >= v46 >> 1) {
              uint64_t v3 = sub_250BC999C((char *)(v46 > 1), v47 + 1, 1, v3, &qword_269AF58C0);
            }
            *((void *)v3 + 2) = v47 + 1;
            *(void *)&v3[8 * v47 + 32] = v45;
            unint64_t v48 = 2 * v45;
            if ((unint64_t)qword_269AF53D8 >= 0x40) {
              break;
            }
            v45 *= 2;
            if (1 << qword_269AF53D8 < v48) {
              goto LABEL_165;
            }
          }
          uint64_t v45 = 0;
        }
        while (!v48);
LABEL_165:
        v34 = (unint64_t *)&unk_269AF5500;
        v35 = type metadata accessor for HTSignalTerminationReason;
        v36 = type metadata accessor for HTSignalTerminationReason;
        goto LABEL_170;
      case 8:
        swift_beginAccess();
        uint64_t v11 = qword_269AF53E0;
        swift_beginAccess();
        uint64_t v3 = (char *)MEMORY[0x263F8EE78];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58C8);
            }
            unint64_t v13 = *((void *)v3 + 2);
            unint64_t v12 = *((void *)v3 + 3);
            if (v13 >= v12 >> 1) {
              uint64_t v3 = sub_250BC999C((char *)(v12 > 1), v13 + 1, 1, v3, &qword_269AF58C8);
            }
            *((void *)v3 + 2) = v13 + 1;
            *(void *)&v3[8 * v13 + 32] = v11;
            unint64_t v14 = 2 * v11;
            if ((unint64_t)qword_269AF53E8 >= 0x40) {
              break;
            }
            v11 *= 2;
            if (1 << qword_269AF53E8 < v14) {
              goto LABEL_114;
            }
          }
          uint64_t v11 = 0;
        }
        while (!v14);
LABEL_114:
        v34 = (unint64_t *)&unk_269AF54F8;
        v35 = type metadata accessor for HTCodeSigningTerminationReason;
        v36 = type metadata accessor for HTCodeSigningTerminationReason;
        goto LABEL_170;
    }
  }
  else if (a1 > 511)
  {
    if (a1 == 512)
    {
      swift_beginAccess();
      uint64_t v58 = qword_269AF5410;
      swift_beginAccess();
      uint64_t v3 = (char *)MEMORY[0x263F8EE78];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58E0);
          }
          unint64_t v60 = *((void *)v3 + 2);
          unint64_t v59 = *((void *)v3 + 3);
          if (v60 >= v59 >> 1) {
            uint64_t v3 = sub_250BC999C((char *)(v59 > 1), v60 + 1, 1, v3, &qword_269AF58E0);
          }
          *((void *)v3 + 2) = v60 + 1;
          *(void *)&v3[8 * v60 + 32] = v58;
          unint64_t v61 = 2 * v58;
          if ((unint64_t)qword_269AF5418 >= 0x40) {
            break;
          }
          v58 *= 2;
          if (1 << qword_269AF5418 < v61) {
            goto LABEL_168;
          }
        }
        uint64_t v58 = 0;
      }
      while (!v61);
LABEL_168:
      v34 = (unint64_t *)&unk_269AF54E0;
      v35 = type metadata accessor for HTExecTerminationReason;
      v36 = type metadata accessor for HTExecTerminationReason;
      goto LABEL_170;
    }
    if (a1 == 1024)
    {
      swift_beginAccess();
      uint64_t v20 = qword_269AF5420;
      swift_beginAccess();
      uint64_t v3 = (char *)MEMORY[0x263F8EE78];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58E8);
          }
          unint64_t v22 = *((void *)v3 + 2);
          unint64_t v21 = *((void *)v3 + 3);
          if (v22 >= v21 >> 1) {
            uint64_t v3 = sub_250BC999C((char *)(v21 > 1), v22 + 1, 1, v3, &qword_269AF58E8);
          }
          *((void *)v3 + 2) = v22 + 1;
          *(void *)&v3[8 * v22 + 32] = v20;
          unint64_t v23 = 2 * v20;
          if ((unint64_t)qword_269AF5428 >= 0x40) {
            break;
          }
          v20 *= 2;
          if (1 << qword_269AF5428 < v23) {
            goto LABEL_145;
          }
        }
        uint64_t v20 = 0;
      }
      while (!v23);
LABEL_145:
      v34 = (unint64_t *)&unk_269AF54D8;
      v35 = type metadata accessor for HTSpringBoardTerminationReason;
      v36 = type metadata accessor for HTSpringBoardTerminationReason;
      goto LABEL_170;
    }
  }
  else
  {
    if (a1 == 64)
    {
      swift_beginAccess();
      uint64_t v29 = qword_269AF53F0;
      swift_beginAccess();
      uint64_t v3 = (char *)MEMORY[0x263F8EE78];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58D0);
          }
          unint64_t v31 = *((void *)v3 + 2);
          unint64_t v30 = *((void *)v3 + 3);
          unint64_t v32 = v31 + 1;
          if (v31 >= v30 >> 1) {
            uint64_t v3 = sub_250BC999C((char *)(v30 > 1), v31 + 1, 1, v3, &qword_269AF58D0);
          }
          *((void *)v3 + 2) = v32;
          *(void *)&v3[8 * v31 + 32] = v29;
          unint64_t v33 = 2 * v29;
          if ((unint64_t)qword_269AF53F8 >= 0x40) {
            break;
          }
          v29 *= 2;
          if (1 << qword_269AF53F8 < v33) {
            goto LABEL_160;
          }
        }
        uint64_t v29 = 0;
      }
      while (!v33);
LABEL_160:
      unint64_t v69 = *((void *)v3 + 3);
      if (v32 >= v69 >> 1) {
        uint64_t v3 = sub_250BC999C((char *)(v69 > 1), v31 + 2, 1, v3, &qword_269AF58D0);
      }
      *((void *)v3 + 2) = v31 + 2;
      *(void *)&v3[8 * v32 + 32] = 512;
      v34 = (unint64_t *)&unk_269AF54F0;
      v35 = type metadata accessor for HTDYLDTerminationReason;
      v36 = type metadata accessor for HTDYLDTerminationReason;
      goto LABEL_170;
    }
    if (a1 == 128)
    {
      swift_beginAccess();
      uint64_t v2 = qword_269AF5400;
      swift_beginAccess();
      uint64_t v3 = (char *)MEMORY[0x263F8EE78];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v3 = sub_250BC999C(0, *((void *)v3 + 2) + 1, 1, v3, &qword_269AF58D8);
          }
          unint64_t v5 = *((void *)v3 + 2);
          unint64_t v4 = *((void *)v3 + 3);
          if (v5 >= v4 >> 1) {
            uint64_t v3 = sub_250BC999C((char *)(v4 > 1), v5 + 1, 1, v3, &qword_269AF58D8);
          }
          *((void *)v3 + 2) = v5 + 1;
          *(void *)&v3[8 * v5 + 32] = v2;
          unint64_t v6 = 2 * v2;
          if ((unint64_t)qword_269AF5408 >= 0x40) {
            break;
          }
          v2 *= 2;
          if (1 << qword_269AF5408 < v6) {
            goto LABEL_83;
          }
        }
        uint64_t v2 = 0;
      }
      while (!v6);
LABEL_83:
      v34 = (unint64_t *)&unk_269AF54E8;
      v35 = type metadata accessor for HTLibXPCTerminationReason;
      v36 = type metadata accessor for HTLibXPCTerminationReason;
LABEL_170:
      uint64_t v1 = sub_250BC6AE8((uint64_t)v3, (uint64_t (*)(void))v35, v34, v36);
      swift_bridgeObjectRelease();
    }
  }
  return v1;
}

uint64_t static HTTerminationSubReason.allCases.getter(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v20 - v9;
  uint64_t v27 = sub_250BCC270();
  uint64_t v11 = (void (*)(uint64_t, void *))a2[3];
  uint64_t v24 = v2;
  v11(a1, a2);
  uint64_t v22 = a2[1];
  sub_250BCC290();
  unint64_t v23 = a2;
  unint64_t v12 = (uint64_t (*)(uint64_t, void *))a2[4];
  unint64_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v5 += 16;
  uint64_t v20 = v13;
  unint64_t v21 = v12;
  unint64_t v14 = (void (**)(char *, uint64_t))(v5 - 8);
  uint64_t v15 = (void (**)(char *, char *, uint64_t))(v5 + 16);
  v13(v8, v10, a1);
  while (1)
  {
    sub_250BCC2C0();
    sub_250BCC2B0();
    unint64_t v16 = 2 * v26;
    uint64_t v25 = 2 * v26;
    v26 *= 2;
    sub_250BCC300();
    unint64_t v17 = *v14;
    (*v14)(v10, a1);
    (*v15)(v10, v8, a1);
    unint64_t v18 = v21(a1, v23);
    if (v18 <= 0x3F) {
      break;
    }
    if (v16) {
      goto LABEL_6;
    }
LABEL_3:
    v20(v8, v10, a1);
  }
  if (1 << v18 >= v16) {
    goto LABEL_3;
  }
LABEL_6:
  v17(v10, a1);
  return v27;
}

uint64_t sub_250BC6AE8(uint64_t a1, uint64_t (*a2)(void), unint64_t *a3, void (*a4)(uint64_t))
{
  int64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_250BC9A94(0, v4, 0);
    uint64_t v5 = v19;
    unint64_t v10 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v12 = *v10++;
      uint64_t v11 = v12;
      uint64_t v19 = v5;
      unint64_t v14 = *(void *)(v5 + 16);
      unint64_t v13 = *(void *)(v5 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_250BC9A94((void *)(v13 > 1), v14 + 1, 1);
        uint64_t v5 = v19;
      }
      uint64_t v17 = a2(0);
      uint64_t v18 = sub_250BCA26C(a3, a4);
      *(void *)&long long v16 = v11;
      *(void *)(v5 + 16) = v14 + 1;
      sub_250BCBBF4(&v16, v5 + 40 * v14 + 32);
      --v4;
    }
    while (v4);
  }
  return v5;
}

char *static HTDYLDTerminationReason.allCases.getter()
{
  return sub_250BC9F20(&qword_269AF53F0, &qword_269AF53F8, &qword_269AF58D0, 512);
}

char *static HTWatchdogTerminationReason.allCases.getter()
{
  return sub_250BC9F20(&qword_269AF5450, &qword_269AF5458, &qword_269AF5900, 0x100000);
}

double HTTerminationReason.trackedSubReasons.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)HTProcessTerminationSettings), sel_init);
  id v5 = objc_msgSend(v4, sel_trackedSubReasonsForReason_, a1);

  if (a1 >= 0x8000)
  {
    if (a1 < 0x400000)
    {
      switch(a1)
      {
        case 0x8000:
          type metadata accessor for HTRunningBoardTerminationReason(0);
          *(void *)(a2 + 24) = v18;
          uint64_t v7 = (unint64_t *)&unk_269AF54D0;
          unint64_t v8 = type metadata accessor for HTRunningBoardTerminationReason;
          goto LABEL_34;
        case 0x40000:
          type metadata accessor for HTLibSystemTerminationReason(0);
          *(void *)(a2 + 24) = v19;
          uint64_t v7 = (unint64_t *)&unk_269AF54C8;
          unint64_t v8 = type metadata accessor for HTLibSystemTerminationReason;
          goto LABEL_34;
        case 0x100000:
          type metadata accessor for HTWatchdogTerminationReason(0);
          *(void *)(a2 + 24) = v11;
          uint64_t v7 = (unint64_t *)&unk_269AF54C0;
          unint64_t v8 = type metadata accessor for HTWatchdogTerminationReason;
          goto LABEL_34;
      }
    }
    else if (a1 > 0x7FFFFFF)
    {
      if (a1 == 0x8000000)
      {
        type metadata accessor for HTEndpointSecurityTerminationReason(0);
        *(void *)(a2 + 24) = v21;
        uint64_t v7 = (unint64_t *)&unk_269AF54A8;
        unint64_t v8 = type metadata accessor for HTEndpointSecurityTerminationReason;
        goto LABEL_34;
      }
      if (a1 == 0x100000000)
      {
        type metadata accessor for HTBacklightServicesTerminationReason(0);
        *(void *)(a2 + 24) = v13;
        uint64_t v7 = (unint64_t *)&unk_269AF54A0;
        unint64_t v8 = type metadata accessor for HTBacklightServicesTerminationReason;
        goto LABEL_34;
      }
    }
    else
    {
      if (a1 == 0x400000)
      {
        type metadata accessor for HTWatchKitTerminationReason(0);
        *(void *)(a2 + 24) = v15;
        uint64_t v7 = (unint64_t *)&unk_269AF54B8;
        unint64_t v8 = type metadata accessor for HTWatchKitTerminationReason;
        goto LABEL_34;
      }
      if (a1 == 0x800000)
      {
        type metadata accessor for HTGuardTerminationReason(0);
        *(void *)(a2 + 24) = v9;
        uint64_t v7 = (unint64_t *)&unk_269AF54B0;
        unint64_t v8 = type metadata accessor for HTGuardTerminationReason;
        goto LABEL_34;
      }
    }
  }
  else if (a1 <= 63)
  {
    switch(a1)
    {
      case 2:
        type metadata accessor for HTJetsamTerminationReason(0);
        *(void *)(a2 + 24) = v16;
        uint64_t v7 = (unint64_t *)&unk_269AF5508;
        unint64_t v8 = type metadata accessor for HTJetsamTerminationReason;
        goto LABEL_34;
      case 4:
        type metadata accessor for HTSignalTerminationReason(0);
        *(void *)(a2 + 24) = v17;
        uint64_t v7 = (unint64_t *)&unk_269AF5500;
        unint64_t v8 = type metadata accessor for HTSignalTerminationReason;
        goto LABEL_34;
      case 8:
        type metadata accessor for HTCodeSigningTerminationReason(0);
        *(void *)(a2 + 24) = v10;
        uint64_t v7 = (unint64_t *)&unk_269AF54F8;
        unint64_t v8 = type metadata accessor for HTCodeSigningTerminationReason;
        goto LABEL_34;
    }
  }
  else if (a1 > 511)
  {
    if (a1 == 512)
    {
      type metadata accessor for HTExecTerminationReason(0);
      *(void *)(a2 + 24) = v20;
      uint64_t v7 = (unint64_t *)&unk_269AF54E0;
      unint64_t v8 = type metadata accessor for HTExecTerminationReason;
      goto LABEL_34;
    }
    if (a1 == 1024)
    {
      type metadata accessor for HTSpringBoardTerminationReason(0);
      *(void *)(a2 + 24) = v12;
      uint64_t v7 = (unint64_t *)&unk_269AF54D8;
      unint64_t v8 = type metadata accessor for HTSpringBoardTerminationReason;
      goto LABEL_34;
    }
  }
  else
  {
    if (a1 == 64)
    {
      type metadata accessor for HTDYLDTerminationReason(0);
      *(void *)(a2 + 24) = v14;
      uint64_t v7 = (unint64_t *)&unk_269AF54F0;
      unint64_t v8 = type metadata accessor for HTDYLDTerminationReason;
      goto LABEL_34;
    }
    if (a1 == 128)
    {
      type metadata accessor for HTLibXPCTerminationReason(0);
      *(void *)(a2 + 24) = v6;
      uint64_t v7 = (unint64_t *)&unk_269AF54E8;
      unint64_t v8 = type metadata accessor for HTLibXPCTerminationReason;
LABEL_34:
      *(void *)(a2 + 32) = sub_250BCA26C(v7, v8);
      *(void *)a2 = v5;
      return result;
    }
  }
  *(void *)(a2 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

char *sub_250BC70CC@<X0>(char **a1@<X8>)
{
  double result = _sSo19HTTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

uint64_t static HTJetsamTerminationReason.firstCase.getter()
{
  return qword_269AF53C8;
}

uint64_t static HTJetsamTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF53C8 = a1;
  return result;
}

uint64_t (*static HTJetsamTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250BC71D8()
{
  uint64_t result = HTTerminationSubReasonShiftingForReason(2);
  qword_269AF5C68 = result << 15;
  return result;
}

uint64_t static HTJetsamTerminationReason.lastCaseRawValue.getter()
{
  if (qword_269AF5C60 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return qword_269AF5C68;
}

uint64_t static HTJetsamTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  if (qword_269AF5C60 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  qword_269AF5C68 = a1;
  return result;
}

uint64_t (*static HTJetsamTerminationReason.lastCaseRawValue.modify())()
{
  if (qword_269AF5C60 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTJetsamTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 2uLL);
}

char *sub_250BC737C@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9C94();
  *a1 = result;
  return result;
}

uint64_t sub_250BC73A4(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 2uLL);
}

uint64_t sub_250BC73AC@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF53C8;
  return result;
}

uint64_t sub_250BC73F8()
{
  if (qword_269AF5C60 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return qword_269AF5C68;
}

uint64_t static HTSignalTerminationReason.firstCase.getter()
{
  return qword_269AF53D0;
}

uint64_t static HTSignalTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF53D0 = a1;
  return result;
}

uint64_t (*static HTSignalTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTSignalTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF53D8;
}

uint64_t static HTSignalTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF53D8 = a1;
  return result;
}

uint64_t (*static HTSignalTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTSignalTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 4uLL);
}

char *sub_250BC763C@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF53D0, &qword_269AF53D8, &qword_269AF58C0);
  *a1 = result;
  return result;
}

uint64_t sub_250BC767C(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 4uLL);
}

uint64_t sub_250BC7684@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF53D0;
  return result;
}

uint64_t sub_250BC76D0()
{
  return qword_269AF53D8;
}

uint64_t static HTCodeSigningTerminationReason.firstCase.getter()
{
  return qword_269AF53E0;
}

uint64_t static HTCodeSigningTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF53E0 = a1;
  return result;
}

uint64_t (*static HTCodeSigningTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTCodeSigningTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF53E8;
}

uint64_t static HTCodeSigningTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF53E8 = a1;
  return result;
}

uint64_t (*static HTCodeSigningTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTCodeSigningTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 8uLL);
}

char *sub_250BC78E4@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF53E0, &qword_269AF53E8, &qword_269AF58C8);
  *a1 = result;
  return result;
}

uint64_t sub_250BC7924(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 8uLL);
}

uint64_t sub_250BC792C@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF53E0;
  return result;
}

uint64_t sub_250BC7978()
{
  return qword_269AF53E8;
}

uint64_t static HTDYLDTerminationReason.firstCase.getter()
{
  return qword_269AF53F0;
}

uint64_t static HTDYLDTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF53F0 = a1;
  return result;
}

uint64_t (*static HTDYLDTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTDYLDTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF53F8;
}

uint64_t static HTDYLDTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF53F8 = a1;
  return result;
}

uint64_t (*static HTDYLDTerminationReason.lastCaseRawValue.modify())()
{
  return j__swift_endAccess;
}

uint64_t HTDYLDTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x40uLL);
}

char *sub_250BC7B90@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9F20(&qword_269AF53F0, &qword_269AF53F8, &qword_269AF58D0, 512);
  *a1 = result;
  return result;
}

uint64_t sub_250BC7BD4(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x40uLL);
}

uint64_t sub_250BC7BDC@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF53F0;
  return result;
}

uint64_t sub_250BC7C28()
{
  return qword_269AF53F8;
}

uint64_t static HTLibXPCTerminationReason.firstCase.getter()
{
  return qword_269AF5400;
}

uint64_t static HTLibXPCTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5400 = a1;
  return result;
}

uint64_t (*static HTLibXPCTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTLibXPCTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5408;
}

uint64_t static HTLibXPCTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5408 = a1;
  return result;
}

uint64_t (*static HTLibXPCTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTLibXPCTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x80uLL);
}

char *sub_250BC7E3C@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5400, &qword_269AF5408, &qword_269AF58D8);
  *a1 = result;
  return result;
}

uint64_t sub_250BC7E7C(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x80uLL);
}

uint64_t sub_250BC7E84@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5400;
  return result;
}

uint64_t sub_250BC7ED0()
{
  return qword_269AF5408;
}

uint64_t static HTExecTerminationReason.firstCase.getter()
{
  return qword_269AF5410;
}

uint64_t static HTExecTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5410 = a1;
  return result;
}

uint64_t (*static HTExecTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTExecTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5418;
}

uint64_t static HTExecTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5418 = a1;
  return result;
}

uint64_t (*static HTExecTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTExecTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x200uLL);
}

char *sub_250BC80E4@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5410, &qword_269AF5418, &qword_269AF58E0);
  *a1 = result;
  return result;
}

uint64_t sub_250BC8124(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x200uLL);
}

uint64_t sub_250BC812C@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5410;
  return result;
}

uint64_t sub_250BC8178()
{
  return qword_269AF5418;
}

uint64_t static HTSpringBoardTerminationReason.firstCase.getter()
{
  return qword_269AF5420;
}

uint64_t static HTSpringBoardTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5420 = a1;
  return result;
}

uint64_t (*static HTSpringBoardTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTSpringBoardTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5428;
}

uint64_t static HTSpringBoardTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5428 = a1;
  return result;
}

uint64_t (*static HTSpringBoardTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTSpringBoardTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x400uLL);
}

char *sub_250BC838C@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5420, &qword_269AF5428, &qword_269AF58E8);
  *a1 = result;
  return result;
}

uint64_t sub_250BC83CC(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x400uLL);
}

uint64_t sub_250BC83D4@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5420;
  return result;
}

uint64_t sub_250BC8420()
{
  return qword_269AF5428;
}

uint64_t static HTRunningBoardTerminationReason.firstCase.getter()
{
  return qword_269AF5430;
}

uint64_t static HTRunningBoardTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5430 = a1;
  return result;
}

uint64_t (*static HTRunningBoardTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTRunningBoardTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5438;
}

uint64_t static HTRunningBoardTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5438 = a1;
  return result;
}

uint64_t (*static HTRunningBoardTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTRunningBoardTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x8000uLL);
}

char *sub_250BC8634@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5430, &qword_269AF5438, &qword_269AF58F0);
  *a1 = result;
  return result;
}

uint64_t sub_250BC8674(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x8000uLL);
}

uint64_t sub_250BC867C@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5430;
  return result;
}

uint64_t sub_250BC86C8()
{
  return qword_269AF5438;
}

uint64_t static HTLibSystemTerminationReason.firstCase.getter()
{
  return qword_269AF5440;
}

uint64_t static HTLibSystemTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5440 = a1;
  return result;
}

uint64_t (*static HTLibSystemTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTLibSystemTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5448;
}

uint64_t static HTLibSystemTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5448 = a1;
  return result;
}

uint64_t (*static HTLibSystemTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTLibSystemTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x40000uLL);
}

char *sub_250BC88DC@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5440, &qword_269AF5448, &qword_269AF58F8);
  *a1 = result;
  return result;
}

uint64_t sub_250BC891C(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x40000uLL);
}

uint64_t sub_250BC8924@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5440;
  return result;
}

uint64_t sub_250BC8970()
{
  return qword_269AF5448;
}

uint64_t static HTWatchdogTerminationReason.firstCase.getter()
{
  return qword_269AF5450;
}

uint64_t static HTWatchdogTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5450 = a1;
  return result;
}

uint64_t (*static HTWatchdogTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTWatchdogTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5458;
}

uint64_t static HTWatchdogTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5458 = a1;
  return result;
}

uint64_t (*static HTWatchdogTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTWatchdogTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x100000uLL);
}

char *sub_250BC8B84@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9F20(&qword_269AF5450, &qword_269AF5458, &qword_269AF5900, 0x100000);
  *a1 = result;
  return result;
}

uint64_t sub_250BC8BC8(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x100000uLL);
}

uint64_t sub_250BC8BD0@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5450;
  return result;
}

uint64_t sub_250BC8C1C()
{
  return qword_269AF5458;
}

uint64_t static HTWatchKitTerminationReason.firstCase.getter()
{
  return qword_269AF5460;
}

uint64_t static HTWatchKitTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5460 = a1;
  return result;
}

uint64_t (*static HTWatchKitTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTWatchKitTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5468;
}

uint64_t static HTWatchKitTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5468 = a1;
  return result;
}

uint64_t (*static HTWatchKitTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTWatchKitTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x400000uLL);
}

char *sub_250BC8E30@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5460, &qword_269AF5468, &qword_269AF5908);
  *a1 = result;
  return result;
}

uint64_t sub_250BC8E70(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x400000uLL);
}

uint64_t sub_250BC8E78@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5460;
  return result;
}

uint64_t sub_250BC8EC4()
{
  return qword_269AF5468;
}

uint64_t static HTGuardTerminationReason.firstCase.getter()
{
  return qword_269AF5470;
}

uint64_t static HTGuardTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5470 = a1;
  return result;
}

uint64_t (*static HTGuardTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTGuardTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5478;
}

uint64_t static HTGuardTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5478 = a1;
  return result;
}

uint64_t (*static HTGuardTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTGuardTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x800000uLL);
}

char *sub_250BC90D8@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5470, &qword_269AF5478, &qword_269AF5910);
  *a1 = result;
  return result;
}

uint64_t sub_250BC9118(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x800000uLL);
}

uint64_t sub_250BC9120@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5470;
  return result;
}

uint64_t sub_250BC916C()
{
  return qword_269AF5478;
}

uint64_t static HTEndpointSecurityTerminationReason.firstCase.getter()
{
  return qword_269AF5480;
}

uint64_t static HTEndpointSecurityTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5480 = a1;
  return result;
}

uint64_t (*static HTEndpointSecurityTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTEndpointSecurityTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5488;
}

uint64_t static HTEndpointSecurityTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5488 = a1;
  return result;
}

uint64_t (*static HTEndpointSecurityTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTEndpointSecurityTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x8000000uLL);
}

char *sub_250BC9380@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_250BC9E00(&qword_269AF5480, &qword_269AF5488, &qword_269AF5918);
  *a1 = result;
  return result;
}

uint64_t sub_250BC93C0(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x8000000uLL);
}

uint64_t sub_250BC93C8@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5480;
  return result;
}

uint64_t sub_250BC9414()
{
  return qword_269AF5488;
}

uint64_t static HTBacklightServicesTerminationReason.firstCase.getter()
{
  return qword_269AF5490;
}

uint64_t static HTBacklightServicesTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5490 = a1;
  return result;
}

uint64_t (*static HTBacklightServicesTerminationReason.firstCase.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static HTBacklightServicesTerminationReason.lastCaseRawValue.getter()
{
  return qword_269AF5498;
}

uint64_t static HTBacklightServicesTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_269AF5498 = a1;
  return result;
}

uint64_t (*static HTBacklightServicesTerminationReason.lastCaseRawValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t HTBacklightServicesTerminationReason.displayName.getter(int64_t a1)
{
  return sub_250BC9628(a1, 0x100000000uLL);
}

uint64_t sub_250BC9628(int64_t a1, unint64_t a2)
{
  id v2 = HTTerminationSubReasonDisplayName(a2, a1);
  uint64_t v3 = sub_250BCC280();

  return v3;
}

char *sub_250BC9680@<X0>(char **a1@<X8>)
{
  uint64_t result = _sSo36HTBacklightServicesTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

uint64_t sub_250BC96A8(uint64_t a1, uint64_t a2)
{
  return sub_250BC96B0(a1, a2, 0x100000000uLL);
}

uint64_t sub_250BC96B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v4 = HTTerminationSubReasonDisplayName(a3, *v3);
  uint64_t v5 = sub_250BCC280();

  return v5;
}

uint64_t sub_250BC9704@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_269AF5490;
  return result;
}

uint64_t sub_250BC9750()
{
  return qword_269AF5498;
}

BOOL sub_250BC9794(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_250BC97A8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_250BC97B4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_250BC97C4(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_250BC97D0(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_250BC97D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_250BC97F0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_250BC9804@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_250BC9818@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_250BC982C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_250BC985C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_250BC9888@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_250BC98AC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_250BC98C0(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_250BC98D4(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_250BC98E8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_250BC98FC(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_250BC9910(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_250BC9924(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_250BC9938()
{
  return *v0 == 0;
}

void *sub_250BC9948(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_250BC995C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_250BCBBBC(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

char *sub_250BC999C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_250BC9A94(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_250BC9AB4(a1, a2, a3, *v3);
  int64_t *v3 = result;
  return result;
}

void *sub_250BC9AB4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF58A8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF58B0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *_sSo19HTTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0()
{
  uint64_t v0 = sub_250BC999C(0, 1, 1, MEMORY[0x263F8EE78], &qword_269AF5928);
  unint64_t v1 = *((void *)v0 + 2);
  unint64_t v2 = 2;
  do
  {
    unint64_t v3 = *((void *)v0 + 3);
    if (v1 >= v3 >> 1) {
      uint64_t v0 = sub_250BC999C((char *)(v3 > 1), v1 + 1, 1, v0, &qword_269AF5928);
    }
    *((void *)v0 + 2) = v1 + 1;
    *(void *)&v0[8 * v1 + 32] = v2;
    uint64_t v4 = (v2 >> 41) & 0x3FFFFF;
    v2 *= 2;
    ++v1;
  }
  while (!v4);
  return v0;
}

char *sub_250BC9C94()
{
  swift_beginAccess();
  uint64_t v0 = (char *)MEMORY[0x263F8EE78];
  uint64_t v1 = qword_269AF53C8;
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v0 = sub_250BC999C(0, *((void *)v0 + 2) + 1, 1, v0, &qword_269AF58B8);
      }
      unint64_t v3 = *((void *)v0 + 2);
      unint64_t v2 = *((void *)v0 + 3);
      if (v3 >= v2 >> 1) {
        uint64_t v0 = sub_250BC999C((char *)(v2 > 1), v3 + 1, 1, v0, &qword_269AF58B8);
      }
      *((void *)v0 + 2) = v3 + 1;
      *(void *)&v0[8 * v3 + 32] = v1;
      if (qword_269AF5C60 != -1) {
        swift_once();
      }
      unint64_t v4 = 2 * v1;
      swift_beginAccess();
      if ((unint64_t)qword_269AF5C68 >= 0x40) {
        break;
      }
      v1 *= 2;
      if (1 << qword_269AF5C68 < v4) {
        return v0;
      }
    }
    uint64_t v1 = 0;
  }
  while (!v4);
  return v0;
}

char *sub_250BC9E00(uint64_t *a1, void *a2, uint64_t *a3)
{
  swift_beginAccess();
  uint64_t v6 = *a1;
  swift_beginAccess();
  int64_t v7 = (char *)MEMORY[0x263F8EE78];
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v7 = sub_250BC999C(0, *((void *)v7 + 2) + 1, 1, v7, a3);
      }
      unint64_t v9 = *((void *)v7 + 2);
      unint64_t v8 = *((void *)v7 + 3);
      if (v9 >= v8 >> 1) {
        int64_t v7 = sub_250BC999C((char *)(v8 > 1), v9 + 1, 1, v7, a3);
      }
      *((void *)v7 + 2) = v9 + 1;
      *(void *)&v7[8 * v9 + 32] = v6;
      unint64_t v10 = 2 * v6;
      if (*a2 >= 0x40uLL) {
        break;
      }
      v6 *= 2;
      if (1 << *a2 < v10) {
        return v7;
      }
    }
    uint64_t v6 = 0;
  }
  while (!v10);
  return v7;
}

char *sub_250BC9F20(uint64_t *a1, void *a2, uint64_t *a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t v8 = *a1;
  swift_beginAccess();
  unint64_t v9 = (char *)MEMORY[0x263F8EE78];
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v9 = sub_250BC999C(0, *((void *)v9 + 2) + 1, 1, v9, a3);
      }
      unint64_t v11 = *((void *)v9 + 2);
      unint64_t v10 = *((void *)v9 + 3);
      unint64_t v12 = v11 + 1;
      if (v11 >= v10 >> 1) {
        unint64_t v9 = sub_250BC999C((char *)(v10 > 1), v11 + 1, 1, v9, a3);
      }
      *((void *)v9 + 2) = v12;
      *(void *)&v9[8 * v11 + 32] = v8;
      unint64_t v13 = 2 * v8;
      if (*a2 > 0x3FuLL) {
        break;
      }
      v8 *= 2;
      if (1 << *a2 < v13) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = 0;
  }
  while (!v13);
LABEL_9:
  unint64_t v14 = *((void *)v9 + 3);
  if (v12 >= v14 >> 1) {
    unint64_t v9 = sub_250BC999C((char *)(v14 > 1), v11 + 2, 1, v9, a3);
  }
  *((void *)v9 + 2) = v11 + 2;
  *(void *)&v9[8 * v12 + 32] = a4;
  return v9;
}

char *_sSo36HTBacklightServicesTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0()
{
  swift_beginAccess();
  uint64_t v0 = qword_269AF5490;
  swift_beginAccess();
  uint64_t v1 = (char *)MEMORY[0x263F8EE78];
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v1 = sub_250BC999C(0, *((void *)v1 + 2) + 1, 1, v1, &qword_269AF5920);
      }
      unint64_t v3 = *((void *)v1 + 2);
      unint64_t v2 = *((void *)v1 + 3);
      unint64_t v4 = v3 + 1;
      if (v3 >= v2 >> 1) {
        uint64_t v1 = sub_250BC999C((char *)(v2 > 1), v3 + 1, 1, v1, &qword_269AF5920);
      }
      *((void *)v1 + 2) = v4;
      *(void *)&v1[8 * v3 + 32] = v0;
      unint64_t v5 = 2 * v0;
      if ((unint64_t)qword_269AF5498 > 0x3F) {
        break;
      }
      v0 *= 2;
      if (1 << qword_269AF5498 < v5) {
        goto LABEL_9;
      }
    }
    uint64_t v0 = 0;
  }
  while (!v5);
LABEL_9:
  unint64_t v6 = *((void *)v1 + 3);
  unint64_t v7 = v3 + 2;
  if (v4 >= v6 >> 1) {
    uint64_t v1 = sub_250BC999C((char *)(v6 > 1), v3 + 2, 1, v1, &qword_269AF5920);
  }
  *((void *)v1 + 2) = v7;
  *(void *)&v1[8 * v4 + 32] = 0x100000;
  unint64_t v8 = *((void *)v1 + 3);
  if ((uint64_t)(v3 + 3) > (uint64_t)(v8 >> 1)) {
    uint64_t v1 = sub_250BC999C((char *)(v8 > 1), v3 + 3, 1, v1, &qword_269AF5920);
  }
  *((void *)v1 + 2) = v3 + 3;
  *(void *)&v1[8 * v7 + 32] = 0x200000;
  return v1;
}

void type metadata accessor for HTBacklightServicesTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTEndpointSecurityTerminationReason(uint64_t a1)
{
}

uint64_t sub_250BCA26C(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for HTGuardTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTWatchKitTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTWatchdogTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTLibSystemTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTRunningBoardTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTSpringBoardTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTExecTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTLibXPCTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTDYLDTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTCodeSigningTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTSignalTerminationReason(uint64_t a1)
{
}

void type metadata accessor for HTJetsamTerminationReason(uint64_t a1)
{
}

uint64_t sub_250BCA3A4()
{
  return sub_250BCAABC(&qword_269AF5510, &qword_269AF5518);
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

uint64_t sub_250BCA414()
{
  return sub_250BCAABC(&qword_269AF5520, &qword_269AF5528);
}

uint64_t sub_250BCA43C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5530, type metadata accessor for HTJetsamTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA494()
{
  return sub_250BCAABC(&qword_269AF5538, &qword_269AF5540);
}

uint64_t sub_250BCA4BC(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5548, type metadata accessor for HTSignalTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA514()
{
  return sub_250BCAABC(&qword_269AF5550, &qword_269AF5558);
}

uint64_t sub_250BCA53C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5560, type metadata accessor for HTCodeSigningTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA594()
{
  return sub_250BCAABC(&qword_269AF5568, &qword_269AF5570);
}

uint64_t sub_250BCA5BC(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5578, type metadata accessor for HTDYLDTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA614()
{
  return sub_250BCAABC(&qword_269AF5580, &qword_269AF5588);
}

uint64_t sub_250BCA63C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5590, type metadata accessor for HTLibXPCTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA694()
{
  return sub_250BCAABC(&qword_269AF5598, &qword_269AF55A0);
}

uint64_t sub_250BCA6BC(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF55A8, type metadata accessor for HTExecTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA714()
{
  return sub_250BCAABC(&qword_269AF55B0, &qword_269AF55B8);
}

uint64_t sub_250BCA73C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF55C0, type metadata accessor for HTSpringBoardTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA794()
{
  return sub_250BCAABC(&qword_269AF55C8, &qword_269AF55D0);
}

uint64_t sub_250BCA7BC(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF55D8, type metadata accessor for HTRunningBoardTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA814()
{
  return sub_250BCAABC(&qword_269AF55E0, &qword_269AF55E8);
}

uint64_t sub_250BCA83C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF55F0, type metadata accessor for HTLibSystemTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA894()
{
  return sub_250BCAABC(&qword_269AF55F8, &qword_269AF5600);
}

uint64_t sub_250BCA8BC(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5608, type metadata accessor for HTWatchdogTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA914()
{
  return sub_250BCAABC(&qword_269AF5610, &qword_269AF5618);
}

uint64_t sub_250BCA93C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5620, type metadata accessor for HTWatchKitTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCA994()
{
  return sub_250BCAABC(&qword_269AF5628, &qword_269AF5630);
}

uint64_t sub_250BCA9BC(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5638, type metadata accessor for HTGuardTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCAA14()
{
  return sub_250BCAABC(&qword_269AF5640, &qword_269AF5648);
}

uint64_t sub_250BCAA3C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5650, type metadata accessor for HTEndpointSecurityTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_250BCAA94()
{
  return sub_250BCAABC(&qword_269AF5658, &qword_269AF5660);
}

uint64_t sub_250BCAABC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_250BCAB0C(uint64_t a1)
{
  uint64_t result = sub_250BCA26C(&qword_269AF5668, type metadata accessor for HTBacklightServicesTerminationReason);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of HTTerminationSubReason.displayName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static HTTerminationSubReason.firstCase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static HTTerminationSubReason.lastCaseRawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

void type metadata accessor for HTTerminationReason(uint64_t a1)
{
}

void sub_250BCABB4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_250BCABFC()
{
  return sub_250BCA26C(&qword_269AF56E8, type metadata accessor for HTBacklightServicesTerminationReason);
}

uint64_t sub_250BCAC44()
{
  return sub_250BCA26C(&qword_269AF56F0, type metadata accessor for HTBacklightServicesTerminationReason);
}

uint64_t sub_250BCAC8C()
{
  return sub_250BCA26C(&qword_269AF56F8, type metadata accessor for HTEndpointSecurityTerminationReason);
}

uint64_t sub_250BCACD4()
{
  return sub_250BCA26C(&qword_269AF5700, type metadata accessor for HTEndpointSecurityTerminationReason);
}

uint64_t sub_250BCAD1C()
{
  return sub_250BCA26C(&qword_269AF5708, type metadata accessor for HTGuardTerminationReason);
}

uint64_t sub_250BCAD64()
{
  return sub_250BCA26C(&qword_269AF5710, type metadata accessor for HTGuardTerminationReason);
}

uint64_t sub_250BCADAC()
{
  return sub_250BCA26C(&qword_269AF5718, type metadata accessor for HTWatchKitTerminationReason);
}

uint64_t sub_250BCADF4()
{
  return sub_250BCA26C(&qword_269AF5720, type metadata accessor for HTWatchKitTerminationReason);
}

uint64_t sub_250BCAE3C()
{
  return sub_250BCA26C(&qword_269AF5728, type metadata accessor for HTWatchdogTerminationReason);
}

uint64_t sub_250BCAE84()
{
  return sub_250BCA26C(&qword_269AF5730, type metadata accessor for HTWatchdogTerminationReason);
}

uint64_t sub_250BCAECC()
{
  return sub_250BCA26C(&qword_269AF5738, type metadata accessor for HTLibSystemTerminationReason);
}

uint64_t sub_250BCAF14()
{
  return sub_250BCA26C(&qword_269AF5740, type metadata accessor for HTLibSystemTerminationReason);
}

uint64_t sub_250BCAF5C()
{
  return sub_250BCA26C(&qword_269AF5748, type metadata accessor for HTRunningBoardTerminationReason);
}

uint64_t sub_250BCAFA4()
{
  return sub_250BCA26C(&qword_269AF5750, type metadata accessor for HTRunningBoardTerminationReason);
}

uint64_t sub_250BCAFEC()
{
  return sub_250BCA26C(&qword_269AF5758, type metadata accessor for HTSpringBoardTerminationReason);
}

uint64_t sub_250BCB034()
{
  return sub_250BCA26C(&qword_269AF5760, type metadata accessor for HTSpringBoardTerminationReason);
}

uint64_t sub_250BCB07C()
{
  return sub_250BCA26C(&qword_269AF5768, type metadata accessor for HTExecTerminationReason);
}

uint64_t sub_250BCB0C4()
{
  return sub_250BCA26C(&qword_269AF5770, type metadata accessor for HTExecTerminationReason);
}

uint64_t sub_250BCB10C()
{
  return sub_250BCA26C(&qword_269AF5778, type metadata accessor for HTLibXPCTerminationReason);
}

uint64_t sub_250BCB154()
{
  return sub_250BCA26C(&qword_269AF5780, type metadata accessor for HTLibXPCTerminationReason);
}

uint64_t sub_250BCB19C()
{
  return sub_250BCA26C(&qword_269AF5788, type metadata accessor for HTDYLDTerminationReason);
}

uint64_t sub_250BCB1E4()
{
  return sub_250BCA26C(&qword_269AF5790, type metadata accessor for HTDYLDTerminationReason);
}

uint64_t sub_250BCB22C()
{
  return sub_250BCA26C(&qword_269AF5798, type metadata accessor for HTCodeSigningTerminationReason);
}

uint64_t sub_250BCB274()
{
  return sub_250BCA26C(&qword_269AF57A0, type metadata accessor for HTCodeSigningTerminationReason);
}

uint64_t sub_250BCB2BC()
{
  return sub_250BCA26C(&qword_269AF57A8, type metadata accessor for HTSignalTerminationReason);
}

uint64_t sub_250BCB304()
{
  return sub_250BCA26C(&qword_269AF57B0, type metadata accessor for HTSignalTerminationReason);
}

uint64_t sub_250BCB34C()
{
  return sub_250BCA26C(&qword_269AF57B8, type metadata accessor for HTJetsamTerminationReason);
}

uint64_t sub_250BCB394()
{
  return sub_250BCA26C(&qword_269AF57C0, type metadata accessor for HTJetsamTerminationReason);
}

uint64_t sub_250BCB3DC()
{
  return sub_250BCA26C(&qword_269AF57C8, type metadata accessor for HTBacklightServicesTerminationReason);
}

uint64_t sub_250BCB424()
{
  return sub_250BCA26C(&qword_269AF57D0, type metadata accessor for HTBacklightServicesTerminationReason);
}

uint64_t sub_250BCB46C()
{
  return sub_250BCA26C(&qword_269AF57D8, type metadata accessor for HTEndpointSecurityTerminationReason);
}

uint64_t sub_250BCB4B4()
{
  return sub_250BCA26C(&qword_269AF57E0, type metadata accessor for HTEndpointSecurityTerminationReason);
}

uint64_t sub_250BCB4FC()
{
  return sub_250BCA26C(&qword_269AF57E8, type metadata accessor for HTGuardTerminationReason);
}

uint64_t sub_250BCB544()
{
  return sub_250BCA26C(&qword_269AF57F0, type metadata accessor for HTGuardTerminationReason);
}

uint64_t sub_250BCB58C()
{
  return sub_250BCA26C(&qword_269AF57F8, type metadata accessor for HTWatchKitTerminationReason);
}

uint64_t sub_250BCB5D4()
{
  return sub_250BCA26C(&qword_269AF5800, type metadata accessor for HTWatchKitTerminationReason);
}

uint64_t sub_250BCB61C()
{
  return sub_250BCA26C(&qword_269AF5808, type metadata accessor for HTWatchdogTerminationReason);
}

uint64_t sub_250BCB664()
{
  return sub_250BCA26C(&qword_269AF5810, type metadata accessor for HTWatchdogTerminationReason);
}

uint64_t sub_250BCB6AC()
{
  return sub_250BCA26C(&qword_269AF5818, type metadata accessor for HTLibSystemTerminationReason);
}

uint64_t sub_250BCB6F4()
{
  return sub_250BCA26C(&qword_269AF5820, type metadata accessor for HTLibSystemTerminationReason);
}

uint64_t sub_250BCB73C()
{
  return sub_250BCA26C(&qword_269AF5828, type metadata accessor for HTRunningBoardTerminationReason);
}

uint64_t sub_250BCB784()
{
  return sub_250BCA26C(&qword_269AF5830, type metadata accessor for HTRunningBoardTerminationReason);
}

uint64_t sub_250BCB7CC()
{
  return sub_250BCA26C(&qword_269AF5838, type metadata accessor for HTSpringBoardTerminationReason);
}

uint64_t sub_250BCB814()
{
  return sub_250BCA26C(&qword_269AF5840, type metadata accessor for HTSpringBoardTerminationReason);
}

uint64_t sub_250BCB85C()
{
  return sub_250BCA26C(&qword_269AF5848, type metadata accessor for HTExecTerminationReason);
}

uint64_t sub_250BCB8A4()
{
  return sub_250BCA26C(&qword_269AF5850, type metadata accessor for HTExecTerminationReason);
}

uint64_t sub_250BCB8EC()
{
  return sub_250BCA26C(&qword_269AF5858, type metadata accessor for HTLibXPCTerminationReason);
}

uint64_t sub_250BCB934()
{
  return sub_250BCA26C(&qword_269AF5860, type metadata accessor for HTLibXPCTerminationReason);
}

uint64_t sub_250BCB97C()
{
  return sub_250BCA26C(&qword_269AF5868, type metadata accessor for HTDYLDTerminationReason);
}

uint64_t sub_250BCB9C4()
{
  return sub_250BCA26C(&qword_269AF5870, type metadata accessor for HTDYLDTerminationReason);
}

uint64_t sub_250BCBA0C()
{
  return sub_250BCA26C(&qword_269AF5878, type metadata accessor for HTCodeSigningTerminationReason);
}

uint64_t sub_250BCBA54()
{
  return sub_250BCA26C(&qword_269AF5880, type metadata accessor for HTCodeSigningTerminationReason);
}

uint64_t sub_250BCBA9C()
{
  return sub_250BCA26C(&qword_269AF5888, type metadata accessor for HTSignalTerminationReason);
}

uint64_t sub_250BCBAE4()
{
  return sub_250BCA26C(&qword_269AF5890, type metadata accessor for HTSignalTerminationReason);
}

uint64_t sub_250BCBB2C()
{
  return sub_250BCA26C(&qword_269AF5898, type metadata accessor for HTJetsamTerminationReason);
}

uint64_t sub_250BCBB74()
{
  return sub_250BCA26C(&qword_269AF58A0, type metadata accessor for HTJetsamTerminationReason);
}

uint64_t sub_250BCBBBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_250BCBBF4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t HTHangsDataEntry.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_creationDate);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_250BCC250();

    uint64_t v5 = sub_250BCC260();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_250BCC260();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t HTHang.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_creationDate);
  sub_250BCC250();

  uint64_t v4 = sub_250BCC260();
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, 0, 1, v4);
}

uint64_t HTAnalyticsSendEventLazy_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2_cold_1(v0);
}

uint64_t __getNEVPNManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __29__HTHangReporterService_init__block_invoke_cold_1(v0);
}

uint64_t sub_250BCC250()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_250BCC260()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_250BCC270()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_250BCC280()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_250BCC290()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_250BCC2A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_250BCC2B0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_250BCC2C0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_250BCC2E0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_250BCC2F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_250BCC300()
{
  return MEMORY[0x270FA00C0]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x270EE4CB0](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

uint64_t HTPrefsKeysToRestoreForPrefix()
{
  return MEMORY[0x270F30A30]();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
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

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
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

void objc_moveWeak(id *to, id *from)
{
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

uint64_t tailspin_buffer_size_set()
{
  return MEMORY[0x270F9B950]();
}

uint64_t tailspin_config_apply_sync()
{
  return MEMORY[0x270F9B958]();
}

uint64_t tailspin_config_create_with_default_config()
{
  return MEMORY[0x270F9B978]();
}

uint64_t tailspin_config_free()
{
  return MEMORY[0x270F9B990]();
}

uint64_t tailspin_enabled_set()
{
  return MEMORY[0x270F9B9C0]();
}

uint64_t tailspin_full_sampling_period_set()
{
  return MEMORY[0x270F9B9D0]();
}

uint64_t tailspin_oncore_sampling_period_set()
{
  return MEMORY[0x270F9B9F0]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x270EDBE38]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}