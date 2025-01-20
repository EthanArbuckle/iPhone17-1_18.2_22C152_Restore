@interface CKDModifyRecordsOperation
+ (BOOL)_claimPackagesInRecord:(id)a3 error:(id *)a4;
+ (id)nameForState:(unint64_t)a3;
+ (int64_t)isPredominatelyDownload;
- (BOOL)_hasHandlerInState:(unint64_t)a3;
- (BOOL)_needsSigningPCS;
- (BOOL)_prepareRecordsForSave;
- (BOOL)_shouldToposortInContainerID:(id)a3;
- (BOOL)_topoSortRecords;
- (BOOL)alwaysFetchPCSFromServer;
- (BOOL)atomic;
- (BOOL)canSetPreviousProtectionEtag;
- (BOOL)haveOutstandingHandlers;
- (BOOL)includeMergeableDeltasInModifyRecordsRequest;
- (BOOL)isOperationType:(int)a3;
- (BOOL)makeStateTransition;
- (BOOL)markAsParticipantNeedsNewInvitationToken;
- (BOOL)originatingFromDaemon;
- (BOOL)requestNeedsUserPublicKeys;
- (BOOL)retriedRecords;
- (BOOL)retryPCSFailures;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldModifyRecordsInDatabase;
- (BOOL)shouldOnlySaveAssetContent;
- (BOOL)shouldReportRecordsInFlight;
- (BOOL)supportsClearAssetEncryption;
- (BOOL)trustProtectionData;
- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4;
- (C2RequestOptions)streamingAssetRequestOptions;
- (CKDDecryptRecordsOperation)recordDecryptOperation;
- (CKDModifyRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDProtocolTranslator)translator;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSArray)userPublicKeys;
- (NSData)cachedGlobalPerUserBoundaryKeyData;
- (NSData)clientChangeTokenData;
- (NSDictionary)assetUUIDToExpectedProperties;
- (NSDictionary)conflictLosersToResolveByRecordID;
- (NSDictionary)handlersByRecordID;
- (NSDictionary)packageUUIDToExpectedProperties;
- (NSDictionary)parentsByRecordID;
- (NSDictionary)pluginFieldsForRecordDeletesByID;
- (NSDictionary)recordIDsToDeleteToEtags;
- (NSDictionary)recordIDsToDeleteToSigningPCSIdentity;
- (NSMapTable)handlersByAsset;
- (NSMapTable)handlersByAssetNeedingRecordFetch;
- (NSMutableDictionary)modifyHandlersByZoneID;
- (OS_dispatch_queue)modifyRecordsQueue;
- (id)_createModifyRequestWithRecordsToSave:(id)a3 recordsToDelete:(id)a4 recordsToDeleteToEtags:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 handlersByRecordID:(id)a7 sendMergeableDeltas:(BOOL)a8;
- (id)_prepareAssetsForUpload;
- (id)_setBoundaryKeyOnAssetsToUpload:(id)a3;
- (id)_topoSortRecordsForHandlers:(id)a3;
- (id)activityCreate;
- (id)analyticsPayload;
- (id)deleteCompletionBlock;
- (id)handlerForDeleteWithRecordID:(id)a3;
- (id)handlerForSaveWithRecord:(id)a3;
- (id)recordsInFlightBlock;
- (id)relevantZoneIDs;
- (id)requestedFieldsByRecordIDForRecords:(id)a3;
- (id)saveCompletionBlock;
- (id)saveProgressBlock;
- (id)uploadCompletionBlock;
- (int)operationType;
- (int)saveAttempts;
- (int64_t)savePolicy;
- (void)_applySideEffects;
- (void)_batchFetchAssetRecordsForRereferencing;
- (void)_clearProtectionDataIfNotEntitled;
- (void)_continueRecordsModify;
- (void)_determineEnvironment;
- (void)_didCompleteRecordFetchOperation:(id)a3 assetArrayByRecordID:(id)a4;
- (void)_enumerateHandlersInState:(unint64_t)a3 withBlock:(id)a4;
- (void)_fetchContainerScopedUserID;
- (void)_fetchGlobalPerUserBoundaryKey;
- (void)_fetchPackageRecordsForRereferencing;
- (void)_fetchRecordPCSData;
- (void)_fetchRecordsForRereferencing;
- (void)_fetchSharePCSData;
- (void)_fetchShareParticipants;
- (void)_fetchUserPublicKeys;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleDecryptionFailure:(id)a3 forRecordID:(id)a4;
- (void)_handleMergeableDeltaSavedForRecordID:(id)a3 key:(id)a4 result:(id)a5;
- (void)_handleRecordDeleted:(id)a3 handler:(id)a4 responseCode:(id)a5;
- (void)_handleRecordSaved:(id)a3 handler:(id)a4 etag:(id)a5 dateStatistics:(id)a6 expirationDate:(id)a7 responseCode:(id)a8 keysAssociatedWithETag:(id)a9 recordForOplockFailure:(id)a10 serverRecord:(id)a11;
- (void)_handleReplaceDeltasRequest:(id)a3 result:(id)a4;
- (void)_markRecordHandlersAsUploaded;
- (void)_performCallbacksForAtomicZoneHandlers:(id)a3;
- (void)_performCallbacksForNonAtomicZoneHandlers:(id)a3;
- (void)_performHandlerCallbacks;
- (void)_prepareForUpload;
- (void)_prepareParentPCS;
- (void)_reallyHandleRecordSaved:(id)a3 handler:(id)a4 etag:(id)a5 dateStatistics:(id)a6 expirationDate:(id)a7 responseCode:(id)a8 keysAssociatedWithETag:(id)a9 recordForOplockFailure:(id)a10 decryptedServerRecord:(id)a11;
- (void)_reportRecordsInFlight;
- (void)_uploadAssets;
- (void)_uploadMergeableDeltas;
- (void)_verifyRecordEncryption;
- (void)assetArray:(id)a3 didFetchRecord:(id)a4 error:(id)a5;
- (void)callbackWithMetadata:(id)a3 error:(id)a4;
- (void)deleteCallbackWithMetadata:(id)a3 error:(id)a4;
- (void)finishDecryption;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)packageArray:(id)a3 didFetchRecord:(id)a4 error:(id)a5;
- (void)saveCallbackWithMetadata:(id)a3 error:(id)a4;
- (void)setAlwaysFetchPCSFromServer:(BOOL)a3;
- (void)setAssetUUIDToExpectedProperties:(id)a3;
- (void)setAtomic:(BOOL)a3;
- (void)setCachedGlobalPerUserBoundaryKeyData:(id)a3;
- (void)setCanSetPreviousProtectionEtag:(BOOL)a3;
- (void)setClientChangeTokenData:(id)a3;
- (void)setConflictLosersToResolveByRecordID:(id)a3;
- (void)setDeleteCompletionBlock:(id)a3;
- (void)setHandlersByAsset:(id)a3;
- (void)setHandlersByAssetNeedingRecordFetch:(id)a3;
- (void)setHandlersByRecordID:(id)a3;
- (void)setHaveOutstandingHandlers:(BOOL)a3;
- (void)setIncludeMergeableDeltasInModifyRecordsRequest:(BOOL)a3;
- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3;
- (void)setModifyHandlersByZoneID:(id)a3;
- (void)setModifyRecordsQueue:(id)a3;
- (void)setOriginatingFromDaemon:(BOOL)a3;
- (void)setPackageUUIDToExpectedProperties:(id)a3;
- (void)setParentsByRecordID:(id)a3;
- (void)setPluginFieldsForRecordDeletesByID:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordIDsToDeleteToEtags:(id)a3;
- (void)setRecordIDsToDeleteToSigningPCSIdentity:(id)a3;
- (void)setRecordsInFlightBlock:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setRequestNeedsUserPublicKeys:(BOOL)a3;
- (void)setRetriedRecords:(BOOL)a3;
- (void)setRetryPCSFailures:(BOOL)a3;
- (void)setSaveAttempts:(int)a3;
- (void)setSaveCompletionBlock:(id)a3;
- (void)setSavePolicy:(int64_t)a3;
- (void)setSaveProgressBlock:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setShouldModifyRecordsInDatabase:(BOOL)a3;
- (void)setShouldOnlySaveAssetContent:(BOOL)a3;
- (void)setShouldReportRecordsInFlight:(BOOL)a3;
- (void)setStreamingAssetRequestOptions:(id)a3;
- (void)setTranslator:(id)a3;
- (void)setTrustProtectionData:(BOOL)a3;
- (void)setUploadCompletionBlock:(id)a3;
- (void)setUserPublicKeys:(id)a3;
@end

@implementation CKDModifyRecordsOperation

- (CKDModifyRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v229 = *MEMORY[0x1E4F143B8];
  v223.receiver = self;
  v223.super_class = (Class)CKDModifyRecordsOperation;
  id v199 = a3;
  id v188 = a4;
  v200 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v223, sel_initWithOperationInfo_container_, v199);
  if (v200)
  {
    uint64_t v5 = objc_opt_new();
    modifyHandlersByZoneID = v200->_modifyHandlersByZoneID;
    v200->_modifyHandlersByZoneID = (NSMutableDictionary *)v5;

    v200->_originatingFromDaemon = objc_msgSend_originatingFromDaemon(v199, v7, v8);
    v200->_markAsParticipantNeedsNewInvitationToken = objc_msgSend_markAsParticipantNeedsNewInvitationToken(v199, v9, v10);
    v200->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v199, v11, v12);
    id v197 = (id)objc_opt_new();
    uint64_t v219 = 0;
    v220 = &v219;
    uint64_t v221 = 0x2020000000;
    uint64_t v222 = 0;
    v15 = objc_msgSend_recordsToSave(v199, v13, v14);
    v200->_hasRecordsToSave = objc_msgSend_count(v15, v16, v17) != 0;
    long long v215 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    obuint64_t j = v15;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v215, v228, 16);
    if (v21)
    {
      unint64_t v22 = 0;
      id v193 = *(id *)v216;
      uint64_t v195 = 0;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(id *)v216 != v193) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v215 + 1) + 8 * i);
          v25 = objc_msgSend_recordID(v24, v19, v20);
          v28 = objc_msgSend_zoneID(v25, v26, v27);

          v31 = objc_msgSend_objectForKeyedSubscript_(v200->_modifyHandlersByZoneID, v29, (uint64_t)v28);
          if (!v31)
          {
            v31 = objc_opt_new();
            objc_msgSend_setObject_forKeyedSubscript_(v200->_modifyHandlersByZoneID, v32, (uint64_t)v31, v28);
          }
          v33 = objc_msgSend_handlerForSaveWithRecord_(v200, v30, (uint64_t)v24);
          objc_msgSend_setBatchRank_(v33, v34, v195 + i);
          objc_msgSend_addObject_(v31, v35, (uint64_t)v33);
          if ((objc_msgSend_originatingFromDaemon(v199, v36, v37) & 1) == 0)
          {
            v40 = objc_opt_class();
            id v214 = 0;
            char v42 = objc_msgSend__claimPackagesInRecord_error_(v40, v41, (uint64_t)v24, &v214);
            id v44 = v214;
            if ((v42 & 1) == 0)
            {
              objc_msgSend_setState_(v33, v43, 12);
              objc_msgSend_setError_(v33, v45, (uint64_t)v44);
            }
          }
          v46 = objc_msgSend_assetUUIDToExpectedProperties(v199, v38, v39);
          objc_msgSend_setAssetUUIDToExpectedProperties_(v33, v47, (uint64_t)v46);

          v50 = objc_msgSend_recordID(v24, v48, v49);
          objc_msgSend_setObject_forKeyedSubscript_(v197, v51, (uint64_t)v33, v50);

          uint64_t v54 = objc_msgSend_size(v24, v52, v53);
          ++v220[3];
          uint64_t v227 = objc_opt_class();
          v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v55, (uint64_t)&v227, 1);
          v213[0] = MEMORY[0x1E4F143A8];
          v213[1] = 3221225472;
          v213[2] = sub_1C4F9DACC;
          v213[3] = &unk_1E64F79D8;
          v213[4] = &v219;
          objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v24, v57, (uint64_t)v56, v213);

          v22 += v54;
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v215, v228, 16);
        v195 += i;
      }
      while (v21);
    }
    else
    {
      unint64_t v22 = 0;
    }
    unint64_t v196 = v22;

    v60 = objc_msgSend_recordIDsToDelete(v199, v58, v59);
    v200->_hasRecordsToDelete = objc_msgSend_count(v60, v61, v62) != 0;
    long long v209 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    id v194 = v60;
    uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v63, (uint64_t)&v209, v226, 16);
    if (v66)
    {
      uint64_t v67 = *(void *)v210;
      uint64_t v68 = *MEMORY[0x1E4F19D48];
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v210 != v67) {
            objc_enumerationMutation(v194);
          }
          v70 = *(void **)(*((void *)&v209 + 1) + 8 * j);
          v71 = objc_msgSend_zoneID(v70, v64, v65);
          v74 = objc_msgSend_objectForKeyedSubscript_(v200->_modifyHandlersByZoneID, v72, (uint64_t)v71);
          if (!v74)
          {
            v74 = objc_opt_new();
            objc_msgSend_setObject_forKeyedSubscript_(v200->_modifyHandlersByZoneID, v75, (uint64_t)v74, v71);
          }
          v76 = objc_msgSend_handlerForDeleteWithRecordID_(v200, v73, (uint64_t)v70);
          v79 = objc_msgSend_recordIDsToDeleteToEtags(v199, v77, v78);
          v81 = objc_msgSend_objectForKeyedSubscript_(v79, v80, (uint64_t)v70);
          objc_msgSend_setEtag_(v76, v82, (uint64_t)v81);

          objc_msgSend_addObject_(v74, v83, (uint64_t)v76);
          objc_msgSend_setObject_forKeyedSubscript_(v197, v84, (uint64_t)v76, v70);
          if (objc_msgSend_markAsParticipantNeedsNewInvitationToken(v199, v85, v86))
          {
            v89 = objc_msgSend_recordName(v70, v87, v88);
            int isEqualToString = objc_msgSend_isEqualToString_(v89, v90, v68);

            if (isEqualToString) {
              v200->_requestNeedsUserPublicKeys = 1;
            }
          }
          uint64_t v92 = objc_msgSend_size(v70, v87, v88);

          v196 += v92;
        }
        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v64, (uint64_t)&v209, v226, 16);
      }
      while (v66);
    }

    objc_storeStrong((id *)&v200->_handlersByRecordID, v197);
    long long v207 = 0u;
    long long v208 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    objc_msgSend_allValues(v200->_modifyHandlersByZoneID, v93, v94);
    id v189 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v95, (uint64_t)&v205, v225, 16);
    if (v192)
    {
      uint64_t v190 = *(void *)v206;
      uint64_t v96 = *MEMORY[0x1E4F19DD8];
      do
      {
        for (uint64_t k = 0; k != v192; ++k)
        {
          if (*(void *)v206 != v190) {
            objc_enumerationMutation(v189);
          }
          v97 = *(void **)(*((void *)&v205 + 1) + 8 * k);
          v98 = objc_opt_new();
          long long v203 = 0u;
          long long v204 = 0u;
          long long v201 = 0u;
          long long v202 = 0u;
          id v99 = v97;
          uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v201, v224, 16);
          if (v103)
          {
            uint64_t v104 = *(void *)v202;
            do
            {
              for (uint64_t m = 0; m != v103; ++m)
              {
                if (*(void *)v202 != v104) {
                  objc_enumerationMutation(v99);
                }
                v106 = *(void **)(*((void *)&v201 + 1) + 8 * m);
                v107 = objc_msgSend_recordID(v106, v101, v102);
                v109 = objc_msgSend_objectForKeyedSubscript_(v98, v108, (uint64_t)v107);

                if (v109)
                {
                  v112 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v110, v96, 1017, @"You can't pass multiple instances of the same record to a CKModifyRecordsOperation");
                  objc_msgSend_setState_(v106, v113, 12);
                  objc_msgSend_setError_(v106, v114, (uint64_t)v112);
                  v117 = objc_msgSend_recordID(v106, v115, v116);
                  v119 = objc_msgSend_objectForKeyedSubscript_(v98, v118, (uint64_t)v117);

                  objc_msgSend_setState_(v119, v120, 12);
                  objc_msgSend_setError_(v119, v121, (uint64_t)v112);
                }
                else
                {
                  v112 = objc_msgSend_recordID(v106, v110, v111);
                  objc_msgSend_setObject_forKeyedSubscript_(v98, v122, (uint64_t)v106, v112);
                }
              }
              uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v101, (uint64_t)&v201, v224, 16);
            }
            while (v103);
          }
        }
        uint64_t v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v123, (uint64_t)&v205, v225, 16);
      }
      while (v192);
    }

    uint64_t v126 = objc_msgSend_conflictLosersToResolveByRecordID(v199, v124, v125);
    conflictLosersToResolveByRecordID = v200->_conflictLosersToResolveByRecordID;
    v200->_conflictLosersToResolveByRecordID = (NSDictionary *)v126;

    uint64_t v130 = objc_msgSend_pluginFieldsForRecordDeletesByID(v199, v128, v129);
    pluginFieldsForRecordDeletesByID = v200->_pluginFieldsForRecordDeletesByID;
    v200->_pluginFieldsForRecordDeletesByID = (NSDictionary *)v130;

    v134 = objc_msgSend_recordsToSave(v199, v132, v133);
    if (objc_msgSend_count(v134, v135, v136))
    {
      v200->_haveOutstandingHandlers = 1;
    }
    else
    {
      v139 = objc_msgSend_recordIDsToDelete(v199, v137, v138);
      v200->_haveOutstandingHandlers = objc_msgSend_count(v139, v140, v141) != 0;
    }
    v200->_savePolicy = objc_msgSend_savePolicy(v199, v142, v143);
    uint64_t v146 = objc_msgSend_clientChangeTokenData(v199, v144, v145);
    clientChangeTokenData = v200->_clientChangeTokenData;
    v200->_clientChangeTokenData = (NSData *)v146;

    v200->_shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(v199, v148, v149);
    v200->_atomic = objc_msgSend_atomic(v199, v150, v151);
    v200->_retryPCSFailures = objc_msgSend_shouldSkipPCSRetryBehavior(v199, v152, v153) ^ 1;
    v200->_shouldReportRecordsInFlight = objc_msgSend_shouldReportRecordsInFlight(v199, v154, v155);
    uint64_t v158 = objc_msgSend_createSerialQueue(v200, v156, v157);
    modifyRecordsQueue = v200->_modifyRecordsQueue;
    v200->_modifyRecordsQueue = (OS_dispatch_queue *)v158;

    v200->_shouldModifyRecordsInDatabase = objc_msgSend_shouldModifyRecordsInDatabase(v199, v160, v161);
    v200->_alwaysFetchPCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(v199, v162, v163);
    uint64_t v166 = objc_msgSend_assetUUIDToExpectedProperties(v199, v164, v165);
    assetUUIDToExpectedProperties = v200->_assetUUIDToExpectedProperties;
    v200->_assetUUIDToExpectedProperties = (NSDictionary *)v166;

    uint64_t v170 = objc_msgSend_packageUUIDToExpectedProperties(v199, v168, v169);
    packageUUIDToExpectedProperties = v200->_packageUUIDToExpectedProperties;
    v200->_packageUUIDToExpectedProperties = (NSDictionary *)v170;

    v174 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v172, v173);
    unint64_t v177 = objc_msgSend_maximumMergeableDeltaRequestSize(v174, v175, v176);

    BOOL v180 = v200->_atomic || v196 < v177 && (unint64_t)v220[3] < *MEMORY[0x1E4F19CB0];
    v200->_includeMergeableDeltasInModifyRecordsRequest = v180;
    if (*MEMORY[0x1E4F1A4E0])
    {
      v181 = objc_msgSend_unitTestOverrides(v200, v178, v179);
      v183 = objc_msgSend_objectForKeyedSubscript_(v181, v182, @"ForceSeparateRequestForMergeableDeltaUpload");
      int v186 = objc_msgSend_BOOLValue(v183, v184, v185);

      if (v186) {
        v200->_includeMergeableDeltasInModifyRecordsRequest = 0;
      }
    }

    _Block_object_dispose(&v219, 8);
  }

  return v200;
}

- (BOOL)retryPCSFailures
{
  BOOL result = (!*MEMORY[0x1E4F1A4E0]
         || (objc_msgSend_unitTestOverrides(self, a2, v2),
             v4 = objc_claimAutoreleasedReturnValue(),
             objc_msgSend_objectForKeyedSubscript_(v4, v5, @"DontRetryPCSFailures"),
             v6 = objc_claimAutoreleasedReturnValue(),
             v6,
             v4,
             !v6))
        && self->_retryPCSFailures;
  return result;
}

+ (BOOL)_claimPackagesInRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4F9DD44;
  v15 = sub_1C4F9DD54;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4F9DD5C;
  v10[3] = &unk_1E64F7A00;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend_claimPackagesWithSuccessBlock_failureBlock_completionBlock_(v5, v6, 0, v10, &unk_1F2044610);
  if (a4)
  {
    v7 = (void *)v12[5];
    if (v7) {
      *a4 = v7;
    }
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/modify-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)_hasHandlerInState:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v4 = objc_msgSend_modifyHandlersByZoneID(self, a2, a3);
  v7 = objc_msgSend_allValues(v4, v5, v6);

  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, v34, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v14 = v13;
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v25, v33, 16);
        if (v16)
        {
          uint64_t v19 = v16;
          uint64_t v20 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(v14);
              }
              if (objc_msgSend_state(*(void **)(*((void *)&v25 + 1) + 8 * j), v17, v18) == a3)
              {

                BOOL v23 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v25, v33, 16);
            if (v19) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v22, (uint64_t)&v29, v34, 16);
      BOOL v23 = 0;
    }
    while (v10);
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_19:

  return v23;
}

