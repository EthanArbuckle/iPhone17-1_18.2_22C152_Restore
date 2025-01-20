@interface CKDFetchRecordsURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)requestGETPreAuth;
- (BOOL)shouldFetchAssetContent;
- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier;
- (CKDFetchRecordsURLRequest)initWithOperation:(id)a3 recordIDs:(id)a4 recordIDsToEtags:(id)a5 recordIDsToVersionETags:(id)a6 desiredKeys:(id)a7;
- (NSArray)desiredIndexedListKeys;
- (NSArray)recordIDs;
- (NSDictionary)recordIDsToETags;
- (NSDictionary)recordIDsToVersionETags;
- (NSMutableDictionary)recordIDByRequestID;
- (NSSet)assetFieldNamesToPublishURLs;
- (NSSet)desiredAssetKeys;
- (NSSet)desiredKeys;
- (id)generateRequestOperations;
- (id)recordFetchedBlock;
- (id)recordIDsUsedInZones:(id)a3;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)requestedListFieldsForDesiredIndexedListKeys;
- (id)zoneIDsToLock;
- (unint64_t)URLOptions;
- (unint64_t)recordCount;
- (unint64_t)requestedTTL;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAssetFieldNamesToPublishURLs:(id)a3;
- (void)setDesiredAssetKeys:(id)a3;
- (void)setDesiredIndexedListKeys:(id)a3;
- (void)setDesiredKeys:(id)a3;
- (void)setRecordCount:(unint64_t)a3;
- (void)setRecordFetchedBlock:(id)a3;
- (void)setRecordIDByRequestID:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRecordIDsToETags:(id)a3;
- (void)setRecordIDsToVersionETags:(id)a3;
- (void)setRequestedTTL:(unint64_t)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3;
- (void)setURLOptions:(unint64_t)a3;
@end

@implementation CKDFetchRecordsURLRequest

- (CKDFetchRecordsURLRequest)initWithOperation:(id)a3 recordIDs:(id)a4 recordIDsToEtags:(id)a5 recordIDsToVersionETags:(id)a6 desiredKeys:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CKDFetchRecordsURLRequest;
  v17 = [(CKDURLRequest *)&v24 initWithOperation:v12];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_recordIDs, a4);
    v18->_recordCount = 0;
    objc_storeStrong((id *)&v18->_recordIDsToETags, a5);
    objc_storeStrong((id *)&v18->_recordIDsToVersionETags, a6);
    objc_storeStrong((id *)&v18->_desiredKeys, a7);
    uint64_t v19 = objc_opt_new();
    recordIDByRequestID = v18->_recordIDByRequestID;
    v18->_recordIDByRequestID = (NSMutableDictionary *)v19;

    v18->_shouldFetchAssetContent = 1;
    v18->_shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v12, v21, v22);
  }

  return v18;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchRecordsURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_recordIDs(self, v6, v7, v15.receiver, v15.super_class);
  v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  id v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"recordIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDs(self, v5, v6);
  objc_msgSend_setFetchRecordIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchRecordsURLRequest;
  [(CKDURLRequest *)&v9 fillOutRequestProperties:v4];
}

