@interface DSNSHelperContext
- (BOOL)copyItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 conflictStrategy:(id)a6 receiveTargets:(id)a7 error:(id *)a8;
- (BOOL)copyRootMetadataAtURL:(id)a3 toDestinationURL:(id)a4 targetName:(id)a5 error:(id *)a6;
- (BOOL)createLockInDestinationURL:(id)a3 sourceURL:(id)a4 groupUUID:(id)a5 groupCount:(int64_t)a6 conflictStrategy:(id)a7 isDuplication:(BOOL)a8 clonedInstead:(BOOL *)a9 resultName:(id *)a10 error:(id *)a11;
- (BOOL)createLockNamed:(id)a3 destinationURL:(id)a4 sourceURL:(id)a5 groupUUID:(id)a6 isDuplication:(BOOL)a7 groupCount:(int64_t)a8 clonedInstead:(BOOL *)a9 error:(id *)a10;
- (BOOL)ensureFreeSpace:(int64_t)a3 onVolume:(id)a4 error:(id *)a5;
- (BOOL)launchDesktopServicesHelper:(id *)a3;
- (BOOL)preflightAndCloneIfPossible:(id)a3 toURL:(id)a4 groupUUID:(id)a5 sourceURLsToCopy:(id *)a6 isDuplication:(BOOL)a7 targetNames:(id *)a8 maxFileSize:(unint64_t *)a9 conflictStrategy:(id)a10 receiveTargets:(id)a11 error:(id *)a12;
- (BOOL)sizeURL:(id)a3 destinationURL:(id)a4 targetName:(id)a5 coordinate:(BOOL)a6 spaceNeeds:(DestinationSpaceNeeds *)a7 groupUUID:(id)a8 error:(id *)a9;
- (DSNSHelperContext)initWithOptions:(unsigned int)a3 delegate:(id)a4;
- (id)copyItemsAtURLs:(void *) toURL:options:conflictStrategy:receiveTargets:error:;
- (unint64_t)resolveConflictAtURL:(id)a3 withStrategy:(id)a4;
- (void)clearCopyStateForSources:(id)a3 destination:(id)a4 targetNames:(id)a5 groupUUID:(id)a6;
- (void)dealloc;
- (void)stopAccessingURLs:(id)a3;
@end

@implementation DSNSHelperContext

