void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

char *OUTLINED_FUNCTION_2_0()
{
  return mach_error_string(v0);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return v0;
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21C7CC33C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);

  objc_exception_rethrow();
}

void sub_21C7CC354(_Unwind_Exception *a1)
{
}

id SYServiceDataPath()
{
  uint64_t v0 = +[SYDevice targetableDevice];
  uint64_t v1 = [v0 pairingStorePath];
  v2 = [v1 stringByAppendingPathComponent:@"CompanionSync"];

  return v2;
}

BOOL SYRequestFullSyncReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
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
        v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    v17 = *(SYMessageHeader **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void SYLogSQLiteExtendedErrorCode(int a1)
{
  if (a1 >= 102)
  {
    switch((char)a1)
    {
      case 4:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_7();
        }
        break;
      case 5:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_3();
        }
        break;
      case 6:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_2();
        }
        break;
      case 8:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_6();
        }
        break;
      case 10:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_1(a1);
        }
        break;
      case 11:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_5();
        }
        break;
      case 14:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_4();
        }
        break;
      case 19:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_8(a1);
        }
        break;
      case 23:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_11();
        }
        break;
      case 27:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_9();
        }
        break;
      case 28:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          SYLogSQLiteExtendedErrorCode_cold_10();
        }
        break;
      default:
        return;
    }
  }
}

const char *_SQLiteIOError(int a1)
{
  HIDWORD(v2) = a1 - 266;
  LODWORD(v2) = a1 - 266;
  unsigned int v1 = v2 >> 8;
  if (v1 > 0x1B) {
    return "";
  }
  else {
    return off_2644227C8[v1];
  }
}

const char *_SQLiteConstraintError(int a1)
{
  HIDWORD(v2) = a1 - 275;
  LODWORD(v2) = a1 - 275;
  unsigned int v1 = v2 >> 8;
  if (v1 > 9) {
    return "";
  }
  else {
    return off_2644228A8[v1];
  }
}

id NSErrorFromSQLiteError(int a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = [NSString stringWithUTF8String:sqlite3_errstr(a1)];
  if (a1 >= 102)
  {
    switch((char)a1)
    {
      case 4:
        v3 = "";
        uint64_t v4 = "Abort error: ROLLBACK";
        BOOL v5 = a1 == 516;
        goto LABEL_21;
      case 5:
        v3 = "";
        if (a1 == 517) {
          v3 = "Busy error: SNAPSHOT";
        }
        uint64_t v4 = "Busy error: RECOVERY";
        BOOL v5 = a1 == 261;
        goto LABEL_21;
      case 6:
        v3 = "";
        uint64_t v4 = "Lock error: SHAREDCACHE";
        BOOL v5 = a1 == 262;
        goto LABEL_21;
      case 8:
        HIDWORD(v7) = a1 - 264;
        LODWORD(v7) = a1 - 264;
        unsigned int v6 = v7 >> 8;
        if (v6 >= 4) {
          goto LABEL_28;
        }
        char v8 = off_264422918;
        goto LABEL_14;
      case 10:
        unsigned int v9 = _SQLiteIOError(a1);
        goto LABEL_24;
      case 11:
        v3 = "";
        uint64_t v4 = "Corrupt error: VTAB";
        BOOL v5 = a1 == 267;
        goto LABEL_21;
      case 14:
        HIDWORD(v10) = a1 - 270;
        LODWORD(v10) = a1 - 270;
        unsigned int v6 = v10 >> 8;
        if (v6 >= 4)
        {
LABEL_28:
          unsigned int v9 = "";
        }
        else
        {
          char v8 = off_2644228F8;
LABEL_14:
          unsigned int v9 = v8[v6];
        }
        goto LABEL_24;
      case 19:
        unsigned int v9 = _SQLiteConstraintError(a1);
        goto LABEL_24;
      case 23:
        v3 = "";
        uint64_t v4 = "Auth error: USER";
        BOOL v5 = a1 == 279;
        goto LABEL_21;
      case 27:
        v3 = "";
        if (a1 == 539) {
          v3 = "Notice: RECOVER_ROLLBACK";
        }
        uint64_t v4 = "Notice: RECOVER_WAL";
        BOOL v5 = a1 == 283;
        goto LABEL_21;
      case 28:
        v3 = "";
        uint64_t v4 = "Warning: AUTOINDEX";
        BOOL v5 = a1 == 284;
LABEL_21:
        if (v5) {
          unsigned int v9 = v4;
        }
        else {
          unsigned int v9 = v3;
        }
LABEL_24:
        uint64_t v11 = objc_msgSend(v2, "stringByAppendingFormat:", @" - %s", v9);

        unint64_t v2 = (void *)v11;
        break;
      default:
        break;
    }
  }
  id v12 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v16 = *MEMORY[0x263F08320];
  v17[0] = v2;
  char v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = (void *)[v12 initWithDomain:@"SQLiteErrorDomain" code:a1 userInfo:v13];

  return v14;
}

uint64_t _sync_log_facilities_init()
{
  os_log_t v0 = os_log_create("com.apple.companionsync", "general");
  unsigned int v1 = (void *)_sync_log_facilities;
  _sync_log_facilities = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.companionsync", "session");
  v3 = (void *)qword_26AB04788;
  qword_26AB04788 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.companionsync", "transport");
  BOOL v5 = (void *)qword_26AB04790;
  qword_26AB04790 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.companionsync", "persistence");
  unint64_t v7 = (void *)qword_26AB04798;
  qword_26AB04798 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.companionsync", "transactions");
  unsigned int v9 = (void *)qword_26AB047A0;
  qword_26AB047A0 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.companionsync", "protocol");
  uint64_t v11 = (void *)qword_26AB047A8;
  qword_26AB047A8 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.companionsync", "streams");
  char v13 = (void *)qword_26AB047B0;
  qword_26AB047B0 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.companionsync", "signposts");
  int v15 = (void *)qword_26AB047B8;
  qword_26AB047B8 = (uint64_t)v14;

  qword_26AB047C0 = (uint64_t)os_log_create("com.apple.companionsync", "messages");
  return MEMORY[0x270F9A758]();
}

id _SYObfuscate(void *a1)
{
  id v1 = a1;
  if (_SYObfuscate_onceToken != -1) {
    dispatch_once(&_SYObfuscate_onceToken, &__block_literal_global_43);
  }
  if (_SYObfuscate___shouldObfuscate)
  {
    id v2 = v1;
  }
  else
  {
    _obfuscatedDescription(v1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

char *_obfuscatedDescription(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (!v1)
  {
    v3 = 0;
    goto LABEL_9;
  }
  id v2 = (void *)MEMORY[0x21D4B1560]();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      os_log_t v4 = [v1 CPObfuscatedDescriptionObject];
      _obfuscatedDescription();
      v3 = (char *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (_obfuscatedDescription_onceToken != -1) {
        dispatch_once(&_obfuscatedDescription_onceToken, &__block_literal_global_109);
      }
      unint64_t v7 = [(id)_obfuscatedDescription__numFormatter stringFromNumber:v1];
      if (v7) {
        goto LABEL_16;
      }
    }
    else
    {
      unint64_t v7 = [v1 description];
      if (v7)
      {
LABEL_16:
        id v5 = v7;
        v3 = (char *)[v5 UTF8String];
        if (v3)
        {
          memset(&v12, 0, sizeof(v12));
          CC_SHA1_Init(&v12);
          CC_SHA1_Update(&v12, &_createHashRepresentationOfString_seed, 4u);
          CC_LONG v8 = strlen(v3);
          CC_SHA1_Update(&v12, v3, v8);
          CC_SHA1_Final(md, &v12);
          uint64_t v9 = 0;
          v13[0] = 91;
          os_log_t v10 = v14;
          do
          {
            unint64_t v11 = md[v9];
            *(v10 - 1) = _createHashRepresentationOfString_hexNybble[v11 >> 4];
            *os_log_t v10 = _createHashRepresentationOfString_hexNybble[v11 & 0xF];
            v10 += 2;
            ++v9;
          }
          while (v9 != 4);
          *(_WORD *)(v10 - 1) = 93;
          v3 = (char *)[[NSString alloc] initWithBytes:v13 length:10 encoding:4];
        }
        goto LABEL_8;
      }
    }
    id v5 = 0;
    v3 = 0;
    goto LABEL_8;
  }
  v3 = [v1 CPSafeDescription];
LABEL_7:
  id v5 = 0;
LABEL_8:

LABEL_9:
  return v3;
}

unint64_t _next_pseudo_signpost_id()
{
  return atomic_fetch_add_explicit(&_next_pseudo_signpost_id___signpost, 1uLL, memory_order_relaxed);
}

uint64_t ___obfuscatedDescription_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)_obfuscatedDescription__numFormatter;
  _obfuscatedDescription__numFormatter = v0;

  id v2 = [MEMORY[0x263EFF960] systemLocale];
  [(id)_obfuscatedDescription__numFormatter setLocale:v2];

  v3 = (void *)_obfuscatedDescription__numFormatter;
  return [v3 setNumberStyle:0];
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t SYLogErrorInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v23 = PBReaderReadString();
        v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 2)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
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
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
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

