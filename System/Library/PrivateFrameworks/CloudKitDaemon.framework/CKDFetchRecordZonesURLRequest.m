@interface CKDFetchRecordZonesURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)isFullZoneRequest;
- (BOOL)onlyFetchPCSInfo;
- (BOOL)requiresCKAnonymousUserIDs;
- (CKDFetchRecordZonesURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4;
- (NSArray)recordZones;
- (NSArray)zoneIDs;
- (NSMutableDictionary)zoneIDByRequestID;
- (id)anonymousRecordZoneTuplesFetchedBlock;
- (id)errorFetchingAllRecordZonesBlock;
- (id)generateRequestOperations;
- (id)recordZoneFetchedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAnonymousRecordZoneTuplesFetchedBlock:(id)a3;
- (void)setErrorFetchingAllRecordZonesBlock:(id)a3;
- (void)setOnlyFetchPCSInfo:(BOOL)a3;
- (void)setRecordZoneFetchedBlock:(id)a3;
- (void)setZoneIDByRequestID:(id)a3;
- (void)setZoneIDs:(id)a3;
@end

@implementation CKDFetchRecordZonesURLRequest

- (CKDFetchRecordZonesURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKDFetchRecordZonesURLRequest;
  v8 = [(CKDURLRequest *)&v17 initWithOperation:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_zoneIDs, a4);
    uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11);
    recordZones = v9->_recordZones;
    v9->_recordZones = (NSArray *)v12;

    uint64_t v14 = objc_opt_new();
    zoneIDByRequestID = v9->_zoneIDByRequestID;
    v9->_zoneIDByRequestID = (NSMutableDictionary *)v14;
  }
  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchRecordZonesURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_zoneIDs(self, v6, v7, v15.receiver, v15.super_class);
  uint64_t v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"zoneIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_zoneIDs(self, v5, v6);
  objc_msgSend_setFetchRecordZoneIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchRecordZonesURLRequest;
  [(CKDURLRequest *)&v9 fillOutRequestProperties:v4];
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (BOOL)isFullZoneRequest
{
  return 1;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  v10.receiver = self;
  v10.super_class = (Class)CKDFetchRecordZonesURLRequest;
  if (![(CKDURLRequest *)&v10 requiresCKAnonymousUserIDs]) {
    return 0;
  }
  v5 = objc_msgSend_zoneIDs(self, v3, v4);
  BOOL v8 = objc_msgSend_count(v5, v6, v7) != 0;

  return v8;
}

- (id)generateRequestOperations
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_zoneIDs(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    objc_msgSend_zoneIDs(self, v10, v11);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v92, v96, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v93;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v93 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend_operationType(self, v14, v15);
          v22 = objc_msgSend_operationRequestWithType_(self, v21, v20);
          if (objc_msgSend_requiresCKAnonymousUserIDs(self, v23, v24))
          {
            v27 = objc_msgSend_anonymousCKUserID(v19, v25, v26);

            if (!v27)
            {
              v74 = objc_opt_new();
              v76 = objc_msgSend_stringWithFormat_(NSString, v75, @"An anonymousCKUserID is required to fetch zone %@ in the shared database when using anonymous to server share participants", v19);
              objc_msgSend_setObject_forKeyedSubscript_(v74, v77, (uint64_t)v76, *MEMORY[0x1E4F28568]);
              v80 = objc_msgSend_operation(self, v78, v79);
              v83 = objc_msgSend_topmostParentOperation(v80, v81, v82);

              v87 = objc_msgSend_operationID(v83, v84, v85);
              if (v87) {
                objc_msgSend_setObject_forKeyedSubscript_(v74, v86, (uint64_t)v87, *MEMORY[0x1E4F19C50]);
              }
              v88 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v86, *MEMORY[0x1E4F19DD8], 5015, v74);
              objc_msgSend_finishWithError_(self, v89, (uint64_t)v88);

              id v73 = 0;
              goto LABEL_18;
            }
            v30 = objc_msgSend_anonymousCKUserID(v19, v28, v29);
            v33 = objc_msgSend_CKDPIdentifier_User(v30, v31, v32);
            v36 = objc_msgSend_request(v22, v34, v35);
            objc_msgSend_setAnonymousCKUserID_(v36, v37, (uint64_t)v33);
          }
          v38 = objc_opt_new();
          objc_msgSend_setZoneRetrieveRequest_(v22, v39, (uint64_t)v38);

          v42 = objc_msgSend_translator(self, v40, v41);
          v44 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v42, v43, (uint64_t)v19);
          v47 = objc_msgSend_zoneRetrieveRequest(v22, v45, v46);
          objc_msgSend_setZoneIdentifier_(v47, v48, (uint64_t)v44);

          uint64_t PCSInfo = objc_msgSend_onlyFetchPCSInfo(self, v49, v50);
          v54 = objc_msgSend_zoneRetrieveRequest(v22, v52, v53);
          objc_msgSend_setOnlyFetchPCSInfo_(v54, v55, PCSInfo);

          objc_msgSend_addObject_(v3, v56, (uint64_t)v22);
          v59 = objc_msgSend_zoneIDByRequestID(self, v57, v58);
          v62 = objc_msgSend_request(v22, v60, v61);
          v65 = objc_msgSend_operationUUID(v62, v63, v64);
          objc_msgSend_setObject_forKeyedSubscript_(v59, v66, (uint64_t)v19, v65);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v92, v96, 16);
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v67 = objc_msgSend_operationType(self, v10, v11);
    v69 = objc_msgSend_operationRequestWithType_(self, v68, v67);
    v70 = objc_opt_new();
    objc_msgSend_setZoneRetrieveRequest_(v69, v71, (uint64_t)v70);

    objc_msgSend_addObject_(v3, v72, (uint64_t)v69);
  }
  id v73 = v3;
