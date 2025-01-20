@interface APBrowserRapportManager
@end

@implementation APBrowserRapportManager

uint64_t __APBrowserRapportManager_runOnQueue_block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 40) + 51)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __APBrowserRapportManager_ensureScanningStarted_block_invoke_6;
  v3[3] = &unk_1E688BDB8;
  v3[4] = a2;
  APBrowserRapportManager_runOnQueue(v2, (uint64_t)v3);
}

uint64_t __APBrowserRapportManager_ensureScanningStarted_block_invoke_6(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    if (gLogCategory_APBrowserRapportManager <= 90)
    {
      if (gLogCategory_APBrowserRapportManager != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

uint64_t ___APBrowserRapportManager_getActiveManagers_block_invoke()
{
  uint64_t result = FigCFWeakReferenceTableCreate();
  if (result)
  {
    uint64_t result = gLogCategory_APBrowserRapportManager;
    if (gLogCategory_APBrowserRapportManager <= 100) {
      uint64_t result = ___APBrowserRapportManager_getActiveManagers_block_invoke_cold_1(gLogCategory_APBrowserRapportManager);
    }
    __break(1u);
  }
  return result;
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __APBrowserRapportManager_ensureScanningStarted_block_invoke_2;
  v3[3] = &unk_1E688BDB8;
  v3[4] = a2;
  APBrowserRapportManager_runOnQueue(v2, (uint64_t)v3);
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) idsDeviceIdentifier];
    if (v4)
    {
      v5 = (const void *)v4;
      v6 = (const void *)[v2 effectiveIdentifier];
      v7 = (void *)[v2 model];
      uint64_t v8 = [v2 mediaRouteIdentifier];
      if (([v7 containsString:@"Mac"] & 1) == 0
        && ([v7 hasPrefix:@"RealityDevice"] & 1) == 0
        && (!APSCanSendToAltReceiver()
         || ([v7 hasPrefix:@"iPhone"] & 1) == 0
         && ![v7 hasPrefix:@"iPad"]))
      {
        return;
      }
      unsigned int v9 = [v2 statusFlags];
      uint64_t v10 = [v2 serviceTypes];
      if (v10) {
        int v37 = objc_msgSend((id)objc_msgSend(v2, "serviceTypes"), "containsObject:", @"com.apple.airplay.discovery.service");
      }
      else {
        int v37 = 1;
      }
      uint64_t v36 = a2;
      CFDictionaryGetTypeID();
      TypedValue = (__CFDictionary *)CFDictionaryGetTypedValue();
      v12 = TypedValue;
      if (TypedValue) {
        CFRetain(TypedValue);
      }
      int v13 = (v9 >> 19) & 1;
      if (gLogCategory_APBrowserRapportManager <= 40
        && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
      {
        [v2 name];
        [v2 model];
        LogPrintF();
      }
      if (v12)
      {
        CFSetGetTypeID();
        v14 = (__CFSet *)CFDictionaryGetTypedValue();
        if (!v14)
        {
          APSLogErrorAt();
          goto LABEL_59;
        }
        v15 = v6;
        v34 = v5;
        v35 = v14;
        CFRetain(v14);
        unsigned __int8 Int64 = CFDictionaryGetInt64();
        uint64_t v17 = CFDictionaryGetInt64();
        int v18 = CFDictionaryGetInt64() != 0;
        CFStringGetTypeID();
        v19 = (const void *)CFDictionaryGetTypedValue();
        if (v13 == Int64)
        {
          int v20 = 0;
        }
        else
        {
          CFDictionarySetInt64();
          int v20 = 1;
        }
        v30 = (void *)v36;
        if (v8 && (const void *)v8 != v19 && (!v19 || !CFEqual((CFTypeRef)v8, v19)))
        {
          FigCFDictionarySetValue();
          int v20 = 1;
        }
        if (v10)
        {
          v6 = v15;
          if (!v17)
          {
            CFDictionarySetValue(v12, @"isServiceAvailabilityKnown", (const void *)*MEMORY[0x1E4F1CFD0]);
            int v20 = 1;
          }
          int v28 = v37;
          v23 = v35;
          if (v37 == v18)
          {
            v5 = v34;
          }
          else
          {
            v32 = (const void **)MEMORY[0x1E4F1CFD0];
            if (!v37) {
              v32 = (const void **)MEMORY[0x1E4F1CFC8];
            }
            CFDictionarySetValue(v12, @"isServiceAvailable", *v32);
            v5 = v34;
            if (v37)
            {
              CFSetRemoveAllValues(v35);
              int v28 = 1;
            }
            int v20 = 1;
          }
        }
        else
        {
          int v28 = v18;
          v6 = v15;
          v5 = v34;
          v23 = v35;
        }
        CFStringGetTypeID();
        uint64_t v31 = CFDictionaryGetTypedValue();
        if (!v20) {
          goto LABEL_52;
        }
        goto LABEL_48;
      }
      CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
      if (Mutable)
      {
        v23 = Mutable;
        v24 = CFDictionaryCreateMutable(v21, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (!v24)
        {
          APSLogErrorAt();
          v33 = v23;
          goto LABEL_60;
        }
        v12 = v24;
        CFDictionarySetValue(v24, @"rapportDeviceID", v5);
        CFDictionarySetInt64();
        v25 = (const void *)*MEMORY[0x1E4F1CFD0];
        v26 = (const void *)*MEMORY[0x1E4F1CFC8];
        if (v10) {
          v27 = (const void *)*MEMORY[0x1E4F1CFD0];
        }
        else {
          v27 = (const void *)*MEMORY[0x1E4F1CFC8];
        }
        CFDictionarySetValue(v12, @"isServiceAvailabilityKnown", v27);
        int v28 = v37;
        if (v37) {
          v29 = v25;
        }
        else {
          v29 = v26;
        }
        CFDictionarySetValue(v12, @"isServiceAvailable", v29);
        CFDictionarySetValue(v12, @"effectiveIDsAttempted", v23);
        FigCFDictionarySetValue();
        v30 = (void *)v36;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v36 + 80), v5, v12);
        uint64_t v31 = 0;
LABEL_48:
        if (v31 | v8)
        {
          if (APBrowserRapportManager_sendDeviceEvent(v30, (uint64_t)v12))
          {
            APSLogErrorAt();
            if (gLogCategory_APBrowserRapportManager > 90
              || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_58;
            }
            goto LABEL_74;
          }
        }
        else
        {
          uint64_t v31 = 0;
        }
LABEL_52:
        if (v31 | v8)
        {
          if (gLogCategory_APBrowserRapportManager > 30
            || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_58;
          }
        }
        else if (CFDictionaryGetValue(v12, @"directClient"))
        {
          if (gLogCategory_APBrowserRapportManager > 30
            || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_58;
          }
        }
        else
        {
          if (CFSetContainsValue(v23, v6)) {
            goto LABEL_58;
          }
          if (v28)
          {
            if (APBrowserRapportManager_sendGetInfo((uint64_t)v30, (uint64_t)v2, v5, v6)) {
              APSLogErrorAt();
            }
            goto LABEL_58;
          }
          if (gLogCategory_APBrowserRapportManager > 30
            || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
          {
LABEL_58:
            CFRelease(v23);
LABEL_59:
            v33 = v12;
LABEL_60:
            CFRelease(v33);
            return;
          }
        }
LABEL_74:
        LogPrintF();
        goto LABEL_58;
      }
    }
  }
  APSLogErrorAt();
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __APBrowserRapportManager_ensureScanningStarted_block_invoke_4;
  v3[3] = &unk_1E688BDB8;
  v3[4] = a2;
  APBrowserRapportManager_runOnQueue(v2, (uint64_t)v3);
}

uint64_t __APBrowserRapportManager_ensureScanningStarted_block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1 && [*(id *)(a1 + 32) idsDeviceIdentifier])
  {
    [v1 effectiveIdentifier];
    CFDictionaryGetTypeID();
    uint64_t result = CFDictionaryGetTypedValue();
    if (result)
    {
      if (gLogCategory_APBrowserRapportManager <= 30)
      {
        if (gLogCategory_APBrowserRapportManager != -1) {
          return LogPrintF();
        }
        uint64_t result = _LogCategory_Initialize();
        if (result) {
          return LogPrintF();
        }
      }
    }
  }
  else
  {
    return APSLogErrorAt();
  }
  return result;
}

