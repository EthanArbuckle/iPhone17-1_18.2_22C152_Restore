@interface NSBundleODRDataCommon
@end

@implementation NSBundleODRDataCommon

NSError *__58___NSBundleODRDataCommon_assetPacksBecameAvailable_error___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 objectForKey:@"_NSODRURLKey"];
  if (v7)
  {
    uint64_t v8 = v7;
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    v9 = qword_1EB1E85F8;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1[4] + 24);
      *(_DWORD *)buf = 134218499;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      uint64_t v21 = a2;
      __int16 v22 = 2113;
      uint64_t v23 = v8;
      _os_log_debug_impl(&dword_181795000, v9, OS_LOG_TYPE_DEBUG, "Pin: Bundle 0x%p / Asset Pack ID: %{public}@ / URL: %{private}@", buf, 0x20u);
    }
    [*(id *)(a1[4] + 8) setObject:v8 forKey:a2];
    [*(id *)(a1[4] + 24) _cfBundle];
    if (_CFBundleAddResourceURL())
    {
      v10 = +[NSNotificationCenter defaultCenter];
      return (NSError *)-[NSNotificationCenter postNotificationName:object:userInfo:](v10, "postNotificationName:object:userInfo:", @"_NSBundleResourceRequestAssetPackPinnedNotification", *(void *)(a1[4] + 24), [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a2 forKey:@"_NSBundleResourceRequestAssetPackNotificationAssetPackIDKey"]);
    }
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    v17 = +[NSString stringWithFormat:@"Unable to add the URL %@ to the bundle %@", v8, *(void *)(a1[4] + 24), @"NSDebugDescription"];
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = &v17;
    v14 = (__CFString **)&v16;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    v24 = @"NSDebugDescription";
    v25[0] = +[NSString stringWithFormat:@"Response to begin was missing a URL (%@)", *(void *)(a1[4] + 24)];
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = (NSString **)v25;
    v14 = &v24;
  }
  result = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 256, [v12 dictionaryWithObjects:v13 forKeys:v14 count:1]);
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

NSError *__60___NSBundleODRDataCommon_assetPacksBecameUnavailable_error___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 objectForKey:@"_NSODRURLKey"];
  if (!v7)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    __int16 v22 = @"NSDebugDescription";
    v23[0] = +[NSString stringWithFormat:@"Response to begin was missing a URL (%@)", *(void *)(a1[4] + 24)];
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = (NSString **)v23;
    v14 = &v22;
LABEL_10:
    result = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 256, [v12 dictionaryWithObjects:v13 forKeys:v14 count:1]);
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    return result;
  }
  uint64_t v8 = v7;
  [*(id *)(a1[4] + 24) _cfBundle];
  if (!_CFBundleRemoveResourceURL())
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    __int16 v20 = @"NSDebugDescription";
    uint64_t v21 = +[NSString stringWithFormat:@"Unable to remove the URL %@ to the bundle %@", v8, *(void *)(a1[4] + 24)];
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = &v21;
    v14 = &v20;
    goto LABEL_10;
  }
  if (qword_1EB1E8600 != -1) {
    dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
  }
  v9 = qword_1EB1E85F8;
  if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1[4] + 24);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v15;
    __int16 v18 = 2114;
    uint64_t v19 = a2;
    _os_log_debug_impl(&dword_181795000, v9, OS_LOG_TYPE_DEBUG, "Unpin: Bundle 0x%p / Asset Pack ID: %{public}@", buf, 0x16u);
  }
  [*(id *)(a1[4] + 8) removeObjectForKey:a2];
  v10 = +[NSNotificationCenter defaultCenter];
  return (NSError *)-[NSNotificationCenter postNotificationName:object:userInfo:](v10, "postNotificationName:object:userInfo:", @"_NSBundleResourceRequestAssetPackUnpinnedNotification", *(void *)(a1[4] + 24), [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a2 forKey:@"_NSBundleResourceRequestAssetPackNotificationAssetPackIDKey"]);
}

@end