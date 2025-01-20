@interface CHMathStrokeGroupingStrategy
- (CHMathStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 strokeGroupingModel:(id)a4;
- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8;
- (id)strategyIdentifier;
- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8;
@end

@implementation CHMathStrokeGroupingStrategy

- (CHMathStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 strokeGroupingModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CHMathStrokeGroupingStrategy;
  v8 = [(CHStrokeGroupingStrategy *)&v20 initWithStrokeProvider:v6];
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    strategyIdentifier = v8->_strategyIdentifier;
    v8->_strategyIdentifier = (NSString *)v10;

    v12 = [CHFastStrokeGroupingStrategy alloc];
    uint64_t v17 = objc_msgSend_initWithStrokeProvider_(v12, v13, (uint64_t)v6, v14, v15, v16);
    fastGroupingStrategy = v8->_fastGroupingStrategy;
    v8->_fastGroupingStrategy = (CHFastStrokeGroupingStrategy *)v17;

    objc_storeStrong((id *)&v8->_model, a4);
  }

  return v8;
}

- (id)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  uint64_t v554 = *MEMORY[0x1E4F143B8];
  id v511 = a3;
  id v501 = a4;
  id v12 = a5;
  v510 = (uint64_t (**)(void))a8;
  v517 = self;
  v502 = objc_msgSend_strokeProvider(self, v13, v14, v15, v16, v17);
  if (!v502)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v18 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v18, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v19 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v25 = objc_msgSend_strategyIdentifier(self, v20, v21, v22, v23, v24);
    uint64_t v31 = objc_msgSend_count(v501, v26, v27, v28, v29, v30);
    uint64_t v37 = objc_msgSend_count(v12, v32, v33, v34, v35, v36);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v553 = v37;
    _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);
  }
  v500 = objc_msgSend_orderedStrokes(v502, v38, v39, v40, v41, v42);
  id v43 = v501;
  v503 = v43;
  if (v517)
  {
    v49 = v43;
    v518 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v44, v45, v46, v47, v48);
    long long v545 = 0u;
    long long v546 = 0u;
    long long v543 = 0u;
    long long v544 = 0u;
    id v50 = v49;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v543, (uint64_t)buf, 16, v52);
    if (v58)
    {
      uint64_t v59 = *(void *)v544;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v544 != v59) {
            objc_enumerationMutation(v50);
          }
          v61 = objc_msgSend_encodedStrokeIdentifier(*(void **)(*((void *)&v543 + 1) + 8 * i), v53, v54, v55, v56, v57);
          objc_msgSend_addObject_(v518, v62, (uint64_t)v61, v63, v64, v65);
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v543, (uint64_t)buf, 16, v57);
      }
      while (v58);
    }
  }
  else
  {
    v518 = 0;
  }

  v71 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v66, v67, v68, v69, v70);
  long long v541 = 0u;
  long long v542 = 0u;
  long long v539 = 0u;
  long long v540 = 0u;
  objc_msgSend_strokeGroups(v511, v72, v73, v74, v75, v76);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v539, (uint64_t)v551, 16, v78);
  if (v84)
  {
    uint64_t v85 = *(void *)v540;
    do
    {
      for (uint64_t j = 0; j != v84; ++j)
      {
        if (*(void *)v540 != v85) {
          objc_enumerationMutation(obj);
        }
        v87 = *(void **)(*((void *)&v539 + 1) + 8 * j);
        v88 = objc_msgSend_strategyIdentifier(v87, v79, v80, v81, v82, v83);
        v94 = objc_msgSend_strategyIdentifier(v517, v89, v90, v91, v92, v93);
        int isEqualToString = objc_msgSend_isEqualToString_(v88, v95, (uint64_t)v94, v96, v97, v98);

        if (isEqualToString)
        {
          long long v537 = 0u;
          long long v538 = 0u;
          long long v535 = 0u;
          long long v536 = 0u;
          v100 = objc_msgSend_strokeIdentifiers(v87, v79, v80, v81, v82, v83);
          uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, (uint64_t)&v535, (uint64_t)v550, 16, v102);
          if (v107)
          {
            uint64_t v108 = *(void *)v536;
            do
            {
              for (uint64_t k = 0; k != v107; ++k)
              {
                if (*(void *)v536 != v108) {
                  objc_enumerationMutation(v100);
                }
                uint64_t v110 = *(void *)(*((void *)&v535 + 1) + 8 * k);
                if ((objc_msgSend_containsObject_(v12, v103, v110, v104, v105, v106) & 1) == 0) {
                  objc_msgSend_addObject_(v71, v103, v110, v104, v105, v106);
                }
              }
              uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v103, (uint64_t)&v535, (uint64_t)v550, 16, v106);
            }
            while (v107);
          }
        }
      }
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v79, (uint64_t)&v539, (uint64_t)v551, 16, v83);
    }
    while (v84);
  }

  v514 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v111, v112, v113, v114, v115);
  long long v533 = 0u;
  long long v534 = 0u;
  long long v531 = 0u;
  long long v532 = 0u;
  id obja = v500;
  uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v116, (uint64_t)&v531, (uint64_t)v549, 16, v117);
  if (v123)
  {
    uint64_t v124 = *(void *)v532;
    do
    {
      for (uint64_t m = 0; m != v123; ++m)
      {
        if (*(void *)v532 != v124) {
          objc_enumerationMutation(obja);
        }
        v126 = *(void **)(*((void *)&v531 + 1) + 8 * m);
        v127 = objc_msgSend_encodedStrokeIdentifier(v126, v118, v119, v120, v121, v122);
        int v132 = objc_msgSend_containsObject_(v71, v128, (uint64_t)v127, v129, v130, v131);

        if (v132) {
          objc_msgSend_addObject_(v514, v118, (uint64_t)v126, v120, v121, v122);
        }
      }
      uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v118, (uint64_t)&v531, (uint64_t)v549, 16, v122);
    }
    while (v123);
  }

  objc_msgSend_addObjectsFromArray_(v514, v133, (uint64_t)v503, v134, v135, v136);
  if (v511)
  {
    uint64_t v142 = objc_msgSend_cachedAdjacencies(v511, v137, v138, v139, v140, v141);
    *(void *)&buf[16] = 0;
    *(void *)&buf[8] = 0;
    *(void *)buf = &buf[8];
    sub_1C49EB368(buf, *(void **)v142, (void *)(v142 + 8));
  }
  else
  {
    *(void *)&buf[16] = 0;
    *(void *)&buf[8] = 0;
    *(void *)buf = &buf[8];
  }
  *(void *)&long long v544 = 0;
  *((void *)&v543 + 1) = 0;
  *(void *)&long long v543 = (char *)&v543 + 8;
  v143 = objc_msgSend_groupStrokes_previousAdjacencies_updatedAdjacencies_(v517->_model, v137, (uint64_t)v514, (uint64_t)buf, (uint64_t)&v543, v141);
  v144 = (void *)MEMORY[0x1E4F1CA80];
  v499 = v143;
  uint64_t v150 = objc_msgSend_count(v143, v145, v146, v147, v148, v149);
  v509 = objc_msgSend_setWithCapacity_(v144, v151, v150, v152, v153, v154);
  v506 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v155, v156, v157, v158, v159);
  if (v511)
  {
    v165 = objc_msgSend_strokeGroups(v511, v160, v161, v162, v163, v164);
    v504 = objc_msgSend_mutableCopy(v165, v166, v167, v168, v169, v170);
  }
  else
  {
    v504 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v160, v161, v162, v163, v164);
  }
  long long v529 = 0u;
  long long v530 = 0u;
  long long v527 = 0u;
  long long v528 = 0u;
  id v505 = v499;
  uint64_t v508 = objc_msgSend_countByEnumeratingWithState_objects_count_(v505, v171, (uint64_t)&v527, (uint64_t)v548, 16, v172);
  if (v508)
  {
    uint64_t v507 = *(void *)v528;
    do
    {
      for (uint64_t n = 0; n != v508; ++n)
      {
        if (*(void *)v528 != v507) {
          objc_enumerationMutation(v505);
        }
        v173 = *(void **)(*((void *)&v527 + 1) + 8 * n);
        if (v510[2]()) {
          goto LABEL_82;
        }
        long long v525 = 0u;
        long long v526 = 0u;
        long long v523 = 0u;
        long long v524 = 0u;
        objc_msgSend_strokeGroups(v511, v174, v175, v176, v177, v178);
        id v513 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v513, v179, (uint64_t)&v523, (uint64_t)v547, 16, v180);
        if (v186)
        {
          uint64_t v187 = *(void *)v524;
LABEL_62:
          uint64_t v188 = 0;
          while (1)
          {
            if (*(void *)v524 != v187) {
              objc_enumerationMutation(v513);
            }
            v189 = *(void **)(*((void *)&v523 + 1) + 8 * v188);
            v190 = objc_msgSend_strokeIdentifiers(v173, v181, v182, v183, v184, v185);
            v196 = objc_msgSend_strokeIdentifiers(v189, v191, v192, v193, v194, v195);
            int isEqualToSet = objc_msgSend_isEqualToSet_(v190, v197, (uint64_t)v196, v198, v199, v200);

            if (isEqualToSet)
            {
              objc_msgSend_addObject_(v509, v202, (uint64_t)v189, v204, v205, v206);
              objc_msgSend_removeObject_(v504, v353, (uint64_t)v189, v354, v355, v356);
              goto LABEL_80;
            }
            v207 = objc_msgSend_strokeIdentifiers(v189, v202, v203, v204, v205, v206);
            v213 = objc_msgSend_strokeIdentifiers(v173, v208, v209, v210, v211, v212);
            int isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v207, v214, (uint64_t)v213, v215, v216, v217);

            if (isSubsetOfSet) {
              break;
            }
            v253 = objc_msgSend_strokeIdentifiers(v173, v219, v220, v221, v222, v223);
            v259 = objc_msgSend_strokeIdentifiers(v189, v254, v255, v256, v257, v258);
            int v264 = objc_msgSend_isSubsetOfSet_(v253, v260, (uint64_t)v259, v261, v262, v263);

            if (v264)
            {
              v265 = objc_msgSend_strokeIdentifiers(v189, v181, v182, v183, v184, v185);
              v230 = objc_msgSend_mutableCopy(v265, v266, v267, v268, v269, v270);

              v276 = objc_msgSend_strokeIdentifiers(v173, v271, v272, v273, v274, v275);
              objc_msgSend_minusSet_(v230, v277, (uint64_t)v276, v278, v279, v280);

              v519[0] = MEMORY[0x1E4F143A8];
              v519[1] = 3221225472;
              v519[2] = sub_1C4A5937C;
              v519[3] = &unk_1E64E2DD8;
              id v520 = v12;
              v285 = objc_msgSend_objectsPassingTest_(v230, v281, (uint64_t)v519, v282, v283, v284);
              BOOL v291 = objc_msgSend_count(v285, v286, v287, v288, v289, v290) == 0;

              if (v291)
              {
                v426 = [CHStrokeGroup alloc];
                uint64_t v432 = objc_msgSend_ancestorIdentifier(v189, v427, v428, v429, v430, v431);
                v438 = objc_msgSend_strokeIdentifiers(v173, v433, v434, v435, v436, v437);
                v444 = objc_msgSend_firstStrokeIdentifier(v173, v439, v440, v441, v442, v443);
                v450 = objc_msgSend_lastStrokeIdentifier(v173, v445, v446, v447, v448, v449);
                objc_msgSend_bounds(v173, v451, v452, v453, v454, v455);
                double v457 = v456;
                double v459 = v458;
                double v461 = v460;
                double v463 = v462;
                objc_msgSend_groupingConfidence(v173, v464, v465, v466, v467, v468);
                double v470 = v469;
                v476 = objc_msgSend_strategyIdentifier(v517, v471, v472, v473, v474, v475);
                objc_msgSend_firstStrokeOrigin(v173, v477, v478, v479, v480, v481);
                StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigiuint64_t n = objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v426, v482, v432, (uint64_t)v438, (uint64_t)v444, (uint64_t)v450, 3, v476, v457, v459, v461, v463, v470, v483, v484);

                objc_msgSend_addObject_(v509, v485, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v486, v487, v488);
                objc_msgSend_addObject_(v506, v489, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v490, v491, v492);
                v425 = &v520;
                goto LABEL_79;
              }
              v252 = &v520;
              goto LABEL_73;
            }
LABEL_63:
            if (v186 == ++v188)
            {
              uint64_t v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v513, v181, (uint64_t)&v523, (uint64_t)v547, 16, v185);
              if (v186) {
                goto LABEL_62;
              }
              goto LABEL_75;
            }
          }
          v224 = objc_msgSend_strokeIdentifiers(v173, v219, v220, v221, v222, v223);
          v230 = objc_msgSend_mutableCopy(v224, v225, v226, v227, v228, v229);

          v236 = objc_msgSend_strokeIdentifiers(v189, v231, v232, v233, v234, v235);
          objc_msgSend_minusSet_(v230, v237, (uint64_t)v236, v238, v239, v240);

          v521[0] = MEMORY[0x1E4F143A8];
          v521[1] = 3221225472;
          v521[2] = sub_1C4A59340;
          v521[3] = &unk_1E64E2DD8;
          id v522 = v518;
          v245 = objc_msgSend_objectsPassingTest_(v230, v241, (uint64_t)v521, v242, v243, v244);
          BOOL v251 = objc_msgSend_count(v245, v246, v247, v248, v249, v250) == 0;

          if (v251)
          {
            v357 = [CHStrokeGroup alloc];
            uint64_t v363 = objc_msgSend_ancestorIdentifier(v189, v358, v359, v360, v361, v362);
            v369 = objc_msgSend_strokeIdentifiers(v173, v364, v365, v366, v367, v368);
            v375 = objc_msgSend_firstStrokeIdentifier(v173, v370, v371, v372, v373, v374);
            v381 = objc_msgSend_lastStrokeIdentifier(v173, v376, v377, v378, v379, v380);
            objc_msgSend_bounds(v173, v382, v383, v384, v385, v386);
            double v388 = v387;
            double v390 = v389;
            double v392 = v391;
            double v394 = v393;
            objc_msgSend_groupingConfidence(v173, v395, v396, v397, v398, v399);
            double v401 = v400;
            v407 = objc_msgSend_strategyIdentifier(v517, v402, v403, v404, v405, v406);
            objc_msgSend_firstStrokeOrigin(v173, v408, v409, v410, v411, v412);
            StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigiuint64_t n = objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v357, v413, v363, (uint64_t)v369, (uint64_t)v375, (uint64_t)v381, 3, v407, v388, v390, v392, v394, v401, v414, v415);

            objc_msgSend_addObject_(v509, v417, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v418, v419, v420);
            objc_msgSend_addObject_(v506, v421, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v422, v423, v424);
            v425 = &v522;
