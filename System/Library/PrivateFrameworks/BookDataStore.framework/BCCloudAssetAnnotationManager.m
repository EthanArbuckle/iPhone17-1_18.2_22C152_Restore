@interface BCCloudAssetAnnotationManager
- (BCCloudAssetAnnotationManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4;
- (BCCloudDataManager)dataManager;
- (BCCloudDataSource)annotationsDataSource;
- (BCCloudDataSyncManager)syncManager;
- (BCCloudKitController)cloudKitController;
- (BOOL)enableCloudSync;
- (NSURL)ckAssetStoreDirectory;
- (id)entityName;
- (id)fileURLForCachingCKAssetWithAssetID:(id)a3;
- (void)assetWithID:(id)a3 updatedAnnotations:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)getAnnotationChangesSince:(id)a3 completion:(id)a4;
- (void)setAnnotationsDataSource:(id)a3;
- (void)setCkAssetStoreDirectory:(id)a3;
- (void)setCloudKitController:(id)a3;
- (void)setDataManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setSyncManager:(id)a3;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
@end

@implementation BCCloudAssetAnnotationManager

- (BCCloudAssetAnnotationManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v84.receiver = self;
  v84.super_class = (Class)BCCloudAssetAnnotationManager;
  v9 = [(BCCloudAssetAnnotationManager *)&v84 init];
  uint64_t v10 = (uint64_t)v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_annotationsDataSource, a3);
    objc_storeWeak((id *)(v10 + 24), v8);
    v11 = [BCCloudDataSyncManager alloc];
    uint64_t v18 = objc_msgSend_initWithCloudKitController_(v11, v12, (uint64_t)v8, v13, v14, v15, v16, v17);
    v19 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v18;

    objc_msgSend_setDelegate_(*(void **)(v10 + 40), v20, v10, v21, v22, v23, v24, v25);
    v26 = [BCCloudDataManager alloc];
    v34 = objc_msgSend_entityName((void *)v10, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = *(void *)(v10 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(v10 + 24));
    uint64_t v40 = objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_(v26, v39, (uint64_t)v7, (uint64_t)v34, @"BCCloudAssetAnnotationManagerChanged", v35, v36, v37, WeakRetained);
    v41 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = v40;

    v42 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v43 = dispatch_queue_create("com.apple.BCCloudAssetAnnotationManager", v42);
    v44 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v43;

    v52 = objc_msgSend_applicationCacheDirectory(BDSApplication, v45, v46, v47, v48, v49, v50, v51);
    v59 = objc_msgSend_stringByAppendingPathComponent_(v52, v53, @"BCCloudAssetAnnotationManagerAssetCache", v54, v55, v56, v57, v58);
    uint64_t v66 = objc_msgSend_fileURLWithPath_(NSURL, v60, (uint64_t)v59, v61, v62, v63, v64, v65);
    v67 = *(void **)(v10 + 56);
    *(void *)(v10 + 56) = v66;

    v75 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v68, v69, v70, v71, v72, v73, v74);
    uint64_t v76 = *(void *)(v10 + 56);
    id v83 = 0;
    objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v75, v77, v76, 1, 0, (uint64_t)&v83, v78, v79);
    id v80 = v83;

    if (v80)
    {
      v81 = BDSCloudKitLog();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        sub_2361F878C((uint64_t *)(v10 + 56), (uint64_t)v80, v81);
      }
    }
  }

  return (BCCloudAssetAnnotationManager *)v10;
}

