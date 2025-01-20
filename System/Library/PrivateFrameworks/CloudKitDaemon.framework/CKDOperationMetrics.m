@interface CKDOperationMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)walrusEnabled;
- (CKDOperationMetrics)init;
- (CKDOperationMetrics)initWithCoder:(id)a3;
- (NSArray)rangesCopy;
- (NSDate)startDate;
- (NSMutableArray)ranges;
- (NSMutableDictionary)chunkCountByChunkProfile;
- (NSMutableDictionary)fileCountByChunkProfile;
- (NSMutableDictionary)requestOperationCountsByType;
- (NSMutableDictionary)totalBytesByChunkProfile;
- (NSMutableSet)requestUUIDs;
- (NSSet)zoneIDs;
- (NSString)description;
- (double)duration;
- (double)executing;
- (double)queueing;
- (id)CKPropertiesDescription;
- (id)_initWithStartDate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRangeWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5;
- (unint64_t)assetsDownloaded;
- (unint64_t)assetsDownloadedFileSize;
- (unint64_t)assetsUploaded;
- (unint64_t)assetsUploadedFileSize;
- (unint64_t)bytesDownloaded;
- (unint64_t)bytesFulfilledByPeers;
- (unint64_t)bytesFulfilledLocally;
- (unint64_t)bytesResumed;
- (unint64_t)bytesUploaded;
- (unint64_t)connections;
- (unint64_t)connectionsCreated;
- (unint64_t)keyRollsSkippedBySizeCheck;
- (unint64_t)keysNotRemoved;
- (unint64_t)perRecordKeysRolled;
- (unint64_t)recordKeysRemoved;
- (unint64_t)recordsDeleted;
- (unint64_t)recordsDownloaded;
- (unint64_t)recordsUploaded;
- (unint64_t)requestCount;
- (unint64_t)retries;
- (unint64_t)shareKeysRolled;
- (unint64_t)zoneKeysRemoved;
- (unint64_t)zoneKeysRolled;
- (unint64_t)zoneishKeysRemoved;
- (unint64_t)zoneishKeysRolled;
- (void)addCKSpecificMetricsFromMetrics:(id)a3;
- (void)addRange:(id)a3;
- (void)addRequestOperationCountsByOperationType:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetsDownloaded:(unint64_t)a3;
- (void)setAssetsDownloadedFileSize:(unint64_t)a3;
- (void)setAssetsUploaded:(unint64_t)a3;
- (void)setAssetsUploadedFileSize:(unint64_t)a3;
- (void)setBytesDownloaded:(unint64_t)a3;
- (void)setBytesFulfilledByPeers:(unint64_t)a3;
- (void)setBytesFulfilledLocally:(unint64_t)a3;
- (void)setBytesResumed:(unint64_t)a3;
- (void)setBytesUploaded:(unint64_t)a3;
- (void)setChunkCountByChunkProfile:(id)a3;
- (void)setConnections:(unint64_t)a3;
- (void)setConnectionsCreated:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setExecuting:(double)a3;
- (void)setFileCountByChunkProfile:(id)a3;
- (void)setKeyRollsSkippedBySizeCheck:(unint64_t)a3;
- (void)setKeysNotRemoved:(unint64_t)a3;
- (void)setPerRecordKeysRolled:(unint64_t)a3;
- (void)setQueueing:(double)a3;
- (void)setRanges:(id)a3;
- (void)setRecordKeysRemoved:(unint64_t)a3;
- (void)setRecordsDeleted:(unint64_t)a3;
- (void)setRecordsDownloaded:(unint64_t)a3;
- (void)setRecordsUploaded:(unint64_t)a3;
- (void)setRequestCount:(unint64_t)a3;
- (void)setRequestOperationCountsByType:(id)a3;
- (void)setRequestUUIDs:(id)a3;
- (void)setRetries:(unint64_t)a3;
- (void)setShareKeysRolled:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setTotalBytesByChunkProfile:(id)a3;
- (void)setWalrusEnabled:(BOOL)a3;
- (void)setZoneIDs:(id)a3;
- (void)setZoneKeysRemoved:(unint64_t)a3;
- (void)setZoneKeysRolled:(unint64_t)a3;
- (void)setZoneishKeysRemoved:(unint64_t)a3;
- (void)setZoneishKeysRolled:(unint64_t)a3;
@end

@implementation CKDOperationMetrics

- (CKDOperationMetrics)init
{
  v4 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2);
  started = (CKDOperationMetrics *)objc_msgSend__initWithStartDate_(self, v5, (uint64_t)v4);

  return started;
}

