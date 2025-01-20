void CCPBDataWriterWriteDataField(uint64_t a1, void *a2, int a3)
{
  const void *v5;
  size_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned char *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned char *v14;
  size_t v15;
  size_t v16;
  size_t v17;
  id v18;
  uint64_t vars8;

  v18 = a2;
  v5 = (const void *)[v18 bytes];
  v6 = [v18 length];
  v7 = *(void **)(a1 + 8);
  v8 = v7[3];
  if (v8 < v7[1] + v6 + 16)
  {
    if (v8 - v7[2] <= v6 + 16) {
      v9 = v6 + 16;
    }
    else {
      v9 = v8 - v7[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](v7, v9);
    v7 = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v10 = (8 * a3) | 2u;
    v11 = (unsigned char *)v7[1];
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        v12 = v10 >> 7;
        v13 = v10 >> 14;
        v10 >>= 7;
      }
      while (v13);
    }
    *v11 = v12;
    *(void *)(*(void *)(a1 + 8) + 8) = v11 + 1;
    v7 = *(void **)(a1 + 8);
  }
  v14 = (unsigned char *)v7[1];
  if (v6 < 0x80)
  {
    LOBYTE(v16) = v6;
  }
  else
  {
    v15 = v6;
    do
    {
      *v14++ = v15 | 0x80;
      v16 = v15 >> 7;
      v17 = v15 >> 14;
      v15 >>= 7;
    }
    while (v17);
  }
  *v14 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) = v14 + 1;
  memcpy(*(void **)(*(void *)(a1 + 8) + 8), v5, v6);
  *(void *)(*(void *)(a1 + 8) + 8) += v6;
}

void CCPBDataWriterWriteStringField(uint64_t a1, void *a2, int a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ((unint64_t)[v5 length] <= 0xA5
    && (size_t __n = 0,
        objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 1000, &__n, 4, 4, 0, objc_msgSend(v5, "length"), 0)))
  {
    size_t v6 = __n;
    v7 = *(void **)(a1 + 8);
    size_t v8 = v7[3];
    if (v8 < v7[1] + __n + 16)
    {
      if (v8 - v7[2] <= __n + 16) {
        uint64_t v9 = __n + 16;
      }
      else {
        uint64_t v9 = v8 - v7[2];
      }
      -[CCPBMutableData _pb_growCapacityBy:](v7, v9);
      v7 = *(void **)(a1 + 8);
    }
    if (a3 != -1)
    {
      unint64_t v10 = (8 * a3) | 2u;
      v11 = (unsigned char *)v7[1];
      if (v10 < 0x80)
      {
        LOBYTE(v12) = (8 * a3) | 2;
      }
      else
      {
        do
        {
          *v11++ = v10 | 0x80;
          unint64_t v12 = v10 >> 7;
          unint64_t v13 = v10 >> 14;
          v10 >>= 7;
        }
        while (v13);
      }
      unsigned char *v11 = v12;
      *(void *)(*(void *)(a1 + 8) + 8) = v11 + 1;
      v7 = *(void **)(a1 + 8);
    }
    v38 = (unsigned char *)v7[1];
    if (v6 < 0x80)
    {
      LOBYTE(v40) = v6;
    }
    else
    {
      size_t v39 = v6;
      do
      {
        *v38++ = v39 | 0x80;
        size_t v40 = v39 >> 7;
        size_t v41 = v39 >> 14;
        v39 >>= 7;
      }
      while (v41);
    }
    unsigned char *v38 = v40;
    *(void *)(*(void *)(a1 + 8) + 8) = v38 + 1;
    memcpy(*(void **)(*(void *)(a1 + 8) + 8), __src, v6);
    *(void *)(*(void *)(a1 + 8) + 8) += v6;
  }
  else
  {
    v14 = (void *)MEMORY[0x24C5B1100]();
    v15 = [v5 dataUsingEncoding:4];
    if ([v15 length])
    {
      id v16 = v15;
      v17 = (const void *)[v16 bytes];
      size_t v18 = [v16 length];
      v19 = *(void **)(a1 + 8);
      unint64_t v20 = v19[3];
      if (v20 < v19[1] + v18 + 16)
      {
        if (v20 - v19[2] <= v18 + 16) {
          uint64_t v21 = v18 + 16;
        }
        else {
          uint64_t v21 = v20 - v19[2];
        }
        -[CCPBMutableData _pb_growCapacityBy:](v19, v21);
        v19 = *(void **)(a1 + 8);
      }
      if (a3 != -1)
      {
        unint64_t v22 = (8 * a3) | 2u;
        v23 = (unsigned char *)v19[1];
        if (v22 < 0x80)
        {
          LOBYTE(v24) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v23++ = v22 | 0x80;
            unint64_t v24 = v22 >> 7;
            unint64_t v25 = v22 >> 14;
            v22 >>= 7;
          }
          while (v25);
        }
        unsigned char *v23 = v24;
        *(void *)(*(void *)(a1 + 8) + 8) = v23 + 1;
        v19 = *(void **)(a1 + 8);
      }
      v33 = (unsigned char *)v19[1];
      if (v18 < 0x80)
      {
        LOBYTE(v35) = v18;
      }
      else
      {
        size_t v34 = v18;
        do
        {
          *v33++ = v34 | 0x80;
          size_t v35 = v34 >> 7;
          size_t v36 = v34 >> 14;
          v34 >>= 7;
        }
        while (v36);
      }
      unsigned char *v33 = v35;
      *(void *)(*(void *)(a1 + 8) + 8) = v33 + 1;
      memcpy(*(void **)(*(void *)(a1 + 8) + 8), v17, v18);
      *(void *)(*(void *)(a1 + 8) + 8) += v18;
    }
    else
    {
      v26 = *(void **)(a1 + 8);
      unint64_t v27 = v26[3];
      if (v27 < v26[1] + 16)
      {
        if (v27 - v26[2] <= 0x10) {
          uint64_t v28 = 16;
        }
        else {
          uint64_t v28 = v27 - v26[2];
        }
        -[CCPBMutableData _pb_growCapacityBy:](v26, v28);
        v26 = *(void **)(a1 + 8);
      }
      if (a3 != -1)
      {
        unint64_t v29 = (8 * a3) | 2u;
        v30 = (unsigned char *)v26[1];
        if (v29 < 0x80)
        {
          LOBYTE(v31) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v30++ = v29 | 0x80;
            unint64_t v31 = v29 >> 7;
            unint64_t v32 = v29 >> 14;
            v29 >>= 7;
          }
          while (v32);
        }
        unsigned char *v30 = v31;
        *(void *)(*(void *)(a1 + 8) + 8) = v30 + 1;
        v26 = *(void **)(a1 + 8);
      }
      v37 = (unsigned char *)v26[1];
      unsigned char *v37 = 0;
      *(void *)(*(void *)(a1 + 8) + 8) = v37 + 1;
    }
  }
}

id CCPBReaderReadDataNoCopy(void *a1)
{
  v1 = a1;
  v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = v1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if ([v1 hasError])
  {
    v11 = 0;
  }
  else
  {
    uint64_t v12 = v2[1];
    BOOL v9 = __CFADD__(v12, v10);
    unint64_t v13 = v12 + v10;
    if (v9 || v13 > v2[5])
    {
      v11 = 0;
      v2[2] = 1;
    }
    else
    {
      id v14 = (id) v2[4];
      uint64_t v15 = [v14 bytes] + v2[1];
      v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v15 length:v10 freeWhenDone:0];
      v2[1] += v10;
    }
  }

  return v11;
}

id CCPBReaderReadStringNoCopy(void *a1)
{
  v1 = a1;
  v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = v1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if ([v1 hasError])
  {
    v11 = 0;
  }
  else
  {
    uint64_t v12 = v2[1];
    BOOL v9 = __CFADD__(v12, v10);
    unint64_t v13 = v12 + v10;
    if (v9 || v13 > v2[5])
    {
      v11 = 0;
      v2[2] = 1;
    }
    else
    {
      id v14 = (id) v2[4];
      uint64_t v15 = [v14 bytes] + v2[1];
      v11 = (void *)[[NSString alloc] initWithBytesNoCopy:v15 length:v10 encoding:4 freeWhenDone:0];
      v2[1] += v10;
    }
  }

  return v11;
}

uint64_t CCValidateIsInstanceOfExpectedClass(void *a1, void *a2, objc_class *a3, void *a4)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F07F80];
    v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    unint64_t v13 = NSStringFromClass(v12);
    id v14 = NSStringFromClass(a3);
    uint64_t v15 = [v11 stringWithFormat:@"Provided object for field %@ is of class %@, expected class: %@", v7, v13, v14, v20];
    v21[0] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v17 = [v10 errorWithDomain:@"com.apple.CascadeSets.Item" code:2 userInfo:v16];
    size_t v18 = v17;
    if (a4 && v17) {
      *a4 = v17;
    }
  }
  return isKindOfClass & 1;
}

BOOL CCValidateNonNilField(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    unint64_t v6 = [NSString stringWithFormat:@"Provided object for field %@ is nil, expected non-nil", a1, *MEMORY[0x263F07F80]];
    v12[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v8 = [v5 errorWithDomain:@"com.apple.CascadeSets.Item" code:2 userInfo:v7];
    BOOL v9 = v8;
    if (a3 && v8) {
      *a3 = v8;
    }
  }
  return a2 != 0;
}

id CCHash64(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    unsigned int v3 = [v1 length];
    uint64_t v4 = [v2 bytes];
    if (v3 >= 0x10)
    {
      unint64_t v5 = 0;
      uint64_t v6 = 0;
      do
      {
        unint64_t v8 = 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * *(void *)(v4 + v5)) ^ ((0x9DDFEA08EB382D69 * *(void *)(v4 + v5)) >> 44));
        unint64_t v9 = 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * *(void *)(v4 + v5 + 8)) ^ ((0x9DDFEA08EB382D69 * *(void *)(v4 + v5 + 8)) >> 44));
        v6 -= 0x622015F714C7D297 * ((v9 ^ (v9 >> 41)) + (v8 ^ (v8 >> 41)));
        v5 += 16;
      }
      while (v5 < (v3 & 0xFFFFFFF0));
    }
    else
    {
      LODWORD(v5) = 0;
      uint64_t v6 = 0;
    }
    if (v3 > v5) {
      __memcpy_chk();
    }
    id v7 = [NSNumber numberWithLongLong:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id _columnValueFromSQLiteStatement(sqlite3_stmt *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = sqlite3_column_type(a1, a2);
  switch((int)v4)
  {
    case 1:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(a1, a2));
      goto LABEL_13;
    case 2:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(a1, a2));
      goto LABEL_13;
    case 3:
      id v7 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
      if (!v7) {
        goto LABEL_14;
      }
      uint64_t v5 = [[NSString alloc] initWithUTF8String:v7];
LABEL_13:
      id v7 = (unsigned __int8 *)v5;
LABEL_14:
      uint64_t v10 = _NSNullIfNilObject(v7);

      return v10;
    case 4:
      unint64_t v9 = sqlite3_column_blob(a1, a2);
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v9, sqlite3_column_bytes(a1, a2));
      goto LABEL_13;
    case 5:
      uint64_t v5 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_13;
    default:
      uint64_t v6 = v4;
      id v7 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
      if (v7) {
        id v7 = (unsigned __int8 *)[[NSString alloc] initWithUTF8String:v7];
      }
      unint64_t v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [NSNumber numberWithInt:a2];
        unint64_t v13 = [NSNumber numberWithInt:v6];
        int v14 = 138412802;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        v17 = v12;
        __int16 v18 = 2112;
        v19 = v13;
        _os_log_error_impl(&dword_249B92000, v8, OS_LOG_TYPE_ERROR, "value: %@ with unknown column type (sqlite_column_index: %@, sqlite_column_type: %@)", (uint8_t *)&v14, 0x20u);
      }
      goto LABEL_14;
  }
}

