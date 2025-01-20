CFTypeRef MDCopyDecodedXattrFromData(void *a1, CFTypeRef cf)
{
  uint64_t v4;
  CFTypeRef result;
  CFTypeID v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  char isKindOfClass;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x263EF8340];
  v4 = *MEMORY[0x263EFFD08];
  result = cf;
  if ((CFTypeRef)*MEMORY[0x263EFFD08] == cf)
  {
LABEL_4:
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  v6 = CFGetTypeID(cf);
  if (v6 == CFDataGetTypeID())
  {
    result = (CFTypeRef)MDPropertyCopyDecodedValue();
    goto LABEL_4;
  }
LABEL_5:
  if (![a1 isEqualToString:@"com.apple.metadata:_kMDItemUserTags"]) {
    return 0;
  }
  if (MDCopyDecodedXattrFromData_onceToken != -1) {
    dispatch_once(&MDCopyDecodedXattrFromData_onceToken, &__block_literal_global_0);
  }
  v26 = 0;
  v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:MDCopyDecodedXattrFromData_sUserTagsUnarchiveValidClasses fromData:cf error:&v26];
  v8 = v26;
  if (v26)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = a1;
      _os_log_impl(&dword_24954B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Decoding error: %@ for %@", buf, 0x16u);
    }
    return (CFTypeRef)v4;
  }
  v9 = (void *)v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"v"), "isEqual:", &unk_26FD30498))return 0; {
  v10 = (void *)[v9 objectForKeyedSubscript:@"t"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v11 = [v10 count];
  v12 = v11;
  if (v11 > 99) {
    return 0;
  }
  v13 = 8 * v11;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v14 = (id *)((char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v14, 8 * v12);
  v15 = objc_msgSend(v10, "getObjects:range:", v14, 0, v12);
  MEMORY[0x270FA5388](v15);
  v16 = v14;
  bzero(v14, 8 * v12);
  if (v12 < 1) {
    return 0;
  }
  v17 = 0;
  do
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v19 = *v14;
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      v22 = *v14;
      goto LABEL_31;
    }
    v20 = [*v14 count];
    if (v20 == 2)
    {
      [v19 objectAtIndexedSubscript:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      v22 = (void *)[v19 objectAtIndexedSubscript:0];
      v23 = (void *)[v19 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [v23 intValue];
        if ((v24 - 1) <= 6)
        {
          v21 = objc_msgSend(v22, "stringByAppendingFormat:", @"\n%d", v24);
LABEL_23:
          v22 = (void *)v21;
        }
      }
      if (!v22) {
        goto LABEL_32;
      }
LABEL_31:
      v16[v17++] = v22;
      goto LABEL_32;
    }
    if (v20 == 1)
    {
      [v19 objectAtIndexedSubscript:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [v19 objectAtIndexedSubscript:0];
        goto LABEL_23;
      }
    }
LABEL_32:
    ++v14;
    --v12;
  }
  while (v12);
  if (v17 > 0) {
    return (CFTypeRef)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:v16 count:v17];
  }
  return 0;
}

void sub_24954CE4C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      objc_end_catch();
      JUMPOUT(0x24954CDE8);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void *MDFSOnlyCopyExtendedAttributesFromFd(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  v3 = v2;
  v5 = v4;
  int v6 = v1;
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7 = value;
  bzero(value, 0x1000uLL);
  ssize_t v8 = fgetxattr(v6, v5, value, 0x1000uLL, 0, 0);
  if (v8 == -1)
  {
    if (*__error() != 34) {
      return 0;
    }
    ssize_t v9 = fgetxattr(v6, v5, 0, 0, 0, 0);
    v7 = (unsigned __int8 *)malloc_type_malloc(v9, 0x588B3D04uLL);
    ssize_t v8 = fgetxattr(v6, v5, v7, v9, 0, 0);
  }
  else
  {
    ssize_t v9 = v8;
  }
  v10 = 0;
  if (v9 >= 1 && v8 == v9)
  {
    if (((char)*v7 & 0x80000000) == 0)
    {
LABEL_8:
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFDataRef v12 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, v9, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
      v13 = (__CFString *)CFStringCreateWithCString(v11, v5, 0x8000100u);
      v10 = (void *)MDCopyDecodedXattrFromData(v13, v12);
      CFRelease(v12);
      CFRelease(v13);
      goto LABEL_9;
    }
    int v15 = *v7;
    if ((v15 - 241) >= 2)
    {
      if (v15 != 129) {
        goto LABEL_8;
      }
      if (v9 != 9) {
        goto LABEL_8;
      }
      v10 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFAbsoluteTime *)(v7 + 1));
      if (!v10) {
        goto LABEL_8;
      }
    }
    else if (v3)
    {
      unsigned char *v3 = 1;
      v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, v9);
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_9:
  if (v7 != value) {
    free(v7);
  }
  return v10;
}

void _MDItemFetchPrivateAttributesForURL(const __CFURL *a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (__CFString *)_MDItemCopyXattrsForURL(a1);
  uint64_t v5 = [(__CFString *)v4 objectForKey:@"_kMDItemEncryptedData"];
  int v6 = (void *)v5;
  if (v5)
  {
    v12[0] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___MDItemFetchPrivateAttributesForURL_block_invoke;
    v10[3] = &unk_26525E5D8;
    id v11 = v3;
    _MDItemDecrypt((uint64_t)v7, v10);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    ssize_t v9 = (const void *)[v8 initWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    (*((void (**)(id, const void *, void))v3 + 2))(v3, v9, 0);
    CFRelease(v9);
  }
}

CFStringRef _MDItemCopyXattrsForURL(const __CFURL *a1)
{
  CFStringRef result = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (result)
  {
    CFStringRef v2 = result;
    CFIndex Length = CFStringGetLength(result);
    CFIndex v4 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v5 = (char *)malloc_type_malloc(v4, 0xFE6805E4uLL);
    CFStringGetCString(v2, v5, v4, 0x8000100u);
    CFMutableDictionaryRef v6 = MDFSOnlyMDCopyXattrsDictionary(v5);
    free(v5);
    CFRelease(v2);
    return (const __CFString *)v6;
  }
  return result;
}

CFMutableDictionaryRef MDFSOnlyMDCopyXattrsDictionaryForFD(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  int v3 = v2;
  char v5 = v4;
  uint64_t v6 = v1;
  uint64_t v58 = *MEMORY[0x263EF8340];
  v7 = namebuff;
  bzero(namebuff, 0x1000uLL);
  ssize_t v8 = flistxattr(v6, namebuff, 0x1000uLL, 0);
  if (v8 < 0)
  {
    if (*__error() != 34) {
      return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    ssize_t v9 = flistxattr(v6, 0, 0, 0);
    v39 = (char *)malloc_type_malloc(v9, 0x87B0ECC2uLL);
    if (!v39) {
      return 0;
    }
    v7 = v39;
    if (flistxattr(v6, v39, v9, 0) < 0) {
      return 0;
    }
  }
  else
  {
    ssize_t v9 = v8;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v9 >= 1)
  {
    int v41 = v3;
    __s1 = v7;
    CFDataRef v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&kMDLabelPrivateXattrUUIDBytes];
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v12, 0);

    id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ((unint64_t)v9 >= 3)
    {
      double v14 = *MEMORY[0x263EFFAF8];
      int v15 = __s1;
      do
      {
        if (!*v15) {
          break;
        }
        if (!strncmp(v15, "com.apple.metadata", 0x12uLL))
        {
          int v22 = v15[18];
          LOBYTE(valuePtr) = 0;
          if (v22 == 58) {
            goto LABEL_20;
          }
          if (v22 == 46)
          {
            LOBYTE(valuePtr) = 1;
LABEL_20:
            v19 = MDFSOnlyCopyExtendedAttributesFromFd(v6);
            if (!v19 || (_BYTE)valuePtr)
            {
              if ((_BYTE)valuePtr && !strncmp(v15, "com.apple.metadata:kMDLabel_", 0x1CuLL))
              {
                bzero(&value, 0x400uLL);
                snprintf((char *)&value, 0x400uLL, "%s.%s", "com.apple.metadata", v15 + 28);
                objc_msgSend(v42, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", &value));
                [v43 addObject:v19];
              }
              if (!v19) {
                goto LABEL_47;
              }
            }
            else if ((v5 & 1) == 0)
            {
              CFStringRef v23 = CFStringCreateWithCString(v10, v15 + 19, 0x8000100u);
              if (v23)
              {
                CFStringRef v24 = v23;
                CFDictionaryAddValue(Mutable, v23, v19);
                CFRelease(v24);
              }
            }
LABEL_36:
            CFRelease(v19);
          }
        }
        else if ((v5 & 1) == 0)
        {
          if (!strcmp(v15, "com.apple.lastuseddate#PS"))
          {
            uint64_t value = 0;
            uint64_t v55 = 0;
            uint64_t v56 = 0;
            if (v6 == -1) {
              goto LABEL_46;
            }
            ssize_t v25 = fgetxattr(v6, "com.apple.lastuseddate#PS", &value, 0x18uLL, 0, 0);
            if ((v25 & 0x8000000000000000) == 0)
            {
              if (v25 != 16)
              {
LABEL_46:
                *__error() = 22;
                goto LABEL_47;
              }
              if (value)
              {
                v19 = CFDateCreate(v10, (double)v55 / 1000000000.0 + (double)value - v14);
                v20 = Mutable;
                v21 = @"kMDItemLastUsedDate";
                goto LABEL_35;
              }
            }
          }
          else if (!strcmp(v15, "com.apple.TextEncoding"))
          {
            p_uint64_t value = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v6, v15, &value, 0x400uLL, 0, 0) > 0) {
              goto LABEL_40;
            }
            if (*__error() == 34)
            {
              ssize_t v27 = fgetxattr(v6, v15, 0, 0, 0, 0);
              p_uint64_t value = (uint64_t *)malloc_type_calloc(1uLL, v27 + 1, 0x53B656AAuLL);
              fgetxattr(v6, v15, p_value, v27, 0, 0);
LABEL_40:
              v28 = strchr((char *)p_value, 59);
              if (v28)
              {
                CFStringEncoding encoding = 0;
                if (sscanf(v28 + 1, "%u", &encoding) == 1)
                {
                  if (CFStringIsEncodingAvailable(encoding))
                  {
                    CFStringEncoding valuePtr = encoding;
                    CFNumberRef v29 = CFNumberCreate(v10, kCFNumberSInt32Type, &valuePtr);
                    CFDictionarySetValue(Mutable, @"--_kMDItemTextEncodingHint", v29);
                    CFRelease(v29);
                  }
                }
              }
              if (p_value != &value) {
                free(p_value);
              }
            }
          }
          else if (!strncmp(v15, "com.apple.SharedWithYou", 0x17uLL))
          {
            v16 = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v6, v15, &value, 0x400uLL, 0, 0) <= 0)
            {
              if (*__error() != 34) {
                goto LABEL_47;
              }
              ssize_t v17 = fgetxattr(v6, v15, 0, 0, 0, 0);
              v16 = (uint64_t *)malloc_type_calloc(1uLL, v17 + 1, 0xFCE0A9DFuLL);
              fgetxattr(v6, v15, v16, v17, 0, 0);
            }
            CFStringRef v18 = CFStringCreateWithCString(v10, (const char *)v16, 0x8000100u);
            if (v18)
            {
              v19 = v18;
              v20 = Mutable;
              v21 = @"com.apple.SharedWithYou";
LABEL_35:
              CFDictionarySetValue(v20, v21, v19);
              goto LABEL_36;
            }
          }
        }
LABEL_47:
        size_t v30 = strlen(v15) + 1;
        v15 += v30;
        v9 -= v30;
      }
      while (v9 > 2);
    }
    if ([v42 count])
    {
      if (v41)
      {
        v31 = (const void *)_MDPlistContainerCreateMutable();
        _MDPlistContainerBeginContainer();
        _MDPlistContainerBeginDictionary();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerAddCString();
        _MDPlistContainerBeginArray();
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v32 = [v13 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v46 != v34) {
                objc_enumerationMutation(v13);
              }
              [*(id *)(*((void *)&v45 + 1) + 8 * i) UUIDString];
              _MDPlistContainerAddObject();
            }
            uint64_t v33 = [v13 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v33);
        }
        _MDPlistContainerEndArray();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerEndDictionary();
        _MDPlistContainerEndContainer();
        id v36 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t Bytes = _MDPlistContainerGetBytes();
        v38 = (void *)[v36 initWithBytes:Bytes length:_MDPlistContainerGetLength()];
        CFDictionarySetValue(Mutable, @"_kMDItemEncryptedData", v38);

        CFRelease(v31);
      }
      else
      {
        v51[0] = @"xids";
        v51[1] = @"uuids";
        v52[0] = v42;
        v52[1] = v13;
        v51[2] = @"datas";
        v52[2] = v43;
        CFDictionarySetValue(Mutable, @"_kMDItemEncryptedDataDictionary", (const void *)[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3]);
      }
    }

    if (__s1 != namebuff) {
      free(__s1);
    }
  }
  return Mutable;
}

