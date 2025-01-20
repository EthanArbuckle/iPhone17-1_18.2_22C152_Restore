@interface CHTopDownStrokeGroupingStrategy
- (CHTopDownStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 locale:(id)a4 textInputTargets:(id)a5;
- (NSArray)textInputTargets;
- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8;
- (id)strategyIdentifier;
- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8;
@end

@implementation CHTopDownStrokeGroupingStrategy

- (CHTopDownStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 locale:(id)a4 textInputTargets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CHTopDownStrokeGroupingStrategy;
  v11 = [(CHStrokeGroupingStrategy *)&v24 initWithStrokeProvider:v8];
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    strategyIdentifier = v11->_strategyIdentifier;
    v11->_strategyIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v11->_textInputTargets, a5);
    v11->_minimumDrawingSize = 16.0;
    v11->_transitionTimeWeight = 0.1;
    v11->_transitionTimeUpperBound = 1.0;
    v11->_verticalDistanceWeight = 1.2;
    v11->_backTransitionWeight = 0.2;
    v11->_backTransitionUpperBound = 3.0;
    v11->_horizontalDistanceBarrier = 1.2;
    v11->_horizontalDistanceWeight = 3.0;
    v11->_aspectRatioWeight = 0.1;
    v11->_writingDirectionWeight = 0.2;
    v11->_writingDirectionUpperBound = 3.0;
    v11->_writingDirectionMinCoeff = 0.025;
    v11->_targetFitnessWeight = 0.8;
    v11->_minLineHeightScore = 0.2;
    v11->_minArcLengthScore = 0.2;
    v11->_arcLengthDiffScoreCoeff = 1.6;
    v11->_expectedSubstrokesPerLine = 5.0;
    v11->_minSubstrokesForSplit = 6.0;
    v11->_reorderStrokes = 1;
    v11->_splitCostThreshold = 0.6;
    if (objc_msgSend_shouldAdjustGroupingForLocale_(CHRecognizerConfiguration, v15, (uint64_t)v9, v16, v17, v18))
    {
      v11->_targetFitnessWeight = 1.0;
      v11->_splitCostThreshold = 0.8;
      v11->_reorderStrokes = 0;
    }
    v11->_writingOrientation = objc_msgSend_writingOrientationForLocale_(CHRecognizerConfiguration, v19, (uint64_t)v9, v20, v21, v22);
  }

  return v11;
}

