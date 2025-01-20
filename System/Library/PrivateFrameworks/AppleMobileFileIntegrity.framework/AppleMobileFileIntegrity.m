BOOL amfi_developer_mode_status()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0, 0) && v2 == 1;
}

uint64_t AMFIExecutionPreflight(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a3;
  if ((a2 - 2) < 4 || a2 == 11)
  {
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    id v60 = v8;
    v61 = a4;
    id v59 = v9;
    if (!v10 || ![v10 count])
    {
      v19 = [[AMFIPathValidator_ios alloc] initWithURL:v9];
      id v20 = 0;
      id v21 = 0;
      id v22 = 0;
      id v23 = 0;
      v24 = 0;
      goto LABEL_12;
    }
    id v12 = v9;
    id v58 = v11;
    v13 = [v58 objectForKey:@"sliceOffset"];
    objc_opt_class();
    id v14 = v13;
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    v57 = v12;
    if (v14 && !v16)
    {
      v17 = [[AMFIError alloc] initWithAMFIErrorCode:-404 withURL:v12];
      v18 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        AMFIExecutionPreflight_cold_4();
      }
      goto LABEL_50;
    }
    v32 = [v58 objectForKey:@"cpuType"];

    objc_opt_class();
    id v14 = v32;
    if (objc_opt_isKindOfClass()) {
      v33 = v14;
    }
    else {
      v33 = 0;
    }
    id v34 = v33;

    if (v14 && !v34)
    {
      v17 = [[AMFIError alloc] initWithAMFIErrorCode:-404 withURL:v12];
      v18 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        AMFIExecutionPreflight_cold_5();
      }
      goto LABEL_50;
    }
    id v56 = v34;
    v35 = [v58 objectForKey:@"cpuSubType"];

    objc_opt_class();
    id v36 = v35;
    if (objc_opt_isKindOfClass()) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    if (v36 && !v56)
    {
      v17 = [[AMFIError alloc] initWithAMFIErrorCode:-404 withURL:v57];
      v18 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        AMFIExecutionPreflight_cold_6();
      }
      id v14 = v36;
      goto LABEL_50;
    }
    id v55 = v38;
    v39 = [v58 objectForKey:@"flags"];

    objc_opt_class();
    id v40 = v39;
    if (objc_opt_isKindOfClass()) {
      v41 = v40;
    }
    else {
      v41 = 0;
    }
    id v42 = v41;

    if (v40)
    {
      id v43 = v56;
      if (!v56)
      {
        v17 = [[AMFIError alloc] initWithAMFIErrorCode:-404 withURL:v57];
        v18 = +[AMFIFMKLog generic];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          AMFIExecutionPreflight_cold_7();
        }
LABEL_49:
        id v14 = v40;
LABEL_50:
        id v40 = v14;

        v44 = v17;
        id v16 = 0;
        id v14 = 0;
        id v36 = 0;
        id v42 = 0;
        int v45 = 0;
LABEL_51:

        id v20 = v16;
        id v21 = v14;
        id v22 = v36;
        id v23 = v42;
        v24 = v44;
        if (!v45) {
          goto LABEL_59;
        }
        if (v20)
        {
          v46 = [AMFIPathValidator_ios alloc];
          uint64_t v47 = [v20 unsignedLongLongValue];
          if (v23) {
            uint64_t v48 = -[AMFIPathValidator_ios initWithURL:withFileOffset:withFlags:](v46, "initWithURL:withFileOffset:withFlags:", v57, v47, [v23 intValue]);
          }
          else {
            uint64_t v48 = [(AMFIPathValidator_ios *)v46 initWithURL:v57 withFileOffset:v47];
          }
          v19 = (AMFIPathValidator_ios *)v48;
LABEL_12:
          v25 = v24;
          *(void *)buf = v24;
          BOOL v26 = [(AMFIPathValidator_ios *)v19 validateWithError:buf];
          v24 = (AMFIError *)*(id *)buf;

          if (v26)
          {
            v27 = 0;
            uint64_t v28 = 1;
            v29 = v59;
            goto LABEL_60;
          }
LABEL_59:
          v29 = v59;
          v24 = v24;
          uint64_t v28 = 0;
          v27 = v24;
LABEL_60:

          v31 = v27;
          id v8 = v60;
          a4 = v61;
          if (!v61) {
            goto LABEL_63;
          }
          goto LABEL_61;
        }
        if (v21)
        {
          v49 = [[AMFIError alloc] initWithAMFIErrorCode:-404 withURL:v57];

          v50 = +[AMFIFMKLog generic];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            AMFIExecutionPreflight_cold_2();
          }
        }
        else
        {
          if (v23)
          {
            v19 = -[AMFIPathValidator_ios initWithURL:withFlags:]([AMFIPathValidator_ios alloc], "initWithURL:withFlags:", v57, [v23 intValue]);
            id v20 = 0;
            id v21 = 0;
            goto LABEL_12;
          }
          v49 = [[AMFIError alloc] initWithAMFIErrorCode:-404 withURL:v57];

          v50 = +[AMFIFMKLog generic];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            AMFIExecutionPreflight_cold_2();
          }
          id v23 = 0;
        }

        id v20 = 0;
        v24 = v49;
        goto LABEL_59;
      }
    }
    else
    {
      id v43 = v56;
      if (!v56)
      {
        if (!v55)
        {
          id v14 = 0;
          id v36 = 0;
          v44 = 0;
          id v40 = 0;
          goto LABEL_45;
        }
LABEL_47:
        v17 = [[AMFIError alloc] initWithAMFIErrorCode:-404 withURL:v57];
        v18 = +[AMFIFMKLog generic];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = [v57 path];
          id v53 = v43;
          v54 = (void *)v52;
          *(_DWORD *)buf = 138413058;
          *(void *)&buf[4] = v53;
          __int16 v63 = 2112;
          id v64 = v55;
          __int16 v65 = 2112;
          id v66 = v16;
          __int16 v67 = 2112;
          uint64_t v68 = v52;
          _os_log_error_impl(&dword_20DBEC000, v18, OS_LOG_TYPE_ERROR, "Invalid options combination cpuType: (%@) cpuSubType: (%@) sliceOffset: (%@) for: %@", buf, 0x2Au);
        }
        goto LABEL_49;
      }
    }
    if (v55 && !v16)
    {
      v44 = 0;
LABEL_45:
      int v45 = 1;
      goto LABEL_51;
    }
    goto LABEL_47;
  }
  v30 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    AMFIExecutionPreflight_cold_1(v7, a2, v30);
  }

  v31 = [[AMFIError alloc] initWithAMFIErrorCode:-403 withURL:v7];
  uint64_t v28 = 0;
  if (a4)
  {
LABEL_61:
    if ((v28 & 1) == 0) {
      *a4 = v31;
    }
  }
LABEL_63:

  return v28;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

id hexStringForData(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1
    && (uint64_t v3 = [v1 length],
        v4 = (unsigned __int8 *)[v2 bytes],
        (v5 = malloc_type_calloc((2 * v3) | 1, 1uLL, 0x56FDA653uLL)) != 0))
  {
    v6 = v5;
    if (v3)
    {
      id v7 = (char *)v5;
      do
      {
        int v8 = *v4++;
        sprintf(v7, "%2.2x", v8);
        v7 += 2;
        --v3;
      }
      while (v3);
    }
    id v9 = [NSString stringWithUTF8String:v6];
    free(v6);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t NSErrorToAMFIReturn(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 domain];
    int v4 = [v3 isEqualToString:@"AppleMobileFileIntegrityError"];

    if (v4)
    {
      uint64_t v5 = [v2 code];
      uint64_t v6 = 7;
      switch(v5)
      {
        case -409:
          uint64_t v6 = 13;
          break;
        case -408:
          uint64_t v6 = 8;
          break;
        case -407:
          uint64_t v6 = 12;
          break;
        case -406:
          break;
        default:
          if (v5 == -440) {
            uint64_t v6 = 14;
          }
          else {
            uint64_t v6 = 1;
          }
          break;
      }
    }
    else
    {
      id v7 = [v2 domain];
      int v8 = [v7 isEqualToString:*MEMORY[0x263F07F70]];

      if (v8) {
        uint64_t v6 = 9;
      }
      else {
        uint64_t v6 = 1;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t matchIn(uint64_t a1, char *__s2)
{
  v2 = *(const char **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  for (uint64_t i = a1; *(unsigned char *)i; i += 16)
  {
    size_t v5 = strlen(v2);
    if (!strncmp(v2, __s2, v5)) {
      return 1;
    }
LABEL_7:
    v2 = *(const char **)(i + 24);
    if (!v2) {
      return 0;
    }
  }
  if (strcmp(v2, __s2)) {
    goto LABEL_7;
  }
  return 1;
}

CFIndex AMFICopySwiftPlaygroundsSigningKey(__SecKey **a1)
{
  uint64_t v2 = SecKeyCopySystemKey();
  if (v2)
  {
    uint64_t v3 = (__SecKey *)v2;
    int v4 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DBEC000, v4, OS_LOG_TYPE_DEFAULT, "found local signing key as a system key", buf, 2u);
    }

    goto LABEL_5;
  }
  *(void *)buf = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int v8 = Mutable;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171E0]);
    id v9 = (const void *)*MEMORY[0x263EFFB40];
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F16F00], (const void *)*MEMORY[0x263EFFB40]);
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F17530], v9);
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F17000], @"com.apple.swift-playgrounds.local-signing-key");
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F16E80], @"com.apple.local-signing");
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F17580], v9);
    uint64_t v10 = SecItemCopyMatching(v8, (CFTypeRef *)buf);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        AMFICopySwiftPlaygroundsSigningKey_cold_20(v11, v12, v13, v14, v15, v16, v17, v18);
      }