- (DSNSHelperContext)initWithOptions:(unsigned int)a3 delegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DSNSHelperContext;
  if ([(DSNSHelperContext *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  impl = self->impl;
  if (impl) {
    (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)DSNSHelperContext;
  [(DSNSHelperContext *)&v4 dealloc];
}

- (BOOL)launchDesktopServicesHelper:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v4 = TDSHelperContext::LaunchDesktopServicesHelper((TDSHelperContext *)self->impl, 0, 1);
  int v5 = v4;
  if (a3 && v4)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v7 = DSLocalizedErrorStringForKey(&cfstr_Helpercommunic.isa);
    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a3 = [v6 errorWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:v8];
  }
  return v5 == 0;
}

- (BOOL)createLockNamed:(id)a3 destinationURL:(id)a4 sourceURL:(id)a5 groupUUID:(id)a6 isDuplication:(BOOL)a7 groupCount:(int64_t)a8 clonedInstead:(BOOL *)a9 error:(id *)a10
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  if ([(DSNSHelperContext *)self launchDesktopServicesHelper:a10])
  {
    v29 = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    BOOL v28 = 0;
    v20 = (TCFURLInfo *)TDSHelperContext::FilesCopyChildCreateLock((uint64_t)self->impl, v17, v18, v16, v19, a8, 0, 0, a7, (const void **)&v29, &v28);
    int v21 = (int)v20;
    if (a9) {
      *a9 = v28;
    }
    BOOL v22 = v20 == 0;
    if (a10 && v20)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      TCFURLInfo::LocalizedCopyErrorMessage(v20, (const __CFURL *)v18, (TString *)&v27);
      v24 = v27;
      v31[0] = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      *a10 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:v21 userInfo:v25];

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v27);
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v29);
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (unint64_t)resolveConflictAtURL:(id)a3 withStrategy:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 type] != 1)
  {
    if (![v6 type])
    {
      unint64_t v7 = 2;
      goto LABEL_28;
    }
    if ([v6 type] == 4)
    {
      unint64_t v7 = 1;
      goto LABEL_28;
    }
    if ([v6 type] == 3)
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      CFUserNotificationRef v28 = 0;
      v29 = (const void **)&v28;
      uint64_t v30 = 0x2020000000;
      uint64_t v31 = 0;
      v9 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke;
      block[3] = &unk_1E698FEF8;
      id v10 = v6;
      id v24 = v10;
      id v25 = v5;
      v27 = (const void **)&v28;
      v11 = v8;
      v26 = v11;
      dispatch_async(v9, block);

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      v12 = v29[3];
      if (v12 == (const void *)1)
      {
        uint64_t v13 = 4;
      }
      else
      {
        if (v12 != (const void *)2)
        {
LABEL_26:
          unint64_t v7 = (unint64_t)v29[3];

          _Block_object_dispose(&v28, 8);
          goto LABEL_27;
        }
        uint64_t v13 = 0;
      }
      [v10 setType:v13];
      goto LABEL_26;
    }
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v14 = [v6 localizedAlertTitle];
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    v15 = [v6 localizedAlertMessageForSourceFileURL:v5];
    [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

    id v16 = [v6 localizedTitleForResolution:0];
    if ([v16 length]) {
      [v11 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
    }
    id v17 = [v6 localizedTitleForResolution:1];
    if ([v17 length]) {
      [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
    }
    id v18 = [v6 localizedTitleForResolution:2];
    if ([v18 length]) {
      [v11 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
    }
    SInt32 error = 0;
    CFUserNotificationRef v19 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v11);
    CFUserNotificationRef v28 = v19;
    if (error)
    {
      v20 = LogObj(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = error;
        _os_log_impl(&dword_1D343E000, v20, OS_LOG_TYPE_ERROR, "CFUserNotificationCreate failed with %d", buf, 8u);
      }
    }
    else
    {
      *(void *)buf = 0;
      if (!CFUserNotificationReceiveResponse(v19, 0.0, (CFOptionFlags *)buf))
      {
        if ((buf[0] & 3) == 2)
        {
          [v6 setType:0];
          unint64_t v7 = 2;
          goto LABEL_23;
        }
        if ((buf[0] & 3) == 1)
        {
          [v6 setType:4];
          unint64_t v7 = 1;
          goto LABEL_23;
        }
      }
    }
    unint64_t v7 = 0;
LABEL_23:
    TRef<__CFUserNotification *,TRetainReleasePolicy<__CFUserNotification *>>::~TRef((const void **)&v28);

LABEL_27:
    goto LABEL_28;
  }
  unint64_t v7 = 0;
LABEL_28:

  return v7;
}

void __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) conflictHandler];
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke_2;
  v6[3] = &unk_1E698FED0;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  ((void (**)(void, uint64_t, void *))v2)[2](v2, v3, v6);
}

