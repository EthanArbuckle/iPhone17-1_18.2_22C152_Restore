void sub_1A3555A5C()
{
  CFBooleanRef v0;
  CFBooleanRef v1;
  CFTypeID v2;
  uint64_t vars8;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) == 1) {
      byte_1EB272AA0 = 1;
    }
    CFRelease(v1);
  }
}

void sub_1A3555AE0()
{
  [@"/" length];
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v5 = [@"/" stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/"];
  v1 = [@"/" stringByAppendingPathComponent:@"System/Library/Frameworks/"];
  v2 = [@"/" stringByAppendingPathComponent:@"AppleInternal/Library/Frameworks/"];
  uint64_t v3 = objc_msgSend(v0, "initWithObjects:", v5, v1, v2, 0);
  v4 = (void *)qword_1EB272AC0;
  qword_1EB272AC0 = v3;
}

void sub_1A3555C64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3555D14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CUTIsInternalInstall()
{
  if (qword_1EB272AA8 != -1) {
    dispatch_once(&qword_1EB272AA8, &unk_1EF6C4220);
  }
  return byte_1EB272AA0;
}

id CUTProcessNameForPid(int a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v4[2] = v1;
  v4[3] = v1;
  v4[0] = v1;
  v4[1] = v1;
  if (proc_name(a1, v4, 0x40u) < 1) {
    v2 = 0;
  }
  else {
    v2 = (void *)[[NSString alloc] initWithUTF8String:v4];
  }
  return v2;
}

id CUTWeakLinkClass(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = a2;
  if (!sub_1A35561F8(v4))
  {
    uint64_t v5 = +[CUTLog weakLink];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      v9 = v3;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1A3554000, v5, OS_LOG_TYPE_DEFAULT, "Could not load class {class: %{public}@, framework: %{public}@}", (uint8_t *)&v8, 0x16u);
    }
  }
  v6 = NSClassFromString(v3);

  return v6;
}

void *CUTWeakLinkSymbol(const char *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sub_1A35561F8(v3);
  if (v4)
  {
    uint64_t v5 = dlsym(v4, a1);
  }
  else
  {
    v6 = +[CUTLog weakLink];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      v9 = a1;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_1A3554000, v6, OS_LOG_TYPE_DEFAULT, "Could not load symbol {symbol: %{public}s, framework: %{public}@}", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

void *sub_1A35561F8(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB272AB0);
  unint64_t v2 = 0x1EB272000uLL;
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_1EB272AB8;
  if (!qword_1EB272AB8)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    qword_1EB272AB8 = (uint64_t)Mutable;
  }
  Value = (void *)CFDictionaryGetValue(Mutable, v1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB272AB0);
  if (!Value)
  {
    id v5 = v1;
    if (qword_1EB272AC8 != -1) {
      dispatch_once(&qword_1EB272AC8, &unk_1EF6C4200);
    }
    if ([v5 rangeOfString:@".framework"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v5 rangeOfString:@".dylib"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v24 = v1;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v6 = (id)qword_1EB272AC0;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v26 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) stringByAppendingPathComponent:v5];
              uint64_t v12 = [v11 stringByAppendingPathExtension:@"framework"];

              v13 = [MEMORY[0x1E4F28CB8] defaultManager];
              char v14 = [v13 fileExistsAtPath:v12];

              if (v14)
              {
                v18 = sub_1A3556598(v12);

                id v1 = v24;
                unint64_t v2 = 0x1EB272000;
                goto LABEL_22;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }

        v15 = +[CUTLog weakLink];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v30 = v5;
          _os_log_impl(&dword_1A3554000, v15, OS_LOG_TYPE_DEFAULT, "Could not find binary path for framework name: %{public}@", buf, 0xCu);
        }

        id v16 = 0;
        id v1 = v24;
        goto LABEL_27;
      }
      id v17 = v5;
    }
    else
    {
      sub_1A3556598(v5);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
LABEL_22:

    if (v18)
    {
      id v16 = v18;
      v19 = dlopen((const char *)[v16 UTF8String], 1);
      if (v19)
      {
        Value = v19;
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB272AB0);
        v20 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 2744), v5);
        if (v20)
        {
          v21 = v20;
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB272AB0);
          dlclose(Value);
          Value = v21;
        }
        else
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v2 + 2744), v5, Value);
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB272AB0);
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      id v16 = 0;
    }
LABEL_27:
    v22 = +[CUTLog weakLink];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v31 = 138543362;
      id v32 = v16;
      _os_log_impl(&dword_1A3554000, v22, OS_LOG_TYPE_DEFAULT, "Could not load framework binary: %{public}@", v31, 0xCu);
    }

    Value = 0;
    goto LABEL_30;
  }
LABEL_31:

  return Value;
}

id sub_1A3556598(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 lastPathComponent];
  id v3 = [v2 stringByDeletingPathExtension];

  id v4 = [v1 stringByAppendingPathComponent:@"Versions"];
  id v5 = [v4 stringByAppendingPathComponent:@"A"];

  id v6 = [v5 stringByAppendingPathComponent:v3];

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    id v9 = v6;
  }
  else
  {
    id v9 = [v1 stringByAppendingPathComponent:v3];
  }
  __int16 v10 = v9;

  return v10;
}

void sub_1A35569A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_1A35569C8(uint64_t a1, uint64_t a2)
{
}

void sub_1A35569D4(uint64_t a1)
{
}

void sub_1A35569DC(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x1A6249B10]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) pendingDispatchBlocks];
    id v5 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    [v4 removeObject:v5];
  }
  id v6 = [*(id *)(a1 + 32) pendingDispatchBlocks];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  __int16 v10 = [*(id *)(a1 + 32) originalBlock];
  v10[2](v10, *(void *)(a1 + 40));
}

void sub_1A3556F18(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[CUTLog utilities];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1A3554000, v4, OS_LOG_TYPE_INFO, "Reduce -- Finished {result: %{public}@}", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _completeWithResult:v3];
}

void sub_1A3557394(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [[CUTResult alloc] initWithError:v3];

  (*(void (**)(uint64_t, CUTResult *))(v2 + 16))(v2, v4);
}

void sub_1A3557414(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [[CUTResult alloc] initWithSuccess:v3];

  (*(void (**)(uint64_t, CUTResult *))(v2 + 16))(v2, v4);
}

void sub_1A3557494(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = a2;
  uint64_t v7 = [[CUTResult alloc] initWithSuccess:v6];

  [v3 _reduceWithPending:v4 visited:v5 currentResult:v7 completion:a1[7]];
}

uint64_t CUTGetMainBundle()
{
  return MEMORY[0x1F4181798](MEMORY[0x1E4F28B50], sel_mainBundle);
}

__CFBundle *CUTGetMainBundleIdentifier()
{
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFBundleGetIdentifier(MainBundle);
    MainBundle = (__CFBundle *)objc_claimAutoreleasedReturnValue();
  }
  return MainBundle;
}

id CUTTemporaryPath()
{
  id v0 = NSTemporaryDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"CUT"];

  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v3 = [v2 fileExistsAtPath:v1];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v4 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v1;
}

BOOL CUTAuditTokenTaskHasEntitlement(_OWORD *a1, void *a2)
{
  char v3 = a2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = a1[1];
  *(_OWORD *)cf.val = *a1;
  *(_OWORD *)&cf.val[4] = v5;
  id v6 = SecTaskCreateWithAuditToken(v4, &cf);
  if (v6)
  {
    uint64_t v7 = v6;
    *(void *)cf.val = 0;
    CFBooleanRef v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, v3, (CFErrorRef *)&cf);
    if (v8)
    {
      CFBooleanRef v9 = v8;
      CFTypeID v10 = CFGetTypeID(v8);
      BOOL v11 = v10 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
      CFRelease(v9);
    }
    else
    {
      BOOL v11 = 0;
    }
    if (*(void *)cf.val)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        sub_1A35649C4((uint64_t *)&cf);
      }
      if (*(void *)cf.val) {
        CFRelease(*(CFTypeRef *)cf.val);
      }
    }
    CFRelease(v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      sub_1A356497C();
    }
    BOOL v11 = 0;
  }

  return v11;
}

