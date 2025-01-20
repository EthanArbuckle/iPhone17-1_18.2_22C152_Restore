@interface CHRecognitionSessionTask
+ (BOOL)isGroupAcceptableForInventory:(id)a3 textSynthesizer:(id)a4 strokeProvider:(id)a5 recognitionResult:(id)a6 strokeClassificationResult:(id)a7 allowSyntheticStrokes:(BOOL)a8;
- (BOOL)cancelled;
- (BOOL)disableMathTextSwapping;
- (BOOL)isHighResponsivenessTask;
- (BOOL)isNonRecognitionTask;
- (BOOL)leverageAllProvidedVariables;
- (BOOL)saveInputDrawings;
- (BOOL)shouldCancelTaskGivenNewTask:(id)a3;
- (BOOL)strokeGroupingOnly;
- (CHCalculateDocumentProvider)calculateDocumentProvider;
- (CHRecognitionSessionResult)inputResult;
- (CHRecognitionSessionResult)outputResult;
- (CHRecognitionSessionTask)init;
- (CHRecognitionSessionTask)initWithSessionMode:(int64_t)a3 locales:(id)a4 preferredLocales:(id)a5 strokeProvider:(id)a6 calculateDocumentProvider:(id)a7 inputResult:(id)a8 recognitionQOSClass:(unsigned int)a9 recognitionEnvironment:(int64_t)a10 isHighResponsivenessTask:(BOOL)a11 strokeClassificationModel:(id)a12 strokeGroupingModel:(id)a13 strokeGroupingRequirement:(int64_t)a14 principalLineRequirement:(int64_t)a15 subjectStrokeIdentifiers:(id)a16 subjectStrokeClassificationResult:(id)a17 recognitionOptions:(id)a18 partialResultBlock:(id)a19 wantsAutoRefine:(BOOL)a20;
- (CHRecognitionSessionTaskDelegate)delegate;
- (CHStrokeProvider)strokeProvider;
- (NSArray)preferredLocales;
- (NSArray)recognitionLocales;
- (NSDictionary)recognitionOptions;
- (NSSet)forceRecognitionStrokeGroupIdentifiers;
- (id).cxx_construct;
- (id)clutterFilter;
- (id)newGroupingManager;
- (id)newGroupingPostProcessingManagerWithGroupingManager:(id)a3;
- (id)newStrokeClassifier;
- (id)recognitionResultsForGroupingResult:(id)a3 groupingManager:(id)a4 strokeGroupsToProcess:(id)a5 strokeClassificationResult:(id)a6 strokeGroupReplacements:(id *)a7;
- (id)textCorrectionResultsForGroupingResult:(id)a3 groupingManager:(id)a4;
- (int64_t)principalLineRequirement;
- (int64_t)recognitionEnvironment;
- (int64_t)sessionMode;
- (int64_t)status;
- (int64_t)strokeGroupingRequirement;
- (void)cancel;
- (void)main;
- (void)setDelegate:(id)a3;
- (void)setDisableMathTextSwapping:(BOOL)a3;
- (void)setForceRecognitionStrokeGroupIdentifiers:(id)a3;
- (void)setLeverageAllProvidedVariables:(BOOL)a3;
- (void)setSaveInputDrawings:(BOOL)a3;
- (void)setStrokeGroupingOnly:(BOOL)a3;
@end

@implementation CHRecognitionSessionTask

- (CHRecognitionSessionTask)init
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "Use designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHRecognitionSessionTask)initWithSessionMode:(int64_t)a3 locales:(id)a4 preferredLocales:(id)a5 strokeProvider:(id)a6 calculateDocumentProvider:(id)a7 inputResult:(id)a8 recognitionQOSClass:(unsigned int)a9 recognitionEnvironment:(int64_t)a10 isHighResponsivenessTask:(BOOL)a11 strokeClassificationModel:(id)a12 strokeGroupingModel:(id)a13 strokeGroupingRequirement:(int64_t)a14 principalLineRequirement:(int64_t)a15 subjectStrokeIdentifiers:(id)a16 subjectStrokeClassificationResult:(id)a17 recognitionOptions:(id)a18 partialResultBlock:(id)a19 wantsAutoRefine:(BOOL)a20
{
  id v25 = a4;
  id v26 = a5;
  id obj = a6;
  id v144 = a6;
  id v138 = a7;
  id v143 = a7;
  id v145 = a8;
  id v142 = a12;
  id v141 = a13;
  id v140 = a16;
  v27 = v25;
  v28 = v26;
  id v139 = a17;
  id v29 = a18;
  id v30 = a19;
  uint64_t v36 = objc_msgSend_count(v26, v31, v32, v33, v34, v35);
  if (a3 != 2 && !v36)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v37 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v37, OS_LOG_TYPE_FAULT, "The preferred locales list cannot be empty unless it's math mode.", buf, 2u);
    }
  }
  v147.receiver = self;
  v147.super_class = (Class)CHRecognitionSessionTask;
  v38 = [(CHRecognitionSessionTask *)&v147 init];
  p_isa = (id *)&v38->super.isa;
  v45 = v38;
  if (v38)
  {
    v38->_sessionMode = a3;
    uint64_t v46 = objc_msgSend_copy(v27, v39, v40, v41, v42, v43);
    recognitionLocales = v45->_recognitionLocales;
    v45->_recognitionLocales = (NSArray *)v46;

    uint64_t v53 = objc_msgSend_copy(v28, v48, v49, v50, v51, v52);
    preferredLocales = v45->_preferredLocales;
    v45->_preferredLocales = (NSArray *)v53;

    objc_storeStrong(p_isa + 70, obj);
    objc_storeStrong(p_isa + 71, v138);
    objc_storeStrong(p_isa + 64, a8);
    v45->_status = 0;
    v45->_recognitionEnvironment = a10;
    objc_storeStrong(p_isa + 79, a12);
    objc_storeStrong(p_isa + 80, a13);
    v45->_isHighResponsivenessTask = a11;
    v45->_strokeGroupingRequirement = a14;
    v45->_principalLineRequirement = a15;
    objc_storeStrong(p_isa + 81, a16);
    objc_storeStrong(p_isa + 82, a17);
    uint64_t v60 = objc_msgSend_copy(v30, v55, v56, v57, v58, v59);
    id partialResultBlock = v45->_partialResultBlock;
    v45->_id partialResultBlock = (id)v60;

    uint64_t v67 = objc_msgSend_copy(v29, v62, v63, v64, v65, v66);
    recognitionOptions = v45->_recognitionOptions;
    v45->_recognitionOptions = (NSDictionary *)v67;

    *(_WORD *)&v45->_disableMathTextSwapping = 0;
    v45->_wantsAutoRefine = a20;
    uint64_t v74 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v69, v70, v71, v72, v73);
    intermediateDeclaredVariables = v45->_intermediateDeclaredVariables;
    v45->_intermediateDeclaredVariables = (NSMutableSet *)v74;

    v81 = objc_msgSend_cachedRecognitionResultsFromPostProcessing(v145, v76, v77, v78, v79, v80);
    uint64_t v87 = objc_msgSend_copy(v81, v82, v83, v84, v85, v86);
    cachedRecognitionResultsFromPostProcessing = v45->_cachedRecognitionResultsFromPostProcessing;
    v45->_cachedRecognitionResultsFromPostProcessing = (NSDictionary *)v87;

    if (_os_feature_enabled_impl() && CHHasPersonalizedSynthesisSupport())
    {
      BOOL v93 = !a3 || a3 == 2;
      BOOL v94 = v93;
      v95 = objc_msgSend_objectForKeyedSubscript_(v45->_recognitionOptions, v89, @"CHRecognitionTaskSkipPopulatingInventory", v90, v91, v92, v28);
      char v101 = objc_msgSend_BOOLValue(v95, v96, v97, v98, v99, v100);

      v45->_allowContributionToStyle = v94 & (v101 ^ 1);
      if (os_variant_has_internal_diagnostics())
      {
        v107 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v102, v103, v104, v105, v106);
        v112 = objc_msgSend_dictionaryForKey_(v107, v108, @"com.apple.corehandwriting", v109, v110, v111);

        v117 = objc_msgSend_objectForKey_(v112, v113, @"kCHFreezeStyleInventory", v114, v115, v116);
        int v123 = objc_msgSend_BOOLValue(v117, v118, v119, v120, v121, v122);

        if (v123)
        {
          v45->_allowContributionToStyle = 0;
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v124 = (id)qword_1EA3C9FD8;
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v124, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: the inventory is frozen", buf, 2u);
          }
        }
      }
    }
    id v125 = objc_alloc(MEMORY[0x1E4F56920]);
    uint64_t v130 = objc_msgSend_initWithLocales_(v125, v126, (uint64_t)v45->_recognitionLocales, v127, v128, v129);
    unitsTrie = v45->_unitsTrie;
    v45->_unitsTrie = (CalculateUnitsTrie *)v130;

    v132 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v133 = dispatch_queue_attr_make_with_qos_class(v132, (dispatch_qos_class_t)a9, 0);

    dispatch_queue_t v134 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSessionRecognizers", v133);
    recognizersQueue = v45->__recognizersQueue;
    v45->__recognizersQueue = (OS_dispatch_queue *)v134;
  }
  return v45;
}

- (void)main
{
  uint64_t v2954 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_outputResult(self, a2, v2, v3, v4, v5);

  if (v7)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v8 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "Recognition tasks can only be executed once: %@", buf, 0xCu);
    }
  }
  v9 = self;
  objc_sync_enter(v9);
  if (!v9->_cancelled)
  {
    uint64_t v2882 = (uint64_t)v9;
    sub_1C4ADE1D4((uint64_t)v9, 1);
    objc_sync_exit(v9);

    objc_msgSend_inputResult(v9, v10, v11, v12, v13, v14);
    v2811 = (CHRecognitionSessionTask *)objc_claimAutoreleasedReturnValue();
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v2870 = objc_msgSend_strokeClassificationResult(v2811, v16, v17, v18, v19, v20);
      objg = objc_msgSend_strokeClassificationsByStrokeIdentifier(v2870, v21, v22, v23, v24, v25);
      uint64_t v31 = objc_msgSend_count(objg, v26, v27, v28, v29, v30);
      v37 = objc_msgSend_rawStrokeClassificationResult(v2811, v32, v33, v34, v35, v36);
      uint64_t v43 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v37, v38, v39, v40, v41, v42);
      uint64_t v49 = objc_msgSend_count(v43, v44, v45, v46, v47, v48);
      v55 = objc_msgSend_strokeProvider((void *)v2882, v50, v51, v52, v53, v54);
      uint64_t v61 = objc_msgSend_principalLineRequirement((void *)v2882, v56, v57, v58, v59, v60);
      uint64_t v67 = objc_msgSend_count(*(void **)(v2882 + 648), v62, v63, v64, v65, v66);
      uint64_t v73 = objc_msgSend_strokeClassificationsByStrokeIdentifier(*(void **)(v2882 + 656), v68, v69, v70, v71, v72);
      uint64_t v79 = objc_msgSend_count(v73, v74, v75, v76, v77, v78);
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)&buf[4] = v2811 != 0;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v31;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v49;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v55;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = v61;
      *(_WORD *)&buf[48] = 2048;
      *(void *)&buf[50] = v67;
      *(_WORD *)&buf[58] = 2048;
      *(void *)&buf[60] = v79;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_DEFAULT, "RecognitionTask main starting with input result ? %d, strokes in strokeClassificationResult = %ld, rawStrokeClassificationResult = %ld, strokeProvider %@, principalLinesRequirement = %ld, subjectStrokes: %ld, classifiedSubjectStrokes: %ld", buf, 0x44u);
    }
    v2831 = objc_msgSend_strokeProvider((void *)v2882, v80, v81, v82, v83, v84);
    uint64_t v90 = objc_msgSend_delegate((void *)v2882, v85, v86, v87, v88, v89);
    BOOL v91 = v90 == 0;

    if (v91)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v92 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v92, OS_LOG_TYPE_FAULT, "delegate cannot be nil when the task starts", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v98 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v93, v94, v95, v96, v97);
      uint64_t v103 = objc_msgSend_dictionaryForKey_(v98, v99, @"com.apple.corehandwriting", v100, v101, v102);

      v108 = objc_msgSend_objectForKey_(v103, v104, @"CHLogFullDrawings", v105, v106, v107);
      char v114 = objc_msgSend_BOOLValue(v108, v109, v110, v111, v112, v113);

      if (v114)
      {
        if (qword_1EA3C9308 != -1) {
          dispatch_once(&qword_1EA3C9308, &unk_1F2013AA8);
        }
        id obj = objc_alloc_init(MEMORY[0x1E4F28C10]);
        objc_msgSend_setDateFormat_(obj, v115, @"dd-MM-yyyy-HH-mm-ss-SSS", v116, v117, v118);
        v124 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v119, v120, v121, v122, v123);
        uint64_t v130 = objc_msgSend_UUIDString(v124, v125, v126, v127, v128, v129);
        v135 = objc_msgSend_substringToIndex_(v130, v131, 4, v132, v133, v134);

        id v141 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v136, v137, v138, v139, v140);
        v146 = objc_msgSend_stringFromDate_(obj, v142, (uint64_t)v141, v143, v144, v145);

        v152 = objc_msgSend_strokeProvider((void *)v2882, v147, v148, v149, v150, v151);
        v158 = objc_msgSend_orderedStrokes(v152, v153, v154, v155, v156, v157);
        v159 = objc_opt_class();
        v165 = objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(v159, v160, (uint64_t)v158, 0, 2, 0);
        if (v165)
        {
          v166 = objc_msgSend_stringWithFormat_(NSString, v161, @"full_drawing_%@_%@.json", v162, v163, v164, v146, v135);
          objc_msgSend_writeToFileWithContext_folder_basename_(v165, v167, (uint64_t)&unk_1F203D0F8, qword_1EA3C9300, (uint64_t)v166, v168);
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v169 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = @"CHLogFullDrawings";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = qword_1EA3C9300;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v166;
            _os_log_impl(&dword_1C492D000, v169, OS_LOG_TYPE_DEFAULT, "%@ serialize drawing to %@/%@, ", buf, 0x20u);
          }
        }
        else
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v166 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = @"CHLogFullDrawings";
            _os_log_impl(&dword_1C492D000, v166, OS_LOG_TYPE_ERROR, "%@ skipping serialization of nil drawing.", buf, 0xCu);
          }
        }
      }
    }
    if (objc_msgSend_principalLineRequirement((void *)v2882, v93, v94, v95, v96, v97) == 3)
    {
      v175 = v2811;
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v176, v177, v178, v179, v180);
      double v182 = v181;
      v188 = objc_msgSend_recognitionResultsByGroupID(v175, v183, v184, v185, v186, v187);
      obja = objc_msgSend_mutableCopy(v188, v189, v190, v191, v192, v193);

      long long v2949 = 0u;
      long long v2948 = 0u;
      long long v2947 = 0u;
      long long v2946 = 0u;
      v199 = objc_msgSend_strokeGroupingResult(v175, v194, v195, v196, v197, v198);
      v205 = objc_msgSend_strokeGroups(v199, v200, v201, v202, v203, v204);

      uint64_t v213 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v206, (uint64_t)&v2946, (uint64_t)buf, 16, v207);
      if (v213)
      {
        uint64_t v214 = *(void *)v2947;
LABEL_38:
        uint64_t v215 = 0;
        while (1)
        {
          if (*(void *)v2947 != v214) {
            objc_enumerationMutation(v205);
          }
          v216 = *(void **)(*((void *)&v2946 + 1) + 8 * v215);
          if (objc_msgSend_cancelled((void *)v2882, v208, v209, v210, v211, v212)) {
            break;
          }
          uint64_t v222 = objc_msgSend_uniqueIdentifier(v216, v217, v218, v219, v220, v221);
          v227 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v175, v223, v222, v224, v225, v226);
          v233 = v227;
          if (v227)
          {
            v234 = objc_msgSend_preferredLocale(v227, v228, v229, v230, v231, v232);
            BOOL v235 = v234 == 0;

            if (!v235)
            {
              v236 = sub_1C4ADE33C((void *)v2882, v216, v233);
              v237 = NSNumber;
              uint64_t v243 = objc_msgSend_uniqueIdentifier(v216, v238, v239, v240, v241, v242);
              v248 = objc_msgSend_numberWithInteger_(v237, v244, v243, v245, v246, v247);
              objc_msgSend_setObject_forKeyedSubscript_(obja, v249, (uint64_t)v236, (uint64_t)v248, v250, v251);
            }
          }

          if (v213 == ++v215)
          {
            uint64_t v213 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v208, (uint64_t)&v2946, (uint64_t)buf, 16, v212);
            if (v213) {
              goto LABEL_38;
            }
            break;
          }
        }
      }

      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v252, v253, v254, v255, v256);
      double v258 = v257;
      if (objc_msgSend_cancelled((void *)v2882, v259, v260, v261, v262, v263))
      {
        id v2815 = 0;
      }
      else
      {
        v2945[0] = 0u;
        memset(v2944, 0, sizeof(v2944));
        if (v175) {
          objc_msgSend_generationDuration(v175, v264, v265, v266, v267, v268);
        }
        *(double *)v2945 = v258 - v182;
        v2832 = [CHRecognitionSessionResult alloc];
        v287 = objc_msgSend_strokeProviderVersion(v175, v282, v283, v284, v285, v286);
        spidf = objc_msgSend_encodedStrokeProviderVersion(v175, v288, v289, v290, v291, v292);
        v2871 = objc_msgSend_orderedStrokeIdentifiers(v175, v293, v294, v295, v296, v297);
        uint64_t v303 = objc_msgSend_sessionMode(v175, v298, v299, v300, v301, v302);
        objc_msgSend_recognitionLocales((void *)v2882, v304, v305, v306, v307, v308);
        id v2857 = (id)objc_claimAutoreleasedReturnValue();
        v2852 = objc_msgSend_preferredLocales((void *)v2882, v309, v310, v311, v312, v313);
        v2828 = objc_msgSend_calculateDocumentProvider((void *)v2882, v314, v315, v316, v317, v318);
        v2842 = objc_msgSend_declaredVariables(v2828, v319, v320, v321, v322, v323);
        objc_msgSend_clutterFilter(v175, v324, v325, v326, v327, v328);
        os_log_t loge = (os_log_t)objc_claimAutoreleasedReturnValue();
        v2847 = objc_msgSend_strokeClassificationResult(v175, v329, v330, v331, v332, v333);
        v339 = objc_msgSend_rawStrokeClassificationResult(v175, v334, v335, v336, v337, v338);
        v345 = objc_msgSend_strokeGroupingResult(v175, v340, v341, v342, v343, v344);
        v351 = objc_msgSend_rawStrokeGroupingResult(v175, v346, v347, v348, v349, v350);
        v357 = objc_msgSend_unprocessedStrokeGroupingResult(v175, v352, v353, v354, v355, v356);
        v363 = objc_msgSend_rawRecognitionResultsByGroupID(v175, v358, v359, v360, v361, v362);
        v369 = objc_msgSend_textCorrectionResultsByGroupID(v175, v364, v365, v366, v367, v368);
        v375 = objc_msgSend_autoRefineResults(v175, v370, v371, v372, v373, v374);
        long long v2941 = *(_OWORD *)v2944;
        long long v2942 = *(_OWORD *)&v2944[16];
        long long v2943 = v2945[0];
        uint64_t v381 = objc_msgSend_recognitionEnvironment((void *)v2882, v376, v377, v378, v379, v380);
        id v2815 = (id)objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_rawStrokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_unprocessedStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResults_generationDuration_recognitionEnvironment_(v2832, v382, (uint64_t)v287, (uint64_t)spidf, (uint64_t)v2871, v303, v2857, v2852, v2842, loge, v2847, v339, v345, v351, v357, obja, v363, v369, v375,
                      &v2941,
                      v381);
      }
      goto LABEL_560;
    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v170, v171, v172, v173, v174);
    double v275 = v274;
    v276 = *(void **)(v2882 + 648);
    if (v276)
    {
      v2807 = objc_msgSend_mutableCopy(v276, v269, v270, v271, v272, v273);
    }
    else
    {
      v383 = objc_msgSend_orderedStrokes(v2831, v269, v270, v271, v272, v273);
      v2914[0] = MEMORY[0x1E4F143A8];
      v2914[1] = 3221225472;
      v2914[2] = sub_1C4ADE2F4;
      v2914[3] = &unk_1E64E3798;
      v2914[4] = v2882;
      v2807 = objc_msgSend_encodedStrokeIdentifiersFromStrokes_withStrokeProvider_shouldCancel_(CHStrokeUtilities, v384, (uint64_t)v383, (uint64_t)v2831, (uint64_t)v2914, v385);

      if (!v2807)
      {
LABEL_104:
        v485 = 0;
        goto LABEL_588;
      }
    }
    v386 = *(void **)(v2882 + 648);
    if (v386)
    {
      v387 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v388 = objc_msgSend_count(v386, v277, v278, v279, v280, v281);
      v393 = objc_msgSend_arrayWithCapacity_(v387, v389, v388, v390, v391, v392);
      long long v2913 = 0u;
      long long v2912 = 0u;
      long long v2911 = 0u;
      long long v2910 = 0u;
      id objb = *(id *)(v2882 + 648);
      uint64_t v401 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v394, (uint64_t)&v2910, (uint64_t)v2929, 16, v395);
      if (!v401) {
        goto LABEL_73;
      }
      uint64_t v402 = *(void *)v2911;
