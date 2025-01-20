uint64_t ATXCacheFileWrite(int a1, void *a2)
{
  id v3;
  id v4;
  ssize_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  void *v12;

  v3 = a2;
  if (!v3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL ATXCacheFileWrite(int, NSData *__strong _Nonnull)");
    [v11 handleFailureInFunction:v12, @"ATXCacheFile.m", 147, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];
  }
  if (flock(a1, 2) != -1)
  {
    if (ftruncate(a1, 0) == -1)
    {
      v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ATXCacheFileWriteChunks_cold_2();
      }
    }
    else
    {
      v4 = v3;
      v5 = pwrite(a1, (const void *)[v4 bytes], objc_msgSend(v4, "length"), 0);
      if (v5 == -1)
      {
        v9 = __atxlog_handle_default();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          ATXCacheFileWrite_cold_3();
        }
      }
      else
      {
        v6 = v5;
        if (v5 == [v4 length])
        {
          v7 = 1;
LABEL_18:
          flock(a1, 8);
          goto LABEL_19;
        }
        v9 = __atxlog_handle_default();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          ATXCacheFileWrite_cold_4(v4, v6, v9);
        }
      }
    }

    v7 = 0;
    goto LABEL_18;
  }
  v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    ATXCacheFileWriteChunks_cold_1();
  }

  v7 = 0;
LABEL_19:

  return v7;
}

void ATXCacheFileRead(int a1, void **a2, double *a3, double a4)
{
  if (a3) {
    *a3 = 1.79769313e308;
  }
  if (a2)
  {
    v8 = *a2;
    *a2 = 0;
  }
  if (flock(a1, 1) != -1)
  {
    lseek(a1, 0, 0);
    memset(&v23, 0, sizeof(v23));
    if (fstat(a1, &v23) < 0)
    {
      v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        ATXCacheFileRead_cold_2();
      }
    }
    else
    {
      if (a4 < 0.0) {
        goto LABEL_16;
      }
      v9 = objc_opt_new();
      [v9 timeIntervalSince1970];
      double v11 = v10;

      double tv_sec = (double)v23.st_mtimespec.tv_sec;
      if (a3) {
        *a3 = v11 - tv_sec;
      }
      if (v11 - a4 <= tv_sec)
      {
LABEL_16:
        int64_t st_size = v23.st_size;
        if (v23.st_size)
        {
          if (a2)
          {
            v16 = malloc_type_malloc(v23.st_size, 0x74756E11uLL);
            if (v16)
            {
              v17 = v16;
              ssize_t v18 = read(a1, v16, st_size);
              if (v18 == -1)
              {
                v19 = __atxlog_handle_default();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                  ATXCacheFileRead_cold_6();
                }
              }
              else
              {
                if (v18 >= st_size)
                {
                  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v17 length:st_size];
                  v21 = *a2;
                  *a2 = (void *)v20;

                  goto LABEL_32;
                }
                v19 = __atxlog_handle_default();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                  ATXCacheFileRead_cold_7();
                }
              }

              free(v17);
LABEL_32:
              flock(a1, 8);
              return;
            }
            v13 = __atxlog_handle_default();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              ATXCacheFileRead_cold_5();
            }
          }
          else
          {
            v13 = __atxlog_handle_default();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
              ATXCacheFileRead_cold_4(v13);
            }
          }
        }
        else
        {
          v13 = __atxlog_handle_default();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            ATXCacheFileRead_cold_3(v13);
          }
        }
      }
      else
      {
        v13 = __atxlog_handle_default();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_1D0F2B000, v13, OS_LOG_TYPE_INFO, "ATXCache is no longer valid -- skipping read", v22, 2u);
        }
      }
    }

    goto LABEL_32;
  }
  v14 = __atxlog_handle_default();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    ATXCacheFileWriteChunks_cold_1();
  }
}

void sub_1D0F2DE08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F2DE94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F2DF10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ATXCacheFileJoinChunks(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"NSData * _Nonnull ATXCacheFileJoinChunks(NSArray<NSData *> *__strong _Nonnull)"];
    [v16 handleFailureInFunction:v17, @"ATXCacheFile.m", 48, @"Invalid parameter not satisfying: %@", @"chunks" file lineNumber description];
  }
  v2 = headerForChunks(v1);
  uint64_t v3 = [v2 length];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 += [*(id *)(*((void *)&v22 + 1) + 8 * i) length];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v3];
  [v9 appendData:v2];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 appendData:*(void *)(*((void *)&v18 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  return v9;
}

id headerForChunks(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = 8 * [v1 count] + 8;
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v2];
  id v4 = (_DWORD *)[v3 mutableBytes];
  *id v4 = 197626155;
  v4[1] = [v1 count];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = v4 + 2;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "length", (void)v14);
        uint64_t v12 = v8 + 2;
        _DWORD *v8 = v2;
        v8[1] = v11;
        LODWORD(v2) = v2 + v11;
        v8 += 2;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v8 = v12;
    }
    while (v7);
  }

  return v3;
}