void CUTMapObjectProperties(void *a1, char a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v19 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5)
  {
    id v6 = (objc_class *)v5;
    do
    {
      if (v6 == (objc_class *)objc_opt_class()) {
        break;
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v21 = sub_1A3557E98;
      v22 = &unk_1E5AFEB98;
      char v26 = a2;
      long long v25 = v6;
      id v23 = v4;
      id v24 = v19;
      uint64_t v7 = v20;
      unsigned int outCount = 0;
      CFBooleanRef v8 = class_copyPropertyList(v6, &outCount);
      if (v8)
      {
        CFBooleanRef v9 = v8;
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            BOOL v11 = v9[i];
            Name = property_getName(v11);
            v13 = property_copyAttributeValue(v11, "V");
            char v14 = property_copyAttributeValue(v11, "T");
            v15 = [NSString stringWithCString:Name encoding:4];
            if (v15)
            {
              if (v13)
              {
                if (v14)
                {
                  v21((uint64_t)v7, v15, v13, v14);
                  free(v14);
                }
                else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v29 = v6;
                  __int16 v30 = 1024;
                  int v31 = i;
                  _os_log_error_impl(&dword_1A3554000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ObjectPropertyEnumeration failed -- failed to get ivar type {checkpoint: %@, index: %u}", buf, 0x12u);
                }
                free(v13);
                goto LABEL_19;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v29 = v6;
                __int16 v30 = 1024;
                int v31 = i;
                id v16 = MEMORY[0x1E4F14500];
                id v17 = "ObjectPropertyEnumeration failed -- failed to get ivar name {checkpoint: %@, index: %u}";
                goto LABEL_15;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v6;
              __int16 v30 = 1024;
              int v31 = i;
              id v16 = MEMORY[0x1E4F14500];
              id v17 = "ObjectPropertyEnumeration failed -- failed to get property name {checkpoint: %@, index: %u}";
LABEL_15:
              _os_log_error_impl(&dword_1A3554000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x12u);
            }
LABEL_19:
          }
        }
        free(v9);
      }

      id v6 = (objc_class *)[(objc_class *)v6 superclass];
    }
    while (v6);
  }
}

void sub_1A3557E98(uint64_t a1, void *a2, const char *a3, unsigned char *a4)
{
  id v7 = a2;
  id v12 = v7;
  if (*(unsigned char *)(a1 + 56) && *a4 == 64)
  {
    InstanceVariable = class_getInstanceVariable(*(Class *)(a1 + 48), a3);
    uint64_t v9 = object_getIvar(*(id *)(a1 + 32), InstanceVariable);
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) valueForKey:v7];
  }
  CFTypeID v10 = (void *)v9;
  BOOL v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v11 != v10) {
    [*(id *)(a1 + 32) setValue:v11 forKey:v12];
  }
}

__CFString *sub_1A3557F74()
{
  CFUUIDRef v0 = CFUUIDCreate(0);
  id v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

id sub_1A3557FCC(void *a1)
{
  id v1 = [a1 stringByExpandingTildeInPath];
  uint64_t v2 = [v1 stringByStandardizingPath];

  char v3 = [v2 stringByResolvingSymlinksInPath];

  id v4 = v3;
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
  id v6 = v4;
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F1CB10] URLByResolvingAliasFileAtURL:v5 options:0 error:0];
    CFBooleanRef v8 = v7;
    id v6 = v4;
    if (v7)
    {
      id v6 = [v7 path];
    }
  }

  return v6;
}

id sub_1A35580A4(void *a1)
{
  uint64_t v2 = (void *)[a1 count];
  if (v2)
  {
    uint64_t v2 = [a1 objectAtIndex:0];
  }
  return v2;
}

uint64_t sub_1A35580EC(uint64_t a1, uint64_t a2, void *a3)
{
  char v3 = [a3 cutStringByResolvingAndStandardizingPath];
  id v4 = [v3 pathComponents];
  if (![v3 hasPrefix:@"/Volumes"]) {
    goto LABEL_4;
  }
  if ((unint64_t)[v4 count] < 3) {
    goto LABEL_4;
  }
  uint64_t v5 = [v4 objectAtIndex:2];
  id v6 = [@"/Volumes" stringByAppendingPathComponent:v5];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (!v8) {
    uint64_t v9 = 1;
  }
  else {
LABEL_4:
  }
    uint64_t v9 = 0;

  return v9;
}

id sub_1A35581CC(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  CFTypeID v10 = [a3 lastPathComponent];
  BOOL v11 = [v8 stringByAppendingPathComponent:v10];
  id v12 = [v11 cutStringByResolvingAndStandardizingPath];

  if ([a1 _cutIsPathOnMissingVolume:v12])
  {
    id v13 = 0;
  }
  else
  {
    char v14 = 0;
    uint64_t v15 = 0;
    while (1)
    {
      id v16 = v14;
      char v14 = sub_1A3558340(v12, v15, v9);

      id v23 = 0;
      char v17 = [a1 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v23];
      id v18 = v23;
      id v19 = v18;
      int v20 = 0;
      if ((v17 & 1) == 0 && v18) {
        int v20 = [a1 fileExistsAtPath:v14];
      }
      int v21 = v19 ? v20 : 1;

      id v13 = 0;
      if (v21 != 1 || v15 == 99) {
        break;
      }
      uint64_t v15 = (v15 + 1);
      if ((v20 & 1) == 0)
      {
        id v13 = v14;
        break;
      }
    }
  }
  return v13;
}

id sub_1A3558340(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if ((int)a2 <= 0)
  {
    id v11 = v5;
  }
  else
  {
    id v7 = NSString;
    id v8 = (void *)MEMORY[0x1E4F28EE0];
    id v9 = [NSNumber numberWithInt:a2];
    CFTypeID v10 = [v8 localizedStringFromNumber:v9 numberStyle:1];
    id v11 = [v7 stringWithFormat:@"%@-%@", v5, v10];
  }
  if ([v6 length])
  {
    uint64_t v12 = [v11 stringByAppendingPathExtension:v6];

    id v11 = (id)v12;
  }

  return v11;
}

id sub_1A3558448(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  CFTypeID v10 = [a3 lastPathComponent];
  id v11 = [v8 stringByAppendingPathComponent:v10];
  uint64_t v12 = [v11 cutStringByResolvingAndStandardizingPath];

  if (![v9 length])
  {

    id v9 = 0;
  }
  id v13 = 0;
  uint64_t v14 = 0;
  while (1)
  {
    uint64_t v15 = v13;
    id v13 = sub_1A3558340(v12, v14, v9);

    if (v14 == 9999) {
      break;
    }
    uint64_t v14 = (v14 + 1);
    if (([a1 fileExistsAtPath:v13] & 1) == 0)
    {
      id v16 = v13;
      goto LABEL_8;
    }
  }
  id v16 = [NSString cutStringGUID];
LABEL_8:
  char v17 = v16;

  return v17;
}

id sub_1A3558574(void *a1, uint64_t a2, void *a3)
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [v4 cutStringGUID];
  id v7 = NSTemporaryDirectory();
  id v8 = [a1 cutCreateUniqueDirectoryWithName:v6 atPath:v7 ofType:0];

  id v9 = [v5 lastPathComponent];
  CFTypeID v10 = [v9 stringByDeletingPathExtension];
  id v11 = [v5 pathExtension];

  uint64_t v12 = [a1 cutUniqueFilename:v10 atPath:v8 ofType:v11];

  return v12;
}

uint64_t sub_1A3558664(uint64_t a1)
{
  return MEMORY[0x1F4181798](a1, sel_base64EncodedStringWithOptions_);
}

