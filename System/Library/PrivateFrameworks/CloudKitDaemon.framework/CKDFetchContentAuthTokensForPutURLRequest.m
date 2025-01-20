@interface CKDFetchContentAuthTokensForPutURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)useEncryption;
- (CKDAssetTokenRequest)assetTokenRequest;
- (CKDFetchContentAuthTokensForPutURLRequest)initWithOperation:(id)a3 assetTokenRequest:(id)a4 headers:(id)a5;
- (NSDictionary)headers;
- (NSMapTable)transactionStateByRequestIDs;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAssetTokenRequest:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setTransactionStateByRequestIDs:(id)a3;
- (void)setUseEncryption:(BOOL)a3;
@end

@implementation CKDFetchContentAuthTokensForPutURLRequest

- (CKDFetchContentAuthTokensForPutURLRequest)initWithOperation:(id)a3 assetTokenRequest:(id)a4 headers:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKDFetchContentAuthTokensForPutURLRequest;
  v11 = [(CKDURLRequest *)&v14 initWithOperation:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetTokenRequest, a4);
    objc_storeStrong((id *)&v12->_headers, a5);
  }

  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchContentAuthTokensForPutURLRequest;
  [(CKDURLRequest *)&v3 fillOutEquivalencyPropertiesBuilder:a3];
}

