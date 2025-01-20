void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1B3AF2FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AF38F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 184));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF3AE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BiometricKitEnrollProgressInfo *GenerateEnrollProgressInfo(uint64_t a1, int a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (*(_DWORD *)a1 == -1)
  {
    if (__osLog) {
      v39 = __osLog;
    }
    else {
      v39 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "((int32_t)report->message) != -1";
      __int16 v46 = 2048;
      uint64_t v47 = 0;
      __int16 v48 = 2080;
      v49 = &unk_1B3B370EE;
      __int16 v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
      __int16 v52 = 1024;
      int v53 = 128;
      _os_log_impl(&dword_1B3AF1000, v39, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 0;
    v8 = 0;
  }
  else
  {
    v7 = objc_alloc_init(BiometricKitEnrollProgressInfo);
    v8 = v7;
    switch(*(_DWORD *)a1)
    {
      case 0:
        [(BiometricKitEnrollProgressInfo *)v7 setMessage:0];
        goto LABEL_5;
      case 1:
        [(BiometricKitEnrollProgressInfo *)v7 setMessage:1];
        v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
        [v6 setObject:v9 forKey:@"BKEPDNewComponentID"];

        v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 4)];
        [v6 setObject:v10 forKey:@"BKEPDNewNodeID"];

        goto LABEL_5;
      case 2:
        [(BiometricKitEnrollProgressInfo *)v7 setMessage:2];
        v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
        [v6 setObject:v12 forKey:@"BKEPDExtendedComponentID"];

        v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 4)];
        [v6 setObject:v13 forKey:@"BKEPDNewNodeID"];

        goto LABEL_22;
      case 3:
        [(BiometricKitEnrollProgressInfo *)v7 setMessage:3];
        v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
        [v6 setObject:v14 forKey:@"BKEPDResultComponentID"];

        v15 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 4)];
        [v6 setObject:v15 forKey:@"BKEPDNewNodeID"];

        v11 = __makeCoordinates((double *)(a1 + 16));
        if (v11) {
          [v6 setObject:v11 forKey:@"BKEPDNewNodeCoordinates"];
        }
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (v16)
        {
          v18 = v16;
          int v42 = a2;
          id v43 = v5;
          if (*(int *)(a1 + 40) >= 1)
          {
            uint64_t v19 = 0;
            v20 = (double *)(a1 + 56);
            *(void *)&long long v17 = 136316162;
            long long v41 = v17;
            do
            {
              v21 = objc_alloc_init(BiometricKitEnrollProgressMergedComponent);
              v22 = v21;
              if (v21)
              {
                [(BiometricKitEnrollProgressMergedComponent *)v21 setComponentID:*((int *)v20 - 2)];
                v23 = __makeCoordinates(v20);
                [(BiometricKitEnrollProgressMergedComponent *)v22 setTransformationCoordinates:v23];
              }
              else
              {
                if (__osLog) {
                  v24 = __osLog;
                }
                else {
                  v24 = MEMORY[0x1E4F14500];
                }
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v41;
                  v45 = "result";
                  __int16 v46 = 2048;
                  uint64_t v47 = 0;
                  __int16 v48 = 2080;
                  v49 = &unk_1B3B370EE;
                  __int16 v50 = 2080;
                  v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
                  __int16 v52 = 1024;
                  int v53 = 92;
                  _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
              }
              objc_msgSend(v18, "insertObject:atIndex:", v22, v19, v41);

              ++v19;
              v20 += 4;
            }
            while (v19 < *(int *)(a1 + 40));
          }
          v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v18];

          if (v27)
          {
            [v6 setObject:v27 forKey:@"BKEPDMergedInComponents"];
          }
          a2 = v42;
          id v5 = v43;
        }
        else
        {
          if (__osLog) {
            v40 = __osLog;
          }
          else {
            v40 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v45 = "ma";
            __int16 v46 = 2048;
            uint64_t v47 = 0;
            __int16 v48 = 2080;
            v49 = &unk_1B3B370EE;
            __int16 v50 = 2080;
            v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
            __int16 v52 = 1024;
            int v53 = 106;
            _os_log_impl(&dword_1B3AF1000, v40, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        break;
      case 4:
        [(BiometricKitEnrollProgressInfo *)v7 setMessage:4];
        v25 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
        [v6 setObject:v25 forKey:@"BKEPDExtendedComponentID"];

        v26 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 4)];
        [v6 setObject:v26 forKey:@"BKEPDNewNodeID"];

LABEL_22:
        v11 = __makeCoordinates((double *)(a1 + 16));
        if (v11) {
          [v6 setObject:v11 forKey:@"BKEPDNewNodeCoordinates"];
        }
        break;
      default:
LABEL_5:
        v11 = 0;
        break;
    }
    if (*(_DWORD *)(a1 + 9652) != -1)
    {
      v28 = objc_msgSend(NSNumber, "numberWithInt:");
      [v6 setObject:v28 forKey:@"BKEPDRemovedNodeID"];

      if (*(_DWORD *)(a1 + 9656) != -1)
      {
        v29 = objc_msgSend(NSNumber, "numberWithInt:");
        [v6 setObject:v29 forKey:@"BKEPDRemovedComponentID"];
      }
    }
    if (*(double *)(a1 + 9664) != -1.0)
    {
      v30 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v6 setObject:v30 forKey:@"BKTDLargestCompArea"];
    }
    int v31 = *(unsigned __int16 *)(a1 + 9660);
    if (v31 != 0xFFFF)
    {
      v32 = [NSNumber numberWithDouble:(double)(__int16)v31];
      [v6 setObject:v32 forKey:@"BKTDLargestCompNodes"];
    }
    if (*(double *)(a1 + 9680) != -1.0)
    {
      v33 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v6 setObject:v33 forKey:@"BKTDTotalArea"];
    }
    int v34 = *(unsigned __int16 *)(a1 + 9672);
    if (v34 != 0xFFFF)
    {
      v35 = [NSNumber numberWithDouble:(double)(__int16)v34];
      [v6 setObject:v35 forKey:@"BKTDTotalNodes"];
    }
    if (*(_DWORD *)(a1 + 9688) != -1)
    {
      v36 = objc_msgSend(NSNumber, "numberWithInt:");
      [v6 setObject:v36 forKey:@"BKEPDRedundantNode"];
    }
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v6];
    [(BiometricKitEnrollProgressInfo *)v8 setMessageDetails:v37];

    [(BiometricKitEnrollProgressInfo *)v8 setProgress:a2];
    [(BiometricKitEnrollProgressInfo *)v8 setCaptureImage:v5];
    [(BiometricKitEnrollProgressInfo *)v8 setRenderedImage:0];
    [(BiometricKitEnrollProgressInfo *)v8 setCurrentPrimaryComponentID:*(int *)(a1 + 9648)];
  }

  return v8;
}

BiometricKitEnrollProgressCoordinates *__makeCoordinates(double *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(BiometricKitEnrollProgressCoordinates);
  v3 = v2;
  if (v2)
  {
    [(BiometricKitEnrollProgressCoordinates *)v2 setX:*a1];
    [(BiometricKitEnrollProgressCoordinates *)v3 setY:a1[1]];
    [(BiometricKitEnrollProgressCoordinates *)v3 setAngle:a1[2]];
  }
  else
  {
    if (__osLog) {
      id v5 = __osLog;
    }
    else {
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136316162;
      v7 = "result";
      __int16 v8 = 2048;
      uint64_t v9 = 0;
      __int16 v10 = 2080;
      v11 = &unk_1B3B370EE;
      __int16 v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
      __int16 v14 = 1024;
      int v15 = 79;
      _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
  }
  return v3;
}

id GenerateTemplateTopologyInfo()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  v18 = v1;
  uint64_t v3 = v2;
  uint64_t v4 = (double *)v0;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  if (*(int *)v4 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = (int *)(v4 + 7);
    do
    {
      uint64_t v22 = 0;
      memset(&v21[16], 0, 480);
      *(_OWORD *)v21 = 0u;
      int v7 = *((_DWORD *)v4 + 8);
      uint64_t v20 = *((void *)v6 - 2);
      int v8 = *(v6 - 2);
      int v23 = v7;
      *(_DWORD *)v21 = v8;
      *(_OWORD *)&v21[8] = *(_OWORD *)v6;
      *(void *)&v21[24] = *((void *)v6 + 2);
      uint64_t v24 = -1;
      unint64_t v28 = 0xBFF0000000000000;
      __int16 v27 = -1;
      unint64_t v26 = 0xBFF0000000000000;
      __int16 v25 = -1;
      int v29 = -1;
      uint64_t v9 = GenerateEnrollProgressInfo((uint64_t)&v20, 255, *(void **)(v3 + 8 * v5));
      if (v9) {
        [v19 addObject:v9];
      }

      ++v5;
      v6 += 10;
    }
    while (v5 < *(int *)v4);
  }
  if (v18)
  {
    __int16 v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v11 = [NSNumber numberWithDouble:v4[1]];
    [v10 setObject:v11 forKey:@"BKTDLargestCompArea"];

    __int16 v12 = [NSNumber numberWithInt:*((unsigned int *)v4 + 1)];
    [v10 setObject:v12 forKey:@"BKTDLargestCompNodes"];

    v13 = [NSNumber numberWithDouble:v4[3]];
    [v10 setObject:v13 forKey:@"BKTDTotalArea"];

    __int16 v14 = [NSNumber numberWithInt:*((unsigned int *)v4 + 4)];
    [v10 setObject:v14 forKey:@"BKTDTotalNodes"];

    if (*((_DWORD *)v4 + 9) != -1)
    {
      int v15 = objc_msgSend(NSNumber, "numberWithInt:");
      [v10 setObject:v15 forKey:@"BKTemplateUpdated"];
    }
    id v16 = v10;
    void *v18 = v16;
  }
  return v19;
}