LABEL_14:

      CFRelease(v8);
      ValueAtIndex = 0;
      goto LABEL_39;
    }
    CFTypeID v21 = CFGetTypeID(*(CFTypeRef *)buf);
    CFTypeID TypeID = CFArrayGetTypeID();
    CFArrayRef v23 = *(const __CFArray **)buf;
    if (v21 == TypeID)
    {
      *(void *)buf = 0;
      CFIndex Count = CFArrayGetCount(v23);
      if (!Count)
      {
        id v34 = +[AMFIFMKLog generic];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          AMFICopySwiftPlaygroundsSigningKey_cold_17();
        }

        ValueAtIndex = 0;
        LODWORD(v11) = -25300;
        goto LABEL_37;
      }
      uint64_t v25 = Count;
      if (Count >= 2)
      {
        BOOL v26 = +[AMFIFMKLog generic];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          AMFICopySwiftPlaygroundsSigningKey_cold_18(v25, v26, v27, v28, v29, v30, v31, v32);
        }
        LODWORD(v11) = -67843;

        ValueAtIndex = 0;
LABEL_37:
        CFRelease(v8);
        if (v23) {
          CFRelease(v23);
        }
        goto LABEL_39;
      }
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v23, 0);
      CFRetain(ValueAtIndex);
    }
    else
    {
      CFTypeID v33 = CFGetTypeID(*(CFTypeRef *)buf);
      if (v33 != SecKeyGetTypeID())
      {
        LODWORD(v11) = -67843;
        id v12 = +[AMFIFMKLog generic];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          AMFICopySwiftPlaygroundsSigningKey_cold_19();
        }
        goto LABEL_14;
      }
      CFArrayRef v23 = 0;
      ValueAtIndex = *(void **)buf;
      *(void *)buf = 0;
    }
    CFRetain(ValueAtIndex);
    v35 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)valuePtr = 0;
      _os_log_impl(&dword_20DBEC000, v35, OS_LOG_TYPE_DEFAULT, "successfully copied local signing private key from keychain", valuePtr, 2u);
    }

    if (ValueAtIndex) {
      CFRelease(ValueAtIndex);
    }
    LODWORD(v11) = 0;
    goto LABEL_37;
  }
  id v20 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    AMFICopySwiftPlaygroundsSigningKey_cold_16();
  }

  ValueAtIndex = 0;
  LODWORD(v11) = -26276;
LABEL_39:
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (!v11) {
    goto LABEL_74;
  }
  if (v11 == -67843)
  {
    CFIndex Code = 4294899453;
    id v36 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_15();
    }
LABEL_73:
    uint64_t v3 = 0;
    goto LABEL_77;
  }
  int v93 = 1;
  *(_DWORD *)valuePtr = 384;
  *(void *)buf = 0;
  CFAllocatorRef v37 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v38 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, valuePtr);
  if (!v38)
  {
    v49 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_8();
    }

    goto LABEL_60;
  }
  CFNumberRef v39 = v38;
  SecAccessControlRef v40 = SecAccessControlCreateWithFlags(v37, (CFTypeRef)*MEMORY[0x263F16EA0], 0, 0);
  if (!v40)
  {
    v50 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_9();
    }

    CFRelease(v39);
LABEL_60:
    CFIndex Code = 4294941020;
    goto LABEL_68;
  }
  SecAccessControlRef v41 = v40;
  CFNumberRef v42 = CFNumberCreate(v37, kCFNumberIntType, &v93);
  if (v42)
  {
    id v43 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v43)
    {
      v44 = v43;
      CFDictionaryAddValue(v43, (const void *)*MEMORY[0x263F16FA8], (const void *)*MEMORY[0x263F16FB8]);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x263F16F98], v39);
      int v45 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x263F16F50], (const void *)*MEMORY[0x263EFFB40]);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x263F17000], @"com.apple.swift-playgrounds.local-signing-key");
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x263F16E80], @"com.apple.local-signing");
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x263F17580], v45);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x263F16E70], v41);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x263F170C0], v42);
      SecKeyRef RandomKey = SecKeyCreateRandomKey(v44, (CFErrorRef *)buf);
      if (RandomKey)
      {
        SecKeyRef v47 = RandomKey;
        CFRetain(RandomKey);
        uint64_t v48 = +[AMFIFMKLog generic];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v92 = 0;
          _os_log_impl(&dword_20DBEC000, v48, OS_LOG_TYPE_DEFAULT, "successfully created local signing private key in keychain", v92, 2u);
        }

        CFRelease(v47);
        CFIndex Code = 0;
        ValueAtIndex = v47;
      }
      else
      {
        v80 = *(__CFError **)buf;
        if (*(void *)buf)
        {
          CFStringRef v81 = CFErrorCopyFailureReason(*(CFErrorRef *)buf);
          CFIndex Code = CFErrorGetCode(v80);
          if (v81)
          {
            CStringPtr = CFStringGetCStringPtr(v81, 0x8000100u);
            v83 = +[AMFIFMKLog generic];
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
              AMFICopySwiftPlaygroundsSigningKey_cold_14((uint64_t)CStringPtr, Code, v83);
            }

            CFRelease(v81);
          }
          else
          {
            v85 = +[AMFIFMKLog generic];
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
              AMFICopySwiftPlaygroundsSigningKey_cold_13(Code, v85, v86, v87, v88, v89, v90, v91);
            }
          }
        }
        else
        {
          v84 = +[AMFIFMKLog generic];
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            AMFICopySwiftPlaygroundsSigningKey_cold_12();
          }

          CFIndex Code = 4294941020;
        }
      }
      CFRelease(v44);
      goto LABEL_66;
    }
    v51 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_11();
    }
  }
  else
  {
    v51 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_10();
    }
  }

  CFIndex Code = 4294941020;
LABEL_66:
  CFRelease(v41);
  CFRelease(v39);
  if (v42) {
    CFRelease(v42);
  }
LABEL_68:
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (Code)
  {
    id v36 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_7(Code, v36, v52, v53, v54, v55, v56, v57);
    }
    goto LABEL_73;
  }
LABEL_74:
  uint64_t v3 = (__SecKey *)ValueAtIndex;
  CFRetain(ValueAtIndex);
  id v36 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DBEC000, v36, OS_LOG_TYPE_DEFAULT, "successfully copied local signing private key", buf, 2u);
  }
  CFIndex Code = 0;
LABEL_77:

  if (ValueAtIndex) {
    CFRelease(ValueAtIndex);
  }
  if (Code)
  {
    id v58 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_6();
    }
    goto LABEL_101;
  }
  *(void *)buf = 0;
  SecKeyRef v59 = SecKeyCopyPublicKey(v3);
  if (!v59)
  {
    uint64_t v69 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_2();
    }

    CFIndex Code = 4294941020;
    goto LABEL_99;
  }
  SecKeyRef v60 = v59;
  uint64_t v61 = SecKeyCopyPublicBytes();
  if (v61)
  {
    CFIndex Code = v61;
    v62 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_5(Code, v62, v63, v64, v65, v66, v67, v68);
    }
    goto LABEL_96;
  }
  CFIndex Length = CFDataGetLength(*(CFDataRef *)buf);
  if (Length != 97)
  {
    uint64_t v73 = Length;
    v62 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_4(v73, v62, v74, v75, v76, v77, v78, v79);
    }
    goto LABEL_95;
  }
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)buf);
  CFIndex Code = amfi_interface_set_local_signing_public_key(BytePtr);
  v72 = +[AMFIFMKLog generic];
  v62 = v72;
  if (Code)
  {
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_3(v62);
    }
LABEL_95:
    CFIndex Code = 4294941020;
    goto LABEL_96;
  }
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)valuePtr = 0;
    _os_log_impl(&dword_20DBEC000, v62, OS_LOG_TYPE_DEFAULT, "added local signing public key to AMFI", valuePtr, 2u);
    CFIndex Code = 0;
  }
LABEL_96:

  CFRelease(v60);
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (Code)
  {
LABEL_99:
    id v58 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      AMFICopySwiftPlaygroundsSigningKey_cold_1();
    }
LABEL_101:

    if (!v3) {
      return Code;
    }
    goto LABEL_8;
  }
LABEL_5:
  if (a1)
  {
    *a1 = v3;
    CFRetain(v3);
  }
  CFIndex Code = 0;
  if (v3) {
LABEL_8:
  }
    CFRelease(v3);
  return Code;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

__CFString *errorStringForAMFIErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 + 430) > 0x1D) {
    return @"An unknown error was encountered";
  }
  else {
    return off_264127DF0[a1 + 430];
  }
}

uint64_t errorCodeForMISError(int a1)
{
  if (a1 + 402620399) < 0xE && ((0x2237u >> (a1 - 17))) {
    return qword_20DBF8500[a1 + 402620399];
  }
  uint64_t v2 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    errorCodeForMISError_cold_1(a1, v2);
  }

  return -400;
}

uint64_t AMFIShouldShowDeveloperModeSettings()
{
  if (amfi_developer_mode_status()) {
    return 1;
  }
  v0 = [MEMORY[0x263F08850] defaultManager];
  char v1 = [v0 fileExistsAtPath:@"/private/var/tmp/show_dev_mode"];

  if (v1) {
    return 1;
  }
  uint64_t v4 = 0;
  size_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  BOOL v2 = !MISEnumerateMatchingProfiles() && *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_20DBEEFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AMFIShouldShowDeveloperModeSettings_block_invoke(uint64_t a1, unsigned char *a2)
{
  if (a2[16] || a2[17]) {
    return 1;
  }
  uint64_t result = 1;
  if (!a2[20])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = 22;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0;
    uint64_t result = __sandbox_ms();
    if (result) {
      return *__error();
    }
    else {
      *a3 = 0;
    }
  }
  return result;
}

