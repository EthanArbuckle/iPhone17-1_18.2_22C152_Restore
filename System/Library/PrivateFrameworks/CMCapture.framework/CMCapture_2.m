uint64_t ReplayKitLibraryCore()
{
  if (!ReplayKitLibraryCore_frameworkLibrary) {
    ReplayKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return ReplayKitLibraryCore_frameworkLibrary;
}

uint64_t getshowReactionsTipSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getshowReactionsTipSymbolLoc_ptr;
  uint64_t v6 = getshowReactionsTipSymbolLoc_ptr;
  if (!getshowReactionsTipSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getshowReactionsTipSymbolLoc_block_invoke;
    v2[3] = &unk_1E5C24978;
    v2[4] = &v3;
    __getshowReactionsTipSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A5D5450C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ReplayKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ReplayKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getshowReactionsTipSymbolLoc_block_invoke(uint64_t a1)
{
  v4 = 0;
  v2 = (void *)ReplayKitLibraryCore();
  if (!v2) {
    __getshowReactionsTipSymbolLoc_block_invoke_cold_1(&v4);
  }
  uint64_t result = dlsym(v2, "showReactionsTip");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getshowReactionsTipSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t cs_updateCameraHistoryDownplayOverrideListForPreferenceKey(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = [(id)sCameraHistoryDownplayOverrideList containsObject:a1];
    if (result) {
      return result;
    }
    [(id)sCameraHistoryDownplayOverrideList addObject:a1];
  }
  else
  {
    uint64_t result = [(id)sCameraHistoryDownplayOverrideList count];
    if (!result) {
      return result;
    }
    [(id)sCameraHistoryDownplayOverrideList removeAllObjects];
  }
  if (dword_1EB4C4FD0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  pthread_mutex_lock((pthread_mutex_t *)sTemporaryCameraHistoryItemsLock);
  [(id)sTemporaryCameraHistoryItems setObject:sCameraHistoryDownplayOverrideList forKeyedSubscript:@"camera-history-downplay-override-list"];
  [(id)sServerUserDefaults setObject:sTemporaryCameraHistoryItems forKey:@"tmp"];
  return pthread_mutex_unlock((pthread_mutex_t *)sTemporaryCameraHistoryItemsLock);
}

Class __getCMIOExtensionProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreMediaIOLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreMediaIOLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5C2D6F8;
    uint64_t v5 = 0;
    CoreMediaIOLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreMediaIOLibraryCore_frameworkLibrary) {
    __getCMIOExtensionProviderClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CMIOExtensionProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getCMIOExtensionProviderClass_block_invoke_cold_2();
  }
  getCMIOExtensionProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __CoreMediaIOLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMediaIOLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t flatDictionary_register()
{
  sFigFlatDictionaryClass = 0;
  unk_1EB4C5850 = "FigFlatDictionary";
  qword_1EB4C5858 = (uint64_t)flatDictionary_init;
  unk_1EB4C5860 = 0;
  qword_1EB4C5868 = (uint64_t)flatDictionary_finalize;
  unk_1EB4C5870 = 0u;
  unk_1EB4C5880 = 0u;
  uint64_t result = _CFRuntimeRegisterClass();
  sFigFlatDictionaryID = result;
  return result;
}

uint64_t flatDictionaryKeySpec_register()
{
  sFigFlatDictionaryKeySpecClass = 0;
  *(void *)algn_1EB4C58B8 = "FigFlatDictionaryKeySpec";
  qword_1EB4C58C0 = (uint64_t)flatDictionaryKeySpec_init;
  unk_1EB4C58C8 = 0;
  qword_1EB4C58D0 = (uint64_t)flatDictionaryKeySpec_finalize;
  unk_1EB4C58D8 = 0u;
  unk_1EB4C58E8 = 0u;
  uint64_t result = _CFRuntimeRegisterClass();
  sFigFlatDictionaryKeySpecID = result;
  return result;
}

uint64_t FigFlatDictionaryContainsValueForKey(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (!a2) {
    return 0;
  }
  if (a3)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3)
    {
      BOOL v4 = 0;
      uint64_t v5 = *(unsigned int *)(a2 + 4);
      if ((v5 & 0x80000000) == 0)
      {
        uint64_t v6 = *(void *)(v3 + 8);
        if (v5 < *(_DWORD *)(v6 + 32)) {
          BOOL v4 = *(_DWORD *)(*(void *)(v6 + 40) + 4 * v5) != -1;
        }
      }
    }
    else
    {
      BOOL v4 = 0;
    }
    *a3 = v4;
  }
  uint64_t v7 = *(void *)(a1 + 24);
  int v8 = *(_DWORD *)(*(void *)(*(void *)(v7 + 8) + 40) + 4 * *(int *)(a2 + 4));
  if (v8 == -1) {
    return 0;
  }
  else {
    return (*(unsigned __int8 *)(*(void *)(v7 + 32) + (v8 >> 3)) >> (v8 & 7)) & 1;
  }
}

uint64_t FigFlatDictionaryGetCountOfKeysWithValues(uint64_t a1, int8x8_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  unsigned int v3 = *(_DWORD *)(*(void *)(v2 + 8) + 36) + 7;
  if (v3 < 8) {
    return 0;
  }
  LODWORD(result) = 0;
  uint64_t v5 = v3 >> 3;
  uint64_t v6 = (unsigned __int8 *)(*(void *)(v2 + 24) + 12);
  do
  {
    __int32 v8 = *v6++;
    __int32 v7 = v8;
    if (v8)
    {
      a2.i32[0] = v7;
      a2 = vcnt_s8(a2);
      a2.i16[0] = vaddlv_u8((uint8x8_t)a2);
      __int32 v7 = a2.i32[0];
    }
    uint64_t result = (v7 + result);
    --v5;
  }
  while (v5);
  return result;
}

uint64_t FigFlatDictionaryGetKeysWithValues(uint64_t a1, uint64_t a2, unsigned int *a3, int8x8_t a4)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    unsigned int v8 = *a3;
    if (v8 >= FigFlatDictionaryGetCountOfKeysWithValues(a1, a4))
    {
      *a3 = 0;
      uint64_t v9 = *(void *)(a1 + 24);
      uint64_t v10 = *(void *)(v9 + 8);
      if (*(_DWORD *)(v10 + 36))
      {
        uint64_t v11 = 0;
        int v12 = 0;
        unint64_t v13 = 0;
        unsigned int v14 = 0;
        do
        {
          uint64_t v15 = *(void *)(*(void *)(v10 + 48) + v11);
          if (v15)
          {
            int v16 = *(_DWORD *)(*(void *)(v10 + 40) + 4 * *(int *)(v15 + 4));
            if (v16 != -1 && ((*(unsigned __int8 *)(*(void *)(v9 + 32) + (v16 >> 3)) >> (v16 & 7)) & 1) != 0)
            {
              *(void *)(a2 + 8 * v14) = v15;
              *a3 = ++v12;
              ++v14;
              uint64_t v9 = *(void *)(a1 + 24);
            }
          }
          ++v13;
          uint64_t v10 = *(void *)(v9 + 8);
          v11 += 24;
        }
        while (v13 < *(unsigned int *)(v10 + 36));
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void FigFlatDictionaryRemoveValue(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3)
    {
      uint64_t v5 = *(unsigned int *)(a2 + 4);
      if ((v5 & 0x80000000) == 0)
      {
        uint64_t v6 = *(void *)(v3 + 8);
        if (v5 < *(_DWORD *)(v6 + 32))
        {
          int v7 = *(_DWORD *)(*(void *)(v6 + 40) + 4 * v5);
          if (v7 != -1)
          {
            uint64_t v8 = *(unsigned int *)(*(void *)(v6 + 48) + 24 * v7 + 8);
            if (flatDictionary_setterCheck(a1))
            {
              uint64_t v9 = *(const void **)(a2 + 32);
              unsigned int v10 = *(_DWORD *)(a2 + 16) - 7;
              if (v9)
              {
                if (v10 > 1)
                {
                  int v12 = (void *)(*(void *)(*(void *)(a1 + 24) + 40) + v8);
                  size_t v11 = *(void *)(a2 + 24);
                }
                else
                {
                  size_t v11 = (*(_DWORD *)(a2 + 24) - 4);
                  *(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 40) + v8) = v11;
                  int v12 = (void *)(v8 + *(void *)(*(void *)(a1 + 24) + 40) + 4);
                  uint64_t v9 = *(const void **)(a2 + 32);
                }
                memcpy(v12, v9, v11);
              }
              else
              {
                uint64_t v13 = *(void *)(a1 + 24);
                if (v10 > 2)
                {
                  uint64_t v15 = (void *)(*(void *)(v13 + 40) + v8);
                  size_t v14 = *(void *)(a2 + 24);
                }
                else
                {
                  size_t v14 = *(unsigned int *)(*(void *)(*(void *)(v13 + 8) + 48)
                                        + 24
                                        * *(int *)(*(void *)(*(void *)(v13 + 8) + 40) + 4 * *(int *)(a2 + 4))
                                        + 12);
                  uint64_t v15 = (void *)(*(void *)(v13 + 40) + v8);
                }
                bzero(v15, v14);
              }
              uint64_t v16 = *(void *)(a1 + 24);
              int v17 = *(_DWORD *)(*(void *)(*(void *)(v16 + 8) + 40) + 4 * *(int *)(a2 + 4));
              *(unsigned char *)(*(void *)(v16 + 32) + (v17 >> 3)) &= ~(1 << (v17 & 7));
            }
          }
        }
      }
    }
  }
}

uint64_t FigFlatDictionaryGetInt16(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  __int16 __dst = 0;
  if (!a2
    || (uint64_t v3 = *(void **)(a1 + 24)) == 0
    || (uint64_t v4 = *(unsigned int *)(a2 + 4), (v4 & 0x80000000) != 0)
    || (uint64_t v5 = v3[1], v4 >= *(_DWORD *)(v5 + 32))
    || (int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4), v6 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, &__dst);
    return __dst;
  }
  else
  {
    __int16 v7 = *(_WORD *)(v3[5] + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
    if (a3) {
      *a3 = (*(unsigned __int8 *)(v3[4] + (v6 >> 3)) >> (v6 & 7)) & 1;
    }
  }
  return v7;
}

uint64_t FigFlatDictionaryGetInt32(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unsigned int __dst = 0;
  if (!a2
    || (uint64_t v3 = *(void **)(a1 + 24)) == 0
    || (uint64_t v4 = *(unsigned int *)(a2 + 4), (v4 & 0x80000000) != 0)
    || (uint64_t v5 = v3[1], v4 >= *(_DWORD *)(v5 + 32))
    || (int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4), v6 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, &__dst);
    return __dst;
  }
  else
  {
    uint64_t result = *(unsigned int *)(v3[5] + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
    if (a3) {
      *a3 = (*(unsigned __int8 *)(v3[4] + (v6 >> 3)) >> (v6 & 7)) & 1;
    }
  }
  return result;
}