CFMutableDictionaryRef MDFSOnlyMDCopyXattrsDictionary(const char *a1)
{
  uint64_t v1 = open(a1, 33024);
  if (v1 == -1) {
    return 0;
  }
  int v2 = v1;
  CFMutableDictionaryRef v3 = MDFSOnlyMDCopyXattrsDictionaryForFD(v1);
  close(v2);
  return v3;
}

BOOL isFsType(int a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  bzero(&v5, 0x878uLL);
  return !fstatfs(a1, &v5) && !strcmp(v5.f_fstypename, a2);
}

BOOL isExFat(int a1)
{
  return isFsType(a1, "exfat");
}

BOOL isMsDos(int a1)
{
  return isFsType(a1, "msdos");
}

BOOL isFat32(int a1)
{
  return isFsType(a1, "fat32");
}

void _MDItemSetPrivateAttributesForURL(const __CFURL *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  statfs v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x24C5A0ED0]();
  v7 = +[MDPrivateXattrServices defaultServices];
  if (_MDItemSetPrivateAttributesForURL_once != -1) {
    dispatch_once(&_MDItemSetPrivateAttributesForURL_once, &__block_literal_global);
  }
  bzero(buffer, 0x400uLL);
  if (!a1 || !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    NSLog(&cfstr_InvalidUrl.isa, a1);
    id v13 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v14 = *MEMORY[0x263F08438];
    uint64_t v15 = 22;
LABEL_8:
    v16 = (const void *)[v13 initWithDomain:v14 code:v15 userInfo:0];
    v5[2](v5, v16);
    CFRelease(v16);
    goto LABEL_9;
  }
  uint64_t v8 = open((const char *)buffer, 2);
  if ((v8 & 0x80000000) != 0)
  {
    id v17 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v18 = *MEMORY[0x263F08438];
    uint64_t v15 = *__error();
    id v13 = v17;
    uint64_t v14 = v18;
    goto LABEL_8;
  }
  uint64_t v9 = v8;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v10 setObject:_MDItemSetPrivateAttributesForURL_sMDPrivateMDAttributesXattrNSUUID forKey:@"uuid"];
  id v11 = [a2 allKeys];
  [v10 setObject:v11 forKey:@"keys"];

  CFDataRef v12 = [a2 allValues];
  [v10 setObject:v12 forKey:@"values"];

  [v7 updatePrivateXattrParams:v10 flags:0 forFileDescriptor:v9 mergeCallback:&__block_literal_global_3 completionHandler:v5];
  close(v9);

LABEL_9:
}

id copyConnection()
{
  os_unfair_lock_lock((os_unfair_lock_t)&sLock);
  if (!sConnectionToService)
  {
    if (sConnectionRetainCount) {
      copyConnection_cold_1();
    }
    uint64_t v0 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.spotlight.CSExattrCryptoService"];
    uint64_t v1 = (void *)sConnectionToService;
    sConnectionToService = v0;

    int v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FD329F0];
    [(id)sConnectionToService setRemoteObjectInterface:v2];

    [(id)sConnectionToService resume];
  }
  ++sConnectionRetainCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&sLock);
  CFMutableDictionaryRef v3 = (void *)sConnectionToService;
  return v3;
}

void releaseConnection(void *a1)
{
  id v2 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&sLock);
  if ((id)sConnectionToService != v2) {
    releaseConnection_cold_3();
  }
  if (!v2) {
    releaseConnection_cold_1();
  }
  if (!sConnectionRetainCount) {
    releaseConnection_cold_2();
  }
  if (!--sConnectionRetainCount)
  {
    [v2 invalidate];
    uint64_t v1 = (void *)sConnectionToService;
    sConnectionToService = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sLock);
}

void _MDItemDecrypt(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = copyConnection();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = ___MDItemDecrypt_block_invoke;
  v12[3] = &unk_26525E588;
  id v5 = v3;
  id v13 = v5;
  uint64_t v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
  if (v6)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___MDItemDecrypt_block_invoke_2;
    v9[3] = &unk_26525E5B0;
    id v11 = v5;
    id v10 = v4;
    [v6 decryptAttributesWithData:a1 withReply:v9];

    v7 = v11;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ___MDItemSetPrivateAttributesForURL_block_invoke_2_cold_1();
    }
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    v7 = (void *)[v8 initWithDomain:*MEMORY[0x263F08438] code:61 userInfo:0];
    (*((void (**)(id, void *, void))v5 + 2))(v5, v7, 0);
    releaseConnection(v4);
  }
}

uint64_t MDUtiTypeConformsToPedigree(void *a1, const char *a2)
{
  return [a1 containsObject:a2];
}

CFMutableDictionaryRef MDFSOnlyMDDictionaryCreateMutable()
{
  return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
}

void MDFSOnlyMDDictionaryIterate(const __CFDictionary *a1, void *context)
{
}

uint64_t MDFSOnlydictionaryApplierFunction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFNumberRef MDFSOnlyMDNumberCreateInt64(uint64_t a1)
{
  uint64_t valuePtr = a1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef MDFSOnlyMDNumberCreateInt32(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
}

CFNumberRef MDFSOnlyMDNumberGetInt64(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef MDFSOnlyMDNumberGetInt32(const __CFNumber *result)
{
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef MDFSOnlyMDNumberGetBool(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)(valuePtr != 0);
  }
  return result;
}

uint64_t __MDCopyDecodedXattrFromData_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  MDCopyDecodedXattrFromData_sUserTagsUnarchiveValidClasses = result;
  return result;
}

void sub_24954EB84(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a2 == 2)
  {
    objc_begin_catch(exc_buf);
    NSLog(&stru_26FD2FA50.isa);

    objc_end_catch();
  }
  else
  {
    objc_begin_catch(exc_buf);
  }
  JUMPOUT(0x24954EB54);
}