uint64_t amfi_interface_query_bootarg_state(void *a1)
{
  if (!a1) {
    return 22;
  }
  *a1 = 0;
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  *a1 = 0;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(unsigned char *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22;
  }
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!result) {
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(unsigned char *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22;
  }
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!result) {
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  char v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL)) {
    return 22;
  }
  else {
    return __sandbox_ms();
  }
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2 = 0;
  size_t v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0, 0) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && (unint64_t)(a3 - 1) <= 0x3FFE) {
    return MEMORY[0x270EDACD0]();
  }
  else {
    return 22;
  }
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (int *)a4;
  v7[128] = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      int v6 = 5;
      if (!v4) {
        uint64_t v4 = &v6;
      }
      if (!__sandbox_ms() && !*v4) {
        return 1;
      }
    }
    else if (a4)
    {
      uint64_t result = 0;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }
  else if (a4)
  {
    uint64_t result = 0;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }
  return 0;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

uint64_t validateCodeSigningFlags(void (**a1)(int *, uint64_t), uint64_t a2)
{
  int v2 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1) >= 2)
  {
    if (v2 == 8)
    {
      uint64_t v3 = -738426648;
      goto LABEL_6;
    }
    if (v2 != 4)
    {
      uint64_t v4 = 15;
      goto LABEL_10;
    }
  }
  uint64_t v3 = -3203661632;
LABEL_6:
  if ((a2 & v3) == 0) {
    return 1;
  }
  uint64_t v4 = 14;
LABEL_10:
  a1[9]((int *)a1, v4);
  return 0;
}

const char *LWCRTypeVerificationBackend_errorStringForCode(int a1)
{
  if ((a1 - 1) > 0xE) {
    return "Success";
  }
  else {
    return off_2641280E8[a1 - 1];
  }
}

BOOL LWCRTypeVerificationBackend_verifyRequirements(uint64_t a1, uint64_t a2)
{
  return verifyAndOrDictionary(a1, a2, &v3);
}

BOOL verifyAndOrDictionary(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) != 32)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
    return 0;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 4) + 1;
  *(_DWORD *)(a1 + 4) = v6;
  if (v6 >= 6)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
    return 0;
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000;
  char v19 = 1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  int v15 = 0;
  int v8 = *(void (**)(uint64_t, void *))(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  v11[2] = __verifyAndOrDictionary_block_invoke;
  v11[3] = &unk_264127F60;
  v11[5] = &v16;
  v11[6] = a1;
  v11[4] = &v12;
  v8(a2, v11);
  int v9 = *((_DWORD *)v13 + 6);
  if (v9 == 1)
  {
    *a3 = 1;
  }
  else if (!v9 && *((unsigned char *)v17 + 24))
  {
    *((unsigned char *)v17 + 24) = 0;
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 12);
  }
  --*(_DWORD *)(a1 + 4);
  BOOL v7 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

BOOL LWCRTypeVerificationBackend_verifyLWCR(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) == 32)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000;
    char v20 = 1;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000;
    uint64_t v16 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000;
    char v12 = 0;
    uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 0x40000000;
    v8[2] = __LWCRTypeVerificationBackend_verifyLWCR_block_invoke;
    v8[3] = &unk_264127F38;
    v8[4] = &v17;
    v8[5] = &v13;
    v8[6] = &v9;
    v8[7] = a1;
    v4(a2, v8);
    if (*((unsigned char *)v18 + 24))
    {
      uint64_t v5 = v14[3];
      if (!v5 || (BOOL v6 = 1, v5 == 127) && *(_DWORD *)a1 == 2)
      {
        if (*((unsigned char *)v10 + 24))
        {
          BOOL v6 = 1;
        }
        else
        {
          (*(void (**)(uint64_t, const char *))(a1 + 56))(a1, "ccat");
          *((unsigned char *)v18 + 24) = 0;
          (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 12);
          BOOL v6 = *((unsigned char *)v18 + 24) != 0;
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 2);
    return 0;
  }
  return v6;
}

BOOL __verifyAndOrDictionary_block_invoke(void *a1, char *a2, uint64_t a3)
{
  (*(void (**)(void))(a1[6] + 56))();
  char v8 = 0;
  if (*a2 == 36)
  {
    if (verifyFactLessOperator(a1[6], a2, a3, &v8, &v7))
    {
LABEL_3:
      (*(void (**)(void))(a1[6] + 64))();
      ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
      return 1;
    }
  }
  else if (verifyFactName(a1[6], a2, a3, &v8))
  {
    goto LABEL_3;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  return *(unsigned char *)(*(void *)(a1[5] + 8) + 24) != 0;
}

uint64_t verifyFactLessOperator(uint64_t a1, char *a2, uint64_t a3, unsigned char *a4, unsigned char *a5)
{
  *a4 = 0;
  *a5 = 0;
  if (!keyIsKnownFactlessDictOperator(a2) && !keyIsKnownOperatorArrayOperator((BOOL)a2))
  {
    int IsKnownForCategory = keyIsKnownForCategory(a2, *(_DWORD *)a1);
    if (IsKnownForCategory == 1)
    {
      *a4 = 1;
    }
    else if (!IsKnownForCategory)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 4);
      return 0;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 1);
    return 0;
  }
  if (keyIsKnownBooleanOperator((BOOL)a2))
  {
    return verifyAndOrDictionary(a1, a3, a5);
  }
  if (strcmp(a2, "$optional"))
  {
    if (keyIsKnownOperatorArrayOperator((BOOL)a2))
    {
      if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a3) == 16)
      {
        uint64_t v19 = 0;
        char v20 = &v19;
        uint64_t v21 = 0x2000000000;
        char v22 = 1;
        uint64_t v15 = 0;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x2000000000;
        int v18 = 0;
        uint64_t v11 = *(void (**)(uint64_t, void *))(a1 + 48);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 0x40000000;
        v14[2] = __verifyOperatorArray_block_invoke;
        v14[3] = &unk_264128028;
        v14[5] = &v15;
        v14[6] = a1;
        v14[4] = &v19;
        v11(a3, v14);
        if (*((_DWORD *)v16 + 6) == 1) {
          *a5 = 1;
        }
        BOOL v12 = *((unsigned char *)v20 + 24) != 0;
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v19, 8);
        return v12;
      }
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 10);
    }
    return 0;
  }
  return verifyOptionalDictionary(a1, a3, 0);
}

BOOL verifyFactName(uint64_t a1, char *__s1, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  uint64_t v26 = 0;
  int v8 = *(_DWORD *)a1;
  uint64_t IsKnownForCategory = factIsKnownForCategory(__s1, *(_DWORD *)a1, &v26);
  if (IsKnownForCategory == 1)
  {
    uint64_t v13 = keyIsKnownForCategory(__s1, v8);
    uint64_t v10 = v13;
    if (v13 == 1)
    {
      *a4 = 1;
    }
    else if (!v13)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 4);
      return 0;
    }
LABEL_10:
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, v10);
    return 0;
  }
  uint64_t v10 = IsKnownForCategory;
  if (IsKnownForCategory) {
    goto LABEL_10;
  }
  uint64_t v11 = v26;
  int v12 = *(_DWORD *)(v26 + 12);
  switch(v12)
  {
    case 1:
      if (((*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory) & 1) == 0) {
        goto LABEL_32;
      }
      return 1;
    case 2:
      int v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if ((v22 & 2) != 0) {
        return 1;
      }
      if (v22 != 32) {
        goto LABEL_32;
      }
      uint64_t v16 = a1;
      uint64_t v17 = a3;
      int v18 = 2;
      goto LABEL_30;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_16;
    case 4:
      int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if (v23 == 4) {
        return 1;
      }
      if (v23 != 32) {
        goto LABEL_32;
      }
      uint64_t v16 = a1;
      uint64_t v17 = a3;
      int v18 = 4;
      goto LABEL_30;
    case 8:
      int v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if (v24 == 8) {
        return 1;
      }
      if (v24 != 32) {
        goto LABEL_32;
      }
      uint64_t v16 = a1;
      uint64_t v17 = a3;
      int v18 = 8;
LABEL_30:
      uint64_t v19 = a4;
      uint64_t v20 = 0;
      return verifyFactOperatorDictionary(v16, v17, v18, v19, 0, v20);
    default:
      if (v12 == 64)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory) == 32)
        {
          uint64_t v16 = a1;
          uint64_t v17 = a3;
          int v18 = 64;
          uint64_t v19 = a4;
          uint64_t v20 = v11;
          return verifyFactOperatorDictionary(v16, v17, v18, v19, 0, v20);
        }
LABEL_32:
        (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
        return 0;
      }
LABEL_16:
      if (!__s1 || strcmp(__s1, (const char *)kKnownQueryFacts)) {
        return 0;
      }
      if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a3) != 32) {
        goto LABEL_32;
      }
      unsigned int v21 = *(_DWORD *)(a1 + 4) + 1;
      *(_DWORD *)(a1 + 4) = v21;
      if (v21 >= 6)
      {
        (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
        return 0;
      }
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2000000000;
      int v33 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2000000000;
      char v31 = 1;
      uint64_t v25 = *(void (**)(uint64_t, void *))(a1 + 40);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 0x40000000;
      v27[2] = __verifyQueryTypeFact_block_invoke;
      v27[3] = &unk_264128078;
      v27[5] = &v28;
      v27[6] = a1;
      v27[4] = v32;
      v25(a3, v27);
      --*(_DWORD *)(a1 + 4);
      BOOL v14 = *((unsigned char *)v29 + 24) != 0;
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(v32, 8);
      return v14;
  }
}

BOOL keyIsKnownBooleanOperator(BOOL result)
{
  if (result)
  {
    char v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownBooleanOperators))
    {
      return 1;
    }
    else
    {
      uint64_t v2 = 0;
      do
      {
        uint64_t v3 = v2;
        if (v2 == 8) {
          break;
        }
        int v4 = strcmp(v1, *(const char **)((char *)&kKnownBooleanOperators + v2 + 8));
        uint64_t v2 = v3 + 8;
      }
      while (v4);
      return v3 == 0;
    }
  }
  return result;
}

