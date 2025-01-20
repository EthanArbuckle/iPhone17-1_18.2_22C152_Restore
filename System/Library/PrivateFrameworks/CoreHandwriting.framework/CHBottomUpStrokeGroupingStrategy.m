@interface CHBottomUpStrokeGroupingStrategy
- (BOOL)isInlineContinuousMode;
- (BOOL)refineWritingOrientationAndResortSubstrokes:(id)a3 averageWritingOrientation:(CGVector *)a4;
- (CGVector)clippedWritingOrientation:(CGVector)a3;
- (CHBottomUpStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 defaultWritingOrientation:(int64_t)a4 locales:(id)a5 isInlineContinuousMode:(BOOL)a6 inlineContinuousModeTargets:(id)a7;
- (NSArray)textInputTargets;
- (double)relativeOverlapOfGroup:(id)a3 withGroup:(id)a4;
- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8;
- (id)regroupedStrokeGroup:(id)a3 fromResult:(id)a4 withAdversarialGroup:(id)a5 allSubstrokesByStrokeIdentifier:(id)a6 cancellationBlock:(id)a7;
- (id)strategyIdentifier;
- (id)strokeGroupFromStrokes:(id)a3 ancestorIdentifier:(int64_t)a4;
- (id)strokeGroupMergingGroup:(id)a3 withGroup:(id)a4;
- (id)tryRegroupingStrokesInGroup:(id)a3 substrokePlacementsByStrokeIdentifier:(id)a4 cancellationBlock:(id)a5;
- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8;
- (int64_t)compareDistanceInWritingSequenceOfStroke:(id)a3 andStroke:(id)a4 toReferenceStroke:(id)a5;
- (vector<CGPoint,)flippedCenters:(CHBottomUpStrokeGroupingStrategy *)self ofSubstrokes:(SEL)a3 maxStrokesGap:(const void *)a4 begnning:(id)a5;
- (void)estimateWritingDirectionAndSortSubstrokesAccordingly:(id *)a3 averageWritingOrientation:(CGVector *)a4 averageStrokeDeviation:(CGVector *)a5;
- (void)getMergingEndOfLineCost:(double *)a3 mergingEndOfLineStroke:(id *)a4 forStroke:(id)a5 consistingOfSubstrokes:(id)a6 toLineGroup:(id)a7;
- (void)getMergingMiddleOfLineCost:(double *)a3 mergingMiddleOfLineStroke:(id *)a4 forStroke:(id)a5 consistingOfSubstrokes:(id)a6 toLineGroup:(id)a7;
- (void)mergeGroupsPostProcessing:(id)a3 createdGroups:(id)a4 deletedGroups:(id)a5 availableGroupingStrategies:(id)a6 allowOppositeOrientations:(BOOL)a7 groupStatistics:(id)a8;
- (void)refineLocalWritingOrientationsForSubstrokes:(id)a3 useCoalescedCenter:(BOOL)a4;
- (void)smoothLocalWritingOrientations:(void *)a3;
- (void)sortSubstrokesByWritingDirection:(id)a3 averageWritingOrientation:(CGVector *)a4;
- (void)updateLocalStrokeDeviationsForSubstrokes:(id)a3 averageStrokeDeviation:(CGVector *)a4;
- (void)updateLocalWritingOrientationsForSubstrokes:(id)a3 useCoalescedCenter:(BOOL)a4;
@end

@implementation CHBottomUpStrokeGroupingStrategy

- (CHBottomUpStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 defaultWritingOrientation:(int64_t)a4 locales:(id)a5 isInlineContinuousMode:(BOOL)a6 inlineContinuousModeTargets:(id)a7
{
  BOOL v8 = a6;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v53 = a5;
  v51 = v12;
  id v52 = a7;
  v59.receiver = self;
  v59.super_class = (Class)CHBottomUpStrokeGroupingStrategy;
  v54 = [(CHStrokeGroupingStrategy *)&v59 initWithStrokeProvider:v12];
  if (v54)
  {
    if (a4 == 2)
    {
      long long v13 = xmmword_1C4C448D0;
      v14 = @"right-to-left";
      uint64_t v15 = 2;
    }
    else
    {
      if (a4 == 3)
      {
        long long v13 = xmmword_1C4C3A6A0;
        v14 = @"vertical";
      }
      else
      {
        long long v13 = xmmword_1C4C3A690;
        v14 = @"left-to-right";
      }
      uint64_t v15 = 1;
    }
    v54->_defaultOrientationVector = (CGVector)v13;
    v54->_textStrokeClassification = v15;
    v16 = NSString;
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    uint64_t v23 = objc_msgSend_stringWithFormat_(v16, v19, @"%@_%@", v20, v21, v22, v18, v14);
    strategyIdentifier = v54->_strategyIdentifier;
    v54->_strategyIdentifier = (NSString *)v23;

    v54->_isInlineContinuousMode = v8;
    objc_storeStrong((id *)&v54->_textInputTargets, a7);
    v54->_defaultDeviationVector = (CGVector)xmmword_1C4C44908;
    v54->_strokeDeviationCapCoeff = 2.0;
    v54->_groupingMergingCostThresh = 6.0;
    v54->_groupingMergingEndCostLowThresh = 3.0;
    v54->_groupingSimilarCostThresh = 0.8;
    v54->_groupingContextSize = 6;
    v54->_mergeEndDxCostCoeff = 1.0;
    v54->_mergeEndDyCostCoeff = 2.0;
    v54->_mergeEndBelowModifier = 1.2;
    v54->_mergeEndLeftModifier = 5.0;
    v54->_mergeMiddleDxCostCoeff = 2.0;
    v54->_mergeMiddleDyCostCoeff = 4.0;
    v54->_mergeMiddleBelowModifier = 2.0;
    v54->_splitMinimumStrokeCount = 4;
    v54->_splitMaxNaturalIndexDiffThreshold = 8;
    v54->_shouldLimitDefaultWritingOrientationDeviation = 0;
    v54->_shouldAdjustDeviationOfSmallGroups = 0;
    v54->_shouldCoalesceLastSubstrokes = 0;
    if (v8) {
      v54->_shouldLimitDefaultWritingOrientationDeviation = 1;
    }
    if (v53)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v25 = v53;
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v55, (uint64_t)v60, 16, v27);
      if (v32)
      {
        char v33 = 0;
        char v34 = 0;
        int v35 = 0;
        uint64_t v36 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v56 != v36) {
              objc_enumerationMutation(v25);
            }
            uint64_t v38 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            char shouldAdjustGroupingForLocale = objc_msgSend_shouldAdjustGroupingForLocale_(CHRecognizerConfiguration, v28, v38, v29, v30, v31);
            v34 |= shouldAdjustGroupingForLocale ^ 1;
            v33 |= shouldAdjustGroupingForLocale;
            v35 |= objc_msgSend_shouldAdjustGroupingHeuristicsForVeryComplexCharacters_(CHRecognizerConfiguration, v40, v38, v41, v42, v43);
          }
          uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v55, (uint64_t)v60, 16, v31);
        }
        while (v32);

        if (v33)
        {
          v54->_mergeEndDyCostCoeff = 1.8;
          v54->_mergeEndLeftModifier = 4.5;
          v54->_splitMinimumStrokeCount = 6;
          v54->_splitMaxNaturalIndexDiffThreshold = 10;
          if (v34) {
            goto LABEL_25;
          }
        }
        else if (v34)
        {
          goto LABEL_25;
        }
        v54->_shouldAdjustDeviationOfSmallGroups = 1;
        v54->_shouldCoalesceLastSubstrokes = 1;
        __asm { FMOV            V0.2D, #14.0 }
        v54->_defaultDeviationVector = _Q0;
        v54->_groupingContextSize = 15;
        v54->_mergeEndDyCostCoeff = 1.4;
        v54->_mergeEndLeftModifier = 3.8;
        v54->_mergeEndBelowModifier = 1.42;
        if (v35)
        {
          v54->_splitMinimumStrokeCount = 12;
          v54->_splitMaxNaturalIndexDiffThreshold = 16;
        }
      }
      else
      {

        v54->_shouldAdjustDeviationOfSmallGroups = 1;
        v54->_shouldCoalesceLastSubstrokes = 1;
        __asm { FMOV            V0.2D, #14.0 }
        v54->_defaultDeviationVector = _Q0;
        v54->_groupingContextSize = 15;
        v54->_mergeEndDyCostCoeff = 1.4;
        v54->_mergeEndLeftModifier = 3.8;
        v54->_mergeEndBelowModifier = 1.42;
      }
    }
  }
LABEL_25:

  return v54;
}

- (id)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  uint64_t v714 = *MEMORY[0x1E4F143B8];
  id v590 = a3;
  id v600 = a4;
  id v605 = a5;
  id v588 = a6;
  id v611 = a7;
  v591 = (uint64_t (**)(void))a8;
  v612 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v16, v17, v18);
  v610 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v19, v20, v21, v22, v23);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v693 = 0u;
    long long v694 = 0u;
    long long v695 = 0u;
    long long v696 = 0u;
    id obj = v590;
    char v34 = objc_msgSend_strokeGroups(obj, v29, v30, v31, v32, v33);
    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v693, (uint64_t)v713, 16, v36);
    if (v37)
    {
      uint64_t v38 = *(void *)v694;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v694 != v38) {
            objc_enumerationMutation(v34);
          }
          v40 = *(void **)(*((void *)&v693 + 1) + 8 * i);
          uint64_t v41 = objc_opt_class();
          uint64_t v47 = objc_msgSend_classification(v40, v42, v43, v44, v45, v46);
          if (objc_msgSend_isStrokeClassificationTextOrMath_(v41, v48, v47, v49, v50, v51)) {
            objc_msgSend_addObject_(v610, v52, (uint64_t)v40, v53, v54, v55);
          }
        }
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v52, (uint64_t)&v693, (uint64_t)v713, 16, v55);
      }
      while (v37);
    }

    uint64_t v61 = objc_msgSend_substrokePlacementsByStrokeIdentifier(obj, v56, v57, v58, v59, v60);
    objc_msgSend_addEntriesFromDictionary_(v612, v62, (uint64_t)v61, v63, v64, v65);
  }
  else
  {
    long long v692 = 0u;
    long long v691 = 0u;
    long long v690 = 0u;
    long long v689 = 0u;
    objc_msgSend_strokeGroups(v590, v24, v25, v26, v27, v28);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v689, (uint64_t)v712, 16, v67);
    if (v68)
    {
      uint64_t v598 = v68;
      id v602 = *(id *)v690;
      do
      {
        for (uint64_t j = 0; j != v598; ++j)
        {
          if (*(id *)v690 != v602) {
            objc_enumerationMutation(obj);
          }
          v71 = *(void **)(*((void *)&v689 + 1) + 8 * j);
          v72 = objc_opt_class();
          uint64_t v78 = objc_msgSend_classification(v71, v73, v74, v75, v76, v77);
          if (objc_msgSend_isStrokeClassificationTextOrMath_(v72, v79, v78, v80, v81, v82))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend_addObject_(v610, v83, (uint64_t)v71, v85, v86, v87);
            }
            else
            {
              v93 = objc_msgSend_strokeIdentifiers(v71, v83, v84, v85, v86, v87);
              v99 = objc_msgSend_allObjects(v93, v94, v95, v96, v97, v98);
              v105 = objc_msgSend_strokeProvider(self, v100, v101, v102, v103, v104);
              v109 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v106, (uint64_t)v99, (uint64_t)v105, v107, v108);

              uint64_t v115 = objc_msgSend_ancestorIdentifier(v71, v110, v111, v112, v113, v114);
              v119 = objc_msgSend_strokeGroupFromStrokes_ancestorIdentifier_(self, v116, (uint64_t)v109, v115, v117, v118);
              objc_msgSend_addObject_(v610, v120, (uint64_t)v119, v121, v122, v123);
            }
            long long v688 = 0u;
            long long v687 = 0u;
            long long v686 = 0u;
            long long v685 = 0u;
            v124 = objc_msgSend_strokeIdentifiers(v71, v88, v89, v90, v91, v92);
            id v615 = v124;
            uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v685, (uint64_t)v711, 16, v126);
            if (v127)
            {
              uint64_t v620 = *(void *)v686;
              do
              {
                uint64_t v625 = v127;
                for (uint64_t k = 0; k != v625; ++k)
                {
                  if (*(void *)v686 != v620) {
                    objc_enumerationMutation(v615);
                  }
                  uint64_t v134 = *(void *)(*((void *)&v685 + 1) + 8 * k);
                  v135 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v128, v129, v130, v131, v132);
                  long long v684 = 0u;
                  long long v683 = 0u;
                  long long v681 = 0u;
                  long long v682 = 0u;
                  uint64_t v631 = v134;
                  v140 = objc_msgSend_objectForKey_(v611, v136, v134, v137, v138, v139);
                  uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v141, (uint64_t)&v681, (uint64_t)v710, 16, v142);
                  if (v143)
                  {
                    uint64_t v144 = *(void *)v682;
                    do
                    {
                      for (uint64_t m = 0; m != v143; ++m)
                      {
                        if (*(void *)v682 != v144) {
                          objc_enumerationMutation(v140);
                        }
                        uint64_t v146 = *(void *)(*((void *)&v681 + 1) + 8 * m);
                        v147 = [CHSubstrokePlacement alloc];
                        v152 = objc_msgSend_initWithSubstroke_(v147, v148, v146, v149, v150, v151);
                        objc_msgSend_setWritingOrientation_(v152, v153, v154, v155, v156, v157, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
                        objc_msgSend_addObject_(v135, v158, (uint64_t)v152, v159, v160, v161);
                      }
                      uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v162, (uint64_t)&v681, (uint64_t)v710, 16, v163);
                    }
                    while (v143);
                  }

                  objc_msgSend_setObject_forKey_(v612, v164, (uint64_t)v135, v631, v165, v166);
                }
                v124 = v615;
                uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v615, v128, (uint64_t)&v685, (uint64_t)v711, 16, v132);
              }
              while (v127);
            }
          }
        }
        uint64_t v598 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v69, (uint64_t)&v689, (uint64_t)v712, 16, v70);
      }
      while (v598);
    }
  }

  v172 = objc_msgSend_strokeProvider(self, v167, v168, v169, v170, v171);
  if (!v172)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v173 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v173, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v173, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }
  }
  long long v679 = 0u;
  long long v680 = 0u;
  long long v677 = 0u;
  long long v678 = 0u;
  id v601 = v600;
  uint64_t v621 = objc_msgSend_countByEnumeratingWithState_objects_count_(v601, v174, (uint64_t)&v677, (uint64_t)v709, 16, v175);
  if (v621)
  {
    id v616 = *(id *)v678;
    do
    {
      for (uint64_t n = 0; n != v621; ++n)
      {
        if (*(id *)v678 != v616) {
          objc_enumerationMutation(v601);
        }
        v181 = *(void **)(*((void *)&v677 + 1) + 8 * n);
        v182 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v176, v177, v178, v179, v180);
        long long v675 = 0u;
        long long v676 = 0u;
        long long v673 = 0u;
        long long v674 = 0u;
        v626 = v181;
        v188 = objc_msgSend_encodedStrokeIdentifier(v181, v183, v184, v185, v186, v187);
        v193 = objc_msgSend_objectForKey_(v611, v189, (uint64_t)v188, v190, v191, v192);

        uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v194, (uint64_t)&v673, (uint64_t)v708, 16, v195);
        if (v196)
        {
          uint64_t v197 = *(void *)v674;
          do
          {
            for (iuint64_t i = 0; ii != v196; ++ii)
            {
              if (*(void *)v674 != v197) {
                objc_enumerationMutation(v193);
              }
              uint64_t v199 = *(void *)(*((void *)&v673 + 1) + 8 * ii);
              v200 = [CHSubstrokePlacement alloc];
              v205 = objc_msgSend_initWithSubstroke_(v200, v201, v199, v202, v203, v204);
              objc_msgSend_setWritingOrientation_(v205, v206, v207, v208, v209, v210, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
              objc_msgSend_addObject_(v182, v211, (uint64_t)v205, v212, v213, v214);
            }
            uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v215, (uint64_t)&v673, (uint64_t)v708, 16, v216);
          }
          while (v196);
        }

        v222 = objc_msgSend_encodedStrokeIdentifier(v626, v217, v218, v219, v220, v221);
        objc_msgSend_setObject_forKey_(v612, v223, (uint64_t)v182, (uint64_t)v222, v224, v225);
      }
      uint64_t v621 = objc_msgSend_countByEnumeratingWithState_objects_count_(v601, v176, (uint64_t)&v677, (uint64_t)v709, 16, v180);
    }
    while (v621);
  }

  objc_msgSend_set(MEMORY[0x1E4F1CA80], v226, v227, v228, v229, v230);
  id v589 = (id)objc_claimAutoreleasedReturnValue();
  v597 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v231, v232, v233, v234, v235);
  v599 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v236, v237, v238, v239, v240);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v241 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG))
  {
    v247 = objc_msgSend_strategyIdentifier(self, v242, v243, v244, v245, v246);
    uint64_t v253 = objc_msgSend_count(v601, v248, v249, v250, v251, v252);
    uint64_t v259 = objc_msgSend_count(v605, v254, v255, v256, v257, v258);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v247;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v253;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v707 = v259;
    _os_log_impl(&dword_1C492D000, v241, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);
  }
  if (objc_msgSend_count(v605, v260, v261, v262, v263, v264))
  {
    long long v671 = 0u;
    long long v672 = 0u;
    long long v669 = 0u;
    long long v670 = 0u;
    id v270 = v605;
    uint64_t v277 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v271, (uint64_t)&v669, (uint64_t)v705, 16, v272);
    if (v277)
    {
      uint64_t v278 = *(void *)v670;
      do
      {
        for (uint64_t jj = 0; jj != v277; ++jj)
        {
          if (*(void *)v670 != v278) {
            objc_enumerationMutation(v270);
          }
          objc_msgSend_removeObjectForKey_(v612, v273, *(void *)(*((void *)&v669 + 1) + 8 * jj), v274, v275, v276);
        }
        uint64_t v277 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v273, (uint64_t)&v669, (uint64_t)v705, 16, v276);
      }
      while (v277);
    }
  }
  v280 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v265, v266, v267, v268, v269);
  v633 = v280;
  objc_msgSend_addObjectsFromArray_(v280, v281, (uint64_t)v601, v282, v283, v284);
  v614 = objc_msgSend_mutableCopy(v588, v285, v286, v287, v288, v289);
  char v603 = 0;
  do
  {
    if (v591[2]()) {
      break;
    }
    id v594 = (id)objc_msgSend_count(v614, v290, v291, v292, v293, v294);
    long long v667 = 0u;
    long long v668 = 0u;
    long long v665 = 0u;
    long long v666 = 0u;
    id obja = v610;
    uint64_t v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v295, (uint64_t)&v665, (uint64_t)v704, 16, v296);
    if (v297)
    {
      id v617 = *(id *)v666;
      do
      {
        uint64_t v622 = v297;
        for (kuint64_t k = 0; kk != v622; ++kk)
        {
          if (*(id *)v666 != v617) {
            objc_enumerationMutation(obja);
          }
          v304 = *(void **)(*((void *)&v665 + 1) + 8 * kk);
          v305 = objc_msgSend_strokeIdentifiers(v304, v298, v299, v300, v301, v302);
          char isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v305, v306, (uint64_t)v614, v307, v308, v309);

          if ((isSubsetOfSet & 1) == 0)
          {
            v311 = objc_msgSend_strokeIdentifiers(v304, v298, v299, v300, v301, v302);
            objc_msgSend_minusSet_(v614, v312, (uint64_t)v311, v313, v314, v315);

            v316 = (void *)MEMORY[0x1E4F1CA80];
            v322 = objc_msgSend_strokeIdentifiers(v304, v317, v318, v319, v320, v321);
            v627 = objc_msgSend_setWithSet_(v316, v323, (uint64_t)v322, v324, v325, v326);

            objc_msgSend_minusSet_(v627, v327, (uint64_t)v605, v328, v329, v330);
            long long v663 = 0u;
            long long v664 = 0u;
            long long v661 = 0u;
            long long v662 = 0u;
            id v331 = v627;
            uint64_t v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v331, v332, (uint64_t)&v661, (uint64_t)v703, 16, v333);
            if (v334)
            {
              uint64_t v335 = *(void *)v662;
              do
              {
                for (muint64_t m = 0; mm != v334; ++mm)
                {
                  if (*(void *)v662 != v335) {
                    objc_enumerationMutation(v331);
                  }
                  uint64_t v337 = *(void *)(*((void *)&v661 + 1) + 8 * mm);
                  v338 = objc_opt_class();
                  v346 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v338, v339, v337, (uint64_t)v172, v340, v341);
                  if (v346) {
                    objc_msgSend_addObject_(v633, v342, (uint64_t)v346, v343, v344, v345);
                  }
                }
                uint64_t v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v331, v347, (uint64_t)&v661, (uint64_t)v703, 16, v348);
              }
              while (v334);
            }

            uint64_t v354 = objc_msgSend_count(v331, v349, v350, v351, v352, v353);
            v360 = objc_msgSend_strokeIdentifiers(v304, v355, v356, v357, v358, v359);
            BOOL v366 = v354 == objc_msgSend_count(v360, v361, v362, v363, v364, v365);

            if (v366)
            {
              objc_msgSend_addObject_(v599, v367, (uint64_t)v304, v368, v369, v370);
            }
            else
            {
              objc_msgSend_addObject_(v597, v367, (uint64_t)v304, v368, v369, v370);
              v603 |= objc_msgSend_count(v331, v371, v372, v373, v374, v375) != 0;
            }
          }
        }
        uint64_t v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v298, (uint64_t)&v665, (uint64_t)v704, 16, v302);
      }
      while (v297);
    }

    v280 = v633;
  }
  while ((id)objc_msgSend_count(v614, v376, v377, v378, v379, v380) != v594);
  if (objc_msgSend_count(v601, v290, v291, v292, v293, v294))
  {
    v628 = objc_msgSend_firstObject(v601, v381, v382, v383, v384, v385);
    long long v659 = 0u;
    long long v660 = 0u;
    long long v657 = 0u;
    long long v658 = 0u;
    id v386 = v280;
    char v389 = 0;
    uint64_t v394 = objc_msgSend_countByEnumeratingWithState_objects_count_(v386, v387, (uint64_t)&v657, (uint64_t)v702, 16, v388);
    if (v394)
    {
      uint64_t v395 = *(void *)v658;
      do
      {
        for (uint64_t nn = 0; nn != v394; ++nn)
        {
          if (*(void *)v658 != v395) {
            objc_enumerationMutation(v386);
          }
          v397 = *(void **)(*((void *)&v657 + 1) + 8 * nn);
          if ((objc_msgSend_containsObject_(v601, v390, (uint64_t)v397, v391, v392, v393) & 1) == 0)
          {
            v399 = objc_msgSend_strokeIdentifier(v397, v390, v398, v391, v392, v393);
            v405 = objc_msgSend_strokeIdentifier(v628, v400, v401, v402, v403, v404);
            BOOL v409 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v172, v406, (uint64_t)v399, (uint64_t)v405, v407, v408) == -1;

            if (v409) {
              char v389 = 1;
            }
          }
        }
        uint64_t v394 = objc_msgSend_countByEnumeratingWithState_objects_count_(v386, v390, (uint64_t)&v657, (uint64_t)v702, 16, v393);
      }
      while (v394);
    }

    char v410 = v389 & 1;
  }
  else
  {
    char v410 = 0;
  }
  unint64_t v411 = objc_msgSend_count(v633, v381, v382, v383, v384, v385);
  unsigned __int8 v422 = v603 | v410;
  if (((v411 > objc_msgSend_count(v601, v412, v413, v414, v415, v416)) & v422) == 1)
  {
    v423 = objc_msgSend_allObjects(v633, v417, v418, v419, v420, v421);
    unsigned __int8 v424 = v422;
    v655[0] = MEMORY[0x1E4F143A8];
    v655[1] = 3221225472;
    v655[2] = sub_1C4BBEAF8;
    v655[3] = &unk_1E64E1E28;
    id v656 = v172;
    uint64_t v429 = objc_msgSend_sortedArrayUsingComparator_(v423, v425, (uint64_t)v655, v426, v427, v428);

    id v601 = (id)v429;
    unsigned __int8 v422 = v424;
  }
  if (v422) {
    objc_msgSend_minusSet_(v610, v417, (uint64_t)v599, v419, v420, v421);
  }
  objc_msgSend_minusSet_(v610, v417, (uint64_t)v597, v419, v420, v421);
  v435 = objc_msgSend_mutableCopy(v597, v430, v431, v432, v433, v434);
  unsigned __int8 v583 = v422;
  objc_msgSend_unionSet_(v435, v436, (uint64_t)v599, v437, v438, v439);
  v585 = v435;
  *(void *)&buf[16] = 0;
  *(void *)&buf[8] = 0;
  *(void *)buf = &buf[8];
  long long v651 = 0u;
  long long v652 = 0u;
  long long v653 = 0u;
  long long v654 = 0u;
  id v604 = v610;
  uint64_t v442 = objc_msgSend_countByEnumeratingWithState_objects_count_(v604, v440, (uint64_t)&v651, (uint64_t)v701, 16, v441);
  if (v442)
  {
    uint64_t v592 = *(void *)v652;
    do
    {
      v443 = 0;
      v595 = (char *)v442;
      do
      {
        if (*(void *)v652 != v592) {
          objc_enumerationMutation(v604);
        }
        objb = v443;
        v629 = *(void **)(*((void *)&v651 + 1) + 8 * (void)v443);
        long long v647 = 0u;
        long long v648 = 0u;
        long long v649 = 0u;
        long long v650 = 0u;
        id v618 = v604;
        uint64_t v451 = objc_msgSend_countByEnumeratingWithState_objects_count_(v618, v444, (uint64_t)&v647, (uint64_t)v700, 16, v445);
        if (v451)
        {
          uint64_t v623 = *(void *)v648;
          do
          {
            uint64_t v452 = 0;
            do
            {
              if (*(void *)v648 != v623) {
                objc_enumerationMutation(v618);
              }
              v453 = *(void **)(*((void *)&v647 + 1) + 8 * v452);
              uint64_t v454 = objc_msgSend_uniqueIdentifier(v629, v446, v447, v448, v449, v450);
              uint64_t v460 = objc_msgSend_uniqueIdentifier(v453, v455, v456, v457, v458, v459);
              uint64_t v461 = v460;
              v462 = *(void **)&buf[8];
              v463 = &buf[8];
              v464 = &buf[8];
              if (!*(void *)&buf[8]) {
                goto LABEL_133;
              }
              do
              {
                while (1)
                {
                  v464 = v462;
                  uint64_t v465 = v462[4];
                  if (v454 >= v465)
                  {
                    if (v465 < v454) {
                      goto LABEL_131;
                    }
                    uint64_t v466 = v464[5];
                    if (v460 >= v466) {
                      break;
                    }
                  }
                  v462 = (void *)*v464;
                  v463 = v464;
                  if (!*v464) {
                    goto LABEL_133;
                  }
                }
                if (v466 >= v460) {
                  goto LABEL_158;
                }
LABEL_131:
                v462 = (void *)v464[1];
              }
              while (v462);
              v463 = v464 + 1;
LABEL_133:
              v467 = operator new(0x30uLL);
              v467[4] = v454;
              v467[5] = v461;
              void *v467 = 0;
              v467[1] = 0;
              v467[2] = v464;
              void *v463 = v467;
              if (**(void **)buf)
              {
                *(void *)buf = **(void **)buf;
                v467 = (void *)*v463;
              }
              v468 = *(unsigned char **)&buf[8];
              BOOL v469 = v467 == *(void **)&buf[8];
              *((unsigned char *)v467 + 24) = v467 == *(void **)&buf[8];
              if (!v469)
              {
                do
                {
                  uint64_t v470 = v467[2];
                  if (*(unsigned char *)(v470 + 24)) {
                    break;
                  }
                  v471 = *(unsigned char **)(v470 + 16);
                  uint64_t v472 = *(void *)v471;
                  if (*(void *)v471 == v470)
                  {
                    uint64_t v475 = *((void *)v471 + 1);
                    if (!v475 || (int v476 = *(unsigned __int8 *)(v475 + 24), v473 = (unsigned char *)(v475 + 24), v476))
                    {
                      if (*(void **)v470 == v467)
                      {
                        *(unsigned char *)(v470 + 24) = 1;
                        v471[24] = 0;
                        uint64_t v479 = *(void *)(v470 + 8);
                        *(void *)v471 = v479;
                        if (v479) {
                          goto LABEL_150;
                        }
                      }
                      else
                      {
                        v477 = *(uint64_t **)(v470 + 8);
                        uint64_t v478 = *v477;
                        *(void *)(v470 + 8) = *v477;
                        if (v478)
                        {
                          *(void *)(v478 + 16) = v470;
                          v471 = *(unsigned char **)(v470 + 16);
                        }
                        v477[2] = (uint64_t)v471;
                        *(void *)(*(void *)(v470 + 16) + 8 * (**(void **)(v470 + 16) != v470)) = v477;
                        uint64_t *v477 = v470;
                        *(void *)(v470 + 16) = v477;
                        v471 = (unsigned char *)v477[2];
                        uint64_t v470 = *(void *)v471;
                        *((unsigned char *)v477 + 24) = 1;
                        v471[24] = 0;
                        uint64_t v479 = *(void *)(v470 + 8);
                        *(void *)v471 = v479;
                        if (v479) {
LABEL_150:
                        }
                          *(void *)(v479 + 16) = v471;
                      }
                      *(void *)(v470 + 16) = *((void *)v471 + 2);
                      *(void *)(*((void *)v471 + 2) + 8 * (**((void **)v471 + 2) != (void)v471)) = v470;
                      *(void *)(v470 + 8) = v471;
LABEL_156:
                      *((void *)v471 + 2) = v470;
                      break;
                    }
                  }
                  else if (!v472 || (int v474 = *(unsigned __int8 *)(v472 + 24), v473 = (unsigned char *)(v472 + 24), v474))
                  {
                    if (*(void **)v470 == v467)
                    {
                      uint64_t v481 = v467[1];
                      *(void *)uint64_t v470 = v481;
                      if (v481)
                      {
                        *(void *)(v481 + 16) = v470;
                        v471 = *(unsigned char **)(v470 + 16);
                      }
                      v467[2] = v471;
                      *(void *)(*(void *)(v470 + 16) + 8 * (**(void **)(v470 + 16) != v470)) = v467;
                      v467[1] = v470;
                      *(void *)(v470 + 16) = v467;
                      v471 = (unsigned char *)v467[2];
                      *((unsigned char *)v467 + 24) = 1;
                      v471[24] = 0;
                      uint64_t v470 = *((void *)v471 + 1);
                      v480 = *(void **)v470;
                      *((void *)v471 + 1) = *(void *)v470;
                      if (v480) {
LABEL_154:
                      }
                        v480[2] = v471;
                    }
                    else
                    {
                      *(unsigned char *)(v470 + 24) = 1;
                      v471[24] = 0;
                      uint64_t v470 = *((void *)v471 + 1);
                      v480 = *(void **)v470;
                      *((void *)v471 + 1) = *(void *)v470;
                      if (v480) {
                        goto LABEL_154;
                      }
                    }
                    *(void *)(v470 + 16) = *((void *)v471 + 2);
                    *(void *)(*((void *)v471 + 2) + 8 * (**((void **)v471 + 2) != (void)v471)) = v470;
                    *(void *)uint64_t v470 = v471;
                    goto LABEL_156;
                  }
                  *(unsigned char *)(v470 + 24) = 1;
                  v467 = v471;
                  v471[24] = v471 == v468;
                  unsigned char *v473 = 1;
                }
                while (v471 != v468);
              }
              ++*(void *)&buf[16];
LABEL_158:
              ++v452;
            }
            while (v452 != v451);
            uint64_t v482 = objc_msgSend_countByEnumeratingWithState_objects_count_(v618, v446, (uint64_t)&v647, (uint64_t)v700, 16, v450);
            uint64_t v451 = v482;
          }
          while (v482);
        }

        v443 = objb + 1;
      }
      while (objb + 1 != v595);
      uint64_t v442 = objc_msgSend_countByEnumeratingWithState_objects_count_(v618, v483, (uint64_t)&v651, (uint64_t)v701, 16, v484);
    }
    while (v442);
  }

  v593 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v485, v486, v487, v488, v489);
  long long v645 = 0u;
  long long v646 = 0u;
  long long v643 = 0u;
  long long v644 = 0u;
  id v584 = v601;
  id v492 = 0;
  uint64_t v493 = objc_msgSend_countByEnumeratingWithState_objects_count_(v584, v490, (uint64_t)&v643, (uint64_t)v699, 16, v491);
  if (v493)
  {
    uint64_t v494 = *(void *)v644;
    while (2)
    {
      uint64_t v495 = 0;
      v496 = v492;
      do
      {
        if (*(void *)v644 != v494) {
          objc_enumerationMutation(v584);
        }
        v497 = *(void **)(*((void *)&v643 + 1) + 8 * v495);
        if (v591[2]())
        {
          id v492 = v496;
          goto LABEL_183;
        }
        v498 = (void *)MEMORY[0x1C8786C20]();
        id v642 = 0;
        sub_1C4BBEBA4((uint64_t)self, v604, v589, v597, v497, 0, v612, v585, 1, v496, &v642, v591);
        id v499 = v642;
        v500 = NSNumber;
        uint64_t v506 = objc_msgSend_uniqueIdentifier(v499, v501, v502, v503, v504, v505);
        v511 = objc_msgSend_numberWithInteger_(v500, v507, v506, v508, v509, v510);
        objc_msgSend_removeObjectForKey_(v593, v512, (uint64_t)v511, v513, v514, v515);

        sub_1C4BC08D4((uint64_t)self, v604, v589, v597, 0, 0, (uint64_t **)buf, v593);
        if (v499 && objc_msgSend_containsObject_(v604, v516, (uint64_t)v499, v517, v518, v519)) {
          id v586 = v499;
        }
        else {
          id v586 = 0;
        }

        id v492 = v586;
        ++v495;
        v496 = v586;
      }
      while (v493 != v495);
      uint64_t v493 = objc_msgSend_countByEnumeratingWithState_objects_count_(v584, v520, (uint64_t)&v643, (uint64_t)v699, 16, v521);
      if (v493) {
        continue;
      }
      break;
    }
  }