id _NSNullIfNilObject(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v4 = v3;

  return v4;
}

CCDatabaseExecutionResult *_createExecutionResult(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = [[CCDatabaseExecutionResult alloc] initWithCommand:v9 beginMachTime:a2 endMachTime:mach_absolute_time() rowValueTuples:v8 error:v7];

  return v10;
}

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

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_249B98400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *CCSetError(void *result, id a2)
{
  if (result)
  {
    if (a2)
    {
      v2 = result;
      result = a2;
      void *v2 = result;
    }
  }
  return result;
}

void sub_249B99A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_249B99CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249B9AA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 256), 8);
  _Unwind_Resume(a1);
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

uint64_t __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x24C5B1320](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
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

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id _sharedXPCClientFactory()
{
  if (_sharedXPCClientFactory_onceToken != -1) {
    dispatch_once(&_sharedXPCClientFactory_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_sharedXPCClientFactory_sharedFactory;

  return v0;
}

id _sharedQueue()
{
  if (_sharedQueue_onceToken != -1) {
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_164);
  }
  v0 = (void *)_sharedQueue_sharedQueue;

  return v0;
}

void sub_249B9C73C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id CCDonateServiceRequestDescription(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v20 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263F29E78] currentPersonaIdentifierLoggingDescription];
  uint64_t v11 = NSString;
  uint64_t v12 = CCTypeIdentifierRegistryBridge();
  uint64_t v13 = [v12 descriptionForTypeIdentifier:a3];
  if (v8)
  {
    uint64_t v14 = [NSString stringWithFormat:@":\"%@\"", v8];
  }
  else
  {
    uint64_t v14 = &stru_26FDBF2B8;
  }
  if (v9)
  {
    [NSString stringWithFormat:@":remote=%@", v9];
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v15 = &stru_26FDBF2B8;
    if (v10)
    {
LABEL_6:
      __int16 v16 = [NSString stringWithFormat:@":persona=%@", v10];
      v17 = [v11 stringWithFormat:@"<%@:%@:%llu%@%@%@>", v13, v20, a1, v14, v15, v16];

      if (!v9) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  v17 = [v11 stringWithFormat:@"<%@:%@:%llu%@%@%@>", v13, v20, a1, v14, v15, &stru_26FDBF2B8];
  if (v9) {
LABEL_7:
  }

LABEL_8:
  if (v8) {

  }
  return v17;
}

id CCTypeIdentifierRegistryBridge()
{
  if (CCTypeIdentifierRegistryBridge_onceToken != -1) {
    dispatch_once(&CCTypeIdentifierRegistryBridge_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)CCTypeIdentifierRegistryBridge_registryClass;

  return v0;
}

id CCAttributionIdentifier(void *a1)
{
  id v1 = a1;
  v2 = CCTypeIdentifierRegistryBridge();
  id v3 = objc_msgSend(v2, "descriptionForTypeIdentifier:", objc_msgSend(v1, "itemType"));

  uint64_t v4 = [v1 descriptorWithKey:@"sourceIdentifier"];

  uint64_t v5 = [v4 value];

  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"%@-%@", v3, v5];
  }
  else
  {
    id v6 = v3;
  }
  id v7 = v6;

  return v7;
}

id CCHash64String(void *a1)
{
  id v1 = [a1 dataUsingEncoding:4];
  v2 = CCHash64(v1);

  return v2;
}

void sub_249B9D644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_249B9D980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249B9DBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249B9E15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

uint64_t CCDonateServiceResponseDescription(unsigned int a1)
{
  if (a1 > 0xB) {
    id v1 = 0;
  }
  else {
    id v1 = off_26527A8B0[(__int16)a1];
  }
  return [NSString stringWithFormat:@"(%u) \"%@\"", a1, v1];
}

uint64_t ___sharedXPCClientFactory_block_invoke()
{
  _sharedXPCClientFactory_sharedFactory = objc_alloc_init(CCDonateXPCClientFactory);

  return MEMORY[0x270F9A758]();
}

void ___sharedQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("CCSetDonation.shared", v2);
  id v1 = (void *)_sharedQueue_sharedQueue;
  _sharedQueue_sharedQueue = (uint64_t)v0;
}

void __CCTypeIdentifierRegistryBridge_block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCTypeIdentifierRegistryClass_softClass;
  uint64_t v8 = getCCTypeIdentifierRegistryClass_softClass;
  if (!getCCTypeIdentifierRegistryClass_softClass)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getCCTypeIdentifierRegistryClass_block_invoke;
    v4[3] = &unk_265279D38;
    v4[4] = &v5;
    __getCCTypeIdentifierRegistryClass_block_invoke((uint64_t)v4);
    dispatch_queue_t v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  CCTypeIdentifierRegistryBridge_registryClass = (uint64_t)v1;
  if (!v1)
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"id<CCTypeIdentifierRegistryProtocol,CCTypeIdentifierRegistryProtocolPrivate>  _Nonnull CCTypeIdentifierRegistryBridge(void)_block_invoke"];
    [v2 handleFailureInFunction:v3 file:@"CCTypeIdentifierRegistryBase.m" lineNumber:34 description:@"Must have IntelligencePlatformLibrary framework linked to obtain CCTypeIdentifierRegistry"];
  }
}

void sub_249BA2B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCCTypeIdentifierRegistryClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __IntelligencePlatformLibraryLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_265279F60;
    uint64_t v5 = 0;
    IntelligencePlatformLibraryLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary_1) {
    __getCCTypeIdentifierRegistryClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CCTypeIdentifierRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCTypeIdentifierRegistryClass_block_invoke_cold_2();
  }
  getCCTypeIdentifierRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CCScanHexString(uint64_t a1)
{
  uint64_t v4 = 0;
  id v1 = [MEMORY[0x263F08B08] scannerWithString:a1];
  [v1 scanHexLongLong:&v4];
  uint64_t v2 = v4;

  return v2;
}

id CCConcatenateHash64(void *a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [a1 longLongValue];
  uint64_t v5 = [v3 longLongValue];

  v8[0] = v4;
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:16];

  return v6;
}