void sub_21C7CF7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C7CFA44(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

uint64_t SYFileTransferInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
          char v17 = objc_alloc_init(SYMessageHeader);
          objc_storeStrong((id *)(a1 + 24), v17);
          if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_26;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 16;
LABEL_26:
          unint64_t v21 = *(void **)(a1 + v20);
          *(void *)(a1 + v20) = v19;

          continue;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
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
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 == -1 || v26 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0) {
          goto LABEL_35;
        }
        v22 += 7;
        BOOL v14 = v23++ >= 9;
        if (v14)
        {
          uint64_t v24 = 0;
          goto LABEL_37;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v24 = 0;
      }
LABEL_37:
      *(void *)(a1 + 8) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYSyncBatchReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        char v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v19;

        goto LABEL_39;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_38:
        *(void *)(a1 + 8) = v23;
        goto LABEL_39;
      case 4u:
        char v17 = objc_alloc_init(SYChange);
        [(id)a1 addChanges:v17];
        if PBReaderPlaceMark() && (SYChangeReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

id GetServiceInstanceTable()
{
  if (GetServiceInstanceTable_onceToken != -1) {
    dispatch_once(&GetServiceInstanceTable_onceToken, &__block_literal_global_108);
  }
  uint64_t v0 = (void *)GetServiceInstanceTable___table;
  return v0;
}

uint64_t _SYAutoTruncateHook(int a1, sqlite3 *db, uint64_t a3, int a4)
{
  if (a4 >= 1000) {
    sqlite3_wal_checkpoint_v2(db, 0, 3, 0, 0);
  }
  return 0;
}

void sub_21C7D2198(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);

  objc_exception_rethrow();
}

void sub_21C7D21B0(_Unwind_Exception *a1)
{
}

void sub_21C7D2258(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);

  objc_exception_rethrow();
}

void sub_21C7D2270(_Unwind_Exception *a1)
{
}

void sub_21C7D2334(void *a1)
{
  objc_begin_catch(a1);

  objc_exception_rethrow();
}

void sub_21C7D2348(_Unwind_Exception *a1)
{
}

void sub_21C7D2424(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);

  objc_exception_rethrow();
}

void sub_21C7D243C(_Unwind_Exception *a1)
{
}

void sub_21C7D2824(_Unwind_Exception *a1)
{
}

void sub_21C7D2A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

uint64_t __GetServiceInstanceTable_block_invoke()
{
  GetServiceInstanceTable___table = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:6];
  return MEMORY[0x270F9A758]();
}

uint64_t __SYZlibStreamGetPort(void *a1)
{
  uint64_t v1 = [a1 _internal];
  if (v1) {
    uint64_t v2 = v1[4];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t __SYZlibStreamPerform(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return 0;
}

void _TryPostEvent(uint64_t a1, void *a2, int a3)
{
  mach_msg_return_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void block[4];
  _DWORD *v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t msg;
  uint64_t v16;

  id v5 = a2;
  msg.msgh_id = 0;
  *(void *)&msg.msgh_bits = 0x2000000013;
  msg.msgh_remote_port = v5[4];
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  uint64_t v16 = a1;
  os_log_t v6 = mach_msg(&msg, 17, 0x20u, 0, 0, 1u, 0);
  if (v6)
  {
    if (a3 <= 3 && v6 == 268435460)
    {
      unint64_t v7 = dispatch_time(0, (uint64_t)((double)a3 * 250000000.0));
      char v8 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = ___TryPostEvent_block_invoke;
      block[3] = &unk_264422B00;
      char v13 = a1;
      unint64_t v12 = v5;
      BOOL v14 = a3;
      dispatch_after(v7, v8, block);
    }
    else
    {
      unsigned int v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08350] code:v6 userInfo:0];
      unint64_t v10 = (void *)*((void *)v5 + 6);
      *((void *)v5 + 6) = v9;

      *((void *)v5 + 7) = 7;
    }
  }
}

void sub_21C7D30B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7D3138(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7D5060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C7D60E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7D6260(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CreateGzfileError(gzFile_s *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  int errnum = 0;
  uint64_t v1 = gzerror(a1, &errnum);
  if (errnum == -1)
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v5 = (void *)[v6 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  else
  {
    uint64_t v2 = (void *)v1;
    if (v1)
    {
      v3 = (void *)[[NSString alloc] initWithUTF8String:v1];
      uint64_t v9 = *MEMORY[0x263F08320];
      v10[0] = v3;
      uint64_t v2 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    id v4 = objc_alloc(MEMORY[0x263F087E8]);
    id v5 = (void *)[v4 initWithDomain:@"SYZlibErrorDomain" code:errnum userInfo:v2];
  }
  return v5;
}

void sub_21C7D6464(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7D7134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _SYProtectionClassFromString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 isEqualToString:*MEMORY[0x263F08080]])
    {
      uint64_t v3 = 1;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F08088]])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F08098]])
    {
      uint64_t v3 = 3;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F080B0]])
    {
      uint64_t v3 = 4;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t SYErrorInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 16;
      }
      else
      {
        if (v17 != 3)
        {
          if (v17 == 2)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
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
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 8) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 24;
      }
      char v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SYChangeMessageReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v17 = objc_alloc_init(SYChange);
    [a1 addChanges:v17];
    if (!PBReaderPlaceMark() || (SYChangeReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYBatchSyncStartReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
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
            goto LABEL_35;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if (v17 == 2)
      {
        uint64_t v25 = PBReaderReadString();
        char v26 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v25;
      }
      else if (v17 == 1)
      {
        char v18 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t SYLogServiceStateReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        goto LABEL_50;
      case 2u:
        unsigned int v20 = objc_alloc_init(SYLogEngineState);
        objc_storeStrong((id *)(a1 + 8), v20);
        if (!PBReaderPlaceMark() || (SYLogEngineStateReadFrom((uint64_t)v20, a2) & 1) == 0) {
          goto LABEL_73;
        }
        goto LABEL_47;
      case 3u:
        unsigned int v20 = objc_alloc_init(SYLogSessionState);
        objc_storeStrong((id *)(a1 + 56), v20);
        if (!PBReaderPlaceMark() || (SYLogSessionStateReadFrom((uint64_t)v20, a2) & 1) == 0) {
          goto LABEL_73;
        }
        goto LABEL_47;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_61:
        *(unsigned char *)(a1 + 80) = v23 != 0;
        goto LABEL_71;
      case 5u:
        unsigned int v20 = objc_alloc_init(SYLogDeviceState);
        objc_storeStrong((id *)(a1 + 64), v20);
        if (!PBReaderPlaceMark() || (SYLogDeviceStateReadFrom((uint64_t)v20, a2) & 1) == 0) {
          goto LABEL_73;
        }
        goto LABEL_47;
      case 6u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v29) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_65:
        uint64_t v39 = 16;
        goto LABEL_70;
      case 7u:
        unsigned int v20 = objc_alloc_init(SYLogTransportOption);
        [(id)a1 addTransportOptions:v20];
        if (PBReaderPlaceMark() && SYLogTransportOptionReadFrom((uint64_t)v20, a2))
        {
LABEL_47:
          PBReaderRecallMark();

LABEL_71:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_73:

        return 0;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_50;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_50:
        v33 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_71;
      case 0xAu:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 84) |= 1u;
        while (2)
        {
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v29 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              BOOL v14 = v35++ >= 9;
              if (v14)
              {
                LODWORD(v29) = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_69:
        uint64_t v39 = 48;
LABEL_70:
        *(_DWORD *)(a1 + v39) = v29;
        goto LABEL_71;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_71;
    }
  }
}

void sub_21C7DC6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7DC9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7DCB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7DCDB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
}