LABEL_183:
  v587 = v492;

  if ((v583 & 1) != 0 && objc_msgSend_count(v599, v522, v523, v524, v525, v526) && (v591[2]() & 1) == 0)
  {
    objc_msgSend_set(MEMORY[0x1E4F1CA80], v527, v528, v529, v530, v531);
    id objc = (id)objc_claimAutoreleasedReturnValue();
    long long v640 = 0u;
    long long v641 = 0u;
    long long v638 = 0u;
    long long v639 = 0u;
    id v596 = v589;
    uint64_t v624 = objc_msgSend_countByEnumeratingWithState_objects_count_(v596, v532, (uint64_t)&v638, (uint64_t)v698, 16, v533);
    if (v624)
    {
      id v619 = *(id *)v639;
      do
      {
        for (uint64_t i1 = 0; i1 != v624; ++i1)
        {
          if (*(id *)v639 != v619) {
            objc_enumerationMutation(v596);
          }
          v534 = *(void **)(*((void *)&v638 + 1) + 8 * i1);
          long long v634 = 0u;
          long long v635 = 0u;
          long long v636 = 0u;
          long long v637 = 0u;
          id v535 = v599;
          uint64_t v543 = objc_msgSend_countByEnumeratingWithState_objects_count_(v535, v536, (uint64_t)&v634, (uint64_t)v697, 16, v537);
          if (v543)
          {
            uint64_t v544 = *(void *)v635;
LABEL_193:
            uint64_t v545 = 0;
            while (1)
            {
              if (*(void *)v635 != v544) {
                objc_enumerationMutation(v535);
              }
              v546 = *(void **)(*((void *)&v634 + 1) + 8 * v545);
              v547 = objc_msgSend_strokeIdentifiers(v534, v538, v539, v540, v541, v542);
              v553 = objc_msgSend_strokeIdentifiers(v546, v548, v549, v550, v551, v552);
              int isEqualToSet = objc_msgSend_isEqualToSet_(v547, v554, (uint64_t)v553, v555, v556, v557);

              if (isEqualToSet) {
                break;
              }
              if (v543 == ++v545)
              {
                uint64_t v543 = objc_msgSend_countByEnumeratingWithState_objects_count_(v535, v538, (uint64_t)&v634, (uint64_t)v697, 16, v542);
                if (v543) {
                  goto LABEL_193;
                }
                goto LABEL_199;
              }
            }
            id v563 = v546;
            objc_msgSend_removeObject_(v604, v564, (uint64_t)v534, v565, v566, v567);
            objc_msgSend_addObject_(v604, v568, (uint64_t)v563, v569, v570, v571);

            if (!v563) {
              goto LABEL_202;
            }
            objc_msgSend_removeObject_(v535, v559, (uint64_t)v563, v560, v561, v562);
          }
          else
          {
LABEL_199:

LABEL_202:
            id v563 = 0;
            objc_msgSend_addObject_(objc, v559, (uint64_t)v534, v560, v561, v562);
          }
        }
        uint64_t v624 = objc_msgSend_countByEnumeratingWithState_objects_count_(v596, v572, (uint64_t)&v638, (uint64_t)v698, 16, v573);
      }
      while (v624);
    }

    id v589 = objc;
    objc_msgSend_unionSet_(v597, v574, (uint64_t)v599, v575, v576, v577);
  }
  if (v591[2]())
  {
    v578 = 0;
  }
  else
  {
    v579 = [CHBottomUpStrokeGroupingResult alloc];
    v578 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v579, v580, (uint64_t)v604, (uint64_t)v589, (uint64_t)v597, (uint64_t)v612);
  }
  id v581 = v578;

  sub_1C49A1374(*(void **)&buf[8]);
  return v581;
}

- (id)strokeGroupFromStrokes:(id)a3 ancestorIdentifier:(int64_t)a4
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v145 = a3;
  v11 = objc_msgSend_firstObject(v145, v6, v7, v8, v9, v10);
  uint64_t v143 = objc_msgSend_encodedStrokeIdentifier(v11, v12, v13, v14, v15, v16);

  uint64_t v22 = objc_msgSend_lastObject(v145, v17, v18, v19, v20, v21);
  uint64_t v144 = objc_msgSend_encodedStrokeIdentifier(v22, v23, v24, v25, v26, v27);
  int64_t v142 = a4;

  uint64_t v28 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v34 = objc_msgSend_count(v145, v29, v30, v31, v32, v33);
  v148 = objc_msgSend_setWithCapacity_(v28, v35, v34, v36, v37, v38);
  uint64_t v44 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v39, v40, v41, v42, v43);
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id obj = v145;
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v162, (uint64_t)v167, 16, v50);
  if (v51)
  {
    uint64_t v149 = v51;
    uint64_t v147 = *(void *)v163;
    do
    {
      for (uint64_t i = 0; i != v149; ++i)
      {
        if (*(void *)v163 != v147) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = *(void **)(*((void *)&v162 + 1) + 8 * i);
        uint64_t v58 = objc_msgSend_encodedStrokeIdentifier(v57, v52, v53, v54, v55, v56);
        objc_msgSend_addObject_(v148, v59, (uint64_t)v58, v60, v61, v62);

        uint64_t v63 = objc_opt_class();
        uint64_t v68 = objc_msgSend_substrokesForStroke_(v63, v64, (uint64_t)v57, v65, v66, v67);
        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        id v69 = v68;
        uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v158, (uint64_t)v166, 16, v71);
        if (v72)
        {
          uint64_t v73 = *(void *)v159;
          do
          {
            for (uint64_t j = 0; j != v72; ++j)
            {
              if (*(void *)v159 != v73) {
                objc_enumerationMutation(v69);
              }
              uint64_t v75 = *(void *)(*((void *)&v158 + 1) + 8 * j);
              uint64_t v76 = [CHSubstrokePlacement alloc];
              uint64_t v81 = objc_msgSend_initWithSubstroke_(v76, v77, v75, v78, v79, v80);
              objc_msgSend_setWritingOrientation_(v81, v82, v83, v84, v85, v86, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
              objc_msgSend_addObject_(v44, v87, (uint64_t)v81, v88, v89, v90);
            }
            uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v91, (uint64_t)&v158, (uint64_t)v166, 16, v92);
          }
          while (v72);
        }

        objc_msgSend_bounds(v57, v93, v94, v95, v96, v97);
        v172.origin.double x = v98;
        v172.origin.double y = v99;
        v172.size.double width = v100;
        v172.size.double height = v101;
        v170.origin.double x = x;
        v170.origin.double y = y;
        v170.size.double width = width;
        v170.size.double height = height;
        CGRect v171 = CGRectUnion(v170, v172);
        double x = v171.origin.x;
        double y = v171.origin.y;
        double width = v171.size.width;
        double height = v171.size.height;
      }
      uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v162, (uint64_t)v167, 16, v56);
    }
    while (v149);
  }

  CGVector defaultOrientationVector = self->_defaultOrientationVector;
  CGVector defaultDeviationVector = self->_defaultDeviationVector;
  CGVector v157 = defaultOrientationVector;
  id v155 = v44;
  objc_msgSend_estimateWritingDirectionAndSortSubstrokesAccordingly_averageWritingOrientation_averageStrokeDeviation_(self, v103, (uint64_t)&v155, (uint64_t)&v157, (uint64_t)&defaultDeviationVector, v104);
  id v105 = v155;

  __p = 0;
  unint64_t v153 = 0;
  uint64_t v154 = 0;
  unint64_t v111 = objc_msgSend_count(obj, v106, v107, v108, v109, v110);
  unint64_t v112 = v111;
  if (v111)
  {
    if (v111 >> 60) {
      sub_1C494A220();
    }
    uint64_t v113 = (char *)operator new(16 * v111);
    __p = &v113[v153 & 0xFFFFFFFFFFFFFFF0];
    unint64_t v153 = (unint64_t)__p;
    uint64_t v154 = &v113[16 * v112];
  }
  uint64_t v114 = sub_1C4BC21E4((uint64_t)self, v105, (uint64_t *)&__p);
  uint64_t v115 = sub_1C4BC27C4((uint64_t)self, v105, defaultDeviationVector.dx, defaultDeviationVector.dy);
  double v151 = sub_1C4BC3104(self, v105, v114, v157.dx, v157.dy);
  v116 = [CHTextLineStrokeGroup alloc];
  textStrokeClassificatiouint64_t n = self->_textStrokeClassification;
  uint64_t v123 = objc_msgSend_strategyIdentifier(self, v118, v119, v120, v121, v122);
  CGVector v124 = v157;
  CGVector v125 = defaultDeviationVector;
  uint64_t v131 = objc_msgSend_firstObject(obj, v126, v127, v128, v129, v130);
  objc_msgSend_bounds(v131, v132, v133, v134, v135, v136);
  v140 = objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin_(v116, v137, v142, (uint64_t)v148, (uint64_t)v143, (uint64_t)v144, textStrokeClassification, v123, x, y, width, height, v124, v125, v105, v114, &__p, v115, *(void *)&v151,
                   v138,
                   v139);

  if (__p)
  {
    unint64_t v153 = (unint64_t)__p;
    operator delete(__p);
  }

  return v140;
}