LABEL_59:
      uint64_t v403 = 0;
      while (1)
      {
        if (*(void *)v2911 != v402) {
          objc_enumerationMutation(objb);
        }
        uint64_t v404 = *(void *)(*((void *)&v2910 + 1) + 8 * v403);
        if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend_count(v393, v396, v397, v398, v399, v400), 2) <= 0x28F5C28F5C28F5CuLL
          && (objc_msgSend_cancelled((void *)v2882, v405, v406, v407, v408, v409) & 1) != 0)
        {
          break;
        }
        v410 = objc_opt_class();
        v418 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v410, v411, v404, (uint64_t)v2831, v412, v413);
        if (v418)
        {
          objc_msgSend_addObject_(v393, v414, (uint64_t)v418, v415, v416, v417);
        }
        else
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v419 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v419, OS_LOG_TYPE_ERROR))
          {
            v425 = objc_msgSend_strokeProviderVersion(v2831, v420, v421, v422, v423, v424);
            v431 = objc_msgSend_orderedStrokes(v2831, v426, v427, v428, v429, v430);
            uint64_t v437 = objc_msgSend_count(v431, v432, v433, v434, v435, v436);
            uint64_t v443 = objc_msgSend_count(*(void **)(v2882 + 648), v438, v439, v440, v441, v442);
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v404;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v425;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v437;
            *(_WORD *)&buf[32] = 2048;
            *(void *)&buf[34] = v443;
            _os_log_impl(&dword_1C492D000, v419, OS_LOG_TYPE_ERROR, "Invalid stroke %@ for stroke provider: versiouint64_t n = %@, number of strokes = %ld, number of subject stroke identifiers %ld ", buf, 0x2Au);
          }
        }

        if (v401 == ++v403)
        {
          uint64_t v401 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v396, (uint64_t)&v2910, (uint64_t)v2929, 16, v400);
          if (!v401)
          {
LABEL_73:

            id v444 = v393;
            id v2802 = 0;
            goto LABEL_94;
          }
          goto LABEL_59;
        }
      }

      goto LABEL_104;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v445 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v446 = os_signpost_id_generate(v445);

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v447 = (id)qword_1EA3C9FC8;
    v448 = v447;
    unint64_t v449 = v446 - 1;
    if (v446 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v447))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v448, OS_SIGNPOST_INTERVAL_BEGIN, v446, "CHSessionTaskGetAddedStrokes", "", buf, 2u);
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v450 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v450, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v450, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskGetAddedStrokes\"", buf, 2u);
    }

    v451 = objc_opt_class();
    id v2909 = 0;
    id v2908 = 0;
    v457 = objc_msgSend_strokeGroupingResult(v2811, v452, v453, v454, v455, v456);
    v2907[0] = MEMORY[0x1E4F143A8];
    v2907[1] = 3221225472;
    v2907[2] = sub_1C4ADE2FC;
    v2907[3] = &unk_1E64E3798;
    v2907[4] = v2882;
    objc_msgSend_getAddedStrokes_removedStrokeIdentifiers_inStrokeProvider_lastGroupingResult_shouldCancel_(v451, v458, (uint64_t)&v2909, (uint64_t)&v2908, (uint64_t)v2831, (uint64_t)v457, v2907);
    id v444 = v2909;
    id v2802 = v2908;

    if (qword_1EA3CA000 == -1)
    {
      v459 = (id)qword_1EA3C9FC8;
      if (v449 <= 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_87;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v459 = (id)qword_1EA3C9FC8;
      if (v449 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_87:
        if (os_signpost_enabled(v459))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v459, OS_SIGNPOST_INTERVAL_END, v446, "CHSessionTaskGetAddedStrokes", "", buf, 2u);
        }
      }
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v460 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v460, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v460, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskGetAddedStrokes\"", buf, 2u);
    }

LABEL_94:
    long long v2906 = 0u;
    long long v2905 = 0u;
    long long v2904 = 0u;
    long long v2903 = 0u;
    id v2872 = v444;
    uint64_t v463 = 0;
    uint64_t v464 = 0;
    uint64_t v470 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2872, v461, (uint64_t)&v2903, (uint64_t)v2928, 16, v462);
    if (v470)
    {
      uint64_t v471 = *(void *)v2904;
      do
      {
        for (uint64_t i = 0; i != v470; ++i)
        {
          if (*(void *)v2904 != v471) {
            objc_enumerationMutation(v2872);
          }
          v473 = *(void **)(*((void *)&v2903 + 1) + 8 * i);
          v464 += ((unint64_t)objc_msgSend_strokeAttributes(v473, v465, v466, v467, v468, v469) >> 2) & 1;
          v463 += ((unint64_t)objc_msgSend_strokeAttributes(v473, v474, v475, v476, v477, v478) >> 1) & 1;
        }
        uint64_t v470 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2872, v465, (uint64_t)&v2903, (uint64_t)v2928, 16, v469);
      }
      while (v470);
    }

    if (*(unsigned char *)(v2882 + 511))
    {
      BOOL v484 = 1;
    }
    else if (*(void *)(v2882 + 512))
    {
      BOOL v484 = 0;
    }
    else
    {
      BOOL v484 = *(void *)(v2882 + 648) == 0;
    }
    if (objc_msgSend_count(v2872, v479, v480, v481, v482, v483))
    {
      BOOL v491 = 0;
      if (qword_1EA3CA000 == -1) {
        goto LABEL_110;
      }
    }
    else
    {
      BOOL v491 = objc_msgSend_count(v2802, v486, v487, v488, v489, v490) == 0;
      if (qword_1EA3CA000 == -1) {
        goto LABEL_110;
      }
    }
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
LABEL_110:
    v492 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v492, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v498 = objc_msgSend_count(v2807, v493, v494, v495, v496, v497);
      uint64_t v504 = objc_msgSend_count(v2872, v499, v500, v501, v502, v503);
      uint64_t v510 = objc_msgSend_count(v2802, v505, v506, v507, v508, v509);
      int v511 = *(unsigned __int8 *)(v2882 + 511);
      *(_DWORD *)buf = 134219520;
      *(void *)&buf[4] = v498;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v504;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v464;
      *(_WORD *)&buf[32] = 2048;
      *(void *)&buf[34] = v463;
      *(_WORD *)&buf[42] = 2048;
      *(void *)&buf[44] = v510;
      *(_WORD *)&buf[52] = 1024;
      *(_DWORD *)&buf[54] = v511;
      *(_WORD *)&buf[58] = 1024;
      *(_DWORD *)&buf[60] = v484;
      _os_log_impl(&dword_1C492D000, v492, OS_LOG_TYPE_DEFAULT, "RecognitionTask running for %lu strokes: %lu added strokes [%ld synthetic, %ld shapes], %ld removed strokes, wantsAutoRefine ? %d, shouldBuildAutoRefineResult ? %d", buf, 0x40u);
    }
    BOOL objc = v484;

    v512 = (void *)MEMORY[0x1E4F28DB0];
    v518 = objc_msgSend_strokeProviderVersion(v2831, v513, v514, v515, v516, v517);
    id v2902 = 0;
    v2798 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v512, v519, (uint64_t)v518, 1, (uint64_t)&v2902, v520);
    id v2794 = v2902;

    v2800 = objc_msgSend_newGroupingManager((void *)v2882, v521, v522, v523, v524, v525);
    if (_os_feature_enabled_impl()) {
      v2799 = objc_msgSend_newGroupingPostProcessingManagerWithGroupingManager_((void *)v2882, v526, (uint64_t)v2800, v528, v529, v530);
    }
    else {
      v2799 = 0;
    }
    v2808 = objc_msgSend_clutterFilter((void *)v2882, v526, v527, v528, v529, v530);
    v536 = objc_msgSend_currentProgress(MEMORY[0x1E4F28F90], v531, v532, v533, v534, v535);
    v2803 = v536;
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v537, v538, v539, v540, v541);
    double v548 = v547;
    if (!v2808)
    {
      id v2795 = 0;
      v2808 = 0;
      goto LABEL_145;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v549 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v550 = os_signpost_id_generate(v549);

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v551 = (id)qword_1EA3C9FC8;
    v552 = v551;
    unint64_t v553 = v550 - 1;
    if (v550 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v551))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v552, OS_SIGNPOST_INTERVAL_BEGIN, v550, "CHSessionTaskClutterFilter", "", buf, 2u);
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v554 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v554, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v554, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskClutterFilter\"", buf, 2u);
    }

    if (objc_msgSend_cancelled((void *)v2882, v555, v556, v557, v558, v559))
    {
      id v2795 = 0;
    }
    else
    {
      if (objc_msgSend_isEmpty(v2808, v560, v561, v562, v563, v564) && !*(void *)(v2882 + 648))
      {
        v571 = objc_msgSend_strokeProvider((void *)v2882, v565, v566, v567, v568, v569);
        v943 = objc_msgSend_orderedStrokes(v571, v938, v939, v940, v941, v942);
        id v2901 = 0;
        uint64_t v946 = objc_msgSend_clutterFilterByAddingStrokes_removingStrokeIdentifiers_affectedStrokeIdentifiers_(v2808, v944, (uint64_t)v943, 0, (uint64_t)&v2901, v945);
        id v2795 = v2901;

        v2808 = (void *)v946;
      }
      else
      {
        id v2900 = 0;
        uint64_t v570 = objc_msgSend_clutterFilterByAddingStrokes_removingStrokeIdentifiers_affectedStrokeIdentifiers_(v2808, v565, (uint64_t)v2872, (uint64_t)v2802, (uint64_t)&v2900, v569);
        id v2795 = v2900;
        v571 = v2808;
        v2808 = (void *)v570;
      }
    }
    if (qword_1EA3CA000 == -1)
    {
      v572 = (id)qword_1EA3C9FC8;
      if (v553 <= 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_138;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v572 = (id)qword_1EA3C9FC8;
      if (v553 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_138:
        if (os_signpost_enabled(v572))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v572, OS_SIGNPOST_INTERVAL_END, v550, "CHSessionTaskClutterFilter", "", buf, 2u);
        }
      }
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v573 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v573, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v573, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskClutterFilter\"", buf, 2u);
    }

    v536 = v2803;