id sub_1A355866C(void *a1)
{
  if ((unint64_t)[a1 length] <= 0xC800000)
  {
    if ([a1 length])
    {
      if (!off_1E95CDEC8) {
        off_1E95CDEC8 = (uint64_t (*)(void, void))CUTWeakLinkSymbol("inflate", @"/usr/lib/libz.dylib");
      }
      if (!off_1E95CDED0) {
        off_1E95CDED0 = (uint64_t (*)(void))CUTWeakLinkSymbol("inflateEnd", @"/usr/lib/libz.dylib");
      }
      if (!off_1E95CDED8) {
        off_1E95CDED8 = (uint64_t (*)(void, void, void, void))CUTWeakLinkSymbol("inflateInit2_", @"/usr/lib/libz.dylib");
      }
      int v3 = [a1 length];
      int v4 = [a1 length];
      if (v4 >= 0) {
        int v5 = v4;
      }
      else {
        int v5 = v4 + 1;
      }
      id v6 = [MEMORY[0x1E4F1CA58] dataWithLength:(v3 + (v5 >> 1))];
      *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v23 = v7;
      long long v22 = v7;
      long long v21 = v7;
      long long v20 = v7;
      long long v19 = v7;
      long long v18 = v7;
      id v8 = a1;
      LODWORD(v18) = objc_msgSend(v8, "length", objc_msgSend(v8, "bytes"), v18, v19, v20, v21, v22, v23, 0xAAAAAAAAAAAAAAAALL);
      *((void *)&v21 + 1) = 0;
      *(void *)&long long v22 = 0;
      *(void *)&long long v20 = 0;
      id v2 = 0;
      if (!off_1E95CDED8(&v17, 47, "1.2.12", 112))
      {
        do
        {
          unint64_t v9 = v20;
          if (v9 >= [v6 length]) {
            [v6 increaseLengthBy:(v5 >> 1)];
          }
          id v10 = v6;
          uint64_t v11 = [v10 mutableBytes];
          *(void *)&long long v19 = v11 + v20;
          int v12 = [v10 length];
          DWORD2(v19) = v12 - v20;
          int v13 = off_1E95CDEC8(&v17, 2);
        }
        while (!v13);
        BOOL v14 = v13 == 1;
        int v15 = off_1E95CDED0(&v17);
        id v2 = 0;
        if (v14 && !v15)
        {
          [v10 setLength:(void)v20];
          id v2 = [MEMORY[0x1E4F1C9B8] dataWithData:v10];
        }
      }
    }
    else
    {
      id v2 = a1;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

id sub_1A35588AC(void *a1)
{
  uint64_t v2 = [a1 _CUTDecompressData];
  int v3 = (void *)v2;
  if (v2) {
    int v4 = (void *)v2;
  }
  else {
    int v4 = a1;
  }
  id v5 = v4;

  return v5;
}

id sub_1A3558900(void *a1)
{
  if ([a1 length])
  {
    if (!off_1E95CDEE0) {
      off_1E95CDEE0 = (uint64_t (*)(void, void))CUTWeakLinkSymbol("deflate", @"/usr/lib/libz.dylib");
    }
    if (!off_1E95CDEE8) {
      off_1E95CDEE8 = (uint64_t (*)(void))CUTWeakLinkSymbol("deflateEnd", @"/usr/lib/libz.dylib");
    }
    if (!off_1E95CDEF0) {
      off_1E95CDEF0 = (uint64_t (*)(void, void, void, void, void, void, void, void))CUTWeakLinkSymbol("deflateInit2_", @"/usr/lib/libz.dylib");
    }
    *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    long long v15 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v1;
    long long v12 = v1;
    long long v11 = v1;
    unint64_t v13 = 0;
    long long v16 = 0uLL;
    id v2 = a1;
    uint64_t v10 = [v2 bytes];
    LODWORD(v11) = [v2 length];
    id v3 = 0;
    if (!off_1E95CDEF0(&v10, 0xFFFFFFFFLL, 8, 31, 8, 0, "1.2.12", 112))
    {
      int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:0x4000];
      do
      {
        unint64_t v5 = v13;
        if (v5 >= [v4 length]) {
          [v4 increaseLengthBy:0x4000];
        }
        id v3 = v4;
        uint64_t v6 = [v3 mutableBytes];
        *(void *)&long long v12 = v6 + v13;
        int v7 = [v3 length];
        DWORD2(v12) = v7 - v13;
        off_1E95CDEE0(&v10, 4);
      }
      while (!DWORD2(v12));
      off_1E95CDEE8(&v10);
      [v3 setLength:v13];
    }
    return v3;
  }
  else
  {
    return a1;
  }
}

uint64_t sub_1A3558FCC()
{
  qword_1E95CDE60 = objc_alloc_init(CUTNetworkInterfaceListener);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A35591A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](a3, sel__handleNetworkChange_);
}

void sub_1A355947C(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 32) != v2)
  {
    *(_DWORD *)(v1 + 32) = v2;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v9, "cutNetworkInterfaceListenerDidWifiStateChange:", *(unsigned int *)(a1 + 40), (void)v10);
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

void sub_1A3559630(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 36) != v2)
  {
    *(_DWORD *)(v1 + 36) = v2;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v9, "cutNetworkInterfaceListenerDidCellStateChange:", *(unsigned int *)(a1 + 40), (void)v10);
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

void sub_1A3559814(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 40;
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = 48;
  }
  id v3 = *(id *)(*(void *)(a1 + 32) + v2);
  if (([v3 isEqualToSet:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v4 = 40;
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v4 = 48;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + v4), *(id *)(a1 + 40));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v10, "cutNetworkInterfaceListenerDidAddressChange:isIPv6:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (void)v11);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

uint64_t sub_1A3559A28(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t result = [v2 containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v8 addObject:v7];
  }
  return result;
}

void sub_1A3559B44(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

void sub_1A355A084(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1A355A0F8()
{
  qword_1E95CDEF8 = (uint64_t)os_log_create("com.apple.CommonUtilities", "CUTFileCopier");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A355A190()
{
  qword_1E95CDE90 = (uint64_t)os_log_create("com.apple.CommonUtilities", "Power");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A355A228()
{
  qword_1EB272A70 = (uint64_t)os_log_create("com.apple.CommonUtilities", "Network");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A355A2C0()
{
  qword_1E95CDE88 = (uint64_t)os_log_create("com.apple.CommonUtilities", "WeakLink");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A355A358()
{
  qword_1E95CDF08 = (uint64_t)os_log_create("com.apple.CommonUtilities", "CUTXPC");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A355A3F0()
{
  qword_1E95CDF18 = (uint64_t)os_log_create("com.apple.CommonUtilities", "utilities");
  return MEMORY[0x1F41817F8]();
}

id cut_backtrace()
{
  __b[66] = *(void **)MEMORY[0x1E4F143B8];
  CFUUIDRef v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:66];
  memset(__b, 170, 0x210uLL);
  unsigned int v1 = backtrace(__b, 66);
  uint64_t v2 = backtrace_symbols(__b, v1);
  uint64_t v3 = v2;
  if (v1 >= 2)
  {
    uint64_t v4 = (int)v1 - 1;
    id v5 = (uint64_t *)(v2 + 1);
    do
    {
      id v6 = [NSString alloc];
      uint64_t v7 = *v5++;
      uint64_t v8 = (void *)[v6 initWithUTF8String:v7];
      [v0 addObject:v8];

      --v4;
    }
    while (v4);
  }
  free(v3);
  if ([v0 count])
  {
    objc_msgSend(v0, "subarrayWithRange:", 1, objc_msgSend(v0, "count") - 1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v0;
  }
  uint64_t v10 = v9;

  return v10;
}

void cut_non_arc_os_release(id *a1)
{
  if (a1)
  {
    id v2 = *a1;
    id v1 = self;
  }
}

void cut_dispatch_log_queue(void *a1)
{
  id v1 = a1;
  if (qword_1E95CDE70 != -1) {
    dispatch_once(&qword_1E95CDE70, &unk_1EF6C43C0);
  }
  id v2 = qword_1E95CDE78;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A355A694;
  block[3] = &unk_1E5AFEC38;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

uint64_t sub_1A355A694(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1A355A6A4()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  CFUUIDRef v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("CUTLog.oversize.queue", v0);
  id v2 = (void *)qword_1E95CDE78;
  qword_1E95CDE78 = (uint64_t)v1;
}

void sub_1A355A988(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

_xpc_connection_s *CUTXPCCreateServerConnection(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1 && *a1) {
    xpc_connection_t mach_service = xpc_connection_create_mach_service(a1, MEMORY[0x1E4F14428], 1uLL);
  }
  else {
    xpc_connection_t mach_service = xpc_connection_create(0, MEMORY[0x1E4F14428]);
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1A355B16C;
  handler[3] = &unk_1E5AFEC88;
  long long v14 = mach_service;
  id v25 = v9;
  id v26 = v10;
  long long v23 = v14;
  id v24 = v12;
  id v27 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  id v18 = v9;
  xpc_connection_set_event_handler(v14, handler);
  long long v19 = v27;
  long long v20 = v14;

  return v20;
}

void sub_1A355B16C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1A624A050]();
  if (v4 == MEMORY[0x1E4F145A8])
  {
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    id v10 = v3;
    id v11 = v6;
    id v12 = v7;
    id v13 = v8;
    if (v10 == (id)MEMORY[0x1E4F14528])
    {
      v34 = +[CUTLog xpc];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        sub_1A3564CB4(v34, v35, v36, v37, v38, v39, v40, v41);
      }

      long long v22 = v11;
      if (!v11) {
        goto LABEL_12;
      }
    }
    else
    {
      if (v10 != (id)MEMORY[0x1E4F14550])
      {
        int v42 = MEMORY[0x1A624A050](v10);
        v43 = +[CUTLog xpc];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
          sub_1A3564D24(v42, v43);
        }

        exit(0);
      }
      long long v14 = +[CUTLog xpc];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_1A3564CEC(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      long long v22 = v12;
      if (!v12) {
        goto LABEL_12;
      }
    }
    v22[2]();
LABEL_12:

    goto LABEL_16;
  }
  if (v4 == MEMORY[0x1E4F14578])
  {
    long long v23 = *(void **)(a1 + 64);
    id v24 = *(void **)(a1 + 40);
    id v25 = *(id *)(a1 + 32);
    id v26 = v3;
    id v27 = v23;
    long long v28 = v24;
    v29 = (_xpc_connection_s *)v26;
    if (!v28)
    {
      long long v28 = MEMORY[0x1E4F14428];
      id v30 = MEMORY[0x1E4F14428];
    }
    xpc_connection_set_target_queue(v29, v28);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1A355C1D4;
    handler[3] = &unk_1E5AFECF8;
    v46 = v29;
    id v47 = v27;
    id v45 = v25;
    id v31 = v27;
    id v32 = v25;
    uint64_t v33 = v29;
    xpc_connection_set_event_handler(v33, handler);
    xpc_connection_resume(v33);
  }
  else
  {
    id v5 = +[CUTLog xpc];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1A3564D9C();
    }
  }
LABEL_16:
}

void CUTXPCConnectionSetEventHandlers(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A355B528;
  v15[3] = &unk_1E5AFECB0;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  long long v14 = (_xpc_connection_s *)v7;
  xpc_connection_set_event_handler(v14, v15);
}

void sub_1A355B528(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1A624A050]();
  if (v4 != MEMORY[0x1E4F145A8])
  {
    if (v4 != MEMORY[0x1E4F14590])
    {
      id v5 = +[CUTLog xpc];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_1A3564FA8((uint64_t)a1);
      }
LABEL_9:

      goto LABEL_21;
    }
    uint64_t v8 = a1[7];
    if (!v8) {
      goto LABEL_21;
    }
    id v9 = *(void (**)(void))(v8 + 16);
LABEL_20:
    v9();
    goto LABEL_21;
  }
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    id v10 = +[CUTLog xpc];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1A3564E08((uint64_t)a1, v10);
    }

    uint64_t v11 = a1[5];
    if (v11)
    {
LABEL_19:
      id v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_20;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14528];
    id v5 = +[CUTLog xpc];
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
    if (v3 != v6)
    {
      if (v7) {
        sub_1A3564F00((uint64_t)a1, v3);
      }
      goto LABEL_9;
    }
    if (v7) {
      sub_1A3564E84((uint64_t)a1, v5);
    }

    uint64_t v11 = a1[6];
    if (v11) {
      goto LABEL_19;
    }
  }
LABEL_21:
}

_xpc_connection_s *CUTXPCCreateConnectionForServiceWithQueue(char a1, int a2, const char *a3, void *a4, void *a5, void *a6)
{
  uint64_t v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3)
  {
    if (!v11)
    {
      id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s_connection_queue", a3);
      uint64_t v11 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    }
    if (a1) {
      xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, v11, 0);
    }
    else {
      xpc_connection_t mach_service = xpc_connection_create(a3, v11);
    }
    id v16 = mach_service;
    if (mach_service)
    {
      if (a2)
      {
        CUTXPCConnectionSetEventHandlers(mach_service, v12, v13, 0);
        xpc_connection_resume(v16);
      }
    }
    else
    {
      id v17 = +[CUTLog xpc];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_1A356502C();
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

_xpc_connection_s *CUTXPCCreateConnectionForService(char a1, const char *a2, void *a3, void *a4)
{
  return CUTXPCCreateConnectionForServiceWithQueue(a1, 1, a2, 0, a3, a4);
}

uint64_t CUTInsertBoolsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = &a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_BOOL(xdict, a2, *(_DWORD *)v12 != 0);
      id v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

uint64_t CUTInsertIntsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = &a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_int64(xdict, a2, *(int *)v12);
      id v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

uint64_t CUTInsertDatasToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  id v16 = (id *)&a9;
  if (a2)
  {
    do
    {
      uint64_t v11 = v16;
      id v17 = v16 + 1;
      id v12 = *v11;
      if (!v12)
      {
        id v12 = [MEMORY[0x1E4F1C9B8] data];
      }
      id v13 = v12;
      xpc_dictionary_set_data(v10, a2, (const void *)[v13 bytes], objc_msgSend(v13, "length"));

      id v14 = (const char **)v17;
      id v16 = (id *)(v17 + 1);
      a2 = *v14;
    }
    while (*v14);
  }

  return 1;
}

uint64_t CUTInsertNSStringsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  id v18 = (id *)&a9;
  if (a2)
  {
    do
    {
      uint64_t v11 = v18;
      id v19 = v18 + 1;
      CFStringRef v12 = (const __CFString *)*v11;
      id v13 = (__CFString *)v12;
      if (v12)
      {
        CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
        if (CStringPtr)
        {
          xpc_dictionary_set_string(v10, a2, CStringPtr);
        }
        else
        {
          CFIndex maxBufLen = 0;
          v21.length = CFStringGetLength(v13);
          v21.location = 0;
          CFStringGetBytes(v13, v21, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
          uint64_t v15 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x83B6CFF3uLL);
          v22.length = CFStringGetLength(v13);
          v22.location = 0;
          CFStringGetBytes(v13, v22, 0x8000100u, 0, 0, v15, maxBufLen, 0);
          v15[maxBufLen] = 0;
          xpc_dictionary_set_string(v10, a2, (const char *)v15);
          free(v15);
        }
      }

      id v16 = (const char **)v19;
      id v18 = (id *)(v19 + 1);
      a2 = *v16;
    }
    while (*v16);
  }

  return 1;
}