- (id)strokeGroupMergingGroup:(id)a3 withGroup:(id)a4
{
  v4 = sub_1C4BC394C(self, a3, a4, 0, 0);
  return v4;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  ddouble y = a4.dy;
  ddouble x = a4.dx;
  uint64_t v293 = *MEMORY[0x1E4F143B8];
  id v238 = a3;
  objc_opt_class();
  v231 = a7;
  if (objc_opt_isKindOfClass())
  {
    id v22 = v238;
    id v23 = 0;
    if (v22) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v68 = objc_msgSend_strokeIdentifiers(v238, v12, v13, v14, v15, v16);
    uint64_t v74 = objc_msgSend_strokeProvider(self, v69, v70, v71, v72, v73);
    uint64_t v78 = objc_msgSend_sortedStrokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v75, (uint64_t)v68, (uint64_t)v74, v76, v77);

    if (objc_msgSend_count(v78, v79, v80, v81, v82, v83))
    {
      uint64_t v89 = objc_msgSend_ancestorIdentifier(v238, v84, v85, v86, v87, v88);
      objc_msgSend_strokeGroupFromStrokes_ancestorIdentifier_(self, v90, (uint64_t)v78, v89, v91, v92);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      id v22 = v23;
      if (v23)
      {
LABEL_3:
        objc_msgSend_writingDirectionSortedStrokeIdentifiers(v22, v17, v18, v19, v20, v21);
        id v239 = v22;
        id v233 = v23;
        id v234 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v230 = objc_msgSend_strokesForIdentifiers_(self, v24, (uint64_t)v234, v25, v26, v27);
        uint64_t v33 = objc_msgSend_writingDirectionSortedSubstrokes(v22, v28, v29, v30, v31, v32);
        uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v33, v34, 0, v35, v36, v37);
        objc_msgSend_strokeDeviation(v38, v39, v40, v41, v42, v43);
        double v45 = v44;
        double v47 = v46;

        v248 = 0;
        long long v249 = 0uLL;
        uint64_t v53 = *(double **)objc_msgSend_localStrokeWritingOrientations(v22, v48, v49, v50, v51, v52);
        uint64_t v64 = *(double **)(objc_msgSend_localStrokeWritingOrientations(v22, v54, v55, v56, v57, v58) + 8);
        if (v53 == v64)
        {
          double v66 = 0.0;
          goto LABEL_14;
        }
        unint64_t v65 = (char *)v64 - (char *)v53 - 16;
        if (v65 >= 0x10)
        {
          uint64_t v93 = (v65 >> 4) + 1;
          uint64_t v67 = &v53[2 * (v93 & 0x1FFFFFFFFFFFFFFELL)];
          uint64_t v94 = v53 + 2;
          double v66 = 0.0;
          uint64_t v95 = v93 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            double v96 = *(v94 - 2);
            double v97 = *v94;
            v94 += 4;
            double v66 = v66 + v96 + v97;
            v95 -= 2;
          }
          while (v95);
          if (v93 == (v93 & 0x1FFFFFFFFFFFFFFELL))
          {
LABEL_14:
            CGFloat v99 = objc_msgSend_localStrokeWritingOrientations(v22, v59, v60, v61, v62, v63);
            double v229 = dy;
            double v100 = (double)(unint64_t)((uint64_t)(v99[1] - *v99) >> 4);
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            double v101 = v66 / v100;
            uint64_t v102 = (id)qword_1EA3C9FA8;
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v108 = **(void **)objc_msgSend_localStrokeWritingOrientations(v22, v103, v104, v105, v106, v107);
              *(_DWORD *)buf = 134218240;
              *(void *)&buf[4] = v108;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v101;
              _os_log_impl(&dword_1C492D000, v102, OS_LOG_TYPE_DEBUG, "Normalizing a drawing here with a local orientations on double x = %f (first), %f (average)", buf, 0x16u);
            }
            double v228 = v101;

            uint64_t v243 = objc_msgSend_localStrokeWritingOrientations(v22, v109, v110, v111, v112, v113);
            id v114 = v230;
            uint64_t v227 = self;
            if (self)
            {
              double v115 = atan2(self->_defaultOrientationVector.dy, self->_defaultOrientationVector.dx);
              id v242 = v114;
              unint64_t v121 = objc_msgSend_count(v114, v116, v117, v118, v119, v120);
              sub_1C4AF17A8((uint64_t)&v248, v121);
              uint64_t v271 = 0;
              uint64_t v272 = (double *)&v271;
              uint64_t v273 = 0x2020000000;
              uint64_t v274 = 0x7FEFFFFFFFFFFFFFLL;
              uint64_t v267 = 0;
              uint64_t v268 = (double *)&v267;
              uint64_t v269 = 0x2020000000;
              unint64_t v270 = 0xFFEFFFFFFFFFFFFFLL;
              uint64_t v263 = 0;
              uint64_t v264 = (double *)&v263;
              uint64_t v265 = 0x2020000000;
              uint64_t v266 = 0x7FEFFFFFFFFFFFFFLL;
              uint64_t v259 = 0;
              v260 = (double *)&v259;
              uint64_t v261 = 0x2020000000;
              unint64_t v262 = 0xFFEFFFFFFFFFFFFFLL;
              uint64_t v246 = objc_alloc_init(CHDrawing);
              unint64_t v127 = 0;
              double v240 = v47 * -2.0;
              double v241 = v45 * -2.0;
              while (v127 < objc_msgSend_count(v114, v122, v123, v124, v125, v126))
              {
                uint64_t v132 = objc_msgSend_objectAtIndexedSubscript_(v114, v128, v127, v129, v130, v131);
                double v133 = atan2(*(long double *)(*v243 + 16 * v127 + 8), *(long double *)(*v243 + 16 * v127));
                objc_msgSend_bounds(v132, v134, v135, v136, v137, v138);
                double MidX = CGRectGetMidX(v295);
                objc_msgSend_bounds(v132, v140, v141, v142, v143, v144);
                double MidY = CGRectGetMidY(v296);
                double v146 = v115 + v133;
                float v147 = v146;
                __float2 v148 = __sincosf_stret(v147);
                if (v127)
                {
                  double v149 = v101;
                  double v101 = MidY;
                  double v150 = v8;
                  double v151 = v45;
                  double v146 = atan2(*(double *)(*v243 + 16 * v127 - 8) + *(double *)(*v243 + 16 * v127 + 8), *(double *)(*v243 + 16 * v127 - 16) + *(double *)(*v243 + 16 * v127));
                }
                else
                {
                  double v151 = MidX + v241 * v148.__cosval;
                  double v101 = MidY;
                  double v149 = MidY + v240 * v148.__sinval;
                  double v247 = 0.0;
                  double v150 = 0.0;
                }
                float v152 = v115 + v146;
                __float2 v153 = __sincosf_stret(v152);
                uint64_t v250 = 0;
                uint64_t v251 = &v250;
                uint64_t v252 = 0x4812000000;
                uint64_t v253 = sub_1C4BC4FE0;
                v254 = sub_1C4BC5004;
                uint64_t v255 = &unk_1C4CB5C62;
                uint64_t v257 = 0;
                uint64_t v258 = 0;
                __p = 0;
                uint64_t v245 = v132;
                uint64_t v154 = objc_opt_class();
                double v155 = v247 + (v101 - v149) * v153.__sinval + (MidX - v151) * v153.__cosval;
                double v8 = v150 + (v101 - v149) * v153.__cosval - (MidX - v151) * v153.__sinval;
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = sub_1C4BC501C;
                v280 = &unk_1E64E4DB8;
                uint64_t v156 = v246;
                double v247 = v155;
                double v287 = v155;
                double v288 = v8;
                double cosval = v148.__cosval;
                double v290 = MidX;
                double v291 = v101;
                double sinval = v148.__sinval;
                v281 = v156;
                uint64_t v282 = &v250;
                uint64_t v283 = &v271;
                uint64_t v284 = &v267;
                v285 = &v263;
                uint64_t v286 = &v259;
                objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v154, v157, (uint64_t)v132, 0, 1, (uint64_t)buf);
                long long v163 = v251;
                long long v164 = (void *)v249;
                unint64_t v244 = v127;
                if ((unint64_t)v249 >= *((void *)&v249 + 1))
                {
                  CGRect v171 = v248;
                  unint64_t v172 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v249 - (void)v248) >> 3);
                  if (v172 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    sub_1C494A220();
                  }
                  v174 = (const void *)v251[6];
                  uint64_t v173 = v251[7];
                  unint64_t v175 = 0x5555555555555556 * ((uint64_t)(*((void *)&v249 + 1) - (void)v248) >> 3);
                  if (v175 <= v172 + 1) {
                    unint64_t v175 = v172 + 1;
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v249 + 1) - (void)v248) >> 3) >= 0x555555555555555) {
                    unint64_t v176 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v176 = v175;
                  }
                  uint64_t v278 = (char *)&v249 + 8;
                  if (v176)
                  {
                    if (v176 > 0xAAAAAAAAAAAAAAALL) {
                      sub_1C4949AA8();
                    }
                    uint64_t v177 = (char *)operator new(24 * v176);
                  }
                  else
                  {
                    uint64_t v177 = 0;
                  }
                  uint64_t v178 = &v177[24 * v172];
                  uint64_t v275 = v177;
                  uint64_t v276 = v178;
                  uint64_t v179 = &v177[24 * v176];
                  *((void *)v178 + 1) = 0;
                  *(void *)&long long v277 = v178;
                  *((void *)&v277 + 1) = v179;
                  *((void *)v178 + 2) = 0;
                  *(void *)uint64_t v178 = 0;
                  int64_t v180 = v173 - (void)v174;
                  if (v180)
                  {
                    if (v180 < 0) {
                      sub_1C494A220();
                    }
                    v181 = (char *)operator new(v180);
                    *(void *)uint64_t v178 = v181;
                    v182 = &v181[16 * (v180 >> 4)];
                    *((void *)v178 + 2) = v182;
                    memcpy(v181, v174, v180);
                    *((void *)v178 + 1) = v182;
                    id v22 = v239;
                  }
                  CGRect v170 = v178 + 24;
                  *(void *)&long long v277 = v178 + 24;
                  if (v164 == v171)
                  {
                    v248 = v178;
                    *(void *)&long long v249 = v178 + 24;
                    *((void *)&v249 + 1) = v179;
                    id v114 = v242;
                  }
                  else
                  {
                    do
                    {
                      v183 = v178;
                      *((void *)v178 - 2) = 0;
                      *((void *)v178 - 1) = 0;
                      long long v184 = *(_OWORD *)(v164 - 3);
                      v164 -= 3;
                      *(_OWORD *)(v178 - 24) = v184;
                      v178 -= 24;
                      *((void *)v183 - 1) = v164[2];
                      void *v164 = 0;
                      v164[1] = 0;
                      v164[2] = 0;
                    }
                    while (v164 != v171);
                    long long v164 = v248;
                    uint64_t v185 = (void *)v249;
                    v248 = v178;
                    long long v249 = v277;
                    CGRect v170 = (void *)v277;
                    id v114 = v242;
                    if (v185 != v164)
                    {
                      uint64_t v186 = v185;
                      do
                      {
                        v188 = (void *)*(v186 - 3);
                        v186 -= 3;
                        uint64_t v187 = v188;
                        if (v188)
                        {
                          *(v185 - 2) = v187;
                          operator delete(v187);
                        }
                        uint64_t v185 = v186;
                      }
                      while (v186 != v164);
                    }
                  }
                  if (v164) {
                    operator delete(v164);
                  }
                }
                else
                {
                  *(void *)long long v249 = 0;
                  v164[1] = 0;
                  v164[2] = 0;
                  uint64_t v166 = (unsigned char *)v163[6];
                  long long v165 = (unsigned char *)v163[7];
                  int64_t v167 = v165 - v166;
                  if (v165 != v166)
                  {
                    if (v167 < 0) {
                      sub_1C494A220();
                    }
                    uint64_t v168 = (char *)operator new(v165 - v166);
                    void *v164 = v168;
                    v164[1] = v168;
                    uint64_t v169 = &v168[16 * (v167 >> 4)];
                    v164[2] = v169;
                    memcpy(v168, v166, v167);
                    v164[1] = v169;
                  }
                  CGRect v170 = v164 + 3;
                }
                *(void *)&long long v249 = v170;
                if (v246) {
                  objc_msgSend_endStroke(v156, v158, v159, v160, v161, v162);
                }

                _Block_object_dispose(&v250, 8);
                if (__p)
                {
                  uint64_t v257 = __p;
                  operator delete(__p);
                }

                unint64_t v127 = v244 + 1;
                double v45 = MidX;
              }
              v189 = v246;
              double v190 = v272[3];
              double v191 = v264[3];
              double v192 = v268[3];
              double v193 = v260[3];

              double v194 = v192 - v190;
              double v195 = v193 - v191;
              _Block_object_dispose(&v259, 8);
              _Block_object_dispose(&v263, 8);
              _Block_object_dispose(&v267, 8);
              _Block_object_dispose(&v271, 8);
            }
            else
            {
              v189 = 0;
              double v195 = 0.0;
              double v194 = 0.0;
              double v191 = 0.0;
              double v190 = 0.0;
            }

            uint64_t v196 = v189;
            objc_msgSend_setNormalizedSize_(v238, v197, v198, v199, v200, v201, v194, v195);
            uint64_t v207 = objc_alloc_init(CHDrawing);
            double v208 = 2.0;
            if (v195 >= 82.5) {
              double v208 = 1.0;
            }
            if (v227) {
              double v209 = v208;
            }
            else {
              double v209 = 0.0;
            }
            if (fabs(v228 + 1.0) >= 0.1)
            {
              uint64_t v212 = (char *)v248;
              if ((void *)v249 != v248)
              {
                unint64_t v213 = 0;
                do
                {
                  v215 = &v212[24 * v213];
                  uint64_t v214 = *(void *)v215;
                  if (*((void *)v215 + 1) != *(void *)v215)
                  {
                    uint64_t v216 = 0;
                    unint64_t v217 = 0;
                    do
                    {
                      objc_msgSend_addPoint_(v207, v202, v203, v204, v205, v206, dx + v209 * (*(double *)(v214 + v216) - v190), v229 + v209 * (*(double *)(v214 + v216 + 8) - v191));
                      ++v217;
                      uint64_t v214 = *((void *)v248 + 3 * v213);
                      v216 += 16;
                    }
                    while (v217 < (*((void *)v248 + 3 * v213 + 1) - v214) >> 4);
                  }
                  objc_msgSend_endStroke(v207, v202, v203, v204, v205, v206);
                  ++v213;
                  uint64_t v212 = (char *)v248;
                }
                while (v213 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v249 - (void)v248) >> 3));
              }
              if (a5) {
                *a5 = v196;
              }
              if (a6) {
                *a6 = v234;
              }
              if (v231) {
                double *v231 = v209;
              }
              v211 = v207;
              if (!a8) {
                goto LABEL_90;
              }
            }
            else
            {
              if (qword_1EA3CA000 != -1) {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
              }
              uint64_t v210 = (id)qword_1EA3C9FA8;
              if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C492D000, v210, OS_LOG_TYPE_DEBUG, "Suspect normalizing of a drawing where stroke order is flipped. Reverting.", buf, 2u);
              }

              if (a5) {
                *a5 = v196;
              }
              if (a6) {
                *a6 = v234;
              }
              if (v231) {
                double *v231 = v209;
              }
              v211 = v196;
              if (!a8) {
                goto LABEL_90;
              }
            }
            *a8 = v233;
LABEL_90:
            uint64_t v218 = v211;

            uint64_t v219 = (char *)v248;
            if (v248)
            {
              uint64_t v220 = (char *)v249;
              uint64_t v221 = v248;
              if ((void *)v249 != v248)
              {
                v222 = (char *)v249;
                do
                {
                  uint64_t v224 = (void *)*((void *)v222 - 3);
                  v222 -= 24;
                  v223 = v224;
                  if (v224)
                  {
                    *((void *)v220 - 2) = v223;
                    operator delete(v223);
                  }
                  uint64_t v220 = v222;
                }
                while (v222 != v219);
                uint64_t v221 = v248;
              }
              *(void *)&long long v249 = v219;
              operator delete(v221);
            }

            id v23 = v233;
            goto LABEL_105;
          }
        }
        else
        {
          double v66 = 0.0;
          uint64_t v67 = v53;
        }
        do
        {
          double v98 = *v67;
          v67 += 2;
          double v66 = v66 + v98;
        }
        while (v67 != v64);
        goto LABEL_14;
      }
    }
    else
    {
      id v23 = 0;

      id v22 = 0;
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v225 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v225, OS_LOG_TYPE_ERROR, "Stroke group can't be nil and must be of CHTextLineStrokeGroup class. Returning empty drawing.", buf, 2u);
  }

  uint64_t v218 = objc_alloc_init(CHDrawing);
LABEL_105:

  return v218;
}

- (void)getMergingEndOfLineCost:(double *)a3 mergingEndOfLineStroke:(id *)a4 forStroke:(id)a5 consistingOfSubstrokes:(id)a6 toLineGroup:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v44 = 0;
  double v45 = 10000.0;
  uint64_t v20 = objc_msgSend_writingDirectionSortedSubstrokes(v14, v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);
  sub_1C4BC53B8((uint64_t)self, &v45, &v44, v12, v13, v14, v26 - 1);
  id v27 = v44;

  if ((objc_msgSend_lastSubstrokeIndexBeforeMerge(v14, v28, v29, v30, v31, v32) & 0x8000000000000000) == 0)
  {
    id v42 = 0;
    double v43 = 0.0;
    uint64_t SubstrokeIndexBeforeMerge = objc_msgSend_lastSubstrokeIndexBeforeMerge(v14, v33, v34, v35, v36, v37);
    sub_1C4BC53B8((uint64_t)self, &v43, &v42, v12, v13, v14, SubstrokeIndexBeforeMerge);
    id v39 = v42;
    uint64_t v40 = v39;
    if (v43 < v45)
    {
      double v45 = v43;
      id v41 = v39;

      id v27 = v41;
    }
  }
  if (a3) {
    *a3 = v45;
  }
  if (a4) {
    *a4 = v27;
  }
}

- (void)getMergingMiddleOfLineCost:(double *)a3 mergingMiddleOfLineStroke:(id *)a4 forStroke:(id)a5 consistingOfSubstrokes:(id)a6 toLineGroup:(id)a7
{
  uint64_t v312 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v299 = a7;
  uint64_t v300 = v11;
  uint64_t v294 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v13, v14, v15, v16, v17);
  objc_msgSend_bounds(v11, v18, v19, v20, v21, v22);
  double v24 = v23;
  objc_msgSend_bounds(v11, v25, v26, v27, v28, v29);
  double v31 = v30;
  objc_msgSend_bounds(v11, v32, v33, v34, v35, v36);
  double v38 = v37;
  objc_msgSend_bounds(v11, v39, v40, v41, v42, v43);
  double v45 = v44;
  objc_msgSend_bounds(v11, v46, v47, v48, v49, v50);
  double v55 = sqrt(v38 * v45 + v24 * v31);
  if (v55 < 100.0) {
    double v55 = 100.0;
  }
  CGRect v313 = CGRectInset(*(CGRect *)&v51, -v55, -v55);
  CGFloat x = v313.origin.x;
  CGFloat y = v313.origin.y;
  CGFloat width = v313.size.width;
  CGFloat height = v313.size.height;
  for (unint64_t i = 0; ; ++i)
  {
    double v66 = objc_msgSend_writingDirectionSortedSubstrokes(v299, v56, v57, v58, v59, v60);
    unint64_t v72 = objc_msgSend_count(v66, v67, v68, v69, v70, v71) - 1;

    if (i >= v72) {
      break;
    }
    uint64_t v78 = objc_msgSend_writingDirectionSortedSubstrokes(v299, v73, v74, v75, v76, v77);
    uint64_t v83 = objc_msgSend_objectAtIndexedSubscript_(v78, v79, i, v80, v81, v82);

    uint64_t v89 = objc_msgSend_substroke(v83, v84, v85, v86, v87, v88);
    objc_msgSend_bounds(v89, v90, v91, v92, v93, v94);
    v315.origin.CGFloat x = x;
    v315.origin.CGFloat y = y;
    v315.size.CGFloat width = width;
    v315.size.CGFloat height = height;
    BOOL v95 = CGRectIntersectsRect(v314, v315);

    if (v95) {
      objc_msgSend_addObject_(v294, v96, (uint64_t)v83, v97, v98, v99);
    }
  }
  long long v308 = 0u;
  long long v309 = 0u;
  long long v306 = 0u;
  long long v307 = 0u;
  id obj = v294;
  uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v100, (uint64_t)&v306, (uint64_t)v311, 16, v101);
  uint64_t v292 = a3;
  if (v102)
  {
    uint64_t v108 = 0;
    id v301 = 0;
    uint64_t v296 = *(void *)v307;
    uint64_t v297 = v102;
    double v109 = 10000.0;
    do
    {
      for (uint64_t j = 0; j != v297; ++j)
      {
        if (*(void *)v307 != v296) {
          objc_enumerationMutation(obj);
        }
        uint64_t v110 = *(void **)(*((void *)&v306 + 1) + 8 * j);
        if (!v108) {
          goto LABEL_16;
        }
        uint64_t v111 = objc_msgSend_encodedStrokeIdentifier(v108, v103, v104, v105, v106, v107);
        uint64_t v117 = objc_msgSend_substroke(v110, v112, v113, v114, v115, v116);
        uint64_t v123 = objc_msgSend_strokeIdentifier(v117, v118, v119, v120, v121, v122);
        char isEqual = objc_msgSend_isEqual_(v111, v124, (uint64_t)v123, v125, v126, v127);

        if ((isEqual & 1) == 0)
        {
LABEL_16:
          uint64_t v134 = objc_opt_class();
          v140 = objc_msgSend_substroke(v110, v135, v136, v137, v138, v139);
          double v146 = objc_msgSend_strokeIdentifier(v140, v141, v142, v143, v144, v145);
          float v152 = objc_msgSend_strokeProvider(self, v147, v148, v149, v150, v151);
          uint64_t v156 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v134, v153, (uint64_t)v146, (uint64_t)v152, v154, v155);

          uint64_t v108 = (void *)v156;
        }
        objc_msgSend_averageWritingOrientation(v299, v129, v130, v131, v132, v133);
        double v158 = v157;
        objc_msgSend_writingOrientation(v110, v159, v160, v161, v162, v163);
        double v165 = v164;
        objc_msgSend_averageWritingOrientation(v299, v166, v167, v168, v169, v170);
        double v172 = v171;
        objc_msgSend_writingOrientation(v110, v173, v174, v175, v176, v177);
        double v183 = (v158 + v165) * 0.5;
        double v185 = (v172 + v184) * 0.5;
        double v186 = sqrt(v185 * v185 + v183 * v183);
        if (v186 != 0.0)
        {
          double v183 = v183 / v186;
          double v185 = v185 / v186;
        }
        double v302 = v185;
        double v303 = v183;
        if (self->_shouldLimitDefaultWritingOrientationDeviation)
        {
          objc_msgSend_clippedWritingOrientation_(self, v178, v179, v180, v181, v182, v183, v185);
          double v302 = v188;
          double v303 = v187;
        }
        objc_msgSend_averageStrokeDeviation(v299, v178, v179, v180, v181, v182);
        double v190 = v189;
        objc_msgSend_strokeDeviation(v110, v191, v192, v193, v194, v195);
        double v197 = v196;
        objc_msgSend_averageStrokeDeviation(v299, v198, v199, v200, v201, v202);
        double v204 = v203;
        objc_msgSend_strokeDeviation(v110, v205, v206, v207, v208, v209);
        unint64_t v215 = 0;
        dCGFloat x = (v190 + v197) * 0.5;
        dCGFloat y = (v204 + v216) * 0.5;
        if (dx <= self->_defaultDeviationVector.dx) {
          dCGFloat x = self->_defaultDeviationVector.dx;
        }
        if (dy <= self->_defaultDeviationVector.dy) {
          dCGFloat y = self->_defaultDeviationVector.dy;
        }
        double v305 = sqrt(dy * dy + dx * dx);
        while (v215 < objc_msgSend_count(v12, v210, v211, v212, v213, v214))
        {
          uint64_t v219 = objc_msgSend_objectAtIndexedSubscript_(v12, v103, v215, v105, v106, v107);
          v310 = v110;
          v223 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v220, (uint64_t)&v310, 1, v221, v222);
          double v229 = objc_msgSend_substroke(v219, v224, v225, v226, v227, v228);
          double v230 = sub_1C4BC5B1C(self, v223, v229, v108, v300, v303, v302);
          double v232 = v231;

          double v238 = v232 / v305;
          if (v232 / v305 >= 0.0) {
            double mergeMiddleDyCostCoeff = self->_mergeMiddleBelowModifier * self->_mergeMiddleDyCostCoeff;
          }
          else {
            double mergeMiddleDyCostCoeff = self->_mergeMiddleDyCostCoeff;
          }
          double v304 = mergeMiddleDyCostCoeff;
          double mergeMiddleDxCostCoeff = self->_mergeMiddleDxCostCoeff;
          double v241 = objc_msgSend_substroke(v219, v233, v234, v235, v236, v237);
          objc_msgSend_bounds(v241, v242, v243, v244, v245, v246);
          double v248 = v247;
          v254 = objc_msgSend_substroke(v219, v249, v250, v251, v252, v253);
          objc_msgSend_bounds(v254, v255, v256, v257, v258, v259);
          double v261 = v260;
          uint64_t v267 = objc_msgSend_substroke(v219, v262, v263, v264, v265, v266);
          objc_msgSend_bounds(v267, v268, v269, v270, v271, v272);
          double v274 = v273;
          v280 = objc_msgSend_substroke(v219, v275, v276, v277, v278, v279);
          objc_msgSend_bounds(v280, v281, v282, v283, v284, v285);
          double v287 = v286;

          double v288 = fabs(v230 / v305) * mergeMiddleDxCostCoeff + fabs(v238) * v304;
          double v289 = sqrt(v274 * v287 + v248 * v261) / v305;
          if (v289 < 0.8) {
            double v289 = 0.8;
          }
          if (v289 > 1.0) {
            double v289 = 1.0;
          }
          double v290 = v288 * v289;
          if (v288 * v289 >= v109)
          {
            double v290 = v109;
          }
          else
          {
            id v291 = v108;

            id v301 = v291;
          }

          ++v215;
          double v109 = v290;
        }
      }
      uint64_t v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v103, (uint64_t)&v306, (uint64_t)v311, 16, v107);
    }
    while (v297);
  }
  else
  {
    uint64_t v108 = 0;
    id v301 = 0;
    double v109 = 10000.0;
  }

  if (v292) {
    *uint64_t v292 = v109;
  }
  if (a4) {
    *a4 = v301;
  }
}

