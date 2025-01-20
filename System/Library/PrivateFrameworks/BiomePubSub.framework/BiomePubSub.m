void sub_1AD02157C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AD021B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AD022530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BPSPipelineSupportsPullBasedPublishers(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&overrideLock);
  id v2 = (id)override;
  os_unfair_lock_unlock((os_unfair_lock_t)&overrideLock);
  if (v2)
  {
    uint64_t v3 = [v2 BOOLValue];
  }
  else
  {
    char v4 = objc_opt_respondsToSelector();
    char v5 = objc_opt_respondsToSelector();
    char v6 = objc_opt_respondsToSelector();
    char v7 = objc_opt_respondsToSelector();
    char v8 = objc_opt_respondsToSelector();
    uint64_t v3 = 0;
    if (v4 & 1) != 0 && (v5 & 1) != 0 && (v6 & 1) != 0 && (v7 & 1) != 0 && (v8)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v9 = objc_msgSend(v1, "upstreamPublishers", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            if (!BPSPipelineSupportsPullBasedPublishers(*(void *)(*((void *)&v15 + 1) + 8 * v13)))
            {
              uint64_t v3 = 0;
              goto LABEL_18;
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      uint64_t v3 = 1;
LABEL_18:
    }
  }

  return v3;
}

Class __getBMDSLSubscribeOnClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BiomeDSLLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __BiomeDSLLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5E763F0;
    uint64_t v5 = 0;
    BiomeDSLLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeDSLLibraryCore_frameworkLibrary) {
    __getBMDSLSubscribeOnClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BMDSLSubscribeOn");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLSubscribeOnClass_block_invoke_cold_2();
  }
  getBMDSLSubscribeOnClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLSubscribeOnClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BiomeDSLLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __BiomeDSLLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5E76428;
    uint64_t v5 = 0;
    BiomeDSLLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!BiomeDSLLibraryCore_frameworkLibrary_0) {
    __getBMDSLSubscribeOnClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BMDSLSubscribeOn");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLSubscribeOnClass_block_invoke_cold_2_0();
  }
  getBMDSLSubscribeOnClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AD026064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AD026A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1AD02F564(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void BPSOverridePipelineSupportsPullBasedPublishers(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&overrideLock);
  uint64_t v2 = (void *)override;
  override = (uint64_t)v1;

  os_unfair_lock_unlock((os_unfair_lock_t)&overrideLock);
}

uint64_t BPSPBApproxPercentileDigestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v15 = v9++ >= 9;
          if (v15)
          {
            unint64_t v10 = 0;
            uint64_t v16 = *v5;
            int v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(unsigned char *)(a2 + v16)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              *(unsigned char *)(a1 + 72) |= 8u;
              uint64_t v20 = *v3;
              unint64_t v21 = *(void *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v21);
                *(void *)(a2 + v20) = v21 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v60 = 68;
              goto LABEL_89;
            case 2u:
              *(unsigned char *)(a1 + 72) |= 4u;
              uint64_t v41 = *v3;
              unint64_t v42 = *(void *)(a2 + v41);
              if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v42);
                *(void *)(a2 + v41) = v42 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v60 = 64;