uint64_t addStandardKeychainAttributesToDictionary(void *a1)
{
  [a1 setObject:@"com.apple.Spotlight.Metadata" forKey:*MEMORY[0x263F16E80]];
  uint64_t v2 = *MEMORY[0x263EFFB40];
  [a1 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F170B0]];
  [a1 setObject:v2 forKey:*MEMORY[0x263F17520]];
  uint64_t v3 = *MEMORY[0x263F16F88];
  uint64_t v4 = *MEMORY[0x263F16F68];
  return [a1 setObject:v3 forKey:v4];
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void updateDesignatedUUIDIfNewer(uint64_t a1, void *a2, void *a3, id *a4)
{
  uint64_t v6 = (void *)[a2 objectForKey:*MEMORY[0x263F16F10]];
  if (!*(void *)(a1 + 8))
  {
    *(void *)(a1 + 8) = a3;
    goto LABEL_5;
  }
  if ([*a4 compare:v6] == 1)
  {

    *(void *)(a1 + 8) = a3;
LABEL_5:
    *a4 = v6;
    return;
  }
}

void sub_24954F174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFDataRef _copyCryptedDataWithKey(CCOperation a1, const void *a2, size_t a3, void *a4, int a5, int a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  size_t dataOutAvailable = a3 + 16;
  id v13 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:a3 + 16];
  CFIndex length = 0;
  iv[0] = a5;
  iv[1] = a6;
  uint64_t v22 = 0;
  CCCryptorStatus v14 = CCCrypt(a1, 0, 1u, (const void *)[a4 bytes], objc_msgSend(a4, "length"), iv, a2, a3, objc_msgSend(v13, "bytes"), dataOutAvailable, (size_t *)&length);
  if (v14)
  {
    int v15 = v14;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      _copyCryptedDataWithKey_cold_1(v15);
    }
    CFDataRef v16 = 0;
  }
  else
  {
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v18 = (const UInt8 *)[v13 bytes];
    CFDataRef v16 = CFDataCreate(v17, v18, length);
  }

  return v16;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t _MDLabelUUIDEncode(unint64_t a1, unint64_t a2, uint64_t a3)
{
  *(unsigned char *)a3 = _MDLabelUUIDEncode_encodingVector[a1 >> 3];
  *(unsigned char *)(a3 + 1) = _MDLabelUUIDEncode_encodingVector[((unsigned __int16)a1 >> 14) & 0xFFFFFFFFFFFFFFE3 | (4 * (a1 & 7))];
  *(unsigned char *)(a3 + 2) = _MDLabelUUIDEncode_encodingVector[(a1 >> 9) & 0x1F];
  *(unsigned char *)(a3 + 3) = _MDLabelUUIDEncode_encodingVector[(unint64_t)(BYTE2(a1) & 0xF0 | (a1 & 0x100)) >> 4];
  *(unsigned char *)(a3 + 4) = _MDLabelUUIDEncode_encodingVector[(a1 >> 15) & 0x1E | (a1 >> 31)];
  *(unsigned char *)(a3 + 5) = _MDLabelUUIDEncode_encodingVector[(a1 >> 26) & 0x1F];
  *(unsigned char *)(a3 + 6) = _MDLabelUUIDEncode_encodingVector[(a1 >> 21) & 0x18 | (a1 >> 37) & 7];
  *(unsigned char *)(a3 + 7) = _MDLabelUUIDEncode_encodingVector[HIDWORD(a1) & 0x1F];
  *(unsigned char *)(a3 + 8) = _MDLabelUUIDEncode_encodingVector[(a1 >> 43) & 0x1F];
  *(unsigned char *)(a3 + 9) = _MDLabelUUIDEncode_encodingVector[(a1 >> 38) & 0x1C | (a1 >> 54) & 3];
  *(unsigned char *)(a3 + 10) = _MDLabelUUIDEncode_encodingVector[(a1 >> 49) & 0x1F];
  *(unsigned char *)(a3 + 11) = _MDLabelUUIDEncode_encodingVector[(a1 >> 44) & 0x10 | (a1 >> 60)];
  *(unsigned char *)(a3 + 12) = _MDLabelUUIDEncode_encodingVector[(a1 >> 55) & 0x1E | (a2 >> 7) & 1];
  *(unsigned char *)(a3 + 13) = _MDLabelUUIDEncode_encodingVector[(a2 >> 2) & 0x1F];
  uint64_t result = HIWORD(a2) & 0x1F;
  *(unsigned char *)(a3 + 14) = _MDLabelUUIDEncode_encodingVector[((unsigned __int16)a2 >> 13) & 0xFFFFFFFFFFFFFFE7 | (8 * (a2 & 3))];
  *(unsigned char *)(a3 + 15) = _MDLabelUUIDEncode_encodingVector[(a2 >> 8) & 0x1F];
  *(unsigned char *)(a3 + 16) = _MDLabelUUIDEncode_encodingVector[(a2 >> 19) & 0x1F];
  *(unsigned char *)(a3 + 17) = _MDLabelUUIDEncode_encodingVector[(a2 >> 14) & 0x1C | (a2 >> 30)];
  *(unsigned char *)(a3 + 18) = _MDLabelUUIDEncode_encodingVector[(a2 >> 25) & 0x1F];
  *(unsigned char *)(a3 + 19) = _MDLabelUUIDEncode_encodingVector[(a2 >> 20) & 0x10 | (a2 >> 36) & 0xF];
  *(unsigned char *)(a3 + 20) = _MDLabelUUIDEncode_encodingVector[(a2 >> 31) & 0x1E | (a2 >> 47) & 1];
  *(unsigned char *)(a3 + 21) = _MDLabelUUIDEncode_encodingVector[(a2 >> 42) & 0x1F];
  *(unsigned char *)(a3 + 22) = _MDLabelUUIDEncode_encodingVector[(a2 >> 37) & 0x18 | (a2 >> 53) & 7];
  *(unsigned char *)(a3 + 23) = _MDLabelUUIDEncode_encodingVector[result];
  *(unsigned char *)(a3 + 24) = _MDLabelUUIDEncode_encodingVector[a2 >> 59];
  *(_WORD *)(a3 + 25) = _MDLabelUUIDEncode_encodingVector[(a2 >> 54) & 0x1C];
  return result;
}

uint64_t _MDPrivateXattrUUIDsGetter()
{
  if (_MDPrivateXattrUUIDsGetter_once != -1) {
    dispatch_once(&_MDPrivateXattrUUIDsGetter_once, &__block_literal_global_2);
  }
  return _MDPrivateXattrUUIDsGetter_uuids;
}

CFTypeID MDLabelGetTypeID(void)
{
  if (MDLabelGetTypeID_once != -1) {
    dispatch_once(&MDLabelGetTypeID_once, &__block_literal_global_14);
  }
  return MDLabelGetTypeID_typeID;
}

CFStringRef _MDLabelCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"<MDLabel %p [%@]>", a1, *(void *)(a1 + 16));
}

uint64_t __MDLabelGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  MDLabelGetTypeID_typeID = result;
  return result;
}

uint64_t copyUpdatedData(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v155 = v2;
  v156 = v3;
  id v5 = v4;
  char v7 = v6;
  int v9 = v8;
  id v11 = v10;
  uint64_t v13 = v12;
  CCCryptorStatus v14 = (void *)v1;
  *(void *)&v197[8183] = *MEMORY[0x263EF8340];
  int v15 = (void *)[v10 objectForKey:@"keys"];
  CFDataRef v16 = (void *)[v11 objectForKey:@"values"];
  id v166 = 0;
  unint64_t v17 = 0x263EFF000uLL;
  if (v13)
  {
    uint64_t v18 = objc_msgSend(+[MDPrivateXattrServices defaultServices](MDPrivateXattrServices, "defaultServices"), "copyPrivateXattrsFromData:decryptedXids:", v13, &v166);
    if ([v18 count])
    {
      id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
      v188[0] = [v18 allKeys];
      v188[1] = [v18 allValues];
      uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v188 count:2];
      v21 = v19;
      unint64_t v17 = 0x263EFF000;
      id v22 = (id)[v21 initWithObjects:v20 forKeys:&unk_26FD304B0];

      if (v22) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v22 = objc_alloc_init(*(Class *)(v17 + 2464));
LABEL_7:
  uint64_t v23 = objc_msgSend(+[MDKeyRing defaultKeyRing](MDKeyRing, "defaultKeyRing"), "copyDesignatedKeyUUID");
  CFStringRef v24 = (void *)[v11 objectForKey:@"uuid"];
  v159 = (void *)v23;
  int v157 = v9;
  if (!v9)
  {
    uint64_t v74 = [v22 objectForKey:@"uuid"];
    if (!v74 || ![v24 isEqual:v74]) {
      goto LABEL_84;
    }
    id v25 = copyUpdatedXattrDictionary(v22, v15, v16, v7);
LABEL_83:
    if (v25) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  id v25 = copyUpdatedXattrDictionary(v22, v15, v16, v7);
  if (eligbleToThin_once != -1) {
    dispatch_once(&eligbleToThin_once, &__block_literal_global_110);
  }
  if (![v15 count]
    || !objc_msgSend((id)eligbleToThin_sThinnableKeys, "containsObject:", objc_msgSend(v15, "objectAtIndexedSubscript:", 0)))
  {
    goto LABEL_83;
  }
  v153 = v24;
  v26 = (void *)[v25 objectForKey:@"keys"];
  v152 = (void *)[v25 objectForKey:@"values"];
  uint64_t v151 = [v25 objectForKey:@"mod_date"];
  if (![v15 count]) {
    goto LABEL_144;
  }
  uint64_t v27 = [v26 count];
  if (v27 != [v152 count] || !objc_msgSend(v26, "count")) {
    goto LABEL_144;
  }
  v145 = v11;
  v146 = v14;
  id v160 = v25;
  v149 = v26;
  v28 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithObjects:v152 forKeys:v26];
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  uint64_t v29 = [v15 countByEnumeratingWithState:&v183 objects:v195 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v184;
    uint64_t v32 = -1;
LABEL_17:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v184 != v31) {
        objc_enumerationMutation(v15);
      }
      uint64_t v34 = (void *)[v28 objectForKeyedSubscript:*(void *)(*((void *)&v183 + 1) + 8 * v33)];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_143;
      }
      uint64_t v35 = [v34 count];
      if (v32 == -1)
      {
        uint64_t v32 = v35;
        if (!v35) {
          goto LABEL_143;
        }
      }
      else if (v32 != v35)
      {
        goto LABEL_143;
      }
      if (v30 == ++v33)
      {
        uint64_t v30 = [v15 countByEnumeratingWithState:&v183 objects:v195 count:16];
        if (v30) {
          goto LABEL_17;
        }
        break;
      }
    }
  }
  id v36 = objc_msgSend(v28, "objectForKeyedSubscript:", objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v179 objects:v193 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v180;
LABEL_29:
    uint64_t v40 = 0;
    while (1)
    {
      if (*(void *)v180 != v39) {
        objc_enumerationMutation(v36);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v38 == ++v40)
      {
        uint64_t v38 = [v36 countByEnumeratingWithState:&v179 objects:v193 count:16];
        if (v38) {
          goto LABEL_29;
        }
        goto LABEL_35;
      }
    }
LABEL_143:

    uint64_t v23 = (uint64_t)v159;
    id v25 = v160;
    id v11 = v145;
    CCCryptorStatus v14 = v146;
    goto LABEL_144;
  }