- (void)fillOutRequestProperties:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchContentAuthTokensForPutURLRequest;
  [(CKDURLRequest *)&v3 fillOutRequestProperties:a3];
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  objc_super v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)generateRequestOperations
{
  uint64_t v256 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_translator(self, a2, v2);
  v7 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v5, v6);
  objc_msgSend_setTransactionStateByRequestIDs_(self, v8, (uint64_t)v7);

  id v211 = (id)objc_opt_new();
  v212 = self;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  v11 = objc_msgSend_successfulBatches(self->_assetTokenRequest, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v248, v255, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v249;
    v206 = v234;
    v226 = v4;
    v207 = v11;
    uint64_t v209 = *(void *)v249;
    do
    {
      uint64_t v15 = 0;
      uint64_t v208 = v13;
      do
      {
        if (*(void *)v249 != v14)
        {
          uint64_t v16 = v15;
          objc_enumerationMutation(v11);
          uint64_t v15 = v16;
        }
        uint64_t v210 = v15;
        v17 = *(void **)(*((void *)&v248 + 1) + 8 * v15);
        v232 = objc_opt_new();
        objc_msgSend_setAssetBatch_(v232, v18, (uint64_t)v17, v206);
        v216 = objc_opt_new();
        long long v244 = 0u;
        long long v245 = 0u;
        long long v246 = 0u;
        long long v247 = 0u;
        objc_msgSend_assetRecords(v17, v19, v20);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v214 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v244, v254, 16);
        if (v214)
        {
          uint64_t v215 = *(void *)v245;
          v220 = v17;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v245 != v215) {
                objc_enumerationMutation(obj);
              }
              uint64_t v218 = v22;
              v23 = *(void **)(*((void *)&v244 + 1) + 8 * v22);
              v24 = objc_opt_new();
              v27 = objc_msgSend_recordID(v23, v25, v26);
              v29 = objc_msgSend_pRecordIdentifierFromRecordID_(v4, v28, (uint64_t)v27);
              objc_msgSend_setRecordId_(v24, v30, (uint64_t)v29);

              v31 = objc_opt_new();
              v34 = objc_msgSend_recordType(v23, v32, v33);
              objc_msgSend_setName_(v31, v35, (uint64_t)v34);

              v217 = v31;
              objc_msgSend_setType_(v24, v36, (uint64_t)v31);
              id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v222 = v24;
              objc_msgSend_setAssetFields_(v24, v38, (uint64_t)v37);

              v229 = v23;
              v41 = objc_msgSend_allRecordKeys(v23, v39, v40);
              long long v240 = 0u;
              long long v241 = 0u;
              long long v242 = 0u;
              long long v243 = 0u;
              id v219 = v41;
              uint64_t v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v219, v42, (uint64_t)&v240, v253, 16);
              if (v223)
              {
                uint64_t v221 = *(void *)v241;
                do
                {
                  uint64_t v44 = 0;
                  do
                  {
                    if (*(void *)v241 != v221) {
                      objc_enumerationMutation(v219);
                    }
                    uint64_t v45 = *(void *)(*((void *)&v240 + 1) + 8 * v44);
                    v46 = objc_msgSend_allRegularAndSectionAndRereferenceItemsWithRecordKey_(v229, v43, v45);
                    if (!objc_msgSend_count(v46, v47, v48)) {
                      __assert_rtn("-[CKDFetchContentAuthTokensForPutURLRequest generateRequestOperations]", "CKDFetchContentAuthTokensForPutURLRequest.m", 96, "items.count");
                    }
                    uint64_t v225 = v44;
                    v49 = objc_opt_new();
                    v50 = objc_opt_new();
                    objc_msgSend_setName_(v50, v51, v45);
                    v224 = v50;
                    objc_msgSend_setField_(v49, v52, (uint64_t)v50);
                    id v53 = objc_alloc(MEMORY[0x1E4F1CA48]);
                    uint64_t v56 = objc_msgSend_count(v46, v54, v55);
                    v58 = objc_msgSend_initWithCapacity_(v53, v57, v56);
                    v230 = v49;
                    objc_msgSend_setAssets_(v49, v59, (uint64_t)v58);

                    long long v238 = 0u;
                    long long v239 = 0u;
                    long long v236 = 0u;
                    long long v237 = 0u;
                    id v227 = v46;
                    uint64_t v231 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v60, (uint64_t)&v236, v252, 16);
                    if (v231)
                    {
                      uint64_t v228 = *(void *)v237;
                      do
                      {
                        for (uint64_t i = 0; i != v231; ++i)
                        {
                          if (*(void *)v237 != v228) {
                            objc_enumerationMutation(v227);
                          }
                          v62 = *(void **)(*((void *)&v236 + 1) + 8 * i);
                          v63 = objc_opt_new();
                          v66 = objc_msgSend_recordID(v229, v64, v65);
                          v68 = objc_msgSend_pRecordIdentifierFromRecordID_(v4, v67, (uint64_t)v66);
                          objc_msgSend_setRecordId_(v63, v69, (uint64_t)v68);

                          v72 = objc_msgSend_signature(v62, v70, v71);
                          objc_msgSend_setSignature_(v63, v73, (uint64_t)v72);

                          uint64_t v77 = objc_msgSend_paddedFileSize(v62, v74, v75);
                          if (!v77) {
                            uint64_t v77 = objc_msgSend_fileSize(v62, v76, 0);
                          }
                          objc_msgSend_setSize_(v63, v76, v77);
                          v80 = objc_msgSend_referenceSignature(v62, v78, v79);
                          objc_msgSend_setReferenceSignature_(v63, v81, (uint64_t)v80);

                          v84 = objc_msgSend_wrappedAssetKey(v62, v82, v83);

                          if (v84)
                          {
                            v87 = objc_opt_new();
                            objc_msgSend_setProtectionInfo_(v63, v88, (uint64_t)v87);

                            v91 = objc_msgSend_wrappedAssetKey(v62, v89, v90);
                            v94 = objc_msgSend_protectionInfo(v63, v92, v93);
                            objc_msgSend_setProtectionInfo_(v94, v95, (uint64_t)v91);
                          }
                          v96 = objc_msgSend_clearAssetKey(v62, v85, v86);

                          if (v96)
                          {
                            v99 = objc_msgSend_clearAssetKey(v62, v97, v98);
                            objc_msgSend_setClearAssetKey_(v63, v100, (uint64_t)v99);
                          }
                          v101 = objc_msgSend_assets(v230, v97, v98);
                          objc_msgSend_addObject_(v101, v102, (uint64_t)v63);

                          v103 = [CKDAssetID alloc];
                          v106 = objc_msgSend_recordId(v63, v104, v105);
                          v109 = objc_msgSend_signature(v63, v107, v108);
                          v112 = objc_msgSend_referenceSignature(v63, v110, v111);
                          v113 = (void *)MEMORY[0x1E4F28ED0];
                          uint64_t v116 = objc_msgSend_size(v63, v114, v115);
                          v118 = objc_msgSend_numberWithLongLong_(v113, v117, v116);
                          v120 = objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v103, v119, (uint64_t)v106, v109, v112, v118);

                          v123 = objc_msgSend_itemsByAssetId(v232, v121, v122);
                          v125 = objc_msgSend_objectForKeyedSubscript_(v123, v124, (uint64_t)v120);

                          if (!v125)
                          {
                            v125 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v126, v127);
                            v130 = objc_msgSend_itemsByAssetId(v232, v128, v129);
                            objc_msgSend_setObject_forKeyedSubscript_(v130, v131, (uint64_t)v125, v120);
                          }
                          objc_msgSend_addObject_(v125, v126, (uint64_t)v62);
                          if (_os_feature_enabled_impl())
                          {
                            v132 = [CKDAssetID alloc];
                            v135 = objc_msgSend_recordId(v63, v133, v134);
                            v138 = objc_msgSend_signature(v63, v136, v137);
                            v139 = (void *)MEMORY[0x1E4F28ED0];
                            uint64_t v142 = objc_msgSend_size(v63, v140, v141);
                            v144 = objc_msgSend_numberWithLongLong_(v139, v143, v142);
                            v146 = objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v132, v145, (uint64_t)v135, v138, 0, v144);

                            v149 = objc_msgSend_itemsByAssetIdIgnoreRefSignature(v232, v147, v148);
                            v151 = objc_msgSend_objectForKeyedSubscript_(v149, v150, (uint64_t)v146);

                            if (!v151)
                            {
                              v151 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v152, v153);
                              v156 = objc_msgSend_itemsByAssetIdIgnoreRefSignature(v232, v154, v155);
                              objc_msgSend_setObject_forKeyedSubscript_(v156, v157, (uint64_t)v151, v146);
                            }
                            objc_msgSend_addObject_(v151, v152, (uint64_t)v62);

                            v4 = v226;
                          }
                        }
                        uint64_t v231 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v158, (uint64_t)&v236, v252, 16);
                      }
                      while (v231);
                    }

                    v161 = objc_msgSend_assetFields(v222, v159, v160);
                    objc_msgSend_addObject_(v161, v162, (uint64_t)v230);

                    uint64_t v44 = v225 + 1;
                    v17 = v220;
                  }
                  while (v225 + 1 != v223);
                  uint64_t v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v219, v43, (uint64_t)&v240, v253, 16);
                }
                while (v223);
              }

              objc_msgSend_addObject_(v216, v163, (uint64_t)v222);
              uint64_t v22 = v218 + 1;
            }
            while (v218 + 1 != v214);
            uint64_t v214 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v164, (uint64_t)&v244, v254, 16);
          }
          while (v214);
        }

        uint64_t v167 = objc_msgSend_operationType(v212, v165, v166);
        v169 = objc_msgSend_operationRequestWithType_(v212, v168, v167);
        v170 = objc_opt_new();
        objc_msgSend_setAssetUploadTokenRetrieveRequest_(v169, v171, (uint64_t)v170);
        objc_msgSend_setUploads_(v170, v172, (uint64_t)v216);
        v175 = objc_msgSend_authPutRequest(v17, v173, v174);
        objc_msgSend_setAuthPutRequest_(v170, v176, (uint64_t)v175);

        if (_os_feature_enabled_impl()) {
          objc_msgSend_setOptions_(v170, v177, 1);
        }
        v179 = objc_msgSend_assetZone(v17, v177, v178);
        v182 = objc_msgSend_assetZoneKey(v179, v180, v181);
        uint64_t v185 = objc_msgSend_authPutType(v182, v183, v184);

        if (v185 != 3 || (objc_msgSend_useMMCSEncryptionV2(v17, v186, v187) & 1) == 0)
        {
          v188 = objc_msgSend_authPutRequest(v17, v186, v187);
          objc_msgSend_setAuthPutRequest_(v170, v189, (uint64_t)v188);
        }
        objc_msgSend_setAuthPutType_(v170, v186, v185);
        headers = v212->_headers;
        v233[0] = MEMORY[0x1E4F143A8];
        v233[1] = 3221225472;
        v234[0] = sub_1C4DFC6C8;
        v234[1] = &unk_1E64F2790;
        id v235 = v170;
        id v191 = v170;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(headers, v192, (uint64_t)v233);
        v195 = objc_msgSend_transactionStateByRequestIDs(v212, v193, v194);
        v198 = objc_msgSend_request(v169, v196, v197);
        v201 = objc_msgSend_operationUUID(v198, v199, v200);
        objc_msgSend_setObject_forKey_(v195, v202, (uint64_t)v232, v201);

        objc_msgSend_addObject_(v211, v203, (uint64_t)v169);
        uint64_t v14 = v209;
        uint64_t v15 = v210 + 1;
        v11 = v207;
      }
      while (v210 + 1 != v208);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v207, v204, (uint64_t)&v248, v255, 16);
      uint64_t v14 = v209;
    }
    while (v13);
  }

  return v211;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v447 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_response(v4, v5, v6);
  uint64_t v10 = objc_msgSend_operationUUID(v7, v8, v9);

  if (!v10)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 1000, @"Missing operationUUID on %@", v4);
    v73 = LABEL_33:;
    goto LABEL_126;
  }
  if ((objc_msgSend_hasAssetUploadTokenRetrieveResponse(v4, v11, v12) & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 1000, @"Missing AssetUploadTokenRetrieveResponse on %@", v4);
    goto LABEL_33;
  }
  uint64_t v15 = objc_msgSend_assetUploadTokenRetrieveResponse(v4, v13, v14);
  v18 = objc_msgSend_transactionStateByRequestIDs(self, v16, v17);
  uint64_t v20 = objc_msgSend_objectForKey_(v18, v19, (uint64_t)v10);

  if (!v20)
  {
    v73 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 1000, @"Can't find transactionState for %@", v10);
    goto LABEL_125;
  }
  v25 = objc_msgSend_assetBatch(v20, v21, v22);
  if (!v25)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 1000, @"Can't find assetBatch for %@", v10);
    v73 = LABEL_123:;
    goto LABEL_124;
  }
  uint64_t v26 = objc_msgSend_authPutResponse(v15, v23, v24);
  objc_msgSend_setAuthPutResponse_(v25, v27, (uint64_t)v26);

  v405 = v25;
  v406 = v10;
  v403 = v15;
  v409 = v20;
  v413 = self;
  id v400 = v4;
  if (objc_msgSend_contentResponseHeadersCount(v15, v28, v29))
  {
    v32 = objc_opt_new();
    long long v433 = 0u;
    long long v434 = 0u;
    long long v435 = 0u;
    long long v436 = 0u;
    v35 = objc_msgSend_contentResponseHeaders(v15, v33, v34);
    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v433, v446, 16);
    if (v37)
    {
      uint64_t v40 = v37;
      v41 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
      uint64_t v42 = *(void *)v434;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v434 != v42) {
            objc_enumerationMutation(v35);
          }
          uint64_t v44 = *(void **)(*((void *)&v433 + 1) + 8 * v43);
          uint64_t v45 = objc_msgSend_headerKey(v44, v38, v39);
          uint64_t v48 = objc_msgSend_headerValue(v44, v46, v47);
          v50 = (void *)v48;
          if (v45) {
            BOOL v51 = v48 == 0;
          }
          else {
            BOOL v51 = 1;
          }
          if (v51)
          {
            if (*v41 != -1) {
              dispatch_once(v41, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v52 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              id v53 = v52;
              uint64_t v56 = objc_msgSend_headerKey(v44, v54, v55);
              v59 = objc_msgSend_headerValue(v44, v57, v58);
              *(_DWORD *)buf = 138543619;
              v438 = v56;
              __int16 v439 = 2113;
              v440 = v59;
              _os_log_error_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_ERROR, "Unable to set header %{public}@ with value %{private}@", buf, 0x16u);

              v41 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
            }
          }
          else
          {
            objc_msgSend_setObject_forKey_(v32, v49, v48, v45);
          }

          ++v43;
        }
        while (v40 != v43);
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v433, v446, 16);
      }
      while (v40);
    }

    v25 = v405;
    if (objc_msgSend_count(v32, v60, v61)) {
      objc_msgSend_setAuthPutResponseHeaders_(v405, v62, (uint64_t)v32);
    }

    id v4 = v400;
    uint64_t v10 = v406;
    uint64_t v15 = v403;
    uint64_t v20 = v409;
    self = v413;
  }
  if ((objc_msgSend_useMMCSEncryptionV2(v25, v30, v31) & 1) == 0)
  {
    if (objc_msgSend_isRereferenceAssetBatch(v25, v63, v64))
    {
      uint64_t v65 = objc_msgSend_authPutResponse(v25, v63, v64);

      if (!v65)
      {
        v390 = objc_msgSend_authPutRequest(v25, v63, v64);

        v391 = (void *)*MEMORY[0x1E4F1A548];
        if (v390)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v391);
          }
          v392 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C4CFF000, v392, OS_LOG_TYPE_ERROR, "Server did not return the required authPutResponse even though an authPutRequest was sent.", buf, 2u);
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v393, *MEMORY[0x1E4F19DD8], 1000, @"Server did not return the required authPutResponse even though an authPutRequest was sent. AssetUploadTokenRetrieveResponse on %@", v4);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v391);
          }
          v394 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C4CFF000, v394, OS_LOG_TYPE_ERROR, "Missing authPutRequest.", buf, 2u);
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v395, *MEMORY[0x1E4F19DD8], 1000, @"Missing authPutRequest. AssetUploadTokenRetrieveResponse on %@", v4);
        }
        goto LABEL_123;
      }
    }
  }
  uint64_t v66 = objc_msgSend_authPutRequest(v25, v63, v64);
  if (v66)
  {
    v69 = (void *)v66;
    v70 = objc_msgSend_authPutResponse(v25, v67, v68);
    if (v70)
    {
    }
    else
    {
      char isRereferenceAssetBatch = objc_msgSend_isRereferenceAssetBatch(v25, v71, v72);

      if ((isRereferenceAssetBatch & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v75 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_ERROR, "Server did not return an authPutResponse even though an authPutRequest was sent. While unexpected, this just means the MMCS operation requires a trip to the Content server", buf, 2u);
        }
      }
    }
  }
  uint64_t v76 = objc_msgSend_authPutResponse(v25, v67, v68);
  if (v76)
  {
    uint64_t v79 = (void *)v76;
    v80 = objc_msgSend_authPutResponseHeaders(v25, v77, v78);

    if (!v80)
    {
      id v4 = v400;
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v77, *MEMORY[0x1E4F19DD8], 1000, @"Failed to get headers for authPutResponse AssetUploadTokenRetrieveResponse on %@", v400);
      goto LABEL_123;
    }
  }
  long long v431 = 0u;
  long long v432 = 0u;
  long long v429 = 0u;
  long long v430 = 0u;
  objc_msgSend_uploadTokens(v15, v77, v78);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v429, v445, 16);
  if (!v397) {
    goto LABEL_100;
  }
  uint64_t v398 = *(void *)v430;
  while (2)
  {
    uint64_t v84 = 0;
    do
    {
      if (*(void *)v430 != v398) {
        objc_enumerationMutation(obj);
      }
      uint64_t v404 = v84;
      v85 = *(void **)(*((void *)&v429 + 1) + 8 * v84);
      uint64_t v86 = objc_msgSend_translator(self, v82, v83);
      v89 = objc_msgSend_asset(v85, v87, v88);
      v92 = objc_msgSend_recordId(v89, v90, v91);
      id v428 = 0;
      uint64_t v94 = objc_msgSend_recordIDFromPRecordIdentifier_error_(v86, v93, (uint64_t)v92, &v428);
      id v95 = v428;

      v419 = (void *)v94;
      if (!v94)
      {
        id v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v96, *MEMORY[0x1E4F19DD8], 1000, @"Failed to parse recordID from AssetUploadTokenRetrieveResponseUploadToken on %@ : %@", v400, v95);
        v73 = LABEL_115:;
LABEL_116:

        v25 = v405;
        uint64_t v10 = v406;
        goto LABEL_124;
      }
      uint64_t v98 = objc_msgSend_asset(v85, v96, v97);
      v101 = objc_msgSend_signature(v98, v99, v100);

      if (!v101)
      {
        id v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v102, *MEMORY[0x1E4F19DD8], 1000, @"Missing Asset signature from AssetUploadTokenRetrieveResponseUploadToken on %@", v400);
        goto LABEL_115;
      }
      v104 = objc_msgSend_asset(v85, v102, v103);
      uint64_t v107 = objc_msgSend_size(v104, v105, v106);

      if (!v107)
      {
        id v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v108, *MEMORY[0x1E4F19DD8], 1000, @"Missing Asset size from AssetUploadTokenRetrieveResponseUploadToken on %@", v400);
        goto LABEL_115;
      }
      v110 = objc_msgSend_asset(v85, v108, v109);
      v113 = objc_msgSend_owner(v110, v111, v112);

      if (!v113)
      {
        id v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v114, *MEMORY[0x1E4F19DD8], 1000, @"Missing Asset owner from AssetUploadTokenRetrieveResponseUploadToken on %@", v400);
        goto LABEL_115;
      }
      uint64_t v116 = objc_msgSend_asset(v85, v114, v115);
      v119 = objc_msgSend_requestor(v116, v117, v118);

      if (!v119)
      {
        id v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v120, *MEMORY[0x1E4F19DD8], 1000, @"Missing Asset requestor from AssetUploadTokenRetrieveResponseUploadToken on %@", v400);
        goto LABEL_115;
      }
      uint64_t v122 = objc_msgSend_token(v85, v120, v121);

      if (!v122)
      {
        id v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v123, *MEMORY[0x1E4F19DD8], 1000, @"Missing Asset token from AssetUploadTokenRetrieveResponseUploadToken on %@", v400);
        goto LABEL_115;
      }
      v125 = objc_msgSend_asset(v85, v123, v124);
      v128 = objc_msgSend_contentBaseURL(v125, v126, v127);

      if (!v128)
      {
        id v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v129, *MEMORY[0x1E4F19DD8], 1000, @"Missing Asset contentBaseURL from AssetUploadTokenRetrieveResponseUploadToken on %@", v400);
        goto LABEL_115;
      }
      v402 = v95;
      v131 = (void *)MEMORY[0x1E4F1CB10];
      v132 = objc_msgSend_asset(v85, v129, v130);
      v135 = objc_msgSend_contentBaseURL(v132, v133, v134);
      uint64_t v137 = objc_msgSend_URLWithString_(v131, v136, (uint64_t)v135);

      if (!v137)
      {
        id v4 = v400;
        v73 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v138, *MEMORY[0x1E4F19DD8], 1000, @"Malformed Asset contentBaseURL from AssetUploadTokenRetrieveResponseUploadToken on %@", v400);
