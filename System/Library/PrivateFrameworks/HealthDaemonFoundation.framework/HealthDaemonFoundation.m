uint64_t SQLite3StatementRelease(int a1, sqlite3_stmt *pStmt)
{
  return sqlite3_finalize(pStmt);
}

void sub_21BFB5D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21BFB61B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFB6340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21BFB669C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id HDSQLiteEntityDisambiguatedSQLForProperty(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqualToString:@"*"]
    || ([a1 joinClausesForProperty:v3],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    v8 = NSString;
    v9 = [a1 disambiguatedDatabaseTable];
    id v6 = [v8 stringWithFormat:@"%@.%@", v9, v3];
  }

  return v6;
}

void sub_21BFB6830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteEntityDisambiguatedDatabaseTable(void *a1)
{
  if (HDSQLiteEntityDisambiguatedDatabaseTable::onceToken != -1) {
    dispatch_once(&HDSQLiteEntityDisambiguatedDatabaseTable::onceToken, &__block_literal_global_489);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableLock);
  v2 = [(id)HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache objectForKey:a1];
  if (!v2)
  {
    id v3 = [a1 databaseName];
    if (v3)
    {
      v4 = NSString;
      uint64_t v5 = [a1 databaseTable];
      v2 = [v4 stringWithFormat:@"%@.%@", v3, v5];
    }
    else
    {
      v2 = [a1 databaseTable];
    }

    [(id)HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache setObject:v2 forKey:a1];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableLock);

  return v2;
}

void sub_21BFB6978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteEntityForProperty(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v14 = 0;
  while (1)
  {
    if (![a1 conformsToProtocol:&unk_26CC28B70])
    {
      id v5 = 0;
      goto LABEL_7;
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __HDSQLiteEntityForProperty_block_invoke;
    v7[3] = &unk_2643D4DF0;
    id v8 = v3;
    v9 = &v11;
    v10 = a1;
    _enumerateColumnDefinitions(a1, v7);
    v4 = (void *)v12[3];
    if (v4) {
      break;
    }
    a1 = (void *)[a1 superclass];
  }
  id v5 = v4;

LABEL_7:
  _Block_object_dispose(&v11, 8);

  return v5;
}

void sub_21BFB6AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _enumerateColumnDefinitions(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v7 = 0;
  char v6 = 0;
  uint64_t v4 = [a1 columnDefinitionsWithCount:&v7];
  if (v4 && v7)
  {
    for (unint64_t i = 0; i < v7; ++i)
    {
      v3[2](v3, v4, &v6);
      if (v6) {
        break;
      }
      v4 += 24;
    }
  }
}

void sub_21BFB6BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __HDSQLiteEntityForProperty_block_invoke(void *a1, id *a2, unsigned char *a3)
{
  uint64_t result = [*a2 isEqualToString:a1[4]];
  if (result)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a1[6];
    *a3 = 1;
  }
  return result;
}

void sub_21BFB70D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21BFB76EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFB77EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(uint64_t a1)
{
  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      id v3 = (void *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t HDSQLiteRow::HDSQLiteRow(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = a3;
  *(void *)a1 = &unk_26CC1A088;
  *(_DWORD *)(a1 + 16) = 0;
  int v6 = sqlite3_column_count(a2);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 20) = v6;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 1065353216;
  *(void *)(a1 + 8) = a2;
  if (v5) {
    HDSQLiteRow::setColumnNames(a1, v5);
  }

  return a1;
}

void sub_21BFB7C88(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v2);

  _Unwind_Resume(a1);
}

void sub_21BFB8724()
{
}

void sub_21BFB8754()
{
}

void sub_21BFB875C()
{
}

void sub_21BFB8850()
{
  objc_end_catch();
  JUMPOUT(0x21BFB888CLL);
}

void sub_21BFB8874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, char a16, void *a17)
{
  if (a16) {
    objc_end_catch();
  }

  _Unwind_Resume(a1);
}

void sub_21BFB88A8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_21BFB8BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sqlite3_exec_busy_retry(sqlite3 *a1, const char *a2, int (__cdecl *a3)(void *, int, char **, char **), void *a4, char **a5)
{
  id v5 = a5;
  int v6 = a4;
  unint64_t v7 = (int (*)(void *, int, char **, char **))a3;
  id v8 = a2;
  v9 = a1;
  while (1)
  {
    uint64_t result = sqlite3_exec(a1, a2, a3, a4, a5);
    if (result != 5) {
      break;
    }
    usleep(0x14u);
    a1 = v9;
    a2 = v8;
    a3 = (int (__cdecl *)(void *, int, char **, char **))v7;
    a4 = v6;
    a5 = v5;
  }
  return result;
}

void sub_21BFB993C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFB9DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)va1);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindDouble(HDSQLiteStatementBinder *this, NSString *a2, double a3)
{
  uint64_t v8 = a2;
  id v5 = [(NSString *)v8 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v5);
  uint64_t v6 = *(sqlite3_stmt **)this;
  int v7 = HDSQLiteStatementBinder::indexForProperty(this, v5);
  sqlite3_bind_double(v6, v7, a3);
}

void sub_21BFB9EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFBA868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBAA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21BFBACB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HDIsUnitTesting()
{
  if (HDIsUnitTesting_onceToken != -1) {
    dispatch_once(&HDIsUnitTesting_onceToken, &__block_literal_global_7);
  }
  return HDIsUnitTesting__HDFIsUnitTesting;
}