id ATXCacheFileSplitChunks(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 length];
  if (v2 < 8) {
    goto LABEL_13;
  }
  unint64_t v3 = v2;
  id v4 = v1;
  id v5 = (_DWORD *)[v4 bytes];
  if (*v5 != 197626155)
  {
    uint64_t v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      ATXCacheFileSplitChunks_cold_1(v13);
    }

    goto LABEL_13;
  }
  uint64_t v6 = v5;
  uint64_t v7 = v5[1];
  if (v3 < 4 * (unint64_t)(2 * v7 + 2))
  {
LABEL_13:
    id v12 = 0;
    goto LABEL_14;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  if (v7)
  {
    uint64_t v9 = v6 + 3;
    while (*v9 + (unint64_t)*(v9 - 1) <= v3)
    {
      uint64_t v10 = objc_msgSend(v4, "subdataWithRange:");
      if (!v10) {
        break;
      }
      int v11 = (void *)v10;
      v9 += 2;
      [v8 addObject:v10];

      LODWORD(v7) = v7 - 1;
      if (!v7) {
        goto LABEL_9;
      }
    }
    id v12 = 0;
  }
  else
  {
LABEL_9:
    id v12 = v8;
  }

LABEL_14:
  return v12;
}

uint64_t ATXCacheFileWriteChunks(int a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL ATXCacheFileWriteChunks(int, NSArray<NSData *> *__strong _Nonnull)");
    [v35 handleFailureInFunction:v36, @"ATXCacheFile.m", 98, @"Invalid parameter not satisfying: %@", @"chunks" file lineNumber description];
  }
  int v42 = a1;
  id v4 = headerForChunks(v3);
  [v3 count];
  v41 = &v37;
  MEMORY[0x1F4188790]();
  uint64_t v39 = v5;
  uint64_t v6 = (iovec *)(&v37 - 2 * v5);
  id v7 = v4;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];
  v6->iov_base = (void *)v8;
  v6->iov_len = v9;
  id v40 = v7;
  uint64_t v10 = [v7 length];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
  v38 = v6;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
    p_iov_len = &v6->iov_len;
    int v16 = 1;
    do
    {
      uint64_t v17 = 0;
      int v18 = v16;
      uint64_t v19 = (uint64_t *)&p_iov_len[2 * v16];
      do
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        id v20 = *(id *)(*((void *)&v43 + 1) + 8 * v17);
        uint64_t v21 = [v20 bytes];
        uint64_t v22 = [v20 length];
        *(v19 - 1) = v21;
        uint64_t *v19 = v22;
        v10 += [v20 length];
        ++v17;
        v19 += 2;
      }
      while (v13 != v17);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
      int v16 = v18 + v17;
    }
    while (v13);
  }

  int v23 = v42;
  if (flock(v42, 2) != -1)
  {
    if (ftruncate(v23, 0) == -1)
    {
      v26 = __atxlog_handle_default();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        ATXCacheFileWriteChunks_cold_2();
      }
    }
    else
    {
      off_t v24 = lseek(v23, 0, 0);
      if (v24)
      {
        uint64_t v25 = v24;
        if (v24 == -1)
        {
          v26 = __atxlog_handle_default();
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          uint64_t v28 = v40;
          if (v27) {
            ATXCacheFileWriteChunks_cold_4();
          }
        }
        else
        {
          v26 = __atxlog_handle_default();
          BOOL v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          uint64_t v28 = v40;
          if (v32) {
            ATXCacheFileWriteChunks_cold_3(v25, v26, v33);
          }
        }
        goto LABEL_27;
      }
      ssize_t v31 = writev(v23, v38, v39);
      if (v31 == -1)
      {
        v26 = __atxlog_handle_default();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          ATXCacheFileWriteChunks_cold_5();
        }
      }
      else
      {
        if (v31 == v10)
        {
          uint64_t v30 = 1;
          uint64_t v28 = v40;
LABEL_28:
          flock(v23, 8);
          goto LABEL_29;
        }
        v26 = __atxlog_handle_default();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          ATXCacheFileWriteChunks_cold_6();
        }
      }
    }
    uint64_t v28 = v40;