- (id)_initWithStartDate:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDOperationMetrics;
  v6 = [(CKDOperationMetrics *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startDate, a3);
    uint64_t v8 = objc_opt_new();
    totalBytesByChunkProfile = v7->_totalBytesByChunkProfile;
    v7->_totalBytesByChunkProfile = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    chunkCountByChunkProfile = v7->_chunkCountByChunkProfile;
    v7->_chunkCountByChunkProfile = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    fileCountByChunkProfile = v7->_fileCountByChunkProfile;
    v7->_fileCountByChunkProfile = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CKDOperationMetrics alloc];
  v7 = objc_msgSend_startDate(self, v5, v6);
  uint64_t started = objc_msgSend__initWithStartDate_(v4, v8, (uint64_t)v7);

  uint64_t v12 = objc_msgSend_ranges(self, v10, v11);
  uint64_t v15 = objc_msgSend_mutableCopy(v12, v13, v14);
  v16 = *(void **)(started + 296);
  *(void *)(started + 296) = v15;

  objc_msgSend_duration(self, v17, v18);
  *(void *)(started + 24) = v19;
  objc_msgSend_queueing(self, v20, v21);
  *(void *)(started + 32) = v22;
  objc_msgSend_executing(self, v23, v24);
  *(void *)(started + 40) = v25;
  *(void *)(started + 48) = objc_msgSend_bytesUploaded(self, v26, v27);
  *(void *)(started + 56) = objc_msgSend_bytesDownloaded(self, v28, v29);
  *(void *)(started + 64) = objc_msgSend_connections(self, v30, v31);
  *(void *)(started + 72) = objc_msgSend_connectionsCreated(self, v32, v33);
  *(void *)(started + 88) = objc_msgSend_bytesFulfilledLocally(self, v34, v35);
  *(void *)(started + 96) = objc_msgSend_bytesResumed(self, v36, v37);
  *(void *)(started + 104) = objc_msgSend_recordsUploaded(self, v38, v39);
  *(void *)(started + 112) = objc_msgSend_recordsDownloaded(self, v40, v41);
  *(void *)(started + 128) = objc_msgSend_assetsUploaded(self, v42, v43);
  *(void *)(started + 136) = objc_msgSend_assetsUploadedFileSize(self, v44, v45);
  *(void *)(started + 144) = objc_msgSend_assetsDownloaded(self, v46, v47);
  *(void *)(started + 152) = objc_msgSend_assetsDownloadedFileSize(self, v48, v49);
  *(void *)(started + 120) = objc_msgSend_recordsDeleted(self, v50, v51);
  *(void *)(started + 168) = objc_msgSend_retries(self, v52, v53);
  *(void *)(started + 160) = objc_msgSend_requestCount(self, v54, v55);
  v58 = objc_msgSend_requestOperationCountsByType(self, v56, v57);
  uint64_t v61 = objc_msgSend_mutableCopy(v58, v59, v60);
  v62 = *(void **)(started + 264);
  *(void *)(started + 264) = v61;

  v65 = objc_msgSend_totalBytesByChunkProfile(self, v63, v64);
  uint64_t v68 = objc_msgSend_mutableCopy(v65, v66, v67);
  v69 = *(void **)(started + 272);
  *(void *)(started + 272) = v68;

  v72 = objc_msgSend_chunkCountByChunkProfile(self, v70, v71);
  uint64_t v75 = objc_msgSend_mutableCopy(v72, v73, v74);
  v76 = *(void **)(started + 280);
  *(void *)(started + 280) = v75;

  v79 = objc_msgSend_fileCountByChunkProfile(self, v77, v78);
  uint64_t v82 = objc_msgSend_mutableCopy(v79, v80, v81);
  v83 = *(void **)(started + 288);
  *(void *)(started + 288) = v82;

  *(void *)(started + 184) = objc_msgSend_zoneishKeysRolled(self, v84, v85);
  *(void *)(started + 192) = objc_msgSend_perRecordKeysRolled(self, v86, v87);
  *(void *)(started + 200) = objc_msgSend_zoneKeysRolled(self, v88, v89);
  *(void *)(started + 208) = objc_msgSend_shareKeysRolled(self, v90, v91);
  *(void *)(started + 216) = objc_msgSend_keyRollsSkippedBySizeCheck(self, v92, v93);
  *(unsigned char *)(started + 8) = objc_msgSend_walrusEnabled(self, v94, v95);
  *(void *)(started + 224) = objc_msgSend_zoneKeysRemoved(self, v96, v97);
  *(void *)(started + 232) = objc_msgSend_zoneishKeysRemoved(self, v98, v99);
  *(void *)(started + 240) = objc_msgSend_recordKeysRemoved(self, v100, v101);
  *(void *)(started + 248) = objc_msgSend_keysNotRemoved(self, v102, v103);
  uint64_t v106 = objc_msgSend_zoneIDs(self, v104, v105);
  v107 = *(void **)(started + 256);
  *(void *)(started + 256) = v106;

  return (id)started;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  id v5 = objc_msgSend_startDate(self, a2, v2);
  objc_msgSend_duration(self, v6, v7);
  uint64_t v9 = v8;
  objc_msgSend_queueing(self, v10, v11);
  uint64_t v13 = v12;
  objc_msgSend_executing(self, v14, v15);
  uint64_t v17 = v16;
  uint64_t v20 = objc_msgSend_bytesUploaded(self, v18, v19);
  uint64_t v23 = objc_msgSend_bytesDownloaded(self, v21, v22);
  uint64_t v26 = objc_msgSend_requestCount(self, v24, v25);
  uint64_t v29 = objc_msgSend_connections(self, v27, v28);
  uint64_t v32 = objc_msgSend_connectionsCreated(self, v30, v31);
  v34 = objc_msgSend_stringWithFormat_(v4, v33, @"startDate=%@, duration=%0.3f, queueing=%0.3f, executing=%0.3f, bytesUploaded=%lu, bytesDownloaded=%lu, requests=%lu, connections=%lu, connectionsCreated=%lu", v5, v9, v13, v17, v20, v23, v26, v29, v32);

  return v34;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDOperationMetrics *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSMutableArray)ranges
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_ranges)
  {
    uint64_t v3 = objc_opt_new();
    ranges = v2->_ranges;
    v2->_ranges = (NSMutableArray *)v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_ranges;
  return v5;
}

- (NSArray)rangesCopy
{
  uint64_t v3 = objc_msgSend_copy(self->_ranges, a2, v2);
  return (NSArray *)v3;
}