- (void)_enumerateHandlersInState:(unint64_t)a3 withBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v9 = objc_msgSend_modifyHandlersByZoneID(self, v6, v7);
    uint64_t v12 = objc_msgSend_allValues(v9, v10, v11);

    obuint64_t j = v12;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v34, v39, 16);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v18 = v17;
          uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v30, v38, 16);
          if (v20)
          {
            uint64_t v23 = v20;
            uint64_t v24 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v31 != v24) {
                  objc_enumerationMutation(v18);
                }
                long long v26 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                if (objc_msgSend_state(v26, v21, v22) == a3) {
                  v8[2](v8, v26);
                }
              }
              uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v30, v38, 16);
            }
            while (v23);
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v34, v39, 16);
      }
      while (v15);
    }
  }
}

- (int)operationType
{
  BOOL hasRecordsToSave = self->_hasRecordsToSave;
  int result = 210;
  if (!hasRecordsToSave)
  {
    if (self->_hasRecordsToDelete) {
      return 214;
    }
    else {
      return 210;
    }
  }
  return result;
}

- (BOOL)isOperationType:(int)a3
{
  if (a3 == 214)
  {
    uint64_t v3 = 465;
    return *((unsigned char *)&self->super.super.super.super.isa + v3) != 0;
  }
  if (a3 == 210)
  {
    uint64_t v3 = 464;
    return *((unsigned char *)&self->super.super.super.super.isa + v3) != 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CKDModifyRecordsOperation;
  return -[CKDOperation isOperationType:](&v5, sel_isOperationType_);
}

- (id)handlerForSaveWithRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_modifyHandlerWithShare_operation_(CKDModifyShareHandler, v5, (uint64_t)v4, self);
  }
  else {
  uint64_t v6 = objc_msgSend_modifyHandlerWithRecord_operation_(CKDModifyRecordHandler, v5, (uint64_t)v4, self);
  }

  return v6;
}

- (id)handlerForDeleteWithRecordID:(id)a3
{
  return (id)MEMORY[0x1F4181798](CKDModifyRecordHandler, sel_modifyHandlerForDeleteWithRecordID_operation_, a3);
}

- (CKDDecryptRecordsOperation)recordDecryptOperation
{
  os_activity_t v2 = self;
  objc_sync_enter(v2);
  decryptOperation = v2->_decryptOperation;
  if (!decryptOperation || objc_msgSend_isFinished(decryptOperation, v3, v4))
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = objc_opt_class();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1C4F9E4C0;
    v11[3] = &unk_1E64F0210;
    v11[4] = v2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v2, v8, v7, v6, v11);
  }
  objc_sync_exit(v2);

  uint64_t v9 = v2->_decryptOperation;
  return v9;
}

- (void)finishDecryption
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  decryptOperation = obj->_decryptOperation;
  if (decryptOperation && (objc_msgSend_isFinished(decryptOperation, v2, v3) & 1) == 0) {
    objc_msgSend_finishDecryption(obj->_decryptOperation, v5, v6);
  }
  objc_sync_exit(obj);
}

- (BOOL)makeStateTransition
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  objc_msgSend__performHandlerCallbacks(self, a2, v2);
  switch(objc_msgSend_state(self, v4, v5))
  {
    case 1:
      objc_msgSend_setState_(self, v6, 2);
      objc_msgSend__determineEnvironment(self, v10, v11);
      return 1;
    case 2:
      objc_msgSend_setState_(self, v6, 3);
      objc_msgSend__fetchContainerScopedUserID(self, v12, v13);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v6, 4);
      objc_msgSend__fetchUserPublicKeys(self, v14, v15);
      return 1;
    case 4:
      objc_msgSend_setState_(self, v6, 5);
      objc_msgSend__applySideEffects(self, v16, v17);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v6, 6);
      return MEMORY[0x1F4181798](self, sel__topoSortRecords, v18);
    case 6:
    case 17:
      goto LABEL_2;
    case 7:
      objc_msgSend_setState_(self, v6, 9);
      objc_msgSend__fetchSharePCSData(self, v19, v20);
      return 1;
    case 8:
      objc_msgSend_setState_(self, v6, 10);
      objc_msgSend__fetchRecordsForRereferencing(self, v21, v22);
      return 1;
    case 9:
      objc_msgSend_setState_(self, v6, 8);
      objc_msgSend__fetchRecordPCSData(self, v23, v24);
      return 1;
    case 10:
      objc_msgSend_setState_(self, v6, 11);
      objc_msgSend__prepareForUpload(self, v25, v26);
      return 1;
    case 11:
      objc_msgSend_setState_(self, v6, 12);
      objc_msgSend__uploadAssets(self, v27, v28);
      return 1;
    case 12:
      if (objc_msgSend_shouldOnlySaveAssetContent(self, v6, v7)) {
        goto LABEL_26;
      }
      objc_msgSend_setState_(self, v29, 13);
      return MEMORY[0x1F4181798](self, sel__prepareRecordsForSave, v30);
    case 13:
      long long v31 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v6, v7);
      int shouldDecryptRecordsBeforeSave = objc_msgSend_shouldDecryptRecordsBeforeSave(v31, v32, v33);

      long long v35 = self;
      if (!shouldDecryptRecordsBeforeSave) {
        goto LABEL_22;
      }
      objc_msgSend_setState_(self, v6, 14);
      objc_msgSend__verifyRecordEncryption(self, v36, v37);
      return 1;
    case 14:
      long long v35 = self;
LABEL_22:
      if (!objc_msgSend_shouldReportRecordsInFlight(v35, v6, v7)) {
        goto LABEL_24;
      }
      objc_msgSend_setState_(self, v6, 15);
      objc_msgSend__reportRecordsInFlight(self, v38, v39);
      break;
    case 15:
LABEL_24:
      if (objc_msgSend_shouldModifyRecordsInDatabase(self, v6, v7))
      {
        objc_msgSend_setState_(self, v29, 16);
        objc_msgSend__continueRecordsModify(self, v40, v41);
      }
      else
      {
LABEL_26:
        objc_msgSend_setState_(self, v29, 18);
        objc_msgSend__markRecordHandlersAsUploaded(self, v42, v43);
      }
      break;
    case 16:
      if (objc_msgSend__hasHandlerInState_(self, v6, 10)
        && (int v46 = objc_msgSend_saveAttempts(self, v44, v45),
            objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v47, v48),
            uint64_t v49 = objc_claimAutoreleasedReturnValue(),
            int v52 = objc_msgSend_PCSRetryCount(v49, v50, v51),
            v49,
            v46 <= v52))
      {
        objc_msgSend_setState_(self, v44, 17);
        objc_msgSend__fetchShareParticipants(self, v68, v69);
      }
      else
      {
        objc_msgSend_setState_(self, v44, 18);
      }
      break;
    case 18:
      objc_msgSend_setState_(self, v6, 19);
      objc_msgSend__uploadMergeableDeltas(self, v53, v54);
      break;
    case 19:
      if (objc_msgSend_haveOutstandingHandlers(self, v6, v7)
        && (int v57 = objc_msgSend_saveAttempts(self, v55, v56),
            objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v58, v59),
            v60 = objc_claimAutoreleasedReturnValue(),
            int v63 = objc_msgSend_PCSRetryCount(v60, v61, v62),
            v60,
            v57 <= v63))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v70 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          v71 = v70;
          v74 = objc_msgSend_modifyHandlersByZoneID(self, v72, v73);
          int v76 = 138412290;
          v77 = v74;
          _os_log_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_INFO, "Records needed PCS info re-fetched: %@", (uint8_t *)&v76, 0xCu);
        }
LABEL_2:
        objc_msgSend_setState_(self, v6, 7);
        objc_msgSend__prepareParentPCS(self, v8, v9);
      }
      else
      {
        objc_msgSend_setState_(self, v55, 0xFFFFFFFFLL);
        uint64_t v66 = objc_msgSend_error(self, v64, v65);
        objc_msgSend_finishWithError_(self, v67, (uint64_t)v66);
      }
      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 0x12)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDModifyRecordsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E64F7E00[a3 - 2];
  }
  return v3;
}

- (void)callbackWithMetadata:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  LODWORD(a4) = objc_msgSend_isDelete(v6, v8, v9);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  if (a4)
  {
    uint64_t v13 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    uint64_t v14 = sub_1C4F9EB98;
  }
  else
  {
    uint64_t v13 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    uint64_t v14 = sub_1C4F9EBA8;
  }
  v13[2] = v14;
  v13[3] = &unk_1E64F0120;
  v13[4] = self;
  v13[5] = v6;
  v13[6] = v7;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(v12, v13);
}

- (void)saveCallbackWithMetadata:(id)a3 error:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_saveCompletionBlockCalled(v7, v9, v10))
  {
    int v76 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    v79 = objc_msgSend_record(v7, v77, v78);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v80, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 672, @"saveCallbackWithMetadata:error: called twice on %@", v79);
  }
  uint64_t v13 = objc_msgSend_serverRecord(v7, v11, v12);
  id v16 = objc_msgSend_streamingAssetRequestOptions(self, v14, v15);
  objc_msgSend_setStreamingAssetRequestOptions_(v13, v17, (uint64_t)v16);

  if (v8)
  {
    uint64_t v20 = objc_msgSend_saveCompletionBlock(self, v18, v19);

    if (!v20) {
      goto LABEL_13;
    }
    objc_msgSend_saveCompletionBlock(self, v21, v22);
    uint64_t v23 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_record(v7, v24, v25);
    uint64_t v29 = objc_msgSend_recordID(v26, v27, v28);
    ((void (**)(void, void *, void, void, id))v23)[2](v23, v29, 0, 0, v8);
    goto LABEL_12;
  }
  objc_msgSend_error(v7, v18, v19);
  long long v32 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
  if (v32) {
    goto LABEL_9;
  }
  uint64_t v33 = objc_msgSend_saveProgressBlock(self, v30, v31);

  if (v33)
  {
    objc_msgSend_saveProgressBlock(self, v34, v35);
    long long v32 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_record(v7, v36, v37);
    uint64_t v41 = objc_msgSend_recordID(v38, v39, v40);
    ((void (**)(void, void *, double))v32)[2](v32, v41, 1.0);

LABEL_9:
  }
  char v42 = objc_msgSend_saveCompletionBlock(self, v34, v35);

  if (!v42) {
    goto LABEL_13;
  }
  objc_msgSend_saveCompletionBlock(self, v21, v22);
  uint64_t v23 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v26 = objc_msgSend_record(v7, v43, v44);
  uint64_t v29 = objc_msgSend_recordID(v26, v45, v46);
  uint64_t v49 = objc_msgSend_record(v7, v47, v48);
  int v52 = objc_msgSend_serverRecord(v7, v50, v51);
  v55 = objc_msgSend_error(v7, v53, v54);
  ((void (**)(void, void *, void *, void *, void *))v23)[2](v23, v29, v49, v52, v55);

LABEL_12:
LABEL_13:
  if (objc_msgSend_didAttemptZoneWideShareKeyRoll(v7, v21, v22))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v58 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v63 = v58;
      uint64_t v66 = objc_msgSend_operationID(self, v64, v65);
      *(_DWORD *)buf = 138543618;
      v84 = v66;
      __int16 v85 = 2114;
      uint64_t v86 = 0x1F2058370;
      _os_log_debug_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", buf, 0x16u);

      if (v8) {
        goto LABEL_18;
      }
    }
    else if (v8)
    {
LABEL_18:
      id v61 = v8;
LABEL_21:
      uint64_t v67 = v61;
      uint64_t v68 = objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v62, (uint64_t)v61);
      AnalyticsSendEvent();

      goto LABEL_22;
    }
    objc_msgSend_error(v7, v59, v60);
    id v61 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  if (!v8)
  {
    uint64_t v69 = objc_msgSend_error(v7, v56, v57);

    if (!v69)
    {
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = sub_1C4F9F024;
      v81[3] = &unk_1E64F4438;
      v81[4] = self;
      id v82 = v7;
      objc_msgSend_updateCloudKitMetrics_(self, v70, (uint64_t)v81);
    }
  }
  objc_msgSend_setSaveCompletionBlockCalled_(v7, v56, 1);
  uint64_t v73 = objc_msgSend_record(v7, v71, v72);
  objc_msgSend_releasePackages(v73, v74, v75);
}

- (void)deleteCallbackWithMetadata:(id)a3 error:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_deleteCompletionBlock(self, v7, v8);

  if (v9)
  {
    objc_msgSend_deleteCompletionBlock(self, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_recordID(v23, v13, v14);
    if (v6)
    {
      ((void (**)(void, void *, id))v12)[2](v12, v17, v6);
    }
    else
    {
      uint64_t v18 = objc_msgSend_error(v23, v15, v16);
      ((void (**)(void, void *, void *))v12)[2](v12, v17, v18);
    }
  }
  if (!v6)
  {
    uint64_t v19 = objc_msgSend_error(v23, v10, v11);

    if (!v19 && (objc_msgSend_shouldOnlySaveAssetContent(self, v20, v21) & 1) == 0) {
      objc_msgSend_updateCloudKitMetrics_(self, v22, (uint64_t)&unk_1F2044630);
    }
  }
}

- (void)_performCallbacksForNonAtomicZoneHandlers:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v7 = objc_msgSend_saveAttempts(self, v5, v6);
  uint64_t v10 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v8, v9);
  int v13 = objc_msgSend_PCSRetryCount(v10, v11, v12);
  BOOL v14 = v7 <= v13;

  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v17 = objc_msgSend_unitTestOverrides(self, v15, v16);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"PreventRecordModifyRetries");

    if (v19) {
      BOOL v20 = 0;
    }
    else {
      BOOL v20 = v7 <= v13;
    }
    BOOL v14 = v20;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v21 = v4;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v56, v60, 16);
  if (v23)
  {
    uint64_t v26 = v23;
    uint64_t v27 = *(void *)v57;
LABEL_10:
    uint64_t v28 = 0;
    while (2)
    {
      if (*(void *)v57 != v27) {
        objc_enumerationMutation(v21);
      }
      uint64_t v29 = *(void **)(*((void *)&v56 + 1) + 8 * v28);
      switch(objc_msgSend_state(v29, v24, v25))
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 9:
        case 10:
          objc_msgSend_setHaveOutstandingHandlers_(self, v24, 1);
          goto LABEL_27;
        case 8:
        case 11:
        case 12:
          goto LABEL_18;
        case 13:
          if (!v14)
          {
LABEL_18:
            objc_msgSend_setState_(v29, v24, 14);
            objc_msgSend_callbackWithMetadata_error_(self, v38, (uint64_t)v29, 0);
            goto LABEL_27;
          }
          objc_msgSend_setError_(v29, v24, 0);
          if (objc_msgSend_isDelete(v29, v30, v31))
          {
            BOOL v34 = objc_msgSend__needsSigningPCS(self, v32, v33) == 0;
            uint64_t v36 = 5;
            uint64_t v37 = 2;
          }
          else
          {
            if (objc_msgSend_needsRefetch(v29, v32, v33))
            {
              objc_msgSend_setState_(v29, v50, 9);
              goto LABEL_26;
            }
            BOOL v34 = objc_msgSend_isShare(v29, v50, v51) == 0;
            uint64_t v36 = 2;
            uint64_t v37 = 10;
          }
          if (v34) {
            objc_msgSend_setState_(v29, v35, v36);
          }
          else {
            objc_msgSend_setState_(v29, v35, v37);
          }
LABEL_26:
          objc_msgSend_setNeedsRefetch_(v29, v52, 0);
          objc_msgSend_setHaveOutstandingHandlers_(self, v53, 1);
          objc_msgSend_updateCloudKitMetrics_(self, v54, (uint64_t)&unk_1F2044650);
LABEL_27:
          if (v26 != ++v28) {
            continue;
          }
          uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v56, v60, 16);
          if (!v26) {
            goto LABEL_29;
          }
          goto LABEL_10;
        case 14:
          goto LABEL_27;
        default:
          uint64_t v39 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v24, v25);
          uint64_t v42 = objc_msgSend_state(v29, v40, v41);
          uint64_t v45 = objc_msgSend_state(self, v43, v44);
          uint64_t v48 = objc_msgSend_modifyHandlersByZoneID(self, v46, v47);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v49, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 787, @"Unexpected handler state in default zone %ld %ld %@", v42, v45, v48);

          goto LABEL_27;
      }
    }
  }
LABEL_29:
}

- (void)_performCallbacksForAtomicZoneHandlers:(id)a3
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v7 = objc_msgSend_saveAttempts(self, v5, v6);
  uint64_t v10 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v8, v9);
  int v13 = objc_msgSend_PCSRetryCount(v10, v11, v12);
  BOOL v14 = v7 <= v13;

  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v17 = objc_msgSend_unitTestOverrides(self, v15, v16);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"PreventRecordModifyRetries");

    if (v19) {
      BOOL v20 = 0;
    }
    else {
      BOOL v20 = v7 <= v13;
    }
    BOOL v14 = v20;
  }
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v21 = v4;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v148, v155, 16);
  obuint64_t j = v21;
  if (v23)
  {
    uint64_t v26 = v23;
    char v27 = 0;
    char v28 = 0;
    uint64_t v29 = *(void *)v149;
    BOOL v30 = v14;
    BOOL v31 = !v14;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v149 != v29) {
          objc_enumerationMutation(obj);
        }
        unint64_t v33 = objc_msgSend_state(*(void **)(*((void *)&v148 + 1) + 8 * v32), v24, v25);
        if (v33 <= 0xD)
        {
          if (((1 << v33) & 0x6FF) != 0)
          {
            objc_msgSend_setHaveOutstandingHandlers_(self, v24, 1);
          }
          else if (((1 << v33) & 0x2800) != 0)
          {
            v27 |= v30;
            v28 |= v31;
          }
          else if (v33 == 12)
          {
            char v28 = 1;
          }
        }
        ++v32;
      }
      while (v26 != v32);
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v148, v155, 16);
      uint64_t v26 = v34;
    }
    while (v34);
    id v21 = obj;

    if (v28)
    {
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id v37 = obj;
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v144, v154, 16);
      if (v39)
      {
        uint64_t v42 = v39;
        uint64_t v43 = *(void *)v145;
        uint64_t v133 = *MEMORY[0x1E4F19DD8];
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v145 != v43) {
              objc_enumerationMutation(v37);
            }
            uint64_t v45 = *(void **)(*((void *)&v144 + 1) + 8 * v44);
            switch(objc_msgSend_state(v45, v40, v41))
            {
              case 0:
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
              case 7:
              case 9:
              case 10:
              case 11:
              case 12:
                objc_msgSend_setState_(v45, v40, 14);
                v50 = objc_msgSend_error(v45, v46, v47);
                if (v50) {
                  goto LABEL_33;
                }
                uint64_t v51 = (void *)MEMORY[0x1E4F1A280];
                int v52 = objc_msgSend_recordID(v45, v48, v49);
                uint64_t v54 = objc_msgSend_errorWithDomain_code_format_(v51, v53, v133, 2024, @"Record %@ will not be saved because of previous error in atomic zone", v52);

                goto LABEL_32;
              case 8:
                objc_msgSend_setState_(v45, v40, 14);
                objc_msgSend_callbackWithMetadata_error_(self, v57, (uint64_t)v45, 0);
                break;
              case 13:
                objc_msgSend_setState_(v45, v40, 14);
                long long v58 = (void *)MEMORY[0x1E4F1A280];
                uint64_t v61 = objc_msgSend_error(v45, v59, v60);
                v64 = objc_msgSend_recordID(v45, v62, v63);
                uint64_t v54 = objc_msgSend_errorWithDomain_code_error_format_(v58, v65, v133, 2055, v61, @"Record %@ will not be saved but can be retried as is", v64);

LABEL_32:
                v50 = objc_msgSend_CKClientSuitableError(v54, v55, v56);

LABEL_33:
                objc_msgSend_callbackWithMetadata_error_(self, v48, (uint64_t)v45, v50);

                break;
              case 14:
                break;
              default:
                uint64_t v66 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v40, v41);
                uint64_t v69 = objc_msgSend_state(v45, v67, v68);
                uint64_t v72 = objc_msgSend_state(self, v70, v71);
                uint64_t v75 = objc_msgSend_modifyHandlersByZoneID(self, v73, v74);
                objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v76, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 900, @"Unexpected handler state in failed atomic zone %ld %ld %@", v69, v72, v75);

                break;
            }
            ++v44;
          }
          while (v42 != v44);
          uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v144, v154, 16);
          uint64_t v42 = v77;
        }
        while (v77);
      }
LABEL_78:
      id v21 = obj;

      goto LABEL_79;
    }
    if (v27)
    {
      objc_msgSend_setHaveOutstandingHandlers_(self, v35, 1);
      objc_msgSend_updateCloudKitMetrics_(self, v78, (uint64_t)&unk_1F2044670);
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v79 = obj;
      uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v140, v153, 16);
      if (v81)
      {
        uint64_t v83 = v81;
        uint64_t v84 = *(void *)v141;
        do
        {
          for (uint64_t i = 0; i != v83; ++i)
          {
            if (*(void *)v141 != v84) {
              objc_enumerationMutation(v79);
            }
            uint64_t v86 = *(void **)(*((void *)&v140 + 1) + 8 * i);
            objc_msgSend_setError_(v86, v82, 0);
            unint64_t v89 = objc_msgSend_state(v86, v87, v88);
            if (v89 < 0xC || v89 == 13)
            {
              if (objc_msgSend_isDelete(v86, v90, v91))
              {
                if (objc_msgSend__needsSigningPCS(self, v93, v94)) {
                  objc_msgSend_setState_(v86, v95, 2);
                }
                else {
                  objc_msgSend_setState_(v86, v95, 5);
                }
              }
              else if (objc_msgSend_needsRefetch(v86, v93, v94))
              {
                objc_msgSend_setState_(v86, v96, 9);
              }
              else
              {
                if (objc_msgSend_isShare(v86, v96, v97)) {
                  uint64_t v99 = 10;
                }
                else {
                  uint64_t v99 = 2;
                }
                objc_msgSend_setState_(v86, v98, v99);
              }
            }
            else
            {
              v100 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v90, v91);
              uint64_t v103 = objc_msgSend_state(v86, v101, v102);
              uint64_t v106 = objc_msgSend_state(self, v104, v105);
              v109 = objc_msgSend_modifyHandlersByZoneID(self, v107, v108);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v100, v110, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 941, @"Unexpected handler state in retryable atomic zone %ld %ld %@", v103, v106, v109);
            }
          }
          uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v82, (uint64_t)&v140, v153, 16);
        }
        while (v83);
      }
      goto LABEL_78;
    }
  }
  else
  {
  }
  if ((objc_msgSend_haveOutstandingHandlers(self, v35, v36) & 1) == 0)
  {
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v111 = v21;
    uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v112, (uint64_t)&v136, v152, 16);
    if (v113)
    {
      uint64_t v116 = v113;
      uint64_t v117 = *(void *)v137;
      do
      {
        for (uint64_t j = 0; j != v116; ++j)
        {
          if (*(void *)v137 != v117) {
            objc_enumerationMutation(v111);
          }
          v119 = *(void **)(*((void *)&v136 + 1) + 8 * j);
          uint64_t v120 = objc_msgSend_state(v119, v114, v115);
          if (v120 != 14)
          {
            if (v120 == 8)
            {
              objc_msgSend_setState_(v119, v114, 14);
              objc_msgSend_callbackWithMetadata_error_(self, v121, (uint64_t)v119, 0);
            }
            else
            {
              v122 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v114, v115);
              uint64_t v125 = objc_msgSend_state(v119, v123, v124);
              uint64_t v128 = objc_msgSend_state(self, v126, v127);
              v131 = objc_msgSend_modifyHandlersByZoneID(self, v129, v130);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v122, v132, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 957, @"Unexpected handler state in failed atomic zone %ld %ld %@", v125, v128, v131);
            }
          }
        }
        uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v114, (uint64_t)&v136, v152, 16);
      }
      while (v116);
    }
    goto LABEL_78;
  }