void __APBrowserRapportManager_sendGetInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __APBrowserRapportManager_sendGetInfo_block_invoke_2;
  v4[3] = &unk_1E688BE48;
  long long v5 = *(_OWORD *)(a1 + 40);
  v4[4] = a2;
  APBrowserRapportManager_runOnQueue(v3, (uint64_t)v4);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __APBrowserRapportManager_sendGetInfo_block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v3 = (const void *)a1[5];
  uint64_t v4 = (const void *)a1[6];
  long long v5 = (__CFError *)a1[4];
  if (gLogCategory_APBrowserRapportManager <= 40
    && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v3 || (CFDictionaryGetTypeID(), (Typeduint64_t Value = (__CFDictionary *)CFDictionaryGetTypedValue()) == 0))
  {
    APSLogErrorAt();
LABEL_24:
    APBrowserRapportManager_tryNextEffectiveID(a2, v3);
    return;
  }
  v7 = TypedValue;
  if (!*(_WORD *)(a2 + 48))
  {
LABEL_23:
    CFDictionaryRemoveValue(v7, @"directClient");
    goto LABEL_24;
  }
  if (v5)
  {
    if (CFErrorGetCode(v5) == -71165)
    {
      CFDictionarySetValue(v7, @"isServiceAvailabilityKnown", (const void *)*MEMORY[0x1E4F1CFD0]);
      CFDictionarySetValue(v7, @"isServiceAvailable", (const void *)*MEMORY[0x1E4F1CFC8]);
      CFDictionaryRemoveValue(v7, @"directClient");
      return;
    }
    goto LABEL_23;
  }
  uint64_t v8 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(TypedValue, @"isServiceAvailabilityKnown", (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(v7, @"isServiceAvailable", v8);
  if (!CFDictionaryGetValue(v7, @"directClient")
    || (uint64_t Value = APSWrapperGetValue()) == 0
    || (uint64_t v10 = (void *)Value,
        (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])) == 0))
  {
    APSLogErrorAt();
    goto LABEL_23;
  }
  CFMutableDictionaryRef v12 = Mutable;
  if (gLogCategory_APBrowserRapportManager <= 40
    && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v13 = *(void *)(a2 + 40);
  CFRetain(v3);
  CFRetain(v4);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __APBrowserRapportManager_handleDirectClientActivation_block_invoke;
  v14[3] = &__block_descriptor_56_e51_v32__0__NSDictionary_8__NSDictionary_16__NSError_24l;
  v14[4] = v13;
  v14[5] = v3;
  v14[6] = v4;
  [v10 sendRequestID:@"com.apple.airplay.discovery.getinfo" request:v12 options:0 responseHandler:v14];
  CFRelease(v12);
}