LABEL_79:

            goto LABEL_80;
          }
          v252 = &v522;
LABEL_73:

          goto LABEL_63;
        }
LABEL_75:

        v292 = [CHStrokeGroup alloc];
        v298 = objc_msgSend_strokeIdentifiers(v173, v293, v294, v295, v296, v297);
        v304 = objc_msgSend_firstStrokeIdentifier(v173, v299, v300, v301, v302, v303);
        v310 = objc_msgSend_lastStrokeIdentifier(v173, v305, v306, v307, v308, v309);
        objc_msgSend_bounds(v173, v311, v312, v313, v314, v315);
        double v317 = v316;
        double v319 = v318;
        double v321 = v320;
        double v323 = v322;
        objc_msgSend_groupingConfidence(v173, v324, v325, v326, v327, v328);
        double v330 = v329;
        v336 = objc_msgSend_strategyIdentifier(v517, v331, v332, v333, v334, v335);
        objc_msgSend_firstStrokeOrigin(v173, v337, v338, v339, v340, v341);
        id v513 = (id)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v292, v342, (uint64_t)v298, (uint64_t)v304, (uint64_t)v310, 3, v336, v317, v319, v321, v323, v330, v343, v344);

        objc_msgSend_addObject_(v509, v345, (uint64_t)v513, v346, v347, v348);
        objc_msgSend_addObject_(v506, v349, (uint64_t)v513, v350, v351, v352);