LABEL_79:
}

- (void)_performHandlerCallbacks
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_msgSend_setHaveOutstandingHandlers_(self, a2, 0);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  objc_super v5 = objc_msgSend_modifyHandlersByZoneID(self, v3, v4, 0);
  uint64_t v8 = objc_msgSend_allKeys(v5, v6, v7);

  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, v36, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v33;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend_modifyHandlersByZoneID(self, v11, v12);
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v16);

        int v22 = objc_msgSend_atomic(self, v20, v21);
        uint64_t v25 = objc_msgSend_container(self, v23, v24);
        objc_msgSend_clientSDKVersion(v25, v26, v27);
        if (CKLinkCheck48d9728e8c354416a38f82379cbb35e3())
        {

          if ((v22 & 1) == 0) {
            goto LABEL_8;
          }
        }
        else
        {
          int isDefaultRecordZoneID = objc_msgSend_isDefaultRecordZoneID(v16, v28, v29);

          if ((v22 & ~isDefaultRecordZoneID & 1) == 0)
          {
LABEL_8:
            objc_msgSend__performCallbacksForNonAtomicZoneHandlers_(self, v30, (uint64_t)v19);
            goto LABEL_11;
          }
        }
        objc_msgSend__performCallbacksForAtomicZoneHandlers_(self, v30, (uint64_t)v19);
LABEL_11:

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v32, v36, 16);
    }
    while (v13);
  }
}

- (void)_determineEnvironment
{
  objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isAppleInternalInstall(v19, v4, v5))
  {
    uint64_t v8 = objc_msgSend_container(self, v6, v7);
    uint64_t v11 = objc_msgSend_cachedEnvironment(v8, v9, v10);

    if (v11 == -1)
    {
      objc_initWeak(&location, self);
      uint64_t v14 = objc_msgSend_stateTransitionGroup(self, v12, v13);
      dispatch_group_enter(v14);

      uint64_t v17 = objc_msgSend_container(self, v15, v16);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1C4FA00A8;
      v20[3] = &unk_1E64F7A48;
      objc_copyWeak(&v21, &location);
      objc_msgSend_fetchServerEnvironmentForOperation_withCompletionHandler_(v17, v18, (uint64_t)self, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

- (void)_fetchUserPublicKeys
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_requestNeedsUserPublicKeys(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_userPublicKeys(self, v4, v5);
    uint64_t v9 = objc_msgSend_count(v6, v7, v8);

    if (!v9)
    {
      uint64_t v10 = (uint64_t *)MEMORY[0x1E4F1A550];
      uint64_t v11 = (void **)MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v12 = (os_log_t *)MEMORY[0x1E4F1A500];
      uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        long long v35 = v13;
        v38 = objc_msgSend_operationID(self, v36, v37);
        *(_DWORD *)buf = 138543362;
        uint64_t v51 = (uint64_t)v38;
        _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Fetching user public keys for operation %{public}@", buf, 0xCu);
      }
      uint64_t v16 = objc_msgSend_container(self, v14, v15);
      id v19 = objc_msgSend_pcsManager(v16, v17, v18);
      id v49 = 0;
      id v21 = objc_msgSend_copyAllPublicKeysForService_withError_(v19, v20, 0, &v49);
      id v22 = v49;

      uint64_t v25 = objc_msgSend_count(v21, v23, v24);
      uint64_t v26 = *v11;
      uint64_t v27 = *v10;
      if (!v25 || v22)
      {
        if (v27 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v26);
        }
        BOOL v30 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v51 = (uint64_t)v22;
          _os_log_error_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_ERROR, "Error fetching current service public keys for user: %@", buf, 0xCu);
        }
        long long v33 = objc_msgSend_error(self, v31, v32);

        if (!v33) {
          objc_msgSend_setError_(self, v34, (uint64_t)v22);
        }
      }
      else
      {
        if (v27 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v26);
        }
        os_log_t v28 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = v28;
          uint64_t v42 = objc_msgSend_count(v21, v40, v41);
          if ((unint64_t)objc_msgSend_count(v21, v43, v44) <= 1) {
            uint64_t v47 = &stru_1F2044F30;
          }
          else {
            uint64_t v47 = @"s";
          }
          uint64_t v48 = objc_msgSend_operationID(self, v45, v46);
          *(_DWORD *)buf = 134218498;
          uint64_t v51 = v42;
          __int16 v52 = 2114;
          uint64_t v53 = v47;
          __int16 v54 = 2114;
          v55 = v48;
          _os_log_debug_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_DEBUG, "Fetched %lu user public key%{public}@ for operation %{public}@", buf, 0x20u);
        }
        objc_msgSend_setUserPublicKeys_(self, v29, (uint64_t)v21);
      }
    }
  }
}

- (void)_fetchContainerScopedUserID
{
  objc_initWeak(&location, self);
  uint64_t v5 = objc_msgSend_stateTransitionGroup(self, v3, v4);
  dispatch_group_enter(v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4FA04F8;
  v7[3] = &unk_1E64F22C0;
  objc_copyWeak(&v8, &location);
  objc_msgSend_fetchContainerScopedUserID_(self, v6, (uint64_t)v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_applySideEffects
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4FA05DC;
  v2[3] = &unk_1E64F7A70;
  v2[4] = self;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, a2, 0, v2);
}

- (id)_topoSortRecordsForHandlers:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v8 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v6, v7);
  uint64_t v9 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v10 = v4;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v68, v73, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v69 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        BOOL v20 = objc_msgSend_record(v18, v13, v14);
        if (v20)
        {
          objc_msgSend_addObject_(v5, v19, (uint64_t)v20);
          objc_msgSend_setObject_forKey_(v8, v21, (uint64_t)v18, v20);
        }
        else
        {
          objc_msgSend_addObject_(v9, v19, (uint64_t)v18);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v68, v73, 16);
    }
    while (v15);
  }

  if (objc_msgSend_count(v5, v22, v23))
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1A2F0]);
    id v67 = 0;
    char v26 = objc_msgSend_addRecords_error_(v24, v25, (uint64_t)v5, &v67);
    id v27 = v67;
    BOOL v30 = v27;
    if (v26)
    {
      id v66 = v27;
      BOOL v31 = objc_msgSend_recordsByTopologicalSortWithError_(v24, v28, (uint64_t)&v66);
      id v32 = v66;

      if (v31)
      {
        id v59 = v32;
        id v60 = v24;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        obuint64_t j = v31;
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v62, v72, 16);
        if (v36)
        {
          uint64_t v38 = v36;
          uint64_t v39 = 0;
          uint64_t v40 = *(void *)v63;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v63 != v40) {
                objc_enumerationMutation(obj);
              }
              uint64_t v42 = objc_msgSend_objectForKey_(v8, v37, *(void *)(*((void *)&v62 + 1) + 8 * j));
              objc_msgSend_setBatchRank_(v42, v43, v39 + j);
              objc_msgSend_addObject_(v9, v44, (uint64_t)v42);
            }
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v62, v72, 16);
            v39 += j;
          }
          while (v38);
        }
        uint64_t v45 = obj;

        id v46 = v9;
        id v32 = v59;
        id v24 = v60;
      }
      else
      {
        __int16 v52 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v53 = *MEMORY[0x1E4F19DD8];
        __int16 v54 = objc_msgSend_localizedDescription(v32, v33, v34);
        uint64_t v56 = objc_msgSend_errorWithDomain_code_format_(v52, v55, v53, 1007, @"Invalid list of records: %@", v54);
        objc_msgSend_setError_(self, v57, (uint64_t)v56);

        uint64_t v45 = 0;
        id v46 = 0;
      }
    }
    else
    {
      uint64_t v47 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v48 = *MEMORY[0x1E4F19DD8];
      uint64_t v45 = objc_msgSend_localizedDescription(v27, v28, v29);
      v50 = objc_msgSend_errorWithDomain_code_format_(v47, v49, v48, 1007, @"Invalid list of records: %@", v45);
      objc_msgSend_setError_(self, v51, (uint64_t)v50);

      id v46 = 0;
      id v32 = v30;
    }
  }
  else
  {
    id v46 = v9;
  }

  return v46;
}

- (BOOL)_shouldToposortInContainerID:(id)a3
{
  return (objc_msgSend_specialContainerType(a3, a2, (uint64_t)a3) & 0xFFFFFFFFFFFFFFFELL) != 4;
}

- (BOOL)_topoSortRecords
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_container(self, a2, v2);
  uint64_t v7 = objc_msgSend_options(v4, v5, v6);
  char v10 = objc_msgSend_maintainRecordUploadOrder(v7, v8, v9);

  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v13 = objc_msgSend_unitTestOverrides(self, v11, v12);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"SkipToposortingRecords");

    if (v15) {
      char v16 = 1;
    }
    else {
      char v16 = v10;
    }
    if (v16)
    {
LABEL_18:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v46 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v48 = v46;
        uint64_t v51 = objc_msgSend_container(self, v49, v50);
        __int16 v54 = objc_msgSend_containerID(v51, v52, v53);
        long long v57 = objc_msgSend_ckShortDescription(v54, v55, v56);
        *(_DWORD *)buf = 138543362;
        long long v63 = v57;
        _os_log_debug_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_DEBUG, "Skipping topo sort of all zones for container %{public}@", buf, 0xCu);
      }
      return 1;
    }
  }
  else if (v10)
  {
    goto LABEL_18;
  }
  uint64_t v17 = objc_msgSend_container(self, v11, v12);
  BOOL v20 = objc_msgSend_containerID(v17, v18, v19);
  int shouldToposortInContainerID = objc_msgSend__shouldToposortInContainerID_(self, v21, (uint64_t)v20);

  if (!shouldToposortInContainerID) {
    goto LABEL_18;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v25 = objc_msgSend_modifyHandlersByZoneID(self, v23, v24, 0);
  os_log_t v28 = objc_msgSend_allKeys(v25, v26, v27);

  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v58, v64, 16);
  if (v30)
  {
    uint64_t v33 = v30;
    uint64_t v34 = *(void *)v59;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v59 != v34) {
          objc_enumerationMutation(v28);
        }
        uint64_t v36 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v37 = objc_msgSend_modifyHandlersByZoneID(self, v31, v32);
        uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v37, v38, v36);
        uint64_t v41 = objc_msgSend__topoSortRecordsForHandlers_(self, v40, (uint64_t)v39);

        if (!v41)
        {

          return 0;
        }
        uint64_t v44 = objc_msgSend_modifyHandlersByZoneID(self, v42, v43);
        objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v41, v36);
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v58, v64, 16);
      if (v33) {
        continue;
      }
      break;
    }
  }

  return 1;
}

- (void)_fetchShareParticipants
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4FA10D4;
  v29[3] = &unk_1E64F7A70;
  id v4 = v3;
  id v30 = v4;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v5, 10, v29);
  if (objc_msgSend_count(v4, v6, v7))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v8 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = v8;
      uint64_t v14 = objc_msgSend_allKeys(v4, v12, v13);
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v14;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Fetching participants for shares: %@", buf, 0xCu);
    }
    uint64_t v15 = objc_msgSend_stateTransitionGroup(self, v9, v10);
    dispatch_group_enter(v15);

    char v16 = objc_opt_new();
    uint64_t v19 = objc_msgSend_allKeys(v4, v17, v18);
    objc_msgSend_setRecordIDs_(v16, v20, (uint64_t)v19);

    uint64_t v31 = *MEMORY[0x1E4F19D68];
    id v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)&v31, 1);
    objc_msgSend_setDesiredKeys_(v16, v23, (uint64_t)v22);

    uint64_t v24 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1C4FA1158;
    v26[3] = &unk_1E64F0260;
    id v27 = v4;
    os_log_t v28 = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v25, v24, v16, v26);
  }
}

- (void)_prepareParentPCS
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend_saveAttempts(self, a2, v2);
  objc_msgSend_setSaveAttempts_(self, v5, (v4 + 1));
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = sub_1C4F9DD44;
  uint64_t v44 = sub_1C4F9DD54;
  id v45 = (id)objc_opt_new();
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1C4FA1848;
  v39[3] = &unk_1E64F7A98;
  v39[4] = &v40;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v6, 2, v39);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = (id)v41[5];
  uint64_t v9 = 0;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v35, v46, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v36;
    uint64_t v14 = (unsigned char *)MEMORY[0x1E4F1A4E0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_handlersByRecordID(self, v10, v11, (void)v35);
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, v16);

        if (v19)
        {
          if (!v9) {
            uint64_t v9 = objc_opt_new();
          }
          objc_msgSend_setObject_forKeyedSubscript_(v9, v20, (uint64_t)v19, v16);
          uint64_t v23 = objc_msgSend_record(v19, v21, v22);
          objc_msgSend_setWantsChainPCS_(v23, v24, 1);

          if (*v14)
          {
            id v27 = objc_msgSend_unitTestOverrides(self, v25, v26);
            uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v27, v28, @"SkipChainPCS");

            if (v29)
            {
              uint64_t v32 = objc_msgSend_record(v19, v30, v31);
              objc_msgSend_setWantsChainPCS_(v32, v33, 0);
            }
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v35, v46, 16);
    }
    while (v12);
  }

  objc_msgSend_setParentsByRecordID_(self, v34, (uint64_t)v9);
  _Block_object_dispose(&v40, 8);
}

- (void)_fetchSharePCSData
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4FA1AD8;
  v18[3] = &unk_1E64F7AC0;
  v18[4] = self;
  id v4 = v3;
  id v19 = v4;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v5, 1, v18);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, v20, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_fetchSharePCSData(*(void **)(*((void *)&v14 + 1) + 8 * v13++), v9, v10, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, v20, 16);
    }
    while (v11);
  }
}

- (BOOL)_needsSigningPCS
{
  id v4 = objc_msgSend_container(self, a2, v2);
  id v7 = objc_msgSend_options(v4, v5, v6);
  if (objc_msgSend_useAnonymousToServerShareParticipants(v7, v8, v9)) {
    BOOL v12 = objc_msgSend_databaseScope(self, v10, v11) == 3;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_fetchRecordPCSData
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4FA1E08;
  v18[3] = &unk_1E64F7AC0;
  v18[4] = self;
  id v4 = v3;
  id v19 = v4;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v5, 2, v18);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, v20, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_fetchRecordPCSData(*(void **)(*((void *)&v14 + 1) + 8 * v13++), v9, v10, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, v20, 16);
    }
    while (v11);
  }
}

- (void)assetArray:(id)a3 didFetchRecord:(id)a4 error:(id)a5
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = (void *)*MEMORY[0x1E4F1A500];
  int v186 = v10;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v171 = v11;
    v172 = (objc_class *)objc_opt_class();
    uint64_t v173 = NSStringFromClass(v172);
    uint64_t v176 = objc_msgSend_ckShortDescription(self, v174, v175);
    uint64_t v179 = objc_msgSend_recordID(v9, v177, v178);
    BOOL v180 = (void *)v179;
    *(_DWORD *)buf = 138544642;
    v181 = @" Error was ";
    long long v203 = v173;
    v182 = &stru_1F2044F30;
    __int16 v204 = 2048;
    if (!v10) {
      v181 = &stru_1F2044F30;
    }
    long long v205 = self;
    if (v10) {
      v182 = v10;
    }
    __int16 v206 = 2114;
    long long v207 = v176;
    __int16 v208 = 2112;
    uint64_t v209 = v179;
    __int16 v210 = 2114;
    long long v211 = v181;
    __int16 v212 = 2112;
    v213 = v182;
    _os_log_debug_impl(&dword_1C4CFF000, v171, OS_LOG_TYPE_DEBUG, "Record fetcher <%{public}@: %p; %{public}@> fetched a record with ID %@.%{public}@%@",
      buf,
      0x3Eu);
  }
  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  obuint64_t j = v8;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v196, v201, 16);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v197;
    uint64_t v184 = *MEMORY[0x1E4F19DD8];
    uint64_t v185 = *(void *)v197;
    v187 = self;
    id v183 = v9;
    do
    {
      uint64_t v16 = 0;
      uint64_t v188 = v14;
      do
      {
        if (*(void *)v197 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v196 + 1) + 8 * v16);
        BOOL v20 = objc_msgSend_handlersByAssetNeedingRecordFetch(self, v18, v19);
        v191 = objc_msgSend_objectForKey_(v20, v21, (uint64_t)v17);

        if (!v10)
        {
          uint64_t v32 = objc_msgSend_assetReference(v17, v22, v23);
          long long v35 = objc_msgSend_fieldName(v32, v33, v34);
          long long v37 = objc_msgSend_objectForKeyedSubscript_(v9, v36, (uint64_t)v35);

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v38 = v9;
            uint64_t v39 = v37;
            id v40 = v37;
            uint64_t v43 = objc_msgSend_reReferenceItemID(v40, v41, v42);
            objc_msgSend_setReReferenceItemID_(v17, v44, v43);
            uint64_t v47 = objc_msgSend_signature(v40, v45, v46);
            uint64_t v50 = objc_msgSend_assetReference(v17, v48, v49);
            uint64_t v53 = objc_msgSend_fileSignature(v50, v51, v52);
            char isEqualToData = objc_msgSend_isEqualToData_(v47, v54, (uint64_t)v53);

            long long v58 = objc_msgSend_assetRereferenceInfo(v17, v56, v57);
            long long v61 = v58;
            if (isEqualToData)
            {
              char PropertiesWithAsset = objc_msgSend_validateAndSetRecordFetchPropertiesWithAsset_(v58, v59, (uint64_t)v40);

              if ((PropertiesWithAsset & 1) == 0)
              {
                uint64_t v65 = objc_msgSend_assetRereferenceInfo(v17, v63, v64);
                long long v68 = objc_msgSend_error(v65, v66, v67);

                uint64_t v15 = v185;
                uint64_t v10 = v186;
                uint64_t v14 = v188;
                if (!v68)
                {
                  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v69, v184, 1, @"the referenced asset %@ has missing information", v40);
                  goto LABEL_35;
                }
LABEL_41:

                id v30 = v39;
                id v9 = v38;
                self = v187;
                goto LABEL_47;
              }
LABEL_33:
              uint64_t v15 = v185;
              uint64_t v10 = v186;
LABEL_40:
              uint64_t v14 = v188;
              goto LABEL_41;
            }
            uint64_t v103 = objc_msgSend_error(v58, v59, v60);

            if (v103) {
              goto LABEL_33;
            }
            v123 = (void *)MEMORY[0x1E4F1A280];
            v109 = objc_msgSend_assetReference(v17, v104, v105);
            v112 = objc_msgSend_fileSignature(v109, v124, v125);
            uint64_t v128 = objc_msgSend_signature(v40, v126, v127);
            uint64_t v130 = objc_msgSend_errorWithDomain_code_format_(v123, v129, v184, 1, @"the referencing asset's signature %@ and the referenced asset's signature %@ don't match", v112, v128);
            uint64_t v133 = objc_msgSend_assetRereferenceInfo(v17, v131, v132);
            objc_msgSend_setError_(v133, v134, (uint64_t)v130);

            uint64_t v15 = v185;
            uint64_t v10 = v186;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v70 = v37;
              long long v192 = 0u;
              long long v193 = 0u;
              long long v194 = 0u;
              long long v195 = 0u;
              id v190 = v70;
              uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v71, (uint64_t)&v192, v200, 16);
              if (v72)
              {
                uint64_t v73 = v72;
                uint64_t v74 = *(void *)v193;
                while (2)
                {
                  for (uint64_t i = 0; i != v73; ++i)
                  {
                    if (*(void *)v193 != v74) {
                      objc_enumerationMutation(v190);
                    }
                    id v76 = *(id *)(*((void *)&v192 + 1) + 8 * i);
                    id v79 = objc_msgSend_signature(v76, v77, v78);
                    id v82 = objc_msgSend_assetReference(v17, v80, v81);
                    __int16 v85 = objc_msgSend_fileSignature(v82, v83, v84);
                    int v87 = objc_msgSend_isEqualToData_(v79, v86, (uint64_t)v85);

                    if (v87)
                    {
                      uint64_t v114 = objc_msgSend_reReferenceItemID(v76, v88, v89);
                      objc_msgSend_setReReferenceItemID_(v17, v115, v114);
                      v118 = objc_msgSend_assetRereferenceInfo(v17, v116, v117);
                      char v120 = objc_msgSend_validateAndSetRecordFetchPropertiesWithAsset_(v118, v119, (uint64_t)v76);

                      if (v120)
                      {
                        uint64_t v99 = v190;
                        uint64_t v10 = v186;
                        self = v187;
                        id v9 = v183;
                        uint64_t v15 = v185;
                        uint64_t v14 = v188;
                      }
                      else
                      {
                        v135 = objc_msgSend_assetRereferenceInfo(v17, v121, v122);
                        long long v138 = objc_msgSend_error(v135, v136, v137);

                        uint64_t v10 = v186;
                        self = v187;
                        id v9 = v183;
                        uint64_t v15 = v185;
                        uint64_t v14 = v188;
                        if (!v138)
                        {
                          long long v140 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v139, v184, 1, @"the referenced asset %@ has missing information", v76);
                          long long v143 = objc_msgSend_assetRereferenceInfo(v17, v141, v142);
                          objc_msgSend_setError_(v143, v144, (uint64_t)v140);
                        }
                        uint64_t v99 = v190;
                      }
                      goto LABEL_45;
                    }
                  }
                  uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v90, (uint64_t)&v192, v200, 16);
                  if (v73) {
                    continue;
                  }
                  break;
                }
              }

              v93 = objc_msgSend_assetRereferenceInfo(v17, v91, v92);
              uint64_t v96 = objc_msgSend_error(v93, v94, v95);

              uint64_t v10 = v186;
              self = v187;
              id v9 = v183;
              uint64_t v15 = v185;
              uint64_t v14 = v188;
              if (!v96)
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                uint64_t v97 = *MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1C4CFF000, v97, OS_LOG_TYPE_ERROR, "re-referenced asset signature not found in source asset array", buf, 2u);
                }
                uint64_t v99 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v98, v184, 3011, @"Re-referenced asset signature not found in source asset array");
                objc_msgSend_assetRereferenceInfo(v17, v100, v101);
                id v76 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setError_(v76, v102, (uint64_t)v99);