BOOL verifyOptionalDictionary(uint64_t a1, uint64_t a2, int a3)
{
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) != 32)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
    return 0;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 4) + 1;
  *(_DWORD *)(a1 + 4) = v6;
  if (v6 < 6)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2000000000;
    v22[0] = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2000000000;
    char v18 = 1;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2000000000;
    int v14 = 0;
    if (a3)
    {
      if (verifyFactOperatorDictionary(a1, a2, a3, v22, 1, 0))
      {
        --*(_DWORD *)(a1 + 4);
        BOOL v7 = 1;
LABEL_14:
        _Block_object_dispose(v13, 8);
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v19, 8);
        return v7;
      }
      if (*((unsigned char *)v20 + 24))
      {
        (*(void (**)(uint64_t))(a1 + 64))(a1);
        uint64_t v9 = *(void (**)(uint64_t, void *))(a1 + 40);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 0x40000000;
        v11[2] = __verifyOptionalDictionary_block_invoke_2;
        v11[3] = &unk_264127FB0;
        v11[4] = v13;
        v11[5] = &v15;
        v11[6] = a1;
        v9(a2, v11);
      }
      else
      {
        *((unsigned char *)v16 + 24) = 0;
      }
    }
    else
    {
      int v8 = *(void (**)(uint64_t, void *))(a1 + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 0x40000000;
      v12[2] = __verifyOptionalDictionary_block_invoke;
      v12[3] = &unk_264127F88;
      v12[4] = v13;
      v12[5] = &v15;
      v12[6] = &v19;
      v12[7] = a1;
      v8(a2, v12);
    }
    --*(_DWORD *)(a1 + 4);
    BOOL v7 = *((unsigned char *)v16 + 24) != 0;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
  return 0;
}

BOOL keyIsKnownOperatorArrayOperator(BOOL result)
{
  if (result)
  {
    char v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownOperatorArrayOperators))
    {
      return 1;
    }
    else
    {
      uint64_t v2 = 0;
      do
      {
        uint64_t v3 = v2;
        if (v2 == 8) {
          break;
        }
        int v4 = strcmp(v1, *(const char **)((char *)&kKnownOperatorArrayOperators + v2 + 8));
        uint64_t v2 = v3 + 8;
      }
      while (v4);
      return v3 == 0;
    }
  }
  return result;
}

uint64_t keyIsKnownForCategory(char *a1, int a2)
{
  uint64_t v4 = 0;
  uint64_t result = factIsKnownForCategory(a1, a2, &v4);
  if (result == 1) {
    return !keyIsKnownOperator(a1);
  }
  return result;
}

BOOL keyIsKnownFactlessDictOperator(const char *a1)
{
  return keyIsKnownBooleanOperator((BOOL)a1) || strcmp(a1, "$optional") == 0;
}

uint64_t __verifyOptionalDictionary_block_invoke(void *a1, char *a2, uint64_t a3)
{
  (*(void (**)(void))(a1[7] + 56))();
  if (*(int *)(*(void *)(a1[4] + 8) + 24) >= 1)
  {
    unsigned int v6 = *(void (**)(void))(a1[7] + 72);
LABEL_3:
    v6();
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  if (*a2 == 36)
  {
    if (keyIsKnownOperator(a2))
    {
      unsigned int v6 = *(void (**)(void))(a1[7] + 72);
      goto LABEL_3;
    }
  }
  else if (!verifyFactName(a1[7], a2, a3, (unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
         && !*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  }
  {
    goto LABEL_4;
  }
  (*(void (**)(void))(a1[7] + 64))();
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  return 1;
}

BOOL keyIsKnownOperator(const char *a1)
{
  if (keyIsKnownNumericOnlyOperator((BOOL)a1)) {
    return 1;
  }
  if (a1)
  {
    if (!strcmp(a1, (const char *)kKnownMultiUseFactOperators[0])) {
      return 1;
    }
    uint64_t v3 = 0;
    while (v3 != 1)
    {
      if (!strcmp(a1, (const char *)kKnownMultiUseFactOperators[++v3]))
      {
        if (v3 == 1) {
          return 1;
        }
        break;
      }
    }
  }
  if (!strcmp(a1, "$query") || keyIsKnownFactlessDictOperator(a1)) {
    return 1;
  }
  return keyIsKnownOperatorArrayOperator((BOOL)a1);
}

BOOL verifyFactOperatorDictionary(uint64_t a1, uint64_t a2, int a3, unsigned char *a4, char a5, uint64_t a6)
{
  *a4 = 0;
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) == 32)
  {
    unsigned int v12 = *(_DWORD *)(a1 + 4) + 1;
    *(_DWORD *)(a1 + 4) = v12;
    if (v12 < 6)
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2000000000;
      int v24 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x2000000000;
      char v22 = 1;
      int v14 = *(void (**)(uint64_t, void *))(a1 + 40);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 0x40000000;
      v16[2] = __verifyFactOperatorDictionary_block_invoke;
      v16[3] = &unk_264127FD8;
      v16[4] = v23;
      v16[5] = &v19;
      char v18 = a5;
      int v17 = a3;
      v16[6] = a1;
      v16[7] = a4;
      v16[8] = a6;
      v14(a2, v16);
      --*(_DWORD *)(a1 + 4);
      BOOL v13 = *((unsigned char *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(v23, 8);
      return v13;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
  }
  return 0;
}

uint64_t __verifyOptionalDictionary_block_invoke_2(void *a1, const char *a2)
{
  (*(void (**)(void))(a1[6] + 56))();
  if (*(int *)(*(void *)(a1[4] + 8) + 24) >= 1)
  {
    uint64_t v4 = *(void (**)(void))(a1[6] + 72);
LABEL_7:
    v4();
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  if (*a2 != 36 || keyIsKnownFactlessDictOperator(a2) || keyIsKnownOperatorArrayOperator((BOOL)a2))
  {
    uint64_t v4 = *(void (**)(void))(a1[6] + 72);
    goto LABEL_7;
  }
  (*(void (**)(void))(a1[6] + 64))();
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  return 1;
}

BOOL keyIsKnownNumericOnlyOperator(BOOL result)
{
  if (result)
  {
    char v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownNumericOnlyOperators[0]))
    {
      return 1;
    }
    else
    {
      unint64_t v2 = 0;
      do
      {
        unint64_t v3 = v2;
        if (v2 == 3) {
          break;
        }
        int v4 = strcmp(v1, (const char *)kKnownNumericOnlyOperators[v2 + 1]);
        unint64_t v2 = v3 + 1;
      }
      while (v4);
      return v3 < 3;
    }
  }
  return result;
}

uint64_t __verifyFactOperatorDictionary_block_invoke(uint64_t a1, char *a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 56))();
  if (*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72);
LABEL_3:
    v6();
    return 0;
  }
  if (!strcmp(a2, "$optional"))
  {
    if (*(unsigned char *)(a1 + 76))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_13;
    }
    uint64_t result = verifyOptionalDictionary(*(void *)(a1 + 48), a3, *(unsigned int *)(a1 + 72));
    if (!result) {
      goto LABEL_39;
    }
    goto LABEL_26;
  }
  int v8 = *(_DWORD *)(a1 + 72);
  if ((v8 & 0xE) == 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_38;
    }
    if (!a2 || strcmp(a2, (const char *)kKnownFlagSetOnlyOperators))
    {
      uint64_t v10 = *(void *)(a1 + 48);
LABEL_27:
      int IsKnownForCategory = keyIsKnownForCategory(a2, *(_DWORD *)v10);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      if (IsKnownForCategory == 1)
      {
        **(unsigned char **)(a1 + 56) = 1;
LABEL_32:
        unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72);
        goto LABEL_3;
      }
      if (IsKnownForCategory) {
        goto LABEL_32;
      }
LABEL_13:
      unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72);
      goto LABEL_3;
    }
    if (((*(uint64_t (**)(uint64_t))(*(void *)(a1 + 48) + 16))(a3) & 2) == 0) {
      goto LABEL_36;
    }
    if (*(void *)(a1 + 64))
    {
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 48) + 24))(a3);
      if (((*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 48), v16) & 1) == 0) {
        goto LABEL_38;
      }
    }
LABEL_26:
    (*(void (**)(void))(*(void *)(a1 + 48) + 64))();
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    return 1;
  }
  if (!strcmp(a2, "$in"))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if ((*(unsigned int (**)(uint64_t))(v11 + 16))(a3) != 16)
    {
      (*(void (**)(uint64_t, uint64_t))(v11 + 72))(v11, 3);
      goto LABEL_38;
    }
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2000000000;
    char v22 = 1;
    (*(void (**)(uint64_t, const char *))(v11 + 56))(v11, "Array");
    unsigned int v12 = *(void (**)(uint64_t, void *))(v11 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 0x40000000;
    v17[2] = __verifyInArray_block_invoke;
    v17[3] = &unk_264128000;
    int v18 = v8;
    v17[4] = &v19;
    v17[5] = v11;
    v12(a3, v17);
    if (!*((unsigned char *)v20 + 24))
    {
      _Block_object_dispose(&v19, 8);
      goto LABEL_38;
    }
    (*(void (**)(uint64_t))(v11 + 64))(v11);
    int v13 = *((unsigned __int8 *)v20 + 24);
    _Block_object_dispose(&v19, 8);
    if (!v13) {
      goto LABEL_38;
    }
    goto LABEL_26;
  }
  if ((v8 & 2) != 0)
  {
    BOOL IsKnownNumericOnlyOperator = keyIsKnownNumericOnlyOperator((BOOL)a2);
    uint64_t v10 = *(void *)(a1 + 48);
    if (IsKnownNumericOnlyOperator)
    {
      if ((*(_DWORD *)(a1 + 72) & (*(unsigned int (**)(uint64_t))(v10 + 16))(a3)) != 0) {
        goto LABEL_26;
      }
LABEL_36:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72);
      goto LABEL_3;
    }
    goto LABEL_27;
  }
  int v9 = keyIsKnownForCategory(a2, **(_DWORD **)(a1 + 48));
  if (v9 == 1)
  {
    **(unsigned char **)(a1 + 56) = 1;
    goto LABEL_34;
  }
  if (v9)
  {
LABEL_34:
    (*(void (**)(void))(*(void *)(a1 + 48) + 72))();
    goto LABEL_38;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 72))(*(void *)(a1 + 48), 6);
