@interface CKDRecordResolveTokenURLRequest
- (BOOL)requiresCKAnonymousUserIDs;
- (BOOL)sendRequestAnonymously;
- (BOOL)shouldFetchRootRecord;
- (CKDProtocolTranslator)privateDBTranslator;
- (CKDRecordResolveTokenURLRequest)initWithOperation:(id)a3 shortTokenLookupInfos:(id)a4;
- (NSArray)lookupInfos;
- (NSMutableDictionary)lookupInfosByRequestID;
- (NSSet)rootRecordDesiredKeySet;
- (id)applicationBundleIdentifierForContainerAccess;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)sourceApplicationSecondaryIdentifier;
- (id)tokenResolveBlock;
- (int64_t)databaseScope;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setLookupInfos:(id)a3;
- (void)setLookupInfosByRequestID:(id)a3;
- (void)setPrivateDBTranslator:(id)a3;
- (void)setRootRecordDesiredKeySet:(id)a3;
- (void)setShouldFetchRootRecord:(BOOL)a3;
- (void)setTokenResolveBlock:(id)a3;
@end

@implementation CKDRecordResolveTokenURLRequest

- (CKDRecordResolveTokenURLRequest)initWithOperation:(id)a3 shortTokenLookupInfos:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDRecordResolveTokenURLRequest;
  v8 = [(CKDURLRequest *)&v13 initWithOperation:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lookupInfos, a4);
    uint64_t v10 = objc_opt_new();
    lookupInfosByRequestID = v9->_lookupInfosByRequestID;
    v9->_lookupInfosByRequestID = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDRecordResolveTokenURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_lookupInfos(self, v6, v7, v15.receiver, v15.super_class);
  v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  objc_super v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"lookupInfos");
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)applicationBundleIdentifierForContainerAccess
{
  return @"com.apple.cloudd";
}

- (id)sourceApplicationSecondaryIdentifier
{
  return 0;
}

- (int64_t)databaseScope
{
  return 3;
}

