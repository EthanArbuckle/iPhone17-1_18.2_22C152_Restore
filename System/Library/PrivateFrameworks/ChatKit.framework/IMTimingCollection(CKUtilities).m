@interface IMTimingCollection(CKUtilities)
+ (id)activeGlobalTimingCollections;
+ (id)globalTimingCollectionForKey:()CKUtilities;
+ (void)invalidateGlobalTimingCollectionForKey:()CKUtilities;
+ (void)invalidateGlobalTimingCollections;
+ (void)logTimingCollectionForKey:()CKUtilities;
@end

@implementation IMTimingCollection(CKUtilities)

+ (id)globalTimingCollectionForKey:()CKUtilities
{
  id v3 = a3;
  v4 = (void *)sGlobalTimingCollections;
  if (!sGlobalTimingCollections)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = (void *)sGlobalTimingCollections;
    sGlobalTimingCollections = (uint64_t)v5;

    v4 = (void *)sGlobalTimingCollections;
  }
  id v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [(id)sGlobalTimingCollections setObject:v7 forKey:v3];
  }

  return v7;
}

+ (id)activeGlobalTimingCollections
{
  if (sGlobalTimingCollections) {
    [(id)sGlobalTimingCollections allValues];
  }
  else {
  v0 = [MEMORY[0x1E4F1C978] array];
  }

  return v0;
}

+ (void)logTimingCollectionForKey:()CKUtilities
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (sGlobalTimingCollections && IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(id)sGlobalTimingCollections valueForKey:v3];
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@ - %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

+ (void)invalidateGlobalTimingCollectionForKey:()CKUtilities
{
  id v3 = a3;
  if (sGlobalTimingCollections)
  {
    id v5 = v3;
    v4 = [(id)sGlobalTimingCollections objectForKey:v3];

    id v3 = v5;
    if (v4)
    {
      [(id)sGlobalTimingCollections removeObjectForKey:v5];
      id v3 = v5;
    }
  }
}

+ (void)invalidateGlobalTimingCollections
{
  v0 = (void *)sGlobalTimingCollections;
  if (sGlobalTimingCollections)
  {
    sGlobalTimingCollections = 0;
  }
}

@end