id CCConcatenatedHash64Prefix(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 16)
  {
    uint64_t v4 = 0;
    objc_msgSend(v1, "getBytes:range:", &v4, 0, 8);
    uint64_t v2 = [NSNumber numberWithLongLong:v4];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id CCConcatenatedHash64Suffix(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 16)
  {
    uint64_t v4 = 0;
    objc_msgSend(v1, "getBytes:range:", &v4, 8, 8);
    uint64_t v2 = [NSNumber numberWithLongLong:v4];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t CCSerializedSetFormatFromString(void *a1)
{
  id v1 = [a1 lowercaseString];
  if ([v1 isEqual:@"binary"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqual:@"json"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

BOOL CCSerializedSetFormatIsValid(int a1)
{
  return (a1 - 1) < 2;
}

id getCCSerializedSetMessageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCSerializedSetMessageClass_softClass;
  uint64_t v7 = getCCSerializedSetMessageClass_softClass;
  if (!getCCSerializedSetMessageClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetMessageClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCCSerializedSetMessageClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BA44A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetDeviceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCSerializedSetDeviceClass_softClass;
  uint64_t v7 = getCCSerializedSetDeviceClass_softClass;
  if (!getCCSerializedSetDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetDeviceClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCCSerializedSetDeviceClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BA4928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetDescriptorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCSerializedSetDescriptorClass_softClass;
  uint64_t v7 = getCCSerializedSetDescriptorClass_softClass;
  if (!getCCSerializedSetDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetDescriptorClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCCSerializedSetDescriptorClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BA4A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetItemInstanceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCSerializedSetItemInstanceClass_softClass;
  uint64_t v7 = getCCSerializedSetItemInstanceClass_softClass;
  if (!getCCSerializedSetItemInstanceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetItemInstanceClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCCSerializedSetItemInstanceClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BA5034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetSharedItemClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCSerializedSetSharedItemClass_softClass;
  uint64_t v7 = getCCSerializedSetSharedItemClass_softClass;
  if (!getCCSerializedSetSharedItemClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetSharedItemClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCCSerializedSetSharedItemClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BA5118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetItemClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCSerializedSetItemClass_softClass;
  uint64_t v7 = getCCSerializedSetItemClass_softClass;
  if (!getCCSerializedSetItemClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetItemClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCCSerializedSetItemClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BA51FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BA59DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

Class __getCCSerializedSetMessageClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibraryLibrary();
  Class result = objc_getClass("CCSerializedSetMessage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSerializedSetMessageClass_block_invoke_cold_1();
  }
  getCCSerializedSetMessageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void IntelligencePlatformLibraryLibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __IntelligencePlatformLibraryLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_265279D58;
    uint64_t v2 = 0;
    IntelligencePlatformLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary) {
    IntelligencePlatformLibraryLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __IntelligencePlatformLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntelligencePlatformLibraryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCCSerializedSetDeviceClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibraryLibrary();
  Class result = objc_getClass("CCSerializedSetDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSerializedSetDeviceClass_block_invoke_cold_1();
  }
  getCCSerializedSetDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetDescriptorClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibraryLibrary();
  Class result = objc_getClass("CCSerializedSetDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSerializedSetDescriptorClass_block_invoke_cold_1();
  }
  getCCSerializedSetDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetItemInstanceClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibraryLibrary();
  Class result = objc_getClass("CCSerializedSetItemInstance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSerializedSetItemInstanceClass_block_invoke_cold_1();
  }
  getCCSerializedSetItemInstanceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetSharedItemClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibraryLibrary();
  Class result = objc_getClass("CCSerializedSetSharedItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSerializedSetSharedItemClass_block_invoke_cold_1();
  }
  getCCSerializedSetSharedItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetItemClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibraryLibrary();
  Class result = objc_getClass("CCSerializedSetItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSerializedSetItemClass_block_invoke_cold_1();
  }
  getCCSerializedSetItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CCPBDataWriterWriteBareVarint(unsigned char *a1, unint64_t a2)
{
  uint64_t v2 = a1;
  if (a2 < 0x80)
  {
    LOBYTE(v3) = a2;
  }
  else
  {
    do
    {
      *v2++ = a2 | 0x80;
      unint64_t v3 = a2 >> 7;
      unint64_t v4 = a2 >> 14;
      a2 >>= 7;
    }
    while (v4);
  }
  unsigned char *v2 = v3;
  return v2 - a1 + 1;
}

void *CCPBDataWriterWriteInt32Field(uint64_t a1, unsigned int a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    unint64_t v8 = v7 - result[2];
    if (v8 <= 0x10) {
      uint64_t v9 = 16;
    }
    else {
      uint64_t v9 = v8;
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v9);
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v10 = (int)a2;
  if (a3 != -1)
  {
    unint64_t v11 = (8 * a3);
    uint64_t v12 = (unsigned char *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        unint64_t v13 = v11 >> 7;
        unint64_t v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *uint64_t v12 = v13;
    *(void *)(*(void *)(a1 + 8) + 8) = v12 + 1;
    Class result = *(void **)(a1 + 8);
  }
  uint64_t v15 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      unint64_t v16 = v10 >> 7;
      unint64_t v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  unsigned char *v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

void *CCPBDataWriterWriteInt64Field(uint64_t a1, unint64_t a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v13 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      unint64_t v14 = a2 >> 7;
      unint64_t v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *unint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

void *CCPBDataWriterWriteUint32Field(uint64_t a1, unsigned int a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    unint64_t v8 = v7 - result[2];
    if (v8 <= 0x10) {
      uint64_t v9 = 16;
    }
    else {
      uint64_t v9 = v8;
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v9);
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v10 = a2;
  if (a3 != -1)
  {
    unint64_t v11 = (8 * a3);
    unint64_t v12 = (unsigned char *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        unint64_t v13 = v11 >> 7;
        unint64_t v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *unint64_t v12 = v13;
    *(void *)(*(void *)(a1 + 8) + 8) = v12 + 1;
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v15 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      unint64_t v16 = v10 >> 7;
      unint64_t v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  unsigned char *v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

void *CCPBDataWriterWriteUint64Field(uint64_t a1, unint64_t a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v13 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      unint64_t v14 = a2 >> 7;
      unint64_t v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *unint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

void *CCPBDataWriterWriteBOOLField(uint64_t a1, char a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v13 = (unsigned char *)result[1];
  *unint64_t v13 = a2;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

void *CCPBDataWriterWriteSint32Field(uint64_t a1, int a2, int a3)
{
  unint64_t v5 = (2 * a2) ^ (a2 >> 31);
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v13 = (unsigned char *)result[1];
  if (v5 < 0x80)
  {
    LOBYTE(v14) = v5;
  }
  else
  {
    do
    {
      *v13++ = v5 | 0x80;
      unint64_t v14 = v5 >> 7;
      unint64_t v15 = v5 >> 14;
      v5 >>= 7;
    }
    while (v15);
  }
  *unint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

void *CCPBDataWriterWriteSint64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = 2 * a2;
  Class result = *(void **)(a1 + 8);
  unint64_t v8 = result[3];
  if (v8 < result[1] + 16)
  {
    unint64_t v9 = v8 - result[2];
    if (v9 <= 0x10) {
      uint64_t v10 = 16;
    }
    else {
      uint64_t v10 = v9;
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v10);
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v11 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    unint64_t v12 = (8 * a3);
    unint64_t v13 = (unsigned char *)result[1];
    if (v12 < 0x80)
    {
      LOBYTE(v14) = 8 * a3;
    }
    else
    {
      do
      {
        *v13++ = v12 | 0x80;
        unint64_t v14 = v12 >> 7;
        unint64_t v15 = v12 >> 14;
        v12 >>= 7;
      }
      while (v15);
    }
    *unint64_t v13 = v14;
    *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
    Class result = *(void **)(a1 + 8);
  }
  unint64_t v16 = (unsigned char *)result[1];
  if (v11 < 0x80)
  {
    uint64_t v17 = v6 ^ (a2 >> 63);
  }
  else
  {
    do
    {
      *v16++ = v11 | 0x80;
      uint64_t v17 = v11 >> 7;
      unint64_t v18 = v11 >> 14;
      v11 >>= 7;
    }
    while (v18);
  }
  *unint64_t v16 = v17;
  *(void *)(*(void *)(a1 + 8) + 8) = v16 + 1;
  return result;
}

void *CCPBDataWriterWriteFloatField(uint64_t a1, int a2, float a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a2 != -1)
  {
    unint64_t v9 = (8 * a2) | 5u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  *(float *)result[1] = a3;
  *(void *)(*(void *)(a1 + 8) + 8) += 4;
  return result;
}

void *CCPBDataWriterWriteDoubleField(uint64_t a1, int a2, double a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a2 != -1)
  {
    unint64_t v9 = (8 * a2) | 1u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  *(double *)result[1] = a3;
  *(void *)(*(void *)(a1 + 8) + 8) += 8;
  return result;
}

void *CCPBDataWriterWriteFixed32Field(uint64_t a1, int a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 5u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 4;
  return result;
}

void *CCPBDataWriterWriteFixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 1u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  *(void *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 8;
  return result;
}

void *CCPBDataWriterWriteSfixed32Field(uint64_t a1, int a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 5u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 4;
  return result;
}

void *CCPBDataWriterWriteSfixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 1u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  *(void *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 8;
  return result;
}

void *CCPBDataWriterPlaceMark(uint64_t a1, void *a2, int a3)
{
  Class result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 10)
  {
    if (v7 - result[2] <= 0xA) {
      uint64_t v8 = 10;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    Class result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 2u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    Class result = *(void **)(a1 + 8);
  }
  ++result[1];
  *a2 = *(void *)(*(void *)(a1 + 8) + 8) - *(void *)(*(void *)(a1 + 8) + 16);
  return result;
}

void *CCPBDataWriterRecallMark(uint64_t a1, uint64_t *a2)
{
  Class result = *(void **)(a1 + 8);
  uint64_t v5 = result[1];
  uint64_t v6 = result[2];
  uint64_t v7 = *a2;
  size_t v8 = v5 - (*a2 + v6);
  unint64_t v9 = -1;
  unint64_t v10 = v8;
  do
  {
    ++v9;
    BOOL v11 = v10 > 0x7F;
    v10 >>= 7;
  }
  while (v11);
  if (v9)
  {
    unint64_t v12 = result[3];
    if (v12 < v5 + v9)
    {
      unint64_t v13 = v12 - v6;
      if (v13 <= v9) {
        uint64_t v14 = v9;
      }
      else {
        uint64_t v14 = v13;
      }
      -[CCPBMutableData _pb_growCapacityBy:](result, v14);
      uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 16);
      uint64_t v7 = *a2;
    }
    Class result = memmove((void *)(v6 + v7 + v9), (const void *)(v6 + v7), v8);
    uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 16);
    uint64_t v7 = *a2;
  }
  unint64_t v15 = (unsigned char *)(v6 + v7 - 1);
  if (v8 < 0x80)
  {
    LOBYTE(v16) = v8;
  }
  else
  {
    do
    {
      *v15++ = v8 | 0x80;
      size_t v16 = v8 >> 7;
      size_t v17 = v8 >> 14;
      v8 >>= 7;
    }
    while (v17);
  }
  unsigned char *v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) += v9;
  return result;
}

void CCPBDataWriterWriteRepeatedUInt32Field(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedUInt32Field_block_invoke;
  v9[3] = &unk_265279D98;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateUInt32ValuesWithBlock:v9];

  size_t v8 = [v7 immutableData];
  CCPBDataWriterWriteDataField(a1, v8, a3);
}

void __CCPBDataWriterWriteRepeatedUInt32Field_block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = v4[3];
  uint64_t v6 = (unsigned char *)v4[1];
  if (v5 < (unint64_t)(v6 + 10))
  {
    if (v5 - v4[2] <= 0xA) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = v5 - v4[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](v4, v7);
    uint64_t v6 = *(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  }
  unint64_t v8 = a2;
  if (a2 < 0x80)
  {
    LOBYTE(v9) = a2;
  }
  else
  {
    do
    {
      *v6++ = v8 | 0x80;
      unint64_t v9 = v8 >> 7;
      unint64_t v10 = v8 >> 14;
      v8 >>= 7;
    }
    while (v10);
  }
  *uint64_t v6 = v9;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) = v6 + 1;
}

void CCPBDataWriterWriteRepeatedUInt64Field(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedUInt64Field_block_invoke;
  v9[3] = &unk_265279DC0;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateUInt64ValuesWithBlock:v9];

  unint64_t v8 = [v7 immutableData];
  CCPBDataWriterWriteDataField(a1, v8, a3);
}

void __CCPBDataWriterWriteRepeatedUInt64Field_block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = v4[3];
  uint64_t v6 = (unsigned char *)v4[1];
  if (v5 < (unint64_t)(v6 + 10))
  {
    if (v5 - v4[2] <= 0xA) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = v5 - v4[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](v4, v7);
    uint64_t v6 = *(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  }
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      *v6++ = a2 | 0x80;
      unint64_t v8 = a2 >> 7;
      unint64_t v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }
  *uint64_t v6 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) = v6 + 1;
}

void CCPBDataWriterWriteRepeatedInt32Field(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedInt32Field_block_invoke;
  v9[3] = &unk_265279DE8;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateInt32ValuesWithBlock:v9];

  unint64_t v8 = [v7 immutableData];
  CCPBDataWriterWriteDataField(a1, v8, a3);
}

void __CCPBDataWriterWriteRepeatedInt32Field_block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = v4[3];
  uint64_t v6 = (unsigned char *)v4[1];
  if (v5 < (unint64_t)(v6 + 10))
  {
    if (v5 - v4[2] <= 0xA) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = v5 - v4[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](v4, v7);
    uint64_t v6 = *(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  }
  unint64_t v8 = (int)a2;
  if (a2 < 0x80)
  {
    LOBYTE(v9) = a2;
  }
  else
  {
    do
    {
      *v6++ = v8 | 0x80;
      unint64_t v9 = v8 >> 7;
      unint64_t v10 = v8 >> 14;
      v8 >>= 7;
    }
    while (v10);
  }
  *uint64_t v6 = v9;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) = v6 + 1;
}

void CCPBDataWriterWriteRepeatedInt64Field(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedInt64Field_block_invoke;
  v9[3] = &unk_265279E10;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateInt64ValuesWithBlock:v9];

  unint64_t v8 = [v7 immutableData];
  CCPBDataWriterWriteDataField(a1, v8, a3);
}

void __CCPBDataWriterWriteRepeatedInt64Field_block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = v4[3];
  uint64_t v6 = (unsigned char *)v4[1];
  if (v5 < (unint64_t)(v6 + 10))
  {
    if (v5 - v4[2] <= 0xA) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = v5 - v4[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](v4, v7);
    uint64_t v6 = *(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  }
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      *v6++ = a2 | 0x80;
      unint64_t v8 = a2 >> 7;
      unint64_t v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }
  *uint64_t v6 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) = v6 + 1;
}

void CCPBDataWriterWriteRepeatedFloatField(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedFloatField_block_invoke;
  v9[3] = &unk_265279E38;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateFloatValuesWithBlock:v9];

  unint64_t v8 = [v7 immutableData];
  CCPBDataWriterWriteDataField(a1, v8, a3);
}

void __CCPBDataWriterWriteRepeatedFloatField_block_invoke(uint64_t a1, float a2)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = v4[3];
  uint64_t v6 = (float *)v4[1];
  if (v5 < (unint64_t)(v6 + 1))
  {
    unint64_t v7 = v5 - v4[2];
    if (v7 <= 4) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = v7;
    }
    -[CCPBMutableData _pb_growCapacityBy:](v4, v8);
    uint64_t v6 = *(float **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  }
  *uint64_t v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) += 4;
}

void CCPBDataWriterWriteRepeatedDoubleField(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedDoubleField_block_invoke;
  v9[3] = &unk_265279E60;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateDoubleValuesWithBlock:v9];

  uint64_t v8 = [v7 immutableData];
  CCPBDataWriterWriteDataField(a1, v8, a3);
}

void __CCPBDataWriterWriteRepeatedDoubleField_block_invoke(uint64_t a1, double a2)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = v4[3];
  uint64_t v6 = (double *)v4[1];
  if (v5 < (unint64_t)(v6 + 1))
  {
    unint64_t v7 = v5 - v4[2];
    if (v7 <= 8) {
      uint64_t v8 = 8;
    }
    else {
      uint64_t v8 = v7;
    }
    -[CCPBMutableData _pb_growCapacityBy:](v4, v8);
    uint64_t v6 = *(double **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  }
  *uint64_t v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) += 8;
}

void CCPBDataWriterWriteRepeatedBoolField(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedBoolField_block_invoke;
  v9[3] = &unk_265279E88;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateBoolValuesWithBlock:v9];

  uint64_t v8 = [v7 immutableData];
  CCPBDataWriterWriteDataField(a1, v8, a3);
}