void sub_21BFBAF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21BFBB37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBB8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBBA30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBBB10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBBBE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBC720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindData(HDSQLiteStatementBinder *this, NSString *a2, NSData *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  v12 = v5;
  int v7 = [(NSString *)v12 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  uint64_t v8 = *(sqlite3_stmt **)this;
  if (v6)
  {
    int v9 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    v10 = v6;
    sqlite3_bind_blob64(v8, v9, [(NSData *)v10 bytes], [(NSData *)v10 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    int v11 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v8, v11);
  }
}

void sub_21BFBCAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsNumber(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  id v5 = HDSQLiteRow::columnAsNumber(a1, v4);

  return v5;
}

void sub_21BFBCB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBE5D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBEB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BFBF018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsNaturalType(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    int v7 = [NSString stringWithUTF8String:"id  _Nullable HDSQLiteRow::columnAsNaturalType(int) const"];
    [v6 handleFailureInFunction:v7 file:@"HDSQLiteRow_Internal.h" lineNumber:180 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    int v9 = [NSString stringWithUTF8String:"id  _Nullable HDSQLiteRow::columnAsNaturalType(int) const"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"HDSQLiteRow_Internal.h", 181, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  switch(sqlite3_column_type(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2))
  {
    case 1:
      int v4 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", sqlite3_column_int64(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
      break;
    case 2:
      int v4 = objc_msgSend(objc_alloc(NSNumber), "initWithDouble:", sqlite3_column_double(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
      break;
    case 3:
      int v4 = HDSQLiteRow::columnAsString(this, a2);
      break;
    case 4:
      int v4 = HDSQLiteRow::columnAsData(this, a2);
      break;
    default:
      int v4 = 0;
      break;
  }

  return v4;
}

void sub_21BFBF238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsNumber(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    int v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"NSNumber * _Nullable HDSQLiteRow::columnAsNumber(int) const"];
    [v7 handleFailureInFunction:v8 file:@"HDSQLiteRow_Internal.h" lineNumber:149 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    int v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = [NSString stringWithUTF8String:"NSNumber * _Nullable HDSQLiteRow::columnAsNumber(int) const"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"HDSQLiteRow_Internal.h", 150, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  int v4 = sqlite3_column_type(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
  if (v4 == 1)
  {
    id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", sqlite3_column_int64(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  }
  else if (v4 == 2)
  {
    id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithDouble:", sqlite3_column_double(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_21BFBF3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBF764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFBF8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21BFBFEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_21BFC021C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC03CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *HDSQLOperatorForComparisonType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 8) {
    return off_2643D4C88[a1 - 1];
  }
  id v3 = [MEMORY[0x263F08690] currentHandler];
  int v4 = [NSString stringWithUTF8String:"NSString *HDSQLOperatorForComparisonType(HDSQLiteComparisonType)"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"HDSQLitePredicate.m", 1096, @"Invalid comparison type: %ld", a1);

  return 0;
}

id _HDQuantityForSQLiteValue(id a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    id v3 = (void *)MEMORY[0x263F0A630];
    id v4 = a2;
    [v2 doubleValue];
    objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

void sub_21BFC0B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC0D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC0EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21BFC1014(_Unwind_Exception *a1)
{
  if (v1) {

  }
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindUUID(HDSQLiteStatementBinder *this, NSString *a2, NSUUID *a3)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  int v7 = v5;
  uint64_t v8 = [(NSString *)v7 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v8);
  if (v6)
  {
    v13[0] = 0;
    v13[1] = 0;
    [(NSUUID *)v6 getUUIDBytes:v13];
    int v9 = *(sqlite3_stmt **)this;
    int v10 = HDSQLiteStatementBinder::indexForProperty(this, v8);
    sqlite3_bind_blob(v9, v10, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    int v11 = *(sqlite3_stmt **)this;
    int v12 = HDSQLiteStatementBinder::indexForProperty(this, v8);
    sqlite3_bind_null(v11, v12);
  }
}

void sub_21BFC1154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC1278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC13E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

__CFString *HDSQLiteDatabaseNamePrefix(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = [NSString stringWithFormat:@"%@.", v1];
  }
  else
  {
    id v2 = &stru_26CC1AE10;
  }

  return v2;
}

void sub_21BFC1494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteColumnAsInt64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

void sub_21BFC15D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

const void *HDSQLiteRow::columnAsBytes(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    int v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"const void * _Nullable HDSQLiteRow::columnAsBytes(int) const"];
    [v7 handleFailureInFunction:v8 file:@"HDSQLiteRow_Internal.h" lineNumber:92 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    int v9 = [MEMORY[0x263F08690] currentHandler];
    int v10 = [NSString stringWithUTF8String:"const void * _Nullable HDSQLiteRow::columnAsBytes(int) const"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"HDSQLiteRow_Internal.h", 93, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  if (HDSQLiteRow::columnIsNull(this, a2)) {
    return 0;
  }
  int v5 = *((_DWORD *)this + 4) + a2;
  uint64_t v6 = (sqlite3_stmt *)*((void *)this + 1);

  return sqlite3_column_blob(v6, v5);
}

void sub_21BFC173C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsObject(sqlite3_stmt **a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = HDSQLiteColumnWithNameAsData((HDSQLiteRow *)a1, v5);
  if (v6)
  {
    id v15 = 0;
    int v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:v6 error:&v15];
    id v8 = v15;
    int v9 = v8;
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    if (!v10)
    {
      _HKInitializeLogging();
      int v11 = (id)*MEMORY[0x263F098E8];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v6 length];
        uint64_t v14 = [NSString stringWithCString:sqlite3_sql(a1[1]) encoding:4];
        *(_DWORD *)buf = 138544386;
        uint64_t v17 = a3;
        __int16 v18 = 2114;
        id v19 = v5;
        __int16 v20 = 2048;
        uint64_t v21 = v13;
        __int16 v22 = 2112;
        v23 = v14;
        __int16 v24 = 2114;
        v25 = v9;
        _os_log_error_impl(&dword_21BFB4000, v11, OS_LOG_TYPE_ERROR, "Error unarchiving object of class %{public}@ from column %{public}@ (retrieved data of length %lu; sql stateme"
          "nt %@): %{public}@",
          buf,
          0x34u);
      }
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

void sub_21BFC1920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsData(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  id v5 = HDSQLiteRow::columnAsData(a1, v4);

  return v5;
}

void sub_21BFC19E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsData(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    int v9 = [NSString stringWithUTF8String:"NSData * _Nullable HDSQLiteRow::columnAsData(int) const"];
    [v8 handleFailureInFunction:v9 file:@"HDSQLiteRow_Internal.h" lineNumber:114 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    BOOL v10 = [MEMORY[0x263F08690] currentHandler];
    int v11 = [NSString stringWithUTF8String:"NSData * _Nullable HDSQLiteRow::columnAsData(int) const"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"HDSQLiteRow_Internal.h", 115, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  if (HDSQLiteRow::columnIsNull(this, a2))
  {
    int v4 = 0;
  }
  else
  {
    int v5 = *((_DWORD *)this + 4) + a2;
    uint64_t v6 = sqlite3_column_blob(*((sqlite3_stmt **)this + 1), v5);
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", v6, sqlite3_column_bytes(*((sqlite3_stmt **)this + 1), v5));
  }

  return v4;
}

void sub_21BFC1B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL HDSQLiteColumnWithNameAsBoolean(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  BOOL v5 = HDSQLiteRow::columnAsBoolean(a1, v4);

  return v5;
}

void sub_21BFC1BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL HDSQLiteRow::columnAsBoolean(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    BOOL v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"BOOL HDSQLiteRow::columnAsBoolean(int) const"];
    [v5 handleFailureInFunction:v6 file:@"HDSQLiteRow_Internal.h" lineNumber:60 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    int v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = [NSString stringWithUTF8String:"BOOL HDSQLiteRow::columnAsBoolean(int) const"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"HDSQLiteRow_Internal.h", 61, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  return sqlite3_column_int(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2) != 0;
}

void sub_21BFC1D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL HDSQLiteColumnWithNameIsNull(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  BOOL IsNull = HDSQLiteRow::columnIsNull(a1, v4);

  return IsNull;
}

void sub_21BFC1DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC1EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21BFC2020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC20C8(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 48);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 8);
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindInt64(HDSQLiteStatementBinder *this, NSString *a2, sqlite3_int64 a3)
{
  id v8 = a2;
  BOOL v5 = [(NSString *)v8 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v5);
  uint64_t v6 = *(sqlite3_stmt **)this;
  int v7 = HDSQLiteStatementBinder::indexForProperty(this, v5);
  sqlite3_bind_int64(v6, v7, a3);
}

void sub_21BFC216C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteStatementBinder::indexForProperty(HDSQLiteStatementBinder *this, const char *a2)
{
  uint64_t v6 = a2;
  id v2 = std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>((void *)this + 1, &v6);
  if (v2) {
    return *((unsigned int *)v2 + 6);
  }
  int v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = [NSString stringWithUTF8String:"int HDSQLiteStatementBinder::indexForProperty(const char * _Nonnull) const"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"HDSQLiteStatementBinder_Internal.h", 35, @"Property '%s' is not a bindable property on this statement.", v6);

  return 0xFFFFFFFFLL;
}

void sub_21BFC222C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *HDSQLiteStatementBinder::_recordBoundProperty(HDSQLiteStatementBinder *this, const char *a2)
{
  uint64_t v6 = a2;
  id v2 = (char *)this + 48;
  if (std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>((void *)this + 6, &v6))
  {
    int v4 = [MEMORY[0x263F08690] currentHandler];
    BOOL v5 = [NSString stringWithUTF8String:"void HDSQLiteStatementBinder::_recordBoundProperty(const char * _Nonnull)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"HDSQLiteStatementBinder_Internal.h", 162, @"Attempt to bind property '%s' twice.", v6);
  }
  return std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::__emplace_unique_key_args<char const*,char const* const&>((uint64_t)v2, &v6, &v6);
}

void sub_21BFC2300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::__emplace_unique_key_args<char const*,char const* const&>(uint64_t a1, const char **a2, void *a3)
{
  uint64_t v6 = *a2;
  char v7 = **a2;
  if (v7)
  {
    unint64_t v8 = 0;
    int v9 = (unsigned __int8 *)(v6 + 1);
    do
    {
      unint64_t v8 = (1025 * (v8 + v7)) ^ ((1025 * (v8 + v7)) >> 6);
      int v10 = *v9++;
      char v7 = v10;
    }
    while (v10);
    unint64_t v11 = 9 * v8;
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t v12 = v11 ^ (v11 >> 11);
  unint64_t v13 = 32769 * v12;
  unint64_t v14 = *(void *)(a1 + 8);
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    unint64_t v16 = v15.u32[0];
    if (v15.u32[0] > 1uLL)
    {
      uint64_t v3 = 32769 * v12;
      if (v13 >= v14) {
        uint64_t v3 = v13 % v14;
      }
    }
    else
    {
      uint64_t v3 = v13 & (v14 - 1);
    }
    uint64_t v17 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v17)
    {
      for (unint64_t i = *v17; i; unint64_t i = *(void **)i)
      {
        unint64_t v19 = *((void *)i + 1);
        if (v19 == v13)
        {
          if (!strcmp(*((const char **)i + 2), v6)) {
            return i;
          }
        }
        else
        {
          if (v16 > 1)
          {
            if (v19 >= v14) {
              v19 %= v14;
            }
          }
          else
          {
            v19 &= v14 - 1;
          }
          if (v19 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t i = operator new(0x18uLL);
  *(void *)unint64_t i = 0;
  *((void *)i + 1) = v13;
  *((void *)i + 2) = *a3;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v14 || (float)(v21 * (float)v14) < v20)
  {
    BOOL v22 = 1;
    if (v14 >= 3) {
      BOOL v22 = (v14 & (v14 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v14);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__rehash<true>(a1, v25);
    unint64_t v14 = *(void *)(a1 + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v13 >= v14) {
        uint64_t v3 = v13 % v14;
      }
      else {
        uint64_t v3 = v13;
      }
    }
    else
    {
      uint64_t v3 = (v14 - 1) & v13;
    }
  }
  uint64_t v26 = *(void *)a1;
  v27 = *(void **)(*(void *)a1 + 8 * v3);
  if (v27)
  {
    *(void *)unint64_t i = *v27;
LABEL_43:
    void *v27 = i;
    goto LABEL_44;
  }
  *(void *)unint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v26 + 8 * v3) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v28 = *(void *)(*(void *)i + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v28 >= v14) {
        v28 %= v14;
      }
    }
    else
    {
      v28 &= v14 - 1;
    }
    v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_43;
  }
LABEL_44:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21BFC2570(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void HDSQLiteBindFoundationValueToStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  v20[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 UTF8String];
    if (v6) {
      char v7 = (const char *)v6;
    }
    else {
      char v7 = "";
    }
    sqlite3_bind_text(a1, a2, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 timeIntervalSinceReferenceDate];
      sqlite3_bind_double(a1, a2, v8);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((unint64_t)[v5 length] >= 0x7FFFFFFF)
        {
          unint64_t v16 = [MEMORY[0x263F08690] currentHandler];
          uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void HDSQLiteBindFoundationValueToStatement(sqlite3_stmt * _Nonnull, int, id  _Nonnull __strong)");
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"HDSQLiteDatabase.mm", 1493, @"NSData parameter passed to SQLiteBindFoundationValueToStatement (%lu bytes) is larger than maximum allowed SQLite blob (%lu bytes)", objc_msgSend(v5, "length"), 0x7FFFFFFFLL);
        }
        id v9 = v5;
        uint64_t v10 = [v9 bytes];
        int v11 = [v9 length];
        if (v10) {
          unint64_t v12 = (const char *)v10;
        }
        else {
          unint64_t v12 = "";
        }
        sqlite3_bind_blob(a1, a2, v12, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20[0] = 0;
          v20[1] = 0;
          [v5 getUUIDBytes:v20];
          sqlite3_bind_blob(a1, a2, v20, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            __int16 v18 = [MEMORY[0x263F08690] currentHandler];
            unint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void HDSQLiteBindFoundationValueToStatement(sqlite3_stmt * _Nonnull, int, id  _Nonnull __strong)");
            [v18 handleFailureInFunction:v19, @"HDSQLiteDatabase.mm", 1502, @"Binding unexpected value class %@", objc_opt_class() file lineNumber description];
          }
          id v13 = v5;
          unint64_t v14 = (const char *)[v13 objCType];
          if (!strcmp(v14, "d") || !strcmp(v14, "f"))
          {
            [v13 doubleValue];
            sqlite3_bind_double(a1, a2, v15);
          }
          else
          {
            sqlite3_bind_int64(a1, a2, [v13 longLongValue]);
          }
        }
      }
    }
  }
  else
  {
    sqlite3_bind_null(a1, a2);
  }
}

void sub_21BFC28BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC2A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _BindValueToStatement(void *a1, sqlite3_stmt *a2, int *a3)
{
  v26[2] = *MEMORY[0x263EF8340];
  id v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v5;
      uint64_t v10 = (const char *)[v9 objCType];
      if (strcmp(v10, "d") && strcmp(v10, "f"))
      {
        sqlite3_bind_int64(a2, *a3, [v9 longLongValue]);
        goto LABEL_22;
      }
      int v19 = *a3;
      [v9 doubleValue];
      float v21 = a2;
      int v22 = v19;
LABEL_18:
      sqlite3_bind_double(v21, v22, v20);
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = *a3;
      id v12 = v5;
      uint64_t v13 = [v12 bytes];
      if (v13) {
        unint64_t v14 = (const char *)v13;
      }
      else {
        unint64_t v14 = "";
      }
      int v15 = [v12 length];
      unint64_t v16 = a2;
      int v17 = v11;
      __int16 v18 = v14;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v23 = *a3;
        [v5 timeIntervalSinceReferenceDate];
        float v21 = a2;
        int v22 = v23;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v5)
        {
          unint64_t v24 = [MEMORY[0x263F08690] currentHandler];
          size_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BindValueToStatement(__strong id, sqlite3_stmt *, int *)");
          [v24 handleFailureInFunction:v25, @"HDSQLitePredicate.m", 1157, @"Unsupported predicate value: %@", v5 file lineNumber description];
        }
        else
        {
          sqlite3_bind_null(a2, *a3);
        }
        goto LABEL_22;
      }
      v26[0] = 0;
      v26[1] = 0;
      [v5 getUUIDBytes:v26];
      int v17 = *a3;
      __int16 v18 = (const char *)v26;
      unint64_t v16 = a2;
      int v15 = 16;
    }
    sqlite3_bind_blob(v16, v17, v18, v15, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_22;
  }
  int v6 = *a3;
  uint64_t v7 = [v5 UTF8String];
  if (v7) {
    double v8 = (const char *)v7;
  }
  else {
    double v8 = "";
  }
  sqlite3_bind_text(a2, v6, v8, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_22:
  ++*a3;
}

void sub_21BFC3028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC3178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsDate(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  id v5 = HDSQLiteRow::columnAsDate(a1, v4);

  return v5;
}

void sub_21BFC32B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsUUID(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  id v5 = HDSQLiteRow::columnAsUUID(a1, v4);

  return v5;
}

void sub_21BFC3350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteColumnWithName(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);

  return v4;
}

void sub_21BFC33C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsString(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  id v5 = HDSQLiteRow::columnAsString(a1, v4);

  return v5;
}

void sub_21BFC3460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *HDSQLiteRow::columnAsString(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    int v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"NSString * _Nullable HDSQLiteRow::columnAsString(int) const"];
    [v6 handleFailureInFunction:v7 file:@"HDSQLiteRow_Internal.h" lineNumber:81 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = [NSString stringWithUTF8String:"NSString * _Nullable HDSQLiteRow::columnAsString(int) const"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"HDSQLiteRow_Internal.h", 82, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  int v4 = (unsigned __int8 *)sqlite3_column_text(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
  if (v4) {
    int v4 = (unsigned __int8 *)[[NSString alloc] initWithUTF8String:v4];
  }

  return v4;
}

void sub_21BFC35B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC36C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double HDSQLiteColumnWithNameAsDouble(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  double v5 = HDSQLiteRow::columnAsDouble(a1, v4);

  return v5;
}

void sub_21BFC374C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double HDSQLiteRow::columnAsDouble(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    double v8 = [NSString stringWithUTF8String:"double HDSQLiteRow::columnAsDouble(int) const"];
    [v7 handleFailureInFunction:v8 file:@"HDSQLiteRow_Internal.h" lineNumber:74 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"double HDSQLiteRow::columnAsDouble(int) const"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"HDSQLiteRow_Internal.h", 75, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  int v4 = (sqlite3_stmt *)*((void *)this + 1);
  int v5 = *((_DWORD *)this + 4) + a2;

  return sqlite3_column_double(v4, v5);
}

void sub_21BFC3880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteColumnWithNameAsInt64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 16))(a1, v4);

  return v5;
}

void sub_21BFC3938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteRow::indexOfColumn(sqlite3_stmt **this, const char *a2)
{
  id v9 = a2;
  id v3 = this + 3;
  if (!this[6])
  {
    int v8 = 0;
    if (*((int *)this + 5) >= 1)
    {
      int v4 = 0;
      do
      {
        uint64_t v7 = sqlite3_column_name(this[1], v4);
        std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>((uint64_t)v3, &v7, &v7, &v8);
        int v4 = v8 + 1;
        int v8 = v4;
      }
      while (v4 < *((_DWORD *)this + 5));
    }
  }
  uint64_t v5 = std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>(v3, &v9);
  if (v5) {
    return (*((_DWORD *)v5 + 6) - *((_DWORD *)this + 4));
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>(void *a1, const char **a2)
{
  id v2 = *a2;
  char v3 = **a2;
  if (v3)
  {
    unint64_t v4 = 0;
    uint64_t v5 = (unsigned __int8 *)(v2 + 1);
    do
    {
      unint64_t v4 = (1025 * (v4 + v3)) ^ ((1025 * (v4 + v3)) >> 6);
      int v6 = *v5++;
      char v3 = v6;
    }
    while (v6);
    unint64_t v7 = 9 * v4;
  }
  else
  {
    unint64_t v7 = 0;
  }
  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0;
  }
  unint64_t v9 = 32769 * (v7 ^ (v7 >> 11));
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v12 = 32769 * (v7 ^ (v7 >> 11));
    if (v9 >= *(void *)&v8) {
      uint64_t v12 = v9 % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v12 = v9 & (*(void *)&v8 - 1);
  }
  uint64_t v13 = *(uint64_t ****)(*a1 + 8 * v12);
  if (!v13) {
    return 0;
  }
  for (unint64_t i = *v13; i; unint64_t i = (uint64_t **)*i)
  {
    unint64_t v15 = (unint64_t)i[1];
    if (v15 == v9)
    {
      if (!strcmp((const char *)i[2], v2)) {
        return i;
      }
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(void *)&v8) {
          v15 %= *(void *)&v8;
        }
      }
      else
      {
        v15 &= *(void *)&v8 - 1;
      }
      if (v15 != v12) {
        return 0;
      }
    }
  }
  return i;
}

sqlite3_int64 HDSQLiteRow::columnAsInt64(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    unint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    int8x8_t v8 = [NSString stringWithUTF8String:"virtual int64_t HDSQLiteRow::columnAsInt64(int) const"];
    [v7 handleFailureInFunction:v8 file:@"HDSQLiteRow_Internal.h" lineNumber:67 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    unint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    uint8x8_t v10 = [NSString stringWithUTF8String:"virtual int64_t HDSQLiteRow::columnAsInt64(int) const"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"HDSQLiteRow_Internal.h", 68, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  unint64_t v4 = (sqlite3_stmt *)*((void *)this + 1);
  int v5 = *((_DWORD *)this + 4) + a2;

  return sqlite3_column_int64(v4, v5);
}

void sub_21BFC3C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsUUID(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    int v6 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v7 = [NSString stringWithUTF8String:"NSUUID * _Nullable HDSQLiteRow::columnAsUUID(int) const"];
    [v6 handleFailureInFunction:v7 file:@"HDSQLiteRow_Internal.h" lineNumber:127 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    int8x8_t v8 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v9 = [NSString stringWithUTF8String:"NSUUID * _Nullable HDSQLiteRow::columnAsUUID(int) const"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"HDSQLiteRow_Internal.h", 128, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  if (HDSQLiteRow::columnIsNull(this, a2)) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", sqlite3_column_blob(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  }

  return v4;
}

void sub_21BFC3DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsDate(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    int v6 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v7 = [NSString stringWithUTF8String:"NSDate * _Nullable HDSQLiteRow::columnAsDate(int) const"];
    [v6 handleFailureInFunction:v7 file:@"HDSQLiteRow_Internal.h" lineNumber:138 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    int8x8_t v8 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v9 = [NSString stringWithUTF8String:"NSDate * _Nullable HDSQLiteRow::columnAsDate(int) const"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"HDSQLiteRow_Internal.h", 139, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  if (HDSQLiteRow::columnIsNull(this, a2)) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  }

  return v4;
}

void sub_21BFC3F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL HDSQLiteRow::columnIsNull(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    int v5 = [MEMORY[0x263F08690] currentHandler];
    int v6 = [NSString stringWithUTF8String:"BOOL HDSQLiteRow::columnIsNull(int) const"];
    [v5 handleFailureInFunction:v6 file:@"HDSQLiteRow_Internal.h" lineNumber:53 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    unint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    int8x8_t v8 = [NSString stringWithUTF8String:"BOOL HDSQLiteRow::columnIsNull(int) const"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"HDSQLiteRow_Internal.h", 54, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  return sqlite3_column_type(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2) == 5;
}

void sub_21BFC4080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HDSQLiteRow::setColumnNames(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v13 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = a1 + 24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        int8x8_t v8 = (const char *)[*(id *)(*((void *)&v9 + 1) + 8 * i) UTF8String];
        std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>(v6, &v8, &v8, &v13);
        ++v13;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_21BFC41C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>(uint64_t a1, const char **a2, void *a3, _DWORD *a4)
{
  int8x8_t v8 = *a2;
  char v9 = **a2;
  if (v9)
  {
    unint64_t v10 = 0;
    long long v11 = (unsigned __int8 *)(v8 + 1);
    do
    {
      unint64_t v10 = (1025 * (v10 + v9)) ^ ((1025 * (v10 + v9)) >> 6);
      int v12 = *v11++;
      char v9 = v12;
    }
    while (v12);
    unint64_t v13 = 9 * v10;
  }
  else
  {
    unint64_t v13 = 0;
  }
  unint64_t v14 = v13 ^ (v13 >> 11);
  unint64_t v15 = 32769 * v14;
  unint64_t v16 = *(void *)(a1 + 8);
  if (v16)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    unint64_t v18 = v17.u32[0];
    if (v17.u32[0] > 1uLL)
    {
      uint64_t v4 = 32769 * v14;
      if (v15 >= v16) {
        uint64_t v4 = v15 % v16;
      }
    }
    else
    {
      uint64_t v4 = v15 & (v16 - 1);
    }
    int v19 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v19)
    {
      for (uint64_t i = *v19; i; uint64_t i = *(void **)i)
      {
        unint64_t v21 = *((void *)i + 1);
        if (v21 == v15)
        {
          if (!strcmp(*((const char **)i + 2), v8)) {
            return i;
          }
        }
        else
        {
          if (v18 > 1)
          {
            if (v21 >= v16) {
              v21 %= v16;
            }
          }
          else
          {
            v21 &= v16 - 1;
          }
          if (v21 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v15;
  *((void *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  float v22 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v23 = *(float *)(a1 + 32);
  if (!v16 || (float)(v23 * (float)v16) < v22)
  {
    BOOL v24 = 1;
    if (v16 >= 3) {
      BOOL v24 = (v16 & (v16 - 1)) != 0;
    }
    unint64_t v25 = v24 | (2 * v16);
    unint64_t v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26) {
      size_t v27 = v26;
    }
    else {
      size_t v27 = v25;
    }
    std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__rehash<true>(a1, v27);
    unint64_t v16 = *(void *)(a1 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v15 >= v16) {
        uint64_t v4 = v15 % v16;
      }
      else {
        uint64_t v4 = v15;
      }
    }
    else
    {
      uint64_t v4 = (v16 - 1) & v15;
    }
  }
  uint64_t v28 = *(void *)a1;
  v29 = *(void **)(*(void *)a1 + 8 * v4);
  if (v29)
  {
    *(void *)uint64_t i = *v29;
LABEL_43:
    void *v29 = i;
    goto LABEL_44;
  }
  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v28 + 8 * v4) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v30 = *(void *)(*(void *)i + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v30 >= v16) {
        v30 %= v16;
      }
    }
    else
    {
      v30 &= v16 - 1;
    }
    v29 = (void *)(*(void *)a1 + 8 * v30);
    goto LABEL_43;
  }
LABEL_44:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21BFC4450(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      long long v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *long long v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            long long v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          long long v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

id _HDDateForSQLiteValue(void *a1)
{
  if (a1)
  {
    id v2 = (void *)MEMORY[0x263EFF910];
    [a1 doubleValue];
    a1 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v1 = vars8;
  }
  return a1;
}

void HDSQLiteStatementBinder::assertAllPropertiesBound(HDSQLiteStatementBinder *this)
{
  uint64_t v1 = (const char **)*((void *)this + 3);
  if (v1)
  {
    id v2 = (void *)((char *)this + 48);
    do
    {
      if (!std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::find<char const*>(v2, v1 + 2))
      {
        id v3 = [MEMORY[0x263F08690] currentHandler];
        int8x8_t v4 = [NSString stringWithUTF8String:"void HDSQLiteStatementBinder::assertAllPropertiesBound() const"];
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"HDSQLiteStatementBinder_Internal.h", 156, @"Property '%s' was never bound.", v1[2]);
      }
      uint64_t v1 = (const char **)*v1;
    }
    while (v1);
  }
}

void sub_21BFC47DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::find<char const*>(void *a1, const char **a2)
{
  id v2 = *a2;
  char v3 = **a2;
  if (v3)
  {
    unint64_t v4 = 0;
    unint64_t v5 = (unsigned __int8 *)(v2 + 1);
    do
    {
      unint64_t v4 = (1025 * (v4 + v3)) ^ ((1025 * (v4 + v3)) >> 6);
      int v6 = *v5++;
      char v3 = v6;
    }
    while (v6);
    unint64_t v7 = 9 * v4;
  }
  else
  {
    unint64_t v7 = 0;
  }
  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0;
  }
  unint64_t v9 = 32769 * (v7 ^ (v7 >> 11));
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v12 = 32769 * (v7 ^ (v7 >> 11));
    if (v9 >= *(void *)&v8) {
      uint64_t v12 = v9 % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v12 = v9 & (*(void *)&v8 - 1);
  }
  unint64_t v13 = *(uint64_t ****)(*a1 + 8 * v12);
  if (!v13) {
    return 0;
  }
  for (uint64_t i = *v13; i; uint64_t i = (uint64_t **)*i)
  {
    unint64_t v15 = (unint64_t)i[1];
    if (v9 == v15)
    {
      if (!strcmp((const char *)i[2], v2)) {
        return i;
      }
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(void *)&v8) {
          v15 %= *(void *)&v8;
        }
      }
      else
      {
        v15 &= *(void *)&v8 - 1;
      }
      if (v15 != v12) {
        return 0;
      }
    }
  }
  return i;
}

uint64_t HDSQLiteStatementBinder::HDSQLiteStatementBinder(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = 1065353216;
  int v16 = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = (const char *)[*(id *)(*((void *)&v12 + 1) + 8 * i) UTF8String];
        std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>(a1 + 8, &v11, &v11, &v16);
        ++v16;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  return a1;
}

void sub_21BFC4A78(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1);

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindString(HDSQLiteStatementBinder *this, NSString *a2, NSString *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v11 = v5;
  uint64_t v7 = [(NSString *)v11 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  uint64_t v8 = *(sqlite3_stmt **)this;
  if (v6)
  {
    int v9 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_text(v8, v9, [(NSString *)v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    int v10 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v8, v10);
  }
}

void sub_21BFC4C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindBoolean(HDSQLiteStatementBinder *this, NSString *a2, int a3)
{
  uint64_t v8 = a2;
  id v5 = [(NSString *)v8 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v5);
  id v6 = *(sqlite3_stmt **)this;
  int v7 = HDSQLiteStatementBinder::indexForProperty(this, v5);
  sqlite3_bind_int(v6, v7, a3);
}

void sub_21BFC4D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFC4ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _HDSQLiteValueForDate(void *a1)
{
  if (a1)
  {
    uint64_t v1 = NSNumber;
    [a1 timeIntervalSinceReferenceDate];
    objc_msgSend(v1, "numberWithDouble:");
  }
  else
  {
    [MEMORY[0x263EFF9D0] null];
  id v2 = };

  return v2;
}

uint64_t HDSQLiteEntityHasColumnWithName(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v8 = 0;
  unint64_t v4 = (void *)[a1 columnDefinitionsWithCount:&v8];
  uint64_t v5 = 0;
  if (v4 && v8)
  {
    for (unint64_t i = 0; i < v8; ++i)
    {
      uint64_t v5 = [v3 isEqualToString:*v4];
      if (v5) {
        break;
      }
      v4 += 3;
    }
  }

  return v5;
}

void sub_21BFC51C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteComparisonTypeForPredicateOperator(unint64_t a1)
{
  if (a1 < 0xB && ((0x4BFu >> a1) & 1) != 0) {
    return qword_21BFF4548[a1];
  }
  _HKInitializeLogging();
  id v2 = *MEMORY[0x263F098E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
    HDSQLiteComparisonTypeForPredicateOperator_cold_1(a1, v2);
  }
  return 0;
}

id _HDSQLiteValueForNumber(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }
  unint64_t v4 = v3;

  return v4;
}

void sub_21BFC599C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFC6100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _HDSQLiteValueForString(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }
  unint64_t v4 = v3;

  return v4;
}

void HDSQLiteStatementBinder::bindNumber(HDSQLiteStatementBinder *this, NSString *a2, NSNumber *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  uint8x8_t v17 = v5;
  int v7 = [(NSString *)v17 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  if (v6)
  {
    unint64_t v8 = v6;
    int v9 = (const char *)[(NSNumber *)v8 objCType];
    if (!strcmp(v9, "d") || !strcmp(v9, "f"))
    {
      long long v12 = *(sqlite3_stmt **)this;
      int v13 = HDSQLiteStatementBinder::indexForProperty(this, v7);
      [(NSNumber *)v8 doubleValue];
      sqlite3_bind_double(v12, v13, v14);
    }
    else
    {
      int v10 = *(sqlite3_stmt **)this;
      int v11 = HDSQLiteStatementBinder::indexForProperty(this, v7);
      sqlite3_bind_int64(v10, v11, [(NSNumber *)v8 longLongValue]);
    }
  }
  else
  {
    long long v15 = *(sqlite3_stmt **)this;
    int v16 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v15, v16);
  }
}

void sub_21BFC66EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class __HDIsUnitTesting_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctest.isa);
  HDIsUnitTesting__HDFIsUnitTesting = result != 0;
  return result;
}

void HDSQLiteStatementBinder::bindDate(HDSQLiteStatementBinder *this, NSString *a2, NSDate *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  long long v12 = v5;
  int v7 = [(NSString *)v12 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  unint64_t v8 = *(sqlite3_stmt **)this;
  if (v6)
  {
    int v9 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    [(NSDate *)v6 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(v8, v9, v10);
  }
  else
  {
    int v11 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v8, v11);
  }
}

void sub_21BFC68E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFC6A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21BFC6C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21BFC6DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

BOOL HDKeyPathTypeHasForeignKey(int a1)
{
  return (a1 - 6) < 3;
}

__CFString *HDSQLForForeignKeyDeletionAction(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"NO ACTION";
  }
  else {
    return off_2643D43F0[a1 - 1];
  }
}

void logActiveStatement(sqlite3_stmt *a1)
{
  _HKInitializeLogging();
  id v2 = (void *)*MEMORY[0x263F098E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
    logActiveStatement_cold_1(a1, v2);
  }
}

void collectStatementStrings(int a1, sqlite3_stmt *pStmt, void *a3)
{
  id v4 = [NSString stringWithUTF8String:sqlite3_sql(pStmt)];
  [a3 addObject:v4];
}

id _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(void *a1)
{
  id v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithFormat:@"PeriodicActivity-%@-LastSuccessfulRun", v2];

  return v3;
}

void sub_21BFC8AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(void *a1)
{
  id v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithFormat:@"PeriodicActivity-%@-EarliestNextRun", v2];

  return v3;
}

__CFString *HDStringFromXPCPeriodicActivityResult(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2643D44D0[a1];
  }

  return v1;
}

id _HDXPCPeriodicActivityErrorCountUserDefaultsKey(void *a1)
{
  id v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithFormat:@"PeriodicActivity-%@-ErrorCount", v2];

  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

__CFString *HDStringFromContentProtectionState(unint64_t a1)
{
  if (a1 > 4) {
    return @"unknown";
  }
  else {
    return off_2643D4608[a1];
  }
}

id _HDSQLiteValueForData(void *a1)
{
  id v1 = a1;
  id v2 = v1;
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

id _HDSQLiteValueForUUID(void *a1)
{
  if (a1)
  {
    id v1 = objc_msgSend(a1, "hk_dataForUUIDBytes");
    id v2 = _HDSQLiteValueForData(v1);
  }
  else
  {
    id v2 = [MEMORY[0x263EFF9D0] null];
  }

  return v2;
}

id _HDSQLiteValueForDataType(void *a1)
{
  if (a1) {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  }
  else {
  id v1 = [MEMORY[0x263EFF9D0] null];
  }

  return v1;
}

id _HDSQLiteValueForQuantity(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = NSNumber;
    [a1 doubleValueForUnit:a2];
    objc_msgSend(v2, "numberWithDouble:");
  }
  else
  {
    [MEMORY[0x263EFF9D0] null];
  id v3 = };

  return v3;
}

id _HDUUIDForSQLiteValue(void *a1)
{
  if (a1)
  {
    a1 = objc_msgSend(MEMORY[0x263F08C38], "hk_UUIDWithData:", a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_21BFCD148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void _LogOrAppend(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  int v7 = v6;
  if (a3)
  {
    _HKInitializeLogging();
    unint64_t v8 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      _LogOrAppend_cold_1((uint64_t)v5, v8);
    }
  }
  else
  {
    [v6 appendString:v5];
    [v7 appendString:@"\n"];
  }
}

uint64_t HDDiagnosticStringFromDuration()
{
  return MEMORY[0x270EF36A8]();
}

id HDSQLiteSchemaDiff(void *a1, void *a2)
{
  uint64_t v245 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v165 = [MEMORY[0x263EFF980] array];
  id v5 = (void *)MEMORY[0x263EFFA08];
  v160 = v3;
  id v6 = [v3 allKeys];
  int v7 = [v5 setWithArray:v6];

  unint64_t v8 = (void *)MEMORY[0x263EFFA08];
  v159 = v4;
  uint64_t v9 = [v4 allKeys];
  v162 = [v8 setWithArray:v9];

  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  obuint64_t j = v7;
  uint64_t v163 = [obj countByEnumeratingWithState:&v191 objects:v232 count:16];
  if (v163)
  {
    uint64_t v161 = *(void *)v192;
    do
    {
      for (uint64_t i = 0; i != v163; ++i)
      {
        if (*(void *)v192 != v161) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v191 + 1) + 8 * i);
        long long v12 = [v162 member:v11];

        if (v12)
        {
          uint64_t v164 = i;
          int v13 = [v160 objectForKeyedSubscript:v11];
          double v14 = [v159 objectForKeyedSubscript:v11];
          id v15 = v165;
          id v175 = v11;
          id v16 = v13;
          id v169 = v14;
          uint8x8_t v17 = [MEMORY[0x263EFF9C0] set];
          v177 = [MEMORY[0x263EFF9C0] set];
          long long v203 = 0u;
          long long v204 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          uint64_t v18 = [v16 tables];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v203 objects:v235 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v204;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v204 != v21) {
                  objc_enumerationMutation(v18);
                }
                [v17 addObject:*(void *)(*((void *)&v203 + 1) + 8 * j)];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v203 objects:v235 count:16];
            }
            while (v20);
          }

          long long v201 = 0u;
          long long v202 = 0u;
          long long v199 = 0u;
          long long v200 = 0u;
          float v23 = [v169 tables];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v199 objects:v234 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v200;
            do
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v200 != v26) {
                  objc_enumerationMutation(v23);
                }
                [v177 addObject:*(void *)(*((void *)&v199 + 1) + 8 * k)];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v199 objects:v234 count:16];
            }
            while (v25);
          }

          long long v197 = 0u;
          long long v198 = 0u;
          long long v195 = 0u;
          long long v196 = 0u;
          id v176 = v17;
          uint64_t v171 = [v176 countByEnumeratingWithState:&v195 objects:v233 count:16];
          if (v171)
          {
            uint64_t v170 = *(void *)v196;
            id v167 = v15;
            id v168 = v16;
            do
            {
              for (uint64_t m = 0; m != v171; ++m)
              {
                if (*(void *)v196 != v170) {
                  objc_enumerationMutation(v176);
                }
                uint64_t v29 = *(void *)(*((void *)&v195 + 1) + 8 * m);
                unint64_t v30 = [v177 member:v29];

                if (!v30)
                {
                  id v34 = [NSString stringWithFormat:@"LHS: %@: extra table '%@'", v175, v29];
                  [v15 addObject:v34];
                  goto LABEL_113;
                }
                uint64_t v174 = m;
                v31 = [NSString stringWithFormat:@"%@: %@", v175, v29];
                v173 = [v16 tables];
                v32 = [v173 objectForKeyedSubscript:v29];
                v172 = [v169 tables];
                v33 = [v172 objectForKeyedSubscript:v29];
                id v186 = v15;
                id v34 = v31;
                id v35 = v32;
                v36 = (void *)MEMORY[0x263EFFA08];
                id v184 = v35;
                v37 = [v35 columns];
                v38 = [v37 allKeys];
                v39 = [v36 setWithArray:v38];

                v40 = (void *)MEMORY[0x263EFFA08];
                v185 = v33;
                v41 = [v33 columns];
                v42 = [v41 allKeys];
                v181 = [v40 setWithArray:v42];

                long long v229 = 0u;
                long long v230 = 0u;
                long long v227 = 0u;
                long long v228 = 0u;
                id v43 = v39;
                id v178 = v43;
                uint64_t v182 = [v43 countByEnumeratingWithState:&v227 objects:v244 count:16];
                if (!v182) {
                  goto LABEL_61;
                }
                uint64_t v180 = *(void *)v228;
                id v183 = v34;
                do
                {
                  for (uint64_t n = 0; n != v182; ++n)
                  {
                    if (*(void *)v228 != v180) {
                      objc_enumerationMutation(v178);
                    }
                    uint64_t v45 = *(void *)(*((void *)&v227 + 1) + 8 * n);
                    v46 = [v181 member:v45];

                    if (!v46)
                    {
                      v48 = [NSString stringWithFormat:@"LHS: %@: extra column '%@'", v34, v45];
                      [v186 addObject:v48];
                      goto LABEL_59;
                    }
                    v47 = [v184 columns];
                    v48 = [v47 objectForKeyedSubscript:v45];

                    v49 = [v185 columns];
                    v50 = [v49 objectForKeyedSubscript:v45];

                    v51 = [v48 type];
                    v52 = [v50 type];
                    char v53 = [v51 isEqualToString:v52];

                    if ((v53 & 1) == 0)
                    {
                      v54 = NSString;
                      v55 = [v48 type];
                      v56 = [v50 type];
                      v57 = [v54 stringWithFormat:@"%@: Column %@ types differ: %@ vs %@", v34, v45, v55, v56];
                      [v186 addObject:v57];
                    }
                    v58 = [v48 defaultValue];
                    uint64_t v59 = [v50 defaultValue];
                    if (v58 == (void *)v59)
                    {
                      v66 = v58;
                      goto LABEL_43;
                    }
                    v60 = (void *)v59;
                    uint64_t v61 = [v50 defaultValue];
                    if (!v61)
                    {

LABEL_42:
                      v67 = NSString;
                      v66 = [v48 defaultValue];
                      v58 = [v50 defaultValue];
                      v68 = [v67 stringWithFormat:@"%@: Column %@ default values differ: %@ vs %@", v34, v45, v66, v58];
                      [v186 addObject:v68];

LABEL_43:
                      goto LABEL_44;
                    }
                    v62 = (void *)v61;
                    v63 = [v48 defaultValue];
                    v64 = [v50 defaultValue];
                    char v65 = [v63 isEqualToString:v64];

                    id v34 = v183;
                    if ((v65 & 1) == 0) {
                      goto LABEL_42;
                    }
LABEL_44:
                    int v69 = [v48 isNullable];
                    if (v69 != [v50 isNullable])
                    {
                      v70 = [NSString stringWithFormat:@"%@: Column %@ nullability differs: %d vs %d", v34, v45, objc_msgSend(v48, "isNullable"), objc_msgSend(v50, "isNullable")];
                      [v186 addObject:v70];
                    }
                    int v71 = [v48 isPrimaryKey];
                    if (v71 != [v50 isPrimaryKey])
                    {
                      v72 = [NSString stringWithFormat:@"%@: Column %@ pk status differs: %d vs %d", v34, v45, objc_msgSend(v48, "isPrimaryKey"), objc_msgSend(v50, "isPrimaryKey")];
                      [v186 addObject:v72];
                    }
                    int v73 = [v48 isAutoincrement];
                    if (v73 != [v50 isAutoincrement])
                    {
                      v74 = [NSString stringWithFormat:@"%@: Column %@ nullability differs: %d vs %d", v34, v45, objc_msgSend(v48, "isAutoincrement"), objc_msgSend(v50, "isAutoincrement")];
                      [v186 addObject:v74];
                    }
                    v75 = [v48 foreignKeyTargetTable];
                    uint64_t v76 = [v50 foreignKeyTargetTable];
                    if (v75 == (void *)v76)
                    {
                      v83 = v75;
                    }
                    else
                    {
                      v77 = (void *)v76;
                      uint64_t v179 = v45;
                      uint64_t v78 = [v50 foreignKeyTargetTable];
                      if (v78)
                      {
                        v79 = (void *)v78;
                        v80 = [v48 foreignKeyTargetTable];
                        v81 = [v50 foreignKeyTargetTable];
                        char v82 = [v80 isEqualToString:v81];

                        if (v82) {
                          goto LABEL_58;
                        }
                      }
                      else
                      {
                      }
                      v84 = NSString;
                      v83 = [v48 foreignKeyTargetTable];
                      v75 = [v48 foreignKeyTargetColumn];
                      v85 = HDSQLForForeignKeyDeletionAction([v48 deletionAction]);
                      v86 = [v50 foreignKeyTargetTable];
                      v87 = [v50 foreignKeyTargetColumn];
                      v88 = HDSQLForForeignKeyDeletionAction([v50 deletionAction]);
                      v89 = [v84 stringWithFormat:@"%@: Column %@ foreign key differs: %@(%@) %@ vs %@(%@) %@", v183, v179, v83, v75, v85, v86, v87, v88];
                      [v186 addObject:v89];
                    }
LABEL_58:

                    id v34 = v183;
LABEL_59:
                  }
                  id v43 = v178;
                  uint64_t v182 = [v178 countByEnumeratingWithState:&v227 objects:v244 count:16];
                }
                while (v182);
LABEL_61:

                long long v225 = 0u;
                long long v226 = 0u;
                long long v223 = 0u;
                long long v224 = 0u;
                id v90 = v181;
                uint64_t v91 = [v90 countByEnumeratingWithState:&v223 objects:&v240 count:16];
                if (v91)
                {
                  uint64_t v92 = v91;
                  uint64_t v93 = *(void *)v224;
                  do
                  {
                    for (iuint64_t i = 0; ii != v92; ++ii)
                    {
                      if (*(void *)v224 != v93) {
                        objc_enumerationMutation(v90);
                      }
                      uint64_t v95 = *(void *)(*((void *)&v223 + 1) + 8 * ii);
                      v96 = [v43 member:v95];

                      if (!v96)
                      {
                        v97 = [NSString stringWithFormat:@"RHS: %@: extra column '%@'", v34, v95];
                        [v186 addObject:v97];
                      }
                    }
                    uint64_t v92 = [v90 countByEnumeratingWithState:&v223 objects:&v240 count:16];
                  }
                  while (v92);
                }

                long long v221 = 0u;
                long long v222 = 0u;
                long long v219 = 0u;
                long long v220 = 0u;
                v98 = [v184 indices];
                uint64_t v99 = [v98 countByEnumeratingWithState:&v219 objects:v239 count:16];
                if (v99)
                {
                  uint64_t v100 = v99;
                  uint64_t v101 = *(void *)v220;
                  do
                  {
                    for (juint64_t j = 0; jj != v100; ++jj)
                    {
                      if (*(void *)v220 != v101) {
                        objc_enumerationMutation(v98);
                      }
                      uint64_t v103 = *(void *)(*((void *)&v219 + 1) + 8 * jj);
                      v104 = [v185 indices];
                      char v105 = [v104 containsObject:v103];

                      if ((v105 & 1) == 0)
                      {
                        v106 = [NSString stringWithFormat:@"LHS: %@: extra index '%@'", v34, v103];
                        [v186 addObject:v106];
                      }
                    }
                    uint64_t v100 = [v98 countByEnumeratingWithState:&v219 objects:v239 count:16];
                  }
                  while (v100);
                }

                long long v217 = 0u;
                long long v218 = 0u;
                long long v215 = 0u;
                long long v216 = 0u;
                v107 = [v185 indices];
                uint64_t v108 = [v107 countByEnumeratingWithState:&v215 objects:v238 count:16];
                if (v108)
                {
                  uint64_t v109 = v108;
                  uint64_t v110 = *(void *)v216;
                  do
                  {
                    for (kuint64_t k = 0; kk != v109; ++kk)
                    {
                      if (*(void *)v216 != v110) {
                        objc_enumerationMutation(v107);
                      }
                      uint64_t v112 = *(void *)(*((void *)&v215 + 1) + 8 * kk);
                      v113 = [v184 indices];
                      char v114 = [v113 containsObject:v112];

                      if ((v114 & 1) == 0)
                      {
                        v115 = [NSString stringWithFormat:@"RHS: %@: extra index '%@'", v34, v112];
                        [v186 addObject:v115];
                      }
                    }
                    uint64_t v109 = [v107 countByEnumeratingWithState:&v215 objects:v238 count:16];
                  }
                  while (v109);
                }

                long long v213 = 0u;
                long long v214 = 0u;
                long long v211 = 0u;
                long long v212 = 0u;
                v116 = [v184 triggers];
                uint64_t v117 = [v116 countByEnumeratingWithState:&v211 objects:v237 count:16];
                if (v117)
                {
                  uint64_t v118 = v117;
                  uint64_t v119 = *(void *)v212;
                  do
                  {
                    for (muint64_t m = 0; mm != v118; ++mm)
                    {
                      if (*(void *)v212 != v119) {
                        objc_enumerationMutation(v116);
                      }
                      uint64_t v121 = *(void *)(*((void *)&v211 + 1) + 8 * mm);
                      v122 = [v185 triggers];
                      char v123 = [v122 containsObject:v121];

                      if ((v123 & 1) == 0)
                      {
                        v124 = [NSString stringWithFormat:@"LHS: %@: extra trigger '%@'", v34, v121];
                        [v186 addObject:v124];
                      }
                    }
                    uint64_t v118 = [v116 countByEnumeratingWithState:&v211 objects:v237 count:16];
                  }
                  while (v118);
                }

                long long v209 = 0u;
                long long v210 = 0u;
                long long v207 = 0u;
                long long v208 = 0u;
                v125 = [v185 triggers];
                uint64_t v126 = [v125 countByEnumeratingWithState:&v207 objects:v236 count:16];
                if (v126)
                {
                  uint64_t v127 = v126;
                  uint64_t v128 = *(void *)v208;
                  do
                  {
                    for (nuint64_t n = 0; nn != v127; ++nn)
                    {
                      if (*(void *)v208 != v128) {
                        objc_enumerationMutation(v125);
                      }
                      uint64_t v130 = *(void *)(*((void *)&v207 + 1) + 8 * nn);
                      v131 = [v184 triggers];
                      char v132 = [v131 containsObject:v130];

                      if ((v132 & 1) == 0)
                      {
                        v133 = [NSString stringWithFormat:@"RHS: %@: extra trigger '%@'", v34, v130];
                        [v186 addObject:v133];
                      }
                    }
                    uint64_t v127 = [v125 countByEnumeratingWithState:&v207 objects:v236 count:16];
                  }
                  while (v127);
                }

                v134 = [v184 createTableSchema];
                int v135 = [v134 containsString:@"WITHOUT ROWID"];

                v136 = [v185 createTableSchema];
                int v137 = [v136 containsString:@"WITHOUT ROWID"];

                if (!v135)
                {
                  v138 = @"RHS table constructed WITHOUT ROWID, but LHS table is not";
                  id v15 = v167;
                  id v16 = v168;
                  v139 = v173;
                  uint64_t m = v174;
                  v140 = v172;
                  if (!v137) {
                    goto LABEL_112;
                  }
LABEL_111:
                  [v186 addObject:v138];
                  goto LABEL_112;
                }
                v138 = @"LHS table constructed WITHOUT ROWID, but RHS table is not";
                id v15 = v167;
                id v16 = v168;
                v139 = v173;
                uint64_t m = v174;
                v140 = v172;
                if ((v137 & 1) == 0) {
                  goto LABEL_111;
                }
LABEL_112:

LABEL_113:
              }
              uint64_t v171 = [v176 countByEnumeratingWithState:&v195 objects:v233 count:16];
            }
            while (v171);
          }

          long long v243 = 0u;
          long long v242 = 0u;
          long long v241 = 0u;
          long long v240 = 0u;
          id v141 = v177;
          uint64_t v142 = [v141 countByEnumeratingWithState:&v240 objects:v244 count:16];
          if (v142)
          {
            uint64_t v143 = v142;
            uint64_t v144 = *(void *)v241;
            do
            {
              for (uint64_t i1 = 0; i1 != v143; ++i1)
              {
                if (*(void *)v241 != v144) {
                  objc_enumerationMutation(v141);
                }
                uint64_t v146 = *(void *)(*((void *)&v240 + 1) + 8 * i1);
                v147 = [v176 member:v146];

                if (!v147)
                {
                  v148 = [NSString stringWithFormat:@"RHS: %@: extra table '%@'", v175, v146];
                  [v15 addObject:v148];
                }
              }
              uint64_t v143 = [v141 countByEnumeratingWithState:&v240 objects:v244 count:16];
            }
            while (v143);
          }

          uint64_t i = v164;
        }
        else
        {
          id v16 = [NSString stringWithFormat:@"LHS has extra database '%@'", v11];
          [v165 addObject:v16];
        }
      }
      uint64_t v163 = [obj countByEnumeratingWithState:&v191 objects:v232 count:16];
    }
    while (v163);
  }

  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id v149 = v162;
  uint64_t v150 = [v149 countByEnumeratingWithState:&v187 objects:v231 count:16];
  if (v150)
  {
    uint64_t v151 = v150;
    uint64_t v152 = *(void *)v188;
    do
    {
      for (uint64_t i2 = 0; i2 != v151; ++i2)
      {
        if (*(void *)v188 != v152) {
          objc_enumerationMutation(v149);
        }
        uint64_t v154 = *(void *)(*((void *)&v187 + 1) + 8 * i2);
        v155 = [obj member:v154];

        if (!v155)
        {
          v156 = [NSString stringWithFormat:@"RHS has extra database '%@'", v154];
          [v165 addObject:v156];
        }
      }
      uint64_t v151 = [v149 countByEnumeratingWithState:&v187 objects:v231 count:16];
    }
    while (v151);
  }

  id v157 = v165;
  return v157;
}

void sub_21BFD0F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BFD31C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 104), 8);
  _Unwind_Resume(a1);
}