LABEL_38:
  uint64_t result = 0;
LABEL_39:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

BOOL __verifyInArray_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 48) & (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 40) + 16))(a2);
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    (*(void (**)(void))(v4 + 72))();
  }
  return v3 != 0;
}

uint64_t __verifyOperatorArray_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[6];
  if ((*(unsigned int (**)(uint64_t))(v4 + 16))(a2) == 16)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2000000000;
    int v15 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000;
    char v13 = 1;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2000000000;
    v9[3] = 0;
    uint64_t v5 = *(void (**)(uint64_t, void *))(v4 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 0x40000000;
    v8[2] = __verifyOperatorArrayTuple_block_invoke;
    v8[3] = &unk_264128050;
    v8[4] = v14;
    v8[5] = &v10;
    v8[6] = v9;
    v8[7] = v4;
    v5(a2, v8);
    int v6 = *((unsigned __int8 *)v11 + 24);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
    if (v6)
    {
      ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
      return 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 72))(v4, 3);
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
  return result;
}

uint64_t __verifyOperatorArrayTuple_block_invoke(void *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(a1[7] + 16))(a2);
  int v5 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  if (v5 != 1)
  {
    if (!v5)
    {
      uint64_t v6 = a1[7];
      if (v4 == 4)
      {
        *(void *)(*(void *)(a1[6] + 8) + 24) = (*(uint64_t (**)(uint64_t))(v6 + 32))(a2);
        BOOL v7 = *(char **)(*(void *)(a1[6] + 8) + 24);
        BOOL IsKnownFactlessDictOperator = keyIsKnownFactlessDictOperator(v7);
        uint64_t v9 = a1[7];
        if (IsKnownFactlessDictOperator)
        {
          (*(void (**)(uint64_t, char *))(v9 + 56))(v9, v7);
LABEL_9:
          ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
          return 1;
        }
        if (keyIsKnownForCategory(v7, *(_DWORD *)v9)) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 4;
        }
        (*(void (**)(void, uint64_t))(a1[7] + 72))(a1[7], v12);
      }
      else
      {
        (*(void (**)(void, uint64_t))(v6 + 72))(a1[7], 2);
      }
      goto LABEL_18;
    }
    uint64_t v11 = *(void (**)(void))(a1[7] + 72);
LABEL_13:
    v11();
LABEL_18:
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  if (v4 != 32)
  {
    uint64_t v11 = *(void (**)(void))(a1[7] + 72);
    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = verifyFactLessOperator(a1[7], *(void *)(*(void *)(a1[6] + 8) + 24), a2, &v14, &v13);
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    (*(void (**)(void))(a1[7] + 64))();
    goto LABEL_9;
  }
  return 0;
}

uint64_t factIsKnownForCategory(char *__s1, int a2, void *a3)
{
  uint64_t result = 10;
  if (__s1 && a3)
  {
    uint64_t v7 = 0;
    while (strcmp(__s1, (&kKnownFacts)[v7]))
    {
      v7 += 3;
      if (v7 == 66) {
        return 1;
      }
    }
    if (((uint64_t)(&kKnownFacts)[v7 + 1] & a2) != 0)
    {
      uint64_t result = 0;
      *a3 = &(&kKnownFacts)[v7];
    }
    else
    {
      return 9;
    }
  }
  return result;
}

uint64_t __verifyQueryTypeFact_block_invoke(void *a1, const char *a2, uint64_t a3)
{
  (*(void (**)(void))(a1[6] + 56))();
  if (*(int *)(*(void *)(a1[4] + 8) + 24) >= 1)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    uint64_t v6 = *(void (**)(void))(a1[6] + 72);
LABEL_5:
    v6();
    return 0;
  }
  if (strcmp(a2, "$query"))
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    uint64_t v6 = *(void (**)(void))(a1[6] + 72);
    goto LABEL_5;
  }
  uint64_t v8 = a1[6];
  int v9 = (*(uint64_t (**)(uint64_t))(v8 + 16))(a3);
  (*(void (**)(uint64_t, const char *))(v8 + 56))(v8, "Query Array");
  if (v9 == 16)
  {
    uint64_t v13 = 0;
    char v14 = &v13;
    uint64_t v15 = 0x2000000000;
    char v16 = 1;
    uint64_t v10 = *(void (**)(uint64_t, void *))(v8 + 48);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 0x40000000;
    v12[2] = __verifyQueryArray_block_invoke;
    v12[3] = &unk_2641280A0;
    v12[4] = &v13;
    v12[5] = v8;
    v10(a3, v12);
    if (*((unsigned char *)v14 + 24))
    {
      (*(void (**)(uint64_t))(v8 + 64))(v8);
      int v11 = *((unsigned __int8 *)v14 + 24);
      _Block_object_dispose(&v13, 8);
      if (v11)
      {
        ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
        (*(void (**)(void))(a1[6] + 64))();
        return 1;
      }
    }
    else
    {
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 72))(v8, 3);
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  return result;
}

BOOL __verifyQueryArray_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 40) + 16))(a2) == 16)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 56))();
    uint64_t v4 = *(void *)(a1 + 40);
    if ((*(unsigned int (**)(uint64_t))(v4 + 16))(a2) == 16)
    {
      uint64_t v13 = 0;
      char v14 = &v13;
      uint64_t v15 = 0x2000000000;
      char v16 = 1;
      uint64_t v9 = 0;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2000000000;
      int v12 = 0;
      int v5 = *(void (**)(uint64_t, void *))(v4 + 48);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 0x40000000;
      v8[2] = __verifyQueryTuple_block_invoke;
      v8[3] = &unk_2641280C8;
      v8[4] = &v9;
      v8[5] = &v13;
      v8[6] = v4;
      v5(a2, v8);
      if (*((_DWORD *)v10 + 6) == 2)
      {
        BOOL v6 = *((unsigned char *)v14 + 24) != 0;
      }
      else
      {
        BOOL v6 = 0;
        *((unsigned char *)v14 + 24) = 0;
      }
      _Block_object_dispose(&v9, 8);
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v4 + 72))(v4, 2);
      BOOL v6 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 64))();
      return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    (*(void (**)(void))(*(void *)(a1 + 40) + 72))();
  }
  return 0;
}

BOOL __verifyQueryTuple_block_invoke(void *a1, uint64_t a2)
{
  if (*(int *)(*(void *)(a1[4] + 8) + 24) >= 2)
  {
    uint64_t v3 = a1[6];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    uint64_t v4 = *(void (**)(void))(v3 + 72);
LABEL_5:
    v4();
    return *(unsigned char *)(*(void *)(a1[5] + 8) + 24) != 0;
  }
  char v5 = (*(uint64_t (**)(uint64_t))(a1[6] + 16))(a2);
  uint64_t v6 = *(void *)(a1[4] + 8);
  int v7 = *(_DWORD *)(v6 + 24);
  if (!(v7 | v5 & 2))
  {
    uint64_t v8 = a1[6];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    uint64_t v4 = *(void (**)(void))(v8 + 72);
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 24) = v7 + 1;
  return 1;
}

uint64_t AMFIInitiateDataMigration()
{
  id v0 = +[AMFIConnection newConnection];
  char v1 = [v0 initiateDataMigration];
  uint64_t v2 = NSErrorToAMFIReturn(v1);

  return v2;
}

uint64_t AMFIGetSEPDeviceState(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = +[AMFIConnection newConnection];
  id v8 = 0;
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 getSEPStateWithError:&v8];
    id v4 = v8;
    long long v13 = v9;
    long long v14 = v10;
    long long v15 = v11;
    char v16 = v12;

    if (v4)
    {
      uint64_t v5 = NSErrorToAMFIReturn(v4);

      return v5;
    }
  }
  else
  {
    char v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  uint64_t v5 = 0;
  if (a1)
  {
    long long v6 = v14;
    *(_OWORD *)a1 = v13;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = v15;
    *(unsigned char *)(a1 + 48) = v16;
  }
  return v5;
}

uint64_t AMFIProfileRequiresReboot(void *a1, unsigned char *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (!v3)
  {
    long long v9 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRequiresReboot_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_14;
  }
  if (!a2)
  {
    long long v9 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRequiresReboot_cold_2(v9, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_14:

    int v7 = 0;
    uint64_t ProfileAuxiliarySignature = 7;
    goto LABEL_15;
  }
  *a2 = 0;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "AMFIProfileRequiresReboot";
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_impl(&dword_20DBEC000, v4, OS_LOG_TYPE_DEFAULT, "[%s] request for profile: %@", buf, 0x16u);
  }

  uint64_t ProfileAuxiliarySignature = _getProfileAuxiliarySignature(v3);
  id v6 = 0;
  int v7 = v6;
  if (ProfileAuxiliarySignature)
  {
    if (v6)
    {
      id v8 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = "AMFIProfileRequiresReboot";
        __int16 v28 = 2112;
        id v29 = v3;
        _os_log_impl(&dword_20DBEC000, v8, OS_LOG_TYPE_DEFAULT, "[%s] auxiliary signature exists: %@", buf, 0x16u);
      }

      uint64_t ProfileAuxiliarySignature = 0;
    }
    else if (_os_feature_enabled_impl())
    {
      uint64_t ProfileAuxiliarySignature = 0;
      int v7 = 0;
      *a2 = 1;
    }
    else
    {
      uint64_t v25 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v27 = "AMFIProfileRequiresReboot";
        _os_log_impl(&dword_20DBEC000, v25, OS_LOG_TYPE_DEFAULT, "[%s] PreBoard flow disabled", buf, 0xCu);
      }

      uint64_t ProfileAuxiliarySignature = 0;
      int v7 = 0;
    }
  }