void __APBrowserRapportManager_handleDirectClientActivation_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __APBrowserRapportManager_handleDirectClientActivation_block_invoke_2;
  v6[3] = &unk_1E688BE90;
  long long v7 = *(_OWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a4;
  APBrowserRapportManager_runOnQueue(v5, (uint64_t)v6);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __APBrowserRapportManager_handleDirectClientActivation_block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v3 = (const void *)a1[7];
  uint64_t v4 = (const void *)a1[4];
  uint64_t v5 = (__CFError *)a1[6];
  if (gLogCategory_APBrowserRapportManager <= 40
    && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v3)
  {
    CFDictionaryGetTypeID();
    Typeduint64_t Value = (__CFDictionary *)CFDictionaryGetTypedValue();
    if (TypedValue)
    {
      long long v7 = TypedValue;
      if (*(_WORD *)(a2 + 48))
      {
        if (v5)
        {
          if (CFErrorGetCode(v5) == -71165)
          {
            CFDictionarySetValue(v7, @"isServiceAvailabilityKnown", (const void *)*MEMORY[0x1E4F1CFD0]);
            CFDictionarySetValue(v7, @"isServiceAvailable", (const void *)*MEMORY[0x1E4F1CFC8]);
            uint64_t v4 = 0;
            int v8 = 0;
LABEL_29:
            CFDictionaryRemoveValue(v7, @"directClient");
            goto LABEL_30;
          }
          goto LABEL_27;
        }
        unsigned int v9 = (const void *)*MEMORY[0x1E4F1CFD0];
        CFDictionarySetValue(TypedValue, @"isServiceAvailabilityKnown", (const void *)*MEMORY[0x1E4F1CFD0]);
        CFDictionarySetValue(v7, @"isServiceAvailable", v9);
        if (!v4)
        {
LABEL_25:
          APSLogErrorAt();
LABEL_28:
          int v8 = 1;
          goto LABEL_29;
        }
        if (!CFDictionaryContainsKey(v7, @"bonjourDeviceID"))
        {
          CFStringGetTypeID();
          uint64_t v4 = (const void *)CFDictionaryGetTypedValue();
          if (v4)
          {
            if (gLogCategory_APBrowserRapportManager <= 40
              && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            CFDictionarySetValue(v7, @"bonjourDeviceID", v4);
            if (!APBrowserRapportManager_sendDeviceEvent((void *)a2, (uint64_t)v7)) {
              goto LABEL_28;
            }
          }
          goto LABEL_25;
        }
        if (gLogCategory_APBrowserRapportManager <= 40
          && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
LABEL_27:
      uint64_t v4 = 0;
      goto LABEL_28;
    }
  }
  APSLogErrorAt();
  uint64_t v4 = 0;
  int v8 = 1;
LABEL_30:
  if (v8 && !v4)
  {
    APBrowserRapportManager_tryNextEffectiveID(a2, v3);
  }
}

void __APBrowserRapportManager_dispatchEvent_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t __APBrowserRapportManager_copyShowInfo_block_invoke(int a1, int a2, CFDictionaryRef theDict)
{
  return CFStringAppendF();
}

uint64_t ___APBrowserRapportManager_getActiveManagers_block_invoke_cold_1(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

@end