__CFString *HDStringFromGatedActivityResult(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643D4998[a1];
  }

  return v1;
}

void OUTLINED_FUNCTION_2_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_21BFD53D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD5600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD59D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD5AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)HDSQLiteDatabase;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

id HDSQLiteErrorFromDatabase(sqlite3 *a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sqlite3_extended_errcode(a1);
  int v7 = [NSString stringWithCString:sqlite3_errmsg(a1) encoding:4];
  if (a2)
  {
    unint64_t v8 = [NSString stringWithCString:sqlite3_sql(a2) encoding:4];
  }
  else
  {
    unint64_t v8 = 0;
  }
  uint64_t v9 = HDSQLiteErrorWithExtendedCode(v6, v7, v8, v5);

  return v9;
}

void sub_21BFD5C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteDatabaseErrorFromSQLiteError(void *a1)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = *MEMORY[0x263F08320];
  v9[0] = *MEMORY[0x263F08608];
  v9[1] = v2;
  v10[0] = v1;
  id v3 = NSString;
  id v4 = [v1 localizedDescription];
  id v5 = [v3 stringWithFormat:@"SQLite error: %@", v4];
  v10[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  int v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.healthd.SQLite" code:2 userInfo:v6];

  return v7;
}

void sub_21BFD5D48(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21BFD5F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFD6014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFD6098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD6138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD6264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD6340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HDSQLiteRow::~HDSQLiteRow(HDSQLiteRow *this)
{
  *(void *)this = &unk_26CC1A088;
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)this + 24);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26CC1A088;
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)this + 24);

  JUMPOUT(0x21D49F120);
}