LABEL_89:
              *(_DWORD *)(a1 + v60) = v22;
              goto LABEL_92;
            case 3u:
              char v23 = 0;
              unsigned int v24 = 0;
              uint64_t v25 = 0;
              *(unsigned char *)(a1 + 72) |= 2u;
              while (2)
              {
                uint64_t v26 = *v3;
                uint64_t v27 = *(void *)(a2 + v26);
                unint64_t v28 = v27 + 1;
                if (v27 == -1 || v28 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
                  *(void *)(a2 + v26) = v28;
                  v25 |= (unint64_t)(v29 & 0x7F) << v23;
                  if (v29 < 0)
                  {
                    v23 += 7;
                    BOOL v15 = v24++ >= 9;
                    if (v15)
                    {
                      LODWORD(v25) = 0;
                      goto LABEL_67;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v25) = 0;
              }
LABEL_67:
              uint64_t v50 = 60;
              goto LABEL_72;
            case 4u:
              char v30 = 0;
              unsigned int v31 = 0;
              uint64_t v25 = 0;
              *(unsigned char *)(a1 + 72) |= 1u;
              while (2)
              {
                uint64_t v32 = *v3;
                uint64_t v33 = *(void *)(a2 + v32);
                unint64_t v34 = v33 + 1;
                if (v33 == -1 || v34 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
                  *(void *)(a2 + v32) = v34;
                  v25 |= (unint64_t)(v35 & 0x7F) << v30;
                  if (v35 < 0)
                  {
                    v30 += 7;
                    BOOL v15 = v31++ >= 9;
                    if (v15)
                    {
                      LODWORD(v25) = 0;
                      goto LABEL_71;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v25) = 0;
              }
LABEL_71:
              uint64_t v50 = 56;
LABEL_72:
              *(_DWORD *)(a1 + v50) = v25;
              goto LABEL_92;
            case 5u:
              if (v18 != 2)
              {
                uint64_t v51 = *v3;
                unint64_t v52 = *(void *)(a2 + v51);
                if (v52 <= 0xFFFFFFFFFFFFFFFBLL && v52 + 4 <= *(void *)(a2 + *v4)) {
                  *(void *)(a2 + v51) = v52 + 4;
                }
                else {
                  *(unsigned char *)(a2 + v16) = 1;
                }
                PBRepeatedFloatAdd();
                goto LABEL_92;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                v37 = (unint64_t *)(a2 + *v3);
                unint64_t v38 = *v37;
                unint64_t v39 = *(void *)(a2 + *v4);
                if (*v37 >= v39) {
                  break;
                }
                uint64_t v40 = *v5;
                if (*(unsigned char *)(a2 + v40)) {
                  break;
                }
                if (v38 > 0xFFFFFFFFFFFFFFFBLL || v38 + 4 > v39) {
                  *(unsigned char *)(a2 + v40) = 1;
                }
                else {
                  unint64_t *v37 = v38 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_63;
            case 6u:
              if (v18 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v43 = 0;
                  unsigned int v44 = 0;
                  uint64_t v45 = 0;
                  while (1)
                  {
                    uint64_t v46 = *v3;
                    uint64_t v47 = *(void *)(a2 + v46);
                    unint64_t v48 = v47 + 1;
                    if (v47 == -1 || v48 > *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
                    *(void *)(a2 + v46) = v48;
                    v45 |= (unint64_t)(v49 & 0x7F) << v43;
                    if (v49 < 0)
                    {
                      v43 += 7;
                      BOOL v15 = v44++ >= 9;
                      if (!v15) {
                        continue;
                      }
                    }
                    goto LABEL_62;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_62:
                  PBRepeatedUInt32Add();
                }
LABEL_63:
                PBReaderRecallMark();
              }
              else
              {
                char v53 = 0;
                unsigned int v54 = 0;
                uint64_t v55 = 0;
                while (1)
                {
                  uint64_t v56 = *v3;
                  uint64_t v57 = *(void *)(a2 + v56);
                  unint64_t v58 = v57 + 1;
                  if (v57 == -1 || v58 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
                  *(void *)(a2 + v56) = v58;
                  v55 |= (unint64_t)(v59 & 0x7F) << v53;
                  if (v59 < 0)
                  {
                    v53 += 7;
                    BOOL v15 = v54++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_84;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_84:
                PBRepeatedUInt32Add();
              }
LABEL_92:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_92;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1AD036A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AD037188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AD037C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1AD039FD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AD03DED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
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

unsigned char *OUTLINED_FUNCTION_0_3(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

uint64_t __BiomeDSLLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeDSLLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __BiomeDSLLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BiomeDSLLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t BPSDemandMax(uint64_t result)
{
  if (result < 0) {
    BPSDemandMax_cold_1();
  }
  return result;
}

void sub_1AD04CB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AD04D23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AD04DD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1AD05145C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AD055E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_1AD056010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id Subscribers.Sink.__allocating_init(receiveBookmarkCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor;
  uint64_t v10 = _Block_copy(aBlock);
  v14[4] = a3;
  v14[5] = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v14[3] = &block_descriptor_3;
  uint64_t v11 = _Block_copy(v14);
  id v12 = objc_msgSend(v9, sel_initWithReceiveBookmarkCompletion_receiveInput_, v10, v11);
  _Block_release(v10);
  _Block_release(v11);
  swift_release();
  swift_release();
  return v12;
}

void thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  v5(v6, a3);
  swift_release();
  swift_unknownObjectRelease();
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

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id Subscribers.Sink.init(receiveBookmarkCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  BOOL v15 = &block_descriptor_6;
  char v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  BOOL v15 = &block_descriptor_9;
  char v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for Subscribers.Sink();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithReceiveBookmarkCompletion_receiveInput_, v7, v8);
  swift_release();
  swift_release();
  _Block_release(v8);
  _Block_release(v7);
  return v9;
}

uint64_t type metadata accessor for Subscribers.Sink()
{
  return __swift_instantiateGenericMetadata();
}

id @objc Subscribers.Sink.init(receiveBookmarkCompletion:receiveInput:)(int a1, int a2, void *aBlock, const void *a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return Subscribers.Sink.init(receiveBookmarkCompletion:receiveInput:)((uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> ()partial apply, v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v8);
}

id Subscribers.Sink.__allocating_init(receiveCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  aBlock[3] = &block_descriptor_12;
  uint64_t v10 = _Block_copy(aBlock);
  v14[4] = a3;
  v14[5] = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v14[3] = &block_descriptor_15;
  objc_super v11 = _Block_copy(v14);
  id v12 = objc_msgSend(v9, sel_initWithReceiveCompletion_receiveInput_, v10, v11);
  _Block_release(v10);
  _Block_release(v11);
  swift_release();
  swift_release();
  return v12;
}

void thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id Subscribers.Sink.init(receiveCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  BOOL v15 = &block_descriptor_18;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  BOOL v15 = &block_descriptor_21;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for Subscribers.Sink();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithReceiveCompletion_receiveInput_, v7, v8);
  swift_release();
  swift_release();
  _Block_release(v8);
  _Block_release(v7);
  return v9;
}

id @objc Subscribers.Sink.init(receiveCompletion:receiveInput:)(int a1, int a2, void *aBlock, const void *a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return Subscribers.Sink.init(receiveCompletion:receiveInput:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v8);
}

id Subscribers.Sink.__allocating_init(receiveBookmarkedCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor_24;
  uint64_t v10 = _Block_copy(aBlock);
  v14[4] = a3;
  v14[5] = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v14[3] = &block_descriptor_27;
  objc_super v11 = _Block_copy(v14);
  id v12 = objc_msgSend(v9, sel_initWithReceiveBookmarkedCompletion_receiveInput_, v10, v11);
  _Block_release(v10);
  _Block_release(v11);
  swift_release();
  swift_release();
  return v12;
}

id Subscribers.Sink.init(receiveBookmarkedCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  BOOL v15 = &block_descriptor_30;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  BOOL v15 = &block_descriptor_33;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for Subscribers.Sink();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithReceiveBookmarkedCompletion_receiveInput_, v7, v8);
  swift_release();
  swift_release();
  _Block_release(v8);
  _Block_release(v7);
  return v9;
}

id @objc Subscribers.Sink.init(receiveBookmarkedCompletion:receiveInput:)(int a1, int a2, void *aBlock, const void *a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return Subscribers.Sink.init(receiveBookmarkedCompletion:receiveInput:)((uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> ()partial apply, v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v8);
}

id Subscribers.Sink.__deallocating_deinit()
{
  return Subscribers.Sink.__deallocating_deinit((uint64_t (*)(void, void))type metadata accessor for Subscribers.Sink);
}

id Subscribers.DrivableSink.__allocating_init(receiveBookmarkCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor_36;
  uint64_t v10 = _Block_copy(aBlock);
  v14[4] = a3;
  v14[5] = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v14[3] = &block_descriptor_39;
  objc_super v11 = _Block_copy(v14);
  id v12 = objc_msgSend(v9, sel_initWithReceiveBookmarkCompletion_shouldContinue_, v10, v11);
  _Block_release(v10);
  _Block_release(v11);
  swift_release();
  swift_release();
  return v12;
}

id Subscribers.DrivableSink.init(receiveBookmarkCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  BOOL v15 = &block_descriptor_42;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = (void (*)(uint64_t, void *, uint64_t))thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  BOOL v15 = &block_descriptor_45;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for Subscribers.DrivableSink();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithReceiveBookmarkCompletion_shouldContinue_, v7, v8);
  swift_release();
  swift_release();
  _Block_release(v8);
  _Block_release(v7);
  return v9;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool)(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t type metadata accessor for Subscribers.DrivableSink()
{
  return __swift_instantiateGenericMetadata();
}

id @objc Subscribers.DrivableSink.init(receiveBookmarkCompletion:shouldContinue:)(int a1, int a2, void *aBlock, const void *a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return Subscribers.DrivableSink.init(receiveBookmarkCompletion:shouldContinue:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> (), v7, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool)partial apply, v8);
}

id Subscribers.DrivableSink.__allocating_init(receiveCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  aBlock[3] = &block_descriptor_48;
  uint64_t v10 = _Block_copy(aBlock);
  v14[4] = a3;
  v14[5] = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v14[3] = &block_descriptor_51;
  objc_super v11 = _Block_copy(v14);
  id v12 = objc_msgSend(v9, sel_initWithReceiveCompletion_shouldContinue_, v10, v11);
  _Block_release(v10);
  _Block_release(v11);
  swift_release();
  swift_release();
  return v12;
}

id Subscribers.DrivableSink.init(receiveCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  BOOL v15 = &block_descriptor_54;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = (void (*)(uint64_t, void *))thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  BOOL v15 = &block_descriptor_57;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for Subscribers.DrivableSink();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithReceiveCompletion_shouldContinue_, v7, v8);
  swift_release();
  swift_release();
  _Block_release(v8);
  _Block_release(v7);
  return v9;
}

id @objc Subscribers.DrivableSink.init(receiveCompletion:shouldContinue:)(int a1, int a2, void *aBlock, const void *a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return Subscribers.DrivableSink.init(receiveCompletion:shouldContinue:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion) -> (), v7, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool)partial apply, v8);
}

id Subscribers.DrivableSink.__allocating_init(receiveBookmarkedCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor_60;
  uint64_t v10 = _Block_copy(aBlock);
  v14[4] = a3;
  v14[5] = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v14[3] = &block_descriptor_63;
  objc_super v11 = _Block_copy(v14);
  id v12 = objc_msgSend(v9, sel_initWithReceiveBookmarkedCompletion_shouldContinue_, v10, v11);
  _Block_release(v10);
  _Block_release(v11);
  swift_release();
  swift_release();
  return v12;
}

id Subscribers.DrivableSink.init(receiveBookmarkedCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  BOOL v15 = &block_descriptor_66;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 1107296256;
  char v14 = (void (*)(uint64_t, void *, uint64_t))thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  BOOL v15 = &block_descriptor_69;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for Subscribers.DrivableSink();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithReceiveBookmarkedCompletion_shouldContinue_, v7, v8);
  swift_release();
  swift_release();
  _Block_release(v8);
  _Block_release(v7);
  return v9;
}

id @objc Subscribers.DrivableSink.init(receiveBookmarkedCompletion:shouldContinue:)(int a1, int a2, void *aBlock, const void *a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return Subscribers.DrivableSink.init(receiveBookmarkedCompletion:shouldContinue:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> (), v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool), v8);
}

id Subscribers.DrivableSink.__deallocating_deinit()
{
  return Subscribers.Sink.__deallocating_deinit((uint64_t (*)(void, void))type metadata accessor for Subscribers.DrivableSink);
}

id Subscribers.Sink.__deallocating_deinit(uint64_t (*a1)(void, void))
{
  uint64_t v2 = (objc_class *)a1(0, *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x50));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id PublisherProtocol.sink(completion:receiveInput:)(uint64_t (*a1)(), void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v24 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 24);
  id v12 = (void *)v24(a5, a6);
  int v13 = BPSPipelineSupportsPullBasedPublishers(v12);
  swift_unknownObjectRelease();
  char v14 = (void *)swift_allocObject();
  if (v13)
  {
    v14[2] = a1;
    v14[3] = a2;
    BOOL v15 = (void *)swift_allocObject();
    v15[2] = a5;
    v15[3] = a6;
    v15[4] = a3;
    v15[5] = a4;
    swift_getAssociatedTypeWitness();
    id v16 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink());
    char v35 = partial apply for closure #1 in PublisherProtocol.sink(completion:receiveInput:);
    v36 = v14;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v32 = 1107296256;
    uint64_t v33 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    unint64_t v34 = &block_descriptor_84;
    uint64_t v17 = _Block_copy(&aBlock);
    char v29 = partial apply for closure #2 in PublisherProtocol.sink(completion:receiveInput:);
    char v30 = v15;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 1107296256;
    uint64_t v27 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    unint64_t v28 = &block_descriptor_87;
    int v18 = _Block_copy(&v25);
    swift_retain();
    swift_retain();
    id v19 = objc_msgSend(v16, sel_initWithReceiveBookmarkCompletion_receiveInput_, v17, v18);
    _Block_release(v17);
    _Block_release(v18);
    swift_release();
    swift_release();
    objc_msgSend(v19, sel_subscribeTo_, v24(a5, a6));
  }
  else
  {
    v14[2] = a5;
    v14[3] = a6;
    v14[4] = a3;
    v14[5] = a4;
    swift_getAssociatedTypeWitness();
    id v20 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink());
    char v35 = a1;
    v36 = a2;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v32 = 1107296256;
    uint64_t v33 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    unint64_t v34 = &block_descriptor_72;
    unint64_t v21 = _Block_copy(&aBlock);
    char v29 = (uint64_t (*)(uint64_t))partial apply for closure #3 in PublisherProtocol.sink(completion:receiveInput:);
    char v30 = v14;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 1107296256;
    uint64_t v27 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    unint64_t v28 = &block_descriptor_75;
    int v22 = _Block_copy(&v25);
    swift_retain();
    swift_retain();
    id v19 = objc_msgSend(v20, sel_initWithReceiveCompletion_receiveInput_, v21, v22);
    _Block_release(v21);
    _Block_release(v22);
    swift_release();
    swift_release();
    objc_msgSend((id)v24(a5, a6), sel_subscribe_, v19);
  }
  swift_unknownObjectRelease();
  return v19;
}

uint64_t sub_1AD0581D0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t partial apply for closure #1 in PublisherProtocol.sink(completion:receiveInput:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t partial apply for closure #2 in PublisherProtocol.sink(completion:receiveInput:)(uint64_t a1)
{
  return closure #2 in PublisherProtocol.sink(completion:receiveInput:)(a1, *(void (**)())(v1 + 32));
}

id PublisherProtocol.sink(completion:shouldContinue:)(uint64_t (*a1)(), void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v24 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 24);
  id v12 = (void *)v24(a5, a6);
  int v13 = BPSPipelineSupportsPullBasedPublishers(v12);
  swift_unknownObjectRelease();
  char v14 = (void *)swift_allocObject();
  if (v13)
  {
    v14[2] = a1;
    v14[3] = a2;
    BOOL v15 = (void *)swift_allocObject();
    v15[2] = a5;
    v15[3] = a6;
    v15[4] = a3;
    v15[5] = a4;
    swift_getAssociatedTypeWitness();
    id v16 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink());
    char v35 = partial apply for closure #1 in PublisherProtocol.sink(completion:receiveInput:);
    v36 = v14;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v32 = 1107296256;
    uint64_t v33 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    unint64_t v34 = &block_descriptor_105;
    uint64_t v17 = _Block_copy(&aBlock);
    char v29 = partial apply for closure #2 in PublisherProtocol.sink(completion:shouldContinue:);
    char v30 = v15;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 1107296256;
    uint64_t v27 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    unint64_t v28 = &block_descriptor_108;
    int v18 = _Block_copy(&v25);
    swift_retain();
    swift_retain();
    id v19 = objc_msgSend(v16, sel_initWithReceiveCompletion_shouldContinue_, v17, v18);
    _Block_release(v17);
    _Block_release(v18);
    swift_release();
    swift_release();
    objc_msgSend(v19, sel_subscribeTo_, v24(a5, a6));
  }
  else
  {
    v14[2] = a5;
    v14[3] = a6;
    v14[4] = a3;
    v14[5] = a4;
    swift_getAssociatedTypeWitness();
    id v20 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink());
    char v35 = a1;
    v36 = a2;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v32 = 1107296256;
    uint64_t v33 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    unint64_t v34 = &block_descriptor_93;
    unint64_t v21 = _Block_copy(&aBlock);
    char v29 = (uint64_t (*)(uint64_t))partial apply for closure #3 in PublisherProtocol.sink(completion:shouldContinue:);
    char v30 = v14;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 1107296256;
    uint64_t v27 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    unint64_t v28 = &block_descriptor_96;
    int v22 = _Block_copy(&v25);
    swift_retain();
    swift_retain();
    id v19 = objc_msgSend(v20, sel_initWithReceiveCompletion_shouldContinue_, v21, v22);
    _Block_release(v21);
    _Block_release(v22);
    swift_release();
    swift_release();
    objc_msgSend((id)v24(a5, a6), sel_subscribe_, v19);
  }
  swift_unknownObjectRelease();
  return v19;
}