- (int64_t)compareDistanceInWritingSequenceOfStroke:(id)a3 andStroke:(id)a4 toReferenceStroke:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = v10;
  int64_t v17 = 0;
  if (v8 && v9 && v10)
  {
    uint64_t v18 = objc_msgSend_strokeProvider(self, v11, v12, v13, v14, v15);
    double v24 = objc_msgSend_strokeIdentifier(v8, v19, v20, v21, v22, v23);
    double v30 = objc_msgSend_strokeIdentifier(v16, v25, v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v18, v31, (uint64_t)v24, (uint64_t)v30, v32, v33);

    uint64_t v40 = objc_msgSend_strokeProvider(self, v35, v36, v37, v38, v39);
    double v46 = objc_msgSend_strokeIdentifier(v9, v41, v42, v43, v44, v45);
    uint64_t v52 = objc_msgSend_strokeIdentifier(v16, v47, v48, v49, v50, v51);
    uint64_t v56 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v40, v53, (uint64_t)v46, (uint64_t)v52, v54, v55);

    uint64_t v62 = objc_msgSend_strokeProvider(self, v57, v58, v59, v60, v61);
    uint64_t v68 = objc_msgSend_strokeIdentifier(v8, v63, v64, v65, v66, v67);
    uint64_t v74 = objc_msgSend_strokeIdentifier(v9, v69, v70, v71, v72, v73);
    uint64_t v78 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v62, v75, (uint64_t)v68, (uint64_t)v74, v76, v77);

    if (v34 == -1 && v56 == 1)
    {
      int64_t v17 = 0;
    }
    else
    {
      int64_t v17 = 0;
      if (v56 != -1 || v34 != 1)
      {
        if (v78)
        {
          int64_t v17 = -1;
          if ((v34 != -1 || v78 != 1) && (v78 != -1 || v34 != 1) && v34 != 0) {
            int64_t v17 = 1;
          }
        }
      }
    }
  }

  return v17;
}

- (void)estimateWritingDirectionAndSortSubstrokesAccordingly:(id *)a3 averageWritingOrientation:(CGVector *)a4 averageStrokeDeviation:(CGVector *)a5
{
  id v14 = *a3;
  uint64_t v15 = 0;
  CGVector defaultOrientationVector = self->_defaultOrientationVector;
  while (2)
  {
    uint64_t v16 = objc_msgSend_mutableCopy(v14, v9, v10, v11, v12, v13);
    objc_msgSend_updateLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(self, v17, (uint64_t)v14, 0, v18, v19);
    objc_msgSend_sortSubstrokesByWritingDirection_averageWritingOrientation_(self, v20, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v21, v22);
    unint64_t v28 = 0;
    ++v15;
    do
    {
      if (v28 >= objc_msgSend_count(v14, v23, v24, v25, v26, v27))
      {

        goto LABEL_9;
      }
      uint64_t v33 = objc_msgSend_objectAtIndexedSubscript_(v14, v29, v28, v30, v31, v32);
      objc_msgSend_writingOrientation(v33, v34, v35, v36, v37, v38);
      double v40 = v39;
      double v42 = v41;
      uint64_t v47 = objc_msgSend_objectAtIndexedSubscript_(v16, v43, v28, v44, v45, v46);
      objc_msgSend_writingOrientation(v47, v48, v49, v50, v51, v52);
      double v54 = v53;
      double v56 = v55;

      if (v40 != v54) {
        break;
      }
      ++v28;
    }
    while (v42 == v56);

    if (v15 != 10) {
      continue;
    }
    break;
  }
LABEL_9:
  if ((unint64_t)objc_msgSend_count(v14, v9, v10, v11, v12, v13) > self->_groupingContextSize)
  {
    objc_msgSend_refineLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(self, v57, (uint64_t)v14, 0, v58, v59);
    objc_msgSend_sortSubstrokesByWritingDirection_averageWritingOrientation_(self, v60, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v61, v62);
    CGVector defaultDeviationVector = defaultOrientationVector;
    id v63 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v67 = objc_msgSend_initWithArray_copyItems_(v63, v64, (uint64_t)v14, 1, v65, v66);
    double v73 = atan2(defaultOrientationVector.dy, defaultOrientationVector.dx);
    unint64_t v74 = 0;
    double v75 = 0.0;
    double v76 = 0.0;
    while (v74 < objc_msgSend_count(v14, v68, v69, v70, v71, v72, defaultDeviationVector))
    {
      uint64_t v81 = objc_msgSend_objectAtIndexedSubscript_(v14, v77, v74, v78, v79, v80);
      objc_msgSend_writingOrientation(v81, v82, v83, v84, v85, v86);
      double v75 = v75 + 0.1;
      double v76 = v76 + v87 * v75;

      ++v74;
    }
    if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v77, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v79, v80))
    {
      unint64_t v93 = 0;
      double v94 = 0.0;
      double v95 = 0.0;
      while (v93 < objc_msgSend_count(v14, v88, v89, v90, v91, v92))
      {
        double v100 = objc_msgSend_objectAtIndexedSubscript_(v14, v96, v93, v97, v98, v99);
        objc_msgSend_writingOrientation(v100, v101, v102, v103, v104, v105);
        double v94 = v94 + 0.1;
        double v95 = v95 + v106 * v94;

        ++v93;
      }
      if (v95 != v76)
      {
        if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v96, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v98, v99))
        {
          unint64_t v112 = 0;
          double v113 = 0.0;
          double v114 = 0.0;
          while (v112 < objc_msgSend_count(v14, v107, v108, v109, v110, v111))
          {
            uint64_t v119 = objc_msgSend_objectAtIndexedSubscript_(v14, v115, v112, v116, v117, v118);
            objc_msgSend_writingOrientation(v119, v120, v121, v122, v123, v124);
            double v113 = v113 + 0.1;
            double v114 = v114 + v125 * v113;

            ++v112;
          }
          if (v114 != v95)
          {
            if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v115, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v117, v118))
            {
              unint64_t v131 = 0;
              double v132 = 0.0;
              double v133 = 0.0;
              while (v131 < objc_msgSend_count(v14, v126, v127, v128, v129, v130))
              {
                uint64_t v138 = objc_msgSend_objectAtIndexedSubscript_(v14, v134, v131, v135, v136, v137);
                objc_msgSend_writingOrientation(v138, v139, v140, v141, v142, v143);
                double v132 = v132 + 0.1;
                double v133 = v133 + v144 * v132;

                ++v131;
              }
              if (v133 != v114)
              {
                if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v134, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v136, v137))
                {
                  unint64_t v150 = 0;
                  double v151 = 0.0;
                  double v152 = 0.0;
                  while (v150 < objc_msgSend_count(v14, v145, v146, v147, v148, v149))
                  {
                    double v157 = objc_msgSend_objectAtIndexedSubscript_(v14, v153, v150, v154, v155, v156);
                    objc_msgSend_writingOrientation(v157, v158, v159, v160, v161, v162);
                    double v151 = v151 + 0.1;
                    double v152 = v152 + v163 * v151;

                    ++v150;
                  }
                  if (v152 != v133
                    && objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v153, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v155, v156))
                  {
                    for (unint64_t i = 0; i < objc_msgSend_count(v14, v164, v165, v166, v167, v168); ++i)
                    {
                      uint64_t v174 = objc_msgSend_objectAtIndexedSubscript_(v14, v170, i, v171, v172, v173);
                      objc_msgSend_writingOrientation(v174, v175, v176, v177, v178, v179);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (vabdd_f64(atan2(defaultOrientationVector.dy, defaultOrientationVector.dx), v73) > 0.785398163)
    {
      id v180 = v67;
      *a3 = v180;
      id v181 = v180;

      CGVector defaultOrientationVector = defaultDeviationVector;
      id v14 = v181;
    }
  }
  CGVector defaultDeviationVector = self->_defaultDeviationVector;
  objc_msgSend_updateLocalStrokeDeviationsForSubstrokes_averageStrokeDeviation_(self, v57, (uint64_t)v14, (uint64_t)&defaultDeviationVector, v58, v59);
  if (a4) {
    *a4 = defaultOrientationVector;
  }
  if (a5) {
    *a5 = defaultDeviationVector;
  }
}

- (void)sortSubstrokesByWritingDirection:(id)a3 averageWritingOrientation:(CGVector *)a4
{
  id v5 = a3;
  if (objc_msgSend_count(v5, v6, v7, v8, v9, v10))
  {
    unint64_t v16 = 0;
    double v17 = 0.0;
    double v18 = 0.0;
    while (v16 < objc_msgSend_count(v5, v11, v12, v13, v14, v15))
    {
      uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v5, v19, v16, v21, v22, v23);
      objc_msgSend_writingOrientation(v24, v25, v26, v27, v28, v29);
      double v31 = v30;
      double v33 = v32;

      double v17 = v17 + v31;
      double v18 = v18 + v33;
      ++v16;
    }
    if (objc_msgSend_count(v5, v19, v20, v21, v22, v23))
    {
      double v17 = v17 / (double)(unint64_t)objc_msgSend_count(v5, v34, v35, v36, v37, v38);
      double v18 = v18 / (double)(unint64_t)objc_msgSend_count(v5, v39, v40, v41, v42, v43);
    }
    if (a4)
    {
      a4->dCGFloat x = v17;
      a4->dCGFloat y = v18;
    }
    if ((unint64_t)objc_msgSend_count(v5, v34, v35, v36, v37, v38) >= 2)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = sub_1C4BC769C;
      v48[3] = &unk_1E64E4E00;
      *(double *)&v48[4] = v17;
      *(double *)&v48[5] = v18;
      objc_msgSend_sortUsingComparator_(v5, v44, (uint64_t)v48, v45, v46, v47);
    }
  }
  else if (a4)
  {
    a4->dCGFloat x = 0.0;
    a4->dCGFloat y = 0.0;
  }
}

- (void)updateLocalWritingOrientationsForSubstrokes:(id)a3 useCoalescedCenter:(BOOL)a4
{
  BOOL v189 = a4;
  id v5 = a3;
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8, v9, v10) < self->_groupingContextSize)
  {
    for (unint64_t i = 0; i < objc_msgSend_count(v5, v11, v12, v13, v14, v15); ++i)
    {
      dCGFloat x = self->_defaultOrientationVector.dx;
      dCGFloat y = self->_defaultOrientationVector.dy;
      uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v5, v17, i, v18, v19, v20);
      objc_msgSend_setWritingOrientation_(v23, v24, v25, v26, v27, v28, dx, dy);
    }
    goto LABEL_60;
  }
  unint64_t v29 = objc_msgSend_count(v5, v11, v12, v13, v14, v15);
  unint64_t v35 = 2 * self->_groupingContextSize;
  double v36 = 0.0;
  if (v29 < v35) {
    double v36 = (double)(v35 - objc_msgSend_count(v5, v30, v31, v32, v33, v34)) / (double)self->_groupingContextSize;
  }
  __p = 0;
  double v191 = 0;
  uint64_t v192 = 0;
  unint64_t v37 = objc_msgSend_count(v5, v30, v31, v32, v33, v34);
  unint64_t v43 = v37;
  if (v37)
  {
    if (v37 >> 60) {
      sub_1C494A220();
    }
    uint64_t v44 = (char *)operator new(16 * v37);
    __p = &v44[(unint64_t)v191 & 0xFFFFFFFFFFFFFFF0];
    double v191 = (double *)__p;
    uint64_t v192 = &v44[16 * v43];
  }
  unint64_t v45 = 0;
  double v46 = 1.0 - v36;
  for (unint64_t j = objc_msgSend_count(v5, v38, v39, v40, v41, v42, -1);
        v45 < j;
        unint64_t j = objc_msgSend_count(v5, v53, v54, v55, v56, v57, v187 + 1))
  {
    double v188 = objc_msgSend_objectAtIndexedSubscript_(v5, v48, v45, v49, v50, v51);
    if (v189)
    {
      objc_msgSend_coalescedCenter(v188, v58, v59, v60, v61, v62);
      double MidX = v68;
      double MidY = v70;
      double v72 = 0.0;
      double v73 = 0.0;
      if (self->_groupingContextSize < 2) {
        goto LABEL_32;
      }
    }
    else
    {
      unint64_t v74 = objc_msgSend_substroke(v188, v58, v59, v60, v61, v62);
      objc_msgSend_bounds(v74, v75, v76, v77, v78, v79);
      double MidX = CGRectGetMidX(v193);
      uint64_t v85 = objc_msgSend_substroke(v188, v80, v81, v82, v83, v84);
      objc_msgSend_bounds(v85, v86, v87, v88, v89, v90);
      double MidY = CGRectGetMidY(v194);

      double v72 = 0.0;
      double v73 = 0.0;
      if (self->_groupingContextSize < 2) {
        goto LABEL_32;
      }
    }
    uint64_t v91 = 0;
    uint64_t v92 = v187;
    int64_t v93 = 1;
    do
    {
      if (v45 >= v93)
      {
        double v94 = objc_msgSend_objectAtIndexedSubscript_(v5, v63, v92, v65, v66, v67);
        double v100 = v94;
        if (v189)
        {
          objc_msgSend_coalescedCenter(v94, v95, v96, v97, v98, v99);
          double v102 = v101;
          double v104 = v103;
        }
        else
        {
          uint64_t v105 = objc_msgSend_substroke(v94, v95, v96, v97, v98, v99);
          objc_msgSend_bounds(v105, v106, v107, v108, v109, v110);
          double v102 = CGRectGetMidX(v195);
          uint64_t v116 = objc_msgSend_substroke(v100, v111, v112, v113, v114, v115);
          objc_msgSend_bounds(v116, v117, v118, v119, v120, v121);
          double v104 = CGRectGetMidY(v196);
        }
        double v72 = v72 + MidX - v102;
        double v73 = v73 + MidY - v104;
        ++v91;
      }
      unint64_t v122 = objc_msgSend_count(v5, v63, v64, v65, v66, v67);
      uint64_t v64 = v45 + v93;
      if (v45 + v93 < v122)
      {
        uint64_t v123 = objc_msgSend_objectAtIndexedSubscript_(v5, v63, v64, v65, v66, v67);
        uint64_t v129 = v123;
        if (v189)
        {
          objc_msgSend_coalescedCenter(v123, v124, v125, v126, v127, v128);
          double v131 = v130;
          double v133 = v132;
        }
        else
        {
          uint64_t v134 = objc_msgSend_substroke(v123, v124, v125, v126, v127, v128);
          objc_msgSend_bounds(v134, v135, v136, v137, v138, v139);
          double v131 = CGRectGetMidX(v197);
          uint64_t v145 = objc_msgSend_substroke(v129, v140, v141, v142, v143, v144);
          objc_msgSend_bounds(v145, v146, v147, v148, v149, v150);
          double v133 = CGRectGetMidY(v198);
        }
        double v72 = v72 + v131 - MidX;
        double v73 = v73 + v133 - MidY;
        ++v91;
      }
      ++v93;
      --v92;
    }
    while (v93 < self->_groupingContextSize);
    if (v91)
    {
      double v72 = v72 / (double)v91;
      double v73 = v73 / (double)v91;
    }
LABEL_32:
    double v151 = sqrt(v73 * v73 + v72 * v72);
    if (v151 == 0.0)
    {
      double v152 = self->_defaultOrientationVector.dx;
      double v153 = self->_defaultOrientationVector.dy;
      if (v36 <= 0.0) {
        goto LABEL_38;
      }
    }
    else
    {
      double v152 = v72 / v151;
      double v153 = v73 / v151;
      if (v36 <= 0.0) {
        goto LABEL_38;
      }
    }
    double v154 = v46 * v152;
    double v155 = v46 * v153;
    double v152 = self->_defaultOrientationVector.dx;
    double v153 = self->_defaultOrientationVector.dy;
    double v156 = v154 + v36 * v152;
    double v157 = v155 + v36 * v153;
    double v158 = sqrt(v157 * v157 + v156 * v156);
    if (v158 != 0.0)
    {
      double v152 = v156 / v158;
      double v153 = v157 / v158;
    }
LABEL_38:
    uint64_t v159 = v191;
    if (v191 < (double *)v192)
    {
      *double v191 = v152;
      v159[1] = v153;
      uint64_t v52 = v159 + 2;
      goto LABEL_12;
    }
    uint64_t v160 = (double *)__p;
    uint64_t v161 = ((char *)v191 - (unsigned char *)__p) >> 4;
    unint64_t v162 = v161 + 1;
    if ((unint64_t)(v161 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v163 = v192 - (unsigned char *)__p;
    if ((v192 - (unsigned char *)__p) >> 3 > v162) {
      unint64_t v162 = v163 >> 3;
    }
    if ((unint64_t)v163 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v164 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v164 = v162;
    }
    if (v164)
    {
      if (v164 >> 60) {
        sub_1C4949AA8();
      }
      uint64_t v165 = (char *)operator new(16 * v164);
      uint64_t v166 = (double *)&v165[16 * v161];
      *uint64_t v166 = v152;
      v166[1] = v153;
      uint64_t v167 = v166;
      if (v159 == v160)
      {
LABEL_53:
        uint64_t v52 = v166 + 2;
        __p = v167;
        uint64_t v192 = &v165[16 * v164];
        if (!v159) {
          goto LABEL_12;
        }
LABEL_54:
        operator delete(v159);
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v165 = 0;
      uint64_t v166 = (double *)(16 * v161);
      *uint64_t v166 = v152;
      v166[1] = v153;
      uint64_t v167 = (double *)(16 * v161);
      if (v159 == v160) {
        goto LABEL_53;
      }
    }
    do
    {
      *((_OWORD *)v167 - 1) = *((_OWORD *)v159 - 1);
      v167 -= 2;
      v159 -= 2;
    }
    while (v159 != v160);
    uint64_t v159 = v160;
    uint64_t v52 = v166 + 2;
    __p = v167;
    uint64_t v192 = &v165[16 * v164];
    if (v159) {
      goto LABEL_54;
    }
LABEL_12:
    double v191 = v52;

    ++v45;
  }
  objc_msgSend_smoothLocalWritingOrientations_(self, v48, (uint64_t)&__p, v49, v50, v51);
  uint64_t v173 = 0;
  for (unint64_t k = 0; k < objc_msgSend_count(v5, v168, v169, v170, v171, v172); ++k)
  {
    double v179 = *(double *)((char *)__p + v173);
    double v180 = *(double *)((char *)__p + v173 + 8);
    id v181 = objc_msgSend_objectAtIndexedSubscript_(v5, v175, k, v176, v177, v178);
    objc_msgSend_setWritingOrientation_(v181, v182, v183, v184, v185, v186, v179, v180);

    v173 += 16;
  }
  if (__p)
  {
    double v191 = (double *)__p;
    operator delete(__p);
  }
LABEL_60:
}

- (void)smoothLocalWritingOrientations:(void *)a3
{
  v3 = *(float64x2_t **)a3;
  uint64_t v4 = *((void *)a3 + 1) - *(void *)a3;
  if ((unint64_t)v4 >= 0x11)
  {
    float64x2_t v6 = *v3;
    id v5 = v3 + 1;
    float64x2_t v7 = v6;
    unint64_t v8 = v4 >> 4;
    if (v8 <= 2) {
      unint64_t v8 = 2;
    }
    unint64_t v9 = v8 - 1;
    __asm { FMOV            V1.2D, #0.5 }
    do
    {
      float64x2_t v15 = v7;
      float64x2_t v7 = *v5;
      float64x2_t v16 = vmlaq_f64(vmulq_f64(*v5, _Q1), _Q1, v15);
      double v17 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v16, v16).f64[1]), v16.f64[0], v16.f64[0]));
      if (v17 != 0.0) {
        *id v5 = vdivq_f64(v16, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));
      }
      ++v5;
      --v9;
    }
    while (v9);
  }
}

- (CGVector)clippedWritingOrientation:(CGVector)a3
{
  dCGFloat y = a3.dy;
  dCGFloat x = a3.dx;
  double v5 = atan2(self->_defaultOrientationVector.dy, self->_defaultOrientationVector.dx);
  double v6 = atan2(dy, dx) - v5;
  if (v6 <= 3.14159265)
  {
    if (v6 <= -3.14159265)
    {
      double v6 = v6 + 3.14159265;
      if (fabs(v6) > 0.523598776) {
        goto LABEL_8;
      }
    }
    else if (fabs(v6) > 0.523598776)
    {
      goto LABEL_8;
    }
  }
  else
  {
    double v6 = v6 + -3.14159265;
    if (fabs(v6) > 0.523598776)
    {
LABEL_8:
      double v9 = v5 + dbl_1C4C448E0[v6 < 0.0];
      if (v9 <= 3.14159265)
      {
        if (v9 > -3.14159265)
        {
LABEL_13:
          __double2 v11 = __sincos_stret(v9);
          double cosval = v11.__cosval;
          double sinval = v11.__sinval;
          goto LABEL_14;
        }
        double v10 = 6.28318531;
      }
      else
      {
        double v10 = -6.28318531;
      }
      double v9 = v9 + v10;
      goto LABEL_13;
    }
  }
  double cosval = dx;
  double sinval = dy;
LABEL_14:
  result.dCGFloat y = sinval;
  result.dCGFloat x = cosval;
  return result;
}

