@interface CKDFetchRecordZoneChangesURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)fetchChangesForMergeableValues;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)isFullZoneRequest;
- (BOOL)requestGETPreAuth;
- (BOOL)shouldFetchAssetContent;
- (CKDFetchRecordZoneChangesURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4 configurationsByRecordZoneID:(id)a5;
- (NSArray)recordZoneIDs;
- (NSDictionary)configurationsByRecordZoneID;
- (NSDictionary)resultsByRecordZoneID;
- (NSDictionary)supplementalChangeTokenByZoneID;
- (NSDictionary)zoneErrorsByZoneID;
- (NSMutableArray)recordResponses;
- (NSMutableDictionary)nodeErrorsByZoneID;
- (NSMutableDictionary)requestResultsByRecordZoneID;
- (NSMutableDictionary)zoneIDsByRequestOperationUUID;
- (NSSet)desiredAssetKeys;
- (id)_handleRecordChanges:(id)a3 deltaChanges:(id)a4 zoneAttributesChange:(id)a5 forZoneID:(id)a6;
- (id)generateRequestOperations;
- (id)recordDeletedBlock;
- (id)recordsChangedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneAttributesChangedBlock;
- (int64_t)changeTypes;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)recordUsageForDeletedRecordID:(id)a3 at:(id)a4;
- (void)recordUsageForRecordID:(id)a3 at:(id)a4;
- (void)requestDidComplete;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setChangeTypes:(int64_t)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setDesiredAssetKeys:(id)a3;
- (void)setFetchChangesForMergeableValues:(BOOL)a3;
- (void)setNodeErrorsByZoneID:(id)a3;
- (void)setRecordDeletedBlock:(id)a3;
- (void)setRecordResponses:(id)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setRecordsChangedBlock:(id)a3;
- (void)setRequestResultsByRecordZoneID:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setSupplementalChangeTokenByZoneID:(id)a3;
- (void)setZoneAttributesChangedBlock:(id)a3;
- (void)setZoneIDsByRequestOperationUUID:(id)a3;
@end

@implementation CKDFetchRecordZoneChangesURLRequest

- (CKDFetchRecordZoneChangesURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4 configurationsByRecordZoneID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CKDFetchRecordZoneChangesURLRequest;
  v12 = [(CKDURLRequest *)&v26 initWithOperation:a3];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v10, v11);
    recordZoneIDs = v12->_recordZoneIDs;
    v12->_recordZoneIDs = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_configurationsByRecordZoneID, a5);
    uint64_t v15 = objc_opt_new();
    zoneIDsByRequestOperationUUID = v12->_zoneIDsByRequestOperationUUID;
    v12->_zoneIDsByRequestOperationUUID = (NSMutableDictionary *)v15;

    v12->_shouldFetchAssetContent = 1;
    uint64_t v17 = objc_opt_new();
    requestResultsByRecordZoneID = v12->_requestResultsByRecordZoneID;
    v12->_requestResultsByRecordZoneID = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    nodeErrorsByZoneID = v12->_nodeErrorsByZoneID;
    v12->_nodeErrorsByZoneID = (NSMutableDictionary *)v19;

    uint64_t v23 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v21, v22);
    recordResponses = v12->_recordResponses;
    v12->_recordResponses = (NSMutableArray *)v23;
  }
  return v12;
}

- (BOOL)isFullZoneRequest
{
  return 1;
}