LABEL_18:

  return v73;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v297 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_zoneIDByRequestID(self, v5, v6);
  objc_super v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v278 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  v280 = v4;
  if (!objc_msgSend_hasZoneRetrieveResponse(v4, v15, v16))
  {
    v180 = objc_msgSend_result(v4, v17, v18);
    int hasError = objc_msgSend_hasError(v180, v181, v182);

    if (!hasError)
    {
      uint64_t v26 = 0;
      goto LABEL_66;
    }
    v186 = objc_msgSend_zoneIDs(self, v184, v185);
    uint64_t v189 = objc_msgSend_count(v186, v187, v188);

    v192 = (void *)v278;
    if (v189)
    {
      v193 = objc_msgSend_recordZoneFetchedBlock(self, v190, v191);

      if (v193)
      {
        objc_msgSend_recordZoneFetchedBlock(self, v194, v195);
        v196 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        v199 = objc_msgSend_result(v4, v197, v198);
        ((void (**)(void, void, uint64_t, void *, void))v196)[2](v196, 0, v278, v199, 0);
LABEL_74:
      }
    }
    else
    {
      v264 = objc_msgSend_errorFetchingAllRecordZonesBlock(self, v190, v191);

      if (v264)
      {
        objc_msgSend_errorFetchingAllRecordZonesBlock(self, v265, v266);
        v196 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        v199 = objc_msgSend_result(v4, v267, v268);
        ((void (*)(void (**)(void, void, void, void, void), void *))v196[2])(v196, v199);
        goto LABEL_74;
      }
    }
    uint64_t v26 = 0;
    goto LABEL_76;
  }
  long long v291 = 0u;
  long long v292 = 0u;
  long long v289 = 0u;
  long long v290 = 0u;
  v19 = objc_msgSend_zoneRetrieveResponse(v4, v17, v18);
  v22 = objc_msgSend_zoneSummarys(v19, v20, v21);

  id obj = v22;
  v276 = self;
  uint64_t v282 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v289, v296, 16);
  uint64_t v26 = 0;
  if (!v282) {
    goto LABEL_44;
  }
  uint64_t v281 = *(void *)v290;
  uint64_t v275 = *MEMORY[0x1E4F19C08];
  v27 = (void *)v278;
  while (2)
  {
    for (uint64_t i = 0; i != v282; ++i)
    {
      if (*(void *)v290 != v281) {
        objc_enumerationMutation(obj);
      }
      uint64_t v29 = *(void **)(*((void *)&v289 + 1) + 8 * i);
      uint64_t v32 = objc_msgSend_targetZone(v29, v24, v25);
      if (!v32)
      {
        uint64_t v41 = 0;
        goto LABEL_40;
      }
      v33 = objc_msgSend_translator(self, v30, v31);
      v36 = objc_msgSend_anonymousCKUserID(v27, v34, v35);
      uint64_t v39 = objc_msgSend_databaseScope(self, v37, v38);
      id v288 = v26;
      uint64_t v41 = objc_msgSend_recordZoneFromPRecordZone_asAnonymousCKUserID_databaseScope_error_(v33, v40, (uint64_t)v32, v36, v39, &v288);
      id v42 = v288;

      if (!v41)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v200 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v295 = v42;
          _os_log_error_impl(&dword_1C4CFF000, v200, OS_LOG_TYPE_ERROR, "Failed to convert record zone: %@", buf, 0xCu);
        }
        v203 = objc_msgSend_result(v280, v201, v202);
        objc_msgSend_setCode_(v203, v204, 3);

        v205 = objc_opt_new();
        v208 = objc_msgSend_result(v280, v206, v207);
        objc_msgSend_setError_(v208, v209, (uint64_t)v205);

        v210 = objc_opt_new();
        v213 = objc_msgSend_result(v280, v211, v212);
        v216 = objc_msgSend_error(v213, v214, v215);
        objc_msgSend_setClientError_(v216, v217, (uint64_t)v210);

        v220 = objc_msgSend_result(v280, v218, v219);
        v223 = objc_msgSend_error(v220, v221, v222);
        v226 = objc_msgSend_clientError(v223, v224, v225);
        objc_msgSend_setType_(v226, v227, 7);

        v230 = objc_msgSend_result(v280, v228, v229);
        v233 = objc_msgSend_error(v230, v231, v232);
        objc_msgSend_setErrorKey_(v233, v234, @"Invalid record zone");

        v235 = NSString;
        v238 = objc_msgSend_localizedDescription(v42, v236, v237);
        v240 = objc_msgSend_stringWithFormat_(v235, v239, @"The record zone could not be converted because it is invalid: %@", v238);
        v243 = objc_msgSend_result(v280, v241, v242);
        v246 = objc_msgSend_error(v243, v244, v245);
        objc_msgSend_setErrorDescription_(v246, v247, (uint64_t)v240);

        v192 = (void *)v278;
        if (v278)
        {
          id v250 = v42;
        }
        else
        {
          v251 = objc_msgSend_translator(self, v248, v249);
          v254 = objc_msgSend_zoneIdentifier(v32, v252, v253);
          id v287 = v42;
          v192 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(v251, v255, (uint64_t)v254, 0, &v287);
          id v250 = v287;

          if (!v192)
          {
            v270 = objc_msgSend_errorFetchingAllRecordZonesBlock(self, v248, v249);

            if (!v270)
            {
              v192 = 0;
              goto LABEL_71;
            }
            objc_msgSend_errorFetchingAllRecordZonesBlock(self, v271, v272);
            v259 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
            v262 = objc_msgSend_result(v280, v273, v274);
            ((void (**)(void, void *))v259)[2](v259, v262);
            v192 = 0;
            goto LABEL_70;
          }
        }
        v256 = objc_msgSend_recordZoneFetchedBlock(self, v248, v249);

        if (!v256)
        {
LABEL_71:
          id v263 = v250;

          goto LABEL_77;
        }
        objc_msgSend_recordZoneFetchedBlock(self, v257, v258);
        v259 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v262 = objc_msgSend_result(v280, v260, v261);
        ((void (*)(void (**)(void, void), void, void *, void *, id))v259[2])(v259, 0, v192, v262, v250);
LABEL_70:

        goto LABEL_71;
      }
      v45 = objc_msgSend_zoneID(v41, v43, v44);
      char isEqual = objc_msgSend_isEqual_(v45, v46, (uint64_t)v27);

      if ((isEqual & 1) == 0)
      {
        uint64_t v50 = objc_msgSend_ownerName(v27, v48, v49);
        int isEqualToString = objc_msgSend_isEqualToString_(v50, v51, v275);

        v54 = objc_msgSend_zoneID(v41, v52, v53);
        v57 = objc_msgSend_ownerName(v54, v55, v56);
        int v59 = objc_msgSend_isEqualToString_(v57, v58, v275);

        v62 = objc_msgSend_zoneID(v41, v60, v61);
        v65 = objc_msgSend_zoneName(v62, v63, v64);
        v68 = objc_msgSend_zoneName(v27, v66, v67);
        if (objc_msgSend_isEqualToString_(v65, v69, (uint64_t)v68))
        {

          v27 = (void *)v278;
          self = v276;
          if (isEqualToString != v59) {
            objc_msgSend_setZoneID_(v41, v48, v278);
          }
        }
        else
        {

          v27 = (void *)v278;
          self = v276;
        }
      }
      if (objc_msgSend_hasClientChangeToken(v29, v48, v49))
      {
        v72 = objc_msgSend_clientChangeToken(v29, v70, v71);
        objc_msgSend_setClientChangeToken_(v41, v73, (uint64_t)v72);
      }
      if (objc_msgSend_hasCurrentServerContinuationToken(v29, v70, v71))
      {
        id v76 = objc_alloc(MEMORY[0x1E4F1A388]);
        uint64_t v79 = objc_msgSend_currentServerContinuationToken(v29, v77, v78);
        v81 = objc_msgSend_initWithData_(v76, v80, (uint64_t)v79);

        objc_msgSend_setCurrentServerChangeToken_(v41, v82, (uint64_t)v81);
      }
      if (objc_msgSend_hasDeviceCount(v29, v74, v75))
      {
        uint64_t v85 = objc_msgSend_deviceCount(v29, v83, v84);
        objc_msgSend_setDeviceCount_(v41, v86, v85);
      }
      if (objc_msgSend_hasAssetQuotaUsage(v29, v83, v84))
      {
        uint64_t v89 = objc_msgSend_assetQuotaUsage(v29, v87, v88);
        objc_msgSend_setAssetQuotaUsage_(v41, v90, v89);
      }
      if (objc_msgSend_hasMetadataQuotaUsage(v29, v87, v88))
      {
        uint64_t v93 = objc_msgSend_metadataQuotaUsage(v29, v91, v92);
        objc_msgSend_setMetadataQuotaUsage_(v41, v94, v93);
      }
      if (objc_msgSend_hasZoneishPcsNeedsRolled(v29, v91, v92))
      {
        uint64_t v97 = objc_msgSend_zoneishPcsNeedsRolled(v29, v95, v96);
        objc_msgSend_setNeedsZoneishPCSRolled_(v41, v98, v97);
      }
      if (objc_msgSend_hasCapabilities(v29, v95, v96))
      {
        v101 = objc_msgSend_translator(self, v99, v100);
        v104 = objc_msgSend_capabilities(v29, v102, v103);
        uint64_t v106 = objc_msgSend_capabilitiesFromPZoneCapabilities_(v101, v105, (uint64_t)v104);
        objc_msgSend_setCapabilities_(v41, v107, v106);
      }
      if (objc_msgSend_hasZoneKeyRollAllowed(v29, v99, v100))
      {
        uint64_t v110 = objc_msgSend_zoneKeyRollAllowed(v29, v108, v109);
        objc_msgSend_setZoneKeyRollAllowed_(v41, v111, v110);
      }
      if (objc_msgSend_hasZonePcsModificationTime(v29, v108, v109))
      {
        v114 = (void *)MEMORY[0x1E4F1C9C8];
        v115 = objc_msgSend_zonePcsModificationTime(v29, v112, v113);
        objc_msgSend_time(v115, v116, v117);
        v120 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v114, v118, v119);
        objc_msgSend_setZonePCSModificationDate_(v41, v121, (uint64_t)v120);
      }
      if (objc_msgSend_hasZonePcsModificationDevice(v29, v112, v113))
      {
        v124 = objc_msgSend_zonePcsModificationDevice(v29, v122, v123);
        objc_msgSend_setZonePCSLastModifierDevice_(v41, v125, (uint64_t)v124);
      }
      if (objc_msgSend_hasExpirationTime(v29, v122, v123))
      {
        v128 = objc_msgSend_expirationTime(v29, v126, v127);
        objc_msgSend_time(v128, v129, v130);
        double v132 = v131;

        v135 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v133, v134, v132);
        objc_msgSend_setExpirationDate_(v41, v136, (uint64_t)v135);
      }
      if (objc_msgSend_hasExpired(v29, v126, v127))
      {
        uint64_t v139 = objc_msgSend_expired(v29, v137, v138);
        objc_msgSend_setExpired_(v41, v140, v139);
      }
      v141 = objc_msgSend_recordZones(self, v137, v138);
      objc_msgSend_addObject_(v141, v142, (uint64_t)v41);

      uint64_t v26 = v42;