- (void)addRange:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_ranges(self, v5, v6);
  objc_sync_enter(v7);
  uint64_t v10 = objc_msgSend_ranges(self, v8, v9);
  objc_msgSend_addObject_(v10, v11, (uint64_t)v4);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v14 = objc_msgSend_ranges(self, v12, v13, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, v36, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v33;
    double v20 = 0.0;
    double v21 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (!objc_msgSend_operationState(v23, v16, v17))
        {
          objc_msgSend_duration(v23, v24, v25);
          double v20 = v20 + v26;
        }
        if (objc_msgSend_operationState(v23, v24, v25) == 1)
        {
          objc_msgSend_duration(v23, v16, v17);
          double v21 = v21 + v27;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v32, v36, 16);
    }
    while (v18);
  }
  else
  {
    double v20 = 0.0;
    double v21 = 0.0;
  }

  objc_msgSend_setQueueing_(self, v28, v29, v20);
  objc_msgSend_setExecuting_(self, v30, v31, v21);
  objc_sync_exit(v7);
}

- (NSMutableDictionary)requestOperationCountsByType
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_requestOperationCountsByType)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestOperationCountsByType = v2->_requestOperationCountsByType;
    v2->_requestOperationCountsByType = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_requestOperationCountsByType;
  return v5;
}

- (void)addRequestOperationCountsByOperationType:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_requestOperationCountsByType(self, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v9 = objc_msgSend_allKeys(v4, v7, v8);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v37, v41, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v38;
    id v36 = v9;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v36);
        }
        uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend_requestOperationCountsByType(self, v11, v12, obj);
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, v16);

        double v20 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v23 = objc_msgSend_integerValue(v19, v21, v22);
        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v4, v24, v16);
        uint64_t v28 = objc_msgSend_integerValue(v25, v26, v27);
        v30 = objc_msgSend_numberWithInteger_(v20, v29, v28 + v23);
        long long v33 = objc_msgSend_requestOperationCountsByType(self, v31, v32);
        objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v30, v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v9 = v36;
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v11, (uint64_t)&v37, v41, 16);
    }
    while (v13);
  }

  objc_sync_exit(obj);
}

- (id)newRangeWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v7 = a4;
  uint64_t v8 = [CKOperationStateTimeRange alloc];
  uint64_t started = objc_msgSend_initWithOperationState_startDate_duration_(v8, v9, a3, v7, a5);

  return started;
}

- (void)addCKSpecificMetricsFromMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordsUploaded(v4, v5, v6);
  uint64_t v10 = objc_msgSend_recordsUploaded(self, v8, v9);
  objc_msgSend_setRecordsUploaded_(self, v11, v10 + v7);
  uint64_t v14 = objc_msgSend_recordsDownloaded(v4, v12, v13);
  uint64_t v17 = objc_msgSend_recordsDownloaded(self, v15, v16);
  objc_msgSend_setRecordsDownloaded_(self, v18, v17 + v14);
  uint64_t v21 = objc_msgSend_recordsDeleted(v4, v19, v20);
  uint64_t v24 = objc_msgSend_recordsDeleted(self, v22, v23);
  objc_msgSend_setRecordsDeleted_(self, v25, v24 + v21);
  uint64_t v28 = objc_msgSend_assetsUploaded(v4, v26, v27);
  uint64_t v31 = objc_msgSend_assetsUploaded(self, v29, v30);
  objc_msgSend_setAssetsUploaded_(self, v32, v31 + v28);
  uint64_t v35 = objc_msgSend_assetsUploadedFileSize(v4, v33, v34);
  uint64_t v38 = objc_msgSend_assetsUploadedFileSize(self, v36, v37);
  objc_msgSend_setAssetsUploadedFileSize_(self, v39, v38 + v35);
  uint64_t v42 = objc_msgSend_assetsDownloaded(v4, v40, v41);
  uint64_t v45 = objc_msgSend_assetsDownloaded(self, v43, v44);
  objc_msgSend_setAssetsDownloaded_(self, v46, v45 + v42);
  uint64_t v49 = objc_msgSend_assetsDownloadedFileSize(v4, v47, v48);
  uint64_t v52 = objc_msgSend_assetsDownloadedFileSize(self, v50, v51);
  objc_msgSend_setAssetsDownloadedFileSize_(self, v53, v52 + v49);
  uint64_t v56 = objc_msgSend_retries(v4, v54, v55);
  uint64_t v59 = objc_msgSend_retries(self, v57, v58);
  objc_msgSend_setRetries_(self, v60, v59 + v56);
  uint64_t v63 = objc_msgSend_requestCount(v4, v61, v62);
  uint64_t v66 = objc_msgSend_requestCount(self, v64, v65);
  objc_msgSend_setRequestCount_(self, v67, v66 + v63);
  v70 = objc_msgSend_requestUUIDs(v4, v68, v69);
  uint64_t v73 = objc_msgSend_count(v70, v71, v72);
  uint64_t v76 = objc_msgSend_requestCount(self, v74, v75);
  objc_msgSend_setRequestCount_(self, v77, v76 + v73);

  v80 = objc_msgSend_requestOperationCountsByType(v4, v78, v79);
  objc_msgSend_addRequestOperationCountsByOperationType_(self, v81, (uint64_t)v80);

  uint64_t v84 = objc_msgSend_zoneishKeysRolled(v4, v82, v83);
  uint64_t v87 = objc_msgSend_zoneishKeysRolled(self, v85, v86);
  objc_msgSend_setZoneishKeysRolled_(self, v88, v87 + v84);
  uint64_t v91 = objc_msgSend_perRecordKeysRolled(v4, v89, v90);
  uint64_t v94 = objc_msgSend_perRecordKeysRolled(self, v92, v93);
  objc_msgSend_setPerRecordKeysRolled_(self, v95, v94 + v91);
  uint64_t v98 = objc_msgSend_zoneKeysRolled(v4, v96, v97);
  uint64_t v101 = objc_msgSend_zoneKeysRolled(self, v99, v100);
  objc_msgSend_setZoneKeysRolled_(self, v102, v101 + v98);
  uint64_t v105 = objc_msgSend_shareKeysRolled(v4, v103, v104);
  uint64_t v108 = objc_msgSend_shareKeysRolled(self, v106, v107);
  objc_msgSend_setShareKeysRolled_(self, v109, v108 + v105);
  uint64_t v112 = objc_msgSend_keyRollsSkippedBySizeCheck(v4, v110, v111);
  uint64_t v115 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v113, v114);
  objc_msgSend_setKeyRollsSkippedBySizeCheck_(self, v116, v115 + v112);
  uint64_t v119 = objc_msgSend_zoneKeysRemoved(v4, v117, v118);
  uint64_t v122 = objc_msgSend_zoneKeysRemoved(self, v120, v121);
  objc_msgSend_setZoneKeysRemoved_(self, v123, v122 + v119);
  uint64_t v126 = objc_msgSend_zoneishKeysRemoved(v4, v124, v125);
  uint64_t v129 = objc_msgSend_zoneishKeysRemoved(self, v127, v128);
  objc_msgSend_setZoneishKeysRemoved_(self, v130, v129 + v126);
  uint64_t v133 = objc_msgSend_recordKeysRemoved(v4, v131, v132);
  uint64_t v136 = objc_msgSend_recordKeysRemoved(self, v134, v135);
  objc_msgSend_setRecordKeysRemoved_(self, v137, v136 + v133);
  uint64_t v140 = objc_msgSend_keysNotRemoved(v4, v138, v139);

  uint64_t v144 = objc_msgSend_keysNotRemoved(self, v141, v142) + v140;
  objc_msgSend_setKeysNotRemoved_(self, v143, v144);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v142 = a3;
  id v4 = (void *)MEMORY[0x1C8789E70]();
  uint64_t v7 = objc_msgSend_startDate(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v142, v8, (uint64_t)v7, @"startDate");

  objc_msgSend_duration(self, v9, v10);
  objc_msgSend_encodeDouble_forKey_(v142, v11, @"duration");
  objc_msgSend_queueing(self, v12, v13);
  objc_msgSend_encodeDouble_forKey_(v142, v14, @"queueing");
  objc_msgSend_executing(self, v15, v16);
  objc_msgSend_encodeDouble_forKey_(v142, v17, @"executing");
  uint64_t v20 = objc_msgSend_bytesUploaded(self, v18, v19);
  objc_msgSend_encodeInt64_forKey_(v142, v21, v20, @"bytesUploaded");
  uint64_t v24 = objc_msgSend_bytesDownloaded(self, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v142, v25, v24, @"bytesDownloaded");
  uint64_t v28 = objc_msgSend_connections(self, v26, v27);
  objc_msgSend_encodeInt64_forKey_(v142, v29, v28, @"connections");
  uint64_t v32 = objc_msgSend_connectionsCreated(self, v30, v31);
  objc_msgSend_encodeInt64_forKey_(v142, v33, v32, @"connectionsCreated");
  uint64_t v36 = objc_msgSend_bytesFulfilledByPeers(self, v34, v35);
  objc_msgSend_encodeInt64_forKey_(v142, v37, v36, @"bytesFulfilledByPeers");
  uint64_t v40 = objc_msgSend_bytesFulfilledLocally(self, v38, v39);
  objc_msgSend_encodeInt64_forKey_(v142, v41, v40, @"bytesFulfilledLocally");
  uint64_t v44 = objc_msgSend_bytesResumed(self, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v142, v45, v44, @"bytesResumed");
  uint64_t v48 = objc_msgSend_recordsUploaded(self, v46, v47);
  objc_msgSend_encodeInt64_forKey_(v142, v49, v48, @"recordsUploaded");
  uint64_t v52 = objc_msgSend_recordsDownloaded(self, v50, v51);
  objc_msgSend_encodeInt64_forKey_(v142, v53, v52, @"recordsDownloaded");
  uint64_t v56 = objc_msgSend_recordsDeleted(self, v54, v55);
  objc_msgSend_encodeInt64_forKey_(v142, v57, v56, @"recordsDeleted");
  uint64_t v60 = objc_msgSend_assetsUploaded(self, v58, v59);
  objc_msgSend_encodeInt64_forKey_(v142, v61, v60, @"assetsUploaded");
  uint64_t v64 = objc_msgSend_assetsUploadedFileSize(self, v62, v63);
  objc_msgSend_encodeInt64_forKey_(v142, v65, v64, @"assetsUploadedFileSize");
  uint64_t v68 = objc_msgSend_assetsDownloaded(self, v66, v67);
  objc_msgSend_encodeInt64_forKey_(v142, v69, v68, @"assetsDownloaded");
  uint64_t v72 = objc_msgSend_assetsDownloadedFileSize(self, v70, v71);
  objc_msgSend_encodeInt64_forKey_(v142, v73, v72, @"assetsDownloadedFileSize");
  uint64_t v76 = objc_msgSend_retries(self, v74, v75);
  objc_msgSend_encodeInt64_forKey_(v142, v77, v76, @"retries");
  uint64_t v80 = objc_msgSend_requestCount(self, v78, v79);
  objc_msgSend_encodeInt64_forKey_(v142, v81, v80, @"requestCount");
  uint64_t v84 = objc_msgSend_requestOperationCountsByType(self, v82, v83);
  objc_msgSend_encodeObject_forKey_(v142, v85, (uint64_t)v84, @"requestOperationCountsByType");

  v88 = objc_msgSend_totalBytesByChunkProfile(self, v86, v87);
  objc_msgSend_encodeObject_forKey_(v142, v89, (uint64_t)v88, @"totalBytesByChunkProfile");

  v92 = objc_msgSend_chunkCountByChunkProfile(self, v90, v91);
  objc_msgSend_encodeObject_forKey_(v142, v93, (uint64_t)v92, @"chunkCountByChunkProfile");

  v96 = objc_msgSend_fileCountByChunkProfile(self, v94, v95);
  objc_msgSend_encodeObject_forKey_(v142, v97, (uint64_t)v96, @"fileCountByChunkProfile");

  uint64_t v100 = objc_msgSend_zoneishKeysRolled(self, v98, v99);
  objc_msgSend_encodeInt64_forKey_(v142, v101, v100, @"zoneishKeysRolled");
  uint64_t v104 = objc_msgSend_perRecordKeysRolled(self, v102, v103);
  objc_msgSend_encodeInt64_forKey_(v142, v105, v104, @"perRecordKeysRolled");
  uint64_t v108 = objc_msgSend_zoneKeysRolled(self, v106, v107);
  objc_msgSend_encodeInt64_forKey_(v142, v109, v108, @"zoneKeysRolled");
  uint64_t v112 = objc_msgSend_shareKeysRolled(self, v110, v111);
  objc_msgSend_encodeInt64_forKey_(v142, v113, v112, @"shareKeysRolled");
  uint64_t v116 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v114, v115);
  objc_msgSend_encodeInt64_forKey_(v142, v117, v116, @"keyRollsSkippedBySizeCheck");
  uint64_t v120 = objc_msgSend_zoneKeysRemoved(self, v118, v119);
  objc_msgSend_encodeInt64_forKey_(v142, v121, v120, @"zoneKeysRemoved");
  uint64_t v124 = objc_msgSend_zoneishKeysRemoved(self, v122, v123);
  objc_msgSend_encodeInt64_forKey_(v142, v125, v124, @"zoneishKeysRemoved");
  uint64_t v128 = objc_msgSend_recordKeysRemoved(self, v126, v127);
  objc_msgSend_encodeInt64_forKey_(v142, v129, v128, @"recordKeysRemoved");
  uint64_t v132 = objc_msgSend_keysNotRemoved(self, v130, v131);
  objc_msgSend_encodeInt64_forKey_(v142, v133, v132, @"keysNotRemoved");
  uint64_t v136 = objc_msgSend_walrusEnabled(self, v134, v135);
  objc_msgSend_encodeBool_forKey_(v142, v137, v136, @"walrusEnabled");
  uint64_t v140 = objc_msgSend_zoneIDs(self, v138, v139);
  objc_msgSend_encodeObject_forKey_(v142, v141, (uint64_t)v140, @"zoneNames");
}