- (NSDictionary)zoneErrorsByZoneID
{
  v3 = objc_msgSend_nodeErrorsByZoneID(self, a2, v2);
  v6 = objc_msgSend_copy(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (NSDictionary)resultsByRecordZoneID
{
  v3 = objc_msgSend_requestResultsByRecordZoneID(self, a2, v2);
  v6 = objc_msgSend_copy(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  v4 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  objc_msgSend_recordZoneIDs(self, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v32, v36, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend_configurationsByRecordZoneID(self, v9, v10, v29);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v14);
        v20 = objc_msgSend_previousServerChangeToken(v17, v18, v19);
        uint64_t v23 = objc_msgSend_data(v20, v21, v22);

        if (!v23)
        {
          uint64_t v23 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v24, v25);
        }
        objc_super v26 = objc_msgSend_sqliteRepresentation(v14, v24, v25);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v23, v26);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v32, v36, 16);
    }
    while (v11);
  }

  v31.receiver = self;
  v31.super_class = (Class)CKDFetchRecordZoneChangesURLRequest;
  [(CKDURLRequest *)&v31 fillOutEquivalencyPropertiesBuilder:v29];
  objc_msgSend_setObject_forKeyedSubscript_(v29, v28, (uint64_t)v4, @"zid->token");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_recordZoneIDs(self, v5, v6);
  objc_msgSend_setFetchRecordZoneIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchRecordZoneChangesURLRequest;
  [(CKDURLRequest *)&v9 fillOutRequestProperties:v4];
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)requestGETPreAuth
{
  id v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  if (objc_msgSend_usePreauth(v4, v5, v6)) {
    BOOL shouldFetchAssetContent = self->_shouldFetchAssetContent;
  }
  else {
    BOOL shouldFetchAssetContent = 0;
  }

  return shouldFetchAssetContent;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)generateRequestOperations
{
  uint64_t v250 = *MEMORY[0x1E4F143B8];
  id v223 = (id)objc_opt_new();
  long long v242 = 0u;
  long long v243 = 0u;
  long long v244 = 0u;
  long long v245 = 0u;
  objc_msgSend_recordZoneIDs(self, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v242, v249, 16);
  if (v224)
  {
    char v8 = 0;
    uint64_t v222 = *(void *)v243;
    do
    {
      uint64_t v9 = 0;
      do
      {
        char v227 = v8;
        if (*(void *)v243 != v222) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v242 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend_configurationsByRecordZoneID(self, v6, v7);
        uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)v10);

        uint64_t v16 = objc_msgSend_operationType(self, v14, v15);
        v18 = objc_msgSend_operationRequestWithType_(self, v17, v16);
        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v19, v20))
        {
          uint64_t v23 = objc_msgSend_anonymousCKUserID(v10, v21, v22);

          if (!v23)
          {
            v216 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v24, v25);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v216, v217, (uint64_t)a2, self, @"CKDFetchRecordZoneChangesURLRequest.m", 121, @"An anonymousCKUserID is required to fetch record zone changes in %@ in the shared database when using anonymous to server share participants", v10);
          }
          objc_super v26 = objc_msgSend_anonymousCKUserID(v10, v24, v25);
          id v29 = objc_msgSend_CKDPIdentifier_User(v26, v27, v28);
          long long v32 = objc_msgSend_request(v18, v30, v31);
          objc_msgSend_setAnonymousCKUserID_(v32, v33, (uint64_t)v29);
        }
        long long v34 = objc_opt_new();
        objc_msgSend_setRecordRetrieveChangesRequest_(v18, v35, (uint64_t)v34);

        v38 = objc_msgSend_previousServerChangeToken(v13, v36, v37);
        v41 = objc_msgSend_data(v38, v39, v40);
        v44 = objc_msgSend_recordRetrieveChangesRequest(v18, v42, v43);
        objc_msgSend_setSyncContinuationToken_(v44, v45, (uint64_t)v41);

        v48 = objc_msgSend_translator(self, v46, v47);
        v50 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v48, v49, (uint64_t)v10);
        v53 = objc_msgSend_recordRetrieveChangesRequest(v18, v51, v52);
        objc_msgSend_setZoneIdentifier_(v53, v54, (uint64_t)v50);

        uint64_t v57 = objc_msgSend_changeTypes(self, v55, v56);
        if (v57 == 1) {
          unsigned int v60 = 2;
        }
        else {
          unsigned int v60 = 1;
        }
        if (v57 == 2) {
          uint64_t v61 = 3;
        }
        else {
          uint64_t v61 = v60;
        }
        v62 = objc_msgSend_recordRetrieveChangesRequest(v18, v58, v59);
        objc_msgSend_setRequestedChangeTypes_(v62, v63, v61);

        if (objc_msgSend_resultsLimit(v13, v64, v65))
        {
          unint64_t v70 = objc_msgSend_resultsLimit(v13, v66, v67);
          if (HIDWORD(v70))
          {
            v212 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v68, v69);
            v214 = objc_msgSend_stringWithUTF8String_(NSString, v213, (uint64_t)"uint32_t CKDownsizeOrDie(NSUInteger)");
            objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v212, v215, (uint64_t)v214, @"CloudKit-Prefix.pch", 34, @"That number was ridiculous");
          }
          v71 = objc_msgSend_recordRetrieveChangesRequest(v18, v68, v69);
          objc_msgSend_setMaxChanges_(v71, v72, v70);
        }
        uint64_t NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(v13, v66, v67);
        v76 = objc_msgSend_recordRetrieveChangesRequest(v18, v74, v75);
        objc_msgSend_setNewestFirst_(v76, v77, NewestChangesFirst);

        if (v13 && (objc_msgSend_fetchChangesMadeByThisDevice(v13, v78, v79) & 1) == 0)
        {
          v80 = objc_msgSend_recordRetrieveChangesRequest(v18, v78, v79);
          objc_msgSend_setIgnoreCallingDeviceChanges_(v80, v81, 1);
        }
        uint64_t v228 = (uint64_t)v10;
        if (objc_msgSend_fetchChangesForMergeableValues(self, v78, v79))
        {
          v84 = objc_msgSend_recordRetrieveChangesRequest(v18, v82, v83);
          objc_msgSend_setIncludeMergeableDeltas_(v84, v85, 1);
        }
        v86 = objc_msgSend_desiredKeys(v13, v82, v83);

        v229 = v13;
        if (v86)
        {
          v89 = objc_opt_new();
          v92 = objc_msgSend_recordRetrieveChangesRequest(v18, v90, v91);
          objc_msgSend_setRequestedFields_(v92, v93, (uint64_t)v89);

          long long v240 = 0u;
          long long v241 = 0u;
          long long v238 = 0u;
          long long v239 = 0u;
          v96 = objc_msgSend_desiredKeys(v13, v94, v95);
          uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v97, (uint64_t)&v238, v248, 16);
          if (v98)
          {
            uint64_t v99 = v98;
            uint64_t v100 = *(void *)v239;
            do
            {
              for (uint64_t i = 0; i != v99; ++i)
              {
                if (*(void *)v239 != v100) {
                  objc_enumerationMutation(v96);
                }
                uint64_t v102 = *(void *)(*((void *)&v238 + 1) + 8 * i);
                v103 = objc_opt_new();
                objc_msgSend_setName_(v103, v104, v102);
                v107 = objc_msgSend_recordRetrieveChangesRequest(v18, v105, v106);
                v110 = objc_msgSend_requestedFields(v107, v108, v109);
                objc_msgSend_addFields_(v110, v111, (uint64_t)v103);
              }
              uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v112, (uint64_t)&v238, v248, 16);
            }
            while (v99);
          }

          uint64_t v13 = v229;
        }
        v113 = objc_msgSend_desiredAssetKeys(self, v87, v88);
        uint64_t v116 = objc_msgSend_count(v113, v114, v115);

        if (v116)
        {
          v119 = objc_opt_new();
          v122 = objc_msgSend_recordRetrieveChangesRequest(v18, v120, v121);
          objc_msgSend_setAssetsToDownload_(v122, v123, (uint64_t)v119);

          v124 = objc_opt_new();
          v127 = objc_msgSend_recordRetrieveChangesRequest(v18, v125, v126);
          v130 = objc_msgSend_assetsToDownload(v127, v128, v129);
          objc_msgSend_setAssetFields_(v130, v131, (uint64_t)v124);

          long long v236 = 0u;
          long long v237 = 0u;
          long long v234 = 0u;
          long long v235 = 0u;
          v134 = objc_msgSend_desiredAssetKeys(self, v132, v133);
          uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v234, v247, 16);
          if (v136)
          {
            uint64_t v137 = v136;
            uint64_t v225 = v9;
            uint64_t v138 = *(void *)v235;
            do
            {
              for (uint64_t j = 0; j != v137; ++j)
              {
                if (*(void *)v235 != v138) {
                  objc_enumerationMutation(v134);
                }
                uint64_t v140 = *(void *)(*((void *)&v234 + 1) + 8 * j);
                v141 = objc_opt_new();
                objc_msgSend_setName_(v141, v142, v140);
                v145 = objc_msgSend_recordRetrieveChangesRequest(v18, v143, v144);
                v148 = objc_msgSend_assetsToDownload(v145, v146, v147);
                v151 = objc_msgSend_assetFields(v148, v149, v150);
                objc_msgSend_addFields_(v151, v152, (uint64_t)v141);
              }
              uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v153, (uint64_t)&v234, v247, 16);
            }
            while (v137);
            uint64_t v9 = v225;
            uint64_t v13 = v229;
          }
        }
        else
        {
          if (!objc_msgSend_shouldFetchAssetContent(self, v117, v118)) {
            goto LABEL_46;
          }
          v156 = objc_opt_new();
          v159 = objc_msgSend_recordRetrieveChangesRequest(v18, v157, v158);
          objc_msgSend_setAssetsToDownload_(v159, v160, (uint64_t)v156);

          uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v161, v162);
          v134 = objc_msgSend_recordRetrieveChangesRequest(v18, v164, v165);
          v168 = objc_msgSend_assetsToDownload(v134, v166, v167);
          objc_msgSend_setAllAssets_(v168, v169, AssetContent);
        }