void sub_21C7DD608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7DD908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _ValidateURL(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [v3 isFileURL];
  int v5 = v4;
  if (a2 && v4)
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v7 = *MEMORY[0x263F08570];
    id v8 = v3;
    unsigned int v9 = objc_opt_new();
    unint64_t v10 = [v8 absoluteURL];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08578]];

    uint64_t v11 = [v8 absoluteString];

    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08588]];
    [v9 setObject:@"Unsupported URL" forKeyedSubscript:*MEMORY[0x263F08320]];
    [v9 setObject:@"This API only works with file URLs." forKeyedSubscript:*MEMORY[0x263F08338]];
    [v9 setObject:@"Ensure that you pass a valid file or file-reference URL into this API." forKeyedSubscript:*MEMORY[0x263F08348]];
    *a2 = (id)[v6 initWithDomain:v7 code:-1002 userInfo:v9];
  }
  return v5 ^ 1u;
}

void sub_21C7E0914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7E09C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E0B60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7E0CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7E1040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  os_activity_scope_leave((os_activity_scope_state_t)(v15 - 48));
  _Unwind_Resume(a1);
}

void sub_21C7E12C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21C7E157C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
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

void sub_21C7E19C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E1E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E2180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C7E2510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E2AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E2CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7E2DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E34D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C7E354C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E35BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E3718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E3938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E3C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E3F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7E41A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E4304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E45E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  os_activity_scope_leave((os_activity_scope_state_t)(v15 - 48));
  _Unwind_Resume(a1);
}

void sub_21C7E4854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21C7E4988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
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

void sub_21C7E4D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E5238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E591C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C7E5998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E5A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E5F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t SYLogEngineStateReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  int v4 = (int *)MEMORY[0x263F62288];
  int v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
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
              goto LABEL_50;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_52;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_52:
          *(_DWORD *)(a1 + 8) = v19;
          continue;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 16) |= 4u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v26 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_56:
          BOOL v42 = v26 != 0;
          uint64_t v43 = 14;
          goto LABEL_65;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)(a1 + 16) |= 2u;
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
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  uint64_t v32 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v32 = 0;
          }
LABEL_60:
          BOOL v42 = v32 != 0;
          uint64_t v43 = 13;
          goto LABEL_65;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          *(unsigned char *)(a1 + 16) |= 1u;
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
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 == -1 || v40 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
        *(void *)(a2 + v39) = v40 + 1;
        v38 |= (unint64_t)(v41 & 0x7F) << v36;
        if ((v41 & 0x80) == 0) {
          goto LABEL_62;
        }
        v36 += 7;
        BOOL v14 = v37++ >= 9;
        if (v14)
        {
          uint64_t v38 = 0;
          goto LABEL_64;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_62:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v38 = 0;
      }
LABEL_64:
      BOOL v42 = v38 != 0;
      uint64_t v43 = 12;
LABEL_65:
      *(unsigned char *)(a1 + v43) = v42;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21C7E77D0(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_21C7E7A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7E7B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C7E814C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_21C7E8210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

uint64_t _PrefsChangedNotificationCallback(uint64_t a1, void *a2)
{
  return [a2 _prefsChanged];
}

id _ClientNameForServiceName(void *a1)
{
  id v1 = a1;
  if (_ClientNameForServiceName_onceToken != -1) {
    dispatch_once(&_ClientNameForServiceName_onceToken, &__block_literal_global_573);
  }
  uint64_t v2 = [(id)_ClientNameForServiceName___lookup objectForKeyedSubscript:v1];
  if (!v2)
  {
    uint64_t v2 = [v1 lastPathComponent];
  }

  return v2;
}

void sub_21C7EA674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7EB1D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak(a22);
  objc_destroyWeak((id *)(v29 - 112));
  _Unwind_Resume(a1);
}

void sub_21C7EF424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  if (a2)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_21C7F3034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7F3EA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 232));
  _Block_object_dispose((const void *)(v4 - 224), 8);
  _Block_object_dispose((const void *)(v4 - 192), 8);
  _Block_object_dispose((const void *)(v4 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21C7F4854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

unsigned char *OUTLINED_FUNCTION_10(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_11(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

BOOL SYLogTransportOptionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
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

uint64_t SYResetResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 1)
      {
        char v24 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if (v17 != 3)
        {
          if (v17 == 2)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
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
                goto LABEL_37;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_39;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v20 = 0;
            }
LABEL_39:
            *(unsigned char *)(a1 + 24) = v20 != 0;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v24 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (SYErrorInfoReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYEndSyncSessionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_27;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v19;

        goto LABEL_39;
      case 3u:
        unint64_t v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_27:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_38:
        *(unsigned char *)(a1 + 32) = v23 != 0;
        goto LABEL_39;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

void sub_21C7F6FF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7F7140(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C7F73DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21C7F765C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_21C7F7A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7F7E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7F803C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C7F818C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7F879C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C7F8818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7F8888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7F89E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7F8BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

id _SessionIdentifierDateFormatter()
{
  if (_SessionIdentifierDateFormatter_onceToken != -1) {
    dispatch_once(&_SessionIdentifierDateFormatter_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)_SessionIdentifierDateFormatter___formatter;
  return v0;
}

void sub_21C7F9734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21C7FA078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C7FBA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
}

void sub_21C7FBE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v8 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void _dispatch_sync_safe_tagged(NSObject *a1, void *a2, void *a3)
{
  if (dispatch_get_specific((const void *)__SYService_Queue_Tag_Key) == a2)
  {
    uint64_t v5 = (void (*)(void *))a3[2];
    v5(a3);
  }
  else
  {
    dispatch_sync(a1, a3);
  }
}

void sub_21C7FC1AC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_21C7FC7BC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 192));
  _Unwind_Resume(a1);
}

void sub_21C7FCC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_21C7FD81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7FDA58(void *a1)
{
  objc_begin_catch(a1);

  objc_exception_rethrow();
}

void sub_21C7FDA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C7FDE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C7FDFE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21C7FE144(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21C7FEE88(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 192));
  _Unwind_Resume(a1);
}

void sub_21C7FF534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C802F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose((const void *)(v30 - 208), 8);
  _Block_object_dispose(&a30, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v30 - 224));
  _Unwind_Resume(a1);
}

void sub_21C803910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C804020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C804F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C8053CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 144), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v9 - 112));
  _Unwind_Resume(a1);
}