LABEL_131:
        id v95 = v402;
        goto LABEL_116;
      }
      if (!_os_feature_enabled_impl()
        || !objc_msgSend_duplicateAsset(v85, v139, v140)
        || (objc_msgSend_asset(v85, v141, v142),
            v143 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_uploadReceipt(v143, v144, v145),
            v146 = objc_claimAutoreleasedReturnValue(),
            v146,
            v143,
            !v146))
      {
        v272 = [CKDAssetID alloc];
        v417 = objc_msgSend_asset(v85, v273, v274);
        v277 = objc_msgSend_recordId(v417, v275, v276);
        v280 = objc_msgSend_asset(v85, v278, v279);
        v283 = objc_msgSend_signature(v280, v281, v282);
        v286 = objc_msgSend_asset(v85, v284, v285);
        v289 = objc_msgSend_referenceSignature(v286, v287, v288);
        v290 = (void *)MEMORY[0x1E4F28ED0];
        v293 = objc_msgSend_asset(v85, v291, v292);
        uint64_t v296 = objc_msgSend_size(v293, v294, v295);
        v298 = objc_msgSend_numberWithLongLong_(v290, v297, v296);
        v300 = objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v272, v299, (uint64_t)v277, v283, v289, v298);

        uint64_t v20 = v409;
        v303 = objc_msgSend_itemsByAssetId(v409, v301, v302);
        v305 = objc_msgSend_objectForKeyedSubscript_(v303, v304, (uint64_t)v300);

        if (v305)
        {
LABEL_86:
          v412 = v300;
          long long v422 = 0u;
          long long v423 = 0u;
          long long v420 = 0u;
          long long v421 = 0u;
          id v174 = v305;
          uint64_t v346 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v345, (uint64_t)&v420, v443, 16);
          v347 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
          if (v346)
          {
            uint64_t v348 = v346;
            uint64_t v349 = *(void *)v421;
            do
            {
              uint64_t v350 = 0;
              do
              {
                if (*(void *)v421 != v349) {
                  objc_enumerationMutation(v174);
                }
                v351 = *(void **)(*((void *)&v420 + 1) + 8 * v350);
                if (*v347 != -1) {
                  dispatch_once(v347, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                v352 = (void *)*MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
                {
                  v377 = v352;
                  v380 = objc_msgSend_token(v85, v378, v379);
                  v383 = objc_msgSend_trackingUUID(v351, v381, v382);
                  *(_DWORD *)buf = 138412802;
                  v438 = v380;
                  __int16 v439 = 2114;
                  v440 = v419;
                  __int16 v441 = 2112;
                  v442 = v383;
                  _os_log_debug_impl(&dword_1C4CFF000, v377, OS_LOG_TYPE_DEBUG, "Setting the upload token \"%@\" for recordID:%{public}@, MMCSItem:%@", buf, 0x20u);

                  v347 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
                }
                objc_msgSend_setContentBaseURL_(v351, v353, (uint64_t)v137);
                v356 = objc_msgSend_asset(v85, v354, v355);
                v359 = objc_msgSend_owner(v356, v357, v358);
                objc_msgSend_setOwner_(v351, v360, (uint64_t)v359);

                v363 = objc_msgSend_asset(v85, v361, v362);
                v366 = objc_msgSend_requestor(v363, v364, v365);
                objc_msgSend_setRequestor_(v351, v367, (uint64_t)v366);

                v370 = objc_msgSend_token(v85, v368, v369);
                objc_msgSend_setAuthToken_(v351, v371, (uint64_t)v370);

                uint64_t v374 = objc_msgSend_tokenExpiration(v85, v372, v373);
                objc_msgSend_setUploadTokenExpiration_(v351, v375, v374);
                ++v350;
              }
              while (v348 != v350);
              uint64_t v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v376, (uint64_t)&v420, v443, 16);
            }
            while (v348);
          }

          objc_msgSend_removeAllObjects(v174, v384, v385);
          uint64_t v10 = v406;
          v180 = v412;
          goto LABEL_98;
        }
        v308 = objc_msgSend_translator(v413, v306, v307);
        v311 = objc_msgSend_asset(v85, v309, v310);
        v314 = objc_msgSend_recordId(v311, v312, v313);
        v316 = objc_msgSend_pContainerScopedRecordIdentifierWithPRecordIdentifier_(v308, v315, (uint64_t)v314);

        if (v316)
        {
          v318 = [CKDAssetID alloc];
          v418 = objc_msgSend_asset(v85, v319, v320);
          v323 = objc_msgSend_signature(v418, v321, v322);
          v326 = objc_msgSend_asset(v85, v324, v325);
          v329 = objc_msgSend_referenceSignature(v326, v327, v328);
          v330 = (void *)MEMORY[0x1E4F28ED0];
          v333 = objc_msgSend_asset(v85, v331, v332);
          uint64_t v336 = objc_msgSend_size(v333, v334, v335);
          v338 = objc_msgSend_numberWithLongLong_(v330, v337, v336);
          v340 = objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v318, v339, (uint64_t)v316, v323, v329, v338);

          uint64_t v20 = v409;
          v343 = objc_msgSend_itemsByAssetId(v409, v341, v342);
          v305 = objc_msgSend_objectForKeyedSubscript_(v343, v344, (uint64_t)v340);

          v300 = v340;
          if (!v305) {
            goto LABEL_130;
          }
          goto LABEL_86;
        }
        v340 = v300;
