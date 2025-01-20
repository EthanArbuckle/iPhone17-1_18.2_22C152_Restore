@interface CKSyncEngineDataSourceAdapter
- (BOOL)syncEngine:(id)a3 shouldFetchAssetContentsForZoneID:(id)a4;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (CKSyncEngineDataSource)dataSource;
- (CKSyncEngineDataSourceAdapter)initWithDataSource:(id)a3;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (id)syncEngine:(id)a3 relatedApplicationBundleIdentifiersForZoneIDs:(id)a4 recordIDs:(id)a5;
- (void)setDataSource:(id)a3;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
@end

@implementation CKSyncEngineDataSourceAdapter

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  uint64_t v433 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v8 = ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v432 = self;
    _os_log_debug_impl(&dword_18AF10000, v8, OS_LOG_TYPE_DEBUG, "%@ is handling event for CKSyncEngineDataSourceAdapter", buf, 0xCu);
  }
  v12 = objc_msgSend_dataSource(self, v9, v10, v11);
  switch(objc_msgSend_type(v7, v13, v14, v15))
  {
    case 0:
      v19 = objc_msgSend_stateUpdateEvent(v7, v16, v17, v18);
      v23 = objc_msgSend_stateSerialization(v19, v20, v21, v22);
      v27 = objc_msgSend_data(v23, v24, v25, v26);
      objc_msgSend_syncEngine_didUpdateMetadata_(v12, v28, (uint64_t)v6, (uint64_t)v27);
      goto LABEL_91;
    case 1:
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_152;
      }
      v19 = objc_msgSend_accountChangeEvent(v7, v29, v30, v31);
      v23 = objc_msgSend_previousUser(v19, v32, v33, v34);
      v27 = objc_msgSend_currentUser(v19, v35, v36, v37);
      objc_msgSend_syncEngine_accountChangedFromUserRecordID_toUserRecordID_(v12, v38, (uint64_t)v6, (uint64_t)v23, v27);
      goto LABEL_91;
    case 2:
      objc_msgSend_fetchedDatabaseChangesEvent(v7, v16, v17, v18);
      long long v410 = 0u;
      long long v411 = 0u;
      long long v412 = 0u;
      v360 = long long v413 = 0u;
      v42 = objc_msgSend_modifications(v360, v39, v40, v41);
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v410, (uint64_t)v430, 16);
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v411;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v411 != v46) {
              objc_enumerationMutation(v42);
            }
            v48 = *(void **)(*((void *)&v410 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v52 = objc_msgSend_zoneID(v48, v49, v50, v51);
              objc_msgSend_syncEngine_zoneWithIDChanged_(v12, v53, (uint64_t)v6, (uint64_t)v52);
            }
          }
          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v49, (uint64_t)&v410, (uint64_t)v430, 16);
        }
        while (v45);
      }
      id v355 = v7;

      long long v408 = 0u;
      long long v409 = 0u;
      long long v406 = 0u;
      long long v407 = 0u;
      v57 = objc_msgSend_deletions(v360, v54, v55, v56);
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v406, (uint64_t)v429, 16);
      if (!v59) {
        goto LABEL_36;
      }
      uint64_t v63 = v59;
      uint64_t v64 = *(void *)v407;
      break;
    case 3:
      v78 = objc_msgSend_fetchedRecordZoneChangesEvent(v7, v16, v17, v18);
      long long v402 = 0u;
      long long v403 = 0u;
      long long v404 = 0u;
      long long v405 = 0u;
      v82 = objc_msgSend_modifications(v78, v79, v80, v81);
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v402, (uint64_t)v428, 16);
      if (v84)
      {
        uint64_t v86 = v84;
        uint64_t v87 = *(void *)v403;
        do
        {
          for (uint64_t j = 0; j != v86; ++j)
          {
            if (*(void *)v403 != v87) {
              objc_enumerationMutation(v82);
            }
            objc_msgSend_syncEngine_didFetchRecord_(v12, v85, (uint64_t)v6, *(void *)(*((void *)&v402 + 1) + 8 * j));
          }
          uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v85, (uint64_t)&v402, (uint64_t)v428, 16);
        }
        while (v86);
      }

      long long v400 = 0u;
      long long v401 = 0u;
      long long v398 = 0u;
      long long v399 = 0u;
      v92 = objc_msgSend_deletions(v78, v89, v90, v91);
      uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v398, (uint64_t)v427, 16);
      if (v94)
      {
        uint64_t v98 = v94;
        uint64_t v99 = *(void *)v399;
        do
        {
          for (uint64_t k = 0; k != v98; ++k)
          {
            if (*(void *)v399 != v99) {
              objc_enumerationMutation(v92);
            }
            v101 = *(void **)(*((void *)&v398 + 1) + 8 * k);
            v102 = objc_msgSend_recordID(v101, v95, v96, v97);
            v106 = objc_msgSend_recordType(v101, v103, v104, v105);
            objc_msgSend_syncEngine_recordWithIDWasDeleted_recordType_(v12, v107, (uint64_t)v6, (uint64_t)v102, v106);
          }
          uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v398, (uint64_t)v427, 16);
        }
        while (v98);
      }

      goto LABEL_151;
    case 4:
      v78 = objc_msgSend_sentDatabaseChangesEvent(v7, v16, v17, v18);
      v111 = objc_msgSend_savedZones(v78, v108, v109, v110);
      if (!objc_msgSend_count(v111, v112, v113, v114)) {
        goto LABEL_61;
      }
      char v115 = objc_opt_respondsToSelector();

      if (v115)
      {
        long long v396 = 0u;
        long long v397 = 0u;
        long long v394 = 0u;
        long long v395 = 0u;
        v111 = objc_msgSend_savedZones(v78, v116, v117, v118);
        uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v119, (uint64_t)&v394, (uint64_t)v426, 16);
        if (v120)
        {
          uint64_t v122 = v120;
          uint64_t v123 = *(void *)v395;
          do
          {
            for (uint64_t m = 0; m != v122; ++m)
            {
              if (*(void *)v395 != v123) {
                objc_enumerationMutation(v111);
              }
              objc_msgSend_syncEngine_didSaveRecordZone_(v12, v121, (uint64_t)v6, *(void *)(*((void *)&v394 + 1) + 8 * m));
            }
            uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v121, (uint64_t)&v394, (uint64_t)v426, 16);
          }
          while (v122);
        }