LABEL_27:

    uint64_t v30 = 0;
    goto LABEL_28;
  }
  v29 = __atxlog_handle_default();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    ATXCacheFileWriteChunks_cold_1();
  }

  uint64_t v30 = 0;
  uint64_t v28 = v40;
LABEL_29:

  return v30;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1D0F2EE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t shouldDenyConnectionForCurrentProcess()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];
  unint64_t v2 = [v1 lowercaseString];

  if ([v2 isEqualToString:@"duetexpertd"]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"atxtool"] ^ 1;
  }

  return v3;
}

id prepareXPCConnection()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.proactive.AppPredictionIntentsHelperService"];
  id v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F27210F8];
  unint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v1 setClasses:v2 forSelector:sel_titleForIntent_withReply_ argumentIndex:0 ofReply:0];

  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v1 setClasses:v3 forSelector:sel_titleForIntentNoLocalization_withReply_ argumentIndex:0 ofReply:0];

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v1 setClasses:v4 forSelector:sel_subtitleForIntent_withReply_ argumentIndex:0 ofReply:0];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v1 setClasses:v5 forSelector:sel_indexingHashForIntent_withReply_ argumentIndex:0 ofReply:0];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v1 setClasses:v6 forSelector:sel_eligibleForWidgetsForIntent_withReply_ argumentIndex:0 ofReply:0];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v1 setClasses:v7 forSelector:sel_supportsBackgroundExecutionForIntent_withReply_ argumentIndex:0 ofReply:0];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v1 setClasses:v8 forSelector:sel_localizedStringForLinkString_withReply_ argumentIndex:0 ofReply:0];

  [v0 setRemoteObjectInterface:v1];
  [v0 resume];

  return v0;
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

void sub_1D0F2F488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0F2F790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0F2FA64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D0F2FCEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D0F2FFB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D0F30304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0F305D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0F3086C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D0F30FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D0F3105C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F310D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXDetailedActionLoggingEnabled()
{
  if (ATXDetailedActionLoggingEnabled_onceToken != -1) {
    dispatch_once(&ATXDetailedActionLoggingEnabled_onceToken, &__block_literal_global_1);
  }
  return ATXDetailedActionLoggingEnabled_enabled;
}

void __ATXDetailedActionLoggingEnabled_block_invoke()
{
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
    ATXDetailedActionLoggingEnabled_enabled = [v0 BOOLForKey:@"detailedActionLogging"];
  }
  else
  {
    ATXDetailedActionLoggingEnabled_enabled = 0;
  }
}

__CFString *ATXSpecialWidgetKindFiles()
{
  return @"SBHSpecialAvocadoDescriptorKindFiles";
}

__CFString *ATXSpecialWidgetKindShortcutsSingle()
{
  return @"SBHSpecialAvocadoDescriptorKindShortcutsSingle";
}

__CFString *ATXSpecialWidgetKindShortcutsFolder()
{
  return @"SBHSpecialAvocadoDescriptorKindShortcutsFolder";
}

__CFString *ATXSpecialWidgetKindAppPredictions()
{
  return @"SBHSpecialAvocadoDescriptorKindAppPredictions";
}

__CFString *ATXSpecialWidgetKindSiriSuggestions()
{
  return @"SBHSpecialAvocadoDescriptorKindSiri";
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

__CFString *ATXMemoryPressureTypeToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E68A3740[a1];
  }
}

double ATXBucketDoubleBetweenValues(double result, double a2, double a3)
{
  if (a3 > result) {
    result = a3;
  }
  if (a3 >= a2) {
    return a2;
  }
  return result;
}

uint64_t ATXBucketUInt32BetweenValuesWithRounding(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (a4 < a2)
  {
    a2 = a1;
    if (a4 > a1) {
      return a4 / a3 * a3;
    }
  }
  return a2;
}

id ATXLocalizationNotNeeded(void *a1)
{
  id v1 = a1;
  return v1;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t ATXPBPersonaSessionEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
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
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 28) |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + 8) = v23;
      }
      else if (v18 == 2)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0) {
            goto LABEL_35;
          }
          v24 += 7;
          BOOL v15 = v25++ >= 9;
          if (v15)
          {
            uint64_t v26 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_37:
        *(unsigned char *)(a1 + 24) = v26 != 0;
      }
      else if (v18 == 1)
      {
        uint64_t v19 = PBReaderReadString();
        id v20 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v19;
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

void sub_1D0F35FA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)__atxlog_handle_default_log;
  return v0;
}