intptr_t __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)createLockInDestinationURL:(id)a3 sourceURL:(id)a4 groupUUID:(id)a5 groupCount:(int64_t)a6 conflictStrategy:(id)a7 isDuplication:(BOOL)a8 clonedInstead:(BOOL *)a9 resultName:(id *)a10 error:(id *)a11
{
  BOOL v42 = a8;
  id v45 = a3;
  id v14 = a4;
  id v43 = a5;
  id v15 = a7;
  *a9 = 0;
  *a10 = 0;
  v49[0] = 0;
  id v36 = v15;
  id v39 = v14;
  BOOL v16 = [v15 type] == 0;
  id v17 = [v14 lastPathComponent];
  if (BRContainerClass() && objc_msgSend(v14, "br_isDocumentsContainer"))
  {
    TCFURLInfo::StringProperty((TCFURLInfo *)v14, (const __CFString *)*MEMORY[0x1E4F1D718], (TString *)&v48);
    if (CFStringGetLength(v48))
    {
      id v18 = v48;

      id v17 = v18;
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v48);
  }
  id v47 = &unk_1F2AC3818;
  unsigned int v37 = objc_msgSend(NSString, "ds_fileNameHasClaimedFileExtension:", v17) ^ 1;
  v38 = objc_msgSend(v17, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v47, 0);
  id v19 = v47;
  id v20 = v17;
  int v40 = 0;
  int v21 = 0;
  BOOL v22 = (void *)*MEMORY[0x1E4F28760];
  v35 = v20;
  while (1)
  {
    id v46 = v21;
    BOOL v23 = [(DSNSHelperContext *)self createLockNamed:v20 destinationURL:v45 sourceURL:v14 groupUUID:v43 isDuplication:v42 groupCount:a6 clonedInstead:v49 error:&v46];
    id v24 = v46;

    if (v23)
    {
      id v20 = v20;
      *a10 = v20;
      *a9 = v49[0];
      goto LABEL_37;
    }
    id v25 = [v24 domain];
    if (v25 != v22)
    {

LABEL_32:
      int v21 = v24;
      goto LABEL_34;
    }
    if ([v24 code] == -48)
    {
    }
    else
    {
      uint64_t v26 = [v24 code];

      if (v26 != -8011) {
        goto LABEL_32;
      }
    }
    if (v16) {
      goto LABEL_13;
    }
    CFUserNotificationRef v28 = [v45 URLByAppendingPathComponent:v20];
    unint64_t v30 = [(DSNSHelperContext *)self resolveConflictAtURL:v28 withStrategy:v36];
    switch(v30)
    {
      case 0uLL:
        [MEMORY[0x1E4F28C58] errorWithDomain:v22 code:-128 userInfo:0];
        int v29 = 0;
        uint64_t v31 = v24;
        id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

        BOOL v16 = 0;
        goto LABEL_26;
      case 1uLL:
        uint64_t v31 = [(id)objc_opt_class() wrapperWithURL:v28 readonly:0 error:0];
        if (v31)
        {
          int v32 = TDSHelperContext::FilesCopyDeleteItem((uint64_t)self->impl, v31, 2u, 1, 1);
          if (v32)
          {
            uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:v22 code:v32 userInfo:0];

            int v29 = 0;
            id v24 = (id)v33;
          }
          else
          {
            ++v40;
            int v29 = 1;
          }
        }
        else
        {
          int v29 = 0;
        }
        goto LABEL_25;
      case 2uLL:

LABEL_13:
        uint64_t v27 = objc_msgSend(v38, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v19, "integerValue"), v37);

        objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
        BOOL v16 = 1;
        CFUserNotificationRef v28 = v19;
        int v21 = v24;
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        int v29 = 1;
        id v20 = (id)v27;
        goto LABEL_27;
    }
    BOOL v16 = 0;
    int v29 = 0;
LABEL_26:
    int v21 = v24;
LABEL_27:

    if (!v29) {
      break;
    }
    id v14 = v39;
    if (v40 >= 2) {
      goto LABEL_34;
    }
  }
  id v14 = v39;
LABEL_34:
  if (a11)
  {
    id v24 = v21;
    *a11 = v24;
  }
  else
  {
    id v24 = v21;
  }
LABEL_37:

  return v23;
}

- (BOOL)copyRootMetadataAtURL:(id)a3 toDestinationURL:(id)a4 targetName:(id)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(DSNSHelperContext *)self launchDesktopServicesHelper:a6])
  {
    int v21 = 0;
    uint64_t v13 = (TCFURLInfo *)TDSHelperContext::FilesCopySetRootMetadata((uint64_t)self->impl, v10, v11, v12, 0x15u, &v21);
    int v14 = (int)v13;
    BOOL v15 = v13 == 0;
    if (a6 && v13)
    {
      BOOL v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      TCFURLInfo::LocalizedCopyErrorMessage(v13, (const __CFURL *)v10, (TString *)&v20);
      id v17 = v20;
      v23[0] = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      *a6 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:v18];

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20);
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)sizeURL:(id)a3 destinationURL:(id)a4 targetName:(id)a5 coordinate:(BOOL)a6 spaceNeeds:(DestinationSpaceNeeds *)a7 groupUUID:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  int64_t v31 = 0;
  if (v11) {
    __int16 v19 = 0x2000;
  }
  else {
    __int16 v19 = 0;
  }
  id v20 = (TCFURLInfo *)TDSHelperContext::FilesCopyOperationSize((uint64_t)self->impl, v15, v16, v17, 2u, v19, &a7->var0, 0, v18, &v31);
  int v21 = (int)v20;
  if (v20)
  {
    if (a9)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      TCFURLInfo::LocalizedCopyErrorMessage(v20, (const __CFURL *)v15, &v30);
      BOOL v23 = v30.fString.fRef;
      v35[0] = v23;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a9 = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:v21 userInfo:v24];

