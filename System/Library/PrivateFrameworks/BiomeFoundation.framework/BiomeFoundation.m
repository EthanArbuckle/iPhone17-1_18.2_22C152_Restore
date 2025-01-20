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

__CFString *BMDevicePlatformAsKeyString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"Unknown";
  }
  else {
    return off_1E60232B8[a1 - 1];
  }
}

void sub_1B30A22BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B30A239C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B30A2BD4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B30A2EA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id bm_fd_get_path(int a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (fcntl(a1, 50, v3) < 0)
  {
    v1 = 0;
  }
  else
  {
    v1 = [NSString stringWithUTF8String:v3];
  }
  return v1;
}

void sub_1B30A3820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMDataProtectionClassFromOSProtectionClass(int a1)
{
  if ((a1 - 1) > 6) {
    return 3;
  }
  else {
    return qword_1B30D3700[a1 - 1];
  }
}

uint64_t BMFileAccessModeFromOFlags(__int16 a1)
{
  uint64_t v1 = 3;
  if ((a1 & 0x8000) == 0) {
    uint64_t v1 = 1;
  }
  if ((a1 & 3) != 0) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = v1;
  }
  if ((a1 & 3u) - 1 >= 2) {
    return v2;
  }
  else {
    return 2;
  }
}

uint64_t bm_openat_dprotected(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = v7;
  int v40 = a3;
  if ((a3 & 0x100000) != 0 && [v7 hasSuffix:@"/"])
  {
    uint64_t v9 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);

    v8 = (void *)v9;
  }
  if ((bm_validate_pathat(a1, v8) & 1) == 0)
  {
    v18 = __biome_log_for_category(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      bm_openat_dprotected_cold_4();
    }

    *__error() = 22;
    goto LABEL_50;
  }
  if (a1 == -3) {
    int v10 = -2;
  }
  else {
    int v10 = a1;
  }
  id v11 = v8;
  v12 = (char *)[v11 fileSystemRepresentation];
  if ((a3 & 0x100000) != 0)
  {
    uint64_t v19 = bm_opendirat(a1, v11, a3, 0x1C0u);
    if ((v19 & 0x80000000) != 0)
    {
      int v22 = *__error();
      v39 = 0;
      os_log_type_t v23 = _bm_log_config_for_errno(v22, (uint64_t)&v40, &v39);
      v24 = __biome_log_for_category(2);
      if (os_log_type_enabled(v24, v23))
      {
        *(_DWORD *)buf = 67109378;
        int v42 = v22;
        __int16 v43 = 2112;
        v44 = v39;
        _os_log_impl(&dword_1B30A0000, v24, v23, "bm_opendirat() failed: %{darwin.errno}d%@", buf, 0x12u);
      }

      *__error() = v22;
      goto LABEL_49;
    }
    uint64_t v13 = v19;
    if (_bm_set_protection_class(v19, a4))
    {
      int v20 = *__error();
      if (close(v13))
      {
        v21 = __biome_log_for_category(2);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          bm_openat_dprotected_cold_2(v21);
        }
      }
      *__error() = v20;
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v13 = _bm_openat_dprotected(v10, v12, a3, a4);
    if ((v13 & 0x80000000) != 0)
    {
      if (*__error() != 2 || (a3 & 0x200) == 0) {
        goto LABEL_39;
      }
      v14 = [v11 stringByDeletingLastPathComponent];
      int v15 = bm_opendirat(a1, v14, a3 & 0x20000100 | 0x200u, 0x1C0u);
      if (v15 < 0)
      {
        int v25 = *__error();
        v39 = 0;
        os_log_type_t v26 = _bm_log_config_for_errno(v25, (uint64_t)&v40, &v39);
        v27 = __biome_log_for_category(2);
        if (os_log_type_enabled(v27, v26))
        {
          *(_DWORD *)buf = 67109378;
          int v42 = v25;
          __int16 v43 = 2112;
          v44 = v39;
          _os_log_impl(&dword_1B30A0000, v27, v26, "bm_opendirat() failed: %{darwin.errno}d%@", buf, 0x12u);
        }

        *__error() = v25;
        goto LABEL_33;
      }
      int v16 = v15;
      if (v15 == a1)
      {
        v17 = __biome_log_for_category(2);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          bm_openat_dprotected_cold_1();
        }

LABEL_33:
LABEL_50:
        uint64_t v13 = 0xFFFFFFFFLL;
        goto LABEL_51;
      }
      v28 = [v11 lastPathComponent];
      uint64_t v13 = _bm_openat_dprotected(v16, (char *)[v28 fileSystemRepresentation], a3, a4);
      int v29 = *__error();
      if (close(v16))
      {
        v30 = __biome_log_for_category(2);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          bm_openat_dprotected_cold_2(v30);
        }
      }
      *__error() = v29;

      if ((v13 & 0x80000000) != 0)
      {
LABEL_39:
        int v31 = *__error();
        v39 = 0;
        os_log_type_t v32 = _bm_log_config_for_errno(v31, (uint64_t)&v40, &v39);
        v33 = __biome_log_for_category(2);
        if (os_log_type_enabled(v33, v32))
        {
          *(_DWORD *)buf = 67109378;
          int v42 = v31;
          __int16 v43 = 2112;
          v44 = v39;
          _os_log_impl(&dword_1B30A0000, v33, v32, "_bm_openat_dprotected() failed: %{darwin.errno}d%@", buf, 0x12u);
        }

        if (v31 == 92)
        {
          v34 = __biome_log_for_category(2);
          if (os_log_type_enabled(v34, v32))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B30A0000, v34, v32, "_bm_openat_dprotected() unlinking permanently lost file", buf, 2u);
          }

          int v35 = unlinkat(v10, (const char *)[v11 fileSystemRepresentation], 0);
          if (v35)
          {
            int v36 = v35;
            v37 = __biome_log_for_category(2);
            if (os_log_type_enabled(v37, v32))
            {
              *(_DWORD *)buf = 67109120;
              int v42 = v36;
              _os_log_impl(&dword_1B30A0000, v37, v32, "_bm_openat_dprotected() unlinkat: %{darwin.errno}d", buf, 8u);
            }
          }
        }
        *__error() = v31;
LABEL_49:

        goto LABEL_50;
      }
    }
  }
LABEL_51:

  return v13;
}

void sub_1B30A41A0(_Unwind_Exception *exception_object)
{
}

uint64_t _bm_set_protection_class(int a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2 == -1) {
    return 0;
  }
  int v2 = a2;
  int v4 = fcntl(a1, 64, a2);
  v5 = __error();
  uint64_t result = 0;
  if (!v4) {
    return result;
  }
  int v7 = *v5;
  if (*v5 == 45) {
    return result;
  }
  switch(v7)
  {
    case 22:
      goto LABEL_7;
    case 9:
      int v9 = fcntl(a1, 63);
      if (v9 == -1)
      {
        int v10 = *__error();
        id v11 = __biome_log_for_category(2);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          _bm_set_protection_class_cold_2();
        }

        *__error() = v10;
      }
      if (v9 != v2) {
        break;
      }
      return 0;
    case 1:
LABEL_7:
      memset(&v13, 0, 512);
      int v8 = fstatfs(a1, &v13);
      if (v8 | v13.f_flags & 0x80) {
        break;
      }
      return 0;
  }
  v12 = __biome_log_for_category(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    _bm_set_protection_class_cold_1();
  }

  *__error() = v7;
  return 0xFFFFFFFFLL;
}

__CFString *bm_subpath(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    if ([v3 isEqual:v4])
    {
      v5 = @".";
      goto LABEL_14;
    }
    int v6 = [v3 hasSuffix:@"/"];
    int v7 = [v4 hasPrefix:v3];
    if (v6)
    {
      if (v7)
      {
        uint64_t v8 = [v3 length];
LABEL_12:
        v5 = [v4 substringFromIndex:v8];
        goto LABEL_14;
      }
    }
    else if (v7)
    {
      unint64_t v9 = [v4 length];
      if (v9 > [v3 length]
        && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v3, "length")) == 47)
      {
        uint64_t v8 = [v3 length] + 1;
        goto LABEL_12;
      }
    }
  }
  v5 = 0;
LABEL_14:

  return v5;
}

uint64_t bm_validate_pathat(int a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3 || ![v3 length] || a1 < 0 && a1 != -3) {
    goto LABEL_9;
  }
  if (a1 == -3)
  {
    if (![v4 hasPrefix:@"/"])
    {
LABEL_9:
      uint64_t v6 = 0;
      goto LABEL_10;
    }
    uint64_t v5 = [v4 substringFromIndex:1];

    id v4 = (void *)v5;
  }
  if ([v4 hasPrefix:@"/"]) {
    goto LABEL_9;
  }
  if ([v4 isEqual:@"."])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v8 = [v4 componentsSeparatedByString:@"/"];
    unint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    if (([v9 containsObject:&stru_1F0B3A038] & 1) != 0
      || ([v9 containsObject:@"."] & 1) != 0)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = [v9 containsObject:@".."] ^ 1;
    }
  }
LABEL_10:

  return v6;
}

