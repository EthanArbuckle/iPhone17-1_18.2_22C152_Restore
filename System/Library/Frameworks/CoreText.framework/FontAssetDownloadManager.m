@interface FontAssetDownloadManager
+ (uint64_t)errorWithCode:(uint64_t)a3 description:;
+ (uint64_t)fontInfo:(uint64_t)a3 andAssetDesignLanguages:(void *)a4 matchesRequest:;
+ (void)availableMobileAssetsWithOptions:(uint64_t *)a3 error:;
+ (void)availableMobileAssetsWithOptions:(uint64_t)a3 manager:(uint64_t *)a4 error:;
- (BOOL)callProgressCallback:(uint64_t)a1;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation FontAssetDownloadManager

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

uint64_t __54__FontAssetDownloadManager_activateFontsFromAssetURL___block_invoke()
{
  return 1;
}

uint64_t __49__FontAssetDownloadManager_callProgressCallback___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

dispatch_queue_t __49__FontAssetDownloadManager_callProgressCallback___block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CoreText.progressCallback", 0);
  qword_1EB2CE930 = (uint64_t)result;
  return result;
}

- (void).cxx_destruct
{
  a_value = self->fDescriptors.fRef.__a_.__a_value;
}

- (void)dealloc
{
  _Block_release(self->fProgressCallbackBlock);
  v3.receiver = self;
  v3.super_class = (Class)FontAssetDownloadManager;
  [(FontAssetDownloadManager *)&v3 dealloc];
}

- (BOOL)callProgressCallback:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (_MergedGlobals_38 != -1) {
    dispatch_once(&_MergedGlobals_38, &__block_literal_global_10);
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__FontAssetDownloadManager_callProgressCallback___block_invoke_2;
  block[3] = &unk_1E52907C0;
  block[4] = a1;
  block[5] = &v8;
  int v7 = a2;
  dispatch_sync((dispatch_queue_t)qword_1EB2CE930, block);
  BOOL v4 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

+ (void)availableMobileAssetsWithOptions:(uint64_t)a3 manager:(uint64_t *)a4 error:
{
  self;
  if (a2) {
    -[FontAssetDownloadManager callProgressCallback:](a3, 2);
  }
  int v7 = +[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]((uint64_t)FontAssetDownloadManager, a2, a4);
  uint64_t v8 = [v7 count];
  if (!a4 || v8 || [(id)*a4 code] != 303) {
    return v7;
  }
  if (a2)
  {
    char v11 = a2 & 0xFE;
    if ((v11 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_10:
    -[FontAssetDownloadManager callProgressCallback:](a3, 2);
    goto LABEL_11;
  }
  self;
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&+[FontAssetDownloadManager shouldRetryWithServer]::lastTime < 30.0) {
    return v7;
  }
  +[FontAssetDownloadManager shouldRetryWithServer]::lastTime = *(void *)&Current;
  char v11 = a2 | 1;
  if (v11) {
    goto LABEL_10;
  }
LABEL_11:

  return +[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]((uint64_t)FontAssetDownloadManager, v11, a4);
}

+ (void)availableMobileAssetsWithOptions:(uint64_t *)a3 error:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  self;
  gotLoadHelper_x8__OBJC_CLASS___MAAsset(v5);
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    return 0;
  }
  uint64_t v8 = (uint64_t *)MEMORY[0x1E4F622C0];
  if ((a2 & 1) == 0)
  {
    uint64_t v9 = *MEMORY[0x1E4F622C0];
    goto LABEL_14;
  }
  uint64_t v10 = (void *)v6;
  char v11 = dispatch_semaphore_create(0);
  dispatch_retain(v11);
  gotLoadHelper_x8__OBJC_CLASS___MADownloadOptions(v12);
  id v14 = objc_alloc_init(*(Class *)(v13 + 4080));
  [v14 setTimeoutIntervalForResource:30];
  [v14 setDiscretionary:0];
  if ((a2 & 4) != 0)
  {
    CFLog();
    [v14 setAllowsCellularAccess:1];
  }
  uint64_t v9 = *v8;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __67__FontAssetDownloadManager_availableMobileAssetsWithOptions_error___block_invoke;
  v58[3] = &unk_1E5290808;
  v58[4] = v14;
  v58[5] = v11;
  [v10 startCatalogDownload:v9 options:v14 then:v58];
  dispatch_time_t v15 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v11, v15))
  {
    id AssociatedObject = objc_getAssociatedObject(v14, (const void *)+[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]::downloadErrorKey);
    if (!a3 || !AssociatedObject) {
      goto LABEL_13;
    }
    id v16 = AssociatedObject;
    goto LABEL_12;
  }
  if (a3)
  {
    id v16 = (id)+[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 301, @"Font asset catalog download failed.");
LABEL_12:
    *a3 = (uint64_t)v16;
  }
