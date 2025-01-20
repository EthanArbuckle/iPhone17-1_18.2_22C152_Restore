uint64_t cpllogGreenTeaEnabled()
{
  return MEMORY[0x1F417A390]();
}

id __CPLManagerOSLogDomain()
{
  if (__CPLManagerOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLManagerOSLogDomain_onceToken, &__block_literal_global_526);
  }
  v0 = (void *)__CPLManagerOSLogDomain_result;
  return v0;
}

void sub_1B4CB0A94(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CB0AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
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

void sub_1B4CB0CE8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CB0CFC(_Unwind_Exception *a1)
{
}

void sub_1B4CB104C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1B4CB1E0C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CB1E20(_Unwind_Exception *a1)
{
}

void _unregisterConnectedLibraryManager(void *a1)
{
  id v1 = a1;
  v2 = _connectedLibraryManagerRegisterQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___unregisterConnectedLibraryManager_block_invoke;
  block[3] = &unk_1E60A5DD8;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void sub_1B4CB4430(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id _connectedLibraryManagerRegisterQueue()
{
  if (_connectedLibraryManagerRegisterQueue_onceToken != -1) {
    dispatch_once(&_connectedLibraryManagerRegisterQueue_onceToken, &__block_literal_global_529);
  }
  v0 = (void *)_connectedLibraryManagerRegisterQueue_queue;
  return v0;
}

uint64_t ___registerConnectedLibraryManager_block_invoke(uint64_t a1)
{
  return [(id)_connectedLibraryManagers_unprotected addObject:*(void *)(a1 + 32)];
}

uint64_t ___connectedLibraryManagerRegisterQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.cpl.connectedlibrarymanagers", 0);
  uint64_t v1 = (void *)_connectedLibraryManagerRegisterQueue_queue;
  _connectedLibraryManagerRegisterQueue_queue = (uint64_t)v0;

  _connectedLibraryManagers_unprotected = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  return MEMORY[0x1F41817F8]();
}

uint64_t ___unregisterConnectedLibraryManager_block_invoke(uint64_t a1)
{
  return [(id)_connectedLibraryManagers_unprotected removeObject:*(void *)(a1 + 32)];
}

uint64_t ___connectedLibraryManagers_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)_connectedLibraryManagers_unprotected copy];
  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_1(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

id __CPLProxyPullSessionOSLogDomain()
{
  if (__CPLProxyPullSessionOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLProxyPullSessionOSLogDomain_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)__CPLProxyPullSessionOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_0(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLProxyPushSessionOSLogDomain()
{
  if (__CPLProxyPushSessionOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLProxyPushSessionOSLogDomain_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)__CPLProxyPushSessionOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_1(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLSessionOSLogDomain()
{
  if (__CPLSessionOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLSessionOSLogDomain_onceToken, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)__CPLSessionOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4CD1428(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 64), 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain()
{
  if (__CPLStorageOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken, &__block_literal_global_225);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4CD893C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_202()
{
  if (__CPLStorageOSLogDomain_onceToken_204 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_204, &__block_literal_global_205);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_206;
  return v0;
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

void sub_1B4CD8D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CD8F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CD9B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CDA90C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CDB4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void ___initializePredictionTypes_block_invoke()
{
  uint64_t v13 = objc_alloc_init(CPLTransferSpeedFormatter);
  uint64_t v0 = [(CPLTransferSpeedFormatter *)v13 byteCountFormatter];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], @"uploadSize", v0);
  [v1 setObject:v3 forKeyedSubscript:@"uploadSize"];
  [v2 addObject:v3];

  v4 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], @"largestResource", v0);
  [v1 setObject:v4 forKeyedSubscript:@"largestResource"];
  [v2 addObject:v4];

  id v5 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], @"derivativesSpeed", v13);
  [v1 setObject:v5 forKeyedSubscript:@"derivativesSpeed"];
  [v2 addObject:v5];

  v6 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], @"largeDerivativesSpeed", v13);
  [v1 setObject:v6 forKeyedSubscript:@"largeDerivativesSpeed"];
  [v2 addObject:v6];

  v7 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], @"uploadSpeed", v13);
  [v1 setObject:v7 forKeyedSubscript:@"uploadSpeed"];
  [v2 addObject:v7];

  v8 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], @"downloadSize", v0);
  [v1 setObject:v8 forKeyedSubscript:@"downloadSize"];
  [v2 addObject:v8];

  uint64_t v9 = [v1 copy];
  uint64_t v10 = (void *)_predictionTypes;
  _predictionTypes = v9;

  uint64_t v11 = [v2 copy];
  v12 = (void *)_orderedPredictionTypes;
  _orderedPredictionTypes = v11;
}

void sub_1B4CDC2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__344(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__345(uint64_t a1)
{
}

void sub_1B4CDC844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CDCB60(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CDCB74(_Unwind_Exception *a1)
{
}

void sub_1B4CDCC54(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CDCC68(_Unwind_Exception *a1)
{
}

void sub_1B4CDCD9C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CDCDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLRampingResponseResourceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_39;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_41:
        *(void *)(a1 + 8) = v22;
      }
      else if (v17 == 2)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
          *(void *)(a2 + v29) = v30 + 1;
          v28 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0) {
            goto LABEL_43;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            uint64_t v28 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_45:
        *(unsigned char *)(a1 + 24) = v28 != 0;
      }
      else if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __CPLTaskOSLogDomain()
{
  if (__CPLTaskOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken, &__block_literal_global_443);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result;
  return v0;
}

id __CPLStorageOSLogDomain_497()
{
  if (__CPLStorageOSLogDomain_onceToken_499 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_499, &__block_literal_global_500);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_501;
  return v0;
}

id __CPLTaskOSLogDomain_611()
{
  if (__CPLTaskOSLogDomain_onceToken_614 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_614, &__block_literal_global_615);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_616;
  return v0;
}

void sub_1B4CE1A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

id __CPLStoreOSLogDomain_2929()
{
  if (__CPLStoreOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLStoreOSLogDomain_onceToken, &__block_literal_global_1018);
  }
  uint64_t v0 = (void *)__CPLStoreOSLogDomain_result;
  return v0;
}

void sub_1B4CE2930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__670(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__671(uint64_t a1)
{
}

void sub_1B4CE3DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_676(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4CE7AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CE7D50(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 42) = 0;
  objc_exception_rethrow();
}

void sub_1B4CE7D60(_Unwind_Exception *a1)
{
}

void sub_1B4CE8DC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CE9380(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CE9544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CE9C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLTransactionOSLogDomain()
{
  if (__CPLTransactionOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLTransactionOSLogDomain_onceToken, &__block_literal_global_1021);
  }
  uint64_t v0 = (void *)__CPLTransactionOSLogDomain_result;
  return v0;
}

void sub_1B4CEC5DC(void *a1, int a2)
{
  unsigned __int8 v4 = 1;
  if (a2 != 1) {
    JUMPOUT(0x1B4CEC7C4);
  }
  id v5 = objc_begin_catch(a1);
  if ([*(id *)(v13 + 32) _handleException:v5])
  {
LABEL_14:

    objc_end_catch();
    if (v4) {
      JUMPOUT(0x1B4CEB57CLL);
    }
    JUMPOUT(0x1B4CEB238);
  }
  if (v3)
  {
    if (_CPLSilentLogging)
    {
      unsigned int v9 = @"failed to re-inject batch";
      goto LABEL_13;
    }
    uint64_t v6 = __CPLStoreOSLogDomain_2929();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v3 batch]);
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Re-injecting %@ raised an exception: %@", (uint8_t *)&v14, 0x16u);
    }
    unsigned int v9 = @"failed to re-inject batch";
  }
  else
  {
    if (_CPLSilentLogging)
    {
      unsigned int v9 = @"failed to decode extracted batch at launch";
      goto LABEL_13;
    }
    uint64_t v10 = __CPLStoreOSLogDomain_2929();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Failed to decode extracted batch at launch: %@", (uint8_t *)&v14, 0xCu);
    }
    unsigned int v9 = @"failed to decode extracted batch at launch";
  }

LABEL_13:
  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[CPLResetTracker currentTracker]);
  unint64_t v12 = objc_claimAutoreleasedReturnValue([v11 likelyResetReasonWithImmediateReason:v9]);
  unsigned __int8 v4 = [*(id *)(v13 + 32) resetLocalSyncStateWithCause:v12 error:v2];
  +[CPLResetTracker discardTracker:v11];

  goto LABEL_14;
}

void sub_1B4CEC7B4(_Unwind_Exception *a1)
{
}

uint64_t CPLIsInTestReadonlyMode()
{
  if (os_variant_has_internal_content())
  {
    uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    CPLIsInTestReadonlyMode__readOnlyMode = [v0 BOOLForKey:@"CPLTestReadOnlyMode"];
  }
  return CPLIsInTestReadonlyMode__readOnlyMode;
}

void sub_1B4CECED0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int buf, long long a14)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(a1);
    if ([v14 _handleException:v15])
    {

      objc_end_catch();
      JUMPOUT(0x1B4CECCB0);
    }
    if (!_CPLSilentLogging)
    {
      __int16 v16 = __CPLTransactionOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        buf = 138412546;
        WORD2(a14) = 2112;
        *(void *)((char *)&a14 + 6) = v15;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "! %@ raised an exception %@", (uint8_t *)&buf, 0x16u);
      }
    }
    objc_exception_throw(v15);
  }
  _Unwind_Resume(a1);
}

void _CPLStoreFailure(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"CPLAssertStoreException" reason:v1 userInfo:0];
  objc_exception_throw(v2);
}