LABEL_45:
              }
              id v30 = v190;

              goto LABEL_47;
            }
            id v38 = v9;
            uint64_t v106 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v39 = v37;
            v107 = (objc_class *)objc_opt_class();
            NSStringFromClass(v107);
            id v40 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v106, v108, v184, 1, @"Can't handle fieldValue %@", v40);
            v109 = LABEL_35:;
            v112 = objc_msgSend_assetRereferenceInfo(v17, v110, v111);
            objc_msgSend_setError_(v112, v113, (uint64_t)v109);
          }

          goto LABEL_40;
        }
        uint64_t v24 = objc_msgSend_assetRereferenceInfo(v17, v22, v23);
        id v27 = objc_msgSend_error(v24, v25, v26);

        if (v27) {
          goto LABEL_48;
        }
        id v30 = objc_msgSend_assetRereferenceInfo(v17, v28, v29);
        objc_msgSend_setError_(v30, v31, (uint64_t)v10);
LABEL_47:

LABEL_48:
        long long v145 = objc_msgSend_assetRereferenceInfo(v17, v28, v29);
        long long v148 = objc_msgSend_error(v145, v146, v147);

        if (v148)
        {
          long long v151 = objc_msgSend_assetRereferenceInfo(v17, v149, v150);
          v154 = objc_msgSend_destinationFieldName(v151, v152, v153);

          if (v154)
          {
            uint64_t v157 = objc_msgSend_rereferencedAssetArrayByFieldname(v191, v155, v156);

            if (!v157)
            {
              v160 = objc_opt_new();
              objc_msgSend_setRereferencedAssetArrayByFieldname_(v191, v161, (uint64_t)v160);
            }
            v162 = objc_msgSend_rereferencedAssetArrayByFieldname(v191, v158, v159);
            v164 = objc_msgSend_objectForKeyedSubscript_(v162, v163, (uint64_t)v154);

            if (!v164)
            {
              v164 = objc_opt_new();
              v168 = objc_msgSend_rereferencedAssetArrayByFieldname(v191, v166, v167);
              objc_msgSend_setObject_forKeyedSubscript_(v168, v169, (uint64_t)v164, v154);
            }
            objc_msgSend_addObject_(v164, v165, (uint64_t)v17);
          }
        }

        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v170, (uint64_t)&v196, v201, 16);
    }
    while (v14);
  }
}

- (void)packageArray:(id)a3 didFetchRecord:(id)a4 error:(id)a5
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v107 = a4;
  id v98 = a5;
  if (!v98)
  {
    uint64_t v103 = self;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v118, v123, 16);
    if (!v15) {
      goto LABEL_28;
    }
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v119;
    uint64_t v102 = *MEMORY[0x1E4F19DD8];
    uint64_t v99 = *(void *)v119;
    id v100 = v8;
LABEL_8:
    uint64_t v20 = 0;
    uint64_t v101 = v18;
    while (1)
    {
      if (*(void *)v119 != v19) {
        objc_enumerationMutation(v8);
      }
      uint64_t v21 = *(void **)(*((void *)&v118 + 1) + 8 * v20);
      uint64_t v22 = objc_msgSend_packageReference(v21, v16, v17);
      uint64_t v113 = objc_msgSend_fieldName(v22, v23, v24);
      uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v107, v25, (uint64_t)v113);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v45 = objc_msgSend_handlersByAssetNeedingRecordFetch(v103, v27, v28);
      objc_msgSend_objectForKey_(v45, v46, (uint64_t)v21);
      uint64_t v48 = v47 = v8;

      uint64_t v49 = (void *)v48;
      id v8 = v47;
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v50, v102, 3011, 0, @"One or more referenced asset do not exist");
      objc_msgSend_setError_(v49, v51, (uint64_t)v32);
LABEL_26:

      if (++v20 == v18)
      {
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v16, (uint64_t)&v118, v123, 16);
        if (!v18) {
          goto LABEL_28;
        }
        goto LABEL_8;
      }
    }
    v112 = v21;
    id v29 = v26;
    uint64_t v32 = objc_msgSend_signature(v22, v30, v31);
    long long v36 = objc_msgSend_signature(v29, v33, v34);
    uint64_t v106 = v26;
    uint64_t v108 = v29;
    if (v32)
    {
      if ((objc_msgSend_isEqualToData_(v32, v35, (uint64_t)v36) & 1) == 0)
      {
        uint64_t v39 = objc_msgSend_handlersByAssetNeedingRecordFetch(v103, v37, v38);
        uint64_t v41 = objc_msgSend_objectForKey_(v39, v40, (uint64_t)v112);

        uint64_t v43 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v42, v102, 5022, 0, @"Package signature %@ does not match re-reference signature %@.", v36, v32);
        objc_msgSend_setError_(v41, v44, (uint64_t)v43);

LABEL_25:
        uint64_t v26 = v106;
        uint64_t v49 = v108;
        goto LABEL_26;
      }
    }
    else
    {
      objc_msgSend_setSignature_(v22, v35, (uint64_t)v36);
    }
    uint64_t v104 = v32;
    uint64_t v105 = v20;

    uint64_t v52 = (void *)MEMORY[0x1E4F1CA48];
    v55 = objc_msgSend_assets(v108, v53, v54);
    uint64_t v58 = objc_msgSend_count(v55, v56, v57);
    uint64_t v111 = objc_msgSend_arrayWithCapacity_(v52, v59, v58);

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    objc_msgSend_assets(v108, v60, v61);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v114, v122, 16);
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = 0;
      uint64_t v110 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v64; ++i)
        {
          if (*(void *)v115 != v110) {
            objc_enumerationMutation(obj);
          }
          uint64_t v67 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          id v68 = objc_alloc(MEMORY[0x1E4F19E70]);
          long long v71 = objc_msgSend_recordID(v22, v69, v70);
          uint64_t v74 = v22;
          uint64_t v75 = objc_msgSend_databaseScope(v22, v72, v73);
          uint64_t v78 = objc_msgSend_signature(v67, v76, v77);
          uint64_t v79 = v75;
          uint64_t v22 = v74;
          uint64_t v81 = objc_msgSend_initWithExistingRecordID_databaseScope_fieldName_fileSignature_(v68, v80, (uint64_t)v71, v79, v113, v78);

          objc_msgSend_setIsPackageMember_(v81, v82, 1);
          id v83 = objc_alloc(MEMORY[0x1E4F19E50]);
          __int16 v85 = objc_msgSend_initWithAssetReference_(v83, v84, (uint64_t)v81);
          uint64_t v88 = objc_msgSend_reReferenceItemID(v67, v86, v87);
          objc_msgSend_setReReferenceItemID_(v85, v89, v88);
          objc_msgSend_setArrayIndex_(v85, v90, v65 + i);
          v93 = objc_msgSend_boundaryKey(v112, v91, v92);
          objc_msgSend_setBoundaryKey_(v85, v94, (uint64_t)v93);

          objc_msgSend_addObject_(v111, v95, (uint64_t)v85);
        }
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v96, (uint64_t)&v114, v122, 16);
        v65 += i;
      }
      while (v64);
    }

    long long v36 = v111;
    objc_msgSend_setAssets_(v112, v97, (uint64_t)v111);
    uint64_t v19 = v99;
    id v8 = v100;
    uint64_t v18 = v101;
    uint64_t v32 = v104;
    uint64_t v20 = v105;
    goto LABEL_25;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v10 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = v10;
    uint64_t v14 = objc_msgSend_recordID(v107, v12, v13);
    *(_DWORD *)buf = 138412546;
    id v125 = v98;
    __int16 v126 = 2112;
    uint64_t v127 = v14;
    _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "Encountered error %@ when fetching record with recordID %@ for package cloning", buf, 0x16u);
  }
LABEL_28:
}

- (void)_didCompleteRecordFetchOperation:(id)a3 assetArrayByRecordID:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_error(v6, v8, v9);

  if (!v10)
  {
    id v77 = v6;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v13 = objc_msgSend_keyEnumerator(v7, v11, v12);
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v82, v96, 16);
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v83;
      uint64_t v78 = *MEMORY[0x1E4F19DD8];
      uint64_t v79 = v13;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v83 != v18) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v7, v16, *(void *)(*((void *)&v82 + 1) + 8 * i));
          if (objc_msgSend_count(v20, v21, v22))
          {
            uint64_t v25 = objc_msgSend_handlersByAssetNeedingRecordFetch(self, v23, v24);
            uint64_t v28 = objc_msgSend_firstObject(v20, v26, v27);
            id v30 = objc_msgSend_objectForKey_(v25, v29, (uint64_t)v28);

            uint64_t v33 = objc_msgSend_error(v30, v31, v32);

            if (!v33)
            {
              id v36 = v7;
              long long v37 = self;
              uint64_t v38 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v34, v35);
              uint64_t v41 = objc_msgSend_rereferencedAssetArrayByFieldname(v30, v39, v40);
              v80[0] = MEMORY[0x1E4F143A8];
              v80[1] = 3221225472;
              v80[2] = sub_1C4FA32D8;
              v80[3] = &unk_1E64F7AE8;
              id v42 = v38;
              id v81 = v42;
              objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v41, v43, (uint64_t)v80);

              if (objc_msgSend_count(v42, v44, v45))
              {
                objc_msgSend_setState_(v30, v46, 12);
                id v47 = (void *)MEMORY[0x1E4F1A280];
                uint64_t v94 = @"FailedAssetsByFieldName";
                id v95 = v42;
                uint64_t v49 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v48, (uint64_t)&v95, &v94, 1);
                uint64_t v51 = objc_msgSend_errorWithDomain_code_userInfo_format_(v47, v50, v78, 3011, v49, @"One or more referenced asset do not exist");
                objc_msgSend_setError_(v30, v52, (uint64_t)v51);
              }
              self = v37;
              id v7 = v36;
              uint64_t v13 = v79;
            }
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v82, v96, 16);
      }
      while (v17);
    }

    id v6 = v77;
  }
  uint64_t v53 = objc_msgSend_error(v6, v11, v12);

  uint64_t v54 = (void *)MEMORY[0x1E4F1A550];
  v55 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (v53)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v56 = *v55;
    if (os_log_type_enabled(*v55, OS_LOG_TYPE_INFO))
    {
      long long v59 = v56;
      long long v62 = objc_msgSend_error(v6, v60, v61);
      *(_DWORD *)buf = 138412290;
      id v87 = v62;
      _os_log_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_INFO, "Error fetching records: %@", buf, 0xCu);
    }
    uint64_t v63 = objc_msgSend_error(self, v57, v58);

    if (!v63)
    {
      id v66 = objc_msgSend_error(v6, v64, v65);
      objc_msgSend_setError_(self, v67, (uint64_t)v66);
    }
  }
  if (*v54 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v68 = *v55;
  if (os_log_type_enabled(*v55, OS_LOG_TYPE_DEBUG))
  {
    long long v71 = v68;
    uint64_t v72 = (objc_class *)objc_opt_class();
    uint64_t v73 = NSStringFromClass(v72);
    id v76 = objc_msgSend_ckShortDescription(self, v74, v75);
    *(_DWORD *)buf = 134218754;
    id v87 = v6;
    __int16 v88 = 2114;
    uint64_t v89 = v73;
    __int16 v90 = 2048;
    uint64_t v91 = self;
    __int16 v92 = 2114;
    v93 = v76;
    _os_log_debug_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_DEBUG, "Fetch records operation %p completed for <%{public}@: %p; %{public}@>",
      buf,
      0x2Au);
  }
  objc_msgSend_hash(self, v69, v70);
  kdebug_trace();
}

- (void)_batchFetchAssetRecordsForRereferencing
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  uint64_t v110 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  uint64_t v5 = objc_msgSend_handlersByAssetNeedingRecordFetch(self, v3, v4);
  id v8 = objc_msgSend_keyEnumerator(v5, v6, v7);

  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v131, v137, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v132;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v132 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v13;
          if ((objc_msgSend_isReference(v15, v16, v17) & 1) == 0)
          {
            uint64_t v33 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 1451, @"Expected isReference %@", v15);
          }
          uint64_t v20 = [CKDModifyRecordsOperationReReferenceBatchKey alloc];
          uint64_t v22 = objc_msgSend_initWithAsset_(v20, v21, (uint64_t)v15);
          uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v110, v23, (uint64_t)v22);
          if (!v26)
          {
            uint64_t v26 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25);
            objc_msgSend_setObject_forKeyedSubscript_(v110, v27, (uint64_t)v26, v22);
          }
          objc_msgSend_addObject_(v26, v24, (uint64_t)v15);
          id v30 = objc_msgSend_assetRereferenceInfo(v15, v28, v29);
          objc_msgSend_clearRecordFetchProperties(v30, v31, v32);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v131, v137, 16);
    }
    while (v10);
  }

  uint64_t v125 = 0;
  __int16 v126 = &v125;
  uint64_t v127 = 0x3032000000;
  uint64_t v128 = sub_1C4F9DD44;
  uint64_t v129 = sub_1C4F9DD54;
  uint64_t v130 = self->_cloneContextsBySignature;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  objc_msgSend_allKeys(v110, v35, v36);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v121, v136, 16);
  if (v106)
  {
    uint64_t v105 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v106; ++j)
      {
        if (*(void *)v122 != v105) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v121 + 1) + 8 * j);
        uint64_t v41 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v38, v39);
        uint64_t v44 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v42, v43);
        uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v110, v45, v40);
        id v107 = (void *)v40;
        id v47 = objc_opt_new();
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v111 = v46;
        uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v48, (uint64_t)&v117, v135, 16);
        if (v51)
        {
          uint64_t v52 = *(void *)v118;
          do
          {
            for (uint64_t k = 0; k != v51; ++k)
            {
              if (*(void *)v118 != v52) {
                objc_enumerationMutation(v111);
              }
              uint64_t v54 = *(void **)(*((void *)&v117 + 1) + 8 * k);
              v55 = objc_msgSend_assetReference(v54, v49, v50);
              uint64_t v58 = objc_msgSend_recordID(v55, v56, v57);

              uint64_t v61 = objc_msgSend_objectForKeyedSubscript_(v47, v59, (uint64_t)v58);
              if (!v61)
              {
                uint64_t v61 = objc_opt_new();
                objc_msgSend_setObject_forKeyedSubscript_(v47, v62, (uint64_t)v61, v58);
              }
              objc_msgSend_addObject_(v61, v60, (uint64_t)v54);
              objc_msgSend_addObject_(v44, v63, (uint64_t)v58);
              id v66 = objc_msgSend_assetReference(v54, v64, v65);
              long long v69 = objc_msgSend_fieldName(v66, v67, v68);
              objc_msgSend_addObject_(v41, v70, (uint64_t)v69);
            }
            uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v49, (uint64_t)&v117, v135, 16);
          }
          while (v51);
        }

        long long v71 = objc_opt_new();
        uint64_t v74 = objc_msgSend_allObjects(v44, v72, v73);
        objc_msgSend_setRecordIDs_(v71, v75, (uint64_t)v74);

        uint64_t v78 = objc_msgSend_allObjects(v41, v76, v77);
        objc_msgSend_setDesiredKeys_(v71, v79, (uint64_t)v78);

        long long v82 = objc_msgSend_container(self, v80, v81);
        long long v85 = objc_msgSend_options(v82, v83, v84);
        unint64_t v88 = objc_msgSend_mmcsEncryptionSupport(v85, v86, v87);
        objc_msgSend_setShouldFetchAssetContent_(v71, v89, (v88 >> 1) & 1);

        objc_msgSend_setShouldFetchAssetContent_(v71, v90, 1);
        objc_msgSend_setFetchingAssetsForRereference_(v71, v91, 1);
        uint64_t v94 = objc_msgSend_databaseScope(v107, v92, v93);
        if (objc_msgSend_isClone(v107, v95, v96))
        {
          if (!v126[5])
          {
            id v98 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v99 = (void *)v126[5];
            v126[5] = (uint64_t)v98;

            objc_storeStrong((id *)&self->_cloneContextsBySignature, (id)v126[5]);
          }
          v116[0] = MEMORY[0x1E4F143A8];
          v116[1] = 3221225472;
          v116[2] = sub_1C4FA3B40;
          v116[3] = &unk_1E64F7B10;
          v116[4] = &v125;
          objc_msgSend_setCloneContextReturnBlock_(v71, v97, (uint64_t)v116);
        }
        uint64_t v100 = objc_opt_class();
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = sub_1C4FA3CF0;
        v112[3] = &unk_1E64F7B38;
        v112[4] = self;
        uint64_t v114 = v94;
        SEL v115 = a2;
        id v101 = v47;
        id v113 = v101;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v102, v100, v71, v112);
      }
      uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v121, v136, 16);
    }
    while (v106);
  }

  _Block_object_dispose(&v125, 8);
}

- (void)_fetchPackageRecordsForRereferencing
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v100 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  uint64_t v5 = objc_msgSend_handlersByAssetNeedingRecordFetch(self, v3, v4);
  id v8 = objc_msgSend_keyEnumerator(v5, v6, v7);

  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v121, v127, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v122 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v121 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v13;
          if ((objc_msgSend_isReference(v15, v16, v17) & 1) == 0)
          {
            uint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 1547, @"Expect package %@ to be a reference", v15);
          }
          uint64_t v20 = [CKDModifyRecordsOperationReReferenceBatchKey alloc];
          uint64_t v22 = objc_msgSend_initWithPackage_(v20, v21, (uint64_t)v15);
          uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v100, v23, (uint64_t)v22);
          if (!v26)
          {
            uint64_t v26 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25);
            objc_msgSend_setObject_forKeyedSubscript_(v100, v27, (uint64_t)v26, v22);
          }
          objc_msgSend_addObject_(v26, v24, (uint64_t)v15);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v121, v127, 16);
    }
    while (v10);
  }

  id v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_msgSend_allKeys(v100, v31, v32);
  uint64_t v35 = objc_msgSend_setWithArray_(v30, v34, (uint64_t)v33);

  uint64_t v115 = 0;
  long long v116 = &v115;
  uint64_t v117 = 0x3032000000;
  long long v118 = sub_1C4F9DD44;
  long long v119 = sub_1C4F9DD54;
  long long v120 = self->_cloneContextsBySignature;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = v35;
  uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v111, v126, 16);
  if (v96)
  {
    uint64_t v95 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v96; ++j)
      {
        if (*(void *)v112 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void *)(*((void *)&v111 + 1) + 8 * j);
        uint64_t v40 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v37, v38);
        uint64_t v43 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v41, v42);
        uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v100, v44, v39);
        id v98 = (void *)v39;
        uint64_t v46 = objc_opt_new();
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        id v101 = v45;
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v47, (uint64_t)&v107, v125, 16);
        if (v50)
        {
          uint64_t v51 = *(void *)v108;
          do
          {
            for (uint64_t k = 0; k != v50; ++k)
            {
              if (*(void *)v108 != v51) {
                objc_enumerationMutation(v101);
              }
              uint64_t v53 = *(void **)(*((void *)&v107 + 1) + 8 * k);
              uint64_t v54 = objc_msgSend_packageReference(v53, v48, v49);
              uint64_t v57 = objc_msgSend_recordID(v54, v55, v56);

              uint64_t v61 = objc_msgSend_objectForKeyedSubscript_(v46, v58, (uint64_t)v57);
              if (!v61)
              {
                uint64_t v61 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v59, v60);
                objc_msgSend_setObject_forKeyedSubscript_(v46, v62, (uint64_t)v61, v57);
              }
              objc_msgSend_addObject_(v61, v59, (uint64_t)v53);
              objc_msgSend_addObject_(v43, v63, (uint64_t)v57);
              id v66 = objc_msgSend_packageReference(v53, v64, v65);
              long long v69 = objc_msgSend_fieldName(v66, v67, v68);
              objc_msgSend_addObject_(v40, v70, (uint64_t)v69);
            }
            uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v48, (uint64_t)&v107, v125, 16);
          }
          while (v50);
        }

        long long v71 = objc_opt_new();
        uint64_t v74 = objc_msgSend_allObjects(v43, v72, v73);
        objc_msgSend_setRecordIDs_(v71, v75, (uint64_t)v74);

        uint64_t v78 = objc_msgSend_allObjects(v40, v76, v77);
        objc_msgSend_setDesiredKeys_(v71, v79, (uint64_t)v78);

        objc_msgSend_setShouldFetchAssetContent_(v71, v80, 1);
        objc_msgSend_setFetchingAssetsForRereference_(v71, v81, 1);
        uint64_t v84 = objc_msgSend_databaseScope(v98, v82, v83);
        if (objc_msgSend_isClone(v98, v85, v86))
        {
          if (!v116[5])
          {
            id v88 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v89 = (void *)v116[5];
            void v116[5] = (uint64_t)v88;

            objc_storeStrong((id *)&self->_cloneContextsBySignature, (id)v116[5]);
          }
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = sub_1C4FA4900;
          v106[3] = &unk_1E64F7B10;
          v106[4] = &v115;
          objc_msgSend_setCloneContextReturnBlock_(v71, v87, (uint64_t)v106);
        }
        uint64_t v90 = objc_opt_class();
        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v102[2] = sub_1C4FA4AB0;
        v102[3] = &unk_1E64F7B38;
        v102[4] = self;
        uint64_t v104 = v84;
        SEL v105 = a2;
        id v91 = v46;
        id v103 = v91;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v92, v90, v71, v102);
      }
      uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v111, v126, 16);
    }
    while (v96);
  }

  _Block_object_dispose(&v115, 8);
}

