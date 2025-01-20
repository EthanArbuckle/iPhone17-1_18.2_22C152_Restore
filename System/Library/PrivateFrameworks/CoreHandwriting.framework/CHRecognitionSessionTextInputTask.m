@interface CHRecognitionSessionTextInputTask
- (CHRecognitionSessionTextInputTask)initWithLocales:(id)a3 strokeProvider:(id)a4 initialTextInputTargets:(id)a5 inputResult:(id)a6 recognitionEnvironment:(int64_t)a7 calculateDocumentProvider:(id)a8;
- (CHRecognitionSessionTextInputTask)initWithSessionMode:(int64_t)a3 locales:(id)a4 preferredLocales:(id)a5 strokeProvider:(id)a6 calculateDocumentProvider:(id)a7 inputResult:(id)a8 recognitionQOSClass:(unsigned int)a9 recognitionEnvironment:(int64_t)a10 isHighResponsivenessTask:(BOOL)a11 strokeClassificationModel:(id)a12 strokeGroupingModel:(id)a13 strokeGroupingRequirement:(int64_t)a14 principalLineRequirement:(int64_t)a15 subjectStrokeIdentifiers:(id)a16 subjectStrokeClassificationResult:(id)a17 recognitionOptions:(id)a18 partialResultBlock:(id)a19 wantsAutoRefine:(BOOL)a20;
- (CHTextInputQuery)activeTextInputQuery;
- (NSArray)initialTextInputTargets;
- (id)clutterFilter;
- (id)newGroupingManager;
- (id)newGroupingPostProcessingManagerWithGroupingManager:(id)a3;
- (id)newStrokeClassifier;
- (id)recognitionResultsForGroupingResult:(id)a3 groupingManager:(id)a4 strokeGroupsToProcess:(id)a5 strokeClassificationResult:(id)a6 strokeGroupReplacements:(id *)a7;
- (id)textCorrectionResultsForGroupingResult:(id)a3 groupingManager:(id)a4;
- (void)setActiveTextInputQuery:(id)a3;
@end

@implementation CHRecognitionSessionTextInputTask

- (CHRecognitionSessionTextInputTask)initWithLocales:(id)a3 strokeProvider:(id)a4 initialTextInputTargets:(id)a5 inputResult:(id)a6 recognitionEnvironment:(int64_t)a7 calculateDocumentProvider:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)CHRecognitionSessionTextInputTask;
  char v30 = 0;
  char v29 = 0;
  int v28 = 0;
  v24 = -[CHRecognitionSessionTask initWithSessionMode:locales:preferredLocales:strokeProvider:calculateDocumentProvider:inputResult:recognitionQOSClass:recognitionEnvironment:isHighResponsivenessTask:strokeClassificationModel:strokeGroupingModel:strokeGroupingRequirement:principalLineRequirement:subjectStrokeIdentifiers:subjectStrokeClassificationResult:recognitionOptions:partialResultBlock:wantsAutoRefine:](&v31, sel_initWithSessionMode_locales_preferredLocales_strokeProvider_calculateDocumentProvider_inputResult_recognitionQOSClass_recognitionEnvironment_isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine_, 1, v14, v14, v15, v18, v17, v28, a7, v29, 0, 0, 0, 0, 0, 0, 0, 0,
          v30);
  if (v24)
  {
    uint64_t v25 = objc_msgSend_copy(v16, v19, v20, v21, v22, v23);
    initialTextInputTargets = v24->_initialTextInputTargets;
    v24->_initialTextInputTargets = (NSArray *)v25;
  }
  return v24;
}

- (CHRecognitionSessionTextInputTask)initWithSessionMode:(int64_t)a3 locales:(id)a4 preferredLocales:(id)a5 strokeProvider:(id)a6 calculateDocumentProvider:(id)a7 inputResult:(id)a8 recognitionQOSClass:(unsigned int)a9 recognitionEnvironment:(int64_t)a10 isHighResponsivenessTask:(BOOL)a11 strokeClassificationModel:(id)a12 strokeGroupingModel:(id)a13 strokeGroupingRequirement:(int64_t)a14 principalLineRequirement:(int64_t)a15 subjectStrokeIdentifiers:(id)a16 subjectStrokeClassificationResult:(id)a17 recognitionOptions:(id)a18 partialResultBlock:(id)a19 wantsAutoRefine:(BOOL)a20
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v21 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_1C492D000, v21, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v23, 2u);
  }

  return 0;
}