- (void)refineLocalWritingOrientationsForSubstrokes:(id)a3 useCoalescedCenter:(BOOL)a4
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  __p = 0;
  uint64_t v165 = 0;
  uint64_t v166 = 0;
  id v145 = a3;
  unint64_t v11 = objc_msgSend_count(v145, v6, v7, v8, v9, v10);
  unint64_t v12 = v11;
  if (v11)
  {
    if (v11 >> 60) {
      sub_1C494A220();
    }
    __p = operator new(16 * v11);
    uint64_t v165 = (char *)__p;
    uint64_t v166 = (char *)__p + 16 * v12;
  }
  uint64_t v149 = self;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id v13 = v145;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v160, (uint64_t)v167, 16, v15);
  if (v21)
  {
    uint64_t v22 = *(void *)v161;
    if (a4)
    {
      while (1)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v161 != v22) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend_coalescedCenter(*(void **)(*((void *)&v160 + 1) + 8 * i), v16, v17, v18, v19, v20);
          uint64_t v27 = v25;
          uint64_t v28 = v26;
          unint64_t v29 = v165;
          if (v165 < v166)
          {
            *(void *)uint64_t v165 = v25;
            *((void *)v29 + 1) = v26;
            uint64_t v24 = v29 + 16;
            goto LABEL_8;
          }
          double v30 = (char *)__p;
          uint64_t v31 = (v165 - (unsigned char *)__p) >> 4;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 60) {
            sub_1C494A220();
          }
          uint64_t v33 = v166 - (unsigned char *)__p;
          if ((v166 - (unsigned char *)__p) >> 3 > v32) {
            unint64_t v32 = v33 >> 3;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v34 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v32;
          }
          if (v34)
          {
            if (v34 >> 60) {
              sub_1C4949AA8();
            }
            unint64_t v35 = (char *)operator new(16 * v34);
            double v36 = &v35[16 * v31];
            *(void *)double v36 = v27;
            *((void *)v36 + 1) = v28;
            unint64_t v37 = v36;
            if (v29 == v30)
            {
LABEL_26:
              uint64_t v24 = v36 + 16;
              __p = v37;
              uint64_t v165 = v36 + 16;
              uint64_t v166 = &v35[16 * v34];
              if (!v29) {
                goto LABEL_8;
              }
LABEL_27:
              operator delete(v29);
              goto LABEL_8;
            }
          }
          else
          {
            unint64_t v35 = 0;
            double v36 = (char *)(16 * v31);
            *(void *)double v36 = v25;
            *((void *)v36 + 1) = v26;
            unint64_t v37 = (char *)(16 * v31);
            if (v29 == v30) {
              goto LABEL_26;
            }
          }
          do
          {
            *((_OWORD *)v37 - 1) = *((_OWORD *)v29 - 1);
            v37 -= 16;
            v29 -= 16;
          }
          while (v29 != v30);
          unint64_t v29 = (char *)__p;
          uint64_t v24 = v36 + 16;
          __p = v37;
          uint64_t v165 = v36 + 16;
          uint64_t v166 = &v35[16 * v34];
          if (v29) {
            goto LABEL_27;
          }
LABEL_8:
          uint64_t v165 = v24;
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v160, (uint64_t)v167, 16, v20);
        if (!v21) {
          goto LABEL_53;
        }
      }
    }
LABEL_30:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v161 != v22) {
        objc_enumerationMutation(v13);
      }
      uint64_t v39 = *(void **)(*((void *)&v160 + 1) + 8 * v38);
      uint64_t v40 = objc_msgSend_substroke(v39, v16, v17, v18, v19, v20);
      objc_msgSend_bounds(v40, v41, v42, v43, v44, v45);
      CGFloat MidX = CGRectGetMidX(v169);
      uint64_t v52 = objc_msgSend_substroke(v39, v47, v48, v49, v50, v51);
      objc_msgSend_bounds(v52, v53, v54, v55, v56, v57);
      double MidY = CGRectGetMidY(v170);
      double v59 = MidY;
      uint64_t v60 = (double *)v165;
      if (v165 >= v166)
      {
        uint64_t v62 = (double *)__p;
        uint64_t v63 = (v165 - (unsigned char *)__p) >> 4;
        unint64_t v64 = v63 + 1;
        if ((unint64_t)(v63 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v65 = v166 - (unsigned char *)__p;
        if ((v166 - (unsigned char *)__p) >> 3 > v64) {
          unint64_t v64 = v65 >> 3;
        }
        if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v66 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v66 = v64;
        }
        if (v66)
        {
          if (v66 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v67 = (char *)operator new(16 * v66);
          double v68 = (CGFloat *)&v67[16 * v63];
          *double v68 = MidX;
          v68[1] = v59;
          uint64_t v69 = v68;
          if (v60 != v62)
          {
            do
            {
LABEL_46:
              *((_OWORD *)v69 - 1) = *((_OWORD *)v60 - 1);
              v69 -= 2;
              v60 -= 2;
            }
            while (v60 != v62);
            uint64_t v60 = (double *)__p;
            uint64_t v61 = v68 + 2;
            __p = v69;
            uint64_t v165 = (char *)(v68 + 2);
            uint64_t v166 = &v67[16 * v66];
            if (!v60) {
              goto LABEL_51;
            }
LABEL_50:
            operator delete(v60);
            goto LABEL_51;
          }
        }
        else
        {
          uint64_t v67 = 0;
          double v68 = (CGFloat *)(16 * v63);
          *double v68 = MidX;
          v68[1] = MidY;
          uint64_t v69 = (CGFloat *)(16 * v63);
          if (v60 != v62) {
            goto LABEL_46;
          }
        }
        uint64_t v61 = v68 + 2;
        __p = v69;
        uint64_t v165 = (char *)(v68 + 2);
        uint64_t v166 = &v67[16 * v66];
        if (v60) {
          goto LABEL_50;
        }
      }
      else
      {
        *(CGFloat *)uint64_t v165 = MidX;
        v60[1] = MidY;
        uint64_t v61 = v60 + 2;
      }
LABEL_51:
      uint64_t v165 = (char *)v61;

      if (++v38 == v21)
      {
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v160, (uint64_t)v167, 16, v20);
        if (!v21) {
          break;
        }
        goto LABEL_30;
      }
    }
  }
LABEL_53:

  unint64_t groupingContextSize = v149->_groupingContextSize;
  uint64_t v76 = objc_msgSend_count(v13, v71, v72, v73, v74, v75);
  uint64_t v81 = v149->_groupingContextSize;
  uint64_t v82 = v81;
  if (groupingContextSize >= v76 - v81)
  {
    uint64_t v83 = objc_msgSend_count(v13, v77, v78, v79, v81, v80);
    uint64_t v81 = v149->_groupingContextSize;
    uint64_t v82 = v83 - v81;
  }
  objc_msgSend_flippedCenters_ofSubstrokes_maxStrokesGap_begnning_(v149, v77, (uint64_t)&__p, (uint64_t)v13, v81, 1);
  objc_msgSend_flippedCenters_ofSubstrokes_maxStrokesGap_begnning_(v149, v84, (uint64_t)&__p, (uint64_t)v13, v149->_groupingContextSize, 0);
  double v153 = 0;
  double v154 = 0;
  double v155 = 0;
  uint64_t v90 = (char *)__p;
  uint64_t v89 = v165;
  unint64_t v91 = ((v165 - (unsigned char *)__p) >> 4) + 2 * v82;
  if (v91)
  {
    if (v91 >> 60) {
      sub_1C494A220();
    }
    double v153 = operator new(16 * v91);
    double v154 = (float64x2_t *)v153;
    double v155 = (char *)v153 + 16 * v91;
  }
  uint64_t v92 = v158;
  int64_t v93 = v159;
  unint64_t j = &v153;
  if (v158 != v159)
  {
    do
      sub_1C4BCDF28((char ***)&j, v92++);
    while (v92 != v93);
    uint64_t v90 = (char *)__p;
    uint64_t v89 = v165;
  }
  for (unint64_t j = &v153; v90 != v89; v90 += 16)
    sub_1C4BCDF28((char ***)&j, v90);
  double v95 = v156;
  double v94 = v157;
  unint64_t j = &v153;
  if (v156 != v157)
  {
    do
      sub_1C4BCDF28((char ***)&j, v95++);
    while (v95 != v94);
  }
  unint64_t j = 0;
  double v151 = 0;
  double v152 = 0;
  uint64_t v97 = (float64x2_t *)v153;
  uint64_t v96 = v154;
  size_t v98 = (char *)v154 - (unsigned char *)v153;
  unint64_t v99 = ((char *)v154 - (unsigned char *)v153) >> 4;
  uint64_t v143 = v82;
  if (v154 == v153)
  {
    double v100 = 0;
  }
  else
  {
    if ((v98 & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    double v100 = (char *)operator new(v98);
    unint64_t j = v100;
    double v151 = v100;
    double v152 = &v100[16 * v99];
  }
  uint64_t v101 = v149->_groupingContextSize;
  double v148 = 0.0;
  if (2 * v101 > v99) {
    double v148 = (double)(2 * v101 - v99) / (double)v101;
  }
  if (v96 != v97)
  {
    uint64_t v102 = 0;
    unint64_t v103 = 0;
    float64x2_t v146 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v148, 0);
    do
    {
      uint64_t v105 = v149->_groupingContextSize;
      float64x2_t v106 = 0uLL;
      if (v105 < 2) {
        goto LABEL_85;
      }
      float64x2_t v107 = v97[v103];
      uint64_t v108 = &v97[v102];
      double v109 = 0.0;
      uint64_t v110 = 0xFFFFFFFFFFFFFFFLL;
      for (unint64_t k = 1; k != v105; ++k)
      {
        if (v103 >= k)
        {
          float64x2_t v106 = vaddq_f64(v106, vsubq_f64(v107, v108[v110]));
          double v109 = v109 + 1.0;
          if (v103 + k >= v99) {
            goto LABEL_77;
          }
        }
        else if (v103 + k >= v99)
        {
          goto LABEL_77;
        }
        float64x2_t v106 = vaddq_f64(v106, vsubq_f64(v108[k], v107));
        double v109 = v109 + 1.0;
LABEL_77:
        --v110;
      }
      if (v109 != 0.0) {
        float64x2_t v106 = vdivq_f64(v106, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v109, 0));
      }
LABEL_85:
      double v112 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v106, v106).f64[1]), v106.f64[0], v106.f64[0]));
      if (v112 == 0.0)
      {
        float64x2_t defaultOrientationVector = (float64x2_t)v149->_defaultOrientationVector;
        uint64_t v115 = v152;
        if (v100 >= v152) {
          goto LABEL_91;
        }
LABEL_73:
        *(float64x2_t *)double v100 = defaultOrientationVector;
        f64 = v100 + 16;
        goto LABEL_74;
      }
      float64x2_t v113 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v112, 0);
      float64x2_t defaultOrientationVector = vdivq_f64(v106, v113);
      if (v148 > 0.0) {
        float64x2_t defaultOrientationVector = vdivq_f64(vmlaq_f64(vmulq_n_f64(defaultOrientationVector, 1.0 - v148), (float64x2_t)v149->_defaultOrientationVector, v146), v113);
      }
      uint64_t v115 = v152;
      if (v100 < v152) {
        goto LABEL_73;
      }
LABEL_91:
      uint64_t v116 = (char *)j;
      uint64_t v117 = (v100 - (unsigned char *)j) >> 4;
      unint64_t v118 = v117 + 1;
      if ((unint64_t)(v117 + 1) >> 60) {
        sub_1C494A220();
      }
      uint64_t v119 = v115 - (unsigned char *)j;
      if (v119 >> 3 > v118) {
        unint64_t v118 = v119 >> 3;
      }
      if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v120 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v120 = v118;
      }
      if (!v120)
      {
        uint64_t v121 = 0;
        unint64_t v122 = (float64x2_t *)(16 * v117);
        uint64_t v123 = (float64x2_t *)(16 * v117);
        *uint64_t v123 = defaultOrientationVector;
        f64 = (_OWORD *)v123[1].f64;
        if (v100 == v116) {
          goto LABEL_104;
        }
        do
        {
LABEL_102:
          v122[-1] = *((float64x2_t *)v100 - 1);
          --v122;
          v100 -= 16;
        }
        while (v100 != v116);
        double v100 = (char *)j;
        goto LABEL_104;
      }
      float64x2_t v147 = defaultOrientationVector;
      if (v120 >> 60) {
        sub_1C4949AA8();
      }
      uint64_t v121 = (char *)operator new(16 * v120);
      unint64_t v122 = (float64x2_t *)&v121[16 * v117];
      *unint64_t v122 = v147;
      f64 = (_OWORD *)v122[1].f64;
      if (v100 != v116) {
        goto LABEL_102;
      }
LABEL_104:
      unint64_t j = v122;
      double v151 = f64;
      double v152 = &v121[16 * v120];
      if (v100) {
        operator delete(v100);
      }
LABEL_74:
      double v151 = f64;
      ++v103;
      uint64_t v97 = (float64x2_t *)v153;
      unint64_t v99 = ((char *)v154 - (unsigned char *)v153) >> 4;
      ++v102;
      double v100 = (char *)f64;
    }
    while (v103 < v99);
  }
  objc_msgSend_smoothLocalWritingOrientations_(v149, v85, (uint64_t)&j, v86, v87, v88, v143);
  unint64_t v129 = 0;
  uint64_t v130 = 16 * v144;
  while (v129 < objc_msgSend_count(v13, v124, v125, v126, v127, v128))
  {
    double v135 = *(double *)((char *)j + v130);
    double v136 = *(double *)((char *)j + v130 + 8);
    uint64_t v137 = objc_msgSend_objectAtIndexedSubscript_(v13, v131, v129, v132, v133, v134);
    objc_msgSend_setWritingOrientation_(v137, v138, v139, v140, v141, v142, v135, v136);

    ++v129;
    v130 += 16;
  }
  if (j)
  {
    double v151 = j;
    operator delete(j);
  }
  if (v153)
  {
    double v154 = (float64x2_t *)v153;
    operator delete(v153);
  }
  if (v156)
  {
    double v157 = v156;
    operator delete(v156);
  }
  if (v158)
  {
    uint64_t v159 = v158;
    operator delete(v158);
  }
  if (__p)
  {
    uint64_t v165 = (char *)__p;
    operator delete(__p);
  }
}

- (vector<CGPoint,)flippedCenters:(CHBottomUpStrokeGroupingStrategy *)self ofSubstrokes:(SEL)a3 maxStrokesGap:(const void *)a4 begnning:(id)a5
{
  BOOL v80 = a7;
  id v10 = a5;
  if (a6 >= 0) {
    int64_t v11 = a6;
  }
  else {
    int64_t v11 = a6 + 1;
  }
  if (((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4) - a6 >= (unint64_t)a6) {
    int64_t v12 = a6;
  }
  else {
    int64_t v12 = ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4) - a6;
  }
  __p = 0;
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  uint64_t v76 = retstr;
  uint64_t v77 = v10;
  uint64_t __sz = 16 * v12;
  unint64_t v78 = (unint64_t)v12 >> 60;
  if (v12)
  {
    if ((unint64_t)v12 >> 60) {
      sub_1C494A220();
    }
    uint64_t v13 = 0;
    uint64_t v14 = v11 >> 1;
    __p = operator new(16 * v12);
    uint64_t v84 = (char *)__p;
    uint64_t v85 = (char *)__p + 16 * v12;
    double v19 = 0.0;
    double v20 = 0.0;
    while (1)
    {
      uint64_t v21 = *(double **)a4;
      if (v80)
      {
        uint64_t v22 = v13 + v14;
        uint64_t v23 = &v21[2 * v13 + 2 * v14];
        uint64_t v25 = v84;
        uint64_t v24 = v85;
        if (v84 >= v85) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v22 = ~v13 - v14 + ((uint64_t)(*((void *)a4 + 1) - (void)v21) >> 4);
        uint64_t v23 = &v21[2 * v22];
        uint64_t v25 = v84;
        uint64_t v24 = v85;
        if (v84 >= v85)
        {
LABEL_12:
          uint64_t v26 = a4;
          int64_t v27 = v12;
          uint64_t v28 = v14;
          unint64_t v29 = (char *)__p;
          uint64_t v30 = (v25 - (unsigned char *)__p) >> 4;
          unint64_t v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 60) {
            sub_1C494A220();
          }
          uint64_t v32 = v24 - (unsigned char *)__p;
          if (v32 >> 3 > v31) {
            unint64_t v31 = v32 >> 3;
          }
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v33 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v31;
          }
          if (v33)
          {
            if (v33 >> 60) {
              sub_1C4949AA8();
            }
            unint64_t v34 = (char *)operator new(16 * v33);
          }
          else
          {
            unint64_t v34 = 0;
          }
          double v36 = &v34[16 * v30];
          *(_OWORD *)double v36 = *(_OWORD *)v23;
          unint64_t v37 = v36;
          uint64_t v14 = v28;
          if (v25 != v29)
          {
            do
            {
              *((_OWORD *)v37 - 1) = *((_OWORD *)v25 - 1);
              v37 -= 16;
              v25 -= 16;
            }
            while (v25 != v29);
            uint64_t v25 = v29;
          }
          int64_t v12 = v27;
          uint64_t v38 = &v34[16 * v33];
          unint64_t v35 = v36 + 16;
          __p = v37;
          uint64_t v85 = v38;
          id v10 = v77;
          a4 = v26;
          if (v25) {
            operator delete(v25);
          }
          retstr = v76;
          goto LABEL_30;
        }
      }
      *(_OWORD *)uint64_t v25 = *(_OWORD *)v23;
      unint64_t v35 = v25 + 16;
LABEL_30:
      uint64_t v84 = v35;
      uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v10, v15, v22, v16, v17, v18);
      objc_msgSend_writingOrientation(v39, v40, v41, v42, v43, v44);
      double v46 = v45;
      double v48 = v47;

      double v19 = v19 + v46;
      double v20 = v20 + v48;
      if (++v13 == v12) {
        goto LABEL_33;
      }
    }
  }
  double v20 = 0.0;
  double v19 = 0.0;
LABEL_33:
  double v49 = atan2(v20 / (double)v12, v19 / (double)v12);
  memset(&v82, 0, sizeof(v82));
  CGAffineTransformMakeRotation(&v82, -v49);
  memset(&v81, 0, sizeof(v81));
  CGAffineTransformMakeRotation(&v81, v49);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v12)
  {
    if (v78) {
      sub_1C494A220();
    }
    uint64_t v50 = (CGPoint *)operator new(__sz);
    retstr->__begin_ = v50;
    retstr->__end_ = v50;
    retstr->__end_cap_.__value_ = &v50[v12];
    if (v80) {
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v50 = 0;
    if (v80)
    {
LABEL_36:
      double v51 = **(double **)a4;
      double v52 = *(double *)(*(void *)a4 + 8);
      goto LABEL_39;
    }
  }
  uint64_t v53 = *((void *)a4 + 1);
  double v51 = *(double *)(v53 - 16);
  double v52 = *(double *)(v53 - 8);
LABEL_39:
  double v54 = v82.tx + v52 * v82.c + v82.a * v51;
  if (v12)
  {
    uint64_t v55 = 0;
    while (1)
    {
      uint64_t v57 = (double *)((char *)__p + 16 * v55);
      double v58 = v57[1];
      CGFloat v59 = v82.tx + v58 * v82.c + v82.a * *v57;
      float64x2_t v60 = vaddq_f64(*(float64x2_t *)&v81.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v81.c, v82.ty + v58 * v82.d + v82.b * *v57), *(float64x2_t *)&v81.a, v59 + v54 - v59 + v54 - v59));
      value = retstr->__end_cap_.__value_;
      if (v50 >= value) {
        break;
      }
      *uint64_t v50 = (CGPoint)v60;
      uint64_t v56 = v50 + 1;
LABEL_42:
      retstr->__end_ = v56;
      ++v55;
      uint64_t v50 = v56;
      if (v55 == v12) {
        goto LABEL_60;
      }
    }
    begiuint64_t n = retstr->__begin_;
    uint64_t v63 = v50 - retstr->__begin_;
    unint64_t v64 = v63 + 1;
    if ((unint64_t)(v63 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v65 = (char *)value - (char *)begin;
    if (v65 >> 3 > v64) {
      unint64_t v64 = v65 >> 3;
    }
    if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v66 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v66 = v64;
    }
    if (v66)
    {
      CGPoint v79 = (CGPoint)v60;
      if (v66 >> 60) {
        sub_1C4949AA8();
      }
      uint64_t v67 = (char *)operator new(16 * v66);
      double v68 = (CGPoint *)&v67[16 * v63];
      *double v68 = v79;
      uint64_t v56 = v68 + 1;
      if (v50 == begin) {
        goto LABEL_57;
      }
    }
    else
    {
      uint64_t v67 = 0;
      double v68 = (CGPoint *)(16 * v63);
      *(float64x2_t *)(16 * v63) = v60;
      uint64_t v56 = (CGPoint *)(16 * v63 + 16);
      if (v50 == begin) {
        goto LABEL_57;
      }
    }
    do
    {
      v68[-1] = v50[-1];
      --v68;
      --v50;
    }
    while (v50 != begin);
    uint64_t v50 = retstr->__begin_;
LABEL_57:
    retstr->__begin_ = v68;
    retstr->__end_ = v56;
    retstr->__end_cap_.__value_ = (CGPoint *)&v67[16 * v66];
    if (v50) {
      operator delete(v50);
    }
    goto LABEL_42;
  }
  uint64_t v56 = v50;
