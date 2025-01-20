@interface CHGroupingPostProcessingManager
- (BOOL)saveInputDrawings;
- (CHGroupingPostProcessingManager)init;
- (CHGroupingPostProcessingManager)initWithSequence:(id)a3 groupingManager:(id)a4;
- (CHGroupingPostProcessingManager)initWithStep:(id)a3 groupingManager:(id)a4;
- (CHStrokeGroupingManager)groupingManager;
- (NSArray)sequence;
- (id)process:(id)a3 options:(id)a4;
- (void)setGroupingManager:(id)a3;
- (void)setSaveInputDrawings:(BOOL)a3;
- (void)setSequence:(id)a3;
@end

@implementation CHGroupingPostProcessingManager

- (CHGroupingPostProcessingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHGroupingPostProcessingManager;
  v2 = [(CHGroupingPostProcessingManager *)&v6 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    sequence = v2->_sequence;
    v2->_sequence = v3;
  }
  return v2;
}

- (CHGroupingPostProcessingManager)initWithStep:(id)a3 groupingManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
  v13 = objc_msgSend_initWithObjects_(v8, v9, (uint64_t)v6, v10, v11, v12, 0);
  v17 = (CHGroupingPostProcessingManager *)objc_msgSend_initWithSequence_groupingManager_(self, v14, (uint64_t)v13, (uint64_t)v7, v15, v16);

  return v17;
}