LABEL_7:
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v30.fString.fRef);
    }
  }
  else
  {
    if (!a7 || (a7->var18 & 0x100000) == 0)
    {
      BOOL v25 = 1;
      goto LABEL_12;
    }
    if (a9)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      TCFURLInfo::LocalizedCopyErrorMessage((TCFURLInfo *)0xFFFFFAE3, (const __CFURL *)v15, &v30);
      CFUserNotificationRef v28 = v30.fString.fRef;
      uint64_t v33 = v28;
      int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      *a9 = [v27 errorWithDomain:*MEMORY[0x1E4F28760] code:-1309 userInfo:v29];

      goto LABEL_7;
    }
  }
  BOOL v25 = 0;
LABEL_12:

  return v25;
}

- (BOOL)ensureFreeSpace:(int64_t)a3 onVolume:(id)a4 error:(id *)a5
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v9 = *MEMORY[0x1E4F1C810];
  v45[0] = *MEMORY[0x1E4F1C948];
  uint64_t v8 = v45[0];
  v45[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  BOOL v11 = [v7 resourceValuesForKeys:v10 error:0];
  id v12 = [v11 objectForKeyedSubscript:v8];
  int64_t v13 = [v12 longLongValue];

  int v14 = [v11 objectForKeyedSubscript:v9];
  uint64_t v15 = [v14 longLongValue];

  int64_t v16 = a3 - v15;
  if (a3 <= v15)
  {
    BOOL v27 = 1;
  }
  else
  {
    if (v13 <= a3)
    {
      BOOL v27 = 0;
    }
    else
    {
      v43[0] = @"CACHE_DELETE_VOLUME";
      id v17 = [v7 path];
      v43[1] = @"CACHE_DELETE_URGENCY";
      v44[0] = v17;
      v44[1] = &unk_1F2AC3830;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

      uint64_t v34 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
      id v18 = [v34 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
      if (v18)
      {
        uint64_t v33 = v18;
        if ([v18 longLongValue] + v15 <= a3)
        {
          BOOL v27 = 0;
          int v21 = v33;
        }
        else
        {
          v41[0] = @"CACHE_DELETE_VOLUME";
          __int16 v19 = [v7 path];
          v42[0] = v19;
          v41[1] = @"CACHE_DELETE_AMOUNT";
          id v20 = [NSNumber numberWithLongLong:v16];
          v41[2] = @"CACHE_DELETE_URGENCY";
          v42[1] = v20;
          v42[2] = &unk_1F2AC3830;
          int v21 = v33;
          uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

          dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __52__DSNSHelperContext_ensureFreeSpace_onVolume_error___block_invoke;
          v37[3] = &unk_1E698FF20;
          BOOL v23 = v22;
          v38 = v23;
          id v24 = (void *)MEMORY[0x1D9436FC0](v37);
          CacheDeletePurgeSpaceWithInfo();

          dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
          [v7 removeCachedResourceValueForKey:v9];
          id v36 = 0;
          LODWORD(v20) = [v7 getResourceValue:&v36 forKey:v9 error:0];
          id v25 = v36;
          uint64_t v26 = v25;
          if (v20) {
            BOOL v27 = [v25 longLongValue] > a3;
          }
          else {
            BOOL v27 = 0;
          }
        }
      }
      else
      {
        BOOL v27 = 0;
        int v21 = 0;
      }
    }
    if (a5 && !v27)
    {
      CFUserNotificationRef v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      int v29 = DSLocalizedErrorStringForKey(&cfstr_Notenoughspace.isa);
      int v40 = v29;
      TString v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      *a5 = [v28 errorWithDomain:*MEMORY[0x1E4F28760] code:-34 userInfo:v30];

      BOOL v27 = 0;
    }
  }

  return v27;
}

intptr_t __52__DSNSHelperContext_ensureFreeSpace_onVolume_error___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clearCopyStateForSources:(id)a3 destination:(id)a4 targetNames:(id)a5 groupUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v22 = a6;
  uint64_t v13 = [v10 count];
  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      uint64_t v15 = [v12 objectAtIndexedSubscript:i];
      CFURLRef v16 = [v11 URLByAppendingPathComponent:v15];

      _ZNSt3__115allocate_sharedB8ne180100I10TCFURLInfoNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v23);
      TCFURLInfo::Initialize((TString *)v23, v16, 1, 0);
      if (TCFURLInfo::IsLockFile((CFURLRef *)v23)
        || (id v17 = v23, TCFURLInfo::CheckPrefetchState((CFIndex)v23, 1), (*((_WORD *)v17 + 38) & 1) != 0))
      {
        id v18 = [(id)objc_opt_class() wrapperWithURL:v16 readonly:0 error:0];
        __int16 v19 = objc_opt_class();
        id v20 = [v10 objectAtIndexedSubscript:i];
        int v21 = [v19 wrapperWithURL:v20 readonly:0 error:0];

        TDSHelperContext::FilesCopyDeleteLock((uint64_t)self->impl, v18, v21, v22);
      }
      if (v24) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
    }
  }
}