void sub_21BFD64C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD65BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD67CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFD694C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFD6BF8(_Unwind_Exception *a1)
{
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

void sub_21BFD6D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD6DFC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21BFD760C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Unwind_Resume(a1);
}

void sub_21BFD78A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD7B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD7D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD81A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BFD8278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD83A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD84C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD87CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD89F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_21BFD8EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteErrorWithExtendedCode(uint64_t a1, void *a2, void *a3, void *a4)
{
  v18[2] = *MEMORY[0x263EF8340];
  int v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v17[0] = @"extended_error_code";
  uint64_t v10 = [NSNumber numberWithInt:a1];
  v17[1] = @"error_message";
  v18[0] = v10;
  v18[1] = v7;
  int v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  long long v12 = (void *)[v11 mutableCopy];

  int v13 = &stru_26CC1AE10;
  if (v7) {
    int v13 = v7;
  }
  double v14 = [MEMORY[0x263F089D8] stringWithFormat:@"A SQLite error occurred: (%d) %@", a1, v13];
  if (v8)
  {
    [v12 setObject:v8 forKey:@"sql_statement"];
    [v14 appendFormat:@" (failing statement: \"%@\"", v8];
  }
  if (v9)
  {
    [v12 setObject:v9 forKey:@"context"];
    [v14 appendFormat:@" <%@>", v9];
  }
  [v12 setObject:v14 forKey:*MEMORY[0x263F08320]];
  id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.SQLite" code:a1 userInfo:v12];

  return v15;
}

void sub_21BFD91C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD9308(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21BFD9430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFD9530(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteBindFoundationValuesToStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  LODWORD(v6) = a2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  uint64_t v6 = v6;
  if (v5)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      int v9 = v6;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        HDSQLiteBindFoundationValueToStatement(a1, v6 + v8, *(void **)(*((void *)&v11 + 1) + 8 * v8));
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      LODWORD(v6) = v6 + v8;
    }
    while (v5);
    uint64_t v6 = (v9 + v8);
  }

  return v6;
}

void sub_21BFD9678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HDSQLiteBindStringToStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [v7 UTF8String];
  if (v5) {
    uint64_t v6 = (const char *)v5;
  }
  else {
    uint64_t v6 = "";
  }
  sqlite3_bind_text(a1, a2, v6, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void sub_21BFD9710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id HDSQLiteFoundationValueForStatementColumn(sqlite3_stmt *a1, int a2)
{
  int v4 = sqlite3_column_type(a1, a2) - 1;
  uint64_t v5 = 0;
  switch(v4)
  {
    case 0:
      uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", sqlite3_column_int64(a1, a2));
      break;
    case 1:
      uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithDouble:", sqlite3_column_double(a1, a2));
      break;
    case 2:
      uint64_t v5 = HDSQLiteStringValueForStatementColumn(a1, a2);
      break;
    case 4:
      break;
    default:
      uint64_t v6 = sqlite3_column_blob(a1, a2);
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", v6, sqlite3_column_bytes(a1, a2));
      break;
  }

  return v5;
}

id HDSQLiteStringValueForStatementColumn(sqlite3_stmt *a1, int a2)
{
  uint64_t v2 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(a1, a2));

  return v2;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exceptiouint64_t n = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 0xCu);
}

uint64_t __HDXPCProcessNameFromAuditToken_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  HDXPCProcessNameFromAuditToken_pidInfoAllowed = result == 0;
  return result;
}

void sub_21BFDA0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BFDB9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _StringEscapingSpecialCharactersForLikePredicate(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F089D8];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  uint64_t v4 = [v2 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = ___StringEscapingSpecialCharactersForLikePredicate_block_invoke;
  v7[3] = &unk_2643D4C40;
  id v5 = v3;
  id v8 = v5;
  objc_msgSend(v2, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v7);

  return v5;
}

void _HDCFNotificationCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&_pendingNotificationsLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)_pendingNotifications;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      if (objc_msgSend(v9, "notification", (void)v12) == a1) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v9;

    if (!v10) {
      goto LABEL_14;
    }
    [(id)_pendingNotifications removeObject:v10];
    if (![(id)_pendingNotifications count])
    {
      long long v11 = (void *)_pendingNotifications;
      _pendingNotifications = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_pendingNotificationsLock);
    [v10 _handleResponse:a2];
  }
  else
  {
LABEL_9:

LABEL_14:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pendingNotificationsLock);
  }
}

__CFString *HDUserNotificationResponseButtonToString(uint64_t a1)
{
  id v1 = @"default";
  if (a1 == 2) {
    id v1 = @"other";
  }
  if (a1 == 1) {
    return @"cancel";
  }
  else {
    return v1;
  }
}

void sub_21BFDED04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteEntityCreateTableSQL(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, char a8)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v15 = a1;
  id v16 = a4;
  id v41 = a5;
  id v40 = a6;
  id v38 = a7;
  id v17 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v17, "appendFormat:", @"CREATE TABLE IF NOT EXISTS %@ ("), v15, v15, v16, v17;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  char v53 = 1;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v48 = __HDSQLiteEntityCreateTableSQL_block_invoke;
  v49 = &unk_2643D4E40;
  v51 = v52;
  id v18 = v17;
  id v50 = v18;
  id v42 = v16;
  id v39 = v15;
  uint64_t v19 = v47;
  char v54 = 0;
  if (a3)
  {
    uint64_t v20 = a3 - 1;
    uint64_t v21 = (unsigned __int8 *)(a2 + 16);
    do
    {
      id v22 = *((id *)v21 - 2);
      float v23 = [v42 objectForKeyedSubscript:v22];
      BOOL HasForeignKey = HDKeyPathTypeHasForeignKey(*v21);
      if (v23) {
        BOOL v25 = 0;
      }
      else {
        BOOL v25 = HasForeignKey;
      }
      if (v25)
      {
        _HKInitializeLogging();
        uint64_t v26 = *MEMORY[0x263F098E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v57 = v22;
          __int16 v58 = 2112;
          id v59 = v39;
          _os_log_fault_impl(&dword_21BFB4000, v26, OS_LOG_TYPE_FAULT, "Expected foreign key for column %@ of table %@ and none found", buf, 0x16u);
        }
      }
      size_t v27 = [[_HDSQLiteEntityColumn alloc] initWithName:v22 columnType:*((void *)v21 - 1) keyPathType:*v21 foreignKey:v23];
      ((void (*)(void *, _HDSQLiteEntityColumn *, char *))v48)(v19, v27, &v54);
      BOOL v28 = v54 != 0;

      if (v20) {
        char v29 = v28;
      }
      else {
        char v29 = 1;
      }
      --v20;
      v21 += 24;
    }
    while ((v29 & 1) == 0);
  }

  if (v41)
  {
    if ((unint64_t)[v41 count] <= 1) {
      __assert_rtn("HDSQLiteEntityCreateTableSQL", "HDSQLiteEntity.mm", 608, "primaryKeyColumns.count >= 2");
    }
    unint64_t v30 = [v41 componentsJoinedByString:@", "];
    [v18 appendFormat:@", PRIMARY KEY(%@)", v30];
  }
  if ([v40 count])
  {
    v31 = [v40 componentsJoinedByString:@", "];
    [v18 appendFormat:@", UNIQUE(%@)", v31];
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v38;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(v32);
        }
        v36 = [*(id *)(*((void *)&v43 + 1) + 8 * i) SQLCheckConstraint];
        [v18 appendFormat:@", CHECK(%@)", v36];
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v33);
  }

  [v18 appendString:@""]);
  if ((a8 & 1) == 0) {
    [v18 appendString:@" WITHOUT ROWID"];
  }

  _Block_object_dispose(v52, 8);

  return v18;
}

void sub_21BFDF1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void HDSQLiteEntityEnumerateColumns(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  if ([a1 columnDefinitionsWithCount:&v10])
  {
    id v4 = [a1 foreignKeys];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __HDSQLiteEntityEnumerateColumns_block_invoke;
    v6[3] = &unk_2643D4E18;
    id v7 = v4;
    uint64_t v9 = a1;
    id v8 = v3;
    id v5 = v4;
    _enumerateColumnDefinitions(a1, v6);
  }
}

void sub_21BFDF380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id HDSQLiteEntityAllDatabaseColumnNames(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  while ([a1 conformsToProtocol:&unk_26CC28B70])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __HDSQLiteEntityAllDatabaseColumnNames_block_invoke;
    v4[3] = &unk_2643D4E68;
    id v5 = v2;
    [a1 enumerateColumnsWithBlock:v4];
    a1 = (void *)[a1 superclass];
  }

  return v2;
}

void sub_21BFDF49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21BFDF538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFDF5EC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21BFDF74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFDF8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_21BFDFA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21BFDFB54(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 48);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 8);
  _Unwind_Resume(a1);
}

void sub_21BFDFC60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFDFD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFDFEF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v3 - 64), 8);
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

void sub_21BFE00C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BFE02A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21BFE04A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21BFE06A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21BFE07E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __HDSQLiteEntityDisambiguatedDatabaseTable_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:5 valueOptions:0 capacity:16];
  uint64_t v1 = HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache;
  HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __HDSQLiteEntityEnumerateColumns_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *(id *)a2;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  BOOL HasForeignKey = HDKeyPathTypeHasForeignKey(*(unsigned __int8 *)(a2 + 16));
  if (v5) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = HasForeignKey;
  }
  if (v7)
  {
    _HKInitializeLogging();
    id v8 = (id)*MEMORY[0x263F098E8];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 48) databaseTable];
      __HDSQLiteEntityEnumerateColumns_block_invoke_cold_1((uint64_t)v4, v9, v11, v8);
    }
  }
  uint64_t v10 = [[_HDSQLiteEntityColumn alloc] initWithName:v4 columnType:*(void *)(a2 + 8) keyPathType:*(unsigned __int8 *)(a2 + 16) foreignKey:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21BFE0970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __HDSQLiteEntityCreateTableSQL_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v5 creationSQL];
  [v3 appendString:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void sub_21BFE0A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __HDSQLiteEntityAllDatabaseColumnNames_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  id v5 = [v3 name];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    BOOL v7 = [v8 name];
    [v6 addObject:v7];
  }
}

void sub_21BFE0B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return NSRequestConcreteImplementation();
}

void sub_21BFE0D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFE0E70(_Unwind_Exception *a1)
{
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

void sub_21BFE0F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFE10CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFE1438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_21BFE1510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFE17AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_21BFE1878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BFE18D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HDCompareBuildVersionStrings()
{
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](v0, "(\\d+)([a-zA-z]+)(\\d+)([a-zA-Z]*)", 0);
}

void sub_21BFE1C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a18) {
    operator delete(a18);
  }
  if (a32) {
    operator delete(a32);
  }
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)(v33 - 128));
  _Unwind_Resume(a1);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    id v5 = a2;
  }
  else {
    id v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100](locale);
  }

  std::locale::~locale(this);
}

BOOL HDSQLiteInstallCustomFunctionsInDatabase(sqlite3 *a1)
{
  if (sqlite3_create_function_v2(a1, (const char *)[(id)HDSQLiteCompareBuildVersionsFunction UTF8String], 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteCompareBuildVersions, 0, 0, 0))
  {
    return 0;
  }
  function_size_t v2 = sqlite3_create_function_v2(a1, (const char *)[(id)HDSQLiteGenerateUUIDFunction UTF8String], 0, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteGenerateUUID, 0, 0, 0);
  BOOL result = 0;
  if (!function_v2)
  {
    if (sqlite3_create_function_v2(a1, (const char *)[(id)HDSQLiteConvertUUIDStringToBlobFunction UTF8String], 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteConvertUUIDString, 0, 0, 0)|| sqlite3_create_function_v2(a1, (const char *)objc_msgSend((id)HDSQLiteConvertBlobToUUIDStringFunction, "UTF8String"), 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteConvertBlobToUUIDString, 0, 0, 0)
      || sqlite3_create_function_v2(a1, (const char *)[(id)HDSQLiteCompareQuantityMetadataValuesFunction UTF8String], 4, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteCompareQuantityMetadataValues, 0, 0, 0))
    {
      return 0;
    }
    return sqlite3_create_function_v2(a1, (const char *)[(id)HDSQLiteMD5Function UTF8String], 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteMD5, 0, 0, 0) == 0;
  }
  return result;
}

void _HDSQLiteCompareBuildVersions(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 2)
  {
    if (sqlite3_value_type(*a3) != 5 && sqlite3_value_type(a3[1]) != 5)
    {
      sqlite3_value_text(*a3);
      sqlite3_value_text(a3[1]);
      HDCompareBuildVersionStrings();
    }
    sqlite3_result_null(a1);
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void _HDSQLiteGenerateUUID(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  v5[2] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F08C38]);
  v5[0] = 0;
  v5[1] = 0;
  [v4 getUUIDBytes:v5];
  sqlite3_result_blob(a1, v5, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void sub_21BFE2050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _HDSQLiteConvertUUIDString(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  if (a2 == 1)
  {
    if (sqlite3_value_type(*a3) == 5)
    {
      sqlite3_result_null(a1);
    }
    else
    {
      id v5 = sqlite3_value_text(*a3);
      size_t v6 = strlen((const char *)v5);
      id v7 = objc_alloc(MEMORY[0x263F08C38]);
      id v8 = (void *)[[NSString alloc] initWithBytes:v5 length:v6 encoding:1];
      uint64_t v9 = (void *)[v7 initWithUUIDString:v8];

      v10[0] = 0;
      v10[1] = 0;
      [v9 getUUIDBytes:v10];
      sqlite3_result_blob(a1, v10, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void sub_21BFE21EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _HDSQLiteConvertBlobToUUIDString(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 1)
  {
    if (sqlite3_value_type(*a3) == 4 && sqlite3_value_bytes(*a3) == 16)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:sqlite3_value_blob(*a3)];
      id v9 = v5;
      if (v5)
      {
        id v6 = [v5 UUIDString];
        id v7 = (const char *)[v6 UTF8String];

        int v8 = strlen(v7);
        sqlite3_result_text(a1, v7, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        sqlite3_result_null(a1);
      }
    }
    else
    {
      sqlite3_result_null(a1);
    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void sub_21BFE2348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _HDSQLiteCompareQuantityMetadataValues(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 4)
  {
    if (sqlite3_value_type(*a3) == 5
      || sqlite3_value_type(a3[1]) == 5
      || sqlite3_value_type(a3[2]) == 5
      || sqlite3_value_type(a3[3]) == 5)
    {
      sqlite3_result_null(a1);
    }
    else
    {
      double v5 = sqlite3_value_double(*a3);
      id v6 = sqlite3_value_text(a3[1]);
      double v7 = sqlite3_value_double(a3[2]);
      int v8 = sqlite3_value_text(a3[3]);
      id v9 = (void *)MEMORY[0x263F0A630];
      uint64_t v10 = (void *)MEMORY[0x263F0A830];
      long long v11 = [NSString stringWithUTF8String:v6];
      uint64_t v12 = [v10 unitFromString:v11];
      id v20 = [v9 quantityWithUnit:v12 doubleValue:v5];

      long long v13 = (void *)MEMORY[0x263F0A630];
      long long v14 = (void *)MEMORY[0x263F0A830];
      id v15 = [NSString stringWithUTF8String:v8];
      id v16 = [v14 unitFromString:v15];
      id v17 = [v13 quantityWithUnit:v16 doubleValue:v7];

      id v18 = [v17 _unit];
      LOBYTE(v13) = [v20 isCompatibleWithUnit:v18];

      if (v13) {
        int v19 = [v20 compare:v17];
      }
      else {
        int v19 = 2;
      }
      sqlite3_result_int(a1, v19);
    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void sub_21BFE25B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _HDSQLiteMD5(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2 == 1)
  {
    if (sqlite3_value_type(*a3) == 5)
    {
      double v5 = 0;
      CC_LONG v6 = 0;
    }
    else
    {
      double v5 = sqlite3_value_blob(*a3);
      CC_LONG v6 = sqlite3_value_bytes(*a3);
    }
    CC_MD5(v5, v6, md);
    sqlite3_result_blob(a1, md, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(void *result, char *a2, char *a3, unint64_t a4)
{
  id v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    BOOL result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    void *v4 = result;
    id v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)id v4 = v10;
    id v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)id v4 = 0;
  return result;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2643D4348, MEMORY[0x263F8C060]);
}

void sub_21BFE281C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](std::regex_traits<char> *a1, const char *a2, int a3)
{
  double v5 = std::regex_traits<char>::regex_traits(a1);
  LODWORD(v5[1].__loc_.__locale_) = a3;
  *(_OWORD *)((char *)&v5[1].__loc_.__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[1].__col_ + 4) = 0u;
  HIDWORD(v5[2].__ct_) = 0;
  strlen(a2);
  std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>();
}

void sub_21BFE29B0(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100](locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  size_t v2 = (const std::locale *)MEMORY[0x21D49F0E0]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x263F8C130]);
  return this;
}

void sub_21BFE2A1C(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>()
{
}

void sub_21BFE2BF0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE2C68(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>(uint64_t a1, uint64_t a2)
{
  std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(&v2, a2);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  end = a1->__end_;
  size_t v7 = a2;
  do
  {
    int v8 = v7;
    size_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2) {
    operator new();
  }
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    uint64_t v9 = a1->__end_;
    char v10 = v8 + 1;
    long long v11 = v8 + 1;
    do
    {
      int v8 = v11;
      long long v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v11, a3);
    }
    while (v11 != v8);
    if (v8 == v10) {
      operator new();
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  size_t v3 = a2;
  if (a2 == a3) {
    return (char *)a2;
  }
  id v4 = (char *)a3;
  if (*a2 == 94)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      CC_LONG v6 = v3;
      size_t v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(this, (char *)v3, v4);
    }
    while (v3 != v6);
    if (v6 != (unsigned __int8 *)v4)
    {
      if (v6 + 1 != (unsigned __int8 *)v4 || *v6 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    }
  }
  return v4;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  size_t v3 = a3;
  end = a1->__end_;
  size_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  int v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124) {
      return (std::basic_regex<char> *)v8;
    }
    uint64_t v9 = a1->__end_;
    char v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, (std::basic_regex<char> *)(v8 + 1), v3);
    if (v10 == v8 + 1) {
      goto LABEL_9;
    }
    int v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(std::basic_regex<char> *a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  end = a1->__end_;
  size_t v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = a3;
  }
  if (v8 == __s) {
    operator new();
  }
  std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, __s, v8);
  while (1)
  {
    long long v11 = v8 == a3 ? v8 : v8 + 1;
    if (v11 == a3) {
      break;
    }
    uint64_t v9 = (unsigned __int8 *)memchr(v11, 10, a3 - v11);
    if (v9) {
      int v8 = v9;
    }
    else {
      int v8 = a3;
    }
    char v10 = a1->__end_;
    if (v8 == v11) {
      operator new();
    }
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, v11, v8);
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v10);
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  end = a1->__end_;
  size_t v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = a3;
  }
  if (v8 == __s) {
    operator new();
  }
  std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, __s, v8);
  while (1)
  {
    long long v11 = v8 == a3 ? v8 : (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    if (v11 == a3) {
      break;
    }
    uint64_t v9 = (std::basic_regex<char> *)memchr(v11, 10, (char *)a3 - (char *)v11);
    if (v9) {
      int v8 = v9;
    }
    else {
      int v8 = a3;
    }
    char v10 = a1->__end_;
    if (v8 == v11) {
      operator new();
    }
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, v11, v8);
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v10);
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE328C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::~__end_state()
{
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_21BFE3334(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D49F120);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
}

{
  std::__node<char> *first;
  uint64_t vars8;

  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }

  JUMPOUT(0x21D49F120);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    end = a1->__end_;
    unsigned int marked_count = a1->__marked_count_;
    uint64_t v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
    {
      size_t v10 = a1->__marked_count_ + 1;
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, v10);
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      BOOL v8 = v6 == 40;
      size_t v7 = a2 + 1;
      BOOL v8 = !v8 || v7 == a3;
      if (!v8)
      {
        BOOL v8 = *v7 == 63;
        uint64_t v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          int v11 = *v9;
          if (v11 == 33)
          {
            std::regex_traits<char>::regex_traits(&v18.__traits_);
            memset(&v18.__flags_, 0, 40);
            v18.__flags_ = this->__flags_;
            uint64_t v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v18, v3 + 3, a3);
            unsigned int marked_count = v18.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v18, 1, this->__marked_count_);
            this->__marked_count_ += marked_count;
            if (v12 == a3 || *v12 != 41) {
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
            }
            goto LABEL_31;
          }
          if (v11 == 61)
          {
            std::regex_traits<char>::regex_traits(&v18.__traits_);
            memset(&v18.__flags_, 0, 40);
            v18.__flags_ = this->__flags_;
            uint64_t v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v18, v3 + 3, a3);
            unsigned int v13 = v18.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v18, 0, this->__marked_count_);
            this->__marked_count_ += v13;
            if (v12 == a3 || *v12 != 41) {
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
            }
