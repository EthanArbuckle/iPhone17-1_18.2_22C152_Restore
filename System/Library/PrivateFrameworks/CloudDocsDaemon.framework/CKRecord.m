@interface CKRecord
@end

@implementation CKRecord

id __100__CKRecord_BRCSerializationAdditions___locateSideCarServerZone_withShareAliasReference_withSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (void *)[*(id *)(a1 + 32) newServerItemFromPQLResultSet:a2 error:a3];
  return v3;
}

void __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clientZone];
  int v3 = [v2 isPrivateZone];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) clientZone];
    v5 = [v4 asPrivateClientZone];
    id v11 = [v5 defaultAppLibrary];

    if ([*(id *)(a1 + 40) hasChainPCS])
    {
      uint64_t v6 = 134217730;
    }
    else
    {
      [v11 clearStateBits:0x8000000];
      uint64_t v6 = 2;
    }
    [v11 setStateBits:v6];
    [*(id *)(a1 + 40) _processSaltingOnAppLibrary:v11];
    v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"countMetrics"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count])
    {
      v8 = [v7 objectAtIndexedSubscript:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [v11 rootQuotaUsage];
        if (!v9 || (int v10 = *(unsigned __int8 *)(a1 + 48), v9, v10)) {
          [v11 setRootQuotaUsage:v8];
        }
      }
    }
    [*(id *)(a1 + 40) _saveAppLibraryIfNecessary:v11];
  }
}

void __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChainPCS])
  {
    uint64_t v2 = 134217730;
  }
  else
  {
    [*(id *)(a1 + 40) clearStateBits:0x8000000];
    uint64_t v2 = 2;
  }
  [*(id *)(a1 + 40) setStateBits:v2];
  [*(id *)(a1 + 32) _processSaltingOnAppLibrary:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"countMetrics"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
  {
    int v3 = [v6 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [*(id *)(a1 + 40) rootQuotaUsage];
      if (!v4 || (int v5 = *(unsigned __int8 *)(a1 + 48), v4, v5)) {
        [*(id *)(a1 + 40) setRootQuotaUsage:v3];
      }
    }
  }
  [*(id *)(a1 + 32) _saveAppLibraryIfNecessary:*(void *)(a1 + 40)];
}

void __84__CKRecord_BRCContainerMetadataAdditions__brc_containerMetadataRecordWithContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v6 isFileURL] & 1) != 0)
  {
    id v13 = 0;
    char v7 = [v6 checkResourceIsReachableAndReturnError:&v13];
    v8 = v13;
    if (v7)
    {
      v9 = [objc_alloc(MEMORY[0x1E4F19E50]) initWithFileURL:v6];
      if (v9)
      {
        int v10 = *(void **)(a1 + 32);
        id v11 = BRContainerIconCKAssetKeyForName();
        [v10 setObject:v9 forKeyedSubscript:v11];
      }
    }
    else
    {
      v9 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v15 = v6;
        __int16 v16 = 2112;
        v17 = v8;
        __int16 v18 = 2112;
        v19 = v9;
        _os_log_fault_impl(&dword_1D353B000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: icon doesn't exist anymore at %@ - %@%@", buf, 0x20u);
      }
    }
  }
  else
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      __int16 v16 = 2112;
      v17 = v6;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_fault_impl(&dword_1D353B000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid key %@ and obj %@%@", buf, 0x20u);
    }
  }
}

@end