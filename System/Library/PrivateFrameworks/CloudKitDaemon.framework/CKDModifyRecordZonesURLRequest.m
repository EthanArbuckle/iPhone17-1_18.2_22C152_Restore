@interface CKDModifyRecordZonesURLRequest
- (BOOL)markZonesAsUserPurged;
- (BOOL)requiresCKAnonymousUserIDs;
- (CKDModifyRecordZonesURLRequest)initWithOperation:(id)a3 recordZonesToSave:(id)a4 recordZoneIDsToDelete:(id)a5;
- (NSArray)generatedRequestOperations;
- (NSArray)recordZoneIDsToDelete;
- (NSArray)recordZonesToSave;
- (NSDate)lastMissingManateeIdentityErrorDate;
- (NSMutableDictionary)recordZoneIDByRequestID;
- (id)generateRequestOperations;
- (id)makeRequestOperations;
- (id)recordZoneModifiedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setGeneratedRequestOperations:(id)a3;
- (void)setLastMissingManateeIdentityErrorDate:(id)a3;
- (void)setMarkZonesAsUserPurged:(BOOL)a3;
- (void)setRecordZoneIDByRequestID:(id)a3;
- (void)setRecordZoneIDsToDelete:(id)a3;
- (void)setRecordZoneModifiedBlock:(id)a3;
- (void)setRecordZonesToSave:(id)a3;
@end

@implementation CKDModifyRecordZonesURLRequest

- (CKDModifyRecordZonesURLRequest)initWithOperation:(id)a3 recordZonesToSave:(id)a4 recordZoneIDsToDelete:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKDModifyRecordZonesURLRequest;
  v11 = [(CKDURLRequest *)&v16 initWithOperation:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recordZonesToSave, a4);
    objc_storeStrong((id *)&v12->_recordZoneIDsToDelete, a5);
    uint64_t v13 = objc_opt_new();
    recordZoneIDByRequestID = v12->_recordZoneIDByRequestID;
    v12->_recordZoneIDByRequestID = (NSMutableDictionary *)v13;
  }
  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CKDModifyRecordZonesURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v25 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_recordZonesToSave(self, v6, v7, v25.receiver, v25.super_class);
  v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  uint64_t v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"modifyIDs");
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = objc_msgSend_recordZoneIDsToDelete(self, v16, v17);
  v21 = objc_msgSend_ckEquivalencyProperties(v18, v19, v20);
  v23 = objc_msgSend_setWithArray_(v15, v22, (uint64_t)v21);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v24, (uint64_t)v23, @"deleteIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordZonesToSave(self, v5, v6);
  id v9 = objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1F2044CB0);

  objc_msgSend_setModifyRecordZoneIDs_(v4, v10, (uint64_t)v9);
  uint64_t v13 = objc_msgSend_recordZoneIDsToDelete(self, v11, v12);
  objc_msgSend_setDeleteRecordZoneIDs_(v4, v14, (uint64_t)v13);

  v15.receiver = self;
  v15.super_class = (Class)CKDModifyRecordZonesURLRequest;
  [(CKDURLRequest *)&v15 fillOutRequestProperties:v4];
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (id)zoneIDsToLock
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = objc_msgSend_recordZonesToSave(self, v4, v5);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v33, v38, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v6);
        }
        v14 = objc_msgSend_zoneID(*(void **)(*((void *)&v33 + 1) + 8 * i), v9, v10);
        objc_msgSend_addObject_(v3, v15, (uint64_t)v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v33, v38, 16);
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v18 = objc_msgSend_recordZoneIDsToDelete(self, v16, v17, 0);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v29, v37, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend_addObject_(v3, v21, *(void *)(*((void *)&v29 + 1) + 8 * j));
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v29, v37, 16);
    }
    while (v22);
  }

  v27 = objc_msgSend_allObjects(v3, v25, v26);

  return v27;
}

- (id)requestOperationClasses
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_recordZonesToSave(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_opt_class();
    objc_msgSend_addObject_(v3, v13, v12);
  }
  v14 = objc_msgSend_recordZoneIDsToDelete(self, v10, v11);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);

  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    objc_msgSend_addObject_(v3, v19, v18);
  }
  return v3;
}

