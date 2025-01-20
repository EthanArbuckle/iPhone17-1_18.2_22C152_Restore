@interface BRCPCSChainBatchInfo
- (BOOL)containsRecordInfo:(id)a3;
- (BOOL)should2PhasePCSChain;
- (BRCPCSChainBatchInfo)initWithAppLibrary:(id)a3;
- (NSArray)recordsForFirstPhase;
- (NSArray)recordsForSecondPhase;
- (NSDictionary)halfChainedRecordMap;
- (unint64_t)batchCount;
- (unint64_t)chainedRecordsCount;
- (void)_chainPreppedRecordToParent:(id)a3;
- (void)addFullyChainedRecordInfo:(id)a3;
- (void)chainPreparedRecordBatch:(id)a3;
- (void)prepareFirstPhaseRecordBatch;
@end

@implementation BRCPCSChainBatchInfo

- (BRCPCSChainBatchInfo)initWithAppLibrary:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BRCPCSChainBatchInfo;
  v6 = [(BRCPCSChainBatchInfo *)&v20 init];
  if (v6)
  {
    v7 = [v5 mangledID];
    v8 = +[BRCUserDefaults defaultsForMangledID:v7];
    v6->_should2PhasePCSChain = [v8 should2PhasePCSChain];

    uint64_t v9 = objc_opt_new();
    fullyChainRecordBatch = v6->_fullyChainRecordBatch;
    v6->_fullyChainRecordBatch = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    fullyChainRecordInfoMap = v6->_fullyChainRecordInfoMap;
    v6->_fullyChainRecordInfoMap = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    halfChainedRecordMap = v6->_halfChainedRecordMap;
    v6->_halfChainedRecordMap = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    alreadyHalfChainedRecords = v6->_alreadyHalfChainedRecords;
    v6->_alreadyHalfChainedRecords = (NSMutableSet *)v15;

    if (v6->_should2PhasePCSChain)
    {
      uint64_t v17 = objc_opt_new();
      recordsForFirstPhase = v6->_recordsForFirstPhase;
      v6->_recordsForFirstPhase = (NSMutableArray *)v17;
    }
    objc_storeStrong((id *)&v6->_appLibrary, a3);
  }

  return v6;
}