uint64_t partial apply for closure #2 in PublisherProtocol.sink(completion:shouldContinue:)(uint64_t a1)
{
  return closure #2 in PublisherProtocol.sink(completion:shouldContinue:)(a1, *(uint64_t (**)())(v1 + 32)) & 1;
}

id PublisherProtocol<>.sink(with:completion:receiveInput:)(uint64_t a1, uint64_t (*a2)(uint64_t a1, void *a2), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v30 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 24);
  int v13 = (void *)v30(a6, a7);
  int v14 = BPSPipelineSupportsPullBasedPublishers(v13);
  swift_unknownObjectRelease();
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a2;
    *(void *)(v15 + 24) = a3;
    id v16 = (void *)swift_allocObject();
    v16[2] = a6;
    v16[3] = a7;
    v16[4] = a4;
    v16[5] = a5;
    swift_getAssociatedTypeWitness();
    id v17 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink());
    unint64_t v42 = partial apply for closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:);
    uint64_t v43 = v15;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v39 = 1107296256;
    uint64_t v40 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    uint64_t v41 = &block_descriptor_126;
    int v18 = _Block_copy(&aBlock);
    v36 = partial apply for closure #3 in PublisherProtocol.sink(completion:receiveInput:);
    v37 = v16;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 1107296256;
    unint64_t v34 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    char v35 = &block_descriptor_129;
    id v19 = _Block_copy(&v32);
    swift_retain();
    swift_retain();
    id v20 = objc_msgSend(v17, sel_initWithReceiveBookmarkCompletion_receiveInput_, v18, v19);
    _Block_release(v18);
    _Block_release(v19);
    swift_release();
    swift_release();
    v30(a6, a7);
    self;
    uint64_t v21 = swift_dynamicCastObjCClass();
    if (v21)
    {
      if (a1)
      {
        int v22 = (void *)v21;
        self;
        uint64_t v23 = swift_dynamicCastObjCClass();
        if (v23) {
          objc_msgSend(v22, sel_applyBookmarkNode_, v23);
        }
      }
    }
    swift_unknownObjectRelease();
    objc_msgSend(v20, sel_subscribeTo_, v30(a6, a7));
    swift_unknownObjectRelease();
  }
  else
  {
    unsigned int v24 = (void *)swift_allocObject();
    v24[2] = a6;
    v24[3] = a7;
    v24[4] = a4;
    v24[5] = a5;
    swift_getAssociatedTypeWitness();
    id v25 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink());
    unint64_t v42 = a2;
    uint64_t v43 = a3;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v39 = 1107296256;
    uint64_t v40 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    uint64_t v41 = &block_descriptor_114;
    uint64_t v26 = _Block_copy(&aBlock);
    v36 = partial apply for closure #3 in PublisherProtocol.sink(completion:receiveInput:);
    v37 = v24;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 1107296256;
    unint64_t v34 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    char v35 = &block_descriptor_117;
    uint64_t v27 = _Block_copy(&v32);
    swift_retain();
    swift_retain();
    id v20 = objc_msgSend(v25, sel_initWithReceiveBookmarkedCompletion_receiveInput_, v26, v27);
    _Block_release(v26);
    _Block_release(v27);
    swift_release();
    swift_release();
    id v28 = objc_msgSend((id)v30(a6, a7), sel_withBookmark_, a1);
    swift_unknownObjectRelease();
    objc_msgSend(v28, sel_subscribe_, v20);
  }
  return v20;
}

