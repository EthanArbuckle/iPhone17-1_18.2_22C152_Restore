@interface CHTimeWindowStrokeGroupingStrategy
- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8;
- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8;
@end

@implementation CHTimeWindowStrokeGroupingStrategy

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  uint64_t v430 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v386 = a6;
  id v385 = a7;
  id v384 = a8;
  v388 = v14;
  v27 = objc_msgSend_strokeGroups(v14, v17, v18, v19, v20, v21);
  if (v27)
  {
    uint64_t v33 = objc_msgSend_strokeProvider(self, v22, v23, v24, v25, v26);
    v34 = &qword_1EA3CA000;
    if (v33) {
      goto LABEL_10;
    }
  }
  else
  {
    v27 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v22, v23, v24, v25, v26);
    uint64_t v33 = objc_msgSend_strokeProvider(self, v35, v36, v37, v38, v39);
    v34 = &qword_1EA3CA000;
    if (v33) {
      goto LABEL_10;
    }
  }
  if (*v34 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v40 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v40, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
  }

LABEL_10:
  v383 = objc_msgSend_mutableCopy(v27, v28, v29, v30, v31, v32);
  v396 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v41, v42, v43, v44, v45);
  v394 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v46, v47, v48, v49, v50);
  v399 = objc_msgSend_mutableCopy(v15, v51, v52, v53, v54, v55);
  if (*v34 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v389 = v27;
  v387 = v15;
  v56 = (id)qword_1EA3C9FA8;
  v398 = (void *)v33;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    v57 = objc_opt_class();
    id v58 = v57;
    uint64_t v64 = objc_msgSend_count(v399, v59, v60, v61, v62, v63);
    uint64_t v70 = objc_msgSend_count(v16, v65, v66, v67, v68, v69);
    *(_DWORD *)buf = 138412802;
    uint64_t v425 = (uint64_t)v57;
    __int16 v426 = 2048;
    uint64_t v427 = v64;
    __int16 v428 = 2048;
    uint64_t v429 = v70;
    _os_log_impl(&dword_1C492D000, v56, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);
  }
  v392 = self;
  if (objc_msgSend_count(v16, v71, v72, v73, v74, v75))
  {
    long long v418 = 0u;
    long long v419 = 0u;
    long long v416 = 0u;
    long long v417 = 0u;
    id v76 = v389;
    uint64_t v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v416, (uint64_t)v423, 16, v78);
    if (!v393)
    {
LABEL_45:

      goto LABEL_46;
    }
    char v84 = 0;
    uint64_t v85 = *(void *)v417;
    uint64_t v390 = *(void *)v417;
    id v391 = v76;
    do
    {
      uint64_t v86 = 0;
      do
      {
        while (1)
        {
          if (*(void *)v417 != v85) {
            objc_enumerationMutation(v76);
          }
          uint64_t v395 = v86;
          v88 = *(void **)(*((void *)&v416 + 1) + 8 * v86);
          v89 = objc_msgSend_strokeIdentifiers(v88, v79, v80, v81, v82, v83);
          int v94 = objc_msgSend_intersectsSet_(v89, v90, (uint64_t)v16, v91, v92, v93);

          if (v94) {
            break;
          }
          v87 = v398;
          uint64_t v86 = v395 + 1;
          if (v395 + 1 == v393) {
            goto LABEL_17;
          }
        }
        objc_msgSend_addObject_(v394, v79, (uint64_t)v88, v81, v82, v83);
        long long v414 = 0u;
        long long v415 = 0u;
        long long v412 = 0u;
        long long v413 = 0u;
        v100 = objc_msgSend_strokeIdentifiers(v88, v95, v96, v97, v98, v99);
        uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, (uint64_t)&v412, (uint64_t)v422, 16, v102);
        if (v103)
        {
          uint64_t v108 = v103;
          uint64_t v109 = *(void *)v413;
          v87 = v398;
          while (1)
          {
            for (uint64_t i = 0; i != v108; ++i)
            {
              if (*(void *)v413 == v109)
              {
                uint64_t v111 = *(void *)(*((void *)&v412 + 1) + 8 * i);
                if (objc_msgSend_containsObject_(v16, v104, v111, v105, v106, v107)) {
                  continue;
                }
              }
              else
              {
                objc_enumerationMutation(v100);
                uint64_t v111 = *(void *)(*((void *)&v412 + 1) + 8 * i);
                if (objc_msgSend_containsObject_(v16, v112, v111, v113, v114, v115)) {
                  continue;
                }
              }
              v116 = objc_opt_class();
              v124 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v116, v117, v111, (uint64_t)v87, v118, v119);
              if (v124)
              {
                objc_msgSend_addObject_(v399, v120, (uint64_t)v124, v121, v122, v123);
                char v84 = 1;
              }
              else
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                v125 = (id)qword_1EA3C9FA8;
                if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v425 = v111;
                  _os_log_impl(&dword_1C492D000, v125, OS_LOG_TYPE_ERROR, "Could not find stroke for id: %@", buf, 0xCu);
                }

                v87 = v398;
              }
            }
            uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v104, (uint64_t)&v412, (uint64_t)v422, 16, v107);
            if (!v108) {
              goto LABEL_41;
            }
          }
        }
        v87 = v398;