- (BOOL)containsRecordInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 itemID];
  uint64_t v6 = [v4 itemType];
  v7 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  v8 = [v7 serverZone];
  uint64_t v9 = [v4 aliasTargetZoneIsShared];

  v10 = [v5 structureRecordIDForItemType:v6 zone:v8 aliasTargetZoneIsShared:v9];

  if (v10)
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_fullyChainRecordInfoMap objectForKeyedSubscript:v10];
    if (v11)
    {
      BOOL v12 = 1;
    }
    else
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_halfChainedRecordMap objectForKeyedSubscript:v10];
      BOOL v12 = v13 != 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)prepareFirstPhaseRecordBatch
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_should2PhasePCSChain)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = [(NSMutableDictionary *)self->_halfChainedRecordMap objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          recordsForFirstPhase = self->_recordsForFirstPhase;
          uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * i) record];
          [(NSMutableArray *)recordsForFirstPhase addObject:v9];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)addFullyChainedRecordInfo:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  uint64_t v6 = [v5 serverZone];
  v7 = [v6 zoneID];

  unsigned int v8 = [v4 itemType];
  unint64_t v9 = 0x1E4F1A000uLL;
  if (v8 <= 8 && ((1 << v8) & 0x106) != 0)
  {
    long long v10 = [v4 itemID];
    long long v11 = [v10 contentsRecordIDInZoneID:v7];

    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"content" recordID:v11];
    long long v13 = [v4 contentCKInfo];
    [v12 serializeSystemFields:v13];

    [(NSMutableArray *)self->_fullyChainRecordBatch addObject:v12];
    [(NSMutableDictionary *)self->_fullyChainRecordInfoMap setObject:v4 forKey:v11];
  }
  v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v58 = [v4 itemID];
    v41 = [v58 debugItemIDString];
    v56 = [v4 structuralCKInfo];
    v42 = [v56 etag];
    [v4 contentCKInfo];
    v43 = v60 = v7;
    v44 = [v43 etag];
    v45 = [v4 parentID];
    v46 = [v45 debugItemIDString];
    *(_DWORD *)buf = 138413570;
    v62 = v41;
    __int16 v63 = 2112;
    v64 = v42;
    __int16 v65 = 2112;
    v66 = v44;
    __int16 v67 = 2112;
    v68 = v46;
    __int16 v69 = 2112;
    v70 = self;
    __int16 v71 = 2112;
    v72 = v14;
    _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] PCS chaining %@ (st:%@, ct:%@) to %@ for op %@%@", buf, 0x3Eu);

    v7 = v60;
    unint64_t v9 = 0x1E4F1A000;
  }
  v16 = [v4 itemID];
  uint64_t v17 = [v4 itemType];
  v18 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  v19 = [v18 serverZone];
  objc_super v20 = objc_msgSend(v16, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v17, v19, objc_msgSend(v4, "aliasTargetZoneIsShared"));

  unsigned int v21 = [v4 itemType];
  if (v21 > 0xA
    || ((1 << v21) & 0x611) == 0
    || ([(NSMutableDictionary *)self->_halfChainedRecordMap objectForKeyedSubscript:v20],
        v22 = objc_claimAutoreleasedReturnValue(),
        [v22 record],
        v23 = objc_claimAutoreleasedReturnValue(),
        v22,
        !v23))
  {
    v23 = (void *)[objc_alloc(*(Class *)(v9 + 728)) initWithRecordType:@"structure" recordID:v20];
    v24 = [v4 structuralCKInfo];
    [v23 serializeSystemFields:v24];

    if ([v4 chainState] != 4
      && ((unsigned int v28 = [v4 itemType], v28 <= 0xA) && ((1 << v28) & 0x611) != 0
       || (unsigned int v47 = [v4 itemType], v47 <= 8) && ((1 << v47) & 0x106) != 0))
    {
      [v23 setWantsChainPCS:1];
      unsigned int v29 = [v4 itemType];
      if (v29 > 8 || ((1 << v29) & 0x106) == 0 || !self->_should2PhasePCSChain) {
        goto LABEL_23;
      }
      recordsForFirstPhase = self->_recordsForFirstPhase;
      v27 = v23;
    }
    else
    {
      unsigned int v25 = [v4 itemType];
      if (v25 > 0xA || ((1 << v25) & 0x611) == 0) {
        goto LABEL_23;
      }
      recordsForFirstPhase = self->_alreadyHalfChainedRecords;
      v27 = v20;
    }
    [recordsForFirstPhase addObject:v27];
    goto LABEL_23;
  }
  if (self->_should2PhasePCSChain) {
    [(NSMutableArray *)self->_recordsForFirstPhase addObject:v23];
  }
  [(NSMutableDictionary *)self->_halfChainedRecordMap removeObjectForKey:v20];
LABEL_23:
  [(NSMutableArray *)self->_fullyChainRecordBatch addObject:v23];
  [(NSMutableDictionary *)self->_fullyChainRecordInfoMap setObject:v4 forKey:v20];
  v30 = [v4 parentID];
  v31 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  v32 = [v31 serverZone];
  v33 = objc_msgSend(v30, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 0, v32, objc_msgSend(v4, "aliasTargetZoneIsShared"));

  v34 = [(NSMutableDictionary *)self->_halfChainedRecordMap objectForKeyedSubscript:v33];
  if (v34 || (objc_msgSend(v33, "brc_isZoneRootRecordID") & 1) != 0) {
    goto LABEL_40;
  }
  if (([(NSMutableSet *)self->_alreadyHalfChainedRecords containsObject:v33] & 1) == 0)
  {
    v59 = v7;
    v35 = [(NSMutableDictionary *)self->_fullyChainRecordInfoMap objectForKeyedSubscript:v33];

    if (v35)
    {
      v52 = brc_bread_crumbs();
      v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
        -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:]();
      }
    }
    v34 = (void *)[objc_alloc(*(Class *)(v9 + 728)) initWithRecordType:@"structure" recordID:v33];
    v57 = [(BRCAppLibrary *)self->_appLibrary db];
    v36 = [v4 parentID];
    v37 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
    v38 = [v37 dbRowID];
    v39 = (void *)[v57 fetch:@"SELECT pcs_state, item_stat_ckinfo FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v36, v38];

    v40 = v39;
    if ([v39 next])
    {
      if ([v39 intAtIndex:0] < 2)
      {
        v50 = [v39 objectOfClass:objc_opt_class() atIndex:1];
        v7 = v59;
        if (!v50)
        {
          v54 = brc_bread_crumbs();
          v55 = brc_default_log();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
            -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:]();
          }

          v7 = v59;
        }
        [v34 serializeSystemFields:v50];
        [v34 setWantsChainPCS:1];
        v51 = [[BRCHalfChainInfo alloc] initWithRecord:v34 ckInfo:v50];
        [(NSMutableDictionary *)self->_halfChainedRecordMap setObject:v51 forKeyedSubscript:v33];

        goto LABEL_39;
      }
      [(NSMutableSet *)self->_alreadyHalfChainedRecords addObject:v33];
    }
    else
    {
      v48 = brc_bread_crumbs();
      v49 = brc_default_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
        -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:]();
      }
    }
    v7 = v59;