LABEL_130:
        v73 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v317, *MEMORY[0x1E4F19DD8], 1000, @"Failed to find asset for assetID %@ on %@", v340, v400);

        id v4 = v400;
        uint64_t v15 = v403;
        goto LABEL_131;
      }
      uint64_t v149 = objc_msgSend_asset(v85, v147, v148);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v411 = (void *)v149;
      v150 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v386 = v150;
        v389 = objc_msgSend_asset(v85, v387, v388);
        *(_DWORD *)buf = 138412290;
        v438 = v389;
        _os_log_debug_impl(&dword_1C4CFF000, v386, OS_LOG_TYPE_DEBUG, "Asset %@ exists on server. Reuse existing reference signature and asset key and skip uploading.", buf, 0xCu);
      }
      v151 = [CKDAssetID alloc];
      v154 = objc_msgSend_asset(v85, v152, v153);
      v157 = objc_msgSend_recordId(v154, v155, v156);
      uint64_t v160 = objc_msgSend_asset(v85, v158, v159);
      v163 = objc_msgSend_signature(v160, v161, v162);
      v164 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v167 = objc_msgSend_asset(v85, v165, v166);
      uint64_t v170 = objc_msgSend_size(v167, v168, v169);
      v172 = objc_msgSend_numberWithLongLong_(v164, v171, v170);
      id v174 = (id)objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v151, v173, (uint64_t)v157, v163, 0, v172);

      v177 = objc_msgSend_itemsByAssetIdIgnoreRefSignature(v409, v175, v176);
      v179 = objc_msgSend_objectForKeyedSubscript_(v177, v178, (uint64_t)v174);

      v180 = v411;
      if (!v179)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v181 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v438 = v411;
          _os_log_error_impl(&dword_1C4CFF000, v181, OS_LOG_TYPE_ERROR, "unable to find items for duplicate asset %@", buf, 0xCu);
        }
      }
      long long v426 = 0u;
      long long v427 = 0u;
      long long v424 = 0u;
      long long v425 = 0u;
      id v401 = v179;
      uint64_t v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v182, (uint64_t)&v424, v444, 16);
      if (v408)
      {
        uint64_t v407 = *(void *)v425;
LABEL_70:
        uint64_t v185 = 0;
        while (1)
        {
          if (*(void *)v425 != v407) {
            objc_enumerationMutation(v401);
          }
          uint64_t v414 = v185;
          v186 = *(void **)(*((void *)&v424 + 1) + 8 * v185);
          uint64_t v187 = objc_msgSend_asset(v186, v183, v184);
          v190 = objc_msgSend_record(v187, v188, v189);

          v410 = v186;
          v193 = objc_msgSend_asset(v186, v191, v192);
          uint64_t v194 = [CKDWrappingContext alloc];
          uint64_t v197 = objc_msgSend_recordID(v190, v195, v196);
          v416 = v193;
          uint64_t v200 = objc_msgSend_recordKey(v193, v198, v199);
          v203 = objc_msgSend_signature(v180, v201, v202);
          objc_msgSend_referenceSignature(v180, v204, v205);
          v207 = v206 = v180;
          v415 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v194, v208, (uint64_t)v197, v200, 0, v203, v207);

          id v211 = objc_msgSend_operation(v413, v209, v210);
          uint64_t v214 = objc_msgSend_container(v211, v212, v213);
          v217 = objc_msgSend_pcsManager(v214, v215, v216);
          v220 = objc_msgSend_protectionInfo(v206, v218, v219);
          uint64_t v223 = objc_msgSend_protectionInfo(v220, v221, v222);
          uint64_t v226 = objc_msgSend_recordPCS(v190, v224, v225);
          uint64_t v228 = objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v217, v227, (uint64_t)v223, v226, v415, 0);

          v229 = (void *)v228;
          if (v228)
          {
            v180 = v411;
            v232 = objc_msgSend_referenceSignature(v411, v230, v231);
            objc_msgSend_setReferenceSignature_(v410, v233, (uint64_t)v232);

            objc_msgSend_setAssetKey_(v410, v234, v228);
            long long v237 = objc_msgSend_uploadReceipt(v411, v235, v236);
            objc_msgSend_setUploadReceipt_(v410, v238, (uint64_t)v237);

            objc_msgSend_setContentBaseURL_(v410, v239, (uint64_t)v137);
            long long v242 = objc_msgSend_asset(v85, v240, v241);
            long long v245 = objc_msgSend_owner(v242, v243, v244);
            objc_msgSend_setOwner_(v410, v246, (uint64_t)v245);

            long long v249 = objc_msgSend_asset(v85, v247, v248);
            v252 = objc_msgSend_requestor(v249, v250, v251);
            objc_msgSend_setRequestor_(v410, v253, (uint64_t)v252);

            uint64_t v256 = objc_msgSend_token(v85, v254, v255);
            objc_msgSend_setAuthToken_(v410, v257, (uint64_t)v256);

            uint64_t v260 = objc_msgSend_tokenExpiration(v85, v258, v259);
            objc_msgSend_setUploadTokenExpiration_(v410, v261, v260);
            v264 = objc_msgSend_referenceSignature(v411, v262, v263);
            v265 = v416;
            objc_msgSend_setReferenceSignature_(v416, v266, (uint64_t)v264);

            objc_msgSend_setAssetKey_(v416, v267, (uint64_t)v229);
            v268 = v190;
          }
          else
          {
            v265 = v416;
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v180 = v411;
            v268 = v190;
            v269 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v438 = v411;
              _os_log_error_impl(&dword_1C4CFF000, v269, OS_LOG_TYPE_ERROR, "failed to unwrapp asset key for duplicate asset %@", buf, 0xCu);
            }
          }

          if (!v229) {
            break;
          }
          uint64_t v185 = v414 + 1;
          if (v408 == v414 + 1)
          {
            uint64_t v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v183, (uint64_t)&v424, v444, 16);
            if (v408) {
              goto LABEL_70;
            }
            break;
          }
        }
      }

      objc_msgSend_removeAllObjects(v401, v270, v271);
      uint64_t v10 = v406;