- (id)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  uint64_t v1054 = *MEMORY[0x1E4F143B8];
  id v994 = a3;
  id v988 = a4;
  id v989 = a5;
  id v986 = a6;
  id v996 = a7;
  id v987 = a8;
  v991 = objc_msgSend_strokeProvider(self, v14, v15, v16, v17, v18);
  if (!v991)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    objc_super v24 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }
  }
  v992 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v19, v20, v21, v22, v23);
  v993 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v25, v26, v27, v28, v29);
  v990 = objc_msgSend_strokeGroups(v994, v30, v31, v32, v33, v34);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v35 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v41 = objc_msgSend_strategyIdentifier(self, v36, v37, v38, v39, v40);
    uint64_t v47 = objc_msgSend_count(v988, v42, v43, v44, v45, v46);
    uint64_t v53 = objc_msgSend_count(v989, v48, v49, v50, v51, v52);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2048;
    v1035 = (__n128 (*)(__n128 *, __n128 *))v53;
    _os_log_impl(&dword_1C492D000, v35, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);
  }
  v1015 = objc_msgSend_orderedStrokes(v991, v54, v55, v56, v57, v58);
  if (!objc_msgSend_count(v1015, v59, v60, v61, v62, v63))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v746 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v746, OS_LOG_TYPE_ERROR))
    {
      v752 = objc_msgSend_strategyIdentifier(self, v747, v748, v749, v750, v751);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v752;
      _os_log_impl(&dword_1C492D000, v746, OS_LOG_TYPE_ERROR, "Stroke Grouping with strategy %@ triggered with 0 strokes in the stroke provider.", buf, 0xCu);
    }
    v753 = [CHStrokeGroupingResult alloc];
    v756 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v753, v754, (uint64_t)v992, (uint64_t)v993, (uint64_t)v990, v755);
    goto LABEL_155;
  }
  v995 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v64, v65, v66, v67, v68);
  v997 = 0;
  unint64_t v74 = 0;
  double v75 = -1.79769313e308;
  while (v74 < objc_msgSend_count(v1015, v69, v70, v71, v72, v73) - 1)
  {
    double v1014 = v75;
    v81 = [CHTopDownStrokeSplit alloc];
    v83 = objc_msgSend_initWithStrokes_substrokesByStrokeIdentifier_splitIndex_writingOrientation_(v81, v82, (uint64_t)v1015, (uint64_t)v996, v74, self->_writingOrientation);
    textInputTargets = self->_textInputTargets;
    id v85 = v83;
    v86 = textInputTargets;
    id v87 = v995;
    objc_msgSend_groupBounds1(v85, v88, v89, v90, v91, v92);
    double v94 = v93;
    objc_msgSend_groupBounds2(v85, v95, v96, v97, v98, v99);
    if (v94 <= v105) {
      objc_msgSend_groupBounds2(v85, v100, v101, v102, v103, v104);
    }
    else {
      objc_msgSend_groupBounds1(v85, v100, v101, v102, v103, v104);
    }
    double minimumDrawingSize = self->_minimumDrawingSize;
    if (v111 > minimumDrawingSize)
    {
      objc_msgSend_groupBounds1(v85, v106, v107, v108, v109, v110);
      double v113 = v112;
      objc_msgSend_groupBounds2(v85, v114, v115, v116, v117, v118);
      if (v113 <= v124) {
        objc_msgSend_groupBounds2(v85, v119, v120, v121, v122, v123);
      }
      else {
        objc_msgSend_groupBounds1(v85, v119, v120, v121, v122, v123);
      }
      double minimumDrawingSize = v125;
    }
    objc_msgSend_groupBounds1(v85, v106, v107, v108, v109, v110);
    double v127 = v126;
    objc_msgSend_groupBounds2(v85, v128, v129, v130, v131, v132);
    if (v127 <= v138) {
      objc_msgSend_groupBounds2(v85, v133, v134, v135, v136, v137);
    }
    else {
      objc_msgSend_groupBounds1(v85, v133, v134, v135, v136, v137);
    }
    double v145 = v144;
    objc_msgSend_transitionTime(v85, v139, v140, v141, v142, v143);
    double transitionTimeUpperBound = self->_transitionTimeUpperBound;
    if (v152 < transitionTimeUpperBound)
    {
      objc_msgSend_transitionTime(v85, v146, v147, v148, v149, v150);
      double transitionTimeUpperBound = v153;
    }
    double transitionTimeWeight = self->_transitionTimeWeight;
    double v1013 = transitionTimeUpperBound;
    objc_msgSend_groupBounds2(v85, v146, v147, v148, v149, v150);
    double MinY = CGRectGetMinY(v1056);
    objc_msgSend_groupBounds1(v85, v155, v156, v157, v158, v159);
    double MaxY = CGRectGetMaxY(v1057);
    objc_msgSend_groupBounds1(v85, v161, v162, v163, v164, v165);
    double v166 = CGRectGetMinY(v1058);
    objc_msgSend_groupBounds2(v85, v167, v168, v169, v170, v171);
    double v177 = v166 - CGRectGetMaxY(v1059);
    if (MinY - MaxY <= v177) {
      double v178 = v177;
    }
    else {
      double v178 = MinY - MaxY;
    }
    double verticalDistanceWeight = self->_verticalDistanceWeight;
    double v1011 = v178;
    if (self->_writingOrientation == 2)
    {
      objc_msgSend_groupBounds2(v85, v172, v173, v174, v175, v176);
      double MaxX = CGRectGetMaxX(v1060);
      objc_msgSend_groupBounds1(v85, v180, v181, v182, v183, v184);
      double MinX = CGRectGetMinX(v1061);
      objc_msgSend_groupBounds1(v85, v186, v187, v188, v189, v190);
      double v191 = CGRectGetMinX(v1062);
      objc_msgSend_groupBounds2(v85, v192, v193, v194, v195, v196);
    }
    else
    {
      objc_msgSend_groupBounds1(v85, v172, v173, v174, v175, v176);
      double MaxX = CGRectGetMaxX(v1063);
      objc_msgSend_groupBounds2(v85, v201, v202, v203, v204, v205);
      double MinX = CGRectGetMinX(v1064);
      objc_msgSend_groupBounds2(v85, v206, v207, v208, v209, v210);
      double v191 = CGRectGetMinX(v1065);
      objc_msgSend_groupBounds1(v85, v211, v212, v213, v214, v215);
    }
    double v221 = v191 - CGRectGetMaxX(*(CGRect *)&v197);
    double backTransitionUpperBound = self->_backTransitionUpperBound;
    double v1001 = (MaxX - MinX) / minimumDrawingSize;
    if (v1001 < backTransitionUpperBound) {
      double backTransitionUpperBound = (MaxX - MinX) / minimumDrawingSize;
    }
    double v1008 = backTransitionUpperBound;
    double v1009 = v221;
    double horizontalDistanceBarrier = self->_horizontalDistanceBarrier;
    double horizontalDistanceWeight = self->_horizontalDistanceWeight;
    double backTransitionWeight = self->_backTransitionWeight;
    v223 = objc_msgSend_orderedStrokes(v85, v216, v217, v218, v219, v220);
    BOOL v229 = (unint64_t)objc_msgSend_count(v223, v224, v225, v226, v227, v228) > 2;

    double v235 = 0.0;
    double v236 = 0.0;
    if (v229)
    {
      v237 = objc_msgSend_orderedStrokes(v85, v230, v231, v232, v233, v234);
      double v238 = sub_1C4AD41C0(v237);

      v244 = objc_msgSend_orderedStrokesGroup1(v85, v239, v240, v241, v242, v243);
      double v245 = sub_1C4AD41C0(v244);

      v251 = objc_msgSend_orderedStrokesGroup2(v85, v246, v247, v248, v249, v250);
      double v252 = sub_1C4AD41C0(v251);

      v258 = objc_msgSend_orderedStrokes(v85, v253, v254, v255, v256, v257);
      uint64_t v264 = objc_msgSend_count(v258, v259, v260, v261, v262, v263);

      v270 = objc_msgSend_orderedStrokes(v85, v265, v266, v267, v268, v269);
      uint64_t v276 = objc_msgSend_count(v270, v271, v272, v273, v274, v275);

      double v236 = v238
           / (double)(unint64_t)(v264 - 1)
           / ((v245 + v252) / (double)(unint64_t)(v276 - 2) + 0.000001)
           + -1.0;
    }
    double v999 = v145 / minimumDrawingSize;
    double v1000 = v236;
    double v277 = fmax(v145 / minimumDrawingSize + -1.0, 0.0);
    if (v277 <= self->_writingDirectionMinCoeff) {
      double writingDirectionMinCoeff = self->_writingDirectionMinCoeff;
    }
    else {
      double writingDirectionMinCoeff = v277;
    }
    double writingDirectionUpperBound = self->_writingDirectionUpperBound;
    if (v236 < writingDirectionUpperBound) {
      double writingDirectionUpperBound = v236;
    }
    double v1002 = writingDirectionUpperBound;
    double writingDirectionWeight = self->_writingDirectionWeight;
    double v1004 = writingDirectionMinCoeff;
    if (v86)
    {
      *(void *)buf = 0;
      double v1024 = 0.0;
      objc_msgSend_groupBounds1(v85, v230, v231, v232, v233, v234);
      v284 = sub_1C4AD436C(v86, (double *)buf, &v1024, v280, v281, v282, v283);
      v1033[0] = 0.0;
      v1023[0] = 0.0;
      objc_msgSend_groupBounds2(v85, v285, v286, v287, v288, v289);
      v294 = sub_1C4AD436C(v86, v1033, v1023, v290, v291, v292, v293);
      v300 = v294;
      if (!v284 || !v294) {
        goto LABEL_66;
      }
      objc_msgSend_frame(v294, v295, v296, v297, v298, v299);
      double v301 = CGRectGetMinY(v1066);
      objc_msgSend_frame(v284, v302, v303, v304, v305, v306);
      if (v301 >= CGRectGetMaxY(v1067))
      {
        BOOL v318 = 1;
        if (v284 != v300) {
          goto LABEL_49;
        }
      }
      else
      {
        objc_msgSend_frame(v284, v307, v308, v309, v310, v311);
        double v312 = CGRectGetMinY(v1068);
        objc_msgSend_frame(v300, v313, v314, v315, v316, v317);
        BOOL v318 = v312 >= CGRectGetMaxY(v1069);
        if (v284 == v300) {
          goto LABEL_53;
        }
LABEL_49:
        if (v318)
        {
          objc_msgSend_groupBounds1(v85, v307, v308, v309, v310, v311);
          CGFloat v320 = v319;
          CGFloat v322 = v321;
          CGFloat v324 = v323;
          CGFloat v326 = v325;
          objc_msgSend_frame(v300, v327, v328, v329, v330, v331);
          v1074.origin.x = v332;
          v1074.origin.y = v333;
          v1074.size.width = v334;
          v1074.size.double height = v335;
          v1070.origin.x = v320;
          v1070.origin.y = v322;
          v1070.size.width = v324;
          v1070.size.double height = v326;
          CGRect v1071 = CGRectIntersection(v1070, v1074);
          double height = v1071.size.height;
          objc_msgSend_groupBounds2(v85, v337, v338, v339, v340, v341, v1071.origin.x, v1071.origin.y, v1071.size.width);
          CGFloat v343 = v342;
          CGFloat v345 = v344;
          CGFloat v347 = v346;
          CGFloat v349 = v348;
          objc_msgSend_frame(v284, v350, v351, v352, v353, v354);
          v1075.origin.x = v355;
          v1075.origin.y = v356;
          v1075.size.width = v357;
          v1075.size.double height = v358;
          v1072.origin.x = v343;
          v1072.origin.y = v345;
          v1072.size.width = v347;
          v1072.size.double height = v349;
          CGRect v1073 = CGRectIntersection(v1072, v1075);
          double v364 = v1073.size.height;
          double v365 = *(double *)buf;
          double v366 = v1033[0];
          if (*(double *)buf > 0.0 && v1033[0] > 0.0)
          {
            objc_msgSend_frame(v284, v359, v360, v361, v362, v363, v1073.origin.x, v1073.origin.y, v1073.size.width);
            double v368 = v367;
            double v1017 = v364;
            double v369 = height;
            objc_msgSend_groupBounds1(v85, v370, v371, v372, v373, v374);
            double v376 = v375;
            double v377 = v1033[0];
            objc_msgSend_frame(v300, v378, v379, v380, v381, v382);
            double v384 = v383;
            objc_msgSend_groupBounds2(v85, v385, v386, v387, v388, v389);
            double v391 = v390;
            objc_msgSend_frame(v300, v392, v393, v394, v395, v396);
            double v398 = v397;
            objc_msgSend_frame(v284, v399, v400, v401, v402, v403);
            double v235 = (v365 * v365 / (v368 * v376 + 0.000001) + v377 * v377 / (v384 * v391 + 0.000001))
                 * ((1.0 - v369 / v398)
                  * (1.0 - v1017 / v404));
LABEL_66:

            goto LABEL_67;
          }
          if (*(double *)buf <= 0.0)
          {
            double v235 = 0.0;
            if (v1033[0] <= 0.0) {
              goto LABEL_66;
            }
            objc_msgSend_frame(v300, v359, v360, v361, v362, v363, v1073.origin.x, v1073.origin.y, v1073.size.width);
            double v458 = v457;
            objc_msgSend_groupBounds2(v85, v459, v460, v461, v462, v463);
            double v465 = v464;
            objc_msgSend_frame(v284, v466, v467, v468, v469, v470);
            double v421 = v366 * v366 / (v458 * v465 + 0.000001);
            double v439 = v364 / v471;
          }
          else
          {
            objc_msgSend_frame(v284, v359, v360, v361, v362, v363, v1073.origin.x, v1073.origin.y, v1073.size.width);
            double v425 = v424;
            objc_msgSend_groupBounds1(v85, v426, v427, v428, v429, v430);
            double v432 = v431;
            objc_msgSend_frame(v300, v433, v434, v435, v436, v437);
            double v421 = v365 * v365 / (v425 * v432 + 0.000001);
            double v439 = height / v438;
          }
          double v423 = 1.0 - v439;
          goto LABEL_65;
        }
      }
LABEL_53:
      double v405 = *(double *)buf;
      if (*(double *)buf > 0.0 && v1033[0] > 0.0)
      {
        double v235 = 0.0;
        goto LABEL_66;
      }
      if (*(double *)buf <= 0.0)
      {
        double v235 = 0.0;
        if (v1033[0] <= 0.0) {
          goto LABEL_66;
        }
        double v440 = v1024;
        objc_msgSend_frame(v284, v307, v308, v309, v310, v311, v1033[0]);
        double v442 = v441;
        double v443 = v1033[0];
        objc_msgSend_frame(v300, v444, v445, v446, v447, v448);
        double v450 = v449;
        objc_msgSend_groupBounds2(v85, v451, v452, v453, v454, v455);
        double v421 = v440 / (v442 + 0.000001);
        double v423 = v443 * v443 / (v450 * v456 + 0.000001);
      }
      else
      {
        objc_msgSend_frame(v284, v307, v308, v309, v310, v311, v1033[0]);
        double v407 = v406;
        objc_msgSend_groupBounds1(v85, v408, v409, v410, v411, v412);
        double v414 = v413;
        double v415 = v1023[0];
        objc_msgSend_frame(v300, v416, v417, v418, v419, v420);
        double v421 = v405 * v405 / (v407 * v414 + 0.000001);
        double v423 = v415 / (v422 + 0.000001);
      }
LABEL_65:
      double v235 = v421 * v423;
      goto LABEL_66;
    }
LABEL_67:
    double targetFitnessWeight = self->_targetFitnessWeight;
    objc_msgSend_groupBounds1(v85, v230, v231, v232, v233, v234);
    double v474 = v473;
    objc_msgSend_groupBounds2(v85, v475, v476, v477, v478, v479);
    if (v474 >= v485) {
      objc_msgSend_groupBounds2(v85, v480, v481, v482, v483, v484);
    }
    else {
      objc_msgSend_groupBounds1(v85, v480, v481, v482, v483, v484);
    }
    double v492 = v491;
    objc_msgSend_groupBounds1(v85, v486, v487, v488, v489, v490);
    double v494 = v493;
    objc_msgSend_groupBounds2(v85, v495, v496, v497, v498, v499);
    if (v494 <= v505) {
      objc_msgSend_groupBounds2(v85, v500, v501, v502, v503, v504);
    }
    else {
      objc_msgSend_groupBounds1(v85, v500, v501, v502, v503, v504);
    }
    double v512 = v492 / (v511 + 0.000001);
    double v513 = fmin(v492 / minimumDrawingSize, 1.0);
    if (v512 >= v513) {
      double v514 = v513;
    }
    else {
      double v514 = v492 / (v511 + 0.000001);
    }
    if (v514 <= self->_minLineHeightScore) {
      double minLineHeightScore = self->_minLineHeightScore;
    }
    else {
      double minLineHeightScore = v514;
    }
    uint64_t v516 = objc_msgSend_substrokeCount1(v85, v506, v507, v508, v509, v510);
    double v1018 = 1.0;
    if ((double)(objc_msgSend_substrokeCount2(v85, v517, v518, v519, v520, v521) + v516) / self->_minSubstrokesForSplit < 1.0)
    {
      uint64_t v527 = objc_msgSend_substrokeCount1(v85, v522, v523, v524, v525, v526);
      double v1018 = (double)(objc_msgSend_substrokeCount2(v85, v528, v529, v530, v531, v532) + v527)
            / self->_minSubstrokesForSplit;
    }
    v533 = objc_msgSend_strokeGroup1(v85, v522, v523, v524, v525, v526);
    double v1016 = sub_1C4AD4654(v533, v87);

    v539 = objc_msgSend_strokeGroup2(v85, v534, v535, v536, v537, v538);
    double v540 = sub_1C4AD4654(v539, v87);

    uint64_t v546 = objc_msgSend_substrokeCount1(v85, v541, v542, v543, v544, v545);
    uint64_t v552 = objc_msgSend_substrokeCount2(v85, v547, v548, v549, v550, v551);
    v558 = objc_msgSend_strokeGroup2(v85, v553, v554, v555, v556, v557);
    uint64_t v564 = objc_msgSend_count(v558, v559, v560, v561, v562, v563);

    double v998 = v513;
    double v570 = v235;
    double arcLengthDiffScoreCoeff = self->_arcLengthDiffScoreCoeff;
    if (minimumDrawingSize * 0.5 <= self->_minimumDrawingSize) {
      double v572 = self->_minimumDrawingSize;
    }
    else {
      double v572 = minimumDrawingSize * 0.5;
    }
    double v578 = 1.0;
    if (self->_expectedSubstrokesPerLine > (double)objc_msgSend_substrokeCount1(v85, v565, v566, v567, v568, v569)) {
      double v578 = fmin(v1016 / v572, 1.0);
    }
    uint64_t v579 = objc_msgSend_substrokeCount2(v85, v573, v574, v575, v576, v577);
    double v580 = 1.0;
    if (self->_expectedSubstrokesPerLine > (double)v579) {
      double v580 = fmin(v540 / v572, 1.0);
    }
    double v581 = v578 * v580;
    if (v581 <= self->_minArcLengthScore) {
      double minArcLengthScore = self->_minArcLengthScore;
    }
    else {
      double minArcLengthScore = v581;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    double v583 = sqrt(minLineHeightScore);
    double v584 = fmin(v540/ (double)v552/ (v1016 / (double)v546 + 0.000001)* (v540/ (double)(unint64_t)v564/ (v540 / (double)v552 + 0.000001))* arcLengthDiffScoreCoeff, 1.0);
    double v75 = (v1013 * transitionTimeWeight
         + 0.0
         + v1011 / minimumDrawingSize * verticalDistanceWeight
         + v1008 * backTransitionWeight
         + fmax(v1009 / minimumDrawingSize - horizontalDistanceBarrier, 0.0) * horizontalDistanceWeight
         + v1002 * fmin(v1004, 1.0) * writingDirectionWeight
         + v570 * targetFitnessWeight)
        * (v583
         * v1018
         * v584
         * minArcLengthScore);
    v585 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v585, OS_LOG_TYPE_DEBUG))
    {
      v591 = objc_msgSend_strokeGroup1(v85, v586, v587, v588, v589, v590);
      uint64_t v597 = objc_msgSend_count(v591, v592, v593, v594, v595, v596);
      v603 = objc_msgSend_strokeGroup2(v85, v598, v599, v600, v601, v602);
      uint64_t v609 = objc_msgSend_count(v603, v604, v605, v606, v607, v608);
      objc_msgSend_transitionTime(v85, v610, v611, v612, v613, v614);
      *(_DWORD *)buf = 134221568;
      *(void *)&buf[4] = v597;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v609;
      *(_WORD *)&buf[22] = 2048;
      v1035 = *(__n128 (**)(__n128 *, __n128 *))&v75;
      *(_WORD *)v1036 = 2048;
      *(void *)&v1036[2] = v615;
      *(_WORD *)&v1036[10] = 2048;
      *(double *)&v1036[12] = v1011 / minimumDrawingSize;
      *(_WORD *)&v1036[20] = 2048;
      *(double *)&v1036[22] = v1009 / minimumDrawingSize;
      *(_WORD *)&v1036[30] = 2048;
      double v1037 = v1001;
      __int16 v1038 = 2048;
      double v1039 = v999;
      __int16 v1040 = 2048;
      double v1041 = v1000;
      __int16 v1042 = 2048;
      double v1043 = v570;
      __int16 v1044 = 2048;
      double v1045 = v512;
      __int16 v1046 = 2048;
      double v1047 = v998;
      __int16 v1048 = 2048;
      double v1049 = v1018;
      __int16 v1050 = 2048;
      double v1051 = v584;
      __int16 v1052 = 2048;
      double v1053 = minArcLengthScore;
      _os_log_impl(&dword_1C492D000, v585, OS_LOG_TYPE_DEBUG, "SPLIT %lu/%lu: TS=%.3f, TT=%.3f, VD=%.3f, HD=%.3f, BT=%.3f, AR=%.3f, WD=%.3f, TF=%.3f, HS=%.3f, MH=%.3f, SC=%.3f, ALD=%.3f, AL=%.3f", buf, 0x98u);
    }
    if (v75 <= v1014)
    {
      double v75 = v1014;
    }
    else
    {
      id v616 = v85;

      v997 = v616;
    }

    ++v74;
  }
  double v617 = v75;
  double splitCostThreshold = self->_splitCostThreshold;
  if (!v997)
  {
    if (v617 > splitCostThreshold) {
      goto LABEL_147;
    }
    v757 = objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(CHTopDownStrokeSplit, v76, (uint64_t)v1015, (uint64_t)v996, self->_writingOrientation, v80);
    goto LABEL_153;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v619 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v619, OS_LOG_TYPE_DEBUG))
  {
    v625 = objc_msgSend_strokeGroup1(v997, v620, v621, v622, v623, v624);
    uint64_t v631 = objc_msgSend_count(v625, v626, v627, v628, v629, v630);
    v637 = objc_msgSend_strokeGroup2(v997, v632, v633, v634, v635, v636);
    uint64_t v643 = objc_msgSend_count(v637, v638, v639, v640, v641, v642);
    double v644 = self->_splitCostThreshold;
    *(_DWORD *)buf = 134218752;
    *(void *)&buf[4] = v631;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v643;
    *(_WORD *)&buf[22] = 2048;
    v1035 = *(__n128 (**)(__n128 *, __n128 *))&v617;
    *(_WORD *)v1036 = 2048;
    *(double *)&v1036[2] = v644;
    _os_log_impl(&dword_1C492D000, v619, OS_LOG_TYPE_DEBUG, "Best split (%lu/%lu) has score %.3f, splitting threshold is %.3f", buf, 0x2Au);
  }
  if (v617 <= splitCostThreshold)
  {
    v758 = @"Low split score";
LABEL_148:
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v949 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v949, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v758;
      _os_log_impl(&dword_1C492D000, v949, OS_LOG_TYPE_DEBUG, "Best split not acceptable: %@", buf, 0xCu);
    }

    v757 = objc_msgSend_orderedStrokes(v997, v950, v951, v952, v953, v954);