LABEL_145:
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v542, v543, v544, v545, v546);
    double v575 = v574;
    uint64_t v581 = objc_msgSend_completedUnitCount(v536, v576, v577, v578, v579, v580);
    objc_msgSend_setCompletedUnitCount_(v536, v582, v581 + 5, v583, v584, v585);
    double v2792 = v575 - v548;
    if ((objc_msgSend_cancelled((void *)v2882, v586, v587, v588, v589, v590) & 1) == 0)
    {
      id v596 = *(id *)(v2882 + 664);
      BOOL v597 = v596 == 0;

      if (!v597)
      {
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v591, v592, v593, v594, v595);
        double v599 = v598;
        v605 = objc_msgSend_copy(v2808, v600, v601, v602, v603, v604);
        v606 = [CHRecognitionSessionResult alloc];
        v612 = objc_msgSend_strokeProviderVersion(v2831, v607, v608, v609, v610, v611);
        v618 = objc_msgSend_inputResult((void *)v2882, v613, v614, v615, v616, v617);
        uint64_t v624 = objc_msgSend_sessionMode(v618, v619, v620, v621, v622, v623);
        v630 = objc_msgSend_recognitionLocales((void *)v2882, v625, v626, v627, v628, v629);
        v636 = objc_msgSend_preferredLocales((void *)v2882, v631, v632, v633, v634, v635);
        v642 = objc_msgSend_calculateDocumentProvider((void *)v2882, v637, v638, v639, v640, v641);
        v648 = objc_msgSend_declaredVariables(v642, v643, v644, v645, v646, v647);
        long long v2897 = 0u;
        long long v2898 = 0u;
        double v2896 = v2792;
        double v2899 = v599 - v275;
        uint64_t v654 = objc_msgSend_recognitionEnvironment((void *)v2882, v649, v650, v651, v652, v653);
        v656 = objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_rawStrokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_unprocessedStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResults_generationDuration_recognitionEnvironment_(v606, v655, (uint64_t)v612, (uint64_t)v2798, (uint64_t)v2807, v624, v630, v636, v648, v605, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         &v2896,
                         v654);

        v657 = (void (**)(id, void *))*(id *)(v2882 + 664);
        v657[2](v657, v656);
      }
    }
    uint64_t v658 = objc_msgSend_strokeGroupingRequirement((void *)v2882, v591, v592, v593, v594, v595);
    if (!v658)
    {
      v695 = objc_msgSend_newStrokeClassifier((void *)v2882, v659, v660, v661, v662, v663);
      v705 = *(void **)(v2882 + 656);
      if (v705)
      {
        id v706 = v705;
        double v2791 = 0.0;
      }
      else
      {
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v700, v701, v702, v703, v704);
        double v721 = v720;
        if (objc_msgSend_cancelled((void *)v2882, v722, v723, v724, v725, v726))
        {
          v732 = 0;
        }
        else
        {
          v748 = CHOSLogForCategory(7);
          os_signpost_id_t v749 = os_signpost_id_generate(v748);

          v750 = CHOSLogForCategory(7);
          v751 = v750;
          if (v749 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v750))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C492D000, v751, OS_SIGNPOST_INTERVAL_BEGIN, v749, "CHSessionTaskStrokeClassificationHeuristic", "", buf, 2u);
          }

          v752 = CHOSLogForCategory(0);
          if (os_log_type_enabled(v752, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v752, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskStrokeClassificationHeuristic\"", buf, 2u);
          }

          v758 = objc_msgSend_rawStrokeClassificationResult(v2811, v753, v754, v755, v756, v757);
          v2894[0] = MEMORY[0x1E4F143A8];
          v2894[1] = 3221225472;
          v2894[2] = sub_1C4ADE30C;
          v2894[3] = &unk_1E64E3798;
          v2894[4] = v2882;
          v732 = objc_msgSend_updateResult_addingStrokes_removingStrokeIdentifiers_clutterFilter_affectedClutterStrokeIDs_cancellationBlock_(v695, v759, (uint64_t)v758, (uint64_t)v2872, (uint64_t)v2802, (uint64_t)v2808, v2795, v2894);

          v760 = CHOSLogForCategory(7);
          v761 = v760;
          if (v749 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v760))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C492D000, v761, OS_SIGNPOST_INTERVAL_END, v749, "CHSessionTaskStrokeClassificationHeuristic", "", buf, 2u);
          }

          v762 = CHOSLogForCategory(0);
          if (os_log_type_enabled(v762, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v762, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskStrokeClassificationHeuristic\"", buf, 2u);
          }
        }
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v727, v728, v729, v730, v731);
        double v2791 = v768 - v721;
        if ((objc_msgSend_cancelled((void *)v2882, v763, v764, v765, v766, v767) & 1) != 0
          || (id v769 = *(id *)(v2882 + 632), v770 = v769 == 0, v769, v770))
        {
          v2822 = v732;
        }
        else
        {
          v771 = CHOSLogForCategory(7);
          os_signpost_id_t v772 = os_signpost_id_generate(v771);

          v773 = CHOSLogForCategory(7);
          v774 = v773;
          if (v772 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v773))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C492D000, v774, OS_SIGNPOST_INTERVAL_BEGIN, v772, "CHSessionTaskStrokeClassificationModel", "", buf, 2u);
          }

          v775 = CHOSLogForCategory(0);
          if (os_log_type_enabled(v775, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v775, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskStrokeClassificationModel\"", buf, 2u);
          }

          objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v776, v777, v778, v779, v780);
          double v782 = v781;
          id v783 = *(id *)(v2882 + 632);
          v789 = objc_msgSend_rawStrokeClassificationResult(v2811, v784, v785, v786, v787, v788);
          v2893[0] = MEMORY[0x1E4F143A8];
          v2893[1] = 3221225472;
          v2893[2] = sub_1C4ADE314;
          v2893[3] = &unk_1E64E3798;
          v2893[4] = v2882;
          v2822 = objc_msgSend_refineResult_usingStrokeClassificationModel_sortedAddedStrokes_removedStrokeIdentifiers_lastResult_cancellationBlock_(v695, v790, (uint64_t)v732, (uint64_t)v783, (uint64_t)v2872, (uint64_t)v2802, v789, v2893);

          objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v791, v792, v793, v794, v795);
          double v797 = v796 - v782;
          v798 = CHOSLogForCategory(2);
          if (os_log_type_enabled(v798, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v797;
            _os_log_impl(&dword_1C492D000, v798, OS_LOG_TYPE_DEFAULT, "Ran stroke classification in duratiouint64_t n = %3.6f seconds", buf, 0xCu);
          }

          uint64_t v804 = objc_msgSend_completedUnitCount(v2803, v799, v800, v801, v802, v803);
          objc_msgSend_setCompletedUnitCount_(v2803, v805, v804 + 10, v806, v807, v808);
          v809 = CHOSLogForCategory(7);
          v810 = v809;
          if (v772 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v809))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C492D000, v810, OS_SIGNPOST_INTERVAL_END, v772, "CHSessionTaskStrokeClassificationModel", "", buf, 2u);
          }

          v811 = CHOSLogForCategory(0);
          if (os_log_type_enabled(v811, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v811, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskStrokeClassificationModel\"", buf, 2u);
          }

          double v2791 = v2791 + v797;
        }
        if (v491)
        {
          v812 = objc_msgSend_rawStrokeClassificationResult(v2811, v707, v708, v709, v710, v711);
          v816 = objc_msgSend_differenceFromResult_removedStrokeIds_(v2822, v813, (uint64_t)v812, (uint64_t)v2802, v814, v815);

          v827 = objc_msgSend_rawStrokeClassificationResult(v2811, v817, v818, v819, v820, v821);
          if (v827)
          {
            int hasChanges = objc_msgSend_hasChanges(v816, v822, v823, v824, v825, v826);

            if (hasChanges)
            {
              v829 = CHOSLogForCategory(0);
              if (os_log_type_enabled(v829, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend_description(v816, v830, v831, v832, v833, v834);
                id v835 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v835;
                _os_log_impl(&dword_1C492D000, v829, OS_LOG_TYPE_FAULT, "Stroke Classification after first stage of stroke classification should match the rawStrokeClassificationResult from the previous result. Diff: %@", buf, 0xCu);
              }
            }
          }
        }
        id v706 = v2822;
      }
      v2821 = v706;
      v2809 = objc_msgSend_copy(v706, v707, v708, v709, v710, v711);
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v836, v837, v838, v839, v840);
      double v842 = v841;
      char v848 = objc_msgSend_cancelled((void *)v2882, v843, v844, v845, v846, v847);
      if (v2821) {
        char v854 = v848;
      }
      else {
        char v854 = 1;
      }
      if (v854)
      {
        v2801 = 0;
        id v2805 = 0;
        v719 = 0;
      }
      else
      {
        v855 = CHOSLogForCategory(7);
        os_signpost_id_t spid = os_signpost_id_generate(v855);

        v856 = CHOSLogForCategory(7);
        v857 = v856;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v856))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v857, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHSessionTaskAccurateGrouping", "", buf, 2u);
        }

        v858 = CHOSLogForCategory(0);
        if (os_log_type_enabled(v858, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v858, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskAccurateGrouping\"", buf, 2u);
        }

        v864 = objc_msgSend_rawStrokeGroupingResult(v2811, v859, v860, v861, v862, v863);
        v870 = objc_msgSend_orderedStrokeIdentifiers(v2811, v865, v866, v867, v868, v869);
        v876 = objc_msgSend_rawStrokeClassificationResult(v2811, v871, v872, v873, v874, v875);
        v2892[0] = MEMORY[0x1E4F143A8];
        v2892[1] = 3221225472;
        v2892[2] = sub_1C4ADE31C;
        v2892[3] = &unk_1E64E3798;
        v2892[4] = v2882;
        v878 = objc_msgSend_updateGroupingResult_addingStrokes_removingStrokeIdentifiers_orderedStrokeIdentifiers_lastOrderedStrokeIdentifiers_strokeClassificationResult_lastStrokeClassificationResult_cancellationBlock_(v2800, v877, (uint64_t)v864, (uint64_t)v2872, (uint64_t)v2802, (uint64_t)v2807, v870, v2821, v876, v2892);

        id v2805 = v878;
        if (v491)
        {
          v884 = objc_msgSend_textStrokeGroups(v2805, v879, v880, v881, v882, v883);
          uint64_t v890 = objc_msgSend_count(v884, v885, v886, v887, v888, v889);
          v896 = objc_msgSend_rawStrokeGroupingResult(v2811, v891, v892, v893, v894, v895);
          v902 = objc_msgSend_textStrokeGroups(v896, v897, v898, v899, v900, v901);
          if (v890 == objc_msgSend_count(v902, v903, v904, v905, v906, v907))
          {
            v913 = objc_msgSend_nontextStrokeGroups(v2805, v908, v909, v910, v911, v912);
            uint64_t v919 = objc_msgSend_count(v913, v914, v915, v916, v917, v918);
            v925 = objc_msgSend_rawStrokeGroupingResult(v2811, v920, v921, v922, v923, v924);
            v931 = objc_msgSend_nontextStrokeGroups(v925, v926, v927, v928, v929, v930);
            BOOL v937 = v919 == objc_msgSend_count(v931, v932, v933, v934, v935, v936);
          }
          else
          {
            BOOL v937 = 0;
          }

          if (v2811 && !v937)
          {
            v948 = CHOSLogForCategory(0);
            if (os_log_type_enabled(v948, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend_textStrokeGroups(v2805, v949, v950, v951, v952, v953);
              id v2858 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v959 = objc_msgSend_count(v2858, v954, v955, v956, v957, v958);
              v2853 = objc_msgSend_nontextStrokeGroups(v2805, v960, v961, v962, v963, v964);
              uint64_t v970 = objc_msgSend_count(v2853, v965, v966, v967, v968, v969);
              v976 = objc_msgSend_rawStrokeGroupingResult(v2811, v971, v972, v973, v974, v975);
              v982 = objc_msgSend_textStrokeGroups(v976, v977, v978, v979, v980, v981);
              uint64_t v988 = objc_msgSend_count(v982, v983, v984, v985, v986, v987);
              v994 = objc_msgSend_rawStrokeGroupingResult(v2811, v989, v990, v991, v992, v993);
              v1000 = objc_msgSend_nontextStrokeGroups(v994, v995, v996, v997, v998, v999);
              uint64_t v1006 = objc_msgSend_count(v1000, v1001, v1002, v1003, v1004, v1005);
              *(_DWORD *)buf = 134218752;
              *(void *)&buf[4] = v959;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v970;
              *(_WORD *)&buf[22] = 2048;
              *(void *)&buf[24] = v988;
              *(_WORD *)&buf[32] = 2048;
              *(void *)&buf[34] = v1006;
              _os_log_impl(&dword_1C492D000, v948, OS_LOG_TYPE_FAULT, "Stroke grouping after first stage should match the rawStrokeGrou[ing from the last result: found %ld text and %ld nonText groups, expected %ld text and %ld nonText groups.", buf, 0x2Au);
            }
          }
        }
        v1007 = CHOSLogForCategory(2);
        if (os_log_type_enabled(v1007, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v1008, v1009, v1010, v1011, v1012);
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v1013 - v842;
          _os_log_impl(&dword_1C492D000, v1007, OS_LOG_TYPE_DEFAULT, "Ran initial stroke grouping in duratiouint64_t n = %3.6f seconds", buf, 0xCu);
        }

        if (_os_feature_enabled_impl())
        {
          objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v1014, v1015, v1016, v1017, v1018);
          double v1020 = v1019;
          v1026 = objc_msgSend_textStrokeGroups(v2805, v1021, v1022, v1023, v1024, v1025);
          v1031 = objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v1027, (uint64_t)v1026, v1028, v1029, v1030);
          v2891[0] = MEMORY[0x1E4F143A8];
          v2891[1] = 3221225472;
          v2891[2] = sub_1C4ADE324;
          v2891[3] = &unk_1E64E3798;
          v2891[4] = v2882;
          v2801 = objc_msgSend_refineResult_usingSortedTextStrokeGroups_cancellationBlock_(v695, v1032, (uint64_t)v2821, (uint64_t)v1031, (uint64_t)v2891, v1033);

          if (objc_msgSend_isEquivalentToStrokeClassificationResult_(v2821, v1034, (uint64_t)v2801, v1035, v1036, v1037))
          {
            v719 = v2805;
          }
          else
          {
            v1038 = CHOSLogForCategory(2);
            BOOL v1039 = os_log_type_enabled(v1038, OS_LOG_TYPE_DEFAULT);
            if (v2811)
            {
              if (v1039)
              {
                v1045 = objc_msgSend_unprocessedStrokeGroupingResult(v2811, v1040, v1041, v1042, v1043, v1044);
                v1051 = objc_msgSend_strokeGroups(v1045, v1046, v1047, v1048, v1049, v1050);
                uint64_t v1057 = objc_msgSend_count(v1051, v1052, v1053, v1054, v1055, v1056);
                v1063 = objc_msgSend_orderedStrokeIdentifiers(v2811, v1058, v1059, v1060, v1061, v1062);
                uint64_t v1069 = objc_msgSend_count(v1063, v1064, v1065, v1066, v1067, v1068);
                *(_DWORD *)buf = 134218240;
                *(void *)&buf[4] = v1057;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v1069;
                _os_log_impl(&dword_1C492D000, v1038, OS_LOG_TYPE_DEFAULT, "Running second stroke grouping pass from previous task result with %ld defined groups covering %ld strokes", buf, 0x16u);
              }
              v1075 = objc_msgSend_unprocessedStrokeGroupingResult(v2811, v1070, v1071, v1072, v1073, v1074);
              v1081 = objc_msgSend_orderedStrokeIdentifiers(v2811, v1076, v1077, v1078, v1079, v1080);
              v1087 = objc_msgSend_strokeClassificationResult(v2811, v1082, v1083, v1084, v1085, v1086);
              v2890[0] = MEMORY[0x1E4F143A8];
              v2890[1] = 3221225472;
              v2890[2] = sub_1C4ADE32C;
              v2890[3] = &unk_1E64E3798;
              v2890[4] = v2882;
              v719 = objc_msgSend_updateGroupingResult_addingStrokes_removingStrokeIdentifiers_orderedStrokeIdentifiers_lastOrderedStrokeIdentifiers_strokeClassificationResult_lastStrokeClassificationResult_cancellationBlock_(v2800, v1088, (uint64_t)v1075, (uint64_t)v2872, (uint64_t)v2802, (uint64_t)v2807, v1081, v2801, v1087, v2890);
            }
            else
            {
              if (v1039)
              {
                v1089 = objc_msgSend_strokeGroups(v2805, v1040, v1041, v1042, v1043, v1044);
                uint64_t v1095 = objc_msgSend_count(v1089, v1090, v1091, v1092, v1093, v1094);
                uint64_t v1101 = objc_msgSend_count(v2807, v1096, v1097, v1098, v1099, v1100);
                *(_DWORD *)buf = 134218240;
                *(void *)&buf[4] = v1095;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v1101;
                _os_log_impl(&dword_1C492D000, v1038, OS_LOG_TYPE_DEFAULT, "Running second stroke grouping pass from current unprocessed result with %ld defined groups covering %ld strokes", buf, 0x16u);
              }
              v2889[0] = MEMORY[0x1E4F143A8];
              v2889[1] = 3221225472;
              v2889[2] = sub_1C4ADE334;
              v2889[3] = &unk_1E64E3798;
              v2889[4] = v2882;
              v1075 = v2805;
              v719 = objc_msgSend_updateGroupingResult_addingStrokes_removingStrokeIdentifiers_orderedStrokeIdentifiers_lastOrderedStrokeIdentifiers_strokeClassificationResult_lastStrokeClassificationResult_cancellationBlock_(v2800, v1102, (uint64_t)v2805, 0, 0, (uint64_t)v2807, v2807, v2801, v2821, v2889);
            }

            id v1103 = v2801;
            v2821 = v1103;
          }
          v1104 = CHOSLogForCategory(2);
          if (os_log_type_enabled(v1104, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v1105, v1106, v1107, v1108, v1109);
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v1110 - v1020;
            _os_log_impl(&dword_1C492D000, v1104, OS_LOG_TYPE_DEFAULT, "Ran second stroke classification and stroke grouping pass in duratiouint64_t n = %3.6f seconds", buf, 0xCu);
          }
        }
        else
        {
          v2801 = 0;
          v719 = v2805;
        }
        v1111 = CHOSLogForCategory(7);
        v1112 = v1111;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v1111))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v1112, OS_SIGNPOST_INTERVAL_END, spid, "CHSessionTaskAccurateGrouping", "", buf, 2u);
        }

        v1113 = CHOSLogForCategory(0);
        if (os_log_type_enabled(v1113, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v1113, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskAccurateGrouping\"", buf, 2u);
        }
      }
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v849, v850, v851, v852, v853);
      double v1115 = v1114;
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      double v717 = v1115 - v842;
      v1116 = (id)qword_1EA3C9FA0;
      if (os_log_type_enabled(v1116, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v1122 = objc_msgSend_count(v2872, v1117, v1118, v1119, v1120, v1121);
        uint64_t v1128 = objc_msgSend_count(v2802, v1123, v1124, v1125, v1126, v1127);
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v1122;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v1128;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v1115 - v842;
        _os_log_impl(&dword_1C492D000, v1116, OS_LOG_TYPE_DEFAULT, "Completed CHSessionTaskAccurateGrouping for %ld added strokes, %ld removed strokes in %f s.", buf, 0x20u);
      }

LABEL_268:
      uint64_t v1134 = objc_msgSend_completedUnitCount(v2803, v1129, v1130, v1131, v1132, v1133);
      objc_msgSend_setCompletedUnitCount_(v2803, v1135, v1134 + 25, v1136, v1137, v1138);
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v1139, v1140, v1141, v1142, v1143);
      double v1145 = v1144;
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v1146 = (id)qword_1EA3C9FC8;
      os_signpost_id_t v2848 = os_signpost_id_generate(v1146);

      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v1147 = (id)qword_1EA3C9FC8;
      v1148 = v1147;
      unint64_t v2843 = v2848 - 1;
      if (v2848 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v1147))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C492D000, v1148, OS_SIGNPOST_INTERVAL_BEGIN, v2848, "CHSessionTaskRecognition", "", buf, 2u);
      }

      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v1149 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v1149, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v1149, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskRecognition\"", buf, 2u);
      }

      if ((objc_msgSend_cancelled((void *)v2882, v1150, v1151, v1152, v1153, v1154) & 1) != 0 || !v719)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v1313 = (id)qword_1EA3C9FA0;
        if (os_log_type_enabled(v1313, OS_LOG_TYPE_DEFAULT))
        {
          int v1319 = objc_msgSend_cancelled((void *)v2882, v1314, v1315, v1316, v1317, v1318);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v1319;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v719 != 0;
          _os_log_impl(&dword_1C492D000, v1313, OS_LOG_TYPE_DEFAULT, "No Candidate AutoRefine group: task cancelled ? %d, has stroke group result ? %d", buf, 0xEu);
        }

        v2820 = 0;
        v2797 = 0;
        v1167 = 0;
        id v2818 = 0;
        v2829 = 0;
        v2806 = v719;
      }
      else
      {
        id v1155 = v719;
        v1161 = objc_msgSend_createdStrokeGroups(v1155, v1156, v1157, v1158, v1159, v1160);
        v1167 = objc_msgSend_mutableCopy(v1161, v1162, v1163, v1164, v1165, v1166);

        v1178 = objc_msgSend_forceRecognitionStrokeGroupIdentifiers((void *)v2882, v1168, v1169, v1170, v1171, v1172);
        if (v1178)
        {
          v1179 = objc_msgSend_strokeGroups(v1155, v1173, v1174, v1175, v1176, v1177);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = sub_1C4ADEC50;
          *(void *)&buf[24] = &unk_1E64E1E00;
          *(void *)&buf[32] = v1178;
          v1184 = objc_msgSend_objectsPassingTest_(v1179, v1180, (uint64_t)buf, v1181, v1182, v1183);

          objc_msgSend_unionSet_(v1167, v1185, (uint64_t)v1184, v1186, v1187, v1188);
        }

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v1189 = (id)qword_1EA3C9FA0;
        if (os_log_type_enabled(v1189, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v1195 = objc_msgSend_count(v1167, v1190, v1191, v1192, v1193, v1194);
          v1201 = objc_msgSend_strokeGroups(v1155, v1196, v1197, v1198, v1199, v1200);
          uint64_t v1207 = objc_msgSend_count(v1201, v1202, v1203, v1204, v1205, v1206);
          v1213 = objc_msgSend_createdStrokeGroups(v1155, v1208, v1209, v1210, v1211, v1212);
          uint64_t v1219 = objc_msgSend_count(v1213, v1214, v1215, v1216, v1217, v1218);
          *(_DWORD *)buf = 134218496;
          *(void *)&buf[4] = v1195;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v1207;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v1219;
          _os_log_impl(&dword_1C492D000, v1189, OS_LOG_TYPE_DEFAULT, "Started Recognition pass for %ld groups to process among %ld total groups, %ld created groups.", buf, 0x20u);
        }
        id v2888 = 0;
        uint64_t v1221 = objc_msgSend_recognitionResultsForGroupingResult_groupingManager_strokeGroupsToProcess_strokeClassificationResult_strokeGroupReplacements_((void *)v2882, v1220, (uint64_t)v1155, (uint64_t)v2800, (uint64_t)v1167, (uint64_t)v2821, &v2888);
        id v1222 = v2888;
        uint64_t v1226 = objc_msgSend_textCorrectionResultsForGroupingResult_groupingManager_((void *)v2882, v1223, (uint64_t)v1155, (uint64_t)v2800, v1224, v1225);
        v2806 = objc_msgSend_groupingResultUpdatedWithGroupReplacements_(v1155, v1227, (uint64_t)v1222, v1228, v1229, v1230);
        id v2818 = v1222;
        v2797 = (void *)v1226;
        v2820 = (void *)v1221;

        if (objc)
        {
          id v2833 = v2872;
          v1231 = v1167;
          id v2818 = v1222;
          v1232 = (void *)MEMORY[0x1E4F1CA48];
          os_log_t log = v1231;
          uint64_t v1238 = objc_msgSend_count(v1231, v1233, v1234, v1235, v1236, v1237);
          objd = objc_msgSend_arrayWithCapacity_(v1232, v1239, v1238, v1240, v1241, v1242);
          if (objc_msgSend_count(v1231, v1243, v1244, v1245, v1246, v1247))
          {
            v1253 = (void *)MEMORY[0x1E4F1CA80];
            uint64_t v1254 = objc_msgSend_count(v2833, v1248, v1249, v1250, v1251, v1252);
            v1259 = objc_msgSend_setWithCapacity_(v1253, v1255, v1254, v1256, v1257, v1258);
            long long v2952 = 0u;
            long long v2951 = 0u;
            memset(v2950, 0, sizeof(v2950));
            id v1260 = v2833;
            uint64_t v1268 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1260, v1261, (uint64_t)v2950, (uint64_t)buf, 16, v1262);
            if (v1268)
            {
              uint64_t v1269 = **(void **)&v2950[16];
              do
              {
                for (uint64_t j = 0; j != v1268; ++j)
                {
                  if (**(void **)&v2950[16] != v1269) {
                    objc_enumerationMutation(v1260);
                  }
                  v1271 = objc_msgSend_encodedStrokeIdentifier(*(void **)(*(void *)&v2950[8] + 8 * j), v1263, v1264, v1265, v1266, v1267);
                  objc_msgSend_addObject_(v1259, v1272, (uint64_t)v1271, v1273, v1274, v1275);
                }
                uint64_t v1268 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1260, v1263, (uint64_t)v2950, (uint64_t)buf, 16, v1267);
              }
              while (v1268);
            }

            long long v2926 = 0u;
            long long v2925 = 0u;
            long long v2924 = 0u;
            long long v2923 = 0u;
            v1276 = log;
            uint64_t v1284 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1276, v1277, (uint64_t)&v2923, (uint64_t)&v2946, 16, v1278);
            if (v1284)
            {
              uint64_t v1285 = *(void *)v2924;
              do
              {
                for (uint64_t k = 0; k != v1284; ++k)
                {
                  if (*(void *)v2924 != v1285) {
                    objc_enumerationMutation(v1276);
                  }
                  v1287 = *(void **)(*((void *)&v2923 + 1) + 8 * k);
                  v1288 = objc_msgSend_strokeIdentifiers(v1287, v1279, v1280, v1281, v1282, v1283);
                  int v1293 = objc_msgSend_intersectsSet_(v1288, v1289, (uint64_t)v1259, v1290, v1291, v1292);

                  if (v1293) {
                    objc_msgSend_addObject_(objd, v1279, (uint64_t)v1287, v1281, v1282, v1283);
                  }
                }
                uint64_t v1284 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1276, v1279, (uint64_t)&v2923, (uint64_t)&v2946, 16, v1283);
              }
              while (v1284);
            }

            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v1294 = (id)qword_1EA3C9FA0;
            if (os_log_type_enabled(v1294, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v1300 = objc_msgSend_count(v1259, v1295, v1296, v1297, v1298, v1299);
              uint64_t v1306 = objc_msgSend_count(v1276, v1301, v1302, v1303, v1304, v1305);
              uint64_t v1312 = objc_msgSend_count(objd, v1307, v1308, v1309, v1310, v1311);
              *(_DWORD *)v2944 = 134218496;
              *(void *)&v2944[4] = v1300;
              *(_WORD *)&v2944[12] = 2048;
              *(void *)&v2944[14] = v1306;
              *(_WORD *)&v2944[22] = 2048;
              *(void *)&v2944[24] = v1312;
              _os_log_impl(&dword_1C492D000, v1294, OS_LOG_TYPE_DEFAULT, "Candidate AutoRefine group: added strokes = %ld, number of modified groups = %ld, groups with newly added strokes = %ld", v2944, 0x20u);
            }
          }
          else
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v1259 = (id)qword_1EA3C9FA0;
            if (os_log_type_enabled(v1259, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v1259, OS_LOG_TYPE_DEFAULT, "No Candidate AutoRefine group: number of groups to process is 0.", buf, 2u);
            }
          }

          if (objc_msgSend_count(objd, v1320, v1321, v1322, v1323, v1324))
          {
            v1330 = (void *)MEMORY[0x1E4F1CA48];
            uint64_t v1331 = objc_msgSend_count(objd, v1325, v1326, v1327, v1328, v1329);
            v2859 = objc_msgSend_arrayWithCapacity_(v1330, v1332, v1331, v1333, v1334, v1335);
            long long v2922 = 0u;
            long long v2921 = 0u;
            long long v2920 = 0u;
            long long v2919 = 0u;
            id v1336 = objd;
            uint64_t v1339 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1336, v1337, (uint64_t)&v2919, (uint64_t)v2944, 16, v1338);
            if (v1339)
            {
              uint64_t v1340 = *(void *)v2920;
              do
              {
                for (uint64_t m = 0; m != v1339; ++m)
                {
                  if (*(void *)v2920 != v1340) {
                    objc_enumerationMutation(v1336);
                  }
                  v1342 = *(void **)(*((void *)&v2919 + 1) + 8 * m);
                  v1343 = objc_opt_class();
                  uint64_t v1349 = objc_msgSend_classification(v1342, v1344, v1345, v1346, v1347, v1348);
                  int isStrokeClassificationTextOrMath = objc_msgSend_isStrokeClassificationTextOrMath_(v1343, v1350, v1349, v1351, v1352, v1353);
                  v1360 = objc_msgSend_strokeIdentifiers(v1342, v1355, v1356, v1357, v1358, v1359);
                  v1366 = objc_msgSend_allObjects(v1360, v1361, v1362, v1363, v1364, v1365);
                  v1372 = objc_msgSend_strokeProvider((void *)v2882, v1367, v1368, v1369, v1370, v1371);
                  v1376 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v1373, (uint64_t)v1366, (uint64_t)v1372, v1374, v1375);

                  long long v2918 = 0u;
                  long long v2917 = 0u;
                  long long v2916 = 0u;
                  long long v2915 = 0u;
                  id v1377 = v1376;
                  uint64_t v1385 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1377, v1378, (uint64_t)&v2915, (uint64_t)&v2941, 16, v1379);
                  if (v1385)
                  {
                    uint64_t v1386 = *(void *)v2916;
LABEL_328:
                    uint64_t v1387 = 0;
                    while (1)
                    {
                      if (*(void *)v2916 != v1386) {
                        objc_enumerationMutation(v1377);
                      }
                      if ((objc_msgSend_strokeAttributes(*(void **)(*((void *)&v2915 + 1) + 8 * v1387), v1380, v1381, v1382, v1383, v1384) & 4) == 0)break; {
                      if (v1385 == ++v1387)
                      }
                      {
                        uint64_t v1385 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1377, v1380, (uint64_t)&v2915, (uint64_t)&v2941, 16, v1384);
                        if (v1385) {
                          goto LABEL_328;
                        }
                        goto LABEL_334;
                      }
                    }

                    if (isStrokeClassificationTextOrMath)
                    {
                      v1407 = NSNumber;
                      uint64_t v1408 = objc_msgSend_uniqueIdentifier(v1342, v1402, v1403, v1404, v1405, v1406);
                      v1413 = objc_msgSend_numberWithInteger_(v1407, v1409, v1408, v1410, v1411, v1412);
                      v1389 = objc_msgSend_objectForKeyedSubscript_(v2818, v1414, (uint64_t)v1413, v1415, v1416, v1417);

                      if (v1389)
                      {
                        objc_msgSend_addObject_(v2859, v1418, (uint64_t)v1389, v1419, v1420, v1421);
                        if (qword_1EA3CA000 != -1) {
                          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                        }
                        v1422 = (id)qword_1EA3C9FA0;
                        if (os_log_type_enabled(v1422, OS_LOG_TYPE_DEFAULT))
                        {
                          v1428 = objc_msgSend_strokeIdentifiers(v1389, v1423, v1424, v1425, v1426, v1427);
                          uint64_t v1434 = objc_msgSend_count(v1428, v1429, v1430, v1431, v1432, v1433);
                          *(_DWORD *)v2930 = 134217984;
                          uint64_t v2931 = v1434;
                          _os_log_impl(&dword_1C492D000, v1422, OS_LOG_TYPE_DEFAULT, "Candidate AutoRefine replacement group with %ld strokes.", v2930, 0xCu);
                        }
                      }
                      else
                      {
                        objc_msgSend_addObject_(v2859, v1418, (uint64_t)v1342, v1419, v1420, v1421);
                        v1389 = 0;
                      }
                      goto LABEL_347;
                    }
                    int v1388 = 1;
                    if (qword_1EA3CA000 == -1) {
                      goto LABEL_335;
                    }
                  }
                  else
                  {
LABEL_334:

                    int v1388 = 0;
                    if (qword_1EA3CA000 == -1) {
                      goto LABEL_335;
                    }
                  }
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
LABEL_335:
                  v1389 = (id)qword_1EA3C9FA0;
                  if (os_log_type_enabled(v1389, OS_LOG_TYPE_DEFAULT))
                  {
                    v1395 = objc_msgSend_strokeIdentifiers(v1342, v1390, v1391, v1392, v1393, v1394);
                    uint64_t v1401 = objc_msgSend_count(v1395, v1396, v1397, v1398, v1399, v1400);
                    *(_DWORD *)v2930 = 134218496;
                    uint64_t v2931 = v1401;
                    __int16 v2932 = 1024;
                    *(_DWORD *)v2933 = isStrokeClassificationTextOrMath;
                    *(_WORD *)&v2933[4] = 1024;
                    *(_DWORD *)&v2933[6] = v1388;
                    _os_log_impl(&dword_1C492D000, v1389, OS_LOG_TYPE_DEFAULT, "Candidate AutoRefine group skipped: group with %ld strokes: isTextOrMath ? %d, hasNonSyntheticStrokes ? %d", v2930, 0x18u);
                  }