void __CCPBDataWriterWriteRepeatedBoolField_block_invoke(uint64_t a1, char a2)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = v4[3];
  uint64_t v6 = (unsigned char *)v4[1];
  if (v5 < (unint64_t)(v6 + 10))
  {
    if (v5 - v4[2] <= 0xA) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = v5 - v4[2];
    }
    -[CCPBMutableData _pb_growCapacityBy:](v4, v7);
    uint64_t v6 = *(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  }
  *uint64_t v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) = v6 + 1;
}

id CCSetLibraryConfigurationRegistryBridge()
{
  if (CCSetLibraryConfigurationRegistryBridge_onceToken != -1) {
    dispatch_once(&CCSetLibraryConfigurationRegistryBridge_onceToken, &__block_literal_global);
  }
  dispatch_queue_t v0 = (void *)CCSetLibraryConfigurationRegistryBridge_registryClass;

  return v0;
}

void __CCSetLibraryConfigurationRegistryBridge_block_invoke()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCCSetLibraryConfigurationRegistryClass_softClass;
  uint64_t v8 = getCCSetLibraryConfigurationRegistryClass_softClass;
  if (!getCCSetLibraryConfigurationRegistryClass_softClass)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getCCSetLibraryConfigurationRegistryClass_block_invoke;
    v4[3] = &unk_265279D38;
    v4[4] = &v5;
    __getCCSetLibraryConfigurationRegistryClass_block_invoke((uint64_t)v4);
    dispatch_queue_t v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  CCSetLibraryConfigurationRegistryBridge_registryClass = (uint64_t)v1;
  if (!v1)
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v3 = [NSString stringWithUTF8String:"id<CCSetConfigurationRegistryProtocol>  _Nonnull CCSetLibraryConfigurationRegistryBridge(void)_block_invoke"];
    [v2 handleFailureInFunction:v3 file:@"CCSetConfigurationRegistry.m" lineNumber:25 description:@"Must have IntelligencePlatformLibrary framework linked to obtain CCSetResourceLibraryConfigurationRegistry"];
  }
}

void sub_249BA8B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCCSetLibraryConfigurationRegistryClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __IntelligencePlatformLibraryLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_265279F48;
    uint64_t v5 = 0;
    IntelligencePlatformLibraryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary_0) {
    __getCCSetLibraryConfigurationRegistryClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CCSetLibraryConfigurationRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSetLibraryConfigurationRegistryClass_block_invoke_cold_2();
  }
  getCCSetLibraryConfigurationRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IntelligencePlatformLibraryLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  IntelligencePlatformLibraryLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t __IntelligencePlatformLibraryLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  IntelligencePlatformLibraryLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_249BA979C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _NSStringFromXPCDictionary(void *a1, const char *a2)
{
  string = (void *)xpc_dictionary_get_string(a1, a2);
  if (string)
  {
    string = [NSString stringWithUTF8String:string];
  }

  return string;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_249BACA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

void sub_249BACFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BAD2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BAEB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BAEDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BAF508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

Class __getCKDistributedSiteIdentifierClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __CloudKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26527A158;
    uint64_t v5 = 0;
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary) {
    __getCKDistributedSiteIdentifierClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CKDistributedSiteIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKDistributedSiteIdentifierClass_block_invoke_cold_2();
  }
  getCKDistributedSiteIdentifierClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t CCItemStateDescription(unsigned int a1)
{
  if (a1 > 2) {
    id v1 = @"Undefined";
  }
  else {
    id v1 = off_26527A170[(char)a1];
  }
  return [NSString stringWithFormat:@"%@ (%u)", v1, a1];
}

uint64_t CCPBReaderSkipValueWithTag(void *a1, int a2, int a3)
{
  return _CCPBReaderSkipValueWithTag(a1, a2, a3, 0);
}

uint64_t CCPBReaderReadBigEndianFixed16(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFDLL && (unint64_t v3 = v2 + 2, v2 + 2 <= v1[5]))
  {
    unsigned int v4 = *(unsigned __int16 *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    unsigned int v4 = 0;
    v1[2] = 1;
  }
  uint64_t v5 = __rev16(v4);

  return v5;
}

uint64_t CCPBReaderReadBigEndianFixed32(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v3 = v2 + 4, v2 + 4 <= v1[5]))
  {
    unsigned int v4 = *(_DWORD *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    unsigned int v4 = 0;
    v1[2] = 1;
  }
  uint64_t v5 = bswap32(v4);

  return v5;
}

unint64_t CCPBReaderReadBigEndianFixed64(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFF7 && (unint64_t v3 = v2 + 8, v2 + 8 <= v1[5]))
  {
    unint64_t v4 = *(void *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    unint64_t v4 = 0;
    v1[2] = 1;
  }
  unint64_t v5 = bswap64(v4);

  return v5;
}

id CCPBReaderReadString(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = v1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if ([v1 hasError])
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = v2[1];
    BOOL v9 = __CFADD__(v12, v10);
    unint64_t v13 = v12 + v10;
    if (v9 || v13 > v2[5])
    {
      BOOL v11 = 0;
      v2[2] = 1;
    }
    else
    {
      uint64_t v14 = [(id)v2[4] bytes] + v2[1];
      BOOL v11 = (void *)[[NSString alloc] initWithBytes:v14 length:v10 encoding:4];
      v2[1] += v10;
    }
  }

  return v11;
}

id CCPBReaderReadData(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = v1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    if (v4++ >= 9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if ([v1 hasError])
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = v2[1];
    if (__CFADD__(v12, v10) || (unint64_t)(v12 + v10) > v2[5])
    {
      BOOL v11 = 0;
      v2[2] = 1;
    }
    else
    {
      BOOL v11 = objc_msgSend((id)v2[4], "subdataWithRange:");
      v2[1] += v10;
    }
  }

  return v11;
}

uint64_t CCPBReaderPlaceMark(void *a1, unint64_t *a2)
{
  char v3 = a1;
  unsigned int v4 = v3;
  char v5 = 0;
  unsigned int v6 = 0;
  uint64_t v7 = 0;
  unint64_t v8 = v3[1];
  while (1)
  {
    unint64_t v9 = v8 + 1;
    if (v8 == -1 || v9 > v3[5]) {
      break;
    }
    char v10 = *(unsigned char *)(v3[3] + v8);
    v3[1] = v9;
    v7 |= (unint64_t)(v10 & 0x7F) << v5;
    if ((v10 & 0x80) == 0) {
      goto LABEL_9;
    }
    v5 += 7;
    unint64_t v8 = v9;
    if (v6++ >= 9)
    {
      uint64_t v12 = 0;
      goto LABEL_12;
    }
  }
  v3[2] = 1;
LABEL_9:
  if (v3[2]) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v7;
  }
LABEL_12:
  if ([v3 hasError])
  {
    uint64_t v13 = 0;
  }
  else
  {
    unint64_t v14 = v4[1] + v12;
    if (v14 <= v4[5])
    {
      *a2 = v14;
      a2[1] = v4[5];
      void v4[5] = v4[1] + v12;
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
      v4[2] = 1;
    }
  }

  return v13;
}

uint64_t CCPBReaderRecallMark(uint64_t result, void *a2)
{
  *(void *)(result + 8) = *a2;
  *(void *)(result + 40) = a2[1];
  return result;
}

