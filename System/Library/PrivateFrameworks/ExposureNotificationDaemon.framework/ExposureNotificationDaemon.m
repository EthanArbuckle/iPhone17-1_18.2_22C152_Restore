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

void sub_1D39EB858(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D39EC1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D39EE5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  (*(void (**)(void))(a4 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D39EF014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

uint64_t ct_sqlite_rpi_buffer_init(sqlite3 *a1)
{
  return sqlite3_create_module(a1, "ct_sqlite_rpi_buffer", &ct_sqlite_rpi_buffer_module, 0);
}

uint64_t ct_sqlite_rpi_buffer_connect(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = sqlite3_declare_vtab(a1, "CREATE TABLE x(rpi, rpi_pointer hidden, validity_pointer hidden, buffer_count hidden, valid_count hidden, daily_tracing_key_index, rpi_index)");
  if (!result)
  {
    v7 = sqlite3_malloc(24);
    if (v7)
    {
      v8 = v7;
      uint64_t result = 0;
      void *v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      *a5 = v8;
    }
    else
    {
      return 7;
    }
  }
  return result;
}

uint64_t ct_sqlite_rpi_buffer_best_index(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  v12[1] = 0;
  int v13 = 0;
  int v2 = *(_DWORD *)a2;
  if (*(int *)a2 >= 1)
  {
    int v3 = 0;
    uint64_t v4 = *(void *)(a2 + 8) + 5;
    v5 = (unsigned __int8 *)v4;
    do
    {
      int v6 = *v5;
      v5 += 12;
      if (v6)
      {
        if (*(unsigned char *)(v4 - 1) == 2)
        {
          uint64_t v7 = *(unsigned int *)(v4 - 5);
          if ((v7 - 1) <= 3) {
            *((_DWORD *)v12 + v7) = v3;
          }
        }
      }
      ++v3;
      uint64_t v4 = (uint64_t)v5;
    }
    while (v2 != v3);
  }
  uint64_t v8 = *(void *)(a2 + 32);
  for (uint64_t i = 1; i != 5; ++i)
  {
    uint64_t v10 = v8 + 8 * *((int *)v12 + i);
    *(_DWORD *)uint64_t v10 = i;
    *(unsigned char *)(v10 + 4) = 1;
  }
  *(void *)(a2 + 64) = 0x3FF0000000000000;
  *(void *)(a2 + 72) = 100;
  *(_DWORD *)(a2 + 40) = 4;
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_disconnect(void *a1)
{
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_open(uint64_t a1, void *a2)
{
  int v3 = sqlite3_malloc(56);
  if (!v3) {
    return 7;
  }
  uint64_t v4 = v3;
  uint64_t result = 0;
  v4[6] = 0;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *(_OWORD *)uint64_t v4 = 0u;
  *a2 = v4;
  return result;
}

uint64_t ct_sqlite_rpi_buffer_close(void *a1)
{
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_filter(void *a1, int a2, uint64_t a3, uint64_t a4, sqlite3_value **a5)
{
  if (a2)
  {
    a1[3] = sqlite3_value_pointer(*a5, "ct_sqlite_rpi_buffer");
    sqlite3_int64 v7 = (sqlite3_int64)sqlite3_value_pointer(a5[1], "ct_sqlite_rpi_validity_buffer");
    a1[4] = v7;
    sqlite3_int64 v8 = a1[3];
    if (v8)
    {
      sqlite3_int64 v8 = sqlite3_value_int64(a5[2]);
      sqlite3_int64 v7 = a1[4];
    }
    a1[5] = v8;
    if (v7) {
      sqlite3_int64 v7 = sqlite3_value_int64(a5[3]);
    }
    a1[6] = v7;
  }
  else
  {
    *(_OWORD *)(a1 + 5) = 0u;
    *(_OWORD *)(a1 + 3) = 0u;
  }
  a1[1] = 0;
  a1[2] = 0;
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_next(void *a1)
{
  uint64_t v1 = a1[5];
  uint64_t v2 = a1[1];
  uint64_t v3 = v2 + 1;
  if (v1 <= v2 + 1) {
    uint64_t v4 = v2 + 1;
  }
  else {
    uint64_t v4 = a1[5];
  }
  while (v3 < v1)
  {
    if (*(unsigned __int8 *)(a1[4] + v3++))
    {
      uint64_t v4 = v3 - 1;
      break;
    }
  }
  a1[1] = v4;
  return 0;
}

BOOL ct_sqlite_rpi_buffer_eof(void *a1)
{
  return a1[2] >= a1[6] || a1[1] >= a1[5];
}

uint64_t ct_sqlite_rpi_buffer_column(void *a1, sqlite3_context *a2, int a3)
{
  switch(a3)
  {
    case 0:
      sqlite3_result_blob(a2, (const void *)(a1[3] + 16 * a1[1]), 16, 0);
      return 0;
    case 3:
      sqlite3_int64 v3 = a1[5];
      goto LABEL_7;
    case 4:
      sqlite3_int64 v3 = a1[6];
      goto LABEL_7;
    case 5:
      sqlite3_int64 v3 = a1[1] / 144;
      goto LABEL_7;
    case 6:
      sqlite3_int64 v3 = a1[1] % 144;
LABEL_7:
      sqlite3_result_int64(a2, v3);
      break;
    default:
      return 0;
  }
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_rowid(uint64_t a1, void *a2)
{
  *a2 = *(void *)(a1 + 16);
  return 0;
}

void sub_1D39F4ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D39F5200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ENSQLiteBindFoundationValue(sqlite3_stmt *a1, int a2, void *a3)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 UTF8String];
    if (v6) {
      sqlite3_int64 v7 = (const char *)v6;
    }
    else {
      sqlite3_int64 v7 = "";
    }
    sqlite3_bind_text(a1, a2, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_26;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    sqlite3_bind_null(a1, a2);
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 timeIntervalSinceReferenceDate];
LABEL_11:
    sqlite3_bind_double(a1, a2, v8);
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19[0] = 0;
      v19[1] = 0;
      [v5 getUUIDBytes:v19];
      sqlite3_bind_blob(a1, a2, v19, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B08] currentHandler];
      v18 = objc_msgSend(MEMORY[0x1E4F29020], "stringWithUTF8String:", "void ENSQLiteBindFoundationValue(sqlite3_stmt * _Nonnull, int, id  _Nullable __strong)");
      [v17 handleFailureInFunction:v18, @"ENSQLiteUtils.m", 33, @"Binding unexpected value class %@", objc_opt_class() file lineNumber description];
    }
    id v13 = v5;
    uint64_t v14 = (const char *)[v13 objCType];
    if (strcmp(v14, "d") && strcmp(v14, "f"))
    {
      sqlite3_bind_int64(a1, a2, [v13 longLongValue]);
      goto LABEL_26;
    }
    [v13 doubleValue];
    goto LABEL_11;
  }
  id v9 = v5;
  if ((unint64_t)[v9 length] >= 0x7FFFFFFF)
  {
    v15 = [MEMORY[0x1E4F28B08] currentHandler];
    v16 = objc_msgSend(MEMORY[0x1E4F29020], "stringWithUTF8String:", "void ENSQLiteBindFoundationValue(sqlite3_stmt * _Nonnull, int, id  _Nullable __strong)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"ENSQLiteUtils.m", 24, @"NSData parameter is large (%lu bytes)", objc_msgSend(v9, "length"));
  }
  id v10 = v9;
  uint64_t v11 = [v10 bytes];
  if (v11) {
    v12 = (const char *)v11;
  }
  else {
    v12 = "";
  }
  sqlite3_bind_blob(a1, a2, v12, [v10 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

LABEL_26:
}

id ENSQLiteColumnAsData(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = (void *)sqlite3_column_blob(a1, a2);
    if (v4) {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B0]), "initWithBytes:length:", v4, sqlite3_column_bytes(a1, a2));
    }
  }

  return v4;
}

id ENSQLiteColumnAsDate(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C0]), "initWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a1, a2));
  }

  return v4;
}