uint64_t FigFlatDictionarySetInt64(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 24);
    if (v4)
    {
      uint64_t v6 = *(unsigned int *)(a2 + 4);
      if ((v6 & 0x80000000) == 0)
      {
        uint64_t v7 = *(void *)(v4 + 8);
        if (v6 < *(_DWORD *)(v7 + 32))
        {
          int v8 = *(_DWORD *)(*(void *)(v7 + 40) + 4 * v6);
          if (v8 != -1)
          {
            uint64_t v10 = *(unsigned int *)(*(void *)(v7 + 48) + 24 * v8 + 8);
            uint64_t result = flatDictionary_setterCheck(result);
            if (result)
            {
              *(void *)(*(void *)(*(void *)(v3 + 24) + 40) + v10) = a3;
              uint64_t v11 = *(void *)(v3 + 24);
              int v12 = *(_DWORD *)(*(void *)(*(void *)(v11 + 8) + 40) + 4 * *(int *)(a2 + 4));
              *(unsigned char *)(*(void *)(v11 + 32) + (v12 >> 3)) |= 1 << (v12 & 7);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t FigFlatDictionaryGetInt64(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t __dst = 0;
  if (!a2
    || (uint64_t v3 = *(void **)(a1 + 24)) == 0
    || (uint64_t v4 = *(unsigned int *)(a2 + 4), (v4 & 0x80000000) != 0)
    || (uint64_t v5 = v3[1], v4 >= *(_DWORD *)(v5 + 32))
    || (int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4), v6 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, &__dst);
    return __dst;
  }
  else
  {
    uint64_t result = *(void *)(v3[5] + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
    if (a3) {
      *a3 = (*(unsigned __int8 *)(v3[4] + (v6 >> 3)) >> (v6 & 7)) & 1;
    }
  }
  return result;
}

uint64_t FigFlatDictionarySetBool(uint64_t result, uint64_t a2, char a3)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 24);
    if (v4)
    {
      uint64_t v6 = *(unsigned int *)(a2 + 4);
      if ((v6 & 0x80000000) == 0)
      {
        uint64_t v7 = *(void *)(v4 + 8);
        if (v6 < *(_DWORD *)(v7 + 32))
        {
          int v8 = *(_DWORD *)(*(void *)(v7 + 40) + 4 * v6);
          if (v8 != -1)
          {
            uint64_t v10 = *(unsigned int *)(*(void *)(v7 + 48) + 24 * v8 + 8);
            uint64_t result = flatDictionary_setterCheck(result);
            if (result)
            {
              *(unsigned char *)(*(void *)(*(void *)(v3 + 24) + 40) + v10) = a3;
              uint64_t v11 = *(void *)(v3 + 24);
              int v12 = *(_DWORD *)(*(void *)(*(void *)(v11 + 8) + 40) + 4 * *(int *)(a2 + 4));
              *(unsigned char *)(*(void *)(v11 + 32) + (v12 >> 3)) |= 1 << (v12 & 7);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t FigFlatDictionaryGetBool(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unsigned __int8 __dst = 0;
  if (!a2
    || (uint64_t v3 = *(void **)(a1 + 24)) == 0
    || (uint64_t v4 = *(unsigned int *)(a2 + 4), (v4 & 0x80000000) != 0)
    || (uint64_t v5 = v3[1], v4 >= *(_DWORD *)(v5 + 32))
    || (int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4), v6 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, &__dst);
    return __dst;
  }
  else
  {
    uint64_t result = *(unsigned __int8 *)(v3[5] + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
    if (a3) {
      *a3 = (*(unsigned __int8 *)(v3[4] + (v6 >> 3)) >> (v6 & 7)) & 1;
    }
  }
  return result;
}

uint64_t FigFlatDictionarySetFloat32(uint64_t result, uint64_t a2, float a3)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 24);
    if (v4)
    {
      uint64_t v6 = *(unsigned int *)(a2 + 4);
      if ((v6 & 0x80000000) == 0)
      {
        uint64_t v7 = *(void *)(v4 + 8);
        if (v6 < *(_DWORD *)(v7 + 32))
        {
          int v8 = *(_DWORD *)(*(void *)(v7 + 40) + 4 * v6);
          if (v8 != -1)
          {
            uint64_t v10 = *(unsigned int *)(*(void *)(v7 + 48) + 24 * v8 + 8);
            uint64_t result = flatDictionary_setterCheck(result);
            if (result)
            {
              *(float *)(*(void *)(*(void *)(v3 + 24) + 40) + v10) = a3;
              uint64_t v11 = *(void *)(v3 + 24);
              int v12 = *(_DWORD *)(*(void *)(*(void *)(v11 + 8) + 40) + 4 * *(int *)(a2 + 4));
              *(unsigned char *)(*(void *)(v11 + 32) + (v12 >> 3)) |= 1 << (v12 & 7);
            }
          }
        }
      }
    }
  }
  return result;
}

float FigFlatDictionaryGetFloat32(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  float __dst = 0.0;
  if (!a2
    || (uint64_t v3 = *(void **)(a1 + 24)) == 0
    || (uint64_t v4 = *(unsigned int *)(a2 + 4), (v4 & 0x80000000) != 0)
    || (uint64_t v5 = v3[1], v4 >= *(_DWORD *)(v5 + 32))
    || (int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4), v6 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, &__dst);
    return __dst;
  }
  else
  {
    float result = *(float *)(v3[5] + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
    if (a3) {
      *a3 = (*(unsigned __int8 *)(v3[4] + (v6 >> 3)) >> (v6 & 7)) & 1;
    }
  }
  return result;
}

uint64_t FigFlatDictionarySetFloat64(uint64_t result, uint64_t a2, double a3)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 24);
    if (v4)
    {
      uint64_t v6 = *(unsigned int *)(a2 + 4);
      if ((v6 & 0x80000000) == 0)
      {
        uint64_t v7 = *(void *)(v4 + 8);
        if (v6 < *(_DWORD *)(v7 + 32))
        {
          int v8 = *(_DWORD *)(*(void *)(v7 + 40) + 4 * v6);
          if (v8 != -1)
          {
            uint64_t v10 = *(unsigned int *)(*(void *)(v7 + 48) + 24 * v8 + 8);
            float result = flatDictionary_setterCheck(result);
            if (result)
            {
              *(double *)(*(void *)(*(void *)(v3 + 24) + 40) + v10) = a3;
              uint64_t v11 = *(void *)(v3 + 24);
              int v12 = *(_DWORD *)(*(void *)(*(void *)(v11 + 8) + 40) + 4 * *(int *)(a2 + 4));
              *(unsigned char *)(*(void *)(v11 + 32) + (v12 >> 3)) |= 1 << (v12 & 7);
            }
          }
        }
      }
    }
  }
  return result;
}

double FigFlatDictionaryGetFloat64(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  double __dst = 0.0;
  if (!a2
    || (uint64_t v3 = *(void **)(a1 + 24)) == 0
    || (uint64_t v4 = *(unsigned int *)(a2 + 4), (v4 & 0x80000000) != 0)
    || (uint64_t v5 = v3[1], v4 >= *(_DWORD *)(v5 + 32))
    || (int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4), v6 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, &__dst);
    return __dst;
  }
  else
  {
    double result = *(double *)(v3[5] + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
    if (a3) {
      *a3 = (*(unsigned __int8 *)(v3[4] + (v6 >> 3)) >> (v6 & 7)) & 1;
    }
  }
  return result;
}

void FigFlatDictionaryGetCMTime(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  if (!a2
    || (uint64_t v4 = *(void **)(a1 + 24)) == 0
    || (uint64_t v5 = *(unsigned int *)(a2 + 4), (v5 & 0x80000000) != 0)
    || (uint64_t v6 = v4[1], v5 >= *(_DWORD *)(v6 + 32))
    || (uint64_t v7 = *(void *)(v6 + 40), v8 = *(_DWORD *)(v7 + 4 * v5), v8 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, a4);
  }
  else
  {
    uint64_t v9 = (long long *)(v4[5] + *(unsigned int *)(*(void *)(v6 + 48) + 24 * v8 + 8));
    long long v10 = *v9;
    a4[2] = *((void *)v9 + 2);
    *(_OWORD *)a4 = v10;
    if (a3)
    {
      int v11 = *(_DWORD *)(v7 + 4 * v5);
      if (v11 == -1) {
        LOBYTE(v12) = 0;
      }
      else {
        int v12 = (*(unsigned __int8 *)(v4[4] + (v11 >> 3)) >> (v11 & 7)) & 1;
      }
      *a3 = v12;
    }
  }
}

uint64_t FigFlatDictionarySetCGRect(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(result + 24);
    if (v7)
    {
      uint64_t v9 = *(unsigned int *)(a2 + 4);
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v10 = *(void *)(v7 + 8);
        if (v9 < *(_DWORD *)(v10 + 32))
        {
          int v11 = *(_DWORD *)(*(void *)(v10 + 40) + 4 * v9);
          if (v11 != -1)
          {
            uint64_t v16 = *(unsigned int *)(*(void *)(v10 + 48) + 24 * v11 + 8);
            double result = flatDictionary_setterCheck(result);
            if (result)
            {
              int v17 = (double *)(*(void *)(*(void *)(v6 + 24) + 40) + v16);
              *int v17 = a3;
              v17[1] = a4;
              v17[2] = a5;
              v17[3] = a6;
              uint64_t v18 = *(void *)(v6 + 24);
              int v19 = *(_DWORD *)(*(void *)(*(void *)(v18 + 8) + 40) + 4 * *(int *)(a2 + 4));
              *(unsigned char *)(*(void *)(v18 + 32) + (v19 >> 3)) |= 1 << (v19 & 7);
            }
          }
        }
      }
    }
  }
  return result;
}

double FigFlatDictionaryGetCGRect(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  __dst[4] = *MEMORY[0x1E4F143B8];
  if (!a2
    || (uint64_t v3 = *(void **)(a1 + 24)) == 0
    || (uint64_t v4 = *(unsigned int *)(a2 + 4), (v4 & 0x80000000) != 0)
    || (uint64_t v5 = v3[1], v4 >= *(_DWORD *)(v5 + 32))
    || (int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4), v6 == -1))
  {
    FigFlatDictionaryKeyGetDefaultValue(a2, __dst);
    return *(double *)__dst;
  }
  else
  {
    double result = *(double *)(v3[5] + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
    if (a3) {
      *a3 = (*(unsigned __int8 *)(v3[4] + (v6 >> 3)) >> (v6 & 7)) & 1;
    }
  }
  return result;
}

uint64_t FigFlatDictionarySetString(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    uint64_t v7 = *(void *)(a1 + 24);
    if (!v7) {
      return 1;
    }
    uint64_t v9 = *(unsigned int *)(a2 + 4);
    uint64_t result = 1;
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = *(void *)(v7 + 8);
      if (v9 < *(_DWORD *)(v10 + 32))
      {
        int v11 = *(_DWORD *)(*(void *)(v10 + 40) + 4 * v9);
        if (v11 != -1)
        {
          uint64_t v13 = *(unsigned int *)(*(void *)(v10 + 48) + 24 * v11 + 8);
          if (flatDictionary_setterCheck(a1))
          {
            uint64_t v14 = *(void *)(a1 + 24);
            if (*(_DWORD *)(*(void *)(*(void *)(v14 + 8) + 48)
                           + 24 * *(int *)(*(void *)(*(void *)(v14 + 8) + 40) + 4 * *(int *)(a2 + 4))
                           + 12)
               - 4 < a4)
              return 0;
            memcpy((void *)(*(void *)(v14 + 40) + v13 + 4), a3, a4);
            *(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 40) + v13) = a4;
            uint64_t v15 = *(void *)(a1 + 24);
            int v16 = *(_DWORD *)(*(void *)(*(void *)(v15 + 8) + 40) + 4 * *(int *)(a2 + 4));
            uint64_t result = 1;
            *(unsigned char *)(*(void *)(v15 + 32) + (v16 >> 3)) |= 1 << (v16 & 7);
            return result;
          }
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t FigFlatDictionaryGetStringSize(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  if (a2 && a3 && a4)
  {
    uint64_t v4 = *(void *)(result + 24);
    if (!v4
      || (uint64_t v5 = *(unsigned int *)(a2 + 4), (v5 & 0x80000000) != 0)
      || (uint64_t v6 = *(void *)(v4 + 8), v5 >= *(_DWORD *)(v6 + 32))
      || (int v7 = *(_DWORD *)(*(void *)(v6 + 40) + 4 * v5), v7 == -1))
    {
      *a4 = 0;
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = *(void *)(v6 + 48) + 24 * v7;
      uint64_t v9 = *(unsigned int *)(v8 + 8);
      *a4 = *(_DWORD *)(v8 + 12) - 4;
      *a3 = *(_DWORD *)(*(void *)(v4 + 40) + v9);
    }
  }
  return result;
}

uint64_t FigFlatDictionaryGetString(uint64_t a1, uint64_t a2, unsigned char *a3, void *__dst, unsigned int *a5)
{
  uint64_t result = 0;
  if (a2 && __dst && a5)
  {
    uint64_t v8 = *(void *)(a1 + 24);
    if (!v8) {
      return 1;
    }
    uint64_t v10 = *(unsigned int *)(a2 + 4);
    uint64_t result = 1;
    if ((v10 & 0x80000000) == 0)
    {
      uint64_t v11 = *(void *)(v8 + 8);
      if (v10 < *(_DWORD *)(v11 + 32))
      {
        int v12 = *(_DWORD *)(*(void *)(v11 + 40) + 4 * v10);
        if (v12 != -1)
        {
          uint64_t v13 = (unsigned int *)(*(void *)(v8 + 40) + *(unsigned int *)(*(void *)(v11 + 48) + 24 * v12 + 8));
          unsigned int v14 = *v13;
          if (!*v13 || v14 > *a5) {
            return 0;
          }
          memcpy(__dst, v13 + 1, *v13);
          *a5 = v14;
          if (a3)
          {
            uint64_t v16 = *(void *)(a1 + 24);
            int v17 = *(_DWORD *)(*(void *)(*(void *)(v16 + 8) + 40) + 4 * *(int *)(a2 + 4));
            if (v17 == -1) {
              LOBYTE(v18) = 0;
            }
            else {
              int v18 = (*(unsigned __int8 *)(*(void *)(v16 + 32) + (v17 >> 3)) >> (v17 & 7)) & 1;
            }
            *a3 = v18;
          }
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t FigFlatDictionaryGetDataSize(uint64_t result, uint64_t a2, int *a3, _DWORD *a4)
{
  if (a2 && a3)
  {
    uint64_t v4 = *(void *)(result + 24);
    if (!v4
      || (uint64_t v5 = *(unsigned int *)(a2 + 4), (v5 & 0x80000000) != 0)
      || (uint64_t v6 = *(void *)(v4 + 8), v5 >= *(_DWORD *)(v6 + 32))
      || (int v7 = *(_DWORD *)(*(void *)(v6 + 40) + 4 * v5), v7 == -1))
    {
      if (a4) {
        *a4 = 0;
      }
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = *(void *)(v6 + 48);
      uint64_t v9 = *(unsigned int *)(v8 + 24 * v7 + 8);
      if (a4) {
        *a4 = *(_DWORD *)(v8 + 24 * v7 + 12) - 4;
      }
      if (*(_DWORD *)(a2 + 16) == 8) {
        int v10 = *(_DWORD *)(*(void *)(v4 + 40) + v9);
      }
      else {
        int v10 = *(_DWORD *)(v8 + 24 * v7 + 12) - 4;
      }
      *a3 = v10;
    }
  }
  return result;
}

uint64_t FigFlatDictionaryGetData(uint64_t a1, uint64_t a2, unsigned char *a3, void *__dst, unsigned int *a5)
{
  uint64_t result = 0;
  if (a2 && __dst && a5)
  {
    uint64_t v8 = *(void *)(a1 + 24);
    if (!v8) {
      return 1;
    }
    uint64_t v10 = *(unsigned int *)(a2 + 4);
    uint64_t result = 1;
    if ((v10 & 0x80000000) == 0)
    {
      uint64_t v11 = *(void *)(v8 + 8);
      if (v10 < *(_DWORD *)(v11 + 32))
      {
        int v12 = *(_DWORD *)(*(void *)(v11 + 40) + 4 * v10);
        if (v12 != -1)
        {
          uint64_t v14 = *(void *)(v11 + 48);
          uint64_t v15 = *(unsigned int *)(v14 + 24 * v12 + 8);
          if (*(_DWORD *)(a2 + 16) == 8)
          {
            unsigned int v16 = *(_DWORD *)(*(void *)(v8 + 40) + v15);
            if (!v16) {
              return 0;
            }
          }
          else
          {
            int v17 = *(_DWORD *)(v14 + 24 * v12 + 12);
            unsigned int v16 = v17 - 4;
            if (v17 == 4) {
              return 0;
            }
          }
          if (v16 > *a5) {
            return 0;
          }
          memcpy(__dst, (const void *)(*(void *)(v8 + 40) + v15 + 4), v16);
          *a5 = v16;
          if (a3)
          {
            uint64_t v18 = *(void *)(a1 + 24);
            int v19 = *(_DWORD *)(*(void *)(*(void *)(v18 + 8) + 40) + 4 * *(int *)(a2 + 4));
            if (v19 == -1) {
              LOBYTE(v20) = 0;
            }
            else {
              int v20 = (*(unsigned __int8 *)(*(void *)(v18 + 32) + (v19 >> 3)) >> (v19 & 7)) & 1;
            }
            *a3 = v20;
          }
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t FigFlatDictionaryGetArrayDataType(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = *(unsigned int *)(a2 + 4);
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v5 = *(void *)(v2 + 8);
    if (v4 < *(_DWORD *)(v5 + 32))
    {
      int v6 = *(_DWORD *)(*(void *)(v5 + 40) + 4 * v4);
      if (v6 != -1) {
        return *(unsigned int *)(*(void *)(v2 + 40) + *(unsigned int *)(*(void *)(v5 + 48) + 24 * v6 + 8));
      }
      return 0;
    }
  }
  return result;
}

uint64_t FigFlatDictionaryCreateMutableWithValues(uint64_t a1, const __CFAllocator *a2, uint64_t a3, uint64_t a4)
{
  return flatDictionary_create(a1, a2, a3, a4, 1);
}

uint64_t FigFlatDictionaryCreate(uint64_t a1, const __CFAllocator *a2, uint64_t a3, uint64_t a4)
{
  return flatDictionary_create(a1, a2, a3, a4, 0);
}

CFTypeRef FigFlatDictionaryCreateCopy(const __CFAllocator *a1, const __CFAllocator *a2, const void *a3, char a4)
{
  return flatDictionary_copy(a1, a2, a3, 0, a4);
}

CFTypeRef flatDictionary_copy(const __CFAllocator *a1, const __CFAllocator *a2, CFTypeRef cf, unsigned __int8 a4, char a5)
{
  if (*((unsigned char *)cf + 16) | a4) {
    goto LABEL_2;
  }
  CFAllocatorRef v17 = CFGetAllocator(cf);
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAllocatorRef Default = a1;
  if ((const __CFAllocator *)*MEMORY[0x1E4F1CF80] == a1) {
    CFAllocatorRef Default = CFAllocatorGetDefault();
  }
  if (v18 == v17) {
    CFAllocatorRef v17 = CFAllocatorGetDefault();
  }
  if (!CFEqual(Default, v17)) {
    goto LABEL_2;
  }
  CFAllocatorRef v20 = (CFAllocatorRef)**((void **)cf + 3);
  CFAllocatorRef v21 = a2;
  if (v18 == a2) {
    CFAllocatorRef v21 = CFAllocatorGetDefault();
  }
  if (v18 == v20) {
    CFAllocatorRef v20 = CFAllocatorGetDefault();
  }
  if (CFEqual(v21, v20))
  {
    return CFRetain(cf);
  }
  else
  {
LABEL_2:
    MEMORY[0x1A62711C0](&FigFlatDictionaryGetTypeID_sRegisterFigFlatDictionaryOnce, flatDictionary_register);
    uint64_t Instance = _CFRuntimeCreateInstance();
    *(unsigned char *)(Instance + 16) = a4;
    if (a5) {
      goto LABEL_8;
    }
    CFAllocatorRef v11 = (CFAllocatorRef)**((void **)cf + 3);
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFAllocatorRef v13 = a2;
    if ((const __CFAllocator *)*MEMORY[0x1E4F1CF80] == a2) {
      CFAllocatorRef v13 = CFAllocatorGetDefault();
    }
    if (v12 == v11) {
      CFAllocatorRef v11 = CFAllocatorGetDefault();
    }
    if (CFEqual(v13, v11))
    {
LABEL_8:
      uint64_t v14 = FigFlatDictionaryContentCopy(a2, *((void *)cf + 3));
      *(void *)(Instance + 24) = v14;
      uint64_t v15 = (atomic_uint *)(v14 + 2);
    }
    else
    {
      uint64_t v22 = *((void *)cf + 3);
      *(void *)(Instance + 24) = v22;
      uint64_t v15 = (atomic_uint *)(v22 + 16);
    }
    atomic_fetch_add(v15, 1u);
    return (CFTypeRef)Instance;
  }
}

CFTypeRef FigFlatDictionaryCreateMutableCopy(const __CFAllocator *a1, const __CFAllocator *a2, const void *a3, char a4)
{
  return flatDictionary_copy(a1, a2, a3, 1u, a4);
}

BOOL FigFlatDictionaryKeySpecContainsKey(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(*(void *)(a1 + 40) + 4 * *(int *)(a2 + 4)) != -1;
}

uint64_t FigFlatDictionaryKeySpecGetIdentifier(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 20)) {
    return *(unsigned int *)(a1 + 16);
  }
  else {
    return 0;
  }
}

uint64_t FigFlatDictionaryKeySpecGetKeySpace(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

uint64_t FigFlatDictionaryKeySpecReconstructFromBinary(const __CFAllocator *a1, int *a2)
{
  MEMORY[0x1A62711C0](&FigFlatDictionaryKeySpecGetTypeID_sRegisterFigFlatDictionaryKeySpecOnce, flatDictionaryKeySpec_register);
  uint64_t Instance = _CFRuntimeCreateInstance();
  int KeySpaceWithLabel = FigFlatDictionaryKeySpaceGetKeySpaceWithLabel(*a2);
  *(_DWORD *)(Instance + 28) = KeySpaceWithLabel;
  if (FigFlatDictionaryKeySpaceIsValid(KeySpaceWithLabel))
  {
    int v6 = a2[2];
    *(_DWORD *)(Instance + 16) = a2[1];
    *(_DWORD *)(Instance + 36) = v6;
    unsigned int NumberOfRegisteredKeys = FigFlatDictionaryKeySpaceGetNumberOfRegisteredKeys(*(_DWORD *)(Instance + 28));
    *(_DWORD *)(Instance + 32) = NumberOfRegisteredKeys;
    *(unsigned char *)(Instance + 20) = 1;
    uint64_t v8 = (char *)CFAllocatorAllocate(a1, 24 * *(unsigned int *)(Instance + 36) + 4 * NumberOfRegisteredKeys, 0);
    uint64_t v9 = *(unsigned int *)(Instance + 36);
    uint64_t v10 = &v8[4 * *(unsigned int *)(Instance + 32)];
    *(void *)(Instance + 40) = v8;
    *(void *)(Instance + 48) = v10;
    *(void *)(Instance + 56) = v8;
    CFAllocatorRef v11 = (char *)(a2 + 3);
    memcpy(v10, v11, 24 * v9);
    int v12 = *(_DWORD *)(Instance + 36);
    if (!v12) {
      return Instance;
    }
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = &v11[24 * v12];
    uint64_t v16 = *(void *)(Instance + 48);
    while (1)
    {
      *(void *)(*(void *)(Instance + 48) + v13) = FigFlatDictionaryKeyLookupFromIdentifier(*(_DWORD *)(Instance + 28), (uint64_t)&v15[*(void *)(v16 + v13)]);
      uint64_t v16 = *(void *)(Instance + 48);
      uint64_t v17 = *(void *)(v16 + v13);
      if (!v17) {
        break;
      }
      *(_DWORD *)(*(void *)(Instance + 40) + 4 * *(int *)(v17 + 4)) = v14++;
      v13 += 24;
      if (v14 >= *(unsigned int *)(Instance + 36)) {
        return Instance;
      }
    }
  }
  if (FigSignalErrorAt())
  {
    CFRelease((CFTypeRef)Instance);
    return 0;
  }
  return Instance;
}

uint64_t FigFlatDictionaryCreateFromBacking(uint64_t a1, const __CFAllocator *a2, uint64_t a3, _DWORD *a4)
{
  return flatDictionary_createFromBacking(a1, a2, a3, a4, 0);
}

uint64_t flatDictionary_createFromBacking(uint64_t a1, const __CFAllocator *a2, uint64_t a3, _DWORD *a4, char a5)
{
  if (a4[2] != *(_DWORD *)(a3 + 16)) {
    return 0;
  }
  int v6 = *(_DWORD *)(a3 + 36);
  if (!v6) {
    return 0;
  }
  int v10 = 0;
  CFAllocatorRef v11 = (int *)(*(void *)(a3 + 48) + 12);
  uint64_t v12 = *(unsigned int *)(a3 + 36);
  do
  {
    int v13 = *v11;
    v11 += 6;
    v10 += v13;
    --v12;
  }
  while (v12);
  if (!v10) {
    return 0;
  }
  unsigned int v14 = v10 + ((v6 + 7) >> 3) + 12;
  MEMORY[0x1A62711C0](&FigFlatDictionaryGetTypeID_sRegisterFigFlatDictionaryOnce, flatDictionary_register);
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(unsigned char *)(Instance + 16) = a5;
  uint64_t v16 = FigFlatDictionaryContentCreate(a2, (_DWORD *)a3, v14);
  *(void *)(Instance + 24) = v16;
  *((_DWORD *)v16 + 4) = 1;
  memcpy(v16[3], a4, *((unsigned int *)v16 + 5));
  return Instance;
}

uint64_t FigFlatDictionaryCreateMutableFromBacking(uint64_t a1, const __CFAllocator *a2, uint64_t a3, _DWORD *a4)
{
  return flatDictionary_createFromBacking(a1, a2, a3, a4, 1);
}

void flatDictionaryKeySpec_finalize(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  uint64_t v3 = (void *)a1[7];
  CFAllocatorDeallocate(v2, v3);
}

void *FigFlatDictionaryContentCopy(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t v4 = CFAllocatorAllocate(a1, 48, 0);
  uint64_t v5 = CFAllocatorAllocate(a1, *(unsigned int *)(a2 + 20), 0);
  v4[3] = v5;
  memcpy(v5, *(const void **)(a2 + 24), *(unsigned int *)(a2 + 20));
  uint64_t v6 = v4[3] + 12;
  int v7 = *(_DWORD **)(a2 + 8);
  uint64_t v8 = v6 + ((v7[9] + 7) >> 3);
  v4[4] = v6;
  v4[5] = v8;
  void *v4 = a1;
  *((_DWORD *)v4 + 5) = *(_DWORD *)(a2 + 20);
  v4[1] = CFRetain(v7);
  *((_DWORD *)v4 + 4) = 0;
  return v4;
}

id pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2)));
  [v6 addObject:a3];
  id v7 = (id)[v6 copy];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, objc_msgSend(NSNumber, "numberWithInt:", a2));
  uint64_t v8 = (void *)[v5 copy];
  return v8;
}

void sub_1A5D61F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1A5D687D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A5D6BF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

void sub_1A5D72C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v4 = 0;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a1 && a3)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "outputSampleBufferRouterForBufferType:", a4), "outputSampleBufferRouter");
    if (v9)
    {
      uint64_t v10 = v9;
      v13[0] = [NSNumber numberWithUnsignedLongLong:a4];
      uint64_t v4 = 1;
      objc_msgSend(a2, "addOutputSampleBufferRouter:forBufferTypes:", v10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 1));
      uint64_t v12 = [NSNumber numberWithUnsignedLongLong:a4];
      objc_msgSend(a3, "addOutputSampleBufferRouter:forBufferTypes:", a1, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v12, 1));
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

void *pen_validateDepthMetadata(void *result, void *a2)
{
  if (result)
  {
    uint64_t result = (void *)[result objectForKeyedSubscript:*MEMORY[0x1E4F530C0]];
    if (result)
    {
      memset(&v5, 0, sizeof(v5));
      CMTimeMakeFromDictionary(&v5, (CFDictionaryRef)result);
      BWGetOriginalPresentationTimeStampFromBuffer(a2, (uint64_t)&time2);
      CMTime v3 = v5;
      return (void *)(CMTimeCompare(&v3, &time2) == 0);
    }
  }
  return result;
}

uint64_t pen_setDistortionCorrectionParametersOnDCInputUsingDepthMetadata(void *a1, void *a2)
{
  [a1 setGeometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset:1];
  objc_msgSend(a1, "setGeometricDistortionCorrectionForwardPolynomial:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F55888]));
  objc_msgSend(a1, "setGeometricDistortionCorrectionInversePolynomial:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F55898]));
  size.width = 0.0;
  size.height = 0.0;
  CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F55880]], &size);
  float64x2_t v10 = 0uLL;
  CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F55890]], (CGPoint *)&v10);
  __asm { FMOV            V2.2D, #-0.5 }
  return objc_msgSend(a1, "setGeometricDistortionCorrectionOpticalCenterOffset:", vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64(v10, vmulq_f64((float64x2_t)size, _Q2)))));
}