uint64_t _CCPBReaderSkipValueWithTag(void *a1, int a2, int a3, uint64_t a4)
{
  uint64_t v7 = a1;
  unint64_t v8 = v7;
  uint64_t v9 = 0;
  switch(a3)
  {
    case 0:
      unsigned int v10 = 0;
      unint64_t v11 = v7[1];
      while (1)
      {
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > v7[5]) {
          break;
        }
        int v13 = *(char *)(v7[3] + v11);
        v7[1] = v12;
        uint64_t v9 = 1;
        if (v13 < 0)
        {
          unint64_t v11 = v12;
          BOOL v14 = v10++ > 8;
          if (!v14) {
            continue;
          }
        }
        goto LABEL_50;
      }
      uint64_t v9 = 1;
      v7[2] = 1;
      goto LABEL_50;
    case 1:
      unint64_t v15 = v7[1];
      if (v15 > 0xFFFFFFFFFFFFFFF7) {
        goto LABEL_47;
      }
      unint64_t v16 = v15 + 8;
      goto LABEL_46;
    case 2:
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      unint64_t v20 = v7[1];
      while (2)
      {
        unint64_t v21 = v20 + 1;
        if (v20 == -1 || v21 > v7[5])
        {
          v7[2] = 1;
          unint64_t v21 = v20;
        }
        else
        {
          char v22 = *(unsigned char *)(v7[3] + v20);
          v7[1] = v21;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if (v22 < 0)
          {
            v17 += 7;
            unint64_t v20 = v21;
            BOOL v23 = v18++ >= 9;
            if (v23)
            {
              uint64_t v19 = 0;
              goto LABEL_45;
            }
            continue;
          }
        }
        break;
      }
      uint64_t v19 = v19;
      if (v7[2]) {
        uint64_t v19 = 0;
      }
LABEL_45:
      BOOL v23 = __CFADD__(v21, v19);
      unint64_t v16 = v21 + v19;
      if (v23) {
        goto LABEL_47;
      }
LABEL_46:
      if (v16 > v7[5])
      {
LABEL_47:
        uint64_t v9 = 1;
        v7[2] = 1;
        goto LABEL_50;
      }
      v7[1] = v16;
      goto LABEL_49;
    case 3:
      if ([v7 hasError]) {
        goto LABEL_49;
      }
      unint64_t v24 = a4 + 1;
      break;
    case 5:
      unint64_t v34 = v7[1];
      if (v34 > 0xFFFFFFFFFFFFFFFBLL) {
        goto LABEL_47;
      }
      unint64_t v16 = v34 + 4;
      goto LABEL_46;
    default:
      goto LABEL_50;
  }
  while (2)
  {
    char v25 = 0;
    unsigned int v26 = 0;
    unint64_t v27 = 0;
    unint64_t v28 = v8[1];
    while (1)
    {
      unint64_t v29 = v28 + 1;
      if (v28 == -1 || v29 > v8[5]) {
        break;
      }
      char v30 = *(unsigned char *)(v8[3] + v28);
      v8[1] = v29;
      v27 |= (unint64_t)(v30 & 0x7F) << v25;
      if ((v30 & 0x80) == 0) {
        goto LABEL_28;
      }
      v25 += 7;
      unint64_t v28 = v29;
      BOOL v14 = v26++ > 8;
      if (v14)
      {
        unint64_t v31 = 0;
        uint64_t v32 = 0;
        goto LABEL_34;
      }
    }
    v8[2] = 1;
LABEL_28:
    if (v8[2]) {
      unint64_t v27 = 0;
    }
    uint64_t v32 = v27 & 7;
    unint64_t v31 = v27 >> 3;
    if (v32 == 4 && v31 == a2) {
      break;
    }
LABEL_34:
    if (v24 < 0x41) {
      _CCPBReaderSkipValueWithTag(v8, v31, v32, v24);
    }
    else {
      v8[2] = 2;
    }
    if (!objc_msgSend(v8, "hasError", v32)) {
      continue;
    }
    break;
  }
LABEL_49:
  uint64_t v9 = 1;
LABEL_50:

  return v9;
}

uint64_t CCPBReaderReadVarIntBuf(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    if (a2 == v5) {
      return 0;
    }
    char v7 = *(unsigned char *)(a1 + v5);
    v6 |= (unint64_t)(v7 & 0x7F) << v4;
    ++v5;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v4 += 7;
    if (v5 == 10)
    {
      uint64_t result = 0;
      *a4 = 11;
      *a3 = 0;
      return result;
    }
  }
  *a3 = v6;
  *a4 = v5;
  return 1;
}

void CCPBReaderAppendRepeatedUInt32FieldValues(void *a1, void *a2)
{
  id v21 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v11 = a1[1];
    BOOL v9 = __CFADD__(v11, v10);
    unint64_t v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      uint64_t v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v14 = a1[1];
      if (v14 >= v12) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5]) {
          break;
        }
        char v19 = *(unsigned char *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_29;
        }
        v15 += 7;
        unint64_t v14 = v18;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v20 = 0;
          goto LABEL_32;
        }
      }
      a1[2] = 1;
LABEL_29:
      if (a1[2]) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v17;
      }
LABEL_32:
      [v21 appendUInt32Value:v20];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v14 != v12)
    {
      uint64_t v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

void CCPBReaderAppendRepeatedUInt64FieldValues(void *a1, void *a2)
{
  id v21 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v11 = a1[1];
    BOOL v9 = __CFADD__(v11, v10);
    unint64_t v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      uint64_t v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v14 = a1[1];
      if (v14 >= v12) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5]) {
          break;
        }
        char v19 = *(unsigned char *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_29;
        }
        v15 += 7;
        unint64_t v14 = v18;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v20 = 0;
          goto LABEL_32;
        }
      }
      a1[2] = 1;
LABEL_29:
      if (a1[2]) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v17;
      }
LABEL_32:
      [v21 appendUInt64Value:v20];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v14 != v12)
    {
      uint64_t v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

void CCPBReaderAppendRepeatedInt32FieldValues(void *a1, void *a2)
{
  id v21 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v11 = a1[1];
    BOOL v9 = __CFADD__(v11, v10);
    unint64_t v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      uint64_t v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v14 = a1[1];
      if (v14 >= v12) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5]) {
          break;
        }
        char v19 = *(unsigned char *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_29;
        }
        v15 += 7;
        unint64_t v14 = v18;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v20 = 0;
          goto LABEL_32;
        }
      }
      a1[2] = 1;
LABEL_29:
      if (a1[2]) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v17;
      }
LABEL_32:
      [v21 appendInt32Value:v20];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v14 != v12)
    {
      uint64_t v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

void CCPBReaderAppendRepeatedInt64FieldValues(void *a1, void *a2)
{
  id v21 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v11 = a1[1];
    BOOL v9 = __CFADD__(v11, v10);
    unint64_t v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      uint64_t v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v14 = a1[1];
      if (v14 >= v12) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5]) {
          break;
        }
        char v19 = *(unsigned char *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_29;
        }
        v15 += 7;
        unint64_t v14 = v18;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v20 = 0;
          goto LABEL_32;
        }
      }
      a1[2] = 1;
LABEL_29:
      if (a1[2]) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v17;
      }
LABEL_32:
      [v21 appendInt64Value:v20];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v14 != v12)
    {
      uint64_t v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

void CCPBReaderAppendRepeatedFloatFieldValues(void *a1, void *a2)
{
  id v16 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v12 = a1[1];
    BOOL v9 = __CFADD__(v12, v10);
    unint64_t v13 = v12 + v10;
    if (v9 || v13 > a1[5])
    {
      uint64_t v14 = 1;
LABEL_16:
      a1[2] = v14;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v15 = a1[1];
      if (v15 >= v13) {
        break;
      }
      if (v15 <= 0xFFFFFFFFFFFFFFFBLL && v15 + 4 <= a1[5])
      {
        LODWORD(v11) = *(_DWORD *)(a1[3] + v15);
        a1[1] = v15 + 4;
      }
      else
      {
        a1[2] = 1;
        double v11 = 0.0;
      }
      [v16 appendFloatValue:v11];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v15 != v13)
    {
      uint64_t v14 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

void CCPBReaderAppendRepeatedDoubleFieldValues(void *a1, void *a2)
{
  id v16 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v11 = a1[1];
    BOOL v9 = __CFADD__(v11, v10);
    unint64_t v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      uint64_t v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v14 = a1[1];
      if (v14 >= v12) {
        break;
      }
      if (v14 <= 0xFFFFFFFFFFFFFFF7 && v14 + 8 <= a1[5])
      {
        double v15 = *(double *)(a1[3] + v14);
        a1[1] = v14 + 8;
      }
      else
      {
        a1[2] = 1;
        double v15 = 0.0;
      }
      [v16 appendDoubleValue:v15];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v14 != v12)
    {
      uint64_t v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

void CCPBReaderAppendRepeatedBoolFieldValues(void *a1, void *a2)
{
  id v20 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v11 = a1[1];
    BOOL v9 = __CFADD__(v11, v10);
    unint64_t v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      uint64_t v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v14 = a1[1];
      if (v14 >= v12) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5]) {
          break;
        }
        char v19 = *(unsigned char *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_29;
        }
        v15 += 7;
        unint64_t v14 = v18;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v17 = 0;
          goto LABEL_31;
        }
      }
      a1[2] = 1;
LABEL_29:
      if (a1[2]) {
        uint64_t v17 = 0;
      }
LABEL_31:
      [v20 appendBoolValue:v17 != 0];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v14 != v12)
    {
      uint64_t v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

void CCPBReaderAppendRepeatedEnumFieldValues(void *a1, void *a2)
{
  id v21 = a2;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = a1[1];
  while (1)
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5]) {
      break;
    }
    char v8 = *(unsigned char *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0) {
      goto LABEL_9;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v5;
  }
LABEL_12:
  if (([a1 hasError] & 1) == 0)
  {
    uint64_t v11 = a1[1];
    BOOL v9 = __CFADD__(v11, v10);
    unint64_t v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      uint64_t v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      unint64_t v14 = a1[1];
      if (v14 >= v12) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5]) {
          break;
        }
        char v19 = *(unsigned char *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_29;
        }
        v15 += 7;
        unint64_t v14 = v18;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v20 = 0;
          goto LABEL_32;
        }
      }
      a1[2] = 1;
LABEL_29:
      if (a1[2]) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v17;
      }
LABEL_32:
      [v21 appendRawEnumValue:v20];
      if ([a1 hasError]) {
        goto LABEL_17;
      }
    }
    if (v14 != v12)
    {
      uint64_t v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:
}

id _createSQLiteAPIErrorFromResultCode(int a1, uint64_t a2)
{
  if (a1)
  {
    unsigned int v4 = sqlite3_errstr(a1);
    if (v4)
    {
      uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:v4];
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v7 = v6;
      if (v5)
      {
        [v6 setObject:v5 forKey:*MEMORY[0x263F08320]];
      }
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    BOOL v9 = [NSNumber numberWithInt:a2];
    [v7 setObject:v9 forKey:@"CCSQLiteAPIErrorExtendedCode"];

    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = (void *)[v7 copy];
    char v8 = [v10 errorWithDomain:@"com.apple.CascadeSets.SQLiteAPI" code:a1 userInfo:v11];
  }
  else
  {
    char v8 = 0;
  }
  unint64_t v12 = _NSNullIfNilObject(v8);

  return v12;
}