LABEL_60:
  if (v80)
  {
    uint64_t v69 = retstr->__begin_;
    if (retstr->__begin_ != v56)
    {
      double v70 = v56 - 1;
      if (&v56[-1] > v69)
      {
        uint64_t v71 = v69 + 1;
        do
        {
          CGPoint v86 = v71[-1];
          CGPoint v72 = v86;
          v71[-1] = *v70;
          *v70-- = v72;
        }
        while (v71++ < v70);
      }
    }
  }
  if (__p)
  {
    uint64_t v84 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

- (BOOL)refineWritingOrientationAndResortSubstrokes:(id)a3 averageWritingOrientation:(CGVector *)a4
{
  v536 = 0;
  p_double x = 0;
  v538 = 0;
  id v516 = a3;
  unint64_t v11 = objc_msgSend_count(v516, v6, v7, v8, v9, v10);
  unint64_t v17 = v11;
  if (v11)
  {
    if (v11 >> 59) {
      sub_1C494A220();
    }
    v536 = (CGRect *)operator new(32 * v11);
    p_double x = &v536->origin.x;
    v538 = &v536[v17];
  }
  v511 = a4;
  v512 = self;
  uint64_t v533 = 0;
  unint64_t v534 = 0;
  id v535 = 0;
  unint64_t v18 = objc_msgSend_count(v516, v12, v13, v14, v15, v16);
  unint64_t v24 = v18;
  if (v18)
  {
    if (v18 >> 61) {
      sub_1C494A220();
    }
    uint64_t v25 = (char *)operator new(8 * v18);
    uint64_t v533 = &v25[v534 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v534 = (unint64_t)v533;
    id v535 = &v25[8 * v24];
  }
  unint64_t v26 = 0;
  double v27 = 0.0;
  while (v26 < objc_msgSend_count(v516, v19, v20, v21, v22, v23))
  {
    unint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v516, v29, v26, v31, v32, v33);
    objc_msgSend_setOriginalWritingDirectionIndex_(v34, v35, v26, v36, v37, v38);
    objc_msgSend_writingOrientation(v34, v39, v40, v41, v42, v43);
    long double v45 = v44;
    objc_msgSend_writingOrientation(v34, v46, v47, v48, v49, v50);
    double v52 = atan2(v45, v51);
    double v58 = objc_msgSend_substroke(v34, v53, v54, v55, v56, v57);
    objc_msgSend_bounds(v58, v59, v60, v61, v62, v63);
    double MidX = CGRectGetMidX(v539);
    double v70 = objc_msgSend_substroke(v34, v65, v66, v67, v68, v69);
    objc_msgSend_bounds(v70, v71, v72, v73, v74, v75);
    double MidY = CGRectGetMidY(v540);

    float v77 = v52;
    __float2 v83 = __sincosf_stret(v77);
    double cosval = v83.__cosval;
    double sinval = v83.__sinval;
    double v515 = v27;
    if (v26)
    {
      uint64_t v85 = objc_msgSend_objectAtIndexedSubscript_(v516, v78, v26 - 1, *(void *)&v80, *(void *)&v81, *(void *)&v82);
      objc_msgSend_writingOrientation(v85, v86, v87, v88, v89, v90);
      double v92 = v91;
      objc_msgSend_writingOrientation(v34, v93, v94, v95, v96, v97);
      double v99 = v98;
      double v104 = objc_msgSend_objectAtIndexedSubscript_(v516, v100, v26 - 1, v101, v102, v103);
      objc_msgSend_writingOrientation(v104, v105, v106, v107, v108, v109);
      double v111 = v110;
      objc_msgSend_writingOrientation(v34, v112, v113, v114, v115, v116);
      double v118 = atan2(v92 + v99, v111 + v117);

      float v119 = v118;
      __float2 v125 = __sincosf_stret(v119);
      double v126 = v125.__cosval;
      double v127 = v125.__sinval;
      double v129 = v513;
      double v128 = v514;
    }
    else
    {
      objc_msgSend_strokeDeviation(v34, v78, *(void *)&v79, *(void *)&v80, *(void *)&v81, *(void *)&v82);
      double v131 = v130;
      objc_msgSend_strokeDeviation(v34, v132, v133, v134, v135, v136);
      double v128 = MidX + v131 * -2.0 * cosval;
      double v129 = MidY + v137 * -2.0 * sinval;
      double v127 = v83.__sinval;
      double v126 = v83.__cosval;
    }
    uint64_t v138 = 0;
    unint64_t v139 = 0;
    double v140 = 1.79769313e308;
    double v141 = -1.79769313e308;
    double v513 = v129;
    double v514 = v128;
    double v518 = v126 * (MidY - v129) - (MidX - v128) * v127 + 0.0;
    double v519 = v127 * (MidY - v129) + (MidX - v128) * v126 + 0.0;
    double v517 = -sinval;
    double v142 = -1.79769313e308;
    double v143 = 1.79769313e308;
    while (1)
    {
      uint64_t v144 = objc_msgSend_substroke(v34, v120, *(void *)&v121, *(void *)&v122, *(void *)&v123, *(void *)&v124);
      uint64_t v150 = objc_msgSend_convexHull(v144, v145, v146, v147, v148, v149);
      uint64_t v151 = v150[1] - *v150;

      if (v139 >= v151 >> 4) {
        break;
      }
      double v157 = objc_msgSend_substroke(v34, v152, v153, v154, v155, v156);
      long long v163 = (double *)(*objc_msgSend_convexHull(v157, v158, v159, v160, v161, v162) + v138);
      double v164 = v141;
      double v165 = MidY;
      double v522 = v143;
      double v166 = v140;
      double v167 = sinval;
      double v168 = *v163;
      double v169 = v163[1];

      double v170 = v168 - MidX;
      double MidY = v165;
      double v171 = v169 - v165;
      double sinval = v167;
      double v140 = v166;
      double v143 = v522;
      double v172 = v519 + cosval * v170 + sinval * v171;
      double v173 = v518 + v517 * v170 + cosval * v171;
      if (v172 < v522) {
        double v143 = v172;
      }
      if (v172 > v142) {
        double v142 = v172;
      }
      if (v173 < v140) {
        double v140 = v173;
      }
      if (v173 <= v164) {
        double v141 = v164;
      }
      else {
        double v141 = v173;
      }
      ++v139;
      v138 += 16;
    }
    double v174 = v142 - v143;
    double v175 = v141 - v140;
    uint64_t v176 = p_x;
    if (p_x < (double *)v538)
    {
      *p_double x = v143;
      v176[1] = v140;
      uint64_t v177 = v176 + 4;
      v176[2] = v174;
      v176[3] = v175;
      goto LABEL_44;
    }
    uint64_t v178 = v536;
    uint64_t v179 = ((char *)p_x - (char *)v536) >> 5;
    unint64_t v180 = v179 + 1;
    if ((unint64_t)(v179 + 1) >> 59) {
      sub_1C494A220();
    }
    uint64_t v181 = (char *)v538 - (char *)v536;
    if (((char *)v538 - (char *)v536) >> 4 > v180) {
      unint64_t v180 = v181 >> 4;
    }
    if ((unint64_t)v181 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v182 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v182 = v180;
    }
    if (v182)
    {
      if (v182 >> 59) {
        sub_1C4949AA8();
      }
      uint64_t v183 = (char *)operator new(32 * v182);
      uint64_t v184 = (double *)&v183[32 * v179];
      *uint64_t v184 = v143;
      v184[1] = v140;
      v184[2] = v174;
      v184[3] = v175;
      uint64_t v185 = (CGRect *)v184;
      if (v176 == (double *)v178)
      {
LABEL_42:
        uint64_t v177 = v184 + 4;
        v536 = v185;
        v538 = (CGRect *)&v183[32 * v182];
        if (!v176) {
          goto LABEL_44;
        }
LABEL_43:
        operator delete(v176);
        goto LABEL_44;
      }
    }
    else
    {
      uint64_t v183 = 0;
      uint64_t v184 = (double *)(32 * v179);
      *uint64_t v184 = v143;
      v184[1] = v140;
      v184[2] = v174;
      v184[3] = v175;
      uint64_t v185 = (CGRect *)(32 * v179);
      if (v176 == (double *)v178) {
        goto LABEL_42;
      }
    }
    do
    {
      CGSize v186 = (CGSize)*((_OWORD *)v176 - 1);
      v185[-1].origiuint64_t n = (CGPoint)*((_OWORD *)v176 - 2);
      v185[-1].size = v186;
      --v185;
      v176 -= 4;
    }
    while (v176 != (double *)v178);
    uint64_t v176 = &v178->origin.x;
    uint64_t v177 = v184 + 4;
    v536 = v185;
    v538 = (CGRect *)&v183[32 * v182];
    if (v176) {
      goto LABEL_43;
    }
LABEL_44:
    p_double x = v177;
    v541.origin.double x = v143;
    v541.origin.CGFloat y = v140;
    v541.size.double width = v142 - v143;
    v541.size.CGFloat height = v175;
    double v187 = CGRectGetMidY(v541);
    double v188 = v187;
    BOOL v189 = (double *)v534;
    if (v534 < (unint64_t)v535)
    {
      *(double *)unint64_t v534 = v187;
      uint64_t v28 = (uint64_t)(v189 + 1);
      goto LABEL_9;
    }
    double v190 = (double *)v533;
    int64_t v191 = v534 - (void)v533;
    uint64_t v192 = (uint64_t)(v534 - (void)v533) >> 3;
    unint64_t v193 = v192 + 1;
    if ((unint64_t)(v192 + 1) >> 61) {
      sub_1C494A220();
    }
    uint64_t v194 = v535 - (unsigned char *)v533;
    if ((v535 - (unsigned char *)v533) >> 2 > v193) {
      unint64_t v193 = v194 >> 2;
    }
    if ((unint64_t)v194 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v195 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v195 = v193;
    }
    if (v195)
    {
      if (v195 >> 61) {
        sub_1C4949AA8();
      }
      CGRect v196 = (char *)operator new(8 * v195);
      CGRect v197 = (double *)&v196[8 * v192];
      *CGRect v197 = v188;
      uint64_t v28 = (uint64_t)(v197 + 1);
      int64_t v198 = (char *)v189 - (char *)v190;
      if (v189 == v190) {
        goto LABEL_62;
      }
LABEL_56:
      unint64_t v199 = v198 - 8;
      if (v199 < 0x58) {
        goto LABEL_215;
      }
      if ((unint64_t)((char *)v189 - v196 - v191) < 0x20) {
        goto LABEL_215;
      }
      uint64_t v200 = (v199 >> 3) + 1;
      uint64_t v201 = 8 * (v200 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v202 = &v189[v201 / 0xFFFFFFFFFFFFFFF8];
      CGRect v197 = (double *)((char *)v197 - v201);
      double v203 = &v196[8 * v192 - 16];
      double v204 = v189 - 2;
      uint64_t v205 = v200 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v206 = *(_OWORD *)v204;
        *((_OWORD *)v203 - 1) = *((_OWORD *)v204 - 1);
        *(_OWORD *)double v203 = v206;
        v203 -= 32;
        v204 -= 4;
        v205 -= 4;
      }
      while (v205);
      BOOL v189 = v202;
      if (v200 != (v200 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_215:
        do
        {
          uint64_t v207 = *((void *)v189-- - 1);
          *((void *)v197-- - 1) = v207;
        }
        while (v189 != v190);
      }
      goto LABEL_62;
    }
    CGRect v196 = 0;
    CGRect v197 = (double *)(8 * v192);
    *(double *)(8 * v192) = v187;
    uint64_t v28 = 8 * v192 + 8;
    int64_t v198 = (char *)v189 - (char *)v190;
    if (v189 != v190) {
      goto LABEL_56;
    }
LABEL_62:
    uint64_t v533 = v197;
    id v535 = &v196[8 * v195];
    if (v190) {
      operator delete(v190);
    }
LABEL_9:
    unint64_t v534 = v28;
    double v27 = v515 + sqrt(v175 * v175 + v174 * v174);

    ++v26;
  }
  uint64_t v208 = objc_msgSend_count(v516, v29, v30, v31, v32, v33);
  uint64_t v210 = v536;
  uint64_t v209 = (CGRect *)p_x;
  uint64_t v531 = 0;
  v532 = 0;
  uint64_t v530 = 0;
  unint64_t v211 = (char *)p_x - (char *)v536;
  if (p_x == (double *)v536)
  {
    uint64_t v212 = 0;
    uint64_t v213 = 0;
  }
  else
  {
    if ((v211 & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    uint64_t v212 = (int64x2_t *)operator new(v211 >> 2);
    uint64_t v530 = v212;
    v532 = &v212->i8[8 * ((uint64_t)v211 >> 5)];
    bzero(v212, v211 >> 2);
    uint64_t v213 = (uint64_t *)((char *)v212->i64 + (v211 >> 2));
    uint64_t v531 = (int64x2_t *)v213;
    if ((v211 >> 2) - 8 < 0x18)
    {
      uint64_t v214 = 0;
      unint64_t v215 = (uint64_t *)v212;
      goto LABEL_72;
    }
    unint64_t v216 = (((v211 >> 2) - 8) >> 3) + 1;
    uint64_t v214 = v216 & 0x3FFFFFFFFFFFFFFCLL;
    unint64_t v215 = &v212->i64[v216 & 0x3FFFFFFFFFFFFFFCLL];
    int64x2_t v217 = (int64x2_t)xmmword_1C4C39B30;
    uint64_t v218 = v212 + 1;
    int64x2_t v219 = vdupq_n_s64(2uLL);
    int64x2_t v220 = vdupq_n_s64(4uLL);
    uint64_t v221 = v216 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v218[-1] = v217;
      *uint64_t v218 = vaddq_s64(v217, v219);
      int64x2_t v217 = vaddq_s64(v217, v220);
      v218 += 2;
      v221 -= 4;
    }
    while (v221);
    if (v216 != v214)
    {
      do
LABEL_72:
        *v215++ = v214++;
      while (v215 != v213);
    }
  }
  v527 = &v536;
  unint64_t v222 = ((char *)v213 - (char *)v212) >> 3;
  unint64_t v223 = 126 - 2 * __clz(v222);
  if (v209 == v210) {
    uint64_t v224 = 0;
  }
  else {
    uint64_t v224 = v223;
  }
  sub_1C4BCE03C(v212->i64, v213, (uint64_t **)&v527, v224, 1);
  v527 = 0;
  uint64_t v528 = 0;
  uint64_t v529 = 0;
  double v230 = v533;
  size_t v231 = v534 - (void)v533;
  uint64_t v232 = (uint64_t)(v534 - (void)v533) >> 3;
  if ((void *)v534 == v533)
  {
    uint64_t v234 = 0;
    id v233 = 0;
    double v235 = v27 / (double)(unint64_t)v208;
    if (v213 == (uint64_t *)v212) {
      goto LABEL_88;
    }
  }
  else
  {
    if ((v231 & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    id v233 = (char *)operator new(v534 - (void)v533);
    uint64_t v234 = (double *)&v233[8 * v232];
    memcpy(v233, v230, v231);
    double v235 = v27 / (double)(unint64_t)v208;
    if (v213 == (uint64_t *)v212)
    {
LABEL_88:
      if (v230) {
        goto LABEL_89;
      }
      goto LABEL_90;
    }
  }
  if (v232 != v222) {
    goto LABEL_88;
  }
  if (v222 <= 1) {
    uint64_t v236 = 1;
  }
  else {
    uint64_t v236 = ((char *)v213 - (char *)v212) >> 3;
  }
  uint64_t v237 = (uint64_t *)v212;
  double v238 = v233;
  do
  {
    uint64_t v239 = *v237++;
    *v238++ = *((void *)v230 + v239);
    --v236;
  }
  while (v236);
LABEL_89:
  unint64_t v534 = (unint64_t)v230;
  operator delete(v230);
LABEL_90:
  unint64_t v240 = 0;
  uint64_t v533 = v233;
  unint64_t v534 = (unint64_t)v234;
  id v535 = (char *)v234;
  double v241 = v235 * 0.7;
  v527 = 0;
  uint64_t v528 = 0;
  int64_t groupingContextSize = v512->_groupingContextSize;
  uint64_t v529 = 0;
  int64_t v523 = groupingContextSize;
  uint64_t v520 = 2 * groupingContextSize;
  while (2)
  {
    if (v240 < objc_msgSend_count(v516, v225, v226, v227, v228, v229))
    {
      uint64_t v253 = v240 + v520;
      if (objc_msgSend_count(v516, v243, v244, v245, v246, v247) - 1 < v240 + v520) {
        uint64_t v253 = objc_msgSend_count(v516, v248, v249, v250, v251, v252) - 1;
      }
      if ((double)v512->_groupingContextSize * 1.5 > (double)(unint64_t)(objc_msgSend_count(v516, v248, v249, v250, v251, v252)+ ~v253))uint64_t v253 = objc_msgSend_count(v516, v254, v255, v256, v257, v258) - 1; {
      unint64_t v264 = objc_msgSend_count(v516, v254, v255, v256, v257, v258);
      }
      unint64_t v265 = v253 + 1 + v523;
      if (v264 < v265) {
        unint64_t v265 = objc_msgSend_count(v516, v259, v260, v261, v262, v263);
      }
      uint64_t v525 = 0;
      uint64_t v526 = 0;
      uint64_t v266 = (v240 - v523) & ~((uint64_t)(v240 - v523) >> 63);
      __p = 0;
      if (v265 != v266)
      {
        uint64_t v267 = (char *)v533 + 8 * v266;
        uint64_t v268 = (char *)v533 + 8 * v265;
        int64_t v269 = v268 - v267;
        if (v268 - v267 < 0) {
          sub_1C494A220();
        }
        __p = operator new(v268 - v267);
        uint64_t v525 = __p;
        uint64_t v270 = (char *)__p + 8 * (v269 >> 3);
        uint64_t v526 = v270;
        memmove(__p, v267, v269);
        uint64_t v525 = v270;
      }
      uint64_t v271 = objc_opt_class();
      objc_msgSend_vectorMeanWithoutOutliers_(v271, v272, (uint64_t)&__p, v273, v274, v275);
      double v277 = v276;
      if ((uint64_t)v240 > v253)
      {
LABEL_103:
        if (__p)
        {
          uint64_t v525 = __p;
          operator delete(__p);
        }
        unint64_t v240 = v253 + 1;
        continue;
      }
      while (2)
      {
        if (vabdd_f64(*((double *)v533 + v240), v277) >= v241) {
          goto LABEL_107;
        }
        v280 = v528;
        if (v528 < v529)
        {
          *(void *)uint64_t v528 = v212->i64[v240];
          uint64_t v278 = (uint64_t)(v280 + 8);
          goto LABEL_106;
        }
        v281 = (char *)v527;
        int64_t v282 = v528 - (unsigned char *)v527;
        uint64_t v283 = (v528 - (unsigned char *)v527) >> 3;
        unint64_t v284 = v283 + 1;
        if ((unint64_t)(v283 + 1) >> 61) {
          sub_1C494A220();
        }
        uint64_t v285 = v529 - (unsigned char *)v527;
        if ((v529 - (unsigned char *)v527) >> 2 > v284) {
          unint64_t v284 = v285 >> 2;
        }
        if ((unint64_t)v285 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v286 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v286 = v284;
        }
        if (v286)
        {
          if (v286 >> 61) {
            sub_1C4949AA8();
          }
          double v287 = (char *)operator new(8 * v286);
          double v288 = &v287[8 * v283];
          *(void *)double v288 = v212->i64[v240];
          uint64_t v278 = (uint64_t)(v288 + 8);
          int64_t v289 = v280 - v281;
          if (v280 == v281)
          {
LABEL_127:
            v527 = v288;
            uint64_t v528 = (char *)v278;
            uint64_t v529 = &v287[8 * v286];
            if (v281) {
              operator delete(v281);
            }
LABEL_106:
            uint64_t v528 = (char *)v278;
LABEL_107:
            if (v240++ == v253) {
              goto LABEL_103;
            }
            continue;
          }
        }
        else
        {
          double v287 = 0;
          double v288 = (char *)(8 * v283);
          *(void *)(8 * v283) = v212->i64[v240];
          uint64_t v278 = 8 * v283 + 8;
          int64_t v289 = v280 - v281;
          if (v280 == v281) {
            goto LABEL_127;
          }
        }
        break;
      }
      unint64_t v290 = v289 - 8;
      if (v290 < 0x58) {
        goto LABEL_216;
      }
      if ((unint64_t)(v280 - v287 - v282) < 0x20) {
        goto LABEL_216;
      }
      uint64_t v291 = (v290 >> 3) + 1;
      uint64_t v292 = 8 * (v291 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v293 = &v280[-v292];
      v288 -= v292;
      uint64_t v294 = &v287[8 * v283 - 16];
      CGRect v295 = v280 - 16;
      uint64_t v296 = v291 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v297 = *(_OWORD *)v295;
        *((_OWORD *)v294 - 1) = *((_OWORD *)v295 - 1);
        *(_OWORD *)uint64_t v294 = v297;
        v294 -= 32;
        v295 -= 32;
        v296 -= 4;
      }
      while (v296);
      v280 = v293;
      if (v291 != (v291 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_216:
        do
        {
          uint64_t v298 = *((void *)v280 - 1);
          v280 -= 8;
          *((void *)v288 - 1) = v298;
          v288 -= 8;
        }
        while (v280 != v281);
      }
      goto LABEL_127;
    }
    break;
  }
  if (v512->_groupingContextSize > (unint64_t)((v528 - (unsigned char *)v527) >> 3))
  {
    unint64_t v299 = 0;
    uint64_t v528 = (char *)v527;
    while (1)
    {
      if (v299 >= objc_msgSend_count(v516, v243, v244, v245, v246, v247)) {
        goto LABEL_154;
      }
      id v301 = v528;
      if (v528 < v529)
      {
        *(void *)uint64_t v528 = v212->i64[v299];
        uint64_t v300 = (uint64_t)(v301 + 8);
        goto LABEL_132;
      }
      double v302 = (char *)v527;
      int64_t v303 = v528 - (unsigned char *)v527;
      uint64_t v304 = (v528 - (unsigned char *)v527) >> 3;
      unint64_t v305 = v304 + 1;
      if ((unint64_t)(v304 + 1) >> 61) {
        sub_1C494A220();
      }
      uint64_t v306 = v529 - (unsigned char *)v527;
      if ((v529 - (unsigned char *)v527) >> 2 > v305) {
        unint64_t v305 = v306 >> 2;
      }
      unint64_t v307 = (unint64_t)v306 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v305;
      if (v307) {
        break;
      }
      long long v308 = 0;
      long long v309 = (char *)(8 * v304);
      *(void *)(8 * v304) = v212->i64[v299];
      uint64_t v300 = 8 * v304 + 8;
      int64_t v310 = v301 - v302;
      if (v301 != v302) {
        goto LABEL_146;
      }
LABEL_152:
      v527 = v309;
      uint64_t v528 = (char *)v300;
      uint64_t v529 = &v308[8 * v307];
      if (v302) {
        operator delete(v302);
      }
LABEL_132:
      uint64_t v528 = (char *)v300;
      ++v299;
    }
    if (v307 >> 61) {
      sub_1C4949AA8();
    }
    long long v308 = (char *)operator new(8 * v307);
    long long v309 = &v308[8 * v304];
    *(void *)long long v309 = v212->i64[v299];
    uint64_t v300 = (uint64_t)(v309 + 8);
    int64_t v310 = v301 - v302;
    if (v301 == v302) {
      goto LABEL_152;
    }
LABEL_146:
    unint64_t v311 = v310 - 8;
    if (v311 < 0x58) {
      goto LABEL_217;
    }
    if ((unint64_t)(v301 - v308 - v303) < 0x20) {
      goto LABEL_217;
    }
    uint64_t v312 = (v311 >> 3) + 1;
    uint64_t v313 = 8 * (v312 & 0x3FFFFFFFFFFFFFFCLL);
    CGRect v314 = &v301[-v313];
    v309 -= v313;
    CGRect v315 = &v308[8 * v304 - 16];
    v316 = v301 - 16;
    uint64_t v317 = v312 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v318 = *(_OWORD *)v316;
      *((_OWORD *)v315 - 1) = *((_OWORD *)v316 - 1);
      *(_OWORD *)CGRect v315 = v318;
      v315 -= 32;
      v316 -= 32;
      v317 -= 4;
    }
    while (v317);
    id v301 = v314;
    if (v312 != (v312 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_217:
      do
      {
        uint64_t v319 = *((void *)v301 - 1);
        v301 -= 8;
        *((void *)v309 - 1) = v319;
        v309 -= 8;
      }
      while (v301 != v302);
    }
    goto LABEL_152;
  }
LABEL_154:
  uint64_t v320 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v243, v244, v245, v246, v247);
  uint64_t v321 = *(void *)v527;
  uint64_t v326 = objc_msgSend_objectAtIndexedSubscript_(v516, v322, *(void *)v527, v323, v324, v325);
  v332 = objc_msgSend_substroke(v326, v327, v328, v329, v330, v331);
  objc_msgSend_bounds(v332, v333, v334, v335, v336, v337);
  CGFloat v339 = v338;
  CGFloat v341 = v340;
  CGFloat v343 = v342;
  CGFloat v345 = v344;

  uint64_t v350 = v527;
  if ((unint64_t)(v528 - (unsigned char *)v527) >= 9)
  {
    uint64_t v351 = &v536[v321];
    double width = v351->size.width;
    CGFloat height = v351->size.height;
    double x = v351->origin.x;
    CGFloat y = v351->origin.y;
    unint64_t v356 = 1;
    while (1)
    {
      uint64_t v357 = v350[v356];
      uint64_t v358 = objc_msgSend_objectAtIndexedSubscript_(v516, v346, v357, v347, v348, v349);
      v542.origin.double x = x;
      v542.origin.CGFloat y = y;
      v542.size.double width = width;
      v542.size.CGFloat height = height;
      CGRect v543 = CGRectIntersection(v542, v536[v357]);
      uint64_t v359 = &v536[v357];
      double v360 = v359->size.width;
      if (width >= v360) {
        double v361 = v359->size.width;
      }
      else {
        double v361 = width;
      }
      if (v361 == 0.0)
      {
        double v362 = v536[v357].origin.x;
        if (width == 0.0)
        {
          double v363 = v360 + v362;
          if (x >= v362 && x <= v363) {
            goto LABEL_169;
          }
        }
        else if (v362 >= x && v362 <= width + x)
        {
LABEL_169:
          id v393 = v358;

          v399 = objc_msgSend_substroke(v393, v394, v395, v396, v397, v398);
          objc_msgSend_bounds(v399, v400, v401, v402, v403, v404);
          v552.origin.double x = v405;
          v552.origin.CGFloat y = v406;
          v552.size.double width = v407;
          v552.size.CGFloat height = v408;
          v546.origin.double x = v339;
          v546.origin.CGFloat y = v341;
          v546.size.double width = v343;
          v546.size.CGFloat height = v345;
          CGRect v547 = CGRectUnion(v546, v552);
          CGFloat v339 = v547.origin.x;
          CGFloat v341 = v547.origin.y;
          CGFloat v343 = v547.size.width;
          CGFloat v345 = v547.size.height;

          v548.origin.double x = x;
          v548.origin.CGFloat y = y;
          v548.size.double width = width;
          v548.size.CGFloat height = height;
          CGRect v549 = CGRectUnion(v548, v536[v357]);
          double x = v549.origin.x;
          CGFloat y = v549.origin.y;
          double width = v549.size.width;
          CGFloat height = v549.size.height;
          goto LABEL_156;
        }
      }
      else if (v543.size.width / v361 > 0.8)
      {
        goto LABEL_169;
      }
      v544.origin.double x = v339;
      v544.origin.CGFloat y = v341;
      v544.size.double width = v343;
      v544.size.CGFloat height = v345;
      double v365 = CGRectGetMidX(v544);
      v545.origin.double x = v339;
      v545.origin.CGFloat y = v341;
      v545.size.double width = v343;
      v545.size.CGFloat height = v345;
      CGFloat v366 = CGRectGetMidY(v545);
      objc_msgSend_setCoalescedCenter_(v326, v367, v368, v369, v370, v371, v365, v366);
      objc_msgSend_addObject_(v320, v372, (uint64_t)v326, v373, v374, v375);
      id v376 = v358;

      uint64_t v382 = objc_msgSend_substroke(v376, v377, v378, v379, v380, v381);
      objc_msgSend_bounds(v382, v383, v384, v385, v386, v387);
      CGFloat v339 = v388;
      CGFloat v341 = v389;
      CGFloat v343 = v390;
      CGFloat v345 = v391;

      uint64_t v392 = &v536[v357];
      double x = v392->origin.x;
      CGFloat y = v392->origin.y;
      double width = v392->size.width;
      CGFloat height = v392->size.height;
LABEL_156:

      ++v356;
      uint64_t v350 = v527;
      uint64_t v326 = v358;
      if (v356 >= (v528 - (unsigned char *)v527) >> 3) {
        goto LABEL_176;
      }
    }
  }
  uint64_t v358 = v326;
LABEL_176:
  v550.origin.double x = v339;
  v550.origin.CGFloat y = v341;
  v550.size.double width = v343;
  v550.size.CGFloat height = v345;
  double v410 = CGRectGetMidX(v550);
  v551.origin.double x = v339;
  v551.origin.CGFloat y = v341;
  v551.size.double width = v343;
  v551.size.CGFloat height = v345;
  CGFloat v411 = CGRectGetMidY(v551);
  objc_msgSend_setCoalescedCenter_(v358, v412, v413, v414, v415, v416, v410, v411);
  objc_msgSend_addObject_(v320, v417, (uint64_t)v358, v418, v419, v420);
  uint64_t v426 = objc_msgSend_count(v516, v421, v422, v423, v424, v425);
  if (v426 == objc_msgSend_count(v320, v427, v428, v429, v430, v431)
    || (unint64_t)objc_msgSend_count(v320, v432, v433, v434, v435, v436) < v512->_groupingContextSize)
  {
    BOOL v440 = 0;

    uint64_t v441 = (char *)v527;
    if (!v527) {
      goto LABEL_180;
    }
    goto LABEL_179;
  }
  objc_msgSend_updateLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(v512, v437, (uint64_t)v320, 1, v438, v439);
  if ((unint64_t)objc_msgSend_count(v320, v443, v444, v445, v446, v447) > v512->_groupingContextSize) {
    objc_msgSend_refineLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(v512, v448, (uint64_t)v320, 1, v451, v452);
  }
  uint64_t v453 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v320, v448, v449, v450, v451, v452); ++i)
  {
    uint64_t v460 = objc_msgSend_objectAtIndexedSubscript_(v320, v455, i, v457, v458, v459);
    uint64_t v471 = objc_msgSend_originalWritingDirectionIndex(v460, v461, v462, v463, v464, v465);
    if (v453 < v471)
    {
      do
      {
        objc_msgSend_writingOrientation(v460, v466, v467, v468, v469, v470);
        double v473 = v472;
        double v475 = v474;
        v480 = objc_msgSend_objectAtIndexedSubscript_(v516, v476, v453, v477, v478, v479);
        objc_msgSend_setWritingOrientation_(v480, v481, v482, v483, v484, v485, v473, v475);

        ++v453;
      }
      while (v471 != v453);
    }

    uint64_t v453 = v471;
  }
  for (unint64_t j = v453 + 1; j < objc_msgSend_count(v516, v455, v456, v457, v458, v459); ++j)
  {
    uint64_t v491 = objc_msgSend_objectAtIndexedSubscript_(v516, v487, v453, v488, v489, v490);
    objc_msgSend_writingOrientation(v491, v492, v493, v494, v495, v496);
    double v498 = v497;
    double v500 = v499;
    uint64_t v505 = objc_msgSend_objectAtIndexedSubscript_(v516, v501, j, v502, v503, v504);
    objc_msgSend_setWritingOrientation_(v505, v506, v507, v508, v509, v510, v498, v500);
  }
  objc_msgSend_sortSubstrokesByWritingDirection_averageWritingOrientation_(v512, v487, (uint64_t)v516, (uint64_t)v511, v489, v490);
  BOOL v440 = 1;

  uint64_t v441 = (char *)v527;
  if (v527)
  {
LABEL_179:
    uint64_t v528 = v441;
    operator delete(v441);
  }
LABEL_180:
  if (v212)
  {
    uint64_t v531 = v212;
    operator delete(v212);
  }
  if (v533)
  {
    unint64_t v534 = (unint64_t)v533;
    operator delete(v533);
  }
  if (v536)
  {
    p_double x = &v536->origin.x;
    operator delete(v536);
  }

  return v440;
}

- (void)updateLocalStrokeDeviationsForSubstrokes:(id)a3 averageStrokeDeviation:(CGVector *)a4
{
  id v249 = a3;
  if ((unint64_t)objc_msgSend_count(v249, v6, v7, v8, v9, v10) < 2)
  {
    for (unint64_t i = 0; i < objc_msgSend_count(v249, v11, v12, v13, v14, v15); ++i)
    {
      uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v249, v17, i, v18, v19, v20);
      double v27 = objc_msgSend_substroke(v21, v22, v23, v24, v25, v26);

      objc_msgSend_bounds(v27, v28, v29, v30, v31, v32);
      ddouble x = v33;
      objc_msgSend_bounds(v27, v35, v36, v37, v38, v39);
      if (dx < self->_defaultDeviationVector.dx) {
        ddouble x = self->_defaultDeviationVector.dx;
      }
      if (v44 >= self->_defaultDeviationVector.dy) {
        dCGFloat y = v44;
      }
      else {
        dCGFloat y = self->_defaultDeviationVector.dy;
      }
      double v46 = objc_msgSend_objectAtIndexedSubscript_(v249, v40, i, v41, v42, v43);
      objc_msgSend_setStrokeDeviation_(v46, v47, v48, v49, v50, v51, dx, dy);

      if (a4)
      {
        a4->ddouble x = dx;
        a4->dCGFloat y = dy;
      }
    }
    goto LABEL_70;
  }
  for (unint64_t j = 0; j < objc_msgSend_count(v249, v11, v12, v13, v14, v15); ++j)
  {
    double v58 = objc_msgSend_objectAtIndexedSubscript_(v249, v53, j, v55, v56, v57);
    unint64_t v64 = objc_msgSend_substroke(v58, v59, v60, v61, v62, v63);

    objc_msgSend_bounds(v64, v65, v66, v67, v68, v69);
    double MidX = CGRectGetMidX(v254);
    objc_msgSend_bounds(v64, v71, v72, v73, v74, v75);
    double MidY = CGRectGetMidY(v255);
    __float2 v81 = objc_msgSend_objectAtIndexedSubscript_(v249, v77, j, v78, v79, v80);
    objc_msgSend_writingOrientation(v81, v82, v83, v84, v85, v86);
    double v88 = v87;
    double v90 = v89;

    uint64_t v96 = 0;
    uint64_t v97 = 0;
    double v98 = 0.0;
    double v99 = 0.0;
    double v100 = 0.0;
    while (1)
    {
      uint64_t v101 = objc_msgSend_convexHull(v64, v91, v92, v93, v94, v95);
      if (v97 >= (unint64_t)((uint64_t)(v101[1] - *v101) >> 4)) {
        break;
      }
      uint64_t v107 = (double *)(*objc_msgSend_convexHull(v64, v102, v103, v104, v105, v106) + v96);
      double v108 = MidX - *v107;
      double v109 = MidY - v107[1];
      double v100 = v100 + fabs(v90 * v109 + v108 * v88) * 2.0;
      double v110 = fabs(v88 * v109 - v108 * v90);
      double v99 = v99 + v110 * 2.0;
      if (v110 > v98) {
        double v98 = v110;
      }
      ++v97;
      v96 += 16;
    }
    if ((unint64_t)v97 > 1)
    {
      double v100 = v100 / (double)v97;
      double v99 = v99 / (double)v97;
    }
    if (v100 <= v99) {
      double v111 = v99;
    }
    else {
      double v111 = v100;
    }
    double strokeDeviationCapCoeff = self->_strokeDeviationCapCoeff;
    double v247 = v111;
    if (j)
    {
      double v112 = objc_msgSend_objectAtIndexedSubscript_(v249, v102, j - 1, v104, v105, v106);
      double v118 = objc_msgSend_substroke(v112, v113, v114, v115, v116, v117);
      objc_msgSend_bounds(v118, v119, v120, v121, v122, v123);
      double v245 = CGRectGetMidX(v256);
      double v129 = objc_msgSend_substroke(v112, v124, v125, v126, v127, v128);
      objc_msgSend_bounds(v129, v130, v131, v132, v133, v134);
      double v244 = CGRectGetMidY(v257);

      unint64_t v139 = objc_msgSend_objectAtIndexedSubscript_(v249, v135, j - 1, v136, v137, v138);
      objc_msgSend_writingOrientation(v139, v140, v141, v142, v143, v144);
      double v146 = v145;
      uint64_t v151 = objc_msgSend_objectAtIndexedSubscript_(v249, v147, j - 1, v148, v149, v150);
      objc_msgSend_writingOrientation(v151, v152, v153, v154, v155, v156);
      double v157 = (v88 + v146) * 0.5;
      double v159 = (v90 + v158) * 0.5;

      double v100 = v100 + fabs((MidY - v244) * v159 + (MidX - v245) * v157);
      double v160 = fabs((MidY - v244) * v157 - (MidX - v245) * v159);
      if (v160 > v98) {
        double v98 = v160;
      }

      double v161 = 3.0;
    }
    else
    {
      double v161 = 2.0;
    }
    uint64_t v162 = objc_msgSend_objectAtIndexedSubscript_(v249, v102, j, v104, v105, v106);
    double v168 = v162;
    double v169 = v247 * strokeDeviationCapCoeff;
    if (v98 >= v247 * strokeDeviationCapCoeff) {
      double v170 = v247 * strokeDeviationCapCoeff;
    }
    else {
      double v170 = v98;
    }
    if (v100 / v161 < v169) {
      double v169 = v100 / v161;
    }
    objc_msgSend_setStrokeDeviation_(v162, v163, v164, v165, v166, v167, v169, v170);
  }
  __p = 0;
  uint64_t v251 = 0;
  uint64_t v252 = 0;
  unint64_t v171 = objc_msgSend_count(v249, v53, v54, v55, v56, v57);
  unint64_t v177 = v171;
  if (v171)
  {
    if (v171 >> 60) {
      sub_1C494A220();
    }
    __p = (float64x2_t *)operator new(16 * v171);
    uint64_t v251 = (double *)__p;
    uint64_t v252 = &__p[v177];
  }
  for (unint64_t k = 0; k < objc_msgSend_count(v249, v172, v173, v174, v175, v176); ++k)
  {
    uint64_t v185 = objc_msgSend_objectAtIndexedSubscript_(v249, v180, k, v182, v183, v184);
    objc_msgSend_strokeDeviation(v185, v186, v187, v188, v189, v190);
    double v192 = v191;
    double v194 = v193;

    double v201 = self->_defaultDeviationVector.dx;
    double v200 = self->_defaultDeviationVector.dy;
    double v202 = v200;
    double v203 = v201;
    if (k)
    {
      double v204 = objc_msgSend_objectAtIndexedSubscript_(v249, v195, k - 1, v197, v198, v199);
      objc_msgSend_strokeDeviation(v204, v205, v206, v207, v208, v209);
      double v203 = v210;
      double v202 = v211;
    }
    if (k < objc_msgSend_count(v249, v195, v196, v197, v198, v199) - 1)
    {
      uint64_t v212 = objc_msgSend_objectAtIndexedSubscript_(v249, v172, k + 1, v174, v175, v176);
      objc_msgSend_strokeDeviation(v212, v213, v214, v215, v216, v217);
      double v201 = v218;
      double v200 = v219;
    }
    double v220 = v192 * 0.5 + v203 * 0.25 + v201 * 0.25;
    double v221 = v194 * 0.5 + v202 * 0.25 + v200 * 0.25;
    unint64_t v222 = (float64x2_t *)v251;
    if (v251 < (double *)v252)
    {
      *uint64_t v251 = v220;
      v251[1] = v221;
      uint64_t v179 = v251 + 2;
      goto LABEL_40;
    }
    uint64_t v223 = ((char *)v251 - (char *)__p) >> 4;
    unint64_t v224 = v223 + 1;
    if ((unint64_t)(v223 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v225 = (char *)v252 - (char *)__p;
    if (((char *)v252 - (char *)__p) >> 3 > v224) {
      unint64_t v224 = v225 >> 3;
    }
    if ((unint64_t)v225 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v226 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v226 = v224;
    }
    if (v226)
    {
      if (v226 >> 60) {
        sub_1C4949AA8();
      }
      uint64_t v227 = (char *)operator new(16 * v226);
      uint64_t v228 = (double *)&v227[16 * v223];
      *uint64_t v228 = v220;
      v228[1] = v221;
      uint64_t v229 = (uint64_t)v228;
      if (v251 == (double *)__p)
      {
LABEL_61:
        uint64_t v179 = v228 + 2;
        __p = (float64x2_t *)v229;
        uint64_t v252 = (float64x2_t *)&v227[16 * v226];
        if (!v251) {
          goto LABEL_40;
        }
LABEL_62:
        operator delete(v222);
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v227 = 0;
      uint64_t v228 = (double *)(16 * v223);
      *uint64_t v228 = v220;
      v228[1] = v221;
      uint64_t v229 = 16 * v223;
      if (v251 == (double *)__p) {
        goto LABEL_61;
      }
    }
    do
    {
      *(float64x2_t *)(v229 - 16) = v222[-1];
      v229 -= 16;
      --v222;
    }
    while (v222 != __p);
    unint64_t v222 = __p;
    uint64_t v179 = v228 + 2;
    __p = (float64x2_t *)v229;
    uint64_t v252 = (float64x2_t *)&v227[16 * v226];
    if (v222) {
      goto LABEL_62;
    }
LABEL_40:
    uint64_t v251 = v179;
  }
  unint64_t v230 = 0;
  float64x2_t v248 = 0u;
  while (v230 < objc_msgSend_count(v249, v180, v181, v182, v183, v184))
  {
    f64 = __p[v230].f64;
    double v236 = *f64;
    double v237 = f64[1];
    double v238 = objc_msgSend_objectAtIndexedSubscript_(v249, v231, v230, v232, v233, v234);
    objc_msgSend_setStrokeDeviation_(v238, v239, v240, v241, v242, v243, v236, v237);

    float64x2_t v248 = vaddq_f64(v248, __p[v230++]);
  }
  if (a4) {
    *(float64x2_t *)a4 = vdivq_f64(v248, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(unint64_t)(((char *)v251 - (char *)__p) >> 4)), 0));
  }
  if (__p) {
    operator delete(__p);
  }
LABEL_70:
}

- (void)mergeGroupsPostProcessing:(id)a3 createdGroups:(id)a4 deletedGroups:(id)a5 availableGroupingStrategies:(id)a6 allowOppositeOrientations:(BOOL)a7 groupStatistics:(id)a8
{
  v9[0] = 0;
  v9[1] = 0;
  uint64_t v8 = (uint64_t *)v9;
  sub_1C4BC08D4((uint64_t)self, a3, a4, a5, a6, a7, &v8, a8);
  sub_1C49A1374(v9[0]);
}

- (id)tryRegroupingStrokesInGroup:(id)a3 substrokePlacementsByStrokeIdentifier:(id)a4 cancellationBlock:(id)a5
{
  uint64_t v348 = *MEMORY[0x1E4F143B8];
  id v330 = a3;
  id v326 = a4;
  uint64_t v329 = (uint64_t (**)(void))a5;
  v327 = self;
  uint64_t v324 = objc_msgSend_strokeProvider(self, v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v13, v14, v15, v16, v17);
  id v328 = v18;
  uint64_t v24 = objc_msgSend_strokeIdentifiers(v330, v19, v20, v21, v22, v23);
  unint64_t v30 = objc_msgSend_count(v24, v25, v26, v27, v28, v29);
  unint64_t splitMinimumStrokeCount = self->_splitMinimumStrokeCount;

  if (v30 >= splitMinimumStrokeCount)
  {
    uint64_t v38 = objc_msgSend_strokeIdentifiers(v330, v32, v33, v34, v35, v36);
    double v44 = objc_msgSend_allObjects(v38, v39, v40, v41, v42, v43);
    v343[0] = MEMORY[0x1E4F143A8];
    v343[1] = 3221225472;
    v343[2] = sub_1C4BCBF78;
    v343[3] = &unk_1E64E1868;
    id v325 = v324;
    id v344 = v325;
    uint64_t v323 = objc_msgSend_sortedArrayUsingComparator_(v44, v45, (uint64_t)v343, v46, v47, v48);

    uint64_t v331 = objc_msgSend_lastObject(v323, v49, v50, v51, v52, v53);
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    uint64_t v63 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v58, v59, v60, v61, v62);
    long long v341 = 0u;
    long long v342 = 0u;
    long long v339 = 0u;
    long long v340 = 0u;
    uint64_t v69 = objc_msgSend_writingDirectionSortedSubstrokes(v330, v64, v65, v66, v67, v68);
    uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v339, (uint64_t)v347, 16, v71);
    r1[0] = *(id *)&x;
    if (v77)
    {
      uint64_t v78 = *(void *)v340;
      CGFloat v79 = y;
      CGFloat v80 = width;
      CGFloat v81 = height;
      do
      {
        for (uint64_t i = 0; i != v77; ++i)
        {
          if (*(void *)v340 != v78) {
            objc_enumerationMutation(v69);
          }
          uint64_t v83 = *(void **)(*((void *)&v339 + 1) + 8 * i);
          objc_msgSend_rotatedBounds(v83, v72, v73, v74, v75, v76);
          v359.origin.CGFloat x = v84;
          v359.origin.CGFloat y = v85;
          v359.size.CGFloat width = v86;
          v359.size.double height = v87;
          v350.origin.CGFloat x = x;
          v350.origin.CGFloat y = y;
          v350.size.CGFloat width = width;
          v350.size.double height = height;
          CGRect v351 = CGRectUnion(v350, v359);
          CGFloat x = v351.origin.x;
          CGFloat y = v351.origin.y;
          CGFloat width = v351.size.width;
          double height = v351.size.height;
          uint64_t v93 = objc_msgSend_substroke(v83, v88, v89, v90, v91, v92);
          double v99 = objc_msgSend_strokeIdentifier(v93, v94, v95, v96, v97, v98);
          int isEqual = objc_msgSend_isEqual_(v99, v100, (uint64_t)v331, v101, v102, v103);

          if (isEqual)
          {
            objc_msgSend_rotatedBounds(v83, v105, v106, v107, v108, v109);
            v360.origin.CGFloat x = v110;
            v360.origin.CGFloat y = v111;
            v360.size.CGFloat width = v112;
            v360.size.double height = v113;
            *(id *)&v352.origin.CGFloat x = r1[0];
            v352.origin.CGFloat y = v79;
            v352.size.CGFloat width = v80;
            v352.size.double height = v81;
            CGRect v353 = CGRectUnion(v352, v360);
            r1[0] = *(id *)&v353.origin.x;
            CGFloat v79 = v353.origin.y;
            CGFloat v80 = v353.size.width;
            CGFloat v81 = v353.size.height;
          }
          objc_msgSend_rotatedBounds(v83, v105, v106, v107, v108, v109);
          double MaxX = CGRectGetMaxX(v354);
          uint64_t v120 = objc_msgSend_substroke(v83, v115, v116, v117, v118, v119);
          uint64_t v126 = objc_msgSend_strokeIdentifier(v120, v121, v122, v123, v124, v125);
          uint64_t v131 = objc_msgSend_objectForKey_(v63, v127, (uint64_t)v126, v128, v129, v130);

          if (v131)
          {
            objc_msgSend_floatValue(v131, v132, v133, v134, v135, v136);
            double v143 = v142;
            if (MaxX >= v143) {
              double v143 = MaxX;
            }
            uint64_t v144 = objc_msgSend_numberWithDouble_(NSNumber, v137, v138, v139, v140, v141, v143);
            uint64_t v150 = objc_msgSend_substroke(v83, v145, v146, v147, v148, v149);
            uint64_t v156 = objc_msgSend_strokeIdentifier(v150, v151, v152, v153, v154, v155);
            objc_msgSend_setObject_forKey_(v63, v157, (uint64_t)v144, (uint64_t)v156, v158, v159);
          }
          else
          {
            uint64_t v144 = objc_msgSend_numberWithDouble_(NSNumber, v132, v133, v134, v135, v136, MaxX);
            uint64_t v150 = objc_msgSend_substroke(v83, v160, v161, v162, v163, v164);
            uint64_t v156 = objc_msgSend_strokeIdentifier(v150, v165, v166, v167, v168, v169);
            objc_msgSend_setObject_forKey_(v63, v170, (uint64_t)v144, (uint64_t)v156, v171, v172);
          }
        }
        uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v339, (uint64_t)v347, 16, v76);
      }
      while (v77);
    }
    else
    {
      CGFloat v79 = y;
      CGFloat v80 = width;
      CGFloat v81 = height;
    }

    v355.origin.CGFloat x = x;
    v355.origin.CGFloat y = y;
    v355.size.CGFloat width = width;
    v355.size.double height = height;
    double v321 = CGRectGetMaxX(v355);
    *(id *)&v356.origin.CGFloat x = r1[0];
    v356.origin.CGFloat y = v79;
    v356.size.CGFloat width = v80;
    v356.size.double height = v81;
    double v320 = CGRectGetMaxX(v356);
    objc_msgSend_averageStrokeDeviation(v330, v173, v174, v175, v176, v177);
    double v179 = v178;
    *(id *)&v357.origin.CGFloat x = r1[0];
    v357.origin.CGFloat y = v79;
    v357.size.CGFloat width = v80;
    v357.size.double height = v81;
    double MinY = CGRectGetMinY(v357);
    v358.origin.CGFloat x = x;
    v358.origin.CGFloat y = y;
    v358.size.CGFloat width = width;
    v358.size.double height = height;
    double v185 = CGRectGetMinY(v358);
    if (v321 - v320 >= v179 || MinY - v185 >= height * 0.5)
    {
      long long v337 = 0u;
      long long v338 = 0u;
      long long v335 = 0u;
      long long v336 = 0u;
      id v187 = v323;
      uint64_t v190 = 0;
      uint64_t v191 = 0;
      uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v188, (uint64_t)&v335, (uint64_t)v346, 16, v189);
      if (v196)
      {
        uint64_t v197 = *(void *)v336;
        double v198 = -3.40282347e38;
        do
        {
          for (uint64_t j = 0; j != v196; ++j)
          {
            if (*(void *)v336 != v197) {
              objc_enumerationMutation(v187);
            }
            double v200 = objc_msgSend_objectForKeyedSubscript_(v63, v192, *(void *)(*((void *)&v335 + 1) + 8 * j), v193, v194, v195);
            objc_msgSend_floatValue(v200, v201, v202, v203, v204, v205);
            float v207 = v206;

            objc_msgSend_averageStrokeDeviation(v330, v208, v209, v210, v211, v212);
            double v213 = v207;
            double v215 = v198 - v214;
            if (v198 <= v207) {
              double v216 = v207;
            }
            else {
              double v216 = v198;
            }
            if (v190 <= v191) {
              uint64_t v217 = v191;
            }
            else {
              uint64_t v217 = v190;
            }
            if (v215 <= v213)
            {
              ++v191;
            }
            else
            {
              uint64_t v190 = v217;
              uint64_t v191 = 0;
            }
            if (v215 > v213) {
              double v198 = -3.40282347e38;
            }
            else {
              double v198 = v216;
            }
          }
          uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v192, (uint64_t)&v335, (uint64_t)v346, 16, v195);
        }
        while (v196);
      }

      if (v190 <= v191) {
        uint64_t v223 = v191;
      }
      else {
        uint64_t v223 = v190;
      }
      double splitMaxNaturalIndexDiffThreshold = (double)v327->_splitMaxNaturalIndexDiffThreshold;
      if ((double)v223 * 0.8 <= splitMaxNaturalIndexDiffThreshold) {
        double splitMaxNaturalIndexDiffThreshold = (double)v223 * 0.8;
      }
      if (splitMaxNaturalIndexDiffThreshold >= (double)v327->_splitMinimumStrokeCount) {
        double v225 = splitMaxNaturalIndexDiffThreshold;
      }
      else {
        double v225 = (double)v327->_splitMinimumStrokeCount;
      }
      unint64_t v226 = objc_msgSend_writingDirectionSortedStrokeIdentifiers(v330, v218, v219, v220, v221, v222);
      v322 = objc_msgSend_firstObject(v226, v227, v228, v229, v230, v231);

      uint64_t v241 = objc_msgSend_indexOfObject_(v187, v232, (uint64_t)v322, v233, v234, v235);
      uint64_t v242 = 0;
      for (unint64_t k = 1; ; ++k)
      {
        double v244 = objc_msgSend_writingDirectionSortedStrokeIdentifiers(v330, v236, v237, v238, v239, v240);
        BOOL v250 = k < objc_msgSend_count(v244, v245, v246, v247, v248, v249);

        if (!v250) {
          break;
        }
        CGRect v256 = objc_msgSend_writingDirectionSortedStrokeIdentifiers(v330, v251, v252, v253, v254, v255);
        uint64_t v261 = objc_msgSend_objectAtIndexedSubscript_(v256, v257, k, v258, v259, v260);

        uint64_t v266 = objc_msgSend_indexOfObject_(v187, v262, (uint64_t)v261, v263, v264, v265);
        uint64_t v267 = v266;
        uint64_t v268 = v266 - v241;
        if (v266 - v241 < 0) {
          uint64_t v268 = v241 - v266;
        }
        if (v268 > (uint64_t)v225) {
          ++v242;
        }

        uint64_t v241 = v267;
      }
      int64_t v269 = objc_msgSend_writingDirectionSortedStrokeIdentifiers(v330, v251, v252, v253, v254, v255);
      if ((double)(unint64_t)(objc_msgSend_count(v269, v270, v271, v272, v273, v274) - 1) * 0.3 < 2.0)
      {
        uint64_t v287 = 2;
      }
      else
      {
        v280 = objc_msgSend_writingDirectionSortedStrokeIdentifiers(v330, v275, v276, v277, v278, v279);
        uint64_t v286 = objc_msgSend_count(v280, v281, v282, v283, v284, v285);

        uint64_t v287 = (uint64_t)((double)(unint64_t)(v286 - 1) * 0.3);
      }

      if (v242 <= v287)
      {
        uint64_t v317 = v328;
        objc_msgSend_addObject_(v328, v288, (uint64_t)v330, v290, v291, v292);
      }
      else
      {
        uint64_t v293 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v288, v289, v290, v291, v292);
        objc_msgSend_addObject_(v293, v294, (uint64_t)v330, v295, v296, v297);
        long long v333 = 0u;
        long long v334 = 0u;
        memset(&r1[1], 0, 32);
        r1[0] = v187;
        uint64_t v300 = objc_msgSend_countByEnumeratingWithState_objects_count_(r1[0], v298, (uint64_t)&r1[1], (uint64_t)v345, 16, v299);
        if (v300)
        {
          uint64_t v301 = *(void *)r1[3];
LABEL_62:
          uint64_t v302 = 0;
          while (1)
          {
            if (*(void *)r1[3] != v301) {
              objc_enumerationMutation(r1[0]);
            }
            uint64_t v303 = *((void *)r1[2] + v302);
            if (v329[2]()) {
              break;
            }
            uint64_t v304 = (void *)MEMORY[0x1C8786C20]();
            long long v309 = objc_msgSend_strokeIdentifierFromData_(v325, v305, v303, v306, v307, v308);
            CGRect v314 = objc_msgSend_strokeForIdentifier_(v325, v310, (uint64_t)v309, v311, v312, v313);
            sub_1C4BBEBA4((uint64_t)v327, v328, 0, 0, v314, 0, v326, v293, 0, 0, 0, v329);

            if (v300 == ++v302)
            {
              uint64_t v300 = objc_msgSend_countByEnumeratingWithState_objects_count_(r1[0], v315, (uint64_t)&r1[1], (uint64_t)v345, 16, v316);
              if (v300) {
                goto LABEL_62;
              }
              break;
            }
          }
        }

        uint64_t v317 = v328;
      }
      id v318 = v317;
    }
    else
    {
      objc_msgSend_addObject_(v328, v181, (uint64_t)v330, v182, v183, v184);
      id v186 = v328;
    }

    uint64_t v18 = v328;
  }
  else
  {
    objc_msgSend_addObject_(v18, v32, (uint64_t)v330, v34, v35, v36);
    id v37 = v18;
  }

  return v328;
}