void sub_1A5D7A14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __ubn_dispatch_async_block_invoke_0(uint64_t a1)
{
  CFAllocatorRef v2 = (void *)MEMORY[0x1A6272C70]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __ubn_dispatch_group_async_block_invoke_0(uint64_t a1)
{
  CFAllocatorRef v2 = (void *)MEMORY[0x1A6272C70]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t FigImageControl_LockExposure()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 7464) != 3)
  {
    *(_DWORD *)(DerivedStorage + 7464) = 3;
    *(unsigned char *)(DerivedStorage + 7456) = 0;
  }
  return 0;
}

uint64_t FigImageControl_SpotMetering(uint64_t a1, int a2, int a3, int a4, int a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 7464) != 2
    || *(_DWORD *)(DerivedStorage + 7476) != a2
    || *(_DWORD *)(DerivedStorage + 7480) != a3
    || *(_DWORD *)(DerivedStorage + 7484) != a4
    || *(_DWORD *)(DerivedStorage + 7488) != a5)
  {
    *(_DWORD *)(DerivedStorage + 7464) = 2;
    *(_DWORD *)(DerivedStorage + 7476) = a2;
    *(_DWORD *)(DerivedStorage + 7480) = a3;
    *(_DWORD *)(DerivedStorage + 7484) = a4;
    *(_DWORD *)(DerivedStorage + 7488) = a5;
    *(unsigned char *)(DerivedStorage + 7456) = 0;
  }
  return 0;
}

uint64_t FigImageControl_SetSpotMeteringAreaOfInterest(uint64_t a1, int a2, int a3, int a4, int a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 7464) == 2)
  {
    if (*(_DWORD *)(DerivedStorage + 7476) != a2
      || *(_DWORD *)(DerivedStorage + 7480) != a3
      || *(_DWORD *)(DerivedStorage + 7484) != a4
      || *(_DWORD *)(DerivedStorage + 7488) != a5)
    {
      *(_DWORD *)(DerivedStorage + 7476) = a2;
      *(_DWORD *)(DerivedStorage + 7480) = a3;
      *(_DWORD *)(DerivedStorage + 7484) = a4;
      *(_DWORD *)(DerivedStorage + 7488) = a5;
      *(unsigned char *)(DerivedStorage + 7457) = 1;
    }
  }
  else
  {
    FigImageControl_SpotMetering(a1, a2, a3, a4, a5);
  }
  return 0;
}

uint64_t FigImageControl_FlashMetering(uint64_t a1, int a2, int a3, int a4, int a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 7464) != 2
    || *(_DWORD *)(DerivedStorage + 7476) != a2
    || *(_DWORD *)(DerivedStorage + 7480) != a3
    || *(_DWORD *)(DerivedStorage + 7484) != a4
    || *(_DWORD *)(DerivedStorage + 7488) != a5)
  {
    *(_DWORD *)(DerivedStorage + 7464) = 5;
    *(_DWORD *)(DerivedStorage + 7476) = a2;
    *(_DWORD *)(DerivedStorage + 7480) = a3;
    *(_DWORD *)(DerivedStorage + 7484) = a4;
    *(_DWORD *)(DerivedStorage + 7488) = a5;
    *(unsigned char *)(DerivedStorage + 7456) = 0;
  }
  return 0;
}

uint64_t FigImageControl_ManualExposure(float a1, float a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 7464) != 4
    || *(float *)(DerivedStorage + 7496) != a2
    || *(float *)(DerivedStorage + 7492) != a1)
  {
    *(_DWORD *)(DerivedStorage + 7464) = 4;
    *(float *)(DerivedStorage + 7496) = a2;
    *(void *)(DerivedStorage + 7512) = 0;
    *(void *)(DerivedStorage + 7504) = 0;
    *(_DWORD *)(DerivedStorage + 7500) = -1082130432;
    *(float *)(DerivedStorage + 7492) = a1;
    *(unsigned char *)(DerivedStorage + 7456) = 0;
  }
  return 0;
}

uint64_t FigImageControl_ManualExposureWithISO(float a1, double a2, double a3, float a4, uint64_t a5, int a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a6
    || *(_DWORD *)(DerivedStorage + 7464) != 4
    || *(float *)(DerivedStorage + 7500) != a4
    || *(float *)(DerivedStorage + 7492) != a1
    || *(double *)(DerivedStorage + 7504) != a2
    || *(double *)(DerivedStorage + 7512) != a3)
  {
    *(_DWORD *)(DerivedStorage + 7464) = 4;
    *(_DWORD *)(DerivedStorage + 7496) = 0;
    *(float *)(DerivedStorage + 7500) = a4;
    *(float *)(DerivedStorage + 7492) = a1;
    *(double *)(DerivedStorage + 7504) = a2;
    *(double *)(DerivedStorage + 7512) = a3;
    *(_DWORD *)(DerivedStorage + 7520) = a6;
    *(unsigned char *)(DerivedStorage + 7456) = 0;
  }
  return 0;
}

uint64_t unlockAEnow(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMTime v3 = (unsigned char *)DerivedStorage;
  uint64_t v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (*(_DWORD *)(DerivedStorage + 40) != 4)
  {
    uint64_t result = captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54C80], (const void *)*MEMORY[0x1E4F1CFD0]);
    if (!result) {
      goto LABEL_18;
    }
    fig_log_get_emitter();
LABEL_26:
    uint64_t result = FigDebugAssert3();
    goto LABEL_18;
  }
  *(unsigned char *)(DerivedStorage + 17705) = 0;
  if (*(_DWORD *)(DerivedStorage + 1548))
  {
    int valuePtr = 0xFFFF;
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54628], v5))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    CFRelease(v5);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54A28], Mutable))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    CFRelease(Mutable);
    if (!v3[1566])
    {
      CFNumberRef v7 = CFNumberCreate(0, kCFNumberIntType, v3 + 616);
      if (captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54700], v7))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      CFRelease(v7);
    }
    int v8 = FigCapturePlatformIdentifier();
    uint64_t result = FigImageControl_SetExposureStabilityZone(a1, 0, flt_1A5F0D360[v8 < 10]);
  }
  else
  {
    uint64_t result = captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54C80], *v4);
    if (result)
    {
      fig_log_get_emitter();
      uint64_t result = FigDebugAssert3();
    }
  }
  if (!v3[1564])
  {
    uint64_t result = captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54C90], *v4);
    if (result)
    {
      fig_log_get_emitter();
      goto LABEL_26;
    }
  }
LABEL_18:
  if (v3[508])
  {
    uint64_t result = captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54C98], *v4);
    if (result)
    {
      fig_log_get_emitter();
      uint64_t result = FigDebugAssert3();
    }
  }
  if (v3[520])
  {
    uint64_t result = captureStreamSetPropertyOnActivityScheduler(a1, (const void *)*MEMORY[0x1E4F54CA0], *v4);
    if (result)
    {
      fig_log_get_emitter();
      uint64_t result = FigDebugAssert3();
    }
  }
  v3[7472] = 0;
  return result;
}

void FigImageControl_InvalidateExposure(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  FigImageControl_RestoreAEValues(a1);
  if (*(unsigned char *)(DerivedStorage + 7472)) {
    unlockAEnow(a1);
  }
  CMTime v3 = *(void ***)(DerivedStorage + 7560);
  if (v3)
  {
    if (*v3)
    {
      free(*v3);
      CMTime v3 = *(void ***)(DerivedStorage + 7560);
    }
    free(v3);
    *(void *)(DerivedStorage + 7560) = 0;
  }
}

void setupExposureWindow(uint64_t a1, __int16 a2, unsigned __int16 a3, __int16 a4, __int16 a5, int a6)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 9052))
  {
    uint64_t v12 = DerivedStorage;
    int v13 = *(_DWORD *)(DerivedStorage + 7552);
    __int16 v28 = a5;
    __int16 v29 = a4;
    __int16 valuePtr = a2;
    unsigned __int16 v26 = a3;
    if (a2 < 0)
    {
      a4 += a2;
      __int16 v29 = a4;
      __int16 valuePtr = 0;
      a2 = 0;
    }
    if ((a3 & 0x8000) != 0)
    {
      unsigned __int16 v14 = 0;
      a5 += a3;
      __int16 v28 = a5;
      unsigned __int16 v26 = 0;
    }
    else
    {
      unsigned __int16 v14 = a3;
    }
    if (a4 + a2 >= 1001)
    {
      a4 = 1000 - a2;
      __int16 v29 = 1000 - a2;
    }
    if (a5 + v14 >= 961)
    {
      a5 = 960 - v14;
      __int16 v28 = 960 - v14;
    }
    if (v13 > a4)
    {
      __int16 v29 = v13;
      int v15 = (__int16)(a2 - ((__int16)(v13 - a4 + ((unsigned __int16)((v13 - a4) & 0x8000) >> 15)) >> 1));
      int v16 = v15 & ~(v15 >> 31);
      __int16 valuePtr = v16;
      if (v16 + (__int16)v13 >= 1001) {
        __int16 valuePtr = 1000 - v13;
      }
    }
    if (v13 > a5)
    {
      __int16 v28 = v13;
      unsigned int v17 = (__int16)(v13 - a5 + ((unsigned __int16)((v13 - a5) & 0x8000) >> 15));
      int v18 = (__int16)(v14 - (v17 >> 1)) & ~((__int16)(v14 - (v17 >> 1)) >> 31);
      unsigned __int16 v26 = v18;
      if (v18 + (__int16)v13 >= 961) {
        unsigned __int16 v26 = 960 - v13;
      }
    }
    *(_OWORD *)keys = 0u;
    long long v34 = 0u;
    *(_OWORD *)values = 0u;
    long long v31 = 0u;
    CFNumberRef v32 = 0;
    int v19 = (void *)*MEMORY[0x1E4F52F48];
    uint64_t v35 = 0;
    keys[0] = v19;
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt16Type, &valuePtr);
    keys[1] = *(void **)MEMORY[0x1E4F52F78];
    values[1] = CFNumberCreate(v20, kCFNumberSInt16Type, &v26);
    *(void *)&long long v34 = *MEMORY[0x1E4F52F88];
    *(void *)&long long v31 = CFNumberCreate(v20, kCFNumberSInt16Type, &v29);
    *((void *)&v34 + 1) = *MEMORY[0x1E4F52F50];
    *((void *)&v31 + 1) = CFNumberCreate(v20, kCFNumberSInt16Type, &v28);
    int v25 = a6 ^ 1;
    uint64_t v35 = *MEMORY[0x1E4F52F80];
    CFNumberRef v32 = CFNumberCreate(v20, kCFNumberIntType, &v25);
    CFDictionaryRef v21 = CFDictionaryCreate(v20, (const void **)keys, (const void **)values, 5, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    int v22 = 0;
    int v25 = 0;
    do
    {
      CFRelease(values[v22]);
      int v23 = v25;
      int v22 = ++v25;
    }
    while (v23 < 4);
    v24 = *(const void **)(v12 + 7544);
    if (v24) {
      CFRelease(v24);
    }
    *(void *)(v12 + 7544) = v21;
    atomic_fetch_add_explicit((atomic_uint *volatile)(v12 + 7460), 1u, memory_order_relaxed);
  }
}

uint64_t exposure_table_initialize(uint64_t a1, CFDictionaryRef theDict)
{
  if (!a1 || !theDict)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  *(_OWORD *)(a1 + 16) = xmmword_1A5F0D390;
  uint64_t v4 = (double *)(a1 + 16);
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"ExposureDelta");
  if (Value)
  {
    CFNumberRef v6 = Value;
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberDoubleType, v4);
      if (*v4 > 1.0) {
        double *v4 = 1.0 / *v4;
      }
    }
  }
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"StabilityZone");
  if (v8)
  {
    CFNumberRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v9, kCFNumberDoubleType, v4 + 1);
      if (v4[1] > 1.0) {
        v4[1] = 1.0 / v4[1];
      }
    }
  }
  CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue(theDict, @"IntegrationTime");
  if (!v11) {
    return 4294954516;
  }
  CFArrayRef v12 = v11;
  CFTypeID v13 = CFGetTypeID(v11);
  if (v13 != CFArrayGetTypeID()) {
    return 4294954516;
  }
  CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue(theDict, @"MaxGain");
  if (!v14) {
    return 4294954516;
  }
  CFArrayRef v15 = v14;
  CFTypeID v16 = CFGetTypeID(v14);
  if (v16 != CFArrayGetTypeID()) {
    return 4294954516;
  }
  CFIndex Count = CFArrayGetCount(v12);
  if (Count != CFArrayGetCount(v15)) {
    return 4294954516;
  }
  int v18 = malloc_type_malloc(48 * Count, 0x1000040D315E998uLL);
  CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 0);
  if (ValueAtIndex)
  {
    CFNumberRef v20 = ValueAtIndex;
    CFTypeID v21 = CFGetTypeID(ValueAtIndex);
    if (v21 != CFNumberGetTypeID()) {
      goto LABEL_51;
    }
    double valuePtr = 0.0;
    CFNumberGetValue(v20, kCFNumberDoubleType, &valuePtr);
    if (valuePtr <= 0.0)
    {
      fig_log_get_emitter();
    }
    else
    {
      if (valuePtr > 1.0) {
        double valuePtr = 1.0 / valuePtr;
      }
      if (Count >= 1)
      {
        CFIndex v44 = Count;
        CFIndex v22 = 0;
        int v23 = 0;
        unint64_t v43 = 2 * Count;
        do
        {
          v24 = v18;
          double v45 = 0.0;
          double v46 = 0.0;
          int v25 = CFArrayGetValueAtIndex(v12, v22);
          if (!v25) {
            goto LABEL_49;
          }
          unsigned __int16 v26 = v25;
          CFTypeID v27 = CFGetTypeID(v25);
          if (v27 != CFNumberGetTypeID()) {
            goto LABEL_50;
          }
          CFNumberRef v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, v22);
          if (!v28) {
            goto LABEL_49;
          }
          CFNumberRef v29 = v28;
          CFTypeID v30 = CFGetTypeID(v26);
          if (v30 != CFNumberGetTypeID()) {
            goto LABEL_50;
          }
          CFNumberGetValue((CFNumberRef)v26, kCFNumberDoubleType, &v46);
          CFNumberGetValue(v29, kCFNumberDoubleType, &v45);
          double v31 = v46;
          if (v46 > 1.0)
          {
            double v31 = 1.0 / v46;
            double v46 = 1.0 / v46;
          }
          double v32 = valuePtr;
          if (valuePtr <= 0.0 || (double v33 = v45, v45 < 1.0))
          {
LABEL_49:
            fig_log_get_emitter();
            FigDebugAssert3();
LABEL_50:
            int v18 = v24;
            goto LABEL_51;
          }
          int v18 = v24;
          double v34 = *v4;
          if (*v4 <= 0.0 || v34 >= 1.0)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
          }
          else
          {
            v48[0] = v23;
            v48[1] = 0;
            double v49 = v31;
            double v50 = v45;
            exposure_table_fill_metric((uint64_t)v48, valuePtr, v34);
            double v35 = v50;
            while (1)
            {
              int v36 = v48[0]++;
              if (v36 > 4094) {
                break;
              }
              double v37 = v35;
              exposure_table_fill_metric((uint64_t)v48, v32, v34);
              double v35 = v50;
              if (v50 >= v33)
              {
                if (v33 - v37 < v50 - v33) {
                  int v38 = v48[0] - 1;
                }
                else {
                  int v38 = v48[0];
                }
                goto LABEL_41;
              }
            }
          }
          int v38 = -1;
LABEL_41:
          CFIndex v39 = (CFIndex)v24 + 48 * v22;
          *(_DWORD *)CFIndex v39 = v23;
          *(_DWORD *)(v39 + 4) = 0;
          *(double *)(v39 + 8) = v31;
          *(double *)(v39 + 16) = v33;
          CFIndex v40 = (CFIndex)v24 + 24 * ((2 * v22) | 1);
          *(_DWORD *)CFIndex v40 = v38;
          *(_DWORD *)(v40 + 4) = 0;
          *(double *)(v40 + 8) = v31;
          *(double *)(v40 + 16) = v33;
          int v23 = v38 + 1;
          ++v22;
        }
        while (v22 != v44);
        if ((v38 - 4096) <= 0xFFFFF000) {
          goto LABEL_44;
        }
        uint64_t v41 = 0;
        *(void *)a1 = exposure_table_create_lookup_table((uint64_t)v18, v43, *(double *)(a1 + 16));
        *(_DWORD *)(a1 + 8) = v38;
        goto LABEL_52;
      }
LABEL_44:
      fig_log_get_emitter();
    }
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_51:
  uint64_t v41 = 4294954516;
  if (v18) {
LABEL_52:
  }
    free(v18);
  return v41;
}