- (BOOL)sendRequestAnonymously
{
  v13.receiver = self;
  v13.super_class = (Class)CKDRecordResolveTokenURLRequest;
  if ([(CKDURLRequest *)&v13 sendRequestAnonymously]) {
    return 1;
  }
  v6 = objc_msgSend_container(self, v3, v4);
  v9 = objc_msgSend_options(v6, v7, v8);
  char v5 = objc_msgSend_useAnonymousToServerShareParticipants(v9, v10, v11);

  return v5;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (id)generateRequestOperations
{
  uint64_t v4 = objc_msgSend_lookupInfos(self, a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4E2845C;
  v8[3] = &unk_1E64F3DD8;
  v8[4] = self;
  v6 = objc_msgSend_CKMap_(v4, v5, (uint64_t)v8);

  return v6;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v413 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_response(v4, v5, v6);
  uint64_t v10 = objc_msgSend_operationUUID(v7, v8, v9);

  objc_super v13 = objc_msgSend_lookupInfosByRequestID(self, v11, v12);
  objc_super v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v10);

  if (!objc_msgSend_hasRecordResolveTokenResponse(v4, v16, v17))
  {
    v79 = 0;
    id v80 = 0;
    goto LABEL_120;
  }
  v20 = objc_msgSend_recordResolveTokenResponse(v4, v18, v19);
  uint64_t v23 = objc_msgSend_container(v20, v21, v22);
  if (objc_msgSend_containerEnvironment(v20, v24, v25) == 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = 2;
  }
  id v27 = objc_alloc(MEMORY[0x1E4F19ED8]);
  v380 = (void *)v23;
  v383 = objc_msgSend_initWithContainerIdentifier_environment_(v27, v28, v23, v26);
  v389 = objc_msgSend_translator(self, v29, v30);
  v33 = objc_msgSend_shareMetadata(v20, v31, v32);
  v384 = v15;
  if (objc_msgSend_hasParticipantType(v33, v34, v35))
  {
    v38 = objc_msgSend_shareMetadata(v20, v36, v37);
    if (objc_msgSend_participantType(v38, v39, v40) == 1)
    {
      v43 = objc_msgSend_shareMetadata(v20, v41, v42);
      int hasOwnerParticipant = objc_msgSend_hasOwnerParticipant(v43, v44, v45);

      if (!hasOwnerParticipant) {
        goto LABEL_14;
      }
      v49 = objc_msgSend_privateDBTranslator(self, v47, v48);

      if (!v49)
      {
        v52 = [CKDProtocolTranslator alloc];
        v55 = objc_msgSend_container(self, v53, v54);
        v57 = objc_msgSend_initWithContainer_databaseScope_(v52, v56, (uint64_t)v55, 2);
        objc_msgSend_setPrivateDBTranslator_(self, v58, (uint64_t)v57);

        v61 = objc_msgSend_shareMetadata(v20, v59, v60);
        v64 = objc_msgSend_ownerParticipant(v61, v62, v63);
        v67 = objc_msgSend_userId(v64, v65, v66);
        v70 = objc_msgSend_name(v67, v68, v69);
        v73 = objc_msgSend_privateDBTranslator(self, v71, v72);
        objc_msgSend_setOverriddenContainerScopedUserID_(v73, v74, (uint64_t)v70);

        v77 = objc_msgSend_privateDBTranslator(self, v75, v76);
        objc_msgSend_setOverriddenDatabaseScope_(v77, v78, 2);
      }
      objc_msgSend_privateDBTranslator(self, v50, v51);
      v389 = v33 = v389;
    }
    else
    {
    }
  }

LABEL_14:
  v81 = objc_msgSend_shareRecord(v20, v47, v48);
  id v403 = 0;
  v385 = objc_msgSend_recordFromPRecord_error_(v389, v82, (uint64_t)v81, &v403);
  id v83 = v403;

  if (v83)
  {
    id v84 = (id)*MEMORY[0x1E4F1A548];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v84);
    }

    v85 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      v88 = objc_msgSend_shareRecord(v20, v86, v87);
      *(_DWORD *)buf = 138412546;
      unint64_t v405 = (unint64_t)v88;
      __int16 v406 = 2112;
      id v407 = v83;
      _os_log_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_INFO, "Warn: Couldn't get a shareRecord from %@: %@", buf, 0x16u);
    }
  }
  id v89 = objc_alloc(MEMORY[0x1E4F1A3A8]);
  v91 = objc_msgSend_initWithShare_containerID_(v89, v90, (uint64_t)v385, v383);
  v94 = objc_msgSend_shareMetadata(v20, v92, v93);
  int hasParticipantType = objc_msgSend_hasParticipantType(v94, v95, v96);

  if (hasParticipantType)
  {
    v100 = objc_msgSend_shareMetadata(v20, v98, v99);
    uint64_t v104 = objc_msgSend_participantType(v100, v101, v102) - 1;
    if (v104 < 4) {
      objc_msgSend_setParticipantRole_(v91, v103, v104 + 1);
    }
    else {
      objc_msgSend_setParticipantRole_(v91, v103, 0);
    }
  }
  v105 = objc_msgSend_shareMetadata(v20, v98, v99);
  int hasParticipantState = objc_msgSend_hasParticipantState(v105, v106, v107);

  if (hasParticipantState)
  {
    v111 = objc_msgSend_shareMetadata(v20, v109, v110);
    uint64_t v115 = objc_msgSend_participantState(v111, v112, v113) - 2;
    if (v115 >= 3) {
      objc_msgSend_setParticipantStatus_(v91, v114, 1);
    }
    else {
      objc_msgSend_setParticipantStatus_(v91, v114, v115 + 2);
    }
  }
  v116 = objc_msgSend_shareMetadata(v20, v109, v110);
  int hasParticipantPermission = objc_msgSend_hasParticipantPermission(v116, v117, v118);

  if (hasParticipantPermission)
  {
    v122 = objc_msgSend_shareMetadata(v20, v120, v121);
    uint64_t v126 = objc_msgSend_participantPermission(v122, v123, v124) - 1;
    if (v126 < 4) {
      objc_msgSend_setParticipantPermission_(v91, v125, v126 + 1);
    }
    else {
      objc_msgSend_setParticipantPermission_(v91, v125, 0);
    }
  }
  v127 = objc_msgSend_shareMetadata(v20, v120, v121);
  v130 = objc_msgSend_protectedFullToken(v127, v128, v129);
  objc_msgSend_setProtectedFullToken_(v91, v131, (uint64_t)v130);

  v134 = objc_msgSend_shareMetadata(v20, v132, v133);
  v137 = objc_msgSend_rootRecordType(v134, v135, v136);
  v140 = objc_msgSend_name(v137, v138, v139);
  objc_msgSend_setRootRecordType_(v91, v141, (uint64_t)v140);

  v386 = v20;
  v388 = v91;
  if (objc_msgSend_recordsCount(v20, v142, v143))
  {
    v379 = (void *)MEMORY[0x1C8789E70]();
    v148 = objc_msgSend_records(v20, v146, v147);
    v151 = objc_msgSend_firstObject(v148, v149, v150);
    id v402 = 0;
    v381 = objc_msgSend_recordFromPRecord_error_(v389, v152, (uint64_t)v151, &v402);
    id v153 = v402;

    if (v153)
    {
      id v156 = (id)*MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v156);
      }

      v157 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
      {
        v160 = objc_msgSend_records(v20, v158, v159);
        v163 = objc_msgSend_firstObject(v160, v161, v162);
        *(_DWORD *)buf = 138412546;
        unint64_t v405 = (unint64_t)v163;
        __int16 v406 = 2112;
        id v407 = v153;
        _os_log_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_INFO, "Warn: Couldn't get a root record from %@: %@", buf, 0x16u);
      }
    }
    v164 = v381;
    v165 = objc_msgSend_recordID(v381, v154, v155);
    objc_msgSend_setHierarchicalRootRecordID_(v91, v166, (uint64_t)v165);

    unsigned int RootRecord = objc_msgSend_shouldFetchRootRecord(self, v167, v168);
    if (objc_msgSend_recordsCount(v20, v170, v171) <= (unint64_t)RootRecord)
    {
      v178 = 0;
      v216 = v379;
      objc_msgSend_setSharedItemHierarchyIDs_(v91, v172, 0);
    }
    else
    {
      unint64_t v173 = RootRecord;
      id v174 = (id)*MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v174);
      }

      v175 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v363 = objc_msgSend_recordsCount(v20, v176, v177);
        *(_DWORD *)buf = 134217984;
        unint64_t v405 = v363 - v173;
        _os_log_debug_impl(&dword_1C4CFF000, v175, OS_LOG_TYPE_DEBUG, "Found %lu additional share hierarchy records", buf, 0xCu);
      }

      v178 = objc_opt_new();
      v181 = objc_msgSend_records(v20, v179, v180);
      unint64_t v184 = objc_msgSend_count(v181, v182, v183);

      if (v184 > v173)
      {
        uint64_t v377 = 138543362;
        while (1)
        {
          v187 = objc_msgSend_records(v20, v185, v186, v377);
          v189 = objc_msgSend_objectAtIndex_(v187, v188, v173);

          id v190 = (id)*MEMORY[0x1E4F1A548];
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v190);
          }

          v191 = (id)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled(v191, OS_LOG_TYPE_DEBUG))
          {
            v209 = objc_msgSend_recordIdentifier(v189, v192, v193);
            v212 = objc_msgSend_value(v209, v210, v211);
            v215 = objc_msgSend_name(v212, v213, v214);
            *(_DWORD *)buf = v377;
            unint64_t v405 = (unint64_t)v215;
            _os_log_debug_impl(&dword_1C4CFF000, v191, OS_LOG_TYPE_DEBUG, "Parsing share hierarchy record %{public}@", buf, 0xCu);

            v20 = v386;
          }

          v196 = objc_msgSend_recordIdentifier(v189, v194, v195);
          id v401 = 0;
          v198 = objc_msgSend_recordIDFromPRecordIdentifier_error_(v389, v197, (uint64_t)v196, &v401);
          id v199 = v401;

          uint64_t v200 = *MEMORY[0x1E4F1A550];
          if (v199 || !v198) {
            break;
          }
          if (v200 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v201 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v377;
            unint64_t v405 = (unint64_t)v198;
            _os_log_debug_impl(&dword_1C4CFF000, v201, OS_LOG_TYPE_DEBUG, "Parsed share hierarchy record ID %{public}@", buf, 0xCu);
          }
          objc_msgSend_addObject_(v178, v202, (uint64_t)v198);

          ++v173;
          v205 = objc_msgSend_records(v20, v203, v204);
          unint64_t v208 = objc_msgSend_count(v205, v206, v207);

          if (v173 >= v208) {
            goto LABEL_67;
          }
        }
        if (v200 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v219 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v405 = (unint64_t)v189;
          __int16 v406 = 2112;
          id v407 = v199;
          _os_log_impl(&dword_1C4CFF000, v219, OS_LOG_TYPE_INFO, "Warn: Couldn't get a shared hierarchy record ID from %@: %@", buf, 0x16u);
        }
        objc_msgSend_removeAllObjects(v178, v220, v221);
      }