- (CKDOperationMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v101.receiver = self;
  v101.super_class = (Class)CKDOperationMetrics;
  id v5 = [(CKDOperationMetrics *)&v101 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"startDate");
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v9;

    objc_msgSend_decodeDoubleForKey_(v4, v11, @"duration");
    v5->_duration = v12;
    objc_msgSend_decodeDoubleForKey_(v4, v13, @"queueing");
    v5->_queueing = v14;
    objc_msgSend_decodeDoubleForKey_(v4, v15, @"executing");
    v5->_executing = v16;
    v5->_bytesUploaded = objc_msgSend_decodeInt64ForKey_(v4, v17, @"bytesUploaded");
    v5->_bytesDownloaded = objc_msgSend_decodeInt64ForKey_(v4, v18, @"bytesDownloaded");
    v5->_connections = objc_msgSend_decodeInt64ForKey_(v4, v19, @"connections");
    v5->_connectionsCreated = objc_msgSend_decodeInt64ForKey_(v4, v20, @"connectionsCreated");
    v5->_bytesFulfilledByPeers = objc_msgSend_decodeInt64ForKey_(v4, v21, @"bytesFulfilledByPeers");
    v5->_bytesFulfilledLocally = objc_msgSend_decodeInt64ForKey_(v4, v22, @"bytesFulfilledLocally");
    v5->_bytesResumed = objc_msgSend_decodeInt64ForKey_(v4, v23, @"bytesResumed");
    v5->_recordsUploaded = objc_msgSend_decodeInt64ForKey_(v4, v24, @"recordsUploaded");
    v5->_recordsDownloaded = objc_msgSend_decodeInt64ForKey_(v4, v25, @"recordsDownloaded");
    v5->_recordsDeleted = objc_msgSend_decodeInt64ForKey_(v4, v26, @"recordsDeleted");
    v5->_assetsUploaded = objc_msgSend_decodeInt64ForKey_(v4, v27, @"assetsUploaded");
    v5->_assetsUploadedFileSize = objc_msgSend_decodeInt64ForKey_(v4, v28, @"assetsUploadedFileSize");
    v5->_assetsDownloaded = objc_msgSend_decodeInt64ForKey_(v4, v29, @"assetsDownloaded");
    v5->_assetsDownloadedFileSize = objc_msgSend_decodeInt64ForKey_(v4, v30, @"assetsDownloadedFileSize");
    v5->_retries = objc_msgSend_decodeInt64ForKey_(v4, v31, @"retries");
    v5->_requestCount = objc_msgSend_decodeInt64ForKey_(v4, v32, @"requestCount");
    long long v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v37 = objc_msgSend_setWithObjects_(v33, v36, v34, v35, 0);
    uint64_t v39 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v37, @"requestOperationCountsByType");
    uint64_t v42 = objc_msgSend_mutableCopy(v39, v40, v41);
    requestOperationCountsByType = v5->_requestOperationCountsByType;
    v5->_requestOperationCountsByType = (NSMutableDictionary *)v42;

    uint64_t v44 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    uint64_t v49 = objc_msgSend_setWithObjects_(v44, v48, v45, v46, v47, 0);
    uint64_t v51 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v50, (uint64_t)v49, @"totalBytesByChunkProfile");
    uint64_t v54 = objc_msgSend_mutableCopy(v51, v52, v53);
    totalBytesByChunkProfile = v5->_totalBytesByChunkProfile;
    v5->_totalBytesByChunkProfile = (NSMutableDictionary *)v54;

    uint64_t v56 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    uint64_t v61 = objc_msgSend_setWithObjects_(v56, v60, v57, v58, v59, 0);
    uint64_t v63 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v62, (uint64_t)v61, @"chunkCountByChunkProfile");
    uint64_t v66 = objc_msgSend_mutableCopy(v63, v64, v65);
    chunkCountByChunkProfile = v5->_chunkCountByChunkProfile;
    v5->_chunkCountByChunkProfile = (NSMutableDictionary *)v66;

    uint64_t v68 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v69 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v73 = objc_msgSend_setWithObjects_(v68, v72, v69, v70, v71, 0);
    uint64_t v75 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v74, (uint64_t)v73, @"fileCountByChunkProfile");
    uint64_t v78 = objc_msgSend_mutableCopy(v75, v76, v77);
    fileCountByChunkProfile = v5->_fileCountByChunkProfile;
    v5->_fileCountByChunkProfile = (NSMutableDictionary *)v78;

    v5->_zoneishKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v80, @"zoneishKeysRolled");
    v5->_perRecordKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v81, @"perRecordKeysRolled");
    v5->_zoneKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v82, @"zoneKeysRolled");
    v5->_shareKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v83, @"shareKeysRolled");
    v5->_keyRollsSkippedBySizeCheck = objc_msgSend_decodeInt64ForKey_(v4, v84, @"keyRollsSkippedBySizeCheck");
    v5->_zoneKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v85, @"zoneKeysRemoved");
    v5->_zoneishKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v86, @"zoneishKeysRemoved");
    v5->_recordKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v87, @"recordKeysRemoved");
    v5->_keysNotRemoved = objc_msgSend_decodeInt64ForKey_(v4, v88, @"keysNotRemoved");
    v5->_walrusEnabled = objc_msgSend_decodeBoolForKey_(v4, v89, @"walrusEnabled");
    uint64_t v90 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v91 = objc_opt_class();
    uint64_t v93 = objc_msgSend_setWithObjects_(v90, v92, v91, 0);
    uint64_t v95 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v94, (uint64_t)v93, @"zoneNames");
    uint64_t v98 = objc_msgSend_mutableCopy(v95, v96, v97);
    zoneIDs = v5->_zoneIDs;
    v5->_zoneIDs = (NSSet *)v98;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKDOperationMetrics *)a3;
  if (self == v4)
  {
    char v199 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_38;
    }
    uint64_t v7 = objc_msgSend_startDate(self, v5, v6);
    uint64_t v10 = objc_msgSend_startDate(v4, v8, v9);
    int isEqualToDate = objc_msgSend_isEqualToDate_(v7, v11, (uint64_t)v10);

    if (!isEqualToDate) {
      goto LABEL_38;
    }
    objc_msgSend_duration(self, v13, v14);
    double v16 = v15;
    objc_msgSend_duration(v4, v17, v18);
    if (v16 != v21) {
      goto LABEL_38;
    }
    objc_msgSend_queueing(self, v19, v20);
    double v23 = v22;
    objc_msgSend_queueing(v4, v24, v25);
    if (v23 != v28) {
      goto LABEL_38;
    }
    objc_msgSend_executing(self, v26, v27);
    double v30 = v29;
    objc_msgSend_executing(v4, v31, v32);
    if (v30 != v35) {
      goto LABEL_38;
    }
    uint64_t v36 = objc_msgSend_bytesUploaded(self, v33, v34);
    if (v36 != objc_msgSend_bytesUploaded(v4, v37, v38)) {
      goto LABEL_38;
    }
    uint64_t v41 = objc_msgSend_bytesDownloaded(self, v39, v40);
    if (v41 != objc_msgSend_bytesDownloaded(v4, v42, v43)) {
      goto LABEL_38;
    }
    uint64_t v46 = objc_msgSend_connections(self, v44, v45);
    if (v46 != objc_msgSend_connections(v4, v47, v48)) {
      goto LABEL_38;
    }
    uint64_t v51 = objc_msgSend_connectionsCreated(self, v49, v50);
    if (v51 != objc_msgSend_connectionsCreated(v4, v52, v53)) {
      goto LABEL_38;
    }
    uint64_t v56 = objc_msgSend_bytesFulfilledByPeers(self, v54, v55);
    if (v56 != objc_msgSend_bytesFulfilledByPeers(v4, v57, v58)) {
      goto LABEL_38;
    }
    uint64_t v61 = objc_msgSend_bytesFulfilledLocally(self, v59, v60);
    if (v61 != objc_msgSend_bytesFulfilledLocally(v4, v62, v63)) {
      goto LABEL_38;
    }
    uint64_t v66 = objc_msgSend_bytesResumed(self, v64, v65);
    if (v66 != objc_msgSend_bytesResumed(v4, v67, v68)) {
      goto LABEL_38;
    }
    uint64_t v71 = objc_msgSend_recordsUploaded(self, v69, v70);
    if (v71 != objc_msgSend_recordsUploaded(v4, v72, v73)) {
      goto LABEL_38;
    }
    uint64_t v76 = objc_msgSend_recordsDownloaded(self, v74, v75);
    if (v76 != objc_msgSend_recordsDownloaded(v4, v77, v78)) {
      goto LABEL_38;
    }
    uint64_t v81 = objc_msgSend_recordsDeleted(self, v79, v80);
    if (v81 != objc_msgSend_recordsDeleted(v4, v82, v83)) {
      goto LABEL_38;
    }
    uint64_t v86 = objc_msgSend_assetsUploaded(self, v84, v85);
    if (v86 != objc_msgSend_assetsUploaded(v4, v87, v88)) {
      goto LABEL_38;
    }
    uint64_t v91 = objc_msgSend_assetsUploadedFileSize(self, v89, v90);
    if (v91 != objc_msgSend_assetsUploadedFileSize(v4, v92, v93)) {
      goto LABEL_38;
    }
    uint64_t v96 = objc_msgSend_assetsDownloaded(self, v94, v95);
    if (v96 != objc_msgSend_assetsDownloaded(v4, v97, v98)) {
      goto LABEL_38;
    }
    uint64_t v101 = objc_msgSend_assetsDownloadedFileSize(self, v99, v100);
    if (v101 != objc_msgSend_assetsDownloadedFileSize(v4, v102, v103)) {
      goto LABEL_38;
    }
    uint64_t v106 = objc_msgSend_retries(self, v104, v105);
    if (v106 != objc_msgSend_retries(v4, v107, v108)) {
      goto LABEL_38;
    }
    uint64_t v111 = objc_msgSend_requestCount(self, v109, v110);
    if (v111 != objc_msgSend_requestCount(v4, v112, v113)) {
      goto LABEL_38;
    }
    uint64_t v116 = objc_msgSend_requestOperationCountsByType(self, v114, v115);
    uint64_t v119 = objc_msgSend_requestOperationCountsByType(v4, v117, v118);
    int isEqual = objc_msgSend_isEqual_(v116, v120, (uint64_t)v119);

    if (!isEqual) {
      goto LABEL_38;
    }
    uint64_t v124 = objc_msgSend_totalBytesByChunkProfile(self, v122, v123);
    uint64_t v127 = objc_msgSend_totalBytesByChunkProfile(v4, v125, v126);
    int v128 = CKObjectsAreBothNilOrEqual();

    if (!v128) {
      goto LABEL_38;
    }
    uint64_t v131 = objc_msgSend_chunkCountByChunkProfile(self, v129, v130);
    v134 = objc_msgSend_chunkCountByChunkProfile(v4, v132, v133);
    int v135 = CKObjectsAreBothNilOrEqual();

    if (!v135) {
      goto LABEL_38;
    }
    v138 = objc_msgSend_fileCountByChunkProfile(self, v136, v137);
    v141 = objc_msgSend_fileCountByChunkProfile(v4, v139, v140);
    int v142 = CKObjectsAreBothNilOrEqual();

    if (!v142) {
      goto LABEL_38;
    }
    uint64_t v145 = objc_msgSend_zoneishKeysRolled(self, v143, v144);
    if (v145 != objc_msgSend_zoneishKeysRolled(v4, v146, v147)) {
      goto LABEL_38;
    }
    uint64_t v150 = objc_msgSend_perRecordKeysRolled(self, v148, v149);
    if (v150 != objc_msgSend_perRecordKeysRolled(v4, v151, v152)) {
      goto LABEL_38;
    }
    uint64_t v155 = objc_msgSend_zoneKeysRolled(self, v153, v154);
    if (v155 != objc_msgSend_zoneKeysRolled(v4, v156, v157)) {
      goto LABEL_38;
    }
    uint64_t v160 = objc_msgSend_shareKeysRolled(self, v158, v159);
    if (v160 == objc_msgSend_shareKeysRolled(v4, v161, v162)
      && (uint64_t v165 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v163, v164),
          v165 == objc_msgSend_keyRollsSkippedBySizeCheck(v4, v166, v167))
      && (int v170 = objc_msgSend_walrusEnabled(self, v168, v169),
          v170 == objc_msgSend_walrusEnabled(v4, v171, v172))
      && (uint64_t v175 = objc_msgSend_zoneKeysRemoved(self, v173, v174), v175 == objc_msgSend_zoneKeysRemoved(v4, v176, v177))
      && (uint64_t v180 = objc_msgSend_zoneishKeysRemoved(self, v178, v179),
          v180 == objc_msgSend_zoneishKeysRemoved(v4, v181, v182))
      && (uint64_t v185 = objc_msgSend_recordKeysRemoved(self, v183, v184), v185 == objc_msgSend_recordKeysRemoved(v4, v186, v187))&& (v190 = objc_msgSend_keysNotRemoved(self, v188, v189), v190 == objc_msgSend_keysNotRemoved(v4, v191, v192)))
    {
      v195 = objc_msgSend_zoneIDs(self, v193, v194);
      v198 = objc_msgSend_zoneIDs(v4, v196, v197);
      char v199 = CKObjectsAreBothNilOrEqual();
    }
    else
    {
LABEL_38:
      char v199 = 0;
    }
  }

  return v199;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)queueing
{
  return self->_queueing;
}