uint64_t bm_opendirat(uint64_t a1, void *a2, int a3, mode_t a4)
{
  id v7 = a2;
  v39 = objc_opt_new();
  mode_t v38 = a4;
  if ((unsigned __int16)(a4 - 512) <= 0xFE00u)
  {
    os_log_type_t v32 = __biome_log_for_category(2);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      bm_opendirat_cold_2();
    }
    goto LABEL_87;
  }
  if ((a3 & 0x9EEFFCFF) != 0)
  {
    os_log_type_t v32 = __biome_log_for_category(2);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      bm_opendirat_cold_8();
    }
    goto LABEL_87;
  }
  if ((a3 & 0x20000100) == 0x20000100)
  {
    os_log_type_t v32 = __biome_log_for_category(2);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      bm_opendirat_cold_6();
    }
    goto LABEL_87;
  }
  if ((a3 & 0x20000100) != 0)
  {
    if ((a3 & 0x100000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_82;
  }
  v33 = __biome_log_for_category(2);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    bm_opendirat_cold_7();
  }

  a3 |= 0x100u;
  if ((a3 & 0x100000) == 0)
  {
LABEL_82:
    v34 = __biome_log_for_category(2);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      bm_opendirat_cold_5();
    }

    a3 |= 0x100000u;
  }
LABEL_6:
  if ([v7 hasSuffix:@"/"])
  {
    uint64_t v8 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);

    id v7 = (id)v8;
  }
  if ((bm_validate_pathat(a1, v7) & 1) == 0)
  {
    os_log_type_t v32 = __biome_log_for_category(2);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      bm_opendirat_cold_4();
    }
LABEL_87:

    int v35 = [NSNumber numberWithInt:22];
    [v39 addObject:v35];
LABEL_88:

    id v11 = 0;
    statfs v13 = 0;
    LODWORD(v19) = 22;
    uint64_t v18 = 0xFFFFFFFFLL;
    goto LABEL_68;
  }
  if (a1 == -3) {
    int v9 = -2;
  }
  else {
    int v9 = a1;
  }
  int v10 = [[BMPathEnumerator alloc] initWithPath:v7];
  if (!v10)
  {
    int v35 = __biome_log_for_category(2);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      bm_opendirat_cold_3();
    }
    goto LABEL_88;
  }
  id v11 = v10;
  uint64_t v12 = [(BMPathEnumerator *)v10 peekPath];
  id v37 = v7;
  if (v12)
  {
    statfs v13 = (void *)v12;
    int v14 = 0;
    int v15 = a3;
    unsigned int v16 = a3 & 0xFFFFFDFF;
    v17 = (void *)v12;
    do
    {
      uint64_t v18 = openat(v9, (const char *)[v17 fileSystemRepresentation], v14 | v16);
      if ((v18 & 0x80000000) != 0) {
        uint64_t v19 = *__error();
      }
      else {
        uint64_t v19 = 0;
      }
      int v20 = [NSNumber numberWithInt:v19];
      [v39 addObject:v20];

      if ((v18 & 0x80000000) == 0)
      {
        statfs v13 = [(BMPathEnumerator *)v11 navigateDown];
        a1 = v18;
        id v7 = v37;
        a3 = v15;
        goto LABEL_38;
      }
      if ((v15 & 0x200) == 0)
      {
        id v7 = v37;
        LOWORD(a3) = v15;
        goto LABEL_59;
      }
      if (v19 != 2)
      {
        id v7 = v37;
        a3 = v15;
        goto LABEL_29;
      }
      v21 = [(BMPathEnumerator *)v11 navigateUp];

      if (!v21) {
        break;
      }
      uint64_t v22 = [(BMPathEnumerator *)v11 peekPath];

      int v14 = 1074790400;
      v17 = (void *)v22;
    }
    while (v22);
    id v7 = v37;
    a3 = v15;
    if (v9 == -2)
    {
      LODWORD(v19) = 2;
      goto LABEL_29;
    }
    statfs v13 = [(BMPathEnumerator *)v11 navigateDown];
    LODWORD(v19) = 2;
  }
  else
  {
    LODWORD(v19) = 0;
    v17 = 0;
    uint64_t v18 = 0xFFFFFFFFLL;
LABEL_29:
    if (v9 != -2)
    {
      statfs v13 = v17;
      int v9 = a1;
      goto LABEL_59;
    }
    if (v19 > 0x14 || ((1 << v19) & 0x102002) == 0)
    {
      statfs v13 = v17;
      int v9 = -2;
      goto LABEL_59;
    }
    uint64_t v23 = [(BMPathEnumerator *)v11 navigateDown];
    if (v23)
    {
      statfs v13 = [(BMPathEnumerator *)v11 peekPath];
    }
    else
    {
      statfs v13 = 0;
    }

    a1 = 4294967294;
    v17 = (void *)v23;
  }
LABEL_38:

  if (v13)
  {
    __int16 v36 = a3;
    unsigned int v24 = a3 & 0xFFFFFDFF;
    while (1)
    {
      int v25 = (const char *)[v13 fileSystemRepresentation];
      uint64_t v19 = mkdirat(a1, v25, v38) ? *__error() : 0;
      os_log_type_t v26 = [NSNumber numberWithInt:v19];
      [v39 addObject:v26];

      if (v19 != 17)
      {
        if (v19) {
          break;
        }
      }
      v27 = [(BMPathEnumerator *)v11 navigateDown];
      if (v27) {
        int v28 = 1074790400;
      }
      else {
        int v28 = 0;
      }
      uint64_t v18 = openat(a1, v25, v28 | v24);
      uint64_t v19 = 0;
      if ((v18 & 0x80000000) != 0) {
        uint64_t v19 = *__error();
      }
      int v29 = [NSNumber numberWithInt:v19];
      [v39 addObject:v29];

      if (v19)
      {

        break;
      }
      if (a1 != v9) {
        close(a1);
      }

      a1 = v18;
      statfs v13 = v27;
      if (!v27)
      {
        id v7 = v37;
        goto LABEL_72;
      }
    }
    uint64_t v18 = a1;
    id v7 = v37;
    LOWORD(a3) = v36;
LABEL_60:
    if ((v18 & 0x80000000) == 0)
    {
      if (v18 != v9) {
        close(v18);
      }
      uint64_t v18 = 0xFFFFFFFFLL;
    }
    if (v19 == 2)
    {
      if ((a3 & 0x200) == 0) {
        goto LABEL_71;
      }
    }
    else if (v19 == 1)
    {
      [MEMORY[0x1E4F93B10] lockState];
LABEL_71:
      *__error() = v19;
      goto LABEL_72;
    }
LABEL_68:
    v30 = __biome_log_for_category(2);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      bm_opendirat_cold_1((uint64_t)v7, v39, v30);
    }

    goto LABEL_71;
  }
  uint64_t v18 = a1;
LABEL_59:
  if (v19) {
    goto LABEL_60;
  }
LABEL_72:

  return v18;
}

uint64_t _bm_openat_dprotected(int a1, char *a2, int a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (a3 & 3) == 2 && a4 != 6 && a4 != -1;
  if ((a3 & 0x200) != 0 && a4 != -1)
  {
    if (_bm_supports_openat_dprotected_syscall_onceToken != -1) {
      dispatch_once(&_bm_supports_openat_dprotected_syscall_onceToken, &__block_literal_global_11);
    }
    if (_bm_supports_openat_dprotected_syscall_supported)
    {
      uint64_t v11 = openat_dprotected_np(a1, a2, a3, a4, 0, 384);
      uint64_t v12 = __error();
      if ((v11 & 0x80000000) == 0) {
        return v11;
      }
      int v13 = *v12;
      if (*v12 != 45)
      {
        if (v13 != 1 || (memset(&v19, 0, 512), int v14 = fstatfs(a1, &v19), v14 | v19.f_flags & 0x80))
        {
LABEL_29:
          *__error() = v13;
          return 0xFFFFFFFFLL;
        }
      }
      BOOL v10 = 0;
    }
    goto LABEL_21;
  }
  if ((a3 & 0x200) != 0) {
LABEL_21:
  }
    uint64_t v18 = 384;
  uint64_t v15 = openat(a1, a2, a3, v18);
  uint64_t v11 = v15;
  if (v10 && (v15 & 0x80000000) == 0 && _bm_set_protection_class(v15, a4))
  {
    int v13 = *__error();
    if (close(v11))
    {
      unsigned int v16 = __biome_log_for_category(2);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        bm_openat_dprotected_cold_2(v16);
      }
    }
    goto LABEL_29;
  }
  return v11;
}