LABEL_15:

  return ProfileAuxiliarySignature;
}

uint64_t _getProfileAuxiliarySignature(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v1 = a1;
  MISCopyProvisioningProfile();
  id v2 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    _getProfileAuxiliarySignature_cold_2();
  }

  return 0;
}

void sub_20DBF1B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AMFIProfileScheduleTrust(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  char v16 = 0;
  id v2 = +[AMFIFMKLog generic];
  id v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "AMFIProfileScheduleTrust";
      __int16 v19 = 2112;
      id v20 = v1;
      _os_log_impl(&dword_20DBEC000, v3, OS_LOG_TYPE_DEFAULT, "%s: attempting to schedule profile: %@", buf, 0x16u);
    }

    uint64_t v4 = AMFIProfileRequiresReboot(v1, &v16);
    if (v4)
    {
      uint64_t v5 = v4;
      id v3 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        AMFIProfileScheduleTrust_cold_4();
      }
    }
    else if (v16)
    {
      id v14 = +[AMFIConnection newConnection];
      id v3 = [v14 stageProfileForUuid:v1];

      if (!v3)
      {
        uint64_t v5 = 0;
        goto LABEL_11;
      }
      uint64_t v15 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        AMFIProfileScheduleTrust_cold_3();
      }

      uint64_t v5 = NSErrorToAMFIReturn(v3);
    }
    else
    {
      id v3 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        AMFIProfileScheduleTrust_cold_2();
      }
      uint64_t v5 = 11;
    }
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      AMFIProfileScheduleTrust_cold_1(v3, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v5 = 7;
  }

LABEL_11:
  return v5;
}

uint64_t AMFIProfileGetScheduledProfile(uint64_t a1)
{
  CFTypeRef cf = 0;
  if (!a1)
  {
    uint64_t v9 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      AMFIProfileGetScheduledProfile_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v7 = 0;
    id v8 = 0;
    id v3 = 0;
    uint64_t v6 = 7;
    goto LABEL_23;
  }
  id v2 = +[AMFIConnection newConnection];
  id v21 = 0;
  id v3 = [v2 getStagedProfileWithError:&v21];
  id v4 = v21;

  if (!v4)
  {
    if (MISCopyProvisioningProfile()) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = cf == 0;
    }
    if (v17)
    {
      uint64_t v9 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        AMFIProfileGetScheduledProfile_cold_4();
      }
    }
    else
    {
      uint64_t v18 = MISProvisioningProfileGetTeamIdentifier();
      uint64_t v7 = (void *)v18;
      if (v18)
      {
        __int16 v19 = MISProfileGetValue();
        if (v19)
        {
          objc_storeStrong((id *)a1, v3);
          objc_storeStrong((id *)(a1 + 8), v7);
          id v8 = v19;
          uint64_t v6 = 0;
          uint64_t v9 = *(NSObject **)(a1 + 16);
          *(void *)(a1 + 16) = v8;
LABEL_23:

          id v4 = 0;
          goto LABEL_24;
        }
        uint64_t v9 = +[AMFIFMKLog generic];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          AMFIProfileGetScheduledProfile_cold_3();
        }
LABEL_22:
        id v8 = 0;
        uint64_t v6 = 5;
        goto LABEL_23;
      }
      uint64_t v9 = +[AMFIFMKLog generic];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        AMFIProfileGetScheduledProfile_cold_2();
      }
    }
    uint64_t v7 = 0;
    goto LABEL_22;
  }
  uint64_t v5 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    AMFIProfileGetScheduledProfile_cold_5();
  }

  uint64_t v6 = NSErrorToAMFIReturn(v4);
  uint64_t v7 = 0;
  id v8 = 0;
LABEL_24:

  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

void sub_20DBF1FAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AMFIProfileCommitProfile(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = +[AMFIFMKLog generic];
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3) {
      goto LABEL_7;
    }
    int v12 = 136315394;
    uint64_t v13 = "AMFIProfileCommitProfile";
    __int16 v14 = 2112;
    id v15 = v1;
    id v4 = "[%s] attempting to commit profile: %@";
    uint64_t v5 = v2;
    uint32_t v6 = 22;
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    int v12 = 136315138;
    uint64_t v13 = "AMFIProfileCommitProfile";
    id v4 = "[%s] attempting to remove staged profile";
    uint64_t v5 = v2;
    uint32_t v6 = 12;
  }
  _os_log_impl(&dword_20DBEC000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v12, v6);
LABEL_7:

  id v7 = +[AMFIConnection newConnection];
  id v8 = [v7 commitProfileForUuid:v1];

  if (v8)
  {
    uint64_t v9 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      AMFIProfileCommitProfile_cold_1();
    }

    uint64_t v10 = NSErrorToAMFIReturn(v8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t AMFIProfileSetTrust(unsigned int a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AMFIProfileSetTrustWithOptions(v3, a1, 0);

  return v4;
}

uint64_t AMFIProfileSetTrustWithOptions(void *a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a1;
  if (!v5)
  {
    uint64_t v10 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      AMFIProfileSetTrustWithOptions_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_11;
  }
  if ((a2 - 1) >= 2)
  {
    uint64_t v10 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      AMFIProfileSetTrustWithOptions_cold_4(a2, v10);
    }
LABEL_11:
    id v8 = 0;
    uint64_t v18 = 7;
LABEL_12:

    __int16 v19 = 0;
    goto LABEL_13;
  }
  uint32_t v6 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 136315650;
    *(void *)&buf[1] = "AMFIProfileSetTrustWithOptions";
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 1024;
    int v27 = a2;
    _os_log_impl(&dword_20DBEC000, v6, OS_LOG_TYPE_DEFAULT, "[%s] attempting to set trust: %@ | %u", (uint8_t *)buf, 0x1Cu);
  }

  int ProfileAuxiliarySignature = _getProfileAuxiliarySignature(v5);
  id v8 = 0;
  if (ProfileAuxiliarySignature)
  {
    int v9 = MISCopyProvisioningProfile();
    uint64_t v10 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315650;
      *(void *)&buf[1] = "AMFIProfileSetTrustWithOptions";
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 1024;
      int v27 = v9;
      _os_log_impl(&dword_20DBEC000, v10, OS_LOG_TYPE_DEFAULT, "[%s] unable to copy profile: %@ | %d", (uint8_t *)buf, 0x1Cu);
    }
    uint64_t v18 = 6;
    goto LABEL_12;
  }
  id v21 = +[AMFIConnection newConnection];
  __int16 v19 = [v21 setTrustForUuid:v5 withSignature:0 withSignType:a2];

  if (v19)
  {
    uint64_t v22 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      AMFIProfileSetTrustWithOptions_cold_2();
    }

    uint64_t v18 = NSErrorToAMFIReturn(v19);
  }
  else
  {
    uint64_t v18 = 0;
  }
LABEL_13:

  return v18;
}

void sub_20DBF255C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }

  _Unwind_Resume(a1);
}

uint64_t AMFIProfileRemoveTrust(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = +[AMFIFMKLog generic];
  id v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      uint64_t v16 = "AMFIProfileRemoveTrust";
      __int16 v17 = 2112;
      id v18 = v1;
      _os_log_impl(&dword_20DBEC000, v3, OS_LOG_TYPE_DEFAULT, "[%s] attempting to remove trust: %@", (uint8_t *)&v15, 0x16u);
    }

    id v4 = +[AMFIConnection newConnection];
    id v3 = [v4 removeTrustforUuid:v1];

    if (!v3)
    {
      uint64_t v6 = 0;
      goto LABEL_13;
    }
    id v5 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRemoveTrust_cold_2();
    }

    uint64_t v6 = NSErrorToAMFIReturn(v3);
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRemoveTrust_cold_1(v3, v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v6 = 7;
  }

LABEL_13:
  return v6;
}