LABEL_80:
      }
      uint64_t v508 = objc_msgSend_countByEnumeratingWithState_objects_count_(v505, v493, (uint64_t)&v527, (uint64_t)v548, 16, v494);
    }
    while (v508);
  }
LABEL_82:

  if (v510[2]())
  {
    v495 = 0;
  }
  else
  {
    v496 = [CHStrokeGroupingResult alloc];
    v495 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_cachedAdjacencies_(v496, v497, (uint64_t)v509, (uint64_t)v506, (uint64_t)v504, (uint64_t)&v543);
  }

  sub_1C49EB298((uint64_t)&v543, *((void **)&v543 + 1));
  sub_1C49EB298((uint64_t)buf, *(void **)&buf[8]);

  return v495;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v94 = a3;
  uint64_t v16 = objc_msgSend_strokeIdentifiers(v94, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_allObjects(v16, v17, v18, v19, v20, v21);
  uint64_t v92 = a7;
  uint64_t v93 = a8;
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = sub_1C4A597A8;
  v106[3] = &unk_1E64E1868;
  v106[4] = self;
  objc_msgSend_sortedArrayUsingComparator_(v22, v23, (uint64_t)v106, v24, v25, v26);
  id v97 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v31 = objc_msgSend_strokesForIdentifiers_(self, v27, (uint64_t)v97, v28, v29, v30);
  if (a5) {
    v32 = objc_alloc_init(CHDrawing);
  }
  else {
    v32 = 0;
  }
  uint64_t v33 = objc_alloc_init(CHDrawing);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v31;
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v102, (uint64_t)v107, 16, v35, v31);
  if (v36)
  {
    uint64_t v37 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v103 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        uint64_t v40 = objc_opt_class();
        v99[0] = MEMORY[0x1E4F143A8];
        v99[1] = 3221225472;
        v99[2] = sub_1C4A598D4;
        v99[3] = &unk_1E64E2E00;
        uint64_t v41 = v32;
        v100 = v41;
        uint64_t v42 = v33;
        v101 = v42;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v40, v43, (uint64_t)v39, 0, 1, (uint64_t)v99);
        if (v32)
        {
          objc_msgSend_endStroke(v41, v44, v45, v46, v47, v48);
          objc_msgSend_startTimestamp(v39, v49, v50, v51, v52, v53);
          objc_msgSend_addStartTime_(v41, v54, v55, v56, v57, v58);
          objc_msgSend_endTimestamp(v39, v59, v60, v61, v62, v63);
          objc_msgSend_addEndTime_(v41, v64, v65, v66, v67, v68);
        }
        objc_msgSend_endStroke(v42, v44, v45, v46, v47, v48);
        objc_msgSend_startTimestamp(v39, v69, v70, v71, v72, v73);
        objc_msgSend_addStartTime_(v42, v74, v75, v76, v77, v78);
        objc_msgSend_endTimestamp(v39, v79, v80, v81, v82, v83);
        objc_msgSend_addEndTime_(v42, v84, v85, v86, v87, v88);
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v89, (uint64_t)&v102, (uint64_t)v107, 16, v90);
    }
    while (v36);
  }

  if (a5) {
    *a5 = v32;
  }
  if (a6) {
    *a6 = v97;
  }
  if (v92) {
    *uint64_t v92 = 1.0;
  }
  if (v93) {
    *uint64_t v93 = 0;
  }

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_fastGroupingStrategy, 0);
  objc_storeStrong((id *)&self->_strategyIdentifier, 0);
}

@end