- (void)_fetchRecordsForRereferencing
{
  uint64_t v5 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], a2, v2);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4FA4FFC;
  v13[3] = &unk_1E64F7B60;
  id v14 = v5;
  SEL v15 = a2;
  v13[4] = self;
  id v6 = v5;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v7, 3, v13);
  objc_msgSend_setHandlersByAssetNeedingRecordFetch_(self, v8, (uint64_t)v6);
  objc_msgSend__fetchPackageRecordsForRereferencing(self, v9, v10);
  objc_msgSend__batchFetchAssetRecordsForRereferencing(self, v11, v12);
}

- (void)_prepareForUpload
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend__prepareAssetsForUpload(self, a2, v2);
  objc_msgSend_setHandlersByAsset_(self, v5, (uint64_t)v4);

  id v8 = objc_msgSend_handlersByAsset(self, v6, v7);
  uint64_t v11 = objc_msgSend_count(v8, v9, v10);

  if (v11)
  {
    id v14 = objc_msgSend_container(self, v12, v13);
    uint64_t v17 = objc_msgSend_options(v14, v15, v16);
    uint64_t v20 = objc_msgSend_mmcsEncryptionSupport(v17, v18, v19);

    if (v20 != 1)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v23 = objc_msgSend_handlersByAsset(self, v21, v22, 0);
      uint64_t v26 = objc_msgSend_keyEnumerator(v23, v24, v25);

      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v63, v67, 16);
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v64;
        while (2)
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v64 != v30) {
              objc_enumerationMutation(v26);
            }
            uint64_t v32 = *(void **)(*((void *)&v63 + 1) + 8 * v31);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v33 = v32;
              uint64_t v36 = objc_msgSend_container(self, v34, v35);
              uint64_t v39 = objc_msgSend_options(v36, v37, v38);
              if (objc_msgSend_mmcsEncryptionSupport(v39, v40, v41) == 2
                || (objc_msgSend_useMMCSEncryptionV2(v33, v42, v43) & 1) != 0)
              {
                uint64_t v44 = objc_msgSend_boundaryKey(v33, v42, v43);

                if (!v44) {
                  goto LABEL_25;
                }
              }
              else
              {
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v46 = v32;
              uint64_t v49 = objc_msgSend_container(self, v47, v48);
              uint64_t v52 = objc_msgSend_options(v49, v50, v51);
              if (objc_msgSend_mmcsEncryptionSupport(v52, v53, v54) == 2
                || (objc_msgSend_useMMCSEncryptionV2(v46, v55, v56) & 1) != 0)
              {
                uint64_t v57 = objc_msgSend_boundaryKey(v46, v55, v56);

                if (!v57)
                {
LABEL_25:

                  uint64_t v60 = objc_msgSend_cachedGlobalPerUserBoundaryKeyData(self, v58, v59);

                  if (!v60) {
                    objc_msgSend__fetchGlobalPerUserBoundaryKey(self, v61, v62);
                  }
                  return;
                }
              }
              else
              {
              }
            }
            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v45, (uint64_t)&v63, v67, 16);
          if (v29) {
            continue;
          }
          break;
        }
      }
    }
  }
}

- (id)_prepareAssetsForUpload
{
  uint64_t v4 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4FA556C;
  v8[3] = &unk_1E64F7A70;
  id v5 = v4;
  id v9 = v5;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v6, 4, v8);

  return v5;
}

- (void)_fetchGlobalPerUserBoundaryKey
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = objc_msgSend_operationID(self, v4, v5);
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v18;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Fetching user boundary key for operation %{public}@", buf, 0xCu);
  }
  id v8 = objc_msgSend_stateTransitionGroup(self, v6, v7);
  dispatch_group_enter(v8);

  objc_msgSend_noteOperationWillWaitOnPCS(self, v9, v10);
  uint64_t v13 = objc_msgSend_container(self, v11, v12);
  uint64_t v16 = objc_msgSend_pcsManager(v13, v14, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4FA592C;
  v19[3] = &unk_1E64F7B88;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  objc_msgSend_globalPerUserBoundaryKeyDataWithCompletionHandler_(v16, v17, (uint64_t)v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_uploadAssets
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_handlersByAsset(self, a2, v2);
  if (objc_msgSend_count(v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_keyEnumerator(v5, v8, v9);
    uint64_t v13 = objc_msgSend_allObjects(v10, v11, v12);

    id v14 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v16 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v61 = v16;
      long long v64 = objc_msgSend_operationID(self, v62, v63);
      *(_DWORD *)buf = 138543618;
      long long v69 = v64;
      __int16 v70 = 2112;
      long long v71 = v13;
      _os_log_debug_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_DEBUG, "Uploading assets for operation %{public}@: %@", buf, 0x16u);
    }
    uint64_t v19 = objc_msgSend_container(self, v17, v18);
    uint64_t v22 = objc_msgSend_options(v19, v20, v21);
    char v25 = objc_msgSend_mmcsEncryptionSupport(v22, v23, v24);

    if ((v25 & 2) != 0)
    {
      uint64_t v27 = objc_msgSend__setBoundaryKeyOnAssetsToUpload_(self, v26, (uint64_t)v13);

      if (!objc_msgSend_count(v27, v33, v34))
      {
        if (*v14 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v56 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v57 = v56;
          uint64_t v60 = objc_msgSend_operationID(self, v58, v59);
          *(_DWORD *)buf = 138543362;
          long long v69 = v60;
          _os_log_debug_impl(&dword_1C4CFF000, v57, OS_LOG_TYPE_DEBUG, "No assets to upload after setting boundary keys for operation %{public}@", buf, 0xCu);
        }
        goto LABEL_15;
      }
      uint64_t v13 = v27;
    }
    else
    {
      uint64_t v27 = v13;
    }
    uint64_t v35 = objc_opt_new();
    objc_msgSend_setAssetsToUpload_(v35, v36, (uint64_t)v13);
    uint64_t v39 = objc_msgSend_assetUUIDToExpectedProperties(self, v37, v38);
    objc_msgSend_setAssetUUIDToExpectedProperties_(v35, v40, (uint64_t)v39);

    uint64_t v43 = objc_msgSend_packageUUIDToExpectedProperties(self, v41, v42);
    objc_msgSend_setPackageUUIDToExpectedProperties_(v35, v44, (uint64_t)v43);

    uint64_t v47 = objc_msgSend_originatingFromDaemon(self, v45, v46);
    objc_msgSend_setTemporary_(v35, v48, v47);
    uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v49, v50);
    objc_msgSend_setShouldCloneFileInAssetCache_(v35, v52, shouldCloneFileInAssetCache);
    objc_msgSend_setCloneContextsBySignature_(v35, v53, (uint64_t)self->_cloneContextsBySignature);
    uint64_t v54 = objc_opt_class();
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = sub_1C4FA5FFC;
    v65[3] = &unk_1E64F7C28;
    v65[4] = self;
    SEL v67 = a2;
    id v66 = v5;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v55, v54, v35, v65);

LABEL_15:
    goto LABEL_16;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v28 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = v28;
    uint64_t v32 = objc_msgSend_operationID(self, v30, v31);
    *(_DWORD *)buf = 138543362;
    long long v69 = v32;
    _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "No assets to upload for operation %{public}@", buf, 0xCu);
  }
LABEL_16:
}

- (id)_setBoundaryKeyOnAssetsToUpload:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v85, v95, 16);
  if (!v5)
  {
    long long v82 = 0;
    uint64_t v83 = 0;
    id v80 = v3;
    goto LABEL_42;
  }
  uint64_t v6 = v5;
  long long v82 = 0;
  uint64_t v83 = 0;
  uint64_t v7 = *(void *)v86;
  unint64_t v8 = 0x1E4F19000uLL;
  id v80 = v3;
  uint64_t v81 = *MEMORY[0x1E4F19C40];
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v86 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v10 = *(void **)(*((void *)&v85 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = v6;
        uint64_t v12 = v7;
        unint64_t v13 = v8;
        id v14 = v3;
        id v15 = v10;
        uint64_t v18 = objc_msgSend_container(self, v16, v17);
        uint64_t v21 = objc_msgSend_options(v18, v19, v20);
        char v24 = objc_msgSend_mmcsEncryptionSupport(v21, v22, v23);

        if ((v24 & 1) == 0)
        {
          uint64_t v29 = objc_msgSend_boundaryKey(v15, v25, v26);
          goto LABEL_10;
        }
        int v30 = objc_msgSend_useMMCSEncryptionV2(v15, v25, v26);
        uint64_t v33 = objc_msgSend_boundaryKey(v15, v31, v32);
        uint64_t v29 = (void *)v33;
        if (v30)
        {
LABEL_10:
          if (v29)
          {
            uint64_t v34 = 0;
            ++HIDWORD(v83);
LABEL_21:

            id v3 = v14;
            unint64_t v8 = v13;
            uint64_t v7 = v12;
            uint64_t v6 = v11;
            goto LABEL_22;
          }
          uint64_t v29 = objc_msgSend_cachedGlobalPerUserBoundaryKeyData(self, v27, v28);
          if (v29)
          {
            objc_msgSend_setBoundaryKey_(v15, v27, (uint64_t)v29);
            uint64_t v34 = 0;
            LODWORD(v83) = v83 + 1;
            goto LABEL_21;
          }
          uint64_t v35 = @"Expected non-nil cached boundary key";
        }
        else
        {
          uint64_t v35 = @"Boundary key not supported for MMCSv1 asset upload";
          if (!v33)
          {
            uint64_t v34 = 0;
            goto LABEL_21;
          }
        }
        uint64_t v34 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, v81, 12, v35);
        if (v34)
        {
          uint64_t v38 = v82;
          if (!v82)
          {
            id v39 = (id)objc_msgSend_mutableCopy(v14, v36, v37);

            uint64_t v38 = v39;
            id v80 = v39;
          }
          long long v82 = v38;
          objc_msgSend_removeObject_(v38, v36, (uint64_t)v15);
          uint64_t v41 = objc_msgSend_objectForKey_(self->_handlersByAsset, v40, (uint64_t)v15);
          objc_msgSend_setError_(v41, v42, (uint64_t)v34);
          objc_msgSend_setState_(v41, v43, 12);
        }
        goto LABEL_21;
      }
LABEL_22:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        continue;
      }
      id v45 = v10;
      uint64_t v48 = objc_msgSend_container(self, v46, v47);
      uint64_t v51 = objc_msgSend_options(v48, v49, v50);
      char v54 = objc_msgSend_mmcsEncryptionSupport(v51, v52, v53);

      if (v54)
      {
        int v60 = objc_msgSend_useMMCSEncryptionV2(v45, v55, v56);
        uint64_t v63 = objc_msgSend_boundaryKey(v45, v61, v62);
        uint64_t v59 = (void *)v63;
        if (!v60)
        {
          long long v65 = @"Boundary key not supported for MMCSv1 package upload";
          if (v63) {
            goto LABEL_33;
          }
          long long v64 = 0;
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v59 = objc_msgSend_boundaryKey(v45, v55, v56);
      }
      if (v59)
      {
        long long v64 = 0;
        ++HIDWORD(v83);
      }
      else
      {
        uint64_t v59 = objc_msgSend_cachedGlobalPerUserBoundaryKeyData(self, v57, v58);
        if (!v59)
        {
          long long v65 = @"Expected non-nil cached boundary key";
LABEL_33:
          long long v64 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v57, v81, 12, v65);
          if (v64)
          {
            uint64_t v68 = v82;
            if (!v82)
            {
              id v69 = (id)objc_msgSend_mutableCopy(v3, v66, v67);

              uint64_t v68 = v69;
              id v80 = v69;
            }
            long long v82 = v68;
            objc_msgSend_removeObject_(v68, v66, (uint64_t)v45);
            long long v71 = objc_msgSend_objectForKey_(self->_handlersByAsset, v70, (uint64_t)v45);
            objc_msgSend_setError_(v71, v72, (uint64_t)v64);
            objc_msgSend_setState_(v71, v73, 12);
          }
          goto LABEL_37;
        }
        objc_msgSend_setBoundaryKey_(v45, v57, (uint64_t)v59);
        long long v64 = 0;
        LODWORD(v83) = v83 + 1;
      }
LABEL_37:
    }
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v44, (uint64_t)&v85, v95, 16);
  }
  while (v6);
LABEL_42:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v74 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v76 = v74;
    uint64_t v79 = objc_msgSend_count(v3, v77, v78);
    *(_DWORD *)buf = 134218496;
    uint64_t v90 = v79;
    __int16 v91 = 1024;
    int v92 = v83;
    __int16 v93 = 1024;
    int v94 = HIDWORD(v83);
    _os_log_debug_impl(&dword_1C4CFF000, v76, OS_LOG_TYPE_DEBUG, "Of %lu potential v2 assets, globalPerUser %d, custom %d", buf, 0x18u);
  }
  return v80;
}

- (void)_markRecordHandlersAsUploaded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = v4;
    id v14 = objc_msgSend_operationID(self, v12, v13);
    uint64_t v17 = objc_msgSend_modifyHandlersByZoneID(self, v15, v16);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Skipping saving records for operation %{public}@ after uploading assets: %@", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4FA7950;
  v18[3] = &unk_1E64F7C50;
  v18[4] = self;
  void v18[5] = a2;
  uint64_t v5 = _Block_copy(v18);
  if (objc_msgSend_shouldOnlySaveAssetContent(self, v6, v7)) {
    objc_msgSend__enumerateHandlersInState_withBlock_(self, v8, 5, v5);
  }
  if ((objc_msgSend_shouldModifyRecordsInDatabase(self, v8, v9) & 1) == 0) {
    objc_msgSend__enumerateHandlersInState_withBlock_(self, v10, 6, v5);
  }
}

- (BOOL)_prepareRecordsForSave
{
  uint64_t v4 = self;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_shouldOnlySaveAssetContent(self, a2, v2))
  {
    uint64_t v57 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v57, v58, (uint64_t)a2, v4, @"CKDModifyRecordsOperation.m", 2003, @"We shouldn't get into this state if shouldOnlySaveAssetContent is true");
  }
  int haveOutstandingHandlers = objc_msgSend_haveOutstandingHandlers(v4, v5, v6);
  if (haveOutstandingHandlers)
  {
    char v60 = haveOutstandingHandlers;
    SEL v61 = a2;
    uint64_t v67 = objc_opt_new();
    unint64_t v8 = dispatch_group_create();
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v11 = objc_msgSend_modifyHandlersByZoneID(v4, v9, v10);
    id v14 = objc_msgSend_allKeys(v11, v12, v13);

    obuint64_t j = v14;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v77, v88, 16);
    if (v65)
    {
      uint64_t v63 = *(void *)v78;
      long long v64 = v4;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v78 != v63) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v77 + 1) + 8 * v18);
          int v20 = objc_msgSend_atomic(v4, v16, v17);
          uint64_t v23 = objc_msgSend_container(v4, v21, v22);
          objc_msgSend_clientSDKVersion(v23, v24, v25);
          uint64_t v66 = v18;
          if (CKLinkCheck48d9728e8c354416a38f82379cbb35e3())
          {
          }
          else
          {
            int isDefaultRecordZoneID = objc_msgSend_isDefaultRecordZoneID(v19, v26, v27);

            v20 &= ~isDefaultRecordZoneID;
          }
          uint64_t v31 = objc_msgSend_modifyHandlersByZoneID(v4, v28, v29);
          uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v19);

          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v34 = v33;
          uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v73, v87, 16);
          if (v36)
          {
            uint64_t v39 = v36;
            uint64_t v40 = *(void *)v74;
            do
            {
              uint64_t v41 = 0;
              do
              {
                if (*(void *)v74 != v40) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v42 = *(void **)(*((void *)&v73 + 1) + 8 * v41);
                if (objc_msgSend_state(v42, v37, v38) == 5)
                {
                  dispatch_group_enter(v8);
                  v71[0] = MEMORY[0x1E4F143A8];
                  v71[1] = 3221225472;
                  v71[2] = sub_1C4FA7EB8;
                  v71[3] = &unk_1E64F05C8;
                  uint64_t v72 = v8;
                  objc_msgSend_prepareForSaveWithCompletionHandler_(v42, v43, (uint64_t)v71);
                }
                else if (v20)
                {
                  if (*MEMORY[0x1E4F1A550] != -1) {
                    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  uint64_t v44 = (void *)*MEMORY[0x1E4F1A500];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v46 = v44;
                    uint64_t v49 = objc_msgSend_state(v42, v47, v48);
                    *(_DWORD *)buf = 138412802;
                    long long v82 = v19;
                    __int16 v83 = 2112;
                    uint64_t v84 = v42;
                    __int16 v85 = 2048;
                    uint64_t v86 = v49;
                    _os_log_debug_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEBUG, "Will skip zone %@ because handler isn't ready:\n%@. Handler state %lu", buf, 0x20u);
                  }
                  objc_msgSend_addObject_(v67, v45, (uint64_t)v19);
                }
                ++v41;
              }
              while (v39 != v41);
              uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v73, v87, 16);
            }
            while (v39);
          }

          uint64_t v18 = v66 + 1;
          uint64_t v4 = v64;
        }
        while (v66 + 1 != v65);
        uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v77, v88, 16);
      }
      while (v65);
    }

    uint64_t v52 = objc_msgSend_stateTransitionGroup(v4, v50, v51);
    dispatch_group_enter(v52);

    v55 = objc_msgSend_modifyRecordsQueue(v4, v53, v54);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4FA7EC0;
    block[3] = &unk_1E64F19C0;
    block[4] = v4;
    id v69 = v67;
    SEL v70 = v61;
    id v56 = v67;
    dispatch_group_notify(v8, v55, block);

    LOBYTE(haveOutstandingHandlers) = v60;
  }
  return haveOutstandingHandlers;
}

- (CKDProtocolTranslator)translator
{
  translator = self->_translator;
  if (!translator)
  {
    uint64_t v4 = [CKDProtocolTranslator alloc];
    uint64_t v7 = objc_msgSend_container(self, v5, v6);
    uint64_t v10 = objc_msgSend_databaseScope(self, v8, v9);
    uint64_t v12 = (CKDProtocolTranslator *)objc_msgSend_initWithContainer_databaseScope_(v4, v11, (uint64_t)v7, v10);
    uint64_t v13 = self->_translator;
    self->_translator = v12;

    translator = self->_translator;
  }
  return translator;
}

- (void)_handleDecryptionFailure:(id)a3 forRecordID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v9 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v10 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v11 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Failed to decrypt record with ID %@: %@.", buf, 0x16u);
  }
  if (objc_msgSend_code(v6, v12, v13) == 5004)
  {
    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v9);
    }
    id v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_fault_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_FAULT, "Failed to decrypt record with ID %@: %@", buf, 0x16u);
    }
  }
  uint64_t v16 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 5004, v6, @"Couldn't decrypt data on record %@", v7);
  uint64_t v19 = objc_msgSend_handlersByRecordID(self, v17, v18);
  __int16 v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v7);

  objc_msgSend_setError_(v21, v22, (uint64_t)v16);
  int v25 = objc_msgSend_retryPCSFailures(self, v23, v24);
  dispatch_block_t v26 = *v9;
  if (v25)
  {
    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v26);
    }
    uint64_t v27 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v7;
      _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Marking record %@ for another retry after fetching PCS data", buf, 0xCu);
    }
    objc_msgSend_clearProtectionDataForRecord(v21, v28, v29);
    objc_msgSend_setState_(v21, v30, 13);
  }
  else
  {
    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v26);
    }
    uint64_t v31 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v7;
      _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Failing save of record %@ because we couldn't decrypt it", buf, 0xCu);
    }
    objc_msgSend_setState_(v21, v32, 12);
  }
}