BOOL BMValidatePath(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [@"streams" stringByAppendingString:@"/"];
  int v5 = [v3 hasPrefix:v4];

  if (v5)
  {
    if (BMStreamsPathRegex_onceToken != -1) {
      dispatch_once(&BMStreamsPathRegex_onceToken, &__block_literal_global_10);
    }
    uint64_t v6 = @"streams";
    id v7 = &BMStreamsPathRegex_regex;
    uint64_t v8 = &BMStreamsPathRegex_names;
    goto LABEL_9;
  }
  int v9 = [@"compute" stringByAppendingString:@"/"];
  int v10 = [v3 hasPrefix:v9];

  if (!v10)
  {
    if ([v3 hasPrefix:@"sharedSync"])
    {
      int v40 = __biome_log_for_category(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        BMValidatePath_cold_2();
      }

      if (!a2) {
        goto LABEL_31;
      }
    }
    else if (!a2)
    {
LABEL_31:
      id v12 = 0;
      int v14 = 0;
LABEL_32:
      BOOL v17 = 0;
      goto LABEL_36;
    }
    id v12 = 0;
    int v14 = 0;
    goto LABEL_35;
  }
  if (BMComputePathRegex_onceToken != -1) {
    dispatch_once(&BMComputePathRegex_onceToken, &__block_literal_global_95);
  }
  uint64_t v6 = @"compute";
  id v7 = &BMComputePathRegex_regex;
  uint64_t v8 = &BMComputePathRegex_names;
LABEL_9:
  id v11 = (id) *v8;
  id v12 = (id)*v7;
  id v13 = v11;
  int v14 = v13;
  if (!v12 || !v13)
  {
    v39 = __biome_log_for_category(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      BMValidatePath_cold_1();
    }

    if (!a2) {
      goto LABEL_32;
    }
LABEL_35:
    BOOL v17 = 0;
    *a2 = 0;
    goto LABEL_36;
  }
  uint64_t v15 = objc_msgSend(v12, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  unsigned int v16 = (void *)v15;
  BOOL v17 = v15 != 0;
  if (a2 && v15)
  {
    int v42 = v6;
    id v43 = v12;
    v44 = a2;
    v47 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/"];
    uint64_t v18 = objc_opt_new();
    if ([v16 numberOfRanges])
    {
      unint64_t v19 = 0;
      v48 = v14;
      v46 = v18;
      do
      {
        uint64_t v20 = [v16 rangeAtIndex:v19];
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v22 = v20;
          uint64_t v23 = v21;
          unsigned int v24 = [v14 objectAtIndexedSubscript:v19];
          char v25 = [v24 isEqual:&stru_1F0B3A038];

          if ((v25 & 1) == 0)
          {
            os_log_type_t v26 = [v14 objectAtIndexedSubscript:v19];
            v27 = [v18 objectForKeyedSubscript:v26];

            int v28 = v18;
            if (v27)
            {
              int v29 = [MEMORY[0x1E4F28B00] currentHandler];
              v30 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BMValidatePath(NSString *__strong _Nonnull, NSDictionary *__autoreleasing * _Nullable)");
              uint64_t v45 = [v14 objectAtIndexedSubscript:v19];
              int v31 = [v46 objectForKeyedSubscript:v45];
              [v48 objectAtIndexedSubscript:v19];
              v33 = os_log_type_t v32 = v3;
              v34 = objc_msgSend(v32, "substringWithRange:", v22, v23);
              objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"BMSecurity.m", 305, @"Dictionary already has value %@ for key %@; new value %@",
                v31,
                v33,
                v34);

              id v3 = v32;
              int v14 = v48;

              int v28 = v46;
            }
            int v35 = objc_msgSend(v3, "substringWithRange:", v22, v23);
            __int16 v36 = [v35 stringByTrimmingCharactersInSet:v47];
            id v37 = [v14 objectAtIndexedSubscript:v19];
            [v28 setObject:v36 forKeyedSubscript:v37];

            int v14 = v48;
            uint64_t v18 = v28;
          }
        }
        ++v19;
      }
      while (v19 < [v16 numberOfRanges]);
    }
    [v18 setObject:v42 forKeyedSubscript:@"pathType"];
    id v38 = v18;
    void *v44 = v38;

    id v12 = v43;
    BOOL v17 = 1;
  }

LABEL_36:
  return v17;
}

uint64_t bm_new_temporary_file(int a1, unsigned int a2, int a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  strcpy(path, ".tmp.XXXXXXXX");
  memset(&v20, 0, sizeof(v20));
  if (a1 < 0)
  {
    int v14 = __biome_log_for_category(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      bm_new_temporary_file_cold_1();
    }
    goto LABEL_12;
  }
  if (a2 + 1 >= 9)
  {
    int v14 = __biome_log_for_category(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      bm_new_temporary_file_cold_6();
    }
LABEL_12:

    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = mkostempsat_np(a1, path, 0, 0x1000000);
  int v9 = __error();
  if ((v8 & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (!a3 || (int v10 = unlinkat(a1, path, 0), v11 = __error(), !v10))
  {
    if (a2 == 4 || (a2 != -1 ? (uint64_t v15 = a2) : (uint64_t v15 = 3), !_bm_set_protection_class(v8, v15)))
    {
      int v16 = fstat(v8, &v20);
      BOOL v17 = __error();
      if (!v16)
      {
        if ((v20.st_mode & 0xF000) == 0x8000)
        {
          if (v20.st_nlink == (a3 ^ 1)) {
            goto LABEL_32;
          }
          unint64_t v19 = __biome_log_for_category(2);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            bm_new_temporary_file_cold_2();
          }
          int v12 = 31;
        }
        else
        {
          unint64_t v19 = __biome_log_for_category(2);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            bm_new_temporary_file_cold_3();
          }
          int v12 = 79;
        }

        goto LABEL_26;
      }
      int v12 = *v17;
      id v13 = __biome_log_for_category(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        bm_new_temporary_file_cold_4();
      }
      goto LABEL_24;
    }
    int v9 = __error();
LABEL_19:
    int v12 = *v9;
    if (*v9) {
      goto LABEL_25;
    }
    goto LABEL_32;
  }
  int v12 = *v11;
  id v13 = __biome_log_for_category(2);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    bm_new_temporary_file_cold_5();
  }
LABEL_24:

  if (v12)
  {
LABEL_25:
    if ((v8 & 0x80000000) != 0)
    {
LABEL_27:
      *__error() = v12;
      return 0xFFFFFFFFLL;
    }
LABEL_26:
    close(v8);
    goto LABEL_27;
  }
LABEL_32:
  if (a4)
  {
    objc_msgSend(NSString, "stringWithUTF8String:", path, *(_OWORD *)&v20.st_dev, *(_OWORD *)&v20.st_uid, *(_OWORD *)&v20.st_atimespec, *(_OWORD *)&v20.st_mtimespec, *(_OWORD *)&v20.st_ctimespec, *(_OWORD *)&v20.st_birthtimespec, *(_OWORD *)&v20.st_size, *(_OWORD *)&v20.st_blksize, *(_OWORD *)v20.st_qspare);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

uint64_t _bm_log_config_for_errno(int a1, uint64_t a2, void **a3)
{
  if (a3)
  {
    uint64_t v6 = *a3;
    *a3 = &stru_1F0B3A038;
  }
  if (a2)
  {
    if ((*(unsigned char *)(a2 + 1) & 2) != 0) {
      uint64_t result = 17;
    }
    else {
      uint64_t result = 1;
    }
  }
  else
  {
    uint64_t result = 1;
  }
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      uint64_t v8 = [MEMORY[0x1E4F93B10] lockState];
      if (a3)
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @" locked:%d", v8);
        int v10 = *a3;
        *a3 = (void *)v9;
      }
      if (v8 == 1) {
        return 1;
      }
      else {
        return 16;
      }
    }
    else
    {
      return 17;
    }
  }
  return result;
}

__CFString *BMStringForServiceDomain(uint64_t a1)
{
  uint64_t v1 = @"User";
  if (a1 == 1) {
    uint64_t v1 = @"System";
  }
  if (a1 == 2) {
    return @"Count";
  }
  else {
    return v1;
  }
}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqual:MEMORY[0x1E4F1CC38]]) {
      [*(id *)(a1 + 32) setObject:&unk_1F0B42D90 forKeyedSubscript:v9];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = NSNumber;
      id v7 = [v5 objectForKeyedSubscript:@"mode"];
      uint64_t v8 = [v6 numberWithUnsignedInteger:BMAccessModeFromEntitlementAccessModeString((uint64_t)v7)];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
    }
  }
}