LABEL_98:

      uint64_t v15 = v403;
      uint64_t v84 = v404 + 1;
      uint64_t v20 = v409;
      v25 = v405;
      self = v413;
    }
    while (v404 + 1 != v397);
    uint64_t v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v82, (uint64_t)&v429, v445, 16);
    if (v397) {
      continue;
    }
    break;
  }
LABEL_100:

  v73 = 0;
  id v4 = v400;
LABEL_124:

LABEL_125:
LABEL_126:

  return v73;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v8 = objc_msgSend_result(v5, v6, v7);
  v11 = objc_msgSend_error(v8, v9, v10);
  if (objc_msgSend_hasClientError(v11, v12, v13))
  {
    uint64_t v16 = objc_msgSend_result(v5, v14, v15);
    v19 = objc_msgSend_error(v16, v17, v18);
    uint64_t v22 = objc_msgSend_clientError(v19, v20, v21);
    int v25 = objc_msgSend_type(v22, v23, v24);

    if (v25 == 4)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F19DD8];
      v30 = objc_msgSend_result(v5, v26, v27);
      uint64_t v31 = sub_1C4E940D0(self, v30);
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, v29, 2006, v31);
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v34 = objc_msgSend_result(v5, v26, v27);
  uint64_t v37 = objc_msgSend_error(v34, v35, v36);
  if ((objc_msgSend_hasExtensionError(v37, v38, v39) & 1) == 0)
  {

LABEL_11:
    uint64_t v58 = objc_msgSend_response(v5, v52, v53);
    uint64_t v61 = objc_msgSend_operationUUID(v58, v59, v60);

    if (v61)
    {
      uint64_t v64 = objc_msgSend_transactionStateByRequestIDs(self, v62, v63);
      uint64_t v66 = objc_msgSend_objectForKey_(v64, v65, (uint64_t)v61);

      if (v66)
      {
        uint64_t v94 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v29 = *MEMORY[0x1E4F19DD8];
        v96 = objc_msgSend_result(v5, v67, v68);
        uint64_t v69 = sub_1C4E94D98(v96);
        id v95 = objc_msgSend_result(v5, v70, v71);
        sub_1C4E940D0(self, v95);
        uint64_t v72 = v97 = v61;
        uint64_t v75 = objc_msgSend_result(v5, v73, v74);
        objc_msgSend_error(v75, v76, v77);
        uint64_t v79 = v78 = a2;
        v82 = objc_msgSend_errorDescription(v79, v80, v81);
        uint64_t v56 = objc_msgSend_errorWithDomain_code_userInfo_format_(v94, v83, v29, v69, v72, @"Error uploading asset: %@", v82);

        a2 = v78;
        uint64_t v61 = v97;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v86 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v99 = v61;
          __int16 v100 = 2112;
          id v101 = v5;
          _os_log_error_impl(&dword_1C4CFF000, v86, OS_LOG_TYPE_ERROR, "Can't find assetBatch for %{public}@ on %@", buf, 0x16u);
        }
        uint64_t v29 = *MEMORY[0x1E4F19DD8];
        uint64_t v56 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v87, *MEMORY[0x1E4F19DD8], 1000, @"Can't find transactionState");
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v84 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v99 = v5;
        _os_log_error_impl(&dword_1C4CFF000, v84, OS_LOG_TYPE_ERROR, "Missing requestID on %@", buf, 0xCu);
      }
      uint64_t v29 = *MEMORY[0x1E4F19DD8];
      uint64_t v56 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v85, *MEMORY[0x1E4F19DD8], 1000, @"Missing requestID on %@", v5);
    }

    if (!v56) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  uint64_t v42 = objc_msgSend_result(v5, v40, v41);
  uint64_t v45 = objc_msgSend_error(v42, v43, v44);
  uint64_t v48 = objc_msgSend_extensionError(v45, v46, v47);
  int hasTypeCode = objc_msgSend_hasTypeCode(v48, v49, v50);

  if (!hasTypeCode) {
    goto LABEL_11;
  }
  v54 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v29 = *MEMORY[0x1E4F19DD8];
  v30 = objc_msgSend_result(v5, v52, v53);
  uint64_t v31 = sub_1C4E940D0(self, v30);
  uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_format_(v54, v55, v29, 6000, v31, @"Plugin-Specific Error");
LABEL_8:
  uint64_t v56 = (void *)v33;

  if (!v56)
  {
LABEL_26:
    uint64_t v88 = a2;
    v89 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v90 = (objc_class *)objc_opt_class();
    uint64_t v91 = NSStringFromClass(v90);
    v92 = NSStringFromSelector(v88);
    uint64_t v56 = objc_msgSend_errorWithDomain_code_format_(v89, v93, v29, 1000, @"Generic %@ %@ error", v91, v92);
  }
LABEL_27:
  objc_msgSend_finishWithError_(self, v57, (uint64_t)v56);
}

- (BOOL)useEncryption
{
  return self->_useEncryption;
}

- (void)setUseEncryption:(BOOL)a3
{
  self->_useEncryption = a3;
}

- (CKDAssetTokenRequest)assetTokenRequest
{
  return self->_assetTokenRequest;
}

- (void)setAssetTokenRequest:(id)a3
{
}

- (NSMapTable)transactionStateByRequestIDs
{
  return self->_transactionStateByRequestIDs;
}

- (void)setTransactionStateByRequestIDs:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_transactionStateByRequestIDs, 0);
  objc_storeStrong((id *)&self->_assetTokenRequest, 0);
}

@end