LABEL_41:

        uint64_t v85 = v390;
        id v76 = v391;
        uint64_t v86 = v395 + 1;
      }
      while (v395 + 1 != v393);
LABEL_17:
      uint64_t v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v79, (uint64_t)&v416, (uint64_t)v423, 16, v83);
    }
    while (v393);

    if (v84)
    {
      v410[0] = MEMORY[0x1E4F143A8];
      v410[1] = 3221225472;
      v410[2] = sub_1C4AD5F78;
      v410[3] = &unk_1E64E1700;
      id v411 = v87;
      objc_msgSend_sortUsingComparator_(v399, v126, (uint64_t)v410, v127, v128, v129);
      id v76 = v411;
      goto LABEL_45;
    }
  }
LABEL_46:
  long long v408 = 0u;
  long long v409 = 0u;
  long long v406 = 0u;
  long long v407 = 0u;
  id v130 = v389;
  uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v131, (uint64_t)&v406, (uint64_t)v421, 16, v132);
  if (v133)
  {
    uint64_t v134 = v133;
    StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = 0;
    uint64_t v136 = *(void *)v407;
    do
    {
      for (uint64_t j = 0; j != v134; ++j)
      {
        if (*(void *)v407 != v136) {
          objc_enumerationMutation(v130);
        }
        v138 = *(void **)(*((void *)&v406 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp
            || (objc_msgSend_endTimestamp(v138, v139, v140, v141, v142, v143),
                double v145 = v144,
                objc_msgSend_endTimestamp(StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp, v146, v147, v148, v149, v150), v145 > v151))
          {
            if ((objc_msgSend_containsObject_(v394, v139, (uint64_t)v138, v141, v142, v143) & 1) == 0)
            {
              id v152 = v138;

              StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = v152;
            }
          }
        }
      }
      uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v139, (uint64_t)&v406, (uint64_t)v421, 16, v143);
    }
    while (v134);
  }
  else
  {
    StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = 0;
  }
  v397 = v130;

  long long v404 = 0u;
  long long v405 = 0u;
  long long v402 = 0u;
  long long v403 = 0u;
  id v153 = v399;
  uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v154, (uint64_t)&v402, (uint64_t)v420, 16, v155);
  if (v156)
  {
    uint64_t v162 = v156;
    uint64_t v163 = *(void *)v403;
    do
    {
      uint64_t v164 = 0;
      v165 = StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp;
      do
      {
        if (*(void *)v403 != v163) {
          objc_enumerationMutation(v153);
        }
        v205 = *(void **)(*((void *)&v402 + 1) + 8 * v164);
        objc_msgSend_startTimestamp(v205, v157, v158, v159, v160, v161);
        double v207 = v206;
        objc_msgSend_endTimestamp(v165, v208, v209, v210, v211, v212);
        double v214 = v207 - v213;
        objc_msgSend_startTimestamp(v205, v215, v216, v217, v218, v219);
        double v221 = v220;
        objc_msgSend_endTimestamp(v165, v222, v223, v224, v225, v226);
        double v233 = v221 - v232;
        if (v214 >= 0.0) {
          double v234 = v233;
        }
        else {
          double v234 = -v233;
        }
        objc_msgSend_endTimestamp(v205, v227, v228, v229, v230, v231);
        double v236 = v235;
        objc_msgSend_startTimestamp(v165, v237, v238, v239, v240, v241);
        double v243 = v236 - v242;
        objc_msgSend_endTimestamp(v205, v244, v245, v246, v247, v248);
        double v250 = v249;
        objc_msgSend_startTimestamp(v165, v251, v252, v253, v254, v255);
        double v262 = v250 - v261;
        if (v243 < 0.0) {
          double v262 = -v262;
        }
        if (v234 >= v262)
        {
          objc_msgSend_endTimestamp(v205, v256, v257, v258, v259, v260);
          double v264 = v263;
          objc_msgSend_startTimestamp(v165, v265, v266, v267, v268, v269);
          double v271 = v264 - v270;
          objc_msgSend_endTimestamp(v205, v272, v273, v274, v275, v276);
          double v278 = v277;
          objc_msgSend_startTimestamp(v165, v279, v280, v281, v282, v283);
          double v285 = v278 - v284;
          if (v271 < 0.0) {
            double v234 = -v285;
          }
          else {
            double v234 = v285;
          }
        }
        if (v165 && v234 < 1.0)
        {
          if ((objc_msgSend_containsObject_(v396, v256, (uint64_t)v165, v258, v259, v260) & 1) == 0) {
            objc_msgSend_addObject_(v394, v286, (uint64_t)v165, v287, v288, v289);
          }
          objc_msgSend_removeObject_(v396, v286, (uint64_t)v165, v287, v288, v289);
          v290 = (void *)MEMORY[0x1E4F1CAD0];
          v296 = objc_msgSend_encodedStrokeIdentifier(v205, v291, v292, v293, v294, v295);
          v166 = objc_msgSend_setWithObject_(v290, v297, (uint64_t)v296, v298, v299, v300);

          objc_msgSend_bounds(v165, v301, v302, v303, v304, v305);
          CGFloat v307 = v306;
          CGFloat v309 = v308;
          CGFloat v311 = v310;
          CGFloat v313 = v312;
          objc_msgSend_bounds(v205, v314, v315, v316, v317, v318);
          v434.origin.double x = v319;
          v434.origin.double y = v320;
          v434.size.double width = v321;
          v434.size.double height = v322;
          v432.origin.double x = v307;
          v432.origin.double y = v309;
          v432.size.double width = v311;
          v432.size.double height = v313;
          CGRect v433 = CGRectUnion(v432, v434);
          double x = v433.origin.x;
          double y = v433.origin.y;
          double width = v433.size.width;
          double height = v433.size.height;
          objc_msgSend_startTimestamp(v165, v327, v328, v329, v330, v331);
          double v333 = v332;
          objc_msgSend_startTimestamp(v205, v334, v335, v336, v337, v338);
          if (v333 >= v344) {
            objc_msgSend_startTimestamp(v205, v339, v340, v341, v342, v343);
          }
          else {
            objc_msgSend_startTimestamp(v165, v339, v340, v341, v342, v343);
          }
          double v351 = v350;
          objc_msgSend_endTimestamp(v165, v345, v346, v347, v348, v349);
          double v353 = v352;
          objc_msgSend_endTimestamp(v205, v354, v355, v356, v357, v358);
          if (v353 <= v364) {
            objc_msgSend_endTimestamp(v205, v359, v360, v361, v362, v363);
          }
          else {
            objc_msgSend_endTimestamp(v165, v359, v360, v361, v362, v363);
          }
          double v367 = v366;
          id v400 = 0;
          id v401 = 0;
          objc_msgSend_firstStrokeIdentifier_lastStrokeIdentifier_inGroup_addingStrokeIdentifiers_removingStrokeIdentifiers_(v392, v365, (uint64_t)&v401, (uint64_t)&v400, (uint64_t)v165, (uint64_t)v166, 0);
          id v368 = v401;
          id v172 = v400;
          StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = objc_msgSend_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp_(v165, v369, (uint64_t)v166, 0, (uint64_t)v368, (uint64_t)v172, x, y, width, height, v351, v367);

          v165 = v368;
        }
        else
        {
          v166 = objc_msgSend_encodedStrokeIdentifier(v205, v256, v257, v258, v259, v260);
          v167 = [CHTimeWindowStrokeGroup alloc];
          objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v168, (uint64_t)v166, v169, v170, v171);
          id v172 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v205, v173, v174, v175, v176, v177);
          double v179 = v178;
          double v181 = v180;
          double v183 = v182;
          double v185 = v184;
          objc_msgSend_startTimestamp(v205, v186, v187, v188, v189, v190);
          double v192 = v191;
          objc_msgSend_endTimestamp(v205, v193, v194, v195, v196, v197);
          StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp_(v167, v198, (uint64_t)v172, (uint64_t)v166, (uint64_t)v166, v199, v179, v181, v183, v185, v192, v200);
        }

        objc_msgSend_addObject_(v396, v201, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp, v202, v203, v204);
        ++v164;
        v165 = StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp;
      }
      while (v162 != v164);
      uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v157, (uint64_t)&v402, (uint64_t)v420, 16, v161);
    }
    while (v162);
  }

  objc_msgSend_unionSet_(v383, v370, (uint64_t)v396, v371, v372, v373);
  objc_msgSend_minusSet_(v383, v374, (uint64_t)v394, v375, v376, v377);
  v378 = [CHStrokeGroupingResult alloc];
  v381 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v378, v379, (uint64_t)v383, (uint64_t)v396, (uint64_t)v394, v380);

  return v381;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v88 = objc_alloc_init(CHDrawing);
  uint64_t v83 = a5;
  if (a5)
  {
    id v16 = objc_alloc_init(CHDrawing);
    v27 = objc_msgSend_strokeIdentifiers(v10, v17, v18, v19, v20, v21);
    if (self)
    {
LABEL_3:
      v28 = objc_msgSend_allObjects(v27, v22, v23, v24, v25, v26, a5);
      uint64_t v33 = objc_msgSend_strokesForIdentifiers_(self, v29, (uint64_t)v28, v30, v31, v32);

      uint64_t v38 = objc_msgSend_sortedArrayUsingComparator_(v33, v34, (uint64_t)&unk_1F2012DB0, v35, v36, v37);

      goto LABEL_4;
    }
  }
  else
  {
    id v16 = 0;
    v27 = objc_msgSend_strokeIdentifiers(v10, v11, v12, v13, v14, v15);
    if (self) {
      goto LABEL_3;
    }
  }
  uint64_t v38 = 0;
