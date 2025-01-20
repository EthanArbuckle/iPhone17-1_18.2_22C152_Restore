void sub_1DD47DAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DD47E074(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  v9 = _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = [v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)[[NSString alloc] initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    if (v16)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_13;
      }
      v27 = v21;
      id v28 = v16;
      uint64_t v26 = a2;
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_13;
      }
      uint64_t v26 = a2;
      v27 = v21;
    }
    MOLogWrite();
LABEL_13:
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v22 = objc_msgSend(NSString, "stringWithUTF8String:", a1, v26, v27, v28);
  [v20 setObject:v22 forKeyedSubscript:@"FunctionName"];

  v23 = [NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:@"SourceFileLine"];

  v24 = [MEMORY[0x1E4F28C58] errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

uint64_t ACXBooleanValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

id _ACXValidateObject(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_1DD481F70(_Unwind_Exception *a1)
{
}

void _FetchLocalizedKeys(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v24 = v5;
  uint64_t Unique = _CFBundleCreateUnique();
  if (Unique)
  {
    v9 = (__CFBundle *)Unique;
    FilteredInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist();
    if (FilteredInfoPlist)
    {
      v11 = FilteredInfoPlist;
      v12 = _RemoveUnfilteredKeys(FilteredInfoPlist, v7);

      _MergeLocalizedKeysForLocale(v6, v12, &stru_1F38AAC80);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      CFArrayRef v13 = CFBundleCopyBundleLocalizations(v9);
      uint64_t v14 = [(__CFArray *)v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t FilteredLocalizedInfoPlist = _CFBundleCreateFilteredLocalizedInfoPlist();
            if (FilteredLocalizedInfoPlist)
            {
              v20 = (void *)FilteredLocalizedInfoPlist;

              v12 = _RemoveUnfilteredKeys(v20, v7);

              _MergeLocalizedKeysForLocale(v6, v12, v18);
            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v21 = objc_msgSend(v24, "path", v21);
              MOLogWrite();
            }
          }
          uint64_t v15 = [(__CFArray *)v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v15);
      }
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v23 = [v24 path];
        MOLogWrite();
      }
      v12 = 0;
    }
    CFRelease(v9);
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v22 = [v5 path];
    MOLogWrite();
  }
}

id _RemoveUnfilteredKeys(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v3, "objectForKeyedSubscript:", v11, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  CFArrayRef v13 = (void *)[v5 copy];

  return v13;
}

void _MergeLocalizedKeysForLocale(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___MergeLocalizedKeysForLocale_block_invoke;
  v9[3] = &unk_1E6CC7020;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v9];
}

void sub_1DD484E70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD485034(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ACXShowUserNoticeWithTapToRadarButton(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __ACXShowUserNoticeWithTapToRadarButton_block_invoke;
  v15[3] = &unk_1E6CC7070;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  ACXAsyncTransaction(MEMORY[0x1E4F14428], v15);
}

void ACXAsyncTransaction(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __ACXAsyncTransaction_block_invoke;
  v8[3] = &unk_1E6CC70C0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __ACXShowUserNoticeWithTapToRadarButton_block_invoke(uint64_t a1)
{
  CFOptionFlags v20 = 0;
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), @"File A Bug", @"No Thanks", 0, &v20);
  if (!v20)
  {
    id v2 = *(void **)(a1 + 56);
    id v3 = *(id *)(a1 + 48);
    id v4 = v2;
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v5 setScheme:@"tap-to-radar"];
    [v5 setHost:@"new"];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"AppConduit"];
    [v6 addObject:v7];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"all"];
    [v6 addObject:v8];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"660691"];
    [v6 addObject:v9];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Serious Bug"];
    [v6 addObject:v10];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v6 addObject:v11];

    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"AutoDiagnostics" value:@"phone,watch"];
    [v6 addObject:v12];

    if (v3 && [v3 length])
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:v3];
      [v6 addObject:v13];
    }
    if (v4)
    {
      if ([v4 length])
      {
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Description" value:v4];
        [v6 addObject:v14];
      }
    }
    [v5 setQueryItems:v6];
    long long v15 = [v5 URL];

    id v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __ACXShowUserNoticeWithTapToRadarButton_block_invoke_2;
    v18[3] = &unk_1E6CC7048;
    id v19 = v15;
    id v17 = v15;
    [v16 openURL:v17 configuration:0 completionHandler:v18];
  }
}

void __ACXShowUserNoticeWithTapToRadarButton_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (v4 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
    MOLogWrite();
  }
}

id ACXStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = [NSString stringWithFormat:@"%@", v1];
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t ACXArrayContainsOnlyClass(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

id ACXArrayifyThing(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (ACXArrayContainsOnlyClass(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        id v2 = [MEMORY[0x1E4F1C978] arrayWithObject:v1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v1 allObjects];
        if (ACXArrayContainsOnlyClass(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

BOOL ACXDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __ACXDictionaryContainsOnlyClasses_block_invoke;
    v9[3] = &unk_1E6CC7098;
    void v9[4] = &v10;
    v9[5] = a2;
    v9[6] = a3;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void sub_1DD485A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __ACXDictionaryContainsOnlyClasses_block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id ACXGetPOSIXError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = *MEMORY[0x1E4F28798];
  uint64_t v3 = *MEMORY[0x1E4F28A50];
  uint64_t v4 = v1;
  do
  {
    if (!v4) {
      break;
    }
    id v5 = [v4 domain];
    char v6 = [v5 isEqualToString:v2];

    if (v6) {
      break;
    }
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:v3];

    uint64_t v4 = (void *)v8;
  }
  while (v8);

  return v4;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = (objc_class *)NSString;
  id v15 = a3;
  if (v13)
  {
    uint64_t v16 = [[v14 alloc] initWithFormat:v13 arguments:&a9];
  }
  else
  {
    uint64_t v16 = [(objc_class *)v14 stringWithUTF8String:strerror(a4)];
  }
  id v17 = (void *)v16;
  id v18 = objc_msgSend(NSString, "stringWithUTF8String:", a1, &a9);
  v23[0] = *MEMORY[0x1E4F28568];
  v23[1] = @"FunctionName";
  v24[0] = v17;
  v24[1] = v18;
  v23[2] = @"SourceFileLine";
  id v19 = [NSNumber numberWithInt:a2];
  v24[2] = v19;
  CFOptionFlags v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  v21 = [MEMORY[0x1E4F28C58] errorWithDomain:a3 code:a4 userInfo:v20];

  return v21;
}

uint64_t ACXCopyStagingDirectoryPath()
{
  return [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/tmp/com.apple.AppConduit.staging" isDirectory:1];
}

id ACXCopyStagingDirectory(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/tmp/com.apple.AppConduit.staging" isDirectory:1];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  char v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v7 = [v2 path];
      MOLogWrite();
    }
    uint64_t v2 = 0;
    if (a1) {
      *a1 = v5;
    }
  }

  return v2;
}

id ACXCopyLogDirectory()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v1 = [v0 URLsForDirectory:5 inDomains:1];

  uint64_t v2 = [v1 objectAtIndexedSubscript:0];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Logs/AppConduit" isDirectory:1];

  char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  char v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
    MOLogWrite();
  }

  return v3;
}

void ACXInitializeDiskLogging()
{
  ACXCopyLogDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v2 URLByAppendingPathComponent:@"AppConduit.log" isDirectory:0];
  gLogHandle = MOLogOpen();
  if (!gLogHandle) {
    syslog(3, "Failed to set up rotating logs at path %s", (const char *)[v0 fileSystemRepresentation]);
  }
  if (ACXIsInternalBuild_onceToken != -1) {
    dispatch_once(&ACXIsInternalBuild_onceToken, &__block_literal_global_0);
  }
  id v1 = v0;
  [v1 fileSystemRepresentation];
  MOLogEnableDiskLogging();
}

uint64_t ACXIsInternalBuild()
{
  if (ACXIsInternalBuild_onceToken != -1) {
    dispatch_once(&ACXIsInternalBuild_onceToken, &__block_literal_global_0);
  }
  return ACXIsInternalBuild_result;
}

id ACXCopyDataDirectory()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v1 = [v0 URLsForDirectory:5 inDomains:1];

  id v2 = [v1 objectAtIndexedSubscript:0];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"AppConduit" isDirectory:1];

  return v3;
}

id ACXCopyPairingStoreSubdirectoryInBase(void *a1)
{
  if (!a1)
  {
    id v1 = 0;
    goto LABEL_12;
  }
  id v1 = [a1 URLByAppendingPathComponent:@"AppConduit" isDirectory:1];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v3 = [v2 createDirectoryAtURL:v1 withIntermediateDirectories:0 attributes:0 error:&v9];
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    char v5 = [v4 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 516) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v8 = [v1 path];
      MOLogWrite();
    }
  }
LABEL_11:

LABEL_12:

  return v1;
}

id ACXRandomDirWithTemplateURL(void *a1, void *a2)
{
  char v3 = strdup((const char *)[a1 fileSystemRepresentation]);
  if (mkdtemp(v3))
  {
    id v4 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = __error();
    uint64_t v10 = *v6;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      strerror(*v6);
      MOLogWrite();
    }
    long long v11 = _CreateError((uint64_t)"ACXRandomDirWithTemplateURL", 374, (void *)*MEMORY[0x1E4F28798], v10, @"mkdtemp failed for %s", v7, v8, v9, (uint64_t)v3);
    id v5 = v11;
    if (a2)
    {
      id v5 = v11;
      id v4 = 0;
      *a2 = v5;
    }
    else
    {
      id v4 = 0;
    }
  }
  free(v3);

  return v4;
}