- (BOOL)preflightAndCloneIfPossible:(id)a3 toURL:(id)a4 groupUUID:(id)a5 sourceURLsToCopy:(id *)a6 isDuplication:(BOOL)a7 targetNames:(id *)a8 maxFileSize:(unint64_t *)a9 conflictStrategy:(id)a10 receiveTargets:(id)a11 error:(id *)a12
{
  BOOL v68 = a7;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  v75 = (__CFURL *)a4;
  id v70 = a5;
  id v69 = a10;
  id v64 = a11;
  v67 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v109 = 0;
  bzero(v106, 0x879uLL);
  id v65 = [MEMORY[0x1E4F1CA48] array];
  id v66 = [MEMORY[0x1E4F1CA48] array];
  _ZNSt3__115allocate_sharedB8ne180100I10TCFURLInfoNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v98);
  TCFURLInfo::Initialize((TString *)v98, v75, 0, 0);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v63;
  uint64_t v15 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
  v61 = a8;
  if (!v15)
  {
    id v78 = 0;
    char v74 = 1;
    goto LABEL_44;
  }
  id v78 = 0;
  uint64_t v76 = *(void *)v95;
  uint64_t v72 = *MEMORY[0x1E4F28760];
  uint64_t v73 = *MEMORY[0x1E4F28568];
  char v74 = 1;
  do
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = v15;
      if (*(void *)v95 != v76) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(NSURL **)(*((void *)&v94 + 1) + 8 * v16);
      __int16 v19 = (void *)MEMORY[0x1D9436D80]();
      StScopedResourceAccess::StScopedResourceAccess((StScopedResourceAccess *)v93, v18);
      _ZNSt3__115allocate_sharedB8ne180100I10TCFURLInfoNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v91);
      id v20 = (TCFURLInfo *)TCFURLInfo::Initialize((TString *)v91, (const __CFURL *)v18, 1, 0);
      if (v20 == -43) {
        int v21 = (NSURL *)_CFURLCopyPromiseURLOfLogicalURL();
      }
      else {
        int v21 = 0;
      }
      StScopedResourceAccess::StScopedResourceAccess((StScopedResourceAccess *)v90, v21);
      if (v21) {
        id v20 = (TCFURLInfo *)TCFURLInfo::Initialize((TString *)v91, (const __CFURL *)v21, 1, 0);
      }
      if (v20)
      {
        id v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v103 = v73;
        TCFURLInfo::LocalizedCopyErrorMessage(v20, (const __CFURL *)v18, (TString *)buf);
        id v23 = *(id *)buf;
        id v104 = v23;
        id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        uint64_t v25 = [v22 errorWithDomain:v72 code:(int)v20 userInfo:v24];

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)buf);
        int v26 = 2;
        id v78 = (id)v25;
        goto LABEL_37;
      }
      BOOL v27 = TCFURLInfo::AreOnSameVolume((TCFURLInfo ***)&v98, (const __CFURL *)&v91);
      char v89 = 0;
      uint64_t v28 = [obj count];
      id v87 = 0;
      id v88 = 0;
      BOOL v29 = [(DSNSHelperContext *)self createLockInDestinationURL:v75 sourceURL:v18 groupUUID:v70 groupCount:v28 conflictStrategy:v69 isDuplication:v68 clonedInstead:&v89 resultName:&v88 error:&v87];
      id v30 = v88;
      id v31 = v87;
      uint64_t v32 = v31;
      if (!v29)
      {
        uint64_t v33 = v78;
        id v78 = v31;
        goto LABEL_36;
      }
      if (!v89)
      {
        [v65 addObject:v18];
        [v66 addObject:v30];
        if (UseFileProviderFramework())
        {
          id v36 = FPItemManagerInstance();
          if (!v36 || (unsigned int v37 = v91, TCFURLInfo::CheckPrefetchState((CFIndex)v91, 1), (*((_WORD *)v37 + 38) & 1) == 0))
          {
            unsigned int v38 = 0;
            goto LABEL_31;
          }
          BOOL v39 = URLMightBeInFileProvider(*(void *)v91) == 0;

          if (!v39)
          {
            int v40 = FPItemManagerInstance();
            id v41 = *(id *)v91;
            id v86 = 0;
            v60 = [v40 itemForURL:v41 error:&v86];
            id v59 = v86;

            if (v60)
            {
              BOOL v42 = +[FIProviderDomain providerDomainForItem:v60 cachePolicy:1 error:0];
              if ([v42 isUsingFPFS]
                && [v60 isCloudItem])
              {
                unsigned int v38 = [v60 isRecursivelyDownloaded] ^ 1;
LABEL_30:

                id v36 = v59;
LABEL_31:

LABEL_32:
                int IsDataless = TCFURLInfo::IsDataless((const __CFURL **)v91, v34, v35);
                id v84 = 0;
                BOOL v46 = [(DSNSHelperContext *)self sizeURL:v18 destinationURL:v75 targetName:v30 coordinate:IsDataless | v38 spaceNeeds:v106 groupUUID:v70 error:&v84];
                id v47 = v84;
                uint64_t v33 = v47;
                if (v46)
                {
                  v48 = [(__CFURL *)v75 URLByAppendingPathComponent:v30];
                  [v67 setObject:v48 forKeyedSubscript:v18];
                }
                else
                {
                  v48 = v78;
                  id v78 = v47;
                }

                goto LABEL_36;
              }
            }
            else
            {
              BOOL v42 = LogObj(2);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                v58 = v42;
                uint64_t v85 = *(void *)v91;
                NodeEventRefFromNodeEvent((id *)&v85);
                id v43 = (NSURL *)objc_claimAutoreleasedReturnValue();
                v44 = SanitizedURL(v43);
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v44;
                __int16 v101 = 2112;
                id v102 = v59;
                _os_log_impl(&dword_1D343E000, v58, OS_LOG_TYPE_ERROR, "FPItemManager itemForURL failed for %{public}@: %@", buf, 0x16u);

                unsigned int v38 = 0;
                BOOL v42 = v58;
                goto LABEL_30;
              }
            }
            unsigned int v38 = 0;
            goto LABEL_30;
          }
        }
        unsigned int v38 = 0;
        goto LABEL_32;
      }
      [(DSNSHelperContext *)self copyRootMetadataAtURL:v18 toDestinationURL:v75 targetName:v30 error:0];
      uint64_t v33 = [(__CFURL *)v75 URLByAppendingPathComponent:v30];
      [v67 setObject:v33 forKeyedSubscript:v18];