void _CPLBaseRecordViewFailure(void *a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  +[CPLEngineStoreTransaction currentTransaction];
  id v5 = [(id)objc_claimAutoreleasedReturnValue() store];
  uint64_t v6 = [v4 scopedIdentifier];
  uint64_t v7 = [v6 scopeIdentifier];
  id v8 = [v5 scopes];
  unsigned int v9 = [v5 cloudCache];
  uint64_t v10 = [v8 scopeWithIdentifier:v7];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v12 = &unk_1E9D43000;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v13 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = [v3 baseStorageView];
        *(_DWORD *)buf = 138412546;
        v50 = v14;
        __int16 v51 = 2112;
        id v52 = v4;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "No base record in %@ to apply %@ on - missing scope", buf, 0x16u);
      }
    }
    id v15 = @"missing scope";
    goto LABEL_7;
  }
  v48 = v3;
  if (!_CPLSilentLogging)
  {
    __int16 v16 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v48 baseStorageView];
      *(_DWORD *)buf = 138412802;
      v50 = v17;
      __int16 v51 = 2112;
      id v52 = v4;
      __int16 v53 = 2112;
      v54 = v10;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "No base record in %@ to apply %@ on - scope: %@", buf, 0x20u);
    }
  }
  uint64_t v18 = +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", [v10 scopeType]);
  [v11 addObject:v18];

  v19 = [v8 flagsForScope:v10];
  id v20 = [NSString alloc];
  unsigned int v21 = [v19 arrayDescription];
  uint64_t v22 = [v21 componentsJoinedByString:@"|"];
  uint64_t v23 = (void *)[v20 initWithFormat:@"flags: %@", v22];
  [v11 addObject:v23];

  uint64_t v24 = [v10 localIndex];
  if (v24 != [v6 scopeIndex] && objc_msgSend(v6, "scopeIndex"))
  {
    uint64_t v37 = [v10 cloudIndex];
    if (v37 != [v6 scopeIndex])
    {
      uint64_t v38 = [v10 cloudIndex];
      v39 = @"invalid index from reset sync";
      id v3 = v48;
      if (v38 <= [v6 scopeIndex])
      {
        uint64_t v40 = [v10 localIndex];
        if (v40 <= [v6 scopeIndex]) {
          v39 = @"invalid index";
        }
      }
      [v11 addObject:v39];

      unint64_t v12 = &unk_1E9D43000;
      goto LABEL_39;
    }
    uint64_t v28 = [v6 copy];
    char v26 = 0;
    id v3 = v48;
    unint64_t v12 = (unsigned char *)&unk_1E9D43000;
  }
  else
  {
    char v25 = [v5 idMapping];
    char v26 = (void *)[v6 copy];
    buf[0] = 0;
    uint64_t v27 = [v25 cloudScopedIdentifierForLocalScopedIdentifier:v26 isFinal:buf];
    if (v27)
    {
      uint64_t v28 = v27;
      unint64_t v30 = @"in ID mapping";
    }
    else
    {
      uint64_t v28 = [v6 copy];
      uint64_t v29 = [v25 localScopedIdentifierForCloudScopedIdentifier:v28 isFinal:buf];

      if (v29) {
        unint64_t v30 = @"conflicting ID mapping";
      }
      else {
        unint64_t v30 = @"no ID mapping";
      }
      char v26 = (void *)v29;
    }
    unint64_t v12 = (unsigned char *)&unk_1E9D43000;
    [v11 addObject:v30];

    id v3 = v48;
  }

  if (v28)
  {
    char v31 = [v9 recordWithScopedIdentifier:v28 isFinal:0];
    uint64_t v32 = [v9 recordWithScopedIdentifier:v28 isFinal:1];
    v33 = (void *)v32;
    v34 = @"in cloud cache";
    if (!v32) {
      v34 = @"delete staged in cloud cache";
    }
    v35 = @"not in cloud cache";
    if (v32) {
      v35 = @"staged in cloud cache";
    }
    if (v31) {
      v36 = v34;
    }
    else {
      v36 = v35;
    }
    [v11 addObject:v36];

    unint64_t v12 = (unsigned char *)&unk_1E9D43000;
  }
  if (v26 && [v9 hasRecordAcknowledgedByClientWithScopedIdentifier:v26])
  {
    id v15 = @"acknowledged by client";
LABEL_7:
    [v11 addObject:v15];
  }
LABEL_39:
  if (![v11 count]) {
    [v11 addObject:@"no context"];
  }
  if (!v12[2752])
  {
    v41 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = [v11 componentsJoinedByString:@"/"];
      *(_DWORD *)buf = 138412290;
      v50 = v42;
      _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_ERROR, "Context: %@", buf, 0xCu);
    }
  }
  id v43 = [NSString alloc];
  uint64_t v44 = objc_opt_class();
  v45 = [v3 redactedDescription];
  v46 = [v11 componentsJoinedByString:@"/"];
  v47 = (void *)[v43 initWithFormat:@"missing base %@ in %@ (%@)", v44, v45, v46];

  _CPLStoreFailure(v47);
}