LABEL_4:

  uint64_t v86 = v10;
  objc_msgSend_bounds(v10, v39, v40, v41, v42, v43);
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v53 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v48, v49, v50, v51, v52);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  obuint64_t j = v38;
  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v94, (uint64_t)v98, 16, v55);
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v95 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        uint64_t v68 = objc_opt_class();
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = sub_1C4AD6310;
        v89[3] = &unk_1E64E3748;
        uint64_t v69 = v16;
        v90 = v69;
        uint64_t v92 = v45;
        uint64_t v93 = v47;
        uint64_t v70 = v88;
        uint64_t v91 = v70;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v68, v71, (uint64_t)v67, 0, 1, (uint64_t)v89);
        objc_msgSend_endStroke(v70, v72, v73, v74, v75, v76);
        if (v16) {
          objc_msgSend_endStroke(v69, v77, v78, v79, v80, v81);
        }
        uint64_t v60 = objc_msgSend_encodedStrokeIdentifier(v67, v77, v78, v79, v80, v81, v83);
        objc_msgSend_addObject_(v53, v61, (uint64_t)v60, v62, v63, v64);
      }
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v94, (uint64_t)v98, 16, v66);
    }
    while (v57);
  }

  if (v83) {
    *uint64_t v83 = v16;
  }
  if (a6) {
    *a6 = v53;
  }
  if (a8) {
    *a8 = 0;
  }

  return v88;
}

@end