LABEL_31:
            uint64_t v3 = v12 + 1;
            std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v18.__traits_.__loc_);
            return v3;
          }
        }
      }
      return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94) {
      return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    return ++v3;
  }
  if (a2 + 1 != a3)
  {
    int v15 = a2[1];
    if (v15 == 66)
    {
      BOOL v16 = 1;
    }
    else
    {
      if (v15 != 98) {
        return v3;
      }
      BOOL v16 = 0;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v16);
    v3 += 2;
  }
  return v3;
}

void sub_21BFE39F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return (unsigned __int8 *)v3;
  }
  int v6 = *a2;
  if (v6 <= 62)
  {
    if (v6 != 40)
    {
      if (v6 == 46) {
        operator new();
      }
      if ((v6 - 42) >= 2) {
        goto LABEL_28;
      }
LABEL_34:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    }
    if (a2 + 1 != a3)
    {
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        p_open_count = &this->__open_count_;
        ++this->__open_count_;
        uint64_t v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
        if (v9 == a3) {
          goto LABEL_35;
        }
        size_t v10 = v9;
        if (*v9 != 41) {
          goto LABEL_35;
        }
        goto LABEL_25;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
      unsigned int marked_count = this->__marked_count_;
      p_open_count = &this->__open_count_;
      ++this->__open_count_;
      uint64_t v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, v3 + 1, a3);
      if (v12 != a3)
      {
        size_t v10 = v12;
        if (*v12 == 41)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, marked_count);
LABEL_25:
          --*p_open_count;
          return (unsigned __int8 *)(v10 + 1);
        }
      }
    }
LABEL_35:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
  if (v6 <= 91)
  {
    if (v6 == 91)
    {
      return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    }
    if (v6 == 63) {
      goto LABEL_34;
    }
LABEL_28:
    return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
  }
  if (v6 != 92)
  {
    if (v6 == 123) {
      goto LABEL_34;
    }
    goto LABEL_28;
  }

  return std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(this, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  if (a2 == a3) {
    return a2;
  }
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  uint64_t v10 = a1;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      unsigned int v13 = a2 + 1;
      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v13 == a3;
      }
      if (!v20 && *v13 == 63)
      {
        unsigned int v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        size_t v14 = 0;
        size_t v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      size_t v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123) {
      return a2;
    }
    int v15 = a2 + 1;
    BOOL v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(a1, a2 + 1, a3, (int *)&__max);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        int v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            unsigned int v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              unsigned int v13 = v16 + 2;
              size_t v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              size_t v18 = (int)__max;
LABEL_33:
              uint64_t v21 = __s;
              BOOL v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            size_t v18 = (int)__max;
LABEL_45:
            uint64_t v21 = __s;
            BOOL v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        float v23 = v16 + 1;
        if (v16 + 1 == a3) {
          goto LABEL_58;
        }
        if (*v23 == 125)
        {
          unsigned int v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            unsigned int v13 = v16 + 3;
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          size_t v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          size_t v18 = -1;
          goto LABEL_45;
        }
        int v27 = -1;
        BOOL v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v10, v23, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          size_t v18 = v27;
          size_t v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            unsigned int v13 = v25 + 1;
            BOOL v22 = 1;
            if (!v11 && v13 != a3)
            {
              int v26 = v25[1];
              BOOL v22 = v26 != 63;
              if (v26 == 63) {
                unsigned int v13 = v25 + 2;
              }
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    unsigned int v13 = a2 + 1;
    if (v11) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v13 == a3;
    }
    if (!v19 && *v13 == 63)
    {
      unsigned int v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    unsigned int v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      unsigned int v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 1;
LABEL_26:
      size_t v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(std::basic_regex<char> *this)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(std::basic_regex<char> *this)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
}

void sub_21BFE417C(_Unwind_Exception *a1)
{
  MEMORY[0x21D49F120](v1, 0x10E1C4030FC3181);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE41E4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A3F0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A3F0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100](uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = &unk_26CC1A438;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(unsigned char *)(a1 + 84) = a3;
  return a1;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CC1A438;
  int v2 = (std::locale *)(a1 + 2);
  int v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::locale::~locale(v2);
  BOOL v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CC1A438;
  int v2 = (std::locale *)(a1 + 2);
  int v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::locale::~locale(v2);
  BOOL v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }

  JUMPOUT(0x21D49F120);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  char v21 = 0;
  memset(&v22, 0, 17);
  char v23 = 0;
  uint64_t v24 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v5 = *(void *)(a2 + 16);
  v18.first = *(const char **)(a2 + 24);
  v18.second = v18.first;
  v18.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v18);
  uint64_t v19 = v5;
  uint64_t v20 = v5;
  char v21 = 0;
  std::vector<std::csub_match>::value_type v22 = v18;
  uint64_t v24 = v5;
  char v23 = 1;
  uint64_t v6 = *(const char **)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v7 = v6 == *(const char **)(a2 + 8);
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    begiuint64_t n = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  begiuint64_t n = __p.__begin_;
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin) {
      return;
    }
    goto LABEL_14;
  }
  int v11 = 0;
  int v12 = *(_DWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a2 + 32);
  unint64_t v14 = 1;
  do
  {
    int v15 = &begin[v14];
    uint64_t v16 = v13 + 24 * (v12 + v11);
    *(std::pair<const char *, const char *> *)uint64_t v16 = v15->std::pair<const char *, const char *>;
    *(unsigned char *)(v16 + 16) = v15->matched;
    unint64_t v14 = (v11 + 2);
    ++v11;
  }
  while (v10 > v14);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_21BFE4A40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::match_results<char const*>::__init(std::match_results<const char *> *this, unsigned int __s, const char *__f, const char *__l, BOOL __no_update_pos)
{
  this->__unmatched_.first = __l;
  p_unmatched = &this->__unmatched_;
  this->__unmatched_.second = __l;
  this->__unmatched_.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&this->__matches_, __s, &this->__unmatched_);
  this->__prefix_.first = __f;
  this->__prefix_.second = __f;
  this->__prefix_.matched = 0;
  this->__suffix_ = *p_unmatched;
  if (!__no_update_pos) {
    this->__position_start_ = __f;
  }
  this->__ready_ = 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  long long v44 = 0;
  long long v45 = 0;
  unint64_t v46 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)id v40 = 0;
    memset(&v40[8], 0, 48);
    *(_OWORD *)std::vector<std::csub_match> __p = 0u;
    memset(v42, 0, 21);
    long long v45 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v44, (uint64_t)v40);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v40[32])
    {
      *(void *)&v40[40] = *(void *)&v40[32];
      operator delete(*(void **)&v40[32]);
    }
    id v38 = a4;
    uint64_t v13 = v45;
    *((_DWORD *)v45 - 24) = 0;
    *((void *)v13 - 11) = a2;
    *((void *)v13 - 10) = a2;
    *((void *)v13 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v13 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v45 - 40), *(unsigned int *)(a1 + 32));
    unint64_t v14 = v45;
    *((void *)v45 - 2) = v6;
    id v39 = a3;
    signed int v15 = a3 - a2;
    *((_DWORD *)v14 - 2) = a5;
    *((unsigned char *)v14 - 4) = a6;
    unsigned int v16 = 1;
    while (2)
    {
      if ((v16 & 0xFFF) != 0 || (int)(v16 >> 12) < v15)
      {
        std::vector<std::csub_match>::value_type v18 = v14 - 1;
        uint64_t v17 = *((void *)v14 - 2);
        uint64_t v19 = v14 - 6;
        if (v17) {
          (*(void (**)(uint64_t, _OWORD *))(*(void *)v17 + 16))(v17, v14 - 6);
        }
        switch(*(_DWORD *)v19)
        {
          case 0xFFFFFC18:
            uint64_t v20 = (const char *)*((void *)v14 - 10);
            if ((a5 & 0x20) != 0 && v20 == a2 || (a5 & 0x1000) != 0 && v20 != v39) {
              goto LABEL_16;
            }
            uint64_t v29 = *v38;
            *(void *)uint64_t v29 = a2;
            *(void *)(v29 + 8) = v20;
            *(unsigned char *)(v29 + 16) = 1;
            uint64_t v30 = *((void *)v14 - 8);
            uint64_t v31 = *((void *)v14 - 7) - v30;
            if (v31)
            {
              unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * (v31 >> 3);
              uint64_t v33 = (unsigned char *)(v30 + 16);
              unsigned int v34 = 1;
              do
              {
                uint64_t v35 = v29 + 24 * v34;
                *(_OWORD *)uint64_t v35 = *((_OWORD *)v33 - 1);
                char v36 = *v33;
                v33 += 24;
                *(unsigned char *)(v35 + 16) = v36;
              }
              while (v32 > v34++);
            }
            uint64_t v27 = 1;
            goto LABEL_25;
          case 0xFFFFFC1D:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            goto LABEL_23;
          case 0xFFFFFC1F:
LABEL_16:
            char v21 = v45 - 6;
            std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)v45 - 12);
            long long v45 = v21;
            goto LABEL_23;
          case 0xFFFFFC20:
            long long v22 = *(v14 - 5);
            *(_OWORD *)id v40 = *v19;
            *(_OWORD *)&v40[16] = v22;
            memset(&v40[32], 0, 24);
            std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v40[32], *((long long **)v14 - 8), *((long long **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v42[0] = 0;
            std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v14 - 5), *((long long **)v14 - 4), (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
            uint64_t v23 = *v18;
            *(void *)((char *)&v42[1] + 5) = *(void *)((char *)v14 - 11);
            v42[1] = v23;
            (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v18 + 24))(*v18, 1, v14 - 6);
            (*(void (**)(void, void, unsigned char *))(*(void *)v42[1] + 24))(v42[1], 0, v40);
            uint64_t v24 = v45;
            if ((unint64_t)v45 >= v46)
            {
              long long v45 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v44, (uint64_t)v40);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v25 = *(_OWORD *)&v40[16];
              *long long v45 = *(_OWORD *)v40;
              v24[1] = v25;
              *((void *)v24 + 4) = 0;
              *((void *)v24 + 5) = 0;
              *((void *)v24 + 6) = 0;
              *((void *)v24 + 7) = 0;
              v24[2] = *(_OWORD *)&v40[32];
              *((void *)v24 + 6) = *(void *)&v40[48];
              memset(&v40[32], 0, 24);
              *((void *)v24 + 8) = 0;
              *((void *)v24 + 9) = 0;
              *(_OWORD *)((char *)v24 + 56) = *(_OWORD *)__p;
              *((void *)v24 + 9) = v42[0];
              __p[0] = 0;
              __p[1] = 0;
              v42[0] = 0;
              uint64_t v26 = v42[1];
              *(void *)((char *)v24 + 85) = *(void *)((char *)&v42[1] + 5);
              *((void *)v24 + 10) = v26;
              long long v45 = v24 + 6;
            }
            if (*(void *)&v40[32])
            {
              *(void *)&v40[40] = *(void *)&v40[32];
              operator delete(*(void **)&v40[32]);
            }
LABEL_23:
            unint64_t v14 = v45;
            ++v16;
            if (v44 == v45) {
              goto LABEL_24;
            }
            continue;
          default:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
        }
      }
      break;
    }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
  }
LABEL_24:
  uint64_t v27 = 0;
LABEL_25:
  *(void *)id v40 = &v44;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
  return v27;
}

void sub_21BFE4EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  std::__state<char>::~__state(&a11);
  a11 = v16 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  value = this->__end_cap_.__value_;
  begiuint64_t n = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    std::vector<std::csub_match>::pointer end = this->__end_;
    std::vector<std::csub_match>::size_type v16 = end - begin;
    if (v16 >= __n) {
      std::vector<std::csub_match>::size_type v17 = __n;
    }
    else {
      std::vector<std::csub_match>::size_type v17 = end - begin;
    }
    if (v17)
    {
      std::vector<std::csub_match>::value_type v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      uint64_t v19 = &end[__n - v16];
      std::vector<std::csub_match>::size_type v20 = 24 * __n - 24 * v16;
      do
      {
        std::pair<const char *, const char *> v21 = __u->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    std::vector<std::csub_match>::size_type v9 = 2 * v8;
    if (2 * v8 <= __n) {
      std::vector<std::csub_match>::size_type v9 = __n;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    std::vector<std::csub_match>::pointer v11 = this->__end_;
    int v12 = &v11[__n];
    std::vector<std::csub_match>::size_type v13 = 24 * __n;
    do
    {
      std::pair<const char *, const char *> v14 = __u->std::pair<const char *, const char *>;
      *(void *)&v11->matched = *(void *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void *std::__state<char>::~__state(void *a1)
{
  int v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  int v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::size_type v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  BOOL v4 = __sz >= v3;
  std::vector<std::csub_match>::size_type v5 = __sz - v3;
  if (v5 != 0 && v4)
  {
    std::vector<std::sub_match<char const*>>::__append(this, v5, __x);
  }
  else if (!v4)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(this, __sz - v2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE5248(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE52A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  std::vector<std::csub_match>::pointer v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)std::vector<std::csub_match>::pointer v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *((void *)v11 + 7) = 0;
  *((void *)v11 + 8) = 0;
  *((void *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  std::vector<std::__state<char>>::__swap_out_circular_buffer(a1, v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<std::__state<char>>::~__split_buffer((uint64_t)v16);
  return v14;
}

void sub_21BFE53F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::__state<char>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<std::__state<char>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(96 * a2);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      long long v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 80) = v10;
      *(void *)(v8 - 56) = 0;
      *(void *)(v8 - 48) = 0;
      *(void *)(v8 - 64) = 0;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(void *)(v8 - 48) = *(void *)(a3 + v7 - 48);
      *(void *)(v9 - 64) = 0;
      *(void *)(v9 - 56) = 0;
      *(void *)(v9 - 48) = 0;
      *(void *)(v8 - 40) = 0;
      *(void *)(v8 - 32) = 0;
      *(void *)(v8 - 24) = 0;
      __n128 result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 40) = result;
      *(void *)(v8 - 24) = *(void *)(a3 + v7 - 24);
      *(void *)(v9 - 40) = 0;
      *(void *)(v9 - 32) = 0;
      *(void *)(v9 - 24) = 0;
      uint64_t v12 = *(void *)(a3 + v7 - 16);
      *(void *)(v8 - 11) = *(void *)(a3 + v7 - 11);
      *(void *)(v8 - 16) = v12;
      v7 -= 96;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<std::__state<char>,0>(void *a1)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

uint64_t std::__split_buffer<std::__state<char>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 96;
    std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)(i - 96));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  uint64_t v7 = value;
  uint64_t v9 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v9) >> 3) >= __n)
  {
    if (__n)
    {
      signed int v15 = &v9[__n];
      std::vector<std::csub_match>::size_type v16 = 24 * __n;
      do
      {
        std::pair<const char *, const char *> v17 = __x->std::pair<const char *, const char *>;
        *(void *)&v9->matched = *(void *)&__x->matched;
        v9->std::pair<const char *, const char *> = v17;
        ++v9;
        v16 -= 24;
      }
      while (v16);
      uint64_t v9 = v15;
    }
    this->__end_ = v9;
  }
  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)this->__begin_) >> 3);
    unint64_t v11 = v10 + __n;
    if (v10 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    std::vector<std::csub_match>::value_type v18 = (std::sub_match<const char *> *)&v14[24 * v10];
    uint64_t v19 = &v18[__n];
    std::vector<std::csub_match>::size_type v20 = 24 * __n;
    std::pair<const char *, const char *> v21 = v18;
    do
    {
      std::pair<const char *, const char *> v22 = __x->std::pair<const char *, const char *>;
      v21[1].first = *(const char **)&__x->matched;
      std::pair<const char *, const char *> *v21 = v22;
      std::pair<const char *, const char *> v21 = (std::pair<const char *, const char *> *)((char *)v21 + 24);
      v20 -= 24;
    }
    while (v20);
    uint64_t v23 = (std::sub_match<const char *> *)&v14[24 * v13];
    begiuint64_t n = this->__begin_;
    std::vector<std::csub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<const char *, const char *> v26 = end[-1].std::pair<const char *, const char *>;
        *(void *)&v18[-1].matched = *(void *)&end[-1].matched;
        v18[-1].std::pair<const char *, const char *> = v26;
        --v18;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v23;
    if (end)
    {
      operator delete(end);
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  uint64_t v5 = value;
  uint64_t v7 = p_end_cap[-1].__value_;
  if (__n <= value - v7)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 16 * __n);
      v7 += __n;
    }
    this->__end_ = v7;
  }
  else
  {
    uint64_t v8 = (char *)v7 - (char *)this->__begin_;
    unint64_t v9 = __n + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = (char *)v5 - (char *)this->__begin_;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)p_end_cap, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    uint64_t v14 = (std::pair<unsigned long, const char *> *)&v13[16 * v10];
    signed int v15 = (std::pair<unsigned long, const char *> *)&v13[16 * v12];
    bzero(v14, 16 * __n);
    std::vector<std::csub_match>::size_type v16 = &v14[__n];
    begiuint64_t n = this->__begin_;
    std::vector<std::csub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v14[-1] = end[-1];
        --v14;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v14;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
    {
      operator delete(end);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_21BFE593C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_21BFE59B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  __n128 result = std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(a1, a2 + 1, a3);
  if (result == v5)
  {
    __n128 result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      __n128 result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2 + 1, a3, 0);
      if (result == v5) {
        return a2;
      }
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    uint64_t v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if (v5 == a3) {
      goto LABEL_20;
    }
    uint64_t v7 = (uint64_t *)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if (v5 == a3) {
      goto LABEL_20;
    }
    do
    {
      long long v8 = v5;
      uint64_t v5 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(a1, v5, a3, v7);
    }
    while (v5 != v8);
    if (v8 == a3) {
      goto LABEL_20;
    }
    if (*v8 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93) {
LABEL_20:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v8 + 1;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  if ((this->__flags_ & 2) == 0) {
    operator new();
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  if ((this->__flags_ & 2) == 0) {
    operator new();
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE5D90(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(std::basic_regex<char> *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = (char)*a2;
    BOOL v5 = (v4 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      ++v3;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE5F54(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v4 = *a2;
  unsigned int v5 = v4 - 48;
  if (v4 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
    return a2 + 1;
  }
  if ((v4 - 49) > 8) {
    return a2;
  }
  uint64_t v6 = a3;
  uint64_t v7 = a2 + 1;
  if (a2 + 1 != a3)
  {
    while (1)
    {
      int v8 = *v7;
      if ((v8 - 48) > 9) {
        break;
      }
      if (v5 >= 0x19999999) {
        goto LABEL_16;
      }
      ++v7;
      unsigned int v5 = v8 + 10 * v5 - 48;
      if (v7 == a3) {
        goto LABEL_12;
      }
    }
    uint64_t v6 = v7;
LABEL_12:
    if (!v5) {
      goto LABEL_16;
    }
  }
  if (v5 > a1->__marked_count_) {
LABEL_16:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(a1, v5);
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (v4 == 115)
    {
      BOOL v9 = 0;
      goto LABEL_17;
    }
    if (v4 != 100) {
      return v3;
    }
    BOOL v6 = 0;
LABEL_12:
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v6);
    int v8 = started->__mask_ | 0x400;
LABEL_18:
    started->__mask_ = v8;
    goto LABEL_19;
  }
  switch(v4)
  {
    case 'D':
      BOOL v6 = 1;
      goto LABEL_12;
    case 'S':
      BOOL v9 = 1;
LABEL_17:
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v9);
      int v8 = started->__mask_ | 0x4000;
      goto LABEL_18;
    case 'W':
      BOOL v5 = 1;
LABEL_15:
      uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v5);
      v10->__mask_ |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v10, 95);
LABEL_19:
      ++v3;
      break;
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 != a3)
  {
    uint64_t v5 = *a2;
    std::basic_regex<char>::value_type v6 = v5;
    if ((char)v5 > 109)
    {
      char v7 = 0;
      switch((char)v5)
      {
        case 'n':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 10;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v18 = 10;
          goto LABEL_81;
        case 'r':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 13;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v18 = 13;
          goto LABEL_81;
        case 't':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 9;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v18 = 9;
          goto LABEL_81;
        case 'u':
          if (v4 + 1 == a3) {
            goto LABEL_91;
          }
          int v8 = v4[1];
          if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 && (v8 | 0x20u) - 97 >= 6) {
            goto LABEL_91;
          }
          v4 += 2;
          if (v4 == a3) {
            goto LABEL_91;
          }
          int v9 = *v4;
          char v10 = -48;
          if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38) {
            goto LABEL_28;
          }
          v9 |= 0x20u;
          if ((v9 - 97) >= 6) {
            goto LABEL_91;
          }
          char v10 = -87;
LABEL_28:
          char v7 = 16 * (v10 + v9);
LABEL_29:
          if (v4 + 1 == a3) {
            goto LABEL_91;
          }
          int v11 = v4[1];
          char v12 = -48;
          if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38) {
            goto LABEL_34;
          }
          v11 |= 0x20u;
          if ((v11 - 97) >= 6) {
            goto LABEL_91;
          }
          char v12 = -87;
LABEL_34:
          if (v4 + 2 == a3) {
            goto LABEL_91;
          }
          int v13 = v4[2];
          char v14 = -48;
          if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38) {
            goto LABEL_39;
          }
          v13 |= 0x20u;
          if ((v13 - 97) >= 6) {
            goto LABEL_91;
          }
          char v14 = -87;
LABEL_39:
          std::basic_regex<char>::value_type v15 = v14 + v13 + 16 * (v12 + v11 + v7);
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((unsigned char *)a4 + 23) = 1;
            }
            *(unsigned char *)a4 = v15;
            *((unsigned char *)a4 + 1) = 0;
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v15);
          }
          v4 += 3;
          return v4;
        case 'v':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 11;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v18 = 11;
          break;
        case 'x':
          goto LABEL_29;
        default:
          goto LABEL_53;
      }
      goto LABEL_81;
    }
    if ((char)v5 == 48)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return ++v4;
      }
      std::basic_regex<char>::value_type v6 = 0;
      goto LABEL_69;
    }
    if ((char)v5 != 99)
    {
      if ((char)v5 == 102)
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v18 = 12;
LABEL_81:
          *(_WORD *)a4 = v18;
          return ++v4;
        }
        std::basic_regex<char>::value_type v6 = 12;
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return ++v4;
      }