uint64_t __Block_byref_object_copy__878(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__879(uint64_t a1)
{
}

id __CPLStorageOSLogDomain_903()
{
  if (__CPLStorageOSLogDomain_onceToken_909 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_909, &__block_literal_global_910);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_911;
  return v0;
}

void sub_1B4CF2838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1008(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1009(uint64_t a1)
{
}

void sub_1B4CF2BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF36A4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF36B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1176(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1177(uint64_t a1)
{
}

void sub_1B4CF3850(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF3864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF39D0(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF39E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF3AB8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF3ACC(_Unwind_Exception *a1)
{
}

void sub_1B4CF3BD8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF3BEC(_Unwind_Exception *a1)
{
}

void sub_1B4CF3D3C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF3D50(_Unwind_Exception *a1)
{
}

id __CPLSchedulerOSLogDomain()
{
  if (__CPLSchedulerOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLSchedulerOSLogDomain_onceToken, &__block_literal_global_1180);
  }
  uint64_t v0 = (void *)__CPLSchedulerOSLogDomain_result;
  return v0;
}

void sub_1B4CF44D8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF44EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF4680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF4858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF49EC(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF4A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF4B1C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF4B30(_Unwind_Exception *a1)
{
}

void sub_1B4CF4C98(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF4CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF4D80(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF4D94(_Unwind_Exception *a1)
{
}

void sub_1B4CF4E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF4FF0(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF5004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF5100(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF5114(_Unwind_Exception *a1)
{
}

void sub_1B4CF527C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF5290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF58A4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B4CF58C4(_Unwind_Exception *a1)
{
}

void sub_1B4CF58D0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1B4CF58DCLL);
}

void sub_1B4CF5A50(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B4CF5BFC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B4CF5ECC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B4CF5EEC(_Unwind_Exception *a1)
{
}

void sub_1B4CF5EF8(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1B4CF5F04);
}

void sub_1B4CF5FD4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4CF5FE8(_Unwind_Exception *a1)
{
}

void sub_1B4CF67FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF69DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF7170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_1318()
{
  if (__CPLTaskOSLogDomain_onceToken_1346 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_1346, &__block_literal_global_111);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_1347;
  return v0;
}

uint64_t __Block_byref_object_copy__1320(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1321(uint64_t a1)
{
}

void sub_1B4CF77EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_1352(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4CF8328(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CF8BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4CFA500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id __CPLBatchOSLogDomain()
{
  if (__CPLBatchOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLBatchOSLogDomain_onceToken, &__block_literal_global_1465);
  }
  uint64_t v0 = (void *)__CPLBatchOSLogDomain_result;
  return v0;
}

uint64_t CPLRampingRequestReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        id v17 = objc_alloc_init(CPLRampingRequestResource);
        [a1 addRequest:v17];
        if (!PBReaderPlaceMark() || (CPLRampingRequestResourceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __CPLObserverOSLogDomain()
{
  if (__CPLObserverOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLObserverOSLogDomain_onceToken, &__block_literal_global_1713);
  }
  uint64_t v0 = (void *)__CPLObserverOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_1771(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLNetworkOSLogDomain()
{
  if (__CPLNetworkOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLNetworkOSLogDomain_onceToken, &__block_literal_global_1823);
  }
  uint64_t v0 = (void *)__CPLNetworkOSLogDomain_result;
  return v0;
}

uint64_t CPLRequestClient()
{
  uint64_t result = _requestBlock;
  if (_requestBlock) {
    return (*(uint64_t (**)(void))(_requestBlock + 16))();
  }
  return result;
}

uint64_t CPLRequestClientSetRequestBlock(void *a1)
{
  uint64_t v1 = [a1 copy];
  uint64_t v2 = _requestBlock;
  _requestBlock = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void cpllogGreenTeaSetCallerBundleIdentifier(id obj)
{
}

void cpllogGreenTeaWithFormat(void *a1, int a2, void *a3)
{
}

void cpllogGreenTea(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v8 = v5;
  [v8 UTF8String];
  if (a2) {
    ct_green_tea_logger_create();
  }
  else {
    ct_green_tea_logger_create_static();
  }
  uint64_t v7 = getCTGreenTeaOsLogHandle();
  if (v7)
  {
    [v6 UTF8String];
    os_log_with_args();
  }
  if (a2) {
    ct_green_tea_logger_destroy();
  }
}

void cpllogGreenTeaReadingPhotosOrVideos()
{
  uint64_t v0 = (void *)callerBundleIdentifier;
  if (callerBundleIdentifier)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v1 = @"%@ [Photos] : Reading photos or videos";
  }
  else
  {
    if (_prepareLog_onceToken != -1) {
      dispatch_once(&_prepareLog_onceToken, &__block_literal_global_1858);
    }
    uint64_t v0 = (void *)bundleIdentifier;
    id v2 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v1 = @"%@ <%@>[Photos][%@] : Reading photos or videos";
  }
  cpllogGreenTeaWithFormat(v0, 0, v1);
}

void ___prepareLog_block_invoke()
{
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v7 bundleIdentifier];
  uint64_t v1 = (void *)bundleIdentifier;
  bundleIdentifier = v0;

  uint64_t v2 = [v7 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  id v3 = (void *)applicationName;
  applicationName = v2;

  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v5 = [v4 processName];
  id v6 = (void *)processName;
  processName = v5;
}

void cpllogGreenTeaTransmittingPhotosOrVideos()
{
  uint64_t v0 = (void *)callerBundleIdentifier;
  if (callerBundleIdentifier)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v1 = @"%@ [Photos] : Transmitting photos or videos";
  }
  else
  {
    if (_prepareLog_onceToken != -1) {
      dispatch_once(&_prepareLog_onceToken, &__block_literal_global_1858);
    }
    uint64_t v0 = (void *)bundleIdentifier;
    id v2 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v1 = @"%@ <%@>[Photos][%@] : Transmitting photos or videos";
  }
  cpllogGreenTeaWithFormat(v0, 0, v1);
}

id __CPLStorageOSLogDomain_1988()
{
  if (__CPLStorageOSLogDomain_onceToken_1990 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_1990, &__block_literal_global_1991);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_1992;
  return v0;
}

void sub_1B4D013C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

uint64_t __Block_byref_object_copy__2006(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2007(uint64_t a1)
{
}

void sub_1B4D02184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D02464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLItemOSLogDomain()
{
  if (__CPLItemOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLItemOSLogDomain_onceToken, &__block_literal_global_243);
  }
  uint64_t v0 = (void *)__CPLItemOSLogDomain_result;
  return v0;
}

uint64_t __Block_byref_object_copy__2491(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2492(uint64_t a1)
{
}

id __CPLTaskOSLogDomain_2551()
{
  if (__CPLTaskOSLogDomain_onceToken_2553 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_2553, &__block_literal_global_2554);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_2555;
  return v0;
}

void sub_1B4D078FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__2565(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2566(uint64_t a1)
{
}

void sub_1B4D09508(void *a1)
{
}

void sub_1B4D09520(_Unwind_Exception *a1)
{
}

void sub_1B4D09654(void *a1)
{
}

void sub_1B4D0966C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2876(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2877(uint64_t a1)
{
}

id __CPLEngineOSLogDomain()
{
  if (__CPLEngineOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLEngineOSLogDomain_onceToken, &__block_literal_global_2908);
  }
  uint64_t v0 = (void *)__CPLEngineOSLogDomain_result;
  return v0;
}

const char *_CPLOSLogSubsystem()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  return "com.apple.photos.cpl";
}

id __CPLStoreOSLogDomain()
{
  if (__CPLStoreOSLogDomain_onceToken_2930 != -1) {
    dispatch_once(&__CPLStoreOSLogDomain_onceToken_2930, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)__CPLStoreOSLogDomain_result_2931;
  return v0;
}

id __CPLQOSOSLogDomain()
{
  if (__CPLQOSOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLQOSOSLogDomain_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)__CPLQOSOSLogDomain_result;
  return v0;
}

__CFString *__CPLVersion()
{
  return @"CloudPhotoLibrary-722.0.180";
}

id __CPLBuildVersion()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  return v0;
}

id __CPLEnvironmentDictionary()
{
  v16[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (__CFString *)MGCopyAnswer();
  uint64_t v1 = (__CFString *)MGCopyAnswer();
  id v2 = (__CFString *)MGCopyAnswer();
  id v3 = (__CFString *)MGCopyAnswer();
  id v4 = (__CFString *)MGCopyAnswer();
  uint64_t v5 = MGCopyAnswer();
  id v6 = (void *)v5;
  id v7 = @"Unknown";
  if (v1) {
    id v8 = v1;
  }
  else {
    id v8 = @"Unknown";
  }
  v15[0] = @"ProductName";
  v15[1] = @"ProductVersion";
  if (v2) {
    unsigned int v9 = v2;
  }
  else {
    unsigned int v9 = @"Unknown";
  }
  v16[0] = v8;
  v16[1] = v9;
  if (v0) {
    unint64_t v10 = v0;
  }
  else {
    unint64_t v10 = @"Unknown";
  }
  v15[2] = @"BuildVersion";
  v15[3] = @"DeviceType";
  if (v3) {
    uint64_t v11 = v3;
  }
  else {
    uint64_t v11 = @"Unknown";
  }
  v16[2] = v10;
  v16[3] = v11;
  if (v4) {
    unint64_t v12 = v4;
  }
  else {
    unint64_t v12 = @"Unknown";
  }
  v15[4] = @"DeviceName";
  v15[5] = @"DeviceUDID";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  v16[4] = v12;
  v16[5] = v7;
  char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];

  return v13;
}

id __CPLGenericOSLogDomain()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  uint64_t v0 = (void *)_CPLGenericLog;
  return v0;
}

uint64_t __CPLShouldLogQOS()
{
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  return __CPLShouldLogQOS_debugQOS;
}

__CFString *CPLCurrentQOS()
{
  qos_class_t v0 = qos_class_self();
  if ((int)v0 > 20)
  {
    switch(v0)
    {
      case QOS_CLASS_DEFAULT:
        return @"Default";
      case QOS_CLASS_USER_INITIATED:
        return @"UserInitiated";
      case QOS_CLASS_USER_INTERACTIVE:
        return @"UserInteractive";
    }
  }
  else
  {
    switch(v0)
    {
      case QOS_CLASS_UNSPECIFIED:
        return @"Unspecified";
      case QOS_CLASS_BACKGROUND:
        return @"Background";
      case QOS_CLASS_UTILITY:
        return @"Utility";
    }
  }
  return @"Unknown";
}

void _CPLExit(int a1)
{
}

void _CPLAbort()
{
}

uint64_t CPLFaceAnalysisReadFrom(unsigned char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        a1[36] |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_35;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_37:
        a1[32] = v19 != 0;
        goto LABEL_38;
      case 2u:
        uint64_t v24 = objc_alloc_init(CPLFaceInstance);
        [a1 addFaceInstances:v24];
        goto LABEL_31;
      case 3u:
        uint64_t v24 = objc_alloc_init(CPLFaceInstance);
        [a1 addPetFaceInstances:v24];
        goto LABEL_31;
      case 4u:
        uint64_t v24 = objc_alloc_init(CPLFaceInstance);
        [a1 addTorsoFaceInstances:v24];
LABEL_31:
        if PBReaderPlaceMark() && (CPLFaceInstanceReadFrom((char *)v24, a2))
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

void sub_1B4D0BB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3141(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3142(uint64_t a1)
{
}

id __CPLPushSessionOSLogDomain()
{
  if (__CPLPushSessionOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLPushSessionOSLogDomain_onceToken, &__block_literal_global_187);
  }
  qos_class_t v0 = (void *)__CPLPushSessionOSLogDomain_result;
  return v0;
}

BOOL CPLMomentSharePreviewDataReadFrom(char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = PBReaderReadData();
          if (v17) {
            [a1 addPreviewImageData:v17];
          }
          goto LABEL_28;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
          goto LABEL_25;
        case 3u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
LABEL_25:
          char v17 = *(void **)&a1[v19];
          *(void *)&a1[v19] = v18;
          goto LABEL_28;
        case 4u:
          char v17 = PBReaderReadString();
          if (v17) {
            [a1 addCuratedAssetIdentifiers:v17];
          }
LABEL_28:

          goto LABEL_29;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1B4D0F0EC(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D0F100(_Unwind_Exception *a1)
{
}

id __CPLStrategyOSLogDomain()
{
  if (__CPLStrategyOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLStrategyOSLogDomain_onceToken, &__block_literal_global_202);
  }
  qos_class_t v0 = (void *)__CPLStrategyOSLogDomain_result;
  return v0;
}

id CPLIgnoredDateForRecord(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [a1 recordModificationDate];
  char v8 = [v6 recordModificationDate];

  if (v7)
  {
    if (v8)
    {
      id v9 = [v7 laterDate:v8];
    }
    else
    {
      id v9 = v7;
    }
  }
  else
  {
    if (v8) {
      unint64_t v10 = v8;
    }
    else {
      unint64_t v10 = v5;
    }
    id v9 = v10;
  }
  uint64_t v11 = v9;
  unint64_t v12 = [v5 earlierDate:v9];

  return v12;
}

uint64_t _nilGenerator_block_invoke()
{
  return MEMORY[0x1E4F1CBF0];
}

BOOL CPLMemoryAssetReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_27;
      case 2u:
        uint64_t v19 = objc_alloc_init(CPLMemoryAssetFlag);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && CPLMemoryAssetFlagReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24;
        goto LABEL_27;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_27:
        uint64_t v19 = *(CPLMemoryAssetFlag **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_28;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }
}

BOOL CPLMarkDownloadedResourceWithDynamicVersion(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = v5;
  if (a2)
  {
    uint64_t value = a2;
    id v7 = v5;
    int v8 = setxattr((const char *)[v7 fileSystemRepresentation], "com.apple.cpl.dynamicVersion", &value, 8uLL, 0, 0);
    BOOL v9 = v8 == 0;
    if (a3 && v8)
    {
      *a3 = +[CPLErrors posixErrorForURL:v7];
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

uint64_t CPLGetDynamicVersionForDownloadResource(void *a1, void *a2, void *a3)
{
  uint64_t value = 0;
  id v5 = a1;
  ssize_t v6 = getxattr((const char *)[v5 fileSystemRepresentation], "com.apple.cpl.dynamicVersion", &value, 8uLL, 0, 0);
  if (v6 == 8)
  {
    *a2 = value;
LABEL_6:
    uint64_t v7 = 1;
    goto LABEL_7;
  }
  if ((v6 & 0x8000000000000000) == 0 || *__error() == 93)
  {
    *a2 = 0;
    goto LABEL_6;
  }
  if (a3)
  {
    +[CPLErrors posixErrorForURL:v5];
    uint64_t v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_7:

  return v7;
}

uint64_t CPLSocialGroupPersonReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1B4D207BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_5191()
{
  if (__CPLTaskOSLogDomain_onceToken_5194 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_5194, &__block_literal_global_5195);
  }
  qos_class_t v0 = (void *)__CPLTaskOSLogDomain_result_5196;
  return v0;
}

void sub_1B4D20CA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B4D21B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _displayableKey(void *a1)
{
  uint64_t v1 = _displayableKey_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_displayableKey_onceToken, &__block_literal_global_355);
  }
  id v3 = [(id)_displayableKey_displayableKeys objectForKeyedSubscript:v2];
  id v4 = v3;
  if (!v3) {
    id v3 = v2;
  }
  id v5 = v3;

  return v5;
}

void ___displayableKey_block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"initial sync";
  v2[1] = @"initial client download";
  v3[0] = @"synced";
  v3[1] = @"fast pass";
  v2[2] = @"initial mingle";
  v2[3] = @"initial shared metadata download";
  v3[2] = @"mingle";
  v3[3] = @"shared metadata";
  v2[4] = @"initial metadata queries";
  v2[5] = @"initial metadata download";
  v3[4] = @"queries";
  v3[5] = @"metadata";
  v2[6] = @"activation";
  v3[6] = @"activation";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:7];
  uint64_t v1 = (void *)_displayableKey_displayableKeys;
  _displayableKey_displayableKeys = v0;
}

void sub_1B4D26B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5473(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5474(uint64_t a1)
{
}

id __CPLStorageOSLogDomain_5820()
{
  if (__CPLStorageOSLogDomain_onceToken_5822 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_5822, &__block_literal_global_5823);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_5824;
  return v0;
}

void sub_1B4D2EB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6041(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6042(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__6188(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6189(uint64_t a1)
{
}

void __valueForDictionaryOfCounts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v5 integerValue]) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

uint64_t _statusDidChange(uint64_t a1, void *a2)
{
  return [a2 _statusDidChange];
}

void __cpl_dispatch_async_block_invoke_6228(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4D325A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLStatusOSLogDomain()
{
  if (__CPLStatusOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLStatusOSLogDomain_onceToken, &__block_literal_global_6288);
  }
  uint64_t v0 = (void *)__CPLStatusOSLogDomain_result;
  return v0;
}

BOOL CPLServerFeedbackKeyAndValueReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v10) = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      int v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
LABEL_22:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void __cpl_dispatch_async_block_invoke_6630(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLTaskOSLogDomain_6632()
{
  if (__CPLTaskOSLogDomain_onceToken_6644 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_6644, &__block_literal_global_6645);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_6646;
  return v0;
}

uint64_t _CPLCutoffDate()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 doubleForKey:@"CPLIgnoredRecordsExpirationInterval"];
  double v2 = v1;

  double v3 = 3600.0;
  if (v2 != 0.0) {
    double v3 = v2;
  }
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  double v5 = -v3;
  return [v4 dateWithTimeIntervalSinceNow:v5];
}

void sub_1B4D3B69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D3B874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6709(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6710(uint64_t a1)
{
}

void __cpl_dispatch_async_block_invoke_6896(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLSchedulerOSLogDomain_7035()
{
  if (__CPLSchedulerOSLogDomain_onceToken_7036 != -1) {
    dispatch_once(&__CPLSchedulerOSLogDomain_onceToken_7036, &__block_literal_global_577);
  }
  uint64_t v0 = (void *)__CPLSchedulerOSLogDomain_result_7037;
  return v0;
}

void sub_1B4D3FDB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7094(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7095(uint64_t a1)
{
}

void sub_1B4D44B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D4507C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___decentNextSessionDate_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 doubleForKey:@"CPLSecondSessionCoalescingInterval"];
  _decentNextSessionDate_secondSessionCoalescingInterval = v1;

  if (*(double *)&_decentNextSessionDate_secondSessionCoalescingInterval < 0.100000001) {
    _decentNextSessionDate_secondSessionCoalescingInterval = 0x4034000000000000;
  }
}

id __CPLStorageOSLogDomain_7302()
{
  if (__CPLStorageOSLogDomain_onceToken_7304 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_7304, &__block_literal_global_361);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_7305;
  return v0;
}

void __cpl_dispatch_async_block_invoke_7316(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4D4ED94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7346(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7347(uint64_t a1)
{
}

void sub_1B4D4F024(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B4D50994(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t CPLAccountFlagsReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_51:
        *(void *)(a1 + 8) = v26;
      }
      else if (v17 == 2)
      {
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
          *(void *)(a2 + v33) = v34 + 1;
          v32 |= (unint64_t)(v35 & 0x7F) << v30;
          if ((v35 & 0x80) == 0) {
            goto LABEL_53;
          }
          v30 += 7;
          BOOL v14 = v31++ >= 9;
          if (v14)
          {
            LODWORD(v32) = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v32) = 0;
        }
LABEL_55:
        *(_DWORD *)(a1 + 16) = v32;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 4u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_45;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_47:
        *(unsigned char *)(a1 + 20) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1B4D54570(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D54584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7762(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7763(uint64_t a1)
{
}

void sub_1B4D5483C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D54850(_Unwind_Exception *a1)
{
}

void sub_1B4D549F0(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D54A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D54B54(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D54B68(_Unwind_Exception *a1)
{
}

void sub_1B4D54D40(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D54D54(_Unwind_Exception *a1)
{
}

id __CPLStorageOSLogDomain_8027()
{
  if (__CPLStorageOSLogDomain_onceToken_8035 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_8035, &__block_literal_global_537);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_8036;
  return v0;
}

id _ClassesForInitialQueries(uint64_t a1)
{
  if (_ClassesForInitialQueries_onceToken != -1) {
    dispatch_once(&_ClassesForInitialQueries_onceToken, &__block_literal_global_540);
  }
  if ((unint64_t)(a1 - 1) > 2) {
    id v2 = (id)MEMORY[0x1E4F1CBF0];
  }
  else {
    id v2 = (id)*off_1E60A7D78[a1 - 1];
  }
  return v2;
}

void sub_1B4D5CA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1B4D607E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLSessionOSLogDomain_0()
{
  if (__CPLSessionOSLogDomain_onceToken_0 != -1) {
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_0, &__block_literal_global_8339);
  }
  uint64_t v0 = (void *)__CPLSessionOSLogDomain_result_0;
  return v0;
}

id __CPLStorageOSLogDomain_8438()
{
  if (__CPLStorageOSLogDomain_onceToken_8444 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_8444, &__block_literal_global_8445);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_8446;
  return v0;
}

id __CPLStorageOSLogDomain_8605()
{
  if (__CPLStorageOSLogDomain_onceToken_8607 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_8607, &__block_literal_global_113);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_8608;
  return v0;
}

id __CPLStorageOSLogDomain_8796()
{
  if (__CPLStorageOSLogDomain_onceToken_8798 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_8798, &__block_literal_global_170);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_8799;
  return v0;
}

id __CPLProgressOSLogDomain()
{
  if (__CPLProgressOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLProgressOSLogDomain_onceToken, &__block_literal_global_9023);
  }
  uint64_t v0 = (void *)__CPLProgressOSLogDomain_result;
  return v0;
}

void sub_1B4D69F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 176), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_9130(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLDerivativesOSLogDomain()
{
  if (__CPLDerivativesOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLDerivativesOSLogDomain_onceToken, &__block_literal_global_276);
  }
  uint64_t v0 = (void *)__CPLDerivativesOSLogDomain_result;
  return v0;
}

uint64_t __Block_byref_object_copy__9133(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9134(uint64_t a1)
{
}

id _shortDescriptionForArrayOfCPLResourceTypes(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___shortDescriptionForArrayOfCPLResourceTypes_block_invoke;
  v7[3] = &unk_1E60A8228;
  id v8 = v3;
  id v4 = v3;
  [v2 enumerateObjectsUsingBlock:v7];

  double v5 = [v4 componentsJoinedByString:@", "];

  return v5;
}

void ___shortDescriptionForArrayOfCPLResourceTypes_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", [a2 unsignedIntegerValue]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void sub_1B4D6D198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D6D7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D6D9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CPLDefaultConfigurationDictionaryUniquifier_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  BOOL v14 = __Block_byref_object_copy__9387;
  int v15 = __Block_byref_object_dispose__9388;
  id v16 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = CPLDefaultConfigurationDictionaryUniquifier_block_invoke_2;
  id v8 = &unk_1E60AA7E0;
  id v2 = v16;
  id v9 = v2;
  unint64_t v10 = &v11;
  id v3 = v6;
  os_unfair_lock_lock((os_unfair_lock_t)&_mostRecentConfigurationDictionaryLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_mostRecentConfigurationDictionaryLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

void sub_1B4D6E2EC(void *a1)
{
}

void sub_1B4D6E304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9387(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9388(uint64_t a1)
{
}

void CPLDefaultConfigurationDictionaryUniquifier_block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained(&_mostRecentConfigurationDictionary);
  if (WeakRetained != *(id *)(a1 + 32))
  {
    id obj = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v3 = objc_msgSend(WeakRetained, "compare:");
      if (!v3)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
        goto LABEL_10;
      }
      BOOL v4 = v3 == -1;
      id WeakRetained = obj;
      if (!v4) {
        goto LABEL_11;
      }
      double v5 = *(void **)(a1 + 32);
    }
    else
    {
      double v5 = *(void **)(a1 + 32);
    }
    objc_storeWeak(&_mostRecentConfigurationDictionary, v5);
LABEL_10:
    id WeakRetained = obj;
  }
LABEL_11:
}

void __cpl_dispatch_async_block_invoke_9470(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLConfigurationOSLogDomain()
{
  if (__CPLConfigurationOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLConfigurationOSLogDomain_onceToken, &__block_literal_global_185);
  }
  uint64_t v0 = (void *)__CPLConfigurationOSLogDomain_result;
  return v0;
}

id _CPLConfigurationDefaultURL()
{
  if (_CPLConfigurationDefaultURL_onceToken != -1) {
    dispatch_once(&_CPLConfigurationDefaultURL_onceToken, &__block_literal_global_9494);
  }
  uint64_t v0 = (void *)_CPLConfigurationDefaultURL_url;
  return v0;
}

uint64_t CPLRampingRequestResourceReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            uint64_t v21 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id CPLPrimaryScopeIdentifierForCurrentUniverse()
{
  if (CPLPrimaryScopeIdentifierForCurrentUniverse_onceToken != -1) {
    dispatch_once(&CPLPrimaryScopeIdentifierForCurrentUniverse_onceToken, &__block_literal_global_31);
  }
  uint64_t v0 = (void *)CPLPrimaryScopeIdentifierForCurrentUniverse_result;
  return v0;
}

void __CPLPrimaryScopeIdentifierForCurrentUniverse_block_invoke()
{
  CPLCurrentUniverseName();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = CPLPrimaryScopeIdentifierForUniverseName(v2);
  uint64_t v1 = (void *)CPLPrimaryScopeIdentifierForCurrentUniverse_result;
  CPLPrimaryScopeIdentifierForCurrentUniverse_uint64_t result = v0;
}

id CPLCurrentUniverseName()
{
  if (CPLCurrentUniverseName_onceToken != -1) {
    dispatch_once(&CPLCurrentUniverseName_onceToken, &__block_literal_global_25);
  }
  uint64_t v0 = (void *)CPLCurrentUniverseName_result;
  return v0;
}

__CFString *CPLPrimaryScopeIdentifierForUniverseName(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (objc_class *)NSString;
    id v2 = a1;
    uint64_t v3 = (__CFString *)[[v1 alloc] initWithFormat:@"%@%@", @"TestSync-", v2];
  }
  else
  {
    uint64_t v3 = @"PrimarySync";
  }
  return v3;
}

void __CPLCurrentUniverseName_block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v0 = [v2 stringForKey:@"CPLUniverseName"];
  uint64_t v1 = (void *)CPLCurrentUniverseName_result;
  CPLCurrentUniverseName_uint64_t result = v0;
}

id CPLMainScopeIdentifierForApp(void *a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = a1;
  id v6 = (void *)[[v3 alloc] initWithFormat:@"%@%@-%@", @"AppLibrarySync-", v5, v4];

  return v6;
}

id CPLAllLibraryScopeIdentifierPrefixes()
{
  if (CPLAllLibraryScopeIdentifierPrefixes_onceToken != -1) {
    dispatch_once(&CPLAllLibraryScopeIdentifierPrefixes_onceToken, &__block_literal_global_10172);
  }
  uint64_t v0 = (void *)CPLAllLibraryScopeIdentifierPrefixes_result;
  return v0;
}

void __CPLAllLibraryScopeIdentifierPrefixes_block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PrimarySync";
  v2[1] = @"TestSync-";
  v2[2] = @"AppLibrarySync-";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  uint64_t v1 = (void *)CPLAllLibraryScopeIdentifierPrefixes_result;
  CPLAllLibraryScopeIdentifierPrefixes_uint64_t result = v0;
}

__CFString *CPLSharingScopePrefixForScopeWithIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PrimarySync"])
  {
    id v2 = @"SharedSync-";
  }
  else if ([v1 hasPrefix:@"TestSync-"] {
         && (CPLUniverseNameFromMainScopeIdentifier(v1), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  }
  {
    id v4 = (void *)v3;
    id v2 = (__CFString *)[[NSString alloc] initWithFormat:@"%@%@-", @"TestSharedSync-", v3];
  }
  else
  {
    id v2 = @"BogusSharedSync-";
  }

  return v2;
}

id CPLUniverseNameFromMainScopeIdentifier(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"PrimarySync"] & 1) != 0
    || [v1 rangeOfString:@"TestSync-"]
    || (unint64_t v3 = v2, v2 >= [v1 length]))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend(v1, "substringWithRange:", v3, objc_msgSend(v1, "length") - v3);
  }

  return v4;
}

id __CPLStorageOSLogDomain_10525()
{
  if (__CPLStorageOSLogDomain_onceToken_10536 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_10536, &__block_literal_global_10537);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_10538;
  return v0;
}

void sub_1B4D77FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__10557(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10558(uint64_t a1)
{
}

id __CPLStorageOSLogDomain_10610()
{
  if (__CPLStorageOSLogDomain_onceToken_10613 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_10613, &__block_literal_global_10614);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_10615;
  return v0;
}

void sub_1B4D796DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_10794(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLTaskOSLogDomain_10798()
{
  if (__CPLTaskOSLogDomain_onceToken_10834 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_10834, &__block_literal_global_10835);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_10836;
  return v0;
}

void sub_1B4D7AA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10852(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10853(uint64_t a1)
{
}

void sub_1B4D7B968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B4D7C9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B4D7D554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D7D71C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B4D7E5C4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D7E5D8(_Unwind_Exception *a1)
{
}

void sub_1B4D7E744(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D7E758(_Unwind_Exception *a1)
{
}

void sub_1B4D7E93C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4D7E950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLSocialGroupPersonListReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(CPLSocialGroupPerson);
        [(id)a1 addPerson:v17];
        if (!PBReaderPlaceMark() || (CPLSocialGroupPersonReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void __cpl_dispatch_async_block_invoke_11406(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLManagerOSLogDomain_0()
{
  if (__CPLManagerOSLogDomain_onceToken_0 != -1) {
    dispatch_once(&__CPLManagerOSLogDomain_onceToken_0, &__block_literal_global_810);
  }
  uint64_t v0 = (void *)__CPLManagerOSLogDomain_result_0;
  return v0;
}

uint64_t __Block_byref_object_copy__11606(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11607(uint64_t a1)
{
}

void _statusDidChange_11626(uint64_t a1, void *a2)
{
  id v2 = [a2 weakLibraryManager];
  [v2 _statusDidChange];
}

void _configurationDidChange(uint64_t a1, void *a2)
{
  id v2 = [a2 weakLibraryManager];
  [v2 _configurationDidChange];
}

void sub_1B4D8FC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D918DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CPLLibraryIdentifierForApp(void *a1, void *a2)
{
  unint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  uint64_t v7 = (void *)[v6 initWithFormat:@"%@%@]-%@", CPLAppLibraryIdentifierPrefix, v5, v4];

  return v7;
}

__CFString *CPLAppBundleIdentifierForLibraryIdentifier(void *a1)
{
  CPLContainerIdentifierForLibraryIdentifier(a1);
  uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v1 isEqualToString:@"com.apple.GenerativePlayground"])
  {

    uint64_t v1 = @"com.apple.GenerativePlaygroundApp";
  }
  return v1;
}

__CFString *CPLContainerIdentifierForLibraryIdentifier(void *a1)
{
  id v1 = a1;
  if (![v1 hasPrefix:CPLAppLibraryIdentifierPrefix]
    || (uint64_t v2 = [(id)CPLAppLibraryIdentifierPrefix length],
        uint64_t v3 = [v1 length],
        v4 = objc_msgSend(v1, "rangeOfString:options:range:", @"]", 0, v2, v3 - objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length")), v4 == 0x7FFFFFFFFFFFFFFFLL)|| (unint64_t v5 = v4, v4 <= objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length")))
  {
    uint64_t v7 = @"com.apple.mobileslideshow";
  }
  else
  {
    uint64_t v6 = [(id)CPLAppLibraryIdentifierPrefix length];
    objc_msgSend(v1, "substringWithRange:", v6, v5 - objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length"));
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_1B4D949CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4D94EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLIsDynamicResourceFingerprint(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"#"];
}

id __CPLCodingOSLogDomain()
{
  if (__CPLCodingOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLCodingOSLogDomain_onceToken, &__block_literal_global_259);
  }
  uint64_t v0 = (void *)__CPLCodingOSLogDomain_result;
  return v0;
}

void sub_1B4D96D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4D97220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12496(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12497(uint64_t a1)
{
}

void _CPLAllowCrossPlatformBoolDecoding()
{
  if ((_hasSetupCrossPlatformBoolDecoding & 1) == 0)
  {
    _hasSetupCrossPlatformBoolDecoding = 1;
    if ([MEMORY[0x1E4F28DC0] instancesRespondToSelector:sel___setError_])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v0 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v0, OS_LOG_TYPE_DEFAULT, "Enabling cross platform BOOL decoding", buf, 2u);
        }
      }
      uint64_t v1 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v1, sel__cplDecodeBoolForKey_);
      Implementation = method_getImplementation(InstanceMethod);
      TypeEncoding = method_getTypeEncoding(InstanceMethod);
      class_addMethod(v1, sel_cplDecodeBoolForKey_, Implementation, TypeEncoding);
      unint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = class_getInstanceMethod(v5, sel__cplDecodeCharForKey_);
      uint64_t v7 = method_getImplementation(v6);
      char v8 = method_getTypeEncoding(v6);
      class_addMethod(v5, sel_cplDecodeCharForKey_, v7, v8);
    }
    else if (!_CPLSilentLogging)
    {
      unsigned int v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unint64_t v10 = 0;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Can't enable cross platform BOOL decoding", v10, 2u);
      }
    }
  }
}

uint64_t CPLSuggestionMemoryReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_37;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_41:
          uint64_t v32 = 32;
          goto LABEL_46;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_37:
          unsigned int v31 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v28) = v29 + 1;
        v22 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0) {
          goto LABEL_43;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_45:
      uint64_t v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1B4D9E980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13065(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13066(uint64_t a1)
{
}

void sub_1B4D9F270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

id CPLStepAllChanges(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 storage];
  uint64_t v3 = [v1 scopeIdentifier];

  unint64_t v4 = [v2 allChangesWithScopeIdentifier:v3];

  return v4;
}

id CPLStepNew(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 storage];
  uint64_t v3 = [v1 extractionClass];
  unint64_t v4 = [v1 scopeIdentifier];

  unint64_t v5 = [v2 allChangesWithClass:v3 scopeIdentifier:v4 changeType:0];

  return v5;
}

id CPLStepDeleted(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 storage];
  uint64_t v3 = [v1 extractionClass];
  unint64_t v4 = [v1 scopeIdentifier];

  unint64_t v5 = [v2 allChangesWithClass:v3 scopeIdentifier:v4 changeType:1024];

  return v5;
}

id CPLStepNotDeleted(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 storage];
  uint64_t v3 = [v1 extractionClass];
  unint64_t v4 = [v1 scopeIdentifier];

  unint64_t v5 = [v2 allNonDeletedChangesWithClass:v3 scopeIdentifier:v4];

  return v5;
}

uint64_t CPLFaceInstanceReadFrom(char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = &OBJC_IVAR___CPLPersonReference__personIdentifier;
    char v8 = &OBJC_IVAR___CPLPersonReference__personIdentifier;
    unsigned int v9 = &OBJC_IVAR___CPLPersonReference__personIdentifier;
    unint64_t v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v3;
        uint64_t v15 = *(void *)(a2 + v14);
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
        *(void *)(a2 + v14) = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_12;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v19 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v13 = 0;
      }
LABEL_14:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = v7[480];
          uint64_t v23 = *(void **)&a1[v22];
          *(void *)&a1[v22] = v21;

          continue;
        case 2u:
          *(_WORD *)&a1[v8[481]] |= 0x10u;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v10) + v26);
            *(void *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v64 = v9[482];
          goto LABEL_94;
        case 3u:
          *(_WORD *)&a1[v8[481]] |= 0x20u;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v10) + v29);
            *(void *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v64 = 48;
          goto LABEL_94;
        case 4u:
          *(_WORD *)&a1[v8[481]] |= 0x40u;
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v10) + v31);
            *(void *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v64 = 56;
          goto LABEL_94;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_WORD *)&a1[v8[481]] |= 0x100u;
          while (2)
          {
            uint64_t v35 = *v3;
            uint64_t v36 = *(void *)(a2 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v10) + v36);
              *(void *)(a2 + v35) = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                BOOL v18 = v33++ >= 9;
                if (v18)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v34) = 0;
          }
LABEL_70:
          uint64_t v63 = 68;
          goto LABEL_79;
        case 6u:
          v39 = v8;
          uint64_t v40 = v9;
          v41 = v7;
          v42 = PBReaderReadString();
          if (v42) {
            [a1 addRejectedPersonIdentifiers:v42];
          }

          uint64_t v7 = v41;
          unsigned int v9 = v40;
          char v8 = v39;
          continue;
        case 7u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v34 = 0;
          *(_WORD *)&a1[v8[481]] |= 0x200u;
          while (2)
          {
            uint64_t v45 = *v3;
            uint64_t v46 = *(void *)(a2 + v45);
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)(a2 + *v10) + v46);
              *(void *)(a2 + v45) = v47;
              v34 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v18 = v44++ >= 9;
                if (v18)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v34) = 0;
          }