LABEL_35:
  id v142 = v22;
  v143 = v5;
  v144 = (void *)[MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v41 = [v36 count];
  v148 = (void *)[v36 lastObject];
  v150 = (void *)[MEMORY[0x263EFF9C0] set];
  id v42 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (v41)
  {
    v147 = v36;
    do
    {
      uint64_t v43 = [v36 objectAtIndexedSubscript:--v41];
      [v148 timeIntervalSinceDate:v43];
      if (v44 > 0.0)
      {
        if (v44 >= *(double *)"")
        {
          if (v44 >= 2678400.0)
          {
            if (v44 >= 94867200.0) {
              uint64_t v45 = 4;
            }
            else {
              uint64_t v45 = 12;
            }
          }
          else
          {
            uint64_t v45 = 28;
          }
        }
        else
        {
          uint64_t v45 = 60;
        }
        uint64_t v43 = objc_msgSend(v144, "dateFromComponents:", objc_msgSend(v144, "components:fromDate:", v45, v43));
      }
      long long v46 = (void *)[MEMORY[0x263EFF9A0] dictionary];
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      uint64_t v47 = [v15 countByEnumeratingWithState:&v175 objects:&v191 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v176;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v176 != v49) {
              objc_enumerationMutation(v15);
            }
            uint64_t v51 = *(void *)(*((void *)&v175 + 1) + 8 * i);
            uint64_t v52 = [v15 objectAtIndexedSubscript:0];
            uint64_t v53 = v43;
            if (v51 != v52) {
              uint64_t v53 = objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", v51), "objectAtIndexedSubscript:", v41);
            }
            [v46 setObject:v53 forKeyedSubscript:v51];
          }
          uint64_t v48 = [v15 countByEnumeratingWithState:&v175 objects:&v191 count:16];
        }
        while (v48);
      }
      if (([v150 containsObject:v46] & 1) == 0)
      {
        [v150 addObject:v46];
        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        uint64_t v54 = [v15 countByEnumeratingWithState:&v171 objects:v190 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v172;
          do
          {
            for (uint64_t j = 0; j != v55; ++j)
            {
              if (*(void *)v172 != v56) {
                objc_enumerationMutation(v15);
              }
              uint64_t v58 = *(void *)(*((void *)&v171 + 1) + 8 * j);
              v59 = (void *)[v42 objectForKeyedSubscript:v58];
              if (!v59)
              {
                v59 = (void *)[MEMORY[0x263EFF980] array];
                [v42 setObject:v59 forKeyedSubscript:v58];
              }
              objc_msgSend(v59, "addObject:", objc_msgSend(v46, "objectForKeyedSubscript:", v58));
            }
            uint64_t v55 = [v15 countByEnumeratingWithState:&v171 objects:v190 count:16];
          }
          while (v55);
        }
      }
      id v36 = v147;
    }
    while (v41);
  }
  id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v61 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  uint64_t v62 = [v15 countByEnumeratingWithState:&v167 objects:v189 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v168;
    do
    {
      for (uint64_t k = 0; k != v63; ++k)
      {
        if (*(void *)v168 != v64) {
          objc_enumerationMutation(v15);
        }
        uint64_t v66 = *(void *)(*((void *)&v167 + 1) + 8 * k);
        v67 = (void *)[v42 objectForKeyedSubscript:v66];
        [v60 addObject:v66];
        objc_msgSend(v61, "addObject:", objc_msgSend((id)objc_msgSend(v67, "reverseObjectEnumerator"), "allObjects"));
      }
      uint64_t v63 = [v15 countByEnumeratingWithState:&v167 objects:v189 count:16];
    }
    while (v63);
  }
  v68 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v15];
  uint64_t v69 = [v149 count];
  int v9 = v157;
  id v22 = v142;
  if (v69)
  {
    uint64_t v70 = v69;
    for (uint64_t m = 0; m != v70; ++m)
    {
      uint64_t v72 = [v149 objectAtIndexedSubscript:m];
      if (([v68 containsObject:v72] & 1) == 0)
      {
        [v60 addObject:v72];
        objc_msgSend(v61, "addObject:", objc_msgSend(v152, "objectAtIndexedSubscript:", m));
      }
    }
  }
  id v73 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v73 setObject:v60 forKeyedSubscript:@"keys"];
  [v73 setObject:v61 forKeyedSubscript:@"values"];

  uint64_t v23 = (uint64_t)v159;
  id v25 = v160;
  id v5 = v143;
  id v11 = v145;
  CCCryptorStatus v14 = v146;
  if (v73)
  {
    [v73 setObject:v151 forKey:@"mod_date"];
    goto LABEL_145;
  }
LABEL_144:
  id v73 = (id)[v25 copy];
LABEL_145:

  id v25 = v73;
  CFStringRef v24 = v153;
  if (!v25)
  {
LABEL_84:
    id v25 = (id)[v11 mutableCopy];
    [v25 removeObjectForKey:@"uuid"];
    objc_msgSend(v25, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF910], "date"), @"mod_date");
  }
LABEL_85:
  id v161 = v25;

  memset(v193, 0, sizeof(v193));
  int v194 = 0;
  if (v9) {
    v75 = (void *)v23;
  }
  else {
    v75 = v24;
  }
  unint64_t v192 = 0;
  unint64_t v191 = 0;
  [v14 digestUUIDBytesWithKey:v23 forUUID:v75 uuidBytes:&v191];
  _MDLabelUUIDEncode(v191, v192, (uint64_t)v193);
  v76 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s%s", "com.apple.metadata:kMDLabel_", v193);
  void *v5 = v76;
  [v76 UTF8String];
  id v77 = objc_alloc(MEMORY[0x263EFF980]);
  v78 = objc_msgSend(v77, "initWithCapacity:", objc_msgSend(v166, "count"));
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v79 = v166;
  uint64_t v80 = [v166 countByEnumeratingWithState:&v162 objects:v187 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v163;
    do
    {
      for (uint64_t n = 0; n != v81; ++n)
      {
        if (*(void *)v163 != v82) {
          objc_enumerationMutation(v79);
        }
        v84 = *(void **)(*((void *)&v162 + 1) + 8 * n);
        if ([v84 hasPrefix:@"com.apple.metadata:kMDLabel_"])
        {
          id v85 = v84;
LABEL_97:
          v90 = v85;
          goto LABEL_99;
        }
        if ([v84 hasPrefix:@"com.apple.metadata"])
        {
          v86 = v78;
          v87 = v5;
          id v88 = [NSString alloc];
          uint64_t v141 = [v84 substringFromIndex:19];
          v89 = v88;
          id v5 = v87;
          v78 = v86;
          id v85 = (id)[v89 initWithFormat:@"%s%@", "com.apple.metadata:kMDLabel_", v141];
          goto LABEL_97;
        }
        v90 = 0;
LABEL_99:
        if (([v90 isEqual:*v5] & 1) == 0) {
          [v78 addObject:v90];
        }
      }
      uint64_t v81 = [v79 countByEnumeratingWithState:&v162 objects:v187 count:16];
    }
    while (v81);
  }

  v91 = v25;
  if (!objc_msgSend((id)objc_msgSend(v25, "objectForKey:", @"keys"), "count"))
  {
    [v78 addObject:*v5];
    uint64_t v110 = 0;
    v106 = v159;
    goto LABEL_139;
  }
  bzero(v195, 0x2000uLL);
  if (v157) {
    char v92 = -14;
  }
  else {
    char v92 = -15;
  }
  uint64_t v93 = arc4random();
  uint64_t v94 = arc4random();
  uint64_t v95 = v94;
  v189[0] = 0;
  if (v157)
  {
    v96 = (int *)storePrivateMDAttributeData(v25, (uint64_t)v195, 0x2000uLL, v189);
    if (!v96)
    {
      v97 = malloc_type_malloc(0x10000uLL, 0xEB9CD638uLL);
      v96 = (int *)storePrivateMDAttributeData(v25, (uint64_t)v97, 0x10000uLL, v189);
      if (!v96) {
        copyUpdatedData_cold_1(0, v98, v99, v100, v101, v102, v103, v104);
      }
    }
    uint64_t v105 = v189[0];
    v106 = v159;
    if (v189[0]) {
      goto LABEL_111;
    }
LABEL_127:
    if (v96 != (int *)v195) {
      free(v96);
    }
    goto LABEL_133;
  }
  unsigned int v154 = v94;
  char v158 = v92;
  uint64_t v111 = v93;
  v112 = (void *)[v25 objectForKey:@"uuid"];
  v113 = (void *)[v25 objectForKey:@"keys"];
  v114 = (void *)[v25 objectForKey:@"values"];
  uint64_t v115 = [v113 count];
  uint64_t v116 = [v114 count];
  size_t v117 = 24 * v115 + 20;
  if (v117 <= 0x2000)
  {
    v118 = &v196;
    v96 = (int *)v195;
  }
  else
  {
    v96 = (int *)malloc_type_malloc(v117, 0xCB951BACuLL);
    v118 = v96 + 1;
  }
  int *v96 = 1279345228;
  v190[0] = v118;
  UUIDuint64_t Bytes = getUUIDBytes(v112, v190);
  if (!UUIDBytes) {
    copyUpdatedData_cold_2(UUIDBytes, v120, v121, v122, v123, v124, v125, v126);
  }
  if (v115 >= 1)
  {
    for (iuint64_t i = 0; ii != v115; ++ii)
    {
      if (getUUIDBytes((void *)[v113 objectAtIndex:ii], v190))
      {
        double v128 = 0.0;
        if (ii < v116)
        {
          v129 = (const void *)[v114 objectAtIndex:ii];
          CFTypeID v130 = CFGetTypeID(v129);
          if (v130 == CFDateGetTypeID()) {
            double v128 = MEMORY[0x24C5A0930](v129);
          }
        }
        uint64_t v131 = v190[0];
        *(double *)v190[0] = v128;
        v190[0] = v131 + 8;
      }
    }
  }
  uint64_t v105 = v190[0] - (void)v96;
  v189[0] = v190[0] - (void)v96;
  v106 = v159;
  v91 = v161;
  uint64_t v93 = v111;
  char v92 = v158;
  uint64_t v95 = v154;
  if (v190[0] == (void)v96) {
    goto LABEL_127;
  }