uint64_t closure #2 in PublisherProtocol.sink(completion:receiveInput:)(uint64_t a1, void (*a2)())
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1AD058B64()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:)(uint64_t a1, void *a2)
{
  return closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:)(a1, a2, *(void (**)(uint64_t, id))(v2 + 16));
}

id PublisherProtocol<>.sink(with:completion:shouldContinue:)(uint64_t a1, uint64_t (*a2)(), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v30 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 24);
  int v13 = (void *)v30(a6, a7);
  int v14 = BPSPipelineSupportsPullBasedPublishers(v13);
  swift_unknownObjectRelease();
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a2;
    *(void *)(v15 + 24) = a3;
    id v16 = (void *)swift_allocObject();
    v16[2] = a6;
    v16[3] = a7;
    v16[4] = a4;
    v16[5] = a5;
    swift_getAssociatedTypeWitness();
    id v17 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink());
    unint64_t v42 = partial apply for closure #1 in PublisherProtocol<>.sink(with:completion:shouldContinue:);
    uint64_t v43 = v15;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v39 = 1107296256;
    uint64_t v40 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    uint64_t v41 = &block_descriptor_147;
    int v18 = _Block_copy(&aBlock);
    v36 = partial apply for closure #3 in PublisherProtocol.sink(completion:shouldContinue:);
    v37 = v16;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 1107296256;
    unint64_t v34 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    char v35 = &block_descriptor_150;
    id v19 = _Block_copy(&v32);
    swift_retain();
    swift_retain();
    id v20 = objc_msgSend(v17, sel_initWithReceiveBookmarkCompletion_shouldContinue_, v18, v19);
    _Block_release(v18);
    _Block_release(v19);
    swift_release();
    swift_release();
    v30(a6, a7);
    self;
    uint64_t v21 = swift_dynamicCastObjCClass();
    if (v21)
    {
      if (a1)
      {
        int v22 = (void *)v21;
        self;
        uint64_t v23 = swift_dynamicCastObjCClass();
        if (v23) {
          objc_msgSend(v22, sel_applyBookmarkNode_, v23);
        }
      }
    }
    swift_unknownObjectRelease();
    objc_msgSend(v20, sel_subscribeTo_, v30(a6, a7));
    swift_unknownObjectRelease();
  }
  else
  {
    unsigned int v24 = (void *)swift_allocObject();
    v24[2] = a6;
    v24[3] = a7;
    v24[4] = a4;
    v24[5] = a5;
    swift_getAssociatedTypeWitness();
    id v25 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink());
    unint64_t v42 = a2;
    uint64_t v43 = a3;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v39 = 1107296256;
    uint64_t v40 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    uint64_t v41 = &block_descriptor_135;
    uint64_t v26 = _Block_copy(&aBlock);
    v36 = partial apply for closure #3 in PublisherProtocol.sink(completion:shouldContinue:);
    v37 = v24;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 1107296256;
    unint64_t v34 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    char v35 = &block_descriptor_138;
    uint64_t v27 = _Block_copy(&v32);
    swift_retain();
    swift_retain();
    id v20 = objc_msgSend(v25, sel_initWithReceiveBookmarkedCompletion_shouldContinue_, v26, v27);
    _Block_release(v26);
    _Block_release(v27);
    swift_release();
    swift_release();
    id v28 = objc_msgSend((id)v30(a6, a7), sel_withBookmark_, a1);
    swift_unknownObjectRelease();
    objc_msgSend(v28, sel_subscribe_, v20);
  }
  return v20;
}

uint64_t closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:)(uint64_t a1, void *a2, void (*a3)(uint64_t, id))
{
  if (a2)
  {
    id v5 = a2;
  }
  else
  {
    id v6 = objc_allocWithZone((Class)BMBookmarkNode);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BMBookmark);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    id v5 = objc_msgSend(v6, sel_initWithValue_upstreams_name_, 0, isa, 0);
  }
  swift_unknownObjectRetain();
  a3(a1, v5);
  return swift_unknownObjectRelease();
}

uint64_t closure #2 in PublisherProtocol.sink(completion:shouldContinue:)(uint64_t a1, uint64_t (*a2)())
{
  LOBYTE(a2) = a2();
  swift_unknownObjectRelease();
  return a2 & 1;
}

ValueMetadata *type metadata accessor for Subscribers()
{
  return &type metadata for Subscribers;
}

uint64_t type metadata instantiation function for Subscribers.Sink()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t type metadata completion function for Subscribers.Sink()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for NSComparisonResult()
{
  if (!lazy cache variable for type metadata for NSComparisonResult)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSComparisonResult);
    }
  }
}

uint64_t sub_1AD059250()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> ()()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool)()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion) -> ()()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t (*Publishers.Collect.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Filter.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.FlatMap.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Last.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Map.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.Map.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.Merge.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.Merge.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.MergeMany.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.OrderedMerge.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Reduce.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Scan.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Sequence.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Multicast.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Correlate.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.Correlate.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.CombineLatest.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.CombineLatest.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.Debounce.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Future.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

id Publishers.HandleEvents.inner.getter()
{
  uint64_t v0 = (void *)specialized Publishers.HandleEvents.inner.getter();
  return v0;
}

void Publishers.HandleEvents.inner.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*Publishers.HandleEvents.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.HandleEvents.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id protocol witness for PublisherProtocol.inner.getter in conformance Publishers.HandleEvents<A>()
{
  uint64_t v0 = (void *)specialized Publishers.HandleEvents.inner.getter();
  return v0;
}

uint64_t (*Publishers.RemoveDuplicates.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Throttle.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Timer.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Zip.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.ZipMany.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Buffer.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t specialized Publishers.HandleEvents.inner.getter()
{
  return *(void *)v0;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Collect<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Filter<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.FlatMap<A, B>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Last<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Map<A, B>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Merge<A, B, C>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.MergeMany<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.OrderedMerge<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Reduce<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Scan<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Sequence<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Multicast<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Correlate<A, B, C, D>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.CombineLatest<A, B>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Debounce<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Future<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.HandleEvents<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.RemoveDuplicates<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Throttle<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Timer<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Zip<A, B>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.ZipMany<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Buffer<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

ValueMetadata *type metadata accessor for Publishers()
{
  return &type metadata for Publishers;
}

uint64_t type metadata instantiation function for Publishers.Collect(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for Publishers.Collect()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Filter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for Publishers.FlatMap()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Last()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Map()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for Publishers.Merge(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 48);
}

uint64_t type metadata accessor for Publishers.Merge()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for Publishers.MergeMany()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.OrderedMerge()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Reduce()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Scan()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Sequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Multicast()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for Publishers.Correlate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t type metadata accessor for Publishers.Correlate()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for Publishers.CombineLatest()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Debounce()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Future()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.HandleEvents()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.RemoveDuplicates()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Throttle()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Timer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Zip()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for Publishers.ZipMany()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Publishers.Buffer()
{
  return __swift_instantiateGenericMetadata();
}

id Publisher.inner.getter()
{
  uint64_t v0 = (void *)specialized Publishers.HandleEvents.inner.getter();
  return v0;
}

void Publisher.inner.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*Publisher.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publisher.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publisher<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of PublisherProtocol.inner.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PublisherProtocol.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t type metadata accessor for Publisher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PublisherProtocol.merge<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E5E75C88, a5);
}

uint64_t PublisherProtocol.mergeAny<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E5E75C88, a5);
}