id ENSQLiteColumnAsNaturalType(sqlite3_stmt *a1, int a2)
{
  switch(sqlite3_column_type(a1, a2))
  {
    case 1:
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28EC8]), "initWithLongLong:", sqlite3_column_int64(a1, a2));
      break;
    case 2:
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28EC8]), "initWithDouble:", sqlite3_column_double(a1, a2));
      break;
    case 3:
      uint64_t v4 = ENSQLiteColumnAsString(a1, a2);
      break;
    case 4:
      uint64_t v4 = ENSQLiteColumnAsData(a1, a2);
      break;
    default:
      uint64_t v4 = 0;
      break;
  }

  return v4;
}

unsigned __int8 *ENSQLiteColumnAsString(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
    if (v4) {
      uint64_t v4 = (unsigned __int8 *)[objc_alloc(MEMORY[0x1E4F29020]) initWithUTF8String:v4];
    }
  }

  return v4;
}

id ENSQLiteColumnAsUUID(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5) {
    goto LABEL_5;
  }
  uint64_t v4 = (void *)sqlite3_column_blob(a1, a2);
  if (!v4) {
    goto LABEL_6;
  }
  id v5 = v4;
  if (sqlite3_column_bytes(a1, a2) != 16) {
LABEL_5:
  }
    uint64_t v4 = 0;
  else {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29120]) initWithUUIDBytes:v5];
  }