LABEL_36:

      v74 &= v27;
      int v26 = 2 * (v78 != 0);
LABEL_37:
      StScopedResourceAccess::~StScopedResourceAccess(v90);

      if (v92) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v92);
      }
      StScopedResourceAccess::~StScopedResourceAccess(v93);
      if (v26) {
        goto LABEL_44;
      }
      ++v16;
      uint64_t v15 = v17;
    }
    while (v17 != v16);
    uint64_t v15 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
  }
  while (v15);
LABEL_44:

  id v49 = v78;
  if (v78)
  {
LABEL_45:
    [(DSNSHelperContext *)self clearCopyStateForSources:v65 destination:v75 targetNames:v66 groupUUID:v70];
    BOOL v50 = 0;
    if (a12)
    {
      id v49 = v49;
      *a12 = v49;
    }
  }
  else
  {
    if (!TCFURLInfo::GetVolumeInfoRecord((CFURLRef *)v98, buf)
      && ((buf[0] & 0x10) == 0 || (v74 & 1) == 0)
      && (*(_WORD *)buf & 0x2000) == 0)
    {
      v55 = (void *)TCFURLInfo::CopyVolumeURL((CFURLRef *)v98);
      id v83 = 0;
      BOOL v56 = [(DSNSHelperContext *)self ensureFreeSpace:v107 onVolume:v55 error:&v83];
      id v57 = v83;
      if (v56)
      {
      }
      else
      {
        id v49 = v57;

        if (v49) {
          goto LABEL_45;
        }
      }
    }
    *a6 = v65;
    id v49 = 0;
    id *v61 = v66;
    *a9 = v108;
    BOOL v50 = 1;
  }
  if (v64)
  {
    id v79 = v49;
    v51 = (void *)[v67 copy];
    v52 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __158__DSNSHelperContext_preflightAndCloneIfPossible_toURL_groupUUID_sourceURLsToCopy_isDuplication_targetNames_maxFileSize_conflictStrategy_receiveTargets_error___block_invoke;
    block[3] = &unk_1E698FF48;
    id v81 = v51;
    id v82 = v64;
    id v53 = v51;
    dispatch_async(v52, block);

    id v49 = v79;
  }
  if (v99) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v99);
  }

  return v50;
}

