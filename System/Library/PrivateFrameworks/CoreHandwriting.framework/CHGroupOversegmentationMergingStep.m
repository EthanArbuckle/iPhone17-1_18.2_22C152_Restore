@interface CHGroupOversegmentationMergingStep
- (CHGroupOversegmentationMergingStep)init;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHGroupOversegmentationMergingStep

- (CHGroupOversegmentationMergingStep)init
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)CHGroupOversegmentationMergingStep;
  v2 = [(CHGroupOversegmentationMergingStep *)&v29 init];
  if (v2)
  {
    v3 = objc_alloc_init(CHUpdateTokenPropertyForUnitConversionStep);
    v4 = objc_alloc_init(CHInsertPrecedingSpaceForUnitsStep);
    v5 = [CHMathPostProcessingManager alloc];
    v31[0] = v3;
    v31[1] = v4;
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v31, 2, v7, v8);
    uint64_t v14 = objc_msgSend_initWithSequence_(v5, v10, (uint64_t)v9, v11, v12, v13);
    unitConversionPostProcessor = v2->_unitConversionPostProcessor;
    v2->_unitConversionPostProcessor = (CHMathPostProcessingManager *)v14;

    v16 = objc_alloc_init(CHUpdateTokenPropertyForVariableAssignmentStep);
    v17 = [CHMathPostProcessingManager alloc];
    v30 = v16;
    v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)&v30, 1, v19, v20);
    uint64_t v26 = objc_msgSend_initWithSequence_(v17, v22, (uint64_t)v21, v23, v24, v25);
    variableAssignmentPostProcessor = v2->_variableAssignmentPostProcessor;
    v2->_variableAssignmentPostProcessor = (CHMathPostProcessingManager *)v26;
  }
  return v2;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v575 = *MEMORY[0x1E4F143B8];
  v5 = (void **)a3;
  id v547 = a4;
  uint64_t v11 = [CHStrokeGroupingResult alloc];
  if (v5) {
    uint64_t v12 = objc_msgSend_copy(v5[9], v6, v7, v8, v9, v10);
  }
  else {
    uint64_t v12 = objc_msgSend_copy(0, v6, v7, v8, v9, v10);
  }
  v15 = (void *)v12;
  v16 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v11, v13, v12, 0, 0, v14);

  v545 = v16;
  v546 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v16, v17, 3, 0, v18, v19);
  if (objc_msgSend_count(v546, v20, v21, v22, v23, v24))
  {
    v544 = objc_msgSend_mergeableStrokeGroupClustersFromSortedStrokeGroups_(CHStrokeGroupingManager, v25, (uint64_t)v546, v26, v27, v28);
    v548 = sub_1C4B64964(self, v547);
    long long v565 = 0u;
    long long v566 = 0u;
    long long v563 = 0u;
    long long v564 = 0u;
    obuint64_t j = v544;
    uint64_t v553 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v563, (uint64_t)v572, 16, v30);
    if (!v553) {
      goto LABEL_120;
    }
    uint64_t v552 = *(void *)v564;
    while (1)
    {
      uint64_t v557 = 0;
      do
      {
        if (*(void *)v564 != v552) {
          objc_enumerationMutation(obj);
        }
        if (v5) {
          v31 = v5[10];
        }
        else {
          v31 = 0;
        }
        v32 = *(void **)(*((void *)&v563 + 1) + 8 * v557);
        id v33 = v31;
        v556 = v32;
        v558 = objc_msgSend_textTranscriptionsForSortedGroupCluster_recognizedResultsByGroupID_(CHStrokeGroupRecognitionResult, v34, (uint64_t)v32, (uint64_t)v33, v35, v36);

        uint64_t v42 = objc_msgSend_count(v558, v37, v38, v39, v40, v41);
        if (v42 == objc_msgSend_count(v32, v43, v44, v45, v46, v47))
        {
          objc_msgSend_componentsJoinedByString_(v558, v48, @" ", v49, v50, v51);
          v555 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (isStringJapaneseZipcode(v555)) {
            goto LABEL_63;
          }
          if (objc_msgSend_isMathUnitConversionPatternForTextTranscription_locales_(CHTokenizedMathResult, v52, (uint64_t)v555, (uint64_t)v548, v53, v54))
          {
            id v55 = v32;
            v56 = v5;
            v57 = v56;
            if (self)
            {
              long long v569 = 0u;
              long long v570 = 0u;
              long long v567 = 0u;
              long long v568 = 0u;
              id v58 = v55;
              uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v567, (uint64_t)buf, 16, v60);
              if (v66)
              {
                uint64_t v67 = *(void *)v568;
                if (v5)
                {
LABEL_17:
                  uint64_t v68 = 0;
                  while (1)
                  {
                    if (*(void *)v568 != v67) {
                      objc_enumerationMutation(v58);
                    }
                    v69 = *(void **)(*((void *)&v567 + 1) + 8 * v68);
                    id v70 = v5[10];
                    v71 = NSNumber;
                    uint64_t v77 = objc_msgSend_uniqueIdentifier(v69, v72, v73, v74, v75, v76);
                    uint64_t v82 = objc_msgSend_numberWithInteger_(v71, v78, v77, v79, v80, v81);
                    v87 = objc_msgSend_objectForKeyedSubscript_(v70, v83, v82, v84, v85, v86);

                    v93 = objc_msgSend_mathResult(v87, v88, v89, v90, v91, v92);
                    LOBYTE(v82) = v93 == 0;

                    if (v82) {
                      break;
                    }
                    if (v66 == ++v68)
                    {
                      uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v94, (uint64_t)&v567, (uint64_t)buf, 16, v95);
                      if (v66) {
                        goto LABEL_17;
                      }
                      goto LABEL_23;
                    }
                  }
                }
                else
                {
LABEL_55:
                  uint64_t v223 = 0;
                  while (1)
                  {
                    if (*(void *)v568 != v67) {
                      objc_enumerationMutation(v58);
                    }
                    v224 = NSNumber;
                    uint64_t v225 = objc_msgSend_uniqueIdentifier(*(void **)(*((void *)&v567 + 1) + 8 * v223), v61, v62, v63, v64, v65);
                    uint64_t v230 = objc_msgSend_numberWithInteger_(v224, v226, v225, v227, v228, v229);
                    v235 = objc_msgSend_objectForKeyedSubscript_(0, v231, v230, v232, v233, v234);

                    v241 = objc_msgSend_mathResult(v235, v236, v237, v238, v239, v240);
                    LOBYTE(v230) = v241 == 0;

                    if (v230) {
                      break;
                    }
                    if (v66 == ++v223)
                    {
                      uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v567, (uint64_t)buf, 16, v65);
                      if (v66) {
                        goto LABEL_55;
                      }
                      goto LABEL_23;
                    }
                  }
                }
LABEL_62:

LABEL_63:
                id v242 = v556;
                v551 = v5;
                if (self)
                {
                  v248 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v243, v244, v245, v246, v247);
                  if (!objc_msgSend_count(v242, v249, v250, v251, v252, v253)) {
                    goto LABEL_72;
                  }
                  v258 = objc_msgSend_objectAtIndexedSubscript_(v242, v254, 0, v255, v256, v257);
                  v264 = objc_msgSend_strokeIdentifiers(v258, v259, v260, v261, v262, v263);
                  objc_msgSend_unionSet_(v248, v265, (uint64_t)v264, v266, v267, v268);

                  v269 = v5 ? v5[10] : 0;
                  id v270 = v269;
                  v271 = NSNumber;
                  uint64_t v277 = objc_msgSend_uniqueIdentifier(v258, v272, v273, v274, v275, v276);
                  v282 = objc_msgSend_numberWithInteger_(v271, v278, v277, v279, v280, v281);
                  v287 = objc_msgSend_objectForKeyedSubscript_(v270, v283, (uint64_t)v282, v284, v285, v286);

                  if (v287)
                  {
                    if (v5)
                    {
                      unint64_t v293 = 1;
                      while (v293 < objc_msgSend_count(v242, v288, v289, v290, v291, v292))
                      {
                        v298 = objc_msgSend_objectAtIndexedSubscript_(v242, v294, v293, v295, v296, v297);
                        v304 = objc_msgSend_strokeIdentifiers(v298, v299, v300, v301, v302, v303);
                        objc_msgSend_unionSet_(v248, v305, (uint64_t)v304, v306, v307, v308);

                        id v309 = v5[10];
                        v310 = NSNumber;
                        uint64_t v316 = objc_msgSend_uniqueIdentifier(v298, v311, v312, v313, v314, v315);
                        v321 = objc_msgSend_numberWithInteger_(v310, v317, v316, v318, v319, v320);
                        v326 = objc_msgSend_objectForKeyedSubscript_(v309, v322, (uint64_t)v321, v323, v324, v325);

                        uint64_t v331 = objc_msgSend_textStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult_(v287, v327, (uint64_t)v326, v328, v329, v330);

                        ++v293;
                        v287 = (void *)v331;
                        if (!v331) {
                          goto LABEL_72;
                        }
                      }
                    }
                    else
                    {
                      unint64_t v332 = 1;
                      while (v332 < objc_msgSend_count(v242, v288, v289, v290, v291, v292))
                      {
                        v337 = objc_msgSend_objectAtIndexedSubscript_(v242, v333, v332, v334, v335, v336);
                        v343 = objc_msgSend_strokeIdentifiers(v337, v338, v339, v340, v341, v342);
                        objc_msgSend_unionSet_(v248, v344, (uint64_t)v343, v345, v346, v347);

                        v348 = NSNumber;
                        uint64_t v354 = objc_msgSend_uniqueIdentifier(v337, v349, v350, v351, v352, v353);
                        v359 = objc_msgSend_numberWithInteger_(v348, v355, v354, v356, v357, v358);
                        v364 = objc_msgSend_objectForKeyedSubscript_(0, v360, (uint64_t)v359, v361, v362, v363);

                        uint64_t v369 = objc_msgSend_textStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult_(v287, v365, (uint64_t)v364, v366, v367, v368);

                        ++v332;
                        v287 = (void *)v369;
                        if (!v369) {
                          goto LABEL_72;
                        }
                      }
                    }
                    v370 = [CHBottomUpStrokeGroupingStrategy alloc];
                    v376 = objc_msgSend_groupingManager(self, v371, v372, v373, v374, v375);
                    v382 = objc_msgSend_strokeProvider(v376, v377, v378, v379, v380, v381);
                    v388 = objc_msgSend_groupingManager(self, v383, v384, v385, v386, v387);
                    v394 = objc_msgSend_locales(v388, v389, v390, v391, v392, v393);
                    isInlineContinuousMode_inlineContinuousModeTargets = objc_msgSend_initWithStrokeProvider_defaultWritingOrientation_locales_isInlineContinuousMode_inlineContinuousModeTargets_(v370, v395, (uint64_t)v382, 1, (uint64_t)v394, 0, 0);

                    v402 = objc_msgSend_groupingManager(self, v397, v398, v399, v400, v401);
                    v408 = objc_msgSend_strokeProvider(v402, v403, v404, v405, v406, v407);
                    v412 = objc_msgSend_sortedStrokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v409, (uint64_t)v248, (uint64_t)v408, v410, v411);

                    v418 = objc_msgSend_firstObject(v242, v413, v414, v415, v416, v417);
                    uint64_t v424 = objc_msgSend_ancestorIdentifier(v418, v419, v420, v421, v422, v423);
                    v428 = objc_msgSend_strokeGroupFromStrokes_ancestorIdentifier_(isInlineContinuousMode_inlineContinuousModeTargets, v425, (uint64_t)v412, v424, v426, v427);

                    if (v5) {
                      objc_msgSend_addObject_(v5[9], v429, (uint64_t)v428, v430, v431, v432);
                    }
                    else {
                      objc_msgSend_addObject_(0, v429, (uint64_t)v428, v430, v431, v432);
                    }
                    if (v5) {
                      v433 = v5[10];
                    }
                    else {
                      v433 = 0;
                    }
                    id v434 = v433;
                    v435 = NSNumber;
                    uint64_t v441 = objc_msgSend_uniqueIdentifier(v428, v436, v437, v438, v439, v440);
                    v446 = objc_msgSend_numberWithInteger_(v435, v442, v441, v443, v444, v445);
                    objc_msgSend_setObject_forKey_(v434, v447, (uint64_t)v287, (uint64_t)v446, v448, v449);

LABEL_93:
                    if (qword_1EA3CA000 != -1) {
                      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                    }
                    v478 = (id)qword_1EA3C9FA8;
                    if (os_log_type_enabled(v478, OS_LOG_TYPE_DEBUG))
                    {
                      int v484 = objc_msgSend_count(v556, v479, v480, v481, v482, v483);
                      *(_DWORD *)buf = 67109120;
                      int v574 = v484;
                      _os_log_impl(&dword_1C492D000, v478, OS_LOG_TYPE_DEBUG, "CHGroupOversegmentationMergingStep merged %d groups into one group", buf, 8u);
                    }

                    long long v561 = 0u;
                    long long v562 = 0u;
                    long long v559 = 0u;
                    long long v560 = 0u;
                    id v485 = v556;
                    uint64_t v492 = objc_msgSend_countByEnumeratingWithState_objects_count_(v485, v486, (uint64_t)&v559, (uint64_t)v571, 16, v487);
                    if (v492)
                    {
                      uint64_t v493 = *(void *)v560;
                      if (v5)
                      {
                        do
                        {
                          for (uint64_t i = 0; i != v492; ++i)
                          {
                            if (*(void *)v560 != v493) {
                              objc_enumerationMutation(v485);
                            }
                            v495 = *(void **)(*((void *)&v559 + 1) + 8 * i);
                            id v496 = v5[9];
                            objc_msgSend_removeObject_(v496, v497, (uint64_t)v495, v498, v499, v500);

                            id v501 = v5[10];
                            v502 = NSNumber;
                            uint64_t v508 = objc_msgSend_uniqueIdentifier(v495, v503, v504, v505, v506, v507);
                            v513 = objc_msgSend_numberWithInteger_(v502, v509, v508, v510, v511, v512);
                            objc_msgSend_removeObjectForKey_(v501, v514, (uint64_t)v513, v515, v516, v517);
                          }
                          uint64_t v492 = objc_msgSend_countByEnumeratingWithState_objects_count_(v485, v518, (uint64_t)&v559, (uint64_t)v571, 16, v519);
                        }
                        while (v492);
                      }
                      else
                      {
                        do
                        {
                          for (uint64_t j = 0; j != v492; ++j)
                          {
                            if (*(void *)v560 != v493) {
                              objc_enumerationMutation(v485);
                            }
                            v523 = *(void **)(*((void *)&v559 + 1) + 8 * j);
                            objc_msgSend_removeObject_(0, v488, (uint64_t)v523, v489, v490, v491);
                            v524 = NSNumber;
                            uint64_t v530 = objc_msgSend_uniqueIdentifier(v523, v525, v526, v527, v528, v529);
                            v535 = objc_msgSend_numberWithInteger_(v524, v531, v530, v532, v533, v534);
                            objc_msgSend_removeObjectForKey_(0, v536, (uint64_t)v535, v537, v538, v539);
                          }
                          uint64_t v492 = objc_msgSend_countByEnumeratingWithState_objects_count_(v485, v488, (uint64_t)&v559, (uint64_t)v571, 16, v491);
                        }
                        while (v492);
                      }
                    }
                  }
                  else
                  {
LABEL_72:
                  }
LABEL_105:

                  goto LABEL_106;
                }
LABEL_115:

                goto LABEL_105;
              }