LABEL_6:

  return v4;
}

void sub_1D39F5F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D39F6440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void SharedServiceConnectionHandler(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[ENXPCServiceListener sharedServiceListener];
  sqlite3_int64 v3 = [v2 dispatchQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __SharedServiceConnectionHandler_block_invoke;
  v5[3] = &unk_1E69ACBE0;
  v5[4] = v2;
  id v6 = v1;
  id v4 = v1;
  dispatch_sync(v3, v5);
}

void sub_1D39F7FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v28 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D39F8320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D39F86E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SharedServiceConnectionHandler_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) xpcConnectionAccept:*(void *)(a1 + 40)];
}

id DiagnosisReportTypeToServerStringMap()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F2B35D88;
  v2[1] = &unk_1F2B35DA0;
  v3[0] = @"confirmed";
  v3[1] = @"likely";
  v2[2] = &unk_1F2B35DB8;
  v2[3] = &unk_1F2B35DD0;
  v3[2] = @"negative";
  v3[3] = @"user-report";
  v2[4] = &unk_1F2B35DE8;
  v3[4] = @"recursive";
  v0 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v3 forKeys:v2 count:5];

  return v0;
}

void sub_1D39F937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D39FCEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

void sub_1D39FDF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D39FFB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Unwind_Resume(a1);
}

void sub_1D3A027C4(_Unwind_Exception *a1)
{
}