id ACXLoadInfoPlist(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  pthread_mutex_lock(&ACXLoadInfoPlist_cfBundleIsNotThreadSafe);
  uint64_t Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    uint64_t v6 = Unique;
    if (v4)
    {
      uint64_t FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
      if (FilteredInfoPlist)
      {
        uint64_t v8 = (const void *)FilteredInfoPlist;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v8))
        {
          uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
          CFRelease(v8);
          long long v11 = [MEMORY[0x1E4F1CA20] currentLocale];
          [v11 localeIdentifier];
          uint64_t FilteredLocalizedInfoPlist = (const void *)_CFBundleCreateFilteredLocalizedInfoPlist();

          if (FilteredLocalizedInfoPlist)
          {
            CFTypeID v13 = CFDictionaryGetTypeID();
            if (v13 == CFGetTypeID(FilteredLocalizedInfoPlist))
            {
              [v10 addEntriesFromDictionary:FilteredLocalizedInfoPlist];
            }
            else
            {
              CFTypeID v19 = CFGetTypeID(FilteredLocalizedInfoPlist);
              CFStringRef v20 = CFCopyTypeIDDescription(v19);
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
                MOLogWrite();
              }
              if (v20) {
                CFRelease(v20);
              }
            }
            CFRelease(FilteredLocalizedInfoPlist);
          }
          else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            MOLogWrite();
          }
          goto LABEL_28;
        }
        CFTypeID v16 = CFGetTypeID(v8);
        CFStringRef v17 = CFCopyTypeIDDescription(v16);
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
          MOLogWrite();
        }
        if (v17) {
          CFRelease(v17);
        }
        CFRelease(v8);
LABEL_27:
        uint64_t v10 = 0;
LABEL_28:
        CFRelease(v6);
        goto LABEL_29;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_27;
      }
    }
    else
    {
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(Unique);
      if (InfoDictionary)
      {
        id v15 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:InfoDictionary];
        uint64_t v10 = v15;
        if (v15) {
          [v15 removeObjectForKey:@"CFBundleInfoPlistURL"];
        }
        goto LABEL_28;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_27;
      }
    }
    MOLogWrite();
    goto LABEL_27;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v10 = 0;
LABEL_29:
  pthread_mutex_unlock(&ACXLoadInfoPlist_cfBundleIsNotThreadSafe);

  return v10;
}

uint64_t ACXYOrN(int a1)
{
  if (a1) {
    return 89;
  }
  else {
    return 78;
  }
}

void __ACXAsyncTransaction_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E01B69E0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void ACXUntrustedAppTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  uint64_t v6 = _LocalizedStringForSystemLanguage(@"ACXErrorUntrustedAppTitle");
  id v13 = 0;
  uint64_t v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    uint64_t v9 = _LocalizedStringForSystemLanguage(@"ACXErrorUntrustedAppMessage");
    id v12 = 0;
    uint64_t v10 = [NSString stringWithValidatedFormat:v9, @"%@ %@", &v12, v5, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

id _LocalizedStringForSystemLanguage(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/AppConduit.framework"];
  id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v4 = [v3 firstObject];
  id v5 = v1;
  id v6 = v2;
  id v7 = v4;
  CFTypeID v19 = v3;
  if (![v5 length] || !objc_msgSend(@"Localizable", "length") || !objc_msgSend(v7, "length"))
  {
    id v13 = 0;
    id v11 = 0;
    CFArrayRef v10 = 0;
    CFArrayRef v9 = 0;
    CFArrayRef v8 = 0;
LABEL_9:
    id v12 = 0;
LABEL_10:
    id v14 = [v6 localizedStringForKey:v5 value:&stru_1F38AAC80 table:@"Localizable"];
    goto LABEL_11;
  }
  CFArrayRef v8 = [v6 localizations];
  CFArrayRef v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
  CFArrayRef v10 = CFBundleCopyLocalizationsForPreferences(v8, v9);
  if (![(__CFArray *)v10 count])
  {
    id v13 = 0;
    id v11 = 0;
    goto LABEL_9;
  }
  id v11 = [(__CFArray *)v10 objectAtIndex:0];
  id v12 = [v6 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v11];
  if (!v12)
  {
    id v13 = 0;
    goto LABEL_10;
  }
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v12];
  id v14 = [v13 objectForKey:v5];
  if (!v14) {
    goto LABEL_10;
  }
LABEL_11:

  id v15 = v14;
  if (!v14)
  {
    if (!gLogHandle || (id v15 = v5, *(int *)(gLogHandle + 44) >= 3))
    {
      CFTypeID v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v16 fileExistsAtPath:@"/System/Library/PrivateFrameworks/AppConduit.framework"];
      MOLogWrite();

      id v15 = v5;
    }
  }
  id v17 = v15;

  return v17;
}

void ACXLowDiskSpaceTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorCannotDownloadTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = _LocalizedStringForSystemLanguage(@"ACXErrorCannotDownloadMessage");
    id v12 = 0;
    CFArrayRef v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

void *ACXInstallationUnavailableTitleAndMessage(void *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    _LocalizedStringForSystemLanguage(@"ACXErrorInstallationUnavailableTitle");
    result = (id)objc_claimAutoreleasedReturnValue();
    *id v3 = result;
  }
  if (a2)
  {
    _LocalizedStringForSystemLanguage(@"ACXErrorInstallationUnavailableMessage");
    result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }
  return result;
}

void ACXCapabilitiesMismatchTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorApplicationNotCompatibleTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = _LocalizedStringForSystemLanguage(@"ACXErrorApplicationNotCompatibleMessage");
    id v12 = 0;
    CFArrayRef v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

void ACXAppNotAllowedTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorApplicationNotAllowedTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = _LocalizedStringForSystemLanguage(@"ACXErrorApplicationNotAllowedMessage");
    id v12 = 0;
    CFArrayRef v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

void ACXRuntimeNotSupportedTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorApplicationRuntimeNotSupportedTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = _LocalizedStringForSystemLanguage(@"ACXErrorApplicationRuntimeNotSupportedMessage");
    id v12 = 0;
    CFArrayRef v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

void ACXArchitectureNotSupportedTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorArchitectureNotSupportedTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = _LocalizedStringForSystemLanguage(@"ACXErrorArchitectureNotSupportedMessage");
    id v12 = 0;
    CFArrayRef v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

void ACXDeviceNotReachableDuringInstallTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2) {
    goto LABEL_4;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXCannotInstallGenericTitle");
  id v10 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v10, v5 validFormatSpecifiers error];
  id v8 = v10;
  if (v7)
  {
    id v9 = v7;
    *a2 = v9;

LABEL_4:
    _ACXDeviceNotReachableMessage(a3);
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

LABEL_8:
}

void _ACXDeviceNotReachableMessage(void *a1)
{
  if (a1)
  {
    int v2 = MGGetBoolAnswer();
    id v3 = @"WIFI";
    if (v2) {
      id v3 = @"WLAN";
    }
    id v4 = [NSString stringWithFormat:@"%@_ACXDeviceNotReachableMessage", v3];
    id v5 = _LocalizedStringForSystemLanguage(v4);

    id v6 = v5;
    *a1 = v6;
  }
}

void ACXDeviceNotReachableDuringUninstallTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2) {
    goto LABEL_4;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXCannotUninstallGenericTitle");
  id v10 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v10, v5 validFormatSpecifiers error];
  id v8 = v10;
  if (v7)
  {
    id v9 = v7;
    *a2 = v9;

LABEL_4:
    _ACXDeviceNotReachableMessage(a3);
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

LABEL_8:
}

void ACXDeviceNotReachableGenericTitleAndMessage(void *a1, void *a2)
{
  if (a1)
  {
    _LocalizedStringForSystemLanguage(@"ACXDeviceNotReachableMessageGenericTitle");
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }

  _ACXDeviceNotReachableMessage(a2);
}

void ACXInstallRestrictedTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorInstallRestrictedTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    id v9 = _LocalizedStringForSystemLanguage(@"ACXErrorInstallRestrictedMessage");
    id v12 = 0;
    id v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

void ACXRemovalRestrictedTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorRemovalRestrictedTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    id v9 = _LocalizedStringForSystemLanguage(@"ACXErrorRemovalRestrictedMessage");
    id v12 = 0;
    id v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

void ACXNotEligibleForWatchAppInstallTitleAndMessage(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = _LocalizedStringForSystemLanguage(@"ACXErrorNotEligibleForWatchAppInstallTitle");
  id v13 = 0;
  id v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    id v9 = _LocalizedStringForSystemLanguage(@"ACXErrorNotEligibleForWatchAppInstallMessage");
    id v12 = 0;
    id v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }
  }
LABEL_15:
}

uint64_t __ACXIsInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  ACXIsInternalBuild_uint64_t result = result;
  return result;
}

id ACXWatchKitAppExecutableHash(void *a1)
{
  id v1 = a1;
  int v2 = MobileInstallationCopyAppMetadata();
  id v3 = 0;
  if (v2)
  {
    id v4 = [v2 watchKitAppExecutableHash];
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v4 = 0;
  }

  return v4;
}

BOOL ACXObjectsAreTheSameOrSameNullness(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  id v5 = (void *)v4;
  BOOL v6 = !(v3 | v4) || v3 && v4 && ([(id)v3 isEqual:v4] & 1) != 0;

  return v6;
}

BOOL ACXObjectsAreDifferentOrDifferentNullness(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 == 0) == (v4 != 0) || v3 && v4 && ![v3 isEqual:v4];

  return v6;
}

id ACXCopySentinelFileURLForTestingMode()
{
  v0 = ACXCopyDataDirectory();
  id v1 = [v0 URLByAppendingPathComponent:@"TestingModeEnabled" isDirectory:0];

  return v1;
}

id ApplicationRecordFromApplicationProxy(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 bundleIdentifier];
  id v5 = [v3 correspondingApplicationRecord];

  id v10 = 0;
  BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F223C8]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, objc_msgSend(v5, "isPlaceholder"), &v10);
  id v7 = v10;
  id v8 = v7;
  if (a2 && !v6) {
    *a2 = v7;
  }

  return v6;
}