LABEL_46:
        if ((v227 & 1) == 0)
        {
          uint64_t v226 = v9;
          v170 = objc_msgSend_header(v18, v154, v155);

          if (!v170)
          {
            v173 = objc_opt_new();
            objc_msgSend_setHeader_(v18, v174, (uint64_t)v173);
          }
          long long v232 = 0u;
          long long v233 = 0u;
          long long v230 = 0u;
          long long v231 = 0u;
          v175 = objc_msgSend_supplementalChangeTokenByZoneID(self, v171, v172);
          uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v176, (uint64_t)&v230, v246, 16);
          if (v177)
          {
            uint64_t v180 = v177;
            uint64_t v181 = *(void *)v231;
            do
            {
              for (uint64_t k = 0; k != v180; ++k)
              {
                if (*(void *)v231 != v181) {
                  objc_enumerationMutation(v175);
                }
                uint64_t v183 = *(void *)(*((void *)&v230 + 1) + 8 * k);
                v184 = objc_msgSend_supplementalChangeTokenByZoneID(self, v178, v179);
                v186 = objc_msgSend_objectForKeyedSubscript_(v184, v185, v183);

                v187 = objc_opt_new();
                v190 = objc_msgSend_translator(self, v188, v189);
                v192 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v190, v191, v183);
                objc_msgSend_setZoneIdentifier_(v187, v193, (uint64_t)v192);

                v196 = objc_msgSend_data(v186, v194, v195);
                objc_msgSend_setSyncContinuationToken_(v187, v197, (uint64_t)v196);

                v200 = objc_msgSend_header(v18, v198, v199);
                objc_msgSend_addSupplementalZoneInfos_(v200, v201, (uint64_t)v187);
              }
              uint64_t v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v178, (uint64_t)&v230, v246, 16);
            }
            while (v180);
          }

          uint64_t v9 = v226;
          uint64_t v13 = v229;
        }
        objc_msgSend_addObject_(v223, v154, (uint64_t)v18);
        v204 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v202, v203);
        v207 = objc_msgSend_request(v18, v205, v206);
        v210 = objc_msgSend_operationUUID(v207, v208, v209);
        objc_msgSend_setObject_forKeyedSubscript_(v204, v211, v228, v210);

        ++v9;
        char v8 = 1;
      }
      while (v9 != v224);
      uint64_t v218 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v242, v249, 16);
      char v8 = 1;
      uint64_t v224 = v218;
    }
    while (v218);
  }

  return v223;
}

- (void)recordUsageForDeletedRecordID:(id)a3 at:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (objc_msgSend_databaseScope(self, v7, v8) == 3)
  {
    uint64_t v11 = objc_msgSend_sharedManager(CKDDeviceCapabilityManager, v9, v10);
    v14 = objc_msgSend_container(self, v12, v13);
    uint64_t v17 = objc_msgSend_operation(self, v15, v16);
    objc_msgSend_recordShareUsageForDeletedRecordID_at_container_operation_(v11, v18, (uint64_t)v19, v6, v14, v17);
  }
}

- (void)recordUsageForRecordID:(id)a3 at:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (objc_msgSend_databaseScope(self, v7, v8) == 3)
  {
    uint64_t v11 = objc_msgSend_sharedManager(CKDDeviceCapabilityManager, v9, v10);
    v14 = objc_msgSend_container(self, v12, v13);
    uint64_t v17 = objc_msgSend_operation(self, v15, v16);
    objc_msgSend_recordShareUsageForRecordID_at_container_operation_(v11, v18, (uint64_t)v19, v6, v14, v17);
  }
}