LABEL_347:
                }
                uint64_t v1339 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1336, v1435, (uint64_t)&v2919, (uint64_t)v2944, 16, v1436);
              }
              while (v1339);
            }

            if (objc_msgSend_count(v2859, v1437, v1438, v1439, v1440, v1441))
            {
              v1442 = v2859;
              v2829 = v1442;
            }
            else
            {
              if (qword_1EA3CA000 != -1) {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
              }
              v1443 = (id)qword_1EA3C9FA0;
              if (os_log_type_enabled(v1443, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v2930 = 0;
                _os_log_impl(&dword_1C492D000, v1443, OS_LOG_TYPE_DEFAULT, "No Candidate AutoRefine group.", v2930, 2u);
              }

              v2829 = 0;
              v1442 = v2859;
            }
          }
          else
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v1442 = (id)qword_1EA3C9FA0;
            if (os_log_type_enabled(v1442, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v2944 = 0;
              _os_log_impl(&dword_1C492D000, v1442, OS_LOG_TYPE_DEFAULT, "No Candidate AutoRefine group.", v2944, 2u);
            }
            v2829 = 0;
          }

          v1167 = log;
        }
        else
        {
          v2829 = 0;
        }
      }
      v2793 = v1167;
      if (qword_1EA3CA000 == -1)
      {
        v1444 = (id)qword_1EA3C9FC8;
        if (v2843 <= 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_364;
        }
      }
      else
      {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        v1444 = (id)qword_1EA3C9FC8;
        if (v2843 <= 0xFFFFFFFFFFFFFFFDLL)
        {
LABEL_364:
          if (os_signpost_enabled(v1444))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C492D000, v1444, OS_SIGNPOST_INTERVAL_END, v2848, "CHSessionTaskRecognition", "", buf, 2u);
          }
        }
      }

      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v1445 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v1445, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v1445, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskRecognition\"", buf, 2u);
      }

      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v1446, v1447, v1448, v1449, v1450);
      double v1452 = v1451;
      v1458 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v1453, v1454, v1455, v1456, v1457);
      objc_msgSend_floatForKey_(v1458, v1459, @"CHRecognitionTaskOverhead", v1460, v1461, v1462);
      float v1464 = v1463;

      if (v1464 > 0.0)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v1470 = (id)qword_1EA3C9FA0;
        double v1471 = v1464;
        if (os_log_type_enabled(v1470, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v1471;
          _os_log_impl(&dword_1C492D000, v1470, OS_LOG_TYPE_DEFAULT, "Recognition task almost finished, waiting for explicit overhead of %0.1fs.", buf, 0xCu);
        }

        objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E4F29060], v1472, v1473, v1474, v1475, v1476, v1471);
      }
      char v1477 = objc_msgSend_cancelled((void *)v2882, v1465, v1466, v1467, v1468, v1469);
      if (v2799) {
        char v1478 = v1477;
      }
      else {
        char v1478 = 1;
      }
      if (v1478)
      {
        id v2804 = v2806;
        v1484 = v2820;
        v2796 = 0;
      }
      else
      {
        v1485 = [CHGroupingAndRecognitionResults alloc];
        v1491 = objc_msgSend_strokeGroupingResult(v2811, v1486, v1487, v1488, v1489, v1490);
        v1497 = objc_msgSend_recognitionResultsByGroupID(v2811, v1492, v1493, v1494, v1495, v1496);
        v1498 = (void *)MEMORY[0x1E4F1CAD0];
        v1504 = objc_msgSend_allKeys(v2818, v1499, v1500, v1501, v1502, v1503);
        v1509 = objc_msgSend_setWithArray_(v1498, v1505, (uint64_t)v1504, v1506, v1507, v1508);
        v1511 = objc_msgSend_initWithGroupingResult_recognitionResultsByGroupID_strokeClassificationResult_previousProcessedStrokeGroupingResult_previousProcessedRecognizedResultsByGroupID_strokeGroupReplacements_cachedRecognitionResultsFromPostProcessing_(v1485, v1510, (uint64_t)v2806, (uint64_t)v2820, (uint64_t)v2821, (uint64_t)v1491, v1497, v1509, *(void *)(v2882 + 496));

        v1517 = objc_msgSend_recognitionOptions((void *)v2882, v1512, v1513, v1514, v1515, v1516);
        v1523 = objc_msgSend_mutableCopy(v1517, v1518, v1519, v1520, v1521, v1522);

        v1529 = objc_msgSend_recognitionLocales((void *)v2882, v1524, v1525, v1526, v1527, v1528);
        objc_msgSend_setObject_forKeyedSubscript_(v1523, v1530, (uint64_t)v1529, (uint64_t)CHMathPostProcessingOptionLocales, v1531, v1532);

        v1536 = objc_msgSend_process_options_(v2799, v1533, (uint64_t)v1511, (uint64_t)v1523, v1534, v1535);

        uint64_t v1542 = objc_msgSend_strokeGroupingResult(v1536, v1537, v1538, v1539, v1540, v1541);
        v1484 = objc_msgSend_recognitionResultsByGroupID(v1536, v1543, v1544, v1545, v1546, v1547);
        v2796 = objc_msgSend_refreshedCachedResultsFromPostProcessing(v1536, v1548, v1549, v1550, v1551, v1552);
        id v2804 = (id)v1542;
      }
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v1479, v1480, v1481, v1482, v1483);
      double v1554 = v1553;
      if ((objc_msgSend_cancelled((void *)v2882, v1555, v1556, v1557, v1558, v1559) & 1) != 0
        || objc_msgSend_principalLineRequirement((void *)v2882, v1560, v1561, v1562, v1563, v1564) != 2)
      {
        v2819 = v1484;
      }
      else
      {
        v1565 = objc_msgSend_mutableCopy(v1484, v1560, v1561, v1562, v1563, v1564);
        long long v2886 = 0u;
        long long v2887 = 0u;
        long long v2884 = 0u;
        long long v2885 = 0u;
        v1571 = objc_msgSend_strokeGroups(v2804, v1566, v1567, v1568, v1569, v1570);
        uint64_t v1579 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1571, v1572, (uint64_t)&v2884, (uint64_t)v2927, 16, v1573);
        if (v1579)
        {
          uint64_t v1580 = *(void *)v2885;
          do
          {
            for (uint64_t n = 0; n != v1579; ++n)
            {
              if (*(void *)v2885 != v1580) {
                objc_enumerationMutation(v1571);
              }
              v1582 = *(void **)(*((void *)&v2884 + 1) + 8 * n);
              if (objc_msgSend_classification(v1582, v1574, v1575, v1576, v1577, v1578) == 1
                || objc_msgSend_classification(v1582, v1574, v1575, v1576, v1577, v1578) == 2)
              {
                v1583 = NSNumber;
                uint64_t v1584 = objc_msgSend_uniqueIdentifier(v1582, v1574, v1575, v1576, v1577, v1578);
                v1589 = objc_msgSend_numberWithInteger_(v1583, v1585, v1584, v1586, v1587, v1588);
                v1594 = objc_msgSend_objectForKeyedSubscript_(v1484, v1590, (uint64_t)v1589, v1591, v1592, v1593);

                v1595 = sub_1C4ADE33C((void *)v2882, v1582, v1594);
                v1596 = NSNumber;
                uint64_t v1602 = objc_msgSend_uniqueIdentifier(v1582, v1597, v1598, v1599, v1600, v1601);
                v1607 = objc_msgSend_numberWithInteger_(v1596, v1603, v1602, v1604, v1605, v1606);
                objc_msgSend_setObject_forKeyedSubscript_(v1565, v1608, (uint64_t)v1595, (uint64_t)v1607, v1609, v1610);
              }
            }
            uint64_t v1579 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1571, v1574, (uint64_t)&v2884, (uint64_t)v2927, 16, v1578);
          }
          while (v1579);
        }

        v2819 = v1565;
      }
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v1560, v1561, v1562, v1563, v1564);
      double v1612 = v1611;
      if ((unint64_t)objc_msgSend_count(v2829, v1613, v1614, v1615, v1616, v1617) < 6)
      {
        unint64_t v1631 = 0x1E4F1C000uLL;
        v1630 = v2829;
      }
      else
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v1623 = (id)qword_1EA3C9FA0;
        if (os_log_type_enabled(v1623, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v1629 = objc_msgSend_count(v2829, v1624, v1625, v1626, v1627, v1628);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v1629;
          _os_log_impl(&dword_1C492D000, v1623, OS_LOG_TYPE_DEFAULT, "AutoRefine groups rejected, document update yielded too many potential groups (%ld candidates)", buf, 0xCu);
        }

        v1630 = 0;
        unint64_t v1631 = 0x1E4F1C000;
      }
      v1632 = *(void **)(v1631 + 2632);
      v2830 = v1630;
      uint64_t v1633 = objc_msgSend_count(v1630, v1618, v1619, v1620, v1621, v1622);
      v2810 = objc_msgSend_arrayWithCapacity_(v1632, v1634, v1633, v1635, v1636, v1637);
      v2834 = 0;
      unint64_t v1643 = 0;
      double v1644 = v1452 - v1145;
      double v1645 = v1612 - v1554;
      while (v1643 < objc_msgSend_count(v2830, v1638, v1639, v1640, v1641, v1642))
      {
        objc_msgSend_objectAtIndexedSubscript_(v2830, v1646, v1643, v1648, v1649, v1650);
        id v2860 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_autoRefineTriggerFactor(CHRecognitionSession, v1651, v1652, v1653, v1654, v1655);
        double v1657 = v1656;
        v1658 = NSNumber;
        uint64_t v1664 = objc_msgSend_uniqueIdentifier(v2860, v1659, v1660, v1661, v1662, v1663);
        v1669 = objc_msgSend_numberWithInteger_(v1658, v1665, v1664, v1666, v1667, v1668);
        unint64_t v2849 = v1643;
        spida = objc_msgSend_objectForKeyedSubscript_(v2820, v1670, (uint64_t)v1669, v1671, v1672, v1673);

        v2854 = objc_msgSend_preferredLocale(spida, v1674, v1675, v1676, v1677, v1678);
        int isSupportedLatinScriptLocale_withMode = objc_msgSend_isSupportedLatinScriptLocale_withMode_(CHRecognizerConfiguration, v1679, (uint64_t)v2854, 6, v1680, v1681);
        v1688 = objc_msgSend_strokeIdentifiers(v2860, v1683, v1684, v1685, v1686, v1687);
        v1694 = objc_msgSend_allObjects(v1688, v1689, v1690, v1691, v1692, v1693);
        float v1695 = v1657 * 0.5;
        double v1696 = v1695;
        int isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold = objc_msgSend_isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold_(v2821, v1697, (uint64_t)v1694, (uint64_t)&unk_1F203EF10, v1698, v1699, v1695);

        v1706 = objc_msgSend_recognitionResultsByLocale(spida, v1701, v1702, v1703, v1704, v1705);
        objc_msgSend_objectForKeyedSubscript_(v1706, v1707, (uint64_t)v2854, v1708, v1709, v1710);
        v1711 = (CHMutableTokenizedTextResult *)objc_claimAutoreleasedReturnValue();

        v1717 = objc_msgSend_refinableTranscription(v1711, v1712, v1713, v1714, v1715, v1716);
        unint64_t v1723 = objc_msgSend_length(v1717, v1718, v1719, v1720, v1721, v1722);

        if (((objc_msgSend_isCandidateMathGroup(spida, v1724, v1725, v1726, v1727, v1728) | isSupportedLatinScriptLocale_withMode ^ 1) & 1) != 0
          || ((isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold ^ 1) & 1) != 0
          || v1723 < 2)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v1778 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v1778, OS_LOG_TYPE_DEFAULT))
          {
            int isCandidateMathGroup = objc_msgSend_isCandidateMathGroup(spida, v1779, v1780, v1781, v1782, v1783);
            BOOL v1785 = v1723 < 2;
            v1791 = objc_msgSend_recognitionResultsByLocale(spida, v1786, v1787, v1788, v1789, v1790);
            v1797 = objc_msgSend_preferredLocale(spida, v1792, v1793, v1794, v1795, v1796);
            v1802 = objc_msgSend_objectForKeyedSubscript_(v1791, v1798, (uint64_t)v1797, v1799, v1800, v1801);
            v1808 = objc_msgSend_rawTranscription(v1802, v1803, v1804, v1805, v1806, v1807);
            *(_DWORD *)buf = 134219523;
            *(void *)&buf[4] = v2849;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = isCandidateMathGroup;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = isSupportedLatinScriptLocale_withMode;
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold;
            *(_WORD *)&buf[30] = 2048;
            *(double *)&buf[32] = v1696;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = v1785;
            *(_WORD *)&buf[46] = 2117;
            *(void *)&buf[48] = v1808;
            _os_log_impl(&dword_1C492D000, v1778, OS_LOG_TYPE_DEFAULT, "AutoRefine group [%ld] rejected: math candidate ? %d, isLatinPrefered ? %d, isHighConfidenceLatin ? %d (threshold = %.2f), isTextTooShort ? %d, text = %{sensitive}@", buf, 0x38u);
          }
          v1814 = objc_msgSend_recognitionResultsByLocale(spida, v1809, v1810, v1811, v1812, v1813);
          v1820 = objc_msgSend_preferredLocale(spida, v1815, v1816, v1817, v1818, v1819);
          v1825 = objc_msgSend_objectForKeyedSubscript_(v1814, v1821, (uint64_t)v1820, v1822, v1823, v1824);
          v1831 = objc_msgSend_rawTranscription(v1825, v1826, v1827, v1828, v1829, v1830);
          BOOL v1832 = v1831 == 0;

          if (!v1832)
          {
            uint64_t v2845 = (uint64_t)v2834;
            goto LABEL_444;
          }
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          logb = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(logb, OS_LOG_TYPE_DEFAULT))
          {
            v2030 = objc_msgSend_preferredLocale(spida, v2025, v2026, v2027, v2028, v2029);
            v2036 = objc_msgSend_description(v2030, v2031, v2032, v2033, v2034, v2035);
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = v2849;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v2036;
            _os_log_impl(&dword_1C492D000, logb, OS_LOG_TYPE_DEFAULT, "AutoRefine group [%ld] rejected: text is nil, preferred locale = %@", buf, 0x16u);
          }
          uint64_t v2845 = (uint64_t)v2834;
        }
        else
        {
          objc_msgSend_setLocale_(v1711, v1729, (uint64_t)v2854, v1730, v1731, v1732);
          v1733 = v1711;
          id v1734 = spida;
          os_log_t loga = (os_log_t)v2860;
          v2825 = v1734;
          v1740 = objc_msgSend_inputStrokeIdentifiers(v1734, v1735, v1736, v1737, v1738, v1739);
          v2844 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v1741, (uint64_t)v1740, *(void *)(v2882 + 560), v1742, v1743);

          v1748 = objc_msgSend_indexesOfObjectsPassingTest_(v2844, v1744, (uint64_t)&unk_1F2013A88, v1745, v1746, v1747);
          v1759 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v1749, v1750, v1751, v1752, v1753);
          for (iuint64_t i = 0; ii < objc_msgSend_tokenColumnCount(v1733, v1754, v1755, v1756, v1757, v1758); ++ii)
          {
            *(void *)&long long v2941 = 0;
            *((void *)&v2941 + 1) = &v2941;
            *(void *)&long long v2942 = 0x2020000000;
            BYTE8(v2942) = 1;
            v1766 = objc_msgSend_transcriptionPaths(v1733, v1761, v1762, v1763, v1764, v1765);
            v1772 = objc_msgSend_firstObject(v1766, v1767, v1768, v1769, v1770, v1771);
            *(void *)v2944 = MEMORY[0x1E4F143A8];
            *(void *)&v2944[8] = 3221225472;
            *(void *)&v2944[16] = sub_1C4AE64A0;
            *(void *)&v2944[24] = &unk_1E64E38A8;
            *((void *)&v2945[0] + 1) = &v2941;
            *(void *)&v2945[0] = v1748;
            objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v1733, v1773, (uint64_t)v1772, ii, 1, (uint64_t)v2944);

            if (*(unsigned char *)(*((void *)&v2941 + 1) + 24)) {
              objc_msgSend_addIndex_(v1759, v1774, ii, v1775, v1776, v1777);
            }

            _Block_object_dispose(&v2941, 8);
          }
          BOOL v1833 = objc_msgSend_count(v1759, v1761, v1762, v1763, v1764, v1765) == 0;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = sub_1C4AE657C;
          *(void *)&buf[24] = &unk_1E64E38D0;
          v1834 = v1733;
          *(void *)&buf[32] = v1834;
          *(void *)&buf[40] = v2882;
          v2823 = loga;
          *(void *)&buf[48] = v2823;
          buf[56] = v1833;
          id v2816 = (id)MEMORY[0x1C8786E90](buf);
          *(void *)&long long v2941 = 0;
          *((void *)&v2941 + 1) = &v2941;
          long long v2942 = 0x2020000000uLL;
          v1835 = objc_alloc_init(CHMutableTokenizedTextResult);
          uint64_t v1841 = objc_msgSend_tokenColumnCount(v1834, v1836, v1837, v1838, v1839, v1840);
          *(void *)&long long v2946 = MEMORY[0x1E4F143A8];
          *((void *)&v2946 + 1) = 3221225472;
          *(void *)&long long v2947 = sub_1C4AE6AEC;
          *((void *)&v2947 + 1) = &unk_1E64E38F8;
          *(void *)&long long v2949 = &v2941;
          v1842 = (void (**)(void))v2816;
          *((void *)&v2948 + 1) = v1842;
          v1843 = v1835;
          *(void *)&long long v2948 = v1843;
          objc_msgSend_enumerateRangesUsingBlock_(v1759, v1844, (uint64_t)&v2946, v1845, v1846, v1847);
          if (v1841 > *(void *)(*((void *)&v2941 + 1) + 24)) {
            v1842[2](v1842);
          }
          id v1848 = v1759;
          uint64_t v1854 = objc_msgSend_tokenColumnCount(v1843, v1849, v1850, v1851, v1852, v1853);
          if (v1854 != objc_msgSend_tokenColumnCount(v1834, v1855, v1856, v1857, v1858, v1859))
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v1865 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v1865, OS_LOG_TYPE_FAULT))
            {
              uint64_t v1871 = objc_msgSend_tokenColumnCount(v1834, v1866, v1867, v1868, v1869, v1870);
              uint64_t v1877 = objc_msgSend_tokenColumnCount(v1843, v1872, v1873, v1874, v1875, v1876);
              *(_DWORD *)v2950 = 134218498;
              *(void *)&v2950[4] = v1871;
              *(_WORD *)&v2950[12] = 2048;
              *(void *)&v2950[14] = v1877;
              *(_WORD *)&v2950[22] = 2112;
              *(void *)&v2950[24] = v1848;
              _os_log_impl(&dword_1C492D000, v1865, OS_LOG_TYPE_FAULT, "Unexpected mismatch after recomposing a text result: expected %ld columns, got %ld. Synthetic tokens at indexes: %@", v2950, 0x20u);
            }
          }
          v1878 = objc_msgSend_transcriptionPaths(v1834, v1860, v1861, v1862, v1863, v1864);
          v1884 = objc_msgSend_transcriptionPathScores(v1834, v1879, v1880, v1881, v1882, v1883);
          objc_msgSend_setTranscriptionPaths_scores_(v1843, v1885, (uint64_t)v1878, (uint64_t)v1884, v1886, v1887);

          v1893 = objc_msgSend_inputStrokeIdentifiers(v1834, v1888, v1889, v1890, v1891, v1892);
          objc_msgSend_setInputStrokeIdentifiers_(v1843, v1894, (uint64_t)v1893, v1895, v1896, v1897);

          v1903 = objc_msgSend_locale(v1834, v1898, v1899, v1900, v1901, v1902);
          objc_msgSend_setLocale_(v1843, v1904, (uint64_t)v1903, v1905, v1906, v1907);

          uint64_t v1913 = objc_msgSend_recognizerGenerationIdentifier(v1834, v1908, v1909, v1910, v1911, v1912);
          objc_msgSend_setRecognizerGenerationIdentifier_(v1843, v1914, v1913, v1915, v1916, v1917);
          v1918 = (void *)v2948;
          v1711 = v1843;

          _Block_object_dispose(&v2941, 8);
          logb = v1848;

          v1919 = [CHRecognitionSessionAutoRefineResult alloc];
          uint64_t v2845 = objc_msgSend_initWithStrokeGroupResult_strokeGroup_textResult_refinedColumns_strokeProvider_(v1919, v1920, (uint64_t)v2825, (uint64_t)v2823, (uint64_t)v1711, (uint64_t)logb, *(void *)(v2882 + 560));

          if (v2845)
          {
            objc_msgSend_addObject_(v2810, v1921, v2845, v1922, v1923, v1924);
            v2813 = objc_msgSend_mutableCopy(v2819, v1925, v1926, v1927, v1928, v1929);
            id v1930 = v2825;
            id v2817 = v2854;
            v2826 = v1711;
            v1936 = objc_msgSend_recognitionResultsByLocale(v1930, v1931, v1932, v1933, v1934, v1935);
            v2835 = objc_msgSend_mutableCopy(v1936, v1937, v1938, v1939, v1940, v1941);

            objc_msgSend_setObject_forKeyedSubscript_(v2835, v1942, (uint64_t)v2826, (uint64_t)v2817, v1943, v1944);
            v1945 = [CHStrokeGroupRecognitionResult alloc];
            v1951 = objc_msgSend_recognitionLocales((void *)v2882, v1946, v1947, v1948, v1949, v1950);
            v1957 = objc_msgSend_errorsByLocale(v1930, v1952, v1953, v1954, v1955, v1956);
            v1963 = objc_msgSend_languageFitnessByLocale(v1930, v1958, v1959, v1960, v1961, v1962);
            v1969 = objc_msgSend_mathResult(v1930, v1964, v1965, v1966, v1967, v1968);
            v1975 = objc_msgSend_inputStrokeIdentifiers(v1930, v1970, v1971, v1972, v1973, v1974);
            v1981 = objc_msgSend_inputDrawing(v1930, v1976, v1977, v1978, v1979, v1980);
            v1987 = objc_msgSend_inputDrawingCutPoints(v1930, v1982, v1983, v1984, v1985, v1986);
            v1989 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v1945, v1988, (uint64_t)v1951, (uint64_t)v2835, (uint64_t)v1957, (uint64_t)v1963, v1969, v1975, v1981, v1987);

            v1990 = NSNumber;
            uint64_t v1996 = objc_msgSend_uniqueIdentifier(v2823, v1991, v1992, v1993, v1994, v1995);
            v2001 = objc_msgSend_numberWithInteger_(v1990, v1997, v1996, v1998, v1999, v2000);
            objc_msgSend_setObject_forKeyedSubscript_(v2813, v2002, (uint64_t)v1989, (uint64_t)v2001, v2003, v2004);

            v2005 = v2813;
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v2006 = (id)qword_1EA3C9FA0;
            if (os_log_type_enabled(v2006, OS_LOG_TYPE_DEFAULT))
            {
              v2012 = objc_msgSend_strokeIndexes(v2826, v2007, v2008, v2009, v2010, v2011);
              uint64_t v2018 = objc_msgSend_count(v2012, v2013, v2014, v2015, v2016, v2017);
              v2024 = objc_msgSend_refinableTranscription(v2826, v2019, v2020, v2021, v2022, v2023);
              *(_DWORD *)buf = 134218499;
              *(void *)&buf[4] = v2849;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v2018;
              *(_WORD *)&buf[22] = 2117;
              *(void *)&buf[24] = v2024;
              _os_log_impl(&dword_1C492D000, v2006, OS_LOG_TYPE_DEFAULT, "AutoRefine group [%ld] stored as result with %ld strokes, text = %{sensitive}@", buf, 0x20u);
            }
            v2819 = v2005;
          }
          else
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v2005 = (id)qword_1EA3C9FA0;
            if (os_log_type_enabled(v2005, OS_LOG_TYPE_DEFAULT))
            {
              v2042 = objc_msgSend_strokeIndexes(v1711, v2037, v2038, v2039, v2040, v2041);
              uint64_t v2048 = objc_msgSend_count(v2042, v2043, v2044, v2045, v2046, v2047);
              v2054 = objc_msgSend_refinableTranscription(v1711, v2049, v2050, v2051, v2052, v2053);
              *(_DWORD *)buf = 134218499;
              *(void *)&buf[4] = v2849;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v2048;
              *(_WORD *)&buf[22] = 2117;
              *(void *)&buf[24] = v2054;
              _os_log_impl(&dword_1C492D000, v2005, OS_LOG_TYPE_DEFAULT, "AutoRefine group [%ld] rejected, unable to build result with %ld strokes, text = %{sensitive}@", buf, 0x20u);
            }
          }
        }