LABEL_111:
  id v107 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v108 = v105 + 9;
  if (v96 == (int *)v195) {
    uint64_t v109 = [v107 initWithBytes:v195 length:v108];
  }
  else {
    uint64_t v109 = [v107 initWithBytesNoCopy:v96 length:v108 freeWhenDone:1];
  }
  v132 = (void *)v109;
  v133 = (void *)(*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v155 + 16))(v155, v106, v93, v95, v109, 1);

  if (!v133)
  {
LABEL_133:
    uint64_t v110 = 0;
    goto LABEL_139;
  }
  uint64_t v134 = [v133 length];
  uint64_t v135 = v134 + 9;
  if ((unint64_t)(v134 + 9) <= 0x2000)
  {
    v137 = v197;
    v136 = v195;
  }
  else
  {
    v136 = malloc_type_malloc(v134 + 9, 0x6D1169EFuLL);
    v137 = v136 + 9;
  }
  unsigned char *v136 = v92;
  *(_DWORD *)(v136 + 1) = v93;
  *(_DWORD *)(v136 + 5) = v95;
  memcpy(v137, (const void *)[v133 bytes], objc_msgSend(v133, "length"));
  id v138 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (v136 == v195) {
    uint64_t v139 = [v138 initWithBytes:v195 length:v135];
  }
  else {
    uint64_t v139 = [v138 initWithBytesNoCopy:v136 length:v135 freeWhenDone:1];
  }
  uint64_t v110 = v139;
  v106 = v159;
  v91 = v161;

LABEL_139:
  if ([v78 count]) {
    void *v156 = v78;
  }
  else {

  }
  return v110;
}

id copyUpdatedXattrDictionary(void *a1, void *a2, void *a3, char a4)
{
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v9 = (void *)[a1 objectForKey:@"keys"];
  uint64_t v10 = [a1 objectForKey:@"values"];
  uint64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  uint64_t v12 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  uint64_t v13 = (void *)[a2 mutableCopy];
  CCCryptorStatus v14 = (void *)[a3 mutableCopy];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __copyUpdatedXattrDictionary_block_invoke;
  v17[3] = &unk_26525E8C0;
  v17[4] = v13;
  v17[5] = v14;
  char v18 = a4;
  v17[6] = v10;
  v17[7] = v11;
  v17[8] = v12;
  [v9 enumerateObjectsUsingBlock:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __copyUpdatedXattrDictionary_block_invoke_2;
  v16[3] = &unk_26525E8E8;
  v16[4] = v14;
  v16[5] = v11;
  v16[6] = v12;
  [v13 enumerateObjectsUsingBlock:v16];

  [v8 setObject:v11 forKey:@"keys"];
  [v8 setObject:v12 forKey:@"values"];
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF910], "date"), @"mod_date");
  return v8;
}

uint64_t digestOneInternal(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v9, 0, sizeof(v9));
  int v10 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  [a1 digestUUIDBytesWithKey:a2 forUUID:a3 uuidBytes:&v7];
  _MDLabelUUIDEncode(v7, v8, (uint64_t)v9);
  return [a4 setObject:a2, objc_msgSend(NSString, "stringWithFormat:", @"com.apple.metadata.%s", v9) forKey];
}

uint64_t __copyUpdatedXattrDictionary_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [*(id *)(a1 + 32) indexOfObject:a2];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t result = [*(id *)(a1 + 48) objectAtIndex:a3];
    if (result != *MEMORY[0x263EFFD08])
    {
      uint64_t v8 = result;
      [*(id *)(a1 + 56) addObject:a2];
      int v9 = *(void **)(a1 + 64);
      return [v9 addObject:v8];
    }
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v11 = [*(id *)(a1 + 40) objectAtIndex:v6];
    if (v11 != *MEMORY[0x263EFFD08])
    {
      uint64_t v12 = v11;
      if (*(unsigned char *)(a1 + 72))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [*(id *)(a1 + 48) objectAtIndex:a3];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CCCryptorStatus v14 = (void *)v13;
          }
          else
          {
            v15[0] = v13;
            CCCryptorStatus v14 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
          }
          uint64_t v12 = [v14 arrayByAddingObjectsFromArray:v12];
        }
      }
      [*(id *)(a1 + 56) addObject:a2];
      [*(id *)(a1 + 64) addObject:v12];
    }
    [*(id *)(a1 + 32) removeObjectAtIndex:v10];
    return [*(id *)(a1 + 40) removeObjectAtIndex:v10];
  }
  return result;
}

uint64_t __copyUpdatedXattrDictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  if (result != *MEMORY[0x263EFFD08])
  {
    uint64_t v5 = result;
    [*(id *)(a1 + 40) addObject:a2];
    uint64_t v6 = *(void **)(a1 + 48);
    return [v6 addObject:v5];
  }
  return result;
}

uint64_t __eligbleToThin_block_invoke()
{
  v2[6] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  v2[0] = @"kMDItemUserSharedSentDate";
  v2[1] = @"kMDItemUserSharedReceivedDate";
  v2[2] = @"kMDItemUserPrintedDate";
  v2[3] = @"kMDItemUserDownloadedDate";
  v2[4] = @"kMDItemUserModifiedDate";
  v2[5] = @"kMDItemUserCreatedDate";
  uint64_t result = objc_msgSend(v0, "initWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v2, 6));
  eligbleToThin_sThinnableKeys = result;
  return result;
}

uint64_t storePrivateMDAttributeData(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  if (_init_private_attributes_once != -1) {
    dispatch_once(&_init_private_attributes_once, &__block_literal_global_121);
  }
  unint64_t v7 = (void *)[a1 objectForKey:@"keys"];
  uint64_t v8 = (void *)[a1 objectForKey:@"values"];
  CFStringRef v20 = (const __CFString *)[a1 objectForKey:@"mod_date"];
  uint64_t v9 = [v7 count];
  uint64_t v10 = [v7 count];
  if (v9 >= v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  unint64_t v21 = 0;
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *MEMORY[0x263EFFD08];
    do
    {
      CFStringRef v14 = (const __CFString *)[v7 objectAtIndex:v12];
      uint64_t v15 = sStringTypeId;
      if (v15 == CFGetTypeID(v14))
      {
        uint64_t v16 = [v8 objectAtIndex:v12];
        if (v16 != v13)
        {
          CFStringRef v17 = (const __CFString *)v16;
          if (!serializeCFString(a2, &v21, a3, v14) || !serializeCFType(a2, &v21, a3, v17)) {
            return 0;
          }
        }
      }
    }
    while (v11 != ++v12);
  }
  if (!serializeCFString(a2, &v21, a3, @"mod_date")
    || !serializeCFType(a2, &v21, a3, v20))
  {
    return 0;
  }
  *a4 = v21;
  return a2;
}

void __message_assert(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9[0] = 0;
  v9[1] = &a9;
  vasprintf((char **)v9, "%s:%u: failed assertion '%s' %s ", &a9);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = v9[0];
    _os_log_error_impl(&dword_24954B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  free(v9[0]);
}

uint64_t getUUIDBytes(void *a1, void *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFUUIDGetTypeID())
  {
    CFUUIDBytes v6 = CFUUIDGetUUIDBytes((CFUUIDRef)a1);
    uint64_t v5 = *(void *)&v6.byte0;
    *(CFUUIDBytes *)a2 = v6;
LABEL_5:
    *a2 = v5 + 16;
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 getUUIDBytes:*a2];
    uint64_t v5 = *a2;
    goto LABEL_5;
  }
  return 0;
}

