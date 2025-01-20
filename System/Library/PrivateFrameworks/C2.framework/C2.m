id _CKGetCachedGestaltValue(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t vars8;

  v1 = _CKGetCachedGestaltValues_pred;
  v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_CKGetCachedGestaltValues_pred, &__block_literal_global_41_0);
  }
  v3 = [(id)_CKCachedGestaltValues objectForKeyedSubscript:v2];

  return v3;
}

id processInfoDict()
{
  if (processInfoDict_onceToken != -1) {
    dispatch_once(&processInfoDict_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)processInfoDict_processInfoDict;
  return v0;
}

void sub_1DD527548(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DD528194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCloudTelemetryReporterClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCloudTelemetryReporterClass_softClass;
  uint64_t v7 = getCloudTelemetryReporterClass_softClass;
  if (!getCloudTelemetryReporterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCloudTelemetryReporterClass_block_invoke;
    v3[3] = &unk_1E6CCBF50;
    v3[4] = &v4;
    __getCloudTelemetryReporterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DD5288BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD52A640(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD52A860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD52AE68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD52AF7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t c2_callstack_annotation_ThirdParty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_1DD52B454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  objc_sync_exit(v11);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DD52BDC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD52DE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1DD52DF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DD52EF88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD52F6A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5312B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  objc_sync_exit(v35);
  _Block_object_dispose((const void *)(v36 - 160), 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1DD531918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1DD531AC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD532650(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD532768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD532868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DD532F94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD533128(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD533490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD534B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj)
{
  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_1DD534F18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD535220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL C2MPInternalTestConfigReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v10 >> 3) == 102) {
        break;
      }
      if ((v10 >> 3) == 101)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t C2MPGenericEventMetricValueReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v10 >> 3) == 103)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_35;
          }
          v21 += 7;
          BOOL v15 = v22++ >= 9;
          if (v15)
          {
            uint64_t v23 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_37:
        *(void *)(a1 + 8) = v23;
      }
      else if (v18 == 102)
      {
        *(unsigned char *)(a1 + 32) |= 2u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        *(void *)(a1 + 16) = v30;
      }
      else if (v18 == 101)
      {
        uint64_t v19 = PBReaderReadString();
        v20 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v19;
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

uint64_t C2MPCloudKitOperationInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      unint64_t v17 = v10 >> 3;
      if ((int)(v10 >> 3) > 100)
      {
        if (v17 == 101)
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (1)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if ((v32 & 0x80) == 0) {
              goto LABEL_47;
            }
            v27 += 7;
            BOOL v14 = v28++ >= 9;
            if (v14)
            {
              uint64_t v29 = 0;
              goto LABEL_49;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_49:
          *(unsigned char *)(a1 + 32) = v29 != 0;
        }
        else
        {
          if (v17 != 201)
          {
LABEL_40:
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
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
              goto LABEL_43;
            }
            v20 += 7;
            BOOL v14 = v21++ >= 9;
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
          *(_DWORD *)(a1 + 8) = v22;
        }
      }
      else
      {
        if (v17 == 1)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
        }
        else
        {
          if (v17 != 2) {
            goto LABEL_40;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
        }
        unint64_t v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t C2MPPathInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      unint64_t v17 = v10 >> 3;
      if ((int)(v10 >> 3) > 199)
      {
        if (v17 == 200)
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (1)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v22 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0) {
              goto LABEL_47;
            }
            v27 += 7;
            BOOL v14 = v28++ >= 9;
            if (v14)
            {
              uint64_t v22 = 0;
              goto LABEL_49;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_49:
          uint64_t v33 = 16;
        }
        else
        {
          if (v17 != 201)
          {
LABEL_40:
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
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
              goto LABEL_43;
            }
            v20 += 7;
            BOOL v14 = v21++ >= 9;
            if (v14)
            {
              uint64_t v22 = 0;
              goto LABEL_45;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_45:
          uint64_t v33 = 8;
        }
        *(void *)(a1 + v33) = v22;
      }
      else
      {
        if (v17 == 100)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
        }
        else
        {
          if (v17 != 101) {
            goto LABEL_40;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 32;
        }
        unint64_t v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t C2MPNetworkEventReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x1EAB53000uLL;
  char v8 = (int *)MEMORY[0x1E4F940B8];
  unint64_t v9 = 0x1EAB53000uLL;
  unint64_t v10 = 0x1EAB53000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v8) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    unint64_t v20 = v13 >> 3;
    if ((int)(v13 >> 3) > 149)
    {
      switch((int)v20)
      {
        case 301:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 34;
          goto LABEL_188;
        case 302:
          char v92 = 0;
          unsigned int v93 = 0;
          uint64_t v94 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x20000000u;
          while (2)
          {
            uint64_t v95 = *v3;
            unint64_t v96 = *(void *)(a2 + v95);
            if (v96 == -1 || v96 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v97 = *(unsigned char *)(*(void *)(a2 + *v8) + v96);
              *(void *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                BOOL v17 = v93++ >= 9;
                if (v17)
                {
                  uint64_t v94 = 0;
                  goto LABEL_324;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v94 = 0;
          }
LABEL_324:
          BOOL v201 = v94 != 0;
          uint64_t v202 = 310;
          goto LABEL_358;
        case 303:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v100 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x40000000u;
          while (2)
          {
            uint64_t v101 = *v3;
            unint64_t v102 = *(void *)(a2 + v101);
            if (v102 == -1 || v102 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v103 = *(unsigned char *)(*(void *)(a2 + *v8) + v102);
              *(void *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                BOOL v17 = v99++ >= 9;
                if (v17)
                {
                  uint64_t v100 = 0;
                  goto LABEL_328;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v100 = 0;
          }
LABEL_328:
          BOOL v201 = v100 != 0;
          uint64_t v202 = 311;
          goto LABEL_358;
        case 304:
          char v104 = 0;
          unsigned int v105 = 0;
          uint64_t v106 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x4000000u;
          while (2)
          {
            uint64_t v107 = *v3;
            unint64_t v108 = *(void *)(a2 + v107);
            if (v108 == -1 || v108 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v109 = *(unsigned char *)(*(void *)(a2 + *v8) + v108);
              *(void *)(a2 + v107) = v108 + 1;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                BOOL v17 = v105++ >= 9;
                if (v17)
                {
                  uint64_t v106 = 0;
                  goto LABEL_332;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v106 = 0;
          }
LABEL_332:
          BOOL v201 = v106 != 0;
          uint64_t v202 = 307;
          goto LABEL_358;
        case 305:
          char v110 = 0;
          unsigned int v111 = 0;
          uint64_t v112 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x8000000u;
          while (2)
          {
            uint64_t v113 = *v3;
            unint64_t v114 = *(void *)(a2 + v113);
            if (v114 == -1 || v114 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v115 = *(unsigned char *)(*(void *)(a2 + *v8) + v114);
              *(void *)(a2 + v113) = v114 + 1;
              v112 |= (unint64_t)(v115 & 0x7F) << v110;
              if (v115 < 0)
              {
                v110 += 7;
                BOOL v17 = v111++ >= 9;
                if (v17)
                {
                  uint64_t v112 = 0;
                  goto LABEL_336;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v112 = 0;
          }
LABEL_336:
          BOOL v201 = v112 != 0;
          uint64_t v202 = 308;
          goto LABEL_358;
        case 306:
          char v116 = 0;
          unsigned int v117 = 0;
          uint64_t v46 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x200000u;
          while (2)
          {
            uint64_t v118 = *v3;
            unint64_t v119 = *(void *)(a2 + v118);
            if (v119 == -1 || v119 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v120 = *(unsigned char *)(*(void *)(a2 + *v8) + v119);
              *(void *)(a2 + v118) = v119 + 1;
              v46 |= (unint64_t)(v120 & 0x7F) << v116;
              if (v120 < 0)
              {
                v116 += 7;
                BOOL v17 = v117++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_340;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v46) = 0;
          }
LABEL_340:
          uint64_t v203 = 296;
          goto LABEL_345;
        case 307:
          char v121 = 0;
          unsigned int v122 = 0;
          uint64_t v46 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x400000u;
          while (2)
          {
            uint64_t v123 = *v3;
            unint64_t v124 = *(void *)(a2 + v123);
            if (v124 == -1 || v124 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v125 = *(unsigned char *)(*(void *)(a2 + *v8) + v124);
              *(void *)(a2 + v123) = v124 + 1;
              v46 |= (unint64_t)(v125 & 0x7F) << v121;
              if (v125 < 0)
              {
                v121 += 7;
                BOOL v17 = v122++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_344;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v46) = 0;
          }
LABEL_344:
          uint64_t v203 = 300;
          goto LABEL_345;
        case 308:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 35;
          goto LABEL_188;
        case 309:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 36;
          goto LABEL_188;
        case 310:
          char v126 = 0;
          unsigned int v127 = 0;
          uint64_t v128 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x10000000u;
          while (2)
          {
            uint64_t v129 = *v3;
            unint64_t v130 = *(void *)(a2 + v129);
            if (v130 == -1 || v130 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v131 = *(unsigned char *)(*(void *)(a2 + *v8) + v130);
              *(void *)(a2 + v129) = v130 + 1;
              v128 |= (unint64_t)(v131 & 0x7F) << v126;
              if (v131 < 0)
              {
                v126 += 7;
                BOOL v17 = v127++ >= 9;
                if (v17)
                {
                  uint64_t v128 = 0;
                  goto LABEL_349;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v128 = 0;
          }
LABEL_349:
          BOOL v201 = v128 != 0;
          uint64_t v202 = 309;
          goto LABEL_358;
        case 311:
          char v132 = 0;
          unsigned int v133 = 0;
          uint64_t v134 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x80000000;
          while (2)
          {
            uint64_t v135 = *v3;
            unint64_t v136 = *(void *)(a2 + v135);
            if (v136 == -1 || v136 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v137 = *(unsigned char *)(*(void *)(a2 + *v8) + v136);
              *(void *)(a2 + v135) = v136 + 1;
              v134 |= (unint64_t)(v137 & 0x7F) << v132;
              if (v137 < 0)
              {
                v132 += 7;
                BOOL v17 = v133++ >= 9;
                if (v17)
                {
                  uint64_t v134 = 0;
                  goto LABEL_353;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v134 = 0;
          }
LABEL_353:
          BOOL v201 = v134 != 0;
          uint64_t v202 = 312;
          goto LABEL_358;
        case 312:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
          goto LABEL_188;
        case 313:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 33;
          goto LABEL_188;
        case 314:
          char v139 = 0;
          unsigned int v140 = 0;
          uint64_t v141 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x2000000u;
          while (2)
          {
            uint64_t v142 = *v3;
            unint64_t v143 = *(void *)(a2 + v142);
            if (v143 == -1 || v143 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v144 = *(unsigned char *)(*(void *)(a2 + *v8) + v143);
              *(void *)(a2 + v142) = v143 + 1;
              v141 |= (unint64_t)(v144 & 0x7F) << v139;
              if (v144 < 0)
              {
                v139 += 7;
                BOOL v17 = v140++ >= 9;
                if (v17)
                {
                  uint64_t v141 = 0;
                  goto LABEL_357;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v141 = 0;
          }
LABEL_357:
          BOOL v201 = v141 != 0;
          uint64_t v202 = 306;
          goto LABEL_358;
        default:
          switch((int)v20)
          {
            case 201:
              char v23 = 0;
              unsigned int v24 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x20u;
              while (2)
              {
                uint64_t v26 = *v3;
                unint64_t v27 = *(void *)(a2 + v26);
                if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v28 = *(unsigned char *)(*(void *)(a2 + *v8) + v27);
                  *(void *)(a2 + v26) = v27 + 1;
                  v25 |= (unint64_t)(v28 & 0x7F) << v23;
                  if (v28 < 0)
                  {
                    v23 += 7;
                    BOOL v17 = v24++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_320;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_320:
              uint64_t v200 = 48;
              goto LABEL_403;
            case 202:
              char v145 = 0;
              unsigned int v146 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x80u;
              while (2)
              {
                uint64_t v147 = *v3;
                unint64_t v148 = *(void *)(a2 + v147);
                if (v148 == -1 || v148 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v149 = *(unsigned char *)(*(void *)(a2 + *v8) + v148);
                  *(void *)(a2 + v147) = v148 + 1;
                  v25 |= (unint64_t)(v149 & 0x7F) << v145;
                  if (v149 < 0)
                  {
                    v145 += 7;
                    BOOL v17 = v146++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_362;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_362:
              uint64_t v200 = 64;
              goto LABEL_403;
            case 203:
              char v150 = 0;
              unsigned int v151 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x40u;
              while (2)
              {
                uint64_t v152 = *v3;
                unint64_t v153 = *(void *)(a2 + v152);
                if (v153 == -1 || v153 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v154 = *(unsigned char *)(*(void *)(a2 + *v8) + v153);
                  *(void *)(a2 + v152) = v153 + 1;
                  v25 |= (unint64_t)(v154 & 0x7F) << v150;
                  if (v154 < 0)
                  {
                    v150 += 7;
                    BOOL v17 = v151++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_366;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_366:
              uint64_t v200 = 56;
              goto LABEL_403;
            case 204:
              char v155 = 0;
              unsigned int v156 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x200u;
              while (2)
              {
                uint64_t v157 = *v3;
                unint64_t v158 = *(void *)(a2 + v157);
                if (v158 == -1 || v158 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v159 = *(unsigned char *)(*(void *)(a2 + *v8) + v158);
                  *(void *)(a2 + v157) = v158 + 1;
                  v25 |= (unint64_t)(v159 & 0x7F) << v155;
                  if (v159 < 0)
                  {
                    v155 += 7;
                    BOOL v17 = v156++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_370;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_370:
              uint64_t v200 = 80;
              goto LABEL_403;
            case 205:
              char v160 = 0;
              unsigned int v161 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x100u;
              while (2)
              {
                uint64_t v162 = *v3;
                unint64_t v163 = *(void *)(a2 + v162);
                if (v163 == -1 || v163 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v164 = *(unsigned char *)(*(void *)(a2 + *v8) + v163);
                  *(void *)(a2 + v162) = v163 + 1;
                  v25 |= (unint64_t)(v164 & 0x7F) << v160;
                  if (v164 < 0)
                  {
                    v160 += 7;
                    BOOL v17 = v161++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_374;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_374:
              uint64_t v200 = 72;
              goto LABEL_403;
            case 206:
              char v165 = 0;
              unsigned int v166 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x10000u;
              while (2)
              {
                uint64_t v167 = *v3;
                unint64_t v168 = *(void *)(a2 + v167);
                if (v168 == -1 || v168 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v169 = *(unsigned char *)(*(void *)(a2 + *v8) + v168);
                  *(void *)(a2 + v167) = v168 + 1;
                  v25 |= (unint64_t)(v169 & 0x7F) << v165;
                  if (v169 < 0)
                  {
                    v165 += 7;
                    BOOL v17 = v166++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_378;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_378:
              uint64_t v200 = 136;
              goto LABEL_403;
            case 207:
              char v170 = 0;
              unsigned int v171 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x8000u;
              while (2)
              {
                uint64_t v172 = *v3;
                unint64_t v173 = *(void *)(a2 + v172);
                if (v173 == -1 || v173 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v174 = *(unsigned char *)(*(void *)(a2 + *v8) + v173);
                  *(void *)(a2 + v172) = v173 + 1;
                  v25 |= (unint64_t)(v174 & 0x7F) << v170;
                  if (v174 < 0)
                  {
                    v170 += 7;
                    BOOL v17 = v171++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_382;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_382:
              uint64_t v200 = 128;
              goto LABEL_403;
            case 208:
              char v175 = 0;
              unsigned int v176 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x4000u;
              while (2)
              {
                uint64_t v177 = *v3;
                unint64_t v178 = *(void *)(a2 + v177);
                if (v178 == -1 || v178 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v179 = *(unsigned char *)(*(void *)(a2 + *v8) + v178);
                  *(void *)(a2 + v177) = v178 + 1;
                  v25 |= (unint64_t)(v179 & 0x7F) << v175;
                  if (v179 < 0)
                  {
                    v175 += 7;
                    BOOL v17 = v176++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_386;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_386:
              uint64_t v200 = 120;
              goto LABEL_403;
            case 209:
              char v180 = 0;
              unsigned int v181 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x800u;
              while (2)
              {
                uint64_t v182 = *v3;
                unint64_t v183 = *(void *)(a2 + v182);
                if (v183 == -1 || v183 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v184 = *(unsigned char *)(*(void *)(a2 + *v8) + v183);
                  *(void *)(a2 + v182) = v183 + 1;
                  v25 |= (unint64_t)(v184 & 0x7F) << v180;
                  if (v184 < 0)
                  {
                    v180 += 7;
                    BOOL v17 = v181++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_390;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_390:
              uint64_t v200 = 96;
              goto LABEL_403;
            case 210:
              char v185 = 0;
              unsigned int v186 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x400u;
              while (2)
              {
                uint64_t v187 = *v3;
                unint64_t v188 = *(void *)(a2 + v187);
                if (v188 == -1 || v188 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v189 = *(unsigned char *)(*(void *)(a2 + *v8) + v188);
                  *(void *)(a2 + v187) = v188 + 1;
                  v25 |= (unint64_t)(v189 & 0x7F) << v185;
                  if (v189 < 0)
                  {
                    v185 += 7;
                    BOOL v17 = v186++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_394;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_394:
              uint64_t v200 = 88;
              goto LABEL_403;
            case 211:
              char v190 = 0;
              unsigned int v191 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x2000u;
              while (2)
              {
                uint64_t v192 = *v3;
                unint64_t v193 = *(void *)(a2 + v192);
                if (v193 == -1 || v193 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v194 = *(unsigned char *)(*(void *)(a2 + *v8) + v193);
                  *(void *)(a2 + v192) = v193 + 1;
                  v25 |= (unint64_t)(v194 & 0x7F) << v190;
                  if (v194 < 0)
                  {
                    v190 += 7;
                    BOOL v17 = v191++ >= 9;
                    if (v17)
                    {
                      unint64_t v25 = 0;
                      goto LABEL_398;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                unint64_t v25 = 0;
              }
LABEL_398:
              uint64_t v200 = 112;
              goto LABEL_403;
            case 212:
              char v195 = 0;
              unsigned int v196 = 0;
              unint64_t v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x1000u;
              break;
            default:
              if (v20 != 150) {
                goto LABEL_126;
              }
              unint64_t v34 = v7;
              unint64_t v35 = v10;
              unint64_t v36 = v9;
              v37 = objc_alloc_init(C2MPPathInfo);
              [a1 addNetworkPathInfo:v37];
              if (!PBReaderPlaceMark() || (C2MPPathInfoReadFrom((uint64_t)v37, a2) & 1) == 0) {
                goto LABEL_406;
              }
              goto LABEL_95;
          }
          break;
      }
      while (1)
      {
        uint64_t v197 = *v3;
        unint64_t v198 = *(void *)(a2 + v197);
        if (v198 == -1 || v198 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v199 = *(unsigned char *)(*(void *)(a2 + *v8) + v198);
        *(void *)(a2 + v197) = v198 + 1;
        v25 |= (unint64_t)(v199 & 0x7F) << v195;
        if ((v199 & 0x80) == 0) {
          goto LABEL_400;
        }
        v195 += 7;
        BOOL v17 = v196++ >= 9;
        if (v17)
        {
          unint64_t v25 = 0;
          goto LABEL_402;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_400:
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v25 = 0;
      }
LABEL_402:
      uint64_t v200 = 104;
LABEL_403:
      *(id *)((char *)a1 + v200) = (id)v25;
      goto LABEL_404;
    }
    if ((int)v20 <= 100)
    {
      switch(v20)
      {
        case 1:
          char v81 = 0;
          unsigned int v82 = 0;
          unint64_t v25 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x20000u;
          while (1)
          {
            uint64_t v83 = *v3;
            unint64_t v84 = *(void *)(a2 + v83);
            if (v84 == -1 || v84 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v85 = *(unsigned char *)(*(void *)(a2 + *v8) + v84);
            *(void *)(a2 + v83) = v84 + 1;
            v25 |= (unint64_t)(v85 & 0x7F) << v81;
            if ((v85 & 0x80) == 0) {
              goto LABEL_310;
            }
            v81 += 7;
            BOOL v17 = v82++ >= 9;
            if (v17)
            {
              unint64_t v25 = 0;
              goto LABEL_312;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_310:
          if (*(unsigned char *)(a2 + *v5)) {
            unint64_t v25 = 0;
          }
LABEL_312:
          uint64_t v200 = *(int *)(v9 + 2928);
          break;
        case 2:
          char v86 = 0;
          unsigned int v87 = 0;
          unint64_t v25 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 8u;
          while (1)
          {
            uint64_t v88 = *v3;
            unint64_t v89 = *(void *)(a2 + v88);
            if (v89 == -1 || v89 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v90 = *(unsigned char *)(*(void *)(a2 + *v8) + v89);
            *(void *)(a2 + v88) = v89 + 1;
            v25 |= (unint64_t)(v90 & 0x7F) << v86;
            if ((v90 & 0x80) == 0) {
              goto LABEL_314;
            }
            v86 += 7;
            BOOL v17 = v87++ >= 9;
            if (v17)
            {
              unint64_t v25 = 0;
              goto LABEL_316;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_314:
          if (*(unsigned char *)(a2 + *v5)) {
            unint64_t v25 = 0;
          }
LABEL_316:
          uint64_t v200 = *(int *)(v10 + 2932);
          break;
        case 3:
          char v29 = 0;
          unsigned int v30 = 0;
          unint64_t v25 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x10u;
          while (1)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)(a2 + *v8) + v32);
            *(void *)(a2 + v31) = v32 + 1;
            v25 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0) {
              goto LABEL_274;
            }
            v29 += 7;
            BOOL v17 = v30++ >= 9;
            if (v17)
            {
              unint64_t v25 = 0;
              goto LABEL_276;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_274:
          if (*(unsigned char *)(a2 + *v5)) {
            unint64_t v25 = 0;
          }
LABEL_276:
          uint64_t v200 = 40;
          break;
        default:
LABEL_126:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_404;
      }
      goto LABEL_403;
    }
    switch((int)v20)
    {
      case 'e':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 31;
        goto LABEL_188;
      case 'f':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 21;
        goto LABEL_188;
      case 'g':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 27;
        goto LABEL_188;
      case 'h':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 19;
        goto LABEL_188;
      case 'i':
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x800000u;
        while (2)
        {
          uint64_t v41 = *v3;
          unint64_t v42 = *(void *)(a2 + v41);
          if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v8) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v17 = v39++ >= 9;
              if (v17)
              {
                uint64_t v40 = 0;
                goto LABEL_280;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_280:
        BOOL v201 = v40 != 0;
        uint64_t v202 = 304;
        goto LABEL_358;
      case 'j':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 22;
        goto LABEL_188;
      case 'k':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 26;
        goto LABEL_188;
      case 'l':
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x80000u;
        while (2)
        {
          uint64_t v47 = *v3;
          unint64_t v48 = *(void *)(a2 + v47);
          if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v8) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v17 = v45++ >= 9;
              if (v17)
              {
                LODWORD(v46) = 0;
                goto LABEL_284;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_284:
        uint64_t v203 = 224;
        goto LABEL_345;
      case 'm':
        char v50 = 0;
        unsigned int v51 = 0;
        unint64_t v25 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 1u;
        while (2)
        {
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v8) + v53);
            *(void *)(a2 + v52) = v53 + 1;
            v25 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              BOOL v17 = v51++ >= 9;
              if (v17)
              {
                unint64_t v25 = 0;
                goto LABEL_288;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v25 = 0;
        }
LABEL_288:
        uint64_t v200 = 8;
        goto LABEL_403;
      case 'n':
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v46 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x100000u;
        while (2)
        {
          uint64_t v57 = *v3;
          unint64_t v58 = *(void *)(a2 + v57);
          if (v58 == -1 || v58 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)(a2 + *v8) + v58);
            *(void *)(a2 + v57) = v58 + 1;
            v46 |= (unint64_t)(v59 & 0x7F) << v55;
            if (v59 < 0)
            {
              v55 += 7;
              BOOL v17 = v56++ >= 9;
              if (v17)
              {
                LODWORD(v46) = 0;
                goto LABEL_292;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_292:
        uint64_t v203 = 240;
        goto LABEL_345;
      case 'o':
        char v60 = 0;
        unsigned int v61 = 0;
        unint64_t v25 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 2u;
        while (2)
        {
          uint64_t v62 = *v3;
          unint64_t v63 = *(void *)(a2 + v62);
          if (v63 == -1 || v63 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + *v8) + v63);
            *(void *)(a2 + v62) = v63 + 1;
            v25 |= (unint64_t)(v64 & 0x7F) << v60;
            if (v64 < 0)
            {
              v60 += 7;
              BOOL v17 = v61++ >= 9;
              if (v17)
              {
                unint64_t v25 = 0;
                goto LABEL_296;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v25 = 0;
        }
LABEL_296:
        uint64_t v200 = 16;
        goto LABEL_403;
      case 'p':
        char v65 = 0;
        unsigned int v66 = 0;
        uint64_t v46 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x40000u;
        while (2)
        {
          uint64_t v67 = *v3;
          unint64_t v68 = *(void *)(a2 + v67);
          if (v68 == -1 || v68 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + *v8) + v68);
            *(void *)(a2 + v67) = v68 + 1;
            v46 |= (unint64_t)(v69 & 0x7F) << v65;
            if (v69 < 0)
            {
              v65 += 7;
              BOOL v17 = v66++ >= 9;
              if (v17)
              {
                LODWORD(v46) = 0;
                goto LABEL_300;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v46) = 0;
        }
LABEL_300:
        uint64_t v203 = 200;
LABEL_345:
        *(_DWORD *)((char *)a1 + v203) = v46;
        goto LABEL_404;
      case 'q':
        unint64_t v34 = v7;
        unint64_t v35 = v10;
        unint64_t v36 = v9;
        v37 = objc_alloc_init(C2MPError);
        objc_storeStrong(a1 + 20, v37);
        if PBReaderPlaceMark() && (C2MPErrorReadFrom((uint64_t)v37, a2))
        {
LABEL_95:
          PBReaderRecallMark();

          unint64_t v9 = v36;
          unint64_t v10 = v35;
          unint64_t v7 = v34;
LABEL_404:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_406:

        return 0;
      case 'r':
        char v70 = 0;
        unsigned int v71 = 0;
        unint64_t v25 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 4u;
        while (2)
        {
          uint64_t v72 = *v3;
          unint64_t v73 = *(void *)(a2 + v72);
          if (v73 == -1 || v73 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v74 = *(unsigned char *)(*(void *)(a2 + *v8) + v73);
            *(void *)(a2 + v72) = v73 + 1;
            v25 |= (unint64_t)(v74 & 0x7F) << v70;
            if (v74 < 0)
            {
              v70 += 7;
              BOOL v17 = v71++ >= 9;
              if (v17)
              {
                unint64_t v25 = 0;
                goto LABEL_304;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v25 = 0;
        }
LABEL_304:
        uint64_t v200 = 24;
        goto LABEL_403;
      case 's':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 29;
        goto LABEL_188;
      case 't':
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v77 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 2924)) |= 0x1000000u;
        while (2)
        {
          uint64_t v78 = *v3;
          unint64_t v79 = *(void *)(a2 + v78);
          if (v79 == -1 || v79 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v80 = *(unsigned char *)(*(void *)(a2 + *v8) + v79);
            *(void *)(a2 + v78) = v79 + 1;
            v77 |= (unint64_t)(v80 & 0x7F) << v75;
            if (v80 < 0)
            {
              v75 += 7;
              BOOL v17 = v76++ >= 9;
              if (v17)
              {
                uint64_t v77 = 0;
                goto LABEL_308;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v77 = 0;
        }
LABEL_308:
        BOOL v201 = v77 != 0;
        uint64_t v202 = 305;
LABEL_358:
        *((unsigned char *)a1 + v202) = v201;
        goto LABEL_404;
      case 'u':
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 23;
LABEL_188:
        id v138 = a1[v22];
        a1[v22] = (id)v21;

        goto LABEL_404;
      default:
        goto LABEL_126;
    }
  }
}

Class __getCloudTelemetryReporterClass_block_invoke(uint64_t a1)
{
  CloudTelemetryLibrary();
  Class result = objc_getClass("CloudTelemetryReporter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCloudTelemetryReporterClass_block_invoke_cold_1();
  }
  getCloudTelemetryReporterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CloudTelemetryLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!CloudTelemetryLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __CloudTelemetryLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6CCBF70;
    uint64_t v2 = 0;
    CloudTelemetryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudTelemetryLibraryCore_frameworkLibrary) {
    CloudTelemetryLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __CloudTelemetryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudTelemetryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCloudTelemetryClass_block_invoke(uint64_t a1)
{
  CloudTelemetryLibrary();
  Class result = objc_getClass("CloudTelemetry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCloudTelemetryClass_block_invoke_cold_1();
  }
  getCloudTelemetryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DD53FAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_1DD53FD24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_1DD541100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, os_activity_scope_state_s state)
{
}

void sub_1DD542068(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t C2MPCloudKitInfoReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      unint64_t v17 = v10 >> 3;
      if ((int)(v10 >> 3) <= 300)
      {
        switch((int)v17)
        {
          case 201:
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = 80;
            goto LABEL_79;
          case 202:
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = 112;
            goto LABEL_79;
          case 203:
            char v31 = 0;
            unsigned int v32 = 0;
            uint64_t v33 = 0;
            a1[132] |= 0x10u;
            while (2)
            {
              uint64_t v34 = *v3;
              unint64_t v35 = *(void *)(a2 + v34);
              if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
                *(void *)(a2 + v34) = v35 + 1;
                v33 |= (unint64_t)(v36 & 0x7F) << v31;
                if (v36 < 0)
                {
                  v31 += 7;
                  BOOL v14 = v32++ >= 9;
                  if (v14)
                  {
                    uint64_t v33 = 0;
                    goto LABEL_93;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v33 = 0;
            }
LABEL_93:
            a1[128] = v33 != 0;
            continue;
          case 204:
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = 96;
            goto LABEL_79;
          case 205:
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = 88;
            goto LABEL_79;
          case 206:
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = 40;
            goto LABEL_79;
          case 207:
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = 48;
            goto LABEL_79;
          case 208:
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = 104;
            goto LABEL_79;
          default:
            if (v17 == 102)
            {
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 72;
            }
            else
            {
              if (v17 != 103) {
                goto LABEL_80;
              }
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 56;
            }
LABEL_79:
            unint64_t v48 = *(void **)&a1[v19];
            *(void *)&a1[v19] = v18;

            break;
        }
        continue;
      }
      if ((int)v17 > 400)
      {
        if (v17 != 401)
        {
          if (v17 == 402)
          {
            char v43 = 0;
            unsigned int v44 = 0;
            uint64_t v22 = 0;
            a1[132] |= 1u;
            while (1)
            {
              uint64_t v45 = *v3;
              unint64_t v46 = *(void *)(a2 + v45);
              if (v46 == -1 || v46 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
              *(void *)(a2 + v45) = v46 + 1;
              v22 |= (unint64_t)(v47 & 0x7F) << v43;
              if ((v47 & 0x80) == 0) {
                goto LABEL_99;
              }
              v43 += 7;
              BOOL v14 = v44++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_101;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_99:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v22 = 0;
            }
LABEL_101:
            uint64_t v50 = 8;
          }
          else
          {
            if (v17 != 403)
            {
LABEL_80:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
              continue;
            }
            char v26 = 0;
            unsigned int v27 = 0;
            uint64_t v22 = 0;
            a1[132] |= 2u;
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
                goto LABEL_87;
              }
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_89;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_87:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v22 = 0;
            }
LABEL_89:
            uint64_t v50 = 16;
          }
          goto LABEL_102;
        }
        v37 = objc_alloc_init(C2MPCloudKitOperationInfo);
        [a1 addClientOperation:v37];
        if (!PBReaderPlaceMark() || (C2MPCloudKitOperationInfoReadFrom((uint64_t)v37, a2) & 1) == 0)
        {
LABEL_105:

          return 0;
        }
      }
      else
      {
        if (v17 != 301)
        {
          if (v17 == 302)
          {
            char v38 = 0;
            unsigned int v39 = 0;
            uint64_t v22 = 0;
            a1[132] |= 4u;
            while (1)
            {
              uint64_t v40 = *v3;
              unint64_t v41 = *(void *)(a2 + v40);
              if (v41 == -1 || v41 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
              *(void *)(a2 + v40) = v41 + 1;
              v22 |= (unint64_t)(v42 & 0x7F) << v38;
              if ((v42 & 0x80) == 0) {
                goto LABEL_95;
              }
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_97;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_95:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v22 = 0;
            }
LABEL_97:
            uint64_t v50 = 24;
          }
          else
          {
            if (v17 != 303) {
              goto LABEL_80;
            }
            char v20 = 0;
            unsigned int v21 = 0;
            uint64_t v22 = 0;
            a1[132] |= 8u;
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
                goto LABEL_83;
              }
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_85;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_83:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v22 = 0;
            }
LABEL_85:
            uint64_t v50 = 32;
          }
LABEL_102:
          *(void *)&a1[v50] = v22;
          continue;
        }
        v37 = objc_alloc_init(C2MPCloudKitOperationGroupInfo);
        [a1 addOperationGroup:v37];
        if (!PBReaderPlaceMark() || (C2MPCloudKitOperationGroupInfoReadFrom((uint64_t)v37, a2) & 1) == 0) {
          goto LABEL_105;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t C2MPGenericEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      unint64_t v17 = v10 >> 3;
      if ((int)(v10 >> 3) <= 200)
      {
        if (v17 == 1)
        {
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 44) |= 4u;
          while (1)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if ((v37 & 0x80) == 0) {
              goto LABEL_61;
            }
            v32 += 7;
            BOOL v14 = v33++ >= 9;
            if (v14)
            {
              LODWORD(v34) = 0;
              goto LABEL_63;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v34) = 0;
          }
LABEL_63:
          *(_DWORD *)(a1 + 40) = v34;
        }
        else
        {
          if (v17 != 101)
          {
LABEL_49:
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v19 = PBReaderReadString();
          char v20 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v19;
        }
      }
      else
      {
        if (v17 == 201)
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (1)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0) {
              goto LABEL_52;
            }
            v21 += 7;
            BOOL v14 = v22++ >= 9;
            if (v14)
            {
              uint64_t v23 = 0;
              goto LABEL_54;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_54:
          uint64_t v39 = 16;
          goto LABEL_59;
        }
        if (v17 == 202)
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          while (1)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0) {
              goto LABEL_56;
            }
            v27 += 7;
            BOOL v14 = v28++ >= 9;
            if (v14)
            {
              uint64_t v23 = 0;
              goto LABEL_58;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_56:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_58:
          uint64_t v39 = 8;
LABEL_59:
          *(void *)(a1 + v39) = v23;
          continue;
        }
        if (v17 != 301) {
          goto LABEL_49;
        }
        uint64_t v18 = objc_alloc_init(C2MPGenericEventMetric);
        [(id)a1 addMetric:v18];
        if (!PBReaderPlaceMark() || !C2MPGenericEventMetricReadFrom((uint64_t)v18, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t C2MPErrorReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_30;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
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
                uint64_t v22 = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_37:
        *(void *)(a1 + 8) = v22;
        goto LABEL_38;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_30:
        char v26 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_38;
      case 4u:
        char v27 = objc_alloc_init(C2MPError);
        objc_storeStrong((id *)(a1 + 32), v27);
        if PBReaderPlaceMark() && (C2MPErrorReadFrom(v27, a2))
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

void __processInfoDict_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 infoDictionary];
  long long v1 = (void *)processInfoDict_processInfoDict;
  processInfoDict_processInfoDict = v0;
}

void __C2MetricProcessUUID_block_invoke()
{
  id v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v0 = [v2 UUIDString];
  long long v1 = (void *)C2MetricProcessUUID_processUUIDString;
  C2MetricProcessUUID_processUUIDString = v0;
}

void __entitlementsDict_block_invoke()
{
  kern_return_t v0;
  unsigned int v1;
  uint64_t v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  SecTaskRef v6;
  __SecTask *v7;
  CFArrayRef v8;
  CFDictionaryRef v9;
  void *v10;
  uint64_t v11;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;
  audit_token_t buf;
  uint64_t v15;

  int v15 = *MEMORY[0x1E4F143B8];
  memset(&task_info_out, 0, sizeof(task_info_out));
  task_info_outCnt = 8;
  uint64_t v0 = task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)&task_info_out, &task_info_outCnt);
  if (v0)
  {
    long long v1 = v0;
    if (C2_DEFAULT_LOG_BLOCK_2 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_2, &__block_literal_global_31);
    }
    id v2 = C2_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      buf.val[0] = 67109120;
      buf.val[1] = v1;
      uint64_t v3 = "Unable to get a self audit token: %d";
      uint64_t v4 = v2;
      v5 = 8;
LABEL_6:
      _os_log_impl(&dword_1DD523000, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&buf, v5);
    }
  }
  else
  {
    buf = task_info_out;
    uint64_t v6 = SecTaskCreateWithAuditToken(0, &buf);
    if (v6)
    {
      unint64_t v7 = v6;
      *(void *)buf.val = @"application-identifier";
      char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:1];
      unsigned int v9 = SecTaskCopyValuesForEntitlements(v7, v8, 0);
      unint64_t v10 = (void *)entitlementsDict_entitlementsDict;
      entitlementsDict_entitlementsDict = (uint64_t)v9;

      CFRelease(v7);
    }
    else
    {
      if (C2_DEFAULT_LOG_BLOCK_2 != -1) {
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_2, &__block_literal_global_35_0);
      }
      uint64_t v11 = C2_DEFAULT_LOG_INTERNAL_2;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.val[0]) = 0;
        uint64_t v3 = "Unable to get a sec task";
        uint64_t v4 = v11;
        v5 = 2;
        goto LABEL_6;
      }
    }
  }
}

uint64_t __entitlementsDict_block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __entitlementsDict_block_invoke_33()
{
  C2_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

void sub_1DD54C99C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD54CB14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL C2MPGenericEventMetricReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 201) {
        break;
      }
      if ((v10 >> 3) == 101)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(C2MPGenericEventMetricValue **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(C2MPGenericEventMetricValue);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || (C2MPGenericEventMetricValueReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL C2MPServerInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        case 'f':
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_25;
        case 'g':
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_25;
        case 'h':
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_25;
        case 'i':
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_25:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_26:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id getBRContainersMonitorClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBRContainersMonitorClass_softClass;
  uint64_t v7 = getBRContainersMonitorClass_softClass;
  if (!getBRContainersMonitorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBRContainersMonitorClass_block_invoke;
    v3[3] = &unk_1E6CCBF50;
    v3[4] = &v4;
    __getBRContainersMonitorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DD54DF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBRContainersMonitorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CloudDocsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CCC530;
    uint64_t v5 = 0;
    CloudDocsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudDocsLibraryCore_frameworkLibrary) {
    __getBRContainersMonitorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BRContainersMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBRContainersMonitorClass_block_invoke_cold_2();
  }
  getBRContainersMonitorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudDocsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudDocsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAppleIDSessionClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AuthKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CCC548;
    uint64_t v5 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AuthKitLibraryCore_frameworkLibrary) {
    __getAKAppleIDSessionClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AKAppleIDSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAKAppleIDSessionClass_block_invoke_cold_2();
  }
  getAKAppleIDSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1DD54F5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_1DD54FDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id a48)
{
}

void sub_1DD550214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_1DD550E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DD550ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DD551078(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD552AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, id obj)
{
}

uint64_t C2MPMetricReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
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
    unint64_t v17 = v10 >> 3;
    if ((int)(v10 >> 3) <= 99)
    {
      switch((int)v17)
      {
        case 1:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 100) |= 8u;
          break;
        case 2:
          unint64_t v30 = objc_alloc_init(C2MPDeviceInfo);
          objc_storeStrong((id *)(a1 + 40), v30);
          if (!PBReaderPlaceMark() || (C2MPDeviceInfoReadFrom(v30, a2) & 1) == 0) {
            goto LABEL_113;
          }
          goto LABEL_82;
        case 3:
          unint64_t v30 = objc_alloc_init(C2MPCloudKitInfo);
          objc_storeStrong((id *)(a1 + 32), v30);
          if (!PBReaderPlaceMark() || (C2MPCloudKitInfoReadFrom(v30, a2) & 1) == 0) {
            goto LABEL_113;
          }
          goto LABEL_82;
        case 4:
          unint64_t v30 = objc_alloc_init(C2MPServerInfo);
          objc_storeStrong((id *)(a1 + 88), v30);
          if (!PBReaderPlaceMark() || !C2MPServerInfoReadFrom((uint64_t)v30, a2)) {
            goto LABEL_113;
          }
          goto LABEL_82;
        default:
          goto LABEL_83;
      }
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
          goto LABEL_90;
        }
        v24 += 7;
        BOOL v14 = v25++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_92;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_90:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_92:
      *(_DWORD *)(a1 + 56) = v26;
      goto LABEL_111;
    }
    switch((int)v17)
    {
      case 'd':
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 100) |= 4u;
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
            goto LABEL_86;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_88;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_86:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_88:
        uint64_t v57 = 24;
        goto LABEL_101;
      case 'e':
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 100) |= 1u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v20 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_96;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_96:
        uint64_t v57 = 8;
        goto LABEL_101;
      case 'f':
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 100) |= 2u;
        while (2)
        {
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v39 + 1;
            v20 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              BOOL v14 = v37++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_100;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_100:
        uint64_t v57 = 16;
LABEL_101:
        *(void *)(a1 + v57) = v20;
        goto LABEL_111;
      case 'g':
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v43 = 0;
        *(unsigned char *)(a1 + 100) |= 0x10u;
        while (2)
        {
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 == -1 || v45 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v45 + 1;
            v43 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              BOOL v14 = v42++ >= 9;
              if (v14)
              {
                uint64_t v43 = 0;
                goto LABEL_105;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v43 = 0;
        }
LABEL_105:
        BOOL v58 = v43 != 0;
        uint64_t v59 = 96;
        goto LABEL_110;
      case 'h':
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v49 = 0;
        *(unsigned char *)(a1 + 100) |= 0x20u;
        while (2)
        {
          uint64_t v50 = *v3;
          unint64_t v51 = *(void *)(a2 + v50);
          if (v51 == -1 || v51 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
            *(void *)(a2 + v50) = v51 + 1;
            v49 |= (unint64_t)(v52 & 0x7F) << v47;
            if (v52 < 0)
            {
              v47 += 7;
              BOOL v14 = v48++ >= 9;
              if (v14)
              {
                uint64_t v49 = 0;
                goto LABEL_109;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v49 = 0;
        }
LABEL_109:
        BOOL v58 = v49 != 0;
        uint64_t v59 = 97;
LABEL_110:
        *(unsigned char *)(a1 + v59) = v58;
        goto LABEL_111;
      case 'i':
        uint64_t v53 = PBReaderReadString();
        uint64_t v54 = 72;
        goto LABEL_70;
      case 'j':
        uint64_t v53 = PBReaderReadString();
        uint64_t v54 = 80;
LABEL_70:
        char v55 = *(void **)(a1 + v54);
        *(void *)(a1 + v54) = v53;

        goto LABEL_111;
      default:
        if (v17 != 200)
        {
          if (v17 != 201)
          {
LABEL_83:
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            goto LABEL_111;
          }
          unint64_t v30 = objc_alloc_init(C2MPGenericEvent);
          objc_storeStrong((id *)(a1 + 48), v30);
          if (!PBReaderPlaceMark() || (C2MPGenericEventReadFrom((uint64_t)v30, a2) & 1) == 0) {
            goto LABEL_113;
          }
          goto LABEL_82;
        }
        unint64_t v30 = objc_alloc_init(C2MPNetworkEvent);
        objc_storeStrong((id *)(a1 + 64), v30);
        if PBReaderPlaceMark() && (C2MPNetworkEventReadFrom((id *)&v30->super.super.isa, a2))
        {
LABEL_82:
          PBReaderRecallMark();

LABEL_111:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_113:

        return 0;
    }
  }
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

void sub_1DD554EF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t C2MPCloudKitOperationGroupInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 101)
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
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_36;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_36:
        *(unsigned char *)(a1 + 24) = v22 != 0;
      }
      else
      {
        if (v17 == 2)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
        }
        uint64_t v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t C2MPDeviceInfoReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = 0x1EAB53000uLL;
    unint64_t v8 = 0x1EAB53000uLL;
    unint64_t v9 = 0x1EAB53000uLL;
    unint64_t v10 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v3;
        unint64_t v15 = *(void *)(a2 + v14);
        if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
        *(void *)(a2 + v14) = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_12;
        }
        v11 += 7;
        BOOL v17 = v12++ >= 9;
        if (v17)
        {
          unint64_t v13 = 0;
          int v18 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v18 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v13 = 0;
      }
LABEL_14:
      if (v18 || (v13 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v20 = v13 >> 3;
      if ((int)(v13 >> 3) <= 200)
      {
        switch((int)v20)
        {
          case 'e':
            uint64_t v21 = PBReaderReadString();
            uint64_t v22 = *(int *)(v7 + 3908);
            goto LABEL_44;
          case 'f':
            uint64_t v21 = PBReaderReadString();
            uint64_t v22 = *(int *)(v8 + 3912);
            goto LABEL_44;
          case 'g':
            uint64_t v21 = PBReaderReadString();
            uint64_t v22 = *(int *)(v9 + 3916);
            goto LABEL_44;
          case 'h':
            uint64_t v21 = PBReaderReadString();
            uint64_t v22 = 40;
            goto LABEL_44;
          case 'i':
            char v27 = 0;
            unsigned int v28 = 0;
            uint64_t v29 = 0;
            a1[84] |= 1u;
            break;
          default:
            goto LABEL_47;
        }
        while (1)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v32 = *(unsigned char *)(*(void *)(a2 + *v10) + v31);
          *(void *)(a2 + v30) = v31 + 1;
          v29 |= (unint64_t)(v32 & 0x7F) << v27;
          if ((v32 & 0x80) == 0) {
            goto LABEL_50;
          }
          v27 += 7;
          BOOL v17 = v28++ >= 9;
          if (v17)
          {
            uint64_t v29 = 0;
            goto LABEL_52;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_52:
        a1[80] = v29 != 0;
        goto LABEL_45;
      }
      if ((int)v20 <= 202) {
        break;
      }
      if (v20 == 203)
      {
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 24;
        goto LABEL_44;
      }
      if (v20 == 301)
      {
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 72;
        goto LABEL_44;
      }
      if (v20 != 302) {
        goto LABEL_47;
      }
      unint64_t v23 = v9;
      unint64_t v24 = v8;
      unint64_t v25 = v7;
      uint64_t v26 = objc_alloc_init(C2MPInternalTestConfig);
      [a1 addInternalTestConfig:v26];
      if (!PBReaderPlaceMark() || !C2MPInternalTestConfigReadFrom((uint64_t)v26, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

      unint64_t v7 = v25;
      unint64_t v8 = v24;
      unint64_t v9 = v23;
LABEL_45:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    if (v20 == 201)
    {
      uint64_t v21 = PBReaderReadString();
      uint64_t v22 = 16;
      goto LABEL_44;
    }
    if (v20 == 202)
    {
      uint64_t v21 = PBReaderReadString();
      uint64_t v22 = 32;
LABEL_44:
      uint64_t v33 = *(void **)&a1[v22];
      *(void *)&a1[v22] = v21;

      goto LABEL_45;
    }
LABEL_47:
    uint64_t result = PBReaderSkipValueWithTag();
    if (!result) {
      return result;
    }
    goto LABEL_45;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_1DD556D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a5;
  return OUTLINED_FUNCTION_5((uint64_t)sub_1DD55A6B4);
}

uint64_t sub_1DD556E30(void *a1, void *a2, void *a3, uint64_t a4, const void *a5, void *a6)
{
  v6[4] = a3;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2D8);
  v6[6] = swift_task_alloc();
  uint64_t v13 = swift_task_alloc();
  v6[7] = v13;
  uint64_t v14 = swift_task_alloc();
  v6[8] = v14;
  v6[9] = _Block_copy(a5);
  if (a4)
  {
    sub_1DD55AF40();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  uint64_t v16 = sub_1DD55AF50();
  __swift_storeEnumTagSinglePayload(v13, v15, 1, v16);
  id v17 = a6;
  id v18 = a1;
  id v19 = a2;
  id v20 = a3;
  unint64_t v24 = (void *)swift_task_alloc();
  v6[10] = v24;
  *unint64_t v24 = v6;
  v24[1] = sub_1DD556FAC;
  return sub_1DD556D64(v14, v21, v22, v23, v13);
}

uint64_t sub_1DD556FAC()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  void *v3 = v2;
  uint64_t v5 = v4[9];
  uint64_t v6 = v4[7];
  unint64_t v7 = (void *)v4[5];
  unint64_t v8 = (void *)v4[4];
  unint64_t v9 = (void *)v4[3];
  unint64_t v10 = (void *)v4[2];
  uint64_t v11 = *v0;
  OUTLINED_FUNCTION_3();
  *unsigned int v12 = v11;
  swift_task_dealloc();

  sub_1DD55A398(v6, (uint64_t *)&unk_1EB9BD2D8);
  if (v5)
  {
    uint64_t v13 = (void *)v2[6];
    sub_1DD55A3EC(v2[8], (uint64_t)v13);
    uint64_t v14 = sub_1DD55AF50();
    OUTLINED_FUNCTION_26(v14);
    if (!v15)
    {
      uint64_t v16 = (void *)v2[6];
      uint64_t v13 = v16;
      sub_1DD55AF30();
      OUTLINED_FUNCTION_25();
      (*(void (**)(void *, uint64_t))(v17 + 8))(v16, v5);
    }
    id v18 = (const void *)v2[9];
    uint64_t v19 = OUTLINED_FUNCTION_11();
    v20(v19);
    _Block_release(v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return v21();
}

uint64_t sub_1DD5571A4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD2F8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DD55AFF0();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  unint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  unint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_1EAB54418;
  v8[5] = v7;
  sub_1DD559EA0((uint64_t)v5, (uint64_t)&unk_1EAB54428, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_1DD5572A8()
{
  return OUTLINED_FUNCTION_5((uint64_t)sub_1DD5572BC);
}

uint64_t sub_1DD5572BC()
{
  OUTLINED_FUNCTION_6();
  sub_1DD5599B4();
  id v1 = sub_1DD557328(0, 0xC000000000000000);
  id v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

id sub_1DD557328(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_1DD55AF60();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_1DD5595DC(a1, a2);

  return v6;
}

uint64_t sub_1DD557438(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a4;
  id v9 = a1;
  id v10 = a2;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  void *v11 = v4;
  v11[1] = sub_1DD5574FC;
  return sub_1DD5572A8();
}

uint64_t sub_1DD5574FC()
{
  OUTLINED_FUNCTION_15();
  id v2 = v1;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_4();
  void *v5 = v4;
  uint64_t v7 = v6[5];
  id v8 = (void *)v6[4];
  id v9 = (void *)v6[3];
  id v10 = (void *)v6[2];
  uint64_t v11 = *v0;
  OUTLINED_FUNCTION_3();
  *unsigned int v12 = v11;
  swift_task_dealloc();

  if (v7)
  {
    uint64_t v13 = *(const void **)(v4 + 40);
    uint64_t v14 = OUTLINED_FUNCTION_23();
    v15(v14);

    _Block_release(v13);
  }
  else
  {
  }
  OUTLINED_FUNCTION_8();
  return v16();
}

void sub_1DD55765C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD310);
  uint64_t v8 = OUTLINED_FUNCTION_14(v7);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD358);
  OUTLINED_FUNCTION_2();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_22();
  if (a3)
  {
    uint64_t v18 = v5
        + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation;
    swift_beginAccess();
    sub_1DD559958(v18, (uint64_t)v13, (uint64_t *)&unk_1EB9BD310);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
    {
      id v19 = a3;
      sub_1DD55A398((uint64_t)v13, (uint64_t *)&unk_1EB9BD310);
      uint64_t v20 = OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded;
      if (*(unsigned char *)(v5
                    + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded) == 1)
      {
        uint64_t v26 = a3;
        id v21 = a3;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2E8);
        sub_1DD55AFA0();

        *(unsigned char *)(v5 + v20) = 0;
      }
      else
      {
      }
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v4, v13, v14);
      uint64_t v26 = a3;
      id v25 = a3;
      sub_1DD55B020();
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v4, v14);
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v22 = OUTLINED_FUNCTION_23();
    sub_1DD559958(v22, v23, v24);
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v14) == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v26 = 0;
      sub_1DD55B020();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v14);
    }
  }
}

uint64_t sub_1DD557950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return OUTLINED_FUNCTION_5((uint64_t)sub_1DD557968);
}

uint64_t sub_1DD557968()
{
  OUTLINED_FUNCTION_6();
  sub_1DD559958(*(void *)(v0 + 24), *(void *)(v0 + 16), (uint64_t *)&unk_1EB9BD2D8);
  OUTLINED_FUNCTION_8();
  return v1();
}

uint64_t sub_1DD5579E8(void *a1, void *a2, uint64_t a3, const void *a4, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2D8);
  v5[5] = swift_task_alloc();
  uint64_t v11 = swift_task_alloc();
  v5[6] = v11;
  uint64_t v12 = swift_task_alloc();
  v5[7] = v12;
  v5[8] = _Block_copy(a4);
  if (a3)
  {
    sub_1DD55AF40();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 1;
  }
  uint64_t v14 = sub_1DD55AF50();
  __swift_storeEnumTagSinglePayload(v11, v13, 1, v14);
  id v15 = a5;
  id v16 = a1;
  id v17 = a2;
  uint64_t v20 = (void *)swift_task_alloc();
  v5[9] = v20;
  void *v20 = v5;
  v20[1] = sub_1DD557B5C;
  return sub_1DD557950(v12, v18, v19, v11);
}

void sub_1DD557B5C()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  void *v3 = v2;
  uint64_t v5 = v4[8];
  uint64_t v6 = v4[6];
  uint64_t v7 = (void *)v4[4];
  uint64_t v8 = (void *)v4[3];
  uint64_t v9 = (void *)v4[2];
  uint64_t v10 = *v0;
  OUTLINED_FUNCTION_3();
  void *v11 = v10;
  swift_task_dealloc();

  sub_1DD55A398(v6, (uint64_t *)&unk_1EB9BD2D8);
  if (v5)
  {
    uint64_t v12 = (void *)v2[5];
    sub_1DD55A3EC(v2[7], (uint64_t)v12);
    uint64_t v13 = sub_1DD55AF50();
    OUTLINED_FUNCTION_26(v13);
    if (!v14)
    {
      id v15 = (void *)v2[5];
      uint64_t v12 = v15;
      sub_1DD55AF30();
      OUTLINED_FUNCTION_25();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v15, v5);
    }
    id v17 = (const void *)v2[8];
    uint64_t v18 = OUTLINED_FUNCTION_11();
    v19(v18);
    _Block_release(v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1DD557D3C()
{
  OUTLINED_FUNCTION_6();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD368);
  v1[4] = v3;
  OUTLINED_FUNCTION_14(v3);
  v1[5] = OUTLINED_FUNCTION_18();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2E8);
  v1[6] = v4;
  OUTLINED_FUNCTION_1(v4);
  v1[7] = v5;
  v1[8] = OUTLINED_FUNCTION_18();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD300);
  v1[9] = v6;
  OUTLINED_FUNCTION_1(v6);
  v1[10] = v7;
  v1[11] = OUTLINED_FUNCTION_18();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD340);
  v1[12] = v8;
  OUTLINED_FUNCTION_1(v8);
  v1[13] = v9;
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x1F4188298](v10, v11, v12);
}

uint64_t sub_1DD557E74()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[3];
  *(void *)(swift_task_alloc() + 16) = v4;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x1E4FBD120], v3);
  sub_1DD55B030();
  swift_task_dealloc();
  if (*(unsigned char *)(v4
                + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded) == 1)
  {
    uint64_t v21 = OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded;
    uint64_t v5 = v0[2];
    OUTLINED_FUNCTION_24();
    v6();
    uint64_t v7 = OUTLINED_FUNCTION_23();
    uint64_t result = v8(v7);
    if (!v5)
    {
      __break(1u);
      return result;
    }
    uint64_t v20 = v0[15];
    uint64_t v10 = v0[12];
    uint64_t v11 = v0[13];
    uint64_t v13 = v0[7];
    uint64_t v12 = v0[8];
    uint64_t v15 = v0[5];
    uint64_t v14 = v0[6];
    uint64_t v16 = (void *)v0[2];
    uint64_t v17 = *(int *)(v0[4] + 48);
    (*(void (**)(uint64_t, void, uint64_t))(v11 + 32))(v15, v0[14], v10);
    *(void *)(v15 + v17) = v16;
    id v18 = v16;
    sub_1DD55AFB0();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v20, v10);
    *(unsigned char *)(v4 + v21) = 0;
  }
  else
  {
    (*(void (**)(void, void))(v0[13] + 8))(v0[15], v0[12]);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(uint64_t))v0[1];
  return v19(1);
}

uint64_t sub_1DD5580AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD310);
  uint64_t v5 = OUTLINED_FUNCTION_14(v4);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD358);
  OUTLINED_FUNCTION_7();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  uint64_t v10 = a2
      + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation;
  swift_beginAccess();
  sub_1DD5598F0((uint64_t)v7, v10);
  return swift_endAccess();
}

uint64_t sub_1DD5581C8(void *a1, int a2, void *a3, void *a4, void *a5, void *aBlock)
{
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = a1;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a1;
  uint64_t v16 = OUTLINED_FUNCTION_23();
  return sub_1DD5571A4(v16, v17);
}

uint64_t sub_1DD558264(void *a1, void *a2, void *a3, void *aBlock, void *a5)
{
  v5[4] = a3;
  v5[5] = a5;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = _Block_copy(aBlock);
  a5;
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = (void *)swift_task_alloc();
  v5[7] = v13;
  void *v13 = v5;
  v13[1] = sub_1DD558344;
  return sub_1DD557D3C();
}

uint64_t sub_1DD558344()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_4();
  void *v3 = v2;
  uint64_t v5 = v4[6];
  uint64_t v6 = (void *)v4[5];
  uint64_t v7 = (void *)v4[4];
  uint64_t v8 = (void *)v4[3];
  uint64_t v9 = (void *)v4[2];
  uint64_t v10 = *v0;
  OUTLINED_FUNCTION_3();
  void *v11 = v10;
  swift_task_dealloc();

  if (v5)
  {
    id v12 = *(const void **)(v2 + 48);
    uint64_t v13 = OUTLINED_FUNCTION_11();
    v14(v13);
    _Block_release(v12);
  }
  OUTLINED_FUNCTION_20();
  return v15();
}

uint64_t sub_1DD5584A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD358);
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_21();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD310);
  uint64_t v14 = OUTLINED_FUNCTION_14(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_22();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB543D8);
  uint64_t v16 = OUTLINED_FUNCTION_14(v15);
  MEMORY[0x1F4188790](v16);
  id v18 = (char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v4
      + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation;
  swift_beginAccess();
  sub_1DD559958(v19, v6, (uint64_t *)&unk_1EB9BD310);
  if (__swift_getEnumTagSinglePayload(v6, 1, v9))
  {
    sub_1DD55A398(v6, (uint64_t *)&unk_1EB9BD310);
    uint64_t v20 = 1;
LABEL_5:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB543E0);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, v20, 1, v23);
    return sub_1DD55A398((uint64_t)v18, &qword_1EAB543D8);
  }
  OUTLINED_FUNCTION_24();
  v21();
  uint64_t result = sub_1DD55A398(v6, (uint64_t *)&unk_1EB9BD310);
  if (a4 >> 60 != 15)
  {
    v24[1] = a3;
    v24[2] = a4;
    sub_1DD559890(a3, a4);
    sub_1DD55B010();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v9);
    uint64_t v20 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void sub_1DD558788()
{
}

id sub_1DD5587C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s25C2AsyncDataStreamDelegateCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t C2RequestManager.dataStream(for:options:)()
{
  OUTLINED_FUNCTION_6();
  v1[4] = v2;
  v1[5] = v0;
  v1[2] = v3;
  v1[3] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD368);
  v1[6] = v5;
  OUTLINED_FUNCTION_14(v5);
  v1[7] = OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_1DD558908()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  long long v3 = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1DD5589F0;
  OUTLINED_FUNCTION_16();
  return MEMORY[0x1F4188160]();
}

uint64_t sub_1DD5589F0()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v6 = v5;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_16();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1DD558AD4()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[2];
  uint64_t v3 = *(void *)(v1 + *(int *)(v0[6] + 48));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD340);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v2, v1);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v3);
}

uint64_t sub_1DD558B88()
{
  OUTLINED_FUNCTION_6();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v0();
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

void sub_1DD558C30(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2E8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_21();
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v4, a1);
  uint64_t v10 = (objc_class *)_s25C2AsyncDataStreamDelegateCMa();
  uint64_t v11 = objc_allocWithZone(v10);
  uint64_t v12 = (uint64_t)&v11[OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD358);
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v13);
  v11[OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded] = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2E8);
  uint64_t v15 = *(void *)(v14 - 8);
  OUTLINED_FUNCTION_24();
  v16();
  v21.receiver = v11;
  v21.super_class = v10;
  id v17 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v4, v14);
  id v18 = (void *)sub_1DD55AF30();
  id v19 = objc_msgSend(a2, sel_createDataTaskWithRequest_options_delegate_sessionHandle_, v18, a4, v17, 0);

  if (v19)
  {
    id v20 = v19;
    objc_msgSend(v20, sel_resume);
  }
}

void sub_1DD558E1C(uint64_t a1)
{
  sub_1DD558C30(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t C2RequestManager.data(for:options:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD330);
  v0[6] = v1;
  OUTLINED_FUNCTION_1(v1);
  v0[7] = v2;
  v0[8] = OUTLINED_FUNCTION_18();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9BD340);
  v0[9] = v3;
  OUTLINED_FUNCTION_1(v3);
  v0[10] = v4;
  v0[11] = swift_task_alloc();
  v0[12] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[13] = v5;
  void *v5 = v0;
  v5[1] = sub_1DD558F54;
  return C2RequestManager.dataStream(for:options:)();
}

uint64_t sub_1DD558F54()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  void *v3 = v2;
  void *v3 = *v1;
  *(void *)(v2 + 112) = v4;
  *(void *)(v2 + 120) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1DD559038()
{
  OUTLINED_FUNCTION_12();
  *(_OWORD *)(v0 + 16) = xmmword_1DD55FB70;
  OUTLINED_FUNCTION_24();
  v1();
  sub_1DD559598(&qword_1EB9BD348, &qword_1EB9BD340);
  sub_1DD55B000();
  uint64_t v2 = sub_1DD559598((unint64_t *)&unk_1EB9BD320, (uint64_t *)&unk_1EB9BD330);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v3;
  void *v3 = v0;
  v3[1] = sub_1DD559178;
  uint64_t v4 = *(void *)(v0 + 48);
  return MEMORY[0x1F4187C78](v0 + 32, v4, v2);
}

uint64_t sub_1DD559178()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v6 = v5;
  v3[17] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v8 = v3[7];
    uint64_t v7 = v3[8];
    uint64_t v9 = v3[6];
    sub_1DD5595DC(v3[2], v3[3]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  OUTLINED_FUNCTION_16();
  return MEMORY[0x1F4188298](v10, v11, v12);
}

uint64_t sub_1DD559284()
{
  OUTLINED_FUNCTION_17();
  unint64_t v1 = v0[5];
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = v0[12];
    uint64_t v3 = v0[9];
    uint64_t v4 = v0[10];
    (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
    sub_1DD559634(v0[4], v0[5]);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_19();
    __asm { BRAA            X4, X16 }
  }
  uint64_t v7 = v0[4];
  sub_1DD55AF80();
  sub_1DD559634(v7, v1);
  sub_1DD559598((unint64_t *)&unk_1EB9BD320, (uint64_t *)&unk_1EB9BD330);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[16] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1DD559178;
  OUTLINED_FUNCTION_19();
  return MEMORY[0x1F4187C78]();
}

uint64_t sub_1DD559438()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v4();
}

uint64_t sub_1DD5594D8()
{
  OUTLINED_FUNCTION_12();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v0();
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

uint64_t sub_1DD559598(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1DD5595DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1DD559634(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1DD5595DC(a1, a2);
  }
  return a1;
}

uint64_t sub_1DD559648()
{
  return _s25C2AsyncDataStreamDelegateCMa();
}

uint64_t _s25C2AsyncDataStreamDelegateCMa()
{
  uint64_t result = qword_1EB9BD438;
  if (!qword_1EB9BD438) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1DD559698()
{
  sub_1DD55976C();
  if (v0 <= 0x3F)
  {
    sub_1DD5597E4();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1DD55976C()
{
  if (!qword_1EB9BD350)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EB9BD368);
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EB9BD378);
    unint64_t v0 = sub_1DD55AFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB9BD350);
    }
  }
}

void sub_1DD5597E4()
{
  if (!qword_1EB9BD360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9BD358);
    unint64_t v0 = sub_1DD55B040();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB9BD360);
    }
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1DD559890(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1DD5598E8(uint64_t a1)
{
  return sub_1DD5580AC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1DD5598F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD559958(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_1DD5599B4()
{
  unint64_t result = qword_1EAB543F0;
  if (!qword_1EAB543F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAB543F0);
  }
  return result;
}

uint64_t sub_1DD5599F8()
{
  OUTLINED_FUNCTION_15();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1DD55A6B8;
  uint64_t v3 = OUTLINED_FUNCTION_9();
  return v4(v3);
}

uint64_t sub_1DD559A9C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1DD55A6B8;
  return v6();
}

uint64_t sub_1DD559B6C()
{
  OUTLINED_FUNCTION_15();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1DD55A6B8;
  uint64_t v3 = OUTLINED_FUNCTION_10();
  return v4(v3);
}

uint64_t sub_1DD559C0C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1DD55A6B8;
  return v7();
}

uint64_t objectdestroy_17Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1DD559D1C()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_13(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_1DD559DE0;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAB54420 + dword_1EAB54420);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_1DD559DE0()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v3();
}

uint64_t sub_1DD559EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DD55AFF0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1DD55A398(a1, &qword_1EB9BD2F8);
  }
  else
  {
    sub_1DD55AFE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DD55AF90();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DD55A010(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1DD55A0EC;
  return v6(a1);
}

uint64_t sub_1DD55A0EC()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v3();
}

uint64_t sub_1DD55A1B0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1DD55A1E8()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_13(v4);
  void *v5 = v6;
  v5[1] = sub_1DD559DE0;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAB54430 + dword_1EAB54430);
  return v7(v2, v3);
}

uint64_t objectdestroyTm()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1DD55A2F4()
{
  OUTLINED_FUNCTION_15();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1DD55A6B8;
  uint64_t v3 = OUTLINED_FUNCTION_9();
  return v4(v3);
}

uint64_t sub_1DD55A398(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1DD55A3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD55A454()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1DD55A4A4()
{
  OUTLINED_FUNCTION_15();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1DD55A6B8;
  uint64_t v3 = OUTLINED_FUNCTION_10();
  return v4(v3);
}

uint64_t sub_1DD55A544()
{
  _Block_release(*(const void **)(v0 + 48));
  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_1DD55A5A4()
{
  OUTLINED_FUNCTION_17();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1DD55A6B8;
  OUTLINED_FUNCTION_19();
  __asm { BR              X6 }
}

void type metadata accessor for ResponseDisposition()
{
  if (!qword_1EAB54470)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EAB54470);
    }
  }
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return MEMORY[0x1F4188298](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

void __getCloudTelemetryReporterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCloudTelemetryReporterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"C2ReportMetrics.m", 29, @"Unable to find class %s", "CloudTelemetryReporter");

  __break(1u);
}

void CloudTelemetryLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudTelemetryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"C2ReportMetrics.m", 19, @"%s", *a1);

  __break(1u);
}

void __getCloudTelemetryClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCloudTelemetryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"C2ReportMetrics.m", 20, @"Unable to find class %s", "CloudTelemetry");

  __break(1u);
}

void __getBRContainersMonitorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudDocsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"C2RequestOptions.m", 21, @"%s", *a1);

  __break(1u);
}

void __getBRContainersMonitorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBRContainersMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"C2RequestOptions.m", 22, @"Unable to find class %s", "BRContainersMonitor");

  __break(1u);
}

void __getAKAppleIDSessionClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AuthKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"C2RequestOptions.m", 26, @"%s", *a1);

  __break(1u);
}

void __getAKAppleIDSessionClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAKAppleIDSessionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"C2RequestOptions.m", 27, @"Unable to find class %s", "AKAppleIDSession");

  __break(1u);
  sub_1DD55AF30();
}

uint64_t sub_1DD55AF30()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1DD55AF40()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1DD55AF50()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1DD55AF60()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1DD55AF70()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1DD55AF80()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t sub_1DD55AF90()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1DD55AFA0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1DD55AFB0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1DD55AFC0()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1DD55AFE0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1DD55AFF0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1DD55B000()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1DD55B010()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1DD55B020()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1DD55B030()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1DD55B040()
{
  return MEMORY[0x1F4184640]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
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

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
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

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t TMConvertTicksToSeconds()
{
  return MEMORY[0x1F4115C60]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
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

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1F40CBA00](data, applier);
}

uint64_t dispatch_data_create_alloc()
{
  return MEMORY[0x1F40CBA18]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x1F40F2910](name, type, domain);
}

void nw_advertise_descriptor_set_no_auto_rename(nw_advertise_descriptor_t advertise_descriptor, BOOL no_auto_rename)
{
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x1F40F29A0](type, domain);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x1F40F29B8](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x1F40F29C8](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x1F40F29D8](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2AA0](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1F40F2C60]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x1F40F2CF8](context_identifier);
}

const char *__cdecl nw_content_context_get_identifier(nw_content_context_t context)
{
  return (const char *)MEMORY[0x1F40F2D08](context);
}

nw_interface_t nw_data_transfer_report_copy_path_interface(nw_data_transfer_report_t report, uint32_t path_index)
{
  return (nw_interface_t)MEMORY[0x1F40F2DF0](report, *(void *)&path_index);
}

uint32_t nw_data_transfer_report_get_path_count(nw_data_transfer_report_t report)
{
  return MEMORY[0x1F40F2E00](report);
}

uint64_t nw_data_transfer_report_get_received_application_byte_count(nw_data_transfer_report_t report, uint32_t path_index)
{
  return MEMORY[0x1F40F2E10](report, *(void *)&path_index);
}

uint64_t nw_data_transfer_report_get_sent_application_byte_count(nw_data_transfer_report_t report, uint32_t path_index)
{
  return MEMORY[0x1F40F2E18](report, *(void *)&path_index);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EE8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EF0](endpoint);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x1F40F2EF8]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

uint64_t nw_interface_get_radio_type()
{
  return MEMORY[0x1F40F3258]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x1F40F3268](interface);
}

uint64_t nw_interface_radio_type_to_string()
{
  return MEMORY[0x1F40F3270]();
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1F40F3320](parameters);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1F40F3488]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34D0](configure_tls, configure_tcp);
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
}

void nw_tcp_options_set_enable_keepalive(nw_protocol_options_t options, BOOL enable_keepalive)
{
}

void nw_tcp_options_set_keepalive_count(nw_protocol_options_t options, uint32_t keepalive_count)
{
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x1F40F3F58](options);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

void sec_protocol_options_add_pre_shared_key(sec_protocol_options_t options, dispatch_data_t psk, dispatch_data_t psk_identity)
{
}

void sec_protocol_options_append_tls_ciphersuite(sec_protocol_options_t options, tls_ciphersuite_t ciphersuite)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}