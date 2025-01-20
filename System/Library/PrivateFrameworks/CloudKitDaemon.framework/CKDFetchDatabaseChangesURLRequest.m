@interface CKDFetchDatabaseChangesURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)requiresCKAnonymousUserIDs;
- (CKDFetchDatabaseChangesURLRequest)initWithOperation:(id)a3 previousServerChangeTokenData:(id)a4;
- (CKRecordZoneID)recordZoneID;
- (NSArray)changedZoneIDs;
- (NSArray)deletedZoneIDs;
- (NSArray)encryptedDataResetDeletedZoneIDs;
- (NSArray)purgedZoneIDs;
- (NSData)previousServerChangeTokenData;
- (NSData)serverChangeTokenData;
- (id)anonymousShareProcessingBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneChangedBlock;
- (id)zoneDeletedBlock;
- (id)zoneDeletedDueToEncryptedDataResetBlock;
- (id)zonePurgedBlock;
- (int64_t)status;
- (unint64_t)resultsLimit;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)setAnonymousShareProcessingBlock:(id)a3;
- (void)setPreviousServerChangeTokenData:(id)a3;
- (void)setRecordZoneID:(id)a3;
- (void)setResultsLimit:(unint64_t)a3;
- (void)setServerChangeTokenData:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setZoneChangedBlock:(id)a3;
- (void)setZoneDeletedBlock:(id)a3;
- (void)setZoneDeletedDueToEncryptedDataResetBlock:(id)a3;
- (void)setZonePurgedBlock:(id)a3;
@end

@implementation CKDFetchDatabaseChangesURLRequest

- (CKDFetchDatabaseChangesURLRequest)initWithOperation:(id)a3 previousServerChangeTokenData:(id)a4
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDFetchDatabaseChangesURLRequest;
  v8 = [(CKDURLRequest *)&v18 initWithOperation:a3];
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    changedZoneIDs = v8->_changedZoneIDs;
    v8->_changedZoneIDs = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedZoneIDs = v8->_deletedZoneIDs;
    v8->_deletedZoneIDs = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    purgedZoneIDs = v8->_purgedZoneIDs;
    v8->_purgedZoneIDs = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    encryptedDataResetDeletedZoneIDs = v8->_encryptedDataResetDeletedZoneIDs;
    v8->_encryptedDataResetDeletedZoneIDs = v15;

    objc_storeStrong((id *)&v8->_previousServerChangeTokenData, a4);
    v8->_status = 0;
  }

  return v8;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDFetchDatabaseChangesURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v9 fillOutEquivalencyPropertiesBuilder:v4];
  id v7 = objc_msgSend_previousServerChangeTokenData(self, v5, v6, v9.receiver, v9.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"changeToken");
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  uint64_t v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  id v7 = objc_opt_new();
  objc_msgSend_setZoneRetrieveChangesRequest_(v6, v8, (uint64_t)v7);

  v11 = objc_msgSend_previousServerChangeTokenData(self, v9, v10);
  v14 = objc_msgSend_zoneRetrieveChangesRequest(v6, v12, v13);
  objc_msgSend_setSyncContinuationToken_(v14, v15, (uint64_t)v11);

  if (objc_msgSend_resultsLimit(self, v16, v17))
  {
    unint64_t v22 = objc_msgSend_resultsLimit(self, v18, v19);
    if (HIDWORD(v22))
    {
      v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
      v29 = objc_msgSend_stringWithUTF8String_(NSString, v28, (uint64_t)"uint32_t CKDownsizeOrDie(NSUInteger)");
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v27, v30, (uint64_t)v29, @"CloudKit-Prefix.pch", 34, @"That number was ridiculous");
    }
    v23 = objc_msgSend_zoneRetrieveChangesRequest(v6, v20, v21);
    objc_msgSend_setMaxChangedZones_(v23, v24, v22);
  }
  v31[0] = v6;
  v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v31, 1);

  return v25;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!objc_msgSend_hasZoneRetrieveChangesResponse(v4, v5, v6))
  {
    id v102 = 0;
    goto LABEL_58;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v129 = objc_msgSend_container(self, v8, v9);
  objc_msgSend_zoneRetrieveChangesResponse(v4, v10, v11);
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v127 = long long v134 = 0u;
  objc_msgSend_changedZones(v127, v12, v13);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v131, v137, 16);
  if (!v15)
  {
    v20 = 0;
    goto LABEL_45;
  }
  uint64_t v19 = v15;
  v20 = 0;
  uint64_t v21 = *(void *)v132;
  *(void *)&long long v18 = 138412290;
  long long v124 = v18;
  id v125 = v4;
  v126 = v7;
  while (2)
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v132 != v21) {
        objc_enumerationMutation(obj);
      }
      v23 = *(void **)(*((void *)&v131 + 1) + 8 * v22);
      if (!objc_msgSend_hasChangeType(v23, v16, v17, v124)
        || (objc_msgSend_hasZoneIdentifier(v23, v24, v25) & 1) == 0
        && (objc_msgSend_isAnonymous(v23, v24, v26) & 1) == 0)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v24, *MEMORY[0x1E4F19C40], 2006, @"Invalid data received from server");
        id v62 = (id)objc_claimAutoreleasedReturnValue();