void PublisherProtocol.merge<A>(with:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  uint64_t v41 = a4;
  uint64_t v10 = *(void *)(a2 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  int v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  id v16 = (char *)&v30 - v15;
  uint64_t v42 = v14;
  uint64_t v18 = MEMORY[0x1AD11D510](v14, v17);
  uint64_t v35 = a1;
  if (!v18)
  {
LABEL_15:
    id v26 = objc_allocWithZone(MEMORY[0x1E4F1CA48]);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(v26, sel_initWithArray_, isa);

    objc_msgSend(v28, sel_addObject_, (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(v35, a3));
    swift_unknownObjectRelease();
    id v29 = objc_msgSend(objc_allocWithZone((Class)BPSMergeMany), sel_initWithPublishers_, v28);

    *a5 = v29;
    return;
  }
  uint64_t v19 = v18;
  uint64_t v45 = MEMORY[0x1E4FBC860];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v18 & ~(v18 >> 63), 0);
  if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v32 = v5;
    uint64_t v33 = a3;
    unint64_t v34 = a5;
    uint64_t v20 = 0;
    unint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t))(v41 + 24);
    uint64_t v39 = v41 + 24;
    unint64_t v36 = v42 & 0xC000000000000001;
    v37 = (void (**)(char *, long long *, uint64_t))(v10 + 16);
    uint64_t v40 = v19;
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v36)
      {
        uint64_t v25 = _ArrayBuffer._getElementSlowPath(_:)();
        if (v31 != 8) {
          goto LABEL_17;
        }
        *(void *)&long long v43 = v25;
        (*v37)(v16, &v43, a2);
        swift_unknownObjectRelease();
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v16, v42+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v20, a2);
      }
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v16, a2);
      uint64_t v21 = v38(a2, v41);
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      *(void *)&long long v43 = v21;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a2);
      uint64_t v22 = v45;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v22 + 16) + 1, 1);
        uint64_t v22 = v45;
      }
      unint64_t v24 = *(void *)(v22 + 16);
      unint64_t v23 = *(void *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v23 > 1), v24 + 1, 1);
        uint64_t v22 = v45;
      }
      ++v20;
      *(void *)(v22 + 16) = v24 + 1;
      outlined init with take of Any(&v43, (_OWORD *)(v22 + 32 * v24 + 32));
    }
    while (v40 != v20);
    a3 = v33;
    a5 = v34;
    goto LABEL_15;
  }
  __break(1u);
LABEL_17:
  __break(1u);
}

void PublisherProtocol.mergeAny<A>(with:)(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  specialized _arrayForceCast<A, B>(_:)(a1, a2);
  id v4 = objc_allocWithZone(MEMORY[0x1E4F1CA48]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithArray_, isa);

  objc_msgSend(v6, sel_addObject_, _bridgeAnythingToObjectiveC<A>(_:)());
  swift_unknownObjectRelease();
  id v7 = objc_msgSend(objc_allocWithZone((Class)BPSMergeMany), sel_initWithPublishers_, v6);

  *a3 = v7;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  uint64_t v30 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v22 - v8;
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v22 - v10;
  _swift_isClassOrObjCExistentialType();
  if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && (v3 < 0 || (v3 & 0x4000000000000000) != 0)) {
    goto LABEL_23;
  }
  char isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  uint64_t v13 = v3 & 0xFFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0) {
    uint64_t v13 = v3;
  }
  uint64_t v14 = *(void *)(v13 + 16);
  while (1)
  {
    uint64_t v15 = MEMORY[0x1E4FBC860];
    if (!v14) {
      return v15;
    }
    uint64_t v32 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14 & ~(v14 >> 63), 0);
    if ((v14 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_23:
    swift_unknownObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v16 = 0;
  uint64_t v23 = v5;
  unint64_t v24 = v3 & 0xC000000000000001;
  uint64_t v25 = (void (**)(char *, unint64_t, uint64_t))(v4 + 16);
  unint64_t v27 = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v26 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v28 = v14;
  uint64_t v29 = v3;
  while ((_swift_isClassOrObjCExistentialType() & 1) == 0 || !v24)
  {
    unint64_t v17 = v3
        + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
        + *(void *)(v4 + 72) * v16;
    uint64_t v18 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    v18(v11, v17, a2);
LABEL_13:
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v11, a2);
    v18(v30, (unint64_t)v9, a2);
    swift_dynamicCast();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, a2);
    uint64_t v15 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v15 + 16) + 1, 1);
      uint64_t v15 = v32;
    }
    unint64_t v20 = *(void *)(v15 + 16);
    unint64_t v19 = *(void *)(v15 + 24);
    if (v20 >= v19 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v20 + 1, 1);
      uint64_t v15 = v32;
    }
    ++v16;
    *(void *)(v15 + 16) = v20 + 1;
    outlined init with take of Any(v31, (_OWORD *)(v15 + 32 * v20 + 32));
    uint64_t v3 = v29;
    if (v28 == v16) {
      return v15;
    }
  }
  uint64_t result = _ArrayBuffer._getElementSlowPath(_:)();
  if (v23 == 8)
  {
    *(void *)&v31[0] = result;
    uint64_t v18 = *v25;
    (*v25)(v11, (unint64_t)v31, a2);
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t PublisherProtocol.combineLatest<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E5E75C00, a5);
}

uint64_t PublisherProtocol.scan<A>(_:nextPartialResult:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  return PublisherProtocol.scan<A>(_:nextPartialResult:)(a1, a2, a3, a4, a5, a6, (Class *)off_1E5E75CE8, a7, (uint64_t)partial apply for closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:), (uint64_t)&block_descriptor_0);
}

uint64_t PublisherProtocol.reduce<A>(_:nextPartialResult:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  return PublisherProtocol.scan<A>(_:nextPartialResult:)(a1, a2, a3, a4, a5, a6, (Class *)off_1E5E75CD0, a7, (uint64_t)partial apply for closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:), (uint64_t)&block_descriptor_6_0);
}

uint64_t PublisherProtocol.scan<A>(_:nextPartialResult:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, Class *a7@<X7>, void *a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
  unint64_t v17 = (void *)swift_allocObject();
  v17[2] = a4;
  v17[3] = a5;
  v17[4] = a6;
  v17[5] = a2;
  v17[6] = a3;
  id v18 = objc_allocWithZone(*a7);
  aBlock[4] = a9;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed A, @in_guaranteed Any) -> (@owned A);
  aBlock[3] = a10;
  unint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  id v20 = objc_msgSend(v18, sel_initWithUpstream_initialResult_nextPartialResult_, v16, a1, v19);
  swift_unknownObjectRelease();
  _Block_release(v19);
  uint64_t result = swift_release();
  *a8 = v20;
  return result;
}

uint64_t closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  outlined init with copy of Any(a2, (uint64_t)v7);
  swift_getAssociatedTypeWitness();
  swift_dynamicCast();
  uint64_t v5 = a3(a1);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t PublisherProtocol.map<A>(transform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, void *a5@<X8>)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  id v9 = objc_allocWithZone((Class)BPSMap);
  v13[4] = a1;
  v13[5] = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B);
  v13[3] = &block_descriptor_9_0;
  uint64_t v10 = _Block_copy(v13);
  swift_retain();
  id v11 = objc_msgSend(v9, sel_initWithUpstream_transform_, v8, v10);
  swift_unknownObjectRelease();
  _Block_release(v10);
  uint64_t result = swift_release();
  *a5 = v11;
  return result;
}

uint64_t PublisherProtocol.last()@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  return PublisherProtocol.last()(a1, (Class *)off_1E5E75C78, a2);
}

uint64_t PublisherProtocol.filter(isIncluded:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  id v9 = objc_allocWithZone((Class)BPSFilter);
  v13[4] = a1;
  v13[5] = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v13[3] = &block_descriptor_12_0;
  uint64_t v10 = _Block_copy(v13);
  swift_retain();
  id v11 = objc_msgSend(v9, sel_initWithUpstream_isIncluded_, v8, v10);
  swift_unknownObjectRelease();
  _Block_release(v10);
  uint64_t result = swift_release();
  *a5 = v11;
  return result;
}

uint64_t PublisherProtocol.flatMap<A, B>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a3, a6);
  uint64_t v16 = BPSDemandMax(1);
  unint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = a7;
  v17[7] = a1;
  v17[8] = a2;
  id v18 = objc_allocWithZone((Class)BPSFlatMap);
  aBlock[4] = partial apply for closure #1 in PublisherProtocol.flatMap<A, B>(_:);
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B);
  aBlock[3] = &block_descriptor_18_0;
  unint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  id v20 = objc_msgSend(v18, sel_initWithUpstream_maxPublishers_transform_, v15, v16, v19);
  swift_unknownObjectRelease();
  _Block_release(v19);
  uint64_t result = swift_release();
  *a8 = v20;
  return result;
}

uint64_t closure #1 in PublisherProtocol.flatMap<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a6 - 8);
  uint64_t v11 = MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14(v11);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 24))(a6, a8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a6);
  return v15;
}