LABEL_53:
      if ((char)v5 != 95 && ((char)v5 < 0 || (a1->__traits_.__ct_->__tab_[v5] & 0x500) == 0))
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          *(unsigned char *)a4 = v5;
          *((unsigned char *)a4 + 1) = 0;
          return ++v4;
        }
        goto LABEL_69;
      }
LABEL_91:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if (v4 + 1 == a3) {
      goto LABEL_91;
    }
    unsigned __int8 v16 = v4[1];
    if (((v16 & 0xDF) - 65) > 0x19u) {
      goto LABEL_91;
    }
    std::basic_regex<char>::value_type v17 = v16 & 0x1F;
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v17;
      *((unsigned char *)a4 + 1) = 0;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
    }
    v4 += 2;
  }
  return v4;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

void sub_21BFE6620(_Unwind_Exception *a1)
{
  MEMORY[0x21D49F120](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE6688(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26CC1A4C8;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  return a1;
}

void sub_21BFE6860(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  uint64_t v4 = (uint64_t)v1[1];
  if (v4) {
    std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A4C8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A4C8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        __n128 result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A510;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A510;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A5A0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A5A0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        __n128 result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A5E8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CC1A5E8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        __n128 result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (__n128 result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v10;
  return result;
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
}

void sub_21BFE7374(_Unwind_Exception *a1)
{
  MEMORY[0x21D49F120](v1, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0;
        }
        std::vector<std::csub_match>::size_type v20 = &v8[(void)v12];
        std::pair<const char *, const char *> v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          std::pair<const char *, const char *> v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unsigned int v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      long long v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0;
        }
        std::vector<std::csub_match>::size_type v20 = &v25[(void)v12];
        std::pair<const char *, const char *> v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          uint64_t v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *unsigned int v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  std::basic_regex<char>::value_type v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0;
  }
  std::vector<std::csub_match>::size_type v20 = &v15[(void)v12];
  std::pair<const char *, const char *> v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v16, v11);
  std::locale::name(&v17, &v16);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    unint64_t v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unint64_t v13 = &v17;
    }
    BOOL v14 = v13->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
LABEL_9:
    }
      operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v16);
  *(unsigned char *)(a1 + 171) = v14;
  return a1;
}

void sub_21BFE772C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  std::basic_regex<char>::value_type v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  std::locale v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  std::string v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  void *v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);

  JUMPOUT(0x21D49F120);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v18 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_155;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_27;
  }
  signed __int8 v6 = *current;
  unsigned __int8 v86 = *current;
  signed __int8 v7 = current[1];
  unsigned __int8 v87 = v7;
  if (this->__icase_)
  {
    unsigned __int8 v86 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    unsigned __int8 v87 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  std::regex_traits<char>::__lookup_collatename<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  if ((v85 & 0x80000000) == 0)
  {
    if (v85) {
      goto LABEL_8;
    }
LABEL_27:
    BOOL negate = 0;
    uint64_t v18 = 1;
    goto LABEL_28;
  }
  size_t v19 = v84;
  operator delete(__p);
  if (!v19) {
    goto LABEL_27;
  }
LABEL_8:
  begiuint64_t n = this->__digraphs_.__begin_;
  uint64_t v9 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v9)
  {
    uint64_t v10 = v9 >> 1;
    if ((unint64_t)(v9 >> 1) <= 1) {
      uint64_t v10 = 1;
    }
    p_second = &begin->second;
    do
    {
      if (v86 == *(p_second - 1) && v87 == *p_second) {
        goto LABEL_152;
      }
      p_second += 2;
      --v10;
    }
    while (v10);
  }
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v88);
    unint64_t v13 = this->__ranges_.__begin_;
    if (this->__ranges_.__end_ == v13)
    {
LABEL_24:
      BOOL negate = 0;
      int v17 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v13[v14].first.__r_.__value_.__r.__words, &__p) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, (void **)&this->__ranges_.__begin_[v14].second.__r_.__value_.__l.__data_) << 24) >= 0x1000000)
      {
        ++v15;
        unint64_t v13 = this->__ranges_.__begin_;
        ++v14;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * (((char *)this->__ranges_.__end_ - (char *)v13) >> 4)) {
          goto LABEL_24;
        }
      }
      BOOL negate = 1;
      int v17 = 5;
    }
    if (v85 < 0) {
      operator delete(__p);
    }
    if (negate) {
      goto LABEL_129;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_134;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  std::vector<std::string>::pointer v54 = this->__equivalences_.__begin_;
  uint64_t v55 = v85;
  int64_t v56 = (char *)this->__equivalences_.__end_ - (char *)v54;
  if (v56)
  {
    uint64_t v57 = 0;
    unint64_t v58 = v56 / 24;
    uint64_t v60 = __p;
    size_t v59 = v84;
    if (v85 >= 0) {
      size_t v61 = v85;
    }
    else {
      size_t v61 = v84;
    }
    if (v58 <= 1) {
      uint64_t v62 = 1;
    }
    else {
      uint64_t v62 = v56 / 24;
    }
    BOOL v63 = 1;
    while (1)
    {
      v64 = &v54[v57];
      std::string::size_type size = HIBYTE(v64->__r_.__value_.__r.__words[2]);
      int v66 = (char)size;
      if ((size & 0x80u) != 0) {
        std::string::size_type size = v64->__r_.__value_.__l.__size_;
      }
      if (v61 == size)
      {
        if (v66 >= 0) {
          v67 = &v54[v57];
        }
        else {
          v67 = (std::string *)v64->__r_.__value_.__r.__words[0];
        }
        if ((v55 & 0x80) == 0)
        {
          if (v55)
          {
            p_p = &__p;
            uint64_t v69 = v55;
            do
            {
              if (*(unsigned __int8 *)p_p != v67->__r_.__value_.__s.__data_[0]) {
                goto LABEL_122;
              }
              p_p = (void **)((char *)p_p + 1);
              v67 = (std::string *)((char *)v67 + 1);
              --v69;
            }
            while (v69);
            BOOL negate = 1;
            int v17 = 5;
            goto LABEL_126;
          }
          BOOL negate = 1;
          if (v63) {
            goto LABEL_154;
          }
LABEL_134:
          if ((char)v86 < 0)
          {
            neg_masuint64_t k = this->__neg_mask_;
            goto LABEL_147;
          }
          masuint64_t k = this->__mask_;
          tab = this->__traits_.__ct_->__tab_;
          std::ctype_base::mask v73 = tab[v86];
          if ((v73 & mask) == 0 && (v86 != 95 || (mask & 0x80) == 0)
            || (char)v87 < 0
            || (tab[v87] & mask) == 0 && ((mask & 0x80) == 0 || v87 != 95))
          {
            neg_masuint64_t k = this->__neg_mask_;
            if ((v73 & neg_mask) != 0 || v86 == 95 && (neg_mask & 0x80) != 0)
            {
LABEL_151:
              int v75 = negate;
              goto LABEL_153;
            }
LABEL_147:
            if (((char)v87 & 0x80000000) == 0)
            {
              if ((this->__traits_.__ct_->__tab_[v87] & neg_mask) != 0) {
                goto LABEL_151;
              }
              int v75 = 1;
              if (v87 == 95 && (neg_mask & 0x80) != 0) {
                goto LABEL_151;
              }
LABEL_153:
              BOOL negate = v75;
LABEL_154:
              uint64_t v18 = 2;
              goto LABEL_155;
            }
          }
LABEL_152:
          int v75 = 1;
          goto LABEL_153;
        }
        unint64_t v80 = v58;
        uint64_t v82 = v55;
        int v70 = memcmp(v60, v67, v59);
        unint64_t v58 = v80;
        uint64_t v55 = v82;
        if (!v70) {
          break;
        }
      }
LABEL_122:
      BOOL v63 = ++v57 < v58;
      if (v57 == v62) {
        goto LABEL_125;
      }
    }
    int v17 = 5;
    BOOL negate = 1;
    goto LABEL_127;
  }
  BOOL v63 = 0;
LABEL_125:
  int v17 = 0;
LABEL_126:
  if ((v55 & 0x80) != 0) {
LABEL_127:
  }
    operator delete(__p);
  if (!v63) {
    goto LABEL_134;
  }
LABEL_129:
  if (v17) {
    goto LABEL_154;
  }
  uint64_t v18 = 2;
LABEL_28:
  unsigned __int8 v20 = *a2->__current_;
  unsigned __int8 v86 = v20;
  if (this->__icase_)
  {
    unsigned __int8 v20 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v20);
    unsigned __int8 v86 = v20;
  }
  std::vector<char>::pointer v21 = this->__chars_.__begin_;
  unint64_t v22 = this->__chars_.__end_ - v21;
  if (v22)
  {
    if (v22 <= 1) {
      unint64_t v22 = 1;
    }
    while (1)
    {
      int v23 = *v21++;
      if (v23 == v20) {
        break;
      }
      if (!--v22) {
        goto LABEL_35;
      }
    }
LABEL_46:
    BOOL negate = 1;
    goto LABEL_155;
  }
LABEL_35:
  std::regex_traits<char>::char_class_type v24 = this->__neg_mask_;
  if (v24 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v20 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v20] & v24) == 0) {
      int v25 = (v20 == 95) & (v24 >> 7);
    }
    else {
      LOBYTE(v25) = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v27 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v20, end - this->__neg_chars_.__begin_);
    size_t v28 = v27 ? v27 : end;
    if ((v25 & 1) == 0 && v28 == end) {
      goto LABEL_46;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v29 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v30 = this->__ranges_.__end_;
  if (v29 != v30)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v87);
      std::vector<std::pair<std::string, std::string>>::pointer v29 = this->__ranges_.__begin_;
      std::vector<std::pair<std::string, std::string>>::pointer v30 = this->__ranges_.__end_;
    }
    else
    {
      char v85 = 1;
      LOWORD(__p) = v20;
    }
    if (v30 == v29)
    {
LABEL_57:
      char v33 = 0;
    }
    else
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v29[v31].first.__r_.__value_.__r.__words, &__p) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, (void **)&this->__ranges_.__begin_[v31].second.__r_.__value_.__l.__data_) << 24) >= 0x1000000)
      {
        ++v32;
        std::vector<std::pair<std::string, std::string>>::pointer v29 = this->__ranges_.__begin_;
        ++v31;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * (((char *)this->__ranges_.__end_ - (char *)v29) >> 4)) {
          goto LABEL_57;
        }
      }
      char v33 = 1;
      BOOL negate = 1;
    }
    if (v85 < 0) {
      operator delete(__p);
    }
    if (v33) {
      goto LABEL_155;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_90;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v87, (uint64_t)&__p);
  std::vector<std::string>::pointer v34 = this->__equivalences_.__begin_;
  uint64_t v35 = v85;
  int64_t v36 = (char *)this->__equivalences_.__end_ - (char *)v34;
  if (v36)
  {
    uint64_t v81 = v18;
    uint64_t v37 = 0;
    unint64_t v38 = v36 / 24;
    id v39 = __p;
    size_t v40 = v84;
    if (v85 >= 0) {
      size_t v41 = v85;
    }
    else {
      size_t v41 = v84;
    }
    if (v38 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v36 / 24;
    }
    BOOL v43 = 1;
    while (1)
    {
      long long v44 = &v34[v37];
      std::string::size_type v45 = HIBYTE(v44->__r_.__value_.__r.__words[2]);
      int v46 = (char)v45;
      if ((v45 & 0x80u) != 0) {
        std::string::size_type v45 = v44->__r_.__value_.__l.__size_;
      }
      if (v41 == v45)
      {
        if (v46 >= 0) {
          v47 = &v34[v37];
        }
        else {
          v47 = (std::string *)v44->__r_.__value_.__r.__words[0];
        }
        if ((v35 & 0x80) != 0)
        {
          BOOL v79 = negate;
          size_t v50 = v41;
          uint64_t v78 = v34;
          int v51 = memcmp(v39, v47, v40);
          std::vector<std::string>::pointer v34 = v78;
          size_t v41 = v50;
          BOOL negate = v79;
          if (!v51)
          {
            BOOL negate = 1;
            uint64_t v18 = v81;
            goto LABEL_88;
          }
        }
        else
        {
          if (!v35)
          {
            BOOL negate = 1;
            uint64_t v18 = v81;
            if (!v43) {
              goto LABEL_90;
            }
            goto LABEL_155;
          }
          v48 = &__p;
          uint64_t v49 = v35;
          while (*(unsigned __int8 *)v48 == v47->__r_.__value_.__s.__data_[0])
          {
            v48 = (void **)((char *)v48 + 1);
            v47 = (std::string *)((char *)v47 + 1);
            if (!--v49)
            {
              BOOL negate = 1;
              goto LABEL_85;
            }
          }
        }
      }
      BOOL v43 = ++v37 < v38;
      if (v37 == v42)
      {
LABEL_85:
        uint64_t v18 = v81;
        if ((v35 & 0x80) == 0) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
    }
  }
  BOOL v43 = 0;
  if (v85 < 0) {
LABEL_88:
  }
    operator delete(__p);
LABEL_89:
  if (!v43)
  {
LABEL_90:
    if ((char)v86 < 0) {
      goto LABEL_155;
    }
    std::regex_traits<char>::char_class_type v52 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v86] & v52) == 0)
    {
      int v53 = (v52 >> 7) & 1;
      if (v86 != 95) {
        int v53 = 0;
      }
      if (v53 != 1) {
        goto LABEL_155;
      }
    }
    goto LABEL_46;
  }
LABEL_155:
  if (negate == this->__negate_)
  {
    first = 0;
    int v77 = -993;
  }
  else
  {
    a2->__current_ += v18;
    first = this->__first_;
    int v77 = -995;
  }
  a2->__do_ = v77;
  a2->__node_ = first;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  char v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  signed __int8 v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  signed __int8 v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, char *a2, char *a3)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_21BFE8318(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__lookup_collatename<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_21BFE84B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_21BFE85D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE8638(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  unsigned int v9 = 0;
  uint64_t v10 = 0;
  long long v31 = 0uLL;
  uint64_t v32 = 0;
  if (a2 + 1 != a3 && v5 == 91)
  {
    int v11 = a2[1];
    switch(v11)
    {
      case '.':
        unint64_t v4 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, a2 + 2, a3, (uint64_t)&v31);
        unsigned int v9 = HIBYTE(v32);
        uint64_t v10 = *((void *)&v31 + 1);
        break;
      case ':':
        uint64_t v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        uint64_t v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(a1, a2 + 2, a3, a4);
LABEL_11:
        uint64_t v6 = v12;
        char v13 = 0;
        goto LABEL_44;
      default:
        uint64_t v10 = 0;
        unsigned int v9 = 0;
        break;
    }
  }
  int v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0) {
    uint64_t v10 = v9;
  }
  if (v10)
  {
    unint64_t v15 = v4;
    goto LABEL_28;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    int v16 = *v4;
    if (v16 == 92)
    {
      uint64_t v17 = v4 + 1;
      if (v14) {
        uint64_t v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v17, a3, (uint64_t *)&v31);
      }
      else {
        uint64_t v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      }
      unint64_t v15 = v18;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v16) = *v4;
  }
  if ((v9 & 0x80) != 0)
  {
    size_t v19 = (long long *)v31;
    *((void *)&v31 + 1) = 1;
  }
  else
  {
    HIBYTE(v32) = 1;
    size_t v19 = &v31;
  }
  *(unsigned char *)size_t v19 = v16;
  *((unsigned char *)v19 + 1) = 0;
  unint64_t v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (int v20 = *v15, v20 == 93)
    || (std::vector<char>::pointer v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((void *)&v31 + 1))
      {
        if (*((void *)&v31 + 1) != 1)
        {
          unint64_t v22 = (char *)v31;
LABEL_42:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v6, *v22, v22[1]);
          goto LABEL_43;
        }
        unint64_t v22 = (char *)v31;
        goto LABEL_40;
      }
    }
    else if (HIBYTE(v32))
    {
      unint64_t v22 = (char *)&v31;
      if (HIBYTE(v32) != 1) {
        goto LABEL_42;
      }
LABEL_40:
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v6, *v22);
    }
LABEL_43:
    char v13 = 1;
    unint64_t v4 = v15;
    goto LABEL_44;
  }
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  unint64_t v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    uint64_t v24 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    unint64_t v4 = (char *)v24;
    goto LABEL_61;
  }
  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if (v21 == 92)
    {
      if (v14) {
        uint64_t v24 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v15 + 2, a3, (uint64_t *)v29);
      }
      else {
        uint64_t v24 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      }
      goto LABEL_60;
    }
  }
  else
  {
    LOBYTE(v21) = *v21;
  }
  HIBYTE(v30) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)std::vector<char>::pointer v27 = v31;
  uint64_t v28 = v32;
  uint64_t v32 = 0;
  long long v31 = 0uLL;
  *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v29;
  uint64_t v26 = v30;
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
  char v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0) {
    operator delete((void *)v31);
  }
  if (v13) {
    return v4;
  }
  return (char *)v6;
}

void sub_21BFE89C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  for (uint64_t i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_33;
    }
  }
  if (&a2[i] == a3) {
LABEL_33:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char *>(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    uint64_t v8 = v19;
    if (v19)
    {
      unsigned int v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  uint64_t v8 = v18;
  if (!v18) {
    goto LABEL_34;
  }
  unsigned int v9 = (char *)v17;
LABEL_14:
  std::regex_traits<char>::__transform_primary<char *>(a1, v9, &v9[v8], (uint64_t)__p);
  unint64_t v10 = v16;
  if ((v16 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (v10)
  {
    std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](a4, (long long *)__p);
  }
  else
  {
    uint64_t v11 = v19;
    if ((v19 & 0x80u) != 0) {
      uint64_t v11 = v18;
    }
    if (v11 == 2)
    {
      char v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        char v13 = (char *)v17;
      }
      std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      }
      uint64_t v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        uint64_t v12 = (char *)v17;
      }
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v19 < 0) {
    operator delete(v17);
  }
  return (uint64_t)&a2[i + 2];
}

void sub_21BFE8BC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  for (uint64_t i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_11;
    }
  }
  if (&a2[i] == a3) {
LABEL_11:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  int v7 = std::regex_traits<char>::__lookup_classname<char const*>(a1, a2, &a2[i], *(unsigned char *)(a1 + 24) & 1);
  if (!v7) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
  }
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }
  if (&a2[i] == a3) {
LABEL_15:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char *>(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v10;
  unint64_t v7 = v11;
  *(void *)(a4 + 16) = v11;
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  int v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          goto LABEL_25;
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
        return a2 + 1;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v6 != 100) {
        goto LABEL_25;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v6 == 68)
    {
      int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }
    goto LABEL_25;
  }
  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }
  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
    return a2 + 1;
  }