LABEL_74:
          uint64_t v63 = 72;
          goto LABEL_79;
        case 8u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v34 = 0;
          *(_WORD *)&a1[v8[481]] |= 0x80u;
          break;
        case 9u:
          *(_WORD *)&a1[v8[481]] |= 1u;
          uint64_t v55 = *v3;
          unint64_t v56 = *(void *)(a2 + v55);
          if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v10) + v56);
            *(void *)(a2 + v55) = v56 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v64 = 8;
          goto LABEL_94;
        case 0xAu:
          *(_WORD *)&a1[v8[481]] |= 2u;
          uint64_t v57 = *v3;
          unint64_t v58 = *(void *)(a2 + v57);
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v10) + v58);
            *(void *)(a2 + v57) = v58 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v64 = 16;
          goto LABEL_94;
        case 0xBu:
          *(_WORD *)&a1[v8[481]] |= 8u;
          uint64_t v59 = *v3;
          unint64_t v60 = *(void *)(a2 + v59);
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v10) + v60);
            *(void *)(a2 + v59) = v60 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v64 = 32;
          goto LABEL_94;
        case 0xCu:
          *(_WORD *)&a1[v8[481]] |= 4u;
          uint64_t v61 = *v3;
          unint64_t v62 = *(void *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v10) + v62);
            *(void *)(a2 + v61) = v62 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v64 = 24;