uint64_t CUTInsertDoublesToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFStringRef v12 = (double *)&a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_double(xdict, a2, *v12);
      id v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

BOOL CUTGetXPCBoolFromDictionary(void *a1, const char *a2)
{
  return a2 && xpc_dictionary_get_BOOL(a1, a2);
}

int64_t CUTGetXPCIntFromDictionary(void *a1, const char *a2)
{
  if (a2) {
    return xpc_dictionary_get_int64(a1, a2);
  }
  else {
    return 0;
  }
}

id CUTGetXPCDataFromDictionary(void *a1, const char *a2)
{
  if (a2)
  {
    size_t length = 0;
    data = (void *)xpc_dictionary_get_data(a1, a2, &length);
    if (data)
    {
      uint64_t v4 = data;
      id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      data = (void *)[v5 initWithBytes:v4 length:length];
    }
  }
  else
  {
    data = 0;
  }
  return data;
}

char *CUTGetXPCStringFromDictionary(void *a1, char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    string = xpc_dictionary_get_string(v3, a2);
    a2 = (char *)string;
    if (string)
    {
      size_t v6 = strlen(string);
      a2 = (char *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], (const UInt8 *)a2, v6, 0x8000100u, 0);
    }
  }

  return a2;
}

double CUTGetXPCDoubleFromDictionary(xpc_object_t xdict, const char *key)
{
  if (key) {
    return xpc_dictionary_get_double(xdict, key);
  }
  else {
    return 0.0;
  }
}

id CUTGetXPCConnectionContext(_xpc_connection_s *a1)
{
  uint64_t v1 = xpc_connection_get_context(a1);
  uint64_t v2 = [v1 object];

  return v2;
}

void CUTSetXPCConnectionContext(void *a1, void *a2)
{
  connection = a1;
  id v3 = a2;
  context = xpc_connection_get_context(connection);
  id v5 = self;

  if (v3)
  {
    size_t v6 = +[CUTWeakReference weakRefWithObject:v3];
  }
  else
  {
    size_t v6 = 0;
  }
  xpc_connection_set_context(connection, v6);
}

id CUTCreateXPCObjectFromDictionary(void *a1)
{
  id v1 = a1;
  if ([v1 count]) {
    uint64_t v2 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

id CUTCreateDictionaryFromXPCObject(void *a1)
{
  if (a1)
  {
    a1 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    uint64_t v1 = vars8;
  }
  return a1;
}

id CUTDataForPropertyList(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v1 format:200 options:0 error:0];
    if (!v2) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"argument can't be converted to a property list"];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id CUTPropertyListFromNSData(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = [MEMORY[0x1E4F28F98] propertyListWithData:v1 options:0 format:0 error:0];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id CUTSafeArrayOfStrings(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v1 = 0;
  }
  objc_opt_class();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  uint64_t v4 = v2;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v4 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    uint64_t v4 = v2;
  }
LABEL_13:

  return v4;
}

void CUTXPCAlertv(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = (objc_class *)NSString;
    id v4 = a1;
    id v19 = (id)[[v3 alloc] initWithFormat:v4 arguments:a2];

    CUTXPCCreateConnectionForServiceWithQueue(1, 1, "com.apple.aps.alertprovider.xpc", 0, &unk_1EF6C4280, 0);
    uint64_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      CUTInsertIntsToXPCDictionary(v6, "type", v7, v8, v9, v10, v11, v12, 0);
      CUTInsertNSStringsToXPCDictionary(v6, "text", v13, v14, v15, v16, v17, v18, (uint64_t)v19);
      xpc_connection_send_message(v5, v6);
    }
  }
}