uint64_t ____atxlog_handle_default_block_invoke()
{
  __atxlog_handle_default_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "general");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1) {
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)__atxlog_handle_xpc_log;
  return v0;
}

uint64_t ____atxlog_handle_xpc_block_invoke()
{
  __atxlog_handle_xpc_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "xpc");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_7);
  }
  id v0 = (void *)__atxlog_handle_heuristic_log;
  return v0;
}

uint64_t ____atxlog_handle_heuristic_block_invoke()
{
  __atxlog_handle_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "heuristic");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_10);
  }
  id v0 = (void *)__atxlog_handle_notifications_log;
  return v0;
}

uint64_t ____atxlog_handle_notifications_block_invoke()
{
  __atxlog_handle_notifications_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notifications");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1) {
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_13);
  }
  id v0 = (void *)__atxlog_handle_pmm_log;
  return v0;
}

uint64_t ____atxlog_handle_pmm_block_invoke()
{
  __atxlog_handle_pmm_log = (uint64_t)os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1) {
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_17);
  }
  id v0 = (void *)__atxlog_handle_dailyroutines_log;
  return v0;
}

uint64_t ____atxlog_handle_dailyroutines_block_invoke()
{
  __atxlog_handle_dailyroutines_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1) {
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_20);
  }
  id v0 = (void *)__atxlog_handle_feedback_log;
  return v0;
}

uint64_t ____atxlog_handle_feedback_block_invoke()
{
  __atxlog_handle_feedback_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "feedback");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1) {
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_23);
  }
  id v0 = (void *)__atxlog_handle_modes_log;
  return v0;
}

uint64_t ____atxlog_handle_modes_block_invoke()
{
  __atxlog_handle_modes_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "modes");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1) {
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_26);
  }
  id v0 = (void *)__atxlog_handle_hero_log;
  return v0;
}

uint64_t ____atxlog_handle_hero_block_invoke()
{
  __atxlog_handle_hero_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "hero");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_29);
  }
  id v0 = (void *)__atxlog_handle_deletions_log;
  return v0;
}

uint64_t ____atxlog_handle_deletions_block_invoke()
{
  __atxlog_handle_deletions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "deletions");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1) {
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_32);
  }
  id v0 = (void *)__atxlog_handle_gi_log;
  return v0;
}

uint64_t ____atxlog_handle_gi_block_invoke()
{
  __atxlog_handle_gi_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "information");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1) {
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_35);
  }
  id v0 = (void *)__atxlog_handle_timeline_log;
  return v0;
}

uint64_t ____atxlog_handle_timeline_block_invoke()
{
  __atxlog_handle_timeline_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "timeline");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_38);
  }
  id v0 = (void *)__atxlog_handle_relevant_shortcut_log;
  return v0;
}

uint64_t ____atxlog_handle_relevant_shortcut_block_invoke()
{
  __atxlog_handle_relevant_shortcut_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_41);
  }
  id v0 = (void *)__atxlog_handle_relevance_model_log;
  return v0;
}

uint64_t ____atxlog_handle_relevance_model_block_invoke()
{
  __atxlog_handle_relevance_model_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1) {
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_44);
  }
  id v0 = (void *)__atxlog_handle_watch_log;
  return v0;
}

uint64_t ____atxlog_handle_watch_block_invoke()
{
  __atxlog_handle_watch_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "watch");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1) {
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_47);
  }
  id v0 = (void *)__atxlog_handle_ui_log;
  return v0;
}

uint64_t ____atxlog_handle_ui_block_invoke()
{
  __atxlog_handle_ui_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "UI");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_50);
  }
  id v0 = (void *)__atxlog_handle_blending_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_block_invoke()
{
  __atxlog_handle_blending_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_53);
  }
  id v0 = (void *)__atxlog_handle_blending_internal_cache_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_internal_cache_block_invoke()
{
  __atxlog_handle_blending_internal_cache_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_56);
  }
  id v0 = (void *)__atxlog_handle_blending_ecosystem_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_ecosystem_block_invoke()
{
  __atxlog_handle_blending_ecosystem_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_59);
  }
  id v0 = (void *)__atxlog_handle_home_screen_log;
  return v0;
}

uint64_t ____atxlog_handle_home_screen_block_invoke()
{
  __atxlog_handle_home_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "homescreen");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1) {
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_62);
  }
  id v0 = (void *)__atxlog_handle_sleep_schedule_log;
  return v0;
}