LABEL_43:
        v20 = v62;
        id v4 = v125;
        id v7 = v126;
        goto LABEL_45;
      }
      v27 = objc_msgSend_options(v129, v24, v26);
      if (objc_msgSend_useAnonymousToServerShareParticipants(v27, v28, v29)
        && objc_msgSend_hasIsAnonymous(v23, v30, v31)
        && objc_msgSend_isAnonymous(v23, v32, v33))
      {
        int hasAnonymousZoneInfo = objc_msgSend_hasAnonymousZoneInfo(v23, v34, v35);

        if (hasAnonymousZoneInfo)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v39 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v95 = v39;
            v98 = objc_msgSend_anonymousZoneInfo(v23, v96, v97);
            v101 = objc_msgSend_anonymousZoneInfoID(v98, v99, v100);
            *(_DWORD *)buf = v124;
            uint64_t v136 = (uint64_t)v101;
            _os_log_debug_impl(&dword_1C4CFF000, v95, OS_LOG_TYPE_DEBUG, "Identified anonymous zone through CKDPZoneRetrieveChangesResponseChangedZone with anonymousZoneInfoID: %@.", buf, 0xCu);
          }
          v40 = [CKDAnonymousZoneDataObject alloc];
          v43 = objc_msgSend_anonymousZoneInfo(v23, v41, v42);
          v46 = objc_msgSend_anonymousZoneInfoData(v43, v44, v45);
          uint64_t v49 = objc_msgSend_changeType(v23, v47, v48);
          uint64_t v52 = objc_msgSend_deleteType(v23, v50, v51);
          v54 = objc_msgSend_initWithEncryptedData_changeType_deleteType_(v40, v53, (uint64_t)v46, v49, v52);

          objc_msgSend_addObject_(v126, v55, (uint64_t)v54);
          v56 = 0;
          goto LABEL_36;
        }
      }
      else
      {
      }
      v57 = objc_msgSend_translator(self, v37, v38);
      v60 = objc_msgSend_zoneIdentifier(v23, v58, v59);
      id v130 = v20;
      v56 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(v57, v61, (uint64_t)v60, &v130);
      id v62 = v130;

      if (!v56) {
        goto LABEL_43;
      }
      if (objc_msgSend_changeType(v23, v63, v64) == 1)
      {
        objc_msgSend_addObject_(self->_changedZoneIDs, v65, (uint64_t)v56);
        v69 = objc_msgSend_zoneChangedBlock(self, v67, v68);

        if (v69)
        {
          uint64_t v72 = objc_msgSend_zoneChangedBlock(self, v70, v71);
LABEL_35:
          v54 = (void *)v72;
          (*(void (**)(uint64_t, void *))(v72 + 16))(v72, v56);
          v20 = v62;
LABEL_36:

          goto LABEL_38;
        }
      }
      else
      {
        if (objc_msgSend_changeType(v23, v65, v66) != 2) {
          goto LABEL_37;
        }
        if (*MEMORY[0x1E4F1A4E0])
        {
          v75 = objc_msgSend_unitTestOverrides(self, v73, v74);
          v77 = objc_msgSend_objectForKeyedSubscript_(v75, v76, @"FakeUserResetEncryptedDataForZoneDelete");

          if (v77) {
            goto LABEL_31;
          }
        }
        if (objc_msgSend_deleteType(v23, v73, v74) != 2)
        {
          if (objc_msgSend_deleteType(v23, v78, v79) != 3)
          {
            objc_msgSend_addObject_(self->_deletedZoneIDs, v73, (uint64_t)v56);
            v92 = objc_msgSend_zoneDeletedBlock(self, v90, v91);

            if (v92)
            {
              uint64_t v72 = objc_msgSend_zoneDeletedBlock(self, v93, v94);
              goto LABEL_35;
            }
            goto LABEL_37;
          }
LABEL_31:
          objc_msgSend_addObject_(self->_encryptedDataResetDeletedZoneIDs, v73, (uint64_t)v56);
          v87 = objc_msgSend_zoneDeletedDueToEncryptedDataResetBlock(self, v85, v86);

          if (v87)
          {
            uint64_t v72 = objc_msgSend_zoneDeletedDueToEncryptedDataResetBlock(self, v88, v89);
            goto LABEL_35;
          }
          goto LABEL_37;
        }
        objc_msgSend_addObject_(self->_purgedZoneIDs, v78, (uint64_t)v56);
        v82 = objc_msgSend_zonePurgedBlock(self, v80, v81);

        if (v82)
        {
          uint64_t v72 = objc_msgSend_zonePurgedBlock(self, v83, v84);
          goto LABEL_35;
        }
      }