void sub_1A355C15C()
{
  CFUUIDRef v0 = +[CUTLog xpc];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    sub_1A3565098(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void CUTXPCAlert(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1A355C1D4(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

void sub_1A355C1FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

const char *sub_1A355C218(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(a1 + 32);
  return xpc_connection_get_name(v2);
}

void sub_1A355C230(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_1A355C248(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t sub_1A355C4FC()
{
  qword_1E95CDE68 = objc_alloc_init(CUTReporting);
  return MEMORY[0x1F41817F8]();
}

id sub_1A355C654()
{
  if (qword_1E95CDE48 != -1) {
    dispatch_once(&qword_1E95CDE48, &unk_1EF6C4420);
  }
  CFUUIDRef v0 = (void *)qword_1E95CDE50;
  return v0;
}

void sub_1A355C6A8(uint64_t a1)
{
  uint64_t v2 = +[CUTReporting _rtcReportingSession];
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1A355C774;
    v3[3] = &unk_1E5AFED28;
    id v5 = *(id *)(a1 + 32);
    id v4 = v2;
    [v4 startConfigurationWithCompletionHandler:v3];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_1A355C774(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

void sub_1A355CCFC()
{
  CFUUIDRef v0 = (void *)qword_1E95CDE38;
  qword_1E95CDE38 = (uint64_t)&unk_1EF6C7198;
}

void sub_1A355CDC4(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v4);
}

void sub_1A355CEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    MEMORY[0x1F4181798](v4, sel__fullfillSeal_withSession_);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CUTReportingErrorDomain" code:3 userInfo:0];
    [v2 _failSeal:v3 withError:v5];
  }
}

uint64_t sub_1A355D048(uint64_t a1)
{
  return [*(id *)(a1 + 32) fulfillWithValue:*(void *)(a1 + 40)];
}

uint64_t sub_1A355D120(uint64_t a1)
{
  return [*(id *)(a1 + 32) failWithError:*(void *)(a1 + 40)];
}

void sub_1A355D154()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("CUTReporting.queue", v2);
  uint64_t v1 = (void *)qword_1E95CDE50;
  qword_1E95CDE50 = (uint64_t)v0;
}

void *sub_1A355D1BC()
{
  uint64_t result = CUTWeakLinkSymbol("kRTCReportingSessionInfoClientType", @"RTCReporting");
  qword_1E95CDDE8 = (uint64_t)result;
  return result;
}

void *sub_1A355D1EC()
{
  uint64_t result = CUTWeakLinkSymbol("kRTCReportingSessionInfoClientVersion", @"RTCReporting");
  qword_1E95CDDF8 = (uint64_t)result;
  return result;
}

void *sub_1A355D21C()
{
  uint64_t result = CUTWeakLinkSymbol("kRTCReportingSessionInfoSessionID", @"RTCReporting");
  qword_1E95CDE08 = (uint64_t)result;
  return result;
}

void *sub_1A355D24C()
{
  uint64_t result = CUTWeakLinkSymbol("kRTCReportingSessionInfoBatchEvent", @"RTCReporting");
  qword_1E95CDDD8 = (uint64_t)result;
  return result;
}

void *sub_1A355D27C()
{
  uint64_t result = CUTWeakLinkSymbol("kRTCReportingUserInfoClientName", @"RTCReporting");
  qword_1E95CDE18 = (uint64_t)result;
  return result;
}

void *sub_1A355D2AC()
{
  uint64_t result = CUTWeakLinkSymbol("kRTCReportingUserInfoServiceName", @"RTCReporting");
  qword_1E95CDE28 = (uint64_t)result;
  return result;
}

uint64_t sub_1A355D384()
{
  qword_1E95CDEC0 = objc_alloc_init(CUTTelephonyManager);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A355D7C0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) lock];
  byte_1E95CDEA0 = 0;
  objc_msgSend(*(id *)(a1 + 32), "__adjustFastDormancyTokens");
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 unlock];
}

void sub_1A355DD6C(int a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[CUTLog network];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((a1 & 0x40000) != 0) {
      int v5 = 87;
    }
    else {
      int v5 = 45;
    }
    v14[0] = 67111426;
    v14[1] = v5;
    if ((a1 & 2) != 0) {
      int v6 = 82;
    }
    else {
      int v6 = 45;
    }
    __int16 v15 = 1024;
    int v16 = v6;
    if (a1) {
      int v7 = 116;
    }
    else {
      int v7 = 45;
    }
    __int16 v17 = 1024;
    int v18 = v7;
    if ((a1 & 4) != 0) {
      int v8 = 99;
    }
    else {
      int v8 = 45;
    }
    __int16 v19 = 1024;
    int v20 = v8;
    if ((a1 & 8) != 0) {
      int v9 = 67;
    }
    else {
      int v9 = 45;
    }
    __int16 v21 = 1024;
    if ((a1 & 0x10) != 0) {
      int v10 = 105;
    }
    else {
      int v10 = 45;
    }
    int v22 = v9;
    __int16 v23 = 1024;
    if ((a1 & 0x20) != 0) {
      int v11 = 68;
    }
    else {
      int v11 = 45;
    }
    int v24 = v10;
    if ((a1 & 0x10000) != 0) {
      int v12 = 108;
    }
    else {
      int v12 = 45;
    }
    __int16 v25 = 1024;
    int v26 = v11;
    if ((a1 & 0x20000) != 0) {
      int v13 = 100;
    }
    else {
      int v13 = 45;
    }
    __int16 v27 = 1024;
    int v28 = v12;
    __int16 v29 = 1024;
    int v30 = v13;
    __int16 v31 = 2080;
    uint64_t v32 = a2;
    _os_log_impl(&dword_1A3554000, v4, OS_LOG_TYPE_DEFAULT, "Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n", (uint8_t *)v14, 0x42u);
  }
}

uint64_t sub_1A355E0EC()
{
  qword_1EB272A80 = objc_alloc_init(CUTWiFiManager);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A355E4B0(uint64_t a1)
{
  uint64_t v2 = +[CUTLog network];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A3554000, v2, OS_LOG_TYPE_DEFAULT, "Notified about link change, running network block async", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateIsWiFiAssociatedAsync:1];
}

uint64_t sub_1A355EAC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](a3, sel__handleDeviceAttachedCallback);
}

void sub_1A355EAD0()
{
  dispatch_queue_t v0 = +[CUTLog network];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_1A3565104();
  }
}

uint64_t sub_1A355EBF8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handlePotentialDeviceChange:a2];
}

void sub_1A355EDC0(const __SCDynamicStore *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v3 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(v2, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  CFStringRef v7 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v2, v5, (CFStringRef)*MEMORY[0x1E4F41B18]);
  CFArrayAppendValue(Mutable, v7);
  int v8 = CFArrayCreateMutable(v2, 0, v3);
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F41AF8];
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v2, v5, (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41AF8]);
  CFArrayAppendValue(v8, NetworkServiceEntity);
  CFRelease(NetworkServiceEntity);
  CFDictionaryRef v11 = SCDynamicStoreCopyMultiple(a1, Mutable, v8);
  CFRelease(Mutable);
  CFRelease(v8);
  if (!v11)
  {
    BOOL v16 = 0;
    goto LABEL_25;
  }
  if (!NetworkGlobalEntity) {
    goto LABEL_7;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v11, NetworkGlobalEntity);
  CFDictionaryRef v13 = Value;
  if (!Value)
  {
LABEL_8:
    __int16 v15 = 0;
    goto LABEL_9;
  }
  CFTypeID v14 = CFGetTypeID(Value);
  if (v14 != CFDictionaryGetTypeID())
  {
LABEL_7:
    CFDictionaryRef v13 = 0;
    goto LABEL_8;
  }
  __int16 v15 = CFDictionaryGetValue(v13, (const void *)*MEMORY[0x1E4F41AD8]);
  CFDictionaryRef v13 = (const __CFDictionary *)CFDictionaryGetValue(v13, (const void *)*MEMORY[0x1E4F41AE0]);
LABEL_9:
  if (v15) {
    BOOL v17 = v13 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = v17;
  if (v7) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19)
  {
    CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(v11, v7);
    if (v20)
    {
      CFDictionaryRef v21 = v20;
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 == CFDictionaryGetTypeID())
      {
        __int16 v15 = CFDictionaryGetValue(v21, (const void *)*MEMORY[0x1E4F41AD8]);
        CFDictionaryRef v13 = (const __CFDictionary *)CFDictionaryGetValue(v21, (const void *)*MEMORY[0x1E4F41AE0]);
      }
    }
  }
  BOOL v16 = 0;
  if (v15 && v13)
  {
    CFStringRef v23 = SCDynamicStoreKeyCreateNetworkServiceEntity(v2, v5, (CFStringRef)v13, v9);
    int v24 = CFDictionaryGetValue(v11, v23);
    CFRelease(v23);
    BOOL v16 = v24 != 0;
  }
LABEL_25:
  if (NetworkGlobalEntity) {
    CFRelease(NetworkGlobalEntity);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v11) {
    CFRelease(v11);
  }
  id v25 = +[CUTWiFiManager sharedInstance];
  [v25 setIsPrimaryCellularCached:v16];
}