LABEL_444:

        unint64_t v1643 = v2849 + 1;
        v2834 = (void *)v2845;
      }
      if (objc_msgSend_count(v2810, v1646, v1647, v1648, v1649, v1650)) {
        v2055 = v2810;
      }
      else {
        v2055 = 0;
      }
      id v2812 = v2055;
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v2056 = (id)qword_1EA3C9FA0;
      if (os_log_type_enabled(v2056, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v2062 = objc_msgSend_count(v2812, v2057, v2058, v2059, v2060, v2061);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v2062;
        _os_log_impl(&dword_1C492D000, v2056, OS_LOG_TYPE_DEFAULT, "AutoRefine groups kept in session result: %ld", buf, 0xCu);
      }

      if ((objc_msgSend_cancelled((void *)v2882, v2063, v2064, v2065, v2066, v2067) & 1) == 0
        && *(unsigned char *)(v2882 + 510))
      {
        v2073 = objc_msgSend_createdStrokeGroups(v2804, v2068, v2069, v2070, v2071, v2072);
        spidb = v2819;
        id obje = v2821;
        id v2827 = v2073;
        os_log_t logc = (os_log_t)v2802;
        if (CHHasPersonalizedSynthesisSupport())
        {
          v2079 = objc_msgSend_delegate((void *)v2882, v2074, v2075, v2076, v2077, v2078);
          v2085 = objc_msgSend_textSynthesizer(v2079, v2080, v2081, v2082, v2083, v2084);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v2092 = objc_msgSend_delegate((void *)v2882, v2087, v2088, v2089, v2090, v2091);
            v2855 = objc_msgSend_textSynthesizer(v2092, v2093, v2094, v2095, v2096, v2097);

            uint64_t v2850 = *(void *)(v2882 + 536);
            if (objc_msgSend_count(logc, v2098, v2099, v2100, v2101, v2102))
            {
              v2108 = (void *)MEMORY[0x1E4F1CA80];
              uint64_t v2109 = objc_msgSend_count(logc, v2103, v2104, v2105, v2106, v2107);
              v2114 = objc_msgSend_setWithCapacity_(v2108, v2110, v2109, v2111, v2112, v2113);
              *(void *)v2944 = MEMORY[0x1E4F143A8];
              *(void *)&v2944[8] = 3221225472;
              *(void *)&v2944[16] = sub_1C4AE7820;
              *(void *)&v2944[24] = &unk_1E64E3948;
              id v2115 = v2114;
              *(void *)&v2945[0] = v2115;
              objc_msgSend_enumerateObjectsUsingBlock_(logc, v2116, (uint64_t)v2944, v2117, v2118, v2119);
              objc_msgSend_updateStyleInventoryWithRemovedStrokeIdentifiers_error_(v2855, v2120, (uint64_t)v2115, 0, v2121, v2122);
            }
            long long v2949 = 0u;
            long long v2948 = 0u;
            long long v2947 = 0u;
            long long v2946 = 0u;
            id v2861 = v2827;
            uint64_t v2130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2861, v2123, (uint64_t)&v2946, (uint64_t)buf, 16, v2124);
            if (v2130)
            {
              uint64_t v2131 = *(void *)v2947;
              do
              {
                for (juint64_t j = 0; jj != v2130; ++jj)
                {
                  if (*(void *)v2947 != v2131) {
                    objc_enumerationMutation(v2861);
                  }
                  v2133 = *(void **)(*((void *)&v2946 + 1) + 8 * jj);
                  v2134 = NSNumber;
                  uint64_t v2135 = objc_msgSend_uniqueIdentifier(v2133, v2125, v2126, v2127, v2128, v2129);
                  v2140 = objc_msgSend_numberWithInteger_(v2134, v2136, v2135, v2137, v2138, v2139);
                  v2145 = objc_msgSend_objectForKey_(spidb, v2141, (uint64_t)v2140, v2142, v2143, v2144);

                  v2151 = objc_msgSend_delegate((void *)v2882, v2146, v2147, v2148, v2149, v2150);
                  v2157 = objc_msgSend_textSynthesizer(v2151, v2152, v2153, v2154, v2155, v2156);
                  v2163 = objc_msgSend_strokeProvider((void *)v2882, v2158, v2159, v2160, v2161, v2162);
                  char isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes = objc_msgSend_isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes_(CHRecognitionSessionTask, v2164, (uint64_t)v2133, (uint64_t)v2157, (uint64_t)v2163, (uint64_t)v2145, obje, 0);

                  if (isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes)
                  {
                    v2171 = objc_msgSend_mathResult(v2145, v2166, v2167, v2168, v2169, v2170);
                    BOOL v2172 = v2171 == 0;

                    if (v2172)
                    {
                      v2179 = objc_msgSend_preferredLocale(v2145, v2173, v2174, v2175, v2176, v2177);
                      v2185 = objc_msgSend_recognitionResultsByLocale(v2145, v2180, v2181, v2182, v2183, v2184);
                      v2178 = objc_msgSend_objectForKeyedSubscript_(v2185, v2186, (uint64_t)v2179, v2187, v2188, v2189);
                    }
                    else
                    {
                      v2178 = objc_msgSend_mathResult(v2145, v2173, v2174, v2175, v2176, v2177);
                    }
                    v2190 = [CHStrokeGroupingManager alloc];
                    v2196 = objc_msgSend_strokeProvider((void *)v2882, v2191, v2192, v2193, v2194, v2195);
                    v2202 = objc_msgSend_recognitionResultsByLocale(v2145, v2197, v2198, v2199, v2200, v2201);
                    v2208 = objc_msgSend_allKeys(v2202, v2203, v2204, v2205, v2206, v2207);
                    isMathMode = objc_msgSend_initWithStrokeProvider_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v2190, v2209, (uint64_t)v2196, 0, (uint64_t)v2208, 0, 0, v2850 == 2);

                    *(void *)v2950 = 0;
                    v2212 = objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(isMathMode, v2211, (uint64_t)v2133, 0, (uint64_t)v2950, 0, 0, 0.0, 0.0);
                    id v2213 = *(id *)v2950;
                    v2214 = (void *)MEMORY[0x1E4F1CA48];
                    uint64_t v2220 = objc_msgSend_strokeCount(v2212, v2215, v2216, v2217, v2218, v2219);
                    v2225 = objc_msgSend_arrayWithCapacity_(v2214, v2221, v2220, v2222, v2223, v2224);
                    *(void *)&long long v2941 = MEMORY[0x1E4F143A8];
                    *((void *)&v2941 + 1) = 3221225472;
                    *(void *)&long long v2942 = sub_1C4AE788C;
                    *((void *)&v2942 + 1) = &unk_1E64E3970;
                    id v2226 = v2225;
                    *(void *)&long long v2943 = v2226;
                    objc_msgSend_enumerateObjectsUsingBlock_(v2213, v2227, (uint64_t)&v2941, v2228, v2229, v2230);
                    objc_msgSend_populateStyleInventoryWithTokenizedResult_drawing_strokeIdentifiers_error_(v2855, v2231, (uint64_t)v2178, (uint64_t)v2212, (uint64_t)v2226, 0);
                  }
                }
                uint64_t v2130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2861, v2125, (uint64_t)&v2946, (uint64_t)buf, 16, v2129);
              }
              while (v2130);
            }
          }
        }

        v2237 = objc_msgSend_autoRefineResults(v2811, v2232, v2233, v2234, v2235, v2236);
        v2243 = objc_msgSend_firstObject(v2237, v2238, v2239, v2240, v2241, v2242);
        id v2244 = v2834;
        id v2245 = v2243;
        id v2246 = obje;
        v2247 = logc;
        if (v2244)
        {
          if (CHHasPersonalizedSynthesisSupport())
          {
            v2253 = objc_msgSend_delegate((void *)v2882, v2248, v2249, v2250, v2251, v2252);
            v2259 = objc_msgSend_textSynthesizer(v2253, v2254, v2255, v2256, v2257, v2258);
            objc_opt_class();
            char v2260 = objc_opt_isKindOfClass();

            if (v2260)
            {
              uint64_t v2266 = objc_msgSend_delegate((void *)v2882, v2261, v2262, v2263, v2264, v2265);
              spidc = objc_msgSend_textSynthesizer((void *)v2266, v2267, v2268, v2269, v2270, v2271);

              objh = objc_msgSend_strokeGroup(v2244, v2272, v2273, v2274, v2275, v2276);
              v2282 = objc_msgSend_delegate((void *)v2882, v2277, v2278, v2279, v2280, v2281);
              v2288 = objc_msgSend_textSynthesizer(v2282, v2283, v2284, v2285, v2286, v2287);
              v2294 = objc_msgSend_strokeProvider((void *)v2882, v2289, v2290, v2291, v2292, v2293);
              v2300 = objc_msgSend_strokeGroupResult(v2244, v2295, v2296, v2297, v2298, v2299);
              LOBYTE(v2266) = objc_msgSend_isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes_(CHRecognitionSessionTask, v2301, (uint64_t)objh, (uint64_t)v2288, (uint64_t)v2294, (uint64_t)v2300, v2246, 1);

              if (v2266)
              {
                v2307 = objc_msgSend_textResult(v2245, v2302, v2303, v2304, v2305, v2306);
                uint64_t v2313 = objc_msgSend_tokenColumnCount(v2307, v2308, v2309, v2310, v2311, v2312);
                v2319 = objc_msgSend_textResult(v2244, v2314, v2315, v2316, v2317, v2318);
                LODWORD(v2313) = v2313 > objc_msgSend_tokenColumnCount(v2319, v2320, v2321, v2322, v2323, v2324);

                if (v2313)
                {
                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  v2330 = (id)qword_1EA3C9FA0;
                  if (os_log_type_enabled(v2330, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1C492D000, v2330, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: (autorefine) rejecting group for incompatible column count with previous result", buf, 2u);
                  }
                }
                else
                {
                  v2331 = objc_msgSend_textResult(v2245, v2325, v2326, v2327, v2328, v2329);
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&uint8_t buf[16] = sub_1C4AE78F8;
                  *(void *)&buf[24] = &unk_1E64E3998;
                  *(void *)&buf[32] = v2245;
                  *(void *)&buf[40] = v2247;
                  *(void *)&buf[48] = v2244;
                  *(void *)&buf[56] = v2882;
                  *(void *)&buf[64] = spidc;
                  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v2331, v2332, (uint64_t)buf, v2333, v2334, v2335);

                  v2330 = *(NSObject **)&buf[32];
                }
              }
            }
          }
        }
      }
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v2068, v2069, v2070, v2071, v2072);
      double v2337 = v2336;
      if (objc_msgSend_cancelled((void *)v2882, v2338, v2339, v2340, v2341, v2342))
      {
        id v2815 = 0;
      }
      else
      {
        if (!v2806)
        {
          v2343 = CHOSLogForCategory(0);
          if (os_log_type_enabled(v2343, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v2343, OS_LOG_TYPE_FAULT, "strokeGroupingResult cannot be nil for a non-cancelled task.", buf, 2u);
          }
        }
        v2344 = [CHRecognitionSessionResult alloc];
        v2350 = objc_msgSend_strokeProviderVersion(v2831, v2345, v2346, v2347, v2348, v2349);
        v2356 = objc_msgSend_inputResult((void *)v2882, v2351, v2352, v2353, v2354, v2355);
        uint64_t v2362 = objc_msgSend_sessionMode(v2356, v2357, v2358, v2359, v2360, v2361);
        v2368 = objc_msgSend_recognitionLocales((void *)v2882, v2363, v2364, v2365, v2366, v2367);
        v2374 = objc_msgSend_preferredLocales((void *)v2882, v2369, v2370, v2371, v2372, v2373);
        v2380 = objc_msgSend_calculateDocumentProvider((void *)v2882, v2375, v2376, v2377, v2378, v2379);
        v2386 = objc_msgSend_declaredVariables(v2380, v2381, v2382, v2383, v2384, v2385);
        *(double *)v2883 = v2792;
        *(double *)&v2883[1] = v2791;
        *(double *)&v2883[2] = v717;
        *(double *)&v2883[3] = v1644;
        *(double *)&v2883[4] = v1645;
        *(double *)&v2883[5] = v2337 - v275;
        uint64_t v2392 = objc_msgSend_recognitionEnvironment((void *)v2882, v2387, v2388, v2389, v2390, v2391);
        id v2815 = (id)objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_rawStrokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_unprocessedStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResults_generationDuration_recognitionEnvironment_(v2344, v2393, (uint64_t)v2350, (uint64_t)v2798, (uint64_t)v2807, v2362, v2368, v2374, v2386, v2808, v2821, v2809, v2804, v2805, v2806, v2819, v2820, v2797, v2812,
                      v2883,
                      v2392);

        objc_msgSend_setCachedRecognitionResultsFromPostProcessing_(v2815, v2394, (uint64_t)v2796, v2395, v2396, v2397);
      }
      sub_1C4ADE714(v2882, v2806, v2820, @"Raw");
      sub_1C4ADE714(v2882, v2804, v2819, @"Processed");
      v2403 = objc_msgSend_recognitionResultsByGroupID(v2811, v2398, v2399, v2400, v2401, v2402);
      os_log_t logd = (os_log_t)v2804;
      v2404 = v2819;
      id v2862 = v2403;
      id v2814 = v2872;
      id v2824 = v2802;
      if (os_variant_has_internal_diagnostics())
      {
        objf = objc_msgSend_set(MEMORY[0x1E4F1CA80], v2405, v2406, v2407, v2408, v2409);
        long long v2952 = 0u;
        long long v2951 = 0u;
        memset(v2950, 0, sizeof(v2950));
        id v2410 = v2814;
        uint64_t v2418 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2410, v2411, (uint64_t)v2950, (uint64_t)buf, 16, v2412);
        if (v2418)
        {
          uint64_t v2419 = **(void **)&v2950[16];
          do
          {
            for (kuint64_t k = 0; kk != v2418; ++kk)
            {
              if (**(void **)&v2950[16] != v2419) {
                objc_enumerationMutation(v2410);
              }
              v2421 = objc_msgSend_encodedStrokeIdentifier(*(void **)(*(void *)&v2950[8] + 8 * kk), v2413, v2414, v2415, v2416, v2417);
              objc_msgSend_addObject_(objf, v2422, (uint64_t)v2421, v2423, v2424, v2425);
            }
            uint64_t v2418 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2410, v2413, (uint64_t)v2950, (uint64_t)buf, 16, v2417);
          }
          while (v2418);
        }

        long long v2926 = 0u;
        long long v2925 = 0u;
        long long v2924 = 0u;
        long long v2923 = 0u;
        v2431 = objc_msgSend_createdStrokeGroups(logd, v2426, v2427, v2428, v2429, v2430);
        spidd = v2431;
        uint64_t v2439 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2431, v2432, (uint64_t)&v2923, (uint64_t)&v2946, 16, v2433);
        v2846 = v2404;
        if (v2439)
        {
          uint64_t v2440 = *(void *)v2924;
          do
          {
            for (muint64_t m = 0; mm != v2439; ++mm)
            {
              if (*(void *)v2924 != v2440) {
                objc_enumerationMutation(spidd);
              }
              v2442 = *(void **)(*((void *)&v2923 + 1) + 8 * mm);
              v2443 = NSNumber;
              uint64_t v2444 = objc_msgSend_uniqueIdentifier(v2442, v2434, v2435, v2436, v2437, v2438);
              v2449 = objc_msgSend_numberWithInteger_(v2443, v2445, v2444, v2446, v2447, v2448);
              v2454 = objc_msgSend_objectForKeyedSubscript_(v2404, v2450, (uint64_t)v2449, v2451, v2452, v2453);

              v2465 = objc_msgSend_mathResult(v2454, v2455, v2456, v2457, v2458, v2459);
              if (v2465)
              {
                v2466 = objc_msgSend_mathResult(v2454, v2460, v2461, v2462, v2463, v2464);
                int isEvaluationExpected = objc_msgSend_isEvaluationExpected(v2466, v2467, v2468, v2469, v2470, v2471);

                if (isEvaluationExpected)
                {
                  v2478 = objc_msgSend_mathResult(v2454, v2473, v2474, v2475, v2476, v2477);
                  v2484 = objc_msgSend_preferredTranscription(v2478, v2479, v2480, v2481, v2482, v2483);
                  int hasSuffix = objc_msgSend_hasSuffix_(v2484, v2485, @"=", v2486, v2487, v2488);
                  v2490 = @"vertical";
                  if (hasSuffix) {
                    v2490 = @"horizontal";
                  }
                  v2491 = v2490;

                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  v2492 = (id)qword_1EA3C9FA0;
                  if (os_log_type_enabled(v2492, OS_LOG_TYPE_DEFAULT))
                  {
                    v2498 = objc_msgSend_mathResult(v2454, v2493, v2494, v2495, v2496, v2497);
                    v2504 = objc_msgSend_mathResult(v2454, v2499, v2500, v2501, v2502, v2503);
                    objc_msgSend_score(v2504, v2505, v2506, v2507, v2508, v2509);
                    uint64_t v2511 = v2510;
                    uint64_t v2517 = objc_msgSend_uniqueIdentifier(v2442, v2512, v2513, v2514, v2515, v2516);
                    uint64_t v2523 = objc_msgSend_ancestorIdentifier(v2442, v2518, v2519, v2520, v2521, v2522);
                    *(_DWORD *)v2944 = 134219010;
                    *(void *)&v2944[4] = v2498;
                    *(_WORD *)&v2944[12] = 2112;
                    *(void *)&v2944[14] = v2491;
                    *(_WORD *)&v2944[22] = 2048;
                    *(void *)&v2944[24] = v2511;
                    LOWORD(v2945[0]) = 2048;
                    *(void *)((char *)v2945 + 2) = v2517;
                    WORD5(v2945[0]) = 2048;
                    *(void *)((char *)v2945 + 12) = v2523;
                    _os_log_impl(&dword_1C492D000, v2492, OS_LOG_TYPE_DEFAULT, "Math expression %p detected. Type: %@, Score: %.3f, Unique ID: %lu, Ancestor ID: %lu", v2944, 0x34u);

                    v2404 = v2846;
                  }

                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  v2524 = (id)qword_1EA3C9FA0;
                  if (os_log_type_enabled(v2524, OS_LOG_TYPE_DEFAULT))
                  {
                    v2530 = objc_msgSend_mathResult(v2454, v2525, v2526, v2527, v2528, v2529);
                    v2536 = objc_msgSend_alternativeCandidatesLog(v2530, v2531, v2532, v2533, v2534, v2535);
                    *(_DWORD *)v2944 = 138412290;
                    *(void *)&v2944[4] = v2536;
                    _os_log_impl(&dword_1C492D000, v2524, OS_LOG_TYPE_DEFAULT, "%@", v2944, 0xCu);
                  }
                }
              }
            }
            v2431 = spidd;
            uint64_t v2439 = objc_msgSend_countByEnumeratingWithState_objects_count_(spidd, v2434, (uint64_t)&v2923, (uint64_t)&v2946, 16, v2438);
          }
          while (v2439);
        }

        long long v2922 = 0u;
        long long v2921 = 0u;
        long long v2920 = 0u;
        long long v2919 = 0u;
        v2542 = objc_msgSend_deletedStrokeGroups(logd, v2537, v2538, v2539, v2540, v2541);
        v2851 = v2542;
        uint64_t v2545 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2542, v2543, (uint64_t)&v2919, (uint64_t)v2944, 16, v2544);
        if (v2545)
        {
          uint64_t v2856 = *(void *)v2920;
          do
          {
            uint64_t spide = v2545;
            for (nuint64_t n = 0; nn != spide; ++nn)
            {
              if (*(void *)v2920 != v2856) {
                objc_enumerationMutation(v2851);
              }
              v2552 = *(void **)(*((void *)&v2919 + 1) + 8 * nn);
              v2553 = NSNumber;
              uint64_t v2554 = objc_msgSend_uniqueIdentifier(v2552, v2546, v2547, v2548, v2549, v2550);
              v2559 = objc_msgSend_numberWithInteger_(v2553, v2555, v2554, v2556, v2557, v2558);
              v2564 = objc_msgSend_objectForKeyedSubscript_(v2862, v2560, (uint64_t)v2559, v2561, v2562, v2563);

              v2575 = objc_msgSend_mathResult(v2564, v2565, v2566, v2567, v2568, v2569);
              if (v2575)
              {
                v2576 = objc_msgSend_mathResult(v2564, v2570, v2571, v2572, v2573, v2574);
                int v2582 = objc_msgSend_isEvaluationExpected(v2576, v2577, v2578, v2579, v2580, v2581);

                if (v2582)
                {
                  v2588 = objc_msgSend_mathResult(v2564, v2583, v2584, v2585, v2586, v2587);
                  v2594 = objc_msgSend_preferredTranscription(v2588, v2589, v2590, v2591, v2592, v2593);
                  int v2599 = objc_msgSend_hasSuffix_(v2594, v2595, @"=", v2596, v2597, v2598);
                  v2600 = @"vertical";
                  if (v2599) {
                    v2600 = @"horizontal";
                  }
                  v2601 = v2600;

                  long long v2918 = 0u;
                  long long v2917 = 0u;
                  long long v2916 = 0u;
                  long long v2915 = 0u;
                  v2607 = objc_msgSend_createdStrokeGroups(logd, v2602, v2603, v2604, v2605, v2606);
                  id v2615 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v2607, v2608, (uint64_t)&v2915, (uint64_t)&v2941, 16, v2609);
                  if (v2615)
                  {
                    uint64_t v2616 = *(void *)v2916;
LABEL_530:
                    uint64_t v2617 = 0;
                    while (1)
                    {
                      if (*(void *)v2916 != v2616) {
                        objc_enumerationMutation(v2607);
                      }
                      v2618 = *(void **)(*((void *)&v2915 + 1) + 8 * v2617);
                      uint64_t v2619 = objc_msgSend_ancestorIdentifier(v2618, v2610, v2611, v2612, v2613, v2614);
                      if (v2619 == objc_msgSend_ancestorIdentifier(v2552, v2620, v2621, v2622, v2623, v2624)) {
                        break;
                      }
                      if (v2615 == (id)++v2617)
                      {
                        id v2615 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v2607, v2610, (uint64_t)&v2915, (uint64_t)&v2941, 16, v2614);
                        if (v2615) {
                          goto LABEL_530;
                        }
                        v2625 = @"grouping changed";
                        v2404 = v2846;
                        goto LABEL_548;
                      }
                    }
                    id v2615 = v2618;

                    v2404 = v2846;
                    if (v2615)
                    {
                      v2631 = objc_msgSend_strokeIdentifiers(v2615, v2626, v2627, v2628, v2629, v2630);
                      unint64_t v2637 = objc_msgSend_count(v2631, v2632, v2633, v2634, v2635, v2636);
                      v2643 = objc_msgSend_strokeIdentifiers(v2552, v2638, v2639, v2640, v2641, v2642);
                      LODWORD(v2637) = v2637 > objc_msgSend_count(v2643, v2644, v2645, v2646, v2647, v2648);

                      v2625 = @"grouping changed";
                      if (v2637)
                      {
                        v2654 = objc_msgSend_strokeIdentifiers(v2615, v2649, v2650, v2651, v2652, v2653);
                        v2660 = objc_msgSend_mutableCopy(v2654, v2655, v2656, v2657, v2658, v2659);

                        objc_msgSend_minusSet_(v2660, v2661, (uint64_t)objf, v2662, v2663, v2664);
                        v2670 = objc_msgSend_strokeIdentifiers(v2552, v2665, v2666, v2667, v2668, v2669);
                        int isEqualToSet = objc_msgSend_isEqualToSet_(v2660, v2671, (uint64_t)v2670, v2672, v2673, v2674);

                        if (isEqualToSet) {
                          v2625 = @"strokes added";
                        }
                        else {
                          v2625 = @"grouping changed";
                        }
                      }
                      v2676 = objc_msgSend_strokeIdentifiers(v2615, v2649, v2650, v2651, v2652, v2653);
                      unint64_t v2682 = objc_msgSend_count(v2676, v2677, v2678, v2679, v2680, v2681);
                      v2688 = objc_msgSend_strokeIdentifiers(v2552, v2683, v2684, v2685, v2686, v2687);
                      LODWORD(v2682) = v2682 < objc_msgSend_count(v2688, v2689, v2690, v2691, v2692, v2693);

                      if (v2682)
                      {
                        v2699 = objc_msgSend_strokeIdentifiers(v2552, v2694, v2695, v2696, v2697, v2698);
                        v2607 = objc_msgSend_mutableCopy(v2699, v2700, v2701, v2702, v2703, v2704);

                        objc_msgSend_minusSet_(v2607, v2705, (uint64_t)v2824, v2706, v2707, v2708);
                        v2714 = objc_msgSend_strokeIdentifiers(v2615, v2709, v2710, v2711, v2712, v2713);
                        int v2719 = objc_msgSend_isEqualToSet_(v2607, v2715, (uint64_t)v2714, v2716, v2717, v2718);

                        if (v2719) {
                          v2625 = @"strokes erased";
                        }
                        goto LABEL_548;
                      }
                      goto LABEL_549;
                    }
                    v2625 = @"grouping changed";
                    if (qword_1EA3CA000 == -1) {
                      goto LABEL_550;
                    }
LABEL_556:
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  else
                  {
                    v2625 = @"grouping changed";
LABEL_548:

LABEL_549:
                    if (qword_1EA3CA000 != -1) {
                      goto LABEL_556;
                    }
                  }
LABEL_550:
                  v2720 = (id)qword_1EA3C9FA0;
                  if (os_log_type_enabled(v2720, OS_LOG_TYPE_DEFAULT))
                  {
                    v2726 = objc_msgSend_mathResult(v2564, v2721, v2722, v2723, v2724, v2725);
                    v2732 = objc_msgSend_mathResult(v2564, v2727, v2728, v2729, v2730, v2731);
                    objc_msgSend_score(v2732, v2733, v2734, v2735, v2736, v2737);
                    uint64_t v2739 = v2738;
                    uint64_t v2745 = objc_msgSend_uniqueIdentifier(v2552, v2740, v2741, v2742, v2743, v2744);
                    uint64_t v2751 = objc_msgSend_ancestorIdentifier(v2552, v2746, v2747, v2748, v2749, v2750);
                    *(_DWORD *)v2930 = 134219266;
                    uint64_t v2931 = (uint64_t)v2726;
                    __int16 v2932 = 2112;
                    *(void *)v2933 = v2601;
                    *(_WORD *)&v2933[8] = 2048;
                    uint64_t v2934 = v2739;
                    __int16 v2935 = 2048;
                    uint64_t v2936 = v2745;
                    __int16 v2937 = 2048;
                    uint64_t v2938 = v2751;
                    __int16 v2939 = 2112;
                    v2940 = v2625;
                    _os_log_impl(&dword_1C492D000, v2720, OS_LOG_TYPE_DEFAULT, "Math expression %p removed. Type: %@, Score: %.3f, Unique ID: %lu, Ancestor ID: %lu, Reason: %@", v2930, 0x3Eu);

                    v2404 = v2846;
                  }
                }
              }
            }
            v2542 = v2851;
            uint64_t v2545 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2851, v2546, (uint64_t)&v2919, (uint64_t)v2944, 16, v2550);
          }
          while (v2545);
        }
      }