LABEL_13:

  dispatch_release(v11);
LABEL_14:
  gotLoadHelper_x8__OBJC_CLASS___MAAssetQuery(v7);
  id v19 = (id)[objc_alloc(*(Class *)(v18 + 4032)) initWithType:v9];
  v20 = v19;
  if ((a2 & 2) != 0) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = 2;
  }
  [v19 returnTypes:v21];
  [v20 setDoNotBlockBeforeFirstUnlock:1];
  [v20 setDoNotBlockOnNetworkStatus:1];
  if ([v20 queryMetaDataSync] == 2)
  {
    if (a3)
    {
      v50 = 0;
      *a3 = +[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 303, @"Font asset catalog has not been downloaded.");
      return v50;
    }
    return 0;
  }
  unint64_t v22 = 0x1E4F1C000uLL;
  if ((a2 & 2) != 0)
  {
    id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v24 = (void *)[v20 results];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v71 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v55 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          self;
          unint64_t v30 = [v29 state];
          if (v30 <= 6 && ((1 << v30) & 0x6C) != 0) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v71 count:16];
      }
      while (v26);
    }
  }
  else
  {
    id v23 = (id)[v20 results];
  }
  id v32 = v23;
  self;
  unsigned int v33 = FSGetMaxSupportedFontAssetCompatibilityVersion();
  obuint64_t j = (id)[MEMORY[0x1E4F1CA48] array];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v34 = [v32 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v68 != v36) {
          objc_enumerationMutation(v32);
        }
        v38 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "attributes"), "objectForKeyedSubscript:", @"_CompatibilityVersion"), "unsignedIntValue") <= v33)objc_msgSend(obj, "addObject:", v38); {
      }
        }
      uint64_t v35 = [v32 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v35);
  }
  [obj sortUsingComparator:&__block_literal_global_73];
  v50 = (void *)[MEMORY[0x1E4F1CA48] array];
  v39 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v52 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v64 != v51) {
          objc_enumerationMutation(obj);
        }
        v41 = *(void **)(*((void *)&v63 + 1) + 8 * k);
        v42 = objc_msgSend((id)objc_msgSend(v41, "attributes"), "objectForKey:", @"FontInfo4");
        v43 = (void *)[*(id *)(v22 + 2632) array];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v72 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v60;
LABEL_51:
          uint64_t v47 = 0;
          while (1)
          {
            if (*(void *)v60 != v46) {
              objc_enumerationMutation(v42);
            }
            uint64_t v48 = [*(id *)(*((void *)&v59 + 1) + 8 * v47) objectForKey:@"PostScriptFontName"];
            [v43 addObject:v48];
            if ([v39 containsObject:v48]) {
              break;
            }
            if (v45 == ++v47)
            {
              uint64_t v45 = [v42 countByEnumeratingWithState:&v59 objects:v72 count:16];
              if (v45) {
                goto LABEL_51;
              }
              goto LABEL_57;
            }
          }
        }
        else
        {
LABEL_57:
          [v39 addObjectsFromArray:v43];
          [v50 addObject:v41];
        }
        unint64_t v22 = 0x1E4F1C000;
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v52);
  }
  return v50;
}

+ (uint64_t)errorWithCode:(uint64_t)a3 description:
{
  v13[2] = *MEMORY[0x1E4F143B8];
  self;
  double v5 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreText"];
  uint64_t v6 = [v5 localizedStringForKey:a3 value:&stru_1ED0677F8 table:0];
  if (IsWAPIComplianceRequired()) {
    double v7 = @"Check WLAN connection and try again later.";
  }
  else {
    double v7 = @"Check Wi-Fi connection and try again later.";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1ED0677F8 table:0];
  uint64_t v9 = *MEMORY[0x1E4F28588];
  v12[0] = *MEMORY[0x1E4F28568];
  v12[1] = v9;
  v13[0] = v6;
  v13[1] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreText.CTFontManagerErrorDomain" code:a2 userInfo:v10];
}