- (id)regroupedStrokeGroup:(id)a3 fromResult:(id)a4 withAdversarialGroup:(id)a5 allSubstrokesByStrokeIdentifier:(id)a6 cancellationBlock:(id)a7
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  id v190 = a3;
  id v189 = a4;
  id v188 = a5;
  id v198 = a6;
  double v192 = (uint64_t (**)(void))a7;
  uint64_t v12 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v190, v13, v12, v14, v15, v16)
    && (uint64_t v21 = objc_opt_class(), (objc_msgSend_isMemberOfClass_(v189, v22, v21, v23, v24, v25) & 1) != 0))
  {
    id v187 = objc_msgSend_strokeProvider(self, v17, v26, v18, v19, v20);
    if (!v187)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v32 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
      }
    }
    objc_msgSend_set(MEMORY[0x1E4F1CA80], v27, v28, v29, v30, v31);
    id v191 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_strokeIdentifiers(v190, v33, v34, v35, v36, v37);
    double v44 = objc_msgSend_allObjects(v38, v39, v40, v41, v42, v43);
    v220[0] = MEMORY[0x1E4F143A8];
    v220[1] = 3221225472;
    v220[2] = sub_1C4BCC948;
    v220[3] = &unk_1E64E1868;
    id v201 = v187;
    id v221 = v201;
    id v186 = objc_msgSend_sortedArrayUsingComparator_(v44, v45, (uint64_t)v220, v46, v47, v48);

    double v200 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v49, v50, v51, v52, v53);
    uint64_t v59 = objc_msgSend_substrokePlacementsByStrokeIdentifier(v189, v54, v55, v56, v57, v58);
    objc_msgSend_addEntriesFromDictionary_(v200, v60, (uint64_t)v59, v61, v62, v63);

    uint64_t v199 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v64, v65, v66, v67, v68);
    long long v218 = 0u;
    long long v219 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    objc_msgSend_strokeIdentifiers(v188, v69, v70, v71, v72, v73);
    v75 = uint64_t v74 = v201;
    id obj = v75;
    uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v216, (uint64_t)v230, 16, v77);
    if (v78)
    {
      id v194 = *(id *)v217;
      do
      {
        uint64_t v196 = v78;
        for (uint64_t i = 0; i != v196; ++i)
        {
          if (*(id *)v217 != v194) {
            objc_enumerationMutation(obj);
          }
          uint64_t v202 = objc_msgSend_strokeIdentifierFromData_(v74, v79, *(void *)(*((void *)&v216 + 1) + 8 * i), v80, v81, v82);
          uint64_t v204 = objc_msgSend_strokeForIdentifier_(v74, v84, (uint64_t)v202, v85, v86, v87);
          objc_msgSend_addObject_(v199, v88, (uint64_t)v204, v89, v90, v91);
          uint64_t v97 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v92, v93, v94, v95, v96);
          long long v214 = 0u;
          long long v215 = 0u;
          long long v212 = 0u;
          long long v213 = 0u;
          uint64_t v103 = objc_msgSend_encodedStrokeIdentifier(v204, v98, v99, v100, v101, v102);
          uint64_t v108 = objc_msgSend_objectForKey_(v198, v104, (uint64_t)v103, v105, v106, v107);

          uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v109, (uint64_t)&v212, (uint64_t)v229, 16, v110);
          if (v111)
          {
            uint64_t v112 = *(void *)v213;
            do
            {
              for (uint64_t j = 0; j != v111; ++j)
              {
                if (*(void *)v213 != v112) {
                  objc_enumerationMutation(v108);
                }
                uint64_t v114 = *(void *)(*((void *)&v212 + 1) + 8 * j);
                uint64_t v115 = [CHSubstrokePlacement alloc];
                uint64_t v120 = objc_msgSend_initWithSubstroke_(v115, v116, v114, v117, v118, v119);
                objc_msgSend_setWritingOrientation_(v120, v121, v122, v123, v124, v125, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
                objc_msgSend_addObject_(v97, v126, (uint64_t)v120, v127, v128, v129);
              }
              uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v130, (uint64_t)&v212, (uint64_t)v229, 16, v131);
            }
            while (v111);
          }

          uint64_t v137 = objc_msgSend_encodedStrokeIdentifier(v204, v132, v133, v134, v135, v136);
          objc_msgSend_setObject_forKey_(v200, v138, (uint64_t)v97, (uint64_t)v137, v139, v140);

          uint64_t v74 = v201;
        }
        uint64_t v75 = obj;
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v79, (uint64_t)&v216, (uint64_t)v230, 16, v82);
      }
      while (v78);
    }

    uint64_t v197 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v141, v142, v143, v144, v145);
    objc_msgSend_addObject_(v197, v146, (uint64_t)v190, v147, v148, v149);
    v211[0] = 0;
    v211[1] = 0;
    uint64_t v210 = (uint64_t *)v211;
    uint64_t v203 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v150, v151, v152, v153, v154);
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v195 = v186;
    uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v195, v155, (uint64_t)&v206, (uint64_t)v228, 16, v156);
    if (v157)
    {
      uint64_t v205 = *(void *)v207;
LABEL_25:
      uint64_t v158 = 0;
      while (1)
      {
        if (*(void *)v207 != v205) {
          objc_enumerationMutation(v195);
        }
        uint64_t v159 = *(void *)(*((void *)&v206 + 1) + 8 * v158);
        if (v192[2]()) {
          break;
        }
        double v160 = (void *)MEMORY[0x1C8786C20]();
        uint64_t v165 = objc_msgSend_strokeIdentifierFromData_(v201, v161, v159, v162, v163, v164);
        uint64_t v174 = objc_msgSend_strokeForIdentifier_(v201, v166, (uint64_t)v165, v167, v168, v169);
        if (v174)
        {
          sub_1C4BBEBA4((uint64_t)self, v191, 0, 0, v174, v199, v200, v197, 0, 0, 0, v192);
          sub_1C4BC08D4((uint64_t)self, v191, 0, 0, 0, 0, &v210, v203);
        }
        else
        {
          int isValidStrokeIdentifier = objc_msgSend_isValidStrokeIdentifier_(v201, v170, (uint64_t)v165, v171, v172, v173);
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v176 = (id)qword_1EA3C9FA8;
          if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v182 = objc_msgSend_strokeProviderVersion(v201, v177, v178, v179, v180, v181);
            *(_DWORD *)buf = 138412802;
            uint64_t v223 = v165;
            __int16 v224 = 2112;
            double v225 = v182;
            __int16 v226 = 1024;
            int v227 = isValidStrokeIdentifier;
            _os_log_impl(&dword_1C492D000, v176, OS_LOG_TYPE_DEFAULT, "Failed to get stroke with id: %@ from stroke provider version %@, isValid ? %d", buf, 0x1Cu);
          }
        }

        if (v157 == ++v158)
        {
          uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v195, v183, (uint64_t)&v206, (uint64_t)v228, 16, v184);
          if (v157) {
            goto LABEL_25;
          }
          break;
        }
      }
    }

    sub_1C49A1374(v211[0]);
  }
  else
  {
    objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v17, (uint64_t)v190, v18, v19, v20);
    id v191 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v191;
}