uint64_t BMAccessModeFromEntitlementAccessModeString(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [&unk_1F0B435D0 objectForKeyedSubscript:a1];
  int v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __biome_log_for_category(uint64_t a1)
{
  int v2 = &categories[3 * a1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____biome_log_for_category_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (*v2 != -1) {
    dispatch_once(v2, block);
  }
  uint64_t v3 = (void *)categories[3 * a1 + 1];
  return v3;
}

id BMFileServerValidateAndParsePath(void *a1)
{
  id v11 = 0;
  BOOL v1 = BMValidatePath(a1, &v11);
  id v2 = v11;
  id v3 = v2;
  if (v1)
  {
    id v4 = (void *)[v2 mutableCopy];

    id v5 = NSNumber;
    uint64_t v6 = [v4 objectForKeyedSubscript:@"streamType"];
    if ([v6 isEqual:@"public"]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    uint64_t v8 = [v5 numberWithUnsignedInteger:v7];
    [v4 setObject:v8 forKeyedSubscript:@"streamType"];

    id v3 = v4;
    id v9 = v3;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t BMServiceDomainForStream(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 == 2)
  {
    uint64_t v15 = 0;
    int v16 = &v15;
    uint64_t v17 = 0x2020000000;
    id v5 = (void (*)(void))getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0;
    uint64_t v18 = getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0;
    if (!getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_0;
      v14[3] = &unk_1E60229E8;
      v14[4] = &v15;
      __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_0((uint64_t)v14);
      id v5 = (void (*)(void))v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v5) {
      BMServiceDomainForStream_cold_1();
    }
    uint64_t v6 = v5();
    uint64_t v7 = [v6 streamWithIdentifier:v3 error:0];
    uint64_t v8 = v7;
    if (v7
      && ([v7 valueForKeyPath:@"configuration.storeConfig.domain"],
          (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v10 = v9;
      uint64_t v4 = [v9 integerValue];
    }
    else if ([&unk_1F0B43378 containsObject:v3])
    {
      uint64_t v4 = 1;
    }
    else if ([&unk_1F0B43390 containsObject:v3])
    {
      id v11 = +[BMProcess current];
      int v12 = [v11 isRunningInUserContext];

      uint64_t v4 = v12 ^ 1u;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else if (a1 == 1)
  {
    uint64_t v4 = +[BMPublicStreamUtilities domainForStream:](BMPublicStreamUtilities, "domainForStream:", +[BMPublicStreamUtilities streamForStreamIdentifier:v3]);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1B30A8F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B30A9F64(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t BMIdentifierIsPathSafe(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    id v3 = __biome_log_for_category(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      BMIdentifierIsPathSafe_cold_1();
    }
    goto LABEL_10;
  }
  if (![v1 length])
  {
    id v3 = __biome_log_for_category(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      BMIdentifierIsPathSafe_cold_2();
    }
    goto LABEL_10;
  }
  if ([v2 length] == 1)
  {
    id v3 = __biome_log_for_category(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      BMIdentifierIsPathSafe_cold_3();
    }
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  if ((unint64_t)[v2 length] > 0xFF)
  {
    uint64_t v4 = 0;
    goto LABEL_12;
  }
  id v3 = v2;
  uint64_t v6 = self;

  if (v6)
  {
    memset(v24, 0, sizeof(v24));
    CFIndex Length = CFStringGetLength((CFStringRef)v3);
    CFStringRef theString = (CFStringRef)v3;
    uint64_t v28 = 0;
    CFIndex v29 = Length;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)v3);
    CStringPtr = 0;
    os_log_type_t v26 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr((CFStringRef)v3, 0x600u);
    }
    int64_t v30 = 0;
    int64_t v31 = 0;
    v27 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v10 = 0;
      int64_t v11 = 0;
      int64_t v12 = 0;
      uint64_t v13 = 64;
      do
      {
        if ((unint64_t)v12 >= 4) {
          uint64_t v14 = 4;
        }
        else {
          uint64_t v14 = v12;
        }
        CFIndex v15 = v29;
        if (v29 <= v12)
        {
          UniChar v16 = 0;
        }
        else if (v26)
        {
          UniChar v16 = v26[v12 + v28];
        }
        else if (v27)
        {
          UniChar v16 = v27[v28 + v12];
        }
        else
        {
          if (v31 <= v12 || v11 > v12)
          {
            uint64_t v20 = v14 + v10;
            uint64_t v21 = v13 - v14;
            int64_t v22 = v12 - v14;
            CFIndex v23 = v22 + 64;
            if (v22 + 64 >= v29) {
              CFIndex v23 = v29;
            }
            int64_t v30 = v22;
            int64_t v31 = v23;
            if (v29 >= v21) {
              CFIndex v15 = v21;
            }
            v32.length = v15 + v20;
            v32.location = v22 + v28;
            CFStringGetCharacters(theString, v32, (UniChar *)v24);
            int64_t v11 = v30;
          }
          UniChar v16 = *((_WORD *)v24 + v12 - v11);
        }
        unsigned int v17 = (unsigned __int16)(v16 - 48);
        if (v12)
        {
          if (v17 >= 0xA && (unsigned __int16)((v16 & 0xFFDF) - 65) >= 0x1Au)
          {
            unsigned int v18 = v16 - 45;
            if (v18 > 0x32 || ((1 << v18) & 0x4000000002003) == 0) {
              goto LABEL_10;
            }
          }
        }
        else if (v17 >= 0xA {
               && (unsigned __int16)(v16 - 65) >= 0x1Au
        }
               && v16 != 95
               && (unsigned __int16)(v16 - 97) >= 0x1Au)
        {
          goto LABEL_10;
        }
        ++v12;
        --v10;
        ++v13;
      }
      while (Length != v12);
    }
  }
  uint64_t v4 = 1;
LABEL_11:

LABEL_12:
  return v4;
}

void bm_service_connection_handler(void *a1)
{
  id v1 = a1;
  id v2 = +[BMXPCListener serviceListener];
  uint64_t v3 = [v2 queue];
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = v3 == MEMORY[0x1E4F14428];
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    [v2 _handleConnection:v1];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __bm_service_connection_handler_block_invoke;
    v6[3] = &unk_1E6022F58;
    id v7 = v2;
    id v8 = v1;
    dispatch_sync(v4, v6);
  }
}

void sub_1B30AB68C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1B30ADA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v29 - 120));
  _Unwind_Resume(a1);
}

void sub_1B30ADF38(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1B30AE4B8(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 176));
  _Unwind_Resume(a1);
}

uint64_t BMShouldRetry(void *a1, unint64_t *a2, unint64_t a3, char a4)
{
  id v7 = a1;
  id v8 = v7;
  uint64_t v9 = 0;
  if (v7 && a2)
  {
    if (*a2 < a3
      && ([v7 domain],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqual:*MEMORY[0x1E4F281F8]],
          v10,
          v11))
    {
      if ([v8 code] == 4097 || (v12 = objc_msgSend(v8, "code"), uint64_t v9 = 0, (a4 & 1) != 0) && v12 == 4099)
      {
        ++*a2;
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

uint64_t bm_replace_file(int a1, int a2, int a3, void *a4, uint64_t a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = v9;
  memset(&v31, 0, sizeof(v31));
  long long v45 = 0u;
  memset(v46, 0, 31);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)path = 0u;
  if (a1 < 0)
  {
    int v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      bm_replace_file_cold_1();
    }
    goto LABEL_16;
  }
  if (a2 < 0)
  {
    int v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      bm_replace_file_cold_2();
    }
    goto LABEL_16;
  }
  if (a3 < 0)
  {
    int v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      bm_replace_file_cold_3();
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v9, "length", *(_OWORD *)&v31.st_dev, *(_OWORD *)&v31.st_uid, *(_OWORD *)&v31.st_atimespec, *(_OWORD *)&v31.st_mtimespec, *(_OWORD *)&v31.st_ctimespec, *(_OWORD *)&v31.st_birthtimespec, *(_OWORD *)&v31.st_size, *(_OWORD *)&v31.st_blksize, *(_OWORD *)v31.st_qspare, *(void *)path, *(void *)&path[8], v33, v34, v35, v36, v37, v38,
          v39,
          v40,
          v41,
          v42,
          v43,
          v44,
          v45,
          v46[0],
          *(void *)&v46[1],
          *((void *)&v46[1] + 1))
    || ([v10 containsString:@"/"] & 1) != 0
    || ([v10 isEqual:@"."] & 1) != 0
    || [v10 isEqual:@".."])
  {
    int v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      bm_replace_file_cold_4();
    }
LABEL_16:
    int v12 = 22;
LABEL_17:

    goto LABEL_18;
  }
  int v15 = fstat(a1, &v31);
  UniChar v16 = __error();
  if (v15)
  {
    int v12 = *v16;
    unsigned int v17 = __biome_log_for_category(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      bm_new_temporary_file_cold_4();
    }
LABEL_23:
    uint64_t v13 = 0xFFFFFFFFLL;
LABEL_24:

    goto LABEL_25;
  }
  if ((v31.st_mode & 0xF000) != 0x8000)
  {
    int v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      bm_new_temporary_file_cold_3();
    }
    int v12 = 79;
    goto LABEL_17;
  }
  if (v31.st_nlink)
  {
    int v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      bm_new_temporary_file_cold_2();
    }
    int v12 = 31;
    goto LABEL_17;
  }
  off_t v18 = lseek(a1, 0, 0);
  unint64_t v19 = __error();
  if (v18)
  {
    int v12 = *v19;
    unsigned int v17 = __biome_log_for_category(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      bm_replace_file_cold_14();
    }
    goto LABEL_23;
  }
  if ((a5 & 0xFFFFFFFB) == 2)
  {
LABEL_42:
    if (__strlcpy_chk() != 15)
    {
      int v11 = __biome_log_for_category(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
LABEL_57:
      }
        bm_replace_file_cold_10();
LABEL_58:
      int v12 = 14;
      goto LABEL_17;
    }
    int v20 = a3;
    uint64_t v13 = mkostempsat_np(a2, path, 0, 0x1000000);
    uint64_t v21 = __error();
    if ((v13 & 0x80000000) != 0)
    {
      int v12 = *v21;
      unsigned int v17 = __biome_log_for_category(2);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        bm_replace_file_cold_6();
      }
      goto LABEL_24;
    }
    if (a5 != -1)
    {
      int v22 = _bm_set_protection_class(v13, a5);
      CFIndex v23 = __error();
      if (v22)
      {
        int v12 = *v23;
        goto LABEL_71;
      }
    }
    int v25 = fcopyfile(a1, v13, 0, 8u);
    os_log_type_t v26 = __error();
    if (v25)
    {
      int v12 = *v26;
      v27 = __biome_log_for_category(2);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        bm_replace_file_cold_9();
      }
    }
    else
    {
LABEL_65:
      int v29 = renameat(a2, path, v20, (const char *)[v10 fileSystemRepresentation]);
      int64_t v30 = __error();
      if (!v29) {
        goto LABEL_19;
      }
      int v12 = *v30;
      v27 = __biome_log_for_category(2);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        bm_replace_file_cold_8();
      }
    }
  }
  else
  {
    do
    {
      if (__strlcpy_chk() != 15)
      {
        int v11 = __biome_log_for_category(2);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      mktemp(path);
      int v24 = fclonefileat(a1, a2, path, 3u);
      int v12 = *__error();
    }
    while (v24 && v12 == 17);
    if (v24)
    {
      if (v12 == 45) {
        goto LABEL_42;
      }
      unsigned int v17 = __biome_log_for_category(2);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        bm_replace_file_cold_12();
      }
      goto LABEL_23;
    }
    int v20 = a3;
    uint64_t v13 = openat(a2, path, 2);
    uint64_t v28 = __error();
    if ((v13 & 0x80000000) == 0) {
      goto LABEL_65;
    }
    int v12 = *v28;
    v27 = __biome_log_for_category(2);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      bm_replace_file_cold_11();
    }
  }