uint64_t serializeCFString(uint64_t a1, unint64_t *a2, unint64_t a3, const __CFString *key)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v4 = *a2;
  if (*a2 >= a3) {
    return 0;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)sStringIDMappings, key);
  if (!Value)
  {
    *(unsigned char *)(a1 + v4) = 1;
    CFIndex Length = CFStringGetLength(key);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    CFIndex v15 = MaximumSizeForEncoding + 1;
    if (MaximumSizeForEncoding < 1024) {
      uint64_t v16 = v24;
    }
    else {
      uint64_t v16 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x8BA2A102uLL);
    }
    unint64_t v17 = v4 + 1;
    bzero(v24, 0x400uLL);
    if (!CFStringGetCString(key, v16, v15, 0x8000100u)) {
      char *v16 = 0;
    }
    size_t v18 = strlen(v16) + 1;
    unint64_t v19 = v18 + v17;
    if (v18 + v17 < a3)
    {
      memcpy((void *)(a1 + v17), v16, v18);
      if (v16 != v24) {
        free(v16);
      }
      *a2 = v19;
      return 1;
    }
    if (v16 != v24) {
      free(v16);
    }
    return 0;
  }
  unint64_t v10 = *a2;
  if (*a2 >= a3) {
    return 0;
  }
  unint64_t v11 = v10 + 1;
  *(unsigned char *)(a1 + v10) = 4;
  if (Value >= 0x80)
  {
    if (Value >= 0x4000)
    {
      uint64_t v20 = 4;
      if (Value >> 28) {
        uint64_t v20 = 5;
      }
      if (Value < 0x200000) {
        uint64_t v20 = 3;
      }
      if (v11 + v20 < a3)
      {
        if (Value >> 21)
        {
          if (Value >> 28)
          {
            *(unsigned char *)(a1 + v11) = -16;
            *(_DWORD *)(v10 + a1 + 2) = Value;
            unint64_t v12 = v10 + 6;
          }
          else
          {
            *(unsigned char *)(a1 + v11) = BYTE3(Value) | 0xE0;
            uint64_t v23 = (unsigned char *)(v10 + a1);
            v23[2] = BYTE2(Value);
            v23[3] = BYTE1(Value);
            unint64_t v12 = v10 + 5;
            v23[4] = (_BYTE)Value;
          }
        }
        else
        {
          *(unsigned char *)(a1 + v11) = BYTE2(Value) | 0xC0;
          uint64_t v21 = v10 + a1;
          *(unsigned char *)(v21 + 2) = BYTE1(Value);
          unint64_t v12 = v10 + 4;
          *(unsigned char *)(v21 + 3) = (_BYTE)Value;
        }
        goto LABEL_32;
      }
    }
    else
    {
      unint64_t v12 = v10 + 3;
      if (v10 + 3 < a3)
      {
        *(unsigned char *)(a1 + v11) = BYTE1(Value) | 0x80;
        *(unsigned char *)(v10 + a1 + 2) = (_BYTE)Value;
        goto LABEL_32;
      }
    }
    return 0;
  }
  unint64_t v12 = v10 + 2;
  if (v10 + 2 >= a3) {
    return 0;
  }
  *(unsigned char *)(a1 + v11) = (_BYTE)Value;
LABEL_32:
  *a2 = v12;
  return 1;
}

uint64_t serializeCFType(uint64_t a1, unint64_t *a2, unint64_t a3, const __CFString *a4)
{
  CFTypeID v8 = CFGetTypeID(a4);
  if (sStringTypeId != v8)
  {
    if (sDateTypeId == v8)
    {
      unint64_t v10 = *a2;
      if (*a2 < a3)
      {
        *(unsigned char *)(a1 + v10) = 5;
        MEMORY[0x24C5A0930](a4);
        unint64_t v12 = v10 + 9;
        if (v10 + 9 < a3)
        {
          *(void *)(v10 + a1 + 1) = v11;
LABEL_9:
          *a2 = v12;
          return 1;
        }
      }
    }
    else if (sArrayTypeId == v8)
    {
      unint64_t v14 = *a2;
      if (*a2 < a3)
      {
        unint64_t v15 = v14 + 1;
        *(unsigned char *)(a1 + v14) = 2;
        *a2 = v14 + 1;
        unsigned int Count = CFArrayGetCount((CFArrayRef)a4);
        if (Count >= 0x80)
        {
          if (Count >= 0x4000)
          {
            uint64_t v29 = 4;
            if (Count >> 28) {
              uint64_t v29 = 5;
            }
            if (Count < 0x200000) {
              uint64_t v29 = 3;
            }
            if (v29 + v15 >= a3) {
              return 0;
            }
            if (Count >> 21)
            {
              if (Count >> 28)
              {
                *(unsigned char *)(a1 + v15) = -16;
                *(_DWORD *)(v14 + a1 + 2) = Count;
                uint64_t v27 = v14 + 6;
              }
              else
              {
                *(unsigned char *)(a1 + v15) = HIBYTE(Count) | 0xE0;
                uint64_t v34 = (unsigned char *)(v14 + a1);
                v34[2] = BYTE2(Count);
                v34[3] = BYTE1(Count);
                uint64_t v27 = v14 + 5;
                v34[4] = Count;
              }
            }
            else
            {
              *(unsigned char *)(a1 + v15) = BYTE2(Count) | 0xC0;
              unint64_t v30 = v14 + a1;
              *(unsigned char *)(v30 + 2) = BYTE1(Count);
              uint64_t v27 = v14 + 4;
              *(unsigned char *)(v30 + 3) = Count;
            }
          }
          else
          {
            uint64_t v27 = v14 + 3;
            if (v14 + 3 >= a3) {
              return 0;
            }
            *(unsigned char *)(a1 + v15) = BYTE1(Count) | 0x80;
            *(unsigned char *)(v14 + a1 + 2) = Count;
          }
          uint64_t valuePtr = v27;
        }
        else
        {
          unint64_t v12 = v14 + 2;
          if (v14 + 2 >= a3) {
            return 0;
          }
          *(unsigned char *)(a1 + v15) = Count;
          uint64_t valuePtr = v14 + 2;
          if (!Count) {
            goto LABEL_9;
          }
        }
        CFIndex v36 = 0;
        uint64_t v37 = Count;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a4, v36);
          if ((serializeCFType(a1, &valuePtr, a3, ValueAtIndex) & 1) == 0) {
            break;
          }
          if (v37 == ++v36)
          {
            unint64_t v12 = valuePtr;
            goto LABEL_9;
          }
        }
      }
    }
    else if (sDataTypeId == v8)
    {
      unint64_t v17 = *a2;
      if (*a2 < a3)
      {
        unint64_t Length = CFDataGetLength((CFDataRef)a4);
        size_t v19 = Length;
        if (Length >= 0x80)
        {
          if (Length >= 0x4000)
          {
            if (Length >= 0x200000)
            {
              if (Length >> 28)
              {
                unint64_t v39 = Length >> 35;
                unint64_t v40 = Length >> 42;
                uint64_t v41 = 7;
                unint64_t v42 = Length >> 49;
                uint64_t v43 = 8;
                if (HIBYTE(Length)) {
                  uint64_t v43 = 9;
                }
                if (v42) {
                  uint64_t v41 = v43;
                }
                if (!v40) {
                  uint64_t v41 = 6;
                }
                if (!v39) {
                  uint64_t v41 = 5;
                }
                unint64_t v44 = v17 + 1;
                if (Length + v41 + v17 + 1 >= a3) {
                  return 0;
                }
                *(unsigned char *)(a1 + v17) = 6;
                if (v39)
                {
                  if (v40)
                  {
                    if (v42)
                    {
                      unint64_t v53 = v17 + 2;
                      if (HIBYTE(Length))
                      {
                        *(unsigned char *)(a1 + v44) = -1;
                        *(void *)(a1 + v53) = Length;
                        unint64_t v20 = v17 + 10;
                      }
                      else
                      {
                        *(unsigned char *)(a1 + v44) = -2;
                        uint64x2_t v54 = (uint64x2_t)vdupq_n_s64(Length);
                        int16x8_t v55 = (int16x8_t)vshlq_u64(v54, (uint64x2_t)xmmword_249556090);
                        *(int32x2_t *)v54.i8 = vmovn_s64((int64x2_t)vshlq_u64(v54, (uint64x2_t)xmmword_2495560A0));
                        *(int32x2_t *)v55.i8 = vmovn_s64((int64x2_t)v55);
                        v55.i16[1] = v55.i16[2];
                        v55.i16[2] = v54.i16[0];
                        v55.i16[3] = v54.i16[2];
                        *(_DWORD *)(a1 + v53) = vmovn_s16(v55).u32[0];
                        uint64_t v56 = (unsigned char *)(v17 + a1);
                        v56[6] = BYTE2(Length);
                        v56[7] = BYTE1(Length);
                        unint64_t v20 = v17 + 9;
                        v56[8] = Length;
                      }
                    }
                    else
                    {
                      *(unsigned char *)(a1 + v44) = BYTE6(Length) | 0xFC;
                      uint64x2_t v49 = (uint64x2_t)vdupq_n_s64(Length);
                      int32x2_t v50 = vmovn_s64((int64x2_t)vshlq_u64(v49, (uint64x2_t)xmmword_2495560C0));
                      int16x8_t v51 = (int16x8_t)vshlq_u64(v49, (uint64x2_t)xmmword_2495560B0);
                      *(int32x2_t *)v51.i8 = vmovn_s64((int64x2_t)v51);
                      v51.i16[1] = v51.i16[2];
                      v51.i16[2] = v50.i16[0];
                      v51.i16[3] = v50.i16[2];
                      unint64_t v52 = v17 + a1;
                      *(_DWORD *)(v52 + 2) = vmovn_s16(v51).u32[0];
                      *(unsigned char *)(v52 + 6) = BYTE1(Length);
                      unint64_t v20 = v17 + 8;
                      *(unsigned char *)(v52 + 7) = Length;
                    }
                  }
                  else
                  {
                    *(unsigned char *)(a1 + v44) = BYTE5(Length) | 0xF8;
                    uint64x2_t v46 = (uint64x2_t)vdupq_n_s64(Length);
                    int16x8_t v47 = (int16x8_t)vshlq_u64(v46, (uint64x2_t)xmmword_2495560A0);
                    unint64_t v48 = v17 + a1;
                    *(int32x2_t *)v46.i8 = vmovn_s64((int64x2_t)vshlq_u64(v46, (uint64x2_t)xmmword_2495560D0));
                    *(int32x2_t *)v47.i8 = vmovn_s64((int64x2_t)v47);
                    v47.i16[1] = v47.i16[2];
                    v47.i16[2] = v46.i16[0];
                    v47.i16[3] = v46.i16[2];
                    *(_DWORD *)(v48 + 2) = vmovn_s16(v47).u32[0];
                    unint64_t v20 = v17 + 7;
                    *(unsigned char *)(v48 + 6) = Length;
                  }
                }
                else
                {
                  *(unsigned char *)(a1 + v44) = BYTE4(Length) | 0xF0;
                  uint64_t v45 = (unsigned char *)(v17 + a1);
                  v45[2] = BYTE3(Length);
                  v45[3] = BYTE2(Length);
                  v45[4] = BYTE1(Length);
                  unint64_t v20 = v17 + 6;
                  v45[5] = Length;
                }
              }
              else
              {
                if (Length + v17 + 1 + 4 >= a3) {
                  return 0;
                }
                uint64_t v35 = (unsigned char *)(a1 + v17);
                *uint64_t v35 = 6;
                *(unsigned char *)(a1 + v17 + 1) = BYTE3(Length) | 0xE0;
                v35[2] = BYTE2(Length);
                v35[3] = BYTE1(Length);
                unint64_t v20 = v17 + 5;
                v35[4] = Length;
              }
            }
            else
            {
              unint64_t v20 = v17 + 4;
              if (v17 + 4 + Length >= a3) {
                return 0;
              }
              uint64_t v31 = (unsigned char *)(a1 + v17);
              unsigned char *v31 = 6;
              v31[1] = BYTE2(Length) | 0xC0;
              v31[2] = BYTE1(Length);
              v31[3] = Length;
            }
          }
          else
          {
            unint64_t v20 = v17 + 3;
            if (v17 + 3 + Length >= a3) {
              return 0;
            }
            v28 = (unsigned char *)(a1 + v17);
            unsigned char *v28 = 6;
            v28[1] = BYTE1(Length) | 0x80;
            v28[2] = Length;
          }
        }
        else
        {
          unint64_t v20 = v17 + 2;
          if (Length + v17 + 2 >= a3) {
            return 0;
          }
          uint64_t v21 = (unsigned char *)(a1 + v17);
          unsigned char *v21 = 6;
          v21[1] = Length;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)a4);
        memcpy((void *)(a1 + v20), BytePtr, v19);
        unint64_t v12 = v20 + v19;
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v22 = *a2;
      if (sNumberTypeId == v8)
      {
        BOOL v13 = v22 + 10 < a3;
        if (v22 + 10 < a3)
        {
          int IsFloatType = CFNumberIsFloatType((CFNumberRef)a4);
          char v24 = IsFloatType;
          if (IsFloatType)
          {
            uint64_t valuePtr = 0x7FF8000000000000;
            CFNumberRef v25 = (const __CFNumber *)a4;
            CFNumberType v26 = kCFNumberFloat64Type;
          }
          else
          {
            uint64_t valuePtr = 0;
            CFNumberRef v25 = (const __CFNumber *)a4;
            CFNumberType v26 = kCFNumberSInt64Type;
          }
          CFNumberGetValue(v25, v26, &valuePtr);
          uint64_t v32 = valuePtr;
          unint64_t v33 = a1 + v22;
          *(unsigned char *)unint64_t v33 = 7;
          *(unsigned char *)(v33 + 1) = v24;
          *(void *)(v33 + 2) = v32;
          *a2 = v22 + 10;
        }
        return v13;
      }
      if (v22 < a3)
      {
        unint64_t v12 = v22 + 1;
        *(unsigned char *)(a1 + v22) = 3;
        goto LABEL_9;
      }
    }
    return 0;
  }
  return serializeCFString(a1, a2, a3, a4);
}