uint64_t PublisherProtocol.orderedMerge<A>(with:comparator:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, void *a7@<X8>)
{
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = a1;
  v16[7] = a2;
  id v17 = objc_allocWithZone((Class)BPSOrderedMerge);
  v21[4] = partial apply for closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:);
  v21[5] = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 1107296256;
  v21[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
  v21[3] = &block_descriptor_24_0;
  id v18 = _Block_copy(v21);
  swift_retain();
  id v19 = objc_msgSend(v17, sel_initWithA_b_comparator_, v14, v15, v18);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release(v18);
  uint64_t result = swift_release();
  *a7 = v19;
  return result;
}

uint64_t PublisherProtocol.orderedMergeAny<A>(with:comparator:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, void *a7@<X8>)
{
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  id v15 = objc_allocWithZone((Class)BPSOrderedMerge);
  v19[4] = partial apply for closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:);
  v19[5] = v14;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  v19[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
  v19[3] = &block_descriptor_30_0;
  uint64_t v16 = _Block_copy(v19);
  swift_retain();
  id v17 = objc_msgSend(v15, sel_initWithA_b_comparator_, v12, v13, v16);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release(v16);
  uint64_t result = swift_release();
  *a7 = v17;
  return result;
}

uint64_t PublisherProtocol.orderedMergeManyAny<A>(with:comparator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v42 = a4;
  uint64_t v50 = a7;
  uint64_t v13 = *(void *)(a5 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](a1);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  unint64_t v48 = (char *)&v38 - v18;
  uint64_t v49 = v17;
  uint64_t v20 = MEMORY[0x1AD11D510](v17, v19);
  uint64_t v43 = a6;
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v56 = MEMORY[0x1E4FBC860];
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v20 & ~(v20 >> 63), 0);
    if (v21 < 0)
    {
      __break(1u);
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    uint64_t v39 = a2;
    uint64_t v40 = a3;
    uint64_t v41 = a8;
    uint64_t v23 = 0;
    uint64_t v46 = *(uint64_t (**)(uint64_t, uint64_t))(v50 + 24);
    uint64_t v47 = v50 + 24;
    unint64_t v44 = v49 & 0xC000000000000001;
    uint64_t v45 = (void (**)(char *, long long *, uint64_t))(v13 + 16);
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v44)
      {
        uint64_t result = _ArrayBuffer._getElementSlowPath(_:)();
        if (v38 != 8) {
          goto LABEL_18;
        }
        *(void *)&long long aBlock = result;
        unint64_t v24 = v48;
        (*v45)(v48, &aBlock, a5);
        swift_unknownObjectRelease();
      }
      else
      {
        unint64_t v24 = v48;
        (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v48, v49+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v23, a5);
      }
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v24, a5);
      uint64_t v25 = v46(a5, v50);
      uint64_t AssociatedTypeWitness = (void *)swift_getAssociatedTypeWitness();
      *(void *)&long long aBlock = v25;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, a5);
      uint64_t v26 = v56;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v26 + 16) + 1, 1);
        uint64_t v26 = v56;
      }
      unint64_t v28 = *(void *)(v26 + 16);
      unint64_t v27 = *(void *)(v26 + 24);
      if (v28 >= v27 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v27 > 1), v28 + 1, 1);
        uint64_t v26 = v56;
      }
      ++v23;
      *(void *)(v26 + 16) = v28 + 1;
      outlined init with take of Any(&aBlock, (_OWORD *)(v26 + 32 * v28 + 32));
    }
    while (v21 != v23);
    a3 = v40;
    a8 = v41;
    a2 = v39;
  }
  id v29 = objc_allocWithZone(MEMORY[0x1E4F1CA48]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v29, sel_initWithArray_, isa);

  objc_msgSend(v31, sel_addObject_, (*(uint64_t (**)(uint64_t))(v43 + 24))(v42));
  swift_unknownObjectRelease();
  *(void *)&long long aBlock = 0;
  id v32 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BPSPublisher);
  uint64_t result = static Array._forceBridgeFromObjectiveC(_:result:)();
  if ((void)aBlock)
  {

    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = a2;
    *(void *)(v33 + 24) = a3;
    id v34 = objc_allocWithZone((Class)BPSOrderedMerge);
    swift_retain();
    Class v35 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    unsigned int v54 = partial apply for closure #2 in PublisherProtocol.orderedMergeManyAny<A>(with:comparator:);
    uint64_t v55 = v33;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    unint64_t v52 = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
    uint64_t AssociatedTypeWitness = &block_descriptor_36_0;
    unint64_t v36 = _Block_copy(&aBlock);
    id v37 = objc_msgSend(v34, sel_initWithPublishers_comparator_, v35, v36);

    _Block_release(v36);
    uint64_t result = swift_release();
    *a8 = v37;
    return result;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t PublisherProtocol.orderedMerge<A>(withOthers:comparator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v46 = a7;
  uint64_t v15 = *(void *)(a5 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](a1);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v33 - v20;
  uint64_t v44 = v19;
  uint64_t v23 = MEMORY[0x1AD11D510](v19, v22);
  uint64_t v24 = MEMORY[0x1E4FBC860];
  if (!v23)
  {
LABEL_11:
    uint64_t v48 = v24;
    (*(void (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
    MEMORY[0x1AD11D4A0]();
    if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    unint64_t v27 = (void *)swift_allocObject();
    v27[2] = a4;
    v27[3] = a5;
    uint64_t v28 = v46;
    v27[4] = a6;
    v27[5] = v28;
    v27[6] = a2;
    v27[7] = a3;
    id v29 = objc_allocWithZone((Class)BPSOrderedMerge);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BPSPublisher);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    aBlock[4] = partial apply for closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:);
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
    aBlock[3] = &block_descriptor_42_0;
    id v31 = _Block_copy(aBlock);
    id v32 = objc_msgSend(v29, sel_initWithPublishers_comparator_, isa, v31);

    _Block_release(v31);
    uint64_t result = swift_release();
    *a8 = v32;
    return result;
  }
  uint64_t v39 = v8;
  aBlock[0] = MEMORY[0x1E4FBC860];
  uint64_t v45 = v23;
  uint64_t result = specialized ContiguousArray.reserveCapacity(_:)();
  if ((v45 & 0x8000000000000000) == 0)
  {
    uint64_t v34 = a4;
    uint64_t v35 = a2;
    uint64_t v36 = a6;
    uint64_t v37 = a3;
    uint64_t v38 = a8;
    uint64_t v26 = 0;
    uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v46 + 24);
    uint64_t v43 = v46 + 24;
    unint64_t v40 = v44 & 0xC000000000000001;
    uint64_t v41 = (void (**)(char *, uint64_t *, uint64_t))(v15 + 16);
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v40)
      {
        uint64_t result = _ArrayBuffer._getElementSlowPath(_:)();
        if (v33 != 8) {
          goto LABEL_15;
        }
        uint64_t v48 = result;
        (*v41)(v21, &v48, a5);
        swift_unknownObjectRelease();
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v21, v44+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v26, a5);
      }
      ++v26;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v21, a5);
      v42(a5, v46);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, a5);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v45 != v26);
    uint64_t v24 = aBlock[0];
    a3 = v37;
    a8 = v38;
    a2 = v35;
    a6 = v36;
    a4 = v34;
    goto LABEL_11;
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  outlined init with copy of Any(a1, (uint64_t)v10);
  swift_getAssociatedTypeWitness();
  swift_dynamicCast();
  uint64_t v5 = v9;
  outlined init with copy of Any(a2, (uint64_t)v8);
  swift_dynamicCast();
  uint64_t v6 = a3(v5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v6;
}

uint64_t PublisherProtocol.collect()@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  return PublisherProtocol.last()(a1, (Class *)off_1E5E75BF8, a2);
}

uint64_t PublisherProtocol.last()@<X0>(uint64_t a1@<X1>, Class *a2@<X2>, void *a3@<X8>)
{
  id v4 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithUpstream_, (*(uint64_t (**)(void))(a1 + 24))());
  uint64_t result = swift_unknownObjectRelease();
  *a3 = v4;
  return result;
}

uint64_t PublisherProtocol.debounce(for:getTimestamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>, double a6@<D0>)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  id v11 = objc_allocWithZone((Class)BPSDebounce);
  v15[4] = a1;
  v15[5] = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out Date);
  v15[3] = &block_descriptor_45_0;
  uint64_t v12 = _Block_copy(v15);
  swift_retain();
  id v13 = objc_msgSend(v11, sel_initWithUpstream_for_getTimestamp_, v10, v12, a6);
  swift_unknownObjectRelease();
  _Block_release(v12);
  uint64_t result = swift_release();
  *a5 = v13;
  return result;
}