- (id)_handleRecordChanges:(id)a3 deltaChanges:(id)a4 zoneAttributesChange:(id)a5 forZoneID:(id)a6
{
  uint64_t v345 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v296 = a4;
  id v11 = a5;
  id v319 = a6;
  v295 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  if (objc_msgSend_hasRecordZone(v11, v12, v13))
  {
    v14 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v17 = objc_msgSend_translator(self, v15, v16);
    uint64_t v20 = objc_msgSend_recordZone(v11, v18, v19);
    id v337 = 0;
    uint64_t v22 = objc_msgSend_recordZoneFromPRecordZone_error_(v17, v21, (uint64_t)v20, &v337);
    id v11 = v337;

    uint64_t v23 = (void *)*MEMORY[0x1E4F1A548];
    if (v22)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      v24 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v284 = v24;
        v287 = objc_msgSend_zoneID(v22, v285, v286);
        *(_DWORD *)buf = 138543362;
        v342 = v287;
        _os_log_debug_impl(&dword_1C4CFF000, v284, OS_LOG_TYPE_DEBUG, "Received zone attributes change for zone %{public}@", buf, 0xCu);
      }
      v27 = objc_msgSend_zoneAttributesChangedBlock(self, v25, v26);

      if (!v27) {
        goto LABEL_17;
      }
      objc_msgSend_zoneAttributesChangedBlock(self, v28, v29);
      v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v30)[2](v30, v22);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      uint64_t v31 = (void *)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
      {
        v288 = v31;
        v291 = objc_msgSend_requestUUID(self, v289, v290);
        v294 = objc_msgSend_recordZone(v295, v292, v293);
        *(_DWORD *)buf = 138543618;
        v342 = v291;
        __int16 v343 = 2112;
        id v344 = v294;
        _os_log_error_impl(&dword_1C4CFF000, v288, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to parse record zone for record zone attributes change: %@\"", buf, 0x16u);
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v32, *MEMORY[0x1E4F19C40], 1005, v11, @"Failed to parse record zone attributes change");
      v30 = (void (**)(void, void))v11;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_17:
    goto LABEL_18;
  }
  id v11 = 0;
LABEL_18:
  v299 = objc_opt_new();
  v304 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v33, v34);
  long long v333 = 0u;
  long long v334 = 0u;
  long long v335 = 0u;
  long long v336 = 0u;
  id v35 = v10;
  uint64_t v316 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v333, v340, 16);
  v318 = self;
  id v305 = v35;
  if (!v316) {
    goto LABEL_54;
  }
  uint64_t v314 = *(void *)v334;
  uint64_t v308 = *MEMORY[0x1E4F19C40];
  do
  {
    uint64_t v37 = 0;
    do
    {
      if (*(void *)v334 != v314) {
        objc_enumerationMutation(v35);
      }
      v38 = *(void **)(*((void *)&v333 + 1) + 8 * v37);
      v39 = (void *)MEMORY[0x1C8789E70]();
      if (objc_msgSend_type(v38, v40, v41) != 3)
      {
        v312 = v39;
        if (objc_msgSend_hasRecord(v38, v42, v43))
        {
          v74 = objc_msgSend_translator(self, v72, v73);
          v77 = objc_msgSend_record(v38, v75, v76);
          v80 = objc_msgSend_anonymousCKUserID(v319, v78, v79);
          id v331 = v11;
          objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v74, v81, (uint64_t)v77, v80, &v331);
          uint64_t v65 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          id v82 = v331;

          if (v65)
          {
            objc_msgSend_updateShareIDCacheWithRecord_(self, v83, (uint64_t)v65);
            v86 = objc_msgSend_recordID(v65, v84, v85);
            objc_msgSend_recordUsageForRecordID_at_(self, v87, (uint64_t)v86, v304);

            id v11 = v82;
            v39 = v312;
            goto LABEL_32;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v83, v308, 2006, v82, @"Invalid data received from server");
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend_hasRecordIdentifier(v38, v109, v110))
          {
            uint64_t v56 = 0;
            id v57 = v11;
            v39 = v312;
            goto LABEL_47;
          }
          char v310 = 0;
LABEL_34:
          v90 = objc_msgSend_translator(self, v88, v89);
          v93 = objc_msgSend_recordIdentifier(v38, v91, v92);
          objc_msgSend_anonymousCKUserID(v319, v94, v95);
          v97 = v96 = self;
          id v330 = v11;
          uint64_t v56 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v90, v98, (uint64_t)v93, v97, &v330);
          id v57 = v330;

          if (v56)
          {
            objc_msgSend_recordUsageForRecordID_at_(v96, v99, (uint64_t)v56, v304);
            self = v96;
            id v35 = v305;
            v39 = v312;
            if ((v310 & 1) == 0) {
              goto LABEL_47;
            }
            goto LABEL_38;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v99, v308, 2006, v57, @"Invalid data received from server");
          uint64_t v106 = v57;
          id v57 = (id)objc_claimAutoreleasedReturnValue();
          self = v96;
          id v35 = v305;
          v39 = v312;
        }
        else
        {
          uint64_t v65 = 0;
LABEL_32:
          if (objc_msgSend_hasRecordIdentifier(v38, v72, v73))
          {
            char v310 = 1;
            goto LABEL_34;
          }
          uint64_t v56 = 0;
          id v57 = v11;
LABEL_38:
          uint64_t v100 = objc_msgSend_recordsChangedBlock(self, v88, v89);

          if (!v100) {
            goto LABEL_47;
          }
          v101 = [CKDRecordResponse alloc];
          v104 = objc_msgSend_etag(v38, v102, v103);
          uint64_t v106 = objc_msgSend_initWithRecordID_record_etag_(v101, v105, (uint64_t)v56, v65, v104);

          self = v318;
          objc_msgSend_addObject_(v318->_recordResponses, v107, (uint64_t)v106);
          if (v56) {
            objc_msgSend_setObject_forKeyedSubscript_(v299, v108, (uint64_t)v106, v56);
          }
        }

        goto LABEL_47;
      }
      v44 = objc_msgSend_recordIdentifier(v38, v42, v43);

      if (!v44) {
        goto LABEL_49;
      }
      uint64_t v47 = v39;
      v48 = objc_msgSend_translator(self, v45, v46);
      v51 = objc_msgSend_recordIdentifier(v38, v49, v50);
      v54 = objc_msgSend_anonymousCKUserID(v319, v52, v53);
      id v332 = v11;
      uint64_t v56 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v48, v55, (uint64_t)v51, v54, &v332);
      id v57 = v332;

      if (v56)
      {
        objc_msgSend_recordUsageForDeletedRecordID_at_(self, v58, (uint64_t)v56, v304);
        objc_msgSend_updateShareIDCacheWithDeletedRecordID_(self, v59, (uint64_t)v56);
        v62 = objc_msgSend_recordDeletedBlock(self, v60, v61);

        if (!v62)
        {
          v39 = v47;
          id v35 = v305;
          goto LABEL_48;
        }
        objc_msgSend_recordDeletedBlock(self, v63, v64);
        uint64_t v65 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend_recordType(v38, v66, v67);
        v71 = objc_msgSend_name(v68, v69, v70);
        ((void (**)(void, void *, void *))v65)[2](v65, v56, v71);
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v58, v308, 2006, @"Invalid data received from server");
        uint64_t v65 = (void (**)(void, void, void))v57;
        id v57 = (id)objc_claimAutoreleasedReturnValue();
      }
      v39 = v47;
      id v35 = v305;