- (id)recognitionResultsForGroupingResult:(id)a3 groupingManager:(id)a4 strokeGroupsToProcess:(id)a5 strokeClassificationResult:(id)a6 strokeGroupReplacements:(id *)a7
{
  return 0;
}

- (id)textCorrectionResultsForGroupingResult:(id)a3 groupingManager:(id)a4
{
  uint64_t v396 = *MEMORY[0x1E4F143B8];
  id v352 = a3;
  id v356 = a4;
  v360 = objc_msgSend_inputResult(self, v6, v7, v8, v9, v10);
  v357 = objc_msgSend_recognitionLocales(self, v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_activeTextInputQuery(self, v16, v17, v18, v19, v20);
  v27 = objc_msgSend_recognitionSession(v21, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_strokeGroupOrdering(v27, v28, v29, v30, v31, v32);
  v353 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v352, v34, v33, 0, v35, v36);

  v42 = objc_msgSend_activeTextInputQuery(self, v37, v38, v39, v40, v41);
  v48 = objc_msgSend_textInputTargetsDataSource(v42, v43, v44, v45, v46, v47);

  v371 = self;
  v351 = v48;
  if (v48)
  {
    id v361 = v48;
    id v54 = v353;
    v60 = v54;
    if (self)
    {
      uint64_t v61 = objc_msgSend_count(v54, v55, v56, v57, v58, v59);
      v66 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], v62, v61, v63, v64, v65);
      double v380 = 0.0;
      v381 = &v380;
      uint64_t v382 = 0x2020000000;
      char v383 = 0;
      dispatch_group_t v67 = dispatch_group_create();
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = sub_1C4A20100;
      v389 = &unk_1E64E2700;
      id v390 = v60;
      v391 = self;
      id v392 = v361;
      v68 = v67;
      v393 = v68;
      id v69 = v66;
      id v394 = v69;
      v395 = &v380;
      dispatch_sync(MEMORY[0x1E4F14428], block);
      dispatch_time_t v70 = dispatch_time(0, 2000000000);
      dispatch_group_wait(v68, v70);
      id v71 = v69;
      objc_sync_enter(v71);
      *((unsigned char *)v381 + 24) = 1;
      uint64_t v77 = objc_msgSend_copy(v71, v72, v73, v74, v75, v76);
      objc_sync_exit(v71);

      _Block_object_dispose(&v380, 8);
    }
    else
    {
      uint64_t v77 = 0;
    }

    v362 = (void *)v77;
  }
  else
  {
    v362 = 0;
  }
  v78 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v79 = objc_msgSend_count(v353, v49, v50, v51, v52, v53);
  v355 = objc_msgSend_dictionaryWithCapacity_(v78, v80, v79, v81, v82, v83);
  long long v378 = 0u;
  long long v379 = 0u;
  long long v376 = 0u;
  long long v377 = 0u;
  id obj = v353;
  uint64_t v359 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v376, (uint64_t)v387, 16, v85);
  if (v359)
  {
    uint64_t v358 = *(void *)v377;
LABEL_8:
    uint64_t v91 = 0;
    while (1)
    {
      if (*(void *)v377 != v358) {
        objc_enumerationMutation(obj);
      }
      v92 = *(void **)(*((void *)&v376 + 1) + 8 * v91);
      if (objc_msgSend_cancelled(self, v86, v87, v88, v89, v90)) {
        break;
      }
      context = (void *)MEMORY[0x1C8786C20]();
      v93 = NSNumber;
      uint64_t v99 = objc_msgSend_uniqueIdentifier(v92, v94, v95, v96, v97, v98);
      v367 = objc_msgSend_numberWithInteger_(v93, v100, v99, v101, v102, v103);
      v369 = objc_msgSend_objectForKeyedSubscript_(v362, v104, (uint64_t)v367, v105, v106, v107);
      if (v369)
      {
        long long v374 = 0u;
        long long v375 = 0u;
        long long v372 = 0u;
        long long v373 = 0u;
        v113 = objc_msgSend_strokeGroupingResult(v360, v108, v109, v110, v111, v112);
        v119 = objc_msgSend_strokeGroups(v113, v114, v115, v116, v117, v118);

        uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v372, (uint64_t)v386, 16, v121);
        if (v127)
        {
          uint64_t v128 = *(void *)v373;
LABEL_15:
          uint64_t v129 = 0;
          while (1)
          {
            if (*(void *)v373 != v128) {
              objc_enumerationMutation(v119);
            }
            v130 = *(void **)(*((void *)&v372 + 1) + 8 * v129);
            uint64_t v131 = objc_msgSend_ancestorIdentifier(v130, v122, v123, v124, v125, v126);
            if (v131 == objc_msgSend_ancestorIdentifier(v92, v132, v133, v134, v135, v136)) {
              break;
            }
            if (v127 == ++v129)
            {
              uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v122, (uint64_t)&v372, (uint64_t)v386, 16, v126);
              if (v127) {
                goto LABEL_15;
              }
              goto LABEL_21;
            }
          }
          uint64_t v138 = objc_msgSend_uniqueIdentifier(v130, v122, v123, v124, v125, v126);
          v143 = objc_msgSend_textCorrectionResultForStrokeGroupIdentifier_(v360, v139, v138, v140, v141, v142);
          v137 = objc_msgSend_textCorrectionResult(v143, v144, v145, v146, v147, v148);

          if (!v137) {
            goto LABEL_25;
          }
          v154 = objc_msgSend_inputTarget(v137, v149, v150, v151, v152, v153);
          v160 = objc_msgSend_inputTargetIdentifier(v154, v155, v156, v157, v158, v159);
          v166 = objc_msgSend_textInputTarget(v369, v161, v162, v163, v164, v165);
          v172 = objc_msgSend_inputTargetIdentifier(v166, v167, v168, v169, v170, v171);
          char isEqualToNumber = objc_msgSend_isEqualToNumber_(v160, v173, (uint64_t)v172, v174, v175, v176);

          if (isEqualToNumber) {
            goto LABEL_25;
          }
        }
        else
        {
LABEL_21:
          v137 = v119;
        }

        v137 = 0;
LABEL_25:
        id v370 = v92;
        id v365 = v356;
        id v178 = v369;
        id v364 = v357;
        id v368 = v137;
        v363 = v178;
        if (v371)
        {
          id v179 = v178;
          self;
          uint64_t v184 = objc_msgSend_defaultTextAffectedRangeForTargetContentInfo_(CHTextCorrectionRecognizer, v180, (uint64_t)v179, v181, v182, v183);
          objc_msgSend_characterRectForCharacterIndex_(v179, v185, (uint64_t)&v185[v184 - 1], v186, v187, v188);
          double x = v398.origin.x;
          double y = v398.origin.y;
          double width = v398.size.width;
          double height = v398.size.height;
          if (CGRectIsNull(v398))
          {
            v198 = objc_msgSend_textInputTarget(v179, v193, v194, v195, v196, v197);
            objc_msgSend_frame(v198, v199, v200, v201, v202, v203);
            double x = v204;
            double y = v205;
            double width = v206;
            double height = v207;
          }
          double v380 = 0.0;
          v208 = v370;
          objc_msgSend_bounds(v370, v209, v210, v211, v212, v213);
          double v215 = v214;
          objc_msgSend_bounds(v370, v216, v217, v218, v219, v220);
          id v384 = 0;
          id v385 = 0;
          v222 = objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v365, v221, (uint64_t)v370, (uint64_t)&v385, (uint64_t)&v384, (uint64_t)&v380, 0, v215);
          id v223 = v385;
          id v224 = v384;
          uint64_t v230 = objc_msgSend_strokeCount(v222, v225, v226, v227, v228, v229);
          if (v230 != objc_msgSend_count(v224, v231, v232, v233, v234, v235))
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v241 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v241, OS_LOG_TYPE_FAULT))
            {
              uint64_t v247 = objc_msgSend_strokeCount(v222, v242, v243, v244, v245, v246);
              uint64_t v253 = objc_msgSend_count(v224, v248, v249, v250, v251, v252);
              *(_DWORD *)block = 134218240;
              *(void *)&block[4] = v247;
              *(_WORD *)&block[12] = 2048;
              *(void *)&block[14] = v253;
              _os_log_impl(&dword_1C492D000, v241, OS_LOG_TYPE_FAULT, "The strokes count in the drawing (%ld) must match the ones in the result (%ld).", block, 0x16u);
            }

            v208 = v370;
          }
          uint64_t v254 = objc_msgSend_strokeCount(v223, v236, v237, v238, v239, v240);
          if (v254 != objc_msgSend_count(v224, v255, v256, v257, v258, v259))
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v265 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v265, OS_LOG_TYPE_FAULT))
            {
              uint64_t v271 = objc_msgSend_strokeCount(v223, v266, v267, v268, v269, v270);
              uint64_t v277 = objc_msgSend_count(v224, v272, v273, v274, v275, v276);
              *(_DWORD *)block = 134218240;
              *(void *)&block[4] = v271;
              *(_WORD *)&block[12] = 2048;
              *(void *)&block[14] = v277;
              _os_log_impl(&dword_1C492D000, v265, OS_LOG_TYPE_FAULT, "The strokes count in the original drawing (%ld) must match the ones in the result (%ld).", block, 0x16u);
            }

            v208 = v370;
          }
          v278 = objc_msgSend_strokeProvider(v371, v260, v261, v262, v263, v264);
          id v279 = v208;
          id v280 = v278;
          self;
          v290 = objc_msgSend_lastStrokeIdentifier(v279, v281, v282, v283, v284, v285);
          if (v290)
          {
            v295 = objc_msgSend_strokeIdentifierFromData_(v280, v286, (uint64_t)v290, v287, v288, v289);
            if (v295)
            {
              v296 = objc_msgSend_strokeForIdentifier_(v280, v291, (uint64_t)v295, v292, v293, v294);
            }
            else
            {
              v296 = 0;
            }
          }
          else
          {
            v296 = 0;
          }

          v302 = objc_msgSend_delegate(v371, v297, v298, v299, v300, v301);
          v307 = objc_msgSend_textCorrectionRecognizerForLocales_(v302, v303, (uint64_t)v364, v304, v305, v306);

          double v308 = v380;
          v314 = objc_msgSend_calculateDocumentProvider(v371, v309, v310, v311, v312, v313);
          v320 = objc_msgSend_declaredVariables(v314, v315, v316, v317, v318, v319);
          v322 = objc_msgSend_textCorrectionResultForDrawing_targetContentInfo_originalDrawing_lastStroke_localTypedContextBounds_normalizedDrawingScaleFactor_previousCorrectionResult_declaredVariables_(v307, v321, (uint64_t)v222, (uint64_t)v179, (uint64_t)v223, (uint64_t)v296, v368, v320, x, y, width, height, v308);

          v323 = [CHStrokeGroupTextCorrectionResult alloc];
          v327 = objc_msgSend_initWithTextCorrectionResult_inputStrokeIdentifiers_(v323, v324, (uint64_t)v322, (uint64_t)v224, v325, v326);
        }
        else
        {
          v327 = 0;
        }

        v328 = NSNumber;
        uint64_t v334 = objc_msgSend_uniqueIdentifier(v370, v329, v330, v331, v332, v333);
        v339 = objc_msgSend_numberWithInteger_(v328, v335, v334, v336, v337, v338);
        objc_msgSend_setObject_forKeyedSubscript_(v355, v340, (uint64_t)v327, (uint64_t)v339, v341, v342);
      }
      self = v371;
      if (++v91 == v359)
      {
        uint64_t v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v376, (uint64_t)v387, 16, v90);
        uint64_t v359 = v343;
        if (v343) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  v349 = objc_msgSend_copy(v355, v344, v345, v346, v347, v348);
  return v349;
}

- (id)clutterFilter
{
  return 0;
}

- (id)newStrokeClassifier
{
  v3 = [CHStrokeClassifier alloc];
  uint64_t v9 = objc_msgSend_strokeProvider(self, v4, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_initWithStrokeProvider_forceClass_(v3, v10, (uint64_t)v9, 1, v11, v12);

  return v13;
}

- (id)newGroupingManager
{
  v3 = [CHStrokeGroupingManager alloc];
  uint64_t v9 = objc_msgSend_strokeProvider(self, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_recognitionLocales(self, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_initialTextInputTargets(self, v16, v17, v18, v19, v20);
  isMathMode = objc_msgSend_initWithStrokeProvider_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v3, v22, (uint64_t)v9, 0, (uint64_t)v15, 1, v21, 0);

  return isMathMode;
}

- (id)newGroupingPostProcessingManagerWithGroupingManager:(id)a3
{
  return 0;
}

- (NSArray)initialTextInputTargets
{
  return self->_initialTextInputTargets;
}

- (CHTextInputQuery)activeTextInputQuery
{
  return self->_activeTextInputQuery;
}

- (void)setActiveTextInputQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTextInputQuery, 0);
  objc_storeStrong((id *)&self->_initialTextInputTargets, 0);
}

@end