void sub_21C8055DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C805E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C8064DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_21C806D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_21C807A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_21C807D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void ___dispatch_async_autoreleased_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21D4B1560]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___dispatch_sync_autoreleased_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21D4B1560]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_3_0()
{
  return os_log_type_enabled(v0, (os_log_type_t)0x90u);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_11_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t ExecuteSQL(sqlite3 *a1, char *a2, ...)
{
  va_start(va, a2);
  if (!a1) {
    return 1;
  }
  errmsg = 0;
  id v3 = sqlite3_vmprintf(a2, va);
  uint64_t v4 = sqlite3_exec(a1, v3, 0, 0, &errmsg);
  if (v4 && errmsg)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "execute() Error: %s \n", errmsg);
    sqlite3_free(errmsg);
  }
  sqlite3_free(v3);
  return v4;
}

void _LogInfoForPath(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [MEMORY[0x263F08850] defaultManager];
    id v15 = 0;
    uint64_t v4 = [v3 attributesOfItemAtPath:v2 error:&v15];
    id v5 = v15;

    if (v4)
    {
      id v6 = v2;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v9 = (void *)qword_26AB04798;
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        _LogInfoForPath_cold_3((uint64_t)v2, v9, v5);
      }
      uint64_t v10 = [v2 stringByDeletingLastPathComponent];
      if (!v10)
      {
        id v6 = v2;
LABEL_27:
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          _LogInfoForPath_cold_2();
        }
        goto LABEL_31;
      }
      uint64_t v11 = (void *)v10;
      while (1)
      {
        uint64_t v12 = [v11 length];
        if (v12 == [v2 length] || (objc_msgSend(v11, "isEqualToString:", v2) & 1) != 0)
        {
          id v6 = v2;
LABEL_26:

          goto LABEL_27;
        }
        id v6 = v11;

        uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
        id v14 = 0;
        uint64_t v4 = [v13 attributesOfItemAtPath:v6 error:&v14];
        id v5 = v14;

        if (v4) {
          break;
        }
        uint64_t v11 = [v6 stringByDeletingLastPathComponent];

        uint64_t v2 = v6;
        if (!v11) {
          goto LABEL_26;
        }
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v7 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Attributes for '%@': %@", buf, 0x16u);
    }

LABEL_31:
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v8 = qword_26AB04798;
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    _LogInfoForPath_cold_1(v8);
  }
}

uint64_t BindString(sqlite3_stmt *a1, int a2, id a3)
{
  id v5 = (const char *)[a3 UTF8String];
  int v6 = strlen(v5);
  return sqlite3_bind_text(a1, a2, v5, v6, 0);
}

void sub_21C809F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C80A234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C80A7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C80A920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C80AA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t SYEndSyncSessionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        id v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_27;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v19;

        goto LABEL_39;
      case 3u:
        id v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_27:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_38:
        *(unsigned char *)(a1 + 32) = v23 != 0;
        goto LABEL_39;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

BOOL SYResetRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        id v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    id v17 = *(SYMessageHeader **)(a1 + 8);
    *(void *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYMessageHeaderReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
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
    if (v17 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v40 = 24;
        goto LABEL_59;
      case 2u:
        uint64_t v23 = objc_alloc_init(SYPeer);
        objc_storeStrong((id *)(a1 + 32), v23);
        if (!PBReaderPlaceMark() || !SYPeerReadFrom((uint64_t)v23, a2)) {
          goto LABEL_62;
        }
        goto LABEL_29;
      case 3u:
        uint64_t v23 = objc_alloc_init(SYVectorClock);
        objc_storeStrong((id *)(a1 + 40), v23);
        if PBReaderPlaceMark() && (SYVectorClockReadFrom(v23, a2))
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_60:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_62:

        return 0;
      case 4u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
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
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_50:
        *(_DWORD *)(a1 + 48) = v26;
        goto LABEL_60;
      case 5u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v33 |= (unint64_t)(v37 & 0x7F) << v31;
            if (v37 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                uint64_t v33 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v33 = 0;
        }
LABEL_54:
        *(void *)(a1 + 8) = v33;
        goto LABEL_60;
      case 6u:
        *(unsigned char *)(a1 + 52) |= 1u;
        uint64_t v38 = *v3;
        unint64_t v39 = *(void *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v39);
          *(void *)(a2 + v38) = v39 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v40 = 16;
LABEL_59:
        *(void *)(a1 + v40) = v21;
        goto LABEL_60;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_60;
    }
  }
}

uint64_t ExecuteSQL_0(sqlite3 *a1, char *a2, ...)
{
  va_start(va, a2);
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 1;
  }
  va_copy((va_list)&v8[1], va);
  uint64_t v4 = sqlite3_vmprintf(a2, va);
  v8[0] = 0;
  uint64_t v5 = sqlite3_exec(a1, v4, 0, 0, (char **)v8);
  if (v5 && v8[0])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    int v6 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v5;
      __int16 v13 = 2082;
      char v14 = v8[0];
      _os_log_error_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_ERROR, "sqlite3_exec(%s) Error: %{companionsync:sqlite3err}d %{public}s\n", buf, 0x1Cu);
    }
    sqlite3_free(v8[0]);
  }
  sqlite3_free(v4);
  return v5;
}

id ReadString(sqlite3_stmt *a1)
{
  id v1 = (void *)sqlite3_column_text(a1, 0);
  if (v1)
  {
    id v1 = [NSString stringWithUTF8String:v1];
  }
  return v1;
}

void sub_21C80E380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C80E784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C80E9D0(_Unwind_Exception *a1)
{
}

void sub_21C80E9F0(void *a1)
{
}

uint64_t BindString_0(sqlite3_stmt *a1, int a2, id a3)
{
  if (a3)
  {
    uint64_t v5 = (const char *)[a3 UTF8String];
    int v6 = strlen(v5);
    return sqlite3_bind_text(a1, a2, v5, v6, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    return sqlite3_bind_null(a1, a2);
  }
}

void sub_21C80F964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C80FCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_21C810438(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21C810564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C81076C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C810ED0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21C81125C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8114D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C811940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ReadDate(sqlite3_stmt *a1)
{
  double v1 = sqlite3_column_double(a1, 0);
  if (v1 == 0.0) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:v1];
  }
  return v2;
}

uint64_t BindDate(sqlite3_stmt *a1, void *a2)
{
  if (a2)
  {
    [a2 timeIntervalSince1970];
    return sqlite3_bind_double(a1, 1, v3);
  }
  else
  {
    return sqlite3_bind_null(a1, 1);
  }
}

void sub_21C811E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C812270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BindData(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (v5)
  {
    id v6 = v5;
    sqlite3_bind_blob(a1, a2, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(a1, a2);
  }
}

void sub_21C812C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C812EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8132F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C813528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ReadData(sqlite3_stmt *a1)
{
  int v2 = sqlite3_column_bytes(a1, 0);
  double v3 = sqlite3_column_blob(a1, 0);
  if (v2 < 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v3 length:v2];
  }
  return v4;
}

void sub_21C81381C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C813AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C813D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C813FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C81423C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8146BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _DictionaryFromData(void *a1)
{
  double v1 = (objc_class *)MEMORY[0x263F08928];
  id v2 = a1;
  double v3 = (void *)[[v1 alloc] initForReadingFromData:v2 error:0];

  uint64_t v4 = (void *)[objc_alloc(NSDictionary) initWithCoder:v3];
  return v4;
}