- (id)recordIDsUsedInZones:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDs(self, v5, v6);
  objc_super v9 = objc_msgSend_recordIDs_filteredByZones_(self, v8, (uint64_t)v7, v4);

  return v9;
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)zoneIDsToLock
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = objc_msgSend_recordIDs(self, v4, v5, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, v24, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_super v15 = objc_msgSend_zoneID(*(void **)(*((void *)&v20 + 1) + 8 * i), v9, v10);
        if (v15) {
          objc_msgSend_addObject_(v3, v14, (uint64_t)v15);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }

  v18 = objc_msgSend_allObjects(v3, v16, v17);

  return v18;
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
  uint64_t v271 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v263 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  long long v266 = 0u;
  objc_msgSend_recordIDs(self, v4, v5);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v245 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v263, v270, 16);
  if (v245)
  {
    uint64_t v244 = *(void *)v264;
    v246 = self;
    v242 = v3;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v264 != v244) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v263 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend_operationType(self, v7, v8);
      id v13 = objc_msgSend_operationRequestWithType_(self, v12, v11);
      if (objc_msgSend_requiresCKAnonymousUserIDs(self, v14, v15))
      {
        v18 = objc_msgSend_zoneID(v10, v16, v17);
        long long v21 = objc_msgSend_anonymousCKUserID(v18, v19, v20);

        if (!v21)
        {
          v224 = v3;
          v225 = objc_opt_new();
          v227 = objc_msgSend_stringWithFormat_(NSString, v226, @"An anonymousCKUserID is required to fetch %@ in the shared database when using anonymous to server share participants", v10);
          objc_msgSend_setObject_forKeyedSubscript_(v225, v228, (uint64_t)v227, *MEMORY[0x1E4F28568]);
          v231 = objc_msgSend_operation(self, v229, v230);
          v234 = objc_msgSend_topmostParentOperation(v231, v232, v233);

          v238 = objc_msgSend_operationID(v234, v235, v236);
          if (v238) {
            objc_msgSend_setObject_forKeyedSubscript_(v225, v237, (uint64_t)v238, *MEMORY[0x1E4F19C50]);
          }
          v239 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v237, *MEMORY[0x1E4F19DD8], 5015, v225);
          objc_msgSend_finishWithError_(self, v240, (uint64_t)v239);

          id v223 = 0;
          v3 = v224;
          goto LABEL_55;
        }
        objc_super v24 = objc_msgSend_zoneID(v10, v22, v23);
        v27 = objc_msgSend_anonymousCKUserID(v24, v25, v26);
        v30 = objc_msgSend_CKDPIdentifier_User(v27, v28, v29);
        v33 = objc_msgSend_request(v13, v31, v32);
        objc_msgSend_setAnonymousCKUserID_(v33, v34, (uint64_t)v30);
      }
      uint64_t v248 = v9;
      v35 = objc_opt_new();
      objc_msgSend_setRecordRetrieveRequest_(v13, v36, (uint64_t)v35);

      v39 = objc_msgSend_translator(self, v37, v38);
      v41 = objc_msgSend_pRecordIdentifierFromRecordID_(v39, v40, (uint64_t)v10);
      v44 = objc_msgSend_recordRetrieveRequest(v13, v42, v43);
      objc_msgSend_setRecordIdentifier_(v44, v45, (uint64_t)v41);

      v48 = objc_msgSend_recordIDsToVersionETags(self, v46, v47);
      v50 = objc_msgSend_objectForKeyedSubscript_(v48, v49, (uint64_t)v10);
      v53 = objc_msgSend_recordRetrieveRequest(v13, v51, v52);
      objc_msgSend_setVersionETag_(v53, v54, (uint64_t)v50);

      v57 = objc_msgSend_recordIDsToETags(self, v55, v56);
      uint64_t v247 = (uint64_t)v10;
      v59 = objc_msgSend_objectForKeyedSubscript_(v57, v58, (uint64_t)v10);
      v62 = objc_msgSend_recordRetrieveRequest(v13, v60, v61);
      objc_msgSend_setClientVersionETag_(v62, v63, (uint64_t)v59);

      v66 = objc_msgSend_desiredKeys(self, v64, v65);

      if (v66)
      {
        v69 = objc_opt_new();
        v72 = objc_msgSend_recordRetrieveRequest(v13, v70, v71);
        objc_msgSend_setRequestedFields_(v72, v73, (uint64_t)v69);

        long long v261 = 0u;
        long long v262 = 0u;
        long long v259 = 0u;
        long long v260 = 0u;
        v76 = objc_msgSend_desiredKeys(self, v74, v75);
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v259, v269, 16);
        if (v78)
        {
          uint64_t v79 = v78;
          uint64_t v80 = *(void *)v260;
          do
          {
            for (uint64_t i = 0; i != v79; ++i)
            {
              if (*(void *)v260 != v80) {
                objc_enumerationMutation(v76);
              }
              uint64_t v82 = *(void *)(*((void *)&v259 + 1) + 8 * i);
              v83 = objc_opt_new();
              objc_msgSend_setName_(v83, v84, v82);
              v87 = objc_msgSend_recordRetrieveRequest(v13, v85, v86);
              v90 = objc_msgSend_requestedFields(v87, v88, v89);
              objc_msgSend_addFields_(v90, v91, (uint64_t)v83);
            }
            uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v92, (uint64_t)&v259, v269, 16);
          }
          while (v79);
        }

        self = v246;
      }
      v93 = objc_msgSend_desiredIndexedListKeys(self, v67, v68);
      uint64_t v96 = objc_msgSend_count(v93, v94, v95);

      if (v96)
      {
        v99 = objc_msgSend_requestedListFieldsForDesiredIndexedListKeys(self, v97, v98);
        v257[0] = MEMORY[0x1E4F143A8];
        v257[1] = 3221225472;
        v257[2] = sub_1C500F0DC;
        v257[3] = &unk_1E64F8848;
        id v258 = v13;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v99, v100, (uint64_t)v257);
      }
      v101 = objc_msgSend_assetFieldNamesToPublishURLs(self, v97, v98);

      if (v101)
      {
        v104 = objc_opt_new();
        v107 = objc_msgSend_recordRetrieveRequest(v13, v105, v106);
        objc_msgSend_setGetAssetURL_(v107, v108, (uint64_t)v104);

        v109 = objc_opt_new();
        long long v253 = 0u;
        long long v254 = 0u;
        long long v255 = 0u;
        long long v256 = 0u;
        v112 = objc_msgSend_assetFieldNamesToPublishURLs(self, v110, v111);
        uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v113, (uint64_t)&v253, v268, 16);
        if (v114)
        {
          uint64_t v115 = v114;
          uint64_t v116 = *(void *)v254;
          do
          {
            for (uint64_t j = 0; j != v115; ++j)
            {
              if (*(void *)v254 != v116) {
                objc_enumerationMutation(v112);
              }
              uint64_t v118 = *(void *)(*((void *)&v253 + 1) + 8 * j);
              v119 = objc_opt_new();
              objc_msgSend_setName_(v119, v120, v118);
              objc_msgSend_addFields_(v109, v121, (uint64_t)v119);
            }
            uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v122, (uint64_t)&v253, v268, 16);
          }
          while (v115);
        }

        v125 = objc_msgSend_recordRetrieveRequest(v13, v123, v124);
        v128 = objc_msgSend_getAssetURL(v125, v126, v127);
        objc_msgSend_setAssetFields_(v128, v129, (uint64_t)v109);

        self = v246;
        uint64_t v132 = objc_msgSend_requestedTTL(v246, v130, v131);
        v135 = objc_msgSend_recordRetrieveRequest(v13, v133, v134);
        v138 = objc_msgSend_getAssetURL(v135, v136, v137);
        objc_msgSend_setRequestedTTL_(v138, v139, v132);

        if (objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v246, v140, v141))
        {
          v144 = objc_msgSend_recordRetrieveRequest(v13, v142, v143);
          objc_msgSend_setRequestEncryptedAssetUserIdentifiers_(v144, v145, 1);
        }
        if (objc_msgSend_URLOptions(v246, v142, v143)) {
          unsigned int v148 = 2;
        }
        else {
          unsigned int v148 = 1;
        }
        if ((objc_msgSend_URLOptions(v246, v146, v147) & 2) != 0) {
          uint64_t v151 = 4;
        }
        else {
          uint64_t v151 = v148;
        }
        v152 = objc_msgSend_recordRetrieveRequest(v13, v149, v150);
        v155 = objc_msgSend_getAssetURL(v152, v153, v154);
        objc_msgSend_setType_(v155, v156, v151);
      }
      v157 = objc_msgSend_desiredAssetKeys(self, v102, v103);
      uint64_t v160 = objc_msgSend_count(v157, v158, v159);

      if (v160) {
        break;
      }
      if (objc_msgSend_shouldFetchAssetContent(self, v161, v162))
      {
        v199 = objc_opt_new();
        v202 = objc_msgSend_recordRetrieveRequest(v13, v200, v201);
        objc_msgSend_setAssetsToDownload_(v202, v203, (uint64_t)v199);

        uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v204, v205);
        v178 = objc_msgSend_recordRetrieveRequest(v13, v207, v208);
        v211 = objc_msgSend_assetsToDownload(v178, v209, v210);
        objc_msgSend_setAllAssets_(v211, v212, AssetContent);