LABEL_39:

LABEL_40:
  }
}

- (void)_chainPreppedRecordToParent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 recordID];
  uint64_t v6 = [(NSMutableDictionary *)self->_fullyChainRecordInfoMap objectForKeyedSubscript:v5];
  v7 = [v4 recordType];
  if ([v7 isEqualToString:@"content"])
  {
    unsigned int v8 = [v6 itemID];
    unint64_t v9 = [v5 zoneID];
    long long v10 = [v8 pcsChainDocumentStructureReferenceInZoneID:v9];

    [v4 setParent:v10];
  }
  else
  {
    if ([v7 isEqualToString:@"structure"])
    {
      long long v11 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
      long long v12 = [v11 serverZone];

      long long v13 = [v6 parentID];
      v14 = [v13 pcsChainParentReferenceInZone:v12];

      uint64_t v15 = [v6 parentID];
      v16 = [v15 validatingDirectoryReferenceInZone:v12];

      [v4 setParent:v14];
      [v4 setObject:v16 forKeyedSubscript:@"parent"];
    }
    else
    {
      long long v12 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[BRCPCSChainBatchInfo _chainPreppedRecordToParent:]();
      }
    }
  }
}

- (void)chainPreparedRecordBatch:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_should2PhasePCSChain)
  {
    uint64_t v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCPCSChainBatchInfo chainPreparedRecordBatch:]();
    }

    if ([v5 count])
    {
      unsigned int v8 = [v5 objectAtIndexedSubscript:0];
      unint64_t v9 = 1;
    }
    else
    {
      unsigned int v8 = 0;
      unint64_t v9 = 0;
    }
    v22 = [v8 recordID];
    if ([(NSMutableArray *)self->_fullyChainRecordBatch count])
    {
      unint64_t v23 = 0;
      do
      {
        v24 = [(NSMutableArray *)self->_fullyChainRecordBatch objectAtIndexedSubscript:v23];
        unsigned int v25 = [v24 recordID];
        v26 = v25;
        if (v22 && [v25 isEqual:v22])
        {
          [(NSMutableArray *)self->_fullyChainRecordBatch setObject:v8 atIndexedSubscript:v23];
          id v27 = v8;

          [v27 sanitizeShortTokenFields];
          unsigned int v28 = [v27 protectionData];

          if (!v28)
          {
            v30 = brc_bread_crumbs();
            v31 = brc_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v30;
              _os_log_fault_impl(&dword_1D353B000, v31, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: preppedRecord.protectionData%@", buf, 0xCu);
            }
          }
          if (v9 >= [v5 count])
          {

            uint64_t v29 = 0;
            unsigned int v8 = 0;
          }
          else
          {
            unsigned int v8 = [v5 objectAtIndexedSubscript:v9];

            uint64_t v29 = [v8 recordID];
            ++v9;
          }

          v22 = (void *)v29;
        }
        else
        {
          id v27 = v24;
        }
        [(BRCPCSChainBatchInfo *)self _chainPreppedRecordToParent:v27];

        ++v23;
      }
      while (v23 < [(NSMutableArray *)self->_fullyChainRecordBatch count]);
    }
    unint64_t v32 = v9 - (v8 != 0);
    unint64_t v33 = [(NSMutableDictionary *)self->_halfChainedRecordMap count] + v32;
    if (v33 != [v5 count])
    {
      v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[BRCPCSChainBatchInfo chainPreparedRecordBatch:]();
      }
    }
    for (; v32 < [v5 count]; ++v32)
    {
      v34 = [v5 objectAtIndexedSubscript:v32];
      halfChainedRecordMap = self->_halfChainedRecordMap;
      v36 = [v34 recordID];
      v37 = [(NSMutableDictionary *)halfChainedRecordMap objectForKeyedSubscript:v36];

      if (!v37)
      {
        v43 = brc_bread_crumbs();
        v38 = brc_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v43;
          _os_log_fault_impl(&dword_1D353B000, v38, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: halfChainInfo != nil%@", buf, 0xCu);
        }
      }
      [v37 setRecord:v34];
    }
  }
  else
  {
    if ([v4 count])
    {
      v41 = brc_bread_crumbs();
      v42 = brc_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        -[BRCPCSChainBatchInfo chainPreparedRecordBatch:]();
      }
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v10 = self->_fullyChainRecordBatch;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v10);
          }
          [(BRCPCSChainBatchInfo *)self _chainPreppedRecordToParent:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v48 objects:v55 count:16];
      }
      while (v12);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    unsigned int v8 = [(NSMutableDictionary *)self->_halfChainedRecordMap objectEnumerator];
    uint64_t v15 = [v8 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v8);
          }
          fullyChainRecordBatch = self->_fullyChainRecordBatch;
          unsigned int v21 = [*(id *)(*((void *)&v44 + 1) + 8 * j) record];
          [(NSMutableArray *)fullyChainRecordBatch insertObject:v21 atIndex:v17 + j];
        }
        uint64_t v16 = [v8 countByEnumeratingWithState:&v44 objects:v54 count:16];
        v17 += j;
      }
      while (v16);
    }
  }
}