uint64_t __52__FontAssetDownloadManager_filterIncompatibleAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (void *)[a2 attributes];
  double v5 = (void *)[a3 attributes];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"_CompatibilityVersion"), "intValue");
  int v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"_CompatibilityVersion"), "intValue");
  if (v6 > v7) {
    return -1;
  }
  if (v6 < v7) {
    return 1;
  }
  uint64_t v9 = (void *)[v4 objectForKeyedSubscript:@"__RelativePath"];
  uint64_t v10 = [v5 objectForKeyedSubscript:@"__RelativePath"];

  return [v9 compare:v10];
}

void __67__FontAssetDownloadManager_availableMobileAssetsWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(&cfstr_CoretextFontas.isa, a2);
    objc_super v3 = *(void **)(a1 + 32);
    BOOL v4 = (const void *)+[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]::downloadErrorKey;
    double v5 = (void *)+[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 301, @"Font asset catalog download failed.");
    objc_setAssociatedObject(v3, v4, v5, (void *)0x301);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  int v6 = *(NSObject **)(a1 + 40);

  dispatch_release(v6);
}

+ (uint64_t)fontInfo:(uint64_t)a3 andAssetDesignLanguages:(void *)a4 matchesRequest:
{
  self;
  int v7 = (NSString *)[a4 objectForKey:@"NSFontFamilyAttribute"];
  uint64_t v8 = [a4 objectForKey:@"NSFontNameAttribute"];
  uint64_t v9 = [(NSDictionary *)a2 objectForKey:@"PostScriptFontNameAliases"];
  if (!v8
    || (uint64_t v10 = (void *)v9, (v11 = [(NSDictionary *)a2 objectForKey:@"PostScriptFontName"]) == 0)
    || ([v11 isEqualToString:v8] & 1) != 0
    || (uint64_t result = [v10 containsObject:v8], result))
  {
    uint64_t v13 = [a4 objectForKey:@"NSCTFontPostScriptNameAttribute"];
    if (!v13
      || (uint64_t v14 = v13, (v15 = [(NSDictionary *)a2 objectForKey:@"PostScriptFontName"]) == 0)
      || (uint64_t result = [v15 isEqualToString:v14], result))
    {
      if (DictHasUnmatchedNames(a2, &cfstr_Fontfamilyname.isa, &cfstr_Preferredfamil.isa, v7)
        || DictHasUnmatchedNames(a2, &cfstr_Fontstylename.isa, &cfstr_Preferredstyle.isa, (NSString *)[a4 objectForKey:@"NSFontFaceAttribute"]))
      {
        return 0;
      }
      uint64_t v16 = [a4 objectForKey:@"NSFontVisibleNameAttribute"];
      if (!v16) {
        goto LABEL_29;
      }
      v17 = (void *)v16;
      CopyValueForCurrentUser((const __CFDictionary *)[(NSDictionary *)a2 objectForKey:@"DisplayNames"], 0, (atomic_ullong *)&v24);
      unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)&v24, memory_order_acquire);

      if (!explicit) {
        return 0;
      }
      uint64_t result = [v17 isEqualToString:explicit];
      if (result)
      {
LABEL_29:
        if ([a4 objectForKey:@"NSCTFontDesignLanguagesAttribute"]) {
          id v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
        }
        else {
          id v19 = (void *)[MEMORY[0x1E4F1CAD0] set];
        }
        v20 = v19;
        if (![v19 count]) {
          return 1;
        }
        uint64_t v21 = [(NSDictionary *)a2 objectForKey:@"FontDesignLanguages"];
        uint64_t v22 = v21 ? v21 : a3;
        uint64_t v23 = v22 ? objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:") : objc_msgSend(MEMORY[0x1E4F1CAD0], "set");
        uint64_t result = [v20 isSubsetOfSet:v23];
        if (result) {
          return 1;
        }
      }
    }
  }
  return result;
}

intptr_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

uint64_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_3;
  v3[3] = &unk_1E5290858;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 cancelDownload:v3];
}