LABEL_48:
      }
      objc_msgSend_addObject_(v3, v198, (uint64_t)v13);
      v215 = objc_msgSend_recordIDByRequestID(self, v213, v214);
      v218 = objc_msgSend_request(v13, v216, v217);
      v221 = objc_msgSend_operationUUID(v218, v219, v220);
      objc_msgSend_setObject_forKeyedSubscript_(v215, v222, v247, v221);

      uint64_t v9 = v248 + 1;
      if (v248 + 1 == v245)
      {
        uint64_t v245 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v263, v270, 16);
        if (v245) {
          goto LABEL_3;
        }
        goto LABEL_51;
      }
    }
    v163 = objc_opt_new();
    v166 = objc_msgSend_recordRetrieveRequest(v13, v164, v165);
    objc_msgSend_setAssetsToDownload_(v166, v167, (uint64_t)v163);

    v168 = objc_opt_new();
    v171 = objc_msgSend_recordRetrieveRequest(v13, v169, v170);
    v174 = objc_msgSend_assetsToDownload(v171, v172, v173);
    objc_msgSend_setAssetFields_(v174, v175, (uint64_t)v168);

    long long v251 = 0u;
    long long v252 = 0u;
    long long v249 = 0u;
    long long v250 = 0u;
    v178 = objc_msgSend_desiredAssetKeys(self, v176, v177);
    uint64_t v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v179, (uint64_t)&v249, v267, 16);
    if (v180)
    {
      uint64_t v181 = v180;
      uint64_t v182 = *(void *)v250;
      do
      {
        for (uint64_t k = 0; k != v181; ++k)
        {
          if (*(void *)v250 != v182) {
            objc_enumerationMutation(v178);
          }
          uint64_t v184 = *(void *)(*((void *)&v249 + 1) + 8 * k);
          v185 = objc_opt_new();
          objc_msgSend_setName_(v185, v186, v184);
          v189 = objc_msgSend_recordRetrieveRequest(v13, v187, v188);
          v192 = objc_msgSend_assetsToDownload(v189, v190, v191);
          v195 = objc_msgSend_assetFields(v192, v193, v194);
          objc_msgSend_addFields_(v195, v196, (uint64_t)v185);
        }
        uint64_t v181 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v197, (uint64_t)&v249, v267, 16);
      }
      while (v181);
      v3 = v242;
      self = v246;
    }
    goto LABEL_48;
  }