LABEL_47:

LABEL_48:
      id v11 = v57;
LABEL_49:
      ++v37;
    }
    while (v316 != v37);
    uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v111, (uint64_t)&v333, v340, 16);
    uint64_t v316 = v112;
  }
  while (v112);
LABEL_54:

  uint64_t v115 = objc_msgSend_recordsChangedBlock(self, v113, v114);

  if (v115)
  {
    long long v329 = 0u;
    long long v327 = 0u;
    long long v328 = 0u;
    long long v326 = 0u;
    id obj = v296;
    uint64_t v309 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v116, (uint64_t)&v326, v339, 16);
    if (!v309) {
      goto LABEL_143;
    }
    uint64_t v306 = *MEMORY[0x1E4F19C40];
    uint64_t v307 = *(void *)v327;
    while (1)
    {
      uint64_t v119 = 0;
      do
      {
        if (*(void *)v327 != v307) {
          objc_enumerationMutation(obj);
        }
        v120 = *(void **)(*((void *)&v326 + 1) + 8 * v119);
        uint64_t v121 = objc_msgSend_deltas(v120, v117, v118);
        v124 = objc_msgSend_firstObject(v121, v122, v123);

        if (objc_msgSend_hasEncryptedData(v124, v125, v126)) {
          uint64_t hasEncryptedAsset = 1;
        }
        else {
          uint64_t hasEncryptedAsset = objc_msgSend_hasEncryptedAsset(v124, v127, v128);
        }
        uint64_t v315 = MEMORY[0x1C8789E70]();
        v132 = objc_msgSend_translator(self, v130, v131);
        v135 = objc_msgSend_recordIdentifier(v120, v133, v134);
        uint64_t v138 = objc_msgSend_anonymousCKUserID(v319, v136, v137);
        id v325 = v11;
        uint64_t v140 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v132, v139, (uint64_t)v135, v138, &v325);
        id v141 = v325;

        v317 = (void *)v140;
        if (!v140)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          self = v318;
          v216 = (void *)*MEMORY[0x1E4F1A530];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
          {
            uint64_t v250 = v216;
            v253 = objc_msgSend_requestUUID(v318, v251, v252);
            *(_DWORD *)buf = 138543618;
            v342 = v253;
            __int16 v343 = 2112;
            id v344 = v120;
            _os_log_error_impl(&dword_1C4CFF000, v250, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get record ID for mergeable delta change %@\"", buf, 0x16u);
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v217, v306, 2006, v141, @"Failed to parse record ID");
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          v210 = (void *)v315;
          goto LABEL_141;
        }
        uint64_t v144 = objc_msgSend_recordType(v120, v142, v143);
        uint64_t v147 = objc_msgSend_name(v144, v145, v146);

        if (!v147)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          self = v318;
          uint64_t v218 = (void *)*MEMORY[0x1E4F1A530];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
          {
            v254 = v218;
            v257 = objc_msgSend_requestUUID(v318, v255, v256);
            *(_DWORD *)buf = 138543618;
            v342 = v257;
            __int16 v343 = 2112;
            id v344 = v120;
            _os_log_error_impl(&dword_1C4CFF000, v254, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get record type for mergeable delta change %@\"", buf, 0x16u);
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v219, v306, 2006, v141, @"Failed to parse record type");
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          v210 = (void *)v315;
          goto LABEL_140;
        }
        uint64_t v150 = objc_msgSend_fieldIdentifier(v120, v148, v149);
        uint64_t v153 = objc_msgSend_name(v150, v151, v152);

        uint64_t v303 = v153;
        if (!v153)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          self = v318;
          v220 = (void *)*MEMORY[0x1E4F1A530];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
          {
            v264 = v220;
            v267 = objc_msgSend_requestUUID(v318, v265, v266);
            *(_DWORD *)buf = 138543618;
            v342 = v267;
            __int16 v343 = 2112;
            id v344 = v120;
            _os_log_error_impl(&dword_1C4CFF000, v264, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get record field key for %@\"", buf, 0x16u);
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v221, v306, 2006, v141, @"Failed to get record field key");
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          v210 = (void *)v315;
          goto LABEL_139;
        }
        v156 = objc_msgSend_identifier(v120, v154, v155);
        v159 = objc_msgSend_value(v156, v157, v158);
        uint64_t v162 = objc_msgSend_name(v159, v160, v161);

        v300 = (void *)v162;
        if (!v162)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          self = v318;
          uint64_t v222 = (void *)*MEMORY[0x1E4F1A530];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
          {
            v268 = v222;
            v271 = objc_msgSend_requestUUID(v318, v269, v270);
            *(_DWORD *)buf = 138543618;
            v342 = v271;
            __int16 v343 = 2112;
            id v344 = v120;
            _os_log_error_impl(&dword_1C4CFF000, v268, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get location name from mergeable delta change %@\"", buf, 0x16u);
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v223, v306, 2006, v141, @"Failed to get mergeable ID from mergeable delta");
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          v210 = (void *)v315;
          goto LABEL_138;
        }
        id v163 = objc_alloc(MEMORY[0x1E4F1A168]);
        uint64_t v313 = objc_msgSend_initWithName_recordID_key_encrypted_(v163, v164, v162, v317, v153, hasEncryptedAsset);
        if (!v313)
        {
          v210 = (void *)v315;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          self = v318;
          uint64_t v224 = (void *)*MEMORY[0x1E4F1A530];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
          {
            v274 = v224;
            v277 = objc_msgSend_requestUUID(v318, v275, v276);
            *(_DWORD *)buf = 138543618;
            v342 = v277;
            __int16 v343 = 2112;
            id v344 = v141;
            _os_log_error_impl(&dword_1C4CFF000, v274, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get value ID for mergeable delta change: %@\"", buf, 0x16u);
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v225, v306, 2006, v141, @"Failed to parse mergeable value ID");
          v211 = v141;
          id v141 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_137;
        }
        v297 = v124;
        uint64_t v298 = v147;
        id v165 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v168 = objc_msgSend_deltas(v120, v166, v167);
        uint64_t v171 = objc_msgSend_count(v168, v169, v170);
        v173 = objc_msgSend_initWithCapacity_(v165, v172, v171);

        id v174 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v177 = objc_msgSend_deltas(v120, v175, v176);
        uint64_t v180 = objc_msgSend_count(v177, v178, v179);
        v311 = objc_msgSend_initWithCapacity_(v174, v181, v180);

        long long v323 = 0u;
        long long v324 = 0u;
        long long v321 = 0u;
        long long v322 = 0u;
        objc_msgSend_deltas(v120, v182, v183);
        id v302 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v302, v184, (uint64_t)&v321, v338, 16);
        if (!v185)
        {
          self = v318;
          v210 = (void *)v315;
          v211 = v173;
          v124 = v297;
LABEL_122:

          if (!v141)
          {
            uint64_t v214 = objc_msgSend_count(v211, v229, v230);
            goto LABEL_124;
          }
          goto LABEL_136;
        }
        uint64_t v188 = v185;
        uint64_t v189 = *(void *)v322;
        self = v318;
        while (2)
        {
          uint64_t v190 = 0;
          do
          {
            if (*(void *)v322 != v189) {
              objc_enumerationMutation(v302);
            }
            v191 = *(void **)(*((void *)&v321 + 1) + 8 * v190);
            if (objc_msgSend_hasEncryptedData(v191, v186, v187))
            {
              if ((hasEncryptedAsset & 1) == 0) {
                goto LABEL_115;
              }
            }
            else if (hasEncryptedAsset != objc_msgSend_hasEncryptedAsset(v191, v192, v193))
            {
LABEL_115:
              uint64_t v226 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v192, v306, 2006, @"Expected encrypted=%d on all mergeable deltas for %@", hasEncryptedAsset, v313);
              v210 = (void *)v315;
              v211 = v173;
              v124 = v297;
LABEL_121:

              id v141 = (id)v226;
              uint64_t v147 = v298;
              goto LABEL_122;
            }
            v194 = objc_msgSend_translator(self, v192, v193);
            id v320 = v141;
            v196 = objc_msgSend_mergeableDeltaFromPDelta_valueID_error_(v194, v195, (uint64_t)v191, v313, &v320);
            id v197 = v320;

            uint64_t v198 = *MEMORY[0x1E4F1A550];
            if (v196) {
              BOOL v199 = v197 == 0;
            }
            else {
              BOOL v199 = 0;
            }
            if (!v199)
            {
              if (v198 != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              self = v318;
              v210 = (void *)v315;
              v211 = v173;
              char v227 = (void *)*MEMORY[0x1E4F1A530];
              v124 = v297;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
              {
                v278 = v227;
                v281 = objc_msgSend_requestUUID(v318, v279, v280);
                *(_DWORD *)buf = 138543618;
                v342 = v281;
                __int16 v343 = 2112;
                id v344 = v197;
                _os_log_error_impl(&dword_1C4CFF000, v278, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to load delta when fetching changes: %@\"", buf, 0x16u);

                self = v318;
              }
              uint64_t v226 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v228, v306, 2006, v197, @"Failed to parse mergeable delta");

              id v141 = v196;
              goto LABEL_121;
            }
            if (v198 != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            self = v318;
            v200 = (void *)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
            {
              uint64_t v206 = v200;
              uint64_t v209 = objc_msgSend_requestUUID(v318, v207, v208);
              *(_DWORD *)buf = 138543618;
              v342 = v209;
              __int16 v343 = 2112;
              id v344 = v196;
              _os_log_debug_impl(&dword_1C4CFF000, v206, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received mergeable delta: %@\"", buf, 0x16u);
            }
            objc_msgSend_addObject_(v173, v201, (uint64_t)v196);
            v204 = objc_msgSend_metadata(v196, v202, v203);
            objc_msgSend_addObject_(v311, v205, (uint64_t)v204);

            id v141 = 0;
            ++v190;
          }
          while (v188 != v190);
          uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v302, v186, (uint64_t)&v321, v338, 16);
          id v141 = 0;
          if (v188) {
            continue;
          }
          break;
        }

        v210 = (void *)v315;
        v211 = v173;
        v124 = v297;
        uint64_t v147 = v298;
        uint64_t v214 = objc_msgSend_count(v211, v212, v213);