LABEL_153:
    v912 = v757;
    v955 = sub_1C4AD385C(self, v757);
    v961 = objc_msgSend_strokeGroups(v994, v956, v957, v958, v959, v960);
    v940 = sub_1C4AD39DC(self, v1015, v955, v961, 1);

    objc_msgSend_addObject_(v992, v962, (uint64_t)v940, v963, v964, v965);
    objc_msgSend_addObject_(v993, v966, (uint64_t)v940, v967, v968, v969);
    goto LABEL_154;
  }
  id v645 = v997;
  id v646 = v995;
  v652 = objc_msgSend_strokeGroup2(v645, v647, v648, v649, v650, v651);
  BOOL v658 = objc_msgSend_count(v652, v653, v654, v655, v656, v657) == 1;

  if (!v658) {
    goto LABEL_109;
  }
  v664 = objc_msgSend_strokeGroup2(v645, v659, v660, v661, v662, v663);
  v670 = objc_msgSend_firstObject(v664, v665, v666, v667, v668, v669);

  objc_msgSend_endTimestamp(v670, v671, v672, v673, v674, v675);
  double v677 = v676;
  objc_msgSend_startTimestamp(v670, v678, v679, v680, v681, v682);
  double v688 = v677 - v687;
  if (v688 <= 0.2)
  {
    v759 = objc_msgSend_stringWithFormat_(NSString, v683, @"Second group with single too short stroke (time interval = %.3f, threshold = %.3f).", v684, v685, v686, *(void *)&v688, 0x3FC999999999999ALL);
LABEL_123:
    id v760 = v759;

    goto LABEL_124;
  }
  v689 = objc_opt_class();
  objc_msgSend_arcLengthForStroke_(v689, v690, (uint64_t)v670, v691, v692, v693);
  if (v698 <= 15.0)
  {
    v759 = objc_msgSend_stringWithFormat_(NSString, v694, @"Second group with single too short stroke (arc length = %.3f, threshold = %.3f).", v695, v696, v697, *(void *)&v698, 0x402E000000000000);
    goto LABEL_123;
  }