LABEL_560:
      objc_storeStrong((id *)(v2882 + 576), v2815);
      id v2757 = v2831;
      if (qword_1EA3C92F8 != -1) {
        dispatch_once(&qword_1EA3C92F8, &unk_1F2012DD0);
      }
      v2758 = objc_msgSend_outputResult((void *)v2882, v2752, v2753, v2754, v2755, v2756);
      if (v2758) {
        BOOL v2759 = byte_1EA3C92F0 == 0;
      }
      else {
        BOOL v2759 = 1;
      }
      int v2760 = !v2759;

      if (v2760)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v2761 = (id)qword_1EA3C9FA0;
        if (os_log_type_enabled(v2761, OS_LOG_TYPE_DEBUG))
        {
          v2767 = objc_msgSend_strokeProviderVersion(v2757, v2762, v2763, v2764, v2765, v2766);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v2767;
          _os_log_impl(&dword_1C492D000, v2761, OS_LOG_TYPE_DEBUG, "Recognition results for version %@:", buf, 0xCu);
        }
        v2773 = objc_msgSend_outputResult((void *)v2882, v2768, v2769, v2770, v2771, v2772);
        v2779 = objc_msgSend_allResultsDebugDescriptionByGroup(v2773, v2774, v2775, v2776, v2777, v2778);

        long long v2949 = 0u;
        long long v2948 = 0u;
        long long v2947 = 0u;
        long long v2946 = 0u;
        id v2780 = v2779;
        uint64_t v2783 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2780, v2781, (uint64_t)&v2946, (uint64_t)buf, 16, v2782);
        if (v2783)
        {
          uint64_t v2784 = *(void *)v2947;
          do
          {
            uint64_t v2785 = 0;
            do
            {
              if (*(void *)v2947 != v2784) {
                objc_enumerationMutation(v2780);
              }
              uint64_t v2786 = *(void *)(*((void *)&v2946 + 1) + 8 * v2785);
              if (qword_1EA3CA000 == -1)
              {
                v2787 = (id)qword_1EA3C9FA0;
                if (!os_log_type_enabled(v2787, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_581;
                }
LABEL_580:
                *(_DWORD *)v2944 = 138412290;
                *(void *)&v2944[4] = v2786;
                _os_log_impl(&dword_1C492D000, v2787, OS_LOG_TYPE_DEBUG, "%@", v2944, 0xCu);
                goto LABEL_581;
              }
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
              v2787 = (id)qword_1EA3C9FA0;
              if (os_log_type_enabled(v2787, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_580;
              }
LABEL_581:

              ++v2785;
            }
            while (v2783 != v2785);
            uint64_t v2790 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2780, v2788, (uint64_t)&v2946, (uint64_t)buf, 16, v2789);
            uint64_t v2783 = v2790;
          }
          while (v2790);
        }
      }
      v485 = v2815;
      sub_1C4ADE1D4(v2882, 2);