id _DataFromDictionary(void *a1)
{
  if (a1)
  {
    double v1 = (objc_class *)MEMORY[0x263F08910];
    id v2 = a1;
    double v3 = (void *)[[v1 alloc] initRequiringSecureCoding:1];
    [v2 encodeWithCoder:v3];

    uint64_t v4 = [v3 encodedData];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

void sub_21C814C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8150C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C815510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C81572C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C815954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C815F38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21C816170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C816870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C816A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SYLogSessionStateReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x263F62268];
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_87;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_91:
        *(_DWORD *)(a1 + 64) = v23;
        goto LABEL_122;
      case 3u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        while (2)
        {
          uint64_t v31 = *v3;
          uint64_t v32 = *(void *)(a2 + v31);
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                uint64_t v30 = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_95:
        BOOL v77 = v30 != 0;
        uint64_t v78 = 84;
        goto LABEL_116;
      case 4u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v37 = 0;
        *(unsigned char *)(a1 + 88) |= 0x20u;
        while (2)
        {
          uint64_t v38 = *v3;
          uint64_t v39 = *(void *)(a2 + v38);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              BOOL v15 = v36++ >= 9;
              if (v15)
              {
                uint64_t v37 = 0;
                goto LABEL_99;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v37 = 0;
        }
LABEL_99:
        BOOL v77 = v37 != 0;
        uint64_t v78 = 83;
        goto LABEL_116;
      case 5u:
        *(unsigned char *)(a1 + 88) |= 2u;
        uint64_t v42 = *v3;
        unint64_t v43 = *(void *)(a2 + v42);
        if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v44 = *(void *)(*(void *)(a2 + *v7) + v43);
          *(void *)(a2 + v42) = v43 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v44 = 0;
        }
        uint64_t v79 = 24;
        goto LABEL_121;
      case 6u:
        *(unsigned char *)(a1 + 88) |= 1u;
        uint64_t v45 = *v3;
        unint64_t v46 = *(void *)(a2 + v45);
        if (v46 <= 0xFFFFFFFFFFFFFFF7 && v46 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v44 = *(void *)(*(void *)(a2 + *v7) + v46);
          *(void *)(a2 + v45) = v46 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v44 = 0;
        }
        uint64_t v79 = 8;
LABEL_121:
        *(void *)(a1 + v79) = v44;
        goto LABEL_122;
      case 7u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v49 = 0;
        while (2)
        {
          uint64_t v50 = *v3;
          uint64_t v51 = *(void *)(a2 + v50);
          unint64_t v52 = v51 + 1;
          if (v51 == -1 || v52 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
            *(void *)(a2 + v50) = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              BOOL v15 = v48++ >= 9;
              if (v15)
              {
                uint64_t v49 = 0;
                goto LABEL_103;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v49 = 0;
        }
LABEL_103:
        *(void *)(a1 + 16) = v49;
        goto LABEL_122;
      case 8u:
        v54 = objc_alloc_init(SYLogErrorInfo);
        objc_storeStrong((id *)(a1 + 32), v54);
        if (!PBReaderPlaceMark() || (SYLogErrorInfoReadFrom((uint64_t)v54, a2) & 1) == 0) {
          goto LABEL_124;
        }
        goto LABEL_85;
      case 9u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v57 = 0;
        *(unsigned char *)(a1 + 88) |= 4u;
        while (2)
        {
          uint64_t v58 = *v3;
          uint64_t v59 = *(void *)(a2 + v58);
          unint64_t v60 = v59 + 1;
          if (v59 == -1 || v60 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
            *(void *)(a2 + v58) = v60;
            v57 |= (unint64_t)(v61 & 0x7F) << v55;
            if (v61 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                uint64_t v57 = 0;
                goto LABEL_107;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v57 = 0;
        }
LABEL_107:
        BOOL v77 = v57 != 0;
        uint64_t v78 = 80;
        goto LABEL_116;
      case 0xAu:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v64 = 0;
        *(unsigned char *)(a1 + 88) |= 8u;
        while (2)
        {
          uint64_t v65 = *v3;
          uint64_t v66 = *(void *)(a2 + v65);
          unint64_t v67 = v66 + 1;
          if (v66 == -1 || v67 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
            *(void *)(a2 + v65) = v67;
            v64 |= (unint64_t)(v68 & 0x7F) << v62;
            if (v68 < 0)
            {
              v62 += 7;
              BOOL v15 = v63++ >= 9;
              if (v15)
              {
                uint64_t v64 = 0;
                goto LABEL_111;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v64 = 0;
        }
LABEL_111:
        BOOL v77 = v64 != 0;
        uint64_t v78 = 81;
        goto LABEL_116;
      case 0xBu:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v71 = 0;
        *(unsigned char *)(a1 + 88) |= 0x10u;
        while (2)
        {
          uint64_t v72 = *v3;
          uint64_t v73 = *(void *)(a2 + v72);
          unint64_t v74 = v73 + 1;
          if (v73 == -1 || v74 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v74;
            v71 |= (unint64_t)(v75 & 0x7F) << v69;
            if (v75 < 0)
            {
              v69 += 7;
              BOOL v15 = v70++ >= 9;
              if (v15)
              {
                uint64_t v71 = 0;
                goto LABEL_115;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v71 = 0;
        }
LABEL_115:
        BOOL v77 = v71 != 0;
        uint64_t v78 = 82;
LABEL_116:
        *(unsigned char *)(a1 + v78) = v77;
        goto LABEL_122;
      case 0xCu:
        v54 = objc_alloc_init(SYLogTransportOption);
        [(id)a1 addTransportOptions:v54];
        if (!PBReaderPlaceMark() || !SYLogTransportOptionReadFrom((uint64_t)v54, a2)) {
          goto LABEL_124;
        }
        goto LABEL_85;
      case 0xDu:
        v54 = objc_alloc_init(SYLogPeerIDPair);
        [(id)a1 addPeer:v54];
        if (PBReaderPlaceMark() && SYLogPeerIDPairReadFrom((uint64_t)v54, a2))
        {
LABEL_85:
          PBReaderRecallMark();

LABEL_122:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_124:

        return 0;
      case 0xEu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 56;
LABEL_87:
        v76 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_122;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_122;
    }
  }
}

void sub_21C81A270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  os_activity_scope_leave((os_activity_scope_state_t)(v15 - 48));
  _Unwind_Resume(a1);
}

void sub_21C81A5C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21C81A700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_21C81AE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
}

void sub_21C81B380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C81B654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C81B9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C81C150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C81C578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C81CA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C81CFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

void sub_21C81D870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_21C81DDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C81E204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  objc_sync_exit(v15);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21C81E55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C81E918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C81EB70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C81ED78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL SYBatchSyncEndReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v18 = *(SYMessageHeader **)(a1 + 24);
        *(void *)(a1 + 24) = v19;
        goto LABEL_28;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(SYErrorInfo);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || (SYErrorInfoReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_33:

      return 0;
    }
LABEL_26:
    PBReaderRecallMark();
LABEL_28:

    goto LABEL_30;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void LogWithTrace(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_DEBUG))
  {
    id v2 = [MEMORY[0x263F08B88] callStackSymbols];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    double v3 = (id)qword_26AB047A8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      LogWithTrace_cold_2(a1, v3);
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      LogWithTrace_cold_1((uint64_t)v2, v3);
    }
  }
}

void _SYRebuildDeviceList_ForUnitTests()
{
  id v0 = +[_SYDeviceMonitor sharedInstance];
  [v0 _rebuildDeviceList];
}

void _SYEmptyDeviceList_ForUnitTests()
{
  id v0 = +[_SYDeviceMonitor sharedInstance];
  [v0 _clearDeviceList];
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_21C82260C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C822664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C822FCC(_Unwind_Exception *exception_object)
{
}

void sub_21C823CBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C823E0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C824394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C8249DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_21C824A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C824AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C824D14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_21C824F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C825290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_21C825F7C(_Unwind_Exception *exception_object)
{
}

void sub_21C8263DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C826710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C826A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C826EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_21C8274E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

void sub_21C827B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21C827FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C8283D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_21C8287AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_21C8289EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_21C828D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C8290A4(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_21C829984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C829E2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t SYSyncSessionRestartResponseReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        unint64_t v20 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v19;

        goto LABEL_39;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_38:
        *(unsigned char *)(a1 + 32) = v23 != 0;
        goto LABEL_39;
      case 4u:
        unint64_t v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t SYSyncBatchResponseReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        unint64_t v20 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v19;

        goto LABEL_39;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_38:
        *(void *)(a1 + 8) = v23;
        goto LABEL_39;
      case 4u:
        unint64_t v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t SYStartSyncSessionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_66;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 32;
        goto LABEL_50;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_54:
        BOOL v40 = v23 != 0;
        uint64_t v41 = 40;
        goto LABEL_63;
      case 4u:
        unint64_t v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_64:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_66:

        return 0;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_58:
        BOOL v40 = v29 != 0;
        uint64_t v41 = 42;
        goto LABEL_63;
      case 6u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v35 = 0;
        while (2)
        {
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v14 = v34++ >= 9;
              if (v14)
              {
                uint64_t v35 = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v35 = 0;
        }
LABEL_62:
        BOOL v40 = v35 != 0;
        uint64_t v41 = 41;
LABEL_63:
        *(unsigned char *)(a1 + v41) = v40;
        goto LABEL_64;
      case 7u:
        uint64_t v19 = PBReaderReadData();
        uint64_t v20 = 24;
LABEL_50:
        uint64_t v39 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_64;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_64;
    }
  }
}

uint64_t SYBatchChunkAckReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v19;

        goto LABEL_39;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        *(_DWORD *)(a1 + 8) = v23;
        goto LABEL_39;
      case 4u:
        unint64_t v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

void ExecuteSQL_1(sqlite3 *a1, char *a2, ...)
{
  va_start(va, a2);
  if (a1)
  {
    errmsg = 0;
    double v3 = sqlite3_vmprintf(a2, va);
    if (sqlite3_exec(a1, v3, 0, 0, &errmsg))
    {
      if (errmsg)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "execute() Error: %s \n", errmsg);
        sqlite3_free(errmsg);
      }
    }
    sqlite3_free(v3);
  }
}

uint64_t BindData_0(sqlite3_stmt *a1, int a2, id a3)
{
  id v5 = a3;
  id v6 = (const void *)[v5 bytes];
  int v7 = [v5 length];

  return sqlite3_bind_blob(a1, a2, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void sub_21C82E954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

id ReadData_0(sqlite3_stmt *a1, int a2)
{
  int v4 = sqlite3_column_bytes(a1, a2);
  id v5 = sqlite3_column_blob(a1, a2);
  if (v4 < 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:v4];
  }
  return v6;
}

id ReadString_0(sqlite3_stmt *a1)
{
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(a1, 0));
  return v1;
}

id ReadDate_0(sqlite3_stmt *a1, int a2)
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a1, a2));
  return v2;
}