uint64_t AMFISupervisedModeSetState(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "AMFISupervisedModeSetState";
    __int16 v10 = 1024;
    int v11 = a1;
    _os_log_impl(&dword_20DBEC000, v2, OS_LOG_TYPE_DEFAULT, "[%s] setting supervised state: %u", (uint8_t *)&v8, 0x12u);
  }

  id v3 = +[AMFIConnection newConnection];
  id v4 = [v3 setSupervisedState:a1];

  if (v4)
  {
    id v5 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AMFISupervisedModeSetState_cold_1();
    }

    uint64_t v6 = NSErrorToAMFIReturn(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t AMFIDemoModeSetState(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "AMFIDemoModeSetState";
    __int16 v10 = 1024;
    int v11 = a1;
    _os_log_impl(&dword_20DBEC000, v2, OS_LOG_TYPE_DEFAULT, "[%s] setting demo state: %u", (uint8_t *)&v8, 0x12u);
  }

  id v3 = +[AMFIConnection newConnection];
  id v4 = [v3 setDemoState:a1];

  if (v4)
  {
    id v5 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AMFIDemoModeSetState_cold_1();
    }

    uint64_t v6 = NSErrorToAMFIReturn(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t AMFIMDMModeEnroll(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "AMFIMDMModeEnroll";
    _os_log_impl(&dword_20DBEC000, v2, OS_LOG_TYPE_DEFAULT, "[%s] enabling MDM state", (uint8_t *)&v8, 0xCu);
  }

  id v3 = +[AMFIConnection newConnection];
  id v4 = [v3 setManagedState:v1];

  if (v4)
  {
    id v5 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AMFIMDMModeEnroll_cold_1();
    }

    uint64_t v6 = NSErrorToAMFIReturn(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t AMFIMDMModeRemove()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v0 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "AMFIMDMModeRemove";
    _os_log_impl(&dword_20DBEC000, v0, OS_LOG_TYPE_DEFAULT, "[%s] removing MDM state", (uint8_t *)&v6, 0xCu);
  }

  id v1 = +[AMFIConnection newConnection];
  id v2 = [v1 removeManagedState];

  if (v2)
  {
    id v3 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      AMFIMDMModeRemove_cold_1();
    }

    uint64_t v4 = NSErrorToAMFIReturn(v2);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

BOOL LWCRTypeVerificationNSDictionary(void *a1, int a2, void *a3)
{
  id v5 = a1;
  int v6 = objc_opt_new();
  v9[0] = a2;
  v9[1] = 0;
  uint64_t v10 = v6;
  int v11 = typeMaskForNSType;
  uint64_t v12 = integerValueForNSNumber;
  uint64_t v13 = stringValueForNSString;
  uint64_t v14 = iterateDictionary;
  int v15 = iterateArray;
  uint64_t v16 = pushKeyContext;
  __int16 v17 = popKeyContext;
  id v18 = setError;
  BOOL v7 = LWCRTypeVerificationBackend_verifyLWCR((uint64_t)v9, (uint64_t)v5);

  if (a3 && !v7)
  {
    *a3 = [v6 synthesizeError];
  }

  return v7;
}

uint64_t typeMaskForNSType(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = 32;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = 16;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v2 = 4;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v2 = 8;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ((unint64_t)[v1 longLongValue] >= 2) {
              uint64_t v2 = 2;
            }
            else {
              uint64_t v2 = 3;
            }
          }
          else
          {
            uint64_t v2 = 0;
          }
        }
      }
    }
  }

  return v2;
}

uint64_t stringValueForNSString(void *a1)
{
  id v1 = a1;
  return [v1 UTF8String];
}

void iterateDictionary(void *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __iterateDictionary_block_invoke;
  v5[3] = &unk_264128168;
  id v6 = v3;
  id v4 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];
}

void iterateArray(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * v8))) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void pushKeyContext(uint64_t a1, uint64_t a2)
{
  id v3 = NSString;
  id v4 = *(id *)(a1 + 8);
  id v5 = [v3 stringWithUTF8String:a2];
  [v4 pushKey:v5];
}

uint64_t popKeyContext(uint64_t a1)
{
  return [*(id *)(a1 + 8) popKey];
}

uint64_t setError(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 8) setError:a2];
}

BOOL LWCRTypeVerificationNSDictionary_RequirementsOnly(void *a1, int a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = objc_opt_new();
  v9[0] = a2;
  v9[1] = 0;
  long long v10 = v6;
  long long v11 = typeMaskForNSType;
  long long v12 = integerValueForNSNumber;
  uint64_t v13 = stringValueForNSString;
  uint64_t v14 = iterateDictionary;
  int v15 = iterateArray;
  uint64_t v16 = pushKeyContext;
  __int16 v17 = popKeyContext;
  id v18 = setError;
  BOOL v7 = LWCRTypeVerificationBackend_verifyRequirements((uint64_t)v9, (uint64_t)v5);

  if (a3 && !v7)
  {
    *a3 = [v6 synthesizeError];
  }

  return v7;
}

void __iterateDictionary_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  id v9 = a3;
  LOBYTE(v8) = (*(uint64_t (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, [v10 UTF8String], v9);

  *a4 = v8 ^ 1;
}

uint64_t __AMFIGetSecurityBootModeWithPath(void *a1, void *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], (const char *)[a1 cStringUsingEncoding:4]);
  if (!v3)
  {
    id CFProperty = 0;
    goto LABEL_6;
  }
  io_object_t v4 = v3;
  id CFProperty = (id)IORegistryEntryCreateCFProperty(v3, @"security-mode-change-enable", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  IOObjectRelease(v4);
  if (!CFProperty)
  {
LABEL_6:
    uint64_t v6 = 5;
    goto LABEL_8;
  }
  if (a2)
  {
    id CFProperty = CFProperty;
    uint64_t v6 = 0;
    *a2 = CFProperty;
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_8:

  return v6;
}

uint64_t AMFICompleteSecurityBootMode(unsigned int a1)
{
  kern_return_t v6;
  id v7;
  id v8;
  uint64_t v10;
  io_connect_t connect;

  connect = 0;
  id v10 = a1;
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_object_t v5 = MatchingService;
  if (MatchingService)
  {
    uint64_t v6 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
    if (!v6)
    {
      uint64_t v6 = IOConnectCallScalarMethod(connect, 0x10u, &v10, 1u, 0, 0);
      if (a1 - 1 <= 1)
      {
        id v7 = +[AMFIConnection newConnection];
        uint64_t v8 = (id)[v7 initiateDeveloperModeDaemons];
      }
    }
  }
  else
  {
    uint64_t v6 = -536870212;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (v5) {
    IOObjectRelease(v5);
  }
  return 4 * (v6 != 0);
}

uint64_t AMFIArmSecurityBootMode(unsigned int a1)
{
  kern_return_t v5;
  io_connect_t v6;
  uint64_t v8;
  io_connect_t connect;

  connect = 0;
  uint64_t v8 = a1;
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v2 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    io_object_t v5 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
    uint64_t v6 = connect;
    if (v5)
    {
      if (!connect)
      {
LABEL_5:
        IOObjectRelease(v4);
        return 4 * (v5 != 0);
      }
    }
    else
    {
      io_object_t v5 = IOConnectCallScalarMethod(connect, 0xBu, &v8, 1u, 0, 0);
      uint64_t v6 = connect;
      if (!connect) {
        goto LABEL_5;
      }
    }
    IOServiceClose(v6);
    goto LABEL_5;
  }
  return 4;
}

uint64_t AMFIGetSecurityBootMode(_DWORD *a1)
{
  int v7 = 0;
  id v6 = 0;
  uint64_t v2 = __AMFIGetSecurityBootModeWithPath(@"IODeviceTree:/chosen", &v6);
  id v3 = v6;
  io_object_t v4 = v3;
  if (!v2)
  {
    if ([v3 length] == 4)
    {
      [v4 getBytes:&v7 length:4];
      uint64_t v2 = 0;
      if (a1) {
        *a1 = v7;
      }
    }
    else
    {
      uint64_t v2 = 6;
    }
  }

  return v2;
}

uint64_t AMFIGetSecurityBootModeArmed(int *a1)
{
  id v12 = 0;
  unsigned int v2 = __AMFIGetSecurityBootModeWithPath(@"IODeviceTree:/options", &v12);
  id v3 = v12;
  if (v2)
  {
    int v4 = 0;
    id v5 = 0;
  }
  else
  {
    id v6 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    *__error() = 0;
    id v5 = v6;
    unint64_t v7 = strtoul((const char *)[v5 cStringUsingEncoding:4], 0, 0);
    int v8 = *__error();
    int v9 = -1;
    if (v7 < 0xFFFFFFFF) {
      int v9 = v7;
    }
    if (v8) {
      unsigned int v2 = 3;
    }
    else {
      unsigned int v2 = 0;
    }
    if (v8) {
      int v4 = 0;
    }
    else {
      int v4 = v9;
    }
  }
  if (v2 == 5) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v2;
  }
  if (a1 && !v10)
  {
    if (v2 == 5) {
      int v4 = 0;
    }
    *a1 = v4;
  }

  return v10;
}

uint64_t AMFIDeveloperModeCommit(int a1)
{
  kern_return_t v6;
  io_connect_t v7;
  io_connect_t connect;

  connect = 0;
  if (a1) {
    uint32_t v1 = 14;
  }
  else {
    uint32_t v1 = 12;
  }
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    id v6 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
    unint64_t v7 = connect;
    if (v6)
    {
      if (!connect)
      {
LABEL_8:
        IOObjectRelease(v5);
        return 4 * (v6 != 0);
      }
    }
    else
    {
      id v6 = IOConnectCallScalarMethod(connect, v1, 0, 0, 0, 0);
      unint64_t v7 = connect;
      if (!connect) {
        goto LABEL_8;
      }
    }
    IOServiceClose(v7);
    goto LABEL_8;
  }
  return 4;
}

BOOL LWCRTypeVerificationXPCDictionary(uint64_t a1, int a2, char **a3)
{
  xpc_object_t v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = a2;
  v8[1] = 0;
  int v9 = &v18;
  uint64_t v10 = typeMaskForXPCObj;
  long long v11 = integerValueForXPCObj;
  id v12 = stringValueForXPCObj;
  uint64_t v13 = iterateDictionary_0;
  uint64_t v14 = iterateArray_0;
  int v15 = pushKeyContext_0;
  uint64_t v16 = popKeyContext_0;
  __int16 v17 = setError_0;
  uint64_t v18 = 0;
  xpc_object_t v19 = xpc_array_create(0, 0);
  LODWORD(v20) = 0;
  BOOL v5 = LWCRTypeVerificationBackend_verifyLWCR((uint64_t)v8, a1);
  BOOL v6 = v5;
  if (a3 && !v5) {
    *a3 = LWCRTypeErrorContextSynthesizeError((uint64_t)&v18);
  }
  xpc_release(v19);
  return v6;
}

uint64_t typeMaskForXPCObj()
{
  uint64_t v0 = MEMORY[0x2105665A0]();
  if (v0 == MEMORY[0x263EF8708]) {
    return 32;
  }
  if (v0 == MEMORY[0x263EF86D8]) {
    return 16;
  }
  if (v0 == MEMORY[0x263EF8798]) {
    return 4;
  }
  if (v0 == MEMORY[0x263EF86F8]) {
    return 8;
  }
  if (v0 == MEMORY[0x263EF86E0]) {
    return 1;
  }
  return 2 * (v0 == MEMORY[0x263EF8738]);
}