CFTypeID ___init_private_attributes_block_invoke()
{
  sStringTypeId = CFStringGetTypeID();
  sDateTypeId = CFDateGetTypeID();
  sArrayTypeId = CFArrayGetTypeID();
  CFNullGetTypeID();
  sNumberTypeId = CFNumberGetTypeID();
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  sStringIDMappings = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], 0);
  sIDStringMappings = (uint64_t)CFDictionaryCreateMutable(v0, 0, 0, MEMORY[0x263EFFF90]);
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, @"kMDItemOriginApplicationIdentifier", (const void *)1);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)1, @"kMDItemOriginApplicationIdentifier");
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, @"kMDItemOriginSenderHandle", (const void *)2);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)2, @"kMDItemOriginSenderHandle");
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, @"kMDItemOriginSenderDisplayName", (const void *)3);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)3, @"kMDItemOriginSenderDisplayName");
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, @"kMDItemOriginSubject", (const void *)4);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)4, @"kMDItemOriginSubject");
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, @"kMDItemDestinationRecipients", (const void *)5);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)5, @"kMDItemDestinationRecipients");
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, @"kMDItemOriginMessageID", (const void *)6);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)6, @"kMDItemOriginMessageID");
  CFTypeID result = CFDataGetTypeID();
  sDataTypeId = result;
  return result;
}

uint64_t copyDecryptedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFTypeID v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a4 + 9 length:a5 - 9 freeWhenDone:0];
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void, void, void *, void))(a1 + 16))(a1, a3, *(unsigned int *)(a2 + 1), *(unsigned int *)(a2 + 5), v8, 0);

  return v9;
}