- (void)_verifyRecordEncryption
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_useEncryption(self, a2, v2))
  {
    id v6 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v4, v5);
    int shouldDecryptRecordsBeforeSave = objc_msgSend_shouldDecryptRecordsBeforeSave(v6, v7, v8);

    if (shouldDecryptRecordsBeforeSave)
    {
      uint64_t v104 = objc_opt_new();
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      uint64_t v12 = objc_msgSend_recordsToSave(self, v10, v11);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v115, v123, 16);
      if (v14)
      {
        uint64_t v18 = v14;
        uint64_t v19 = *(void *)v116;
        *(void *)&long long v17 = 138412290;
        long long v103 = v17;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v116 != v19) {
              objc_enumerationMutation(v12);
            }
            __int16 v21 = *(void **)(*((void *)&v115 + 1) + 8 * v20);
            if (objc_msgSend_hasPropertiesRequiringEncryption(v21, v15, v16, v103))
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
              {
                uint64_t v41 = v22;
                uint64_t v44 = objc_msgSend_recordID(v21, v42, v43);
                *(_DWORD *)buf = v103;
                uint64_t v122 = (uint64_t)v44;
                _os_log_debug_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_DEBUG, "Verifying encrypted data on record %@ before uploading it", buf, 0xCu);
              }
              int v25 = objc_msgSend_translator(self, v23, v24);
              BOOL v28 = objc_msgSend_savePolicy(self, v26, v27) == 2;
              int v30 = objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v25, v29, (uint64_t)v21, v28, 0, 0);

              uint64_t v33 = objc_msgSend_translator(self, v31, v32);
              id v114 = 0;
              __int16 v35 = objc_msgSend_recordFromPRecord_error_(v33, v34, (uint64_t)v30, &v114);
              id v36 = v114;

              if (v36 || !v35)
              {
                uint64_t v39 = objc_msgSend_recordID(v21, v37, v38);
                objc_msgSend__handleDecryptionFailure_forRecordID_(self, v40, (uint64_t)v36, v39);
              }
              else
              {
                objc_msgSend_addObject_(v104, v37, (uint64_t)v35);
              }
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v115, v123, 16);
        }
        while (v18);
      }

      id v45 = v104;
      if (objc_msgSend_count(v104, v46, v47))
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v48 = v104;
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v110, v120, 16);
        if (v50)
        {
          uint64_t v53 = v50;
          uint64_t v54 = *(void *)v111;
          uint64_t v55 = *MEMORY[0x1E4F19D48];
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v111 != v54) {
                objc_enumerationMutation(v48);
              }
              uint64_t v57 = *(void **)(*((void *)&v110 + 1) + 8 * i);
              uint64_t v58 = objc_msgSend_recordID(v57, v51, v52);
              objc_msgSend_setPCSData_forFetchedRecordID_(self, v59, 0, v58);

              uint64_t v62 = objc_msgSend_recordID(v57, v60, v61);
              uint64_t v65 = objc_msgSend_zoneID(v62, v63, v64);
              objc_msgSend_setPCSData_forFetchedZoneID_(self, v66, 0, v65);

              id v69 = objc_msgSend_share(v57, v67, v68);
              uint64_t v72 = objc_msgSend_recordID(v69, v70, v71);
              objc_msgSend_setPCSData_forFetchedShareID_(self, v73, 0, v72);

              id v74 = objc_alloc(MEMORY[0x1E4F1A2F8]);
              long long v77 = objc_msgSend_recordID(v57, v75, v76);
              long long v80 = objc_msgSend_zoneID(v77, v78, v79);
              long long v82 = objc_msgSend_initWithRecordName_zoneID_(v74, v81, v55, v80);

              objc_msgSend_setPCSData_forFetchedShareID_(self, v83, 0, v82);
            }
            uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v110, v120, 16);
          }
          while (v53);
        }

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v84 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v99 = v84;
          uint64_t v102 = objc_msgSend_count(v48, v100, v101);
          *(_DWORD *)buf = 134217984;
          uint64_t v122 = v102;
          _os_log_debug_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_DEBUG, "Sending %ld records to the record decrypt operation before uploading them to the server", buf, 0xCu);
        }
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v85 = v48;
        uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v106, v119, 16);
        if (v87)
        {
          uint64_t v90 = v87;
          uint64_t v91 = *(void *)v107;
          do
          {
            for (uint64_t j = 0; j != v90; ++j)
            {
              if (*(void *)v107 != v91) {
                objc_enumerationMutation(v85);
              }
              uint64_t v93 = *(void *)(*((void *)&v106 + 1) + 8 * j);
              int v94 = objc_msgSend_stateTransitionGroup(self, v88, v89);
              dispatch_group_enter(v94);

              uint64_t v97 = objc_msgSend_recordDecryptOperation(self, v95, v96);
              v105[0] = MEMORY[0x1E4F143A8];
              v105[1] = 3221225472;
              v105[2] = sub_1C4FA8E08;
              v105[3] = &unk_1E64F7C78;
              v105[4] = self;
              objc_msgSend_decryptRecord_withCompletion_(v97, v98, v93, v105);
            }
            uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v106, v119, 16);
          }
          while (v90);
        }

        id v45 = v104;
      }
    }
  }
}

- (void)_handleRecordSaved:(id)a3 handler:(id)a4 etag:(id)a5 dateStatistics:(id)a6 expirationDate:(id)a7 responseCode:(id)a8 keysAssociatedWithETag:(id)a9 recordForOplockFailure:(id)a10 serverRecord:(id)a11
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  if (objc_msgSend_hasPropertiesRequiringEncryption(v25, v26, v27))
  {
    uint64_t v43 = v22;
    int v30 = objc_msgSend_stateTransitionGroup(self, v28, v29);
    dispatch_group_enter(v30);

    uint64_t v44 = v20;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v31 = v18;
    uint64_t v32 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v37 = v32;
      uint64_t v40 = objc_msgSend_recordID(v25, v38, v39);
      *(_DWORD *)buf = 138412290;
      uint64_t v57 = v40;
      _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Decrypting server record %@ returned from save", buf, 0xCu);
    }
    uint64_t v42 = objc_msgSend_recordDecryptOperation(self, v33, v34);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1C4FA92AC;
    v45[3] = &unk_1E64F7CA0;
    id v46 = v25;
    id v47 = v31;
    id v48 = self;
    id v41 = v17;
    id v49 = v17;
    id v50 = v19;
    id v51 = v44;
    id v52 = v21;
    id v22 = v43;
    id v53 = v43;
    id v54 = v23;
    id v55 = v24;
    __int16 v35 = v31;
    id v20 = v44;
    objc_msgSend_decryptRecord_withCompletion_(v42, v36, (uint64_t)v46, v45);

    id v18 = v35;
    id v17 = v41;
  }
  else
  {
    objc_msgSend__reallyHandleRecordSaved_handler_etag_dateStatistics_expirationDate_responseCode_keysAssociatedWithETag_recordForOplockFailure_decryptedServerRecord_(self, v28, (uint64_t)v17, v18, v19, v20, v21, v22, v23, v24, v25);
  }
}

- (void)_reallyHandleRecordSaved:(id)a3 handler:(id)a4 etag:(id)a5 dateStatistics:(id)a6 expirationDate:(id)a7 responseCode:(id)a8 keysAssociatedWithETag:(id)a9 recordForOplockFailure:(id)a10 decryptedServerRecord:(id)a11
{
  uint64_t v448 = *MEMORY[0x1E4F143B8];
  v425 = (__CFString *)a3;
  id v424 = a4;
  id v418 = a5;
  id v420 = a6;
  id v417 = a7;
  id v17 = (__CFString *)a8;
  id v415 = a9;
  id v416 = a10;
  id v423 = a11;
  val = self;
  v421 = objc_msgSend_container(self, v18, v19);
  if (v425)
  {
    id v22 = objc_msgSend_handlersByRecordID(self, v20, v21);
    id v24 = objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v425);
    uint64_t v27 = objc_msgSend_record(v24, v25, v26);
  }
  else
  {
    uint64_t v27 = 0;
  }
  objc_opt_class();
  v422 = v27;
  if (objc_opt_isKindOfClass())
  {
    int v30 = objc_msgSend_entitlements(v421, v28, v29);
    if (objc_msgSend_hasOutOfProcessUIEntitlement(v30, v31, v32))
    {
      objc_msgSend_setSerializePersonalInfo_(v423, v33, 1);
    }
    else
    {
      __int16 v35 = objc_msgSend_entitlements(v421, v33, v34);
      uint64_t hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v35, v36, v37);
      objc_msgSend_setSerializePersonalInfo_(v423, v39, hasParticipantPIIEntitlement);
    }
    uint64_t v27 = v422;
  }
  objc_msgSend_setServerRecord_(v424, v28, (uint64_t)v423);
  int v42 = objc_msgSend_code(v17, v40, v41);
  if (v425 && v42 == 1)
  {
    if (v27)
    {
      if (objc_msgSend_canSkipRecordSaveForMergeables(v27, v43, v44)
        && objc_msgSend_state(v424, v45, v46) == 11)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v47 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v445 = v425;
          _os_log_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_INFO, "Mergeable record already failed with an atomic failure %@", buf, 0xCu);
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v72 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v445 = v425;
          _os_log_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_INFO, "Record %@ was successfully saved to the server", buf, 0xCu);
        }
        if (objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, v73, v74)) {
          objc_msgSend_setState_(v424, v75, 8);
        }
        else {
          objc_msgSend_setState_(v424, v75, 7);
        }
        objc_msgSend_setKnownToServer_(v422, v76, 1);
        if (v418) {
          objc_msgSend_setEtag_(v422, v77, (uint64_t)v418);
        }
        uint64_t v79 = objc_msgSend_creation(v420, v77, v78);
        int hasTime = objc_msgSend_hasTime(v79, v80, v81);

        if (hasTime)
        {
          id v85 = (void *)MEMORY[0x1E4F1C9C8];
          uint64_t v86 = objc_msgSend_creation(v420, v83, v84);
          objc_msgSend_time(v86, v87, v88);
          uint64_t v91 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v85, v89, v90);

          if (v91)
          {
            objc_msgSend_setCreationDate_(v422, v83, (uint64_t)v91);
          }
        }
        int v92 = objc_msgSend_modification(v420, v83, v84);
        int v95 = objc_msgSend_hasTime(v92, v93, v94);

        if (v95)
        {
          id v98 = (void *)MEMORY[0x1E4F1C9C8];
          uint64_t v99 = objc_msgSend_modification(v420, v96, v97);
          objc_msgSend_time(v99, v100, v101);
          uint64_t v104 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v98, v102, v103);

          if (v104)
          {
            objc_msgSend_setModificationDate_(v422, v96, (uint64_t)v104);
          }
        }
        objc_msgSend_setExpirationDate_(v422, v96, (uint64_t)v417);
        objc_msgSend_setHasUpdatedExpirationTimeInterval_(v422, v105, 0);
        objc_msgSend_setUpdatedExpirationTimeInterval_(v422, v106, 0);
        objc_msgSend_savePCSDataToCache(v424, v107, v108);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      long long v109 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v445 = v425;
        _os_log_error_impl(&dword_1C4CFF000, v109, OS_LOG_TYPE_ERROR, "Got a response for record with ID %@, but we didn't try to put that record.", buf, 0xCu);
      }
      objc_msgSend_setState_(v424, v110, 12);
      long long v111 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v112 = sub_1C4E94D98(v17);
      long long v115 = objc_msgSend_request(self, v113, v114);
      long long v116 = sub_1C4E940D0(v115, v17);
      long long v118 = objc_msgSend_errorWithDomain_code_userInfo_format_(v111, v117, *MEMORY[0x1E4F19DD8], v112, v116, @"Got a response for record with ID %@, but we didn't try to put that record.", v425);
      objc_msgSend_setError_(v424, v119, (uint64_t)v118);
    }
    goto LABEL_132;
  }
  id v48 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v49 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v445 = v425;
    __int16 v446 = 2112;
    v447 = v17;
    _os_log_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_INFO, "Error when saving record %@ to the server: %@", buf, 0x16u);
  }
  id v52 = objc_msgSend_error(v17, v50, v51);
  id v55 = objc_msgSend_clientError(v52, v53, v54);
  int hasType = objc_msgSend_hasType(v55, v56, v57);

  if (!hasType) {
    goto LABEL_108;
  }
  uint64_t v61 = objc_msgSend_error(v17, v59, v60);
  uint64_t v64 = objc_msgSend_clientError(v61, v62, v63);
  BOOL v67 = objc_msgSend_type(v64, v65, v66) == 52;

  if (v67)
  {
    if (*v48 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    SEL v70 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v445 = v425;
      uint64_t v71 = "Record PCS etag failed for record %@";
LABEL_54:
      _os_log_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_INFO, v71, buf, 0xCu);
LABEL_55:
      v414 = 0;
      goto LABEL_56;
    }
    goto LABEL_58;
  }
  long long v120 = objc_msgSend_error(v17, v68, v69);
  long long v123 = objc_msgSend_clientError(v120, v121, v122);
  BOOL v126 = objc_msgSend_type(v123, v124, v125) == 53;

  if (!v126)
  {
    long long v194 = objc_msgSend_error(v17, v127, v128);
    long long v197 = objc_msgSend_clientError(v194, v195, v196);
    BOOL v200 = objc_msgSend_type(v197, v198, v199) == 15;

    long long v203 = objc_msgSend_error(v17, v201, v202);
    __int16 v206 = v203;
    if (v200)
    {
      long long v207 = objc_msgSend_errorDescription(v203, v204, v205);
      char hasPrefix = objc_msgSend_hasPrefix_(v207, v208, @"Record PCS oplock failed");

      if (hasPrefix)
      {
        int v212 = 1;
        v213 = @"Record";
      }
      else
      {
        v241 = objc_msgSend_error(v17, v210, v211);
        v244 = objc_msgSend_errorDescription(v241, v242, v243);
        char v246 = objc_msgSend_hasPrefix_(v244, v245, @"Zone PCS oplock failed");

        if (v246)
        {
          int v212 = 1;
          v213 = @"Zone";
        }
        else
        {
          v295 = objc_msgSend_error(v17, v247, v248);
          v298 = objc_msgSend_errorDescription(v295, v296, v297);
          int v212 = objc_msgSend_hasPrefix_(v298, v299, @"Share Etag Oplock failure");

          if (v212) {
            v213 = @"Share";
          }
          else {
            v213 = @"Unknown";
          }
        }
      }
      if (*v48 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v300 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v445 = v213;
        __int16 v446 = 2112;
        v447 = v425;
        _os_log_impl(&dword_1C4CFF000, v300, OS_LOG_TYPE_INFO, "%{public}@ oplock failed for record %@", buf, 0x16u);
      }
      if (v212) {
        goto LABEL_55;
      }
    }
    else
    {
      uint64_t v214 = objc_msgSend_clientError(v203, v204, v205);
      BOOL v217 = objc_msgSend_type(v214, v215, v216) == 48;

      if (!v217)
      {
        v249 = objc_msgSend_error(v17, v218, v219);
        v252 = objc_msgSend_clientError(v249, v250, v251);
        BOOL v255 = objc_msgSend_type(v252, v253, v254) == 62;

        if (!v255)
        {
          v398 = objc_msgSend_error(v17, v256, v257);
          v401 = objc_msgSend_clientError(v398, v399, v400);
          BOOL v404 = objc_msgSend_type(v401, v402, v403) == 64;

          if (!v404) {
            goto LABEL_108;
          }
          if (*v48 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v405 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C4CFF000, v405, OS_LOG_TYPE_INFO, "Record PCS chain was invalid", buf, 2u);
          }
        }
        v258 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v259 = sub_1C4E94D98(v17);
        v262 = objc_msgSend_recordID(v422, v260, v261);
        v265 = objc_msgSend_error(v17, v263, v264);
        v268 = objc_msgSend_errorDescription(v265, v266, v267);
        v414 = objc_msgSend_errorWithDomain_code_userInfo_format_(v258, v269, *MEMORY[0x1E4F19DD8], v259, 0, @"Error saving share %@ to server: \"%@\"", v262, v268);

LABEL_56:
        if (*v48 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        goto LABEL_59;
      }
      v220 = objc_msgSend_options(v421, v218, v219);
      if (((v425 != 0) & objc_msgSend_useAnonymousToServerShareParticipants(v220, v221, v222)) == 1)
      {
        BOOL v225 = objc_msgSend_databaseScope(self, v223, v224) == 3;

        if (v225)
        {
          if (*v48 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v228 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v410 = v228;
            objc_msgSend_zoneID(v425, v411, v412);
            v413 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v445 = v413;
            _os_log_debug_impl(&dword_1C4CFF000, v410, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", buf, 0xCu);
          }
          objc_initWeak((id *)buf, self);
          v231 = objc_msgSend_stateTransitionGroup(self, v229, v230);
          dispatch_group_enter(v231);

          v234 = objc_msgSend_anonymousSharingManager(v421, v232, v233);
          v237 = objc_msgSend_zoneID(v425, v235, v236);
          v443 = v237;
          v239 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v238, (uint64_t)&v443, 1);
          v440[0] = MEMORY[0x1E4F143A8];
          v440[1] = 3221225472;
          v440[2] = sub_1C4FAAC1C;
          v440[3] = &unk_1E64F22C0;
          objc_copyWeak(&v441, (id *)buf);
          objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v234, v240, (uint64_t)v239, self, v440);

          objc_destroyWeak(&v441);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
      }
      v270 = objc_msgSend_container(self, v226, v227);
      v273 = objc_msgSend_recordCache(v270, v271, v272);
      v276 = objc_msgSend_zoneID(v425, v274, v275);
      objc_msgSend_clearAllRecordsForZoneWithID_(v273, v277, (uint64_t)v276);

      if (objc_msgSend_databaseScope(self, v278, v279) != 1)
      {
        v280 = objc_msgSend_recordID(v422, v59, v60);
        v283 = objc_msgSend_zoneID(v280, v281, v282);
        objc_msgSend_setPCSData_forFetchedZoneID_(self, v284, 0, v283);

        v287 = objc_msgSend_pcsCache(v421, v285, v286);
        v290 = objc_msgSend_recordID(v422, v288, v289);
        v293 = objc_msgSend_zoneID(v290, v291, v292);
        objc_msgSend_removePCSDataForItemsInZoneWithID_(v287, v294, (uint64_t)v293);
      }
    }
LABEL_108:
    v301 = objc_msgSend_error(v17, v59, v60);
    if (objc_msgSend_hasExtensionError(v301, v302, v303))
    {
      v306 = objc_msgSend_error(v17, v304, v305);
      v309 = objc_msgSend_extensionError(v306, v307, v308);
      int hasTypeCode = objc_msgSend_hasTypeCode(v309, v310, v311);

      if (hasTypeCode)
      {
        v315 = (void *)MEMORY[0x1E4F1A280];
        v316 = objc_msgSend_request(self, v313, v314);
        v317 = sub_1C4E940D0(v316, v17);
        v319 = objc_msgSend_errorWithDomain_code_userInfo_format_(v315, v318, *MEMORY[0x1E4F19DD8], 6000, v317, @"Plugin-Specific Error");
        objc_msgSend_setError_(v424, v320, (uint64_t)v319);

        objc_msgSend_setState_(v424, v321, 12);
        goto LABEL_132;
      }
    }
    else
    {
    }
    v322 = objc_msgSend_request(self, v313, v314);
    v323 = sub_1C4E940D0(v322, v17);
    v326 = objc_msgSend_mutableCopy(v323, v324, v325);

    v329 = objc_msgSend_error(v17, v327, v328);
    v332 = objc_msgSend_clientError(v329, v330, v331);
    v335 = objc_msgSend_moveOplockFailure(v332, v333, v334);
    LODWORD(v323) = objc_msgSend_hasMovedRecordDestinationIdentifier(v335, v336, v337);

    if (v323)
    {
      v340 = objc_msgSend_translator(self, v338, v339);
      v343 = objc_msgSend_error(v17, v341, v342);
      v346 = objc_msgSend_clientError(v343, v344, v345);
      v349 = objc_msgSend_moveOplockFailure(v346, v347, v348);
      v352 = objc_msgSend_movedRecordDestinationIdentifier(v349, v350, v351);
      v354 = objc_msgSend_recordIDFromPRecordIdentifier_error_(v340, v353, (uint64_t)v352, 0);

      if (v354) {
        objc_msgSend_setObject_forKeyedSubscript_(v326, v355, (uint64_t)v354, *MEMORY[0x1E4F19D40]);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1C4FAAD30;
    aBlock[3] = &unk_1E64F08D0;
    id v435 = v424;
    v356 = _Block_copy(aBlock);
    v359 = objc_msgSend_error(v17, v357, v358);
    v362 = objc_msgSend_clientError(v359, v360, v361);
    int hasOplockFailure = objc_msgSend_hasOplockFailure(v362, v363, v364);

    if (hasOplockFailure)
    {
      id v366 = v416;
      id v367 = v422;
      v419 = objc_msgSend_copyWithOriginalValues(v367, v368, v369);
      if (v419) {
        objc_msgSend_setObject_forKeyedSubscript_(v326, v370, (uint64_t)v419, *MEMORY[0x1E4F19D00]);
      }
      if (v366)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v326, v370, (uint64_t)v366, *MEMORY[0x1E4F19D10]);
        v374 = objc_msgSend_recordChangeTag(v366, v372, v373);
        objc_msgSend_setObject_forKeyedSubscript_(v326, v375, (uint64_t)v374, *MEMORY[0x1E4F19C70]);
      }
      if (v367)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v326, v370, (uint64_t)v367, *MEMORY[0x1E4F19D08]);
        v378 = objc_msgSend_recordChangeTag(v367, v376, v377);
        objc_msgSend_setObject_forKeyedSubscript_(v326, v379, (uint64_t)v378, *MEMORY[0x1E4F19C28]);
      }
      if (objc_msgSend_hasPropertiesRequiringEncryption(v366, v370, v371))
      {
        v382 = objc_msgSend_stateTransitionGroup(val, v380, v381);
        dispatch_group_enter(v382);

        if (*v48 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v383 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v406 = v383;
          objc_msgSend_recordID(v366, v407, v408);
          v409 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v445 = v409;
          _os_log_debug_impl(&dword_1C4CFF000, v406, OS_LOG_TYPE_DEBUG, "Decrypting server record returned by oplock failure %@", buf, 0xCu);
        }
        v386 = objc_msgSend_recordDecryptOperation(val, v384, v385);
        v427[0] = MEMORY[0x1E4F143A8];
        v427[1] = 3221225472;
        v427[2] = sub_1C4FAADA0;
        v427[3] = &unk_1E64F4500;
        id v428 = v366;
        id v429 = v326;
        v430 = v17;
        v431 = v425;
        v432 = val;
        id v433 = v356;
        id v387 = v366;
        objc_msgSend_decryptRecord_withCompletion_(v386, v388, (uint64_t)v387, v427);

        goto LABEL_131;
      }
    }
    v389 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v390 = sub_1C4E94D98(v17);
    v393 = objc_msgSend_error(v17, v391, v392);
    v396 = objc_msgSend_errorDescription(v393, v394, v395);
    objc_msgSend_errorWithDomain_code_userInfo_format_(v389, v397, *MEMORY[0x1E4F19DD8], v390, v326, @"Error saving record %@ to server: %@", v425, v396);
    id v367 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void *, id))v356 + 2))(v356, v367);
LABEL_131:

    goto LABEL_132;
  }
  if (*v48 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  SEL v70 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v445 = v425;
    uint64_t v71 = "Zone PCS etag failed for record %@";
    goto LABEL_54;
  }
LABEL_58:
  v414 = 0;