LABEL_94:
          *(void *)&a1[v64] = v27;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v51 = *v3;
        uint64_t v52 = *(void *)(a2 + v51);
        unint64_t v53 = v52 + 1;
        if (v52 == -1 || v53 > *(void *)(a2 + *v4)) {
          break;
        }
        char v54 = *(unsigned char *)(*(void *)(a2 + *v10) + v52);
        *(void *)(a2 + v51) = v53;
        v34 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0) {
          goto LABEL_76;
        }
        v49 += 7;
        BOOL v18 = v50++ >= 9;
        if (v18)
        {
          LODWORD(v34) = 0;
          goto LABEL_78;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_76:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v34) = 0;
      }
LABEL_78:
      uint64_t v63 = 64;
LABEL_79:
      *(_DWORD *)&a1[v63] = v34;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __CPLTaskOSLogDomain_13362()
{
  if (__CPLTaskOSLogDomain_onceToken_13364 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_13364, &__block_literal_global_13365);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_13366;
  return v0;
}

void __cpl_dispatch_async_block_invoke_13375(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4DA21B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA26D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA2BA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA31F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13388(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13389(uint64_t a1)
{
}

void sub_1B4DA4058(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA43BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA4BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA75B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13559(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13560(uint64_t a1)
{
}

void sub_1B4DA7B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_13728(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __cpl_dispatch_async_block_invoke_13800(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLTaskOSLogDomain_13804()
{
  if (__CPLTaskOSLogDomain_onceToken_13806 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_13806, &__block_literal_global_89);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_13807;
  return v0;
}

void sub_1B4DA9B34(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4DA9B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA9C5C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4DA9C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DA9E4C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B4DAB510(_Unwind_Exception *a1)
{
}

void sub_1B4DAE6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14340(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14341(uint64_t a1)
{
}

void sub_1B4DB03C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B4DB0DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DB0F7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DB2FD4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    if (!_CPLSilentLogging)
    {
      unint64_t v13 = __CPLArchiverOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v11 allObjects];
        uint64_t v15 = [v14 componentsJoinedByString:@", "];
        LODWORD(buf) = 138543618;
        *(void *)((char *)&buf + 4) = v15;
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v12;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Data for (%{public}@) was corrupt: %@", (uint8_t *)&buf, 0x16u);
      }
    }

    objc_end_catch();
    JUMPOUT(0x1B4DB2F7CLL);
  }
  _Unwind_Resume(a1);
}

id __CPLArchiverOSLogDomain()
{
  if (__CPLArchiverOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLArchiverOSLogDomain_onceToken, &__block_literal_global_14561);
  }
  uint64_t v0 = (void *)__CPLArchiverOSLogDomain_result;
  return v0;
}

id __CPLFileWatcherOSLogDomain()
{
  if (__CPLFileWatcherOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLFileWatcherOSLogDomain_onceToken, &__block_literal_global_14645);
  }
  uint64_t v0 = (void *)__CPLFileWatcherOSLogDomain_result;
  return v0;
}

BOOL CPLSuggestionAssetFlagReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            unint64_t v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isRepresentative;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            uint64_t v19 = 0;
            unint64_t v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isRepresentative;
            goto LABEL_41;
          }
        }
        unint64_t v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isRepresentative;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_41:
        *(unsigned char *)(a1 + *v24) = v19 != 0;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 12) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        unint64_t v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isKeyAsset;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        uint64_t v19 = 0;
        unint64_t v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isKeyAsset;
        goto LABEL_41;
      }
    }
    unint64_t v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isKeyAsset;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __CPLTaskOSLogDomain_14840()
{
  if (__CPLTaskOSLogDomain_onceToken_14849 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_14849, &__block_literal_global_14850);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_14851;
  return v0;
}