LABEL_124:
        if (v214)
        {
          long long v233 = objc_msgSend_objectForKeyedSubscript_(v299, v215, (uint64_t)v317);
          if (!v233)
          {
            id v234 = objc_alloc(MEMORY[0x1E4F1A2D8]);
            long long v236 = objc_msgSend_initWithRecordType_recordID_(v234, v235, v147, v317);
            objc_msgSend_setIsMergeableValueDeltaRecord_(v236, v237, 1);
            long long v238 = [CKDRecordResponse alloc];
            long long v233 = objc_msgSend_initWithRecordID_record_etag_(v238, v239, (uint64_t)v317, v236, 0);
            objc_msgSend_addObject_(self->_recordResponses, v240, (uint64_t)v233);
            objc_msgSend_setObject_forKeyedSubscript_(v299, v241, (uint64_t)v233, v317);
          }
          long long v242 = objc_msgSend_record(v233, v231, v232);
          long long v245 = v242;
          if (hasEncryptedAsset)
          {
            v246 = objc_msgSend_encryptedValues(v242, v243, v244);
            objc_msgSend_objectForKeyedSubscript_(v246, v247, v303);
            id v248 = (id)objc_claimAutoreleasedReturnValue();

            self = v318;
            if (!v248) {
              goto LABEL_131;
            }
          }
          else
          {
            objc_msgSend_objectForKeyedSubscript_(v242, v243, v303);
            id v248 = (id)objc_claimAutoreleasedReturnValue();
            if (!v248)
            {
LABEL_131:
              id v248 = objc_alloc_init(MEMORY[0x1E4F1A160]);
              objc_msgSend_setValueID_(v248, v258, v313);
              objc_msgSend_setIsValueIDKnownToServer_(v248, v259, 1);
              if (hasEncryptedAsset)
              {
                v262 = objc_msgSend_encryptedValues(v245, v260, v261);
                objc_msgSend_setObject_forKeyedSubscript_(v262, v263, (uint64_t)v248, v303);
              }
              else
              {
                objc_msgSend_setObject_forKeyedSubscript_(v245, v260, (uint64_t)v248, v303);
              }
            }
          }
          objc_msgSend_addUnmergedDeltas_(v248, v249, (uint64_t)v211);
          objc_msgSend_addServerDeltaMetadatas_(v248, v272, (uint64_t)v311);
          objc_msgSend_mergeLastKnownServerTimestampVectorFromDeltas_(v248, v273, (uint64_t)v211);
        }
        id v141 = 0;