LABEL_71:
  if (unlinkat(a2, path, 0))
  {
    unsigned int v17 = __biome_log_for_category(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      bm_replace_file_cold_7(v17);
    }
    goto LABEL_24;
  }
LABEL_25:
  if (!v12) {
    goto LABEL_19;
  }
  if ((v13 & 0x80000000) == 0 && close(v13))
  {
    int v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      bm_openat_dprotected_cold_2(v11);
    }
    goto LABEL_17;
  }
LABEL_18:
  *__error() = v12;
  uint64_t v13 = 0xFFFFFFFFLL;
LABEL_19:

  return v13;
}

void sub_1B30B00C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t BMSandboxCheck(_OWORD *a1, void *a2, unsigned int a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = (__CFString *)v7;
  [(__CFString *)v9 UTF8String];
  if ((a3 & 0x87FFFFFF) <= 0xE)
  {
    if (((1 << a3) & 0x100E) != 0)
    {
      [(__CFString *)v8 UTF8String];
LABEL_6:
      long long v10 = a1[1];
      *(_OWORD *)buf = *a1;
      *(_OWORD *)&buf[16] = v10;
      goto LABEL_7;
    }
    if (((1 << a3) & 0x4400) != 0)
    {
      [(__CFString *)v8 unsignedIntValue];
      goto LABEL_6;
    }
    if ((a3 & 0x87FFFFFF) == 0)
    {
      long long v20 = a1[1];
      *(_OWORD *)buf = *a1;
      *(_OWORD *)&buf[16] = v20;
LABEL_7:
      uint64_t v11 = sandbox_check_by_audit_token();
      int v12 = *__error();
      uint64_t v13 = @"sandboxed";
      if (v9) {
        uint64_t v13 = v9;
      }
      uint64_t v14 = v13;

      switch(v11)
      {
        case 0xFFFFFFFF:
          int v15 = __biome_log_for_category(0);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          UniChar v16 = @", ";
          *(_DWORD *)buf = 138544130;
          unsigned int v17 = &stru_1F0B3A038;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 2114;
          if (v8) {
            unsigned int v17 = v8;
          }
          else {
            UniChar v16 = &stru_1F0B3A038;
          }
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v17;
          __int16 v25 = 1024;
          int v26 = v12;
          off_t v18 = "BMSandboxCheck(%{public}@%{public}@%{public}@) failed with error %{darwin.errno}d";
          break;
        case 0:
LABEL_22:
          id v9 = v14;
          goto LABEL_23;
        case 1:
          if ((*MEMORY[0x1E4F14100] & ~a3) != 0) {
            uint64_t v11 = 2;
          }
          else {
            uint64_t v11 = 1;
          }
          goto LABEL_22;
        default:
          int v15 = __biome_log_for_category(0);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
LABEL_21:

            uint64_t v11 = 0xFFFFFFFFLL;
            goto LABEL_22;
          }
          int v22 = @", ";
          *(_DWORD *)buf = 138544130;
          CFIndex v23 = &stru_1F0B3A038;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 2114;
          if (v8) {
            CFIndex v23 = v8;
          }
          else {
            int v22 = &stru_1F0B3A038;
          }
          *(void *)&buf[14] = v22;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v23;
          __int16 v25 = 1024;
          int v26 = v11;
          off_t v18 = "sandbox_check(%{public}@%{public}@%{public}@) returned unexpected value %d";
          break;
      }
      _os_log_error_impl(&dword_1B30A0000, v15, OS_LOG_TYPE_ERROR, v18, buf, 0x26u);
      goto LABEL_21;
    }
  }
  uint64_t v21 = __biome_log_for_category(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    BMSandboxCheck_cold_1(a3, v21);
  }

  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_23:

  return v11;
}

void sub_1B30B2198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,os_unfair_lock_t lock)
{
}

id BMNonnullSetOfStringsFromEntitlementValue(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithObject:v1];
LABEL_16:
    uint64_t v3 = (void *)v2;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    uint64_t v2 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_16;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObject:", v9, (void)v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

LABEL_17:
  return v3;
}

void BMExpandBiomeStreamsPremigrationIdentifiersAccessModeDictionary(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(v1, "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [v1 objectForKeyedSubscript:v7];
        if (v8)
        {
          uint64_t v9 = BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier(v7);
          if (v9) {
            [v1 setObject:v8 forKeyedSubscript:v9];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

id BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier(uint64_t a1)
{
  return +[BMStreamMigrations libraryPathForStreamIdentifier:a1];
}

id BMAppleInternalVariantOfEntitlement(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"com.apple.private.", @"com.apple.internal.", 8, 0, objc_msgSend(v1, "length"));

  return v2;
}

void BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v1 allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v27;
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v5 = 0;
      uint64_t v20 = v3;
      do
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v26 + 1) + 8 * v5);
        uint64_t v7 = [v1 objectForKeyedSubscript:v6];
        if (v7)
        {
          id v8 = __softlink__BiomeLibraryAndInternalLibraryNode();
          uint64_t v9 = [v8 streamWithIdentifier:v6 error:0];
          long long v10 = v9;
          if (v9)
          {
            long long v11 = [v9 valueForKeyPath:@"configuration.streamUUID.UUIDString"];
            [v1 setObject:v7 forKeyedSubscript:v11];
            long long v12 = [v10 valueForKeyPath:@"configuration.legacyNames"];
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v23;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v23 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  [v1 setObject:v7 forKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * i)];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v14);
            }

            uint64_t v4 = v19;
            uint64_t v3 = v20;
          }
          else
          {
            uint64_t v17 = BMBiomeLibraryIdentifierForUUIDString_onceToken;
            id v18 = v6;
            if (v17 != -1) {
              dispatch_once(&BMBiomeLibraryIdentifierForUUIDString_onceToken, &__block_literal_global_280);
            }
            long long v11 = [(id)BMBiomeLibraryIdentifierForUUIDString_mapping objectForKeyedSubscript:v18];

            if (v11) {
              [v1 setObject:v7 forKeyedSubscript:v11];
            }
          }
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v3);
  }
}

void sub_1B30B2B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1B30B2C84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __softlink__BiomeLibraryAndInternalLibraryNode()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void (*)(void))getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr;
  uint64_t v7 = getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr;
  if (!getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr)
  {
    id v1 = (void *)BiomeStreamsLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BiomeLibraryAndInternalLibraryNode");
    getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    __softlink__BiomeLibraryAndInternalLibraryNode_cold_1();
  }
  uint64_t v2 = v0();
  return v2;
}

void sub_1B30B3430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMResourceTypeFromEntitlementResourceTypeString(uint64_t a1)
{
  id v1 = [&unk_1F0B435A8 objectForKeyedSubscript:a1];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedLongLongValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t BiomeStreamsLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __BiomeStreamsLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6022A50;
    uint64_t v4 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BiomeStreamsLibraryCore_frameworkLibrary;
  if (!BiomeStreamsLibraryCore_frameworkLibrary) {
    BiomeStreamsLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (!*(unsigned char *)(a1 + 48) || [v5 isEqualToNumber:&unk_1F0B42DA8])
  {
    uint64_t v7 = [[BMResourceSpecifier alloc] initWithType:*(void *)(a1 + 40) name:v8];
    if (v7) {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
    }
  }
}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2_271(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  uint64_t v6 = [[BMResourceSpecifier alloc] initWithType:1 name:v5];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  uint64_t v6 = [[BMResourceSpecifier alloc] initWithType:1 name:v5];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
}

__CFString *BMAccessModePrintableDescription(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown (%llu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6022B00[a1];
  }
  return v1;
}

void sub_1B30B5B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B30B6794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v47 - 224));
  _Unwind_Resume(a1);
}