- (void)dealloc
{
  objc_msgSend_setDelegate_(self->_syncManager, a2, 0, v2, v3, v4, v5, v6);
  v8.receiver = self;
  v8.super_class = (Class)BCCloudAssetAnnotationManager;
  [(BCCloudAssetAnnotationManager *)&v8 dealloc];
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v8 = a3;
  uint64_t v108 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend_shared(MEMORY[0x263F2BA58], a2, a3, v3, v4, v5, v6, v7);
  int v18 = objc_msgSend_verboseLoggingEnabled(v10, v11, v12, v13, v14, v15, v16, v17);

  if (v18)
  {
    v26 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = @"NO";
      if (v8) {
        v27 = @"YES";
      }
      int v106 = 138412290;
      v107 = v27;
      _os_log_impl(&dword_2360BC000, v26, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudAssetAnnotationManager #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v106, 0xCu);
    }
  }
  if (self->_enableCloudSync != v8)
  {
    self->_enableCloudSync = v8;
    if (v8)
    {
      uint64_t v28 = objc_msgSend_cloudKitController(self, v19, v20, v21, v22, v23, v24, v25);
      uint64_t v36 = objc_msgSend_privateCloudDatabaseController(v28, v29, v30, v31, v32, v33, v34, v35);
      v44 = objc_msgSend_syncManager(self, v37, v38, v39, v40, v41, v42, v43);
      objc_msgSend_addObserver_recordType_(v36, v45, (uint64_t)v44, @"assetAnnotations", v46, v47, v48, v49);

      uint64_t v57 = objc_msgSend_cloudKitController(self, v50, v51, v52, v53, v54, v55, v56);
      uint64_t v65 = objc_msgSend_transactionManager(v57, v58, v59, v60, v61, v62, v63, v64);
      uint64_t v73 = objc_msgSend_entityName(self, v66, v67, v68, v69, v70, v71, v72);
      v81 = objc_msgSend_syncManager(self, v74, v75, v76, v77, v78, v79, v80);
      objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v65, v82, (uint64_t)v73, (uint64_t)v81, v83, v84, v85, v86);
    }
    else
    {
      uint64_t v57 = objc_msgSend_sharedInstance(BCCloudKitController, v19, v20, v21, v22, v23, v24, v25);
      uint64_t v65 = objc_msgSend_privateCloudDatabaseController(v57, v87, v88, v89, v90, v91, v92, v93);
      uint64_t v73 = objc_msgSend_syncManager(self, v94, v95, v96, v97, v98, v99, v100);
      objc_msgSend_removeObserver_recordType_(v65, v101, (uint64_t)v73, @"assetAnnotations", v102, v103, v104, v105);
    }
  }
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  objc_msgSend_dataManager(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)assetWithID:(id)a3 updatedAnnotations:(id)a4 completion:(id)a5
{
  uint64_t v638 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v631 = a5;
  uint64_t v9 = objc_opt_new();
  v632 = v7;
  objc_msgSend_setAssetID_(v9, v10, (uint64_t)v7, v11, v12, v13, v14, v15);
  uint64_t v23 = objc_msgSend_appVersion(BDSAppVersion, v16, v17, v18, v19, v20, v21, v22);
  objc_msgSend_setAppVersion_(v9, v24, (uint64_t)v23, v25, v26, v27, v28, v29);

  uint64_t v37 = objc_msgSend_lastObject(v8, v30, v31, v32, v33, v34, v35, v36);
  uint64_t v38 = BUProtocolCast();

  v629 = v38;
  v628 = objc_msgSend_assetVersion(v38, v39, v40, v41, v42, v43, v44, v45);
  objc_msgSend_setAssetVersion_(v9, v46, (uint64_t)v628, v47, v48, v49, v50, v51);
  long long v635 = 0u;
  long long v636 = 0u;
  long long v633 = 0u;
  long long v634 = 0u;
  id v52 = v8;
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v633, (uint64_t)v637, 16, v54, v55, v56);
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v634;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v634 != v59) {
          objc_enumerationMutation(v52);
        }
        uint64_t v61 = *(void **)(*((void *)&v633 + 1) + 8 * v60);
        uint64_t v62 = objc_opt_new();
        uint64_t v70 = objc_msgSend_annotationCreatorIdentifier(v61, v63, v64, v65, v66, v67, v68, v69);
        objc_msgSend_setCreatorIdentifier_(v62, v71, (uint64_t)v70, v72, v73, v74, v75, v76);

        uint64_t v84 = objc_msgSend_annotationUuid(v61, v77, v78, v79, v80, v81, v82, v83);
        objc_msgSend_setUuid_(v62, v85, (uint64_t)v84, v86, v87, v88, v89, v90);

        uint64_t v98 = objc_msgSend_annotationModificationDate(v61, v91, v92, v93, v94, v95, v96, v97);
        objc_msgSend_timeIntervalSinceReferenceDate(v98, v99, v100, v101, v102, v103, v104, v105);
        objc_msgSend_setModificationDate_(v62, v106, v107, v108, v109, v110, v111, v112);

        if (objc_msgSend_isAnnotationDeleted(v61, v113, v114, v115, v116, v117, v118, v119))
        {
          bc_turnProtoAnnotationIntoTombstone(v62);
        }
        else
        {
          v134 = objc_msgSend_annotationCreationDate(v61, v120, v121, v122, v123, v124, v125, v126);
          objc_msgSend_timeIntervalSinceReferenceDate(v134, v135, v136, v137, v138, v139, v140, v141);
          objc_msgSend_setCreationDate_(v62, v142, v143, v144, v145, v146, v147, v148);

          uint64_t isAnnotationDeleted = objc_msgSend_isAnnotationDeleted(v61, v149, v150, v151, v152, v153, v154, v155);
          objc_msgSend_setDeleted_(v62, v157, isAnnotationDeleted, v158, v159, v160, v161, v162);
          uint64_t IsUnderline = objc_msgSend_annotationIsUnderline(v61, v163, v164, v165, v166, v167, v168, v169);
          objc_msgSend_setIsUnderline_(v62, v171, IsUnderline, v172, v173, v174, v175, v176);
          v184 = objc_msgSend_annotationLocation(v61, v177, v178, v179, v180, v181, v182, v183);
          objc_msgSend_setLocationCFIString_(v62, v185, (uint64_t)v184, v186, v187, v188, v189, v190);

          v198 = objc_msgSend_annotationNote(v61, v191, v192, v193, v194, v195, v196, v197);
          objc_msgSend_setNote_(v62, v199, (uint64_t)v198, v200, v201, v202, v203, v204);

          v212 = objc_msgSend_annotationRepresentativeText(v61, v205, v206, v207, v208, v209, v210, v211);
          objc_msgSend_setRepresentativeText_(v62, v213, (uint64_t)v212, v214, v215, v216, v217, v218);

          v226 = objc_msgSend_annotationSelectedText(v61, v219, v220, v221, v222, v223, v224, v225);
          objc_msgSend_setSelectedText_(v62, v227, (uint64_t)v226, v228, v229, v230, v231, v232);

          v240 = objc_msgSend_annotationStyleNumber(v61, v233, v234, v235, v236, v237, v238, v239);
          uint64_t v248 = objc_msgSend_intValue(v240, v241, v242, v243, v244, v245, v246, v247);
          objc_msgSend_setStyle_(v62, v249, v248, v250, v251, v252, v253, v254);

          v262 = objc_msgSend_annotationTypeNumber(v61, v255, v256, v257, v258, v259, v260, v261);
          uint64_t v270 = objc_msgSend_intValue(v262, v263, v264, v265, v266, v267, v268, v269);
          objc_msgSend_setType_(v62, v271, v270, v272, v273, v274, v275, v276);

          v284 = objc_msgSend_physicalPageNumber(v61, v277, v278, v279, v280, v281, v282, v283);
          objc_msgSend_setPhysicalPageNumber_(v62, v285, (uint64_t)v284, v286, v287, v288, v289, v290);

          v298 = objc_msgSend_annotationVersion(v61, v291, v292, v293, v294, v295, v296, v297);
          objc_msgSend_setAnnotationVersion_(v62, v299, (uint64_t)v298, v300, v301, v302, v303, v304);

          v312 = objc_msgSend_assetVersion(v61, v305, v306, v307, v308, v309, v310, v311);
          objc_msgSend_setAssetVersion_(v62, v313, (uint64_t)v312, v314, v315, v316, v317, v318);

          v326 = objc_msgSend_attachments(v61, v319, v320, v321, v322, v323, v324, v325);
          objc_msgSend_setAttachments_(v62, v327, (uint64_t)v326, v328, v329, v330, v331, v332);

          v340 = objc_msgSend_chapterTitle(v61, v333, v334, v335, v336, v337, v338, v339);
          objc_msgSend_setChapterTitle_(v62, v341, (uint64_t)v340, v342, v343, v344, v345, v346);

          v354 = objc_msgSend_userModificationDate(v61, v347, v348, v349, v350, v351, v352, v353);
          objc_msgSend_timeIntervalSinceReferenceDate(v354, v355, v356, v357, v358, v359, v360, v361);
          objc_msgSend_setUserModificationDate_(v62, v362, v363, v364, v365, v366, v367, v368);

          v369 = objc_opt_new();
          uint64_t v377 = objc_msgSend_annotationSelectedTextRange(v61, v370, v371, v372, v373, v374, v375, v376);
          objc_msgSend_setLocation_(v369, v378, v377, v379, v380, v381, v382, v383);
          objc_msgSend_annotationSelectedTextRange(v61, v384, v385, v386, v387, v388, v389, v390);
          objc_msgSend_setLength_(v369, v391, (uint64_t)v391, v392, v393, v394, v395, v396);
          objc_msgSend_setSelectedTextRange_(v62, v397, (uint64_t)v369, v398, v399, v400, v401, v402);
          objc_msgSend_readingProgressHighWaterMark(v61, v403, v404, v405, v406, v407, v408, v409);
          objc_msgSend_setReadingProgressHighWaterMark_(v62, v410, v411, v412, v413, v414, v415, v416);
          uint64_t v424 = objc_msgSend_spineIndexUpdated(v61, v417, v418, v419, v420, v421, v422, v423);
          objc_msgSend_setSpineIndexUpdated_(v62, v425, v424, v426, v427, v428, v429, v430);
          objc_msgSend_readingProgress(v61, v431, v432, v433, v434, v435, v436, v437);
          BUClamp();
          *(float *)&double v438 = v438;
          objc_msgSend_setReadingProgress_(v62, v439, v440, v441, v442, v443, v444, v445, v438);
          v453 = objc_msgSend_futureProofing12(v61, v446, v447, v448, v449, v450, v451, v452);
          objc_msgSend_setFutureProofing12_(v62, v454, (uint64_t)v453, v455, v456, v457, v458, v459);

          v467 = objc_msgSend_plAbsolutePhysicalLocation(v61, v460, v461, v462, v463, v464, v465, v466);
          uint64_t v475 = objc_msgSend_intValue(v467, v468, v469, v470, v471, v472, v473, v474);
          objc_msgSend_setPlAbsolutePhysicalLocation_(v62, v476, v475, v477, v478, v479, v480, v481);

          v489 = objc_msgSend_plLocationRangeEnd(v61, v482, v483, v484, v485, v486, v487, v488);
          uint64_t v497 = objc_msgSend_intValue(v489, v490, v491, v492, v493, v494, v495, v496);
          objc_msgSend_setPlLocationRangeEnd_(v62, v498, v497, v499, v500, v501, v502, v503);

          v511 = objc_msgSend_plLocationRangeStart(v61, v504, v505, v506, v507, v508, v509, v510);
          uint64_t v519 = objc_msgSend_intValue(v511, v512, v513, v514, v515, v516, v517, v518);
          objc_msgSend_setPlLocationRangeStart_(v62, v520, v519, v521, v522, v523, v524, v525);

          v533 = objc_msgSend_plStorageUUID(v61, v526, v527, v528, v529, v530, v531, v532);
          objc_msgSend_setPlLocationStorageUUID_(v62, v534, (uint64_t)v533, v535, v536, v537, v538, v539);

          v547 = objc_msgSend_plUserData(v61, v540, v541, v542, v543, v544, v545, v546);
          objc_msgSend_setPlUserData_(v62, v548, (uint64_t)v547, v549, v550, v551, v552, v553);
        }
        v554 = objc_msgSend_locationModificationDate(v61, v127, v128, v129, v130, v131, v132, v133);
        v562 = v554;
        if (v554)
        {
          objc_msgSend_timeIntervalSinceReferenceDate(v554, v555, v556, v557, v558, v559, v560, v561);
          objc_msgSend_setLocationModificationDate_(v62, v563, v564, v565, v566, v567, v568, v569);
        }
        objc_msgSend_addAnnotation_(v9, v555, (uint64_t)v62, v557, v558, v559, v560, v561);

        ++v60;
      }
      while (v58 != v60);
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v570, (uint64_t)&v633, (uint64_t)v637, 16, v571, v572, v573);
    }
    while (v58);
  }

  v574 = [BCMutableAssetAnnotations alloc];
  v581 = objc_msgSend_initWithAssetID_(v574, v575, (uint64_t)v632, v576, v577, v578, v579, v580);
  objc_msgSend_setAssetVersion_(v581, v582, (uint64_t)v628, v583, v584, v585, v586, v587);
  id v588 = objc_alloc_init(MEMORY[0x263F62230]);
  objc_msgSend_writeTo_(v9, v589, (uint64_t)v588, v590, v591, v592, v593, v594);
  v602 = objc_msgSend_immutableData(v588, v595, v596, v597, v598, v599, v600, v601);
  objc_msgSend_setBookAnnotations_(v581, v603, (uint64_t)v602, v604, v605, v606, v607, v608);

  v616 = objc_msgSend_dataManager(self, v609, v610, v611, v612, v613, v614, v615);
  v623 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v617, @"assetID = %@", v618, v619, v620, v621, v622, v632);
  objc_msgSend_setCloudData_predicate_completion_(v616, v624, (uint64_t)v581, (uint64_t)v623, (uint64_t)v631, v625, v626, v627);
}

- (id)fileURLForCachingCKAssetWithAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_dataUsingEncoding_(v4, v5, 4, v6, v7, v8, v9, v10);
  uint64_t v19 = objc_msgSend_bu_md5(v11, v12, v13, v14, v15, v16, v17, v18);

  if (!objc_msgSend_length(v19, v20, v21, v22, v23, v24, v25, v26)
    || (objc_msgSend_ckAssetStoreDirectory(self, v27, v28, v29, v30, v31, v32, v33),
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_URLByAppendingPathComponent_(v34, v35, (uint64_t)v19, v36, v37, v38, v39, v40),
        uint64_t v41 = objc_claimAutoreleasedReturnValue(),
        v34,
        !v41))
  {
    uint64_t v42 = BDSCloudKitLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_2361F8818(self, (const char *)v4, v42, v43, v44, v45, v46, v47);
    }

    uint64_t v41 = 0;
  }

  return v41;
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  if (objc_msgSend_enableCloudSync(self, v7, v8, v9, v10, v11, v12, v13))
  {
    uint64_t v21 = objc_msgSend_dataManager(self, v14, v15, v16, v17, v18, v19, v20);
    objc_msgSend_startSyncToCKWithSyncManager_completion_(v21, v22, (uint64_t)v28, (uint64_t)v6, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v27 = _Block_copy(v6);
    uint64_t v21 = v27;
    if (v27) {
      (*((void (**)(void *))v27 + 2))(v27);
    }
  }
}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  if (objc_msgSend_enableCloudSync(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7))
  {
    objc_msgSend_cloudKitController(self, v9, v10, v11, v12, v13, v14, v15);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_transactionManager(v45, v16, v17, v18, v19, v20, v21, v22);
    uint64_t v31 = objc_msgSend_entityName(self, v24, v25, v26, v27, v28, v29, v30);
    uint64_t v39 = objc_msgSend_syncManager(self, v32, v33, v34, v35, v36, v37, v38);
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v23, v40, (uint64_t)v31, (uint64_t)v39, v41, v42, v43, v44);
  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  uint64_t v5 = _Block_copy(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(void *, uint64_t, void))v5 + 2))(v5, 1, 0);
    uint64_t v5 = v6;
  }
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v17 = objc_msgSend_count(v7, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v24 = objc_msgSend_dictionaryWithCapacity_(v9, v18, v17, v19, v20, v21, v22, v23);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v25 = v7;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v75, (uint64_t)v79, 16, v27, v28, v29);
  if (v30)
  {
    uint64_t v38 = v30;
    uint64_t v39 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v76 != v39) {
          objc_enumerationMutation(v25);
        }
        uint64_t v41 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        uint64_t v42 = objc_msgSend_assetID(v41, v31, v32, v33, v34, v35, v36, v37);
        objc_msgSend_setObject_forKey_(v24, v43, (uint64_t)v41, (uint64_t)v42, v44, v45, v46, v47);
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v31, (uint64_t)&v75, (uint64_t)v79, 16, v35, v36, v37);
    }
    while (v38);
  }

  uint64_t v55 = objc_msgSend_dataManager(self, v48, v49, v50, v51, v52, v53, v54);
  uint64_t v56 = (void *)MEMORY[0x263F08A98];
  uint64_t v64 = objc_msgSend_allKeys(v24, v57, v58, v59, v60, v61, v62, v63);
  uint64_t v71 = objc_msgSend_predicateWithFormat_(v56, v65, @"assetID IN %@", v66, v67, v68, v69, v70, v64);
  objc_msgSend_updateSyncGenerationFromCloudData_predicate_propertyIDKey_completion_(v55, v72, (uint64_t)v24, (uint64_t)v71, @"assetID", (uint64_t)v8, v73, v74);
}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v23 = objc_msgSend_dataManager(self, v16, v17, v18, v19, v20, v21, v22);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2360DB0B8;
    v31[3] = &unk_264CA11F8;
    id v32 = v8;
    objc_msgSend_resolveConflictsForRecords_completion_(v23, v24, (uint64_t)v7, (uint64_t)v31, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v29 = _Block_copy(v8);
    uint64_t v30 = v29;
    if (v29) {
      (*((void (**)(void *, void, void))v29 + 2))(v29, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v23 = objc_msgSend_dataManager(self, v16, v17, v18, v19, v20, v21, v22);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2360DB22C;
    v31[3] = &unk_264CA1220;
    id v32 = v8;
    objc_msgSend_failedRecordIDs_completion_(v23, v24, (uint64_t)v7, (uint64_t)v31, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v29 = _Block_copy(v8);
    uint64_t v30 = v29;
    if (v29) {
      (*((void (**)(void *, void, void))v29 + 2))(v29, 0, 0);
    }
  }
}

- (id)entityName
{
  return @"BCAssetAnnotations";
}

- (void)getAnnotationChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_opt_class();
  objc_msgSend_getChangesSince_forEntityClass_completion_(v20, v16, (uint64_t)v7, v15, (uint64_t)v6, v17, v18, v19);
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (BCCloudKitController)cloudKitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitController);
  return (BCCloudKitController *)WeakRetained;
}

- (void)setCloudKitController:(id)a3
{
}

- (BCCloudDataSource)annotationsDataSource
{
  return self->_annotationsDataSource;
}

- (void)setAnnotationsDataSource:(id)a3
{
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
}

- (NSURL)ckAssetStoreDirectory
{
  return self->_ckAssetStoreDirectory;
}

- (void)setCkAssetStoreDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAssetStoreDirectory, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_annotationsDataSource, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end