LABEL_37:
      v20 = v62;
LABEL_38:

      ++v22;
    }
    while (v19 != v22);
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v131, v137, 16);
    id v4 = v125;
    id v7 = v126;
    if (v19) {
      continue;
    }
    break;
  }
LABEL_45:

  uint64_t v105 = objc_msgSend_anonymousShareProcessingBlock(self, v103, v104);
  if (v105)
  {
    v108 = (void *)v105;
    uint64_t v109 = objc_msgSend_count(v7, v106, v107);

    if (v109)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v110 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v120 = v110;
        uint64_t v123 = objc_msgSend_count(v7, v121, v122);
        *(_DWORD *)buf = 134217984;
        uint64_t v136 = v123;
        _os_log_debug_impl(&dword_1C4CFF000, v120, OS_LOG_TYPE_DEBUG, "Calling back to the anonymousShareProcessingBlock with %lu anonymous zone data objects.", buf, 0xCu);
      }
      objc_msgSend_anonymousShareProcessingBlock(self, v111, v112);
      v113 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v113)[2](v113, v7);
    }
  }
  if (objc_msgSend_hasStatus(v127, v106, v107))
  {
    int v116 = objc_msgSend_status(v127, v114, v115);
    if (v116 == 1)
    {
      objc_msgSend_setStatus_(self, v114, 1);
    }
    else if (v116 == 2)
    {
      objc_msgSend_setStatus_(self, v114, 2);
    }
  }
  v117 = objc_msgSend_syncContinuationToken(v127, v114, v115);
  objc_msgSend_setServerChangeTokenData_(self, v118, (uint64_t)v117);

  id v102 = v20;
LABEL_58:

  return v102;
}

- (NSArray)changedZoneIDs
{
  return &self->_changedZoneIDs->super;
}

- (NSArray)deletedZoneIDs
{
  return &self->_deletedZoneIDs->super;
}

- (NSArray)purgedZoneIDs
{
  return &self->_purgedZoneIDs->super;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (NSData)serverChangeTokenData
{
  return self->_serverChangeTokenData;
}

- (void)setServerChangeTokenData:(id)a3
{
}

- (NSArray)encryptedDataResetDeletedZoneIDs
{
  return &self->_encryptedDataResetDeletedZoneIDs->super;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (id)zoneChangedBlock
{
  return self->_zoneChangedBlock;
}

- (void)setZoneChangedBlock:(id)a3
{
}

- (id)zoneDeletedBlock
{
  return self->_zoneDeletedBlock;
}

- (void)setZoneDeletedBlock:(id)a3
{
}

- (id)zonePurgedBlock
{
  return self->_zonePurgedBlock;
}

- (void)setZonePurgedBlock:(id)a3
{
}

- (id)zoneDeletedDueToEncryptedDataResetBlock
{
  return self->_zoneDeletedDueToEncryptedDataResetBlock;
}

- (void)setZoneDeletedDueToEncryptedDataResetBlock:(id)a3
{
}

- (id)anonymousShareProcessingBlock
{
  return self->_anonymousShareProcessingBlock;
}

- (void)setAnonymousShareProcessingBlock:(id)a3
{
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
}

- (NSData)previousServerChangeTokenData
{
  return self->_previousServerChangeTokenData;
}

- (void)setPreviousServerChangeTokenData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousServerChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong(&self->_anonymousShareProcessingBlock, 0);
  objc_storeStrong(&self->_zoneDeletedDueToEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_zonePurgedBlock, 0);
  objc_storeStrong(&self->_zoneDeletedBlock, 0);
  objc_storeStrong(&self->_zoneChangedBlock, 0);
  objc_storeStrong((id *)&self->_serverChangeTokenData, 0);
  objc_storeStrong((id *)&self->_encryptedDataResetDeletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_purgedZoneIDs, 0);
  objc_storeStrong((id *)&self->_deletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_changedZoneIDs, 0);
}

@end