id ACXCopyDuplicatedClassInfo(void *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unsigned int outCount = 0;
  int v2 = objc_copyClassList(&outCount);
  uint64_t v3 = outCount;
  id v4 = v1;
  id v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:770];
  BOOL v6 = objc_opt_new();
  if (v3)
  {
    id v7 = (id *)v2;
    while (1)
    {
      id v8 = (void *)MEMORY[0x1E01B69E0]();
      if (!*v7) {
        break;
      }
      ClassName = object_getClassName(*v7);
      id v10 = _StringFromClassName(ClassName);
      if (([v4 containsObject:v10] & 1) == 0)
      {
        if (NSHashGet(v5, ClassName)) {
          [v6 addObject:v10];
        }
        else {
          NSHashInsertKnownAbsent(v5, ClassName);
        }
      }

      ++v7;
      if (!--v3) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:
  id v11 = (void *)[v6 copy];

  if ([v11 count])
  {
    id v12 = objc_opt_new();
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        id v14 = v2[i];
        if (!v14) {
          break;
        }
        id v15 = object_getClassName(v2[i]);
        CFTypeID v16 = _StringFromClassName(v15);
        if ([v11 containsObject:v16])
        {
          id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%p: %s", v14, class_getImageName(v14));
          id v18 = [v12 objectForKeyedSubscript:v16];
          if (v18)
          {
            CFTypeID v19 = v18;
            [v18 addObject:v17];
          }
          else
          {
            CFTypeID v19 = objc_opt_new();
            [v19 addObject:v17];
            [v12 setObject:v19 forKeyedSubscript:v16];
          }
        }
      }
    }
    uint64_t v30 = v2;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    CFStringRef v20 = [v12 allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          long long v26 = [v12 objectForKeyedSubscript:v25];
          long long v27 = (void *)[v26 copy];
          [v12 setObject:v27 forKeyedSubscript:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v22);
    }

    long long v28 = (void *)[v12 copy];
    int v2 = v30;
  }
  else
  {
    long long v28 = (void *)MEMORY[0x1E4F1CC08];
  }
  free(v2);

  return v28;
}

id _StringFromClassName(const char *a1)
{
  id v1 = (void *)[[NSString alloc] initWithBytesNoCopy:a1 length:strlen(a1) encoding:4 freeWhenDone:0];

  return v1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1DD48B940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1DD48BEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DD48E658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD48EA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD48F0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD48F8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD48FF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD49049C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD490CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DD491280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1DD4917DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD491C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD49218C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD492684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD492A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD492E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD493290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1DD493850(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 96), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__155(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__156(uint64_t a1)
{
}

void sub_1DD49434C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v13);
  _Unwind_Resume(a1);
}

void sub_1DD494DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD49545C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD495AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD495F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1DD496610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD496A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD496F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DD497338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DD497690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD497C60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 96), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD498744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD498CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1DD498FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD4991EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD499498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD499880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DD499BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t rosetta_is_current_process_translated()
{
  return 0;
}

uint64_t parse_macho_iterate_slices(const char *a1, uint64_t a2)
{
  int v4 = open(a1, 256);
  if (v4 < 0)
  {
    id v8 = __error();
    uint64_t v9 = strerror(*v8);
    syslog(3, "Failed to open macho file at %s for reading: %s", a1, v9);
    return 0;
  }
  else
  {
    int v5 = v4;
    uint64_t v6 = parse_macho_iterate_slices_fd(v4, (uint64_t)a1, a2);
    close(v5);
    return v6;
  }
}