uint64_t PublisherProtocol.throttle(for:latest:getTimestamp:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>, double a7@<D0>)
{
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  id v13 = objc_allocWithZone((Class)BPSThrottle);
  v17[4] = a2;
  v17[5] = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out Date);
  v17[3] = &block_descriptor_48_0;
  uint64_t v14 = _Block_copy(v17);
  swift_retain();
  id v15 = objc_msgSend(v13, sel_initWithUpstream_interval_latest_getTimestamp_, v12, a1 & 1, v14, a7);
  swift_unknownObjectRelease();
  _Block_release(v14);
  uint64_t result = swift_release();
  *a6 = v15;
  return result;
}

uint64_t PublisherProtocol.zip<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E5E75D68, a5);
}

uint64_t PublisherProtocol.merge<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, Class *a5@<X5>, void *a6@<X8>)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a1, a3);
  id v11 = objc_msgSend(objc_allocWithZone(*a5), sel_initWithA_b_, v10, (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a2, a4));
  swift_unknownObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  *a6 = v11;
  return result;
}

void PublisherProtocol.zip<A>(with:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v7 = v6;
  uint64_t v37 = a5;
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x1F4188790](a1);
  id v15 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v36 = (char *)&v27 - v17;
  uint64_t v38 = v16;
  uint64_t v19 = MEMORY[0x1AD11D510](v16, v18);
  uint64_t v20 = MEMORY[0x1E4FBC860];
  if (!v19)
  {
LABEL_11:
    uint64_t v40 = v20;
    (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a2, a4);
    MEMORY[0x1AD11D4A0]();
    if (*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BPSPublisher);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend(objc_allocWithZone((Class)BPSZipMany), sel_initWithPublishers_, isa);

    *a6 = v26;
    return;
  }
  uint64_t v21 = v19;
  uint64_t v27 = v13;
  uint64_t v40 = MEMORY[0x1E4FBC860];
  specialized ContiguousArray.reserveCapacity(_:)();
  if ((v21 & 0x8000000000000000) == 0)
  {
    uint64_t v28 = a2;
    uint64_t v29 = v7;
    uint64_t v30 = a4;
    id v31 = a6;
    uint64_t v22 = 0;
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v37 + 24);
    uint64_t v35 = v37 + 24;
    unint64_t v32 = v38 & 0xC000000000000001;
    uint64_t v33 = (void (**)(char *, uint64_t *, uint64_t))(v12 + 16);
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v32)
      {
        uint64_t v24 = _ArrayBuffer._getElementSlowPath(_:)();
        if (v27 != 8) {
          goto LABEL_15;
        }
        uint64_t v39 = v24;
        uint64_t v23 = v36;
        (*v33)(v36, &v39, a3);
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v23 = v36;
        (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v36, v38+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v22, a3);
      }
      ++v22;
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v23, a3);
      v34(a3, v37);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, a3);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v21 != v22);
    uint64_t v20 = v40;
    a4 = v30;
    a6 = v31;
    a2 = v28;
    goto LABEL_11;
  }
  __break(1u);
LABEL_15:
  __break(1u);
}

uint64_t PublisherProtocol.correlate<A, B, C>(_:comparator:correlateHandler:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, void *a6@<X8>, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(a7 + 24))(a4);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 24))(a5, a8);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  id v16 = objc_allocWithZone((Class)BPSCorrelate);
  v20[4] = partial apply for closure #2 in PublisherProtocol.orderedMergeManyAny<A>(with:comparator:);
  v20[5] = v15;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 1107296256;
  v20[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
  v20[3] = &block_descriptor_54_0;
  uint64_t v17 = _Block_copy(v20);
  swift_retain();
  id v18 = objc_msgSend(v16, sel_initWithPrior_current_comparator_correlateHandler_, v13, v14, v17, a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release(v17);
  uint64_t result = swift_release();
  *a6 = v18;
  return result;
}

uint64_t closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:)(void *a1, void *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  uint64_t v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  __swift_project_boxed_opaque_existential_0(a2, a2[3]);
  uint64_t v6 = _bridgeAnythingToObjectiveC<A>(_:)();
  uint64_t v7 = a3(v5, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

id PublisherProtocol.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, void *a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, void *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a13 + 24))(a12, a13);
  objc_allocWithZone((Class)BPSHandleEvents);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a1);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a3);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a5);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a7);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a10);
  swift_getAssociatedTypeWitness();
  id result = @nonobjc BPSHandleEvents.init(upstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)(v23, a1, a2, a3, a4, a5, a6, a7, a8, a10, a11);
  *a9 = result;
  return result;
}

uint64_t PublisherProtocol.buffer(size:prefetch:whenFull:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  id v7 = objc_msgSend(objc_allocWithZone((Class)BPSBuffer), sel_initWithUpstream_size_prefetch_whenFull_, (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5), a1, a2, a3);
  uint64_t result = swift_unknownObjectRelease();
  *a6 = v7;
  return result;
}

uint64_t PublisherProtocol.compactMap<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  v12[5] = a1;
  v12[6] = a2;
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 24);
  swift_retain();
  uint64_t v14 = v13(a3, a5);
  uint64_t v15 = BPSDemandMax(1);
  id v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = type metadata accessor for Publishers.Sequence();
  v16[5] = a5;
  v16[6] = swift_getWitnessTable();
  v16[7] = partial apply for closure #1 in PublisherProtocol.compactMap<A>(_:);
  v16[8] = v12;
  id v17 = objc_allocWithZone((Class)BPSFlatMap);
  v21[4] = partial apply for closure #1 in PublisherProtocol.flatMap<A, B>(_:);
  v21[5] = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 1107296256;
  v21[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B);
  v21[3] = &block_descriptor_64;
  id v18 = _Block_copy(v21);
  swift_retain();
  id v19 = objc_msgSend(v17, sel_initWithUpstream_maxPublishers_transform_, v14, v15, v18);
  swift_unknownObjectRelease();
  _Block_release(v18);
  swift_release();
  uint64_t result = swift_release();
  *a6 = v19;
  return result;
}

void closure #1 in PublisherProtocol.compactMap<A>(_:)(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X4>, void *a3@<X8>)
{
  uint64_t v5 = a1();
  if (v5)
  {
    uint64_t v6 = v5;
    getContiguousArrayStorageType<A>(for:)(a2, a2);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1AD0663E0;
    *(void *)(v7 + 32) = v6;
    id v8 = objc_allocWithZone((Class)BPSSequence);
    swift_unknownObjectRetain();
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    id v10 = objc_msgSend(v8, sel_initWithSequence_, v9.super.isa);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = objc_allocWithZone((Class)BPSSequence);
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    id v10 = objc_msgSend(v11, sel_initWithSequence_, v9.super.isa);
  }

  *a3 = v10;
}

void Array<A>.bmPublisher.getter(void *a1@<X8>)
{
  id v2 = objc_allocWithZone((Class)BPSSequence);
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithSequence_, isa);

  *a1 = v4;
}

id thunk for @escaping @callee_guaranteed (@guaranteed A, @in_guaranteed Any) -> (@owned A)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(uint64_t (**)(uint64_t, void *))(a1 + 32);
  v7[3] = MEMORY[0x1E4FBC838] + 8;
  v7[0] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v5 = (void *)v4(a2, v7);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

id thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B)(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(void *, void *))(a1 + 32);
  v9[3] = swift_getObjectType();
  v9[0] = a2;
  v8[3] = swift_getObjectType();
  v8[0] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v6 = v5(v9, v8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

Class thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out Date)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v7 = swift_unknownObjectRetain();
  v6(v7);
  swift_release();
  swift_unknownObjectRelease();
  v8.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v8.super.isa;
}