void sub_21C82F2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21C8303DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C8304A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

id IDSOptionsFromSYServiceOptions(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __IDSOptionsFromSYServiceOptions_block_invoke;
    v5[3] = &unk_264423B38;
    id v3 = v2;
    id v6 = v3;
    [v1 enumerateKeysAndObjectsUsingBlock:v5];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __IDSOptionsFromSYServiceOptions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  char v6 = [v10 hasPrefix:@"SYServiceOption"];
  char v8 = v10;
  if ((v6 & 1) != 0 || (int v9 = [v10 hasPrefix:@"SYEngine"], v8 = v10, v7 = v10, v9))
  {
    if (!objc_msgSend(v8, "isEqualToString:", @"SYServiceOptionMessageTimeout", v7)) {
      goto LABEL_6;
    }
    id v7 = (id)*MEMORY[0x263F49F80];
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
LABEL_6:
}

void sub_21C8317B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21C832624(_Unwind_Exception *a1)
{
  id v5 = v1;
  objc_destroyWeak(v5);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 96));
  _Unwind_Resume(a1);
}

void sub_21C8327A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C832ECC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C834D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C834F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

uint64_t SYFullSyncRequestAckReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_43;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 32;
        goto LABEL_36;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_40:
        *(unsigned char *)(a1 + 40) = v23 != 0;
        goto LABEL_41;
      case 4u:
        unint64_t v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_43:

        return 0;
      case 5u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 24;
LABEL_36:
        char v27 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_41;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_41;
    }
  }
}

unsigned char *_StopPerform(unsigned char *result)
{
  *uint64_t result = 1;
  return result;
}

void sub_21C836234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8373B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8381D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SYRejectedVersionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
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
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v21 = 0;
            unsigned int v22 = 0;
            uint64_t v23 = 0;
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
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v14 = v22++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_36;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v14 = v30++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_49;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
          PBRepeatedUInt32Add();
        }
      }
      else if (v18 == 2)
      {
        uint64_t v27 = PBReaderReadString();
        unsigned int v28 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v27;
      }
      else if (v18 == 1)
      {
        uint64_t v19 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 32), v19);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21C8399E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_21C839EA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void _AssertState(char a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  buf[3] = *MEMORY[0x263EF8340];
  id v11 = a3;
  if ((a1 & 1) == 0)
  {
    id v16 = v11;
    _os_assumes_log();
    uint64_t v12 = NSStringFromSelector(a2);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    char v13 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, (os_log_type_t)0x90u))
    {
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = v12;
      _os_log_error_impl(&dword_21C7C9000, v13, (os_log_type_t)0x90u, "*** NMS State assertion failure in -[NMSMessageCenter %{public}@]", (uint8_t *)buf, 0xCu);
    }
    buf[0] = &a9;
    id v14 = [NSString alloc];
    uint64_t v15 = [v14 initWithFormat:v16 arguments:buf[0]];
    objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"NMSInvalidStateException" reason:v15 userInfo:0]);
  }
}

void sub_21C83BAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t shouldLogTraffic()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NMSLogTraffic"];

  return v1;
}

void sub_21C83C4A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21C83D0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C83E0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C83E48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C83F108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_21C83F494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C83F6EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C83F860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C83F984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

__CFString *NMSPriorityString(unint64_t a1)
{
  if (a1 >= 3) {
    uint64_t v1 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"<unknown priority: %lu>", a1);
  }
  else {
    uint64_t v1 = off_264423FA0[a1];
  }
  return v1;
}

id allowedClasses()
{
  if (allowedClasses_onceToken != -1) {
    dispatch_once(&allowedClasses_onceToken, &__block_literal_global_785);
  }
  id v0 = (void *)allowedClasses_allowed;
  return v0;
}

uint64_t __allowedClasses_block_invoke()
{
  id v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = allowedClasses_allowed;
  allowedClasses_allowed = v10;
  return MEMORY[0x270F9A758](v10, v11);
}

uint64_t SYClockReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v23 = objc_alloc_init(SYPeer);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark() || !SYPeerReadFrom((uint64_t)v23, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 2)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
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
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_35:
        *(void *)(a1 + 8) = v19;
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

uint64_t SYOutOfBandDataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = PBReaderReadData();
        unsigned int v18 = *(void **)(a1 + 8);
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

BOOL SYSyncSessionRestartRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SYMessageHeaderReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v17 = *(SYMessageHeader **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYChangeReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
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
              goto LABEL_40;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_42;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_42:
          *(_DWORD *)(a1 + 40) = v19;
          continue;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
          goto LABEL_38;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          break;
        case 4u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 16;
          goto LABEL_38;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
LABEL_38:
          uint64_t v32 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

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
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_44;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          uint64_t v28 = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v28 = 0;
      }