LABEL_67:
      v91 = v388;
      v216 = v379;
      v164 = v381;
      objc_msgSend_setSharedItemHierarchyIDs_(v388, v185, (uint64_t)v178);
    }
    if (objc_msgSend_shouldFetchRootRecord(self, v217, v218)) {
      objc_msgSend_setRootRecord_(v91, v222, (uint64_t)v164);
    }
  }
  v223 = objc_msgSend_shareMetadata(v20, v144, v145);
  int hasCallerParticipant = objc_msgSend_hasCallerParticipant(v223, v224, v225);

  objc_super v15 = v384;
  if (!hasCallerParticipant) {
    goto LABEL_82;
  }
  v229 = objc_msgSend_shareMetadata(v20, v227, v228);
  v232 = objc_msgSend_callerParticipant(v229, v230, v231);
  v235 = objc_msgSend_recordID(v385, v233, v234);
  id v400 = 0;
  v237 = objc_msgSend_shareParticipantFromPParticipant_shareID_error_(v389, v236, (uint64_t)v232, v235, &v400);
  v238 = v400;
  objc_msgSend_setCallingParticipant_(v91, v239, (uint64_t)v237);

  v242 = objc_msgSend_callingParticipant(v91, v240, v241);
  objc_msgSend_setIsCurrentUser_(v242, v243, 1);

  v244 = (void *)*MEMORY[0x1E4F1A548];
  if (v238)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v244);
    }
    objc_super v15 = v384;
    v245 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v246 = v245;
      v249 = objc_msgSend_shareMetadata(v20, v247, v248);
      v252 = objc_msgSend_callerParticipant(v249, v250, v251);
      *(_DWORD *)buf = 138412546;
      unint64_t v405 = (unint64_t)v252;
      __int16 v406 = 2112;
      id v407 = v238;
      _os_log_impl(&dword_1C4CFF000, v246, OS_LOG_TYPE_INFO, "Warn: Couldn't get a calling participant from %@: %@", buf, 0x16u);

      objc_super v15 = v384;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v244);
    }
    objc_super v15 = v384;
    v253 = (void *)*MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
      goto LABEL_82;
    }
    v238 = v253;
    v256 = objc_msgSend_callingParticipant(v91, v254, v255);
    *(_DWORD *)buf = 138412290;
    unint64_t v405 = (unint64_t)v256;
    _os_log_impl(&dword_1C4CFF000, v238, OS_LOG_TYPE_INFO, "Parsed calling participant: %@", buf, 0xCu);
  }