- (id)makeRequestOperations
{
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  objc_msgSend_recordZonesToSave(self, v4, v5);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v213, v224, 16);
  if (!v7) {
    goto LABEL_41;
  }
  uint64_t v10 = v7;
  id v206 = *(id *)v214;
  v200 = (void *)*MEMORY[0x1E4F19DD8];
  *(void *)&long long v9 = 138543618;
  long long v196 = v9;
  v201 = v3;
  do
  {
    uint64_t v11 = 0;
    uint64_t v202 = v10;
    do
    {
      if (*(id *)v214 != v206) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v213 + 1) + 8 * v11);
      uint64_t v13 = objc_msgSend_operationRequestWithType_(self, v8, 200, v196);
      v14 = objc_opt_new();
      objc_msgSend_setZoneSaveRequest_(v13, v15, (uint64_t)v14);

      uint64_t v18 = objc_msgSend_previousProtectionEtag(v12, v16, v17);
      v21 = objc_msgSend_zoneSaveRequest(v13, v19, v20);
      objc_msgSend_setZoneProtectionInfoTag_(v21, v22, (uint64_t)v18);

      objc_super v25 = objc_msgSend_translator(self, v23, v24);
      v27 = objc_msgSend_pRecordZoneFromRecordZone_(v25, v26, (uint64_t)v12);

      long long v30 = objc_msgSend_originalRequiredFeatures(v12, v28, v29);
      long long v33 = objc_msgSend_requiredFeatures(v12, v31, v32);
      char isEqual = objc_msgSend_isEqual_(v30, v34, (uint64_t)v33);

      if (isEqual) {
        goto LABEL_37;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v38 = (void *)*MEMORY[0x1E4F1A500];
      v205 = v27;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v116 = v38;
        v119 = objc_msgSend_zoneID(v12, v117, v118);
        v122 = objc_msgSend_requiredFeatures(v12, v120, v121);
        v125 = objc_msgSend_originalRequiredFeatures(v12, v123, v124);
        *(_DWORD *)buf = 138412802;
        v219 = v119;
        __int16 v220 = 2112;
        id v221 = v122;
        __int16 v222 = 2112;
        v223 = v125;
        _os_log_debug_impl(&dword_1C4CFF000, v116, OS_LOG_TYPE_DEBUG, "Saving updated required features for zone %@.\nUpdated: %@\nPrevious: %@", buf, 0x20u);
      }
      if (*MEMORY[0x1E4F1A4E0])
      {
        v41 = objc_msgSend_unitTestOverrides(self, v39, v40);
        v43 = objc_msgSend_objectForKeyedSubscript_(v41, v42, @"DoNotExpectUpdatingRequiredFeatures");

        if (v43)
        {
          v46 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v44, v45);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, (uint64_t)a2, self, @"CKDModifyRecordZonesURLRequest.m", 103, @"Expected not to update required feature set but actually did");
        }
      }
      v48 = objc_alloc_init(CKDPZoneSignedCryptoRequirements);
      v51 = objc_msgSend_translator(self, v49, v50);
      v53 = objc_msgSend_pZoneCryptoFeatureRequirmentsFromZone_(v51, v52, (uint64_t)v12);

      if (*MEMORY[0x1E4F1A4E0])
      {
        v56 = objc_msgSend_unitTestOverrides(self, v54, v55);
        v58 = objc_msgSend_objectForKeyedSubscript_(v56, v57, @"HigherCryptoFeatureRequirementsMinimumSchemaVersion");

        if (v58)
        {
          int v59 = objc_msgSend_minimumSchemaVersion(v53, v54, v55);
          objc_msgSend_setMinimumSchemaVersion_(v53, v60, (v59 + 1));
        }
      }
      v204 = v53;
      v61 = objc_msgSend_data(v53, v54, v55);
      v64 = objc_msgSend_container(self, v62, v63);
      v67 = objc_msgSend_pcsManager(v64, v65, v66);
      id v212 = 0;
      v69 = objc_msgSend_createCloudKitFeaturesSignatureForData_forScope_error_(v67, v68, (uint64_t)v61, 4, &v212);
      id v70 = v212;

      if (v69)
      {
        objc_msgSend_setSignature_(v48, v71, (uint64_t)v69);
        objc_msgSend_setSerializedRequirements_(v48, v73, (uint64_t)v61);
        objc_msgSend_setVersion_(v48, v74, *MEMORY[0x1E4F1A660]);
        if (*MEMORY[0x1E4F1A4E0])
        {
          v77 = objc_msgSend_unitTestOverrides(self, v75, v76);
          v79 = objc_msgSend_objectForKeyedSubscript_(v77, v78, @"HigherSignedCryptoRequirementsVersion");

          if (v79)
          {
            int v81 = objc_msgSend_version(v48, v75, v80);
            objc_msgSend_setVersion_(v48, v82, (v81 + 1));
          }
        }
        v27 = v205;
        objc_msgSend_setSignedCryptoRequirements_(v205, v75, (uint64_t)v48);
        goto LABEL_36;
      }
      v83 = objc_msgSend_domain(v70, v71, v72);
      uint64_t v86 = (uint64_t)v200;
      if (v83 != v200)
      {

LABEL_31:
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v95 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          v126 = v95;
          v129 = objc_msgSend_zoneID(v12, v127, v128);
          *(_DWORD *)buf = v196;
          v219 = v129;
          __int16 v220 = 2114;
          id v221 = v70;
          _os_log_error_impl(&dword_1C4CFF000, v126, OS_LOG_TYPE_ERROR, "Failed to generate signature for required features when saving record zone %{public}@. Error: %{public}@", buf, 0x16u);

          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v130, (uint64_t)v200, 5002, v70, @"Failed to create cryptographic signature when saving modified record zones.");
        }
        else
        {
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v96, v86, 5002, v70, @"Failed to create cryptographic signature when saving modified record zones.");
        v97 = };
        objc_msgSend_finishWithError_(self, v98, (uint64_t)v97);

        v27 = v205;
        goto LABEL_36;
      }
      uint64_t v87 = objc_msgSend_code(v70, v84, v85);

      BOOL v90 = v87 == 5000;
      uint64_t v86 = (uint64_t)v200;
      if (!v90) {
        goto LABEL_31;
      }
      id v197 = v70;
      v198 = objc_msgSend_zoneID(v12, v88, v89);
      v27 = v205;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v91 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v219 = v198;
        _os_log_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_INFO, "Missing identity for signing required features when saving record zone %{public}@.", buf, 0xCu);
      }
      id v70 = v197;
      v93 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v92, (uint64_t)v200, 5000, v197, @"Failed to create cryptographic signature when saving modified record zones.");
      objc_msgSend_finishWithError_(self, v94, (uint64_t)v93);