LABEL_109:
  v699 = objc_msgSend_strokeGroup2(v645, v659, v660, v661, v662, v663);
  BOOL v705 = (unint64_t)objc_msgSend_count(v699, v700, v701, v702, v703, v704) < 4;

  if (!v705)
  {
LABEL_137:
    v836 = objc_msgSend_strokeGroup1(v645, v706, v707, v708, v709, v710);
    if (objc_msgSend_count(v836, v837, v838, v839, v840, v841) == 1)
    {
      v847 = objc_msgSend_strokeGroup2(v645, v842, v843, v844, v845, v846);
      BOOL v853 = objc_msgSend_count(v847, v848, v849, v850, v851, v852) == 1;

      if (v853)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x4812000000;
        v1035 = sub_1C4AD4880;
        *(void *)v1036 = sub_1C4AD48A4;
        *(void *)&v1036[8] = &unk_1C4CB5C62;
        double v1037 = 0.0;
        *(void *)&v1036[16] = 0;
        *(void *)&v1036[24] = 0;
        v854 = objc_opt_class();
        v860 = objc_msgSend_strokeGroup1(v645, v855, v856, v857, v858, v859);
        v866 = objc_msgSend_firstObject(v860, v861, v862, v863, v864, v865);
        *(void *)&v1033[0] = MEMORY[0x1E4F143A8];
        *(void *)&v1033[1] = 3221225472;
        *(void *)&v1033[2] = sub_1C4AD48BC;
        *(void *)&v1033[3] = &unk_1E64E18B8;
        *(void *)&v1033[4] = buf;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v854, v867, (uint64_t)v866, 0, 1, (uint64_t)v1033);

        double v1024 = 0.0;
        v1025 = &v1024;
        uint64_t v1026 = 0x4812000000;
        v1027 = sub_1C4AD4880;
        v1028 = sub_1C4AD48A4;
        v1029 = &unk_1C4CB5C62;
        v1031 = 0;
        uint64_t v1032 = 0;
        __p = 0;
        v868 = objc_opt_class();
        v874 = objc_msgSend_strokeGroup2(v645, v869, v870, v871, v872, v873);
        v880 = objc_msgSend_firstObject(v874, v875, v876, v877, v878, v879);
        *(void *)&v1023[0] = MEMORY[0x1E4F143A8];
        *(void *)&v1023[1] = 3221225472;
        *(void *)&v1023[2] = sub_1C4AD49E4;
        *(void *)&v1023[3] = &unk_1E64E18B8;
        *(void *)&v1023[4] = &v1024;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v868, v881, (uint64_t)v880, 0, 1, (uint64_t)v1023);

        double v1022 = 0.0;
        v882 = objc_opt_class();
        objc_msgSend_lineOrientationForStrokePoints_error_(v882, v883, *(void *)&buf[8] + 48, (uint64_t)&v1022, v884, v885);
        double v887 = v886;
        double v1021 = 0.0;
        v888 = objc_opt_class();
        objc_msgSend_lineOrientationForStrokePoints_error_(v888, v889, (uint64_t)(v1025 + 6), (uint64_t)&v1021, v890, v891);
        id v760 = 0;
        int v761 = 1;
        if (v1022 < 1.0 && v1021 < 1.0)
        {
          if (vabdd_f64(v887, v896) >= 0.392699082)
          {
            id v760 = 0;
          }
          else
          {
            objc_msgSend_stringWithFormat_(NSString, v892, @"Two parallel lines (err1=%.3f, err2=%.3f, ori1=%.3f, ori2=%.3f).", v893, v894, v895, *(void *)&v1022, *(void *)&v1021, *(void *)&v887, *(void *)&v896, v986);
            id v760 = (id)objc_claimAutoreleasedReturnValue();
            int v761 = 0;
          }
        }
        _Block_object_dispose(&v1024, 8);
        if (__p)
        {
          v1031 = __p;
          operator delete(__p);
        }
        _Block_object_dispose(buf, 8);
        if (*(void *)&v1036[16])
        {
          *(void *)&v1036[24] = *(void *)&v1036[16];
          operator delete(*(void **)&v1036[16]);
        }
        goto LABEL_145;
      }
    }
    else
    {
    }
    id v760 = 0;
    int v761 = 1;
    goto LABEL_145;
  }
  v711 = objc_msgSend_strokeGroup2(v645, v706, v707, v708, v709, v710);
  v1020 = objc_msgSend_lastObject(v711, v712, v713, v714, v715, v716);

  if (objc_msgSend_isFinished(v1020, v717, v718, v719, v720, v721))
  {
LABEL_136:

    goto LABEL_137;
  }
  objc_msgSend_groupBounds1(v645, v722, v723, v724, v725, v726);
  double v728 = v727;
  objc_msgSend_groupBounds2(v645, v729, v730, v731, v732, v733);
  if (v728 <= v739) {
    objc_msgSend_groupBounds2(v645, v734, v735, v736, v737, v738);
  }
  else {
    objc_msgSend_groupBounds1(v645, v734, v735, v736, v737, v738);
  }
  double v762 = v745;
  double v763 = self->_minimumDrawingSize;
  if (v762 > v763)
  {
    objc_msgSend_groupBounds1(v645, v740, v741, v742, v743, v744);
    double v765 = v764;
    objc_msgSend_groupBounds2(v645, v766, v767, v768, v769, v770);
    if (v765 <= v776) {
      objc_msgSend_groupBounds2(v645, v771, v772, v773, v774, v775);
    }
    else {
      objc_msgSend_groupBounds1(v645, v771, v772, v773, v774, v775);
    }
  }
  uint64_t v777 = 0;
  double v778 = v763 * 4.0;
  while (1)
  {
    v779 = objc_msgSend_strokeGroup2(v645, v740, v741, v742, v743, v744);
    BOOL v785 = v777 < objc_msgSend_count(v779, v780, v781, v782, v783, v784) - 2;

    if (!v785) {
      break;
    }
    v791 = objc_msgSend_strokeGroup2(v645, v786, v787, v788, v789, v790);
    v796 = objc_msgSend_objectAtIndexedSubscript_(v791, v792, v777, v793, v794, v795);

    v802 = objc_msgSend_encodedStrokeIdentifier(v796, v797, v798, v799, v800, v801);
    v807 = objc_msgSend_objectForKeyedSubscript_(v646, v803, (uint64_t)v802, v804, v805, v806);

    if (v807)
    {
      objc_msgSend_doubleValue(v807, v808, v809, v810, v811, v812);
      double v814 = v813;
    }
    else
    {
      v815 = objc_opt_class();
      objc_msgSend_arcLengthForStroke_(v815, v816, (uint64_t)v796, v817, v818, v819);
      double v814 = v820;
      v826 = objc_msgSend_numberWithDouble_(NSNumber, v821, v822, v823, v824, v825);
      v832 = objc_msgSend_encodedStrokeIdentifier(v796, v827, v828, v829, v830, v831);
      objc_msgSend_setObject_forKeyedSubscript_(v646, v833, (uint64_t)v826, (uint64_t)v832, v834, v835);
    }
    ++v777;
    if (v814 > v778) {
      goto LABEL_136;
    }
  }
  v974 = NSString;
  v975 = objc_msgSend_strokeGroup2(v645, v786, v787, v788, v789, v790);
  uint64_t v981 = objc_msgSend_count(v975, v976, v977, v978, v979, v980);
  objc_msgSend_stringWithFormat_(v974, v982, @"Second group with an unfinished stroke and only a few (%li) other short strokes", v983, v984, v985, v981 - 1);
  id v760 = (id)objc_claimAutoreleasedReturnValue();