void sub_1D3A03DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3A0E164(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1D3A10E34(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1D3A15660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  (*(void (**)(uint64_t))(a12 + 16))(a12);
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A15FE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1889C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A18B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A192B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  (*(void (**)(uint64_t))(v27 + 16))(v27);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1B8BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1BF20(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1C6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1CAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1CF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1D570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1DA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1DF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1E3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1E7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1EBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1F0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1F4CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  (*(void (**)(uint64_t))(v23 + 16))(v23);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A1FC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  (*(void (**)(void))(a6 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A202AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D3A208C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A20EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D3A2126C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A23D24(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3A8], 8);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A24CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A251F8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A25CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  (*(void (**)(uint64_t))(v16 + 16))(v16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A260A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A26460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A26800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A26BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A26F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A27274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A27650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A27AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A27E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A28164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2846C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A28B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A298CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

void sub_1D3A29C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2A2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a28, 8);
  (*(void (**)(uint64_t))(v42 + 16))(v42);
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2AA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2B10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(void))(a3 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2BBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2C5D0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2D254(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2D8D8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v3 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2DED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D3A2E31C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1D3A2E6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  (*(void (**)(uint64_t))(v14 + 16))(v14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2EB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2F290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A2FD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  (*(void (**)(void))(a16 + 16))();
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A30368(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A30798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A30BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A31538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A31AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1D3A32674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D3A32A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A32FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A33364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A339BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D3A33F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D3A342FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A34680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A34BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A34F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A355CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A35B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(void))(a3 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A36004(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A36A30(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A37490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A37AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  (*(void (**)(void))(a13 + 16))();
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A3819C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A38DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

void sub_1D3A3A2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A3B114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A3BFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A3CDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A3D2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A3D4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1D3A3D780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1D3A3DBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A3DDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A41094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A44030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A44B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1D3A452CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D3A480F4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1D3A4C2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4CAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4D048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4D380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4D740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4DC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4DDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4E0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4E3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4E5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4E828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4EF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D3A4F2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4F908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A4FEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A504A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A507D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A50B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A51070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A51894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D3A52514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A52958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A55B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1D3A55FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
}

void sub_1D3A56618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A5685C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D3A57768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3A587D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 256));
  _Unwind_Resume(a1);
}

void sub_1D3A58AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A59D0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1D3A5AC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3A5B1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __ENIsTestContext_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctestcase.isa);
  ENIsTestContext__isTestingContext = result != 0;
  return result;
}

void sub_1D3A5BA04(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1D3A5BCE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3A5C0E4(_Unwind_Exception *a1)
{
}

uint64_t SQLite3StatementRelease(int a1, sqlite3_stmt *pStmt)
{
  return sqlite3_finalize(pStmt);
}

id exposureWindowsForScanInstances(uint64_t *a1, uint64_t a2, long long *a3, char a4, void *a5, double a6)
{
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  uint64_t v13 = [MEMORY[0x1E4F1C9A0] calendarWithIdentifier:*MEMORY[0x1E4F1C310]];
  uint64_t v14 = [MEMORY[0x1E4F1CAE8] timeZoneForSecondsFromGMT:0];
  [v13 setTimeZone:v14];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __exposureWindowsForScanInstances_block_invoke;
  v21[3] = &unk_1E69AE5B0;
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  id v22 = v13;
  id v23 = v11;
  char v27 = a4;
  id v15 = v12;
  id v24 = v15;
  id v16 = v11;
  id v17 = v13;
  groupScanInstances(a1, a2, v21, a6);
  v18 = v24;
  id v19 = v15;

  return v19;
}

void sub_1D3A5EDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void groupScanInstances(uint64_t *a1, uint64_t a2, void *a3, double a4)
{
  uint64_t v7 = a3;
  if (a2)
  {
    uint64_t v10 = v7;
    if (a2 == 1) {
      goto LABEL_9;
    }
    double v8 = a1 + 2;
    uint64_t v9 = a2 - 1;
    a2 = 1;
    do
    {
      if (scanInstancesInDifferentWindows(*a1, a1[1], *v8, v8[1], a4))
      {
        v10[2](v10, a1, a2);
        a2 = 1;
        a1 = v8;
      }
      else
      {
        a2 = (a2 + 1);
      }
      v8 += 2;
      --v9;
    }
    while (v9);
    uint64_t v7 = v10;
    if (a2)
    {
LABEL_9:
      v10[2](v10, a1, a2);
      uint64_t v7 = v10;
    }
  }
}

BOOL scanInstancesInDifferentWindows(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  *(void *)&unsigned long long v9 = a1;
  *((void *)&v9 + 1) = a2;
  *(void *)&unsigned long long v8 = a3;
  *((void *)&v8 + 1) = a4;
  if (a1 != a3) {
    return 1;
  }
  double v5 = *(double *)((char *)&v8 + 4);
  double v6 = *(double *)((char *)&v9 + 4);
  if (*(double *)((char *)&v8 + 4) < *(double *)((char *)&v9 + 4))
  {
    *(void *)&double v6 = v8 >> 32;
    *(void *)&double v5 = v9 >> 32;
  }
  return v6 + a5 <= v5;
}

void sub_1D3A5FC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void __exposureWindowsForScanInstances_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 73);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 74);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 75);
  id v21 = objc_alloc_init(MEMORY[0x1E4F25780]);
  [v21 setDiagnosisReportType:v6];
  [v21 setCalibrationConfidence:v7];
  [v21 setVariantOfConcernType:v8];
  double v9 = *(double *)(a2 + 4);
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C0];
  id v11 = *(id *)(a1 + 32);
  id v12 = [v10 dateWithTimeIntervalSince1970:v9];
  uint64_t v13 = [v11 startOfDayForDate:v12];

  [v21 setDate:v13];
  objc_msgSend(v21, "setInfectiousness:", objc_msgSend(*(id *)(a1 + 40), "infectiousnessWithDaysSinceOnsetOfSymptoms:", *(void *)(a1 + 64)));
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  if (a3)
  {
    uint64_t v16 = 0;
    do
    {
      unsigned long long v17 = *(_OWORD *)(a2 + v16);
      unsigned long long v22 = v17;
      if (*(unsigned char *)(a1 + 80))
      {
        if (v16
          && *(_DWORD *)(a2 + v16 - 16) == v17
          && (LOWORD(v15) = HIWORD(v17),
              double v15 = (double)*(unint64_t *)&v15,
              *(double *)&unsigned long long v17 = vabdd_f64(COERCE_DOUBLE(v17 >> 32) - v15, *(double *)(a2 + v16 - 12)),
              *(double *)&v17 < 4.0))
        {
          __int16 v18 = vcvtmd_u64_f64(*(double *)((char *)&v22 + 4) / 60.0) - vcvtmd_u64_f64(*(double *)(a2 + v16 - 12) / 60.0);
        }
        else
        {
          LOWORD(v17) = HIWORD(v22);
          __int16 v18 = llroundf((float)v17 / 60.0);
        }
        __int16 v19 = 60 * v18;
        HIWORD(v22) = v19;
      }
      else
      {
        __int16 v19 = HIWORD(v17);
      }
      if (v19)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F257F0]);
        [v20 setMinimumAttenuation:BYTE13(v22)];
        [v20 setTypicalAttenuation:BYTE12(v22)];
        [v20 setSecondsSinceLastScan:HIWORD(*((void *)&v22 + 1))];
        [v14 addObject:v20];
      }
      v16 += 16;
    }
    while (16 * a3 != v16);
  }
  [v21 setScanInstances:v14];
  [*(id *)(a1 + 48) addObject:v21];
}