LABEL_61:
      }
      v125 = objc_msgSend_failedZoneSaves(v78, v116, v117, v118);
      if (!objc_msgSend_count(v125, v126, v127, v128)) {
        goto LABEL_71;
      }
      char v129 = objc_opt_respondsToSelector();

      if (v129)
      {
        long long v392 = 0u;
        long long v393 = 0u;
        long long v390 = 0u;
        long long v391 = 0u;
        v125 = objc_msgSend_failedZoneSaves(v78, v130, v131, v132);
        uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v133, (uint64_t)&v390, (uint64_t)v425, 16);
        if (v134)
        {
          uint64_t v138 = v134;
          uint64_t v139 = *(void *)v391;
          do
          {
            for (uint64_t n = 0; n != v138; ++n)
            {
              if (*(void *)v391 != v139) {
                objc_enumerationMutation(v125);
              }
              v141 = *(void **)(*((void *)&v390 + 1) + 8 * n);
              v142 = objc_msgSend_recordZone(v141, v135, v136, v137);
              v146 = objc_msgSend_error(v141, v143, v144, v145);
              objc_msgSend_syncEngine_failedToSaveRecordZone_error_(v12, v147, (uint64_t)v6, (uint64_t)v142, v146);
            }
            uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v135, (uint64_t)&v390, (uint64_t)v425, 16);
          }
          while (v138);
        }
LABEL_71:
      }
      v148 = objc_msgSend_deletedZoneIDs(v78, v130, v131, v132);
      if (!objc_msgSend_count(v148, v149, v150, v151)) {
        goto LABEL_81;
      }
      char v152 = objc_opt_respondsToSelector();

      if (v152)
      {
        long long v388 = 0u;
        long long v389 = 0u;
        long long v386 = 0u;
        long long v387 = 0u;
        v148 = objc_msgSend_deletedZoneIDs(v78, v153, v154, v155);
        uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v156, (uint64_t)&v386, (uint64_t)v424, 16);
        if (v157)
        {
          uint64_t v159 = v157;
          uint64_t v160 = *(void *)v387;
          do
          {
            for (iuint64_t i = 0; ii != v159; ++ii)
            {
              if (*(void *)v387 != v160) {
                objc_enumerationMutation(v148);
              }
              objc_msgSend_syncEngine_didDeleteRecordZoneWithID_(v12, v158, (uint64_t)v6, *(void *)(*((void *)&v386 + 1) + 8 * ii));
            }
            uint64_t v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v158, (uint64_t)&v386, (uint64_t)v424, 16);
          }
          while (v159);
        }