LABEL_136:

LABEL_137:
        id v11 = v141;

        id v141 = (id)v313;
LABEL_138:

        id v141 = v300;
LABEL_139:

        id v141 = (id)v303;
LABEL_140:

        id v141 = (id)v147;
LABEL_141:

        ++v119;
      }
      while (v119 != v309);
      uint64_t v309 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v117, (uint64_t)&v326, v339, 16);
      if (!v309)
      {
LABEL_143:

        id v35 = v305;
        break;
      }
    }
  }
  id v282 = v11;

  return v282;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!objc_msgSend_hasRecordRetrieveChangesResponse(v5, v6, v7))
  {
    id v46 = 0;
    goto LABEL_26;
  }
  id v10 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v8, v9);
  uint64_t v13 = objc_msgSend_response(v5, v11, v12);
  uint64_t v16 = objc_msgSend_operationUUID(v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);

  if (!v18)
  {
    v120 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    uint64_t v123 = objc_msgSend_response(v5, v121, v122);
    uint64_t v126 = objc_msgSend_operationUUID(v123, v124, v125);
    uint64_t v129 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v127, v128);
    v132 = objc_msgSend_allKeys(v129, v130, v131);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v120, v133, (uint64_t)a2, self, @"CKDFetchRecordZoneChangesURLRequest.m", 379, @"Got a response for an unknown zone with request operation %@ %@", v126, v132);
  }
  v21 = objc_msgSend_recordsChangedBlock(self, v19, v20);
  uint64_t v137 = self;
  if (v21
    || (objc_msgSend_recordDeletedBlock(self, v22, v23), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    uint64_t v28 = objc_msgSend_recordRetrieveChangesResponse(v5, v26, v27);
    uint64_t v31 = objc_msgSend_changedRecords(v28, v29, v30);
    uint64_t v34 = objc_msgSend_recordRetrieveChangesResponse(v5, v32, v33);
    uint64_t v37 = objc_msgSend_changedDeltas(v34, v35, v36);
    id v38 = v5;
    uint64_t v41 = objc_msgSend_recordRetrieveChangesResponse(v5, v39, v40);
    v44 = objc_msgSend_zoneAttributesChange(v41, v42, v43);
    objc_msgSend__handleRecordChanges_deltaChanges_zoneAttributesChange_forZoneID_(self, v45, (uint64_t)v31, v37, v44, v18);
    id v46 = (id)objc_claimAutoreleasedReturnValue();

    if (v46) {
      id v47 = v46;
    }

    id v5 = v38;
    goto LABEL_10;
  }
  uint64_t v119 = objc_msgSend_zoneAttributesChangedBlock(self, v24, v25);

  if (v119) {
    goto LABEL_7;
  }
  id v46 = 0;
LABEL_10:
  v48 = objc_opt_new();
  v51 = objc_msgSend_recordRetrieveChangesResponse(v5, v49, v50);
  v54 = objc_msgSend_syncContinuationToken(v51, v52, v53);
  objc_msgSend_setResultServerChangeTokenData_(v48, v55, (uint64_t)v54);

  v58 = objc_msgSend_recordRetrieveChangesResponse(v5, v56, v57);
  uint64_t v61 = objc_msgSend_clientChangeToken(v58, v59, v60);
  objc_msgSend_setResultClientChangeTokenData_(v48, v62, (uint64_t)v61);

  uint64_t v65 = objc_msgSend_recordRetrieveChangesResponse(v5, v63, v64);
  uint64_t v68 = objc_msgSend_pendingArchivedRecords(v65, v66, v67);
  objc_msgSend_setHasPendingArchivedRecords_(v48, v69, v68);

  v72 = objc_msgSend_recordRetrieveChangesResponse(v5, v70, v71);
  uint64_t v75 = objc_msgSend_syncObligationsCount(v72, v73, v74);

  uint64_t v136 = (void *)v18;
  if (v75)
  {
    uint64_t v134 = v48;
    v78 = objc_opt_new();
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id v135 = v5;
    v81 = objc_msgSend_recordRetrieveChangesResponse(v5, v79, v80);
    v84 = objc_msgSend_syncObligations(v81, v82, v83);

    uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v139, v143, 16);
    if (v86)
    {
      uint64_t v89 = v86;
      uint64_t v90 = *(void *)v140;
      do
      {
        uint64_t v91 = 0;
        uint64_t v92 = v46;
        do
        {
          if (*(void *)v140 != v90) {
            objc_enumerationMutation(v84);
          }
          v93 = *(void **)(*((void *)&v139 + 1) + 8 * v91);
          v94 = objc_msgSend_translator(v137, v87, v88);
          v97 = objc_msgSend_zoneIdentifier(v93, v95, v96);
          id v138 = v92;
          uint64_t v99 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(v94, v98, (uint64_t)v97, &v138);
          id v46 = v138;

          objc_msgSend_addObject_(v78, v100, (uint64_t)v99);
          ++v91;
          uint64_t v92 = v46;
        }
        while (v89 != v91);
        uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v139, v143, 16);
      }
      while (v89);
    }

    v48 = v134;
    objc_msgSend_setSyncObligationZoneIDs_(v134, v101, (uint64_t)v78);

    id v5 = v135;
  }
  uint64_t v102 = objc_msgSend_recordRetrieveChangesResponse(v5, v76, v77);
  int hasStatus = objc_msgSend_hasStatus(v102, v103, v104);

  if (hasStatus)
  {
    v108 = objc_msgSend_recordRetrieveChangesResponse(v5, v106, v107);
    int v111 = objc_msgSend_status(v108, v109, v110);

    uint64_t v112 = (v111 - 1);
    if (v112 <= 2) {
      uint64_t v113 = v112 + 1;
    }
    else {
      uint64_t v113 = -1;
    }
  }
  else
  {
    uint64_t v113 = -1;
  }
  objc_msgSend_setStatus_(v48, v106, v113);
  uint64_t v116 = objc_msgSend_requestResultsByRecordZoneID(v137, v114, v115);
  objc_msgSend_setObject_forKeyedSubscript_(v116, v117, (uint64_t)v48, v136);