uint64_t __158__DSNSHelperContext_preflightAndCloneIfPossible_toURL_groupUUID_sourceURLsToCopy_isDuplication_targetNames_maxFileSize_conflictStrategy_receiveTargets_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)stopAccessingURLs:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "stopAccessingSecurityScopedResource", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)copyItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 conflictStrategy:(id)a6 receiveTargets:(id)a7 error:(id *)a8
{
  char v60 = a5;
  v85[1] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  v75 = (NSURL *)a4;
  id v11 = (DSConflictStrategy *)a6;
  id v58 = a7;
  if (!v11)
  {
    id v11 = objc_alloc_init(DSConflictStrategy);
    [(DSConflictStrategy *)v11 setType:1];
  }
  id v57 = v11;
  [(DSConflictStrategy *)v11 validate];
  if ([v62 count])
  {
    uint64_t v12 = [(NSURL *)v75 path];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      StScopedResourceAccess::StScopedResourceAccess((StScopedResourceAccess *)v74, v75);
      if ((TCFURLInfo::GetNumericalProperty((const __CFURL *)v75, (const __CFString *)*MEMORY[0x1E4F1CDC8], v14) & 0x40000000) != 0)
      {
        LOBYTE(v71) = 0;
        id v15 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3321888768;
        v72[2] = __89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error___block_invoke;
        v72[3] = &__block_descriptor_48_ea8_32c102_ZTSKZ89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error__E3__1_e15_v16__0__NSURL_8l;
        v72[4] = &v71;
        v72[5] = &v75;
        id v73 = 0;
        [v15 coordinateReadingItemAtURL:v75 options:1 error:&v73 byAccessor:v72];
        id v16 = v73;
        if (!(_BYTE)v71)
        {
          uint64_t v17 = LogObj(2);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v81 = v75;
            __int16 v82 = 2114;
            id v83 = v16;
            _os_log_impl(&dword_1D343E000, v17, OS_LOG_TYPE_ERROR, "Failed to coordinate for copy on %@: %{public}@", buf, 0x16u);
          }
        }
      }
      v51 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.DesktopServicesHelper" name:@"FileCopy"];
      id v18 = objc_alloc(MEMORY[0x1E4F96318]);
      uint64_t v19 = [MEMORY[0x1E4F96478] currentProcess];
      id v79 = v51;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      id v49 = (void *)[v18 initWithExplanation:@"DesktopServices file copy" target:v19 attributes:v20];

      [v49 acquireWithInvalidationHandler:&__block_literal_global_228];
      id v48 = v49;
      id v71 = v48;
      [MEMORY[0x1E4F29128] UUID];
      id v69 = 0;
      uint64_t v70 = 0;
      id v67 = 0;
      v54 = id v68 = 0;
      LOBYTE(v19) = -[DSNSHelperContext preflightAndCloneIfPossible:toURL:groupUUID:sourceURLsToCopy:isDuplication:targetNames:maxFileSize:conflictStrategy:receiveTargets:error:](self, "preflightAndCloneIfPossible:toURL:groupUUID:sourceURLsToCopy:isDuplication:targetNames:maxFileSize:conflictStrategy:receiveTargets:error:", v62, v75, &v70, v57, v58, &v67);
      id v21 = v69;
      id v52 = v68;
      id v53 = v67;
      BOOL v56 = v21;
      if (v19)
      {
        if (![v21 count])
        {
          BOOL v41 = 1;
          goto LABEL_43;
        }
        if ([(DSNSHelperContext *)self launchDesktopServicesHelper:a8])
        {
          BOOL v50 = [[DSNSURLBatchEnumerator alloc] initWithURLs:v21 targets:v52 batchSize:200];
          id v55 = 0;
          id v22 = 0;
          uint64_t v45 = *MEMORY[0x1E4F28760];
          uint64_t v46 = *MEMORY[0x1E4F28568];
          char v47 = 1;
          do
          {
            id v23 = [(DSNSURLBatchEnumerator *)v50 nextBatch];

            if (!v23) {
              break;
            }
            id v24 = (void *)MEMORY[0x1D9436D80]();
            uint64_t v25 = [v23 objectForKeyedSubscript:@"SourceURLs"];
            int v26 = [v23 objectForKeyedSubscript:@"TargetNames"];
            BOOL v27 = [MEMORY[0x1E4F1CA48] array];
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id v28 = v25;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v63 objects:v78 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v64;
              do
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  if (*(void *)v64 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v32 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                  [v32 startAccessingSecurityScopedResource];
                  [v27 addObject:v32];
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v63 objects:v78 count:16];
              }
              while (v29);
            }

            uint64_t v33 = LogObj(2);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v34 = [v28 count];
              *(_DWORD *)buf = 134217984;
              id v81 = (NSURL *)v34;
              _os_log_impl(&dword_1D343E000, v33, OS_LOG_TYPE_DEBUG, "Copying next batch of %lu", buf, 0xCu);
            }

            BOOL v35 = (v60 & 2) != 0 || (unint64_t)[v62 count] > 0xC8;
            *(_DWORD *)buf = 0;
            int v36 = TDSHelperContext::PerformFilesCopy((uint64_t)self->impl, v28, v75, v26, v54, v70, v35, v60 & 1, buf);
            if (v36)
            {
              unsigned int v37 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v76 = v46;
              unsigned int v38 = DSLocalizedErrorStringForKey(&cfstr_Unknownerror.isa);
              v77 = v38;
              BOOL v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
              uint64_t v40 = [v37 errorWithDomain:v45 code:v36 userInfo:v39];

              [(DSNSHelperContext *)self stopAccessingURLs:v27];
              char v47 = 0;
              id v55 = (id)v40;
            }
            else
            {
              [(DSNSHelperContext *)self stopAccessingURLs:v27];
            }

            id v22 = v23;
          }
          while (!v36);
          if (a8 && v55) {
            *a8 = v55;
          }

          BOOL v41 = v47 & 1;
          goto LABEL_43;
        }
      }
      else if (a8)
      {
        BOOL v41 = 0;
        *a8 = v53;
LABEL_43:

        StDefer<-[DSNSHelperContext copyItemsAtURLs:toURL:options:conflictStrategy:receiveTargets:error:]::$_0,(void *)0>::~StDefer(&v71);
        StScopedResourceAccess::~StScopedResourceAccess(v74);

        id v43 = v52;
        goto LABEL_44;
      }
      BOOL v41 = 0;
      goto LABEL_43;
    }
  }
  if (a8)
  {
    BOOL v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v84 = *MEMORY[0x1E4F28568];
    BOOL v56 = DSLocalizedErrorStringForKey(&cfstr_Nosourceordest.isa);
    v85[0] = v56;
    id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -50);
    BOOL v41 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

    goto LABEL_45;
  }
  BOOL v41 = 0;
LABEL_45:

  return v41;
}

void __89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogObj(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = **(void **)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_INFO, "Successfully coordinated for copy %@ -> %@", (uint8_t *)&v6, 0x16u);
  }

  **(unsigned char **)(a1 + 32) = 1;
}

void __89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error___block_invoke_225(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = LogObj(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_ERROR, "DS file copy assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)copyItemsAtURLs:(void *) toURL:options:conflictStrategy:receiveTargets:error:
{
  return a1;
}

@end