uint64_t __timeOrderedAdvertisements_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

id ENBundleIdentifierForURLSessions()
{
  v0 = [MEMORY[0x1E4F28B58] mainBundle];
  int v1 = [v0 bundleIdentifier];

  return v1;
}

void sub_1D3A61800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t AddKeyValueTable(void *a1, const char *a2)
{
  return [a1 executeUncachedSQLStatements:&unk_1F2B35C98 error:a2];
}

uint64_t AddOriginalReportType(void *a1, const char *a2)
{
  return [a1 executeUncachedSQLStatements:&unk_1F2B35CB0 error:a2];
}

uint64_t AddDetectionHistoryTables(void *a1, const char *a2)
{
  return [a1 executeUncachedSQLStatements:&unk_1F2B35CE0 error:a2];
}

uint64_t AddDetectionHistoryMetadata(void *a1, const char *a2)
{
  return [a1 executeUncachedSQLStatements:&unk_1F2B35CF8 error:a2];
}

uint64_t AddVariantOfConcernType(void *a1, const char *a2)
{
  return [a1 executeUncachedSQLStatements:&unk_1F2B35D10 error:a2];
}

uint64_t AddOriginalVariantOfConcernType(void *a1, const char *a2)
{
  return [a1 executeUncachedSQLStatements:&unk_1F2B35CC8 error:a2];
}

void sub_1D3A65DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A66440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A6776C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A67CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A68C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A68FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

id ENTestResultErrorF(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a1 - 1) > 0xC) {
    uint64_t v2 = "?";
  }
  else {
    uint64_t v2 = off_1E69AEB48[a1 - 1];
  }
  NSPrintV();
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  double v11 = v2;
  id v4 = NSPrintF();
  id v5 = objc_alloc(MEMORY[0x1E4F28C50]);
  v12[0] = @"cuErrorDesc";
  v12[1] = @"cuErrorMsg";
  double v6 = &stru_1F2B29B10;
  if (v3) {
    double v6 = v3;
  }
  v13[0] = v4;
  v13[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F25718];
  void v12[2] = *MEMORY[0x1E4F28220];
  v13[2] = v4;
  double v8 = objc_msgSend(MEMORY[0x1E4F1C9E0], "dictionaryWithObjects:forKeys:count:", v13, v12, 3, v11, v3);
  uint64_t v9 = (void *)[v5 initWithDomain:v7 code:a1 userInfo:v8];

  return v9;
}