LABEL_59:
  uint64_t v129 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v445 = v425;
    _os_log_impl(&dword_1C4CFF000, v129, OS_LOG_TYPE_INFO, "Handling error for record %@ as an oplock failure", buf, 0xCu);
  }
  if (objc_msgSend_retryPCSFailures(self, v130, v131))
  {
    objc_msgSend_clearProtectionDataForRecord(v424, v132, v133);
    long long v136 = objc_msgSend_recordID(v422, v134, v135);
    long long v139 = objc_msgSend_zoneID(v136, v137, v138);

    if (v139)
    {
      long long v438 = 0u;
      long long v439 = 0u;
      long long v437 = 0u;
      long long v436 = 0u;
      uint64_t v142 = objc_msgSend_modifyHandlersByZoneID(self, v140, v141);
      long long v145 = objc_msgSend_recordID(v422, v143, v144);
      long long v148 = objc_msgSend_zoneID(v145, v146, v147);
      uint64_t v150 = objc_msgSend_objectForKeyedSubscript_(v142, v149, (uint64_t)v148);

      uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v150, v151, (uint64_t)&v436, v442, 16);
      if (v152)
      {
        uint64_t v153 = *(void *)v437;
        do
        {
          uint64_t v154 = 0;
          do
          {
            if (*(void *)v437 != v153) {
              objc_enumerationMutation(v150);
            }
            uint64_t v155 = *(void **)(*((void *)&v436 + 1) + 8 * v154);
            if (*v48 != -1) {
              dispatch_once(v48, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v156 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              v181 = v156;
              uint64_t v184 = objc_msgSend_record(v155, v182, v183);
              objc_msgSend_recordID(v184, v185, v186);
              v187 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v445 = v187;
              _os_log_debug_impl(&dword_1C4CFF000, v181, OS_LOG_TYPE_DEBUG, "Clearing zone PCS tag for record %@", buf, 0xCu);
            }
            uint64_t v159 = objc_msgSend_record(v155, v157, v158);
            objc_msgSend_setZoneProtectionEtag_(v159, v160, 0);

            uint64_t v163 = objc_msgSend_record(v155, v161, v162);
            objc_msgSend_setShareEtag_(v163, v164, 0);

            uint64_t v167 = objc_msgSend_error(v17, v165, v166);
            uint64_t v170 = objc_msgSend_clientError(v167, v168, v169);
            BOOL v173 = objc_msgSend_type(v170, v171, v172) == 52;

            if (!v173)
            {
              uint64_t v176 = objc_msgSend_record(v155, v174, v175);
              uint64_t v179 = objc_msgSend_recordID(v176, v177, v178);
              objc_msgSend_setPCSData_forFetchedRecordID_(val, v180, 0, v179);
            }
            ++v154;
          }
          while (v152 != v154);
          uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v150, v174, (uint64_t)&v436, v442, 16);
        }
        while (v152);
      }
    }
    objc_msgSend_setState_(v424, v140, 13);
  }
  else
  {
    objc_msgSend_setState_(v424, v132, 12);
  }
  if (v414)
  {
    objc_msgSend_setError_(v424, v188, (uint64_t)v414);
  }
  else
  {
    id v189 = (void *)MEMORY[0x1E4F1A280];
    id v190 = objc_msgSend_recordID(v422, v188, 0);
    long long v192 = objc_msgSend_errorWithDomain_code_userInfo_format_(v189, v191, *MEMORY[0x1E4F19DD8], 2037, 0, @"Error saving record %@ to server: Protection data didn't match", v190);
    objc_msgSend_setError_(v424, v193, (uint64_t)v192);
  }
LABEL_132:
}

- (void)_handleRecordDeleted:(id)a3 handler:(id)a4 responseCode:(id)a5
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v13 = objc_msgSend_code(v10, v11, v12);
  uint64_t v14 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  id v15 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v16 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v17 = *MEMORY[0x1E4F1A550];
  id v18 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (v13 == 1)
  {
    if (v17 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v15);
    }
    uint64_t v19 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v86 = v8;
      _os_log_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_INFO, "Record %@ was successfully deleted from the server", buf, 0xCu);
    }
    id v22 = objc_msgSend_container(self, v20, v21);
    id v25 = objc_msgSend_options(v22, v23, v24);
    if (objc_msgSend_useAnonymousToServerShareParticipants(v25, v26, v27)
      && objc_msgSend_databaseScope(self, v28, v29) == 3)
    {
      uint64_t v32 = objc_msgSend_recordName(v8, v30, v31);
      int isEqualToString = objc_msgSend_isEqualToString_(v32, v33, *MEMORY[0x1E4F19D48]);

      if (isEqualToString)
      {
        if (*v16 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v14);
        }
        __int16 v35 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v8;
          _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Possible anonymous share deleted. Removing share from anonymous share list: %@", buf, 0xCu);
        }
        objc_initWeak((id *)buf, self);
        uint64_t v38 = objc_msgSend_stateTransitionGroup(self, v36, v37);
        dispatch_group_enter(v38);

        uint64_t v41 = objc_msgSend_container(self, v39, v40);
        uint64_t v44 = objc_msgSend_anonymousSharingManager(v41, v42, v43);
        id v47 = objc_msgSend_zoneID(v8, v45, v46);
        v89[0] = v47;
        id v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)v89, 1);
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = sub_1C4FAB570;
        v83[3] = &unk_1E64F22C0;
        objc_copyWeak(&v84, (id *)buf);
        objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v44, v50, (uint64_t)v49, self, v83);

        objc_destroyWeak(&v84);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
    }
    objc_msgSend_setState_(v9, v34, 8);
    uint64_t v72 = objc_msgSend_container(self, v70, v71);
    long long v75 = objc_msgSend_recordCache(v72, v73, v74);
    uint64_t v78 = objc_msgSend_databaseScope(self, v76, v77);
    objc_msgSend_deleteRecordWithID_scope_(v75, v79, (uint64_t)v8, v78);

    objc_msgSend_setPCSData_forFetchedRecordID_(self, v80, 0, v8);
    objc_msgSend_setPCSData_forFetchedShareID_(self, v81, 0, v8);
  }
  else
  {
    if (v17 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v15);
    }
    uint64_t v51 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v86 = v10;
      __int16 v87 = 2112;
      id v88 = v8;
      _os_log_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_INFO, "Error %@ when deleting record %@ from the server", buf, 0x16u);
    }
    id v52 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v53 = sub_1C4E94D98(v10);
    id v56 = objc_msgSend_request(self, v54, v55);
    uint64_t v57 = sub_1C4E940D0(v56, v10);
    uint64_t v60 = objc_msgSend_error(v10, v58, v59);
    uint64_t v63 = objc_msgSend_errorDescription(v60, v61, v62);
    uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_format_(v52, v64, *MEMORY[0x1E4F19DD8], v53, v57, @"Error deleting record %@: %@", v8, v63);

    objc_msgSend_setError_(v9, v66, (uint64_t)v65);
    if (objc_msgSend_code(v65, v67, v68) == 2024) {
      objc_msgSend_setState_(v9, v69, 11);
    }
    else {
      objc_msgSend_setState_(v9, v69, 12);
    }
  }
}

- (void)_handleMergeableDeltaSavedForRecordID:(id)a3 key:(id)a4 result:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v13 = objc_msgSend_handlersByRecordID(self, v11, v12);
  id v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v8);

  id v20 = objc_msgSend_record(v15, v16, v17);
  if (v20)
  {
    if (objc_msgSend_code(v10, v18, v19) != 1)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      BOOL v67 = v20;
      uint64_t v31 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v72 = v9;
        __int16 v73 = 2112;
        id v74 = v8;
        __int16 v75 = 2112;
        id v76 = v10;
        _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "Error syncing mergeable delta for key %@ on record %@: %@", buf, 0x20u);
      }
      uint64_t v32 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v33 = *MEMORY[0x1E4F19DD8];
      uint64_t v34 = sub_1C4E94D98(v10);
      uint64_t v37 = objc_msgSend_request(self, v35, v36);
      uint64_t v38 = sub_1C4E940D0(v37, v10);
      id v68 = v10;
      objc_msgSend_error(v10, v39, v40);
      int v42 = v41 = v8;
      id v45 = objc_msgSend_errorDescription(v42, v43, v44);
      id v69 = v9;
      SEL v70 = v41;
      uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_format_(v32, v46, v33, v34, v38, @"Error saving mergeable delta for key '%@' on record %@: %@", v9, v41, v45);

      if (objc_msgSend_code(v24, v47, v48) == 2024)
      {
        id v8 = v70;
        id v20 = v67;
        id v10 = v68;
        objc_msgSend_setState_(v15, v49, 11);
      }
      else
      {
        uint64_t v51 = objc_msgSend_error(v15, v49, v50);
        id v20 = v67;
        if (v51
          && (uint64_t v54 = (void *)v51,
              objc_msgSend_error(v15, v52, v53),
              uint64_t v55 = objc_claimAutoreleasedReturnValue(),
              uint64_t v58 = objc_msgSend_code(v55, v56, v57),
              v55,
              v54,
              v58 != 2024))
        {
          id v10 = v68;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v64 = *MEMORY[0x1E4F1A500];
          id v9 = v69;
          id v8 = v70;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "Not overwriting existing error for modify records handler", buf, 2u);
          }
          objc_msgSend_setState_(v15, v65, 12);
        }
        else
        {
          objc_msgSend_setError_(v15, v52, (uint64_t)v24);
          id v9 = v69;
          id v8 = v70;
          id v10 = v68;
          objc_msgSend_setState_(v15, v59, 12);
        }
      }
      goto LABEL_32;
    }
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)v9);
    if (v24
      || (objc_msgSend_encryptedValues(v20, v22, v23),
          id v25 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v9),
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v25,
          v24))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      BOOL v28 = (void *)*MEMORY[0x1E4F1A548];
      if (isKindOfClass)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v28);
        }
        uint64_t v29 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v72 = v9;
          __int16 v73 = 2112;
          id v74 = v8;
          _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "Finished saving mergeable delta for key %@ on record %@", buf, 0x16u);
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v28);
        }
        uint64_t v60 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v61 = v60;
          uint64_t v62 = (objc_class *)objc_opt_class();
          uint64_t v63 = NSStringFromClass(v62);
          *(_DWORD *)buf = 138412546;
          id v72 = v9;
          __int16 v73 = 2112;
          id v74 = v63;
          _os_log_error_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_ERROR, "Value in record for key '%@' is not a mergeable record value: %@", buf, 0x16u);
        }
      }
LABEL_32:

      goto LABEL_33;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v66 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, "No value on record after successful mergeable delta save", buf, 2u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    int v30 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v72 = v9;
      __int16 v73 = 2112;
      id v74 = v8;
      _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "No record on modify handler for mergeable delta save for key %@ on record %@", buf, 0x16u);
    }
  }
LABEL_33:
}

- (void)_handleReplaceDeltasRequest:(id)a3 result:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_handlersByRecordID(self, v8, v9);
  int v13 = objc_msgSend_valueID(v6, v11, v12);
  uint64_t v16 = objc_msgSend_recordID(v13, v14, v15);
  id v18 = objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);

  uint64_t v23 = objc_msgSend_record(v18, v19, v20);
  if (v23)
  {
    if (objc_msgSend_code(v7, v21, v22) == 1)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v24 = (void *)*MEMORY[0x1E4F1A510];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
      {
        id v25 = v24;
        BOOL v28 = objc_msgSend_operationID(self, v26, v27);
        *(_DWORD *)buf = 138543618;
        id v69 = v28;
        __int16 v70 = 2112;
        id v71 = v6;
        _os_log_debug_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_DEBUG, "Modify operation %{public}@ successfully replaced deltas for request: %@", buf, 0x16u);
LABEL_11:
      }
    }
    else
    {
      id v67 = v6;
      uint64_t v41 = sub_1C4E94D98(v7);
      uint64_t v44 = objc_msgSend_request(self, v42, v43);
      uint64_t v45 = sub_1C4E940D0(v44, v7);

      uint64_t v46 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v47 = *MEMORY[0x1E4F19DD8];
      uint64_t v50 = objc_msgSend_error(v7, v48, v49);
      uint64_t v53 = objc_msgSend_errorDescription(v50, v51, v52);
      uint64_t v54 = v47;
      uint64_t v55 = (void *)v45;
      uint64_t v57 = objc_msgSend_errorWithDomain_code_userInfo_format_(v46, v56, v54, v41, v45, @"Error replacing mergeable deltas: %@", v53);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v58 = (void *)*MEMORY[0x1E4F1A510];
      id v6 = v67;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
      {
        uint64_t v63 = v58;
        uint64_t v66 = objc_msgSend_operationID(self, v64, v65);
        *(_DWORD *)buf = 138543618;
        id v69 = v66;
        __int16 v70 = 2112;
        id v71 = v57;
        _os_log_error_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_ERROR, "Modify operation %{public}@ failed to replace deltas with error: %@", buf, 0x16u);
      }
      if (objc_msgSend_code(v57, v59, v60) == 2024)
      {
        objc_msgSend_setState_(v18, v61, 11);
      }
      else
      {
        objc_msgSend_setError_(v18, v61, (uint64_t)v57);
        objc_msgSend_setState_(v18, v62, 12);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v29 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      BOOL v28 = v29;
      id v25 = objc_msgSend_valueID(v6, v30, v31);
      uint64_t v34 = objc_msgSend_key(v25, v32, v33);
      uint64_t v37 = objc_msgSend_valueID(v6, v35, v36);
      uint64_t v40 = objc_msgSend_recordID(v37, v38, v39);
      *(_DWORD *)buf = 138412546;
      id v69 = v34;
      __int16 v70 = 2112;
      id v71 = v40;
      _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_INFO, "No record on modify handler for mergeable delta replacement for key %@ on record %@", buf, 0x16u);

      goto LABEL_11;
    }
  }
}

- (id)_createModifyRequestWithRecordsToSave:(id)a3 recordsToDelete:(id)a4 recordsToDeleteToEtags:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 handlersByRecordID:(id)a7 sendMergeableDeltas:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v58 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v20 = objc_msgSend_savePolicy(self, v18, v19);
  uint64_t v57 = v17;
  if (v20 == 2)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 1;
  }
  else if (v20 == 1)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v21 = 1;
  }
  objc_initWeak(location, self);
  uint64_t v24 = objc_msgSend_requestedFieldsByRecordIDForRecords_(self, v23, (uint64_t)v14);
  id v25 = [CKDModifyRecordsURLRequest alloc];
  BOOL v28 = objc_msgSend_clientChangeTokenData(self, v26, v27);
  int v30 = objc_msgSend_initWithOperation_recordsToSave_recordIDsToDelete_recordIDsToDeleteToSigningPCSIdentity_oplock_sendAllFields_clientChangeTokenData_requestedFieldsByRecordId_(v25, v29, (uint64_t)self, v14, v58, v16, v21, v22, v28, v24);

  uint64_t v33 = objc_msgSend_atomic(self, v31, v32);
  objc_msgSend_setAtomic_(v30, v34, v33);
  uint64_t v37 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v35, v36);
  objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(v30, v38, v37);
  uint64_t v41 = objc_msgSend_userPublicKeys(self, v39, v40);
  objc_msgSend_setUserPublicKeys_(v30, v42, (uint64_t)v41);

  objc_msgSend_setSendMergeableDeltas_(v30, v43, v8);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = sub_1C4FAC3E8;
  v63[3] = &unk_1E64F7CC8;
  objc_copyWeak(&v64, location);
  objc_msgSend_setRecordPostedBlock_(v30, v44, (uint64_t)v63);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = sub_1C4FAC54C;
  v61[3] = &unk_1E64F7CF0;
  objc_copyWeak(&v62, location);
  objc_msgSend_setMergeableDeltaSavedBlock_(v30, v45, (uint64_t)v61);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = sub_1C4FAC5D8;
  v59[3] = &unk_1E64F3548;
  objc_copyWeak(&v60, location);
  objc_msgSend_setReplacedDeltasBlock_(v30, v46, (uint64_t)v59);
  objc_msgSend_setRecordIDsToDeleteToEtags_(v30, v47, (uint64_t)v15);
  uint64_t v50 = objc_msgSend_conflictLosersToResolveByRecordID(self, v48, v49);
  objc_msgSend_setConflictLosersToResolveByRecordID_(v30, v51, (uint64_t)v50);

  uint64_t v54 = objc_msgSend_pluginFieldsForRecordDeletesByID(self, v52, v53);
  objc_msgSend_setPluginFieldsForRecordDeletesByID_(v30, v55, (uint64_t)v54);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&v64);

  objc_destroyWeak(location);
  return v30;
}

- (id)requestedFieldsByRecordIDForRecords:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v24, v28, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    id v8 = 0;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend_allKeys(v11, v5, v6);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = sub_1C4FAC824;
        v23[3] = &unk_1E64F7D18;
        v23[4] = v11;
        id v14 = objc_msgSend_CKFilter_(v12, v13, (uint64_t)v23);

        if (objc_msgSend_count(v14, v15, v16))
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          uint64_t v19 = objc_msgSend_recordID(v11, v17, v18);
          objc_msgSend_setObject_forKeyedSubscript_(v8, v20, (uint64_t)v14, v19);
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v24, v28, 16);
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_reportRecordsInFlight
{
  objc_msgSend_recordsToSave(self, a2, v2);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v22, v4, v5))
  {
    id v8 = objc_msgSend_recordsInFlightBlock(self, v6, v7);

    if (v8)
    {
      objc_msgSend_setShouldReportRecordsInFlight_(self, v9, 0);
      uint64_t v12 = objc_msgSend_recordsToSave(self, v10, v11);
      id v14 = objc_msgSend_valueForKeyPath_(v12, v13, @"recordID");

      id v17 = objc_msgSend_stateTransitionGroup(self, v15, v16);
      dispatch_group_enter(v17);

      uint64_t v20 = objc_msgSend_callbackQueue(self, v18, v19);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4FACA2C;
      block[3] = &unk_1E64F0948;
      block[4] = self;
      id v24 = v14;
      id v21 = v14;
      dispatch_async(v20, block);
    }
  }
  else
  {
  }
}

- (void)_continueRecordsModify
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_shouldOnlySaveAssetContent(self, a2, v2))
  {
    long long v145 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v145, v146, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 2647, @"We shouldn't get into this state if shouldOnlySaveAssetContent is true");
  }
  if ((objc_msgSend_shouldModifyRecordsInDatabase(self, v4, v5) & 1) == 0)
  {
    uint64_t v147 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v147, v148, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 2648, @"We shouldn't get into this state if shouldModifyRecordsInDatabase is false");
  }
  id v8 = objc_msgSend_container(self, v6, v7);

  if (!v8)
  {
    long long v149 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v149, v150, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 2649, @"Expected non-nil container");
  }
  if (!objc_msgSend_haveOutstandingHandlers(self, v9, v10))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v70 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_DEBUG, "Not sending a modify request to the server", buf, 2u);
    }
    return;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v14 = objc_msgSend_recordsToSave(self, v12, v13);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);
  uint64_t v154 = objc_msgSend_initWithCapacity_(v11, v18, v17);

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v21 = objc_msgSend_recordsToSave(self, v19, v20);
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v157, v163, 16);
  if (!v25)
  {

    goto LABEL_46;
  }
  uint64_t v26 = *(void *)v158;
  char v27 = 1;
  do
  {
    uint64_t v28 = 0;
    do
    {
      if (*(void *)v158 != v26) {
        objc_enumerationMutation(v21);
      }
      uint64_t v29 = *(void **)(*((void *)&v157 + 1) + 8 * v28);
      int v30 = objc_msgSend_handlersByRecordID(self, v23, v24);
      uint64_t v33 = objc_msgSend_recordID(v29, v31, v32);
      __int16 v35 = objc_msgSend_objectForKeyedSubscript_(v30, v34, (uint64_t)v33);

      if (objc_msgSend_state(v35, v36, v37) == 6)
      {
        if (!objc_msgSend_canSkipRecordSaveForMergeables(v29, v38, v39)) {
          goto LABEL_17;
        }
        if (objc_msgSend_containsMergeableValuesWithDeltasToSave(v29, v40, v41))
        {
          if (objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, v42, v43))
          {
LABEL_17:
            objc_msgSend_addObject_(v154, v40, (uint64_t)v29);
            int v46 = objc_msgSend_saveAttempts(v35, v44, v45);
            objc_msgSend_setSaveAttempts_(v35, v47, (v46 + 1));
            goto LABEL_23;
          }
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v51 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            uint64_t v61 = v51;
            id v64 = objc_msgSend_recordID(v29, v62, v63);
            *(_DWORD *)buf = 138412290;
            v162[0] = v64;
            _os_log_debug_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_DEBUG, "Skipping record upload for purely mergeable record: %@", buf, 0xCu);
          }
          objc_msgSend_setState_(v35, v52, 7);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v49 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            uint64_t v57 = v49;
            id v60 = objc_msgSend_recordID(v29, v58, v59);
            *(_DWORD *)buf = 138412290;
            v162[0] = v60;
            _os_log_debug_impl(&dword_1C4CFF000, v57, OS_LOG_TYPE_DEBUG, "Skipping record save for purely mergeable record without any deltas to save: %@", buf, 0xCu);
          }
          objc_msgSend_setState_(v35, v50, 8);
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v48 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v53 = v48;
          id v56 = objc_msgSend_recordID(v35, v54, v55);
          *(_DWORD *)buf = 138412290;
          v162[0] = v56;
          _os_log_debug_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_DEBUG, "Record %@ isn't ready, so we're going to skip the record upload phase.", buf, 0xCu);
        }
        char v27 = 0;
      }
LABEL_23:

      ++v28;
    }
    while (v25 != v28);
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v157, v163, 16);
    uint64_t v25 = v65;
  }
  while (v65);

  if ((v27 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v68 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v69 = "Some records failed to prepare for this save. Skipping save to the server and retrying if possible";
      goto LABEL_64;
    }
    goto LABEL_58;
  }
LABEL_46:
  if (!objc_msgSend_count(v154, v66, v67)
    && (objc_msgSend_recordIDsToDelete(self, v71, v72),
        __int16 v73 = objc_claimAutoreleasedReturnValue(),
        BOOL v76 = objc_msgSend_count(v73, v74, v75) == 0,
        v73,
        v76))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v68 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v69 = "No records to save or delete. Skipping sending a request to the server.";