BOOL iterateDictionary_0(void *a1, uint64_t a2)
{
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 0x40000000;
  applier[2] = __iterateDictionary_block_invoke_0;
  applier[3] = &unk_264128190;
  applier[4] = a2;
  return xpc_dictionary_apply(a1, applier);
}

BOOL iterateArray_0(void *a1, uint64_t a2)
{
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 0x40000000;
  applier[2] = __iterateArray_block_invoke;
  applier[3] = &unk_2641281B8;
  applier[4] = a2;
  return xpc_array_apply(a1, applier);
}

void pushKeyContext_0(uint64_t a1, const char *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      if (*(void *)v2 >= xpc_array_get_count(*(xpc_object_t *)(v2 + 8))) {
        size_t v4 = -1;
      }
      else {
        size_t v4 = *(void *)v2;
      }
      xpc_array_set_string(*(xpc_object_t *)(v2 + 8), v4, a2);
      ++*(void *)v2;
    }
  }
}

uint64_t popKeyContext_0(uint64_t result)
{
  uint32_t v1 = *(void **)(result + 8);
  if (v1)
  {
    if (*v1) {
      --*v1;
    }
  }
  return result;
}

uint64_t setError_0(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2) {
    *(_DWORD *)(v2 + 16) = a2;
  }
  return result;
}

char *LWCRTypeErrorContextSynthesizeError(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (char *)malloc_type_calloc(1uLL, 0x804uLL, 0x10000406A7154B6uLL);
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)uint64_t v2 = v3;
    size_t v4 = LWCRTypeVerificationBackend_errorStringForCode(v3);
    unsigned int v5 = snprintf(v2 + 4, 0x800uLL, "Error: %s, Context: ", v4);
    if (*(void *)a1)
    {
      if (v5 <= 0x7FF)
      {
        size_t v6 = 0;
        do
        {
          if (v6 && (unint64_t)__strlcat_chk() > 0x7FF) {
            break;
          }
          xpc_array_get_string(*(xpc_object_t *)(a1 + 8), v6);
          unint64_t v7 = __strlcat_chk();
          if (++v6 >= *(void *)a1) {
            break;
          }
        }
        while (v7 < 0x800);
      }
    }
  }
  return v2;
}

BOOL LWCRTypeVerificationXPCDictionary_RequirementsOnly(uint64_t a1, int a2, char **a3)
{
  xpc_object_t v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = a2;
  v8[1] = 0;
  int v9 = &v18;
  uint64_t v10 = typeMaskForXPCObj;
  long long v11 = integerValueForXPCObj;
  id v12 = stringValueForXPCObj;
  uint64_t v13 = iterateDictionary_0;
  uint64_t v14 = iterateArray_0;
  int v15 = pushKeyContext_0;
  uint64_t v16 = popKeyContext_0;
  __int16 v17 = setError_0;
  uint64_t v18 = 0;
  xpc_object_t v19 = xpc_array_create(0, 0);
  LODWORD(v20) = 0;
  BOOL v5 = LWCRTypeVerificationBackend_verifyRequirements((uint64_t)v8, a1);
  BOOL v6 = v5;
  if (a3 && !v5) {
    *a3 = LWCRTypeErrorContextSynthesizeError((uint64_t)&v18);
  }
  xpc_release(v19);
  return v6;
}

uint64_t __iterateDictionary_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __iterateArray_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_20DBF4148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_20DBF43B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF4694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_20DBF495C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20DBF4BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF4E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20DBF50B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF52D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF54D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF56C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF58B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF5AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DBF5C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AMFIExecutionPreflight_cold_1(void *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v5 = [a1 path];
  v6[0] = 67109378;
  v6[1] = a2;
  __int16 v7 = 2112;
  int v8 = v5;
  _os_log_error_impl(&dword_20DBEC000, a3, OS_LOG_TYPE_ERROR, "Error cannot evaluate unknown platform (%d) for: %@", (uint8_t *)v6, 0x12u);
}

void AMFIExecutionPreflight_cold_2()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "path");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20DBEC000, v3, v4, "Unexpected option(s) in dictionary: %@ for: %@", v5, v6, v7, v8, v9);
}

void AMFIExecutionPreflight_cold_4()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "path");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20DBEC000, v3, v4, "Invalid slice offset (%@) for: %@", v5, v6, v7, v8, v9);
}

void AMFIExecutionPreflight_cold_5()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "path");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20DBEC000, v3, v4, "Invalid cpu type (%@) for: %@", v5, v6, v7, v8, v9);
}

void AMFIExecutionPreflight_cold_6()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "path");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20DBEC000, v3, v4, "Invalid cpu sub type (%@) for: %@", v5, v6, v7, v8, v9);
}

void AMFIExecutionPreflight_cold_7()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "path");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20DBEC000, v3, v4, "Invalid flags (%@) for: %@", v5, v6, v7, v8, v9);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to add public key to AMFI", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to extract public key from local signing private key", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_3(NSObject *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  uint64_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_20DBEC000, a1, OS_LOG_TYPE_ERROR, "unable to add public key to AMFI: %d (%s)", (uint8_t *)v5, 0x12u);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFICopySwiftPlaygroundsSigningKey_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFICopySwiftPlaygroundsSigningKey_cold_6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to find local signing key on the system", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFICopySwiftPlaygroundsSigningKey_cold_8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to allocate a CFNumberRef for the key size", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to allocate a SecAccessControlRef for the key access control", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_10()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to allocate a CFNumberRef for the system boundary", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to allocate a CFMutableDictionaryRef for the key parameters", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_12()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "SecKeyCreate error: <unknown>", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_13(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFICopySwiftPlaygroundsSigningKey_cold_14(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_20DBEC000, log, OS_LOG_TYPE_ERROR, "SecKeyCreate error: %ld (%s)", (uint8_t *)&v3, 0x16u);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_15()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "found untrusted object in the keychain", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_16()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "unable to allocate a CFMutableDictionaryRef for the keyQuery", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_17()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "found no local signing keys in keychain", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFICopySwiftPlaygroundsSigningKey_cold_19()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20DBEC000, v0, v1, "SecItemCopyMatching returned unknown object", v2, v3, v4, v5, v6);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_20(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void errorCodeForMISError_cold_1(int a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2112;
  id v6 = (id)MISCopyErrorStringForErrorCode();
  id v3 = v6;
  _os_log_error_impl(&dword_20DBEC000, a2, OS_LOG_TYPE_ERROR, "Unexpected MISError (0x%x): %@", (uint8_t *)v4, 0x12u);
}

void AMFIProfileRequiresReboot_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileRequiresReboot_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getProfileAuxiliarySignature_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] missing Team ID: %@", v2, v3, v4, v5, 2u);
}

void _getProfileAuxiliarySignature_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_20DBEC000, v0, v1, "[%s] missing profile: %@ | %u", v2);
}

void AMFIProfileScheduleTrust_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileScheduleTrust_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] no reboot requirement: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileScheduleTrust_cold_3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to stage profile: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileScheduleTrust_cold_4()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_20DBEC000, v0, v1, "[%s] unable to check for reboot: %@ | %u", v2);
}

void AMFIProfileGetScheduledProfile_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileGetScheduledProfile_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] missing Team ID: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileGetScheduledProfile_cold_3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] missing Team Name: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileGetScheduledProfile_cold_4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] missing profile: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileGetScheduledProfile_cold_5()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to acquire staged profile: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileCommitProfile_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to commit profile: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileSetTrustWithOptions_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileSetTrustWithOptions_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to set trust: %@", v2, v3, v4, v5, 2u);
}

void AMFIProfileSetTrustWithOptions_cold_3()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_20DBEC000, v2, OS_LOG_TYPE_ERROR, "[%s] unable to create aux-sig: %@ | %@ (not-fatal)", (uint8_t *)v3, 0x20u);
}

void AMFIProfileSetTrustWithOptions_cold_4(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "AMFIProfileSetTrustWithOptions";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_20DBEC000, a2, OS_LOG_TYPE_ERROR, "[%s] unknown trust type: %u", (uint8_t *)&v2, 0x12u);
}

void AMFIProfileRemoveTrust_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileRemoveTrust_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to remove trust: %@", v2, v3, v4, v5, 2u);
}

void AMFISupervisedModeSetState_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to set state: %@", v2, v3, v4, v5, 2u);
}

void AMFIDemoModeSetState_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to set state: %@", v2, v3, v4, v5, 2u);
}

void AMFIMDMModeEnroll_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to enable MDM: %@", v2, v3, v4, v5, 2u);
}

void AMFIMDMModeRemove_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] unable to remove MDM: %@", v2, v3, v4, v5, 2u);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A8](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MISCopyAuxiliarySignature()
{
  return MEMORY[0x270F99EC0]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x270F99EC8]();
}

uint64_t MISCopyProvisioningProfile()
{
  return MEMORY[0x270F99ED0]();
}

uint64_t MISEnumerateMatchingProfiles()
{
  return MEMORY[0x270F99ED8]();
}

uint64_t MISProfileCreateDataRepresentation()
{
  return MEMORY[0x270F99EE0]();
}

uint64_t MISProfileGetValue()
{
  return MEMORY[0x270F99EE8]();
}

uint64_t MISProfileIsDEREncoded()
{
  return MEMORY[0x270F99EF0]();
}

uint64_t MISProfileSupportsAuxiliarySignature()
{
  return MEMORY[0x270F99EF8]();
}

uint64_t MISProvisioningProfileGetTeamIdentifier()
{
  return MEMORY[0x270F99F10]();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return MEMORY[0x270F99F20]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x270EFD9C8]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

uint64_t SecKeyCopySystemKey()
{
  return MEMORY[0x270EFD9E8]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x270EFDAA0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x270ED7E80]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

void xpc_release(xpc_object_t object)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}