LABEL_25:

  return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_80:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  int v5 = *a2;
  std::basic_regex<char>::value_type v6 = *a2;
  if (v5 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 10;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 10;
        goto LABEL_77;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 13;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 13;
        goto LABEL_77;
      case 't':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 9;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 9;
        goto LABEL_77;
      case 'v':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 11;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 11;
        goto LABEL_77;
      default:
        if (v5 == 98)
        {
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((unsigned char *)a4 + 23) = 1;
            }
            __int16 v13 = 8;
            goto LABEL_77;
          }
          std::basic_regex<char>::value_type v7 = 8;
        }
        else
        {
          if (v5 != 102) {
            goto LABEL_25;
          }
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((unsigned char *)a4 + 23) = 1;
            }
            __int16 v13 = 12;
            goto LABEL_77;
          }
          std::basic_regex<char>::value_type v7 = 12;
        }
        break;
    }
LABEL_62:
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
    return a2 + 1;
  }
  if (v5 > 91)
  {
    if (v5 == 92)
    {
LABEL_16:
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v6;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      std::basic_regex<char>::value_type v7 = *a2;
      goto LABEL_62;
    }
    if (v5 != 97) {
      goto LABEL_25;
    }
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      __int16 v13 = 7;
LABEL_77:
      *(_WORD *)a4 = v13;
      return a2 + 1;
    }
    std::basic_regex<char>::value_type v7 = 7;
    goto LABEL_62;
  }
  if (v5 == 34 || v5 == 47) {
    goto LABEL_16;
  }
LABEL_25:
  if ((v6 & 0xF8) != 0x30) {
    goto LABEL_80;
  }
  std::basic_regex<char>::value_type v8 = v5 - 48;
  unsigned int v9 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v9 & 0xF8) != 0x30) {
      goto LABEL_49;
    }
    std::basic_regex<char>::value_type v8 = *v9 + 8 * v8 - 48;
    if (a2 + 2 != a3)
    {
      char v10 = a2[2];
      int v11 = v10 & 0xF8;
      std::basic_regex<char>::value_type v12 = v10 + 8 * v8 - 48;
      if (v11 == 48) {
        unsigned int v9 = a2 + 3;
      }
      else {
        unsigned int v9 = a2 + 2;
      }
      if (v11 == 48) {
        std::basic_regex<char>::value_type v8 = v12;
      }
      goto LABEL_49;
    }
  }
  unsigned int v9 = a3;
LABEL_49:
  if (a4)
  {
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    *(unsigned char *)a4 = v8;
    *((unsigned char *)a4 + 1) = 0;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v8);
  }
  return v9;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a2;
  if (*(unsigned char *)(a1 + 170))
  {
    if (*(unsigned char *)(a1 + 169))
    {
      for (unint64_t i = 0; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        std::basic_regex<char>::value_type v8 = v4;
        if (v4[23] < 0) {
          std::basic_regex<char>::value_type v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v8[i]);
        char v10 = v4;
        if (v4[23] < 0) {
          char v10 = *(char **)v4;
        }
        v10[i] = v9;
      }
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        __int16 v13 = v3;
        if (v3[23] < 0) {
          __int16 v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v13[j]);
        unint64_t v15 = v3;
        if (v3[23] < 0) {
          unint64_t v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }
    else
    {
      for (unint64_t k = 0; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        int v20 = a2;
        if (a2[23] < 0) {
          int v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }
      for (unint64_t m = 0; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        uint64_t v24 = a3;
        if (a3[23] < 0) {
          uint64_t v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      uint64_t v26 = v4;
      unint64_t v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }
    else
    {
      uint64_t v25 = v4[23];
    }
    std::regex_traits<char>::transform<char *>(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      uint64_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }
    else
    {
      uint64_t v27 = v3[23];
    }
    std::regex_traits<char>::transform<char *>(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)size_t v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((char **)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (v16 != 1 || (a3[23] < 0 ? (uint64_t v29 = *((void *)a3 + 1)) : (uint64_t v29 = a3[23]), v29 != 1)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    }
    if (*(unsigned char *)(a1 + 169))
    {
      uint64_t v30 = a2;
      if (a2[23] < 0) {
        uint64_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v30);
      uint64_t v32 = v4;
      if (v4[23] < 0) {
        uint64_t v32 = *(unsigned char **)v4;
      }
      unsigned char *v32 = v31;
      char v33 = v3;
      if (v3[23] < 0) {
        char v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v33);
      uint64_t v35 = v3;
      if (v3[23] < 0) {
        uint64_t v35 = *(unsigned char **)v3;
      }
      *uint64_t v35 = v34;
    }
    *(_OWORD *)size_t v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)unint64_t v4 = 0;
    *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)uint64_t v3 = 0;
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((char **)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
}

void sub_21BFE961C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    char v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v24);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        long long v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v36);
        }
        else {
          uint64_t v37 = 0;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        size_t v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    _WORD *v9 = v8;
    uint64_t v26 = v9 + 1;
    goto LABEL_48;
  }
  char v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3) {
    goto LABEL_49;
  }
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  uint64_t v26 = v27 + 2;
  uint64_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 120) = v26;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE9908(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + 8) = v3 + 24;
}

void sub_21BFE99B8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    char v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v7, v9);
  }
  else {
    char v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_21BFE9AD0(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begiuint64_t n = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFE9DF0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<char const*>(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    unint64_t v8 = __p;
  }
  else {
    unint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_21BFE9EBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      unint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unint64_t v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  unint64_t v6 = (unint64_t *)(a1 + 64);
  unint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          unsigned __int8 v12 = operator new(v28);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        uint64_t v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          __int16 v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *unint64_t v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  long long v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    unsigned __int8 v12 = operator new(v18);
  }
  else {
    unsigned __int8 v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  uint64_t v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  unsigned __int8 v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](char **a1, long long *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  unint64_t v4 = (std::allocator<std::pair<std::string, std::string>> *)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *((void *)v4 - 1);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v12;
    }
    v26.__end_cap_.__value_ = v4;
    if (v14) {
      long long v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>((uint64_t)v4, v14);
    }
    else {
      long long v15 = 0;
    }
    unint64_t v16 = &v15[48 * v11];
    long long v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v16 = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v18 = *(long long *)((char *)a2 + 24);
    *((void *)v16 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    uint64_t v20 = *a1;
    unint64_t v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      int64x2_t v24 = vdupq_n_s64(v19);
      uint64_t v21 = &v15[48 * v11];
    }
    else
    {
      uint64_t v21 = &v15[48 * v11];
      do
      {
        long long v22 = *(_OWORD *)(v19 - 48);
        *((void *)v21 - 4) = *(void *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(void *)(v19 - 40) = 0;
        *(void *)(v19 - 32) = 0;
        *(void *)(v19 - 48) = 0;
        long long v23 = *(_OWORD *)(v19 - 24);
        *((void *)v21 - 1) = *(void *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(void *)(v19 - 16) = 0;
        *(void *)(v19 - 8) = 0;
        *(void *)(v19 - 24) = 0;
        v19 -= 48;
      }
      while ((char *)v19 != v20);
      int64x2_t v24 = *(int64x2_t *)a1;
    }
    unint64_t v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    *(int64x2_t *)&v26.__begin_ = v24;
    uint64_t v25 = (std::pair<std::string, std::string> *)a1[2];
    a1[2] = &v15[48 * v14];
    v26.__end_cap_.__value_ = v25;
    v26.__first_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)v24.i64[0];
    std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&v26);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v9 = *(long long *)((char *)a2 + 24);
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    unint64_t v10 = (char *)(v7 + 48);
  }
  a1[1] = v10;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFEA31C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

void std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(std::__split_buffer<std::pair<std::string, std::string>> *this)
{
  begiuint64_t n = this->__begin_;
  for (std::__split_buffer<std::pair<std::string, std::string>>::pointer i = this->__end_; i != begin; std::__split_buffer<std::pair<std::string, std::string>>::pointer i = this->__end_)
  {
    this->__end_ = i - 1;
    std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>((uint64_t)&i[-1]);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  char v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  char v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
}

void sub_21BFEA7AC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }
  return a2;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFEA8C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFEA920(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);

  JUMPOUT(0x21D49F120);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    unint64_t *v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  unint64_t *v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);

  JUMPOUT(0x21D49F120);
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CC1A7B0;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  uint64_t v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(unsigned char *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void std::__repeat_one_loop<char>::~__repeat_one_loop()
{
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);

  JUMPOUT(0x21D49F120);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void std::__empty_non_own_state<char>::~__empty_non_own_state()
{
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  exceptiouint64_t n = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x21D49F060](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21BFEACA0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return (unsigned __int8 *)a2;
  }
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  BOOL v8 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }
  size_t v9 = a1->__marked_count_ + 1;

  return std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(a1, v8, (unsigned __int8 *)a3, end, marked_count + 1, v9);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(a1, a2, a3);
  uint64_t v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      int v8 = a2[1];
      if (v8 == 40)
      {
        uint64_t v9 = (uint64_t)(a2 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
        unsigned int marked_count = a1->__marked_count_;
        do
        {
          unint64_t v11 = (char *)v9;
          uint64_t v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(a1, v9, a3);
        }
        while ((char *)v9 != v11);
        if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41) {
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        }
        uint64_t v7 = v11 + 2;
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, marked_count);
      }
      else
      {
        BOOL v13 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, v8);
        uint64_t v14 = 2;
        if (!v13) {
          uint64_t v14 = 0;
        }
        return &a2[v14];
      }
    }
  }
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end)
{
  uint64_t v6 = a2;
  if (a2 != a3)
  {
    unsigned int v7 = __mexp_end;
    unsigned int v8 = __mexp_begin;
    int v11 = *a2;
    if (v11 == 42)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(this, 0, 0xFFFFFFFFFFFFFFFFLL, __s, __mexp_begin, __mexp_end, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      BOOL v13 = a2 + 2;
      int v25 = 0;
      uint64_t v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, a2 + 2, a3, &v25);
      if (v14 == v13) {
        goto LABEL_16;
      }
      if (v14 != a3)
      {
        long long v15 = v14 + 1;
        int v16 = *v14;
        if (v16 == 44)
        {
          int v24 = -1;
          long long v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            size_t v19 = v24;
            size_t v18 = v25;
            if (v24 == -1)
            {
              size_t v19 = -1;
            }
            else if (v24 < v25)
            {
LABEL_16:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
            }
            uint64_t v6 = &v17[2 * (v17[1] == 125)];
            size_t v20 = v8;
            size_t v21 = v7;
            long long v22 = this;
LABEL_23:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v22, v18, v19, __s, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          uint64_t v6 = v14 + 2;
          size_t v18 = v25;
          size_t v20 = v8;
          size_t v21 = v7;
          long long v22 = this;
          size_t v19 = v25;
          goto LABEL_23;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
    if (result != a2) {
      return result;
    }
  }
  else
  {
    int v6 = *a2;
    if ((a2 + 1 != a3 || v6 != 36)
      && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v6);
      return a2 + 1;
    }
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
    if (result != a2) {
      return result;
    }
    if (*a2 == 46) {
      operator new();
    }
  }

  return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(std::basic_regex<char> *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    int v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x21D49F120);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > this->__marked_count_) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  int v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  }
  do
  {
    unsigned int v7 = v6;
    int v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char> *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  unsigned int v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>(a1, a2, a3);
  uint64_t v9 = (unsigned __int8 *)v8;
  if (v8 != (char *)a2 || v8 == (char *)a3) {
    goto LABEL_12;
  }
  int locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  if (locale_low == 36)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(a1);
    goto LABEL_8;
  }
  if (locale_low == 40)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
    unsigned int v11 = a1->__marked_count_;
    ++a1->__open_count_;
    unint64_t v12 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
    if (v12 == a3 || (BOOL v13 = v12, LOBYTE(v12->__traits_.__loc_.__locale_) != 41)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, v11);
    --a1->__open_count_;
    uint64_t v9 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 1;
LABEL_12:
    if (v9 != (unsigned __int8 *)a2) {
      goto LABEL_13;
    }
    return (unsigned __int8 *)a2;
  }
  if (locale_low != 94) {
    return (unsigned __int8 *)a2;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(a1);
LABEL_8:
  uint64_t v9 = (unsigned __int8 *)&a2->__traits_.__loc_.__locale_ + 1;
LABEL_13:
  size_t v14 = a1->__marked_count_ + 1;

  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, v14);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t result = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(a1, a2, a3);
  if (result == (char *)a2)
  {
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>((uint64_t)a1, a2, a3);
    if (result == (char *)a2)
    {
      if (a2 != a3 && LOBYTE(a2->__traits_.__loc_.__locale_) == 46) {
        operator new();
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)a1, (char *)a2, (char *)a3);
    }
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  uint64_t v3 = this;
  if (this != a3)
  {
    int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    uint64_t v5 = (locale_low - 36);
    if (v5 > 0x3A) {
      goto LABEL_8;
    }
    if (((1 << (locale_low - 36)) & 0x5800000080004D1) != 0) {
      return v3;
    }
    if (v5 == 5)
    {
      if (a1->__open_count_) {
        return v3;
      }
    }
    else
    {
LABEL_8:
      if ((locale_low - 123) < 2) {
        return v3;
      }
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
    return (std::basic_regex<char> *)((char *)v3 + 1);
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  uint64_t v3 = this;
  if (this == a3) {
    return (char *)v3;
  }
  int v4 = (char *)&this->__traits_.__loc_.__locale_ + 1;
  if ((std::basic_regex<char> *)((char *)&v3->__traits_.__loc_.__locale_ + 1) == a3
    || LOBYTE(v3->__traits_.__loc_.__locale_) != 92)
  {
    return (char *)v3;
  }
  int v5 = *v4;
  std::basic_regex<char>::value_type v6 = *v4;
  BOOL v7 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v7 || (v5 - 123) < 3)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
    return (char *)v3 + 2;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    BOOL v9 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v6);
    uint64_t v10 = 2;
    if (!v9) {
      uint64_t v10 = 0;
    }
    return (char *)v3 + v10;
  }

  return std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v4, (char *)a3, 0);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, char *__f, char *__l, std::match_results<const char *> *this, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  std::match_results<char const*>::__init(this, *(_DWORD *)(a1 + 28) + 1, __f, __l, (unsigned __int16)(v9 & 0x800) >> 11);
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __f, __l, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (this->__matches_.__end_ == this->__matches_.__begin_) {
      p_unmatched = &this->__unmatched_;
    }
    else {
      p_unmatched = this->__matches_.__begin_;
    }
LABEL_8:
    first = p_unmatched->first;
    this->__prefix_.second = p_unmatched->first;
    this->__prefix_.matched = this->__prefix_.first != first;
    second = p_unmatched->second;
    this->__suffix_.first = second;
    this->__suffix_.matched = second != this->__suffix_.second;
    return 1;
  }
  if (__f != __l && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    long long v15 = __f + 1;
    if (v15 != __l)
    {
      while (1)
      {
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
        int v16 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v15, __l, (uint64_t *)this, v14, 0);
        begiuint64_t n = this->__matches_.__begin_;
        std::vector<std::csub_match>::pointer end = this->__matches_.__end_;
        if (v16) {
          break;
        }
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), &this->__unmatched_);
        if (++v15 == __l) {
          goto LABEL_14;
        }
      }
      if (end == begin) {
        p_unmatched = &this->__unmatched_;
      }
      else {
        p_unmatched = this->__matches_.__begin_;
      }
      goto LABEL_8;
    }
LABEL_14:
    std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __l, __l, (uint64_t *)this, v14, 0))
    {
      if (this->__matches_.__end_ == this->__matches_.__begin_) {
        p_unmatched = &this->__unmatched_;
      }
      else {
        p_unmatched = this->__matches_.__begin_;
      }
      goto LABEL_8;
    }
  }
  uint64_t result = 0;
  this->__matches_.__end_ = this->__matches_.__begin_;
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  }
  return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)uint64_t v57 = 0;
    memset(&v57[8], 0, 32);
    long long v58 = 0uLL;
    *(_OWORD *)std::vector<std::csub_match> __p = 0uLL;
    memset(v60, 0, 21);
    std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    int v51 = a4;
    if (*(void *)&v57[32])
    {
      *(void *)&long long v58 = *(void *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    uint64_t v12 = *((void *)&v61 + 1);
    unint64_t v13 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 56), *(unsigned int *)(a1 + 32));
    char v55 = 0;
    unsigned int v18 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = a2;
    uint64_t v19 = *((void *)&v63 + 1);
    uint64_t v20 = *((void *)&v61 + 1);
    unint64_t v21 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v22 = v21 / 0x2A;
    unint64_t v23 = 3 * (v21 % 0x2A);
    *(void *)(*(void *)(*((void *)&v61 + 1) + 8 * v22) + 32 * v23 + 80) = v6;
    uint64_t v24 = a3 - a2;
    uint64_t v25 = *(void *)(v20 + 8 * v22) + 32 * v23;
    *(_DWORD *)(v25 + 88) = a5;
    *(unsigned char *)(v25 + 92) = a6;
    uint64_t v52 = a3;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v24) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      unint64_t v27 = v19 + v63 - 1;
      uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      char v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == v52;
          BOOL v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v53;
          if ((v55 & (v53 >= v37)) == 0) {
            uint64_t v38 = v37;
          }
          if (v38 != v24)
          {
            uint64_t v53 = v38;
            std::deque<std::__state<char>>::pop_back(&v61);
            char v55 = 1;
            goto LABEL_38;
          }
          __int16 v39 = (void **)*((void *)&v61 + 1);
          uint64_t v40 = v62;
          if ((void)v62 == *((void *)&v61 + 1))
          {
            uint64_t v40 = *((void *)&v61 + 1);
          }
          else
          {
            __int16 v41 = (void *)(*((void *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            uint64_t v42 = (void *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * ((*((void *)&v63 + 1) + (void)v63) / 0x2AuLL))
                + 96 * ((*((void *)&v63 + 1) + (void)v63) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  long long v44 = (void *)v41[1];
                  ++v41;
                  uint64_t v42 = v44;
                }
              }
              while (v42 != (void *)v43);
              __int16 v39 = (void **)*((void *)&v61 + 1);
              uint64_t v40 = v62;
            }
          }
          *((void *)&v63 + 1) = 0;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              __int16 v39 = (void **)(*((void *)&v61 + 1) + 8);
              *((void *)&v61 + 1) = v39;
              unint64_t v47 = v62 - (void)v39;
            }
            while ((void)v62 - (void)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42;
          }
          *(void *)&long long v63 = v48;
LABEL_53:
          char v55 = 1;
          uint64_t v53 = v24;