__CFArray *copyCFTypeFromBuffer(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v4 = *a2;
  unint64_t v33 = v4;
  if (v4 >= a3)
  {
LABEL_67:
    Mutable = 0;
  }
  else
  {
    unint64_t v6 = v4 + 1;
    unint64_t v33 = v4 + 1;
    switch(*(unsigned char *)(a1 + v4))
    {
      case 1:
        CFTypeID v8 = (const char *)(a1 + v6);
        if (v6 <= a3) {
          uint64_t v9 = a3;
        }
        else {
          uint64_t v9 = v4 + 1;
        }
        break;
      case 2:
        if (v6 >= a3) {
          goto LABEL_67;
        }
        if (*(char *)(a1 + v6) < 0)
        {
          unsigned int v23 = *(unsigned __int8 *)(a1 + v6);
          if (v23 >= 0xC0)
          {
            if (v23 >= 0xE0)
            {
              BOOL v25 = v23 >= 0xF0;
              uint64_t v13 = 4;
              if (v25) {
                uint64_t v13 = 5;
              }
            }
            else
            {
              uint64_t v13 = 3;
            }
          }
          else
          {
            uint64_t v13 = 2;
          }
        }
        else
        {
          uint64_t v13 = 1;
        }
        if (v13 + v6 >= a3) {
          goto LABEL_67;
        }
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
        int VInt32 = v2_readVInt32(a1, (uint64_t *)&v33);
        if (VInt32)
        {
          int v27 = VInt32;
          do
          {
            v28 = (const void *)copyCFTypeFromBuffer(a1, &v33, a3);
            if (v28)
            {
              uint64_t v29 = v28;
              CFArrayAppendValue(Mutable, v28);
              CFRelease(v29);
            }
            --v27;
          }
          while (v27);
        }
        goto LABEL_68;
      case 3:
        goto LABEL_52;
      case 4:
        uint64_t v14 = v4 + 2;
        int v15 = *(char *)(a1 + v6);
        unsigned int v16 = *(unsigned __int8 *)(a1 + v6);
        if (v15 < 0)
        {
          if (v16 > 0xBF)
          {
            if (v16 > 0xDF)
            {
              if (v16 > 0xEF)
              {
                unsigned int v16 = *(_DWORD *)(a1 + v14);
                uint64_t v14 = v4 + 6;
              }
              else
              {
                unsigned int v16 = ((v16 & 0xF) << 24) | (*(unsigned __int8 *)(a1 + v14) << 16) | (*(unsigned __int8 *)(v4 + a1 + 3) << 8) | *(unsigned __int8 *)(v4 + a1 + 4);
                uint64_t v14 = v4 + 5;
              }
            }
            else
            {
              unsigned int v16 = ((v16 & 0x1F) << 16) | (*(unsigned __int8 *)(a1 + v14) << 8) | *(unsigned __int8 *)(v4 + a1 + 3);
              uint64_t v14 = v4 + 4;
            }
          }
          else
          {
            int v17 = *(unsigned __int8 *)(a1 + v14) | ((v16 & 0x3F) << 8);
            uint64_t v14 = v4 + 3;
            unsigned int v16 = v17;
          }
        }
        unint64_t v33 = v14;
        Mutable = (__CFArray *)CFDictionaryGetValue((CFDictionaryRef)sIDStringMappings, (const void *)v16);
        if (Mutable) {
          goto LABEL_68;
        }
LABEL_52:
        unint64_t v12 = (__CFArray *)CFRetain((CFTypeRef)*MEMORY[0x263EFFD08]);
        goto LABEL_53;
      case 5:
        uint64_t v18 = v4 + 9;
        if (v4 + 9 <= a3)
        {
          CFDateRef v22 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFAbsoluteTime *)(a1 + v6));
LABEL_27:
          Mutable = v22;
        }
        else
        {
          Mutable = 0;
        }
        unint64_t v33 = v18;
        goto LABEL_68;
      case 6:
        if (v6 >= a3) {
          goto LABEL_67;
        }
        if (*(char *)(a1 + v6) < 0)
        {
          unsigned int v24 = *(unsigned __int8 *)(a1 + v6);
          if (v24 >= 0xC0)
          {
            if (v24 >= 0xE0)
            {
              if (v24 >= 0xF0)
              {
                if (v24 >= 0xF8)
                {
                  if (v24 >= 0xFC)
                  {
                    if (v24 >= 0xFE)
                    {
                      BOOL v30 = v24 == 255;
                      uint64_t v20 = 8;
                      if (v30) {
                        uint64_t v20 = 9;
                      }
                    }
                    else
                    {
                      uint64_t v20 = 7;
                    }
                  }
                  else
                  {
                    uint64_t v20 = 6;
                  }
                }
                else
                {
                  uint64_t v20 = 5;
                }
              }
              else
              {
                uint64_t v20 = 4;
              }
            }
            else
            {
              uint64_t v20 = 3;
            }
          }
          else
          {
            uint64_t v20 = 2;
          }
        }
        else
        {
          uint64_t v20 = 1;
        }
        if (v20 + v6 >= a3) {
          goto LABEL_67;
        }
        CFIndex VInt64 = v2_readVInt64(a1, (uint64_t *)&v33);
        uint64_t v18 = v33 + VInt64;
        if (v33 + VInt64 >= a3) {
          goto LABEL_67;
        }
        CFDateRef v22 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)(a1 + v33), VInt64);
        goto LABEL_27;
      case 7:
        uint64_t v18 = v4 + 10;
        if (v4 + 10 >= a3) {
          goto LABEL_67;
        }
        if (*(unsigned char *)(a1 + v6)) {
          CFNumberType v21 = kCFNumberFloat64Type;
        }
        else {
          CFNumberType v21 = kCFNumberSInt64Type;
        }
        CFDateRef v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v21, (const void *)(v4 + a1 + 2));
        goto LABEL_27;
      default:
        goto LABEL_67;
    }
    do
    {
      if (v9 == v6)
      {
        Mutable = 0;
        unint64_t v33 = v9;
        goto LABEL_68;
      }
      uint64_t v10 = v6 + 1;
    }
    while (*(unsigned __int8 *)(a1 + v6++));
    unint64_t v33 = v10;
    unint64_t v12 = (__CFArray *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, 0x8000100u);
LABEL_53:
    Mutable = v12;
  }
LABEL_68:
  *a2 = v33;
  return Mutable;
}

uint64_t v2_readVInt32(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a2 + 1;
  int v5 = *(char *)(a1 + *a2);
  uint64_t result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (result > 0xBF)
    {
      if (result > 0xDF)
      {
        if (result > 0xEF)
        {
          uint64_t result = *(unsigned int *)(a1 + v4);
          uint64_t v4 = v3 + 5;
        }
        else
        {
          uint64_t result = ((result & 0xF) << 24) | (*(unsigned __int8 *)(a1 + v4) << 16) | (*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          uint64_t v4 = v3 + 4;
        }
      }
      else
      {
        uint64_t result = ((result & 0x1F) << 16) | (*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        uint64_t v4 = v3 + 3;
      }
    }
    else
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      uint64_t v4 = v3 + 2;
      uint64_t result = v7;
    }
  }
  *a2 = v4;
  return result;
}

unint64_t v2_readVInt64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a2 + 1;
  int v5 = *(char *)(a1 + *a2);
  unint64_t result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (v5 > 0xBFu)
    {
      if (v5 > 0xDFu)
      {
        if (v5 > 0xEFu)
        {
          if (v5 > 0xF7u)
          {
            if (v5 > 0xFBu)
            {
              if (v5 > 0xFDu)
              {
                if (v5 == 255)
                {
                  unint64_t result = *(void *)(a1 + v4);
                  uint64_t v4 = v3 + 9;
                }
                else
                {
                  unint64_t v9 = (unint64_t)*(unsigned __int8 *)(a1 + v4) << 48;
                  uint64_t v10 = (unsigned __int8 *)(v3 + a1);
                  unint64_t result = v9 | ((unint64_t)v10[2] << 40) | ((unint64_t)v10[3] << 32) | ((unint64_t)v10[4] << 24) | ((unint64_t)v10[5] << 16) | ((unint64_t)v10[6] << 8) | v10[7];
                  uint64_t v4 = v3 + 8;
                }
              }
              else
              {
                unint64_t v7 = ((result & 1) << 48) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 40);
                CFTypeID v8 = (unsigned __int8 *)(v3 + a1);
                unint64_t result = v7 | ((unint64_t)v8[2] << 32) | ((unint64_t)v8[3] << 24) | ((unint64_t)v8[4] << 16) | ((unint64_t)v8[5] << 8) | v8[6];
                uint64_t v4 = v3 + 7;
              }
            }
            else
            {
              unint64_t result = ((result & 3) << 40) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 32) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 4) << 8) | *(unsigned __int8 *)(v3 + a1 + 5);
              uint64_t v4 = v3 + 6;
            }
          }
          else
          {
            unint64_t result = ((result & 7) << 32) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 8) | *(unsigned __int8 *)(v3 + a1 + 4);
            uint64_t v4 = v3 + 5;
          }
        }
        else
        {
          unint64_t result = ((result & 0xF) << 24) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          uint64_t v4 = v3 + 4;
        }
      }
      else
      {
        unint64_t result = ((result & 0x1F) << 16) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        uint64_t v4 = v3 + 3;
      }
    }
    else
    {
      unint64_t result = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      uint64_t v4 = v3 + 2;
    }
  }
  *a2 = v4;
  return result;
}

void OUTLINED_FUNCTION_0_0()
{
  MEMORY[0xBAD] = -559038737;
  abort();
}

void copyConnection_cold_1()
{
  __assert_rtn("copyConnection", "CSExattrCrypto.m", 34, "sConnectionRetainCount==0");
}

void releaseConnection_cold_1()
{
}

void releaseConnection_cold_2()
{
}

void releaseConnection_cold_3()
{
  __assert_rtn("releaseConnection", "CSExattrCrypto.m", 51, "connection == sConnectionToService");
}

void _copyCryptedDataWithKey_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_24954B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "_copyCryptedDataWithKey() failed. CCCrypt() returned %d.", (uint8_t *)v1, 8u);
}

void copyUpdatedData_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void copyUpdatedData_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
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

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4B20](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x270EE4BD0]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x270EE5240](*(void *)&encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x270EE54A0]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t MDPropertyCopyDecodedValue()
{
  return MEMORY[0x270F4A6C8]();
}

void NSLog(NSString *format, ...)
{
}

CFStringRef SecCreateSharedWebCredentialPassword(void)
{
  return (CFStringRef)MEMORY[0x270EFD900]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _MDPlistContainerAddCString()
{
  return MEMORY[0x270F4A708]();
}

uint64_t _MDPlistContainerAddObject()
{
  return MEMORY[0x270F4A710]();
}

uint64_t _MDPlistContainerBeginArray()
{
  return MEMORY[0x270F4A718]();
}

uint64_t _MDPlistContainerBeginContainer()
{
  return MEMORY[0x270F4A720]();
}

uint64_t _MDPlistContainerBeginDictionary()
{
  return MEMORY[0x270F4A728]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x270F4A730]();
}

uint64_t _MDPlistContainerCreateMutable()
{
  return MEMORY[0x270F4A740]();
}

uint64_t _MDPlistContainerEndArray()
{
  return MEMORY[0x270F4A758]();
}

uint64_t _MDPlistContainerEndContainer()
{
  return MEMORY[0x270F4A760]();
}

uint64_t _MDPlistContainerEndDictionary()
{
  return MEMORY[0x270F4A768]();
}

uint64_t _MDPlistContainerGetBytes()
{
  return MEMORY[0x270F4A770]();
}

uint64_t _MDPlistContainerGetLength()
{
  return MEMORY[0x270F4A778]();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return MEMORY[0x270F4A798]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x270F4A7A8]();
}

uint64_t _MDPlistGetRootPlistObjectFromBytes()
{
  return MEMORY[0x270F4A7B0]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9970](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270ED9990](*(void *)&fd, namebuff, size, *(void *)&options);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x270ED9A60](*(void *)&fd, name, *(void *)&options);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9AE0](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x270EDBD80](xarray, index);
}

uint64_t xpc_create_with_format()
{
  return MEMORY[0x270EDBF80]();
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x270EDC460](xuuid);
}