uint64_t parse_macho_iterate_slices_fd(int a1, uint64_t a2, uint64_t a3)
{
  __buf[0] = 0;
  memset(&v24, 0, sizeof(v24));
  if (fstat(a1, &v24))
  {
    int v5 = __error();
    strerror(*v5);
    syslog(3, "Failed to stat %s : %s");
    return 0;
  }
  if (v24.st_size <= 8)
  {
    syslog(3, "File at %s is not a valid mach-o (too small to contain a valid header)");
    return 0;
  }
  *__error() = 0;
  if (pread(a1, __buf, 4uLL, 0) != 4)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    syslog(3, "Failed to read magic from %s : %s");
    return 0;
  }
  if (__buf[0] <= -805638659)
  {
    if (__buf[0] != -1095041334 && __buf[0] != -889275714)
    {
      int v6 = -822415874;
      goto LABEL_15;
    }
    fat_header fat_header = 0;
    *__error() = 0;
    if (pread(a1, &fat_header, 8uLL, 0) == 8)
    {
      uint32_t magic = fat_header.magic;
      if (fat_header.magic == -1095041334)
      {
        swap_fat_header(&fat_header, NX_LittleEndian);
        uint32_t magic = fat_header.magic;
      }
      syslog(7, "Got fat header with magic 0x%08x and %u archs", magic, fat_header.nfat_arch);
      if (fat_header.nfat_arch < 0x401)
      {
        size_t v15 = 20 * fat_header.nfat_arch;
        if (v24.st_size > (uint64_t)(v15 + 8))
        {
          uint64_t v14 = (fat_arch *)malloc_type_malloc(20 * fat_header.nfat_arch, 0x50FF23B5uLL);
          if (v15 == pread(a1, v14, v15, 8))
          {
            swap_fat_arch(v14, fat_header.nfat_arch, NX_LittleEndian);
            if (!fat_header.nfat_arch)
            {
LABEL_37:
              uint64_t v8 = 1;
              if (!v14) {
                return v8;
              }
              goto LABEL_28;
            }
            uint64_t v16 = 0;
            uint64_t v17 = v14;
            while (1)
            {
              syslog(7, "Evaluating fat slice with cputype %d; subtype %d; offset %u; size %u; align %u",
                v17->cputype,
                v17->cpusubtype,
                v17->offset,
                v17->size,
                v17->align);
              off_t offset = v17->offset;
              if (v24.st_size <= offset)
              {
                syslog(3, "Fat arch %u in %s specifies offset which is beyond the end of the file");
                goto LABEL_27;
              }
              macho_header_and_load_commands = _read_macho_header_and_load_commands(a1, offset, v24.st_size);
              if (!macho_header_and_load_commands) {
                break;
              }
              CFStringRef v20 = macho_header_and_load_commands;
              char v21 = (*(uint64_t (**)(uint64_t, fat_arch *, char *))(a3 + 16))(a3, v17, macho_header_and_load_commands);
              free(v20);
              if (++v16 < (unint64_t)fat_header.nfat_arch)
              {
                ++v17;
                if (v21) {
                  continue;
                }
              }
              goto LABEL_37;
            }
            syslog(3, "Failed to read macho header and load commands in %s at %u");
          }
          else
          {
            uint64_t v22 = __error();
            strerror(*v22);
            syslog(3, "Failed to read fat archs from %s : %s");
          }
LABEL_27:
          uint64_t v8 = 0;
          if (!v14) {
            return v8;
          }
LABEL_28:
          free(v14);
          return v8;
        }
        syslog(3, "File is not large enough to contain %u fat arch headers and their referenced slices.");
      }
      else
      {
        syslog(3, "Number of fat archs %u exceeds the maximum %u");
      }
    }
    else
    {
      uint64_t v13 = __error();
      strerror(*v13);
      syslog(3, "Failed to read fat header of %s : %s");
    }
    uint64_t v14 = 0;
    goto LABEL_27;
  }
  if ((__buf[0] + 17958194) >= 2)
  {
    int v6 = -805638658;
LABEL_15:
    if (__buf[0] != v6)
    {
      syslog(3, "Unknown binary with magic 0x%08x at %s");
      return 0;
    }
  }
  id v10 = _read_macho_header_and_load_commands(a1, 0, v24.st_size);
  if (v10)
  {
    uint64_t v11 = v10;
    (*(void (**)(uint64_t, void, char *))(a3 + 16))(a3, 0, v10);
    free(v11);
    return 1;
  }
  syslog(3, "Failed to read macho header and load commands in %s at %u");
  return 0;
}

char *_read_macho_header_and_load_commands(int a1, off_t a2, uint64_t a3)
{
  long long __buf = 0u;
  long long v19 = 0u;
  ssize_t v6 = pread(a1, &__buf, 0x20uLL, a2);
  if (v6 < 0)
  {
    uint64_t v9 = __error();
    strerror(*v9);
    syslog(3, "Failed to read mach header at offset %lld : %s");
LABEL_26:
    uint64_t v13 = 0;
    goto LABEL_27;
  }
  if (v6 != 28 && v6 != 32)
  {
    syslog(3, "Expected to read at least sizeof(struct mach_header) but only got %zd bytes");
    goto LABEL_26;
  }
  unsigned int v8 = v19;
  unsigned int v7 = DWORD1(v19);
  if ((int)__buf > -17958195)
  {
    if (__buf != -17958194)
    {
      if (__buf == -17958193) {
        goto LABEL_12;
      }
LABEL_23:
      syslog(3, "Unknown magic in macho header at offset %llu: 0x%08x");
      goto LABEL_26;
    }
LABEL_15:
    size_t v10 = 28;
    goto LABEL_16;
  }
  if (__buf == -822415874)
  {
    unsigned int v7 = bswap32(DWORD1(v19));
    unsigned int v8 = bswap32(v19);
    goto LABEL_15;
  }
  if (__buf != -805638658) {
    goto LABEL_23;
  }
  unsigned int v7 = bswap32(DWORD1(v19));
  unsigned int v8 = bswap32(v19);
LABEL_12:
  if (v6 != 32)
  {
    syslog(3, "Got 64-bit magic but didn't read size of 64-bit mach header");
    goto LABEL_26;
  }
  size_t v10 = 32;
LABEL_16:
  size_t v11 = v7;
  if (8 * (unint64_t)v8 > v7)
  {
    syslog(3, "Space required for total size of load commands (%llu) is greater than indicated size of commands (%u).");
    goto LABEL_26;
  }
  if ((uint64_t)(v10 + v7 + a2) >= a3)
  {
    syslog(3, "File is not large enough to contain commands with length %u");
    goto LABEL_26;
  }
  id v12 = (char *)malloc_type_malloc(v10 + v7, 0xD7630F4AuLL);
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v16 = __error();
    strerror(*v16);
    syslog(3, "Failed to allocate %llu bytes: %s");
    goto LABEL_27;
  }
  memcpy(v12, &__buf, v10);
  ssize_t v14 = pread(a1, &v13[v10], v11, v10 + a2);
  if (v14 < 0)
  {
    uint64_t v17 = __error();
    strerror(*v17);
    syslog(3, "Failed to read %u bytes at offset %lld : %s");
    goto LABEL_27;
  }
  if (v14 != v11)
  {
    syslog(3, "Expected to read %u bytes of commands but only got %zd bytes");
LABEL_27:
    free(v13);
    return 0;
  }
  return v13;
}