id @nonobjc BPSHandleEvents.init(upstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, void *a10, uint64_t a11)
{
  if (a2)
  {
    uint64_t v28 = a2;
    uint64_t v29 = a3;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 1107296256;
    id v26 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    uint64_t v27 = &block_descriptor_79;
    id v18 = _Block_copy(&v24);
    swift_release();
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v28 = a4;
      uint64_t v29 = a5;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 1107296256;
      id v26 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
      uint64_t v27 = &block_descriptor_76;
      id v19 = _Block_copy(&v24);
      swift_release();
      if (a6) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  id v19 = 0;
  if (a6)
  {
LABEL_4:
    uint64_t v28 = a6;
    uint64_t v29 = a7;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 1107296256;
    id v26 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    uint64_t v27 = &block_descriptor_73;
    uint64_t v20 = _Block_copy(&v24);
    swift_release();
    uint64_t v21 = a10;
    if (!a8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  uint64_t v20 = 0;
  uint64_t v21 = a10;
  if (a8)
  {
LABEL_5:
    uint64_t v28 = a8;
    uint64_t v29 = a9;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 1107296256;
    id v26 = thunk for @escaping @callee_guaranteed () -> ();
    uint64_t v27 = &block_descriptor_70;
    a8 = _Block_copy(&v24);
    swift_release();
  }
LABEL_6:
  if (v21)
  {
    uint64_t v28 = v21;
    uint64_t v29 = a11;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 1107296256;
    id v26 = thunk for @escaping @callee_guaranteed (@unowned BPSDemand) -> ();
    uint64_t v27 = &block_descriptor_67;
    uint64_t v21 = _Block_copy(&v24);
    swift_release();
  }
  id v22 = objc_msgSend(v11, sel_initWithUpstream_receiveSubscription_receiveOutput_receiveCompletion_receiveCancel_receiveRequest_, a1, v18, v19, v20, a8, v21);
  swift_unknownObjectRelease();
  _Block_release(v21);
  _Block_release(a8);
  _Block_release(v20);
  _Block_release(v19);
  _Block_release(v18);
  return v22;
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned BPSDemand) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t getContiguousArrayStorageType<A>(for:)(uint64_t a1, uint64_t a2)
{
  if (swift_isClassType()) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3)
  {
    return __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  }
  else
  {
    return MEMORY[0x1F4185768](0, a2);
  }
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1AD05D41C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
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

uint64_t partial apply for closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:)(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 40));
}

uint64_t sub_1AD05D494()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1AD05D4D0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1AD05D50C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:)(void *a1, void *a2)
{
  return closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:)(a1, a2, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t partial apply for closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:)(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 48));
}

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void partial apply for closure #1 in PublisherProtocol.compactMap<A>(_:)(void *a1@<X8>)
{
  closure #1 in PublisherProtocol.compactMap<A>(_:)(*(uint64_t (**)(void))(v1 + 40), *(void *)(v1 + 24), a1);
}

uint64_t partial apply for closure #1 in PublisherProtocol.flatMap<A, B>(_:)(uint64_t a1)
{
  return closure #1 in PublisherProtocol.flatMap<A, B>(_:)(a1, v1[7], v1[8], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

id BookmarkablePublisher.inner.getter()
{
  uint64_t v0 = (void *)specialized Publishers.HandleEvents.inner.getter();
  return v0;
}

void BookmarkablePublisher.inner.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*BookmarkablePublisher.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t BookmarkablePublisher.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t BookmarkablePublisher.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (objc_class *)type metadata accessor for BMBookmarkablePublisherImpl();
  char v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[direct field offset for BMBookmarkablePublisherImpl.inner] = a1;
  v7.receiver = v5;
  v7.super_class = v4;
  objc_msgSendSuper2(&v7, sel_init);
  self;
  uint64_t result = swift_dynamicCastObjCClassUnconditional();
  *a2 = result;
  return result;
}

{
  objc_class *v4;
  char *v5;
  uint64_t result;
  objc_super v7;

  uint64_t v4 = (objc_class *)type metadata accessor for BMBookmarkablePublisherImpl();
  char v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[direct field offset for BMBookmarkablePublisherImpl.inner] = a1;
  v7.receiver = v5;
  v7.super_class = v4;
  objc_msgSendSuper2(&v7, sel_init);
  self;
  uint64_t result = swift_dynamicCastObjCClassUnconditional();
  *a2 = result;
  return result;
}

id protocol witness for PublisherProtocol.inner.getter in conformance BookmarkablePublisher<A>()
{
  uint64_t v0 = (void *)specialized Publishers.HandleEvents.inner.getter();
  return v0;
}

id BMBookmarkablePublisherImpl.subscribe(_:)(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_subscribe_, a1);
}

void @objc BMBookmarkablePublisherImpl.subscribe(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  BMBookmarkablePublisherImpl.subscribe(_:)(a3);
  swift_unknownObjectRelease();
}

Class @objc BMBookmarkablePublisherImpl.bookmarkableUpstreams.getter(void *a1)
{
  id v1 = a1;
  uint64_t v2 = BMBookmarkablePublisherImpl.bookmarkableUpstreams.getter();

  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
    v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.Class isa = 0;
  }
  return v3.super.isa;
}

uint64_t BMBookmarkablePublisherImpl.bookmarkableUpstreams.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_bookmarkableUpstreams);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id static BMBookmarkablePublisherImpl.publisher(with:upstreams:bookmarkState:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  objc_super v7 = (objc_class *)(*MEMORY[0x1E4FBC8C8] & *(void *)type metadata accessor for BMBookmarkablePublisherImpl());
  v10.receiver = ObjCClassFromMetadata;
  v10.super_class = v7;
  id v8 = objc_msgSendSuper2(&v10, sel_publisherWithPublisher_upstreams_bookmarkState_, a1, isa, a3);

  return v8;
}

id @objc static BMBookmarkablePublisherImpl.publisher(with:upstreams:bookmarkState:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = static BMBookmarkablePublisherImpl.publisher(with:upstreams:bookmarkState:)((uint64_t)v8, v7, a5);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id BMBookmarkablePublisherImpl.withBookmark(_:)(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(v1 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_withBookmark_, a1);
  return v2;
}

id @objc BMBookmarkablePublisherImpl.withBookmark(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  id v6 = BMBookmarkablePublisherImpl.withBookmark(_:)(a3);
  swift_unknownObjectRelease();

  return v6;
}

Swift::Bool __swiftcall BMBookmarkablePublisherImpl.canStoreInternalStateInBookmark()()
{
  return objc_msgSend(*(id *)(v0 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_canStoreInternalStateInBookmark);
}

BOOL @objc BMBookmarkablePublisherImpl.canStoreInternalStateInBookmark()(void *a1)
{
  id v1 = a1;
  Swift::Bool v2 = BMBookmarkablePublisherImpl.canStoreInternalStateInBookmark()();

  return v2;
}

Swift::Bool __swiftcall BMBookmarkablePublisherImpl.canStorePassThroughValueInBookmark()()
{
  return objc_msgSend(*(id *)(v0 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_canStorePassThroughValueInBookmark);
}

BOOL @objc BMBookmarkablePublisherImpl.canStorePassThroughValueInBookmark()(void *a1)
{
  id v1 = a1;
  Swift::Bool v2 = BMBookmarkablePublisherImpl.canStorePassThroughValueInBookmark()();

  return v2;
}

void @objc BMBookmarkablePublisherImpl.init()()
{
}

id BMBookmarkablePublisherImpl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMBookmarkablePublisherImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t @objc BMBookmarkablePublisherImpl.__ivar_destroyer()
{
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for BMBookmarkablePublisherImpl()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t instantiation function for generic protocol witness table for BookmarkablePublisher<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for BookmarkablePublisher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for BMBookmarkablePublisherImpl()
{
  return swift_initClassMetadata2();
}

void specialized BMBookmarkablePublisherImpl.init()()
{
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BiomeDSLLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BPSSink.m", 21, @"%s", *a1);

  __break(1u);
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMDSLSubscribeOnClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BPSSink.m", 22, @"Unable to find class %s", "BMDSLSubscribeOn");

  __break(1u);
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_1_0(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BiomeDSLLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BPSDrivableSink.m", 21, @"%s", *a1);

  __break(1u);
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMDSLSubscribeOnClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BPSDrivableSink.m", 22, @"Unable to find class %s", "BMDSLSubscribeOn");

  __break(1u);
}

void BPSDemandMax_cold_1()
{
  __assert_rtn("BPSDemandMax", "BPSDemand.m", 17, "value >= 0");
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1F40E5188]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6348]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185A30]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1F4147328]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1F4147330]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1F4147338]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1F4147340]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1F4147348]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1F4147350]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1F41473D0]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1F41473D8]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1F41473E0]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1F41473E8]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1F41473F0]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1F41473F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _PASMurmur3_x86_32()
{
  return MEMORY[0x1F41462C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x1F410C868]();
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

void objc_exception_throw(id exception)
{
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

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}