char *exposure_table_create_lookup_table(uint64_t a1, unint64_t a2, double a3)
{
  if (!a1 || (unint64_t v3 = a2 - 1, a2 <= 1) || (v5 = *(_DWORD *)(a1 + 24 * v3), v5 <= 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  double v7 = *(double *)(a1 + 8);
  CFNumberRef v8 = (char *)malloc_type_malloc(24 * v5 + 24, 0x1000040D315E998uLL);
  uint64_t v9 = 0;
  int v10 = 0;
  while (1)
  {
    CFArrayRef v11 = (long long *)(a1 + 24 * v9);
    long long v17 = *v11;
    uint64_t v18 = *((void *)v11 + 2);
    int v12 = *((_DWORD *)v11 + 6);
    if (v12 < v10) {
      break;
    }
    if (v10 < v12)
    {
      CFTypeID v13 = &v8[24 * v10];
      uint64_t v14 = v12 - (uint64_t)v10;
      do
      {
        LODWORD(v17) = v10;
        exposure_table_fill_metric((uint64_t)&v17, v7, a3);
        long long v15 = v17;
        *((void *)v13 + 2) = v18;
        *(_OWORD *)CFTypeID v13 = v15;
        v13 += 24;
        ++v10;
        --v14;
      }
      while (v14);
    }
    ++v9;
    int v10 = v12;
    if (v9 == v3) {
      return v8;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  if (v8)
  {
    free(v8);
    return 0;
  }
  return v8;
}

uint64_t exposure_table_fill_metric(uint64_t result, double a2, double a3)
{
  if (result && a2 > 0.0 && ((double v3 = 1.0, a3 > 0.0) ? (v4 = a3 < 1.0) : (v4 = 0), v4))
  {
    int v5 = *(_DWORD *)result;
    if (*(int *)result >= 1)
    {
      double v6 = a3 + 1.0;
      do
      {
        double v3 = v6 * v3;
        --v5;
      }
      while (v5);
    }
    *(double *)(result + 16) = a2 / *(double *)(result + 8) * v3;
  }
  else
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  return result;
}

uint64_t FigCaptureStateDumpDirectory()
{
  return [NSString stringWithFormat:@"%@/CMCaptureStateDumps", NSTemporaryDirectory()];
}

__CFString *FigCaptureQOSClassToString(uint64_t a1)
{
  if ((int)a1 > 20)
  {
    switch(a1)
    {
      case 0x15:
        return @"QOS_CLASS_DEFAULT";
      case 0x21:
        return @"QOS_CLASS_USER_INTERACTIVE";
      case 0x19:
        return @"QOS_CLASS_USER_INITIATED";
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return @"QOS_CLASS_UNSPECIFIED";
      case 9:
        return @"QOS_CLASS_BACKGROUND";
      case 0x11:
        return @"QOS_CLASS_UTILITY";
    }
  }
  return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Unknown QOS class %d", a1);
}

__SecTask *FigCaptureClientHasPrivateCaptureEntitlement(__SecTask *result)
{
  if (result) {
    return FigCaptureClientHasEntitlementWithSecTask(result, @"com.apple.private.avfoundation.capture.allow");
  }
  return result;
}

uint64_t FigCaptureClientIsInternalCommandLineTool(_OWORD *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v2 = a1[1];
  *(_OWORD *)v7.val = *a1;
  *(_OWORD *)&v7.val[4] = v2;
  double v3 = SecTaskCreateWithAuditToken(v1, &v7);
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  uint64_t IsRunningInInternalCommandLineToolWithSecTask = FigCaptureClientIsRunningInInternalCommandLineToolWithSecTask(v3);
  CFRelease(v4);
  return IsRunningInInternalCommandLineToolWithSecTask;
}

uint64_t FigCaptureClientIsRunningInInternalCommandLineToolWithSecTask(__SecTask *a1)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v1 = (__CFString *)SecTaskCopySigningIdentifier(a1, 0);
  if (!v1) {
    return 0;
  }
  long long v2 = v1;
  uint64_t v3 = [(__CFString *)v1 isEqualToString:0x1EFA55820];

  return v3;
}

uint64_t FigCaptureClientIsRunningInCameraOrDerivative(_OWORD *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v2 = a1[1];
  *(_OWORD *)v7.val = *a1;
  *(_OWORD *)&v7.val[4] = v2;
  uint64_t v3 = SecTaskCreateWithAuditToken(v1, &v7);
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  uint64_t IsRunningInCameraOrDerivativeWithSecTask = FigCaptureClientIsRunningInCameraOrDerivativeWithSecTask(v3);
  CFRelease(v4);
  return IsRunningInCameraOrDerivativeWithSecTask;
}

uint64_t FigCaptureClientIsRunningInCameraOrDerivativeWithSecTask(__SecTask *a1)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v1 = (__CFString *)SecTaskCopySigningIdentifier(a1, 0);
  if (!v1) {
    return 0;
  }
  long long v2 = v1;
  uint64_t v3 = FigCaptureClientApplicationIDIsCameraOrDerivative(v1);

  return v3;
}

uint64_t FigCaptureClientApplicationIDIsVisualIntelligenceCamera(void *a1)
{
  if (fcu_initializeTrace_sInitializeTraceOnceToken != -1)
  {
    dispatch_once(&fcu_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_304);
    if (a1) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!a1) {
    return 0;
  }
LABEL_3:
  return [a1 isEqualToString:0x1EFA55D40];
}

uint64_t FigCaptureClientApplicationIDIsMagnifier(uint64_t a1)
{
  if (fcu_initializeTrace_sInitializeTraceOnceToken == -1)
  {
    if (!a1) {
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_once(&fcu_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_304);
    if (!a1) {
      goto LABEL_5;
    }
  }
  if (FigCaptureClientApplicationIDIsMagnifier_onceToken != -1) {
    dispatch_once(&FigCaptureClientApplicationIDIsMagnifier_onceToken, &__block_literal_global_95_0);
  }
LABEL_5:
  long long v2 = (void *)FigCaptureClientApplicationIDIsMagnifier_sMatchedBundleIdentifiers;
  return [v2 containsObject:a1];
}

uint64_t __FigCaptureClientApplicationIDIsMagnifier_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", 0x1EFA559E0, 0x1EFA55A00, 0);
  FigCaptureClientApplicationIDIsMagnifier_sMatchedBundleIdentifiers = result;
  return result;
}

void __FigCaptureExternalCameraReplacesBuiltIn_block_invoke()
{
  if (FigCaptureIsRunningInVirtualization_sOnceToken != -1) {
    dispatch_once(&FigCaptureIsRunningInVirtualization_sOnceToken, &__block_literal_global_99);
  }
  FigCaptureExternalCameraReplacesBuiltIn_sExternalReplacesBuiltIn = FigCaptureIsRunningInVirtualization_sAnswer;
}

void __FigCaptureGetSupportedPrewarmingBundleIdentifiers_block_invoke()
{
  v0[2] = *MEMORY[0x1E4F143B8];
  if (!FigCaptureGetSupportedPrewarmingBundleIdentifiers_bundleIdentifiers)
  {
    v0[0] = 0x1EFA44100;
    v0[1] = 0x1EFA55980;
    FigCaptureGetSupportedPrewarmingBundleIdentifiers_bundleIdentifiers = (uint64_t)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v0 count:2];
  }
}

void FigCaptureInitializeSingletons()
{
  if (FigCaptureInitializeSingletons_onceToken != -1) {
    dispatch_once(&FigCaptureInitializeSingletons_onceToken, &__block_literal_global_106_0);
  }
}

FigContinuityCaptureNotificationMonitor *__FigCaptureInitializeSingletons_block_invoke()
{
  +[FigCaptureCameraParameters sharedInstance];
  +[BWFigCaptureAttachedAccessoriesMonitor sharedAttachedAccessoriesMonitor];
  +[BWAutoFocusPositionSensorMonitor sharedInstance];
  +[BWCoreAnalyticsReporter sharedInstance];
  +[FigCaptureSessionObservatory sharedObservatory];
  +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor];
  return +[FigContinuityCaptureNotificationMonitor sharedInstance];
}

void FigCapturePromptOpenTapToRadar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFTimeInterval a7)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  if (FigDebugIsInternalBuild())
  {
    uint64_t v14 = *MEMORY[0x1E4F1D9E0];
    v24[0] = *MEMORY[0x1E4F1D990];
    v24[1] = v14;
    SInt32 error = 0;
    v25[0] = a1;
    v25[1] = @"File radar";
    v24[2] = *MEMORY[0x1E4F1D9D0];
    v25[2] = @"Ignore";
    CFDictionaryRef v15 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
    CFUserNotificationRef v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a7, 0, &error, v15);
    if (v16)
    {
      CFUserNotificationRef v17 = v16;
      int v22 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __FigCapturePromptOpenTapToRadar_block_invoke;
      block[3] = &unk_1E5C2D848;
      block[4] = a2;
      block[5] = a3;
      block[6] = v17;
      block[7] = a4;
      block[8] = a5;
      block[9] = a6;
      dispatch_async(global_queue, block);
    }
  }
}

void __FigCapturePromptOpenTapToRadar_block_invoke(uint64_t a1)
{
  responseFlags[20] = *MEMORY[0x1E4F143B8];
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, responseFlags);
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (!responseFlags[0])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    if (FigDebugIsInternalBuild())
    {
      uint64_t ModelSpecificName = FigCaptureGetModelSpecificName();
      uint64_t v9 = [NSString stringWithFormat:@"%@/%@: %@", ModelSpecificName, (id)MGCopyAnswer(), v3];
      id v10 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v10 setScheme:@"tap-to-radar"];
      [v10 setHost:@"new"];
      CFArrayRef v11 = (void *)[MEMORY[0x1E4F1CA48] array];
      objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"Title", v9));
      objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"Description", v4));
      uint64_t v12 = v6 - 1;
      if ((unint64_t)(v6 - 1) <= 2)
      {
        CFTypeID v13 = off_1E5C2D928[v12];
        uint64_t v14 = off_1E5C2D940[v12];
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"ComponentName", off_1E5C2D910[v12]));
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"ComponentVersion", v13));
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"ComponentID", v14));
      }
      if ((unint64_t)(v5 - 1) <= 9) {
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"Classification", off_1E5C2D958[v5 - 1]));
      }
      if ((unint64_t)(v7 - 1) <= 5) {
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"Reproducibility", off_1E5C2D9A8[v7 - 1]));
      }
      [v10 setQueryItems:v11];
      uint64_t v15 = [v10 URL];
      if (v15) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "openURL:configuration:completionHandler:", v15, 0, &__block_literal_global_234);
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void FigCapturePromptOpenTapToRadarIfNecessary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const __CFString *a6, const __CFString *a7)
{
  if (FigDebugIsInternalBuild())
  {
    uint64_t v22 = a3;
    CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPropertyListRef v16 = (id)CFPreferencesCopyValue(a6, @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFUserNotificationRef v17 = (const void *)[MEMORY[0x1E4F1C9C8] date];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "isDate:inSameDayAsDate:", v16, v17)|| (v21 = a1, uint64_t v18 = (id)CFPreferencesCopyValue(a7, @"com.apple.cameracapture.volatile", v14, v15), v19 = (id)MGCopyAnswer(), objc_msgSend(v18, "isEqualToString:", v19)))
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      FigCapturePromptOpenTapToRadar(v21, a2, v22, 1, a4, a5, 0.0);
      CFPreferencesSetValue(a6, v17, @"com.apple.cameracapture.volatile", v14, v15);
      CFPreferencesSetValue(a7, v19, @"com.apple.cameracapture.volatile", v14, v15);
    }
  }
}

uint64_t __FigCaptureAudiomxdSupportEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  FigCaptureAudiomxdSupportEnabled_sCaptureAudiomxdSupportEnabled = result;
  return result;
}

BOOL FigCaptureVideoCodecTypeSpecifiesCVPixelBufferType(int a1)
{
  if (a1 == 846624121) {
    return 1;
  }
  unint64_t v2 = 0;
  do
  {
    unint64_t v3 = v2;
    if (v2 == 17) {
      break;
    }
    int v4 = *(_DWORD *)&FigCaptureVideoCodecTypeSpecifiesCVPixelBufferType_cvPixelFormatTypesThatAreCMVideoCodecTypes[4 * v2++ + 4];
  }
  while (v4 != a1);
  return v3 < 0x11;
}

uint64_t FigCaptureSceneIlluminationValueFromLuxLevel(void *a1, unsigned int a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0xFFFFFFFFLL;
  }
  [a1 floatValue];
  if (v4 < 0.0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = ((float)(v4 * 1000.0) + 0.5);
  if (a2 != -1) {
    return ((double)result * 0.0980392157 + (double)a2 * 0.901960784 + 0.5);
  }
  return result;
}

uint64_t __FigCaptureDeviceIORegValuesByKeys_block_invoke()
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t result = FigCaptureGetCameraDriverService();
  if (result)
  {
    uint64_t v1 = result;
    v21[0] = @"CmClValidationStatus";
    v21[1] = @"CmPMValidationStatus";
    v21[2] = @"FCClValidationStatus";
    unint64_t v2 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = v2;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v9 = *(const __CFString **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = (id)IORegistryEntrySearchCFProperty(v1, "IODeviceTree", v9, v7, 1u);
          if (v10)
          {
            CFArrayRef v11 = v10;
            if ([v10 isEqualToString:@"Pass"])
            {
              uint64_t v12 = 1;
            }
            else if ([v11 isEqualToString:@"Fail"])
            {
              uint64_t v12 = 2;
            }
            else if ([v11 isEqualToString:@"Invalid"])
            {
              uint64_t v12 = 3;
            }
            else if ([v11 isEqualToString:@"Override"])
            {
              uint64_t v12 = 4;
            }
            else if ([v11 isEqualToString:@"Unknown"])
            {
              uint64_t v12 = 5;
            }
            else
            {
              uint64_t v12 = 6;
            }
          }
          else
          {
            uint64_t v12 = 0;
          }
          objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12), v9);
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }
    uint64_t v13 = [v3 count];
    if (v13) {
      uint64_t v13 = [v3 copy];
    }
    FigCaptureDeviceIORegValuesByKeys_sDeviceIORegValuesByKeys = v13;
    return FigCaptureReleaseCameraDriverService(v1);
  }
  else if (dword_1EB4C5750)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __FigCaptureDeviceCoreRepairStatusesByKeys_block_invoke()
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v22[0] = @"RearCameraAssembly";
  v22[1] = @"FrontCameraAssembly";
  uint64_t v0 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v0, "count"));
  if ((int)FigCapturePlatformIdentifier() >= 7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v1 = [v0 countByEnumeratingWithState:&v12 objects:v21 count:16];
    if (v1)
    {
      uint64_t v2 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v1; ++i)
        {
          if (*(void *)v13 != v2) {
            objc_enumerationMutation(v0);
          }
          uint64_t v4 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v4 isEqualToString:@"RearCameraAssembly"])
          {
            uint64_t v5 = 1026;
          }
          else
          {
            if (![v4 isEqualToString:@"FrontCameraAssembly"]) {
              continue;
            }
            uint64_t v5 = 1027;
          }
          id v11 = 0;
          uint64_t v17 = 0;
          long long v18 = &v17;
          uint64_t v19 = 0x2020000000;
          uint64_t v6 = (uint64_t (*)(uint64_t, id *))getCRGetComponentStateSymbolLoc_ptr;
          CFNumberRef v20 = getCRGetComponentStateSymbolLoc_ptr;
          if (!getCRGetComponentStateSymbolLoc_ptr)
          {
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __getCRGetComponentStateSymbolLoc_block_invoke;
            v16[3] = &unk_1E5C24978;
            v16[4] = &v17;
            __getCRGetComponentStateSymbolLoc_block_invoke((uint64_t)v16);
            uint64_t v6 = (uint64_t (*)(uint64_t, id *))v18[3];
          }
          _Block_object_dispose(&v17, 8);
          if (!v6) {
            __FigCaptureDeviceCoreRepairStatusesByKeys_block_invoke_cold_1();
          }
          unsigned int v7 = v6(v5, &v11);
          if (v11)
          {
          }
          else
          {
            if (v7 < 5) {
              uint64_t v8 = v7 + 1;
            }
            else {
              uint64_t v8 = 0;
            }
            objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v8), v4);
          }
        }
        uint64_t v1 = [v0 countByEnumeratingWithState:&v12 objects:v21 count:16];
      }
      while (v1);
    }
  }
  uint64_t result = [v10 count];
  if (result) {
    uint64_t result = [v10 copy];
  }
  FigCaptureDeviceCoreRepairStatusesByKeys_sDeviceCoreRepairStatusesByKeys = result;
  return result;
}

void sub_1A5D7D944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t FigCaptureIsWombatEnabled(_DWORD *a1)
{
  if (FigCaptureAudiomxdSupportEnabled_sOnceToken != -1) {
    dispatch_once(&FigCaptureAudiomxdSupportEnabled_sOnceToken, &__block_literal_global_127_0);
  }
  if (!FigCaptureAudiomxdSupportEnabled_sCaptureAudiomxdSupportEnabled)
  {
    id v7 = 0;
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F74F70]) initWithPID:getpid()];
    int v4 = [v6 copyAttributeForKey:*MEMORY[0x1E4F76A40] withValueOut:&v7];
    uint64_t v3 = [v7 BOOLValue];

    if (!a1) {
      return v3;
    }
    goto LABEL_5;
  }
  uint64_t v2 = (void *)[MEMORY[0x1E4F74F68] sharedInstance];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E4F74F18]), "BOOLValue");
  int v4 = 0;
  if (a1) {
LABEL_5:
  }
    *a1 = v4;
  return v3;
}

void *__getCRGetComponentStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreRepairCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __CoreRepairCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C2D8B0;
    uint64_t v6 = 0;
    CoreRepairCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)CoreRepairCoreLibraryCore_frameworkLibrary;
  if (!CoreRepairCoreLibraryCore_frameworkLibrary) {
    __getCRGetComponentStateSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "CRGetComponentState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRGetComponentStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreRepairCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreRepairCoreLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __ubp_createStateMachine_block_invoke_2_0(uint64_t a1, uint64_t a2)
{
  -[BWIntelligentDistortionCorrectionProcessorController _resetProcessor](a2);
  return -[BWIntelligentDistortionCorrectionProcessorController _serviceNextRequest](a2);
}

uint64_t __ubp_createStateMachine_block_invoke_4_0(uint64_t a1, uint64_t a2)
{
  return -[BWIntelligentDistortionCorrectionProcessorController _process](a2);
}

uint64_t __dzpc_initializeTrace_block_invoke()
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  return fig_note_initialize_category_with_default_work_cf();
}

uint64_t __dzp_createStateMachine_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return -[BWDeepZoomProcessorController _serviceNextRequest](a2);
}

uint64_t __dzp_createStateMachine_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return -[BWDeepZoomProcessorController _updateStateIfNeeded](a2);
  }
  return result;
}

uint64_t __dzp_createStateMachine_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return -[BWDeepZoomProcessorController _process](a2);
}

uint64_t FigRemoteQueueIOSurfaceSender_ReleaseIOSurface(int a1, int a2)
{
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a2;
  uint64_t v8 = 1245184;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = -2147478253;
  *(void *)&msg[16] = 0x481300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x1F4u, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v4)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v5 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18551)
      {
        uint64_t v5 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v5 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return v5;
          }
        }
      }
      else
      {
        uint64_t v5 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v5;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  if ((v5 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_20;
  }
  return v5;
}

uint64_t FigRemoteQueueIOSurfaceSender_ReleaseIOSurfaces(int a1)
{
  uint64_t v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x481400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x2Cu, reply_port, 0, 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v3)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v4 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18552)
      {
        uint64_t v4 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v4 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return v4;
          }
        }
      }
      else
      {
        uint64_t v4 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v4;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  if ((v4 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_20;
  }
  return v4;
}

uint64_t (*figremotequeue_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 18453) >= 0xFFFFFFFD) {
    return FigRemoteQueueIOSurfaceReceiver_figremotequeue_subsystem[5 * (v1 - 18450) + 5];
  }
  else {
    return 0;
  }
}

uint64_t _XReleaseIOSurface(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_7;
  }
  uint64_t result = FigRemoteQueueIOSurfaceReceiver_ReleaseIOSurface(*(_DWORD *)(result + 12), *(_DWORD *)(result + 28));
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XReleaseIOSurfaces(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    uint64_t result = (_DWORD *)FigRemoteQueueIOSurfaceReceiver_ReleaseIOSurfaces((void *)result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void FigDisplayedVitalityClassify_cold_1()
{
  __assert_rtn("fdvc_computeForestScore", "FigDisplayedVitalityClassifier.m", 167, "nFeatures == forest->nFeatures");
}

void FigDisplayedVitalityClassify_cold_2()
{
  __assert_rtn("FigDisplayedVitalityClassify", "FigDisplayedVitalityClassifier.m", 634, "[value length] >= 9 * sizeof( float)");
}

void VisualIntelligenceLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *VisualIntelligenceLibrary(void)"), @"BWVisualIntelligenceSoftLinking.m", 13, @"%s", *a1);
  __break(1u);
}

void __getVIServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVIServiceClass(void)_block_invoke"), @"BWVisualIntelligenceSoftLinking.m", 15, @"Unable to find class %s", "VIService");
  __break(1u);
}

void FusionTrackerLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *FusionTrackerLibrary(void)"), @"BWFusionTrackerSoftLinking.m", 13, @"%s", *a1);
  __break(1u);
}

void __getFTCinematicTrackerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTCinematicTrackerClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 16, @"Unable to find class %s", "FTCinematicTracker");
  __break(1u);
}

void __getFTCinematicTapRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTCinematicTapRequestClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 17, @"Unable to find class %s", "FTCinematicTapRequest");
  __break(1u);
}

void __getFTCinematicTapResponseClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTCinematicTapResponseClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 18, @"Unable to find class %s", "FTCinematicTapResponse");
  __break(1u);
}

void __getFTCinematicConfigClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTCinematicConfigClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 20, @"Unable to find class %s", "FTCinematicConfig");
  __break(1u);
}

void __getFTCinematicInputClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTCinematicInputClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 21, @"Unable to find class %s", "FTCinematicInput");
  __break(1u);
}

void __getFTTapToBoxClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTTapToBoxClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 22, @"Unable to find class %s", "FTTapToBox");
  __break(1u);
}

void __getFTEspressoBufferClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTEspressoBufferClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 23, @"Unable to find class %s", "FTEspressoBuffer");
  __break(1u);
}

void __getFTMSRScalerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTMSRScalerClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 25, @"Unable to find class %s", "FTMSRScaler");
  __break(1u);
}

void FTCinematicHighPriorityTrackerOpDescription_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString * _Nonnull FTCinematicHighPriorityTrackerOpDescription(FTCinematicHighPriorityTrackerOp)"), @"BWFusionTrackerSoftLinking.m", 29, @"%s", dlerror());
  __break(1u);
}

void getkFTInvalidTrackId_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (kFTInvalidTrackId) (*)(void))0)()) getkFTInvalidTrackId(void)"), @"BWFusionTrackerSoftLinking.m", 31, @"%s", dlerror());
  __break(1u);
}

void __getFTBipartiteMatcherClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFTBipartiteMatcherClass(void)_block_invoke"), @"BWFusionTrackerSoftLinking.m", 33, @"Unable to find class %s", "FTBipartiteMatcher");
  __break(1u);
}

void AppleDepthLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *AppleDepthLibrary(void)"), @"BWAppleDepthSoftLinking.m", 13, @"%s", *a1);
  __break(1u);
}

void __getADMonocularPipelineParametersClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADMonocularPipelineParametersClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 15, @"Unable to find class %s", "ADMonocularPipelineParameters");
  __break(1u);
}

void __getADMonocularPipelineClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADMonocularPipelineClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 16, @"Unable to find class %s", "ADMonocularPipeline");
  __break(1u);
}

void __getADMutableJasperPointCloudClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADMutableJasperPointCloudClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 18, @"Unable to find class %s", "ADMutableJasperPointCloud");
  __break(1u);
}

void __getADJasperPointCloudClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADJasperPointCloudClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 19, @"Unable to find class %s", "ADJasperPointCloud");
  __break(1u);
}

void __getADCameraCalibrationClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADCameraCalibrationClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 20, @"Unable to find class %s", "ADCameraCalibration");
  __break(1u);
}

void __getADPolynomialsLensDistortionModelClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADPolynomialsLensDistortionModelClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 22, @"Unable to find class %s", "ADPolynomialsLensDistortionModel");
  __break(1u);
}

void __getADJasperColorStillsExecutorClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADJasperColorStillsExecutorClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 23, @"Unable to find class %s", "ADJasperColorStillsExecutor");
  __break(1u);
}

void __getADJasperColorV2ExecutorClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADJasperColorV2ExecutorClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 24, @"Unable to find class %s", "ADJasperColorV2Executor");
  __break(1u);
}

void __getADStereoPipelineClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADStereoPipelineClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 27, @"Unable to find class %s", "ADStereoPipeline");
  __break(1u);
}

void __getADStereoV2PipelineClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADStereoV2PipelineClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 28, @"Unable to find class %s", "ADStereoV2Pipeline");
  __break(1u);
}

void __getADStereoV2PipelineParametersClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADStereoV2PipelineParametersClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 29, @"Unable to find class %s", "ADStereoV2PipelineParameters");
  __break(1u);
}

void __getADPCEDisparityColorPipelineClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADPCEDisparityColorPipelineClass(void)_block_invoke"), @"BWAppleDepthSoftLinking.m", 30, @"Unable to find class %s", "ADPCEDisparityColorPipeline");
  __break(1u);
}

void __getHDRProcessorClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getHDRProcessorClass(void)_block_invoke"), @"BWPixelTransferNode.m", 64, @"Unable to find class %s", "HDRProcessor");
  __break(1u);
}

void HDRProcessingLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *HDRProcessingLibrary(void)"), @"BWPixelTransferNode.m", 63, @"%s", *a1);
  __break(1u);
}

void PrivacyAccountingLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *PrivacyAccountingLibrary(void)"), @"BWPrivacyAccountingSoftLinking.m", 15, @"%s", *a1);
  __break(1u);
}

void __getPAAccessLoggerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPAAccessLoggerClass(void)_block_invoke"), @"BWPrivacyAccountingSoftLinking.m", 16, @"Unable to find class %s", "PAAccessLogger");
  __break(1u);
}

void __getPATCCAccessClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPATCCAccessClass(void)_block_invoke"), @"BWPrivacyAccountingSoftLinking.m", 17, @"Unable to find class %s", "PATCCAccess");
  __break(1u);
}

void __getPAApplicationClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPAApplicationClass(void)_block_invoke"), @"BWPrivacyAccountingSoftLinking.m", 19, @"Unable to find class %s", "PAApplication");
  __break(1u);
}

void soft_PAAuthenticatedClientIdentity_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "tcc_identity_t soft_PAAuthenticatedClientIdentity(audit_token_t, tcc_identity_t)"), @"BWPrivacyAccountingSoftLinking.m", 20, @"%s", dlerror());
  __break(1u);
}

void DiskArbitrationLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *DiskArbitrationLibrary(void)"), @"BWQuickTimeMovieFileSinkNode.m", 102, @"%s", *a1);
  __break(1u);
}

void VisionLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *VisionLibrary(void)"), @"BWVisionSoftLinking.m", 13, @"%s", *a1);
  __break(1u);
}

void __getVNImageRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNImageRequestHandlerClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 14, @"Unable to find class %s", "VNImageRequestHandler");
  __break(1u);
}

void __getVNSequenceRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNSequenceRequestHandlerClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 15, @"Unable to find class %s", "VNSequenceRequestHandler");
  __break(1u);
}

void __getVNProcessingDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNProcessingDeviceClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 16, @"Unable to find class %s", "VNProcessingDevice");
  __break(1u);
}

void __getVNFaceObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNFaceObservationClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 17, @"Unable to find class %s", "VNFaceObservation");
  __break(1u);
}

void __getVNDetectedObjectObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNDetectedObjectObservationClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 19, @"Unable to find class %s", "VNDetectedObjectObservation");
  __break(1u);
}

void __getVNDetectFaceLandmarksRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNDetectFaceLandmarksRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 24, @"Unable to find class %s", "VNDetectFaceLandmarksRequest");
  __break(1u);
}

void __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNDetectFaceRectanglesRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 25, @"Unable to find class %s", "VNDetectFaceRectanglesRequest");
  __break(1u);
}

void __getVNTranslationalImageRegistrationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNTranslationalImageRegistrationRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 28, @"Unable to find class %s", "VNTranslationalImageRegistrationRequest");
  __break(1u);
}

void __getVNClassifyImageAestheticsRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNClassifyImageAestheticsRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 30, @"Unable to find class %s", "VNClassifyImageAestheticsRequest");
  __break(1u);
}

void __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNGenerateAttentionBasedSaliencyImageRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 31, @"Unable to find class %s", "VNGenerateAttentionBasedSaliencyImageRequest");
  __break(1u);
}

void __getVNGenerateFaceSegmentsRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNGenerateFaceSegmentsRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 32, @"Unable to find class %s", "VNGenerateFaceSegmentsRequest");
  __break(1u);
}

void __getVNClassifyJunkImageRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNClassifyJunkImageRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 33, @"Unable to find class %s", "VNClassifyJunkImageRequest");
  __break(1u);
}

void __getVNCreateSceneprintRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNCreateSceneprintRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 34, @"Unable to find class %s", "VNCreateSceneprintRequest");
  __break(1u);
}

void __getVN5kJNH3eYuyaLxNpZr5Z7ziClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVN5kJNH3eYuyaLxNpZr5Z7ziClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 35, @"Unable to find class %s", "VN5kJNH3eYuyaLxNpZr5Z7zi");
  __break(1u);
}

void __getVNClassifyFaceAttributesRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNClassifyFaceAttributesRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 36, @"Unable to find class %s", "VNClassifyFaceAttributesRequest");
  __break(1u);
}

void __getVNRecognizeFoodAndDrinkRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNRecognizeFoodAndDrinkRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 37, @"Unable to find class %s", "VNRecognizeFoodAndDrinkRequest");
  __break(1u);
}

void __getVNTrackObjectRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNTrackObjectRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 38, @"Unable to find class %s", "VNTrackObjectRequest");
  __break(1u);
}

void __getVNSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNSessionClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 39, @"Unable to find class %s", "VNSession");
  __break(1u);
}

void __getVNRecognizedObjectObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNRecognizedObjectObservationClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 41, @"Unable to find class %s", "VNRecognizedObjectObservation");
  __break(1u);
}

void __getVNProcessingDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNProcessingDescriptorClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 42, @"Unable to find class %s", "VNProcessingDescriptor");
  __break(1u);
}

void __getVNResourceVersionClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNResourceVersionClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 43, @"Unable to find class %s", "VNResourceVersion");
  __break(1u);
}

void __getVNDetectHumanRectanglesRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVNDetectHumanRectanglesRequestClass(void)_block_invoke"), @"BWVisionSoftLinking.m", 44, @"Unable to find class %s", "VNDetectHumanRectanglesRequest");
  __break(1u);
}

void getVNInferenceNetworkIdentifierFaceprint_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (VNInferenceNetworkIdentifierFaceprint) (*)(void))0)()) getVNInferenceNetworkIdentifierFaceprint(void)"), @"BWVisionSoftLinking.m", 51, @"%s", dlerror());
  __break(1u);
}

void getVNFaceAttributeEyesClosed_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (VNFaceAttributeEyesClosed) (*)(void))0)()) getVNFaceAttributeEyesClosed(void)"), @"BWVisionSoftLinking.m", 52, @"%s", dlerror());
  __break(1u);
}

void BWVNSetRequestConcurrentTasksProcessingTimeout_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void BWVNSetRequestConcurrentTasksProcessingTimeout(int64_t)"), @"BWVisionSoftLinking.m", 53, @"%s", dlerror());
  __break(1u);
}

void getVNErrorDomain_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (VNErrorDomain) (*)(void))0)()) getVNErrorDomain(void)"), @"BWVisionSoftLinking.m", 55, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Timestamp_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Timestamp(void)"), @"BWFaceTrackingNode.m", 106, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Rotation_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Rotation(void)"), @"BWFaceTrackingNode.m", 148, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Translation_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Translation(void)"), @"BWFaceTrackingNode.m", 146, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Intrinsics_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Intrinsics(void)"), @"BWFaceTrackingNode.m", 150, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Extrinsics_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Extrinsics(void)"), @"BWFaceTrackingNode.m", 152, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_DepthMetaData_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DepthMetaData(void)"), @"BWFaceTrackingNode.m", 116, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_StructuredLightOccluded_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_StructuredLightOccluded(void)"), @"BWFaceTrackingNode.m", 118, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_DepthSource_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DepthSource(void)"), @"BWFaceTrackingNode.m", 64, @"%s", dlerror());
  __break(1u);
}

void AppleCVALibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *AppleCVALibrary(void)"), @"BWFaceTrackingNode.m", 57, @"%s", *a1);
  __break(1u);
}

void DuetActivitySchedulerLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *DuetActivitySchedulerLibrary(void)"), @"FigCaptureCalibrationMonitor.m", 48, @"%s", *a1);
  __break(1u);
}

void SoundAnalysisLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *SoundAnalysisLibrary(void)"), @"BWSoundAnalysisSoftLinking.m", 13, @"%s", *a1);
  __break(1u);
}

void __getSNMovieRemixClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSNMovieRemixClass(void)_block_invoke"), @"BWSoundAnalysisSoftLinking.m", 17, @"Unable to find class %s", "SNMovieRemix");
  __break(1u);
}

void __getSNMovieRemixRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSNMovieRemixRequestClass(void)_block_invoke"), @"BWSoundAnalysisSoftLinking.m", 18, @"Unable to find class %s", "SNMovieRemixRequest");
  __break(1u);
}

void MetalPerformanceShadersLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *MetalPerformanceShadersLibrary(void)"), @"BWFusionTrackerInferenceAdapter.m", 50, @"%s", *a1);
  __break(1u);
}

void __getMPSImageStatisticsMeanClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getMPSImageStatisticsMeanClass(void)_block_invoke"), @"BWFusionTrackerInferenceAdapter.m", 51, @"Unable to find class %s", "MPSImageStatisticsMean");
  __break(1u);
}

void getkCVAFaceTracking_TrackedFacesArray_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_TrackedFacesArray(void)"), @"BWSampleBufferUtilities.m", 63, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_CameraColor_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_CameraColor(void)"), @"BWSampleBufferUtilities.m", 53, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Extrinsics_cold_1_0()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Extrinsics(void)"), @"BWSampleBufferUtilities.m", 55, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Rotation_cold_1_0()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Rotation(void)"), @"BWSampleBufferUtilities.m", 59, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Intrinsics_cold_1_0()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Intrinsics(void)"), @"BWSampleBufferUtilities.m", 57, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_SmoothData_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_SmoothData(void)"), @"BWSampleBufferUtilities.m", 65, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_Geometry_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Geometry(void)"), @"BWSampleBufferUtilities.m", 67, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_GeometryLandmarks_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_GeometryLandmarks(void)"), @"BWSampleBufferUtilities.m", 69, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_GeometryVertices_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_GeometryVertices(void)"), @"BWSampleBufferUtilities.m", 71, @"%s", dlerror());
  __break(1u);
}

void getkCVAFaceTracking_DetectedFaceRect_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceRect(void)"), @"BWSampleBufferUtilities.m", 73, @"%s", dlerror());
  __break(1u);
}

void AppleCVALibrary_cold_1_0(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *AppleCVALibrary(void)"), @"BWSampleBufferUtilities.m", 50, @"%s", *a1);
  __break(1u);
}

void __getICAccessManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *ImageCaptureCoreLibrary(void)"), @"FigExternalStorageDeviceManagerServer.m", 28, @"%s", *a1);
  __break(1u);
}

void __getICAccessManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getICAccessManagerClass(void)_block_invoke"), @"FigExternalStorageDeviceManagerServer.m", 29, @"Unable to find class %s", "ICAccessManager");
  __break(1u);
}

void __getPLSimpleDCIMDirectoryClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *PhotoLibraryServicesCoreLibrary(void)"), @"FigExternalStorageDeviceManager.m", 33, @"%s", *a1);
  __break(1u);
}

void __getPLSimpleDCIMDirectoryClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPLSimpleDCIMDirectoryClass(void)_block_invoke"), @"FigExternalStorageDeviceManager.m", 34, @"Unable to find class %s", "PLSimpleDCIMDirectory");
  __break(1u);
}

void __getICCameraDeviceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *ImageCaptureCoreLibrary(void)"), @"FigExternalStorageDeviceManager.m", 38, @"%s", *a1);
  __break(1u);
}

void __getICCameraDeviceClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getICCameraDeviceClass(void)_block_invoke"), @"FigExternalStorageDeviceManager.m", 39, @"Unable to find class %s", "ICCameraDevice");
  __break(1u);
}

void FigCaptureBinaryPlistInitialize_cold_1()
{
  __assert_rtn("FigCaptureBinaryPlistInitialize", "FigCaptureBinaryPlist.c", 371, "strncmp( data, \"bplist00\", 8) == 0");
}

void FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject_cold_1()
{
}

void FigCaptureBinaryPlistGetOffsetForValueAtIndexInObject_cold_1()
{
}

void FigCaptureBinaryPlistGetOffsetForValueAtIndexInObject_cold_2()
{
  __assert_rtn("FigCaptureBinaryPlistGetOffsetForValueAtIndexInObject", "FigCaptureBinaryPlist.c", 527, "( objHeader & 0xF0) == PlistObjectType_Dict");
}

void __getBMStreamsClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getBMStreamsClass(void)_block_invoke"), @"FigCaptureSession.m", 180, @"Unable to find class %s", "BMStreams");
  __break(1u);
}

void BiomeStreamsLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)"), @"FigCaptureSession.m", 178, @"%s", *a1);
  __break(1u);
}

void __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getBMDiscoverabilitySignalEventClass(void)_block_invoke"), @"FigCaptureSession.m", 179, @"Unable to find class %s", "BMDiscoverabilitySignalEvent");
  __break(1u);
}

void setupFocusWindowMatrix_cold_1()
{
  __assert_rtn("setupFocusWindowMatrix", "FigSampleBufferProcessor_ImageControl_Focus.m", 465, "n <= FOCUS_RECT_COUNT");
}

void FigImageControl_Focus_cold_1()
{
}

void ColorsWheelContext_create_cold_1()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 83, "rangeBC >= 0");
}

void ColorsWheelContext_create_cold_2()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 84, "rangeCG >= 0");
}

void ColorsWheelContext_create_cold_3()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 85, "rangeGY >= 0");
}

void ColorsWheelContext_create_cold_4()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 86, "rangeYR >= 0");
}

void ColorsWheelContext_create_cold_5()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 87, "rangeRM >= 0");
}

void ColorsWheelContext_create_cold_6()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 88, "rangeMB >= 0");
}

void ColorsWheelContext_create_cold_7()
{
}

void ColorsWheelContext_create_cold_8()
{
  __assert_rtn("setColorsWheelComponent_", "FigColorsWheel.c", 75, "(k >= 0) && (k < ColorsWheelContext_countColorsTransitions(ctx))");
}

void ColorsWheelContext_computeColorComponent_cold_1()
{
  __assert_rtn("ColorsWheelContext_computeColorComponent", "FigColorsWheel.c", 159, "(v >= 0.f) && (v <= 1.f)");
}

void __getBMCameraCaptureAutoFocusROIClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getBMCameraCaptureAutoFocusROIClass(void)_block_invoke"), @"BWCoreAnalyticsReporter.m", 28, @"Unable to find class %s", "BMCameraCaptureAutoFocusROI");
  __break(1u);
}

void BiomeLibraryLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *BiomeLibraryLibrary(void)"), @"BWCoreAnalyticsReporter.m", 27, @"%s", *a1);
  __break(1u);
}

void PortraitLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *PortraitLibrary(void)"), @"BWPortraitSoftLinking.m", 13, @"%s", *a1);
  __break(1u);
}

void __getPTEffectClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTEffectClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 15, @"Unable to find class %s", "PTEffect");
  __break(1u);
}

void __getPTEffectDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTEffectDescriptorClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 16, @"Unable to find class %s", "PTEffectDescriptor");
  __break(1u);
}

void __getPTTextureClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTTextureClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 18, @"Unable to find class %s", "PTTexture");
  __break(1u);
}

void __getPTRenderPipelineClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTRenderPipelineClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 19, @"Unable to find class %s", "PTRenderPipeline");
  __break(1u);
}

void __getPTRenderRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTRenderRequestClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 20, @"Unable to find class %s", "PTRenderRequest");
  __break(1u);
}

void __getPTRenderPipelineDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTRenderPipelineDescriptorClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 21, @"Unable to find class %s", "PTRenderPipelineDescriptor");
  __break(1u);
}

void __getPTTuningParametersClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTTuningParametersClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 22, @"Unable to find class %s", "PTTuningParameters");
  __break(1u);
}

void __getPTCinematographyStreamClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTCinematographyStreamClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 26, @"Unable to find class %s", "PTCinematographyStream");
  __break(1u);
}