LABEL_588:

      v9 = v2811;
      goto LABEL_589;
    }
    if (v658 != 1)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v695 = (id)qword_1EA3C9FA0;
      double v717 = 0.0;
      if (os_log_type_enabled(v695, OS_LOG_TYPE_ERROR))
      {
        uint64_t v718 = objc_msgSend_strokeGroupingRequirement((void *)v2882, v712, v713, v714, v715, v716);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v718;
        _os_log_impl(&dword_1C492D000, v695, OS_LOG_TYPE_ERROR, "Grouping algorithm not implemented: %ld", buf, 0xCu);
      }
      v2801 = 0;
      v2821 = 0;
      id v2805 = 0;
      v719 = 0;
      v2809 = 0;
      goto LABEL_182;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v664 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v665 = os_signpost_id_generate(v664);

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v666 = (id)qword_1EA3C9FC8;
    v667 = v666;
    unint64_t v668 = v665 - 1;
    if (v665 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v666))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v667, OS_SIGNPOST_INTERVAL_BEGIN, v665, "CHSessionStrokeGroupingFast", "", buf, 2u);
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v669 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v669, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v669, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionStrokeGroupingFast\"", buf, 2u);
    }

    uint64_t v675 = objc_msgSend_completedUnitCount(v2803, v670, v671, v672, v673, v674);
    objc_msgSend_setCompletedUnitCount_(v2803, v676, v675 + 10, v677, v678, v679);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v680, v681, v682, v683, v684);
    double v686 = v685;
    v687 = [CHFastStrokeGroupingStrategy alloc];
    v695 = objc_msgSend_initWithStrokeProvider_locales_clutterFilter_(v687, v688, (uint64_t)v2831, 0, (uint64_t)v2808, v689);
    if (*(void *)(v2882 + 648))
    {
      id v699 = v2872;
    }
    else
    {
      v733 = objc_msgSend_strokeProvider((void *)v2882, v690, v691, v692, v693, v694);
      objc_msgSend_orderedStrokes(v733, v734, v735, v736, v737, v738);
      id v699 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2895[0] = MEMORY[0x1E4F143A8];
    v2895[1] = 3221225472;
    v2895[2] = sub_1C4ADE304;
    v2895[3] = &unk_1E64E3798;
    v2895[4] = v2882;
    v719 = objc_msgSend_lineGroupingResultUsingStrokes_shouldCancel_(v695, v696, (uint64_t)v699, (uint64_t)v2895, v697, v698);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v739, v740, v741, v742, v743);
    double v745 = v744;
    if (qword_1EA3CA000 == -1)
    {
      v746 = (id)qword_1EA3C9FC8;
      if (v668 <= 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_175;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v746 = (id)qword_1EA3C9FC8;
      if (v668 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_175:
        if (os_signpost_enabled(v746))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v746, OS_SIGNPOST_INTERVAL_END, v665, "CHSessionStrokeGroupingFast", "", buf, 2u);
        }
      }
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v747 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v747, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v747, OS_LOG_TYPE_DEFAULT, "END \"CHSessionStrokeGroupingFast\"", buf, 2u);
    }

    v2801 = 0;
    v2821 = 0;
    id v2805 = 0;
    v2809 = 0;
    double v717 = v745 - v686;
LABEL_182:
    double v2791 = 0.0;
    goto LABEL_268;
  }
  objc_sync_exit(v9);
LABEL_589:
}

- (void)cancel
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_status = 2;
  obj->_cancelled = 1;
  objc_sync_exit(obj);
}

- (BOOL)isNonRecognitionTask
{
  return objc_msgSend_principalLineRequirement(self, a2, v2, v3, v4, v5) == 3;
}

- (id)recognitionResultsForGroupingResult:(id)a3 groupingManager:(id)a4 strokeGroupsToProcess:(id)a5 strokeClassificationResult:(id)a6 strokeGroupReplacements:(id *)a7
{
  uint64_t v687 = *MEMORY[0x1E4F143B8];
  id v656 = a3;
  id v11 = a4;
  id v643 = a5;
  id v637 = a6;
  uint64_t v652 = self;
  uint64_t v640 = v11;
  v631 = sub_1C4AE053C(self, v11);
  uint64_t v12 = [CHHorizontalUndersegmentationSplittingStep alloc];
  uint64_t v638 = objc_msgSend_initWithAdditionalMathRecognitionBlock_(v12, v13, (uint64_t)v631, v14, v15, v16);
  uint64_t v17 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v23 = objc_msgSend_strokeGroups(v656, v18, v19, v20, v21, v22);
  uint64_t v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);
  v657 = objc_msgSend_dictionaryWithCapacity_(v17, v30, v29, v31, v32, v33);

  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v34, v35, v36, v37, v38);
  id v636 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v653 = objc_msgSend_inputResult(self, v39, v40, v41, v42, v43);
  intermediateDeclaredVariables = self->_intermediateDeclaredVariables;
  locatiouint64_t n = (uint64_t *)&self->_intermediateDeclaredVariables;
  if (objc_msgSend_leverageAllProvidedVariables(self, v44, v45, v46, v47, v48))
  {
    uint64_t v54 = objc_msgSend_calculateDocumentProvider(self, v49, v50, v51, v52, v53);
    uint64_t v60 = objc_msgSend_declaredVariables(v54, v55, v56, v57, v58, v59);
  }
  else
  {
    objc_msgSend_set(MEMORY[0x1E4F1CA80], v49, v50, v51, v52, v53);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    long long v685 = 0u;
    long long v686 = 0u;
    long long v683 = 0u;
    long long v684 = 0u;
    uint64_t v70 = objc_msgSend_calculateDocumentProvider(self, v65, v66, v67, v68, v69);
    uint64_t v76 = objc_msgSend_recognizedExpressions(v70, v71, v72, v73, v74, v75);

    uint64_t v660 = v76;
    uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v683, (uint64_t)&buf, 16, v78);
    if (v79)
    {
      uint64_t v658 = *(void *)v684;
      do
      {
        for (uint64_t i = 0; i != v79; ++i)
        {
          if (*(void *)v684 != v658) {
            objc_enumerationMutation(v660);
          }
          uint64_t v81 = *(void **)(*((void *)&v683 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            if (objc_msgSend_isAssociatedWithCurrentSession(v81, v82, v83, v84, v85, v86)) {
              goto LABEL_20;
            }
          }
          else
          {
            uint64_t v92 = objc_msgSend_inputResult(v652, v82, v83, v84, v85, v86);
            uint64_t v98 = objc_msgSend_strokeGroupIdentifier(v81, v93, v94, v95, v96, v97);
            uint64_t v104 = objc_msgSend_integerValue(v98, v99, v100, v101, v102, v103);
            uint64_t v109 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v92, v105, v104, v106, v107, v108);

            if (v109)
            {
              uint64_t v115 = objc_msgSend_mathResult(v109, v87, v88, v89, v90, v91);
              if (v115)
              {
                uint64_t v116 = objc_msgSend_mathResult(v109, v110, v111, v112, v113, v114);
                uint64_t v122 = objc_msgSend_preferredTranscription(v116, v117, v118, v119, v120, v121);
                uint64_t v128 = objc_msgSend_expression(v81, v123, v124, v125, v126, v127);
                char isEqualToString = objc_msgSend_isEqualToString_(v122, v129, (uint64_t)v128, v130, v131, v132);

                if (isEqualToString) {
                  goto LABEL_20;
                }
              }
              else
              {
              }
            }
          }
          uint64_t v134 = objc_msgSend_expression(v81, v87, v88, v89, v90, v91);
          uint64_t v139 = objc_msgSend_declaredVariableInLatexTranscription_(CHTokenizedMathResult, v135, (uint64_t)v134, v136, v137, v138);

          if (v139) {
            objc_msgSend_addObject_(obj, v140, (uint64_t)v139, v141, v142, v143);
          }
        }
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v660, v144, (uint64_t)&v683, (uint64_t)&buf, 16, v145);
      }
      while (v79);
    }
LABEL_20:

    uint64_t v60 = objc_msgSend_copy(obj, v146, v147, v148, v149, v150);
  }
  objc_msgSend_unionSet_(intermediateDeclaredVariables, v61, (uint64_t)v60, v62, v63, v64);

  uint64_t v151 = [CHCTLD alloc];
  v630 = objc_msgSend_initWithType_(v151, v152, 1, v153, v154, v155);
  v161 = objc_msgSend_textStrokeGroups(v656, v156, v157, v158, v159, v160);
  v167 = objc_msgSend_allObjects(v161, v162, v163, v164, v165, v166);
  uint64_t v172 = objc_msgSend_orderStrokeGroups_(v630, v168, (uint64_t)v167, v169, v170, v171);

  uint64_t v178 = objc_msgSend_nontextStrokeGroups(v656, v173, v174, v175, v176, v177);
  uint64_t v184 = objc_msgSend_allObjects(v178, v179, v180, v181, v182, v183);
  uint64_t v635 = objc_msgSend_arrayByAddingObjectsFromArray_(v172, v185, (uint64_t)v184, v186, v187, v188);

  uint64_t v634 = objc_msgSend_currentProgress(MEMORY[0x1E4F28F90], v189, v190, v191, v192, v193);
  v194 = (void *)MEMORY[0x1E4F28F90];
  uint64_t v200 = objc_msgSend_count(v635, v195, v196, v197, v198, v199);
  v649 = objc_msgSend_progressWithTotalUnitCount_parent_pendingUnitCount_(v194, v201, v200, (uint64_t)v634, 60, v202);
  uint64_t v632 = objc_msgSend_mergeableStrokeGroupClustersFromSortedStrokeGroups_(CHStrokeGroupingManager, v203, (uint64_t)v635, v204, v205, v206);
  uint64_t v661 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v207, v208, v209, v210, v211);
  v659 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v212, v213, v214, v215, v216);
  long long v674 = 0u;
  long long v675 = 0u;
  long long v672 = 0u;
  long long v673 = 0u;
  id obja = v632;
  uint64_t v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v217, (uint64_t)&v672, (uint64_t)v678, 16, v218);
  if (v224)
  {
    uint64_t v225 = *(void *)v673;
    do
    {
      for (uint64_t j = 0; j != v224; ++j)
      {
        if (*(void *)v673 != v225) {
          objc_enumerationMutation(obja);
        }
        v227 = *(void **)(*((void *)&v672 + 1) + 8 * j);
        v228 = objc_msgSend_firstObject(v227, v219, v220, v221, v222, v223);
        objc_msgSend_addObject_(v659, v229, (uint64_t)v228, v230, v231, v232);

        v238 = objc_msgSend_lastObject(v227, v233, v234, v235, v236, v237);
        objc_msgSend_addObject_(v661, v239, (uint64_t)v238, v240, v241, v242);
      }
      uint64_t v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v219, (uint64_t)&v672, (uint64_t)v678, 16, v223);
    }
    while (v224);
  }

  long long v670 = 0u;
  long long v671 = 0u;
  long long v668 = 0u;
  long long v669 = 0u;
  id v639 = v635;
  uint64_t v250 = objc_msgSend_countByEnumeratingWithState_objects_count_(v639, v243, (uint64_t)&v668, (uint64_t)v677, 16, v244);
  if (!v250)
  {
    id v651 = 0;
    goto LABEL_88;
  }
  id v651 = 0;
  uint64_t v642 = *(void *)v669;
  while (2)
  {
    uint64_t v251 = 0;
    do
    {
      if (*(void *)v669 != v642) {
        objc_enumerationMutation(v639);
      }
      v252 = *(void **)(*((void *)&v668 + 1) + 8 * v251);
      if (objc_msgSend_cancelled(v652, v245, v246, v247, v248, v249))
      {
        uint64_t v490 = objc_msgSend_totalUnitCount(v649, v253, v254, v255, v256, v257);
        objc_msgSend_setCompletedUnitCount_(v649, v491, v490, v492, v493, v494);
        goto LABEL_88;
      }
      context = (void *)MEMORY[0x1C8786C20]();
      uint64_t v263 = objc_msgSend_uniqueIdentifier(v252, v258, v259, v260, v261, v262);
      uint64_t v273 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v653, v264, v263, v265, v266, v267);
      if (!v273)
      {
        uint64_t v274 = objc_msgSend_uniqueIdentifier(v252, v268, v269, v270, v271, v272);
        uint64_t v273 = objc_msgSend_rawRecognitionResultForStrokeGroupIdentifier_(v653, v275, v274, v276, v277, v278);
      }
      int v647 = objc_msgSend_containsObject_(v659, v268, (uint64_t)v252, v270, v271, v272);
      int v646 = objc_msgSend_containsObject_(v661, v279, (uint64_t)v252, v280, v281, v282);
      char v287 = objc_msgSend_containsObject_(v643, v283, (uint64_t)v252, v284, v285, v286);
      if (v273) {
        char v293 = v287;
      }
      else {
        char v293 = 1;
      }
      if (v293) {
        goto LABEL_44;
      }
      uint64_t v299 = objc_msgSend_mathResult(v273, v288, v289, v290, v291, v292);
      if (v299)
      {
        uint64_t v300 = objc_msgSend_mathResult(v273, v294, v295, v296, v297, v298);
        uint64_t v306 = objc_msgSend_declaredVariablesWhileRecognized(v300, v301, v302, v303, v304, v305);
        char isEqualToSet = objc_msgSend_isEqualToSet_(v306, v307, *location, v308, v309, v310);

        if ((isEqualToSet & 1) == 0)
        {
LABEL_44:
          v319 = objc_opt_class();
          uint64_t v325 = objc_msgSend_classification(v252, v320, v321, v322, v323, v324);
          if (objc_msgSend_isStrokeClassificationTextOrMath_(v319, v326, v325, v327, v328, v329))
          {
            id v667 = 0;
            uint64_t v330 = sub_1C4AE0600(v652, v252, v640, (uint64_t)&v667);
            id v331 = v667;
            id v666 = v331;
            uint64_t v332 = sub_1C4AE1680(v652, v330, v252, v640, v637, &v666);
            id v333 = v666;

            v339 = objc_msgSend_mathResult(v332, v334, v335, v336, v337, v338);
            BOOL v340 = v339 == 0;

            if (!v340)
            {
              uint64_t v346 = *location;
              uint64_t v347 = objc_msgSend_mathResult(v332, v341, v342, v343, v344, v345);
              objc_msgSend_setDeclaredVariablesWhileRecognized_(v347, v348, v346, v349, v350, v351);

              sub_1C4ADECE4((uint64_t)v652, v332, v252, v638);
            }
            if (v333) {
              v352 = v333;
            }
            else {
              v352 = v252;
            }
            id v353 = v352;
            if ((objc_msgSend_cancelled(v652, v354, v355, v356, v357, v358) & 1) == 0
              && objc_msgSend_principalLineRequirement(v652, v359, v360, v361, v362, v363) == 1
              && (objc_msgSend_classification(v353, v364, v365, v366, v367, v368) == 1
               || objc_msgSend_classification(v353, v369, v370, v371, v372, v373) == 2))
            {
              uint64_t v374 = sub_1C4ADE33C(v652, v353, v332);
            }
            else
            {
              uint64_t v374 = v332;
            }

            if (!v374) {
              goto LABEL_63;
            }
            if (v333)
            {
              uint64_t v408 = NSNumber;
              uint64_t v409 = objc_msgSend_uniqueIdentifier(v333, v403, v404, v405, v406, v407);
              v414 = objc_msgSend_numberWithInteger_(v408, v410, v409, v411, v412, v413);
              objc_msgSend_setObject_forKeyedSubscript_(v657, v415, (uint64_t)v374, (uint64_t)v414, v416, v417);

              v418 = NSNumber;
              uint64_t v424 = objc_msgSend_uniqueIdentifier(v252, v419, v420, v421, v422, v423);
              uint64_t v429 = objc_msgSend_numberWithInteger_(v418, v425, v424, v426, v427, v428);
              objc_msgSend_setObject_forKeyedSubscript_(v636, v430, (uint64_t)v333, (uint64_t)v429, v431, v432);
LABEL_62:

              goto LABEL_63;
            }
          }
          else
          {
            id v641 = v252;
            uint64_t v380 = objc_msgSend_strokeProvider(v652, v375, v376, v377, v378, v379);
            uint64_t v381 = (void *)MEMORY[0x1E4F29008];
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v680 = sub_1C4AE6B68;
            uint64_t v681 = &unk_1E64E1868;
            id v382 = v380;
            id v682 = v382;
            uint64_t v385 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v381, v383, 0, 1, (uint64_t)&buf, v384);
            uint64_t v391 = objc_msgSend_strokeIdentifiers(v641, v386, v387, v388, v389, v390);
            *(void *)&long long v683 = v385;
            uint64_t v395 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v392, (uint64_t)&v683, 1, v393, v394);
            uint64_t v400 = objc_msgSend_sortedArrayUsingDescriptors_(v391, v396, (uint64_t)v395, v397, v398, v399);

            uint64_t v401 = [CHStrokeGroupRecognitionResult alloc];
            uint64_t v374 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v401, v402, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CC08], 0, MEMORY[0x1E4F1CC08], 0, v400, 0, 0);

            if (!v374)
            {
              id v333 = 0;
LABEL_63:

              goto LABEL_64;
            }
          }
          uint64_t v433 = NSNumber;
          uint64_t v434 = objc_msgSend_uniqueIdentifier(v252, v403, v404, v405, v406, v407);
          uint64_t v429 = objc_msgSend_numberWithInteger_(v433, v435, v434, v436, v437, v438);
          objc_msgSend_setObject_forKeyedSubscript_(v657, v439, (uint64_t)v374, (uint64_t)v429, v440, v441);
          id v333 = 0;
          goto LABEL_62;
        }
      }
      uint64_t v312 = objc_msgSend_mathResult(v273, v294, v295, v296, v297, v298);
      BOOL v313 = v312 == 0;

      if (!v313) {
        sub_1C4ADECE4((uint64_t)v652, v273, v252, v638);
      }
LABEL_64:
      if (v647)
      {
        uint64_t v442 = objc_msgSend_mutableCopy((void *)*location, v314, v315, v316, v317, v318);

        id v651 = (id)v442;
        if (v442) {
          int v443 = v646;
        }
        else {
          int v443 = 0;
        }
        if (v443 != 1) {
          goto LABEL_83;
        }
      }
      else
      {
        if (v651) {
          int v444 = v646;
        }
        else {
          int v444 = 0;
        }
        if (v444 != 1) {
          goto LABEL_83;
        }
      }
      uint64_t v445 = objc_msgSend_indexOfObject_(v661, v314, (uint64_t)v252, v316, v317, v318);
      objc_msgSend_objectAtIndexedSubscript_(obja, v446, v445, v447, v448, v449);
      id v450 = (id)objc_claimAutoreleasedReturnValue();
      id v451 = v657;
      id v648 = v651;
      uint64_t v455 = objc_msgSend_textTranscriptionsForSortedGroupCluster_recognizedResultsByGroupID_(CHStrokeGroupRecognitionResult, v452, (uint64_t)v450, (uint64_t)v451, v453, v454);
      uint64_t v461 = objc_msgSend_count(v455, v456, v457, v458, v459, v460);
      if (v461 == objc_msgSend_count(v450, v462, v463, v464, v465, v466))
      {
        uint64_t v471 = objc_msgSend_componentsJoinedByString_(v455, v467, (uint64_t)&stru_1F20141C8, v468, v469, v470);
        uint64_t v475 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v471, v472, @" ", (uint64_t)&stru_1F20141C8, v473, v474);

        *(void *)&long long v683 = 0;
        LODWORD(v471) = objc_msgSend_isTextTranscriptionVariableAssignment_outVariable_(CHTokenizedTextResult, v476, (uint64_t)v475, (uint64_t)&v683, v477, v478);
        id v479 = (id)v683;
        if (v471)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v480 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v480, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v479;
            _os_log_impl(&dword_1C492D000, v480, OS_LOG_TYPE_DEBUG, "Add variable %@ from mergeable group", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend_addObject_(v648, v481, (uint64_t)v479, v482, v483, v484);
          objc_storeStrong((id *)location, v651);
        }
      }
      id v651 = 0;
