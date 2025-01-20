@interface CADRealCalendarDatabaseDataProvider
+ (id)realDataProvider;
- (BOOL)isIntegrationStore:(void *)a3 inDatabase:(CalDatabase *)a4;
- (BOOL)isLocalStore:(void *)a3 inDatabase:(CalDatabase *)a4;
- (BOOL)isStoreDelegate:(void *)a3 inDatabase:(CalDatabase *)a4;
- (id)accountIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4;
- (id)storeIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4;
- (id)storesInDatabase:(CalDatabase *)a3;
- (int)databaseID:(CalDatabase *)a3;
- (int)naturalLanguageSuggestionsCalendarRowIDInDatabase:(CalDatabase *)a3;
- (int)storeUIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4;
- (int)suggestionsCalendarRowIDInDatabase:(CalDatabase *)a3;
- (void)gatherCalendarRowIDs:(id)a3 inStore:(void *)a4 inDatabase:(CalDatabase *)a5;
@end

@implementation CADRealCalendarDatabaseDataProvider

- (int)databaseID:(CalDatabase *)a3
{
  return CalDatabaseGetAuxilliaryDatabaseID();
}

- (BOOL)isStoreDelegate:(void *)a3 inDatabase:(CalDatabase *)a4
{
  v4 = (void *)CalStoreCopyDelegatedAccountOwnerStoreID();
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)storesInDatabase:(CalDatabase *)a3
{
  v3 = (void *)CalDatabaseCopyOfAllStores();
  return v3;
}

+ (id)realDataProvider
{
  if (realDataProvider_onceToken != -1) {
    dispatch_once(&realDataProvider_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)realDataProvider_realDataProvider;
  return v2;
}

- (BOOL)isIntegrationStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  return CalStoreGetType() == 6;
}

- (void)gatherCalendarRowIDs:(id)a3 inStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFArrayRef v6 = (const __CFArray *)CalStoreCopyCalendars();
  if (v6)
  {
    CFArrayRef v7 = v6;
    CFIndex Count = CFArrayGetCount(v6);
    if (Count >= 1)
    {
      CFIndex v9 = Count;
      for (CFIndex i = 0; i != v9; ++i)
      {
        CFArrayGetValueAtIndex(v7, i);
        v11 = [MEMORY[0x1E4F28ED0] numberWithInt:CalCalendarGetUID()];
        [v5 addObject:v11];
      }
    }
    CFRelease(v7);
  }
  else
  {
    v12 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14[0] = 67109120;
      v14[1] = CalStoreGetUID();
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "Calendar are nil for store with RowID: [%i]", (uint8_t *)v14, 8u);
    }
  }
}

uint64_t __55__CADRealCalendarDatabaseDataProvider_realDataProvider__block_invoke()
{
  v0 = objc_alloc_init(CADRealCalendarDatabaseDataProvider);
  realDataProvider_realDataProvider = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (BOOL)isLocalStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  unsigned int Type = CalStoreGetType();
  return (Type < 7) & (0x71u >> Type);
}

- (id)accountIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  if (CalStoreGetType() - 1 > 1) {
    v4 = 0;
  }
  else {
    v4 = (void *)CalStoreCopyExternalID();
  }
  return v4;
}

- (id)storeIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  v4 = (void *)CalStoreCopyUUID();
  return v4;
}

- (int)storeUIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  return CalStoreGetUID();
}

- (int)naturalLanguageSuggestionsCalendarRowIDInDatabase:(CalDatabase *)a3
{
  uint64_t v3 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  if (!v3) {
    return -1;
  }
  v4 = (const void *)v3;
  int UID = CalCalendarGetUID();
  CFRelease(v4);
  return UID;
}

- (int)suggestionsCalendarRowIDInDatabase:(CalDatabase *)a3
{
  uint64_t v3 = CalDatabaseCopySuggestionsCalendar();
  if (!v3) {
    return -1;
  }
  v4 = (const void *)v3;
  int UID = CalCalendarGetUID();
  CFRelease(v4);
  return UID;
}

@end