void sub_1B30B6A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMServiceDomainForResource(void *a1)
{
  id v1 = a1;
  switch([v1 type])
  {
    case 1:
      uint64_t v2 = [v1 name];
      uint64_t v3 = BMServiceDomainForStream(2, v2);
      goto LABEL_5;
    case 2:
    case 3:
    case 4:
      uint64_t v2 = [v1 name];
      uint64_t v3 = 0;
LABEL_5:

      break;
    default:
      uint64_t v3 = 0;
      break;
  }

  return v3;
}

void sub_1B30B7CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B30B8970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ____biome_log_for_category_block_invoke(uint64_t a1)
{
  *((void *)&categories + 3 * *(void *)(a1 + 32) + 1) = os_log_create("com.apple.Biome", *((const char **)&categories + 3 * *(void *)(a1 + 32)+ 2));
  return MEMORY[0x1F41817F8]();
}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_267(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  uint64_t v6 = [[BMResourceSpecifier alloc] initWithType:1 name:v5];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
}

uint64_t __bm_service_connection_handler_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnection:*(void *)(a1 + 40)];
}

void __BMBiomeLibraryIdentifierForUUIDString_block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_new();
  id v1 = __softlink__BiomeLibraryAndInternalLibraryNode();
  uint64_t v2 = [v1 allStreams];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [v7 valueForKeyPath:@"configuration.streamUUID.UUIDString"];
        uint64_t v9 = [v7 valueForKeyPath:@"configuration.streamIdentifier"];
        [v0 setObject:v9 forKeyedSubscript:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v0];
  long long v11 = (void *)BMBiomeLibraryIdentifierForUUIDString_mapping;
  BMBiomeLibraryIdentifierForUUIDString_mapping = v10;
}

void sub_1B30BAD84(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B30BADE8(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1B30BADF4);
  }
  JUMPOUT(0x1B30BADE0);
}

void sub_1B30BB484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B30BB714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BMPremigratedStreamIdentifierForBiomeLibraryStreamIdentifier(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v9 = [v3 objectForKeyedSubscript:v8];
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  uint64_t v10 = +[BMStreamMigrations libraryRestrictedStreamMigrationPaths];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        uint64_t v16 = [v10 objectForKeyedSubscript:v15];
        [v2 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [v2 objectForKeyedSubscript:v1];

  return v17;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id legacyViewResourceMapper()
{
  if (legacyViewResourceMapper__pasOnceToken2 != -1) {
    dispatch_once(&legacyViewResourceMapper__pasOnceToken2, &__block_literal_global);
  }
  uint64_t v0 = (void *)legacyViewResourceMapper__pasExprOnceResult;
  return v0;
}

id BMSyncableStreamIdentifiers()
{
  if (BMSyncableStreamIdentifiers_onceToken != -1) {
    dispatch_once(&BMSyncableStreamIdentifiers_onceToken, &__block_literal_global_241);
  }
  uint64_t v0 = (void *)BMSyncableStreamIdentifiers_identifiers;
  return v0;
}

void __legacyViewResourceMapper_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1B3EB5880]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)legacyViewResourceMapper__pasExprOnceResult;
  legacyViewResourceMapper__pasExprOnceResult = v1;
}

void __BMSyncableStreamIdentifiers_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v1 = (void *)getBMStreamSyncPolicyClass_softClass;
  uint64_t v14 = getBMStreamSyncPolicyClass_softClass;
  if (!getBMStreamSyncPolicyClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getBMStreamSyncPolicyClass_block_invoke;
    v10[3] = &unk_1E60229E8;
    v10[4] = &v11;
    __getBMStreamSyncPolicyClass_block_invoke((uint64_t)v10);
    uint64_t v1 = (void *)v12[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v11, 8);
  uint64_t v3 = [v2 valueForKeyPath:@"syncableStreamConfigurations.streamIdentifier"];
  [v0 addObjectsFromArray:v3];

  uint64_t v4 = +[BMAccessControlPolicy contextSyncMapping];
  uint64_t v5 = [v4 allKeys];
  [v0 addObjectsFromArray:v5];

  uint64_t v6 = +[BMAccessControlPolicy contextSyncMapping];
  id v7 = [v6 allValues];
  [v0 addObjectsFromArray:v7];

  [v0 addObject:@"Location.Semantic"];
  uint64_t v8 = [v0 copy];
  uint64_t v9 = (void *)BMSyncableStreamIdentifiers_identifiers;
  BMSyncableStreamIdentifiers_identifiers = v8;
}

void sub_1B30BE870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMStreamSyncPolicyClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMStreamSyncPolicy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMStreamSyncPolicyClass_block_invoke_cold_1();
  }
  getBMStreamSyncPolicyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiomeStreamsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeStreamsLibraryCore_frameworkLibrary = result;
  return result;
}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  uint64_t v6 = [[BMResourceSpecifier alloc] initWithType:1 name:v5];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
}

void *__getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)BiomeStreamsLibrary();
  uint64_t result = dlsym(v2, "BiomeLibraryAndInternalLibraryNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t BMDevicePlatformFromModelString(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"iPhone"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 hasPrefix:@"iPad"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 hasPrefix:@"Watch"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 hasPrefix:@"AppleTV"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 hasPrefix:@"AudioAccessory"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 hasPrefix:@"MacBook"])
  {
    uint64_t v2 = 4;
  }
  else if (([v1 hasPrefix:@"Mac"] & 1) != 0 {
         || ([v1 hasPrefix:@"iMac"] & 1) != 0)
  }
  {
    uint64_t v2 = 3;
  }
  else if ([v1 hasPrefix:@"RealityDevice"])
  {
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *BMDevicePlatformGetDescription(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%lu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6022B48[a1];
  }
  return v1;
}

void sub_1B30BF66C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B30BF938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return [v0 pid];
}

uint64_t BMDataProtectionClassFromNSFileProtectionType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F28378]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F28358]])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F28348]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F28340]])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 3;
  }

  return v2;
}

void sub_1B30C0E4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B30C0FD8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B30C10F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B30C1968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v29 - 120));
  _Unwind_Resume(a1);
}

void sub_1B30C1CB8(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 120));
  _Unwind_Resume(a1);
}

__CFString *BMResourceContainerTypeDescription(unsigned int a1)
{
  if (a1 - 1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%u)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6022EF0[(char)(a1 - 1)];
  }
  return v1;
}

void sub_1B30C3198(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B30C32E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *BMResourceOptionsDescription(int a1)
{
  if (a1)
  {
    char v1 = a1;
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = v2;
    if (v1) {
      [v2 addObject:@"UserVault"];
    }
    uint64_t v4 = [v3 componentsJoinedByString:@"|"];
  }
  else
  {
    uint64_t v4 = &stru_1F0B3A038;
  }
  return v4;
}

__CFString *BMDevicePlatformToString(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Platform(%lu)", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E6023020[a1];
  }
  return v1;
}

__CFString *BMDevicePlatformOptionsToString(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((~(_WORD)a1 & 0x1FE) == 0)
  {
    uint64_t v2 = @"All";
    goto LABEL_23;
  }
  uint64_t v3 = objc_opt_new();
  while (1)
  {
    uint64_t v4 = v1 & -v1;
    if (v4 <= 15) {
      break;
    }
    if (v4 <= 63)
    {
      if (v4 == 16)
      {
        id v5 = @"MacPortable";
        goto LABEL_21;
      }
      if (v4 == 32)
      {
        id v5 = @"TV";
        goto LABEL_21;
      }
    }
    else
    {
      switch(v4)
      {
        case 64:
          id v5 = @"Watch";
          goto LABEL_21;
        case 128:
          id v5 = @"HomePod";
          goto LABEL_21;
        case 256:
          id v5 = @"Vision";
          goto LABEL_21;
      }
    }
LABEL_20:
    objc_msgSend(NSString, "stringWithFormat:", @"Platform(%lu)", v1 & -v1);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    [v3 addObject:v5];

    v1 ^= v4;
  }
  id v5 = @"Unknown";
  switch(v4)
  {
    case 0:
      uint64_t v2 = [v3 componentsJoinedByString:@", "];

      break;
    case 1:
      goto LABEL_21;
    case 2:
      id v5 = @"iPad";
      goto LABEL_21;
    case 4:
      id v5 = @"iPhone";
      goto LABEL_21;
    case 8:
      id v5 = @"MacDesktop";
      goto LABEL_21;
    default:
      goto LABEL_20;
  }
LABEL_23:
  return v2;
}