uint64_t get_highest_sdk_version_for_any_slice(const char *a1)
{
  uint64_t v5 = 0;
  ssize_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = __get_highest_sdk_version_for_any_slice_block_invoke;
  v4[3] = &unk_1E6CC76F8;
  v4[4] = &v5;
  v4[5] = a1;
  if (parse_macho_iterate_slices(a1, (uint64_t)v4))
  {
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    syslog(3, "Failed to iterate macho file at %s", a1);
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  dyld_get_image_versions();
  int v2 = *((_DWORD *)v7 + 6);
  if (!v2)
  {
    syslog(3, "Failed to get SDK version from slice in %s", *(const char **)(a1 + 40));
    int v2 = *((_DWORD *)v7 + 6);
  }
  syslog(7, "Slice had version 0x%08x", v2);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3 > *(_DWORD *)(v4 + 24)) {
    *(_DWORD *)(v4 + 24) = v3;
  }
  _Block_object_dispose(&v6, 8);
  return 1;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

BOOL parse_macho_is_cpu_type_runnable_for_apps(int a1, int a2, char *a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    syslog(3, "Error: Argument pointer must not be null");
    int v12 = 13;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 13);
    BOOL v9 = 0;
    if (!a4) {
      return v9;
    }
    goto LABEL_12;
  }
  v17[0] = a1;
  v17[1] = a2;
  int v16 = 0;
  size_t v15 = 4;
  int v8 = sysctlbyname("kern.grade_cputype", &v16, &v15, v17, 8uLL);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    size_t v10 = __error();
    size_t v11 = strerror(*v10);
    syslog(3, "Error calling kern.grade_cputype for CPU type 0x%x and subtype 0x%x: %s", a1, a2, v11);
    int v12 = 12;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 12);
    char v13 = 0;
  }
  else if (v16 >= 1 && a1 == 16777228 && (a2 & 0xFFFFFFu) <= 2)
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are runnable", 16777228, a2);
    int v12 = 0;
    char v13 = 1;
  }
  else
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are not runnable", a1, a2);
    int v12 = 0;
    char v13 = 0;
  }
  *a3 = v13;
  if (a4) {
LABEL_12:
  }
    *a4 = v12;
  return v9;
}