LABEL_81:
      }
      v162 = objc_msgSend_failedZoneDeletes(v78, v153, v154, v155);
      if (!objc_msgSend_count(v162, v163, v164, v165)) {
        goto LABEL_150;
      }
      char v166 = objc_opt_respondsToSelector();

      if ((v166 & 1) == 0) {
        goto LABEL_151;
      }
      v170 = objc_msgSend_failedZoneDeletes(v78, v167, v168, v169);
      v383[0] = MEMORY[0x1E4F143A8];
      v383[1] = 3221225472;
      v383[2] = sub_18B088480;
      v383[3] = &unk_1E5463040;
      id v384 = v12;
      id v385 = v6;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v170, v171, (uint64_t)v383, v172);

      v162 = v384;
      goto LABEL_150;
    case 5:
      char v352 = objc_opt_respondsToSelector();
      if (v352)
      {
        v78 = objc_opt_new();
        v363 = objc_opt_new();
        v176 = objc_opt_new();
        v354 = objc_opt_new();
        v361 = objc_opt_new();
      }
      else
      {
        v361 = 0;
        v363 = 0;
        v176 = 0;
        v78 = 0;
        v354 = 0;
      }
      objc_msgSend_sentRecordZoneChangesEvent(v7, v173, v174, v175);
      long long v379 = 0u;
      long long v380 = 0u;
      long long v381 = 0u;
      v359 = long long v382 = 0u;
      v248 = objc_msgSend_savedRecords(v359, v245, v246, v247);
      uint64_t v250 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v249, (uint64_t)&v379, (uint64_t)v423, 16);
      if (v250)
      {
        uint64_t v252 = v250;
        uint64_t v253 = *(void *)v380;
        do
        {
          for (juint64_t j = 0; jj != v252; ++jj)
          {
            if (*(void *)v380 != v253) {
              objc_enumerationMutation(v248);
            }
            uint64_t v255 = *(void *)(*((void *)&v379 + 1) + 8 * jj);
            objc_msgSend_syncEngine_didSaveRecord_(v12, v251, (uint64_t)v6, v255);
            objc_msgSend_addObject_(v78, v256, v255, v257);
            objc_msgSend_addObject_(v176, v258, v255, v259);
          }
          uint64_t v252 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v251, (uint64_t)&v379, (uint64_t)v423, 16);
        }
        while (v252);
      }
      uint64_t v353 = (uint64_t)v176;
      id v357 = v7;

      long long v377 = 0u;
      long long v378 = 0u;
      long long v375 = 0u;
      long long v376 = 0u;
      v263 = objc_msgSend_failedRecordSaves(v359, v260, v261, v262);
      uint64_t v265 = objc_msgSend_countByEnumeratingWithState_objects_count_(v263, v264, (uint64_t)&v375, (uint64_t)v422, 16);
      if (v265)
      {
        uint64_t v269 = v265;
        uint64_t v270 = *(void *)v376;
        do
        {
          for (kuint64_t k = 0; kk != v269; ++kk)
          {
            if (*(void *)v376 != v270) {
              objc_enumerationMutation(v263);
            }
            v272 = *(void **)(*((void *)&v375 + 1) + 8 * kk);
            v273 = objc_msgSend_error(v272, v266, v267, v268);
            BOOL v276 = sub_18B088494(v273, 0, v274, v275);

            if (!v276)
            {
              v280 = objc_msgSend_record(v272, v277, v278, v279);
              v284 = objc_msgSend_error(v272, v281, v282, v283);
              objc_msgSend_syncEngine_failedToSaveRecord_error_(v12, v285, (uint64_t)v6, (uint64_t)v280, v284);
            }
            v286 = objc_msgSend_record(v272, v277, v278, v279);
            objc_msgSend_addObject_(v78, v287, (uint64_t)v286, v288);

            v292 = objc_msgSend_error(v272, v289, v290, v291);
            v296 = objc_msgSend_record(v272, v293, v294, v295);
            v300 = objc_msgSend_recordID(v296, v297, v298, v299);
            objc_msgSend_setObject_forKeyedSubscript_(v361, v301, (uint64_t)v292, (uint64_t)v300);
          }
          uint64_t v269 = objc_msgSend_countByEnumeratingWithState_objects_count_(v263, v266, (uint64_t)&v375, (uint64_t)v422, 16);
        }
        while (v269);
      }

      long long v373 = 0u;
      long long v374 = 0u;
      long long v371 = 0u;
      long long v372 = 0u;
      v305 = objc_msgSend_deletedRecordIDs(v359, v302, v303, v304);
      uint64_t v307 = objc_msgSend_countByEnumeratingWithState_objects_count_(v305, v306, (uint64_t)&v371, (uint64_t)v421, 16);
      v309 = (void *)v353;
      if (v307)
      {
        uint64_t v310 = v307;
        uint64_t v311 = *(void *)v372;
        do
        {
          for (muint64_t m = 0; mm != v310; ++mm)
          {
            if (*(void *)v372 != v311) {
              objc_enumerationMutation(v305);
            }
            uint64_t v313 = *(void *)(*((void *)&v371 + 1) + 8 * mm);
            objc_msgSend_syncEngine_didDeleteRecordWithID_(v12, v308, (uint64_t)v6, v313);
            objc_msgSend_addObject_(v363, v314, v313, v315);
            objc_msgSend_addObject_(v354, v316, v313, v317);
          }
          uint64_t v310 = objc_msgSend_countByEnumeratingWithState_objects_count_(v305, v308, (uint64_t)&v371, (uint64_t)v421, 16);
        }
        while (v310);
      }

      v321 = objc_msgSend_failedRecordDeletes(v359, v318, v319, v320);
      v366[0] = MEMORY[0x1E4F143A8];
      v366[1] = 3221225472;
      v366[2] = sub_18B088754;
      v366[3] = &unk_1E5463068;
      id v322 = v12;
      id v367 = v322;
      id v323 = v6;
      id v368 = v323;
      id v324 = v363;
      id v369 = v324;
      id v325 = v361;
      id v370 = v325;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v321, v326, (uint64_t)v366, v327);

      id v7 = v357;
      if (v352)
      {
        v328 = [CKSyncEngineBatch alloc];
        v330 = objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v328, v329, (uint64_t)v78, (uint64_t)v324);
        objc_msgSend_setSavedRecords_(v330, v331, v353, v332);
        objc_msgSend_setDeletedRecordIDs_(v330, v333, (uint64_t)v354, v334);
        if (objc_msgSend_count(v325, v335, v336, v337))
        {
          v419 = @"CKPartialErrors";
          id v420 = v325;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v338, (uint64_t)&v420, (uint64_t)&v419, 1);
          v339 = uint64_t v365 = (uint64_t)v323;
          v341 = objc_msgSend_errorWithCode_userInfo_format_(CKPrettyError, v340, 2, (uint64_t)v339, @"Failed to send changes");

          objc_msgSend_syncEngine_didCompleteModifyRecordsBatch_error_(v322, v342, v365, (uint64_t)v330, v341);
        }
        else
        {
          v341 = 0;
          objc_msgSend_syncEngine_didCompleteModifyRecordsBatch_error_(v322, v338, (uint64_t)v323, (uint64_t)v330, 0);
        }

        v309 = (void *)v353;
      }

      goto LABEL_151;
    case 6:
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_syncEngineWillBeginFetchingChanges_(v12, v177, (uint64_t)v6, v178);
      }
      goto LABEL_152;
    case 7:
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_152;
      }
      v19 = objc_msgSend_willFetchRecordZoneChangesEvent(v7, v179, v180, v181);
      v23 = objc_msgSend_zoneID(v19, v182, v183, v184);
      v418 = v23;
      v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v185, (uint64_t)&v418, 1);
      objc_msgSend_syncEngine_willBeginFetchingChangesForZoneIDs_(v12, v186, (uint64_t)v6, (uint64_t)v27);