LABEL_124:
  int v761 = 0;
LABEL_145:

  v897 = (__CFString *)v760;
  v758 = v897;
  if (!v761) {
    goto LABEL_148;
  }

LABEL_147:
  v898 = objc_msgSend_strokeGroup1(v997, v76, v77, v78, v79, v80);
  v904 = objc_msgSend_orderedStrokesGroup1(v997, v899, v900, v901, v902, v903);
  v905 = sub_1C4AD385C(self, v904);
  v911 = objc_msgSend_strokeGroups(v994, v906, v907, v908, v909, v910);
  v912 = sub_1C4AD39DC(self, v898, v905, v911, 1);

  objc_msgSend_addObject_(v992, v913, (uint64_t)v912, v914, v915, v916);
  objc_msgSend_addObject_(v993, v917, (uint64_t)v912, v918, v919, v920);
  v926 = objc_msgSend_strokeGroup2(v997, v921, v922, v923, v924, v925);
  v932 = objc_msgSend_orderedStrokesGroup2(v997, v927, v928, v929, v930, v931);
  v933 = sub_1C4AD385C(self, v932);
  v939 = objc_msgSend_strokeGroups(v994, v934, v935, v936, v937, v938);
  v940 = sub_1C4AD39DC(self, v926, v933, v939, 0);

  objc_msgSend_addObject_(v992, v941, (uint64_t)v940, v942, v943, v944);
  objc_msgSend_addObject_(v993, v945, (uint64_t)v940, v946, v947, v948);