__CFString *getUUIDString(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    *(void *)uu = 0;
    uint64_t v6 = 0;
    [v1 getUUIDBytes:uu];
    if (uuid_is_null(uu))
    {
      uint64_t v3 = @"0";
    }
    else
    {
      uint64_t v3 = [v2 UUIDString];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1B3AF751C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF76D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF787C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF79C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF7B9C(_Unwind_Exception *exception_object)
{
}

void sub_1B3AF7D74(_Unwind_Exception *exception_object)
{
}

void sub_1B3AF7E18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF8E98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF8F58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3AF9030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B3AF958C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFB654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFB8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFBAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFBD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFBF9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3AFC228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFC488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFC704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFC968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFD504(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_1B3AFD87C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_1B3AFDAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFDD34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3AFDFF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3AFE2BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3AFE554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3AFE808(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3AFEB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B3AFEDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFF040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFF388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1B3AFF848(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3AFFA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFFCF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3AFFF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B001B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B00414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B006A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B00BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B00E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B010A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B01320(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3B01568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B01784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B019A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B01C10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3B01EC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_1B3B02168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3B02410(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3B026E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B02A44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_1B3B02DBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_1B3B03484(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_1B3B038CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3B03B74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1B3B03E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B3B04184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_1B3B044BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B3B047E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_1B3B04BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B3B04EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _BKLogEventOrCode(uint64_t a1)
{
  if (_BKLogEventOrCode_onceToken != -1) {
    dispatch_once(&_BKLogEventOrCode_onceToken, &__block_literal_global_0);
  }
  if (_BKLogEventOrCode_isDaemon)
  {
    id v2 = [NSClassFromString(&cfstr_Biometrickitev.isa) logger];
    [v2 logEventOrCode:a1];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___BKLogEventOrCode_block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_BKLogEventOrCode_queue, block);
  }
}

void BKLogEvent(unsigned int a1)
{
}

void BKLogCode(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = a1;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((a1 - 15) <= 0xFFFFFFF1)
  {
    if (__osLog) {
      uint64_t v4 = __osLog;
    }
    else {
      uint64_t v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "illegal class %d\n\n", (uint8_t *)v5, 8u);
    }
    uint64_t v3 = 15;
  }
  _BKLogEventOrCode(a2 | (unint64_t)(v3 << 32));
}

void sub_1B3B060E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B06918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_1B3B077B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B3B08014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B08950(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B09034(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B0981C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B0A044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

double ConvertTransToNodeArea(int a1, int a2)
{
  return 100.0 / (double)a1 * (100.0 / (double)a1) * (double)(16 * a2);
}

double ComponentSetInit(_OWORD *a1)
{
  double result = 0.0;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

double ComponentSetRelease(int *a1)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0;
    do
      free(*(void **)(*((void *)a1 + 1) + 8 * v2++));
    while (v2 < *a1);
  }
  free(*((void **)a1 + 1));
  if (a1[5] >= 1)
  {
    uint64_t v3 = 0;
    do
      free(*(void **)(*((void *)a1 + 5) + 8 * v3++));
    while (v3 < a1[5]);
  }
  free(*((void **)a1 + 5));
  double result = 0.0;
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

double ConvertVectorForGUI(double *a1, double *a2)
{
  double v2 = a1[1];
  double v3 = a1[2] + 1.57079633;
  *a2 = *a1 * 6.123234e-17 + 0.0 - v2;
  double result = v3 + -1.57079633;
  a2[1] = *a1 + 0.0 + v2 * 6.123234e-17;
  a2[2] = result;
  return result;
}

uint64_t ComponentSetUpdate()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  double v3 = (unsigned int *)v0;
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  memset(v182, 0, 480);
  memset(v181, 0, sizeof(v181));
  if (*(unsigned char *)(v0 + 56))
  {
    if (__osLog) {
      v106 = __osLog;
    }
    else {
      v106 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
      goto LABEL_148;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "!set->structureIsInconsistent";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 884;
    goto LABEL_147;
  }
  uint64_t v4 = (double *)v2;
  uint64_t v5 = v1;
  uint64_t v6 = v1[3];
  int v7 = v1[4];
  ++*(_DWORD *)(v0 + 52);
  if (v2)
  {
    *(_DWORD *)(v2 + 40) = 0;
    *(void *)uint64_t v2 = -1;
    *(_DWORD *)(v2 + 9656) = -1;
    *(void *)(v2 + 9648) = -1;
    *(_DWORD *)(v2 + 8) = -1;
  }
  if (!v1[23])
  {
    if (__osLog) {
      v106 = __osLog;
    }
    else {
      v106 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
      goto LABEL_148;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "inInfoTable->resampleScale100 != 0";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 890;
LABEL_147:
    _os_log_impl(&dword_1B3AF1000, v106, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_148:
    uint64_t v107 = 22;
LABEL_149:
    *((unsigned char *)v3 + 56) = 1;
    return v107;
  }
  uint64_t v8 = __TranslateNodePlacement((uint64_t)v1, (uint64_t)v181);
  if (v8)
  {
    uint64_t v107 = v8;
    if (__osLog) {
      v152 = __osLog;
    }
    else {
      v152 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
      goto LABEL_149;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 893;
LABEL_315:
    _os_log_impl(&dword_1B3AF1000, v152, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_149;
  }
  *((_WORD *)v3 + 24) = v6;
  *((_WORD *)v3 + 25) = v7;
  v180 = v3;
  if (v7 == -1) {
    goto LABEL_41;
  }
  if (v7 >= v5[2])
  {
    if (__osLog) {
      v153 = __osLog;
    }
    else {
      v153 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "delNode < inInfoTable->count";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 906;
LABEL_253:
    _os_log_impl(&dword_1B3AF1000, v153, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    return 0;
  }
  if (v6 != v7)
  {
    if (__osLog) {
      v153 = __osLog;
    }
    else {
      v153 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "insNode == delNode";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 908;
    goto LABEL_253;
  }
  uint64_t v9 = *v3;
  if ((int)v9 >= 1)
  {
    uint64_t v10 = (uint64_t *)*((void *)v3 + 1);
    uint64_t v11 = v10;
    uint64_t v12 = *v3;
    while (1)
    {
      uint64_t v13 = (_WORD *)*v11;
      if (*(unsigned __int16 *)(*v11 + 26) == (unsigned __int16)v6) {
        break;
      }
      ++v11;
      if (!--v12) {
        goto LABEL_13;
      }
    }
    if (v4) {
      *((_DWORD *)v4 + 2413) = (__int16)v13[12];
    }
    if ((unsigned __int16)v13[14] != (unsigned __int16)v6) {
      goto LABEL_40;
    }
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = *v10;
      if ((_WORD *)*v10 != v13 && *(unsigned __int16 *)(v16 + 28) == (unsigned __int16)v6)
      {
        int v17 = *(__int16 *)(v16 + 26);
        if (v17 != -1 && (!v15 || *(__int16 *)(v15 + 26) > v17)) {
          uint64_t v15 = *v10;
        }
      }
      ++v10;
      --v9;
    }
    while (v9);
    if (v15)
    {
      uint64_t v18 = __RebaseComponent(v3, (uint64_t)v13, v15);
      if (v18)
      {
        uint64_t v107 = v18;
        uint64_t v163 = __osLog;
        v164 = MEMORY[0x1E4F14500];
        if (__osLog) {
          v165 = __osLog;
        }
        else {
          v165 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v188 = "!result";
          __int16 v189 = 2048;
          uint64_t v190 = 0;
          __int16 v191 = 2080;
          v192 = (const char *)&unk_1B3B370EE;
          __int16 v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          __int16 v195 = 1024;
          int v196 = 625;
          _os_log_impl(&dword_1B3AF1000, v165, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          uint64_t v163 = __osLog;
        }
        if (v163) {
          v166 = v163;
        }
        else {
          v166 = v164;
        }
        if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v188 = "!result";
          __int16 v189 = 2048;
          uint64_t v190 = 0;
          __int16 v191 = 2080;
          v192 = (const char *)&unk_1B3B370EE;
          __int16 v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          __int16 v195 = 1024;
          int v196 = 910;
          _os_log_impl(&dword_1B3AF1000, v166, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_149;
      }
      if (*(__int16 *)(*(void *)(*((void *)v3 + 5) + 8 * (__int16)v13[15]) + 26) > 1) {
        goto LABEL_40;
      }
      id v19 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136316162;
      v188 = "set->components[removedVertex->componentIndex]->mapiNodeCount > 1";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 626;
    }
    else
    {
      int v20 = (__int16)v13[15];
      if (v4) {
        *((_DWORD *)v4 + 2414) = v20;
      }
      v13[14] = -1;
      if (*(_WORD *)(*(void *)(*((void *)v3 + 5) + 8 * v20) + 26) == 1) {
        goto LABEL_40;
      }
      id v19 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136316162;
      v188 = "set->components[removedVertex->componentIndex]->mapiNodeCount == 1";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 636;
    }
    _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_40:
    uint64_t v21 = *(void *)(*((void *)v3 + 5) + 8 * (__int16)v13[15]);
    --*(_WORD *)(v21 + 26);
    v13[13] = -1;
    goto LABEL_41;
  }
LABEL_13:
  if (__osLog) {
    uint64_t v14 = __osLog;
  }
  else {
    uint64_t v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v188 = "removedVertex";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 609;
    _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_41:
  if (v6 == -1)
  {
    ++v3[4];
    if (v4) {
      *(_DWORD *)uint64_t v4 = 0;
    }
    goto LABEL_206;
  }
  if ((int)v6 >= v5[2])
  {
    if (__osLog) {
      v153 = __osLog;
    }
    else {
      v153 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "insNode < inInfoTable->count";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 919;
    goto LABEL_253;
  }
  if (*v3 == v3[1])
  {
    uint64_t v22 = (char *)malloc_type_realloc(*((void **)v3 + 1), 8 * (int)(*v3 + 16), 0x2004093837F09uLL);
    if (!v22)
    {
      uint64_t v156 = __osLog;
      v157 = MEMORY[0x1E4F14500];
      if (__osLog) {
        v158 = __osLog;
      }
      else {
        v158 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v188 = "tmp != ((void *)0)";
        __int16 v189 = 2048;
        uint64_t v190 = 0;
        __int16 v191 = 2080;
        v192 = (const char *)&unk_1B3B370EE;
        __int16 v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        __int16 v195 = 1024;
        int v196 = 389;
        _os_log_impl(&dword_1B3AF1000, v158, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        uint64_t v156 = __osLog;
      }
      if (v156) {
        v159 = v156;
      }
      else {
        v159 = v157;
      }
      if (!os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
        goto LABEL_287;
      }
      *(_DWORD *)buf = 136316162;
      v188 = "!result";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 486;
      goto LABEL_286;
    }
    *((void *)v3 + 1) = v22;
    int v23 = &v22[8 * v3[1]];
    *((_OWORD *)v23 + 6) = 0u;
    *((_OWORD *)v23 + 7) = 0u;
    *((_OWORD *)v23 + 4) = 0u;
    *((_OWORD *)v23 + 5) = 0u;
    *((_OWORD *)v23 + 2) = 0u;
    *((_OWORD *)v23 + 3) = 0u;
    *(_OWORD *)int v23 = 0u;
    *((_OWORD *)v23 + 1) = 0u;
    v3[1] += 16;
  }
  unsigned int v24 = v3[5];
  if (v24 != v3[6]) {
    goto LABEL_49;
  }
  __int16 v25 = (char *)malloc_type_realloc(*((void **)v3 + 5), 8 * (int)(v24 + 16), 0x2004093837F09uLL);
  if (!v25)
  {
    uint64_t v160 = __osLog;
    v161 = MEMORY[0x1E4F14500];
    if (__osLog) {
      v162 = __osLog;
    }
    else {
      v162 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v188 = "tmp != ((void *)0)";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 406;
      _os_log_impl(&dword_1B3AF1000, v162, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      uint64_t v160 = __osLog;
    }
    if (v160) {
      v159 = v160;
    }
    else {
      v159 = v161;
    }
    if (!os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
      goto LABEL_287;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 489;
LABEL_286:
    _os_log_impl(&dword_1B3AF1000, v159, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_287:
    uint64_t v107 = 12;
LABEL_310:
    if (__osLog) {
      v152 = __osLog;
    }
    else {
      v152 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
      goto LABEL_149;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 921;
    goto LABEL_315;
  }
  *((void *)v3 + 5) = v25;
  unint64_t v26 = &v25[8 * v3[6]];
  *((_OWORD *)v26 + 6) = 0u;
  *((_OWORD *)v26 + 7) = 0u;
  *((_OWORD *)v26 + 4) = 0u;
  *((_OWORD *)v26 + 5) = 0u;
  *((_OWORD *)v26 + 2) = 0u;
  *((_OWORD *)v26 + 3) = 0u;
  *(_OWORD *)unint64_t v26 = 0u;
  *((_OWORD *)v26 + 1) = 0u;
  v3[6] += 16;
LABEL_49:
  __int16 v27 = (double *)malloc_type_calloc(0x20uLL, 1uLL, 0xA5575ADDuLL);
  if (!v27)
  {
    if (__osLog) {
      v155 = __osLog;
    }
    else {
      v155 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
      goto LABEL_309;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "newVertex != ((void *)0)";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 492;
LABEL_308:
    _os_log_impl(&dword_1B3AF1000, v155, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_309:
    uint64_t v107 = 12;
    goto LABEL_310;
  }
  uint64_t v28 = (uint64_t)v27;
  uint64_t v29 = (int)*v3;
  uint64_t v30 = *v3;
  *(void *)(*((void *)v3 + 1) + 8 * v29) = v27;
  *((_WORD *)v27 + 12) = v29;
  uint64_t v31 = (v29 + 1);
  unsigned int *v3 = v31;
  v32 = (double *)&v181[2 * v6];
  double v33 = v32[1];
  double *v27 = v33;
  double v34 = v32[2];
  v27[1] = v34;
  double v35 = v32[3];
  v27[2] = v35;
  int v36 = *((unsigned __int16 *)v32 + 16);
  *((_WORD *)v27 + 14) = v36;
  *((_WORD *)v27 + 13) = v6;
  if (v36 != (unsigned __int16)v6)
  {
    *((_WORD *)v27 + 15) = -1;
    if ((int)v30 < 1) {
      goto LABEL_64;
    }
    int v42 = (uint64_t *)*((void *)v3 + 1);
    while (1)
    {
      uint64_t v43 = *v42;
      if (*(unsigned __int16 *)(*v42 + 26) == v36) {
        break;
      }
      ++v42;
      if (!--v30) {
        goto LABEL_64;
      }
    }
    LODWORD(v40) = *(__int16 *)(v43 + 30);
    *((_WORD *)v27 + 15) = *(_WORD *)(v43 + 30);
    if ((v40 & 0x80000000) != 0)
    {
LABEL_64:
      if (__osLog) {
        v44 = __osLog;
      }
      else {
        v44 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_77;
      }
      *(_DWORD *)buf = 136316162;
      v188 = "newVertex->componentIndex > -1";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 555;
LABEL_69:
      _os_log_impl(&dword_1B3AF1000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_77;
    }
    int v41 = 0;
LABEL_72:
    uint64_t v45 = *(void *)(*((void *)v3 + 5) + 8 * (__int16)v40);
    ++*(_WORD *)(v45 + 24);
    ++*(_WORD *)(v45 + 26);
    if (v4)
    {
      *((_DWORD *)v4 + 1) = *(__int16 *)(v28 + 24);
      *((_DWORD *)v4 + 2) = (__int16)v40;
      double v46 = *(double *)(v45 + 16);
      __double2 v47 = __sincos_stret(v46);
      v4[4] = v46 + *(double *)(v28 + 16);
      double v48 = *(double *)(v28 + 8);
      v4[2] = *(double *)v45 + v47.__cosval * *(double *)v28 - v47.__sinval * v48;
      v4[3] = *(double *)(v45 + 8) + v47.__sinval * *(double *)v28 + v47.__cosval * v48;
      if (v41) {
        int v49 = 1;
      }
      else {
        int v49 = 2;
      }
      *(_DWORD *)uint64_t v4 = v49;
    }
    goto LABEL_77;
  }
  if (SLOWORD(v181[0]) < 1)
  {
LABEL_56:
    *((_WORD *)v27 + 15) = v3[5];
    v39 = malloc_type_calloc(0x20uLL, 1uLL, 0x204D495uLL);
    uint64_t v40 = *(__int16 *)(v28 + 30);
    *(void *)(*((void *)v3 + 5) + 8 * v40) = v39;
    if (*(void *)(*((void *)v3 + 5) + 8 * v40))
    {
      ++v3[5];
      int v41 = 1;
      goto LABEL_72;
    }
    if (__osLog) {
      v155 = __osLog;
    }
    else {
      v155 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
      goto LABEL_309;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "set->components[newVertex->componentIndex] != ((void *)0)";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 536;
    goto LABEL_308;
  }
  uint64_t v37 = 0;
  v38 = (unsigned __int16 *)v182;
  while (v6 == v37 || *v38 != (unsigned __int16)v6)
  {
    ++v37;
    v38 += 16;
    if (LOWORD(v181[0]) == v37) {
      goto LABEL_56;
    }
  }
  if ((v30 & 0x80000000) != 0)
  {
LABEL_169:
    if (__osLog) {
      v44 = __osLog;
    }
    else {
      v44 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "v";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 512;
    goto LABEL_69;
  }
  int v129 = (unsigned __int16)v37;
  v130 = (uint64_t *)*((void *)v3 + 1);
  v131 = v130;
  uint64_t v132 = v31;
  while (*(unsigned __int16 *)(*v131 + 26) != v129)
  {
    ++v131;
    if (!--v132) {
      goto LABEL_169;
    }
  }
  uint64_t v133 = *(__int16 *)(*v131 + 28);
  while (1)
  {
    uint64_t v134 = *v130;
    if (*(unsigned __int16 *)(*v130 + 26) == (unsigned __int16)v133) {
      break;
    }
    ++v130;
    if (!--v31)
    {
      if (__osLog) {
        v44 = __osLog;
      }
      else {
        v44 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v188 = "oldBaseVertex";
        __int16 v189 = 2048;
        uint64_t v190 = 0;
        __int16 v191 = 2080;
        v192 = (const char *)&unk_1B3B370EE;
        __int16 v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        __int16 v195 = 1024;
        int v196 = 514;
        goto LABEL_69;
      }
      goto LABEL_77;
    }
  }
  if (v133 == -1)
  {
    if (__osLog) {
      v44 = __osLog;
    }
    else {
      v44 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v188 = "oldBaseVertex->mapiNodeIndex != -1";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 515;
      goto LABEL_69;
    }
  }
  else
  {
    *((_WORD *)v27 + 15) = *(_WORD *)(v134 + 30);
    if (fabs(v33) < 0.1 && fabs(v34) < 0.1 && vabdd_f64(v35 / 6.28318531, floor(v35 / 6.28318531)) < 0.01)
    {
      v135 = (double *)&v181[2 * v133];
      double v136 = v135[1];
      double v137 = v135[2];
      double v138 = v135[3];
      __double2 v139 = __sincos_stret(v138);
      *(double *)uint64_t v28 = -(v137 * v139.__sinval + v139.__cosval * v136);
      *(double *)(v28 + 8) = -(v137 * v139.__cosval + -v139.__sinval * v136);
      *(double *)(v28 + 16) = -v138;
      uint64_t v140 = __RebaseComponent(v3, v134, v28);
      if (!v140)
      {
        int v41 = 0;
        LOWORD(v40) = *(_WORD *)(v28 + 30);
        goto LABEL_72;
      }
      uint64_t v107 = v140;
      if (__osLog) {
        v167 = __osLog;
      }
      else {
        v167 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v188 = "!result";
        __int16 v189 = 2048;
        uint64_t v190 = 0;
        __int16 v191 = 2080;
        v192 = (const char *)&unk_1B3B370EE;
        __int16 v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        __int16 v195 = 1024;
        int v196 = 527;
        _os_log_impl(&dword_1B3AF1000, v167, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_310;
    }
    if (__osLog) {
      v44 = __osLog;
    }
    else {
      v44 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v188 = "__VectorIsZero(&newVertex->coordinates)";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 518;
      goto LABEL_69;
    }
  }
LABEL_77:
  unsigned int v50 = *v3;
  if ((int)*v3 >= 1)
  {
    v175 = v4;
    uint64_t v51 = 0;
    int v52 = 0;
    double v53 = 0.1;
    double v54 = 6.28318531;
    float64x2_t v174 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
    while (1)
    {
      v55 = (uint64_t *)*((void *)v3 + 1);
      uint64_t v56 = v55[v51];
      uint64_t v57 = *(__int16 *)(v56 + 28);
      if (v57 != -1 && *(unsigned __int16 *)(v56 + 26) == (unsigned __int16)v57)
      {
        unint64_t v58 = (unint64_t)&v181[2 * v57];
        int v59 = *(unsigned __int16 *)(v58 + 32);
        if (v59 != (unsigned __int16)v57) {
          break;
        }
      }
LABEL_124:
      if (++v51 >= (int)v50)
      {
        uint64_t v4 = v175;
        if (v175)
        {
          if (v52)
          {
            uint64_t v108 = *((unsigned int *)v175 + 10);
            if ((int)v108 >= 1)
            {
              v109 = v5;
              uint64_t v110 = 0;
              uint64_t v111 = 0;
              char v112 = 0;
              int v113 = *((_DWORD *)v175 + 2);
              while (1)
              {
                v114 = &v175[4 * v110];
                int v117 = *((_DWORD *)v114 + 13);
                v116 = (_DWORD *)v114 + 13;
                int v115 = v117;
                uint64_t v118 = v108;
                v119 = v175 + 9;
                if (v117 != v113)
                {
                  do
                  {
                    if (v115 == *((_DWORD *)v119 - 6))
                    {
                      if (*((_DWORD *)v119 - 5) == v113)
                      {
                        v120 = &v175[4 * v110];
                        double v121 = *v119;
                        __double2 v122 = __sincos_stret(*v119);
                        double v123 = v120[8];
                        double v124 = v121 + v120[9];
                        double v125 = v120[7];
                        double v126 = *(v119 - 1) + v122.__sinval * v125 + v122.__cosval * v123;
                        v120[7] = *(v119 - 2) + v122.__cosval * v125 - v122.__sinval * v123;
                        v120[8] = v126;
                        v120[9] = v124;
                        _DWORD *v116 = v113;
                        char v112 = 1;
                        goto LABEL_160;
                      }
                      uint64_t v127 = 1;
                      goto LABEL_161;
                    }
                    v119 += 4;
                    --v118;
                  }
                  while (v118);
                  double v3 = v180;
                  if ((v112 & 1) == 0)
                  {
                    v105 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v188 = "foundNew";
                      __int16 v189 = 2048;
                      uint64_t v190 = 0;
                      __int16 v191 = 2080;
                      v192 = "Unable to find component in report";
                      __int16 v193 = 2080;
                      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                      __int16 v195 = 1024;
                      int v196 = 793;
                      goto LABEL_141;
                    }
                  }
                  goto LABEL_142;
                }
LABEL_160:
                uint64_t v127 = v111;
LABEL_161:
                ++v110;
                uint64_t v111 = v127;
                if (v110 == v108)
                {
                  uint64_t v110 = 0;
                  uint64_t v111 = 0;
                  char v128 = v112 & v127;
                  char v112 = 0;
                  if ((v128 & 1) == 0) {
                    break;
                  }
                }
              }
              double v3 = v180;
              uint64_t v5 = v109;
              if (v127) {
                goto LABEL_142;
              }
            }
          }
        }
        goto LABEL_206;
      }
    }
    int v176 = v52;
    v60 = (float64x2_t *)(v58 | 8);
    uint64_t v61 = v50;
    v62 = (uint64_t *)*((void *)v3 + 1);
    uint64_t v63 = v50;
    while (1)
    {
      uint64_t v64 = *v62;
      if (*(unsigned __int16 *)(*v62 + 26) == v59) {
        break;
      }
      ++v62;
      if (!--v63)
      {
        if (__osLog) {
          v105 = __osLog;
        }
        else {
          v105 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v188 = "baseVertex";
          __int16 v189 = 2048;
          uint64_t v190 = 0;
          __int16 v191 = 2080;
          v192 = (const char *)&unk_1B3B370EE;
          __int16 v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          __int16 v195 = 1024;
          int v196 = 741;
LABEL_141:
          _os_log_impl(&dword_1B3AF1000, v105, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_142;
        }
        goto LABEL_142;
      }
    }
    int v65 = *(__int16 *)(v64 + 30);
    int v66 = *(unsigned __int16 *)(v56 + 30);
    if (v66 == *(unsigned __int16 *)(v64 + 30))
    {
      if (__osLog) {
        v141 = __osLog;
      }
      else {
        v141 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
        goto LABEL_200;
      }
      *(_DWORD *)buf = 136316162;
      v188 = "mergeBaseVertex->componentIndex != baseVertex->componentIndex";
      __int16 v189 = 2048;
      uint64_t v190 = 0;
      __int16 v191 = 2080;
      v192 = (const char *)&unk_1B3B370EE;
      __int16 v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v195 = 1024;
      int v196 = 657;
    }
    else
    {
      v173 = v5;
      uint64_t v179 = *(__int16 *)(v64 + 30);
      uint64_t v67 = (__int16)v66;
      int v68 = (__int16)v66;
      if (v175)
      {
        uint64_t v69 = *((int *)v175 + 10);
        if ((int)v69 >= 300)
        {
          if (__osLog) {
            v141 = __osLog;
          }
          else {
            v141 = MEMORY[0x1E4F14500];
          }
          double v3 = v180;
          if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v188 = "outReport->mergedComponentCount < 300";
            __int16 v189 = 2048;
            uint64_t v190 = 0;
            __int16 v191 = 2080;
            v192 = (const char *)&unk_1B3B370EE;
            __int16 v193 = 2080;
            v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
            __int16 v195 = 1024;
            int v196 = 662;
            goto LABEL_199;
          }
          goto LABEL_200;
        }
        *((_DWORD *)v175 + 10) = v69 + 1;
        double v3 = v180;
        if ((*(_DWORD *)v175 & 0xFFFFFFFE) != 2)
        {
          if (__osLog) {
            v141 = __osLog;
          }
          else {
            v141 = MEMORY[0x1E4F14500];
          }
          if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
            goto LABEL_200;
          }
          *(_DWORD *)buf = 136316162;
          v188 = "(outReport->message == MSG_EXTEND_COMPONENT) || (outReport->message == MSG_MERGE_COMPONENTS)";
          __int16 v189 = 2048;
          uint64_t v190 = 0;
          __int16 v191 = 2080;
          v192 = (const char *)&unk_1B3B370EE;
          __int16 v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          __int16 v195 = 1024;
          int v196 = 665;
          goto LABEL_199;
        }
        *(_DWORD *)v175 = 3;
        os_log_t logb = (os_log_t)&v175[4 * v69];
        LODWORD(logb[6].isa) = v68;
        HIDWORD(logb[6].isa) = v65;
        uint64_t v169 = *((void *)v180 + 5);
        v70 = *(double **)(v169 + 8 * v65);
        double v71 = v70[2];
        __int16 v177 = v65;
        __double2 v72 = __sincos_stret(v71);
        double v73 = v60->f64[1];
        double v74 = v71 + v60[1].f64[0];
        double v75 = *v70 + v72.__cosval * v60->f64[0] - v72.__sinval * v73;
        double v168 = v70[1] + v72.__sinval * v60->f64[0] + v72.__cosval * v73;
        v76 = *(double **)(v169 + 8 * v67);
        double v77 = *v76;
        double v78 = v76[1];
        double v79 = v54;
        double v80 = v53;
        double v81 = v76[2];
        __double2 v82 = __sincos_stret(v74);
        LOWORD(v65) = v177;
        double v83 = v74 + v81;
        double v53 = v80;
        double v54 = v79;
        *(double *)&logb[7].isa = v75 + v82.__cosval * v77 - v82.__sinval * v78;
        *(double *)&logb[8].isa = v168 + v82.__sinval * v77 + v82.__cosval * v78;
        *(double *)&logb[9].isa = v83;
      }
      if (fabs(*(double *)v56) >= v53
        || fabs(*(double *)(v56 + 8)) >= v53
        || vabdd_f64(*(double *)(v56 + 16) / v54, floor(*(double *)(v56 + 16) / v54)) >= 0.01)
      {
        if (__osLog) {
          v141 = __osLog;
        }
        else {
          v141 = MEMORY[0x1E4F14500];
        }
        double v3 = v180;
        if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
          goto LABEL_200;
        }
        *(_DWORD *)buf = 136316162;
        v188 = "__VectorIsZero(&mergeBaseVertex->coordinates)";
        __int16 v189 = 2048;
        uint64_t v190 = 0;
        __int16 v191 = 2080;
        v192 = (const char *)&unk_1B3B370EE;
        __int16 v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        __int16 v195 = 1024;
        int v196 = 681;
      }
      else
      {
        __int16 v178 = v65;
        do
        {
          uint64_t v84 = *v55;
          if (*(unsigned __int16 *)(*v55 + 30) == (unsigned __int16)v67)
          {
            double v85 = v60[1].f64[0];
            __double2 v86 = __sincos_stret(v85);
            double v87 = *(double *)(v84 + 8);
            double v88 = v85 + *(double *)(v84 + 16);
            float64_t v89 = v60->f64[1] + v86.__sinval * *(double *)v84 + v86.__cosval * v87;
            *(double *)uint64_t v84 = v60->f64[0] + v86.__cosval * *(double *)v84 - v86.__sinval * v87;
            *(float64_t *)(v84 + 8) = v89;
            *(double *)(v84 + 16) = v88;
            *(_WORD *)(v84 + 28) = *(_WORD *)(v64 + 28);
          }
          ++v55;
          --v61;
        }
        while (v61);
        int32x2_t v90 = vmovn_s64(vcgtq_f64(v174, vabdq_f64(*(float64x2_t *)v56, *v60)));
        if (v90.i32[0] & v90.i32[1])
        {
          double v91 = vabdd_f64(*(double *)(v56 + 16), v60[1].f64[0]) / v54;
          if (vabdd_f64(v91, floor(v91)) < 0.01)
          {
            uint64_t v92 = 0;
            double v3 = v180;
            do
            {
              uint64_t v93 = *(void *)(*((void *)v3 + 1) + 8 * v92);
              if (*(unsigned __int16 *)(v93 + 30) == (unsigned __int16)v68)
              {
                uint64_t v94 = *((void *)v3 + 5);
                uint64_t v95 = *(void *)(v94 + 8 * v67);
                int v96 = *(__int16 *)(v95 + 24);
                if (v96 <= 0)
                {
                  v99 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
                  log = v99;
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v188 = "set->components[replaceComponentIndex]->nodeCount > 0";
                    __int16 v189 = 2048;
                    uint64_t v190 = 0;
                    __int16 v191 = 2080;
                    v192 = (const char *)&unk_1B3B370EE;
                    __int16 v193 = 2080;
                    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                    __int16 v195 = 1024;
                    int v196 = 701;
                    _os_log_impl(&dword_1B3AF1000, log, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                    uint64_t v94 = *((void *)v180 + 5);
                    uint64_t v95 = *(void *)(v94 + 8 * v67);
                    LOWORD(v96) = *(_WORD *)(v95 + 24);
                  }
                }
                *(_WORD *)(v95 + 24) = v96 - 1;
                uint64_t v97 = *(void *)(v94 + 8 * v179);
                ++*(_WORD *)(v97 + 24);
                if (*(__int16 *)(v93 + 26) != -1)
                {
                  int v98 = *(__int16 *)(v95 + 26);
                  if (v98 <= 0)
                  {
                    v100 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
                    loga = v100;
                    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v188 = "set->components[replaceComponentIndex]->mapiNodeCount > 0";
                      __int16 v189 = 2048;
                      uint64_t v190 = 0;
                      __int16 v191 = 2080;
                      v192 = (const char *)&unk_1B3B370EE;
                      __int16 v193 = 2080;
                      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                      __int16 v195 = 1024;
                      int v196 = 706;
                      _os_log_impl(&dword_1B3AF1000, loga, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                      uint64_t v101 = *((void *)v180 + 5);
                      uint64_t v95 = *(void *)(v101 + 8 * v67);
                      LOWORD(v98) = *(_WORD *)(v95 + 26);
                      uint64_t v97 = *(void *)(v101 + 8 * v179);
                    }
                  }
                  *(_WORD *)(v95 + 26) = v98 - 1;
                  ++*(_WORD *)(v97 + 26);
                }
                *(_WORD *)(v93 + 30) = v178;
                double v3 = v180;
                unsigned int v50 = *v180;
              }
              ++v92;
            }
            while (v92 < (int)v50);
            uint64_t v102 = *(void *)(*((void *)v3 + 5) + 8 * v67);
            if (*(_WORD *)(v102 + 24))
            {
              if (__osLog) {
                v103 = __osLog;
              }
              else {
                v103 = MEMORY[0x1E4F14500];
              }
              uint64_t v5 = v173;
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v188 = "set->components[replaceComponentIndex]->nodeCount == 0";
                __int16 v189 = 2048;
                uint64_t v190 = 0;
                __int16 v191 = 2080;
                v192 = (const char *)&unk_1B3B370EE;
                __int16 v193 = 2080;
                v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                __int16 v195 = 1024;
                int v196 = 713;
                _os_log_impl(&dword_1B3AF1000, v103, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                uint64_t v102 = *(void *)(*((void *)v3 + 5) + 8 * v67);
              }
            }
            else
            {
              uint64_t v5 = v173;
            }
            if (*(_WORD *)(v102 + 26))
            {
              v104 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v188 = "set->components[replaceComponentIndex]->mapiNodeCount == 0";
                __int16 v189 = 2048;
                uint64_t v190 = 0;
                __int16 v191 = 2080;
                v192 = (const char *)&unk_1B3B370EE;
                __int16 v193 = 2080;
                v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                __int16 v195 = 1024;
                int v196 = 714;
                _os_log_impl(&dword_1B3AF1000, v104, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
            }
            if (*(unsigned __int16 *)(v64 + 30) == *(unsigned __int16 *)(v56 + 30))
            {
              int v52 = v176 + 1;
              unsigned int v50 = *v3;
              goto LABEL_124;
            }
            if (__osLog) {
              v141 = __osLog;
            }
            else {
              v141 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v188 = "baseVertex->componentIndex == mergeBaseVertex->componentIndex";
              __int16 v189 = 2048;
              uint64_t v190 = 0;
              __int16 v191 = 2080;
              v192 = (const char *)&unk_1B3B370EE;
              __int16 v193 = 2080;
              v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              __int16 v195 = 1024;
              int v196 = 717;
              goto LABEL_199;
            }
LABEL_200:
            if (__osLog) {
              v105 = __osLog;
            }
            else {
              v105 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v188 = "!result";
              __int16 v189 = 2048;
              uint64_t v190 = 0;
              __int16 v191 = 2080;
              v192 = (const char *)&unk_1B3B370EE;
              __int16 v193 = 2080;
              v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              __int16 v195 = 1024;
              int v196 = 743;
              goto LABEL_141;
            }
LABEL_142:
            if (__osLog) {
              v106 = __osLog;
            }
            else {
              v106 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v188 = "!result";
              __int16 v189 = 2048;
              uint64_t v190 = 0;
              __int16 v191 = 2080;
              v192 = (const char *)&unk_1B3B370EE;
              __int16 v193 = 2080;
              v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              __int16 v195 = 1024;
              int v196 = 926;
              goto LABEL_147;
            }
            goto LABEL_148;
          }
        }
        if (__osLog) {
          v141 = __osLog;
        }
        else {
          v141 = MEMORY[0x1E4F14500];
        }
        double v3 = v180;
        if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
          goto LABEL_200;
        }
        *(_DWORD *)buf = 136316162;
        v188 = "__VectorEquals(&mergeBaseVertex->coordinates,mergeVector)";
        __int16 v189 = 2048;
        uint64_t v190 = 0;
        __int16 v191 = 2080;
        v192 = (const char *)&unk_1B3B370EE;
        __int16 v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        __int16 v195 = 1024;
        int v196 = 694;
      }
    }
LABEL_199:
    _os_log_impl(&dword_1B3AF1000, v141, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_200;
  }
LABEL_206:
  uint64_t LargestComponent = __FindLargestComponent(v3, 1, v3 + 8);
  if (LargestComponent)
  {
    uint64_t v107 = LargestComponent;
    if (__osLog) {
      v152 = __osLog;
    }
    else {
      v152 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
      goto LABEL_149;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 945;
    goto LABEL_315;
  }
  uint64_t v143 = __FindLargestComponent(v3, 0, v3 + 7);
  if (v143)
  {
    uint64_t v107 = v143;
    if (__osLog) {
      v152 = __osLog;
    }
    else {
      v152 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
      goto LABEL_149;
    }
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    __int16 v189 = 2048;
    uint64_t v190 = 0;
    __int16 v191 = 2080;
    v192 = (const char *)&unk_1B3B370EE;
    __int16 v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v195 = 1024;
    int v196 = 948;
    goto LABEL_315;
  }
  if (!v4) {
    return 0;
  }
  *((_DWORD *)v4 + 2412) = v3[8];
  double v144 = v4[3];
  double v145 = v4[4] + 1.57079633;
  double v146 = v4[2];
  v4[2] = v146 * 6.123234e-17 + 0.0 - v144;
  v4[3] = v146 + 0.0 + v144 * 6.123234e-17;
  v4[4] = v145 + -1.57079633;
  uint64_t v147 = *((unsigned int *)v4 + 10);
  if ((int)v147 >= 1)
  {
    v148 = v4 + 9;
    do
    {
      double v149 = *(v148 - 1);
      double v150 = *v148 + 1.57079633;
      double v151 = *(v148 - 2);
      *(v148 - 2) = v151 * 6.123234e-17 + 0.0 - v149;
      *(v148 - 1) = v151 + 0.0 + v149 * 6.123234e-17;
      double *v148 = v150 + -1.57079633;
      v148 += 4;
      --v147;
    }
    while (v147);
  }
  uint64_t v107 = 0;
  *((_WORD *)v4 + 4830) = v183;
  *((void *)v4 + 1208) = v184;
  *((_WORD *)v4 + 4836) = v185;
  *((void *)v4 + 1210) = v186;
  *((_DWORD *)v4 + 2422) = v5[1529] & 1;
  return v107;
}

uint64_t __TranslateNodePlacement(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (__osLog) {
      double v33 = __osLog;
    }
    else {
      double v33 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v34 = 136316162;
    double v35 = "inNodePlacement";
    __int16 v36 = 2048;
    uint64_t v37 = 0;
    __int16 v38 = 2080;
    v39 = &unk_1B3B370EE;
    __int16 v40 = 2080;
    int v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v42 = 1024;
    int v43 = 138;
    goto LABEL_23;
  }
  if (*(_WORD *)a1 != 3060)
  {
    if (__osLog) {
      double v33 = __osLog;
    }
    else {
      double v33 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v34 = 136316162;
    double v35 = "inNodePlacement->structSize == sizeof(*inNodePlacement)";
    __int16 v36 = 2048;
    uint64_t v37 = 0;
    __int16 v38 = 2080;
    v39 = &unk_1B3B370EE;
    __int16 v40 = 2080;
    int v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v42 = 1024;
    int v43 = 139;
    goto LABEL_23;
  }
  if (*(_WORD *)(a1 + 2) != 3)
  {
    if (__osLog) {
      double v33 = __osLog;
    }
    else {
      double v33 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v34 = 136316162;
    double v35 = "inNodePlacement->version == 3";
    __int16 v36 = 2048;
    uint64_t v37 = 0;
    __int16 v38 = 2080;
    v39 = &unk_1B3B370EE;
    __int16 v40 = 2080;
    int v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v42 = 1024;
    int v43 = 140;
    goto LABEL_23;
  }
  if (!a2)
  {
    if (__osLog) {
      double v33 = __osLog;
    }
    else {
      double v33 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v34 = 136316162;
    double v35 = "outNodePlacement";
    __int16 v36 = 2048;
    uint64_t v37 = 0;
    __int16 v38 = 2080;
    v39 = &unk_1B3B370EE;
    __int16 v40 = 2080;
    int v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v42 = 1024;
    int v43 = 142;
LABEL_23:
    _os_log_impl(&dword_1B3AF1000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v34, 0x30u);
    return 22;
  }
  uint64_t v4 = *(__int16 *)(a1 + 4);
  *(_WORD *)a2 = v4;
  *(_DWORD *)(a2 + 2) = *(_DWORD *)(a1 + 6);
  int v5 = *(__int16 *)(a1 + 46);
  if (v4 >= 1)
  {
    double v6 = (double)v5;
    uint64_t v7 = v4;
    uint64_t v8 = a2 + 16;
    uint64_t v9 = (unsigned char *)(a1 + 56);
    uint64_t v10 = v4;
    do
    {
      double v11 = (double)*((__int16 *)v9 - 3) * 100.0 / v6;
      *(double *)(v8 - 8) = v11;
      double v12 = (double)*((__int16 *)v9 - 2) * 100.0 / v6;
      *(double *)uint64_t v8 = v12;
      double v13 = (double)*((__int16 *)v9 - 4) * 3.14159265;
      double v14 = v13 * 0.00390625;
      *(double *)(v8 + 8) = v13 * 0.00390625;
      if (*v9)
      {
        __double2 v15 = __sincos_stret(v13 * 0.00390625);
        *(double *)(v8 - 8) = -(v12 * v15.__sinval + v15.__cosval * v11);
        *(double *)uint64_t v8 = -(v12 * v15.__cosval + -v15.__sinval * v11);
        *(double *)(v8 + 8) = -v14;
      }
      __int16 v16 = *((_WORD *)v9 - 1);
      v9 += 10;
      *(_WORD *)(v8 + 16) = v16;
      v8 += 32;
      --v10;
    }
    while (v10);
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v18 = a2 + 32 * i;
      int v21 = *(__int16 *)(v18 + 32);
      int v20 = (double *)(v18 + 32);
      unsigned __int16 v19 = v21;
      if ((v21 & 0x80000000) == 0)
      {
        uint64_t v22 = v20 - 3;
        int v23 = 300;
        while (1)
        {
          uint64_t v24 = a2 + 32 * (__int16)v19;
          int v25 = *(unsigned __int16 *)(v24 + 32);
          if (v25 == v19) {
            break;
          }
          double v26 = *(double *)(v24 + 24);
          __double2 v27 = __sincos_stret(v26);
          double v28 = *(v20 - 2);
          double v29 = v26 + *(v20 - 1);
          double v30 = *(double *)(v24 + 16) + v27.__sinval * *v22 + v27.__cosval * v28;
          double *v22 = *(double *)(v24 + 8) + v27.__cosval * *v22 - v27.__sinval * v28;
          *(v20 - 2) = v30;
          *(v20 - 1) = v29;
          *(_WORD *)int v20 = v25;
          unsigned __int16 v19 = v25;
          if (!--v23)
          {
            if (__osLog) {
              double v33 = __osLog;
            }
            else {
              double v33 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              int v34 = 136316162;
              double v35 = "found";
              __int16 v36 = 2048;
              uint64_t v37 = 0;
              __int16 v38 = 2080;
              v39 = &unk_1B3B370EE;
              __int16 v40 = 2080;
              int v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              __int16 v42 = 1024;
              int v43 = 181;
              goto LABEL_23;
            }
            return 22;
          }
        }
      }
    }
  }
  uint64_t result = 0;
  *(_WORD *)(a2 + 9608) = *(_WORD *)(a1 + 3048);
  double v32 = 100.0 / (double)v5 * (100.0 / (double)v5);
  *(double *)(a2 + 9616) = v32 * (double)(16 * *(__int16 *)(a1 + 3050));
  *(_WORD *)(a2 + 9624) = *(_WORD *)(a1 + 3052);
  *(double *)(a2 + 9632) = v32 * (double)(16 * *(__int16 *)(a1 + 3054));
  return result;
}

uint64_t __FindLargestComponent(unsigned int *a1, int a2, _DWORD *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v6 = (unsigned __int16 *)malloc_type_calloc((int)a1[5], 2uLL, 0x1000040BDFB0063uLL);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *a1;
    int v10 = a1[5];
    if ((int)v9 < 1)
    {
LABEL_9:
      if (v10 < 1)
      {
        int v22 = 0;
      }
      else
      {
        double v28 = a3;
        __int16 v12 = 0;
        unsigned __int16 v13 = 0;
        unsigned __int16 v14 = 0;
        uint64_t v15 = MEMORY[0x1E4F14500];
        *(void *)&long long v7 = 136316162;
        do
        {
          uint64_t v16 = v12;
          unsigned int v17 = v8[v12];
          uint64_t v18 = *(void *)(*((void *)a1 + 5) + 8 * v12);
          if (a2) {
            uint64_t v19 = 26;
          }
          else {
            uint64_t v19 = 24;
          }
          if (v17 != *(__int16 *)(v18 + v19))
          {
            int v20 = (__osLog ? __osLog : v15);
            log = v20;
            long long v27 = v7;
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
            long long v7 = v27;
            uint64_t v15 = MEMORY[0x1E4F14500];
            if (v21)
            {
              *(_DWORD *)buf = v27;
              double v30 = "histogram[i] == (mapiNodesOnly?set->components[i]->mapiNodeCount:set->components[i]->nodeCount)";
              __int16 v31 = 2048;
              uint64_t v32 = 0;
              __int16 v33 = 2080;
              int v34 = &unk_1B3B370EE;
              __int16 v35 = 2080;
              __int16 v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              __int16 v37 = 1024;
              int v38 = 832;
              _os_log_impl(&dword_1B3AF1000, log, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              long long v7 = v27;
              uint64_t v15 = MEMORY[0x1E4F14500];
              unsigned int v17 = v8[v16];
              int v10 = a1[5];
            }
          }
          if (v17 > v14)
          {
            unsigned __int16 v14 = v17;
            unsigned __int16 v13 = v16;
          }
          __int16 v12 = v16 + 1;
        }
        while (v10 > (__int16)(v16 + 1));
        int v22 = v13;
        a3 = v28;
      }
      *a3 = v22;
    }
    else
    {
      uint64_t v11 = *((void *)a1 + 1);
      while (v10 > *(__int16 *)(*(void *)v11 + 30))
      {
        if (!a2 || *(__int16 *)(*(void *)v11 + 26) != -1) {
          ++v6[*(__int16 *)(*(void *)v11 + 30)];
        }
        v11 += 8;
        if (!--v9) {
          goto LABEL_9;
        }
      }
      if (__osLog) {
        uint64_t v24 = __osLog;
      }
      else {
        uint64_t v24 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        double v30 = "v->componentIndex < set->componentCount";
        __int16 v31 = 2048;
        uint64_t v32 = 0;
        __int16 v33 = 2080;
        int v34 = &unk_1B3B370EE;
        __int16 v35 = 2080;
        __int16 v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        __int16 v37 = 1024;
        int v38 = 824;
        _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    free(v8);
    return 0;
  }
  else
  {
    if (__osLog) {
      int v25 = __osLog;
    }
    else {
      int v25 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      double v30 = "histogram != ((void *)0)";
      __int16 v31 = 2048;
      uint64_t v32 = 0;
      __int16 v33 = 2080;
      int v34 = &unk_1B3B370EE;
      __int16 v35 = 2080;
      __int16 v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v37 = 1024;
      int v38 = 819;
      _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 12;
  }
}

uint64_t FindRectangleForComponent(unsigned int *a1, unsigned __int16 a2, _WORD *a3, _WORD *a4, _WORD *a5, _WORD *a6)
{
  uint64_t v6 = *a1;
  if ((int)v6 < 1)
  {
    double v11 = 0.0;
    double v10 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    long long v7 = (double **)*((void *)a1 + 1);
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      __int16 v12 = *v7;
      if (*((unsigned __int16 *)*v7 + 15) == a2)
      {
        double v13 = v12[1];
        if (v11 > *v12) {
          double v11 = *v12;
        }
        if (v10 < *v12) {
          double v10 = *v12;
        }
        if (v9 > v13) {
          double v9 = v12[1];
        }
        if (v8 < v13) {
          double v8 = v12[1];
        }
      }
      ++v7;
      --v6;
    }
    while (v6);
  }
  *a3 = (int)(v11 + -1.0);
  *a4 = (int)(v9 + -1.0);
  *a5 = (int)(v10 + 1.0);
  *a6 = (int)(v8 + 1.0);
  return 0;
}

uint64_t GenerateTemplateTopology()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, 512);
  bzero(v28, 0x4B0uLL);
  int v12 = 0;
  if (!v3)
  {
    if (__osLog) {
      double v10 = __osLog;
    }
    else {
      double v10 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v18 = 136316162;
    uint64_t v19 = "inInfoTable";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    int v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v26 = 1024;
    int v27 = 1077;
    goto LABEL_24;
  }
  if (!v2)
  {
    if (__osLog) {
      double v10 = __osLog;
    }
    else {
      double v10 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v18 = 136316162;
    uint64_t v19 = "outResult";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    int v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v26 = 1024;
    int v27 = 1078;
LABEL_24:
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    return 22;
  }
  uint64_t v4 = __TranslateNodePlacement(v3, (uint64_t)v13);
  if (v4)
  {
    uint64_t v8 = v4;
    if (__osLog) {
      double v11 = __osLog;
    }
    else {
      double v11 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      return v8;
    }
    int v18 = 136316162;
    uint64_t v19 = "result == 0";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    int v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v26 = 1024;
    int v27 = 1081;
LABEL_36:
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    return v8;
  }
  uint64_t v5 = __GenerateTemplateTopology((uint64_t)v13, (_DWORD *)v2, (uint64_t)v28, &v12);
  if (v5)
  {
    uint64_t v8 = v5;
    if (__osLog) {
      double v11 = __osLog;
    }
    else {
      double v11 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      return v8;
    }
    int v18 = 136316162;
    uint64_t v19 = "result == 0";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    int v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v26 = 1024;
    int v27 = 1084;
    goto LABEL_36;
  }
  if (v12 < 2)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = 0;
    for (uint64_t i = 1; i != v12; ++i)
    {
      if (v28[v6] < v28[i]) {
        int v6 = i;
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)(v2 + 4) = v14;
  *(void *)(v2 + 8) = v15;
  *(_DWORD *)(v2 + 16) = v16;
  *(void *)(v2 + 24) = v17;
  *(_DWORD *)(v2 + 32) = v6;
  *(_DWORD *)(v2 + 36) = -1;
  return v8;
}

uint64_t __GenerateTemplateTopology(uint64_t a1, _DWORD *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  bzero(v29, 0x4B0uLL);
  if (!a1)
  {
    if (__osLog) {
      int v18 = __osLog;
    }
    else {
      int v18 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v19 = 136316162;
    __int16 v20 = "convertedTopology";
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    __int16 v23 = 2080;
    __int16 v24 = &unk_1B3B370EE;
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v27 = 1024;
    int v28 = 1025;
    goto LABEL_24;
  }
  if (!a2)
  {
    if (__osLog) {
      int v18 = __osLog;
    }
    else {
      int v18 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v19 = 136316162;
    __int16 v20 = "outResult";
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    __int16 v23 = 2080;
    __int16 v24 = &unk_1B3B370EE;
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v27 = 1024;
    int v28 = 1026;
LABEL_24:
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    return 22;
  }
  uint64_t v8 = 0;
  int v9 = 0;
  uint64_t v10 = a1 + 16;
  double v11 = (double *)(a2 + 18);
  do
  {
    uint64_t v12 = *(__int16 *)(v10 + 16);
    if (v12 == -1) {
      break;
    }
    *((_DWORD *)v11 - 7) = v8;
    if (v8 == v12)
    {
      int v13 = v9++;
      int v14 = 1;
    }
    else
    {
      int v13 = v29[v12];
      int v14 = 2;
    }
    *((_DWORD *)v11 - 8) = v14;
    v29[v8] = v13;
    *((_DWORD *)v11 - 6) = v13;
    double v15 = *(double *)v10;
    double v16 = *(double *)(v10 + 8) + 1.57079633;
    *(v11 - 2) = *(double *)(v10 - 8) * 6.123234e-17 + 0.0 - *(double *)v10;
    *(v11 - 1) = *(double *)(v10 - 8) + 0.0 + v15 * 6.123234e-17;
    double *v11 = v16 + -1.57079633;
    if (a3) {
      ++*(_DWORD *)(a3 + 4 * v13);
    }
    ++v8;
    v10 += 32;
    v11 += 5;
  }
  while (v8 != 300);
  *a2 = v8;
  uint64_t result = 0;
  if (a4) {
    *a4 = v9;
  }
  return result;
}

uint64_t GenerateMatchTemplateTopology()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v3 = (__int16 *)v0;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  bzero(v28, 0x25A8uLL);
  if (!v3)
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_DWORD *)buf = 136316162;
    int v34 = "inInfoTable";
    __int16 v35 = 2048;
    uint64_t v36 = 0;
    __int16 v37 = 2080;
    int v38 = &unk_1B3B370EE;
    __int16 v39 = 2080;
    __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v41 = 1024;
    int v42 = 1117;
    goto LABEL_34;
  }
  if (!v2)
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_DWORD *)buf = 136316162;
    int v34 = "outResult";
    __int16 v35 = 2048;
    uint64_t v36 = 0;
    __int16 v37 = 2080;
    int v38 = &unk_1B3B370EE;
    __int16 v39 = 2080;
    __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v41 = 1024;
    int v42 = 1118;
    goto LABEL_34;
  }
  uint64_t v4 = __TranslateNodePlacement((uint64_t)(v3 + 6), (uint64_t)v28);
  if (v4)
  {
    uint64_t v23 = v4;
    if (__osLog) {
      __int16 v27 = __osLog;
    }
    else {
      __int16 v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v34 = "result == 0";
      __int16 v35 = 2048;
      uint64_t v36 = 0;
      __int16 v37 = 2080;
      int v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v41 = 1024;
      int v42 = 1121;
LABEL_28:
      _os_log_impl(&dword_1B3AF1000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    int v5 = v3[29];
    int v6 = v3[4];
    int v7 = v3[5];
    int v8 = v3[3];
    uint64_t TemplateTopology = __GenerateTemplateTopology((uint64_t)v28, (_DWORD *)v2, 0, 0);
    if (!TemplateTopology)
    {
      int v10 = (*(_DWORD *)v2)++;
      uint64_t v11 = v2 + 40 * v10;
      *(_DWORD *)(v11 + 40) = 4;
      *(_DWORD *)(v11 + 44) = v10;
      if (v3[2] < 300)
      {
        double v12 = (double)v6 * 100.0 / (double)v5;
        double v13 = (double)v7 * 100.0 / (double)v5;
        double v14 = (double)v8 * 3.14159265 * 0.00390625;
        uint64_t v15 = v2 + 40 + 40 * v3[2];
        int v16 = *(_DWORD *)(v15 + 8);
        uint64_t v17 = v2 + 40 + 40 * v10;
        *(_DWORD *)(v17 + 8) = v16;
        double v18 = v12 * 6.123234e-17 + 0.0 - v13;
        double v19 = v12 + 0.0 + v13 * 6.123234e-17;
        double v20 = v14 + 1.57079633 + -1.57079633;
        double v21 = *(double *)(v15 + 32);
        __double2 v22 = __sincos_stret(v21);
        uint64_t v23 = 0;
        double v24 = *(double *)(v15 + 24);
        *(double *)(v17 + 16) = *(double *)(v15 + 16) + v22.__cosval * v18 - v22.__sinval * v19;
        *(double *)(v17 + 24) = v24 + v22.__sinval * v18 + v22.__cosval * v19;
        *(double *)(v17 + 32) = v20 + v21;
        *(_DWORD *)(v2 + 32) = v16;
        *(_DWORD *)(v2 + 4) = v29;
        *(void *)(v2 + 8) = v30;
        *(_DWORD *)(v2 + 16) = v31;
        *(void *)(v2 + 24) = v32;
        *(_DWORD *)(v2 + 36) = v3[9] != -1;
        return v23;
      }
      if (__osLog) {
        __int16 v26 = __osLog;
      }
      else {
        __int16 v26 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      *(_DWORD *)buf = 136316162;
      int v34 = "inInfoTable->matchNode < 300";
      __int16 v35 = 2048;
      uint64_t v36 = 0;
      __int16 v37 = 2080;
      int v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v41 = 1024;
      int v42 = 1137;
LABEL_34:
      _os_log_impl(&dword_1B3AF1000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      return 22;
    }
    uint64_t v23 = TemplateTopology;
    if (__osLog) {
      __int16 v27 = __osLog;
    }
    else {
      __int16 v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v34 = "result == 0";
      __int16 v35 = 2048;
      uint64_t v36 = 0;
      __int16 v37 = 2080;
      int v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      __int16 v41 = 1024;
      int v42 = 1128;
      goto LABEL_28;
    }
  }
  return v23;
}

uint64_t __RebaseComponent(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int16 *)(a2 + 30);
  if (v3 != *(unsigned __int16 *)(a3 + 30))
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v27 = 136316162;
    int v28 = "oldBase->componentIndex == newBase->componentIndex";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    uint64_t v32 = &unk_1B3B370EE;
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v35 = 1024;
    int v36 = 438;
    goto LABEL_54;
  }
  int v4 = *(unsigned __int16 *)(a2 + 26);
  if (v4 == 0xFFFF)
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v27 = 136316162;
    int v28 = "oldBase->mapiNodeIndex != -1";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    uint64_t v32 = &unk_1B3B370EE;
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v35 = 1024;
    int v36 = 441;
    goto LABEL_54;
  }
  int v6 = *(unsigned __int16 *)(a3 + 26);
  if (v6 == 0xFFFF)
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v27 = 136316162;
    int v28 = "newBase->mapiNodeIndex != -1";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    uint64_t v32 = &unk_1B3B370EE;
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v35 = 1024;
    int v36 = 442;
    goto LABEL_54;
  }
  if (v4 != *(unsigned __int16 *)(a2 + 28))
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v27 = 136316162;
    int v28 = "oldBase->mapiNodeIndex == oldBase->mapiBaseNodeIndex";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    uint64_t v32 = &unk_1B3B370EE;
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v35 = 1024;
    int v36 = 445;
    goto LABEL_54;
  }
  if (fabs(*(double *)a2) >= 0.1
    || fabs(*(double *)(a2 + 8)) >= 0.1
    || vabdd_f64(*(double *)(a2 + 16) / 6.28318531, floor(*(double *)(a2 + 16) / 6.28318531)) >= 0.01)
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v27 = 136316162;
    int v28 = "__VectorIsZero(&oldBase->coordinates)";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    uint64_t v32 = &unk_1B3B370EE;
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v35 = 1024;
    int v36 = 446;
    goto LABEL_54;
  }
  unsigned __int16 v8 = *(_WORD *)(a2 + 30);
  int v9 = *(double **)(*((void *)a1 + 5) + 8 * (__int16)v3);
  double v10 = v9[2];
  __double2 v11 = __sincos_stret(v10);
  double v12 = *(double *)(a3 + 8);
  double v13 = v10 + *(double *)(a3 + 16);
  double v14 = v9[1] + v11.__sinval * *(double *)a3 + v11.__cosval * v12;
  double *v9 = *v9 + v11.__cosval * *(double *)a3 - v11.__sinval * v12;
  v9[1] = v14;
  v9[2] = v13;
  double v15 = *(double *)a3;
  double v16 = *(double *)(a3 + 8);
  double v17 = *(double *)(a3 + 16);
  __double2 v18 = __sincos_stret(v17);
  uint64_t v19 = *a1;
  if ((int)v19 >= 1)
  {
    double v20 = (uint64_t *)*((void *)a1 + 1);
    do
    {
      uint64_t v21 = *v20;
      if (*(unsigned __int16 *)(*v20 + 30) == v8)
      {
        *(_WORD *)(v21 + 28) = v6;
        double v22 = *(double *)(v21 + 8);
        double v23 = *(double *)(v21 + 16) - v17;
        double v24 = -v18.__sinval * *(double *)v21 - (v16 * v18.__cosval + -v18.__sinval * v15) + v18.__cosval * v22;
        *(double *)uint64_t v21 = v18.__cosval * *(double *)v21 - (v16 * v18.__sinval + v18.__cosval * v15) + v18.__sinval * v22;
        *(double *)(v21 + 8) = v24;
        *(double *)(v21 + 16) = v23;
      }
      ++v20;
      --v19;
    }
    while (v19);
    double v15 = *(double *)a3;
  }
  if (fabs(v15) >= 0.1
    || fabs(*(double *)(a3 + 8)) >= 0.1
    || vabdd_f64(*(double *)(a3 + 16) / 6.28318531, floor(*(double *)(a3 + 16) / 6.28318531)) >= 0.01)
  {
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v27 = 136316162;
    int v28 = "__VectorIsZero(&newBase->coordinates)";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    uint64_t v32 = &unk_1B3B370EE;
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v35 = 1024;
    int v36 = 470;
    goto LABEL_54;
  }
  if (v6 == *(unsigned __int16 *)(a3 + 28)) {
    return 0;
  }
  if (__osLog) {
    __int16 v26 = __osLog;
  }
  else {
    __int16 v26 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v27 = 136316162;
    int v28 = "newBase->mapiNodeIndex == newBase->mapiBaseNodeIndex";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    uint64_t v32 = &unk_1B3B370EE;
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    __int16 v35 = 1024;
    int v36 = 472;
LABEL_54:
    _os_log_impl(&dword_1B3AF1000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
  }
  return 22;
}

void __initializeOSLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BiometricKit", "Framework-Internal");
  uint64_t v1 = (void *)__osLog;
  __osLog = (uint64_t)v0;

  if (!__osLog && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __initializeOSLog_block_invoke_cold_2();
  }
  os_log_t v2 = os_log_create("com.apple.BiometricKit", "Framework-API");
  int v3 = (void *)__osLogTrace;
  __osLogTrace = (uint64_t)v2;

  if (!__osLogTrace && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __initializeOSLog_block_invoke_cold_1();
  }
}

void sub_1B3B1485C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B149CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void updateCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (__osLog) {
    double v10 = __osLog;
  }
  else {
    double v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134219010;
    uint64_t v13 = a1;
    __int16 v14 = 2048;
    double v15 = a2;
    __int16 v16 = 2112;
    uint64_t v17 = a3;
    __int16 v18 = 2048;
    uint64_t v19 = a4;
    __int16 v20 = 2112;
    uint64_t v21 = a5;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEBUG, "updateCallback <- notificationCenter:%p, observer:%p, name:%@, object:%p, userInfo:%@\n", (uint8_t *)&v12, 0x34u);
  }
  id v11 = a2;
  [v11 synchronize];
  [v11 updateNotification];
}

void sub_1B3B14C08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B14CF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B15020(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B178C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B18310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B1A90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B1AF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B1B59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t SaveRawImageAsPGM(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)a1 bytes];
  if (v7
    && (unsigned __int16 v8 = (const void *)v7,
        (int v9 = fopen((const char *)[v5 UTF8String], "w")) != 0))
  {
    double v10 = v9;
    fwrite("P5\n", 3uLL, 1uLL, v9);
    if (v6)
    {
      id v11 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#"];
      fprintf(v10, "#%s\n", (const char *)[v11 UTF8String]);
    }
    fprintf(v10, "%i %i 255\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    fwrite(v8, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12), v10);
    fclose(v10);
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

FILE *LoadRawImageAsPGM(uint64_t a1, id a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v15 = -1;
  int v16 = -1;
  int v14 = -1;
  *(void *)a1 = 0;
  uint64_t result = fopen((const char *)[a2 UTF8String], "rb");
  if (result)
  {
    int v4 = result;
    if (!ReadLine(v27, result)) {
      return (FILE *)fclose(v4);
    }
    if (*(unsigned __int16 *)v27 ^ 0x3550 | v28) {
      return (FILE *)fclose(v4);
    }
    if (!ReadLine(v27, v4)) {
      return (FILE *)fclose(v4);
    }
    sscanf(v27, "%i%i%i", &v16, &v15, &v14);
    if (v16 < 1) {
      return (FILE *)fclose(v4);
    }
    int v5 = v15;
    if (v15 == -1)
    {
      if (!ReadLine(v27, v4)) {
        return (FILE *)fclose(v4);
      }
      sscanf(v27, "%i%i", &v15, &v14);
      int v5 = v15;
      if (v15 < 1) {
        return (FILE *)fclose(v4);
      }
    }
    if (v14 == -1)
    {
      if (!ReadLine(v27, v4)) {
        return (FILE *)fclose(v4);
      }
      sscanf(v27, "%i", &v14);
      if (v14 != 255) {
        return (FILE *)fclose(v4);
      }
      int v5 = v15;
    }
    uint64_t v6 = (unsigned __int128)(v5 * (__int128)v16) >> 64;
    if (v6)
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v18 = "__os_warn_unused(__builtin_mul_overflow((width), (height), (&bufferSize))) == 0 ";
        __int16 v19 = 2048;
        uint64_t v20 = v6 & 1;
        __int16 v21 = 2080;
        uint64_t v22 = &unk_1B3B370EE;
        __int16 v23 = 2080;
        double v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        __int16 v25 = 1024;
        int v26 = 186;
        _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      uint64_t v7 = malloc_type_malloc(v16 * (uint64_t)v5, 0x8C79FD79uLL);
      if (v7)
      {
        unsigned __int16 v8 = v7;
        size_t v9 = fread(v7, v16, v15, v4);
        int v10 = v15;
        if (v9 == v15)
        {
          int v11 = v16;
          *(_DWORD *)(a1 + 8) = v16;
          *(_DWORD *)(a1 + 12) = v10;
          *(void *)a1 = CFRetain((CFTypeRef)[MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:v11 * v10]);
        }
        else
        {
          if (__osLog) {
            uint64_t v13 = __osLog;
          }
          else {
            uint64_t v13 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            __int16 v18 = "bytes == height";
            __int16 v19 = 2048;
            uint64_t v20 = 0;
            __int16 v21 = 2080;
            uint64_t v22 = &unk_1B3B370EE;
            __int16 v23 = 2080;
            double v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
            __int16 v25 = 1024;
            int v26 = 193;
            _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          free(v8);
        }
      }
    }
    return (FILE *)fclose(v4);
  }
  return result;
}

const char *ReadLine(char *a1, FILE *a2)
{
  while (1)
  {
    int v4 = fgets(a1, 1024, a2);
    if (!v4) {
      break;
    }
    int v5 = v4;
    do
    {
      uint64_t v6 = v5;
      int v8 = *v5++;
      int v7 = v8;
    }
    while (v8 && v7 < 33);
    size_t v9 = strlen(v6);
    if (v9 == 1)
    {
      int v11 = v7;
    }
    else
    {
      size_t v10 = v9 - 2;
      do
      {
        if (v5[v10] > 32) {
          break;
        }
        v5[v10--] = 0;
      }
      while (v10 != -1);
      int v11 = *(unsigned __int8 *)v6;
    }
    if (v11 != 35) {
      return v6;
    }
  }
  return 0;
}

uint64_t AppendCommentToPGM(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  int v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
  uint64_t v6 = v5;
  if (v5 && [v5 length])
  {
    id v7 = v6;
    int v8 = (unsigned char *)[v7 bytes];
    unint64_t v9 = (unint64_t)&v8[[v7 length]];
    size_t v10 = v8;
    while (1)
    {
      int v11 = (char *)memchr(v10, 10, [v7 length]);
      if (!v11)
      {
        if (__osLog) {
          __int16 v18 = __osLog;
        }
        else {
          __int16 v18 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v21 = "p";
          __int16 v22 = 2048;
          uint64_t v23 = 0;
          __int16 v24 = 2080;
          __int16 v25 = &unk_1B3B370EE;
          __int16 v26 = 2080;
          int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          __int16 v28 = 1024;
          int v29 = 230;
          _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_18;
      }
      size_t v10 = v11 + 1;
      if ((unint64_t)(v11 + 1) >= v9) {
        break;
      }
      if (*v10 != 35) {
        goto LABEL_9;
      }
    }
    size_t v10 = v11;
LABEL_9:
    uint64_t v12 = fopen((const char *)[v3 UTF8String], "w");
    if (!v12) {
      goto LABEL_18;
    }
    uint64_t v13 = v12;
    uint64_t v14 = v10 - v8;
    fwrite(v8, v10 - v8, 1uLL, v12);
    if (v4)
    {
      id v15 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#"];
      fprintf(v13, "#%s\n", (const char *)[v15 UTF8String]);
    }
    uint64_t v16 = [v7 length];
    uint64_t v17 = 1;
    fwrite(v10, v16 - v14, 1uLL, v13);
    fclose(v13);
  }
  else
  {
LABEL_18:
    uint64_t v17 = 0;
  }

  return v17;
}

void RIESInit(void *a1)
{
}

void RIESClear(char *a1)
{
  uint64_t v2 = -4800;
  do
  {
    id v3 = *(const void **)&a1[v2 + 4800];
    if (v3) {
      CFRelease(v3);
    }
    v2 += 16;
  }
  while (v2);
  bzero(a1, 0x12C0uLL);
}

void RIESAdd(uint64_t a1, _OWORD *a2, unsigned int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x80000000) != 0)
  {
    if (__osLog) {
      uint64_t v6 = __osLog;
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      int v8 = "nodeIndex >= 0";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      uint64_t v12 = &unk_1B3B370EE;
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      __int16 v15 = 1024;
      int v16 = 277;
      _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  else
  {
    id v4 = (CFTypeRef *)(a1 + 16 * a3);
    if (*v4) {
      CFRelease(*v4);
    }
    *(_OWORD *)id v4 = *a2;
    CFTypeRef v5 = *v4;
    if (*v4)
    {
      CFRetain(v5);
    }
  }
}

void RIESSave(void *a1, void *a2)
{
  DirectoryNameForIdentity(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

  for (uint64_t i = 0; i != 300; ++i)
  {
    if (*a1)
    {
      CFTypeRef v5 = [NSString stringWithFormat:@"%@/%i.pgm", v6, i];
      SaveRawImageAsPGM((uint64_t)a1, v5, 0);
    }
    a1 += 2;
  }
}

id DirectoryNameForIdentity(void *a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = [a1 uuid];
  id v3 = [v2 UUIDString];
  id v4 = [v1 stringWithFormat:@"%@/%@", @"/var/mobile/BiometricKit/biometrickitd", v3];

  return v4;
}

void RIESLoad(uint64_t a1, void *a2)
{
  DirectoryNameForIdentity(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 0; i != 300; ++i)
  {
    id v4 = [NSString stringWithFormat:@"%@/%i.pgm", v5, i];
    LoadRawImageAsPGM(a1, v4);

    a1 += 16;
  }
}

void RIESDelete(void *a1)
{
  DirectoryNameForIdentity(a1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v1 removeItemAtPath:v2 error:0];
}

void RIESUpdate(void *a1, void *a2, uint64_t a3)
{
  DirectoryNameForIdentity(a1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [NSString stringWithFormat:@"%@/%i.pgm", v7, a3];
  if (*a2)
  {
    SaveRawImageAsPGM((uint64_t)a2, v5, 0);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 removeItemAtPath:v5 error:0];
  }
}

double roundMostSignificant(int a1)
{
  id v2 = objc_msgSend(NSNumber, "numberWithDouble:");
  id v3 = (void *)roundMostSignificant_formatter;
  if (!roundMostSignificant_formatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v5 = (void *)roundMostSignificant_formatter;
    roundMostSignificant_formatter = (uint64_t)v4;

    [(id)roundMostSignificant_formatter setMaximumSignificantDigits:a1];
    [(id)roundMostSignificant_formatter setUsesSignificantDigits:1];
    id v3 = (void *)roundMostSignificant_formatter;
  }
  id v6 = [v3 stringFromNumber:v2];
  id v7 = [v3 numberFromString:v6];
  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

id rotateBitmap90Data8(char *a1, int a2, int a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v18 = 136316162;
    __int16 v19 = "inData != ((void *)0)";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v26 = 1024;
    int v27 = 376;
    goto LABEL_28;
  }
  if (a2 < 1 || a3 <= 0)
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v18 = 136316162;
    __int16 v19 = "(inW > 0) && (inH > 0)";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v26 = 1024;
    int v27 = 377;
    goto LABEL_28;
  }
  id v5 = a1;
  size_t v6 = a3 * a2;
  id v7 = malloc_type_malloc(v6, 0x53894718uLL);
  if (v7)
  {
    double v8 = v7;
    uint64_t v9 = 0;
    int v10 = a3 - 1;
    do
    {
      uint64_t v11 = a2;
      uint64_t v12 = v5;
      uint64_t v13 = v10;
      do
      {
        char v14 = *v12++;
        *((unsigned char *)v7 + v13) = v14;
        v13 += a3;
        --v11;
      }
      while (v11);
      ++v9;
      --v10;
      v5 += a2;
    }
    while (v9 != a3);
    __int16 v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:v6];
    free(v8);
    goto LABEL_10;
  }
  if (__osLog) {
    uint64_t v17 = __osLog;
  }
  else {
    uint64_t v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136316162;
    __int16 v19 = "data8";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v26 = 1024;
    int v27 = 380;
LABEL_28:
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
  }
LABEL_29:
  __int16 v15 = 0;
LABEL_10:
  return v15;
}

id rotateBitmap90Data16(__int16 *a1, int a2, int a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v18 = 136316162;
    __int16 v19 = "inData != ((void *)0)";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v26 = 1024;
    int v27 = 410;
    goto LABEL_28;
  }
  if (a2 < 1 || a3 <= 0)
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v18 = 136316162;
    __int16 v19 = "(inW > 0) && (inH > 0)";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v26 = 1024;
    int v27 = 411;
    goto LABEL_28;
  }
  id v5 = a1;
  size_t v6 = 2 * a3 * a2;
  id v7 = (char *)malloc_type_malloc(v6, 0x6489FE91uLL);
  if (v7)
  {
    double v8 = v7;
    uint64_t v9 = 0;
    int v10 = a3 - 1;
    do
    {
      uint64_t v11 = 2 * v10;
      uint64_t v12 = a2;
      uint64_t v13 = v5;
      do
      {
        __int16 v14 = *v13++;
        *(_WORD *)&v7[v11] = v14;
        v11 += 2 * a3;
        --v12;
      }
      while (v12);
      ++v9;
      --v10;
      v5 += a2;
    }
    while (v9 != a3);
    __int16 v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:v6];
    free(v8);
    goto LABEL_10;
  }
  if (__osLog) {
    uint64_t v17 = __osLog;
  }
  else {
    uint64_t v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136316162;
    __int16 v19 = "data16";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_1B3B370EE;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v26 = 1024;
    int v27 = 414;
LABEL_28:
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
  }
LABEL_29:
  __int16 v15 = 0;
LABEL_10:
  return v15;
}

unint64_t absoluteToNanoseconds(uint64_t a1)
{
  kern_return_t v3;
  NSObject *v5;
  kern_return_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = dword_1EB479924;
  if (!dword_1EB479924)
  {
    id v3 = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    if (v3)
    {
      size_t v6 = v3;
      if (__osLog) {
        id v5 = __osLog;
      }
      else {
        id v5 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        double v8 = "err == 0 ";
        uint64_t v9 = 2048;
        int v10 = v6;
        uint64_t v11 = 2080;
        uint64_t v12 = &unk_1B3B370EE;
        uint64_t v13 = 2080;
        __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        __int16 v15 = 1024;
        int v16 = 451;
        _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      unsigned int v2 = 1;
      dword_1EB479924 = 1;
    }
    else
    {
      unsigned int v2 = dword_1EB479924;
    }
  }
  return (unint64_t)sTimebaseInfo * a1 / v2;
}

unint64_t nanosecondsToAbsolute(uint64_t a1)
{
  kern_return_t v2;
  NSObject *v4;
  kern_return_t v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  int v16 = *MEMORY[0x1E4F143B8];
  if (!dword_1EB479924)
  {
    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    unsigned int v2 = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    if (v2)
    {
      id v5 = v2;
      if (__osLog) {
        id v4 = __osLog;
      }
      else {
        id v4 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        id v7 = "err == 0 ";
        double v8 = 2048;
        uint64_t v9 = v5;
        int v10 = 2080;
        uint64_t v11 = &unk_1B3B370EE;
        uint64_t v12 = 2080;
        uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        __int16 v14 = 1024;
        __int16 v15 = 475;
        _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      sTimebaseInfo = 1;
    }
  }
  return (unint64_t)dword_1EB479924 * a1 / sTimebaseInfo;
}

unint64_t localizeAbsolute(uint64_t a1, unsigned int *a2)
{
  unsigned int v4 = dword_1EB479924;
  if (!dword_1EB479924)
  {
    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    unsigned int v4 = dword_1EB479924;
  }
  return (unint64_t)*a2 * a1 / a2[1] * v4 / sTimebaseInfo;
}

unint64_t absoluteToMiliseconds(uint64_t a1)
{
  return absoluteToNanoseconds(a1) / 0xF4240;
}

uint64_t dictionaryGetBool(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v6 && a3)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    if (v7)
    {
      double v8 = (void *)v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v9 = [v8 BOOLValue];
        uint64_t v10 = 0;
      }
      else
      {
        if (__osLog) {
          uint64_t v13 = __osLog;
        }
        else {
          uint64_t v13 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136316162;
          __int16 v15 = "[value isKindOfClass:[NSNumber class]]";
          __int16 v16 = 2048;
          uint64_t v17 = 0;
          __int16 v18 = 2080;
          __int16 v19 = &unk_1B3B370EE;
          __int16 v20 = 2080;
          uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          __int16 v22 = 1024;
          int v23 = 523;
          _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
        }
        char v9 = 0;
        uint64_t v10 = 258;
      }

      goto LABEL_9;
    }
    uint64_t v10 = 0;
LABEL_8:
    char v9 = 0;
LABEL_9:
    *a3 = v9;
    goto LABEL_10;
  }
  if (__osLog) {
    uint64_t v12 = __osLog;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136316162;
    __int16 v15 = "key != ((void *)0) && BOOLValue != ((void *)0)";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = &unk_1B3B370EE;
    __int16 v20 = 2080;
    uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v22 = 1024;
    int v23 = 518;
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
  }
  uint64_t v10 = 258;
  if (a3) {
    goto LABEL_8;
  }
LABEL_10:

  return v10;
}

uint64_t dictionaryGetInteger(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v6 && a3)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [(id)v7 integerValue];

        uint64_t v7 = 0;
      }
      else
      {
        if (__osLog) {
          uint64_t v11 = __osLog;
        }
        else {
          uint64_t v11 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316162;
          uint64_t v13 = "[value isKindOfClass:[NSNumber class]]";
          __int16 v14 = 2048;
          uint64_t v15 = 0;
          __int16 v16 = 2080;
          uint64_t v17 = &unk_1B3B370EE;
          __int16 v18 = 2080;
          __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          __int16 v20 = 1024;
          int v21 = 549;
          _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
        }

        uint64_t v8 = 0;
        uint64_t v7 = 258;
      }
    }
    else
    {
      uint64_t v8 = *a3;
    }
    goto LABEL_7;
  }
  if (__osLog) {
    uint64_t v10 = __osLog;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136316162;
    uint64_t v13 = "key != ((void *)0) && intValue != ((void *)0)";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    uint64_t v17 = &unk_1B3B370EE;
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v20 = 1024;
    int v21 = 544;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
  }
  uint64_t v7 = 258;
  if (a3)
  {
    uint64_t v8 = 0;
LABEL_7:
    *a3 = v8;
  }

  return v7;
}

uint64_t dictionaryGetDouble(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v6 && a3)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(id)v7 doubleValue];
        uint64_t v9 = v8;

        uint64_t v7 = 0;
      }
      else
      {
        if (__osLog) {
          int v12 = __osLog;
        }
        else {
          int v12 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = 136316162;
          __int16 v14 = "[value isKindOfClass:[NSNumber class]]";
          __int16 v15 = 2048;
          uint64_t v16 = 0;
          __int16 v17 = 2080;
          __int16 v18 = &unk_1B3B370EE;
          __int16 v19 = 2080;
          __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          __int16 v21 = 1024;
          int v22 = 579;
          _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
        }

        uint64_t v9 = 0;
        uint64_t v7 = 258;
      }
    }
    else
    {
      uint64_t v9 = *a3;
    }
LABEL_7:
    *a3 = v9;
    goto LABEL_8;
  }
  if (__osLog) {
    uint64_t v11 = __osLog;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136316162;
    __int16 v14 = "key != ((void *)0) && doubleValue != ((void *)0)";
    __int16 v15 = 2048;
    uint64_t v16 = 0;
    __int16 v17 = 2080;
    __int16 v18 = &unk_1B3B370EE;
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v21 = 1024;
    int v22 = 574;
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
  }
  uint64_t v9 = 0;
  uint64_t v7 = 258;
  if (a3) {
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

uint64_t dictionaryGetData(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v6 && a3)
  {
    id v7 = [v5 objectForKeyedSubscript:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v8;
        uint64_t v9 = 0;
        uint64_t v8 = v7;
      }
      else
      {
        if (__osLog) {
          int v13 = __osLog;
        }
        else {
          int v13 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136316162;
          __int16 v15 = "[value isKindOfClass:[NSData class]]";
          __int16 v16 = 2048;
          uint64_t v17 = 0;
          __int16 v18 = 2080;
          __int16 v19 = &unk_1B3B370EE;
          __int16 v20 = 2080;
          __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          __int16 v22 = 1024;
          int v23 = 609;
          _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
        }
        id v7 = 0;
        uint64_t v9 = 258;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    goto LABEL_7;
  }
  if (__osLog) {
    int v12 = __osLog;
  }
  else {
    int v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136316162;
    __int16 v15 = "key != ((void *)0) && dataValue != ((void *)0)";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = &unk_1B3B370EE;
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    __int16 v22 = 1024;
    int v23 = 604;
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
  }
  uint64_t v9 = 258;
  if (a3)
  {
    id v7 = 0;
    uint64_t v8 = 0;
LABEL_7:
    id v10 = v7;
    *a3 = v10;
  }
  return v9;
}

uint64_t getSensorPatchVersion()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v0 = IOServiceMatching("AppleBiometricSensor");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v0);
  io_object_t v2 = MatchingService;
  if (MatchingService)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"patch-version", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    unsigned int v4 = CFProperty;
    if (CFProperty)
    {
      uint64_t v5 = [CFProperty integerValue];
      id v6 = v4;
    }
    else
    {
      if (__osLog) {
        uint64_t v9 = __osLog;
      }
      else {
        uint64_t v9 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136316162;
        uint64_t v11 = "property";
        __int16 v12 = 2048;
        uint64_t v13 = 0;
        __int16 v14 = 2080;
        __int16 v15 = &unk_1B3B370EE;
        __int16 v16 = 2080;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        __int16 v18 = 1024;
        int v19 = 636;
        _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
      }
      id v6 = 0;
      uint64_t v5 = -1;
    }
    IOObjectRelease(v2);
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v8 = __osLog;
    }
    else {
      uint64_t v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      uint64_t v11 = "service != 0";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      __int16 v15 = &unk_1B3B370EE;
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      __int16 v18 = 1024;
      int v19 = 633;
      _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    return -1;
  }
  return v5;
}

uint64_t isTouchIDPlatformWithFailure(unsigned char *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((isTouchIDPlatformWithFailure_checked & 1) == 0)
  {
    io_object_t v2 = MEMORY[0x1E4F14500];
    if (__osLogTrace) {
      id v3 = __osLogTrace;
    }
    else {
      id v3 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_1B3AF1000, v3, OS_LOG_TYPE_DEFAULT, "isTouchIDPlatform() <-\n", (uint8_t *)v6, 2u);
    }
    isTouchIDPlatformWithFailure_checked = 1;
    isTouchIDPlatformWithFailure_uint64_t result = MGGetBoolAnswer();
    if (__osLogTrace) {
      unsigned int v4 = __osLogTrace;
    }
    else {
      unsigned int v4 = v2;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = isTouchIDPlatformWithFailure_result;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_DEFAULT, "isTouchIDPlatform() -> %d\n", (uint8_t *)v6, 8u);
    }
  }
  if (a1) {
    *a1 = 0;
  }
  return isTouchIDPlatformWithFailure_result;
}

uint64_t isTouchIDPlatform()
{
  return isTouchIDPlatformWithFailure(0);
}

uint64_t isFaceIDPlatform()
{
  if (isFaceIDPlatform_onceToken != -1) {
    dispatch_once(&isFaceIDPlatform_onceToken, &__block_literal_global_2);
  }
  return isFaceIDPlatform_faceIDPlatform;
}

void __isFaceIDPlatform_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/arm-io/pearl-sep");
  if (v0)
  {
    isFaceIDPlatform_faceIDPlatform = 1;
    IOObjectRelease(v0);
  }
  if (__osLog) {
    uint64_t v1 = __osLog;
  }
  else {
    uint64_t v1 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = isFaceIDPlatform_faceIDPlatform;
    _os_log_impl(&dword_1B3AF1000, v1, OS_LOG_TYPE_DEFAULT, "isFaceIDPlatform(): faceIDPlatform = %d\n", (uint8_t *)v2, 8u);
  }
}

uint64_t isEphemeralMultiUser()
{
  if (isEphemeralMultiUser_onceToken != -1) {
    dispatch_once(&isEphemeralMultiUser_onceToken, &__block_literal_global_52);
  }
  return isEphemeralMultiUser_ephemeralMultiUser;
}

void __isEphemeralMultiUser_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  isEphemeralMultiUser_ephemeralMultiUser = [v0 isSharedIPad];

  if (isEphemeralMultiUser_ephemeralMultiUser)
  {
    if (__osLog) {
      uint64_t v1 = __osLog;
    }
    else {
      uint64_t v1 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v2[0] = 67109120;
      v2[1] = isEphemeralMultiUser_ephemeralMultiUser;
      _os_log_impl(&dword_1B3AF1000, v1, OS_LOG_TYPE_DEFAULT, "isEphemeralMultiUser(): ephemeralMultiUser = %d\n", (uint8_t *)v2, 8u);
    }
  }
}

uint64_t getCurrentUserID()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v1 = [v0 currentUser];

  if (v1)
  {
    uint64_t v2 = [v1 uid];
  }
  else
  {
    if (__osLog) {
      unsigned int v4 = __osLog;
    }
    else {
      unsigned int v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136316162;
      id v6 = "user";
      __int16 v7 = 2048;
      uint64_t v8 = 0;
      __int16 v9 = 2080;
      int v10 = &unk_1B3B370EE;
      __int16 v11 = 2080;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      __int16 v13 = 1024;
      int v14 = 832;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v5, 0x30u);
    }
    uint64_t v2 = 0xFFFFFFFFLL;
  }

  return v2;
}

id getBootArgs()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  if (v0)
  {
    io_object_t v1 = v0;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, @"boot-args", 0, 0);
    IOObjectRelease(v1);
  }
  else
  {
    CFProperty = 0;
  }
  return CFProperty;
}

uint64_t isInternalBuild()
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_60);
  }
  return isInternalBuild_isInternal;
}

uint64_t __isInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalBuild_isInternal = result;
  return result;
}

void sub_1B3B223EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B3B227C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B22A58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B22B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B22ED8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B2331C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __statusToFingerprintCaptureError(int a1)
{
  int v1 = a1 - 78;
  uint64_t result = 0;
  switch(v1)
  {
    case 0:
      uint64_t result = 6;
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      return result;
    case 7:
      uint64_t result = 1;
      break;
    case 8:
      uint64_t result = 2;
      break;
    case 9:
      uint64_t result = 3;
      break;
    case 10:
      uint64_t result = 4;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t __faceDetectFeedback(uint64_t result)
{
  if ((unint64_t)(result - 2) >= 0xC) {
    return 1;
  }
  return result;
}

uint64_t __periocularMatchState(char a1)
{
  return a1 & 0x3F;
}

uint64_t __passcodeShortcutReason(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

void sub_1B3B2FE7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B3318C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B334B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

id setError(id result, void *a2)
{
  if (a2)
  {
    uint64_t result = +[BKErrorHelper errorWithCode:result];
    *a2 = result;
  }
  return result;
}

id setErrorWithOSStatus(id result, void *a2)
{
  if (a2)
  {
    uint64_t result = +[BKErrorHelper errorWithOSStatus:result];
    *a2 = result;
  }
  return result;
}

void __initializeOSLog_block_invoke_cold_1()
{
  *(_WORD *)io_registry_entry_t v0 = 0;
  _os_log_error_impl(&dword_1B3AF1000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Framework-API'!\n", v0, 2u);
}

void __initializeOSLog_block_invoke_cold_2()
{
  *(_WORD *)io_registry_entry_t v0 = 0;
  _os_log_error_impl(&dword_1B3AF1000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Framework-Internal'!\n", v0, 2u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
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

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1F40CC100](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
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