id ENNestedTestResultErrorF(void *a1, uint64_t a2)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if ((unint64_t)(a2 - 1) > 0xC) {
    id v4 = "?";
  }
  else {
    id v4 = off_1E69AEB48[a2 - 1];
  }
  NSPrintV();
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v4;
  double v6 = NSPrintF();
  id v7 = objc_alloc(MEMORY[0x1E4F28C50]);
  uint64_t v8 = *MEMORY[0x1E4F25718];
  v17[0] = @"cuErrorDesc";
  v17[1] = @"cuErrorMsg";
  uint64_t v9 = &stru_1F2B29B10;
  if (v5) {
    uint64_t v9 = v5;
  }
  v18[0] = v6;
  v18[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F28220];
  v18[2] = v6;
  uint64_t v11 = *MEMORY[0x1E4F28A58];
  v17[2] = v10;
  v17[3] = v11;
  double v12 = v3;
  if (!v3)
  {
    double v12 = NSErrorF();
  }
  v18[3] = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E0], "dictionaryWithObjects:forKeys:count:", v18, v17, 4, v16, v5);
  id v14 = (void *)[v7 initWithDomain:v8 code:a2 userInfo:v13];

  if (!v3) {

  }
  return v14;
}

uint64_t initCPPhoneNumberCopyActiveCountryCode()
{
  if (AppSupportLibrary_sOnce != -1) {
    dispatch_once(&AppSupportLibrary_sOnce, &__block_literal_global_166);
  }
  v0 = (uint64_t (*)())dlsym((void *)AppSupportLibrary_sLib, "CPPhoneNumberCopyActiveCountryCode");
  softLinkCPPhoneNumberCopyActiveCountryCode = v0;

  return v0();
}

void *__AppSupportLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport", 2);
  AppSupportLibrary_sLib = (uint64_t)result;
  return result;
}

id initTPSNormalizedPhoneNumberString(void *a1, void *a2)
{
  uint64_t v3 = TelephonyPreferencesLibrary_sOnce;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&TelephonyPreferencesLibrary_sOnce, &__block_literal_global_170);
  }
  softLinkTPSNormalizedPhoneNumberString = (uint64_t (*)())dlsym((void *)TelephonyPreferencesLibrary_sLib, "TPSNormalizedPhoneNumberString");
  double v6 = ((void (*)(id, id))softLinkTPSNormalizedPhoneNumberString)(v5, v4);

  return v6;
}

void *__TelephonyPreferencesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/TelephonyPreferences.framework/TelephonyPreferences", 2);
  TelephonyPreferencesLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t ENReadLinesFromFile()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  int v3 = v0;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v26 = v4;
  int __fd = v3;
  if ((v3 & 0x80000000) == 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E70]);
    bzero(__buf, 0x2000uLL);
    double v6 = (void *)MEMORY[0x1D9439DC0]();
    ssize_t v7 = pread(__fd, __buf, 0x2000uLL, 0);
    if (v7 < 1)
    {
LABEL_21:
      if (v7 < 0)
      {
        if (*__error())
        {
          if (*__error()) {
            uint64_t v21 = *__error();
          }
          else {
            uint64_t v21 = -6700;
          }
        }
        else
        {
          uint64_t v21 = 0;
        }
        uint64_t v22 = [MEMORY[0x1E4F28C50] errorWithDomain:*MEMORY[0x1E4F28768] code:v21 userInfo:0];
LABEL_34:
        id v19 = (id)v22;
      }
      else
      {
        id v19 = 0;
      }
      if (v19)
      {
        if (v2)
        {
          id v19 = v19;
          uint64_t v20 = 0;
          *uint64_t v2 = v19;
        }
        else
        {
          uint64_t v20 = 0;
        }
        goto LABEL_41;
      }
      uint64_t v23 = [v5 length];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __ENReadLinesFromFile_block_invoke_2;
      v27[3] = &unk_1E69AEBE0;
      id v28 = v26;
      objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, 0, v27);
    }
    else
    {
      unint64_t v8 = 0;
      off_t v9 = 0;
      while (1)
      {
        unint64_t v10 = v7 + v8;
        if (v7 + v8 >= 3) {
          uint64_t v11 = 3;
        }
        else {
          uint64_t v11 = v7 + v8;
        }
        unint64_t v12 = v7 + v8;
        do
        {
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F29020]) initWithBytes:__buf length:v12 encoding:4];
          id v14 = v13;
          if (v13) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = v11 == 0;
          }
          --v11;
          --v12;
        }
        while (!v15);
        if (!v13)
        {
          uint64_t v22 = ENErrorF();
          goto LABEL_34;
        }
        if ([v13 length] >= v10)
        {
          unint64_t v8 = 0;
        }
        else
        {
          uint64_t v16 = [v14 length];
          [v14 length];
          unint64_t v8 = v10 - v16;
          __memmove_chk();
        }
        [v5 appendString:v14];
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x2020000000;
        char v43 = 0;
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x3010000000;
        v37 = &unk_1D3AA1F87;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        uint64_t v17 = [v5 length];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __ENReadLinesFromFile_block_invoke;
        v29[3] = &unk_1E69AEBB8;
        id v18 = v5;
        id v30 = v18;
        id v31 = v26;
        v32 = &v40;
        v33 = &v34;
        objc_msgSend(v18, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 0, v29);
        if (*((unsigned char *)v41 + 24)) {
          break;
        }
        if (v35[5]) {
          [v18 deleteCharactersInRange:v35[4]];
        }

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v40, 8);

        double v6 = (void *)MEMORY[0x1D9439DC0]();
        v9 += v7;
        ssize_t v7 = pread(__fd, &__buf[v8], 0x2000 - v8, v9);
        if (v7 < 1) {
          goto LABEL_21;
        }
      }

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v40, 8);
    }
    id v19 = 0;
    uint64_t v20 = 1;