LABEL_91:

      goto LABEL_152;
    case 8:
      v78 = objc_msgSend_didFetchRecordZoneChangesEvent(v7, v16, v17, v18);
      uint64_t v190 = objc_msgSend_error(v78, v187, v188, v189);
      if (!v190) {
        goto LABEL_148;
      }
      v191 = (void *)v190;
      char v192 = objc_opt_respondsToSelector();

      if ((v192 & 1) == 0) {
        goto LABEL_148;
      }
      v196 = objc_msgSend_zoneID(v78, v193, v194, v195);
      v200 = objc_msgSend_error(v78, v197, v198, v199);
      v204 = objc_msgSend_CKClientSuitableError(v200, v201, v202, v203);
      if (objc_msgSend_code(v204, v205, v206, v207) == 2)
      {
        v362 = v200;
        v364 = v196;
        id v356 = v7;
        id v211 = objc_alloc(MEMORY[0x1E4F1CA60]);
        v215 = objc_msgSend_userInfo(v204, v212, v213, v214);
        v217 = objc_msgSend_initWithDictionary_copyItems_(v211, v216, (uint64_t)v215, 1);

        id v218 = objc_alloc(MEMORY[0x1E4F1CA60]);
        v358 = v217;
        v221 = objc_msgSend_objectForKeyedSubscript_(v217, v219, @"CKPartialErrors", v220);
        v223 = objc_msgSend_initWithDictionary_copyItems_(v218, v222, (uint64_t)v221, 1);

        long long v416 = 0u;
        long long v417 = 0u;
        long long v414 = 0u;
        long long v415 = 0u;
        v227 = objc_msgSend_allKeys(v223, v224, v225, v226);
        uint64_t v229 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v228, (uint64_t)&v414, (uint64_t)buf, 16);
        if (!v229) {
          goto LABEL_103;
        }
        uint64_t v232 = v229;
        uint64_t v233 = *(void *)v415;
        while (1)
        {
          for (nuint64_t n = 0; nn != v232; ++nn)
          {
            if (*(void *)v415 != v233) {
              objc_enumerationMutation(v227);
            }
            objc_msgSend_objectForKeyedSubscript_(v223, v230, *(void *)(*((void *)&v414 + 1) + 8 * nn), v231);
            id v235 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_code(v235, v236, v237, v238) == 112)
            {

              goto LABEL_143;
            }
          }
          uint64_t v232 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v230, (uint64_t)&v414, (uint64_t)buf, 16);
          if (!v232)
          {
LABEL_103:

            id v235 = 0;
LABEL_143:
            id v7 = v356;
            v200 = v362;
            v196 = v364;
            goto LABEL_145;
          }
        }
      }
      if (objc_msgSend_code(v204, v208, v209, v210) == 112) {
        id v235 = v204;
      }
      else {
        id v235 = 0;
      }