LABEL_46:
      *(void *)(a1 + 8) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21C845110(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C8453B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SYStartSyncSessionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = 0x264422000uLL;
    unint64_t v8 = 0x267C90000uLL;
    unsigned int v9 = (int *)MEMORY[0x263F62268];
    unint64_t v10 = 0x267C90000uLL;
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
        char v17 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
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
          uint64_t v19 = *v5;
          int v20 = *(unsigned __int8 *)(a2 + v19);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v19 = *v5;
      int v20 = *(unsigned __int8 *)(a2 + v19);
      if (*(unsigned char *)(a2 + v19)) {
        unint64_t v13 = 0;
      }
LABEL_14:
      if (v20 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          unint64_t v22 = v10;
          unint64_t v23 = v8;
          unint64_t v24 = v7;
          id v25 = objc_alloc_init(*(Class *)(v7 + 1392));
          objc_storeStrong((id *)(a1 + 16), v25);
          if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v25, a2))
          {
            PBReaderRecallMark();

            unint64_t v7 = v24;
            unint64_t v8 = v23;
            unint64_t v10 = v22;
            continue;
          }

          return 0;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (1)
          {
            uint64_t v30 = *v3;
            uint64_t v31 = *(void *)(a2 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)(a2 + *v9) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_53;
            }
            v27 += 7;
            BOOL v18 = v28++ >= 9;
            if (v18)
            {
              uint64_t v29 = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_55:
          BOOL v54 = v29 != 0;
          uint64_t v55 = *(int *)(v8 + 2612);
          goto LABEL_64;
        case 3u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = *(int *)(v10 + 2616);
          goto LABEL_51;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v39 = *v3;
            uint64_t v40 = *(void *)(a2 + v39);
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)(a2 + *v9) + v40);
              *(void *)(a2 + v39) = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v18 = v37++ >= 9;
                if (v18)
                {
                  uint64_t v38 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v38 = 0;
          }
LABEL_59:
          BOOL v54 = v38 != 0;
          uint64_t v55 = 49;
          goto LABEL_64;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          break;
        case 6u:
          uint64_t v50 = *v3;
          unint64_t v51 = *(void *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v52 = *(void *)(*(void *)(a2 + *v9) + v51);
            *(void *)(a2 + v50) = v51 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v19) = 1;
            uint64_t v52 = 0;
          }
          *(void *)(a1 + 8) = v52;
          continue;
        case 7u:
          uint64_t v34 = PBReaderReadData();
          uint64_t v35 = 24;
          goto LABEL_51;
        case 8u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 32;
LABEL_51:
          char v53 = *(void **)(a1 + v35);
          *(void *)(a1 + v35) = v34;

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
        uint64_t v46 = *v3;
        uint64_t v47 = *(void *)(a2 + v46);
        unint64_t v48 = v47 + 1;
        if (v47 == -1 || v48 > *(void *)(a2 + *v4)) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)(a2 + *v9) + v47);
        *(void *)(a2 + v46) = v48;
        v45 |= (unint64_t)(v49 & 0x7F) << v43;
        if ((v49 & 0x80) == 0) {
          goto LABEL_61;
        }
        v43 += 7;
        BOOL v18 = v44++ >= 9;
        if (v18)
        {
          uint64_t v45 = 0;
          goto LABEL_63;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v45 = 0;
      }
LABEL_63:
      BOOL v54 = v45 != 0;
      uint64_t v55 = 48;
LABEL_64:
      *(unsigned char *)(a1 + v55) = v54;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYBatchSyncChunkReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
          char v17 = objc_alloc_init(SYMessageHeader);
          objc_storeStrong((id *)(a1 + 16), v17);
          if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_34;
          }

          return 0;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          int v20 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v19;

          continue;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          break;
        case 4u:
          PBReaderReadData();
          char v17 = (SYMessageHeader *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [(id)a1 addObjects:v17];
          }
LABEL_34:

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
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_36;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21C847884(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_21C84A3C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_21C84AF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C84BB4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21C84BD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_21C84C16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

id SYMessageClassForID(int a1)
{
  switch(a1)
  {
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
      id v2 = (id)objc_opt_class();
      goto LABEL_6;
    case 'j':
      objc_opt_class();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
      break;
    default:
      id v2 = 0;
      break;
  }
  return v2;
}

void sub_21C84C5FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21C84CBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C84D0F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C84D368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C84D478(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21C84D65C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C84DAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C84DC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C84E000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C84E9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
}

void sub_21C84F494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,os_activity_scope_state_s state)
{
  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v34 - 176));
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21C84FF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_21C850388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C8504CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_21C8507C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21C8509BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void _SYTransportLogMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10 = +[SYTransportLog sharedInstance];
  uint64_t v11 = v10;
  if (v10) {
    [v10 _logOSMessage:a4 args:&a9 returnAddress:*(void *)(vars0 + 8)];
  }
}

uint64_t SYLogMultiSuspendableQueueStateReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
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
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      char v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21C851FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_21C8525A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SYLogPeerIDPairReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = 16;
LABEL_22:
        unsigned int v19 = *(void **)(a1 + v18);
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
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id CoalesceOptionDictionaries(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  uint64_t v5 = (void *)v4;
  if (!(v3 | v4))
  {
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  if (v3)
  {
    if (v4)
    {
      uint64_t v6 = (void *)[(id)v3 mutableCopy];
      [v6 addEntriesFromDictionary:v5];
      goto LABEL_9;
    }
    id v7 = (id)v3;
  }
  else
  {
    id v7 = (id)v4;
  }
  uint64_t v6 = v7;
LABEL_9:

  return v6;
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1)
{
  return MEMORY[0x270EF2BB8](v2, v1, a1);
}

void sub_21C853654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSObject *_EnqueueOnNewGroup(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = dispatch_group_create();
  id v3 = v1;
  objc_sync_enter(v3);
  [v3 compact];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        char v8 = *(NSObject **)(*((void *)&v12 + 1) + 8 * i);
        if (v8)
        {
          dispatch_group_enter(v2);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = ___EnqueueOnNewGroup_block_invoke;
          block[3] = &unk_264422AB0;
          uint64_t v11 = v2;
          dispatch_barrier_async(v8, block);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v4);
  return v2;
}

void sub_21C85389C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

intptr_t _dispatch_group_wait_off_main_thread(void *a1, dispatch_time_t a2, double a3)
{
  uint64_t v5 = a1;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v21 = 0;
    unint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___dispatch_group_wait_off_main_thread_block_invoke;
    block[3] = &unk_264424438;
    void block[4] = &v21;
    dispatch_group_notify(v5, MEMORY[0x263EF83A0], block);
    uint64_t v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    uint64_t v7 = [v6 currentMode];
    char v8 = (void *)v7;
    unsigned int v9 = (void *)*MEMORY[0x263EFF478];
    if (v7) {
      unsigned int v9 = (void *)v7;
    }
    id v10 = v9;

    if (a3 >= 0.0)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:a3];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263EFF910] distantFuture];
    }
    long long v13 = (void *)v11;
    while (1)
    {
      long long v14 = (void *)MEMORY[0x21D4B1560]();
      long long v15 = [MEMORY[0x263EFF9F0] currentRunLoop];
      int v16 = [v15 runMode:v10 beforeDate:v13];

      uint64_t v17 = v22;
      if (!v16 || *((unsigned char *)v22 + 24)) {
        break;
      }
      [v13 timeIntervalSinceNow];
      if (v18 <= 0.0)
      {
        uint64_t v17 = v22;
        break;
      }
    }
    intptr_t v12 = *((char *)v17 + 24) - 1;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    intptr_t v12 = dispatch_group_wait(v5, a2);
  }

  return v12;
}