- (unint64_t)batchCount
{
  uint64_t v3 = [(NSMutableDictionary *)self->_halfChainedRecordMap count];
  return [(NSMutableArray *)self->_fullyChainRecordBatch count] + v3;
}

- (unint64_t)chainedRecordsCount
{
  return [(NSMutableArray *)self->_fullyChainRecordBatch count];
}

- (NSArray)recordsForFirstPhase
{
  return (NSArray *)self->_recordsForFirstPhase;
}

- (NSArray)recordsForSecondPhase
{
  return (NSArray *)self->_fullyChainRecordBatch;
}

- (BOOL)should2PhasePCSChain
{
  return self->_should2PhasePCSChain;
}

- (NSDictionary)halfChainedRecordMap
{
  return &self->_halfChainedRecordMap->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_recordsForFirstPhase, 0);
  objc_storeStrong((id *)&self->_alreadyHalfChainedRecords, 0);
  objc_storeStrong((id *)&self->_halfChainedRecordMap, 0);
  objc_storeStrong((id *)&self->_fullyChainRecordInfoMap, 0);
  objc_storeStrong((id *)&self->_fullyChainRecordBatch, 0);
}

- (void)addFullyChainedRecordInfo:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parentCKInfo%@", v2, v3, v4, v5, v6);
}

- (void)addFullyChainedRecordInfo:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: No parent item?!?!%@", v2, v3, v4, v5, v6);
}

- (void)addFullyChainedRecordInfo:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_fullyChainRecordInfoMap[parentRecordID]%@", v2, v3, v4, v5, v6);
}

- (void)_chainPreppedRecordToParent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: unkown record type%@", v2, v3, v4, v5, v6);
}

- (void)chainPreparedRecordBatch:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: preppedRecords.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)chainPreparedRecordBatch:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: j + _halfChainedRecordMap.count == preppedRecords.count%@", v2, v3, v4, v5, v6);
}

- (void)chainPreparedRecordBatch:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Received records from first PCS step: %@%@");
}

@end