LABEL_145:

      if (v235)
      {
        v346 = objc_msgSend_zoneID(v78, v343, v344, v345);
        objc_msgSend_syncEngine_failedToFetchChangesForRecordZoneID_error_(v12, v347, (uint64_t)v6, (uint64_t)v346, v235);
      }
LABEL_148:
      if (objc_opt_respondsToSelector())
      {
        v162 = objc_msgSend_zoneID(v78, v348, v349, v350);
        objc_msgSend_syncEngine_didEndFetchingChangesForZoneID_(v12, v351, (uint64_t)v6, (uint64_t)v162);
LABEL_150:
      }
LABEL_151:

LABEL_152:
      return;
    case 9:
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_syncEngineDidEndFetchingChanges_(v12, v239, (uint64_t)v6, v240);
      }
      goto LABEL_152;
    case 10:
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_syncEngineWillBeginModifyingPendingChanges_(v12, v241, (uint64_t)v6, v242);
      }
      goto LABEL_152;
    case 11:
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_syncEngineDidEndModifyingPendingChanges_(v12, v243, (uint64_t)v6, v244);
      }
      goto LABEL_152;
    default:
      goto LABEL_152;
  }
LABEL_20:
  uint64_t v65 = 0;
  while (1)
  {
    if (*(void *)v407 != v64) {
      objc_enumerationMutation(v57);
    }
    v66 = *(void **)(*((void *)&v406 + 1) + 8 * v65);
    uint64_t v67 = objc_msgSend_reason(v66, v60, v61, v62);
    if (v67 == 2)
    {
      if (objc_opt_respondsToSelector())
      {
        v71 = objc_msgSend_zoneID(v66, v68, v69, v70);
        objc_msgSend_syncEngine_zoneWithIDWasDeletedDueToUserEncryptedDataReset_(v12, v72, (uint64_t)v6, (uint64_t)v71);
LABEL_33:

        goto LABEL_34;
      }
    }
    else if (v67 == 1)
    {
      if (objc_opt_respondsToSelector())
      {
        v71 = objc_msgSend_zoneID(v66, v73, v74, v75);
        objc_msgSend_syncEngine_zoneWithIDWasPurged_(v12, v76, (uint64_t)v6, (uint64_t)v71);
        goto LABEL_33;
      }
    }
    else if (v67)
    {
      goto LABEL_34;
    }
    if (objc_opt_respondsToSelector())
    {
      v71 = objc_msgSend_zoneID(v66, v60, v61, v62);
      objc_msgSend_syncEngine_zoneWithIDWasDeleted_(v12, v77, (uint64_t)v6, (uint64_t)v71);
      goto LABEL_33;
    }
LABEL_34:
    if (v63 == ++v65)
    {
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v406, (uint64_t)v429, 16);
      if (!v63)
      {
LABEL_36:

        id v7 = v355;
        goto LABEL_152;
      }
      goto LABEL_20;
    }
  }
}