void __getPTCinematographyStreamOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTCinematographyStreamOptionsClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 27, @"Unable to find class %s", "PTCinematographyStreamOptions");
  __break(1u);
}

void __getPTCinematographyRefinementClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTCinematographyRefinementClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 28, @"Unable to find class %s", "PTCinematographyRefinement");
  __break(1u);
}

void getPTCinematographyExcludeAsCinematicChoice_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (PTCinematographyExcludeAsCinematicChoice) (*)(void))0)()) getPTCinematographyExcludeAsCinematicChoice(void)"), @"BWPortraitSoftLinking.m", 29, @"%s", dlerror());
  __break(1u);
}

void __getPTGlobalCinematographyMetadataVersion1Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTGlobalCinematographyMetadataVersion1Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 32, @"Unable to find class %s", "PTGlobalCinematographyMetadataVersion1");
  __break(1u);
}

void __getPTGlobalRenderingMetadataVersion1Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTGlobalRenderingMetadataVersion1Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 33, @"Unable to find class %s", "PTGlobalRenderingMetadataVersion1");
  __break(1u);
}

void __getPTGlobalRenderingMetadataVersion2Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTGlobalRenderingMetadataVersion2Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 34, @"Unable to find class %s", "PTGlobalRenderingMetadataVersion2");
  __break(1u);
}

void __getPTGlobalStabilizationMetadataVersion1Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTGlobalStabilizationMetadataVersion1Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 35, @"Unable to find class %s", "PTGlobalStabilizationMetadataVersion1");
  __break(1u);
}

void __getPTGlobalVideoHeaderMetadataVersion1Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTGlobalVideoHeaderMetadataVersion1Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 36, @"Unable to find class %s", "PTGlobalVideoHeaderMetadataVersion1");
  __break(1u);
}

void __getPTGlobalVideoMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTGlobalVideoMetadataClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 37, @"Unable to find class %s", "PTGlobalVideoMetadata");
  __break(1u);
}

void __getPTTimedRenderingMetadataVersion1Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTTimedRenderingMetadataVersion1Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 38, @"Unable to find class %s", "PTTimedRenderingMetadataVersion1");
  __break(1u);
}

void __getPTTimedRenderingMetadataVersion2Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTTimedRenderingMetadataVersion2Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 39, @"Unable to find class %s", "PTTimedRenderingMetadataVersion2");
  __break(1u);
}

void __getPTTimedStabilizationMetadataVersion1Class_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTTimedStabilizationMetadataVersion1Class(void)_block_invoke"), @"BWPortraitSoftLinking.m", 40, @"Unable to find class %s", "PTTimedStabilizationMetadataVersion1");
  __break(1u);
}

void __getPTSerializationClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTSerializationClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 41, @"Unable to find class %s", "PTSerialization");
  __break(1u);
}

void __getPTDisparityPostProcessingClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTDisparityPostProcessingClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 43, @"Unable to find class %s", "PTDisparityPostProcessing");
  __break(1u);
}

void __getPTEffectRenderRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTEffectRenderRequestClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 46, @"Unable to find class %s", "PTEffectRenderRequest");
  __break(1u);
}

void __getPTEffectReactionClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPTEffectReactionClass(void)_block_invoke"), @"BWPortraitSoftLinking.m", 47, @"Unable to find class %s", "PTEffectReaction");
  __break(1u);
}

void __getBrightnessSystemClientClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreBrightnessLibrary(void)"), @"BWAmbientLightSensor.m", 17, @"%s", *a1);
  __break(1u);
}

void __getBrightnessSystemClientClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getBrightnessSystemClientClass(void)_block_invoke"), @"BWAmbientLightSensor.m", 18, @"Unable to find class %s", "BrightnessSystemClient");
  __break(1u);
}

void __getSTActivityAttributionClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSTActivityAttributionClass(void)_block_invoke"), @"BWCameraStreamingMonitor.m", 51, @"Unable to find class %s", "STActivityAttribution");
  __break(1u);
}

void SystemStatusLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *SystemStatusLibrary(void)"), @"BWCameraStreamingMonitor.m", 48, @"%s", *a1);
  __break(1u);
}

void __getSTMediaStatusDomainPublisherClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSTMediaStatusDomainPublisherClass(void)_block_invoke"), @"BWCameraStreamingMonitor.m", 49, @"Unable to find class %s", "STMediaStatusDomainPublisher");
  __break(1u);
}

void __getSTDynamicActivityAttributionPublisherClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSTDynamicActivityAttributionPublisherClass(void)_block_invoke"), @"BWCameraStreamingMonitor.m", 55, @"Unable to find class %s", "STDynamicActivityAttributionPublisher");
  __break(1u);
}

void __getSTExecutableIdentityClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSTExecutableIdentityClass(void)_block_invoke"), @"BWCameraStreamingMonitor.m", 57, @"Unable to find class %s", "STExecutableIdentity");
  __break(1u);
}

void __getSTAttributedEntityClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSTAttributedEntityClass(void)_block_invoke"), @"BWCameraStreamingMonitor.m", 53, @"Unable to find class %s", "STAttributedEntity");
  __break(1u);
}

void AppleCVALibrary_cold_1_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *AppleCVALibrary(void)"), @"BWSingleCameraPortraitSceneMonitor.m", 24, @"%s", *a1);
  __break(1u);
}

void gr_addRetainCountsOfOutputsWithSharedPoolsForAttachedMediaToParentNodeOutputs_cold_1()
{
}

void gr_findParentOutputOfOutputWithSharedPool_cold_1()
{
}

void gr_propagatePreparedPoolsToSharedPoolOutputsForAttachedMedia_cold_1()
{
}

void gr_propagatePreparedPoolsToSharedPoolOutputsForAttachedMedia_cold_2()
{
}

void gr_propagatePreparedPoolsToSharedPoolOutputsForAttachedMedia_cold_3()
{
}

void __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *libMemoryResourceExceptionLibrary(void)"), @"FigCaptureMemoryReporter.m", 34, @"%s", *a1);
  __break(1u);
}

void rqReceiverFinalize_cold_1()
{
  __assert_rtn("rqReceiverFinalize", "FigRemoteQueue.c", 1297, "recver->source == NULL");
}

void rqReceiverFinalize_cold_2()
{
  __assert_rtn("rqReceiverFinalize", "FigRemoteQueue.c", 1296, "recver->handler == NULL");
}

void __getACCConnectionInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getACCConnectionInfoClass(void)_block_invoke"), @"BWFigCaptureAttachedAccessoriesMonitor.m", 28, @"Unable to find class %s", "ACCConnectionInfo");
  __break(1u);
}

void CoreAccessoriesLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreAccessoriesLibrary(void)"), @"BWFigCaptureAttachedAccessoriesMonitor.m", 26, @"%s", *a1);
  __break(1u);
}

void MediaAnalysisLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *MediaAnalysisLibrary(void)"), @"BWMediaAnalysisSoftLinking.m", 13, @"%s", *a1);
  __break(1u);
}

void __getVCPCaptureAnalysisSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getVCPCaptureAnalysisSessionClass(void)_block_invoke"), @"BWMediaAnalysisSoftLinking.m", 15, @"Unable to find class %s", "VCPCaptureAnalysisSession");
  __break(1u);
}

void getVCPCaptureAnalysisDispatchQueuePropertyKey_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (VCPCaptureAnalysisDispatchQueuePropertyKey) (*)(void))0)()) getVCPCaptureAnalysisDispatchQueuePropertyKey(void)"), @"BWMediaAnalysisSoftLinking.m", 17, @"%s", dlerror());
  __break(1u);
}

void getVCPCaptureAnalysisSubjectMotionScoreKey_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (VCPCaptureAnalysisSubjectMotionScoreKey) (*)(void))0)()) getVCPCaptureAnalysisSubjectMotionScoreKey(void)"), @"BWMediaAnalysisSoftLinking.m", 18, @"%s", dlerror());
  __break(1u);
}

void getVCPCaptureAnalysisMotionDivScoreKey_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "typeof (((typeof (VCPCaptureAnalysisMotionDivScoreKey) (*)(void))0)()) getVCPCaptureAnalysisMotionDivScoreKey(void)"), @"BWMediaAnalysisSoftLinking.m", 19, @"%s", dlerror());
  __break(1u);
}

void __getCCSControlCenterServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCCSControlCenterServiceClass(void)_block_invoke"), @"FigCaptureSource.m", 86, @"Unable to find class %s", "CCSControlCenterService");
  __break(1u);
}

void ControlCenterServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *ControlCenterServicesLibrary(void)"), @"FigCaptureSource.m", 85, @"%s", *a1);
  __break(1u);
}

void __getCCSModulePresentationOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCCSModulePresentationOptionsClass(void)_block_invoke"), @"FigCaptureSource.m", 88, @"Unable to find class %s", "CCSModulePresentationOptions");
  __break(1u);
}

void cs_sendNotificationOfNewTransientValue_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "BOOL soft_showReactionsTip(NSString *, NSString *)"), @"FigCaptureSource.m", 103, @"%s", dlerror());
  __break(1u);
}

void __getshowReactionsTipSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *ReplayKitLibrary(void)"), @"FigCaptureSource.m", 102, @"%s", *a1);
  __break(1u);
}

void __getCMIOExtensionProviderClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreMediaIOLibrary(void)"), @"FigCaptureSource.m", 110, @"%s", *a1);
  __break(1u);
}

void __getCMIOExtensionProviderClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCMIOExtensionProviderClass(void)_block_invoke"), @"FigCaptureSource.m", 111, @"Unable to find class %s", "CMIOExtensionProvider");
  __break(1u);
}

void __FigCaptureDeviceCoreRepairStatusesByKeys_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CRComponentState soft_CRGetComponentState(CRComponentType, CFErrorRef *)"), @"FigCaptureUtilities.m", 67, @"%s", dlerror());
  __break(1u);
}

void __getCRGetComponentStateSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreRepairCoreLibrary(void)"), @"FigCaptureUtilities.m", 66, @"%s", *a1);
  __break(1u);
  ADClientAddValueForScalarKey();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x1F4107208]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1F4107218]();
}

uint64_t AppC3DConfigCreate()
{
  return MEMORY[0x1F4108838]();
}

uint64_t AppC3DConfigRelease()
{
  return MEMORY[0x1F4108840]();
}

uint64_t AppC3DConfigSetMaxNumberCodesToTrack()
{
  return MEMORY[0x1F4108850]();
}

uint64_t AppC3DConfigSetTrackingMode()
{
  return MEMORY[0x1F4108860]();
}

uint64_t AppC3DCreate()
{
  return MEMORY[0x1F4108868]();
}

uint64_t AppC3DFlush()
{
  return MEMORY[0x1F4108870]();
}

uint64_t AppC3DProcessCameraFrameData()
{
  return MEMORY[0x1F4108880]();
}

uint64_t AppC3DRelease()
{
  return MEMORY[0x1F4108888]();
}

uint64_t AppC3DSetUpdateCallback()
{
  return MEMORY[0x1F4108898]();
}

uint64_t AppC3DTrackingResultCreateCorners()
{
  return MEMORY[0x1F41088A8]();
}

uint64_t AppC3DTrackingResultCreateData()
{
  return MEMORY[0x1F41088B0]();
}

uint64_t AppC3DTrackingResultGetDataVersion()
{
  return MEMORY[0x1F41088C0]();
}

uint64_t AppC3DTrackingResultGetMetadata()
{
  return MEMORY[0x1F41088D0]();
}

uint64_t AppC3DTrackingResultGetNumberOfTrackingData()
{
  return MEMORY[0x1F41088D8]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x1F40D4B68](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x1F40D4B78](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x1F40D4B80](inComponent, outInstance);
}

UInt64 AudioConvertHostTimeToNanos(UInt64 inHostTime)
{
  return MEMORY[0x1F40D6F70](inHostTime);
}

UInt64 AudioConvertNanosToHostTime(UInt64 inNanos)
{
  return MEMORY[0x1F40D6F78](inNanos);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F40D4CB0](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

UInt64 AudioGetCurrentHostTime(void)
{
  return MEMORY[0x1F40D6FD0]();
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x1F40D6FF8](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioOutputUnitStart(AudioUnit ci)
{
  return MEMORY[0x1F40D4CC8](ci);
}

OSStatus AudioOutputUnitStop(AudioUnit ci)
{
  return MEMORY[0x1F40D4CD0](ci);
}

uint64_t AudioSessionCopyCMSessionForSessionID()
{
  return MEMORY[0x1F40D4E78]();
}

uint64_t AudioSessionGetPrimaryAudioSessionIDForAuditToken()
{
  return MEMORY[0x1F40D4E90]();
}

uint64_t AudioSessionSetCMProperty()
{
  return MEMORY[0x1F40D4EA8]();
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1F40D4EC0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitGetPropertyInfo(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, UInt32 *outDataSize, Boolean *outWritable)
{
  return MEMORY[0x1F40D4EC8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outDataSize, outWritable);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x1F40D4ED0](inUnit);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1F40D4EE8](inUnit, ioActionFlags, inTimeStamp, *(void *)&inOutputBusNumber, *(void *)&inNumberFrames, ioData);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1F40D4F00](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

OSStatus AudioUnitUninitialize(AudioUnit inUnit)
{
  return MEMORY[0x1F40D4F08](inUnit);
}

uint64_t BSBundleIDForPID()
{
  return MEMORY[0x1F410C180]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

uint64_t CAImageQueueCollect()
{
  return MEMORY[0x1F40F4AE0]();
}

uint64_t CAImageQueueConsumeUnconsumedInRange()
{
  return MEMORY[0x1F40F4AE8]();
}

uint64_t CAImageQueueGetFlags()
{
  return MEMORY[0x1F40F4B20]();
}

uint64_t CAImageQueueGetReleasedImageInfo()
{
  return MEMORY[0x1F40F4B40]();
}

uint64_t CAImageQueueGetTimes()
{
  return MEMORY[0x1F40F4B48]();
}

uint64_t CAImageQueueInsertImageWithRotation()
{
  return MEMORY[0x1F40F4B78]();
}

uint64_t CAImageQueueRegisterIOSurfaceBuffer()
{
  return MEMORY[0x1F40F4B98]();
}

uint64_t CAImageQueueSetFlags()
{
  return MEMORY[0x1F40F4BA8]();
}

uint64_t CAImageQueueUnregisterBuffer()
{
  return MEMORY[0x1F40F4BC8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D7128](allocator, ptr, newsize, hint);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A88](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return MEMORY[0x1F40D8A70](userNotification, flags, dictionary, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

uint64_t CGBitmapContextSetData()
{
  return MEMORY[0x1F40D9880]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithColorSyncProfile(ColorSyncProfileRef a1, CFDictionaryRef options)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B40](a1, options);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextResetClip(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1F40E9810](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9820](metadata, parent, path, tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9858](xmlns, prefix, name, *(void *)&type, value);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

OSStatus CMAudioClockCreate(CFAllocatorRef allocator, CMClockRef *clockOut)
{
  return MEMORY[0x1F40DB850](allocator, clockOut);
}

OSStatus CMAudioDeviceClockCreate(CFAllocatorRef allocator, CFStringRef deviceUID, CMClockRef *clockOut)
{
  return MEMORY[0x1F40DB858](allocator, deviceUID, clockOut);
}

OSStatus CMAudioDeviceClockGetAudioDevice(CMClockRef clock, CFStringRef *deviceUIDOut, AudioDeviceID *deviceIDOut, Boolean *trackingDefaultDeviceOut)
{
  return MEMORY[0x1F40DB868](clock, deviceUIDOut, deviceIDOut, trackingDefaultDeviceOut);
}

OSStatus CMAudioDeviceClockSetAudioDeviceUID(CMClockRef clock, CFStringRef deviceUID)
{
  return MEMORY[0x1F40DB870](clock, deviceUID);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DB880](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioChannelLayout *__cdecl CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioChannelLayout *)MEMORY[0x1F40DB8A0](desc, sizeOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1F40DB8D8](desc);
}

uint64_t CMBaseGetClassID()
{
  return MEMORY[0x1F40DB900]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x1F40DB910]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1F40DB920]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB970](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB988](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CFTypeID CMBlockBufferGetTypeID(void)
{
  return MEMORY[0x1F40DB9B0]();
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1F40DB9C0](theBuffer, offset, length);
}

uint64_t CMByteStreamCreateForFileURL()
{
  return MEMORY[0x1F40DBAF8]();
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x1F40DBB20](hostTime);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1F40DBB30]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1F40DBB38](retstr, clock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBB70](allocator, target, *(void *)&attachmentMode);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x1F40DBB80]();
}

OSStatus CMFormatDescriptionCreate(CFAllocatorRef allocator, CMMediaType mediaType, FourCharCode mediaSubType, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBBA0](allocator, *(void *)&mediaType, *(void *)&mediaSubType, extensions, formatDescriptionOut);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x1F40DBBA8](formatDescription, otherFormatDescription);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1F40DBBB8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBD0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

uint64_t CMIGetPixelFormatInfo()
{
  return MEMORY[0x1F410D490]();
}

uint64_t CMILSCOISAdaptation_convertV2LSCTableToV1LSCTable()
{
  return MEMORY[0x1F410D498]();
}

uint64_t CMIOExtensionPropertyFromPropertyAddress()
{
  return MEMORY[0x1F40DEDA0]();
}

OSStatus CMMetadataDataTypeRegistryRegisterDataType(CFStringRef dataType, CFStringRef description, CFArrayRef conformingDataTypes)
{
  return MEMORY[0x1F40DBC50](dataType, description, conformingDataTypes);
}

OSStatus CMMetadataFormatDescriptionCopyAsBigEndianMetadataDescriptionBlockBuffer(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef metadataFormatDescription, CMMetadataDescriptionFlavor flavor, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DBC58](allocator, metadataFormatDescription, flavor, blockBufferOut);
}

OSStatus CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef sourceDescription, CMMetadataFormatDescriptionRef otherSourceDescription, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC60](allocator, sourceDescription, otherSourceDescription, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescriptionBlockBuffer(CFAllocatorRef allocator, CMBlockBufferRef metadataDescriptionBlockBuffer, CMMetadataDescriptionFlavor flavor, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC68](allocator, metadataDescriptionBlockBuffer, flavor, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC80](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1F40DBCA8]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1F40DBCB8]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x1F40DBCC0]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1F40DBCD8]();
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImage()
{
  return MEMORY[0x1F410D510]();
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImageAsync()
{
  return MEMORY[0x1F410D518]();
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImageMetadata()
{
  return MEMORY[0x1F410D528]();
}

uint64_t CMPhotoCompressionSessionAddCustomMetadata()
{
  return MEMORY[0x1F410D540]();
}

uint64_t CMPhotoCompressionSessionAddGroup()
{
  return MEMORY[0x1F410D558]();
}

uint64_t CMPhotoCompressionSessionAddGroupProperties()
{
  return MEMORY[0x1F410D560]();
}

uint64_t CMPhotoCompressionSessionAddImage()
{
  return MEMORY[0x1F410D568]();
}

uint64_t CMPhotoCompressionSessionAddImageAsync()
{
  return MEMORY[0x1F410D570]();
}

uint64_t CMPhotoCompressionSessionAddImageHandleToGroup()
{
  return MEMORY[0x1F410D578]();
}

uint64_t CMPhotoCompressionSessionCloseContainer()
{
  return MEMORY[0x1F410D5A8]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x1F410D5B0]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x1F410D5B8]();
}

uint64_t CMPhotoCompressionSessionFlushCachedBuffers()
{
  return MEMORY[0x1F410D5D0]();
}

uint64_t CMPhotoCompressionSessionInvalidate()
{
  return MEMORY[0x1F410D5E0]();
}