void sub_21C853A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C853BE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C853C6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _CleanupAllocations(void *a1)
{
  id v3 = a1;
  id v1 = (void *)MEMORY[0x21D4B1560]();
  uint64_t v2 = [v3 objectsPassingTest:&__block_literal_global_16];
  if ([v2 count]) {
    [v3 minusSet:v2];
  }
}

void sub_21C853DAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C853F0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ___dispatch_group_wait_off_main_thread_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_21C854B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

uint64_t _SYStatisticsPrune(int a1, sqlite3 *db, uint64_t a3, int a4)
{
  if (a4 >= 1001)
  {
    sqlite3_wal_checkpoint_v2(db, 0, 3, 0, 0);
    id v4 = +[SYStatisticStore sharedInstance];
    [v4 _pruneOldData];
  }
  return 0;
}

uint64_t ExecuteSQL_2(sqlite3 *a1, char *a2, ...)
{
  va_start(va, a2);
  if (!a1) {
    return 1;
  }
  va_copy((va_list)&v6[1], va);
  id v3 = sqlite3_vmprintf(a2, va);
  v6[0] = 0;
  uint64_t v4 = sqlite3_exec(a1, v3, 0, 0, (char **)v6);
  if (v4 && v6[0])
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      ExecuteSQL_cold_1();
    }
    sqlite3_free(v6[0]);
  }
  sqlite3_free(v3);
  return v4;
}

void sub_21C858268(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _stats_log_init()
{
  os_log_t v0 = os_log_create("com.apple.companionsync", "message-statistics");
  uint64_t v1 = _stats_log;
  _stats_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void SYThrowWrongSessionType(uint64_t a1, const char *a2)
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Class %@ does not implement message %@. You are using the wrong kind of session.", v7, v6 format];
}

id UserInfoDictionaryWithAssociatedSessionID(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v5 = @"AssociatedSessionIdentifier";
    v6[0] = a1;
    uint64_t v1 = NSDictionary;
    id v2 = a1;
    id v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA78];
  }
  return v3;
}

dispatch_queue_t MakeDefaultDelegateQueue(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 name];
  id v2 = [v1 lastPathComponent];
  snprintf(__str, 0x80uLL, "%s Session Default Delegate Queue", (const char *)[v2 UTF8String]);

  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create_with_target_V2(__str, v3, 0);

  return v4;
}

uint64_t SYSyncEndResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  dispatch_queue_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = objc_alloc_init(SYMessageHeader);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2)) {
          goto LABEL_27;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v19;

        goto LABEL_39;
      case 3u:
        uint64_t v17 = objc_alloc_init(SYErrorInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (SYErrorInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_27:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        *(_DWORD *)(a1 + 16) = v23;
        goto LABEL_39;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t SYLogDeviceStateReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  dispatch_queue_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_24:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
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
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_33;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_35:
      *(_DWORD *)(a1 + 32) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYVectorClockReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  dispatch_queue_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = objc_alloc_init(SYClock);
        [a1 addClocks:v17];
        if (!PBReaderPlaceMark() || (SYClockReadFrom((uint64_t)v17, a2) & 1) == 0)
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

BOOL SYPeerReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  dispatch_queue_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
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
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SYSyncAllObjectsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  dispatch_queue_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
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
          uint64_t v17 = objc_alloc_init(SYMessageHeader);
          objc_storeStrong((id *)(a1 + 24), v17);
          if PBReaderPlaceMark() && (SYMessageHeaderReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_34;
          }

          return 0;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v19;

          continue;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          break;
        case 4u:
          PBReaderReadData();
          uint64_t v17 = (SYMessageHeader *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [(id)a1 addAllObjects:v17];
          }
LABEL_34:

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
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_36;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          uint64_t v23 = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_38:
      *(void *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void SYLogSQLiteExtendedErrorCode_cold_1(int a1)
{
  _SQLiteIOError(a1);
  OUTLINED_FUNCTION_2(&dword_21C7C9000, v1, v2, "%{public}s", v3, v4, v5, v6, 2u);
}

void SYLogSQLiteExtendedErrorCode_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_7()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_8(int a1)
{
  _SQLiteConstraintError(a1);
  OUTLINED_FUNCTION_2(&dword_21C7C9000, v1, v2, "%{public}s", v3, v4, v5, v6, 2u);
}

void SYLogSQLiteExtendedErrorCode_cold_9()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_10()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void SYLogSQLiteExtendedErrorCode_cold_11()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
}

void _LogInfoForPath_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Path is nil!", v1, 2u);
}

void _LogInfoForPath_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Unable to get any attributes for any parent. Error = %@", v1, 0xCu);
}

void _LogInfoForPath_cold_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = _SYObfuscate(a3);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_1(&dword_21C7C9000, v6, v7, "Failed to get attrs of path '%@', will print attrs of closest non-failing parent. Error = %{public}@", v8, v9, v10, v11, 2u);
}

void LogWithTrace_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "Backtrace:\n%{public}@", (uint8_t *)&v2, 0xCu);
}

void LogWithTrace_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "%{public}s", (uint8_t *)&v2, 0xCu);
}

void ExecuteSQL_cold_1()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "sqlite3_exec(%{public}s) Error - %{companionsync:sqlite3err, public}d");
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return MEMORY[0x270EE54E0](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, timeout);
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x270EF2BA8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x270F586F8]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x270F58708]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x270F58710]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x270F58720]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x270F58730]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x270F58740]();
}

uint64_t SimulateCrash()
{
  return MEMORY[0x270F51238]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x270ED7D08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x270ED7EA8](a1, a2, *(void *)&a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x270ED8058]();
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

uint64_t _os_once()
{
  return MEMORY[0x270ED8110]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x270ED9478](queue, relative_priority_ptr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
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

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int gzclose(gzFile file)
{
  return MEMORY[0x270F9C6D0](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x270F9C6E0](*(void *)&fd, mode);
}

int gzeof(gzFile file)
{
  return MEMORY[0x270F9C6E8](file);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x270F9C6F0](file, errnum);
}

int gzgetc(gzFile file)
{
  return MEMORY[0x270F9C700](file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x270F9C710](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x270F9C718](file, buf, *(void *)&len);
}

int gzungetc(int c, gzFile file)
{
  return MEMORY[0x270F9C720](*(void *)&c, file);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x270F9C728](file, buf, *(void *)&len);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x270EDA068](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destroy(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1D0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x270EDA528](a1);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDA9E0]();
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x270EDB370](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x270EDB378](*(void *)&task, *(void *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x270EDB380](*(void *)&semaphore);
}

kern_return_t semaphore_signal_all(semaphore_t semaphore)
{
  return MEMORY[0x270EDB388](*(void *)&semaphore);
}

kern_return_t semaphore_timedwait(semaphore_t semaphore, mach_timespec_t wait_time)
{
  return ((uint64_t (*)(void, void))MEMORY[0x270EDB390])(*(void *)&semaphore, wait_time);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x270EDB3A0](*(void *)&semaphore);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
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

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x270F9B620](db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B650](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x270F9B680](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
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

int sqlite3_table_column_metadata(sqlite3 *db, const char *zDbName, const char *zTableName, const char *zColumnName, const char **pzDataType, const char **pzCollSeq, int *pNotNull, int *pPrimaryKey, int *pAutoinc)
{
  return MEMORY[0x270F9B828](db, zDbName, zTableName, zColumnName, pzDataType, pzCollSeq, pNotNull, pPrimaryKey);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x270F9B8E8](a1, a2);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x270F9B900](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

void *__cdecl sqlite3_wal_hook(sqlite3 *a1, int (__cdecl *a2)(void *, sqlite3 *, const char *, int), void *a3)
{
  return (void *)MEMORY[0x270F9B908](a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}