- (CKSyncEngineDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CKSyncEngineDataSource *)WeakRetained;
}

- (CKSyncEngineDataSourceAdapter)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKSyncEngineDataSourceAdapter;
  v5 = [(CKSyncEngineDataSourceAdapter *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v8 = ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v76 = self;
    __int16 v77 = 2112;
    id v78 = v7;
    _os_log_debug_impl(&dword_18AF10000, v8, OS_LOG_TYPE_DEBUG, "%@ about to get next record change batch for context: %@", buf, 0x16u);
  }
  v12 = objc_msgSend_options(v7, v9, v10, v11);
  v16 = objc_msgSend_scope(v12, v13, v14, v15);

  v20 = objc_msgSend_dataSource(self, v17, v18, v19);
  if (v20)
  {
    if (objc_opt_respondsToSelector())
    {
      v24 = objc_msgSend_zoneIDs(v16, v21, v22, v23);
      objc_msgSend_syncEngine_nextBatchOfRecordsToModifyForZoneIDs_(v20, v25, (uint64_t)v6, (uint64_t)v24);
      id v26 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setCustomBatch_(v26, v27, 1, v28);
      v29 = [CKSyncEngineRecordZoneChangeBatch alloc];
      uint64_t v33 = objc_msgSend_recordsToSave(v26, v30, v31, v32);
      uint64_t v37 = objc_msgSend_recordIDsToDelete(v26, v34, v35, v36);
      uint64_t isAtomic = objc_msgSend_isAtomic(v26, v38, v39, v40);
      v43 = objc_msgSend_initWithRecordsToSave_recordIDsToDelete_atomicByZone_(v29, v42, (uint64_t)v33, (uint64_t)v37, isAtomic);
    }
    else
    {
      uint64_t v44 = objc_opt_new();
      v48 = objc_msgSend_state(v6, v45, v46, v47);
      v52 = objc_msgSend_pendingRecordZoneChanges(v48, v49, v50, v51);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = sub_18B088B5C;
      v73[3] = &unk_1E5463090;
      id v74 = v16;
      uint64_t v55 = objc_msgSend_CKFilter_(v52, v53, (uint64_t)v73, v54);

      uint64_t v56 = [CKSyncEngineRecordZoneChangeBatch alloc];
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = sub_18B088BA4;
      uint64_t v69 = &unk_1E54630B8;
      id v70 = v20;
      id v57 = v6;
      id v71 = v57;
      id v72 = v44;
      id v26 = v44;
      v43 = objc_msgSend_initWithPendingChanges_recordProvider_(v56, v58, (uint64_t)v55, (uint64_t)&v66);
      uint64_t v62 = objc_msgSend_state(v57, v59, v60, v61, v66, v67, v68, v69);
      objc_msgSend_removePendingRecordZoneChanges_(v62, v63, (uint64_t)v26, v64);

      uint64_t v33 = v74;
    }
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_dataSource(self, v8, v9, v10);
  if (v11)
  {
    if (objc_opt_respondsToSelector()) {
      char ChangesForZoneID = objc_msgSend_syncEngine_shouldFetchChangesForZoneID_(v11, v12, (uint64_t)v6, (uint64_t)v7);
    }
    else {
      char ChangesForZoneID = 1;
    }
  }
  else
  {
    char ChangesForZoneID = 0;
  }

  return ChangesForZoneID;
}

- (BOOL)syncEngine:(id)a3 shouldFetchAssetContentsForZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_dataSource(self, v8, v9, v10);
  if (objc_opt_respondsToSelector()) {
    char AssetContentsForZoneID = objc_msgSend_syncEngine_shouldFetchAssetContentsForZoneID_(v11, v12, (uint64_t)v6, (uint64_t)v7);
  }
  else {
    char AssetContentsForZoneID = 1;
  }

  return AssetContentsForZoneID;
}

- (id)syncEngine:(id)a3 relatedApplicationBundleIdentifiersForZoneIDs:(id)a4 recordIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_dataSource(self, v11, v12, v13);
  if (objc_opt_respondsToSelector())
  {
    v16 = objc_msgSend_syncEngine_relatedApplicationBundleIdentifiersForZoneIDs_recordIDs_(v14, v15, (uint64_t)v8, (uint64_t)v9, v10);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end