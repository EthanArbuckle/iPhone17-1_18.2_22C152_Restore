void sub_19D558B10(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D558CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t pragmaCallback(void *a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = a1;
  if (a2 == 1)
  {
    v6 = [NSString stringWithUTF8String:*a3];
    [v5 setReadJournalMode:v6];

    v7 = v5[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = [v5 readJournalMode];
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_19D557000, v8, OS_LOG_TYPE_DEFAULT, "journal mode %@", (uint8_t *)&v11, 0xCu);
    }
  }

  return 0;
}

void sub_19D55B85C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D55BFBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D55C23C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D55C47C(_Unwind_Exception *exception_object)
{
}

void sub_19D55C62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  __destructor_8_s0_s8_s16((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D55C998(_Unwind_Exception *exception_object)
{
}

void __destructor_8_s0_s8_s16(uint64_t a1)
{
  v2 = *(void **)(a1 + 16);
}

id NSStringFromSQLiteStatement(sqlite3_stmt *a1, int a2)
{
  v2 = (void *)sqlite3_column_text(a1, a2);
  if (v2)
  {
    v2 = [NSString stringWithUTF8String:v2];
  }
  return v2;
}

void sub_19D55CCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  __destructor_8_s0_s8_s16((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D55CDC4(_Unwind_Exception *exception_object)
{
}

uint64_t integrityCheckCallback(void *a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = a1;
  if (a2 == 1)
  {
    v6 = [NSString stringWithUTF8String:*a3];
    if (([@"ok" isEqualToString:v6] & 1) == 0)
    {
      v7 = v5[1];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_error_impl(&dword_19D557000, v7, OS_LOG_TYPE_ERROR, "Have integrity errors %@", (uint8_t *)&v9, 0xCu);
      }
      [v5 setIntegrityCheckError:v6];
    }
  }
  return 0;
}

BOOL HMEProtoEventInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadString();
        v18 = *(HMEProtoEvent **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
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
    v18 = objc_alloc_init(HMEProtoEvent);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || !HMEProtoEventReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D55DAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D55ED10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMEProtoEventMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          v19 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v18;

          continue;
        case 2u:
          *(unsigned char *)(a1 + 40) |= 1u;
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
          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_49:
          uint64_t v43 = 16;
          goto LABEL_58;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          while (2)
          {
            uint64_t v33 = *v3;
            uint64_t v34 = *(void *)(a2 + v33);
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v35;
              v26 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_53:
          uint64_t v43 = 20;
          goto LABEL_58;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
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
        uint64_t v39 = *v3;
        uint64_t v40 = *(void *)(a2 + v39);
        unint64_t v41 = v40 + 1;
        if (v40 == -1 || v41 > *(void *)(a2 + *v4)) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
        *(void *)(a2 + v39) = v41;
        v26 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0) {
          goto LABEL_55;
        }
        v37 += 7;
        BOOL v15 = v38++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_57;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_57:
      uint64_t v43 = 24;
LABEL_58:
      *(_DWORD *)(a1 + v43) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D563C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D563F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D564368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D5648A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D564CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D565194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D56566C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D565A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D56AC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_19D56B348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D56BF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

uint64_t HMEEventComponentsFromTopic(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = a1;
  unsigned int v9 = [v8 componentsSeparatedByString:@"."];
  if ((unint64_t)[v9 count] >= 5)
  {
    unint64_t v10 = [v9 objectAtIndexedSubscript:2];
    if ([v10 isEqualToString:@"settings"])
    {
      uint64_t v11 = [v9 lastObject];
      int v12 = [v11 isEqualToString:@"updated"];

      if (v12)
      {
        uint64_t v39 = a4;
        unint64_t v13 = compressTopicComponents(v8);
        char v14 = [v13 objectAtIndexedSubscript:0];
        BOOL v15 = [v13 objectAtIndexedSubscript:1];
        uint64_t v16 = [v13 count] - 4;
        uint64_t v17 = v13;
        uint64_t v18 = 3;
LABEL_32:
        objc_msgSend(v17, "subarrayWithRange:", v18, v16);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = [v29 componentsJoinedByString:@"."];
        uint64_t v33 = (void *)v32;
        if (v14) {
          BOOL v34 = v15 == 0;
        }
        else {
          BOOL v34 = 1;
        }
        BOOL v35 = v34 || v32 == 0;
        uint64_t v30 = !v35;
        if (!v35)
        {
          if (a2) {
            *a2 = v14;
          }
          if (a3) {
            *a3 = v15;
          }
          if (v39) {
            *uint64_t v39 = v33;
          }
        }

LABEL_49:
        goto LABEL_50;
      }
    }
    else
    {
    }
  }
  if ((unint64_t)[v9 count] < 6) {
    goto LABEL_17;
  }
  v19 = [v9 objectAtIndexedSubscript:0];
  if (![v19 isEqualToString:@"home"])
  {
LABEL_16:

    goto LABEL_17;
  }
  v20 = [v9 objectAtIndexedSubscript:2];
  if (([v20 isEqualToString:@"accessory"] & 1) == 0)
  {

    goto LABEL_16;
  }
  uint64_t v39 = a4;
  uint64_t v21 = [v9 objectAtIndexedSubscript:4];
  int v22 = [v21 isEqualToString:@"settings"];
  char v23 = v22;
  if (v22)
  {
    v4 = [v9 lastObject];
    if ([v4 isEqualToString:@"updated"]) {
      goto LABEL_13;
    }
  }
  char v24 = [v9 objectAtIndexedSubscript:4];
  if ([v24 isEqualToString:@"info"])
  {

    if ((v23 & 1) == 0)
    {
LABEL_14:

LABEL_31:
      unint64_t v13 = compressTopicComponents(v8);
      char v14 = [v13 objectAtIndexedSubscript:1];
      BOOL v15 = [v13 objectAtIndexedSubscript:3];
      uint64_t v16 = [v13 count] - 4;
      uint64_t v17 = v13;
      uint64_t v18 = 4;
      goto LABEL_32;
    }
LABEL_13:

    goto LABEL_14;
  }
  char v37 = v4;
  char v31 = [v9 objectAtIndexedSubscript:4];
  char v38 = [v31 isEqualToString:@"media"];

  if (v23) {
  a4 = v39;
  }
  if (v38) {
    goto LABEL_31;
  }
LABEL_17:
  unint64_t v13 = [v9 objectAtIndexedSubscript:0];
  if (![v13 isEqualToString:@"home"])
  {
    uint64_t v30 = 0;
LABEL_50:

    goto LABEL_51;
  }
  unsigned int v25 = [v9 objectAtIndexedSubscript:2];
  int v26 = [v25 isEqualToString:@"mediaDestinationController"];

  if (v26)
  {
    uint64_t v27 = a4;
    unint64_t v13 = compressTopicComponents(v8);
    char v14 = [v13 objectAtIndexedSubscript:1];
    BOOL v15 = objc_msgSend(v13, "subarrayWithRange:", 2, objc_msgSend(v13, "count") - 2);
    uint64_t v28 = [v15 componentsJoinedByString:@"."];
    id v29 = (id)v28;
    uint64_t v30 = 0;
    if (v14 && v28)
    {
      if (a2) {
        *a2 = v14;
      }
      if (v27)
      {
        id v29 = v29;
        *uint64_t v27 = v29;
      }
      uint64_t v30 = 1;
    }
    goto LABEL_49;
  }
  uint64_t v30 = 0;
LABEL_51:

  return v30;
}

id compressTopicComponents(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v1 = [a1 componentsSeparatedByString:@"."];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v8, "length", (void)v11) > 3)
        {
          unsigned int v9 = [v8 substringToIndex:4];
          [v2 addObject:v9];
        }
        else
        {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_19D56D578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMEProtoEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = *(HMEProtoEventMetadata **)(a1 + 8);
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
    uint64_t v18 = objc_alloc_init(HMEProtoEventMetadata);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || (HMEProtoEventMetadataReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}