LABEL_38:
          uint64_t v19 = *((void *)&v63 + 1);
          if (*((void *)&v63 + 1)) {
            continue;
          }
          if (v55)
          {
            uint64_t v49 = *v51;
            *(void *)uint64_t v49 = v54;
            *(void *)(v49 + 8) = v54 + v53;
            uint64_t v6 = 1;
            *(unsigned char *)(v49 + 16) = 1;
          }
          else
          {
            uint64_t v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          std::deque<std::__state<char>>::push_front((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          std::deque<std::__state<char>>::pop_back(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          long long v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)uint64_t v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          long long v58 = 0uLL;
          *(void *)&v57[32] = 0;
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v57[32], *(long long **)(v28 + 96 * v29 + 32), *(long long **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(long long **)(v28 + 96 * v29 + 56), *(long long **)(v28 + 96 * v29 + 64), (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(void, void, unsigned char *))(*(void *)v60[1] + 24))(v60[1], 0, v57);
          std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(void *)&v57[32])
          {
            *(void *)&long long v58 = *(void *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  std::deque<std::__state<char>>::~deque[abi:ne180100](&v61);
  return v6;
}

void sub_21BFEBE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  char v55 = 0;
  int64_t v56 = 0;
  unint64_t v57 = 0;
  *(_DWORD *)uint64_t v52 = 0;
  memset(&v52[8], 0, 32);
  long long v53 = 0u;
  memset(v54, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_43;
  }
  __x.first = a3;
  __x.second = a3;
  __x.matched = 0;
  *(_DWORD *)uint64_t v48 = 0;
  memset(&v48[8], 0, 48);
  *(_OWORD *)std::vector<std::csub_match> __p = 0uLL;
  memset(v50, 0, 21);
  int64_t v56 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v55, (uint64_t)v48);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*(void *)&v48[32])
  {
    *(void *)&v48[40] = *(void *)&v48[32];
    operator delete(*(void **)&v48[32]);
  }
  long long v44 = a4;
  uint64_t v12 = v56;
  *((_DWORD *)v56 - 24) = 0;
  *((void *)v12 - 11) = a2;
  *((void *)v12 - 10) = a2;
  *((void *)v12 - 9) = a3;
  std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v12 - 4), *(unsigned int *)(a1 + 28), &__x);
  std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v56 - 40), *(unsigned int *)(a1 + 32));
  long long v45 = a3;
  uint64_t v46 = 0;
  char v13 = 0;
  unsigned int v14 = 0;
  uint64_t v15 = (const char *)(a3 - a2);
  unint64_t v16 = v56;
  *((void *)v56 - 2) = v6;
  *((_DWORD *)v16 - 2) = a5;
  *((unsigned char *)v16 - 4) = a6;
  do
  {
    BOOL v17 = (++v14 & 0xFFF) != 0 || (int)(v14 >> 12) < (int)v15;
    if (!v17) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    uint64_t v19 = v16 - 1;
    uint64_t v18 = *((void *)v16 - 2);
    uint64_t v20 = v16 - 6;
    if (v18) {
      (*(void (**)(uint64_t, _OWORD *))(*(void *)v18 + 16))(v18, v16 - 6);
    }
    switch(*(_DWORD *)v20)
    {
      case 0xFFFFFC18:
        unint64_t v21 = (const char *)*((void *)v16 - 10);
        if ((a5 & 0x20) != 0 && v21 == a2 || (a5 & 0x1000) != 0 && v21 != v45) {
          goto LABEL_19;
        }
        char v28 = v13;
        unint64_t v29 = &v21[-*((void *)v16 - 11)];
        uint64_t v30 = v46;
        if ((v28 & ((uint64_t)v46 >= (uint64_t)v29)) == 0)
        {
          long long v31 = *(v16 - 5);
          *(_OWORD *)uint64_t v52 = *(_OWORD *)v20;
          *(_OWORD *)&v52[16] = v31;
          if (v52 != v20)
          {
            std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v52[32], *((long long **)v16 - 8), *((long long **)v16 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v16 - 7) - *((void *)v16 - 8)) >> 3));
            std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(v54, *((uint64_t **)v16 - 5), *((uint64_t **)v16 - 4), (uint64_t)(*((void *)v16 - 4) - *((void *)v16 - 5)) >> 4);
          }
          char v32 = (void *)*v19;
          *(void **)((char *)&v54[3] + 5) = *(void **)((char *)v16 - 11);
          v54[3] = v32;
          uint64_t v30 = v29;
        }
        uint64_t v33 = v56;
        if (v30 == v15)
        {
          uint64_t v34 = (uint64_t)v55;
          while (v33 != (void *)v34)
          {
            v33 -= 12;
            std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v33);
          }
          int64_t v56 = (_OWORD *)v34;
          char v13 = 1;
          uint64_t v46 = v15;
        }
        else
        {
          uint64_t v46 = v30;
          BOOL v35 = v56 - 6;
          std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)v56 - 12);
          int64_t v56 = v35;
          char v13 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        unint64_t v22 = v56 - 6;
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)v56 - 12);
        int64_t v56 = v22;
        break;
      case 0xFFFFFC20:
        long long v23 = *(v16 - 5);
        *(_OWORD *)uint64_t v48 = *(_OWORD *)v20;
        *(_OWORD *)&v48[16] = v23;
        memset(&v48[32], 0, 24);
        std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v48[32], *((long long **)v16 - 8), *((long long **)v16 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v16 - 7) - *((void *)v16 - 8)) >> 3));
        __p[0] = 0;
        __p[1] = 0;
        v50[0] = 0;
        std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v16 - 5), *((long long **)v16 - 4), (uint64_t)(*((void *)v16 - 4) - *((void *)v16 - 5)) >> 4);
        uint64_t v24 = (void *)*v19;
        *(void *)((char *)&v50[1] + 5) = *(void *)((char *)v16 - 11);
        v50[1] = v24;
        (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v19 + 24))(*v19, 1, v16 - 6);
        (*(void (**)(void, void, unsigned char *))(*(void *)v50[1] + 24))(v50[1], 0, v48);
        uint64_t v25 = v56;
        if ((unint64_t)v56 >= v57)
        {
          int64_t v56 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v55, (uint64_t)v48);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v26 = *(_OWORD *)&v48[16];
          _OWORD *v56 = *(_OWORD *)v48;
          v25[1] = v26;
          *((void *)v25 + 4) = 0;
          *((void *)v25 + 5) = 0;
          *((void *)v25 + 6) = 0;
          *((void *)v25 + 7) = 0;
          v25[2] = *(_OWORD *)&v48[32];
          *((void *)v25 + 6) = *(void *)&v48[48];
          memset(&v48[32], 0, 24);
          *((void *)v25 + 8) = 0;
          *((void *)v25 + 9) = 0;
          *(_OWORD *)((char *)v25 + 56) = *(_OWORD *)__p;
          *((void *)v25 + 9) = v50[0];
          __p[0] = 0;
          __p[1] = 0;
          v50[0] = 0;
          uint64_t v27 = v50[1];
          *(void *)((char *)v25 + 85) = *(void *)((char *)&v50[1] + 5);
          *((void *)v25 + 10) = v27;
          int64_t v56 = v25 + 6;
        }
        if (*(void *)&v48[32])
        {
          *(void *)&v48[40] = *(void *)&v48[32];
          operator delete(*(void **)&v48[32]);
        }
        break;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    unint64_t v16 = v56;
  }
  while (v55 != v56);
  if (v13)
  {
    uint64_t v36 = *v44;
    *(void *)uint64_t v36 = a2;
    *(void *)(v36 + 8) = &v46[(void)a2];
    *(unsigned char *)(v36 + 16) = 1;
    if ((void)v53 != *(void *)&v52[32])
    {
      unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - *(void *)&v52[32]) >> 3);
      uint64_t v38 = (unsigned char *)(*(void *)&v52[32] + 16);
      unsigned int v39 = 1;
      do
      {
        uint64_t v40 = v36 + 24 * v39;
        *(_OWORD *)uint64_t v40 = *((_OWORD *)v38 - 1);
        char v41 = *v38;
        v38 += 24;
        *(unsigned char *)(v40 + 16) = v41;
        BOOL v17 = v37 > v39++;
      }
      while (v17);
    }
    uint64_t v42 = 1;
  }
  else
  {
LABEL_43:
    uint64_t v42 = 0;
  }
  if (v54[0])
  {
    v54[1] = v54[0];
    operator delete(v54[0]);
  }
  if (*(void *)&v52[32])
  {
    *(void *)&long long v53 = *(void *)&v52[32];
    operator delete(*(void **)&v52[32]);
  }
  *(void *)uint64_t v52 = &v55;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);
  return v42;
}

void sub_21BFEC3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  std::__state<char>::~__state(&a17);
  std::__state<char>::~__state(&a33);
  a33 = v33 - 120;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a33);
  _Unwind_Resume(a1);
}

__n128 std::deque<std::__state<char>>::push_back(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::__state<char>>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v8 + 56) = 0;
  *(void *)(v8 + 64) = 0;
  *(void *)(v8 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t std::deque<std::__state<char>>::pop_back(void *a1)
{
  unint64_t v2 = a1[5] + a1[4] - 1;
  std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)(*(void *)(a1[1] + 8 * (v2 / 0x2A))
                                                                 + 96 * (v2 % 0x2A)));
  --a1[5];

  return std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
}

int64x2_t std::deque<std::__state<char>>::push_front(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    std::deque<std::__state<char>>::__add_front_capacity((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(void *)(v7 - 56) = 0;
  *(void *)(v7 - 48) = 0;
  *(void *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v7 - 40) = 0;
  *(void *)(v7 - 32) = 0;
  *(void *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_21BFF45C0);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void std::deque<std::__state<char>>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)long long v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v5, v33);
      BOOL v35 = &v34[8 * (v33 >> 2)];
      unint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        long long v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        char v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)char v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    long long v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v54);
    long long v44 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>((uint64_t)(a1 + 3), v46);
      BOOL v35 = &v34[8 * (v46 >> 2)];
      unint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        long long v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        int v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)int v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        long long v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  int64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  long long v53 = operator new(0xFC0uLL);
  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front((uint64_t)&v54, v27);
  }
  unint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_21BFEC9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void std::deque<std::__state<char>>::__add_front_capacity(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      std::vector<std::csub_match> __p = std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v7, v11);
      unint64_t v43 = (char *)__p;
      long long v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      char v41 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                unint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)unint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              long long v31 = __p;
              std::vector<std::csub_match> __p = v24;
              unint64_t v43 = &v24[8 * (v23 >> 2)];
              long long v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }
              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              unint64_t v43 = v22;
              long long v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }
      uint64_t v36 = *a1;
      unint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::vector<std::csub_match> __p = v36;
      unint64_t v43 = v33;
      uint64_t v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      long long v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        long long v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        std::vector<std::csub_match> __p = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &__p);
        uint64_t v34 = a1[2];
        std::vector<std::csub_match> __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        std::vector<std::csub_match> __p = operator new(0xFC0uLL);
      }
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 21;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    std::vector<std::csub_match> __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
  }
}

void sub_21BFED204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    unint64_t v4 = a1 + 5;
    uint64_t v3 = (void **)a1[1];
  }
  else
  {
    unint64_t v4 = a1 + 5;
    unint64_t v5 = a1[4];
    uint64_t v6 = &v2[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      uint64_t v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
  }
  void *v4 = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    uint64_t v13 = *v2++;
    operator delete(v13);
  }

  return std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(void *a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((unsigned char *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (long long *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }
    else
    {
      int64_t v21 = (long long *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((unsigned char *)v6 + 16);
          uint64_t v6 = (long long *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          long long v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (long long *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      int64_t v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        long long v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (long long *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    int64_t v18 = v16 - v13;
  }
  void *v14 = &v13[v18];
  return result;
}

char *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      long long v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }
    else
    {
      unint64_t v20 = (long long *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      unint64_t v23 = v12;
      if (v20 != (long long *)a3)
      {
        long long v24 = v12;
        do
        {
          long long v25 = *v20++;
          *(_OWORD *)long long v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (long long *)a3);
      }
      long long v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        long long v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    long long v17 = (char *)(v15 - v12);
  }
  *uint64_t v13 = &v17[(void)v12];
  return result;
}

BOOL HDSQLiteColumnIsNonNull(HDSQLiteRow *a1, int a2)
{
  return !HDSQLiteRow::columnIsNull(a1, a2);
}

id HDSQLiteColumnAsNonEmptyString(HDSQLiteRow *a1, int a2)
{
  uint64_t v2 = HDSQLiteRow::columnAsString(a1, a2);
  if ([v2 length]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_21BFEDD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteRow::columnBytesLength(HDSQLiteRow *this, int a2)
{
  if (a2 < 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"int HDSQLiteRow::columnBytesLength(int) const"];
    [v7 handleFailureInFunction:v8 file:@"HDSQLiteRow_Internal.h" lineNumber:103 description:@"Column must be greater than or equal to 0."];
  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"int HDSQLiteRow::columnBytesLength(int) const"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"HDSQLiteRow_Internal.h", 104, @"Column must be less than the number of requested columns (%d).", (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));
  }
  if (HDSQLiteRow::columnIsNull(this, a2)) {
    return 0;
  }
  int v5 = *((_DWORD *)this + 4) + a2;
  uint64_t v6 = (sqlite3_stmt *)*((void *)this + 1);

  return sqlite3_column_bytes(v6, v5);
}

void sub_21BFEDE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsURL(HDSQLiteRow *this, int a2)
{
  uint64_t v2 = HDSQLiteRow::columnAsString(this, a2);
  if (v2) {
    uint64_t v3 = (void *)[objc_alloc(NSURL) initWithString:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_21BFEDF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsNonEmptyString(HDSQLiteRow *a1, void *a2)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsString(a1, a2);
  if ([v2 length]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_21BFEDF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsURL(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  int v5 = HDSQLiteRow::columnAsURL(a1, v4);

  return v5;
}

void sub_21BFEE004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsNaturalType(HDSQLiteRow *a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(void *)a1 + 24))(a1, [v3 UTF8String]);
  int v5 = HDSQLiteRow::columnAsNaturalType(a1, v4);

  return v5;
}

void sub_21BFEE09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsObjectWithClasses(sqlite3_stmt **a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = HDSQLiteColumnWithNameAsData((HDSQLiteRow *)a1, v5);
  if (v7)
  {
    id v14 = 0;
    uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v6 fromData:v7 error:&v14];
    id v9 = v14;
    uint64_t v10 = v9;
    if (!v8 && v9)
    {
      _HKInitializeLogging();
      unint64_t v11 = (id)*MEMORY[0x263F098E8];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [NSString stringWithCString:sqlite3_sql(a1[1]) encoding:4];
        *(_DWORD *)buf = 138413058;
        id v16 = v5;
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        unint64_t v20 = v13;
        __int16 v21 = 2114;
        uint64_t v22 = v10;
        _os_log_error_impl(&dword_21BFB4000, v11, OS_LOG_TYPE_ERROR, "Error unarchiving object from column %@ (classes: %@; sql statement %@): %{public}@",
          buf,
          0x2Au);
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_21BFEE254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsArrayOfClass(sqlite3_stmt **a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), a3, 0);
  uint64_t v7 = HDSQLiteColumnWithNameAsObjectWithClasses(a1, v5, v6);

  return v7;
}

void sub_21BFEE330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindNull(HDSQLiteStatementBinder *this, NSString *a2)
{
  id v6 = a2;
  id v3 = [(NSString *)v6 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v3);
  int v4 = *(sqlite3_stmt **)this;
  int v5 = HDSQLiteStatementBinder::indexForProperty(this, v3);
  sqlite3_bind_null(v4, v5);
}

void sub_21BFEEBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bind(HDSQLiteStatementBinder *this, NSString *a2, objc_object *a3)
{
  v32[2] = *MEMORY[0x263EF8340];
  int v5 = a2;
  id v6 = a3;
  uint64_t v7 = v5;
  uint64_t v8 = [(NSString *)v7 UTF8String];
  HDSQLiteStatementBinder::_recordBoundProperty(this, v8);
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v11 = *(sqlite3_stmt **)this;
      int v12 = HDSQLiteStatementBinder::indexForProperty(this, v8);
      uint64_t v13 = [(objc_object *)v6 UTF8String];
      if (v13) {
        id v14 = (const char *)v13;
      }
      else {
        id v14 = "";
      }
      sqlite3_bind_text(v11, v12, v14, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v15 = *(sqlite3_stmt **)this;
        int v16 = HDSQLiteStatementBinder::indexForProperty(this, v8);
        [(objc_object *)v6 timeIntervalSinceReferenceDate];
        sqlite3_bind_double(v15, v16, v17);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = *(sqlite3_stmt **)this;
          int v19 = HDSQLiteStatementBinder::indexForProperty(this, v8);
          unint64_t v20 = v6;
          sqlite3_bind_blob(v18, v19, (const void *)[(objc_object *)v20 bytes], [(objc_object *)v20 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32[0] = 0;
            v32[1] = 0;
            [(objc_object *)v6 getUUIDBytes:v32];
            __int16 v21 = *(sqlite3_stmt **)this;
            int v22 = HDSQLiteStatementBinder::indexForProperty(this, v8);
            sqlite3_bind_blob(v21, v22, v32, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v30 = [MEMORY[0x263F08690] currentHandler];
              long long v31 = objc_msgSend(NSString, "stringWithUTF8String:", "void HDSQLiteStatementBinder::bind(NSString * _Nonnull __strong, id  _Nullable __strong)");
              [v30 handleFailureInFunction:v31 file:@"HDSQLiteStatementBinder_Internal.h" lineNumber:140 description:&stru_26CC1AE10];
            }
            uint64_t v23 = v6;
            long long v24 = (const char *)[(objc_object *)v23 objCType];
            if (!strcmp(v24, "d") || !strcmp(v24, "f"))
            {
              uint64_t v27 = *(sqlite3_stmt **)this;
              int v28 = HDSQLiteStatementBinder::indexForProperty(this, v8);
              [(objc_object *)v23 doubleValue];
              sqlite3_bind_double(v27, v28, v29);
            }
            else
            {
              long long v25 = *(sqlite3_stmt **)this;
              int v26 = HDSQLiteStatementBinder::indexForProperty(this, v8);
              sqlite3_bind_int64(v25, v26, [(objc_object *)v23 longLongValue]);
            }
          }
        }
      }
    }
  }
  else
  {
    id v9 = *(sqlite3_stmt **)this;
    int v10 = HDSQLiteStatementBinder::indexForProperty(this, v8);
    sqlite3_bind_null(v9, v10);
  }
}

void sub_21BFEEF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HDSQLiteBindSecureCodingObjectToProperty(HDSQLiteStatementBinder *a1, void *a2, void *a3)
{
  uint64_t v7 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    HDSQLiteStatementBinder::bindData(a1, v7, v6);
  }
  else
  {
    HDSQLiteStatementBinder::bindNull(a1, v7);
  }
}

void sub_21BFEF034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void logActiveStatement_cold_1(sqlite3_stmt *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = sqlite3_sql(a1);
  id v5 = "<unknown sql>";
  if (v4) {
    id v5 = v4;
  }
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2082;
  id v9 = v5;
  _os_log_error_impl(&dword_21BFB4000, v3, OS_LOG_TYPE_ERROR, "Transaction finished with active outstanding statement: %p %{public}s", (uint8_t *)&v6, 0x16u);
}

void _LogOrAppend_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void HDSQLiteComparisonTypeForPredicateOperator_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_ERROR, "Unrecognized predicate operator type received: %lu", (uint8_t *)&v2, 0xCu);
}

void __HDSQLiteEntityEnumerateColumns_block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_21BFB4000, log, OS_LOG_TYPE_FAULT, "Expected foreign key for column %@ of table %@ and none found", buf, 0x16u);
}

uint64_t std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x270F0E370]();
}

uint64_t AKSEventsUnregister()
{
  return MEMORY[0x270F0E378]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x270EF3670]();
}

uint64_t HKDiagnosticStringFromDate()
{
  return MEMORY[0x270EF36A0]();
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return MEMORY[0x270EF36C0]();
}

uint64_t HKHealthWrapDERDataFromString()
{
  return MEMORY[0x270EF3700]();
}

uint64_t HKIsUnitTesting()
{
  return MEMORY[0x270EF3730]();
}

uint64_t HKLogAssertions()
{
  return MEMORY[0x270EF3760]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x270EF3768]();
}

uint64_t HKMachAbsoluteTimeGetCurrent()
{
  return MEMORY[0x270EF3780]();
}

uint64_t HKSubmitAnalyticsFile()
{
  return MEMORY[0x270EF3890]();
}

uint64_t HKWithAutoreleasePool()
{
  return MEMORY[0x270EF38B0]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x270F4AE00]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

uint64_t _HKLogPersistedSignposts()
{
  return MEMORY[0x270EF3980]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::terminate(void)
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

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
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

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD90](audittoken, buffer, *(void *)&buffersize);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x270EDB068](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x270EDB290]();
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x270F9B468](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x270F9B470](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x270F9B488](p, *(void *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B498](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x270F9B538](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x270F9B540](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
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

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x270F9B608](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

sqlite3 *__cdecl sqlite3_db_handle(sqlite3_stmt *a1)
{
  return (sqlite3 *)MEMORY[0x270F9B628](a1);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B650](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x270F9B670](pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

void sqlite3_interrupt(sqlite3 *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
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

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x270F9B7F8](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B810](pStmt);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x270F9B870](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x270F9B878](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x270F9B888](a1);
  return result;
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B8C0](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8D0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return MEMORY[0x270EDBF30]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
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

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x270EDC1B0]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x270EDC428](type);
}