void sub_1B30C4140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B30C460C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return MEMORY[0x1F40E7228](v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

uint64_t BMServiceDomainForSet()
{
  return 0;
}

uint64_t BMServiceDomainLookupFromConfigurationForSet(void *a1)
{
  id v1 = a1;
  uint64_t v2 = getCCSetLibraryConfigurationRegistryClass();
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = [v2 configurationForSetIdentifier:v1];
    id v5 = v4;
    if (v4
      && ([v4 valueForKeyPath:@"resourceDomain"],
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = v6;
      uint64_t v8 = [v6 integerValue];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v9 = __biome_log_for_category(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      BMServiceDomainLookupFromConfigurationForSet_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

id getCCSetLibraryConfigurationRegistryClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCCSetLibraryConfigurationRegistryClass_softClass;
  uint64_t v7 = getCCSetLibraryConfigurationRegistryClass_softClass;
  if (!getCCSetLibraryConfigurationRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCCSetLibraryConfigurationRegistryClass_block_invoke;
    v3[3] = &unk_1E60229E8;
    v3[4] = &v4;
    __getCCSetLibraryConfigurationRegistryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B30C5324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMServiceDomainOverrideLookupFromConfigurationForSet(void *a1)
{
  id v1 = a1;
  uint64_t v2 = BMServiceDomainLookupFromConfigurationForSet(v1);
  uint64_t v3 = BMResourceDescriptorsLookupFromConfigurationForSet(v1);

  if (BMServiceDomainSystemOverrideIsPresentInDescriptors(v3)) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }

  return v4;
}

id BMResourceDescriptorsLookupFromConfigurationForSet(void *a1)
{
  id v1 = a1;
  uint64_t v2 = getCCSetLibraryConfigurationRegistryClass();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 configurationForSetIdentifier:v1];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 valueForKeyPath:@"configuredDescriptors"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = __biome_log_for_category(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      BMServiceDomainLookupFromConfigurationForSet_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t BMServiceDomainSystemOverrideIsPresentInDescriptors(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "key", (void)v12);
        if ([v7 isEqualToString:@"domainOverride"])
        {
          uint64_t v8 = [v6 value];
          char v9 = [v8 isEqualToString:@"system"];

          if (v9)
          {
            uint64_t v10 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

id BMResourceSyncPolicyLookupFromConfigurationForSet(void *a1)
{
  id v1 = a1;
  uint64_t v2 = getCCSetLibraryConfigurationRegistryClass();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 configurationForSetIdentifier:v1];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 valueForKeyPath:@"syncPolicy"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = __biome_log_for_category(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      BMServiceDomainLookupFromConfigurationForSet_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

void *__getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary_0)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __BiomeStreamsLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6023198;
    uint64_t v6 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v2 = (void *)BiomeStreamsLibraryCore_frameworkLibrary_0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary_0) {
    __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "BiomeLibraryAndInternalLibraryNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiomeStreamsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BiomeStreamsLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCCSetLibraryConfigurationRegistryClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __IntelligencePlatformLibraryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E60231B0;
    uint64_t v5 = 0;
    IntelligencePlatformLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary) {
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

uint64_t __IntelligencePlatformLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntelligencePlatformLibraryLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B30C5FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRBSProcessHandleClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSProcessHandle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSProcessHandleClass_block_invoke_cold_1();
  }
  getRBSProcessHandleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void RunningBoardServicesLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __RunningBoardServicesLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E60231D8;
    uint64_t v2 = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RunningBoardServicesLibraryCore_frameworkLibrary) {
    RunningBoardServicesLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRBSTargetClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSTarget");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSTargetClass_block_invoke_cold_1();
  }
  getRBSTargetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSAssertionClass_block_invoke_cold_1();
  }
  getRBSAssertionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSDomainAttributeClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSDomainAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSDomainAttributeClass_block_invoke_cold_1();
  }
  getRBSDomainAttributeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSAcquisitionCompletionAttributeClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSAcquisitionCompletionAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1();
  }
  getRBSAcquisitionCompletionAttributeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void __BMStreamsPathRegex_block_invoke()
{
  v9[14] = *MEMORY[0x1E4F143B8];
  v9[0] = @"path";
  v9[1] = @"streamType";
  v9[2] = @"stream";
  v9[3] = @"lock";
  v9[4] = @"metadata";
  v9[5] = @"deviceType";
  v9[6] = @"tombstone";
  v9[7] = @"segment";
  v9[8] = @"deviceType";
  v9[9] = @"device";
  v9[10] = @"tombstone";
  v9[11] = @"segment";
  v9[12] = @"subscriptions";
  v9[13] = @"segment";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:14];
  long long v1 = (void *)BMStreamsPathRegex_names;
  BMStreamsPathRegex_names = v0;

  id v8 = 0;
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^streams/(public|restricted)(?:/([a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)(?:(/lock)|(/metadata)|(/local)(/tombstone)?(/[0-9][0-9]*+)?|(/remote)(?:(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})(/tombstone)?(/[0-9][0-9]*+)?)?|(/subscriptions)(/[0-9][0-9]*+)?))?$" options:0 error:&v8];
  id v3 = v8;
  long long v4 = (void *)BMStreamsPathRegex_regex;
  BMStreamsPathRegex_regex = v2;

  if (v3)
  {
    uint64_t v5 = __biome_log_for_category(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __BMStreamsPathRegex_block_invoke_cold_1();
    }

    uint64_t v6 = (void *)BMStreamsPathRegex_regex;
    BMStreamsPathRegex_regex = 0;

    uint64_t v7 = (void *)BMStreamsPathRegex_names;
    BMStreamsPathRegex_names = 0;
  }
}

void __BMComputePathRegex_block_invoke()
{
  v9[16] = *MEMORY[0x1E4F143B8];
  v9[0] = @"path";
  v9[1] = @"artifacts";
  v9[2] = @"artifactIdentifier";
  v9[3] = @"persistent";
  v9[4] = @"clientIdentifier";
  v9[5] = @"subscriptionIdentifier";
  v9[6] = @"sessions";
  v9[7] = @"sessionIdentifier";
  v9[8] = @"bookmarks";
  v9[9] = @"client";
  v9[10] = @"clientIdentifier";
  v9[11] = @"subscriptionIdentifier";
  v9[12] = @"sessions";
  v9[13] = @"sessionIdentifier";
  v9[14] = @"subscriptions";
  void v9[15] = @"stream";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:16];
  long long v1 = (void *)BMComputePathRegex_names;
  BMComputePathRegex_names = v0;

  id v8 = 0;
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^compute(?:(/artifacts)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)|(/persistent)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)?|(/sessions)(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})(/bookmarks)(/client)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)?|(/sessions)(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})(/subscriptions)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)?)$" options:0 error:&v8];
  id v3 = v8;
  long long v4 = (void *)BMComputePathRegex_regex;
  BMComputePathRegex_regex = v2;

  if (v3)
  {
    uint64_t v5 = __biome_log_for_category(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __BMStreamsPathRegex_block_invoke_cold_1();
    }

    uint64_t v6 = (void *)BMComputePathRegex_regex;
    BMComputePathRegex_regex = 0;

    uint64_t v7 = (void *)BMComputePathRegex_names;
    BMComputePathRegex_names = 0;
  }
}

BOOL BMValidateResourceSyncTransportType(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

uint64_t BMStorageErrorGetErrno(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  uint64_t v3 = *MEMORY[0x1E4F28798];
  int v4 = [v2 isEqual:*MEMORY[0x1E4F28798]];

  if (v4)
  {
    uint64_t v5 = [v1 code];
  }
  else
  {
    uint64_t v6 = [v1 domain];
    int v7 = [v6 isEqual:@"BiomeStorageError"];

    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = objc_msgSend(v1, "underlyingErrors", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v14 = [v13 domain];
            char v15 = [v14 isEqual:v3];

            if (v15)
            {
              uint64_t v5 = [v13 code];

              goto LABEL_15;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v5 = 0;
  }
LABEL_15:

  return v5;
}

uint64_t BMStorageErrorShouldTryAgainLater(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  int v3 = [v2 isEqual:@"BiomeStorageError"];

  if (v3 && [v1 code] == 5)
  {
    int v4 = [v1 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"UserControlled"];
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_1B30C70D0(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1B30C74F4(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void ___bm_supports_openat_dprotected_syscall_block_invoke()
{
  id v0 = +[BMProcess current];
  _bm_supports_openat_dprotected_syscall_supported = [v0 canPerformSyscall:&unk_1F0B42E98 report:0];
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void *__getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary_1)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __BiomeStreamsLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6023358;
    uint64_t v6 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v2 = (void *)BiomeStreamsLibraryCore_frameworkLibrary_1;
  if (!BiomeStreamsLibraryCore_frameworkLibrary_1) {
    __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1_0(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "BiomeLibraryAndInternalLibraryNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiomeStreamsLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  BiomeStreamsLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t BMEntitlementIsAppleInternal(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"com.apple.internal."];
}

id BMRegularVariantOfAppleInternalEntitlement(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"com.apple.internal.", @"com.apple.private.", 8, 0, objc_msgSend(v1, "length"));

  return v2;
}

id get_DKMachServiceName()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  id v0 = (void **)get_DKMachServiceNameSymbolLoc_ptr;
  uint64_t v7 = get_DKMachServiceNameSymbolLoc_ptr;
  if (!get_DKMachServiceNameSymbolLoc_ptr)
  {
    id v1 = (void *)CoreDuetLibrary();
    v5[3] = (uint64_t)dlsym(v1, "_DKMachServiceName");
    get_DKMachServiceNameSymbolLoc_ptr = v5[3];
    id v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    get_DKMachServiceName_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1B30C9D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B30CA0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v21 - 96), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t CoreDuetLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreDuetLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E60234D8;
    uint64_t v4 = 0;
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreDuetLibraryCore_frameworkLibrary;
  if (!CoreDuetLibraryCore_frameworkLibrary) {
    CoreDuetLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreDuetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreDuetLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

void __getBMStreamSyncPolicyClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getBMStreamSyncPolicyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAccessControlPolicy.m", 41, @"Unable to find class %s", "BMStreamSyncPolicy");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *BiomeStreamsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMAccessControlPolicy.m", 39, @"%s", *a1);

  __break(1u);
}

void __softlink__BiomeLibraryAndInternalLibraryNode_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"id<_BMRootLibrary> __softlink__BiomeLibraryAndInternalLibraryNode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAccessControlPolicy.m", 40, @"%s", dlerror());

  __break(1u);
}

void BMServiceDomainForStream_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"id<_BMRootLibrary> __softlink__BiomeLibraryAndInternalLibraryNode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMServiceDomain.m", 31, @"%s", dlerror());

  __break(1u);
}

void BMServiceDomainLookupFromConfigurationForSet_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *BiomeStreamsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMServiceDomain.m", 30, @"%s", *a1);

  __break(1u);
}

void __getCCSetLibraryConfigurationRegistryClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *IntelligencePlatformLibraryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMServiceDomain.m", 32, @"%s", *a1);

  __break(1u);
}

void __getCCSetLibraryConfigurationRegistryClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getCCSetLibraryConfigurationRegistryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMServiceDomain.m", 33, @"Unable to find class %s", "CCSetLibraryConfigurationRegistry");

  __break(1u);
}

void BMSandboxCheck_cold_1(unsigned int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "BMSandboxCheck: unexpected filter %lx", (uint8_t *)&v2, 0xCu);
}

void __getRBSProcessHandleClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getRBSProcessHandleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMProcess.m", 32, @"Unable to find class %s", "RBSProcessHandle");

  __break(1u);
}

void RunningBoardServicesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMProcess.m", 31, @"%s", *a1);

  __break(1u);
}

void __getRBSTargetClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getRBSTargetClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMProcess.m", 33, @"Unable to find class %s", "RBSTarget");

  __break(1u);
}

void __getRBSAssertionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getRBSAssertionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMProcess.m", 35, @"Unable to find class %s", "RBSAssertion");

  __break(1u);
}

void __getRBSDomainAttributeClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getRBSDomainAttributeClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMProcess.m", 34, @"Unable to find class %s", "RBSDomainAttribute");

  __break(1u);
}

void __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getRBSAcquisitionCompletionAttributeClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMProcess.m", 36, @"Unable to find class %s", "RBSAcquisitionCompletionAttribute");

  __break(1u);
}

void BMIdentifierIsPathSafe_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Nil identifier", v2, v3, v4, v5, v6);
}

void BMIdentifierIsPathSafe_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Empty identifier", v2, v3, v4, v5, v6);
}

void BMIdentifierIsPathSafe_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Identifier too short", v2, v3, v4, v5, v6);
}

void BMValidatePath_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Failed to parse path validation regular expression", v2, v3, v4, v5, v6);
}

void BMValidatePath_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Shared sync is not supported on this platform", v2, v3, v4, v5, v6);
}

void __BMStreamsPathRegex_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1B30A0000, v0, OS_LOG_TYPE_FAULT, "Failed to parse path validation regular expression", v1, 2u);
}

void bm_openat_dprotected_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1B30A0000, v0, OS_LOG_TYPE_FAULT, "bm_opendirat() unexpectedly returned atfd", v1, 2u);
}

void bm_openat_dprotected_cold_2(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1B30A0000, a1, v2, "close() failed: %{darwin.errno}d", v3);
}

void bm_openat_dprotected_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "bm_openat_dprotected() failed: invalid path", v2, v3, v4, v5, v6);
}

void bm_opendirat_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 componentsJoinedByString:@","];
  int v6 = 138478083;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_fault_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_FAULT, "bm_opendirat(\"%{private}@\") failed with sequence: %{public}@", (uint8_t *)&v6, 0x16u);
}

void bm_opendirat_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "bm_opendirat() passed invalid mode 0x%x", v2, v3, v4, v5, v6);
}

void bm_opendirat_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "bm_opendirat() failed: nil enumerator", v2, v3, v4, v5, v6);
}

void bm_opendirat_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "bm_opendirat() passed invalid path", v2, v3, v4, v5, v6);
}

void bm_opendirat_cold_5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "bm_opendirat() should be passed O_DIRECTORY", v2, v3, v4, v5, v6);
}

void bm_opendirat_cold_6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "bm_opendirat() cannot be passed both O_NOFOLLOW and O_NOFOLLOW_ANY", v2, v3, v4, v5, v6);
}

void bm_opendirat_cold_7()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "bm_opendirat() should be passed O_NOFOLLOW or O_NOFOLLOW_ANY", v2, v3, v4, v5, v6);
}

void bm_opendirat_cold_8()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "bm_opendirat() passed invalid set of flags 0x%x", v2, v3, v4, v5, v6);
}

void _bm_set_protection_class_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_fault_impl(&dword_1B30A0000, v1, OS_LOG_TYPE_FAULT, "fcntl(fd, F_SETPROTECTIONCLASS, %d) failed: %{darwin.errno}d", v2, 0xEu);
}

void _bm_set_protection_class_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_1B30A0000, v0, OS_LOG_TYPE_FAULT, "fcntl(fd, F_GETPROTECTIONCLASS) failed: %{darwin.errno}d", v1, 8u);
}

void bm_new_temporary_file_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Invalid tmp dir parameter", v2, v3, v4, v5, v6);
}

void bm_new_temporary_file_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "stat check: too many links", v2, v3, v4, v5, v6);
}

void bm_new_temporary_file_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "stat check: invalid file type", v2, v3, v4, v5, v6);
}

void bm_new_temporary_file_cold_4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "fstat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void bm_new_temporary_file_cold_5()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "unlinkat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void bm_new_temporary_file_cold_6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Invalid protection parameter", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Missing src file handle parameter", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Missing tmp file handle parameter", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Missing dst file handle parameter", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Invalid path parameter", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_6()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "mkostempsat_np() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_7(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1B30A0000, a1, v2, "unlinkat() failed: %{darwin.errno}d", v3);
}

void bm_replace_file_cold_8()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "renameat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_9()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "fcopyfile() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_10()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "strlcpy() failed", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_11()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "openat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_12()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "fclonefileat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void bm_replace_file_cold_14()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_2(&dword_1B30A0000, v0, v1, "lseek() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BiomeStreamsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMAccessServer.m", 29, @"%s", *a1);

  __break(1u);
}

void get_DKMachServiceName_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *get_DKMachServiceName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAccessConnectionFactory.m", 26, @"%s", dlerror());

  __break(1u);
}

void CoreDuetLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMAccessConnectionFactory.m", 24, @"%s", *a1);

  __break(1u);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _NSDefaultFileSystemEncoding()
{
  return MEMORY[0x1F40E7320]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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
  return MEMORY[0x1F415B160]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint64_t aks_get_extended_device_state()
{
  return MEMORY[0x1F410A5E8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E300](atoken);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1F40CB550]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1F40CB5D0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1F40CB650]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1F40CB720]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1F40CB730]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1F40CB738]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1F40CB740]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1F40CB750]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1F40CB760]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1F40CB770]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1F40CB780]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1F40CC048](*(void *)&a1, *(void *)&a2, a3, *(void *)&a4);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CC060](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1F40CC078](*(void *)&a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1F40CC2D0](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1F40CCDD8](*(void *)&a1, a2, a3);
}

int mkostempsat_np(int dfd, char *path, int slen, int oflags)
{
  return MEMORY[0x1F40CCDF8](*(void *)&dfd, path, *(void *)&slen, *(void *)&oflags);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCE28](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

void objc_terminate(void)
{
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40CD100](*(void *)&a1, a2, *(void *)&a3);
}

int openat_dprotected_np(int a1, const char *a2, int a3, int a4, int a5, ...)
{
  return MEMORY[0x1F40CD110](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C0](audittoken, buffer, *(void *)&buffersize);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1F40CDC68](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int removefileat(int fd, const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1F40CDD40](*(void *)&fd, path, state, *(void *)&flags);
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return MEMORY[0x1F40CDD60](*(void *)&a1, a2, *(void *)&a3, a4);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1F40CDD70](a1, a2, *(void *)&a3);
}

void rewinddir(DIR *a1)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t sysctlbyname_get_data_np()
{
  return MEMORY[0x1F40CE3D8]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CE5E8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1F40CE780]();
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x1F40CE788]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
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

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBC0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

au_asid_t xpc_connection_get_asid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEBE0](connection);
}

gid_t xpc_connection_get_egid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC00](connection);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC08](connection);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1F40CEC18](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1F40CEC70]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1F40CF018](connection);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1F40CF0B8](*(void *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1F40CF0D0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}