LABEL_64:
      _os_log_debug_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_DEBUG, v69, buf, 2u);
    }
  }
  else
  {
    uint64_t v77 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v78 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v79 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v131 = v79;
      int v134 = objc_msgSend_count(v154, v132, v133);
      uint64_t v137 = objc_msgSend_clientChangeTokenData(self, v135, v136);
      *(_DWORD *)buf = 67109378;
      LODWORD(v162[0]) = v134;
      WORD2(v162[0]) = 2112;
      *(void *)((char *)v162 + 6) = v137;
      _os_log_debug_impl(&dword_1C4CFF000, v131, OS_LOG_TYPE_DEBUG, "Saving %d records to the server with change token %@", buf, 0x12u);

      if (*v77 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
    }
    os_log_t v80 = *v78;
    if (os_log_type_enabled(*v78, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v138 = v80;
      uint64_t v141 = objc_msgSend_recordIDsToDelete(self, v139, v140);
      int v144 = objc_msgSend_count(v141, v142, v143);
      *(_DWORD *)buf = 67109120;
      LODWORD(v162[0]) = v144;
      _os_log_debug_impl(&dword_1C4CFF000, v138, OS_LOG_TYPE_DEBUG, "Deleting %d records from the server.", buf, 8u);
    }
    __int16 v83 = objc_msgSend_recordIDsToDelete(self, v81, v82);
    id v86 = objc_msgSend_recordIDsToDeleteToEtags(self, v84, v85);
    uint64_t v89 = objc_msgSend_recordIDsToDeleteToSigningPCSIdentity(self, v87, v88);
    int v92 = objc_msgSend_handlersByRecordID(self, v90, v91);
    uint64_t v95 = objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, v93, v94);
    uint64_t v97 = objc_msgSend__createModifyRequestWithRecordsToSave_recordsToDelete_recordsToDeleteToEtags_recordIDsToDeleteToSigningPCSIdentity_handlersByRecordID_sendMergeableDeltas_(self, v96, (uint64_t)v154, v83, v86, v89, v92, v95);

    if (*MEMORY[0x1E4F1A4E0])
    {
      uint64_t v100 = objc_msgSend_unitTestOverrides(self, v98, v99);
      uint64_t v102 = objc_msgSend_objectForKeyedSubscript_(v100, v101, @"ModifyRecordsAlwaysUsesHTTPS");
      BOOL v103 = v102 == 0;

      if (!v103)
      {
        long long v106 = objc_msgSend_url(v97, v104, v105);
        long long v109 = objc_msgSend_absoluteString(v106, v107, v108);
        char hasPrefix = objc_msgSend_hasPrefix_(v109, v110, @"https");

        if ((hasPrefix & 1) == 0)
        {
          long long v151 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v112, v113);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v151, v152, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 2692, @"CKDModifyRecordsOperation must use https in its request URL.");
        }
      }
    }
    objc_initWeak((id *)buf, v97);
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = sub_1C4FAD634;
    v155[3] = &unk_1E64F0A08;
    v155[4] = self;
    objc_copyWeak(&v156, (id *)buf);
    objc_msgSend_setCompletionBlock_(v97, v114, (uint64_t)v155);
    long long v117 = objc_msgSend_stateTransitionGroup(self, v115, v116);
    dispatch_group_enter(v117);

    objc_msgSend_setRequest_(self, v118, (uint64_t)v97);
    long long v121 = objc_msgSend_requestOptions(v97, v119, v120);
    objc_msgSend_setStreamingAssetRequestOptions_(self, v122, (uint64_t)v121);

    objc_msgSend_setRecordsToSave_(self, v123, 0);
    objc_msgSend_setRecordIDsToDelete_(self, v124, 0);
    objc_msgSend_setRecordIDsToDeleteToEtags_(self, v125, 0);
    objc_msgSend_setRecordIDsToDeleteToSigningPCSIdentity_(self, v126, 0);
    uint64_t v129 = objc_msgSend_container(self, v127, v128);
    objc_msgSend_performRequest_(v129, v130, (uint64_t)v97);

    objc_destroyWeak(&v156);
    objc_destroyWeak((id *)buf);
  }
LABEL_58:
}

- (void)_uploadMergeableDeltas
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, a2, v2))
  {
    uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5);
    uint64_t v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9);
    uint64_t v13 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_1C4FADAD0;
    v40[3] = &unk_1E64F7D40;
    id v14 = v7;
    id v41 = v14;
    id v15 = v13;
    id v42 = v15;
    id v16 = v10;
    id v43 = v16;
    objc_msgSend__enumerateHandlersInState_withBlock_(self, v17, 7, v40);
    if (objc_msgSend_count(v14, v18, v19) || objc_msgSend_count(v16, v20, v21))
    {
      id v22 = objc_msgSend_CKMap_(v14, v20, (uint64_t)&unk_1F20446B0);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v23 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = v23;
        uint64_t v36 = objc_msgSend_operationID(self, v34, v35);
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v36;
        __int16 v46 = 2112;
        uint64_t v47 = v22;
        _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "Uploading mergeable deltas for operation %{public}@: %@", buf, 0x16u);
      }
      id v24 = objc_alloc_init(MEMORY[0x1E4F1A478]);
      objc_msgSend_setDeltas_(v24, v25, (uint64_t)v14);
      objc_msgSend_setReplacementRequests_(v24, v26, (uint64_t)v16);
      uint64_t v27 = objc_opt_class();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1C4FADE28;
      v37[3] = &unk_1E64F0260;
      id v38 = v15;
      uint64_t v39 = self;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v28, v27, v24, v37);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v29 = (void *)*MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      id v22 = v29;
      uint64_t v32 = objc_msgSend_operationID(self, v30, v31);
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v32;
      _os_log_debug_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_DEBUG, "No mergeable deltas or replacements for operation %{public}@", buf, 0xCu);
    }
LABEL_14:

    return;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_DEBUG, "Not uploading mergeable deltas separately", buf, 2u);
  }
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  objc_msgSend__clearProtectionDataIfNotEntitled(self, v4, v5);
  uint64_t v9 = objc_msgSend_haveOutstandingHandlers(self, v6, v7) ^ 1;
  objc_msgSend_makeStateTransition_(self, v8, v9);
}

- (void)_clearProtectionDataIfNotEntitled
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  objc_msgSend_container(self, a2, v2);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_entitlements(v33, v4, v5);
  if (objc_msgSend_hasProtectionDataEntitlement(v6, v7, v8))
  {
  }
  else
  {
    char v11 = objc_msgSend_trustProtectionData(self, v9, v10);

    if ((v11 & 1) == 0)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v14 = objc_msgSend_handlersByRecordID(self, v12, v13);
      uint64_t v17 = objc_msgSend_allValues(v14, v15, v16);

      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v34, v38, 16);
      if (v19)
      {
        uint64_t v22 = v19;
        uint64_t v23 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v17);
            }
            uint64_t v25 = objc_msgSend_record(*(void **)(*((void *)&v34 + 1) + 8 * i), v20, v21);
            objc_msgSend_setProtectionData_(v25, v26, 0);
            objc_msgSend_setProtectionEtag_(v25, v27, 0);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v28 = v25;
              objc_msgSend_setInvitedProtectionData_(v28, v29, 0);
              objc_msgSend_setInvitedProtectionEtag_(v28, v30, 0);
              objc_msgSend_setPublicProtectionData_(v28, v31, 0);
              objc_msgSend_setPublicProtectionEtag_(v28, v32, 0);
            }
          }
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v34, v38, 16);
        }
        while (v22);
      }
    }
  }
}

- (void)finishWithError:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_finishDecryption(self, v5, v6);
  if (!v4 && (objc_msgSend_isCancelled(self, v7, v8) & 1) == 0)
  {
    uint64_t v9 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v10 = (os_log_t *)MEMORY[0x1E4F1A500];
    char v11 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      long long v35 = v11;
      id v38 = objc_msgSend_operationID(self, v36, v37);
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v38;
      _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Ensuring all handlers have completed for operation %{public}@", buf, 0xCu);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v14 = objc_msgSend_modifyHandlersByZoneID(self, v12, v13);
    uint64_t v17 = objc_msgSend_allValues(v14, v15, v16);

    obuint64_t j = v17;
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v48, v53, 16);
    if (v41)
    {
      uint64_t v40 = *(void *)v49;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = v19;
          uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * v19);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v21 = v20;
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v44, v52, 16);
          if (v23)
          {
            uint64_t v26 = v23;
            uint64_t v27 = *(void *)v45;
            do
            {
              uint64_t v28 = 0;
              do
              {
                if (*(void *)v45 != v27) {
                  objc_enumerationMutation(v21);
                }
                if (objc_msgSend_state(*(void **)(*((void *)&v44 + 1) + 8 * v28), v24, v25) != 14)
                {
                  if (*v9 != -1) {
                    dispatch_once(v9, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  os_log_t v29 = *v10;
                  if (os_log_type_enabled(*v10, OS_LOG_TYPE_FAULT))
                  {
                    int v30 = v29;
                    id v33 = objc_msgSend_operationID(self, v31, v32);
                    *(_DWORD *)buf = 138543362;
                    uint64_t v55 = v33;
                    _os_log_fault_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_FAULT, "Operation %{public}@ tried to finish without an error but it has outstanding handlers", buf, 0xCu);
                  }
                }
                ++v28;
              }
              while (v26 != v28);
              uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v44, v52, 16);
            }
            while (v26);
          }

          uint64_t v19 = v42 + 1;
        }
        while (v42 + 1 != v41);
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v48, v53, 16);
      }
      while (v41);
    }

    id v4 = 0;
  }
  v43.receiver = self;
  v43.super_class = (Class)CKDModifyRecordsOperation;
  [(CKDOperation *)&v43 finishWithError:v4];
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  uint64_t v9 = objc_msgSend_modifyHandlersByZoneID(self, v7, v8);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v10, (uint64_t)&unk_1F20446D0);

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = objc_msgSend_modifyHandlersByZoneID(self, v12, v13);
  uint64_t v17 = objc_msgSend_allKeys(v14, v15, v16);

  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v34, v38, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v35;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend_addObject_(v11, v20, *(void *)(*((void *)&v34 + 1) + 8 * v23++));
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v34, v38, 16);
    }
    while (v21);
  }

  if (objc_msgSend_count(v11, v24, v25))
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1C4FAF128;
    v32[3] = &unk_1E64F1D18;
    id v33 = v11;
    objc_msgSend_updateCloudKitMetrics_(self, v27, (uint64_t)v32);
  }
  objc_msgSend_setSaveProgressBlock_(self, v26, 0);
  objc_msgSend_setSaveCompletionBlock_(self, v28, 0);
  objc_msgSend_setDeleteCompletionBlock_(self, v29, 0);
  objc_msgSend_setUploadCompletionBlock_(self, v30, 0);
  v31.receiver = self;
  v31.super_class = (Class)CKDModifyRecordsOperation;
  [(CKDOperation *)&v31 _finishOnCallbackQueueWithError:v4];
}

- (id)analyticsPayload
{
  v37.receiver = self;
  v37.super_class = (Class)CKDModifyRecordsOperation;
  id v3 = [(CKDDatabaseOperation *)&v37 analyticsPayload];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v7 = objc_msgSend_recordsToSave(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);
  uint64_t v12 = objc_msgSend_numberWithUnsignedInteger_(v4, v11, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, 0x1F20585B0);

  id v14 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v17 = objc_msgSend_recordIDsToDelete(self, v15, v16);
  uint64_t v20 = objc_msgSend_count(v17, v18, v19);
  uint64_t v22 = objc_msgSend_numberWithUnsignedInteger_(v14, v21, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, 0x1F20585D0);

  uint64_t v26 = objc_msgSend_savePolicy(self, v24, v25);
  uint64_t v28 = @"SaveIfServerRecordUnchanged";
  if (v26 == 1) {
    uint64_t v28 = @"SaveChangedKeys";
  }
  if (v26 == 2) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v27, @"SaveAllKeys", 0x1F20585F0);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v28, 0x1F20585F0);
  }
  objc_super v31 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v32 = objc_msgSend_atomic(self, v29, v30);
  long long v34 = objc_msgSend_numberWithBool_(v31, v33, v32);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, 0x1F2058610);

  return v3;
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  v70.receiver = self;
  v70.super_class = (Class)CKDModifyRecordsOperation;
  long long v47 = a4;
  if ([(CKDOperation *)&v70 validateAgainstLiveContainer:v49 error:a4])
  {
    long long v46 = objc_msgSend_operationInfo(self, v5, v6);
    uint64_t v64 = 0;
    uint64_t v65 = &v64;
    uint64_t v66 = 0x3032000000;
    uint64_t v67 = sub_1C4F9DD44;
    id v68 = sub_1C4F9DD54;
    id v69 = 0;
    if (objc_msgSend_isLongLived(self, v7, v8))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1C4FAF7B8;
      aBlock[3] = &unk_1E64F7DB8;
      uint64_t v63 = &v64;
      void aBlock[4] = self;
      id v62 = v49;
      uint64_t v9 = _Block_copy(aBlock);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v12 = objc_msgSend_recordsToSave(v46, v10, v11);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v57, v74, 16);
      if (v14)
      {
        uint64_t v15 = *(void *)v58;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v58 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v57 + 1) + 8 * v16);
            v73[0] = objc_opt_class();
            v73[1] = objc_opt_class();
            uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v73, 2);
            LODWORD(v17) = objc_msgSend_containsValueOfClasses_passingTest_(v17, v20, (uint64_t)v19, v9);

            if (v17 && !v65[5])
            {
              uint64_t v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v21, v22);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 2994, @"If you're gonna fail our value check, there better be a reason");
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v21, (uint64_t)&v57, v74, 16);
        }
        while (v14);
      }

      uint64_t v25 = (void *)v65[5];
      if (v25)
      {
        if (a4) {
          *a4 = v25;
        }

        BOOL v26 = 0;
LABEL_33:
        _Block_object_dispose(&v64, 8);

        goto LABEL_34;
      }
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = sub_1C4FAFBD4;
    v54[3] = &unk_1E64F7DE0;
    id v55 = v49;
    uint64_t v56 = &v64;
    uint64_t v27 = _Block_copy(v54);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v30 = objc_msgSend_recordsToSave(v46, v28, v29);
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v50, v72, 16);
    if (v32)
    {
      uint64_t v33 = *(void *)v51;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v51 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v50 + 1) + 8 * v34);
          uint64_t v71 = objc_opt_class();
          objc_super v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v36, (uint64_t)&v71, 1);
          LODWORD(v35) = objc_msgSend_containsValueOfClasses_passingTest_(v35, v38, (uint64_t)v37, v27);

          if (v35 && !v65[5])
          {
            uint64_t v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v39, v40);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, @"CKDModifyRecordsOperation.m", 3020, @"If you're gonna fail our value check, there better be a reason");
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v39, (uint64_t)&v50, v72, 16);
      }
      while (v32);
    }

    objc_super v43 = (void *)v65[5];
    BOOL v26 = v43 == 0;
    if (v47 && v43) {
      id *v47 = v43;
    }

    goto LABEL_33;
  }
  BOOL v26 = 0;
LABEL_34:

  return v26;
}

- (id)relevantZoneIDs
{
  if (self->_hasRecordsToSave || self->_hasRecordsToDelete)
  {
    id v3 = objc_msgSend_modifyHandlersByZoneID(self, a2, v2);
    uint64_t v6 = objc_msgSend_allKeys(v3, v4, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)setRetryPCSFailures:(BOOL)a3
{
  self->_retryPCSFailures = a3;
}

- (BOOL)canSetPreviousProtectionEtag
{
  return self->_canSetPreviousProtectionEtag;
}

- (void)setCanSetPreviousProtectionEtag:(BOOL)a3
{
  self->_canSetPreviousProtectionEtag = a3;
}

- (BOOL)trustProtectionData
{
  return self->_trustProtectionData;
}

- (void)setTrustProtectionData:(BOOL)a3
{
  self->_trustProtectionData = a3;
}

- (BOOL)alwaysFetchPCSFromServer
{
  return self->_alwaysFetchPCSFromServer;
}

- (void)setAlwaysFetchPCSFromServer:(BOOL)a3
{
  self->_alwaysFetchPCSFromServer = a3;
}

- (NSData)cachedGlobalPerUserBoundaryKeyData
{
  return self->_cachedGlobalPerUserBoundaryKeyData;
}

- (void)setCachedGlobalPerUserBoundaryKeyData:(id)a3
{
}

- (void)setTranslator:(id)a3
{
}

- (id)saveProgressBlock
{
  return self->_saveProgressBlock;
}

- (void)setSaveProgressBlock:(id)a3
{
}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (void)setSaveCompletionBlock:(id)a3
{
}

- (id)deleteCompletionBlock
{
  return self->_deleteCompletionBlock;
}

- (void)setDeleteCompletionBlock:(id)a3
{
}

- (id)uploadCompletionBlock
{
  return self->_uploadCompletionBlock;
}

- (void)setUploadCompletionBlock:(id)a3
{
}

- (id)recordsInFlightBlock
{
  return self->_recordsInFlightBlock;
}

- (void)setRecordsInFlightBlock:(id)a3
{
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
}

- (NSDictionary)recordIDsToDeleteToSigningPCSIdentity
{
  return self->_recordIDsToDeleteToSigningPCSIdentity;
}

- (void)setRecordIDsToDeleteToSigningPCSIdentity:(id)a3
{
}

- (NSDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
}

- (NSDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
}

- (NSDictionary)handlersByRecordID
{
  return self->_handlersByRecordID;
}

- (void)setHandlersByRecordID:(id)a3
{
}

- (NSDictionary)parentsByRecordID
{
  return self->_parentsByRecordID;
}

- (void)setParentsByRecordID:(id)a3
{
}

- (NSMapTable)handlersByAssetNeedingRecordFetch
{
  return self->_handlersByAssetNeedingRecordFetch;
}

- (void)setHandlersByAssetNeedingRecordFetch:(id)a3
{
}

- (NSMapTable)handlersByAsset
{
  return self->_handlersByAsset;
}

- (void)setHandlersByAsset:(id)a3
{
}

- (NSMutableDictionary)modifyHandlersByZoneID
{
  return self->_modifyHandlersByZoneID;
}

- (void)setModifyHandlersByZoneID:(id)a3
{
}

- (int)saveAttempts
{
  return self->_saveAttempts;
}

- (void)setSaveAttempts:(int)a3
{
  self->_saveAttempts = a3;
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(id)a3
{
}

- (BOOL)retriedRecords
{
  return self->_retriedRecords;
}

- (void)setRetriedRecords:(BOOL)a3
{
  self->_retriedRecords = a3;
}

- (BOOL)shouldOnlySaveAssetContent
{
  return self->_shouldOnlySaveAssetContent;
}

- (void)setShouldOnlySaveAssetContent:(BOOL)a3
{
  self->_shouldOnlySaveAssetContent = a3;
}

- (BOOL)haveOutstandingHandlers
{
  return self->_haveOutstandingHandlers;
}

- (void)setHaveOutstandingHandlers:(BOOL)a3
{
  self->_int haveOutstandingHandlers = a3;
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)shouldReportRecordsInFlight
{
  return self->_shouldReportRecordsInFlight;
}

- (void)setShouldReportRecordsInFlight:(BOOL)a3
{
  self->_shouldReportRecordsInFlight = a3;
}

- (OS_dispatch_queue)modifyRecordsQueue
{
  return self->_modifyRecordsQueue;
}

- (void)setModifyRecordsQueue:(id)a3
{
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
}

- (NSDictionary)packageUUIDToExpectedProperties
{
  return self->_packageUUIDToExpectedProperties;
}

- (void)setPackageUUIDToExpectedProperties:(id)a3
{
}

- (BOOL)originatingFromDaemon
{
  return self->_originatingFromDaemon;
}

- (void)setOriginatingFromDaemon:(BOOL)a3
{
  self->_originatingFromDaemon = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (BOOL)requestNeedsUserPublicKeys
{
  return self->_requestNeedsUserPublicKeys;
}

- (void)setRequestNeedsUserPublicKeys:(BOOL)a3
{
  self->_requestNeedsUserPublicKeys = a3;
}

- (NSArray)userPublicKeys
{
  return self->_userPublicKeys;
}

- (void)setUserPublicKeys:(id)a3
{
}

- (C2RequestOptions)streamingAssetRequestOptions
{
  return self->_streamingAssetRequestOptions;
}

- (void)setStreamingAssetRequestOptions:(id)a3
{
}

- (BOOL)shouldModifyRecordsInDatabase
{
  return self->_shouldModifyRecordsInDatabase;
}

- (void)setShouldModifyRecordsInDatabase:(BOOL)a3
{
  self->_shouldModifyRecordsInDatabase = a3;
}

- (BOOL)includeMergeableDeltasInModifyRecordsRequest
{
  return self->_includeMergeableDeltasInModifyRecordsRequest;
}

- (void)setIncludeMergeableDeltasInModifyRecordsRequest:(BOOL)a3
{
  self->_includeMergeableDeltasInModifyRecordsRequest = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingAssetRequestOptions, 0);
  objc_storeStrong((id *)&self->_userPublicKeys, 0);
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_modifyRecordsQueue, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_modifyHandlersByZoneID, 0);
  objc_storeStrong((id *)&self->_handlersByAsset, 0);
  objc_storeStrong((id *)&self->_handlersByAssetNeedingRecordFetch, 0);
  objc_storeStrong((id *)&self->_parentsByRecordID, 0);
  objc_storeStrong((id *)&self->_handlersByRecordID, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToSigningPCSIdentity, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong(&self->_recordsInFlightBlock, 0);
  objc_storeStrong(&self->_uploadCompletionBlock, 0);
  objc_storeStrong(&self->_deleteCompletionBlock, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
  objc_storeStrong(&self->_saveProgressBlock, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_cachedGlobalPerUserBoundaryKeyData, 0);
  objc_storeStrong((id *)&self->_cloneContextsBySignature, 0);
  objc_storeStrong((id *)&self->_decryptOperation, 0);
}

@end