LABEL_26:
  return v46;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v5, v6);
  id v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  uint64_t v18 = objc_msgSend_result(v4, v16, v17);
  if (objc_msgSend_code(v18, v19, v20) != 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v21 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v51 = v21;
      v54 = objc_msgSend_error(v18, v52, v53);
      uint64_t v57 = objc_msgSend_errorDescription(v54, v55, v56);
      *(_DWORD *)buf = 138543618;
      uint64_t v64 = v15;
      __int16 v65 = 2114;
      v66 = v57;
      _os_log_debug_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEBUG, "Error fetching changes in zone %{public}@: %{public}@", buf, 0x16u);
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v23 = *MEMORY[0x1E4F19DD8];
    uint64_t v24 = sub_1C4E94D98(v18);
    uint64_t v25 = sub_1C4E940D0(self, v18);
    uint64_t v28 = objc_msgSend_error(v18, v26, v27);
    uint64_t v31 = objc_msgSend_errorDescription(v28, v29, v30);
    uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_format_(v22, v32, v23, v24, v25, @"Error fetching changes in zone %@: %@", v15, v31);

    if (v15)
    {
      uint64_t v36 = objc_msgSend_nodeErrorsByZoneID(self, v34, v35);
      objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)v33, v15);
    }
    else
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v38 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v34, v35);
      uint64_t v36 = objc_msgSend_allValues(v38, v39, v40);

      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v41, (uint64_t)&v58, v62, 16);
      if (v42)
      {
        uint64_t v45 = v42;
        uint64_t v46 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v59 != v46) {
              objc_enumerationMutation(v36);
            }
            uint64_t v48 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            v49 = objc_msgSend_nodeErrorsByZoneID(self, v43, v44);
            objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v33, v48);
          }
          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v43, (uint64_t)&v58, v62, 16);
        }
        while (v45);
        uint64_t v15 = 0;
      }
    }
  }
}

- (void)requestDidComplete
{
  v3 = (void *)MEMORY[0x1C8789E70](self, a2);
  uint64_t v6 = objc_msgSend_recordsChangedBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_recordsChangedBlock(self, v7, v8);
    uint64_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, NSMutableArray *))v9)[2](v9, self->_recordResponses);
  }
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
}

- (void)setChangeTypes:(int64_t)a3
{
  self->_changeTypes = a3;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_BOOL shouldFetchAssetContent = a3;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void)setDesiredAssetKeys:(id)a3
{
}

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
}

- (BOOL)fetchChangesForMergeableValues
{
  return self->_fetchChangesForMergeableValues;
}

- (void)setFetchChangesForMergeableValues:(BOOL)a3
{
  self->_fetchChangesForMergeableValues = a3;
}

- (id)recordsChangedBlock
{
  return self->_recordsChangedBlock;
}

- (void)setRecordsChangedBlock:(id)a3
{
}

- (id)recordDeletedBlock
{
  return self->_recordDeletedBlock;
}

- (void)setRecordDeletedBlock:(id)a3
{
}

- (id)zoneAttributesChangedBlock
{
  return self->_zoneAttributesChangedBlock;
}

- (void)setZoneAttributesChangedBlock:(id)a3
{
}

- (NSMutableDictionary)zoneIDsByRequestOperationUUID
{
  return self->_zoneIDsByRequestOperationUUID;
}

- (void)setZoneIDsByRequestOperationUUID:(id)a3
{
}

- (NSMutableDictionary)requestResultsByRecordZoneID
{
  return self->_requestResultsByRecordZoneID;
}

- (void)setRequestResultsByRecordZoneID:(id)a3
{
}

- (NSMutableDictionary)nodeErrorsByZoneID
{
  return self->_nodeErrorsByZoneID;
}

- (void)setNodeErrorsByZoneID:(id)a3
{
}

- (NSMutableArray)recordResponses
{
  return self->_recordResponses;
}

- (void)setRecordResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordResponses, 0);
  objc_storeStrong((id *)&self->_nodeErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_requestResultsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsByRequestOperationUUID, 0);
  objc_storeStrong(&self->_zoneAttributesChangedBlock, 0);
  objc_storeStrong(&self->_recordDeletedBlock, 0);
  objc_storeStrong(&self->_recordsChangedBlock, 0);
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end