LABEL_154:

  v970 = [CHStrokeGroupingResult alloc];
  v756 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v970, v971, (uint64_t)v992, (uint64_t)v993, (uint64_t)v990, v972);

LABEL_155:
  return v756;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v98 = v15;
  uint64_t v96 = a7;
  if (self->_reorderStrokes && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_orderedStrokeIdentifiers(v15, v10, v11, v12, v13, v14);
    id v101 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokesForIdentifiers_(self, v16, (uint64_t)v101, v17, v18, v19);
  }
  else
  {
    uint64_t v20 = objc_msgSend_strokeIdentifiers(v15, v10, v11, v12, v13, v14);
    uint64_t v26 = objc_msgSend_allObjects(v20, v21, v22, v23, v24, v25);
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = sub_1C4AD4F58;
    v110[3] = &unk_1E64E1868;
    v110[4] = self;
    objc_msgSend_sortedArrayUsingComparator_(v26, v27, (uint64_t)v110, v28, v29, v30);
    id v101 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_strokesForIdentifiers_(self, v31, (uint64_t)v101, v32, v33, v34);
  v35 = };
  if (a5) {
    v36 = objc_alloc_init(CHDrawing);
  }
  else {
    v36 = 0;
  }
  uint64_t v37 = objc_alloc_init(CHDrawing);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obj = v35;
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v106, (uint64_t)v111, 16, v39, v35);
  if (v40)
  {
    uint64_t v41 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v107 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        uint64_t v44 = objc_opt_class();
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = sub_1C4AD5084;
        v103[3] = &unk_1E64E2E00;
        uint64_t v45 = v36;
        uint64_t v104 = v45;
        uint64_t v46 = v37;
        double v105 = v46;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v44, v47, (uint64_t)v43, 0, 1, (uint64_t)v103);
        if (v36)
        {
          objc_msgSend_endStroke(v45, v48, v49, v50, v51, v52);
          objc_msgSend_startTimestamp(v43, v53, v54, v55, v56, v57);
          objc_msgSend_addStartTime_(v45, v58, v59, v60, v61, v62);
          objc_msgSend_endTimestamp(v43, v63, v64, v65, v66, v67);
          objc_msgSend_addEndTime_(v45, v68, v69, v70, v71, v72);
        }
        objc_msgSend_endStroke(v46, v48, v49, v50, v51, v52);
        objc_msgSend_startTimestamp(v43, v73, v74, v75, v76, v77);
        objc_msgSend_addStartTime_(v46, v78, v79, v80, v81, v82);
        objc_msgSend_endTimestamp(v43, v83, v84, v85, v86, v87);
        objc_msgSend_addEndTime_(v46, v88, v89, v90, v91, v92);
      }
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v93, (uint64_t)&v106, (uint64_t)v111, 16, v94);
    }
    while (v40);
  }

  if (a5) {
    *a5 = v36;
  }
  if (a6) {
    *a6 = v101;
  }
  if (v96) {
    *uint64_t v96 = 1.0;
  }
  if (a8) {
    *a8 = 0;
  }

  return v37;
}

- (NSArray)textInputTargets
{
  return self->_textInputTargets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTargets, 0);
  objc_storeStrong((id *)&self->_strategyIdentifier, 0);
}

@end