LABEL_23:

              v101 = objc_msgSend_mutableCopy(v547, v96, v97, v98, v99, v100);
              objc_msgSend_setObject_forKeyedSubscript_(v101, v102, MEMORY[0x1E4F1CC38], (uint64_t)CHMathPostProcessingWrapTextResult, v103, v104);
              char v105 = sub_1C4B64A40((void **)&self->super.super.isa, v58, v57, v101);

LABEL_92:
              if (v105) {
                goto LABEL_93;
              }
              goto LABEL_105;
            }
          }
          else
          {
            v106 = sub_1C4B6550C(self, v555);
            BOOL v107 = v106 == 0;

            if (v107)
            {
              id v145 = v32;
              v146 = v5;
              v147 = v146;
              if (self)
              {
                long long v569 = 0u;
                long long v570 = 0u;
                long long v567 = 0u;
                long long v568 = 0u;
                id v148 = v145;
                v550 = v147;
                uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v149, (uint64_t)&v567, (uint64_t)buf, 16, v150);
                if (v156)
                {
                  uint64_t v157 = *(void *)v568;
                  int v158 = 0;
                  int v159 = 0;
                  if (v5)
                  {
                    do
                    {
                      for (uint64_t k = 0; k != v156; ++k)
                      {
                        if (*(void *)v568 != v157) {
                          objc_enumerationMutation(v148);
                        }
                        v161 = *(void **)(*((void *)&v567 + 1) + 8 * k);
                        id v162 = v5[10];
                        v163 = NSNumber;
                        uint64_t v169 = objc_msgSend_uniqueIdentifier(v161, v164, v165, v166, v167, v168);
                        v174 = objc_msgSend_numberWithInteger_(v163, v170, v169, v171, v172, v173);
                        v179 = objc_msgSend_objectForKeyedSubscript_(v162, v175, (uint64_t)v174, v176, v177, v178);

                        v185 = objc_msgSend_mathResult(v179, v180, v181, v182, v183, v184);

                        v191 = objc_msgSend_preferredLocale(v179, v186, v187, v188, v189, v190);
                        LODWORD(v162) = v191 != 0;

                        v158 |= v185 != 0;
                        v159 |= v162;
                      }
                      uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v192, (uint64_t)&v567, (uint64_t)buf, 16, v193);
                    }
                    while (v156);
                  }
                  else
                  {
                    do
                    {
                      for (uint64_t m = 0; m != v156; ++m)
                      {
                        if (*(void *)v568 != v157) {
                          objc_enumerationMutation(v148);
                        }
                        v198 = NSNumber;
                        uint64_t v199 = objc_msgSend_uniqueIdentifier(*(void **)(*((void *)&v567 + 1) + 8 * m), v151, v152, v153, v154, v155);
                        v204 = objc_msgSend_numberWithInteger_(v198, v200, v199, v201, v202, v203);
                        v209 = objc_msgSend_objectForKeyedSubscript_(0, v205, (uint64_t)v204, v206, v207, v208);

                        v215 = objc_msgSend_mathResult(v209, v210, v211, v212, v213, v214);

                        v221 = objc_msgSend_preferredLocale(v209, v216, v217, v218, v219, v220);
                        BOOL v222 = v221 != 0;

                        v158 |= v215 != 0;
                        v159 |= v222;
                      }
                      uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v151, (uint64_t)&v567, (uint64_t)buf, 16, v155);
                    }
                    while (v156);
                  }
                }
                else
                {
                  int v158 = 0;
                  int v159 = 0;
                }

                if ((v159 & v158 & 1) != 0
                  && (objc_msgSend_isPatternedTextForTextTranscription_locales_(CHTokenizedMathResult, v194, (uint64_t)v555, (uint64_t)v548, v195, v196) & 1) != 0)
                {
                  goto LABEL_63;
                }
              }
              else
              {
              }
              goto LABEL_105;
            }
            id v55 = v32;
            v56 = v5;
            v57 = v56;
            if (self)
            {
              long long v569 = 0u;
              long long v570 = 0u;
              long long v567 = 0u;
              long long v568 = 0u;
              id v58 = v55;
              uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v108, (uint64_t)&v567, (uint64_t)buf, 16, v109);
              if (!v115) {
                goto LABEL_62;
              }
              uint64_t v116 = *(void *)v568;
              if (v5)
              {
LABEL_28:
                uint64_t v117 = 0;
                while (1)
                {
                  if (*(void *)v568 != v116) {
                    objc_enumerationMutation(v58);
                  }
                  v118 = *(void **)(*((void *)&v567 + 1) + 8 * v117);
                  id v119 = v5[10];
                  v120 = NSNumber;
                  uint64_t v126 = objc_msgSend_uniqueIdentifier(v118, v121, v122, v123, v124, v125);
                  uint64_t v131 = objc_msgSend_numberWithInteger_(v120, v127, v126, v128, v129, v130);
                  v136 = objc_msgSend_objectForKeyedSubscript_(v119, v132, v131, v133, v134, v135);

                  v142 = objc_msgSend_mathResult(v136, v137, v138, v139, v140, v141);
                  LOBYTE(v131) = v142 == 0;

                  if ((v131 & 1) == 0) {
                    break;
                  }
                  if (v115 == ++v117)
                  {
                    uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v143, (uint64_t)&v567, (uint64_t)buf, 16, v144);
                    if (v115) {
                      goto LABEL_28;
                    }
                    goto LABEL_62;
                  }
                }
              }
              else
              {
LABEL_84:
                uint64_t v450 = 0;
                while (1)
                {
                  if (*(void *)v568 != v116) {
                    objc_enumerationMutation(v58);
                  }
                  v451 = NSNumber;
                  uint64_t v452 = objc_msgSend_uniqueIdentifier(*(void **)(*((void *)&v567 + 1) + 8 * v450), v110, v111, v112, v113, v114);
                  v457 = objc_msgSend_numberWithInteger_(v451, v453, v452, v454, v455, v456);
                  v462 = objc_msgSend_objectForKeyedSubscript_(0, v458, (uint64_t)v457, v459, v460, v461);

                  v468 = objc_msgSend_mathResult(v462, v463, v464, v465, v466, v467);
                  LODWORD(v457) = v468 == 0;

                  if (!v457) {
                    break;
                  }
                  if (v115 == ++v450)
                  {
                    uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v110, (uint64_t)&v567, (uint64_t)buf, 16, v114);
                    if (v115) {
                      goto LABEL_84;
                    }
                    goto LABEL_62;
                  }
                }
              }

              v474 = objc_msgSend_mutableCopy(v547, v469, v470, v471, v472, v473);
              objc_msgSend_setObject_forKeyedSubscript_(v474, v475, MEMORY[0x1E4F1CC28], (uint64_t)CHMathPostProcessingWrapTextResult, v476, v477);
              char v105 = sub_1C4B64A40((void **)&self->super.super.isa, v58, v57, v474);

              goto LABEL_92;
            }
          }

          id v540 = v32;
          v541 = v5;
          goto LABEL_115;
        }
LABEL_106:

        ++v557;
      }
      while (v557 != v553);
      uint64_t v542 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v520, (uint64_t)&v563, (uint64_t)v572, 16, v521);
      uint64_t v553 = v542;
      if (!v542)
      {
LABEL_120:

        break;
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableAssignmentPostProcessor, 0);
  objc_storeStrong((id *)&self->_unitConversionPostProcessor, 0);
}

@end