- (CHGroupingPostProcessingManager)initWithSequence:(id)a3 groupingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHGroupingPostProcessingManager;
  v9 = [(CHGroupingPostProcessingManager *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sequence, a3);
    objc_storeStrong((id *)&v10->_groupingManager, a4);
  }

  return v10;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v487 = *MEMORY[0x1E4F143B8];
  id v457 = a3;
  id v455 = a4;
  for (unint64_t i = 0; ; ++i)
  {
    objc_super v12 = objc_msgSend_sequence(self, v6, v7, v8, v9, v10);
    unint64_t v18 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);

    if (i >= v18) {
      break;
    }
    v24 = objc_msgSend_sequence(self, v19, v20, v21, v22, v23);
    v29 = objc_msgSend_objectAtIndex_(v24, v25, i, v26, v27, v28);

    v35 = objc_msgSend_groupingManager(self, v30, v31, v32, v33, v34);
    objc_msgSend_setGroupingManager_(v29, v36, (uint64_t)v35, v37, v38, v39);

    uint64_t v45 = objc_msgSend_saveInputDrawings(self, v40, v41, v42, v43, v44);
    objc_msgSend_setSaveInputDrawings_(v29, v46, v45, v47, v48, v49);
    uint64_t v53 = objc_msgSend_process_options_(v29, v50, (uint64_t)v457, (uint64_t)v455, v51, v52);

    id v457 = (id)v53;
  }
  v54 = (id *)v457;
  v465 = v54;
  if (self)
  {
    if (v54) {
      id v55 = v54[9];
    }
    else {
      id v55 = 0;
    }
    v56 = (void *)MEMORY[0x1E4F1CA80];
    id v57 = v55;
    uint64_t v63 = objc_msgSend_count(v57, v58, v59, v60, v61, v62);
    v462 = objc_msgSend_setWithCapacity_(v56, v64, v63, v65, v66, v67);

    v458 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v68, v69, v70, v71, v72);
    v78 = objc_msgSend_previousProcessedStrokeGroupingResult(v465, v73, v74, v75, v76, v77);
    v84 = objc_msgSend_strokeGroups(v78, v79, v80, v81, v82, v83);
    v456 = objc_msgSend_mutableCopy(v84, v85, v86, v87, v88, v89);

    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v90, v91, v92, v93, v94);
    id v463 = (id)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend_previousProcessedStrokeGroupingResult(v465, v95, v96, v97, v98, v99);
    v106 = objc_msgSend_strokeGroups(v100, v101, v102, v103, v104, v105);
    v461 = objc_msgSend_mutableCopy(v106, v107, v108, v109, v110, v111);

    long long v482 = 0u;
    long long v483 = 0u;
    long long v480 = 0u;
    long long v481 = 0u;
    v112 = v465;
    if (v465) {
      v112 = (id *)v465[9];
    }
    obuint64_t j = v112;
    uint64_t v464 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v113, (uint64_t)&v480, (uint64_t)v486, 16, v114);
    if (v464)
    {
      uint64_t v460 = *(void *)v481;
      do
      {
        for (uint64_t j = 0; j != v464; ++j)
        {
          if (*(void *)v481 != v460) {
            objc_enumerationMutation(obj);
          }
          v471 = *(void **)(*((void *)&v480 + 1) + 8 * j);
          long long v476 = 0u;
          long long v477 = 0u;
          long long v478 = 0u;
          long long v479 = 0u;
          id v467 = v461;
          uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v467, v115, (uint64_t)&v476, (uint64_t)v485, 16, v116);
          if (v122)
          {
            uint64_t v123 = *(void *)v477;
LABEL_16:
            uint64_t v124 = 0;
            while (1)
            {
              if (*(void *)v477 != v123) {
                objc_enumerationMutation(v467);
              }
              v125 = *(void **)(*((void *)&v476 + 1) + 8 * v124);
              v126 = objc_msgSend_strokeIdentifiers(v471, v117, v118, v119, v120, v121);
              v132 = objc_msgSend_strokeIdentifiers(v125, v127, v128, v129, v130, v131);
              int isEqualToSet = objc_msgSend_isEqualToSet_(v126, v133, (uint64_t)v132, v134, v135, v136);

              if (isEqualToSet) {
                break;
              }
              if (v122 == ++v124)
              {
                uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v467, v117, (uint64_t)&v476, (uint64_t)v485, 16, v121);
                if (!v122) {
                  goto LABEL_22;
                }
                goto LABEL_16;
              }
            }
            v199 = objc_msgSend_previousProcessedRecognizedResultsByGroupID(v465, v117, v118, v119, v120, v121);
            v200 = NSNumber;
            uint64_t v206 = objc_msgSend_uniqueIdentifier(v125, v201, v202, v203, v204, v205);
            v211 = objc_msgSend_numberWithInteger_(v200, v207, v206, v208, v209, v210);
            objc_msgSend_objectForKeyedSubscript_(v199, v212, (uint64_t)v211, v213, v214, v215);
            v216 = (id *)objc_claimAutoreleasedReturnValue();

            if (!v216)
            {
              v222 = v465;
              if (v465) {
                v222 = (id *)v465[10];
              }
              v223 = v222;
              v224 = NSNumber;
              uint64_t v230 = objc_msgSend_uniqueIdentifier(v471, v225, v226, v227, v228, v229);
              v235 = objc_msgSend_numberWithInteger_(v224, v231, v230, v232, v233, v234);
              objc_msgSend_objectForKeyedSubscript_(v223, v236, (uint64_t)v235, v237, v238, v239);
              v216 = (id *)objc_claimAutoreleasedReturnValue();
            }
            v240 = objc_msgSend_strokeGroupReplacements(v465, v217, v218, v219, v220, v221);
            int v245 = objc_msgSend_containsObject_(v240, v241, (uint64_t)v471, v242, v243, v244);

            if (v245)
            {
              objc_msgSend_addObject_(v462, v246, (uint64_t)v471, v248, v249, v250);
              v251 = NSNumber;
              uint64_t v257 = objc_msgSend_uniqueIdentifier(v471, v252, v253, v254, v255, v256);
              v262 = objc_msgSend_numberWithInteger_(v251, v258, v257, v259, v260, v261);
              objc_msgSend_setObject_forKeyedSubscript_(v463, v263, (uint64_t)v216, (uint64_t)v262, v264, v265);
            }
            else
            {
              v266 = objc_msgSend_strategyIdentifier(v471, v246, v247, v248, v249, v250);
              uint64_t v272 = objc_msgSend_classification(v471, v267, v268, v269, v270, v271);
              v262 = objc_msgSend_strokeGroupWithUpdatedStrategyIdentifier_classification_(v125, v273, (uint64_t)v266, v272, v274, v275);

              objc_msgSend_addObject_(v462, v276, (uint64_t)v262, v277, v278, v279);
              objc_msgSend_removeObject_(v456, v280, (uint64_t)v125, v281, v282, v283);
              v284 = NSNumber;
              uint64_t v290 = objc_msgSend_uniqueIdentifier(v125, v285, v286, v287, v288, v289);
              v295 = objc_msgSend_numberWithInteger_(v284, v291, v290, v292, v293, v294);
              objc_msgSend_setObject_forKeyedSubscript_(v463, v296, (uint64_t)v216, (uint64_t)v295, v297, v298);
            }
            id v469 = v125;
            StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = v467;
LABEL_53:

            v337 = v469;
            if (v469) {
              objc_msgSend_removeObject_(v467, v444, (uint64_t)v469, v445, v446, v447);
            }
          }
          else
          {
LABEL_22:

            v143 = objc_msgSend_strategyIdentifier(v471, v138, v139, v140, v141, v142);
            char isEqualToString = objc_msgSend_isEqualToString_(v143, v144, @"CHGroupingPostProcessingManager", v145, v146, v147);

            if (isEqualToString)
            {
              long long v474 = 0u;
              long long v475 = 0u;
              long long v472 = 0u;
              long long v473 = 0u;
              id v468 = v467;
              uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v468, v153, (uint64_t)&v472, (uint64_t)v484, 16, v154);
              if (!v160)
              {

                id v469 = 0;
                goto LABEL_49;
              }
              id v469 = 0;
              uint64_t v161 = *(void *)v473;
              uint64_t v162 = 0x7FFFFFFFFFFFFFFFLL;
              while (2)
              {
                uint64_t v163 = 0;
LABEL_27:
                if (*(void *)v473 != v161) {
                  objc_enumerationMutation(v468);
                }
                v164 = *(void **)(*((void *)&v472 + 1) + 8 * v163);
                v165 = objc_msgSend_strokeIdentifiers(v164, v155, v156, v157, v158, v159);
                v171 = objc_msgSend_strokeIdentifiers(v471, v166, v167, v168, v169, v170);
                if (objc_msgSend_isSubsetOfSet_(v165, v172, (uint64_t)v171, v173, v174, v175))
                {

LABEL_32:
                  if (objc_msgSend_ancestorIdentifier(v164, v155, v156, v157, v158, v159) < v162)
                  {
                    uint64_t v162 = objc_msgSend_ancestorIdentifier(v164, v155, v156, v157, v158, v159);
                    id v193 = v164;

                    id v469 = v193;
                  }
                }
                else
                {
                  v181 = objc_msgSend_strokeIdentifiers(v471, v176, v177, v178, v179, v180);
                  v187 = objc_msgSend_strokeIdentifiers(v164, v182, v183, v184, v185, v186);
                  int isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v181, v188, (uint64_t)v187, v189, v190, v191);

                  if (isSubsetOfSet) {
                    goto LABEL_32;
                  }
                }
                if (v160 == ++v163)
                {
                  uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v468, v155, (uint64_t)&v472, (uint64_t)v484, 16, v159);
                  if (!v160)
                  {

                    if (v162 != 0x7FFFFFFFFFFFFFFFLL)
                    {
LABEL_50:
                      v338 = [CHStrokeGroup alloc];
                      uint64_t v344 = objc_msgSend_uniqueIdentifier(v471, v339, v340, v341, v342, v343);
                      v350 = objc_msgSend_strokeIdentifiers(v471, v345, v346, v347, v348, v349);
                      v356 = objc_msgSend_firstStrokeIdentifier(v471, v351, v352, v353, v354, v355);
                      v362 = objc_msgSend_lastStrokeIdentifier(v471, v357, v358, v359, v360, v361);
                      objc_msgSend_bounds(v471, v363, v364, v365, v366, v367);
                      double v369 = v368;
                      double v371 = v370;
                      double v373 = v372;
                      double v375 = v374;
                      uint64_t v381 = objc_msgSend_classification(v471, v376, v377, v378, v379, v380);
                      objc_msgSend_groupingConfidence(v471, v382, v383, v384, v385, v386);
                      double v388 = v387;
                      v394 = objc_msgSend_strategyIdentifier(v471, v389, v390, v391, v392, v393);
                      objc_msgSend_firstStrokeOrigin(v471, v395, v396, v397, v398, v399);
                      StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v338, v400, v344, v162, (uint64_t)v350, (uint64_t)v356, v362, v381, v369, v371, v373, v375, v388, v401, v402, v394);

                      objc_msgSend_addObject_(v462, v403, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v404, v405, v406);
                      objc_msgSend_addObject_(v458, v407, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v408, v409, v410);
                      v411 = v465;
                      if (v465) {
                        v411 = (id *)v465[10];
                      }
                      v216 = v411;
                      v412 = NSNumber;
                      uint64_t v418 = objc_msgSend_uniqueIdentifier(v471, v413, v414, v415, v416, v417);
                      v423 = objc_msgSend_numberWithInteger_(v412, v419, v418, v420, v421, v422);
                      v428 = objc_msgSend_objectForKeyedSubscript_(v216, v424, (uint64_t)v423, v425, v426, v427);
                      v429 = NSNumber;
                      uint64_t v435 = objc_msgSend_uniqueIdentifier(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v430, v431, v432, v433, v434);
                      v440 = objc_msgSend_numberWithInteger_(v429, v436, v435, v437, v438, v439);
                      objc_msgSend_setObject_forKeyedSubscript_(v463, v441, (uint64_t)v428, (uint64_t)v440, v442, v443);

                      goto LABEL_53;
                    }
LABEL_49:
                    uint64_t v162 = objc_msgSend_ancestorIdentifier(v471, v194, v195, v196, v197, v198);
                    goto LABEL_50;
                  }
                  continue;
                }
                goto LABEL_27;
              }
            }
            objc_msgSend_addObject_(v462, v149, (uint64_t)v471, v150, v151, v152);
            objc_msgSend_addObject_(v458, v300, (uint64_t)v471, v301, v302, v303);
            v304 = v465;
            if (v465) {
              v304 = (id *)v465[10];
            }
            v470 = v304;
            v305 = NSNumber;
            uint64_t v311 = objc_msgSend_uniqueIdentifier(v471, v306, v307, v308, v309, v310);
            v316 = objc_msgSend_numberWithInteger_(v305, v312, v311, v313, v314, v315);
            v321 = objc_msgSend_objectForKeyedSubscript_(v470, v317, (uint64_t)v316, v318, v319, v320);
            v322 = NSNumber;
            uint64_t v328 = objc_msgSend_uniqueIdentifier(v471, v323, v324, v325, v326, v327);
            v333 = objc_msgSend_numberWithInteger_(v322, v329, v328, v330, v331, v332);
            objc_msgSend_setObject_forKeyedSubscript_(v463, v334, (uint64_t)v321, (uint64_t)v333, v335, v336);

            v337 = 0;
          }
        }
        uint64_t v464 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v448, (uint64_t)&v480, (uint64_t)v486, 16, v449);
      }
      while (v464);
    }

    v450 = [CHStrokeGroupingResult alloc];
    v453 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v450, v451, (uint64_t)v462, (uint64_t)v458, (uint64_t)v456, v452);
    if (v465)
    {
      objc_storeStrong(v465 + 3, v453);
      objc_storeStrong(v465 + 4, v463);
    }

    v54 = v465;
  }

  return v465;
}

- (BOOL)saveInputDrawings
{
  return self->_saveInputDrawings;
}

- (void)setSaveInputDrawings:(BOOL)a3
{
  self->_saveInputDrawings = a3;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
}

- (CHStrokeGroupingManager)groupingManager
{
  return self->_groupingManager;
}

- (void)setGroupingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingManager, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end