uint64_t CMPhotoCompressionSessionIsContainerOpen()
{
  return MEMORY[0x1F410D5E8]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x1F410D5F0]();
}

uint64_t CMPhotoCompressionSessionReleaseHardwareResources()
{
  return MEMORY[0x1F410D610]();
}

uint64_t CMPhotoDNGCompressorCreate()
{
  return MEMORY[0x1F410D658]();
}

uint64_t CMPhotoDNGCompressorFinalizeAndCreateData()
{
  return MEMORY[0x1F410D670]();
}

uint64_t CMPhotoDNGCompressorFinalizeAndCreateSurface()
{
  return MEMORY[0x1F410D678]();
}

uint64_t CMPhotoDNGCompressorGetFinalizedSize()
{
  return MEMORY[0x1F410D680]();
}

uint64_t CMPhotoDNGCompressorSetCompressedPreviewImage()
{
  return MEMORY[0x1F410D6A8]();
}

uint64_t CMPhotoDNGGetLightSourceTagFromTemp()
{
  return MEMORY[0x1F410D6F8]();
}

uint64_t CMPhotoDNGVersionFromPropertiesAndOptions()
{
  return MEMORY[0x1F410D708]();
}

uint64_t CMPhotoDecompressionContainerCreateImageForIndex()
{
  return MEMORY[0x1F410D7D0]();
}

uint64_t CMPhotoDecompressionContainerCreateOutputBufferAttributesForImageIndex()
{
  return MEMORY[0x1F410D7E0]();
}

uint64_t CMPhotoDecompressionContainerGetImageCount()
{
  return MEMORY[0x1F410D8A0]();
}

uint64_t CMPhotoDecompressionContainerGetPrimaryItemIndexWithOptions()
{
  return MEMORY[0x1F410D8C8]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1F410D960]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1F410D968]();
}

uint64_t CMPhotoDecompressionSessionFlushCachedBuffers()
{
  return MEMORY[0x1F410D980]();
}

uint64_t CMPhotoDecompressionSessionReleaseHardwareResources()
{
  return MEMORY[0x1F410D990]();
}

uint64_t CMPhotoDetermineMIAFCompliantThumbnailMaxPixelSize()
{
  return MEMORY[0x1F410DA10]();
}

uint64_t CMPhotoScaleAndRotateSessionCreate()
{
  return MEMORY[0x1F410DB48]();
}

uint64_t CMPhotoScaleAndRotateSessionTransformForMaxSideLength()
{
  return MEMORY[0x1F410DB60]();
}

uint64_t CMPhotoSurfacePoolCreate()
{
  return MEMORY[0x1F410DB88]();
}

uint64_t CMPhotoSurfacePoolDiscardCaches()
{
  return MEMORY[0x1F410DBB8]();
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
}

void CMRemoveAllAttachments(CMAttachmentBearerRef target)
{
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
}

OSStatus CMSampleBufferCopyPCMDataIntoAudioBufferList(CMSampleBufferRef sbuf, int32_t frameOffset, int32_t numFrames, AudioBufferList *bufferList)
{
  return MEMORY[0x1F40DBD20](sbuf, *(void *)&frameOffset, *(void *)&numFrames, bufferList);
}

OSStatus CMSampleBufferCopySampleBufferForRange(CFAllocatorRef allocator, CMSampleBufferRef sbuf, CFRange sampleRange, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD28](allocator, sbuf, sampleRange.location, sampleRange.length, sampleBufferOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopy(CFAllocatorRef allocator, CMSampleBufferRef sbuf, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD38](allocator, sbuf, sampleBufferOut);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD40](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD48](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

uint64_t CMSampleBufferCreateReadyForCVDataBuffer()
{
  return MEMORY[0x1F40DBD68]();
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DBD88](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, blockBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDecodeTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDB0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDB8](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

OSStatus CMSampleBufferGetSampleSizeArray(CMSampleBufferRef sbuf, CMItemCount sizeArrayEntries, size_t *sizeArrayOut, CMItemCount *sizeArrayEntriesNeededOut)
{
  return MEMORY[0x1F40DBE10](sbuf, sizeArrayEntries, sizeArrayOut, sizeArrayEntriesNeededOut);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1F40DBE18](sbuf, sampleIndex, timingInfoOut);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x1F40DBE20](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x1F40DBE38]();
}

uint64_t CMSessionBeginInterruption()
{
  return MEMORY[0x1F412C998]();
}

uint64_t CMSessionCopyProperty()
{
  return MEMORY[0x1F412C9A0]();
}

uint64_t CMSessionCreate()
{
  return MEMORY[0x1F412C9B8]();
}

uint64_t CMSessionEndInterruption()
{
  return MEMORY[0x1F412C9C8]();
}

uint64_t CMSessionGetNotificationCenter()
{
  return MEMORY[0x1F412C9D8]();
}

uint64_t CMSessionSetProperty()
{
  return MEMORY[0x1F412CA30]();
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x1F40DBED0](allocator, *(void *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x1F40DBED8](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x1F40DBEE0](queue, element);
}

int32_t CMSimpleQueueGetCapacity(CMSimpleQueueRef queue)
{
  return MEMORY[0x1F40DBEE8](queue);
}

int32_t CMSimpleQueueGetCount(CMSimpleQueueRef queue)
{
  return MEMORY[0x1F40DBEF0](queue);
}

const void *__cdecl CMSimpleQueueGetHead(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x1F40DBEF8](queue);
}

OSStatus CMSimpleQueueReset(CMSimpleQueueRef queue)
{
  return MEMORY[0x1F40DBF08](queue);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x1F40DBF20](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

Float64 CMSyncGetRelativeRate(CMClockOrTimebaseRef ofClockOrTimebase, CMClockOrTimebaseRef relativeToClockOrTimebase)
{
  MEMORY[0x1F40DBF28](ofClockOrTimebase, relativeToClockOrTimebase);
  return result;
}

OSStatus CMTagCollectionCreate(CFAllocatorRef allocator, const CMTag *tags, CMItemCount tagCount, CMTagCollectionRef *newCollectionOut)
{
  return MEMORY[0x1F40DBF68](allocator, tags, tagCount, newCollectionOut);
}

CMTag CMTagMakeWithSInt64Value(CMTagCategory category, int64_t value)
{
  uint64_t v2 = MEMORY[0x1F40DC000](*(void *)&category, value);
  result.value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

OSStatus CMTaggedBufferGroupCreate(CFAllocatorRef allocator, CFArrayRef tagCollections, CFArrayRef buffers, CMTaggedBufferGroupRef *groupOut)
{
  return MEMORY[0x1F40DC008](allocator, tagCollections, buffers, groupOut);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1F40DC080](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC178](retstr, time, multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1F40DC180](retstr, time, *(void *)&multiplier, *(void *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1F40DC198](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

uint64_t CMTimeRemainder()
{
  return MEMORY[0x1F40DC1E8]();
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC300](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC308](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

Boolean CVBufferHasAttachment(CVBufferRef buffer, CFStringRef key)
{
  return MEMORY[0x1F40DFB68](buffer, key);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

uint64_t CVDataBufferGetDataFormatType()
{
  return MEMORY[0x1F40DFBC8]();
}

uint64_t CVDataBufferGetDataSize()
{
  return MEMORY[0x1F40DFBD0]();
}

uint64_t CVDataBufferGetIOSurface()
{
  return MEMORY[0x1F40DFBD8]();
}

uint64_t CVDataBufferGetTypeID()
{
  return MEMORY[0x1F40DFBE8]();
}

uint64_t CVDataBufferPoolCreate()
{
  return MEMORY[0x1F40DFBF0]();
}

uint64_t CVDataBufferPoolCreateDataBuffer()
{
  return MEMORY[0x1F40DFBF8]();
}

uint64_t CVDataBufferPoolPrefetchPages()
{
  return MEMORY[0x1F40DFC00]();
}

uint64_t CVDataBufferPoolSetMinBufferCount()
{
  return MEMORY[0x1F40DFC10]();
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CGSize CVImageBufferGetEncodedSize(CVImageBufferRef imageBuffer)
{
  MEMORY[0x1F40DFC38](imageBuffer);
  result.height = v2;
  result.width = v1;
  return result;
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

uint64_t CVPixelBufferCalculateSparseHistogramOfCompressedTileDataUsageOfPlane()
{
  return MEMORY[0x1F40DFCD0]();
}

CFDictionaryRef CVPixelBufferCopyCreationAttributes(CVPixelBufferRef pixelBuffer)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFCD8](pixelBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1F40DFD20]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

uint64_t CVPixelBufferGetFixedPointFractionalBits()
{
  return MEMORY[0x1F40DFD60]();
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1F40DFD90]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDD0](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFDF0](pool);
}

uint64_t CVPixelBufferPoolPreAllocate()
{
  return MEMORY[0x1F40DFE00]();
}

uint64_t CVPixelBufferPoolPrefetchPages()
{
  return MEMORY[0x1F40DFE08]();
}

uint64_t CVPixelBufferPoolSetMinBufferCount()
{
  return MEMORY[0x1F40DFE30]();
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1F40DFE58]();
}

uint64_t CVPixelFormatDescriptionGetPixelFormatTypes()
{
  return MEMORY[0x1F40DFE60]();
}

uint64_t ColorSyncProfileCreateCopyWithFlexGTC()
{
  return MEMORY[0x1F40D6580]();
}

ColorSyncProfileRef ColorSyncProfileCreateWithName(CFStringRef name)
{
  return (ColorSyncProfileRef)MEMORY[0x1F40D65A0](name);
}

uint64_t CopyPixelBuffer()
{
  return MEMORY[0x1F410D4A0]();
}

uint64_t CreatePixelBuffer()
{
  return MEMORY[0x1F410D4A8]();
}

uint64_t CreateSampleBuffer()
{
  return MEMORY[0x1F410D4B0]();
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x1F41173D0]();
}

uint64_t DMPerformMigrationIfNeeded()
{
  return MEMORY[0x1F41173E0]();
}

uint64_t FPSupport_CopyCAContext()
{
  return MEMORY[0x1F40ED0C8]();
}

uint64_t FPSupport_DeleteCASlot()
{
  return MEMORY[0x1F40ED0E0]();
}

uint64_t FPSupport_EnsureCAImageQueue()
{
  return MEMORY[0x1F40ED0E8]();
}

uint64_t FigActivitySchedulerCreateForNewThread()
{
  return MEMORY[0x1F40ED140]();
}

uint64_t FigAssetReaderCreateWithURLAndFormatReader()
{
  return MEMORY[0x1F40ED270]();
}

uint64_t FigAssetReaderGetFigBaseObject()
{
  return MEMORY[0x1F40ED278]();
}

uint64_t FigAssetWriterCreateWithURL()
{
  return MEMORY[0x1F40ED2C8]();
}

uint64_t FigAssetWriterGetFigBaseObject()
{
  return MEMORY[0x1F40ED2D0]();
}

uint64_t FigAtomicAdd32()
{
  return MEMORY[0x1F40DC578]();
}

uint64_t FigAtomicDecrement32()
{
  return MEMORY[0x1F40DC5A0]();
}

uint64_t FigAtomicIncrement32()
{
  return MEMORY[0x1F40DC5A8]();
}

uint64_t FigAudioDeviceClockRemoteCreateForServerObject()
{
  return MEMORY[0x1F40DC5C0]();
}

uint64_t FigAudioDeviceClockServer_MakeWrapperForClockWithManualCommandPortSendRightInsertion()
{
  return MEMORY[0x1F40DC5D0]();
}

uint64_t FigAudioDeviceClockSetIgnoresBluetoothPresentationTimeSupport()
{
  return MEMORY[0x1F40DC5D8]();
}

uint64_t FigAudioFileFormatWriterCreateWithByteStream()
{
  return MEMORY[0x1F40ED2F8]();
}

uint64_t FigAudioSessionClockCreateForAVAudioSession()
{
  return MEMORY[0x1F40ED300]();
}

uint64_t FigBoxedMetadataAppendCFTypedValue()
{
  return MEMORY[0x1F40DC678]();
}

uint64_t FigBoxedMetadataAppendValue()
{
  return MEMORY[0x1F40DC6A8]();
}

uint64_t FigBoxedMetadataCreateForConstruction()
{
  return MEMORY[0x1F40DC6B8]();
}

uint64_t FigBoxedMetadataEndConstruction()
{
  return MEMORY[0x1F40DC6C8]();
}

uint64_t FigBoxedMetadataGetBlockBuffer()
{
  return MEMORY[0x1F40DC6D0]();
}

uint64_t FigCFArrayContainsValue()
{
  return MEMORY[0x1F40DC848]();
}

uint64_t FigCFArrayGetCGRectAtIndex()
{
  return MEMORY[0x1F40DC890]();
}

uint64_t FigCFArrayGetFloatAtIndex()
{
  return MEMORY[0x1F40DC8C0]();
}

uint64_t FigCFArrayGetIntAtIndex()
{
  return MEMORY[0x1F40DC8E0]();
}

uint64_t FigCFDictionaryAddEntriesToDictionaryWithRecursion()
{
  return MEMORY[0x1F40DC940]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x1F40DC970]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x1F40DC988]();
}

uint64_t FigCFDictionaryGetBooleanValue()
{
  return MEMORY[0x1F40DC990]();
}

uint64_t FigCFDictionaryGetCGFloatIfPresent()
{
  return MEMORY[0x1F40DC9A0]();
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x1F40DC9A8]();
}

uint64_t FigCFDictionaryGetDoubleIfPresent()
{
  return MEMORY[0x1F40DC9E0]();
}

uint64_t FigCFDictionaryGetFloat32IfPresent()
{
  return MEMORY[0x1F40DC9E8]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1F40DC9F0]();
}

uint64_t FigCFDictionaryGetInt16IfPresent()
{
  return MEMORY[0x1F40DC9F8]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x1F40DCA00]();
}

uint64_t FigCFDictionaryGetInt64IfPresent()
{
  return MEMORY[0x1F40DCA08]();
}

uint64_t FigCFDictionaryGetIntIfPresent()
{
  return MEMORY[0x1F40DCA10]();
}

uint64_t FigCFDictionaryGetValue()
{
  return MEMORY[0x1F40DCA38]();
}

uint64_t FigCFDictionaryGetValueIfPresent()
{
  return MEMORY[0x1F40DCA48]();
}

uint64_t FigCFDictionarySetCGFloat()
{
  return MEMORY[0x1F40DCA70]();
}

uint64_t FigCFDictionarySetCGRect()
{
  return MEMORY[0x1F40DCA78]();
}

uint64_t FigCFDictionarySetDouble()
{
  return MEMORY[0x1F40DCA98]();
}

uint64_t FigCFDictionarySetFloat()
{
  return MEMORY[0x1F40DCAA0]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x1F40DCAC0]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x1F40DCAE8]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1F40DCAF8]();
}

uint64_t FigCFNumberCreateUInt32()
{
  return MEMORY[0x1F40DCB50]();
}

uint64_t FigCFNumberGetSInt32()
{
  return MEMORY[0x1F40DCB78]();
}

uint64_t FigCFNumberGetSInt64()
{
  return MEMORY[0x1F40DCB80]();
}

uint64_t FigCFNumberGetUInt64()
{
  return MEMORY[0x1F40DCB98]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x1F40DCC20]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x1F40DCCA0]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x1F40DCCA8]();
}

uint64_t FigCaptureComputeImageGainFromMetadata()
{
  return MEMORY[0x1F410D468]();
}

uint64_t FigCaptureStreamFocusingMethodIsContrastBased()
{
  return MEMORY[0x1F410D478]();
}

uint64_t FigCaptureStreamFocusingMethodIsPhaseDetectionBased()
{
  return MEMORY[0x1F410D480]();
}

uint64_t FigConditionVariableBroadcast()
{
  return MEMORY[0x1F40DCF70]();
}

uint64_t FigConditionVariableCreate()
{
  return MEMORY[0x1F40DCF78]();
}

uint64_t FigConditionVariableDestroy()
{
  return MEMORY[0x1F40DCF80]();
}

uint64_t FigConditionVariableWaitRelative()
{
  return MEMORY[0x1F40DCF88]();
}

uint64_t FigConsolidateMovieFragments()
{
  return MEMORY[0x1F40ED448]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1F4103088]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x1F4103098]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x1F40DD2C8]();
}

uint64_t FigDebugIsInternalBuild()
{
  return MEMORY[0x1F40DD2D8]();
}

uint64_t FigDispatchQueueCreateStandardDispatchQueue()
{
  return MEMORY[0x1F40DD390]();
}

uint64_t FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority()
{
  return MEMORY[0x1F40DD398]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x1F40DD3A8]();
}

uint64_t FigDisplayModes_ExtractDimensionsFromTimingMode()
{
  return MEMORY[0x1F40ED550]();
}

uint64_t FigDisplayModes_LookupTimingModeIDByIndex()
{
  return MEMORY[0x1F40ED558]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x1F40DD468]();
}

uint64_t FigEndpointManagerForCameraPreviewGetShared()
{
  return MEMORY[0x1F40ED568]();
}

uint64_t FigEndpointManagerGetCMBaseObject()
{
  return MEMORY[0x1F40DD490]();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return MEMORY[0x1F40DD570]();
}

uint64_t FigFileDoesFileExist()
{
  return MEMORY[0x1F40DD658]();
}

uint64_t FigFileIsFileOnExternalStorageDevice()
{
  return MEMORY[0x1F40DD6B0]();
}

uint64_t FigFloat16ConvertToFloat32()
{
  return MEMORY[0x1F40DD6F0]();
}

uint64_t FigFloat32ConvertToFloat16()
{
  return MEMORY[0x1F40DD6F8]();
}

uint64_t FigFormatReaderCreateForStream()
{
  return MEMORY[0x1F40ED5C8]();
}

uint64_t FigFormatWriterGetFigBaseObject()
{
  return MEMORY[0x1F40ED5F8]();
}

uint64_t FigGetAlignmentForIOSurfaceOutput()
{
  return MEMORY[0x1F41030A8]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x1F40DD840]();
}

uint64_t FigGetCFPreferenceDoubleWithDefault()
{
  return MEMORY[0x1F40DD848]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x1F40DD858]();
}

uint64_t FigGetContinuousUpTimeNanoseconds()
{
  return MEMORY[0x1F40DD880]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x1F40DD8C8]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x1F40DD8D0]();
}

uint64_t FigHostTimeToNanoseconds()
{
  return MEMORY[0x1F40DDAB8]();
}

uint64_t FigIsItOKToLogURLs()
{
  return MEMORY[0x1F40DDB40]();
}

uint64_t FigLogBacktrace()
{
  return MEMORY[0x1F40DDB78]();
}

uint64_t FigMachPortReleaseReceiveRight_()
{
  return MEMORY[0x1F40DDB80]();
}

uint64_t FigMachPortReleaseSendRight_()
{
  return MEMORY[0x1F40DDB88]();
}

uint64_t FigMemoryBarrier()
{
  return MEMORY[0x1F40DDBB0]();
}

uint64_t FigMetadataCopyTrackQuickTimeMetadata()
{
  return MEMORY[0x1F40ED6C8]();
}

uint64_t FigMetadataCopyTrackQuickTimeUserdata()
{
  return MEMORY[0x1F40ED6D0]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1F40DDC58]();
}

uint64_t FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray()
{
  return MEMORY[0x1F40ED710]();
}

uint64_t FigMetadataWriterGetFigBaseObject()
{
  return MEMORY[0x1F40ED720]();
}

uint64_t FigMovieFormatWriterCreateWithByteStream()
{
  return MEMORY[0x1F40ED738]();
}

uint64_t FigMutableMovieCreateWithURL()
{
  return MEMORY[0x1F40ED760]();
}

uint64_t FigMutableMovieGetFigBaseObject()
{
  return MEMORY[0x1F40ED768]();
}