LABEL_36:
      v3 = v201;
      uint64_t v10 = v202;
      if (!v69)
      {

        id v194 = 0;
        goto LABEL_52;
      }
LABEL_37:
      v99 = objc_msgSend_zoneSaveRequest(v13, v36, v37);
      objc_msgSend_setRecordZone_(v99, v100, (uint64_t)v27);

      objc_msgSend_addObject_(v3, v101, (uint64_t)v13);
      v104 = objc_msgSend_zoneID(v12, v102, v103);
      v107 = objc_msgSend_recordZoneIDByRequestID(self, v105, v106);
      v110 = objc_msgSend_request(v13, v108, v109);
      objc_msgSend_operationUUID(v110, v111, v112);
      v114 = v113 = v27;
      objc_msgSend_setObject_forKeyedSubscript_(v107, v115, (uint64_t)v104, v114);

      ++v11;
    }
    while (v10 != v11);
    uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v213, v224, 16);
    uint64_t v10 = v131;
  }
  while (v131);
LABEL_41:

  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  objc_msgSend_recordZoneIDsToDelete(self, v132, v133);
  id v207 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v207, v134, (uint64_t)&v208, v217, 16);
  if (v135)
  {
    uint64_t v137 = v135;
    uint64_t v138 = *(void *)v209;
    do
    {
      for (uint64_t i = 0; i != v137; ++i)
      {
        if (*(void *)v209 != v138) {
          objc_enumerationMutation(v207);
        }
        uint64_t v140 = *(void *)(*((void *)&v208 + 1) + 8 * i);
        v141 = objc_msgSend_operationRequestWithType_(self, v136, 202);
        v142 = objc_opt_new();
        objc_msgSend_setZoneDeleteRequest_(v141, v143, (uint64_t)v142);

        v146 = objc_msgSend_translator(self, v144, v145);
        v148 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v146, v147, v140);
        v151 = objc_msgSend_zoneDeleteRequest(v141, v149, v150);
        objc_msgSend_setZoneIdentifier_(v151, v152, (uint64_t)v148);

        uint64_t v155 = objc_msgSend_markZonesAsUserPurged(self, v153, v154);
        v158 = objc_msgSend_zoneDeleteRequest(v141, v156, v157);
        objc_msgSend_setUserPurge_(v158, v159, v155);

        v162 = objc_msgSend_lastMissingManateeIdentityErrorDate(self, v160, v161);

        if (v162)
        {
          v164 = objc_opt_new();
          v167 = objc_msgSend_zoneDeleteRequest(v141, v165, v166);
          objc_msgSend_setLastMissingManateeIdentityErrorDate_(v167, v168, (uint64_t)v164);

          v171 = objc_msgSend_lastMissingManateeIdentityErrorDate(self, v169, v170);
          objc_msgSend_timeIntervalSinceReferenceDate(v171, v172, v173);
          double v175 = v174;
          v178 = objc_msgSend_zoneDeleteRequest(v141, v176, v177);
          v181 = objc_msgSend_lastMissingManateeIdentityErrorDate(v178, v179, v180);
          objc_msgSend_setTime_(v181, v182, v183, v175);
        }
        objc_msgSend_addObject_(v3, v163, (uint64_t)v141);
        v186 = objc_msgSend_recordZoneIDByRequestID(self, v184, v185);
        v189 = objc_msgSend_request(v141, v187, v188);
        v192 = objc_msgSend_operationUUID(v189, v190, v191);
        objc_msgSend_setObject_forKeyedSubscript_(v186, v193, v140, v192);
      }
      uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v207, v136, (uint64_t)&v208, v217, 16);
    }
    while (v137);
  }

  id v194 = v3;