LABEL_40:
      v143 = objc_msgSend_recordZoneFetchedBlock(self, v30, v31);

      if (v143)
      {
        objc_msgSend_recordZoneFetchedBlock(self, v144, v145);
        v146 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        v149 = objc_msgSend_result(v280, v147, v148);
        ((void (**)(void, void *, void *, void *, void))v146)[2](v146, v41, v27, v149, 0);
      }
    }
    uint64_t v282 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v289, v296, 16);
    if (v282) {
      continue;
    }
    break;
  }
LABEL_44:

  id v150 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v153 = objc_msgSend_zoneRetrieveResponse(v280, v151, v152);
  v156 = objc_msgSend_anonymousZoneInfos(v153, v154, v155);

  long long v285 = 0u;
  long long v286 = 0u;
  long long v283 = 0u;
  long long v284 = 0u;
  id v157 = v156;
  uint64_t v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v158, (uint64_t)&v283, v293, 16);
  if (v159)
  {
    uint64_t v162 = v159;
    uint64_t v163 = *(void *)v284;
    do
    {
      for (uint64_t j = 0; j != v162; ++j)
      {
        if (*(void *)v284 != v163) {
          objc_enumerationMutation(v157);
        }
        v165 = objc_msgSend_anonymousZoneInfoData(*(void **)(*((void *)&v283 + 1) + 8 * j), v160, v161);
        objc_msgSend_addObject_(v150, v166, (uint64_t)v165);
      }
      uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v160, (uint64_t)&v283, v293, 16);
    }
    while (v162);
  }

  uint64_t v169 = objc_msgSend_anonymousRecordZoneTuplesFetchedBlock(v276, v167, v168);
  if (v169)
  {
    v172 = (void *)v169;
    uint64_t v173 = objc_msgSend_count(v150, v170, v171);

    if (v173)
    {
      objc_msgSend_anonymousRecordZoneTuplesFetchedBlock(v276, v174, v175);
      v176 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v179 = objc_msgSend_result(v280, v177, v178);
      ((void (**)(void, id, void *))v176)[2](v176, v150, v179);
    }
  }