- (void)setQueueing:(double)a3
{
  self->_queueing = a3;
}

- (double)executing
{
  return self->_executing;
}

- (void)setExecuting:(double)a3
{
  self->_executing = a3;
}

- (unint64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(unint64_t)a3
{
  self->_bytesUploaded = a3;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (unint64_t)connections
{
  return self->_connections;
}

- (void)setConnections:(unint64_t)a3
{
  self->_connections = a3;
}

- (unint64_t)connectionsCreated
{
  return self->_connectionsCreated;
}

- (void)setConnectionsCreated:(unint64_t)a3
{
  self->_connectionsCreated = a3;
}

- (unint64_t)bytesFulfilledByPeers
{
  return self->_bytesFulfilledByPeers;
}

- (void)setBytesFulfilledByPeers:(unint64_t)a3
{
  self->_bytesFulfilledByPeers = a3;
}

- (unint64_t)bytesFulfilledLocally
{
  return self->_bytesFulfilledLocally;
}

- (void)setBytesFulfilledLocally:(unint64_t)a3
{
  self->_bytesFulfilledLocally = a3;
}

- (unint64_t)bytesResumed
{
  return self->_bytesResumed;
}

- (void)setBytesResumed:(unint64_t)a3
{
  self->_bytesResumed = a3;
}

- (unint64_t)recordsUploaded
{
  return self->_recordsUploaded;
}

- (void)setRecordsUploaded:(unint64_t)a3
{
  self->_recordsUploaded = a3;
}

- (unint64_t)recordsDownloaded
{
  return self->_recordsDownloaded;
}

- (void)setRecordsDownloaded:(unint64_t)a3
{
  self->_recordsDownloaded = a3;
}

- (unint64_t)recordsDeleted
{
  return self->_recordsDeleted;
}

- (void)setRecordsDeleted:(unint64_t)a3
{
  self->_recordsDeleted = a3;
}

- (unint64_t)assetsUploaded
{
  return self->_assetsUploaded;
}

- (void)setAssetsUploaded:(unint64_t)a3
{
  self->_assetsUploaded = a3;
}

- (unint64_t)assetsUploadedFileSize
{
  return self->_assetsUploadedFileSize;
}

- (void)setAssetsUploadedFileSize:(unint64_t)a3
{
  self->_assetsUploadedFileSize = a3;
}

- (unint64_t)assetsDownloaded
{
  return self->_assetsDownloaded;
}

- (void)setAssetsDownloaded:(unint64_t)a3
{
  self->_assetsDownloaded = a3;
}

- (unint64_t)assetsDownloadedFileSize
{
  return self->_assetsDownloadedFileSize;
}

- (void)setAssetsDownloadedFileSize:(unint64_t)a3
{
  self->_assetsDownloadedFileSize = a3;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (unint64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(unint64_t)a3
{
  self->_retries = a3;
}

- (NSMutableSet)requestUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequestUUIDs:(id)a3
{
}

- (BOOL)walrusEnabled
{
  return self->_walrusEnabled;
}

- (void)setWalrusEnabled:(BOOL)a3
{
  self->_walrusEnabled = a3;
}

- (unint64_t)zoneishKeysRolled
{
  return self->_zoneishKeysRolled;
}

- (void)setZoneishKeysRolled:(unint64_t)a3
{
  self->_zoneishKeysRolled = a3;
}

- (unint64_t)perRecordKeysRolled
{
  return self->_perRecordKeysRolled;
}

- (void)setPerRecordKeysRolled:(unint64_t)a3
{
  self->_perRecordKeysRolled = a3;
}

- (unint64_t)zoneKeysRolled
{
  return self->_zoneKeysRolled;
}

- (void)setZoneKeysRolled:(unint64_t)a3
{
  self->_zoneKeysRolled = a3;
}

- (unint64_t)shareKeysRolled
{
  return self->_shareKeysRolled;
}

- (void)setShareKeysRolled:(unint64_t)a3
{
  self->_shareKeysRolled = a3;
}

- (unint64_t)keyRollsSkippedBySizeCheck
{
  return self->_keyRollsSkippedBySizeCheck;
}

- (void)setKeyRollsSkippedBySizeCheck:(unint64_t)a3
{
  self->_keyRollsSkippedBySizeCheck = a3;
}

- (unint64_t)zoneKeysRemoved
{
  return self->_zoneKeysRemoved;
}

- (void)setZoneKeysRemoved:(unint64_t)a3
{
  self->_zoneKeysRemoved = a3;
}

- (unint64_t)zoneishKeysRemoved
{
  return self->_zoneishKeysRemoved;
}

- (void)setZoneishKeysRemoved:(unint64_t)a3
{
  self->_zoneishKeysRemoved = a3;
}

- (unint64_t)recordKeysRemoved
{
  return self->_recordKeysRemoved;
}

- (void)setRecordKeysRemoved:(unint64_t)a3
{
  self->_recordKeysRemoved = a3;
}

- (unint64_t)keysNotRemoved
{
  return self->_keysNotRemoved;
}

- (void)setKeysNotRemoved:(unint64_t)a3
{
  self->_keysNotRemoved = a3;
}

- (NSSet)zoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (void)setZoneIDs:(id)a3
{
}

- (void)setRequestOperationCountsByType:(id)a3
{
}

- (NSMutableDictionary)totalBytesByChunkProfile
{
  return self->_totalBytesByChunkProfile;
}

- (void)setTotalBytesByChunkProfile:(id)a3
{
}

- (NSMutableDictionary)chunkCountByChunkProfile
{
  return self->_chunkCountByChunkProfile;
}

- (void)setChunkCountByChunkProfile:(id)a3
{
}

- (NSMutableDictionary)fileCountByChunkProfile
{
  return self->_fileCountByChunkProfile;
}

- (void)setFileCountByChunkProfile:(id)a3
{
}

- (void)setRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_fileCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_chunkCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_totalBytesByChunkProfile, 0);
  objc_storeStrong((id *)&self->_requestOperationCountsByType, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end