LABEL_52:

  return v194;
}

- (id)generateRequestOperations
{
  id v4 = objc_msgSend_generatedRequestOperations(self, a2, v2);

  if (!v4)
  {
    uint64_t v7 = objc_msgSend_makeRequestOperations(self, v5, v6);
    objc_msgSend_setGeneratedRequestOperations_(self, v8, (uint64_t)v7);
  }
  return (id)objc_msgSend_generatedRequestOperations(self, v5, v6);
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordZoneIDByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  objc_super v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  uint64_t v18 = objc_msgSend_zoneSaveResponse(v4, v16, v17);
  v21 = objc_msgSend_capabilities(v18, v19, v20);

  uint64_t v24 = objc_msgSend_translator(self, v22, v23);
  uint64_t v26 = objc_msgSend_capabilitiesFromPZoneCapabilities_(v24, v25, (uint64_t)v21);

  uint64_t v29 = objc_msgSend_zoneSaveResponse(v4, v27, v28);
  int hasExpirationTime = objc_msgSend_hasExpirationTime(v29, v30, v31);

  if (hasExpirationTime)
  {
    long long v35 = objc_msgSend_zoneSaveResponse(v4, v33, v34);
    v38 = objc_msgSend_expirationTime(v35, v36, v37);
    objc_msgSend_time(v38, v39, v40);
    double v42 = v41;

    uint64_t v45 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v43, v44, v42);
  }
  else
  {
    uint64_t v45 = 0;
  }
  v46 = objc_msgSend_zoneSaveResponse(v4, v33, v34);
  uint64_t v49 = objc_msgSend_expired(v46, v47, v48);

  if (objc_msgSend_hasZoneDeleteResponse(v4, v50, v51)) {
    objc_msgSend_updateShareIDCacheWithDeletedZoneID_(self, v52, (uint64_t)v15);
  }
  v54 = objc_msgSend_recordZoneModifiedBlock(self, v52, v53);

  if (v54)
  {
    objc_msgSend_recordZoneModifiedBlock(self, v55, v56);
    v57 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_result(v4, v58, v59);
    ((void (**)(void, void *, void *, uint64_t, void *, uint64_t))v57)[2](v57, v15, v60, v26, v45, v49);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v24 = a3;
  uint64_t v6 = objc_msgSend_recordZoneIDByRequestID(self, v4, v5);
  uint64_t v9 = objc_msgSend_response(v24, v7, v8);
  uint64_t v12 = objc_msgSend_operationUUID(v9, v10, v11);
  v14 = objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);

  uint64_t v17 = objc_msgSend_recordZoneModifiedBlock(self, v15, v16);

  if (v17)
  {
    objc_msgSend_recordZoneModifiedBlock(self, v18, v19);
    uint64_t v20 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_result(v24, v21, v22);
    ((void (**)(void, void *, void *, void, void, void))v20)[2](v20, v14, v23, 0, 0, 0);
  }
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (NSDate)lastMissingManateeIdentityErrorDate
{
  return self->_lastMissingManateeIdentityErrorDate;
}

- (void)setLastMissingManateeIdentityErrorDate:(id)a3
{
}

- (id)recordZoneModifiedBlock
{
  return self->_recordZoneModifiedBlock;
}

- (void)setRecordZoneModifiedBlock:(id)a3
{
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
}

- (NSArray)generatedRequestOperations
{
  return self->_generatedRequestOperations;
}

- (void)setGeneratedRequestOperations:(id)a3
{
}

- (NSMutableDictionary)recordZoneIDByRequestID
{
  return self->_recordZoneIDByRequestID;
}

- (void)setRecordZoneIDByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_generatedRequestOperations, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong(&self->_recordZoneModifiedBlock, 0);
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDate, 0);
}

@end