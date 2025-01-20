@interface SecCoreAnalytics
+ (id)appNameFromPath:(id)a3;
+ (void)sendEvent:(id)a3 event:(id)a4;
+ (void)sendEventLazy:(id)a3 builder:(id)a4;
@end

@implementation SecCoreAnalytics

+ (id)appNameFromPath:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28B50] bundleWithPath:v3];
  if (v4)
  {
LABEL_2:
    v5 = [v4 infoDictionary];
    id v6 = [v5 objectForKey:@"CFBundleVisibleComponentName"];
    if (!v6)
    {
      v13 = [v5 objectForKey:@"CFBundleDisplayName"];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [v5 objectForKey:@"CFBundleName"];
      }
      id v7 = v15;

      goto LABEL_13;
    }
LABEL_3:
    id v7 = v6;
    goto LABEL_13;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
    v11 = v10;
    if (v10)
    {
      CFURLRef v12 = CFBundleCopyBundleURL(v10);

      if (v12)
      {
        v4 = [MEMORY[0x1E4F28B50] bundleWithURL:v12];

        if (v4) {
          goto LABEL_2;
        }
        goto LABEL_22;
      }
      v9 = 0;
    }
  }
LABEL_22:
  CFURLRef v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
  v4 = v19;
  if (!v19)
  {
    v5 = 0;
    id v7 = 0;
    goto LABEL_14;
  }
  CFDictionaryRef v20 = CFBundleCopyInfoDictionaryForURL(v19);
  v5 = v20;
  if (v20)
  {
    uint64_t v21 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"CFBundleVisibleComponentName"];
    if (v21
      || ([v5 objectForKeyedSubscript:@"CFBundleDisplayName"],
          (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = (id)v21;
      goto LABEL_14;
    }
    id v7 = [v5 objectForKeyedSubscript:@"CFBundleName"];
    if (v7) {
      goto LABEL_14;
    }
  }
  id v23 = 0;
  int v22 = [v4 getResourceValue:&v23 forKey:*MEMORY[0x1E4F1C6E8] error:0];
  id v6 = v23;
  id v7 = 0;
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = 0;
      goto LABEL_13;
    }
    goto LABEL_3;
  }
LABEL_13:

LABEL_14:
  if (!v7 || [&unk_1ED86CB58 indexOfObject:v7] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = [v3 lastPathComponent];
    uint64_t v17 = [v16 stringByDeletingPathExtension];

    id v7 = (id)v17;
  }

  return v7;
}

+ (void)sendEventLazy:(id)a3 builder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!CoreAnalyticsLibraryCore()) {
    goto LABEL_6;
  }
  id v7 = v5;
  id v8 = v6;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v9 = (void (*)(id, id))getAnalyticsSendEventLazySymbolLoc_ptr;
  v16 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v10 = CoreAnalyticsLibrary();
    v14[3] = (uint64_t)dlsym(v10, "AnalyticsSendEventLazy");
    getAnalyticsSendEventLazySymbolLoc_ptr = (_UNKNOWN *)v14[3];
    v9 = (void (*)(id, id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (v9)
  {
    v9(v7, v8);

LABEL_6:
    return;
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  CFURLRef v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void soft_AnalyticsSendEventLazy(NSString *__strong, NSDictionary<NSString *,NSObject *> *(^__strong)(void))");
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"SecCoreAnalytics.m", 200, @"%s", dlerror());

  __break(1u);
}

+ (void)sendEvent:(id)a3 event:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!CoreAnalyticsLibraryCore()) {
    goto LABEL_6;
  }
  id v7 = v5;
  id v8 = v6;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v9 = (void (*)(id, id))getAnalyticsSendEventSymbolLoc_ptr;
  v16 = getAnalyticsSendEventSymbolLoc_ptr;
  if (!getAnalyticsSendEventSymbolLoc_ptr)
  {
    v10 = CoreAnalyticsLibrary();
    v14[3] = (uint64_t)dlsym(v10, "AnalyticsSendEvent");
    getAnalyticsSendEventSymbolLoc_ptr = (_UNKNOWN *)v14[3];
    v9 = (void (*)(id, id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (v9)
  {
    v9(v7, v8);

LABEL_6:
    return;
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  CFURLRef v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void soft_AnalyticsSendEvent(NSString *__strong, NSDictionary<NSString *,NSObject *> *__strong)");
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"SecCoreAnalytics.m", 198, @"%s", dlerror());

  __break(1u);
}

@end