void sub_1A355F584(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[CUTLog network];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = a2;
    _os_log_impl(&dword_1A3554000, v4, OS_LOG_TYPE_DEFAULT, "Found current network: %p", buf, 0xCu);
  }

  uint64_t v5 = [*(id *)(a1 + 32) _ssidFromNetwork:a2];
  if (v5)
  {
    int v6 = +[CUTLog network];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v28 = v5;
      _os_log_impl(&dword_1A3554000, v6, OS_LOG_TYPE_DEFAULT, "We are associated to %{private}@", buf, 0xCu);
    }

    CFStringRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v5 forKey:@"@\"CUTWiFiManagerSSID\""];
  }
  else
  {
    CFStringRef v7 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) lock];
  int v8 = +[CUTLog network];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v28 = a2;
    _os_log_impl(&dword_1A3554000, v8, OS_LOG_TYPE_DEFAULT, "Network change: %{private}@", buf, 0xCu);
  }
  BOOL v19 = (void *)v5;

  CFStringRef v9 = +[CUTLog network];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = @"YES";
    if (!a2) {
      int v10 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = (uint64_t)v10;
    _os_log_impl(&dword_1A3554000, v9, OS_LOG_TYPE_DEFAULT, "Wifi is associated? %@", buf, 0xCu);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    __int16 v15 = MEMORY[0x1E4F14428];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1A355F8D8;
        block[3] = &unk_1E5AFEE10;
        uint64_t v18 = *(void *)(a1 + 32);
        void block[4] = v17;
        block[5] = v18;
        id v21 = v7;
        dispatch_async(v15, block);
      }
      uint64_t v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v19);
    }
    while (v13);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) unlock];
}

uint64_t sub_1A355F8D8(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return MEMORY[0x1F4181798](v3, sel_cutWiFiManagerLinkDidChange_context_);
  }
  return result;
}

void sub_1A355FCA0(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) lock];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(const void **)(v4 + 56);
  if (v5)
  {
    CFRetain(*(CFTypeRef *)(v4 + 56));
    int v6 = +[CUTLog network];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      long long v23 = v5;
      _os_log_impl(&dword_1A3554000, v6, OS_LOG_TYPE_DEFAULT, "Found cached network: %p", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) unlock];
LABEL_5:
    [*(id *)(a1 + 32) setCurrentNetwork:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v5) {
      CFRelease(v5);
    }
    return;
  }
  [*(id *)(v4 + 32) unlock];
  if (!*(unsigned char *)(a1 + 48))
  {
    if (a2) {
      uint64_t v5 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
    }
    else {
      uint64_t v5 = 0;
    }
    __int16 v15 = +[CUTLog network];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      long long v23 = v5;
      _os_log_impl(&dword_1A3554000, v15, OS_LOG_TYPE_DEFAULT, "Sync query found network: %p", buf, 0xCu);
    }

    goto LABEL_5;
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_1A355FF30;
  BOOL v19 = &unk_1E5AFEE60;
  CFStringRef v7 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = v7;
  int v8 = (void *)MEMORY[0x1A6249D30](&v16);
  if (a2)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "lock", v16, v17, v18, v19, v20);
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 32);
    id v11 = *(id *)(v9 + 120);
    [v10 unlock];
    uint64_t v12 = [v8 copy];

    id v13 = (id)MEMORY[0x1A6249D30](v12);
    WiFiDeviceClientCopyCurrentNetworkAsync();

    id v14 = self;
    int v8 = (void *)v12;
  }
}

void sub_1A355FF30(uint64_t a1, const void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setCurrentNetwork:a2];
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = +[CUTLog network];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      int v6 = a2;
      _os_log_impl(&dword_1A3554000, v4, OS_LOG_TYPE_DEFAULT, "async query found network: %p", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (a2) {
    CFRelease(a2);
  }
}

uint64_t sub_1A356001C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = a3;
    a1 = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    a3 = v5;
    uint64_t v3 = vars8;
  }
  return MEMORY[0x1F4181820](a1, a2, a3);
}

uint64_t sub_1A3560164(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handlePotentialDeviceChange:a2];
}

uint64_t sub_1A3560478(int a1, CFDictionaryRef theDict, void *a3)
{
  int v10 = -1431655766;
  int valuePtr = -1431655766;
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"DRIVER_AVAILABLE");
  int v6 = CFBooleanGetValue(Value);
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DRIVER_AVAILABLE_REASON");
  CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DRIVER_AVAILABLE_SUBREASON");
  uint64_t result = CFNumberGetValue(v8, kCFNumberIntType, &v10);
  if (v6) {
    return [a3 _performPowerReading];
  }
  return result;
}

void sub_1A3560510(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  if (theDict)
  {
    CFDictionaryGetValue(theDict, @"LINK_CHANGED_NETWORK");
    MEMORY[0x1F4181798](a3, sel__setCurrentNetwork_);
  }
}

uint64_t sub_1A3560564(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4181798](a2, sel__handleDevicePowerCallback);
}

uint64_t sub_1A356056C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](a3, sel__handleHostAPStateChangedCallback);
}

uint64_t sub_1A3560574(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return MEMORY[0x1F4181798](v3, sel_cutWiFiManagerDeviceAttached_);
  }
  return result;
}

void sub_1A35607A0(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) lock];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      CFNumberRef v8 = MEMORY[0x1E4F14428];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1A3560940;
          block[3] = &unk_1E5AFEE10;
          uint64_t v11 = *(void *)(a1 + 32);
          void block[4] = v10;
          block[5] = v11;
          id v13 = v3;
          dispatch_async(v8, block);

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) unlock];
  }
}

uint64_t sub_1A3560940(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return MEMORY[0x1F4181798](v3, sel_cutWiFiManager_generatedPowerReading_);
  }
  return result;
}

void sub_1A3560A5C(uint64_t a1, uint64_t a2)
{
  if (a2 && [*(id *)(a1 + 32) isWiFiAssociated])
  {
    int valuePtr = 115;
    CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    uint64_t v5 = (void *)WiFiDeviceClientCopyProperty();
    uint64_t v6 = [v5 objectForKey:@"INSTANT_ASSOCIATED_SLEEP_DURATION"];
    uint64_t v7 = [v6 integerValue];

    CFNumberRef v8 = [v5 objectForKey:@"INSTANT_UNASSOCIATED_SLEEP_DURATION"];
    uint64_t v9 = [v8 integerValue];

    if (v7 > 0 || v9 >= 1)
    {
      uint64_t v11 = [v5 objectForKey:@"CACHED_ASSOCIATED_SLEEP_DURATION"];
      unint64_t v12 = [v11 unsignedIntegerValue];

      id v13 = [v5 objectForKey:@"CACHED_TIME_STAMP"];
      unint64_t v14 = [v13 unsignedIntegerValue];

      long long v15 = [v5 objectForKey:@"INSTANT_ASSOCIATED_SLEEP_DURATION"];
      unint64_t v16 = [v15 unsignedIntegerValue];

      long long v17 = [v5 objectForKey:@"INSTANT_TIME_STAMP"];
      unint64_t v18 = [v17 unsignedIntegerValue];

      unint64_t v19 = v18 >= v14 ? v18 - v14 : 0;
      if (v19 >> 5 >= 0x753)
      {
        if (v16 >= v12) {
          unint64_t v20 = v16 - v12;
        }
        else {
          unint64_t v20 = 0;
        }
        id v21 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v22 = [NSNumber numberWithUnsignedInteger:v19];
        [v21 setObject:v22 forKey:@"@\"CUTWiFiManagerTotalDuration\""];

        long long v23 = [NSNumber numberWithUnsignedInteger:v20];
        [v21 setObject:v23 forKey:@"@\"CUTWiFiManagerPMDuration\""];

        uint64_t v24 = NSNumber;
        [*(id *)(a1 + 32) _wifiMeasurementErrorForInterval:(double)v19 / 1000.0];
        long long v25 = objc_msgSend(v24, "numberWithDouble:");
        [v21 setObject:v25 forKey:@"@\"CUTWiFiManagerMaxMeasurementError\""];

        int v26 = [v5 objectForKey:@"CACHED_ASSOCIATED_SLEEP_DURATION"];
        uint64_t v27 = [v26 unsignedIntegerValue];

        uint64_t v28 = [NSNumber numberWithUnsignedInteger:v27];
        [v21 setObject:v28 forKey:@"CACHED_ASSOCIATED_SLEEP_DURATION"];

        uint64_t v29 = [v5 objectForKey:@"CACHED_TIME_STAMP"];
        uint64_t v30 = [v29 unsignedIntValue];

        __int16 v31 = [NSNumber numberWithUnsignedInteger:v30];
        [v21 setObject:v31 forKey:@"CACHED_TIME_STAMP"];

        uint64_t v32 = [v5 objectForKey:@"INSTANT_ASSOCIATED_SLEEP_DURATION"];
        uint64_t v33 = [v32 unsignedIntegerValue];

        v34 = [NSNumber numberWithUnsignedInteger:v33];
        [v21 setObject:v34 forKey:@"INSTANT_ASSOCIATED_SLEEP_DURATION"];

        uint64_t v35 = [v5 objectForKey:@"INSTANT_TIME_STAMP"];
        uint64_t v36 = [v35 unsignedIntegerValue];

        uint64_t v37 = [NSNumber numberWithUnsignedInteger:v36];
        [v21 setObject:v37 forKey:@"INSTANT_TIME_STAMP"];

        uint64_t v38 = *(void **)(a1 + 32);
        uint64_t v43 = MEMORY[0x1E4F143A8];
        uint64_t v44 = 3221225472;
        id v45 = sub_1A3560EA8;
        v46 = &unk_1E5AFEED8;
        id v47 = v38;
        id v48 = v21;
        id v49 = *(id *)(a1 + 40);
        id v39 = v21;
        [v38 _performCurrentNetworkBlock:&v43 withDevice:a2 async:1];
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "lock", v43, v44, v45, v46, v47);
        uint64_t v40 = [v5 copy];
        uint64_t v41 = *(void *)(a1 + 32);
        int v42 = *(void **)(v41 + 88);
        *(void *)(v41 + 88) = v40;

        [*(id *)(*(void *)(a1 + 32) + 32) unlock];
      }
    }
    if (v4) {
      CFRelease(v4);
    }
  }
}