LABEL_51:

  id v223 = v3;
LABEL_55:

  return v223;
}

- (id)requestedListFieldsForDesiredIndexedListKeys
{
  id v4 = self;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v5 = objc_msgSend_desiredIndexedListKeys(self, a2, v2);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v38, v44, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    id v37 = 0;
    uint64_t v9 = *(void *)v39;
    v35 = v5;
    v36 = v4;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * v10);
        uint64_t v12 = CKProcessIndexedArrayKey();
        id v13 = 0;
        uint64_t v15 = v13;
        if (v12)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v16 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v43 = v11;
            _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "Invalid desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, v4, @"CKDFetchRecordsURLRequest.m", 197, @"Invalid desired key %@, which should have been caught earlier", v11);
        }
        else if (v13)
        {
          long long v21 = v37;
          uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v37, v14, (uint64_t)v13);
          if (v22)
          {
            id v19 = (id)v22;
          }
          else
          {
            v27 = objc_opt_new();
            objc_msgSend_setName_(v27, v28, (uint64_t)v15);
            uint64_t v29 = objc_opt_new();
            objc_msgSend_setFieldId_(v29, v30, (uint64_t)v27);
            id v19 = v29;
            if (!v37)
            {
              long long v21 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v31, v32);
            }
            objc_msgSend_setObject_forKeyedSubscript_(v21, v31, (uint64_t)v19, v15);
          }
          id v37 = v21;
          uint64_t v5 = v35;
          id v4 = v36;
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v23 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v43 = v11;
            _os_log_error_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_ERROR, "Non-indexed desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v24, v25);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v26, (uint64_t)a2, v4, @"CKDFetchRecordsURLRequest.m", 200, @"Non-indexed desired key %@, which should have been caught earlier", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v33, (uint64_t)&v38, v44, 16);
    }
    while (v8);
  }
  else
  {
    id v37 = 0;
  }

  return v37;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_recordIDByRequestID(self, v6, v7);
  uint64_t v11 = objc_msgSend_response(v5, v9, v10);
  id v14 = objc_msgSend_operationUUID(v11, v12, v13);
  id v16 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);

  if (!v16)
  {
    v178 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v178, v179, (uint64_t)a2, self, @"CKDFetchRecordsURLRequest.m", 257, @"Expected non-nil recordID for %@", v5);
  }
  if (!objc_msgSend_hasRecordRetrieveResponse(v5, v17, v18))
  {
LABEL_23:
    uint64_t v151 = 0;
    uint64_t v45 = 0;
    uint64_t v47 = 0;
    goto LABEL_26;
  }
  long long v21 = objc_msgSend_recordRetrieveResponse(v5, v19, v20);
  unsigned int v24 = objc_msgSend_clientVersionETagMatch(v21, v22, v23);

  v27 = objc_msgSend_recordRetrieveResponse(v5, v25, v26);
  v30 = objc_msgSend_record(v27, v28, v29);

  if (!v30)
  {
    if (v24)
    {
      uint64_t v45 = 0;
      uint64_t v47 = 0;
      uint64_t v151 = 1;
      goto LABEL_26;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v152 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
    {
      v174 = v152;
      uint64_t v177 = objc_msgSend_requestUUID(self, v175, v176);
      *(_DWORD *)buf = 138543618;
      v189 = v177;
      __int16 v190 = 2114;
      uint64_t v191 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v174, OS_LOG_TYPE_ERROR, "req: %{public}@, \"The response for recordID %{public}@ doesn't contain the record\"", buf, 0x16u);
    }
    goto LABEL_23;
  }
  unsigned int v186 = v24;
  v31 = objc_msgSend_translator(self, v19, v20);
  v34 = objc_msgSend_recordRetrieveResponse(v5, v32, v33);
  id v37 = objc_msgSend_record(v34, v35, v36);
  long long v40 = objc_msgSend_zoneID(v16, v38, v39);
  uint64_t v43 = objc_msgSend_anonymousCKUserID(v40, v41, v42);
  id v187 = 0;
  uint64_t v45 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v31, v44, (uint64_t)v37, v43, &v187);
  id v46 = v187;

  uint64_t v47 = v46;
  if (!v45 && v46)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v50 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v164 = v50;
      v167 = objc_msgSend_result(v5, v165, v166);
      uint64_t v170 = objc_msgSend_result(v5, v168, v169);
      uint64_t v173 = objc_msgSend_error(v170, v171, v172);
      *(_DWORD *)buf = 138412546;
      v189 = v167;
      __int16 v190 = 2114;
      uint64_t v191 = v173;
      _os_log_error_impl(&dword_1C4CFF000, v164, OS_LOG_TYPE_ERROR, "Invalid data in server protobuf, ignoring response. Server response was: %@, error: %{public}@", buf, 0x16u);
    }
    v53 = objc_msgSend_result(v5, v51, v52);
    objc_msgSend_setCode_(v53, v54, 3);

    v55 = objc_opt_new();
    v58 = objc_msgSend_result(v5, v56, v57);
    objc_msgSend_setError_(v58, v59, (uint64_t)v55);

    v60 = objc_opt_new();
    v63 = objc_msgSend_result(v5, v61, v62);
    v66 = objc_msgSend_error(v63, v64, v65);
    objc_msgSend_setClientError_(v66, v67, (uint64_t)v60);

    v70 = objc_msgSend_result(v5, v68, v69);
    v73 = objc_msgSend_error(v70, v71, v72);
    v76 = objc_msgSend_clientError(v73, v74, v75);
    objc_msgSend_setType_(v76, v77, 7);

    uint64_t v80 = objc_msgSend_result(v5, v78, v79);
    v83 = objc_msgSend_error(v80, v81, v82);
    objc_msgSend_setErrorKey_(v83, v84, @"Invalid record");

    v85 = NSString;
    v88 = objc_msgSend_localizedDescription(v46, v86, v87);
    v90 = objc_msgSend_stringWithFormat_(v85, v89, @"Failed to read server response: %@", v88);
    v93 = objc_msgSend_result(v5, v91, v92);
    uint64_t v96 = objc_msgSend_error(v93, v94, v95);
    objc_msgSend_setErrorDescription_(v96, v97, (uint64_t)v90);
  }
  uint64_t v98 = objc_msgSend_recordID(v45, v48, v49);
  v101 = objc_msgSend_zoneID(v98, v99, v100);
  v104 = objc_msgSend_zoneID(v16, v102, v103);
  char isEqual = objc_msgSend_isEqual_(v101, v105, (uint64_t)v104);

  if ((isEqual & 1) == 0)
  {
    id v185 = v46;
    v109 = objc_msgSend_zoneID(v16, v107, v108);
    v112 = objc_msgSend_ownerName(v109, v110, v111);
    uint64_t v113 = *MEMORY[0x1E4F19C08];
    int isEqualToString = objc_msgSend_isEqualToString_(v112, v114, *MEMORY[0x1E4F19C08]);

    uint64_t v118 = objc_msgSend_recordID(v45, v116, v117);
    v121 = objc_msgSend_zoneID(v118, v119, v120);
    uint64_t v124 = objc_msgSend_ownerName(v121, v122, v123);
    int v126 = objc_msgSend_isEqualToString_(v124, v125, v113);

    v129 = objc_msgSend_recordID(v45, v127, v128);
    uint64_t v132 = objc_msgSend_recordName(v129, v130, v131);
    v135 = objc_msgSend_recordName(v16, v133, v134);
    if (objc_msgSend_isEqualToString_(v132, v136, (uint64_t)v135))
    {
      int v180 = v126;
      int v181 = isEqualToString;
      uint64_t v184 = objc_msgSend_recordID(v45, v137, v138);
      v183 = objc_msgSend_zoneID(v184, v139, v140);
      uint64_t v143 = objc_msgSend_zoneName(v183, v141, v142);
      v146 = objc_msgSend_zoneID(v16, v144, v145);
      v149 = objc_msgSend_zoneName(v146, v147, v148);
      int v182 = objc_msgSend_isEqualToString_(v143, v150, (uint64_t)v149);

      uint64_t v47 = v185;
      if (v182 && v181 != v180) {
        objc_msgSend_setRecordID_(v45, v107, (uint64_t)v16);
      }
    }
    else
    {

      uint64_t v47 = v185;
    }
  }
  objc_msgSend_updateShareIDCacheWithRecord_(self, v107, (uint64_t)v45);
  uint64_t v151 = v186;