id _errorDescriptionForCommand()
{
  dispatch_queue_t v0 = NSString;
  id v1 = (objc_class *)objc_opt_class();
  unint64_t v2 = NSStringFromClass(v1);
  char v3 = [v0 stringWithFormat:@"Failed to execute %@", v2];

  return v3;
}

uint64_t CCSQLiteDatabaseExtendedErrorCode(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = [a1 userInfo];
  unint64_t v2 = [v1 objectForKey:*MEMORY[0x263F08608]];

  char v3 = [v2 userInfo];
  unsigned int v4 = [v3 objectForKey:@"CCSQLiteAPIErrorExtendedCode"];

  if (v4) {
    uint64_t v5 = [v4 integerValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_249BB4A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCKDistributedTimestampStateVectorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCKDistributedTimestampStateVectorClass_softClass;
  uint64_t v7 = getCKDistributedTimestampStateVectorClass_softClass;
  if (!getCKDistributedTimestampStateVectorClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampStateVectorClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCKDistributedTimestampStateVectorClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BB6554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __CloudKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26527A2A0;
    uint64_t v5 = 0;
    CloudKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_0) {
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CKDistributedTimestampStateVector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2();
  }
  getCKDistributedTimestampStateVectorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id _donationInactiveError(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  char v3 = [NSString stringWithFormat:@"Donation %@ request (%@) cannot be processed on an inactive donation.", a1, a2];
  v8[0] = v3;
  long long v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 errorWithDomain:@"com.apple.CascadeSets.Donate" code:4 userInfo:v4];

  return v5;
}

id _donationResponseError(void *a1, void *a2, unsigned int a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = CCDonateErrorCodeFromServiceResponse(a3);
  uint64_t v15 = *MEMORY[0x263F08320];
  BOOL v9 = NSString;
  uint64_t v10 = CCDonateServiceResponseDescription(a3);
  uint64_t v11 = [v9 stringWithFormat:@"Donation %@ request (%@) failed: %@", v7, v6, v10, v15];

  v16[0] = v11;
  unint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v13 = [v5 errorWithDomain:@"com.apple.CascadeSets.Donate" code:v8 userInfo:v12];

  return v13;
}

void sub_249BB7C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BB7CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

__CFString *CCSharedItemChangeTypeToString(int a1)
{
  id v1 = @"None";
  if (!a1) {
    id v1 = @"SharedItemAdded";
  }
  if (a1 == 2) {
    return @"SharedItemRemoved";
  }
  else {
    return v1;
  }
}

__CFString *CCStringFromItemFieldDataType(unsigned int a1)
{
  if (a1 > 0x15) {
    return @"Unknown";
  }
  else {
    return *(&off_26527A460 + (char)a1);
  }
}

uint64_t CCReplicatedEntityEnumeratorBookmarkCurrentVersion()
{
  return 6;
}

id getCKDistributedTimestampStateVectorClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCKDistributedTimestampStateVectorClass_softClass_0;
  uint64_t v7 = getCKDistributedTimestampStateVectorClass_softClass_0;
  if (!getCKDistributedTimestampStateVectorClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampStateVectorClass_block_invoke_0;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCKDistributedTimestampStateVectorClass_block_invoke_0((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BBE59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __CloudKitLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26527A510;
    uint64_t v5 = 0;
    CloudKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_1) {
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CKDistributedTimestampStateVector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_0();
  }
  getCKDistributedTimestampStateVectorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

id CCInvalidSetItemTypeIdentifierErrorForIdentifier(unsigned int a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F087E8];
  unint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"The provided type identifier %hu is not a valid item type identifier", a1, *MEMORY[0x263F07F80]);
  v7[0] = v2;
  char v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  long long v4 = [v1 errorWithDomain:@"com.apple.CascadeSets.Set" code:1 userInfo:v3];

  return v4;
}

id CCInvalidBufferErrorForMessage(uint64_t a1, uint64_t a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  char v3 = (void *)MEMORY[0x263F087E8];
  long long v4 = [NSString stringWithFormat:@"Protocol buffer deserialization failed for message: %@", a1, *MEMORY[0x263F07F80]];
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08608];
  uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.Serialization" code:a2 userInfo:0];
  v10[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = [v3 errorWithDomain:@"com.apple.CascadeSets.Item" code:4 userInfo:v6];

  return v7;
}

id CCSkipFieldErrorForMessage(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  void v12[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = [NSString stringWithFormat:@"Protocol buffer could not skip field with tag %u type %u failed for message: %@", a2, a3, a1, *MEMORY[0x263F07F80]];
  v12[0] = v6;
  v11[1] = *MEMORY[0x263F08608];
  uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.Serialization" code:a4 userInfo:0];
  v12[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = [v5 errorWithDomain:@"com.apple.CascadeSets.Item" code:4 userInfo:v8];

  return v9;
}

id CCMismatchedFieldAccessorErrorForField(void *a1, void *a2, void *a3, void *a4)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v22 = *MEMORY[0x263F083F0];
  uint64_t v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  uint64_t v13 = (void *)[[v8 alloc] initWithFormat:@"Using selector %@ on a field with name: %@ of dataType: %@ - use %@ instead", v11, v12, v10, v9];

  id v14 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v24 = *MEMORY[0x263F08320];
  v25[0] = v13;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  unsigned int v16 = (void *)[v14 initWithDomain:@"com.apple.CascadeSets.Item" code:1 userInfo:v15];

  id v21 = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  BOOL v23 = v17;
  unint64_t v18 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  char v19 = [v7 errorWithDomain:@"com.apple.CascadeSets.Item" code:1 userInfo:v18];

  return v19;
}

id CCErrorByJoiningMismatchedFieldAccessorErrorUnderlyingErrors(void *a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)MEMORY[0x263F083F0];
  if (v3)
  {
    uint64_t v7 = [v3 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*v6];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 addObjectsFromArray:v8];
      }
    }
  }
  if (v4)
  {
    id v9 = [v4 userInfo];
    id v10 = [v9 objectForKeyedSubscript:*v6];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 addObjectsFromArray:v10];
      }
    }
  }
  if ([v5 count])
  {
    id v11 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v15 = *v6;
    v16[0] = v5;
    id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = (void *)[v11 initWithDomain:@"com.apple.CascadeSets.Item" code:1 userInfo:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id CCUnrecognizedIdentifierErrorForDescription(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v1 = (objc_class *)MEMORY[0x263F087E8];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = v2;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  uint64_t v5 = (void *)[v3 initWithDomain:@"com.apple.CascadeSets.Item" code:6 userInfo:v4];

  return v5;
}

id CCMissingSourceItemIdentifierErrorForMessage(void *a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v1 = (objc_class *)MEMORY[0x263F087E8];
  id v2 = a1;
  id v3 = [v1 alloc];
  id v4 = [NSString stringWithFormat:@"Provided data for message %@ is missing a source identifer", v2, *MEMORY[0x263F07F80]];

  v9[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = (void *)[v3 initWithDomain:@"com.apple.CascadeSets.Item" code:7 userInfo:v5];

  return v6;
}

__CFString *CCSetEnumeratorOptionsDescription(int a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_opt_new();
    id v3 = v2;
    if (v1) {
      [v2 addObject:@"EnumerateUserVaultSets"];
    }
    id v4 = [v3 componentsJoinedByString:@"|"];
  }
  else
  {
    id v4 = &stru_26FDBF2B8;
  }

  return v4;
}

id getCKDistributedTimestampStateVectorClass_1()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCKDistributedTimestampStateVectorClass_softClass_1;
  uint64_t v7 = getCKDistributedTimestampStateVectorClass_softClass_1;
  if (!getCKDistributedTimestampStateVectorClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampStateVectorClass_block_invoke_1;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCKDistributedTimestampStateVectorClass_block_invoke_1((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BC0864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKDistributedTimestampClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCKDistributedTimestampClass_softClass;
  uint64_t v7 = getCKDistributedTimestampClass_softClass;
  if (!getCKDistributedTimestampClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCKDistributedTimestampClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BC141C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BC22FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

id getCKMergeableDeltaVectorsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getCKMergeableDeltaVectorsClass_softClass;
  uint64_t v7 = getCKMergeableDeltaVectorsClass_softClass;
  if (!getCKMergeableDeltaVectorsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCKMergeableDeltaVectorsClass_block_invoke;
    v3[3] = &unk_265279D38;
    v3[4] = &v4;
    __getCKMergeableDeltaVectorsClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_249BC23FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BC28B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BC29B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke_1(uint64_t a1)
{
  CloudKitLibrary();
  Class result = objc_getClass("CKDistributedTimestampStateVector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_1();
  }
  getCKDistributedTimestampStateVectorClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CloudKitLibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_2)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __CloudKitLibraryCore_block_invoke_2;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26527A5E0;
    uint64_t v2 = 0;
    CloudKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_2) {
    CloudKitLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __CloudKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getCKDistributedTimestampClass_block_invoke(uint64_t a1)
{
  CloudKitLibrary();
  Class result = objc_getClass("CKDistributedTimestamp");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKDistributedTimestampClass_block_invoke_cold_1();
  }
  getCKDistributedTimestampClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKMergeableDeltaVectorsClass_block_invoke(uint64_t a1)
{
  CloudKitLibrary();
  Class result = objc_getClass("CKMergeableDeltaVectors");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKMergeableDeltaVectorsClass_block_invoke_cold_1();
  }
  getCKMergeableDeltaVectorsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void CCSetAndReportError(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3) {
    *a1 = v3;
  }
  uint64_t v5 = [v4 domain];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = v4;
    AnalyticsSendEventLazy();
  }
}

id __CCSetAndReportError_block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) underlyingErrors];
  id v3 = [v2 firstObject];

  uint64_t v4 = [*(id *)(a1 + 32) description];
  v11[0] = @"domain";
  uint64_t v5 = [*(id *)(a1 + 32) domain];
  v12[0] = v5;
  v11[1] = @"code";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v12[1] = v6;
  void v11[2] = @"underlyingCode";
  if (v3) {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
  }
  else {
  id v7 = [MEMORY[0x263EFF9D0] null];
  }
  void v12[2] = v7;
  v11[3] = @"description";
  uint64_t v8 = v4;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  }
  void v12[3] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  if (!v4) {

  }
  return v9;
}

uint64_t CCValidateUInt32Field(void *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 compare:&unk_26FDCD4C0] == -1)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for uint32_t field %@ is less than 0", v6, v5];
    v19[0] = v8;
    uint64_t v9 = NSDictionary;
    id v10 = (void **)v19;
    id v11 = &v18;
  }
  else
  {
    if ([v6 compare:&unk_26FDCD4D8] != 1)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for uint32_t field %@ is greater than UINT32_MAX", v6, v5];
    uint64_t v17 = v8;
    uint64_t v9 = NSDictionary;
    id v10 = &v17;
    id v11 = &v16;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v13 = [v7 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v12];
  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateUInt64Field(void *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 compare:&unk_26FDCD4C0] == -1)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for uint64_t field %@ is less than 0", v6, v5];
    v19[0] = v8;
    uint64_t v9 = NSDictionary;
    id v10 = (void **)v19;
    id v11 = &v18;
  }
  else
  {
    if ([v6 compare:&unk_26FDCD4F0] != 1)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for uint64_t field %@ is greater than UINT64_MAX", v6, v5];
    uint64_t v17 = v8;
    uint64_t v9 = NSDictionary;
    id v10 = &v17;
    id v11 = &v16;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v13 = [v7 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v12];
  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateInt32Field(void *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 compare:&unk_26FDCD508] == -1)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for int32_t field %@ is less than INT32_MIN", v6, v5];
    v19[0] = v8;
    uint64_t v9 = NSDictionary;
    id v10 = (void **)v19;
    id v11 = &v18;
  }
  else
  {
    if ([v6 compare:&unk_26FDCD520] != 1)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for int32_t field %@ is greater than INT32_MAX", v6, v5];
    uint64_t v17 = v8;
    uint64_t v9 = NSDictionary;
    id v10 = &v17;
    id v11 = &v16;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v13 = [v7 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v12];
  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateInt64Field(void *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 compare:&unk_26FDCD538] == -1)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for int64_t field %@ is less than INT64_MIN", v6, v5];
    v19[0] = v8;
    uint64_t v9 = NSDictionary;
    id v10 = (void **)v19;
    id v11 = &v18;
  }
  else
  {
    if ([v6 compare:&unk_26FDCD550] != 1)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for int64_t field %@ is greater than INT64_MAX", v6, v5];
    uint64_t v17 = v8;
    uint64_t v9 = NSDictionary;
    id v10 = &v17;
    id v11 = &v16;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v13 = [v7 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v12];
  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateFloatField(void *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 compare:&unk_26FDCD748] == -1)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for float field %@ is less than FLT_MIN", v6, v5];
    v19[0] = v8;
    uint64_t v9 = NSDictionary;
    id v10 = (void **)v19;
    id v11 = &v18;
  }
  else
  {
    if ([v6 compare:&unk_26FDCD758] != 1)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for float field %@ is greater than FLT_MAX", v6, v5];
    uint64_t v17 = v8;
    uint64_t v9 = NSDictionary;
    id v10 = &v17;
    id v11 = &v16;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v13 = [v7 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v12];
  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateDoubleField(void *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 compare:&unk_26FDCD768] == -1)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for double field %@ is less than DBL_MIN", v6, v5];
    v19[0] = v8;
    uint64_t v9 = NSDictionary;
    id v10 = (void **)v19;
    id v11 = &v18;
  }
  else
  {
    if ([v6 compare:&unk_26FDCD778] != 1)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    uint64_t v8 = [NSString stringWithFormat:@"Provided NSNumber %@ for double field %@ is greater than DBL_MAX", v6, v5];
    uint64_t v17 = v8;
    uint64_t v9 = NSDictionary;
    id v10 = &v17;
    id v11 = &v16;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v13 = [v7 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v12];
  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateBoolField(void *a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  CFNumberRef v6 = a2;
  CFIndex ByteSize = CFNumberGetByteSize(v6);
  if (ByteSize == 1)
  {
    if ([(__CFNumber *)v6 compare:&unk_26FDCD4C0] == -1)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F07F80];
      uint64_t v9 = [NSString stringWithFormat:@"Provided NSNumber %@ for BOOL field %@ is less than zero and is not likely to be a boxed BOOLean", v6, v5];
      uint64_t v20 = v9;
      id v10 = NSDictionary;
      id v11 = &v20;
      id v12 = &v19;
    }
    else
    {
      if ([(__CFNumber *)v6 compare:&unk_26FDCD568] != 1)
      {
        uint64_t v15 = 1;
        goto LABEL_11;
      }
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F07F80];
      uint64_t v9 = [NSString stringWithFormat:@"Provided NSNumber %@ for BOOL field %@ is greater than one and is not likely to be a boxed BOOLean", v6, v5];
      uint64_t v18 = v9;
      id v10 = NSDictionary;
      id v11 = &v18;
      id v12 = &v17;
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F80];
    uint64_t v9 = [NSString stringWithFormat:@"Provided NSNumber %@ for BOOL field %@ is has storage size %ld and is not likely to be a boxed BOOLean", v6, v5, ByteSize];
    v22[0] = v9;
    id v10 = NSDictionary;
    id v11 = (void **)v22;
    id v12 = &v21;
  }
  id v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
  id v14 = [v8 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v13];
  if (a3 && v14)
  {
    id v14 = v14;
    *a3 = v14;
  }

  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