- (double)relativeOverlapOfGroup:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v6, v9, v8, v10, v11, v12)
    && (uint64_t v18 = objc_opt_class(), (objc_msgSend_isMemberOfClass_(v7, v19, v18, v20, v21, v22) & 1) != 0))
  {
    id v23 = v6;
    id v191 = v7;
    uint64_t v24 = sub_1C4BCADF4(self, v23, 0);
    uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0, v26, v27, v28);
    objc_msgSend_floatValue(v29, v30, v31, v32, v33, v34);
    float v36 = v35;

    uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v24, v37, 1, v38, v39, v40);
    objc_msgSend_floatValue(v41, v42, v43, v44, v45, v46);
    float v48 = v47;

    objc_msgSend_bounds(v23, v49, v50, v51, v52, v53);
    double MinX = CGRectGetMinX(v194);
    objc_msgSend_bounds(v23, v55, v56, v57, v58, v59);
    double MaxY = CGRectGetMaxY(v195);
    uint64_t v61 = sub_1C4BCADF4(self, v191, 0);
    uint64_t v66 = objc_msgSend_objectAtIndexedSubscript_(v61, v62, 0, v63, v64, v65);
    objc_msgSend_floatValue(v66, v67, v68, v69, v70, v71);
    float v73 = v72;

    uint64_t v78 = objc_msgSend_objectAtIndexedSubscript_(v61, v74, 1, v75, v76, v77);
    objc_msgSend_floatValue(v78, v79, v80, v81, v82, v83);
    float v85 = v84;

    id v86 = v23;
    id v87 = v191;
    double v88 = v87;
    if (v48 <= v85)
    {

      id v89 = v86;
      objc_msgSend_bounds(v88, v158, v159, v160, v161, v162);
      double MinX = CGRectGetMinX(v198);
      objc_msgSend_bounds(v88, v163, v164, v165, v166, v167);
      double MaxY = CGRectGetMaxY(v199);
      uint64_t v90 = v88;
      float v36 = v73;
    }
    else
    {
      id v89 = v87;
      uint64_t v90 = v86;
    }
    double v168 = -v36;
    sub_1C4BCB0CC((uint64_t *)v193, MinX, MaxY, v168, (uint64_t)CHBottomUpStrokeGroupingStrategy, v90);
    sub_1C4BCB0CC((uint64_t *)__p, MinX, MaxY, v168, (uint64_t)CHBottomUpStrokeGroupingStrategy, v89);
    objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v169, (uint64_t)v193, 0x7FFFFFFFFFFFFFFFLL, 0, v170);
    CGFloat v172 = v171;
    CGFloat v174 = v173;
    double v176 = v175;
    double v178 = v177;
    objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v179, (uint64_t)__p, 0x7FFFFFFFFFFFFFFFLL, 0, v180);
    v203.origin.CGFloat x = v181;
    v203.origin.CGFloat y = v182;
    double v184 = v183;
    double v186 = v185;
    v200.origin.CGFloat x = v172;
    v200.origin.CGFloat y = v174;
    v200.size.double width = v176;
    v200.size.double height = v178;
    v203.size.double width = v184;
    v203.size.double height = v186;
    CGRect v201 = CGRectIntersection(v200, v203);
    double width = v201.size.width;
    double height = v201.size.height;
    if (v176 * v178 >= v184 * v186) {
      double v189 = v184 * v186;
    }
    else {
      double v189 = v176 * v178;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v193[0])
    {
      v193[1] = v193[0];
      operator delete(v193[0]);
    }
    double v157 = width * height / v189;
  }
  else
  {
    objc_msgSend_bounds(v6, v13, v14, v15, v16, v17);
    CGFloat v92 = v91;
    CGFloat v94 = v93;
    CGFloat v96 = v95;
    CGFloat v98 = v97;
    objc_msgSend_bounds(v7, v99, v100, v101, v102, v103);
    v202.origin.CGFloat x = v104;
    v202.origin.CGFloat y = v105;
    v202.size.double width = v106;
    v202.size.double height = v107;
    v196.origin.CGFloat x = v92;
    v196.origin.CGFloat y = v94;
    v196.size.double width = v96;
    v196.size.double height = v98;
    CGRect v197 = CGRectIntersection(v196, v202);
    double v108 = v197.size.width;
    double v109 = v197.size.height;
    objc_msgSend_bounds(v6, v110, v111, v112, v113, v114, v197.origin.x, v197.origin.y);
    double v116 = v115;
    objc_msgSend_bounds(v6, v117, v118, v119, v120, v121);
    double v123 = v122;
    objc_msgSend_bounds(v7, v124, v125, v126, v127, v128);
    double v130 = v129;
    objc_msgSend_bounds(v7, v131, v132, v133, v134, v135);
    double v141 = v116 * v123;
    if (v116 * v123 >= v130 * v142)
    {
      objc_msgSend_bounds(v7, v136, v137, v138, v139, v140, v141);
      double v144 = v151;
      objc_msgSend_bounds(v7, v152, v153, v154, v155, v156);
    }
    else
    {
      objc_msgSend_bounds(v6, v136, v137, v138, v139, v140, v141);
      double v144 = v143;
      objc_msgSend_bounds(v6, v145, v146, v147, v148, v149);
    }
    double v157 = v108 * v109 / (v144 * v150);
  }

  return v157;
}

- (BOOL)isInlineContinuousMode
{
  return self->_isInlineContinuousMode;
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