LABEL_66:
  v192 = (void *)v278;
LABEL_76:
  id v263 = v26;
LABEL_77:

  return v263;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v35 = a3;
  uint64_t v6 = objc_msgSend_zoneIDByRequestID(self, v4, v5);
  uint64_t v9 = objc_msgSend_response(v35, v7, v8);
  uint64_t v12 = objc_msgSend_operationUUID(v9, v10, v11);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);

  uint64_t v17 = objc_msgSend_zoneIDs(self, v15, v16);
  uint64_t v20 = objc_msgSend_count(v17, v18, v19);

  if (v20)
  {
    v23 = objc_msgSend_recordZoneFetchedBlock(self, v21, v22);

    if (!v23) {
      goto LABEL_7;
    }
    objc_msgSend_recordZoneFetchedBlock(self, v24, v25);
    uint64_t v26 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v29 = objc_msgSend_result(v35, v27, v28);
    ((void (**)(void, void, void *, void *, void))v26)[2](v26, 0, v14, v29, 0);
  }
  else
  {
    v30 = objc_msgSend_errorFetchingAllRecordZonesBlock(self, v21, v22);

    if (!v30) {
      goto LABEL_7;
    }
    objc_msgSend_errorFetchingAllRecordZonesBlock(self, v31, v32);
    uint64_t v26 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v29 = objc_msgSend_result(v35, v33, v34);
    ((void (*)(void (**)(void, void, void, void, void), void *))v26[2])(v26, v29);
  }