LABEL_41:

    goto LABEL_42;
  }
  if (v2)
  {
    ENErrorF();
    uint64_t v20 = 0;
    *uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_42:

  return v20;
}

void sub_1D3A6E468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void __ENReadLinesFromFile_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, NSUInteger a5, NSUInteger a6, unsigned char *a7)
{
  id v11 = a2;
  if (a5 + a6 >= [*(id *)(a1 + 32) length])
  {
    *a7 = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a7 = 1;
    }
    v13.location = a5;
    v13.length = a6;
    *(NSRange *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 56) + 8)+ 32), v13);
  }
}

uint64_t __ENReadLinesFromFile_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D3A6EDEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A6F118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _ENAdvertisementDatabaseStorageFullResponseHandler(CFTypeRef cf, char a2)
{
  if ((a2 & 3) == 0)
  {
    int v3 = [MEMORY[0x1E4F1CB08] URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
    id v4 = [MEMORY[0x1E4F223D8] defaultWorkspace];
    char v5 = [v4 openSensitiveURL:v3 withOptions:0];

    if ((v5 & 1) == 0
      && gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  alertActive = 0;

  CFRelease(cf);
}

void sub_1D3A70B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A71A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3A72418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3A72E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
}

void sub_1D3A73B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1F414B090]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70B0]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B0](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71E0]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71E8](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72E0](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7428](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7458](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7580](bundle);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7868]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7940]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A0](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x1F4115EE8]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1F4115F08]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x1F4115F20]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D79F8]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1F4115F30]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A08](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A70](cf1, cf2);
}

uint64_t CFHTTPCookieStorageCreateFromFile()
{
  return MEMORY[0x1F40D5230]();
}

uint64_t CFHTTPCookieStorageScheduleWithRunLoop()
{
  return MEMORY[0x1F40D5268]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D10]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t CFPrefs_CopyKeys()
{
  return MEMORY[0x1F4115FD0]();
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x1F4115FE0]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x1F4115FF0]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1F4115FF8]();
}

uint64_t CFPrefs_RemoveValue()
{
  return MEMORY[0x1F4116008]();
}

uint64_t CFPrefs_SetDouble()
{
  return MEMORY[0x1F4116010]();
}

uint64_t CFPrefs_SetInt64()
{
  return MEMORY[0x1F4116018]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x1F4116030]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8050](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80C0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85E8]();
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8840](allocator, buffer, bufLen, isDirectory);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A30](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A38](allocator, userNotification, callout, order);
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x1F41160A8]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x1F41160B8]();
}

uint64_t CUPrintDateCF()
{
  return MEMORY[0x1F4116118]();
}

uint64_t CUPrintDuration32()
{
  return MEMORY[0x1F4116120]();
}

uint64_t CUPrintDurationDouble()
{
  return MEMORY[0x1F4116128]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x1F4116130]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x1F4116138]();
}

uint64_t CUPrintHex()
{
  return MEMORY[0x1F4116150]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x1F4116168]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x1F4116170]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x1F4116190]();
}