LABEL_83:
      uint64_t v485 = objc_msgSend_completedUnitCount(v649, v314, v315, v316, v317, v318);
      objc_msgSend_setCompletedUnitCount_(v649, v486, v485 + 1, v487, v488, v489);

      ++v251;
    }
    while (v250 != v251);
    uint64_t v250 = objc_msgSend_countByEnumeratingWithState_objects_count_(v639, v245, (uint64_t)&v668, (uint64_t)v677, 16, v249);
    if (v250) {
      continue;
    }
    break;
  }
LABEL_88:

  if (objc_msgSend_cancelled(v652, v495, v496, v497, v498, v499)) {
    goto LABEL_111;
  }
  long long v664 = 0u;
  long long v665 = 0u;
  long long v662 = 0u;
  long long v663 = 0u;
  v505 = objc_msgSend_unprocessedStrokeGroupingResult(v653, v500, v501, v502, v503, v504);
  int v511 = objc_msgSend_strokeGroups(v505, v506, v507, v508, v509, v510);

  uint64_t v519 = objc_msgSend_countByEnumeratingWithState_objects_count_(v511, v512, (uint64_t)&v662, (uint64_t)v676, 16, v513);
  if (!v519) {
    goto LABEL_110;
  }
  uint64_t v520 = *(void *)v663;
  while (2)
  {
    uint64_t v521 = 0;
    while (2)
    {
      if (*(void *)v663 != v520) {
        objc_enumerationMutation(v511);
      }
      uint64_t v522 = *(void **)(*((void *)&v662 + 1) + 8 * v521);
      uint64_t v523 = NSNumber;
      uint64_t v524 = objc_msgSend_uniqueIdentifier(v522, v514, v515, v516, v517, v518);
      uint64_t v529 = objc_msgSend_numberWithInteger_(v523, v525, v524, v526, v527, v528);
      uint64_t v534 = objc_msgSend_objectForKeyedSubscript_(v657, v530, (uint64_t)v529, v531, v532, v533);
      if (v534)
      {

        goto LABEL_101;
      }
      uint64_t v545 = objc_msgSend_strokeGroups(v656, v535, v536, v537, v538, v539);
      int v550 = objc_msgSend_containsObject_(v545, v546, (uint64_t)v522, v547, v548, v549);

      if (v550)
      {
        uint64_t v551 = objc_msgSend_uniqueIdentifier(v522, v540, v541, v542, v543, v544);
        uint64_t v556 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v653, v552, v551, v553, v554, v555);
        uint64_t v562 = v556;
        if (!v556
          || (objc_msgSend_mathResult(v556, v557, v558, v559, v560, v561),
              uint64_t v563 = objc_claimAutoreleasedReturnValue(),
              BOOL v564 = v563 == 0,
              v563,
              !v564))
        {
          uint64_t v565 = objc_msgSend_uniqueIdentifier(v522, v557, v558, v559, v560, v561);
          uint64_t v570 = objc_msgSend_rawRecognitionResultForStrokeGroupIdentifier_(v653, v566, v565, v567, v568, v569);

          uint64_t v562 = (void *)v570;
        }
        objc_msgSend_setObject_forKeyedSubscript_(v657, v557, (uint64_t)v562, (uint64_t)v529, v560, v561);
LABEL_107:
      }
      else
      {
LABEL_101:
        uint64_t v562 = objc_msgSend_strokeGroups(v656, v540, v541, v542, v543, v544);
        if (!objc_msgSend_containsObject_(v562, v571, (uint64_t)v522, v572, v573, v574)) {
          goto LABEL_107;
        }
        uint64_t v579 = objc_msgSend_objectForKeyedSubscript_(v657, v575, (uint64_t)v529, v576, v577, v578);
        uint64_t v585 = objc_msgSend_mathResult(v579, v580, v581, v582, v583, v584);
        BOOL v586 = v585 == 0;

        if (!v586)
        {
          v591 = objc_msgSend_objectForKeyedSubscript_(v657, v587, (uint64_t)v529, v588, v589, v590);
          uint64_t v562 = objc_msgSend_mathResult(v591, v592, v593, v594, v595, v596);

          uint64_t v602 = objc_msgSend_uniqueIdentifier(v522, v597, v598, v599, v600, v601);
          v607 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v653, v603, v602, v604, v605, v606);
          v613 = objc_msgSend_mathResult(v607, v608, v609, v610, v611, v612);

          if (v613
            && objc_msgSend_isEquivalentToTokenizedMathResult_(v613, v614, (uint64_t)v562, v615, v616, v617))
          {
            uint64_t v623 = objc_msgSend_selectedTranscriptionPathIndex(v613, v618, v619, v620, v621, v622);
            objc_msgSend_setSelectedTranscriptionPathIndex_(v562, v624, (uint64_t)v623, v625, v626, v627);
          }
          goto LABEL_107;
        }
      }

      if (v519 != ++v521) {
        continue;
      }
      break;
    }
    uint64_t v519 = objc_msgSend_countByEnumeratingWithState_objects_count_(v511, v514, (uint64_t)&v662, (uint64_t)v676, 16, v518);
    if (v519) {
      continue;
    }
    break;
  }
LABEL_110:

LABEL_111:
  if (a7) {
    *a7 = v636;
  }
  uint64_t v628 = objc_msgSend_copy(v657, v500, v501, v502, v503, v504);

  return v628;
}

- (id)textCorrectionResultsForGroupingResult:(id)a3 groupingManager:(id)a4
{
  return 0;
}

- (id)clutterFilter
{
  v6 = objc_msgSend_inputResult(self, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_clutterFilter(v6, v7, v8, v9, v10, v11);

  if (v12)
  {
    uint64_t v13 = (CHStrokeClutterFilter *)v12;
  }
  else
  {
    uint64_t v13 = objc_alloc_init(CHStrokeClutterFilter);
  }
  return v13;
}

- (id)newStrokeClassifier
{
  if (objc_msgSend_sessionMode(self, a2, v2, v3, v4, v5) == 2) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [CHStrokeClassifier alloc];
  uint64_t v14 = objc_msgSend_strokeProvider(self, v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_initWithStrokeProvider_forceClass_(v8, v15, (uint64_t)v14, v7, v16, v17);

  return v18;
}

- (id)newGroupingManager
{
  uint64_t v3 = [CHStrokeGroupingManager alloc];
  uint64_t v9 = objc_msgSend_strokeProvider(self, v4, v5, v6, v7, v8);
  if (self) {
    strokeGroupingModel = self->_strokeGroupingModel;
  }
  else {
    strokeGroupingModel = 0;
  }
  uint64_t v11 = strokeGroupingModel;
  uint64_t v17 = objc_msgSend_recognitionLocales(self, v12, v13, v14, v15, v16);
  BOOL v23 = objc_msgSend_sessionMode(self, v18, v19, v20, v21, v22) == 2;
  isMathMode = objc_msgSend_initWithStrokeProvider_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v3, v24, (uint64_t)v9, (uint64_t)v11, (uint64_t)v17, 0, 0, v23);

  return isMathMode;
}

- (id)newGroupingPostProcessingManagerWithGroupingManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1C4AE053C(self, v4);
  uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  uint64_t v12 = objc_alloc_init(CHGroupOversegmentationMergingStep);
  objc_msgSend_addObject_(v11, v13, (uint64_t)v12, v14, v15, v16);

  uint64_t v17 = objc_alloc_init(CHVerticalUndersegmentationSplittingStep);
  objc_msgSend_addObject_(v11, v18, (uint64_t)v17, v19, v20, v21);

  uint64_t v22 = objc_alloc_init(CHVerticalMathLinkingStep);
  objc_msgSend_addObject_(v11, v23, (uint64_t)v22, v24, v25, v26);

  uint64_t v27 = [CHHorizontalUndersegmentationSplittingStep alloc];
  uint64_t v32 = objc_msgSend_initWithAdditionalMathRecognitionBlock_(v27, v28, (uint64_t)v5, v29, v30, v31);
  objc_msgSend_addObject_(v11, v33, (uint64_t)v32, v34, v35, v36);

  uint64_t v37 = [CHTextToMathResultTransformationStep alloc];
  uint64_t v42 = objc_msgSend_initWithAdditionalMathRecognitionBlock_(v37, v38, (uint64_t)v5, v39, v40, v41);
  objc_msgSend_addObject_(v11, v43, (uint64_t)v42, v44, v45, v46);

  uint64_t v47 = [CHGroupingPostProcessingManager alloc];
  uint64_t v51 = objc_msgSend_initWithSequence_groupingManager_(v47, v48, (uint64_t)v11, (uint64_t)v4, v49, v50);
  uint64_t v57 = objc_msgSend_saveInputDrawings(self, v52, v53, v54, v55, v56);
  objc_msgSend_setSaveInputDrawings_(v51, v58, v57, v59, v60, v61);

  return v51;
}

+ (BOOL)isGroupAcceptableForInventory:(id)a3 textSynthesizer:(id)a4 strokeProvider:(id)a5 recognitionResult:(id)a6 strokeClassificationResult:(id)a7 allowSyntheticStrokes:(BOOL)a8
{
  BOOL v8 = a8;
  v186[1] = *MEMORY[0x1E4F143B8];
  id v165 = a3;
  id v13 = a4;
  id v167 = a5;
  id v14 = a6;
  id v163 = a7;
  uint64_t v160 = v13;
  v161 = v14;
  uint64_t v15 = objc_opt_class();
  uint64_t v21 = objc_msgSend_classification(v165, v16, v17, v18, v19, v20);
  if (objc_msgSend_isStrokeClassificationTextOrMath_(v15, v22, v21, v23, v24, v25))
  {
    uint64_t v158 = objc_msgSend_preferredLocale(v14, v26, v27, v28, v29, v30);
    uint64_t v41 = objc_msgSend_mathResult(v14, v31, v32, v33, v34, v35);
    if (v41)
    {
      uint64_t v42 = objc_msgSend_mathResult(v14, v36, v37, v38, v39, v40);
      objc_msgSend_topTranscription(v42, v43, v44, v45, v46, v47);
      uint64_t v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v42 = objc_msgSend_recognitionResultsByLocale(v14, v36, v37, v38, v39, v40);
      uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v42, v49, (uint64_t)v158, v50, v51, v52);
      objc_msgSend_topTranscription(v53, v54, v55, v56, v57, v58);
      uint64_t v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v185 = CHTextSynthesisOptionSupportedCharactersStrict;
    v186[0] = MEMORY[0x1E4F1CC38];
    uint64_t v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v59, (uint64_t)v186, (uint64_t)&v185, 1, v60);
    objc_msgSend_supportedCharacterIndexesForString_options_(v13, v62, (uint64_t)v162, (uint64_t)v61, v63, v64);
    uint64_t v159 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v70 = objc_msgSend_count(v159, v65, v66, v67, v68, v69);
    if (v70 == objc_msgSend_length(v162, v71, v72, v73, v74, v75))
    {
      int isSupportedLatinScriptLocale_withMode = objc_msgSend_isSupportedLatinScriptLocale_withMode_(CHRecognizerConfiguration, v76, (uint64_t)v158, 6, v77, v78);
      uint64_t v85 = objc_msgSend_strokeIdentifiers(v165, v80, v81, v82, v83, v84);
      uint64_t v91 = objc_msgSend_allObjects(v85, v86, v87, v88, v89, v90);
      int isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold = objc_msgSend_isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold_(v163, v92, (uint64_t)v91, (uint64_t)&unk_1F203EF10, v93, v94, 0.5);

      if ((isSupportedLatinScriptLocale_withMode & isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold & 1) != 0
        || (objc_msgSend_mathResult(v14, v96, v97, v98, v99, v100),
            uint64_t v101 = objc_claimAutoreleasedReturnValue(),
            BOOL v102 = v101 == 0,
            v101,
            !v102))
      {
        long long v170 = 0u;
        long long v171 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        uint64_t v103 = objc_msgSend_strokeIdentifiers(v165, v96, v97, v98, v99, v100);
        uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v168, (uint64_t)v184, 16, v105);
        if (!v110)
        {
          BOOL v48 = 1;
LABEL_47:

          goto LABEL_48;
        }
        id obj = v103;
        uint64_t v166 = *(void *)v169;
        int v111 = !v8;
LABEL_11:
        uint64_t v112 = 0;
        while (1)
        {
          if (*(void *)v169 != v166) {
            objc_enumerationMutation(obj);
          }
          uint64_t v113 = objc_msgSend_strokeIdentifierFromData_(v167, v106, *(void *)(*((void *)&v168 + 1) + 8 * v112), v107, v108, v109);
          uint64_t v118 = objc_msgSend_strokeForIdentifier_(v167, v114, (uint64_t)v113, v115, v116, v117);
          unsigned int v124 = objc_msgSend_strokeAttributes(v118, v119, v120, v121, v122, v123);
          unint64_t v130 = objc_msgSend_strokeAttributes(v118, v125, v126, v127, v128, v129);
          unint64_t v136 = objc_msgSend_strokeAttributes(v118, v131, v132, v133, v134, v135);
          unint64_t v142 = objc_msgSend_strokeAttributes(v118, v137, v138, v139, v140, v141);
          unint64_t v148 = objc_msgSend_strokeAttributes(v118, v143, v144, v145, v146, v147);

          if (v111 & (v124 >> 2) & 1 | (v130 >> 3) & 1 | (v136 >> 4) & 1 | (v142 >> 5) & 1 | (v148 >> 6) & 1) {
            break;
          }
          if (v110 == ++v112)
          {
            uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v106, (uint64_t)&v168, (uint64_t)v184, 16, v109);
            BOOL v48 = 1;
            if (v110) {
              goto LABEL_11;
            }
            uint64_t v103 = obj;
            goto LABEL_47;
          }
        }

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v103 = (id)qword_1EA3C9FD8;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
        {
          v152 = @"YES";
          if ((v124 & 4) != 0) {
            uint64_t v153 = @"YES";
          }
          else {
            uint64_t v153 = @"NO";
          }
          *(_DWORD *)long long buf = 138413571;
          uint64_t v173 = v153;
          if ((v130 & 8) != 0) {
            uint64_t v154 = @"YES";
          }
          else {
            uint64_t v154 = @"NO";
          }
          __int16 v174 = 2112;
          uint64_t v175 = v154;
          if ((v136 & 0x10) != 0) {
            uint64_t v155 = @"YES";
          }
          else {
            uint64_t v155 = @"NO";
          }
          __int16 v176 = 2112;
          uint64_t v177 = v155;
          if ((v142 & 0x20) != 0) {
            uint64_t v156 = @"YES";
          }
          else {
            uint64_t v156 = @"NO";
          }
          __int16 v178 = 2112;
          if ((v148 & 0x40) == 0) {
            v152 = @"NO";
          }
          uint64_t v179 = v156;
          __int16 v180 = 2112;
          uint64_t v181 = v152;
          __int16 v182 = 2117;
          uint64_t v183 = v162;
          uint64_t v149 = "Inventory data ingestion: rejecting text group as in contains undesired stroke attributes (synthetic %@"
                 ", finger drawn %@, pasted %@, shared ink %@, unsafe %@). Transcription string: %{sensitive}@";
          uint64_t v150 = v103;
          uint32_t v151 = 62;
          goto LABEL_45;
        }
LABEL_46:
        BOOL v48 = 0;
        goto LABEL_47;
      }
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v103 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_46;
      }
      *(_DWORD *)long long buf = 138739971;
      uint64_t v173 = v162;
      uint64_t v149 = "Inventory data ingestion: rejecting text group due to not being Latin script and not having math result. Tr"
             "anscription string: %{sensitive}@";
      uint64_t v150 = v103;
      uint32_t v151 = 12;
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v103 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_46;
      }
      *(_DWORD *)long long buf = 138412547;
      uint64_t v173 = v159;
      __int16 v174 = 2117;
      uint64_t v175 = v162;
      uint64_t v149 = "Inventory data ingestion: rejecting text group as transcription string is not fully supported (supported in"
             "dexes: %@). Transcription string: %{sensitive}@";
      uint64_t v150 = v103;
      uint32_t v151 = 22;
    }
LABEL_45:
    _os_log_impl(&dword_1C492D000, v150, OS_LOG_TYPE_DEBUG, v149, buf, v151);
    goto LABEL_46;
  }
  BOOL v48 = 0;
LABEL_48:

  return v48;
}

- (BOOL)shouldCancelTaskGivenNewTask:(id)a3
{
  id v9 = a3;
  if (v9
    && (objc_msgSend_strokeProvider(self, v4, v5, v6, v7, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_strokeProvider(v9, v11, v12, v13, v14, v15),
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v10,
        v10 == v16)
    && (!objc_msgSend_status(self, v17, v18, v19, v20, v21) || objc_msgSend_status(self, v23, v24, v25, v26, v27) == 1))
  {
    uint64_t v28 = objc_msgSend_principalLineRequirement(self, v23, v24, v25, v26, v27);
    LOBYTE(v28) = v28 == objc_msgSend_principalLineRequirement(v9, v29, v30, v31, v32, v33);

    return v28;
  }
  else
  {

    return 0;
  }
}

- (CHRecognitionSessionResult)inputResult
{
  return self->_inputResult;
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (CHRecognitionSessionTaskDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CHRecognitionSessionTaskDelegate *)a3;
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (NSArray)recognitionLocales
{
  return self->_recognitionLocales;
}

- (NSArray)preferredLocales
{
  return self->_preferredLocales;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (CHCalculateDocumentProvider)calculateDocumentProvider
{
  return self->_calculateDocumentProvider;
}

- (CHRecognitionSessionResult)outputResult
{
  return self->_outputResult;
}

- (int64_t)recognitionEnvironment
{
  return self->_recognitionEnvironment;
}

- (int64_t)strokeGroupingRequirement
{
  return self->_strokeGroupingRequirement;
}

- (int64_t)principalLineRequirement
{
  return self->_principalLineRequirement;
}

- (BOOL)isHighResponsivenessTask
{
  return self->_isHighResponsivenessTask;
}

- (NSDictionary)recognitionOptions
{
  return self->_recognitionOptions;
}

- (BOOL)disableMathTextSwapping
{
  return self->_disableMathTextSwapping;
}

- (void)setDisableMathTextSwapping:(BOOL)a3
{
  self->_disableMathTextSwapping = a3;
}

- (BOOL)leverageAllProvidedVariables
{
  return self->_leverageAllProvidedVariables;
}

- (void)setLeverageAllProvidedVariables:(BOOL)a3
{
  self->_leverageAllProvidedVariables = a3;
}

- (BOOL)saveInputDrawings
{
  return self->_saveInputDrawings;
}

- (void)setSaveInputDrawings:(BOOL)a3
{
  self->_saveInputDrawings = a3;
}

- (NSSet)forceRecognitionStrokeGroupIdentifiers
{
  return self->_forceRecognitionStrokeGroupIdentifiers;
}

- (void)setForceRecognitionStrokeGroupIdentifiers:(id)a3
{
}

- (BOOL)strokeGroupingOnly
{
  return self->_strokeGroupingOnly;
}

- (void)setStrokeGroupingOnly:(BOOL)a3
{
  self->_strokeGroupingOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitsTrie, 0);
  objc_storeStrong(&self->_partialResultBlock, 0);
  objc_storeStrong((id *)&self->_subjectStrokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_subjectStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeGroupingModel, 0);
  objc_storeStrong((id *)&self->_strokeClassificationModel, 0);
  objc_storeStrong((id *)&self->__recognizersQueue, 0);
  objc_storeStrong((id *)&self->_forceRecognitionStrokeGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_recognitionOptions, 0);
  objc_storeStrong((id *)&self->_outputResult, 0);
  objc_storeStrong((id *)&self->_calculateDocumentProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_preferredLocales, 0);
  objc_storeStrong((id *)&self->_recognitionLocales, 0);
  objc_storeStrong((id *)&self->_inputResult, 0);
  objc_storeStrong((id *)&self->_cachedRecognitionResultsFromPostProcessing, 0);
  sub_1C4947180((uint64_t)&self->_tokenPropertiesHelper);
  objc_storeStrong((id *)&self->_intermediateDeclaredVariables, 0);
}

- (id).cxx_construct
{
  return self;
}

@end