uint64_t FigNanosecondsToHostTime()
{
  return MEMORY[0x1F40DDCC8]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x1F40DDD50]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x1F40DDD90]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x1F40DDDB0]();
}

uint64_t FigOSTransactionCopyDescriptions()
{
  return MEMORY[0x1F40DDDF0]();
}

uint64_t FigOSTransactionCreate()
{
  return MEMORY[0x1F40DDDF8]();
}

uint64_t FigReentrantMutexCreate()
{
  return MEMORY[0x1F40DDFA0]();
}

uint64_t FigReentrantMutexDestroy()
{
  return MEMORY[0x1F40DDFA8]();
}

uint64_t FigReentrantMutexLock()
{
  return MEMORY[0x1F40DDFB0]();
}

uint64_t FigReentrantMutexUnlock()
{
  return MEMORY[0x1F40DDFC0]();
}

uint64_t FigRemote_CreateFormatDescriptionFromSerializedDictionary()
{
  return MEMORY[0x1F40DE050]();
}

uint64_t FigRemote_CreateSampleBufferFromSerializedAtomBlockBufferAndSurface()
{
  return MEMORY[0x1F40DE080]();
}

uint64_t FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer()
{
  return MEMORY[0x1F40DE098]();
}

uint64_t FigRemote_CreateSerializableDictionaryForFormatDescription()
{
  return MEMORY[0x1F40DE0A0]();
}

uint64_t FigRemote_CreateSerializedAtomDataAndSurfaceForSampleBuffer()
{
  return MEMORY[0x1F40DE0B0]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer()
{
  return MEMORY[0x1F40DE0D8]();
}

uint64_t FigRemote_GetServerTimeoutToken()
{
  return MEMORY[0x1F40DE120]();
}

uint64_t FigRewriteMetadata()
{
  return MEMORY[0x1F40EDAE0]();
}

uint64_t FigSampleBufferProcessorCreateForCustom()
{
  return MEMORY[0x1F40EDB28]();
}

uint64_t FigSampleBufferProcessorCreateWithAudioCompression()
{
  return MEMORY[0x1F40EDB30]();
}

uint64_t FigSampleBufferProcessorGetClassID()
{
  return MEMORY[0x1F40EDB38]();
}

uint64_t FigSampleBufferProcessorGetFigBaseObject()
{
  return MEMORY[0x1F40EDB40]();
}

uint64_t FigSandboxRegisterURLWithProcess()
{
  return MEMORY[0x1F40DE258]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x1F40DE298]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x1F40DE2A0]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x1F40DE2B0]();
}

uint64_t FigServer_IsWritableFileOpeningOrCreationPermittedForAuditToken()
{
  return MEMORY[0x1F40DE310]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1F40DE320]();
}

uint64_t FigSimpleMutexCheckIsLockedOnThisThread()
{
  return MEMORY[0x1F40DE330]();
}

uint64_t FigSimpleMutexCheckIsNotLockedOnThisThread()
{
  return MEMORY[0x1F40DE338]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1F40DE340]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1F40DE348]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1F40DE350]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1F40DE360]();
}

uint64_t FigSimpleQueueRelease()
{
  return MEMORY[0x1F40DE368]();
}

uint64_t FigSimpleQueueSetQueueIsFullErrorLoggingEnabled()
{
  return MEMORY[0x1F40DE370]();
}

uint64_t FigThreadGetMachThreadPriorityValue()
{
  return MEMORY[0x1F40DE5C0]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1F40DE5F0]();
}

uint64_t FigTrackReaderGetFigBaseObject()
{
  return MEMORY[0x1F40EDC50]();
}

uint64_t FigUSleep()
{
  return MEMORY[0x1F40DE7C0]();
}

uint64_t FigVirtualCaptureCardGetCMBaseObject()
{
  return MEMORY[0x1F40DE870]();
}

uint64_t FigVirtualCaptureCardGetSingleton()
{
  return MEMORY[0x1F40DE878]();
}

uint64_t FigVirtualDisplaySourceGetCMBaseObject()
{
  return MEMORY[0x1F40EDD08]();
}

uint64_t FigVirtualDisplaySourceGetClassID()
{
  return MEMORY[0x1F40EDD10]();
}

uint64_t FigXPCCreateBasicMessage()
{
  return MEMORY[0x1F40DE950]();
}

uint64_t FigXPCHandleStdCopyPropertyMessage()
{
  return MEMORY[0x1F40DE970]();
}

uint64_t FigXPCHandleStdSetPropertyMessage()
{
  return MEMORY[0x1F40DE978]();
}

uint64_t FigXPCMessageCopyCFArray()
{
  return MEMORY[0x1F40DE9A8]();
}

uint64_t FigXPCMessageCopyCFData()
{
  return MEMORY[0x1F40DE9B8]();
}

uint64_t FigXPCMessageCopyCFDictionary()
{
  return MEMORY[0x1F40DE9C8]();
}

uint64_t FigXPCMessageCopyCFError()
{
  return MEMORY[0x1F40DE9D0]();
}

uint64_t FigXPCMessageCopyCFNumber()
{
  return MEMORY[0x1F40DE9D8]();
}

uint64_t FigXPCMessageCopyCFObject()
{
  return MEMORY[0x1F40DE9E0]();
}

uint64_t FigXPCMessageCopyCFString()
{
  return MEMORY[0x1F40DE9E8]();
}

uint64_t FigXPCMessageCreateBlockBufferData()
{
  return MEMORY[0x1F40DEA58]();
}

uint64_t FigXPCMessageGetCMTime()
{
  return MEMORY[0x1F40DEA68]();
}

uint64_t FigXPCMessageGetOpCode()
{
  return MEMORY[0x1F40DEA90]();
}

uint64_t FigXPCMessageSetAndConsumeVMData()
{
  return MEMORY[0x1F40DEAA0]();
}

uint64_t FigXPCMessageSetCFArray()
{
  return MEMORY[0x1F40DEAB8]();
}

uint64_t FigXPCMessageSetCFData()
{
  return MEMORY[0x1F40DEAC8]();
}

uint64_t FigXPCMessageSetCFDictionary()
{
  return MEMORY[0x1F40DEAD8]();
}

uint64_t FigXPCMessageSetCFError()
{
  return MEMORY[0x1F40DEAE0]();
}

uint64_t FigXPCMessageSetCFNumber()
{
  return MEMORY[0x1F40DEAE8]();
}

uint64_t FigXPCMessageSetCFObject()
{
  return MEMORY[0x1F40DEAF0]();
}

uint64_t FigXPCMessageSetCFString()
{
  return MEMORY[0x1F40DEAF8]();
}

uint64_t FigXPCMessageSetCMTime()
{
  return MEMORY[0x1F40DEB08]();
}

uint64_t FigXPCRelease()
{
  return MEMORY[0x1F40DEB78]();
}

uint64_t FigXPCRemoteClientAssociateObject()
{
  return MEMORY[0x1F40DEB80]();
}

uint64_t FigXPCRemoteClientCreate()
{
  return MEMORY[0x1F40DEBA0]();
}

uint64_t FigXPCRemoteClientDisassociateObject()
{
  return MEMORY[0x1F40DEBB8]();
}

uint64_t FigXPCRemoteClientKillServerOnTimeout()
{
  return MEMORY[0x1F40DEBD0]();
}

uint64_t FigXPCRemoteClientSendAsyncMessage()
{
  return MEMORY[0x1F40DEBE8]();
}

uint64_t FigXPCRemoteClientSendSyncMessage()
{
  return MEMORY[0x1F40DEBF0]();
}

uint64_t FigXPCRemoteClientSendSyncMessageCreatingReply()
{
  return MEMORY[0x1F40DEBF8]();
}

uint64_t FigXPCRemoteClientSendSyncMessageWithNoTimeoutCreatingReply()
{
  return MEMORY[0x1F40DEC00]();
}

uint64_t FigXPCRetain()
{
  return MEMORY[0x1F40DEC08]();
}

uint64_t FigXPCSendStdCopyPropertyMessage()
{
  return MEMORY[0x1F40DEC10]();
}

uint64_t FigXPCSendStdSetPropertyMessage()
{
  return MEMORY[0x1F40DEC18]();
}

uint64_t FigXPCServerAssociateObjectWithConnection()
{
  return MEMORY[0x1F40DEC40]();
}

uint64_t FigXPCServerDisassociateObjectWithConnection()
{
  return MEMORY[0x1F40DEC80]();
}

uint64_t FigXPCServerGetConnectionRefcon()
{
  return MEMORY[0x1F40DEC98]();
}

uint64_t FigXPCServerLookupAndRetainAssociatedObject()
{
  return MEMORY[0x1F40DECA0]();
}

uint64_t FigXPCServerSetConnectionRefcon()
{
  return MEMORY[0x1F40DECC0]();
}

uint64_t FigXPCServerStart()
{
  return MEMORY[0x1F40DECC8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x1F40E8AA0]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x1F40E8AA8]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1F40E8AC8]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1F40E8AF0]();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return MEMORY[0x1F40E8B28]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x1F40E8B30]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1F40E8B38]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F78](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1F40E91F8](*(void *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1F40E9238](notifyPort, notificationType, matching, callback, refCon, notification);
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

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource()
{
  return MEMORY[0x1F4124C58]();
}

uint64_t IOSurfaceAcceleratorSetCustomFilter()
{
  return MEMORY[0x1F4124C68]();
}

uint64_t IOSurfaceAcceleratorTransferSurface()
{
  return MEMORY[0x1F4124C70]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9318](buffer);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

uint64_t IOSurfaceGetCompressedTileDataRegionMemoryUsedOfPlane()
{
  return MEMORY[0x1F40E93D8]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1F40E93F0]();
}

uint64_t IOSurfaceGetExtendedPixelsOfPlane()
{
  return MEMORY[0x1F40E9428]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9450](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1F40E94E0]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9508](buffer, planeIndex);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9530](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9550](*(void *)&csid);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9558](*(void *)&port);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x1F40E95A0]();
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1F417CE30]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MSNMonitorSetCameraNonStandardCameraClient()
{
  return MEMORY[0x1F412EB60]();
}

uint64_t MSNMonitorSetCameraState()
{
  return MEMORY[0x1F412EB68]();
}

uint64_t MSNMonitorSetLastCameraClient()
{
  return MEMORY[0x1F412EB70]();
}

uint64_t MSNMonitorSetXCTestExceptionState()
{
  return MEMORY[0x1F412EB78]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DC0]();
}

uint64_t SBSCreateLayoutServiceEndpointForExternalDisplay()
{
  return MEMORY[0x1F415C328]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x1F41030F0](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x1F4103100](allocator, *(void *)&width, *(void *)&height, *(void *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1F4103110](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

OSStatus VTCompressionSessionEncodeMultiImageFrame(VTCompressionSessionRef session, CMTaggedBufferGroupRef taggedBufferGroup, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1F4103120](session, taggedBufferGroup, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
}

OSStatus VTCompressionSessionPrepareToEncodeFrames(VTCompressionSessionRef session)
{
  return MEMORY[0x1F4103150](session);
}

uint64_t VTFillPixelBufferBorderWithBlack()
{
  return MEMORY[0x1F41032B0]();
}

uint64_t VTFillPixelBufferWithBlack()
{
  return MEMORY[0x1F41032B8]();
}

uint64_t VTHDRMetadataGenerationSessionCreate()
{
  return MEMORY[0x1F4103320]();
}

uint64_t VTHDRMetadataGenerationSessionCreateDataFromStatisticsDictionary()
{
  return MEMORY[0x1F4103330]();
}

uint64_t VTHDRMetadataGenerationSessionSetFramesPerSecond()
{
  return MEMORY[0x1F4103338]();
}

Boolean VTIsStereoMVHEVCEncodeSupported(void)
{
  return MEMORY[0x1F4103388]();
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1F4103490](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034A8](session, sourceBuffer, destinationBuffer);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x1F41034B0]();
}

uint64_t VTPixelRotationSessionSetProperty()
{
  return MEMORY[0x1F41034B8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x1F4103520](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionCopySupportedPropertyDictionary(VTSessionRef session, CFDictionaryRef *supportedPropertyDictionaryOut)
{
  return MEMORY[0x1F4103528](session, supportedPropertyDictionaryOut);
}

OSStatus VTSessionSetProperties(VTSessionRef session, CFDictionaryRef propertyDictionary)
{
  return MEMORY[0x1F4103530](session, propertyDictionary);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t VTTemporalFilterSessionCompleteFrames()
{
  return MEMORY[0x1F4103548]();
}

uint64_t VTTemporalFilterSessionCreate()
{
  return MEMORY[0x1F4103550]();
}

uint64_t VTTemporalFilterSessionInvalidate()
{
  return MEMORY[0x1F4103558]();
}

uint64_t VTTemporalFilterSessionProcessFrame()
{
  return MEMORY[0x1F4103560]();
}

uint64_t WriteStackshotReport()
{
  return MEMORY[0x1F4116EB8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _FigIsCurrentDispatchQueue()
{
  return MEMORY[0x1F40DED38]();
}

uint64_t _FigIsNotCurrentDispatchQueue()
{
  return MEMORY[0x1F40DED40]();
}

uint64_t _NSIsNSCFConstantString()
{
  return MEMORY[0x1F40D94A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

uint64_t __invert_d3()
{
  return MEMORY[0x1F40C9BE0]();
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  MEMORY[0x1F40C9BF0]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x1F40C9C00]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1F40C9CE8]();
}

double __tanpi(double a1)
{
  MEMORY[0x1F40C9CF0](a1);
  return result;
}

void _exit(int a1)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1F40CA488](a1);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2F0](atoken);
}

void bzero(void *a1, size_t a2)
{
}

long double cbrt(long double __x)
{
  MEMORY[0x1F40CA688](__x);
  return result;
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

uint64_t dgesdd_NEWLAPACK()
{
  return MEMORY[0x1F40D1708]();
}

uint64_t dgesvd_NEWLAPACK()
{
  return MEMORY[0x1F40D1728]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void dispatch_workloop_set_os_workgroup(dispatch_workloop_t workloop, os_workgroup_t workgroup)
{
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t e5rt_buffer_object_get_iosurface()
{
  return MEMORY[0x1F4118080]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x1F4118098]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x1F41181C8]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x1F41181E0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x1F41181E8]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x1F4118220]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x1F41182B0]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x1F41182D8]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x1F41182E8]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x1F4118308]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x1F4118320]();
}

uint64_t e5rt_execution_stream_set_ane_execution_priority()
{
  return MEMORY[0x1F4118328]();
}

uint64_t e5rt_execution_stream_submit_async()
{
  return MEMORY[0x1F4118340]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x1F4118350]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x1F4118360]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x1F4118370]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x1F4118398]();
}

uint64_t e5rt_io_port_retain_buffer_object()
{
  return MEMORY[0x1F41183A8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x1F41183C0]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x1F41184E8]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x1F41184F8]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x1F4118500]();
}

uint64_t e5rt_tensor_desc_create()
{
  return MEMORY[0x1F4118510]();
}

uint64_t e5rt_tensor_desc_dtype_create()
{
  return MEMORY[0x1F4118528]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_pack()
{
  return MEMORY[0x1F4118540]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x1F4118570]();
}

uint64_t e5rt_tensor_desc_get_dimension_length()
{
  return MEMORY[0x1F4118578]();
}

uint64_t e5rt_tensor_desc_get_rank()
{
  return MEMORY[0x1F4118580]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x1F4118590]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x1F41185B0]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x1F41185B8]();
}

uint64_t e5rt_tensor_utils_cast_from_fp16_to_fp32()
{
  return MEMORY[0x1F41185D0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1F41186F8]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1F4118700]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1F41187A0]();
}

uint64_t espresso_network_set_memory_pool_id()
{
  return MEMORY[0x1F41187C0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

uint64_t espresso_plan_set_execution_queue()
{
  return MEMORY[0x1F4118850]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1F4118858]();
}

uint64_t espresso_plan_share_intermediate_buffer()
{
  return MEMORY[0x1F4118860]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x1F4118878]();
}

uint64_t espresso_plan_submit_set_multiple_buffering()
{
  return MEMORY[0x1F4118880]();
}

uint64_t espresso_will_share_intermediate_buffer_with_existing_plan()
{
  return MEMORY[0x1F41188A0]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1F40DED58]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1F40DED60]();
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x1F40DED68]();
}

uint64_t fig_log_handle()
{
  return MEMORY[0x1F40DED70]();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x1F40DED80]();
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1F40CC188](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

int fnmatch(const char *a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CC1B8](a1, a2, *(void *)&a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void glActiveTexture(GLenum texture)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x1F40F43E8](*(void *)&target);
}

void glCompileShader(GLuint shader)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x1F40F4420]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x1F40F4428](*(void *)&type);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteProgram(GLuint program)
{
}

void glDeleteShader(GLuint shader)
{
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
}

void glDisable(GLenum cap)
{
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glDrawBuffers(GLsizei n, const GLenum *bufs)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

void glFinish(void)
{
}

void glFlush(void)
{
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1F40F4530](*(void *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x1F40F4540]();
}

void glGetIntegerv(GLenum pname, GLint *params)
{
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1F40F4588](*(void *)&program, name);
}

void glLinkProgram(GLuint program)
{
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
{
}

void glUniform1f(GLint location, GLfloat x)
{
}

void glUniform1i(GLint location, GLint x)
{
}

void glUniform2f(GLint location, GLfloat x, GLfloat y)
{
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniformMatrix3fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUseProgram(GLuint program)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

int heapsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1F40CC5E0](__base, __nel, __width, __compar);
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x1F40CC610](*(void *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC620](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x1F40CC628](*(void *)&host_priv, *(void *)&flavor, host_info64_out, host_info64_outCnt);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x1F40CC808](*(void *)&a2, a1);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1F40CC9E0](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE38](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE80](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
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

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1F40CD548](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1F40CD640]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_workgroup_attr_set_interval_type()
{
  return MEMORY[0x1F40CD680]();
}

uint64_t os_workgroup_interval_create()
{
  return MEMORY[0x1F40CD6C8]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1F40CD890](*(void *)&pid, *(void *)&flavor, buffer);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1F40CD8D0]();
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1F40CDAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}

kern_return_t task_generate_corpse(task_read_t task, mach_port_t *corpse_task_port)
{
  return MEMORY[0x1F40CE450](*(void *)&task, corpse_task_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1F415CCA8]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x1F415CCC8]();
}

uint64_t tcc_identity_copy_external_representation()
{
  return MEMORY[0x1F415CCE8]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_identity_create_from_external_representation()
{
  return MEMORY[0x1F415CCF8]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1F415CD08]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x1F415CD60]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x1F415CDB8]();
}

uint64_t tcc_service_get_name()
{
  return MEMORY[0x1F415CDE8]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1F415CDF8]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_convD(const double *__A, vDSP_Stride __IA, const double *__F, vDSP_Stride __IF, double *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_distancesq(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_normalizeD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, double *__Mean, double *__StandardDeviation, vDSP_Length __N)
{
}

void vDSP_vflt32D(const int *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

vImage_Error vImageMax_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x1F40D2A98](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel_height, kernel_width, *(void *)&flags);
}

vImage_Error vImageMin_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x1F40D2AB8](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel_height, kernel_width, *(void *)&flags);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1F40CE710]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA80](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1F40CEB90]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBC0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1F40CEC70]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1F40CEE18]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE50](xdict, key);
}

uint64_t xpc_dictionary_extract_mach_recv()
{
  return MEMORY[0x1F40CEE60]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_recv()
{
  return MEMORY[0x1F40CEF90]();
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1F40CEF98]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1F40CF018](connection);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}

uint64_t xpc_transaction_try_exit_clean()
{
  return MEMORY[0x1F40CF300]();
}