void __cpl_dispatch_async_block_invoke_14931(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __Block_byref_object_copy__14943(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14944(uint64_t a1)
{
}

BOOL CPLSuggestionAssetReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_27;
      case 2u:
        uint64_t v19 = objc_alloc_init(CPLSuggestionAssetFlag);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (PBReaderPlaceMark() && CPLSuggestionAssetFlagReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 8;
        goto LABEL_27;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_27:
        uint64_t v19 = *(CPLSuggestionAssetFlag **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x238], 8) = v17;
        goto LABEL_28;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }
}

BOOL CPLMemoryAssetFlagReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 16) |= 0x20u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
            {
              unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isRepresentative;
              goto LABEL_77;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              break;
            }
            v17 += 7;
            BOOL v23 = v18++ > 8;
            if (v23)
            {
              uint64_t v19 = 0;
              unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isRepresentative;
              goto LABEL_80;
            }
          }
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isRepresentative;
          goto LABEL_78;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 16) |= 1u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCurated;
              goto LABEL_77;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v23 = v26++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCurated;
          goto LABEL_78;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 16) |= 0x10u;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isMovieCurated;
              goto LABEL_77;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v23 = v31++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isMovieCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isMovieCurated;
          goto LABEL_78;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 16) |= 8u;
          while (2)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
            {
              unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isKeyAsset;
              goto LABEL_77;
            }
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              BOOL v23 = v36++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isKeyAsset;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isKeyAsset;
          goto LABEL_78;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 16) |= 4u;
          while (2)
          {
            uint64_t v42 = *v3;
            unint64_t v43 = *(void *)(a2 + v42);
            if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
            {
              unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isExtendedCurated;
              goto LABEL_77;
            }
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 1;
            v19 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v23 = v41++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isExtendedCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isExtendedCurated;
          goto LABEL_78;
        case 6u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 16) |= 0x40u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isUserCurated;
              goto LABEL_77;
            }
            char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v19 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              BOOL v23 = v46++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isUserCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isUserCurated;
          goto LABEL_78;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 16) |= 2u;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
          return 0;
      }
      while (1)
      {
        uint64_t v52 = *v3;
        unint64_t v53 = *(void *)(a2 + v52);
        if (v53 == -1 || v53 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
        *(void *)(a2 + v52) = v53 + 1;
        v19 |= (unint64_t)(v54 & 0x7F) << v50;
        if ((v54 & 0x80) == 0)
        {
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCustomUserAsset;
          goto LABEL_78;
        }
        v50 += 7;
        BOOL v23 = v51++ > 8;
        if (v23)
        {
          uint64_t v19 = 0;
          unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCustomUserAsset;
          goto LABEL_80;
        }
      }
      unint64_t v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCustomUserAsset;
LABEL_77:
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_80:
      *(unsigned char *)(a1 + *v24) = v19 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1B4DBCF74(_Unwind_Exception *a1)
{
}

id __CPLSessionOSLogDomain_15527()
{
  if (__CPLSessionOSLogDomain_onceToken_15577 != -1) {
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_15577, &__block_literal_global_210);
  }
  uint64_t v0 = (void *)__CPLSessionOSLogDomain_result_15578;
  return v0;
}