LABEL_26:
  v153 = objc_msgSend_recordFetchedBlock(self, v19, v20);

  if (v153)
  {
    objc_msgSend_recordFetchedBlock(self, v154, v155);
    v156 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v159 = objc_msgSend_result(v5, v157, v158);
    ((void (**)(void, void *, void *, uint64_t, void *))v156)[2](v156, v45, v16, v151, v159);
  }
  uint64_t v160 = objc_msgSend_recordCount(self, v154, v155);
  objc_msgSend_setRecordCount_(self, v161, v160 + 1);
  id v162 = v47;

  return v162;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v61 = a3;
  uint64_t v6 = objc_msgSend_response(v61, v4, v5);
  uint64_t v9 = objc_msgSend_operationUUID(v6, v7, v8);
  if (v9)
  {
    uint64_t v12 = (void *)v9;
    uint64_t v13 = objc_msgSend_recordIDByRequestID(self, v10, v11);
    id v16 = objc_msgSend_response(v61, v14, v15);
    id v19 = objc_msgSend_operationUUID(v16, v17, v18);
    long long v21 = objc_msgSend_objectForKeyedSubscript_(v13, v20, (uint64_t)v19);

    if (v21)
    {
      unsigned int v24 = objc_msgSend_recordFetchedBlock(self, v22, v23);

      if (!v24) {
        goto LABEL_15;
      }
      objc_msgSend_recordFetchedBlock(self, v25, v26);
      v27 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_result(v61, v28, v29);
      ((void (**)(void, void, void *, void, void *))v27)[2](v27, 0, v21, 0, v30);
      goto LABEL_13;
    }
  }
  else
  {
  }
  v31 = objc_msgSend_result(v61, v22, v23);
  v34 = objc_msgSend_error(v31, v32, v33);
  if (objc_msgSend_hasClientError(v34, v35, v36))
  {
    uint64_t v39 = objc_msgSend_result(v61, v37, v38);
    uint64_t v42 = objc_msgSend_error(v39, v40, v41);
    uint64_t v45 = objc_msgSend_clientError(v42, v43, v44);
    int v48 = objc_msgSend_type(v45, v46, v47);

    if (v48 == 4)
    {
      v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F19DD8];
      objc_msgSend_result(v61, v49, v50);
      v27 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v30 = sub_1C4E940D0(self, v27);
      v54 = objc_msgSend_errorWithDomain_code_userInfo_(v51, v53, v52, 2006, v30);
      objc_msgSend_finishWithError_(self, v55, (uint64_t)v54);

LABEL_12:
      long long v21 = 0;
LABEL_13:

      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v56 = objc_msgSend_recordFetchedBlock(self, v49, v50);

  if (v56)
  {
    objc_msgSend_recordFetchedBlock(self, v57, v58);
    v27 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_result(v61, v59, v60);
    ((void (**)(void, void, void, void, void *))v27)[2](v27, 0, 0, 0, v30);
    goto LABEL_12;
  }
  long long v21 = 0;
LABEL_15:
}

- (NSSet)assetFieldNamesToPublishURLs
{
  return self->_assetFieldNamesToPublishURLs;
}

- (void)setAssetFieldNamesToPublishURLs:(id)a3
{
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void)setDesiredAssetKeys:(id)a3
{
}

- (NSArray)desiredIndexedListKeys
{
  return self->_desiredIndexedListKeys;
}

- (void)setDesiredIndexedListKeys:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_BOOL shouldFetchAssetContent = a3;
}

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSDictionary)recordIDsToETags
{
  return self->_recordIDsToETags;
}

- (void)setRecordIDsToETags:(id)a3
{
}

- (NSDictionary)recordIDsToVersionETags
{
  return self->_recordIDsToVersionETags;
}

- (void)setRecordIDsToVersionETags:(id)a3
{
}

- (unint64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(unint64_t)a3
{
  self->_recordCount = a3;
}

- (NSMutableDictionary)recordIDByRequestID
{
  return self->_recordIDByRequestID;
}

- (void)setRecordIDByRequestID:(id)a3
{
}

- (NSSet)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDByRequestID, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
  objc_storeStrong((id *)&self->_desiredIndexedListKeys, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, 0);
}

@end