uint64_t ____atxlog_handle_sleep_schedule_block_invoke()
{
  __atxlog_handle_sleep_schedule_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_65);
  }
  id v0 = (void *)__atxlog_handle_lock_screen_log;
  return v0;
}

uint64_t ____atxlog_handle_lock_screen_block_invoke()
{
  __atxlog_handle_lock_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1) {
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_68);
  }
  id v0 = (void *)__atxlog_handle_anchor_log;
  return v0;
}

uint64_t ____atxlog_handle_anchor_block_invoke()
{
  __atxlog_handle_anchor_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "anchor");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_71);
  }
  id v0 = (void *)__atxlog_handle_app_prediction_log;
  return v0;
}

uint64_t ____atxlog_handle_app_prediction_block_invoke()
{
  __atxlog_handle_app_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_74);
  }
  id v0 = (void *)__atxlog_handle_action_prediction_log;
  return v0;
}

uint64_t ____atxlog_handle_action_prediction_block_invoke()
{
  __atxlog_handle_action_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_77);
  }
  id v0 = (void *)__atxlog_handle_app_library_log;
  return v0;
}

uint64_t ____atxlog_handle_app_library_block_invoke()
{
  __atxlog_handle_app_library_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_library");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_80);
  }
  id v0 = (void *)__atxlog_handle_app_install_log;
  return v0;
}

uint64_t ____atxlog_handle_app_install_block_invoke()
{
  __atxlog_handle_app_install_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_install");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1) {
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_83);
  }
  id v0 = (void *)__atxlog_handle_backup_log;
  return v0;
}

uint64_t ____atxlog_handle_backup_block_invoke()
{
  __atxlog_handle_backup_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "backup");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1) {
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_86);
  }
  id v0 = (void *)__atxlog_handle_metrics_log;
  return v0;
}

uint64_t ____atxlog_handle_metrics_block_invoke()
{
  __atxlog_handle_metrics_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "metrics");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1) {
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_89);
  }
  id v0 = (void *)__atxlog_handle_trial_assets_log;
  return v0;
}

uint64_t ____atxlog_handle_trial_assets_block_invoke()
{
  __atxlog_handle_trial_assets_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_92);
  }
  id v0 = (void *)__atxlog_handle_notification_management_log;
  return v0;
}

uint64_t ____atxlog_handle_notification_management_block_invoke()
{
  __atxlog_handle_notification_management_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_management");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_95);
  }
  id v0 = (void *)__atxlog_handle_contextual_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_contextual_actions_block_invoke()
{
  __atxlog_handle_contextual_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1) {
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_98);
  }
  id v0 = (void *)__atxlog_handle_intents_helper_log;
  return v0;
}

uint64_t ____atxlog_handle_intents_helper_block_invoke()
{
  __atxlog_handle_intents_helper_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_101);
  }
  id v0 = (void *)__atxlog_handle_context_heuristic_log;
  return v0;
}

uint64_t ____atxlog_handle_context_heuristic_block_invoke()
{
  __atxlog_handle_context_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1) {
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_104);
  }
  id v0 = (void *)__atxlog_handle_zkw_hide_log;
  return v0;
}

uint64_t ____atxlog_handle_zkw_hide_block_invoke()
{
  __atxlog_handle_zkw_hide_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_107);
  }
  id v0 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  return v0;
}

uint64_t ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1) {
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_110);
  }
  id v0 = (void *)__atxlog_handle_time_intelligence_log;
  return v0;
}

uint64_t ____atxlog_handle_time_intelligence_block_invoke()
{
  __atxlog_handle_time_intelligence_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "time");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_113);
  }
  id v0 = (void *)__atxlog_handle_contextual_engine_log;
  return v0;
}

uint64_t ____atxlog_handle_contextual_engine_block_invoke()
{
  __atxlog_handle_contextual_engine_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1) {
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_116);
  }
  id v0 = (void *)__atxlog_handle_usage_insights_log;
  return v0;
}

uint64_t ____atxlog_handle_usage_insights_block_invoke()
{
  __atxlog_handle_usage_insights_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_119);
  }
  id v0 = (void *)__atxlog_handle_notification_categorization_log;
  return v0;
}

uint64_t ____atxlog_handle_notification_categorization_block_invoke()
{
  __atxlog_handle_notification_categorization_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  return MEMORY[0x1F41817F8]();
}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_122);
  }
  id v0 = (void *)__atxlog_handle_settings_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  __atxlog_handle_settings_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  return MEMORY[0x1F41817F8]();
}

