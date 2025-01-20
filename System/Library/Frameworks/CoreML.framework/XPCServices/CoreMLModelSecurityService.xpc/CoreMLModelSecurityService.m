void sub_100004BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100004C1C(id a1, NSError *a2)
{
  v2 = a2;
  v3 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000AF5C((uint64_t)v2, v3);
  }
}

void sub_100004C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100004CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ModelKeyServerAPIFetchKeyResultReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 0u:
        unsigned int v12 = 0;
        do
        {
          unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v13 == -1 || v13 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            goto LABEL_38;
          }
          unint64_t v14 = v13 + 1;
          int v15 = *(char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v14;
          if ((v15 & 0x80000000) == 0) {
            break;
          }
        }
        while (v12++ <= 8);
        goto LABEL_38;
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_30;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_30;
      case 3u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 48;
LABEL_30:
        v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_38;
      case 4u:
        [(id)a1 clearOneofValuesForKey];
        *(unsigned char *)(a1 + 56) |= 1u;
        *(_DWORD *)(a1 + 8) = 1;
        v21 = objc_alloc_init(ModelKeyServerAPISignedKey);
        objc_storeStrong((id *)(a1 + 40), v21);
        if (!PBReaderPlaceMark() || (ModelKeyServerAPISignedKeyReadFrom((uint64_t)v21, a2) & 1) == 0) {
          goto LABEL_40;
        }
        goto LABEL_36;
      case 5u:
        [(id)a1 clearOneofValuesForKey];
        *(unsigned char *)(a1 + 56) |= 1u;
        *(_DWORD *)(a1 + 8) = 2;
        v21 = objc_alloc_init(ModelKeyServerAPIRawKey);
        objc_storeStrong((id *)(a1 + 32), v21);
        if (PBReaderPlaceMark() && ModelKeyServerAPIRawKeyReadFrom((uint64_t)v21, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_40:

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

uint64_t ModelKeyServerAPIFetchKeyResponseReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 2)
    {
      [(id)a1 clearOneofValuesForResult];
      *(unsigned char *)(a1 + 32) |= 1u;
      *(_DWORD *)(a1 + 16) = 2;
      uint64_t v18 = objc_alloc_init(ModelKeyServerAPIResultError);
      objc_storeStrong((id *)(a1 + 8), v18);
      if (!PBReaderPlaceMark() || (ModelKeyServerAPIResultErrorReadFrom((uint64_t)v18, a2) & 1) == 0)
      {
LABEL_38:

        return 0;
      }
    }
    else
    {
      if (v12 != 1)
      {
        if (v12)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
        }
        else
        {
          unsigned int v13 = 0;
          while (1)
          {
            unint64_t v14 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v14 == -1 || v14 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            unint64_t v15 = v14 + 1;
            int v16 = *(char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v14);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15;
            if (v16 < 0 && v13++ <= 8) {
              continue;
            }
            goto LABEL_36;
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        }
        continue;
      }
      [(id)a1 clearOneofValuesForResult];
      *(unsigned char *)(a1 + 32) |= 1u;
      *(_DWORD *)(a1 + 16) = 1;
      uint64_t v18 = objc_alloc_init(ModelKeyServerAPIFetchKeyResult);
      objc_storeStrong((id *)(a1 + 24), v18);
      if (!PBReaderPlaceMark() || (ModelKeyServerAPIFetchKeyResultReadFrom((uint64_t)v18, a2) & 1) == 0) {
        goto LABEL_38;
      }
    }
    PBReaderRecallMark();

LABEL_36:
    ;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ModelKeyServerAPIFetchKeyRequestReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 8;
        goto LABEL_23;
      case 2u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 24;
        goto LABEL_23;
      case 3u:
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
LABEL_23:
        unint64_t v15 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        continue;
      case 4u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v19 == -1 || v19 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
      v18 |= (unint64_t)(v20 & 0x7F) << v16;
      if ((v20 & 0x80) == 0) {
        goto LABEL_32;
      }
      v16 += 7;
      BOOL v9 = v17++ >= 9;
      if (v9)
      {
        uint64_t v18 = 0;
        goto LABEL_34;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v18 = 0;
    }
LABEL_34:
    *(unsigned char *)(a1 + 32) = v18 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL ModelKeyServerAPIRawKeyReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
LABEL_21:
        unint64_t v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadData();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ModelKeyServerAPISignedKeyReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadData();
      uint64_t v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100007EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_1000082D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000082E8(uint64_t a1)
{
}

void sub_1000082F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CoreMLModelSecurity function fetchKey completed", buf, 2u);
  }

  if (v6)
  {
    uint64_t v8 = +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:v6 format:@"Fetching decryption key from server failed."];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v6 code];
      id v13 = [v6 localizedDescription];
      id v14 = [v13 UTF8String];
      *(_DWORD *)buf = 134218242;
      id v50 = v12;
      __int16 v51 = 2080;
      id v52 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Fetching decryption key from server failed. Operation failed with error code %ld (%s)", buf, 0x16u);
    }
  }
  else if ([v5 hasError])
  {
    unint64_t v15 = [v5 error];
    id v16 = [v15 message];
    uint64_t v17 = +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionKeyFetchErrorWithUnderlyingError:format:", 0, @"Fetching decryption key from server failed: %s. Make sure the encryption key was generated with correct team ID.", [v16 UTF8String]);
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v20 = [v5 error];
      id v21 = [v20 message];
      id v22 = [v21 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v50 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Fetching decryption key from server failed. Key server responded back with error: %s", buf, 0xCu);
    }
  }
  else if ([v5 hasSuccess])
  {
    v23 = [v5 success];
    unsigned __int8 v24 = [v23 hasSignedKey];

    if (v24)
    {
      v11 = [v5 success];
      v25 = [v11 signedKey];
      uint64_t v26 = [v25 data];
      uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
      v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;
    }
    else
    {
      uint64_t v39 = +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:0 format:@"Fetching decryption key from server failed."];
      uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
      v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;

      v11 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000B020(v11, v42, v43, v44, v45, v46, v47, v48);
      }
    }
  }
  else
  {
    v29 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10000B058(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    uint64_t v37 = +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:0 format:@"Fetching decryption key from server failed: response with neither hasError nor hasSuccess."];
    uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(NSObject **)(v38 + 40);
    *(void *)(v38 + 40) = v37;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000087BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ModelKeyServerAPIResultErrorReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadString();
      id v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100008CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008E48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008E58(uint64_t a1)
{
}

void sub_100008E60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B090((uint64_t)v6, v7);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void sub_100008EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000090B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100009128(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B108(a1, (uint64_t)v6, v7);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void sub_1000091B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000956C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100009768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100009C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CoreMLModelSecurity;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100009D9C(void *a1)
{
}

void sub_100009E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100009EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_10000A244()
{
}

id sub_10000A24C(int a1, void *a2)
{
  if (a1)
  {
    v3 = +[CoreMLModelSecurity codeSigningIdentifierFromXPCConnection];
    if (v3) {
      goto LABEL_9;
    }
    *a2 = +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:0 format:@"Failed to extract signingIdentifier for the first party app. Make sure the app is signed."];
    char v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000B394(v4);
    }
  }
  else
  {
    v3 = +[CoreMLModelSecurity teamIdentifierFromXPCConnection];
    if (v3) {
      goto LABEL_9;
    }
    *a2 = +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:0 format:@"Failed to extract team identifier for the app. Make sure the app is signed."];
    char v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000B3D8(v4);
    }
  }

  v3 = 0;