uint64_t CCValidateEnumField(void *a1, uint64_t a2, unsigned int (*a3)(uint64_t), void *a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a1;
  if (a2 && !a3(a2))
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F07F80];
    id v10 = [NSString stringWithFormat:@"Provided value %u for enum field %@ is not a valid enum value", a2, v7];
    v16[0] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = [v9 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v11];
    id v13 = v12;
    if (a4 && v12) {
      *a4 = v12;
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

BOOL CCValidateRepeatedEnumField(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  BOOL v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __CCValidateRepeatedEnumField_block_invoke;
  void v12[3] = &unk_26527A628;
  uint64_t v15 = &v19;
  uint64_t v16 = a3;
  id v14 = v17;
  id v9 = v7;
  id v13 = v9;
  [v8 enumerateUInt32ValuesWithBlock:v12];
  id v10 = (void *)v20[5];
  if (a4 && v10) {
    *a4 = v10;
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v10 == 0;
}

void sub_249BC3F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __CCValidateRepeatedEnumField_block_invoke(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a2
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && !(*(unsigned int (**)(uint64_t))(a1 + 56))(a2))
  {
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F07F80];
    id v5 = [NSString stringWithFormat:@"Provided value %u for enum field %@ is not a valid enum value", a2, *(void *)(a1 + 32)];
    v11[0] = v5;
    CFNumberRef v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v7 = [v4 errorWithDomain:@"com.apple.CascadeSets.Item" code:3 userInfo:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t CCValidateArrayValues(void *a1, void *a2, objc_class *a3, void *a4)
{
  v38[1] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v24 = (void *)MEMORY[0x263F087E8];
            uint64_t v34 = *MEMORY[0x263F07F80];
            char v25 = NSString;
            unsigned int v26 = (objc_class *)objc_opt_class();
            uint64_t v19 = NSStringFromClass(v26);
            uint64_t v20 = NSStringFromClass(a3);
            uint64_t v21 = [v25 stringWithFormat:@"Provided array element for field %@ is of class %@, expected class: %@", v7, v19, v20];
            size_t v35 = v21;
            id v23 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            unint64_t v27 = [v24 errorWithDomain:@"com.apple.CascadeSets.Item" code:2 userInfo:v23];
            unint64_t v28 = v27;
            if (a4 && v27) {
              *a4 = v27;
            }

            goto LABEL_18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
        uint64_t v14 = 1;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F07F80];
    uint64_t v16 = NSString;
    uint64_t v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    char v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    uint64_t v20 = [v16 stringWithFormat:@"Provided object for field %@ is of class %@, expected class: %@", v7, v9, v19];
    v38[0] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    uint64_t v22 = [v15 errorWithDomain:@"com.apple.CascadeSets.Item" code:2 userInfo:v21];
    id v23 = v22;
    if (a4 && v22)
    {
      id v23 = v22;
      *a4 = v23;
    }
LABEL_18:

    uint64_t v14 = 0;
  }

  return v14;
}

BOOL CCIsEmptyOrWhitespace(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 length];
  id v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  if (v2)
  {
    if (objc_msgSend(v3, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", 0)))
    {
      uint64_t v4 = 1;
      do
      {
        unint64_t v5 = v4;
        if (v2 == v4) {
          break;
        }
        char v6 = objc_msgSend(v3, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", v4));
        uint64_t v4 = v5 + 1;
      }
      while ((v6 & 1) != 0);
      BOOL v7 = v5 >= v2;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

id CCDateFormattedStringFromTimeMicros(uint64_t a1)
{
  if (a1 < 1)
  {
    id v3 = 0;
  }
  else
  {
    if (CCDateFormattedStringFromTimeMicros_onceToken != -1) {
      dispatch_once(&CCDateFormattedStringFromTimeMicros_onceToken, &__block_literal_global_6);
    }
    unint64_t v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)a1 / 1000000.0];
    id v3 = [(id)CCDateFormattedStringFromTimeMicros_formatter stringFromDate:v2];
  }

  return v3;
}

uint64_t __CCDateFormattedStringFromTimeMicros_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  id v1 = (void *)CCDateFormattedStringFromTimeMicros_formatter;
  CCDateFormattedStringFromTimeMicros_formatter = (uint64_t)v0;

  unint64_t v2 = (void *)CCDateFormattedStringFromTimeMicros_formatter;
  id v3 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v2 setTimeZone:v3];

  unint64_t v4 = [(id)CCDateFormattedStringFromTimeMicros_formatter formatOptions] & 0xFFFFFFFFFFFFF37FLL | 0x880;
  unint64_t v5 = (void *)CCDateFormattedStringFromTimeMicros_formatter;

  return [v5 setFormatOptions:v4];
}

void sub_249BC53DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_249BC606C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id CCAddAcountInfoToDescriptors(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a1;
  char v6 = +[CCSetDescriptor accountIdentifierFromAccount:a2 error:a3];
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "isEqual:", v6, (void)v13)) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v7 = [v7 arrayByAddingObject:v6];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_249BC7390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t CCDonateErrorCodeFromServiceResponse(__int16 a1)
{
  if ((unsigned __int16)(a1 - 4) > 7u) {
    return 0;
  }
  else {
    return qword_249BE0920[(__int16)(a1 - 4)];
  }
}

void sub_249BC7974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249BC7E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_249BC815C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v28 - 128), 8);
  _Block_object_dispose((const void *)(v28 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_249BC8250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_249BC82CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249BC8384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249BC84B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249BC8830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_249BC8C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_249BC8FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_emplace<std::vector<unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FDBEDD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FDBEDD0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24C5B0EE0);
}