LABEL_7:
}

- (NSArray)recordZones
{
  return self->_recordZones;
}

- (BOOL)onlyFetchPCSInfo
{
  return self->_onlyFetchPCSInfo;
}

- (void)setOnlyFetchPCSInfo:(BOOL)a3
{
  self->_onlyFetchuint64_t PCSInfo = a3;
}

- (id)recordZoneFetchedBlock
{
  return self->_recordZoneFetchedBlock;
}

- (void)setRecordZoneFetchedBlock:(id)a3
{
}

- (id)errorFetchingAllRecordZonesBlock
{
  return self->_errorFetchingAllRecordZonesBlock;
}

- (void)setErrorFetchingAllRecordZonesBlock:(id)a3
{
}

- (id)anonymousRecordZoneTuplesFetchedBlock
{
  return self->_anonymousRecordZoneTuplesFetchedBlock;
}

- (void)setAnonymousRecordZoneTuplesFetchedBlock:(id)a3
{
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
}

- (NSMutableDictionary)zoneIDByRequestID
{
  return self->_zoneIDByRequestID;
}

- (void)setZoneIDByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_anonymousRecordZoneTuplesFetchedBlock, 0);
  objc_storeStrong(&self->_errorFetchingAllRecordZonesBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchedBlock, 0);
  objc_storeStrong((id *)&self->_recordZones, 0);
}

@end