LABEL_9:

  return v3;
}

void sub_10000A478(_Unwind_Exception *a1)
{
  unint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_10000A570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AA0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000ADF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000AEE0(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_10000AF10(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

void sub_10000AF3C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000AF5C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"client callback";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create connection to %@ : error=%@", (uint8_t *)&v2, 0x16u);
}

void sub_10000AFE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B020(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B058(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B090(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not obtain feature names via XPC: error=%@", (uint8_t *)&v2, 0xCu);
}

void sub_10000B108(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not obtain feature value %@ via XPC: error=%@", (uint8_t *)&v4, 0x16u);
}

void sub_10000B194(uint64_t a1, int *a2, uint64_t a3, NSObject *a4)
{
  int v4 = *a2;
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
  sub_10000AF10((void *)&_mh_execute_header, "Sandbox extension(%@) release failed (%d)", (uint8_t *)a3, a4);
}

void sub_10000B1E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sandbox extension(%@) consumed", (uint8_t *)&v2, 0xCu);
}

void sub_10000B25C()
{
  sub_10000AEF8();
  sub_10000AF3C((void *)&_mh_execute_header, v0, v1, "Failed to generate signed key request for %@ err: %@");
}

void sub_10000B2C4()
{
  sub_10000AEF8();
  sub_10000AF3C((void *)&_mh_execute_header, v0, v1, "Failed to fetch key response from key server for %@ err: %@");
}

void sub_10000B32C()
{
  sub_10000AEF8();
  sub_10000AF3C((void *)&_mh_execute_header, v0, v1, "Failed to create persistent key blob for %@ err: %@");
}

void sub_10000B394(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to extract signingIdentifier for the app. Make sure the first party app is signed.", v1, 2u);
}

void sub_10000B3D8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to extract team identifier for the app. Make sure the app is signed.", v1, 2u);
}

void sub_10000B41C()
{
  sub_10000AF2C();
  sub_10000AEE0(v1, v2, v3, 5.778e-34);
  sub_10000AF10((void *)&_mh_execute_header, "%@: client(%d) : SecTaskCreateWithAuditToken() failed", v4, v5);
}

void sub_10000B460()
{
  sub_10000AF2C();
  sub_10000AEE0(v1, v2, v3, 5.778e-34);
  sub_10000AF10((void *)&_mh_execute_header, "%@: client(%d) : missing teamIdentity", v4, v5);
}

void sub_10000B4A4()
{
  sub_10000AF2C();
  sub_10000AEE0(v1, v2, v3, 5.778e-34);
  sub_10000AF10((void *)&_mh_execute_header, "%@: client(%d) : missing signingIdentifier", v4, v5);
}

void sub_10000B4E8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: nil currentConnection", buf, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return _SecTaskCopyTeamIdentifier();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_clearOneofValuesForKey(void *a1, const char *a2, ...)
{
  return [a1 clearOneofValuesForKey];
}

id objc_msgSend_clearOneofValuesForResult(void *a1, const char *a2, ...)
{
  return [a1 clearOneofValuesForResult];
}

id objc_msgSend_clientProxy(void *a1, const char *a2, ...)
{
  return [a1 clientProxy];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codeSigningIdentifierFromXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 codeSigningIdentifierFromXPCConnection];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreChannel(void *a1, const char *a2, ...)
{
  return [a1 coreChannel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_decryptSessionManager(void *a1, const char *a2, ...)
{
  return [a1 decryptSessionManager];
}

id objc_msgSend_decryptedModel(void *a1, const char *a2, ...)
{
  return [a1 decryptedModel];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_featureNames(void *a1, const char *a2, ...)
{
  return [a1 featureNames];
}

id objc_msgSend_hasError(void *a1, const char *a2, ...)
{
  return [a1 hasError];
}

id objc_msgSend_hasSignedKey(void *a1, const char *a2, ...)
{
  return [a1 hasSignedKey];
}

id objc_msgSend_hasSuccess(void *a1, const char *a2, ...)
{
  return [a1 hasSuccess];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_modelDescription(void *a1, const char *a2, ...)
{
  return [a1 modelDescription];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 publicCloudDatabase];
}

id objc_msgSend_resolvedFeaturesDict(void *a1, const char *a2, ...)
{
  return [a1 resolvedFeaturesDict];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_signedKey(void *a1, const char *a2, ...)
{
  return [a1 signedKey];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_teamIdentifierFromXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifierFromXPCConnection];
}

id objc_msgSend_uniqueKeyForProvider(void *a1, const char *a2, ...)
{
  return [a1 uniqueKeyForProvider];
}