void sub_1D0F3808C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

__CFString *ATXBundleIdReplacementForBundleId(void *a1)
{
  return ATXBundleIdReplacementForBundleIdWithWebpageURLHint(a1, 0);
}

__CFString *ATXBundleIdReplacementForBundleIdWithWebpageURLHint(void *a1, void *a2)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = a2;
  if ([(__CFString *)v3 length])
  {
    int v5 = objc_msgSend(v4, "atx_isOpenableFaceTimeURL");

    v15[0] = @"com.apple.FaceTimeLinkTrampoline";
    v15[1] = @"com.apple.callhistory.sync-helper";
    uint64_t v6 = @"com.apple.mobilephone";
    v16[0] = @"com.apple.facetime";
    v16[1] = @"com.apple.mobilephone";
    v15[2] = @"com.apple.InCallService";
    if (v5) {
      uint64_t v6 = @"com.apple.facetime";
    }
    v16[2] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    uint64_t v8 = [v7 objectForKeyedSubscript:v3];
    unsigned int v9 = (void *)v8;
    if (v8) {
      unint64_t v10 = (void *)v8;
    }
    else {
      unint64_t v10 = v3;
    }
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v12 = [v4 scheme];

    int v13 = [v12 isEqual:@"tel"];
    if (v13)
    {

      uint64_t v3 = @"com.apple.mobilephone";
    }
    uint64_t v3 = v3;
    uint64_t v11 = v3;
  }

  return v11;
}

uint64_t ATXBundleIdIsFakeContainerBundleId(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1)
  {
    if (([v1 isEqualToString:@"com.apple.Batteries"] & 1) != 0
      || ([v2 isEqualToString:@"com.apple.Health.Sleep"] & 1) != 0
      || ([v2 isEqualToString:@"com.apple.PeopleViewService"] & 1) != 0)
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v3 = [v2 isEqualToString:@"com.apple.gamecenter.widgets"];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t ATXBundleIdIsSpecialWidgetExtensionBundleId(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1)
  {
    if (([v1 isEqualToString:@"com.apple.proactive.suggestions.widget"] & 1) != 0
      || ([v2 isEqualToString:@"com.apple.proactive.appprediction.panel"] & 1) != 0
      || ([v2 isEqualToString:@"Files"] & 1) != 0)
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v3 = [v2 isEqualToString:@"Shortcuts"];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void ATXCacheFileSplitChunks_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D0F2B000, log, OS_LOG_TYPE_ERROR, "Invalid magic number for cache", v1, 2u);
}

void ATXCacheFileWriteChunks_cold_1()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "flock failed: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileWriteChunks_cold_2()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "ftruncate failed: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileWriteChunks_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 0;
  OUTLINED_FUNCTION_3(&dword_1D0F2B000, a2, a3, "lseek returned offset of %lld, expected %lld", (uint8_t *)&v3);
}

void ATXCacheFileWriteChunks_cold_4()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "lseek failed: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileWriteChunks_cold_5()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "writev failed: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileWriteChunks_cold_6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0F2B000, v0, (uint64_t)v0, "writev returned offset of %zd, expected %zd", v1);
}

void ATXCacheFileWrite_cold_3()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "pwrite failed: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileWrite_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = a2;
  __int16 v7 = 2048;
  uint64_t v8 = [a1 length];
  OUTLINED_FUNCTION_3(&dword_1D0F2B000, a3, v4, "pwrite wrote %lu bytes, expected %lu", (uint8_t *)&v5);
}

void ATXCacheFileRead_cold_2()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "fstat failed: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileRead_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0F2B000, log, OS_LOG_TYPE_ERROR, "ATXCache file length is zero", v1, 2u);
}

void ATXCacheFileRead_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D0F2B000, log, OS_LOG_TYPE_DEBUG, "ATXCache file data read skipped", v1, 2u);
}

void ATXCacheFileRead_cold_5()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "Failed to allocate buffer to read data for ATXCache: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileRead_cold_6()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0F2B000, v1, v2, "Could not read ATXCache: [%i] %s", v3, v4, v5, v6, v7);
}

void ATXCacheFileRead_cold_7()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0F2B000, v0, (uint64_t)v0, "Wrong ATXCache length; expected %lu, got %lu", v1);
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x1F40E9AD0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
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

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
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

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
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

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1F40CDD98]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1F40CDDA8]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1F40CE938](*(void *)&a1, a2, *(void *)&a3);
}