uint64_t sub_1A3560EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _ssidFromNetwork:a2];
  uint64_t v7 = v4;
  if (v4)
  {
    [*(id *)(a1 + 40) setObject:v4 forKey:@"@\"CUTWiFiManagerSSID\""];
    uint64_t v4 = v7;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, *(void *)(a1 + 40), v4);
    uint64_t v4 = v7;
  }
  return MEMORY[0x1F4181820](v5, v3, v4);
}

void sub_1A3561018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A3561030(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A3561040(uint64_t a1)
{
}

uint64_t sub_1A3561048(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _ssidFromNetwork:a2];
  return MEMORY[0x1F41817F8]();
}

void sub_1A3561174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A356118C(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    char v3 = [*(id *)(result + 32) _isPrimaryCellular];
    uint64_t result = WiFiNetworkIsCaptive();
    if (result) {
      char v4 = v3;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = v4;
  }
  return result;
}

id sub_1A35618E4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_alloc_init(CUTUnsafePromiseSeal);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  unint64_t v12 = sub_1A35619DC;
  id v13 = &unk_1E5AFEF78;
  unint64_t v14 = v5;
  id v15 = v3;
  id v6 = v3;
  uint64_t v7 = v5;
  [v4 registerResultBlock:&v10];

  CFNumberRef v8 = [(CUTUnsafePromiseSeal *)v7 promise];

  return v8;
}

void sub_1A35619DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v8 = [v3 error];

    [v4 failWithError:v8];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v3 value];

    uint64_t v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1A3561B0C;
    v9[3] = &unk_1E5AFEAF8;
    id v10 = *(id *)(a1 + 32);
    [v7 registerResultBlock:v9];
  }
}

void sub_1A3561B0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4 == 1)
  {
    id v6 = [v3 error];

    [v5 failWithError:v6];
  }
  else
  {
    id v6 = [v3 value];

    [v5 fulfillWithValue:v6];
  }
}

_CUTLockingPromise *sub_1A3561BA4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_alloc_init(_CUTLockingPromise);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A3561C84;
  v11[3] = &unk_1E5AFEF78;
  id v6 = v5;
  unint64_t v12 = v6;
  id v13 = v3;
  id v7 = v3;
  [v4 registerResultBlock:v11];

  id v8 = v13;
  uint64_t v9 = v6;

  return v9;
}

void sub_1A3561C84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 1)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [CUTResult alloc];
    id v6 = [v3 error];
    id v7 = [(CUTResult *)v5 initWithError:v6];
    [v4 _fulfillWithResult:v7];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [v3 value];
    id v10 = (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_1A35651AC();
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A3561DD4;
    v11[3] = &unk_1E5AFEAF8;
    id v12 = *(id *)(a1 + 32);
    [v10 registerResultBlock:v11];
  }
}

void sub_1A3561DD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [CUTResult alloc];
  if (v4 == 1)
  {
    id v9 = [v3 error];

    uint64_t v7 = [(CUTResult *)v6 initWithError:v9];
  }
  else
  {
    id v9 = [v3 value];

    uint64_t v7 = [(CUTResult *)v6 initWithSuccess:v9];
  }
  uint64_t v8 = (void *)v7;
  [v5 _fulfillWithResult:v7];
}

void sub_1A3562274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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

void sub_1A35622A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v9 = v3;
    if ([v3 state] == 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = [v9 error];
      [v4 failWithError:v5];

LABEL_7:
      id v3 = v9;
      goto LABEL_8;
    }
    id v6 = [v9 value];
    [*(id *)(a1 + 40) setObject:v6 atIndexedSubscript:*(int *)(a1 + 64)];

    uint64_t v7 = (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    BOOL v8 = [*(id *)(a1 + 40) count] == v7;
    id v3 = v9;
    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [*(id *)(a1 + 32) fulfillWithValue:*(void *)(a1 + 40)];
      goto LABEL_7;
    }
  }
LABEL_8:
}

void sub_1A3562598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A35625B8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 atIndexedSubscript:*(int *)(a1 + 56)];
  uint64_t v3 = (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result == v3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 fulfillWithValue:v6];
  }
  return result;
}

void sub_1A3562BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A3562C28(uint64_t a1, void *a2)
{
  id v10 = a2;
  [*(id *)(a1 + 32) lock];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if ([v10 state] == 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      uint64_t v3 = *(void **)(a1 + 40);
      uint64_t v4 = [CUTResult alloc];
      uint64_t v5 = [v10 error];
      uint64_t v6 = [(CUTResult *)v4 initWithError:v5];
      [v3 _fulfillWithResult:v6];
    }
    else
    {
      uint64_t v7 = [v10 value];
      [*(id *)(a1 + 48) setObject:v7 atIndexedSubscript:*(int *)(a1 + 72)];

      uint64_t v8 = (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if ([*(id *)(a1 + 48) count] != v8) {
        goto LABEL_7;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v9 = *(void **)(a1 + 40);
      uint64_t v5 = [[CUTResult alloc] initWithSuccess:*(void *)(a1 + 48)];
      [v9 _fulfillWithResult:v5];
    }
  }
LABEL_7:
  [*(id *)(a1 + 32) unlock];
}

void sub_1A3563008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A3563028(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 lock];
  [*(id *)(a1 + 40) setObject:v4 atIndexedSubscript:*(int *)(a1 + 64)];

  uint64_t v5 = (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if ([*(id *)(a1 + 40) count] == v5)
  {
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = [[CUTResult alloc] initWithSuccess:*(void *)(a1 + 40)];
    [v6 _fulfillWithResult:v7];
  }
  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 unlock];
}

uint64_t sub_1A3563A48()
{
  dispatch_queue_t v0 = BOMCopierUserData();
  uint64_t v1 = v0;
  uint64_t v2 = 2;
  if (v0)
  {
    if ([v0 wasCancelled]) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t sub_1A3563A90(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = BOMCopierUserData();
  uint64_t v6 = +[CUTLog fileCopier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v8 = 138543875;
    id v9 = v5;
    __int16 v10 = 2081;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_fault_impl(&dword_1A3554000, v6, OS_LOG_TYPE_FAULT, "File error {cutCopier: %{public}@, path: %{private}s, errorNumber: %d}", (uint8_t *)&v8, 0x1Cu);
  }

  return 0;
}

uint64_t sub_1A3563B78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = BOMCopierUserData();
  id v4 = +[CUTLog fileCopier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_1A35651D8((uint64_t)v3, a2, v4);
  }

  return 3;
}

void sub_1A3563BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = BOMCopierUserData();
  id v4 = +[CUTLog fileCopier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_1A3565250((uint64_t)v3, a2, v4);
  }
}

void sub_1A3563C5C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = BOMCopierUserData();
  uint64_t v6 = +[CUTLog fileCopier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 138543875;
    int v8 = v5;
    __int16 v9 = 2081;
    uint64_t v10 = a2;
    __int16 v11 = 1024;
    int v12 = a3;
    _os_log_fault_impl(&dword_1A3554000, v6, OS_LOG_TYPE_FAULT, "Fatal File Error {cutCopier: %{public}@, path: %{private}s, errorNumber: %d}", (uint8_t *)&v7, 0x1Cu);
  }
}