uint64_t CUPrintPID()
{
  return MEMORY[0x1F41161A0]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x1F41161B0]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x1F41161C8]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x1F41161F0]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x1F4116210]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x1F4116218]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x1F4116230]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x1F4116250]();
}

uint64_t ENCloneFileToTemporaryDirectory()
{
  return MEMORY[0x1F40E0848]();
}

uint64_t ENCompareDiagnosisReportTypes()
{
  return MEMORY[0x1F40E0850]();
}

uint64_t ENCopyPublicKeyFromBase64String()
{
  return MEMORY[0x1F40E0858]();
}

uint64_t ENDaemonBundle()
{
  return MEMORY[0x1F40E0860]();
}

uint64_t ENDataVaultPath()
{
  return MEMORY[0x1F40E0868]();
}

uint64_t ENDataVaultURL()
{
  return MEMORY[0x1F40E0870]();
}

uint64_t ENDefaultExpirationDate()
{
  return MEMORY[0x1F40E0878]();
}

uint64_t ENErrorF()
{
  return MEMORY[0x1F40E0880]();
}

uint64_t ENErrorMetricTypeToString()
{
  return MEMORY[0x1F40E0888]();
}

uint64_t ENLocalizedString()
{
  return MEMORY[0x1F40E0890]();
}

uint64_t ENNestedErrorF()
{
  return MEMORY[0x1F40E0898]();
}

uint64_t ENRPIMetadataDeserialize()
{
  return MEMORY[0x1F40E08A0]();
}

uint64_t ENXPCDecodeSecureObject()
{
  return MEMORY[0x1F40E08A8]();
}

uint64_t ENXPCDecodeSecureObjectIfPresent()
{
  return MEMORY[0x1F40E08B0]();
}

uint64_t ENXPCEncodeSecureObject()
{
  return MEMORY[0x1F40E08B8]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x1F4116360]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x1F4116380]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x1F41163A0]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1F4116598]();
}

uint64_t LogCategoryCopyOSLogHandle()
{
  return MEMORY[0x1F41165E0]();
}

uint64_t LogControl()
{
  return MEMORY[0x1F4116618]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1F4116638]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x1F4116640]();
}

uint64_t LogSetAppID()
{
  return MEMORY[0x1F4116650]();
}

uint64_t LogShow()
{
  return MEMORY[0x1F4116658]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F950]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F988]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1F41166D8]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x1F41166E0]();
}

uint64_t NSArrayGetNSNumberAtIndex()
{
  return MEMORY[0x1F41166E8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7008](aClassName);
}

uint64_t NSDataWithHex()
{
  return MEMORY[0x1F4116700]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x1F4116748]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x1F4116768]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x1F4116780]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1F41167A8]();
}

uint64_t NSPrintV()
{
  return MEMORY[0x1F41167C0]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x1F41167C8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7250](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7288](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B8](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1F415C378]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F00](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F88](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F8](rnd, count, bytes);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1F415CB58]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1F415CB80]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1F415CB98]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x1F415CBA0]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x1F415CBD0]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x1F415CBE8]();
}

uint64_t TCCAccessResetForBundle()
{
  return MEMORY[0x1F415CBF8]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1F415CC38]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x1F415CC48]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x1F4116C18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return MEMORY[0x1F40D8FC0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9430]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9448]();
}

uint64_t _CTServerConnectionCopyISOForMCC()
{
  return MEMORY[0x1F40DF050]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0D0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1F4116C80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_copy()
{
  return MEMORY[0x1F4181F30]();
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x1F4181F40]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cchmac()
{
  return MEMORY[0x1F40CAE40]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
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

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE0](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
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

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1F4182128](db, zName, p, pClientData);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1F4182180](a1, zSQL);
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

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x1F4182248](*(void *)&a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182288](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1F4182450](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

uint64_t stricmp_prefix()
{
  return MEMORY[0x1F4116D48]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
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

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
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

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return MEMORY[0x1F40CED18]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE50](xdict, key);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1F40CEE58]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
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

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40CEF00](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

uint64_t xpc_dictionary_set_cf_object()
{
  return MEMORY[0x1F4116D88]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
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

void xpc_main(xpc_connection_handler_t handler)
{
}