LABEL_82:
  v382 = self;
  v257 = objc_msgSend_share(v91, v227, v228);
  v260 = objc_msgSend_currentUserParticipant(v257, v258, v259);

  if (!v260)
  {
    v263 = objc_msgSend_callingParticipant(v91, v261, v262);

    if (v263)
    {
      v378 = v10;
      v379 = v4;
      long long v398 = 0u;
      long long v399 = 0u;
      long long v396 = 0u;
      long long v397 = 0u;
      v264 = objc_msgSend_share(v91, v261, v262);
      v267 = objc_msgSend_participants(v264, v265, v266);

      uint64_t v269 = objc_msgSend_countByEnumeratingWithState_objects_count_(v267, v268, (uint64_t)&v396, v412, 16);
      if (v269)
      {
        uint64_t v272 = v269;
        uint64_t v273 = *(void *)v397;
        while (2)
        {
          for (uint64_t i = 0; i != v272; ++i)
          {
            if (*(void *)v397 != v273) {
              objc_enumerationMutation(v267);
            }
            v275 = *(void **)(*((void *)&v396 + 1) + 8 * i);
            v276 = objc_msgSend_participantID(v275, v270, v271);
            v279 = objc_msgSend_callingParticipant(v91, v277, v278);
            v282 = objc_msgSend_participantID(v279, v280, v281);
            int isEqualToString = objc_msgSend_isEqualToString_(v276, v283, (uint64_t)v282);

            if (isEqualToString)
            {
              objc_msgSend_setIsCurrentUser_(v275, v270, 1);
              v20 = v386;
              v91 = v388;
              goto LABEL_94;
            }
            v20 = v386;
            v91 = v388;
          }
          uint64_t v272 = objc_msgSend_countByEnumeratingWithState_objects_count_(v267, v270, (uint64_t)&v396, v412, 16);
          if (v272) {
            continue;
          }
          break;
        }
      }
LABEL_94:

      id v4 = v379;
      uint64_t v10 = v378;
      objc_super v15 = v384;
    }
  }
  v285 = objc_msgSend_share(v91, v261, v262);
  v288 = objc_msgSend_currentUserParticipant(v285, v286, v287);

  id v289 = (id)*MEMORY[0x1E4F1A548];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v289);
  }

  v290 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v290, OS_LOG_TYPE_DEBUG))
  {
    v359 = objc_msgSend_share(v91, v291, v292);
    v362 = objc_msgSend_recordID(v359, v360, v361);
    *(_DWORD *)buf = 138543618;
    unint64_t v405 = (unint64_t)v362;
    __int16 v406 = 2112;
    id v407 = v288;
    _os_log_debug_impl(&dword_1C4CFF000, v290, OS_LOG_TYPE_DEBUG, "Found current user participant on share %{public}@: %@", buf, 0x16u);
  }
  v295 = objc_msgSend_shareMetadata(v20, v293, v294);
  int v298 = objc_msgSend_hasOwnerParticipant(v295, v296, v297);

  if (v298)
  {
    v301 = objc_msgSend_shareMetadata(v20, v299, v300);
    v304 = objc_msgSend_ownerParticipant(v301, v302, v303);
    v307 = objc_msgSend_recordID(v385, v305, v306);
    id v395 = 0;
    v309 = objc_msgSend_shareParticipantFromPParticipant_shareID_error_(v389, v308, (uint64_t)v304, v307, &v395);
    id v310 = v395;

    v313 = objc_msgSend_userIdentity(v309, v311, v312);
    objc_msgSend_setOwnerIdentity_(v388, v314, (uint64_t)v313);
  }
  else
  {
    id v310 = 0;
  }
  v315 = objc_msgSend_shareRecord(v20, v299, v300);
  v318 = objc_msgSend_shareInfo(v315, v316, v317);
  uint64_t v321 = objc_msgSend_potentialMatchsCount(v318, v319, v320);

  if (v321)
  {
    v324 = objc_msgSend_shareRecord(v20, v322, v323);
    v327 = objc_msgSend_shareInfo(v324, v325, v326);
    v330 = objc_msgSend_potentialMatchs(v327, v328, v329);
    v391[0] = MEMORY[0x1E4F143A8];
    v391[1] = 3221225472;
    v391[2] = sub_1C4E29A00;
    v391[3] = &unk_1E64F3E00;
    id v392 = v389;
    id v393 = v385;
    id v394 = v310;
    v332 = objc_msgSend_CKCompactMap_(v330, v331, (uint64_t)v391);
    objc_msgSend_setOutOfNetworkMatches_(v388, v333, (uint64_t)v332);
  }
  if (objc_msgSend_hasRecordZone(v20, v322, v323))
  {
    v336 = objc_msgSend_recordZone(v20, v334, v335);
    id v390 = v310;
    v338 = objc_msgSend_recordZoneFromPRecordZone_error_(v389, v337, (uint64_t)v336, &v390);
    id v80 = v390;

    v339 = (void *)*MEMORY[0x1E4F1A548];
    if (v80)
    {
      v79 = v388;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v339);
      }
      v340 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v405 = (unint64_t)v80;
        _os_log_error_impl(&dword_1C4CFF000, v340, OS_LOG_TYPE_ERROR, "Couldn't parse shared zone from resolve token response: %@", buf, 0xCu);
      }
    }
    else
    {
      id v343 = v339;
      v79 = v388;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v343);
      }

      v344 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v344, OS_LOG_TYPE_DEBUG))
      {
        v364 = objc_msgSend_zoneID(v338, v345, v346);
        v387 = objc_msgSend_share(v338, v365, v366);
        if (v387) {
          v369 = @" with shareID ";
        }
        else {
          v369 = @" without any shareID ";
        }
        v372 = objc_msgSend_share(v338, v367, v368);
        if (v372)
        {
          v379 = objc_msgSend_share(v338, v370, v371);
          objc_msgSend_recordID(v379, v374, v375);
          v373 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v373 = &stru_1F2044F30;
        }
        *(_DWORD *)buf = 138544130;
        unint64_t v405 = (unint64_t)v364;
        __int16 v406 = 2114;
        id v407 = v369;
        __int16 v408 = 2114;
        v376 = v373;
        v409 = v373;
        __int16 v410 = 2112;
        v411 = v388;
        _os_log_debug_impl(&dword_1C4CFF000, v344, OS_LOG_TYPE_DEBUG, "Parsed zone %{public}@%{public}@%{public}@from response for share metadata %@", buf, 0x2Au);
        if (v372)
        {
        }
        v79 = v388;
      }
    }
    v348 = objc_msgSend_share(v338, v341, v342);
    if (v348) {
      objc_msgSend_setSharedZone_(v79, v347, (uint64_t)v338);
    }
    else {
      objc_msgSend_setSharedZone_(v79, v347, 0);
    }

    objc_super v15 = v384;
    self = v382;
  }
  else
  {
    id v80 = v310;
    self = v382;
    v79 = v388;
  }