uint64_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_4(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    uint64_t v3 = (uint64_t)Weak;
    BOOL v4 = objc_loadWeak((id *)(a1 + 48));
    if (v4)
    {
      double v5 = v4;
      dispatch_suspend(v4);
      BOOL v6 = -[FontAssetDownloadManager callProgressCallback:](v3, 3);
      dispatch_resume(v5);
      if (!v6)
      {
        int v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        v7();
      }
    }
  }
}

void __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_5(uint64_t a1, void *a2)
{
  if ([a2 totalExpected] < 1)
  {
    double v5 = 0.0;
  }
  else
  {
    double v4 = (double)[a2 totalWritten];
    double v5 = v4 / (double)[a2 totalExpected];
  }
  [a2 expectedTimeRemaining];
  uint64_t v7 = v6;
  if (qword_1EB2CE938 != -1) {
    dispatch_once(&qword_1EB2CE938, &__block_literal_global_177);
  }
  uint64_t v8 = qword_1EB2CE940;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_6;
  block[3] = &unk_1E52908D0;
  objc_copyWeak(v13, (id *)(a1 + 64));
  block[4] = a2;
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v12 = v9;
  v13[1] = *(id *)&v5;
  int v16 = *(_DWORD *)(a1 + 88);
  long long v14 = *(_OWORD *)(a1 + 72);
  uint64_t v15 = v7;
  dispatch_sync(v8, block);
  objc_destroyWeak(v13);
}

void __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_6(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 72));
  uint64_t v3 = Weak;
  if (Weak) {
    dispatch_suspend(Weak);
  }
  int v4 = [*(id *)(a1 + 32) isStalled];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = +[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 302, @"Font Download failed.");
      uint64_t v7 = *(void **)(v5 + 32);
      if (v6) {
        [v7 setObject:v6 forKey:@"CTFontDescriptorMatchingError"];
      }
      else {
        [v7 removeObjectForKey:@"CTFontDescriptorMatchingError"];
      }
      BOOL v8 = -[FontAssetDownloadManager callProgressCallback:](v5, 8);
      [*(id *)(v5 + 32) removeObjectForKey:@"CTFontDescriptorMatchingError"];
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      BOOL v10 = v8 && *(unsigned char *)(v9 + 24) != 0;
    }
    else
    {
      BOOL v10 = 0;
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    }
    *(unsigned char *)(v9 + 24) = v10;
  }
  if (*(double *)(a1 + 80) >= 0.0) {
    double v11 = *(double *)(a1 + 80);
  }
  else {
    double v11 = 0.0;
  }
  if (v11 >= 0.0)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "totalWritten") + *(void *)(a1 + 88));
    if (v12)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void **)(v12 + 32);
      if (v14) {
        [v15 setObject:v14 forKey:@"CTFontDescriptorMatchingTotalDownloadedSize"];
      }
      else {
        [v15 removeObjectForKey:@"CTFontDescriptorMatchingTotalDownloadedSize"];
      }
    }
  }
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = [NSNumber numberWithLong:(uint64_t)((v11 + (double)*(int *)(a1 + 112)) / (double)*(unint64_t *)(a1 + 96) * 100.0)];
  if (v16)
  {
    uint64_t v18 = v17;
    id v19 = *(void **)(v16 + 32);
    if (v18) {
      [v19 setObject:v18 forKey:@"CTFontDescriptorMatchingPercentage"];
    }
    else {
      [v19 removeObjectForKey:@"CTFontDescriptorMatchingPercentage"];
    }
  }
  if (v4) {
    int v20 = 3;
  }
  else {
    int v20 = 5;
  }
  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v22 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
  if (v21)
  {
    uint64_t v23 = v22;
    id v24 = *(void **)(v21 + 32);
    if (v23) {
      [v24 setObject:v23 forKey:@"CTFontDescriptorMatchingEstimatedSecondsRemaining"];
    }
    else {
      [v24 removeObjectForKey:@"CTFontDescriptorMatchingEstimatedSecondsRemaining"];
    }
  }
  BOOL v25 = -[FontAssetDownloadManager callProgressCallback:](*(void *)(a1 + 40), v20);
  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v27 = v25 && *(unsigned char *)(v26 + 24) != 0;
  *(unsigned char *)(v26 + 24) = v27;
  if (v3)
  {
    dispatch_time_t v28 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v3, v28, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
    dispatch_resume(v3);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v29 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v29();
  }
}

uint64_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end