void sub_1B4DC127C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15654(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15655(uint64_t a1)
{
}

void sub_1B4DC25D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 160), 8);
  _Block_object_dispose((const void *)(v12 - 128), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_15925(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLLibraryOSLogDomain()
{
  if (__CPLLibraryOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLLibraryOSLogDomain_onceToken, &__block_literal_global_712);
  }
  uint64_t v0 = (void *)__CPLLibraryOSLogDomain_result;
  return v0;
}

void sub_1B4DC3A28(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id __CPLInitialDownloadOSLogDomain()
{
  if (__CPLInitialDownloadOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLInitialDownloadOSLogDomain_onceToken, &__block_literal_global_721);
  }
  uint64_t v0 = (void *)__CPLInitialDownloadOSLogDomain_result;
  return v0;
}

uint64_t __Block_byref_object_copy__15943(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15944(uint64_t a1)
{
}

void sub_1B4DC58BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id __CPLBackupOSLogDomain()
{
  if (__CPLBackupOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLBackupOSLogDomain_onceToken, &__block_literal_global_718);
  }
  uint64_t v0 = (void *)__CPLBackupOSLogDomain_result;
  return v0;
}

void sub_1B4DC6A74(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DC8604(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DC9E0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DCA3A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id __CPLDataRecoveryOSLogDomain()
{
  if (__CPLDataRecoveryOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLDataRecoveryOSLogDomain_onceToken, &__block_literal_global_715);
  }
  uint64_t v0 = (void *)__CPLDataRecoveryOSLogDomain_result;
  return v0;
}

void sub_1B4DCD138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DCEBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DD146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DD2B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DD4698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DD5614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DD674C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DD7570(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_16338()
{
  if (__CPLTaskOSLogDomain_onceToken_16345 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_16345, &__block_literal_global_157);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_16346;
  return v0;
}

void __cpl_dispatch_async_block_invoke_16404(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4DDB638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16427(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16428(uint64_t a1)
{
}

void __cpl_dispatch_async_block_invoke_16748(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLFeedbackOSLogDomain()
{
  if (__CPLFeedbackOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLFeedbackOSLogDomain_onceToken, &__block_literal_global_16791);
  }
  uint64_t v0 = (void *)__CPLFeedbackOSLogDomain_result;
  return v0;
}

id __CPLStorageOSLogDomain_16994()
{
  if (__CPLStorageOSLogDomain_onceToken_16996 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_16996, &__block_literal_global_16997);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_16998;
  return v0;
}

void sub_1B4DE3A54(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__17026(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17027(uint64_t a1)
{
}

void sub_1B4DE4E18(void *a1)
{
}

void sub_1B4DE4E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DE5174(void *a1)
{
}

void sub_1B4DE518C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_17230(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLSessionOSLogDomain_17407()
{
  if (__CPLSessionOSLogDomain_onceToken_17412 != -1) {
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_17412, &__block_literal_global_171_17413);
  }
  uint64_t v0 = (void *)__CPLSessionOSLogDomain_result_17414;
  return v0;
}

id __CPLFeaturesOSLogDomain()
{
  if (__CPLFeaturesOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLFeaturesOSLogDomain_onceToken, &__block_literal_global_20);
  }
  uint64_t v0 = (void *)__CPLFeaturesOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_17731(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLForceSyncOSLogDomain()
{
  if (__CPLForceSyncOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLForceSyncOSLogDomain_onceToken, &__block_literal_global_17735);
  }
  uint64_t v0 = (void *)__CPLForceSyncOSLogDomain_result;
  return v0;
}

uint64_t __Block_byref_object_copy__17849(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17850(uint64_t a1)
{
}

uint64_t BatteryStateChanged(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -536723200) {
    return +[CPLBatteryMonitor _updateBatteryWithBatteryEntry:a2];
  }
  return result;
}

BOOL _CPLFacesDataAreAlmostIdentical(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  unint64_t v5 = (void *)v4;
  BOOL v6 = (v3 | v4) == 0;
  if (v3 && v4)
  {
    uint64_t v7 = [[CPLFaceAnalysisReference alloc] initWithData:v3];
    char v8 = [[CPLFaceAnalysisReference alloc] initWithData:v5];
    id v9 = v7;
    unint64_t v10 = v8;
    unint64_t v11 = (unint64_t)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    BOOL v6 = !v12 && ([v9 isEqual:v10] & 1) != 0 || ((unint64_t)v9 | v11) == 0;
  }
  return v6;
}

uint64_t __CPLSupportedFeatureVersion()
{
  return 20;
}

BOOL CPLServerFeedbackResponseReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  BOOL v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t CPLRampingResponseReadFrom(void *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(CPLRampingResponseResource);
        [a1 addResponse:v17];
        if (!PBReaderPlaceMark() || (CPLRampingResponseResourceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void __cpl_dispatch_async_block_invoke_18642(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLConfigurationOSLogDomain_18656()
{
  if (__CPLConfigurationOSLogDomain_onceToken_18662 != -1) {
    dispatch_once(&__CPLConfigurationOSLogDomain_onceToken_18662, &__block_literal_global_18663);
  }
  uint64_t v0 = (void *)__CPLConfigurationOSLogDomain_result_18664;
  return v0;
}

id __CPLCheckOSLogDomain()
{
  if (__CPLCheckOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLCheckOSLogDomain_onceToken, &__block_literal_global_19040);
  }
  uint64_t v0 = (void *)__CPLCheckOSLogDomain_result;
  return v0;
}

void sub_1B4DF3360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLUploadCheckRuleUpdatePushRepositoryPriorityWhenOverQuotaFunction(void *a1)
{
  return 1;
}

uint64_t CPLUploadCheckRuleEnsureRelatedRecordIsSharedFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleUpdateRecordTargetDuringResetSyncFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleUpdateRecordTargetForSharingChangeFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleAvoidAccidentalUnshareFunction(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    [a1 dropSharingChangeWithReason:@"avoid accidental unsharing during initial upload"];
  }
  return 1;
}

uint64_t CPLUploadCheckRuleAvoidGeneratingDerivativesFunction(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = a1;
  int v7 = v6;
  if (!a3)
  {
    unsigned int v9 = [v6 change];
    if ([v9 isAssetChange])
    {
      unint64_t v10 = [v9 adjustments];
      if (v10)
      {
      }
      else if (!+[CPLBeforeUploadCheckItem allowsAssetsWithResourcesButNoAdjustments])
      {
        uint64_t v8 = [v7 rejectChangeWithReason:@"unadjusted asset with adjusted resources" error:a4];
        goto LABEL_8;
      }
    }
    uint64_t v8 = 1;
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v8 = [v6 dropGeneratingDerivativesIfPossibleWithRecordOnServer:a3 error:a4];
LABEL_9:

  return v8;
}

uint64_t CPLUploadCheckRuleForwardCompatibilityFunction(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if ([v5 hasChangeType:32])
    {
      int v7 = [v6 realIdentifier];

      if (!v7)
      {
        uint64_t v8 = [v4 change];
        unsigned int v9 = [(id)objc_opt_class() copyPropertyBlockForDirection:1];
        if (v9)
        {
          unint64_t v10 = [v8 propertiesForChangeType:32];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __CPLUploadCheckRuleForwardCompatibilityFunction_block_invoke;
          v12[3] = &unk_1E60AA660;
          id v14 = v9;
          id v13 = v6;
          [v8 cplCopyProperties:v10 fromObject:v8 withCopyBlock:v12];
        }
      }
    }
  }

  return 1;
}

uint64_t __CPLUploadCheckRuleForwardCompatibilityFunction_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  (*(void (**)(void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40)
                                                                                               + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32), a4, a5, a6, 1);
  return 0;
}

uint64_t CPLUploadCheckRuleDontTrustCloudCacheFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleCopyDerivativesFromSourceFunction(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [a1 change];
    [v6 copyDerivativesFromRecordIfPossible:v5];

    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = [a1 rejectChangeWithReason:@"source record for copy does not exist on server" error:a3];
  }

  return v7;
}

uint64_t CPLUploadCheckRuleOnlyUploadAddedResourcesFunction(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [v6 change];
    unsigned int v9 = [v8 onlyAddedResources];
    if ([v9 count])
    {
      if (!_CPLSilentLogging)
      {
        unint64_t v10 = __CPLCheckOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412546;
          id v14 = v7;
          __int16 v15 = 2112;
          uint64_t v16 = v9;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Will append resources to %@:\n%@", (uint8_t *)&v13, 0x16u);
        }
      }
      [v8 markToOnlyUploadNewResources];
    }
    else
    {
      [v6 dropResourceChangeWithReason:@"sparse resources"];
    }

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = [v6 rejectChangeWithReason:@"sparse resources with no record on server" error:a4];
  }

  return v11;
}

uint64_t CPLUploadCheckRuleDropSparseResourcesFunction(void *a1, int a2)
{
  if (a2)
  {
    [a1 dropResourceChangeWithReason:@"sparse resources"];
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "rejectChangeWithReason:error:", @"sparse resources with no record on server");
  }
}

uint64_t CPLUploadCheckRuleFullRecordAlreadyOnServerFunction(void *a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = [a1 change];
    [v2 markAsSparseFullChange];
  }
  return 1;
}

void sub_1B4DF61F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DF6350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DF64B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19265(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19266(uint64_t a1)
{
}

void sub_1B4DF6E44(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4DF6E58(_Unwind_Exception *a1)
{
}

id __CPLStorageOSLogDomain_19384()
{
  if (__CPLStorageOSLogDomain_onceToken_19386 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_19386, &__block_literal_global_19387);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_19388;
  return v0;
}

void sub_1B4DF71BC(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4DF71D0(_Unwind_Exception *a1)
{
}

void sub_1B4DF7D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19405(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19406(uint64_t a1)
{
}

void sub_1B4DF80F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DF86D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DF8D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DF903C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4DF9DD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4DFA4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1B4DFC0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

id __CPLSyncOSLogDomain()
{
  if (__CPLSyncOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLSyncOSLogDomain_onceToken, &__block_literal_global_651);
  }
  uint64_t v0 = (void *)__CPLSyncOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_19894(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4DFDD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

uint64_t __Block_byref_object_copy__19911(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19912(uint64_t a1)
{
}

void sub_1B4E00068(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B4E00B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __CPLForceSyncOSLogDomain_20044()
{
  if (__CPLForceSyncOSLogDomain_onceToken_20053 != -1) {
    dispatch_once(&__CPLForceSyncOSLogDomain_onceToken_20053, &__block_literal_global_657);
  }
  uint64_t v0 = (void *)__CPLForceSyncOSLogDomain_result_20054;
  return v0;
}

id _willDownloadInBackgroundErrorForTask(void *a1)
{
  uint64_t v1 = [a1 scopeIdentifiers];
  uint64_t v2 = [v1 componentsJoinedByString:@", "];
  unint64_t v3 = +[CPLErrors cplErrorWithCode:10, @"Will download %@ in background", v2 description];

  return v3;
}

void sub_1B4E01DC8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4E01DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4E02060(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4E02074(_Unwind_Exception *a1)
{
}

void sub_1B4E0221C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4E02494(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B4E024A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4E04DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4E04DB8(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exc_buf);
}

void sub_1B4E04DD8()
{
}

void sub_1B4E04DF0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1B4E04DFCLL);
}

id __CPLLastSyncErrorOSLogDomain()
{
  if (__CPLLastSyncErrorOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLLastSyncErrorOSLogDomain_onceToken, &__block_literal_global_654);
  }
  uint64_t v0 = (void *)__CPLLastSyncErrorOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_20474(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLTaskOSLogDomain_20476()
{
  if (__CPLTaskOSLogDomain_onceToken_20518 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_20518, &__block_literal_global_130);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_20519;
  return v0;
}

void sub_1B4E08BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20529(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20530(uint64_t a1)
{
}

id __CPLStorageOSLogDomain_20673()
{
  if (__CPLStorageOSLogDomain_onceToken_20677 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_20677, &__block_literal_global_20678);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_20679;
  return v0;
}

id __CPLSystemMonitorOSLogDomain()
{
  if (__CPLSystemMonitorOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLSystemMonitorOSLogDomain_onceToken, &__block_literal_global_483);
  }
  uint64_t v0 = (void *)__CPLSystemMonitorOSLogDomain_result;
  return v0;
}

void __cpl_dispatch_async_block_invoke_20859(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

double _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(void *a1)
{
  uint64_t v1 = a1;
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v1, @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);

  double result = (double)(unint64_t)AppIntegerValue;
  if (!keyExistsAndHasValidFormat) {
    return 0.0;
  }
  return result;
}

id _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(void *a1)
{
  uint64_t v1 = a1;
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(v1, @"com.apple.mobileslideshow");

  return v2;
}

uint64_t _unlimitedSyncOverCellularDidChange(uint64_t a1, void *a2)
{
  return [a2 _permanentDataOverrideHasChanged];
}

void sub_1B4E0FAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __Block_byref_object_copy__21003(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21004(uint64_t a1)
{
}

void sub_1B4E112A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_21324()
{
  if (__CPLStorageOSLogDomain_onceToken_21329 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_21329, &__block_literal_global_21330);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_21331;
  return v0;
}

void sub_1B4E125C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21337(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21338(uint64_t a1)
{
}

id __CPLStorageOSLogDomain_21571()
{
  if (__CPLStorageOSLogDomain_onceToken_21579 != -1) {
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_21579, &__block_literal_global_21580);
  }
  uint64_t v0 = (void *)__CPLStorageOSLogDomain_result_21581;
  return v0;
}

uint64_t CPLMemoryAssetListReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(CPLMemoryAsset);
        [(id)a1 addAsset:v17];
        if (!PBReaderPlaceMark() || !CPLMemoryAssetReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __CPLSessionOSLogDomain_21938()
{
  if (__CPLSessionOSLogDomain_onceToken_21940 != -1) {
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_21940, &__block_literal_global_21941);
  }
  uint64_t v0 = (void *)__CPLSessionOSLogDomain_result_21942;
  return v0;
}

void __cpl_dispatch_async_block_invoke_22094(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __CPLTaskOSLogDomain_22279()
{
  if (__CPLTaskOSLogDomain_onceToken_22291 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_22291, &__block_literal_global_264);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_22292;
  return v0;
}

void __cpl_dispatch_async_block_invoke_22296(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4E1A430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22351(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22352(uint64_t a1)
{
}

void sub_1B4E1AE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B4E1B870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4E1D17C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B4E1E6F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B4E1FA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4E20768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t CPLServerFeedbackMessageReadFrom(void *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v10) = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 & 0x7FFF8) == 8)
      {
        uint64_t v17 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
        [a1 addKeysAndValues:v17];
        if (!PBReaderPlaceMark() || !CPLServerFeedbackKeyAndValueReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1B4E24E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22651(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22652(uint64_t a1)
{
}

uint64_t CPLSuggestionRecordListReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(CPLSuggestionAsset);
        [(id)a1 addAsset:v17];
        if (PBReaderPlaceMark() && CPLSuggestionAssetReadFrom((uint64_t)v17, a2)) {
          goto LABEL_36;
        }
        goto LABEL_43;
      case 2u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_40:
        *(_DWORD *)(a1 + 32) = v21;
        goto LABEL_41;
      case 3u:
        uint64_t v17 = objc_alloc_init(CPLSuggestionPerson);
        [(id)a1 addPerson:v17];
        if (!PBReaderPlaceMark() || (CPLSuggestionPersonReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_36;
      case 4u:
        uint64_t v17 = objc_alloc_init(CPLSuggestionMemory);
        [(id)a1 addMemory:v17];
        if PBReaderPlaceMark() && (CPLSuggestionMemoryReadFrom((uint64_t)v17, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_43:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_41;
    }
  }
}

void sub_1B4E27618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLPlatformOSLogDomain()
{
  if (__CPLPlatformOSLogDomain_onceToken != -1) {
    dispatch_once(&__CPLPlatformOSLogDomain_onceToken, &__block_literal_global_22905);
  }
  uint64_t v0 = (void *)__CPLPlatformOSLogDomain_result;
  return v0;
}

uint64_t CPLServerFeedbackRequestReadFrom(void *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v10) = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 & 0x7FFF8) == 8)
      {
        uint64_t v17 = objc_alloc_init(CPLServerFeedbackMessage);
        [a1 addMessages:v17];
        if (!PBReaderPlaceMark() || (CPLServerFeedbackMessageReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __CPLTaskOSLogDomain_23358()
{
  if (__CPLTaskOSLogDomain_onceToken_23366 != -1) {
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_23366, &__block_literal_global_384);
  }
  uint64_t v0 = (void *)__CPLTaskOSLogDomain_result_23367;
  return v0;
}

void sub_1B4E2AC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23405(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23406(uint64_t a1)
{
}

void __cpl_dispatch_async_block_invoke_23414(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4E2E1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B4E2FBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1B4E2FE10()
{
}

void sub_1B4E31C88(_Unwind_Exception *a1)
{
}

id CPLCopyDefaultSerialQueueAttributes()
{
  if (CPLCopyDefaultSerialQueueAttributes_onceToken != -1) {
    dispatch_once(&CPLCopyDefaultSerialQueueAttributes_onceToken, &__block_literal_global_23622);
  }
  uint64_t v0 = (void *)CPLCopyDefaultSerialQueueAttributes_attr;
  return v0;
}

uint64_t __CPLCopyDefaultSerialQueueAttributes_block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  uint64_t v1 = CPLCopyDefaultSerialQueueAttributes_attr;
  CPLCopyDefaultSerialQueueAttributes_attr = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t CPLIsSharedLibraryFeatureEnabled()
{
  return (isFeatureEnabled != 0) | ((overridesFeatureFlag & 1) == 0);
}

uint64_t CPLForceSharedLibraryFeatureEnabled(uint64_t result)
{
  isFeatureEnabled = result;
  overridesFeatureFlag = 1;
  return result;
}

uint64_t CPLAllowsInactiveSharedLibraryScope()
{
  if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1) {
    dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_2_23628);
  }
  return CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope;
}

void __CPLAllowsInactiveSharedLibraryScope_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope = [v0 BOOLForKey:@"CPLAllowInactiveSharedLibrary"];
}

void CPLEnableUnsupportedScopesAlert()
{
  _warnAboutUnsupportedScopes = 1;
}

uint64_t CPLDontWarnAboutUnsupportedScopes()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v1 = [v0 BOOLForKey:@"CPLDontWarnAboutUnsupportedScopes"];

  return v1 & 1 | ((_warnAboutUnsupportedScopes & 1) == 0);
}

uint64_t _CPLShouldValidateStableHash()
{
  if (_CPLShouldValidateStableHash_onceToken != -1) {
    dispatch_once(&_CPLShouldValidateStableHash_onceToken, &__block_literal_global_8_23638);
  }
  return _CPLShouldValidateStableHash_result;
}

id _CPLArrayFromColonSeparatedList(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  unint64_t v3 = [v1 componentsSeparatedByString:@":"];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", v5, (void)v13);
        if ([v11 length]) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

uint64_t CPLEnableWorkaroundFor101242629()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v1 = [v0 objectForKey:@"CPLDisableWorkaroundFor101242629"];

  if (v1 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v2 = [v1 BOOLValue] ^ 1;
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

__CFString *_CPLShortDescriptionForFaceCropType(unint64_t a1)
{
  if (a1 < 9 && ((0x117u >> a1) & 1) != 0) {
    id v1 = off_1E60AB920[a1];
  }
  else {
    id v1 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld??", a1);
  }
  return v1;
}

uint64_t CPLSuggestionPersonReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_37;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_41:
          uint64_t v32 = 32;
          goto LABEL_46;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_37:
          unsigned int v31 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x370], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v2_Block_object_dispose(&STACK[0x370], 8) = v29 + 1;
        v22 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0) {
          goto LABEL_43;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_45:
      uint64_t v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
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

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1F412C440]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1F412C478]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1F412C488]();
}

uint64_t MMCSSignatureIsValid()
{
  return MEMORY[0x1F412C490]();
}

uint64_t MMCSSignatureIsValidV2()
{
  return MEMORY[0x1F412C498]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1F40E70B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1F40E70C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1F40E70C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1F40E7160]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1F40E71E8](namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
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

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1F4181538](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x1F417A380]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1F417A388]();
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1F41815C0](v);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
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

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x1F417F410]();
}

uint64_t network_usage_policy_destroy_client()
{
  return MEMORY[0x1F417F418]();
}

uint64_t network_usage_policy_get_bundle_from_policy()
{
  return MEMORY[0x1F417F428]();
}

uint64_t network_usage_policy_get_cell_data_allowed_from_policy()
{
  return MEMORY[0x1F417F430]();
}

uint64_t network_usage_policy_get_for_bundle()
{
  return MEMORY[0x1F417F440]();
}

uint64_t network_usage_policy_set_changed_handler()
{
  return MEMORY[0x1F417F448]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1F40F3960](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1F40F3970](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39A8]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1F40F3A00](path, *(void *)&interface_type);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1F4181A78](a1, a2);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1F4181A88](obj);
}

void object_setIvar(id obj, Ivar ivar, id value)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1F40CD3C8]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1F40CE710]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}