BOOL parse_macho_is_file_runnable_for_apps(const char *a1, unsigned char *a2, _DWORD *a3)
{
  int v33 = 0;
  char v32 = 0;
  memset(&v31, 0, sizeof(v31));
  int v30 = 0;
  if (!a1)
  {
    int v33 = 1;
    syslog(3, "Input path is NULL");
    goto LABEL_58;
  }
  if (!a2)
  {
    int v33 = 13;
    syslog(3, "Error: Argument pointer must not be null");
    goto LABEL_60;
  }
  int v6 = open(a1, 256);
  if (v6 != -1)
  {
    int v7 = v6;
    if (fstat(v6, &v31) == -1)
    {
      int v12 = *__error();
      int v33 = 3;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v12);
      BOOL v9 = "Can't stat input file %s: %s";
      goto LABEL_54;
    }
    unint64_t st_size = v31.st_size;
    if (read(v7, &v30, 4uLL) != 4)
    {
      int v13 = *__error();
      int v33 = 5;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v13);
      BOOL v9 = "Failed to read header for file %s: %s";
      goto LABEL_54;
    }
    if (lseek(v7, 0, 0) == -1)
    {
      int v14 = *__error();
      int v33 = 4;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v14);
      BOOL v9 = "Can't seek input file %s: %s";
      goto LABEL_54;
    }
    if (st_size >= 8 && v30 == -1095041334)
    {
      *(void *)&fat_header.uint32_t magic = 0;
      if (read(v7, &fat_header, 8uLL) != 8)
      {
        int v16 = *__error();
        int v33 = 5;
        cputype = (char *)a1;
        uint64_t cpusubtype = (uint64_t)strerror(v16);
        BOOL v9 = "Failed to read fat header from input file %s: %s";
        goto LABEL_54;
      }
      swap_fat_header((fat_header *)&fat_header, NX_LittleEndian);
      if (fat_header.cputype >= 0x401u)
      {
        int v33 = 7;
        cputype = (char *)fat_header.cputype;
        uint64_t cpusubtype = 1024;
        BOOL v9 = "Number of fat archs %u exceeds the maximum %u";
LABEL_54:
        int v15 = 3;
        goto LABEL_55;
      }
      size_t v17 = 20 * fat_header.cputype;
      if (v17 + 8 > st_size)
      {
        int v33 = 8;
        cputype = (char *)a1;
        BOOL v9 = "Malformed fat file: %s";
        goto LABEL_54;
      }
      long long v19 = (fat_arch *)malloc_type_malloc(v17, 0x360B8367uLL);
      if (v19)
      {
        if (v17 == read(v7, v19, v17))
        {
          swap_fat_arch(v19, fat_header.cputype, NX_LittleEndian);
          if (fat_header.cputype)
          {
            uint64_t v20 = 0;
            p_uint64_t cpusubtype = &v19->cpusubtype;
            while (parse_macho_is_cpu_type_runnable_for_apps(*(p_cpusubtype - 1), *p_cpusubtype, &v32, &v33))
            {
              if (v32) {
                goto LABEL_64;
              }
              p_cpusubtype += 5;
              if (++v20 >= (unint64_t)fat_header.cputype) {
                goto LABEL_65;
              }
            }
            uint64_t v23 = "Failed to check if cpu type is runnable";
          }
          else
          {
            if (v32)
            {
LABEL_64:
              syslog(7, "FAT matching_arch cpu_type: 0x%x cpu_subtype: 0x%x");
              goto LABEL_56;
            }
LABEL_65:
            cputype = (char *)a1;
            uint64_t v23 = "Failed to find matching arch for FAT input file %s";
          }
        }
        else
        {
          int v24 = *__error();
          int v33 = 6;
          cputype = (char *)a1;
          uint64_t cpusubtype = (uint64_t)strerror(v24);
          uint64_t v23 = "Failed to read fat arch(s) from input file %s: %s";
        }
      }
      else
      {
        int v22 = *__error();
        int v33 = 9;
        cputype = strerror(v22);
        uint64_t v23 = "Failed to allocate memory for fat arch(s): %s";
      }
      syslog(3, v23, cputype, cpusubtype);
LABEL_56:
      free(v19);
      if ((v7 & 0x80000000) == 0) {
        close(v7);
      }
LABEL_58:
      if (!a2) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }
    if (st_size >= 0x1C)
    {
      if (v30 == -17958194 || v30 == -822415874)
      {
        memset(&fat_header, 0, 28);
        if (read(v7, &fat_header, 0x1CuLL) == 28)
        {
          if (v30 == -822415874) {
            swap_mach_header((mach_header *)&fat_header, NX_LittleEndian);
          }
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 32-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "32-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
LABEL_27:
            int v15 = 7;
LABEL_55:
            syslog(v15, v9, cputype, cpusubtype);
            long long v19 = 0;
            goto LABEL_56;
          }
          goto LABEL_50;
        }
        goto LABEL_41;
      }
      if (st_size >= 0x20 && (v30 == -17958193 || v30 == -805638658))
      {
        memset(&fat_header, 0, sizeof(fat_header));
        if (read(v7, &fat_header, 0x20uLL) == 32)
        {
          if (v30 == -805638658) {
            swap_mach_header_64(&fat_header, NX_LittleEndian);
          }
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 64-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "64-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
            goto LABEL_27;
          }
LABEL_50:
          BOOL v9 = "Failed to check if cpu type is runnable";
          goto LABEL_54;
        }
LABEL_41:
        int v18 = *__error();
        int v33 = 5;
        cputype = (char *)a1;
        uint64_t cpusubtype = (uint64_t)strerror(v18);
        BOOL v9 = "Failed to read mach header from input file %s: %s";
        goto LABEL_54;
      }
    }
    int v33 = 10;
    cputype = (char *)a1;
    BOOL v9 = "Unknown binary format for input file %s.";
    goto LABEL_54;
  }
  int v10 = *__error();
  int v33 = 2;
  size_t v11 = strerror(v10);
  syslog(3, "Can't open input file %s: %s", a1, v11);
LABEL_59:
  *a2 = v32;
LABEL_60:
  int v25 = v33;
  if (a3) {
    *a3 = v33;
  }
  return v25 == 0;
}

void ACXUntrustedAppTitleAndMessage_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DD47C000, MEMORY[0x1E4F14500], v0, "Failed to validate %@ : %@", v1, v2, v3, v4, v5);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A48](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x1F4180DA0]();
}

uint64_t MISValidateSignature()
{
  return MEMORY[0x1F4180E30]();
}

uint64_t MOLogEnableDiskLogging()
{
  return MEMORY[0x1F412FD40]();
}

uint64_t MOLogOpen()
{
  return MEMORY[0x1F412FD48]();
}

uint64_t MOLogWrite()
{
  return MEMORY[0x1F412FD50]();
}

uint64_t MobileInstallationCopyAppMetadata()
{
  return MEMORY[0x1F412F8E8]();
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1F40E70E8](table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x1F40D8C20]();
}

uint64_t _CFBundleCreateFilteredLocalizedInfoPlist()
{
  return MEMORY[0x1F40D8C28]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x1F4181520](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1F40CBE20]();
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
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

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  return (Class *)MEMORY[0x1F4181698](outCount);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
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

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}