LABEL_120:
  objc_msgSend_tokenResolveBlock(self, v18, v19);
  v350 = v349 = self;

  if (v350)
  {
    objc_msgSend_tokenResolveBlock(v349, v351, v352);
    v353 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v356 = objc_msgSend_result(v4, v354, v355);
    ((void (**)(void, void *, void *, void *))v353)[2](v353, v15, v79, v356);
  }
  id v357 = v80;

  return v357;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v24 = a3;
  uint64_t v6 = objc_msgSend_response(v24, v4, v5);
  uint64_t v9 = objc_msgSend_operationUUID(v6, v7, v8);

  uint64_t v12 = objc_msgSend_lookupInfosByRequestID(self, v10, v11);
  v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v9);

  uint64_t v17 = objc_msgSend_tokenResolveBlock(self, v15, v16);

  if (v17)
  {
    objc_msgSend_tokenResolveBlock(self, v18, v19);
    v20 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_result(v24, v21, v22);
    ((void (**)(void, void *, void, void *))v20)[2](v20, v14, 0, v23);
  }
}

- (NSSet)rootRecordDesiredKeySet
{
  return self->_rootRecordDesiredKeySet;
}

- (void)setRootRecordDesiredKeySet:(id)a3
{
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchunsigned int RootRecord = a3;
}

- (id)tokenResolveBlock
{
  return self->_tokenResolveBlock;
}

- (void)setTokenResolveBlock:(id)a3
{
}

- (NSArray)lookupInfos
{
  return self->_lookupInfos;
}

- (void)setLookupInfos:(id)a3
{
}

- (NSMutableDictionary)lookupInfosByRequestID
{
  return self->_lookupInfosByRequestID;
}

- (void)setLookupInfosByRequestID:(id)a3
{
}

- (CKDProtocolTranslator)privateDBTranslator
{
  return self->_privateDBTranslator;
}

- (void)setPrivateDBTranslator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDBTranslator, 0);
  objc_storeStrong((id *)&self->_lookupInfosByRequestID, 0);
  objc_storeStrong((id *)&self->_lookupInfos, 0);
  objc_storeStrong(&self->_tokenResolveBlock, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeySet, 0);
}

@end