void std::__shared_ptr_emplace<std::vector<unsigned short>>::__on_zero_shared(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265279C58, MEMORY[0x263F8C060]);
}

void sub_249BC9210(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  Class result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

__CFString *CCDataResourceStatusToString(unsigned int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 >= 5)
  {
    id v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = a1;
      _os_log_error_impl(&dword_249B92000, v3, OS_LOG_TYPE_ERROR, "CCDataResourceStatusToString received invalid value %lu", buf, 0xCu);
    }

    unint64_t v2 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown - %lu", a1);
  }
  else
  {
    unint64_t v2 = off_26527A990[(char)a1];
  }

  return v2;
}

uint64_t CCDataResourceStatusIsNotDiscoverable(unsigned int a1)
{
  unsigned __int8 v1 = a1;
  if (a1 < 5) {
    return (0x18u >> a1) & 1;
  }
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    CCDataResourceStatusIsNotDiscoverable_cold_1(v1, v3);
  }

  return 0;
}

void sub_249BCA674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id CCGetOrCreateDirectoryPath(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = [NSURL fileURLWithPath:a1 isDirectory:1];
    unint64_t v4 = CCGetOrCreateDirectoryURL(v3, a2);
  }
  else
  {
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:-1000 userInfo:0];
    CCSetError(a2, v3);
    unint64_t v4 = 0;
  }

  return v4;
}

id CCGetOrCreateDirectoryURL(void *a1, void *a2)
{
  id v3 = a1;
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x263F08850] defaultManager];
    int v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:a2];

    id v6 = 0;
    if (v5) {
      id v6 = v3;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:-1000 userInfo:0];
    CCSetError(a2, v7);

    id v6 = 0;
  }

  return v6;
}

uint64_t CCRemoveItemIfExistsAtPath(void *a1, void *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if ([v3 length])
  {
    unint64_t v4 = [NSURL fileURLWithPath:v3];

    uint64_t v5 = CCRemoveItemIfExistsAtURL(v4, a2);
    return v5;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F07F70];
    uint64_t v9 = [NSString stringWithFormat:@"Invalid path: \"%@\"", v3, *MEMORY[0x263F08320]];

    v13[0] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v11 = [v7 errorWithDomain:v8 code:-1000 userInfo:v10];
    CCSetError(a2, v11);

    return 0;
  }
}

uint64_t CCRemoveItemIfExistsAtURL(void *a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (!v3)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F07F70];
    uint64_t v16 = *MEMORY[0x263F08320];
    uint64_t v7 = [NSString stringWithFormat:@"Invalid item URL: %@", 0];
    v17[0] = v7;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v11 = [v8 errorWithDomain:v9 code:-1000 userInfo:v10];
    CCSetError(a2, v11);

    goto LABEL_8;
  }
  unint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v15 = 0;
  char v5 = [v4 removeItemAtURL:v3 error:&v15];
  id v6 = v15;
  uint64_t v7 = v6;
  if ((v5 & 1) == 0)
  {
    uint64_t v12 = [v6 code];

    if (v12 == 4) {
      goto LABEL_6;
    }
    CCSetError(a2, v7);
LABEL_8:
    uint64_t v13 = 0;
    goto LABEL_9;
  }

LABEL_6:
  uint64_t v13 = 1;
LABEL_9:

  return v13;
}

uint64_t CCWritePropertyList(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = [MEMORY[0x263F08AC0] dataWithPropertyList:a1 format:200 options:0 error:a4];
  if ([v8 length])
  {
    id v9 = [v7 path];
    uint64_t v10 = open_dprotected_np((const char *)[v9 UTF8String], 1538, a3, 0, 420);

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v10 closeOnDealloc:1];
    uint64_t v12 = [v11 writeData:v8 error:a4];
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v7 URLByDeletingLastPathComponent];
      uint64_t v14 = [v13 path];

      unsigned __int8 v19 = 0;
      id v15 = [MEMORY[0x263F08850] defaultManager];
      char v16 = [v15 fileExistsAtPath:v14 isDirectory:&v19];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          CCWritePropertyList_cold_1((uint64_t)v14, &v19, v17);
        }
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id CCReadPropertyList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a1 options:0 error:a3];
  if (v5)
  {
    id v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:a2 format:0 error:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_249BCD150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CCDatabaseSetClockValueRange(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 unsignedIntValue];
  if (v3) {
    [v3 unsignedIntValue];
  }

  return v4;
}

uint64_t CCDatabaseSetAtomState(void *a1)
{
  int v1 = [a1 unsignedShortValue];
  if (v1 == 1) {
    unsigned int v2 = 1;
  }
  else {
    unsigned int v2 = 3;
  }
  if (v1 == 2) {
    return 2;
  }
  else {
    return v2;
  }
}

void sub_249BCE3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_3)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __CloudKitLibraryCore_block_invoke_3;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26527AA28;
    uint64_t v5 = 0;
    CloudKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_3) {
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_2(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CKDistributedTimestampStateVector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_1();
  }
  getCKDistributedTimestampStateVectorClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void sub_249BCE7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BCEEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_249BD03D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BD4220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BD45D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_249BD4AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_249BD5028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249BD5324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2)
{
  return a2;
}

void __getCCSerializedSetMessageClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCSerializedSetMessageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSerializedSet.m", 26, @"Unable to find class %s", "CCSerializedSetMessage");

  __break(1u);
}

void IntelligencePlatformLibraryLibrary_cold_1(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *IntelligencePlatformLibraryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCSerializedSet.m", 25, @"%s", *a1);

  __break(1u);
}

void __getCCSerializedSetDeviceClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCSerializedSetDeviceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSerializedSet.m", 28, @"Unable to find class %s", "CCSerializedSetDevice");

  __break(1u);
}

void __getCCSerializedSetDescriptorClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCSerializedSetDescriptorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSerializedSet.m", 27, @"Unable to find class %s", "CCSerializedSetDescriptor");

  __break(1u);
}

void __getCCSerializedSetItemInstanceClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCSerializedSetItemInstanceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSerializedSet.m", 30, @"Unable to find class %s", "CCSerializedSetItemInstance");

  __break(1u);
}

void __getCCSerializedSetSharedItemClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCSerializedSetSharedItemClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSerializedSet.m", 29, @"Unable to find class %s", "CCSerializedSetSharedItem");

  __break(1u);
}

void __getCCSerializedSetItemClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCSerializedSetItemClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSerializedSet.m", 31, @"Unable to find class %s", "CCSerializedSetItem");

  __break(1u);
}

void __getCCSetLibraryConfigurationRegistryClass_block_invoke_cold_1(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *IntelligencePlatformLibraryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCSetConfigurationRegistry.m", 15, @"%s", *a1);

  __break(1u);
}

void __getCCSetLibraryConfigurationRegistryClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCSetLibraryConfigurationRegistryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSetConfigurationRegistry.m", 16, @"Unable to find class %s", "CCSetLibraryConfigurationRegistry");

  __break(1u);
}

void __getCCTypeIdentifierRegistryClass_block_invoke_cold_1(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *IntelligencePlatformLibraryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCTypeIdentifierRegistryBase.m", 16, @"%s", *a1);

  __break(1u);
}

void __getCCTypeIdentifierRegistryClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCCTypeIdentifierRegistryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCTypeIdentifierRegistryBase.m", 17, @"Unable to find class %s", "CCTypeIdentifierRegistry");

  __break(1u);
}

void __getCKDistributedSiteIdentifierClass_block_invoke_cold_1(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCDatabaseSetStateReader.m", 39, @"%s", *a1);

  __break(1u);
}

void __getCKDistributedSiteIdentifierClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCKDistributedSiteIdentifierClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCDatabaseSetStateReader.m", 40, @"Unable to find class %s", "CKDistributedSiteIdentifier");

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCSetChangeBookmark.m", 19, @"%s", *a1);

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCKDistributedTimestampStateVectorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCSetChangeBookmark.m", 20, @"Unable to find class %s", "CKDistributedTimestampStateVector");

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_0(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCReplicatedEntityEnumeratorBookmark.m", 15, @"%s", *a1);

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_0()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCKDistributedTimestampStateVectorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCReplicatedEntityEnumeratorBookmark.m", 16, @"Unable to find class %s", "CKDistributedTimestampStateVector");

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCKDistributedTimestampStateVectorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCDatabaseSetChangeEnumerator.m", 43, @"Unable to find class %s", "CKDistributedTimestampStateVector");

  __break(1u);
}

void CloudKitLibrary_cold_1(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCDatabaseSetChangeEnumerator.m", 41, @"%s", *a1);

  __break(1u);
}

void __getCKDistributedTimestampClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCKDistributedTimestampClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCDatabaseSetChangeEnumerator.m", 45, @"Unable to find class %s", "CKDistributedTimestamp");

  __break(1u);
}

void __getCKMergeableDeltaVectorsClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCKMergeableDeltaVectorsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCDatabaseSetChangeEnumerator.m", 44, @"Unable to find class %s", "CKMergeableDeltaVectors");

  __break(1u);
}

void CCDataResourceStatusIsNotDiscoverable_cold_1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "CCDataResourceStatusIsNotDiscoverable received invalid value %lu", (uint8_t *)&v2, 0xCu);
}

void CCWritePropertyList_cold_1(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Parent directory: %@ does not exist (isDirectory: %i)", (uint8_t *)&v4, 0x12u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_2(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCDatabaseSetStateVectorBuilder.m", 13, @"%s", *a1);

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCKDistributedTimestampStateVectorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCDatabaseSetStateVectorBuilder.m", 14, @"Unable to find class %s", "CKDistributedTimestampStateVector");

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BMAccessModePrintableDescription()
{
  return MEMORY[0x270F109E0]();
}

uint64_t BMResourceOptionsDescription()
{
  return MEMORY[0x270F109F8]();
}

uint64_t BMServiceDomainOverrideLookupFromConfigurationForSet()
{
  return MEMORY[0x270F10A00]();
}

uint64_t BMShouldRetry()
{
  return MEMORY[0x270F10A08]();
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x270EE4C48](number);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x270F10A10]();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
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

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x270EDB218](path, name, *(void *)&options);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x270EDB248](a1, a2, *(void *)&a3);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B498](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B4C0](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_zeroblob(sqlite3_stmt *a1, int a2, int n)
{
  return MEMORY[0x270F9B500](a1, *(void *)&a2, *(void *)&n);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x270F9B540](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x270EDC198]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x270EDC1A0]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x270EDC1A8]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x270EDC3C8]();
}