void sub_1A3563E38(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1A3564070(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A3564094(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return MEMORY[0x1F4181798](v3, sel_cutPowerMonitorSystemHasPoweredOn_);
  }
  return result;
}

void sub_1A35641D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CUTPowerMonitor sharedInstance];
  [v6 _handlePowerChangedNotificationWithMessageType:a3 notificationID:a4];
}

void sub_1A3564350(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -536723200)
  {
    uint64_t v5 = +[CUTPowerMonitor sharedInstance];
    [v5 updateBatteryLevelWithBatteryEntry:a2];

    id v6 = +[CUTPowerMonitor sharedInstance];
    [v6 updateBatteryConnectedStateWithBatteryEntry:a2];
  }
}

uint64_t sub_1A35643E0()
{
  qword_1EB272A68 = [[CUTPowerMonitor alloc] _init];
  return MEMORY[0x1F41817F8]();
}

void sub_1A3564600(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A35647A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A35647CC(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return MEMORY[0x1F4181798](v3, sel_cutPowerMonitorBatteryConnectedStateDidChange_);
  }
  return result;
}

void sub_1A356492C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3564950()
{
  __assert_rtn("-[CUTDeferredTaskQueue initWithCapacity:queue:block:]", "CUTDeferredTaskQueue.m", 25, "capacity >= 0");
}

void sub_1A356497C()
{
  *(_WORD *)dispatch_queue_t v0 = 0;
  _os_log_fault_impl(&dword_1A3554000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unable to create security task from audit token.", v0, 2u);
}

void sub_1A35649C4(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_fault_impl(&dword_1A3554000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unable to get entitlements for client task {error: %{public}@}", (uint8_t *)&v2, 0xCu);
}

void sub_1A3564A48()
{
  *(_WORD *)dispatch_queue_t v0 = 0;
  _os_log_fault_impl(&dword_1A3554000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** SCDynamicStoreCreate() failed", v0, 2u);
}

void sub_1A3564A90()
{
  *(_WORD *)dispatch_queue_t v0 = 0;
  _os_log_fault_impl(&dword_1A3554000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** SCDynamicStoreSetNotificationKeys failed", v0, 2u);
}

void sub_1A3564AD8()
{
  dispatch_queue_t v0 = cut_backtrace();
  sub_1A355A084(&dword_1A3554000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);
}

void sub_1A3564B60(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_fault_impl(&dword_1A3554000, log, OS_LOG_TYPE_FAULT, "Unable to create the power assertion {identifier: %{public}@, retVal: %d}", (uint8_t *)&v3, 0x12u);
}

void sub_1A3564BE8(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  pid_t v7 = getpid();
  uint64_t v8 = *(void *)(*(void *)a1 + 24);
  int v9 = 138544130;
  uint64_t v10 = v6;
  __int16 v11 = 1024;
  int v12 = a2;
  __int16 v13 = 1024;
  pid_t v14 = v7;
  __int16 v15 = 2114;
  uint64_t v16 = v8;
  _os_log_fault_impl(&dword_1A3554000, a3, OS_LOG_TYPE_FAULT, "Unable to properly release the power assertion - Dropping it stead {identifier: %{public}@, retVal: %d, pid: %d, stack: %{public}@ }", (uint8_t *)&v9, 0x22u);
}

void sub_1A3564CB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A3564CEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A3564D24(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A3554000, a2, OS_LOG_TYPE_FAULT, "Unknown error type: %d, exiting", (uint8_t *)v2, 8u);
}

void sub_1A3564D9C()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1A355C1F0();
  sub_1A355C230(&dword_1A3554000, v0, v1, "Unhandled listener event:  %p", v2);
}

void sub_1A3564E08(uint64_t a1, NSObject *a2)
{
  sub_1A355C218(a1);
  sub_1A355C1F0();
  sub_1A355C230(&dword_1A3554000, a2, v3, "Interrupted connection to service %s", v4);
}

void sub_1A3564E84(uint64_t a1, NSObject *a2)
{
  sub_1A355C218(a1);
  sub_1A355C1F0();
  sub_1A355C230(&dword_1A3554000, a2, v3, "Connection Invalid for service %{public}s", v4);
}

void sub_1A3564F00(uint64_t a1, void *a2)
{
  sub_1A355C218(a1);
  xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14530]);
  sub_1A355C248(&dword_1A3554000, v3, v4, "Unexpected error for service %{public}s: %{public}s", v5, v6, v7, v8, 2u);
}

void sub_1A3564FA8(uint64_t a1)
{
  sub_1A355C218(a1);
  sub_1A355C1F0();
  sub_1A355C248(&dword_1A3554000, v1, v2, "Received unexpected event in hander for service %{public}s: %{public}@", v3, v4, v5, v6, v7);
}

void sub_1A356502C()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1A355C1F0();
  sub_1A355C230(&dword_1A3554000, v0, v1, "Unable to build service for name %{public}s", v2);
}

void sub_1A3565098(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A35650D0()
{
  sub_1A35618D8();
  sub_1A355C1FC(&dword_1A3554000, v0, v1, "WiFiManagerClientCreate() returned NULL. Check that the process has the appropriate entitlement(s).", v2, v3, v4, v5, v6);
}

void sub_1A3565104()
{
  sub_1A35618D8();
  _os_log_debug_impl(&dword_1A3554000, v0, OS_LOG_TYPE_DEBUG, "_CUTWiFiManagerClientNotificationCallback", v1, 2u);
}

void sub_1A3565144()
{
  sub_1A35618D8();
  sub_1A355C1FC(&dword_1A3554000, v0, v1, "*** SCDynamicStoreCreate() failed", v2, v3, v4, v5, v6);
}

void sub_1A3565178()
{
  sub_1A35618D8();
  sub_1A355C1FC(&dword_1A3554000, v0, v1, "CUTWiFiManager showNetworkOptions has been called before initialization has completed - please check entitlements for WiFi access and otherwise file a radar on Purple Common Utilities!", v2, v3, v4, v5, v6);
}

void sub_1A35651AC()
{
}

void sub_1A35651D8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543619;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2081;
  *(void *)&v3[14] = a2;
  sub_1A3563E38(&dword_1A3554000, a2, a3, "File Conflict Error {cutCopier: %{public}@, path: %{private}s}", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void sub_1A3565250(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2082;
  *(void *)&v3[14] = a2;
  sub_1A3563E38(&dword_1A3554000, a2, a3, "Fatal Error {cutCopier: %{public}@, error: %{public}s}", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void sub_1A35652C8()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_fault_impl(&dword_1A3554000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Cannot retrieve runloop source for battery monitor.", v0, 2u);
}

void sub_1A3565310()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_fault_impl(&dword_1A3554000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Cannot listen to battery level change notification.", v0, 2u);
}

uint64_t BOMCopierCancelCopy()
{
  return MEMORY[0x1F410CFB8]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1F410CFE0]();
}

uint64_t BOMCopierSetCopyFileStartedHandler()
{
  return MEMORY[0x1F410CFF8]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x1F410D008]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x1F410D010]();
}

uint64_t BOMCopierSetFileConflictErrorHandler()
{
  return MEMORY[0x1F410D018]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x1F410D020]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1F410D028]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x1F410D030]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x1F40D8088](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40E8F20](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F78](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x1F4101D98](store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DF0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1F412FD90]();
}

uint64_t WiFiDeviceClientCopyCurrentNetworkAsync()
{
  return MEMORY[0x1F412FD98]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x1F412FDB0]();
}

uint64_t WiFiDeviceClientRegisterDeviceAvailableCallback()
{
  return MEMORY[0x1F412FDF8]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x1F412FE00]();
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback()
{
  return MEMORY[0x1F412FE08]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x1F412FE18]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1F412FE78]();
}

uint64_t WiFiManagerClientCopyEnabledNetworks()
{
  return MEMORY[0x1F412FE80]();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return MEMORY[0x1F412FE98]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientGetAskToJoinState()
{
  return MEMORY[0x1F412FEC0]();
}

uint64_t WiFiManagerClientGetMISState()
{
  return MEMORY[0x1F412FEC8]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x1F412FED0]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x1F412FED8]();
}

uint64_t WiFiManagerClientGetWoWCapability()
{
  return MEMORY[0x1F412FEE0]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1F412FEF0]();
}

uint64_t WiFiManagerClientRegisterNotificationCallback()
{
  return MEMORY[0x1F412FEF8]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1F412FF20]();
}

uint64_t WiFiManagerClientSetAssociationMode()
{
  return MEMORY[0x1F412FF28]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x1F412FF40]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1F412FFC8]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x1F412FFF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1F40D9428]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1F40D9440]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1F40DF0E0]();
}

uint64_t _CTServerConnectionDormancySuspendAssertionCreate()
{
  return MEMORY[0x1F40DF0F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1F4181538](cls, name);
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

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
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

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1F4181A78](a1, a2);
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

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1F4181AC0](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1F40CEBF8](connection);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1F40CEC18](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}