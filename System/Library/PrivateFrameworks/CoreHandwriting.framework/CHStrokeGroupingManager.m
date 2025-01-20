@interface CHStrokeGroupingManager
+ (id)identifyStableStrokeIdentifiersUsingOrderedStrokeIdentifiers:(id)a3 prevOrderedStrokeIdentifiers:(id)a4 strokeClassificationResult:(id)a5 prevStrokeClassificationResult:(id)a6;
+ (id)mergeableStrokeGroupClustersFromSortedStrokeGroups:(id)a3;
+ (id)sortedGroupsBySizeDescending:(id)a3;
- (BOOL)isInlineContinuousMode;
- (CHGroupingModel)strokeGroupingModel;
- (CHStrokeGroupingManager)initWithStrokeProvider:(id)a3 strokeGroupingModel:(id)a4 locales:(id)a5 isInlineContinuousMode:(BOOL)a6 inlineContinuousModeTargets:(id)a7 isMathMode:(BOOL)a8;
- (CHStrokeProvider)strokeProvider;
- (NSArray)locales;
- (NSArray)textInputTargets;
- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8;
- (id)strokesForIdentifiers:(id)a3;
- (id)updateGroupingResult:(id)a3 addingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 orderedStrokeIdentifiers:(id)a6 lastOrderedStrokeIdentifiers:(id)a7 strokeClassificationResult:(id)a8 lastStrokeClassificationResult:(id)a9 cancellationBlock:(id)a10;
@end

@implementation CHStrokeGroupingManager

- (CHStrokeGroupingManager)initWithStrokeProvider:(id)a3 strokeGroupingModel:(id)a4 locales:(id)a5 isInlineContinuousMode:(BOOL)a6 inlineContinuousModeTargets:(id)a7 isMathMode:(BOOL)a8
{
  BOOL v9 = a6;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v105 = a4;
  id v108 = a5;
  id v109 = a7;
  v115.receiver = self;
  v115.super_class = (Class)CHStrokeGroupingManager;
  v106 = [(CHStrokeGroupingManager *)&v115 init];
  if (v106)
  {
    objc_storeStrong((id *)&v106->_strokeProvider, a3);
    objc_storeStrong((id *)&v106->_strokeGroupingModel, a4);
    objc_storeStrong((id *)&v106->_locales, a5);
    v106->_isInlineContinuousMode = v9;
    objc_storeStrong((id *)&v106->_textInputTargets, a7);
    v20 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16, v17, v18, v19);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F203D9B0, v21, (uint64_t)&v111, (uint64_t)v116, 16, v22);
    if (v28)
    {
      uint64_t v29 = *(void *)v112;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v112 != v29) {
            objc_enumerationMutation(&unk_1F203D9B0);
          }
          v31 = *(void **)(*((void *)&v111 + 1) + 8 * v30);
          uint64_t v32 = objc_msgSend_integerValue(v31, v23, v24, v25, v26, v27);
          v38 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v33, v34, v35, v36, v37);
          if (v9)
          {
            v39 = [CHTopDownStrokeGroupingStrategy alloc];
            v45 = objc_msgSend_firstObject(v108, v40, v41, v42, v43, v44);
            v48 = objc_msgSend_initWithStrokeProvider_locale_textInputTargets_(v39, v46, (uint64_t)v14, (uint64_t)v45, (uint64_t)v109, v47);

            v54 = objc_msgSend_strategyIdentifier(v48, v49, v50, v51, v52, v53);
            objc_msgSend_setObject_forKey_(v38, v55, (uint64_t)v48, (uint64_t)v54, v56, v57);
          }
          else if (a8 || v32 == 3)
          {
            v69 = [CHMathStrokeGroupingStrategy alloc];
            v75 = objc_msgSend_strokeGroupingModel(v106, v70, v71, v72, v73, v74);
            v48 = objc_msgSend_initWithStrokeProvider_strokeGroupingModel_(v69, v76, (uint64_t)v14, (uint64_t)v75, v77, v78);

            v54 = objc_msgSend_strategyIdentifier(v48, v79, v80, v81, v82, v83);
            objc_msgSend_setObject_forKey_(v38, v84, (uint64_t)v48, (uint64_t)v54, v85, v86);
          }
          else
          {
            v58 = [CHBottomUpStrokeGroupingStrategy alloc];
            if (v32 == 2) {
              isInlineContinuousMode_inlineContinuousModeTargets = objc_msgSend_initWithStrokeProvider_defaultWritingOrientation_locales_isInlineContinuousMode_inlineContinuousModeTargets_(v58, v59, (uint64_t)v14, 2, (uint64_t)v108, 0, v109);
            }
            else {
              isInlineContinuousMode_inlineContinuousModeTargets = objc_msgSend_initWithStrokeProvider_defaultWritingOrientation_locales_isInlineContinuousMode_inlineContinuousModeTargets_(v58, v59, (uint64_t)v14, 1, (uint64_t)v108, 0, v109);
            }
            v48 = isInlineContinuousMode_inlineContinuousModeTargets;
            v54 = objc_msgSend_strategyIdentifier(isInlineContinuousMode_inlineContinuousModeTargets, v61, v62, v63, v64, v65);
            objc_msgSend_setObject_forKey_(v38, v66, (uint64_t)v48, (uint64_t)v54, v67, v68);
          }

          if (!objc_msgSend_count(v38, v87, v88, v89, v90, v91))
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v97 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v97, OS_LOG_TYPE_FAULT, "At least one stroke grouping strategy must be set.", buf, 2u);
            }
          }
          v98 = objc_msgSend_copy(v38, v92, v93, v94, v95, v96);
          objc_msgSend_setObject_forKeyedSubscript_(v20, v99, (uint64_t)v98, (uint64_t)v31, v100, v101);

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F203D9B0, v23, (uint64_t)&v111, (uint64_t)v116, 16, v27);
      }
      while (v28);
    }
    uint64_t v102 = objc_msgSend_copy(v20, v23, v24, v25, v26, v27);
    groupingStrategiesByIdentifierForTextStrokeClasses = v106->_groupingStrategiesByIdentifierForTextStrokeClasses;
    v106->_groupingStrategiesByIdentifierForTextStrokeClasses = (NSDictionary *)v102;
  }
  return v106;
}

+ (id)sortedGroupsBySizeDescending:(id)a3
{
  v6 = objc_msgSend_allObjects(a3, a2, (uint64_t)a3, v3, v4, v5);
  v11 = objc_msgSend_sortedArrayUsingComparator_(v6, v7, (uint64_t)&unk_1F2012AD0, v8, v9, v10);
  uint64_t v17 = objc_msgSend_mutableCopy(v11, v12, v13, v14, v15, v16);

  return v17;
}

+ (id)mergeableStrokeGroupClustersFromSortedStrokeGroups:(id)a3
{
  id v3 = a3;
  uint64_t v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7, v8);
  if (objc_msgSend_count(v3, v10, v11, v12, v13, v14))
  {
    unint64_t v20 = 0;
    uint64_t v21 = -1;
    while (v20 < objc_msgSend_count(v3, v15, v16, v17, v18, v19) - 1)
    {
      uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v3, v22, v20, v24, v25, v26);
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v3, v28, v20 + 1, v29, v30, v31);
      uint64_t v38 = objc_msgSend_classification(v27, v33, v34, v35, v36, v37);
      if (objc_msgSend_isStrokeClassificationTextOrMath_(CHStrokeUtilities, v39, v38, v40, v41, v42))
      {
        uint64_t v48 = objc_msgSend_classification(v32, v43, v44, v45, v46, v47);
        if ((objc_msgSend_isStrokeClassificationTextOrMath_(CHStrokeUtilities, v49, v48, v50, v51, v52) & 1) != 0
          && (objc_msgSend_isStrokeGroup_inlineWithNextGroup_(CHStrokeUtilities, v53, (uint64_t)v27, (uint64_t)v32, v54, v55) & 1) != 0)
        {
          if (v21 == -1
            || (objc_msgSend_objectAtIndexedSubscript_(v9, v56, v21, v57, v58, v59),
                v60 = objc_claimAutoreleasedReturnValue(),
                char v65 = objc_msgSend_containsObject_(v60, v61, (uint64_t)v27, v62, v63, v64),
                v60,
                (v65 & 1) == 0))
          {
            v66 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1CA48], v56, (uint64_t)v27, v57, v58, v59, v32, 0);
            objc_msgSend_addObject_(v9, v71, (uint64_t)v66, v72, v73, v74);
            ++v21;
          }
          else
          {
            v66 = objc_msgSend_objectAtIndexedSubscript_(v9, v56, v21, v57, v58, v59);
            objc_msgSend_addObject_(v66, v67, (uint64_t)v32, v68, v69, v70);
          }
        }
      }

      ++v20;
    }
    id v75 = (id)objc_msgSend_copy(v9, v22, v23, v24, v25, v26);
  }
  else
  {
    id v75 = v9;
  }
  v76 = v75;

  return v76;
}

- (id)updateGroupingResult:(id)a3 addingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 orderedStrokeIdentifiers:(id)a6 lastOrderedStrokeIdentifiers:(id)a7 strokeClassificationResult:(id)a8 lastStrokeClassificationResult:(id)a9 cancellationBlock:(id)a10
{
  uint64_t v1541 = *MEMORY[0x1E4F143B8];
  id v1331 = a3;
  id v1320 = a4;
  id v1326 = a5;
  id v1328 = a6;
  id v1327 = a7;
  id v1347 = a8;
  id v1346 = a9;
  v1358 = (uint64_t (**)(void))a10;
  v1425 = self;
  v1322 = objc_msgSend_strokeProvider(self, v16, v17, v18, v19, v20);
  if (!v1322)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v22 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v22, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }
  }
  v1338 = objc_msgSend_identifyStableStrokeIdentifiersUsingOrderedStrokeIdentifiers_prevOrderedStrokeIdentifiers_strokeClassificationResult_prevStrokeClassificationResult_(CHStrokeGroupingManager, v21, (uint64_t)v1328, (uint64_t)v1327, (uint64_t)v1347, (uint64_t)v1346, v1320);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v23 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = objc_msgSend_count(v1328, v24, v25, v26, v27, v28);
    uint64_t v35 = objc_msgSend_count(v1327, v30, v31, v32, v33, v34);
    uint64_t v41 = objc_msgSend_strokeGroups(v1331, v36, v37, v38, v39, v40);
    uint64_t v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);
    uint64_t v53 = objc_msgSend_count(v1338, v48, v49, v50, v51, v52);
    *(_DWORD *)buf = 134218752;
    uint64_t v1534 = v29;
    __int16 v1535 = 2048;
    uint64_t v1536 = v35;
    __int16 v1537 = 2048;
    uint64_t v1538 = v47;
    __int16 v1539 = 2048;
    uint64_t v1540 = v53;
    _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_DEFAULT, "Update grouping for %ld strokes, last strokes %ld, input groups = %ld, with %ld stable identifiers.", buf, 0x2Au);
  }
  v1337 = objc_msgSend_differenceFromResult_removedStrokeIds_(v1347, v54, (uint64_t)v1346, (uint64_t)v1326, v55, v56);
  unint64_t v57 = 0x1E4F1C000uLL;
  v1323 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v58, v59, v60, v61, v62);
  v1324 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v63, v64, v65, v66, v67);
  v1325 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v68, v69, v70, v71, v72);
  v1334 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v73, v74, v75, v76, v77);
  v1335 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v78, v79, v80, v81, v82);
  v1336 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v83, v84, v85, v86, v87);
  v1340 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v88, v89, v90, v91, v92);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v1388 = v1331;
    v98 = objc_msgSend_groupingResultsByStrategyIdentifier(v1388, v93, v94, v95, v96, v97);
    objc_msgSend_addEntriesFromDictionary_(v1340, v99, (uint64_t)v98, v100, v101, v102);

    unint64_t v57 = 0x1E4F1C000;
  }
  else
  {
    id v1388 = 0;
  }
  v1378 = (uint64_t (**)(uint64_t (**)(void)))(v1358 + 2);
  if ((v1358[2]() & 1) == 0)
  {
    id v1375 = v1347;
    id v1389 = v1337;
    id v1372 = v1346;
    id v1379 = v1388;
    id v1420 = v1323;
    id v1414 = v1324;
    id v1369 = v1325;
    v1363 = v1358;
    if (!self)
    {
LABEL_75:

      goto LABEL_76;
    }
    v1348 = objc_msgSend_set(*(void **)(v57 + 2688), v108, v109, v110, v111, v112);
    v1359 = objc_msgSend_set(*(void **)(v57 + 2688), v113, v114, v115, v116, v117);
    v123 = objc_msgSend_addedNonTextStrokeIdentifiers(v1389, v118, v119, v120, v121, v122);
    v1500[0] = MEMORY[0x1E4F143A8];
    v1500[1] = 3221225472;
    v1500[2] = sub_1C49E9B6C;
    v1500[3] = &unk_1E64E1D38;
    id v124 = v1375;
    id v1501 = v124;
    id v125 = v1348;
    id v1502 = v125;
    id v126 = v1359;
    id v1503 = v126;
    objc_msgSend_enumerateObjectsUsingBlock_(v123, v127, (uint64_t)v1500, v128, v129, v130);

    v1344 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v131, v132, v133, v134, v135);
    v1342 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v136, v137, v138, v139, v140);
    v146 = objc_msgSend_removedNonTextStrokeIdentifiers(v1389, v141, v142, v143, v144, v145);
    v1496[0] = MEMORY[0x1E4F143A8];
    v1496[1] = 3221225472;
    v1496[2] = sub_1C49E9C58;
    v1496[3] = &unk_1E64E1D38;
    id v147 = v1372;
    id v1497 = v147;
    id v148 = v1344;
    id v1498 = v148;
    id v149 = v1342;
    id v1499 = v149;
    objc_msgSend_enumerateObjectsUsingBlock_(v146, v150, (uint64_t)v1496, v151, v152, v153);

    *(void *)&long long v1486 = 0;
    *((void *)&v1486 + 1) = &v1486;
    *(void *)&long long v1487 = 0x2020000000;
    BYTE8(v1487) = 0;
    v159 = objc_msgSend_transitionedNonTextStrokeIdentifiers(v1389, v154, v155, v156, v157, v158);
    *(void *)&long long v1526 = MEMORY[0x1E4F143A8];
    *((void *)&v1526 + 1) = 3221225472;
    *(void *)&long long v1527 = sub_1C49E9D44;
    *((void *)&v1527 + 1) = &unk_1E64E1D60;
    id v1407 = v124;
    *(void *)&long long v1528 = v1407;
    *((void *)&v1528 + 1) = v147;
    id v1361 = v148;
    *(void *)&long long v1529 = v1361;
    id v160 = v126;
    *((void *)&v1529 + 1) = v160;
    id v1366 = v149;
    id v1530 = v1366;
    id v1381 = v125;
    id v1531 = v1381;
    v1532 = &v1486;
    objc_msgSend_enumerateObjectsUsingBlock_(v159, v161, (uint64_t)&v1526, v162, v163, v164);

    if (*(unsigned char *)(*((void *)&v1486 + 1) + 24) || objc_msgSend_count(v1381, v165, v166, v167, v168, v169))
    {
      *(unsigned char *)(*((void *)&v1486 + 1) + 24) = 1;
      if (!v1379)
      {
LABEL_20:
        objc_msgSend_strokeProvider(self, v165, v166, v167, v168, v169);
        id v1427 = (id)objc_claimAutoreleasedReturnValue();
        long long v1507 = 0u;
        long long v1506 = 0u;
        long long v1505 = 0u;
        long long v1504 = 0u;
        obuint64_t j = v160;
        uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v180, (uint64_t)&v1504, (uint64_t)buf, 16, v181);
        if (v185)
        {
          uint64_t v186 = *(void *)v1505;
          do
          {
            uint64_t v187 = 0;
            do
            {
              if (*(void *)v1505 != v186) {
                objc_enumerationMutation(obj);
              }
              uint64_t v188 = *(void *)(*((void *)&v1504 + 1) + 8 * v187);
              v189 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v182, v188, (uint64_t)v1427, v183, v184);
              v195 = v189;
              if (v189)
              {
                v201 = objc_msgSend_encodedStrokeIdentifier(v189, v190, v191, v192, v193, v194);
                if (!v201
                  || (objc_msgSend_encodedStrokeIdentifier(v195, v196, v197, v198, v199, v200),
                      v202 = objc_claimAutoreleasedReturnValue(),
                      char isEqual = objc_msgSend_isEqual_(v202, v203, v188, v204, v205, v206),
                      v202,
                      v201,
                      (isEqual & 1) == 0))
                {
                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  v213 = (id)qword_1EA3C9F90[0];
                  if (os_log_type_enabled(v213, OS_LOG_TYPE_FAULT))
                  {
                    v219 = objc_msgSend_encodedStrokeIdentifier(v195, v214, v215, v216, v217, v218);
                    *(_DWORD *)v1508 = 138412546;
                    *(void *)&v1508[4] = v219;
                    *(_WORD *)&v1508[12] = 2112;
                    *(void *)&v1508[14] = v188;
                    _os_log_impl(&dword_1C492D000, v213, OS_LOG_TYPE_FAULT, "Unexpected mismatch encodedStrokeIdentifier in _handleNonTextStrokes, encoded stroke identifier is %@, encoded stroke identifier in strokeProvider is %@.", v1508, 0x16u);
                  }
                }
                v220 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v1407, v208, v209, v210, v211, v212);
                v225 = objc_msgSend_objectForKey_(v220, v221, v188, v222, v223, v224);
                uint64_t v231 = objc_msgSend_integerValue(v225, v226, v227, v228, v229, v230);

                v232 = [CHStrokeGroup alloc];
                v237 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v233, v188, v234, v235, v236);
                objc_msgSend_bounds(v195, v238, v239, v240, v241, v242);
                double v244 = v243;
                double v246 = v245;
                double v248 = v247;
                double v250 = v249;
                objc_msgSend_bounds(v195, v251, v252, v253, v254, v255);
                StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigiunint64_t n = objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v232, v256, (uint64_t)v237, v188, v188, v231, @"groupingManagerNonText", v244, v246, v248, v250, 1.0, v257, v258);

                objc_msgSend_addObject_(v1420, v260, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v261, v262, v263);
                objc_msgSend_addObject_(v1414, v264, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v265, v266, v267);
              }
              else
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigiunint64_t n = (id)qword_1EA3C9F90[0];
                if (os_log_type_enabled(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v1508 = 138412290;
                  *(void *)&v1508[4] = v188;
                  _os_log_impl(&dword_1C492D000, StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, OS_LOG_TYPE_FAULT, "Unexpected nil stroke in _handleNonTextStrokes, encoded stroke identifier is %@. Skipping", v1508, 0xCu);
                }
              }

              ++v187;
            }
            while (v185 != v187);
            uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v182, (uint64_t)&v1504, (uint64_t)buf, 16, v184);
          }
          while (v185);
        }

        if (*(unsigned char *)(*((void *)&v1486 + 1) + 24))
        {
          v273 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v274 = objc_msgSend_count(v1381, v268, v269, v270, v271, v272);
          v279 = objc_msgSend_arrayWithCapacity_(v273, v275, v274, v276, v277, v278);
          *(void *)v1508 = MEMORY[0x1E4F143A8];
          *(void *)&v1508[8] = 3221225472;
          *(void *)&v1508[16] = sub_1C49EA204;
          v1509 = &unk_1E64E1DB0;
          id v280 = v1427;
          id v1510 = v280;
          id v1356 = v279;
          id v1511 = v1356;
          objc_msgSend_enumerateObjectsUsingBlock_(v1381, v281, (uint64_t)v1508, v282, v283, v284);
          v285 = [CHFastStrokeGroupingStrategy alloc];
          v291 = objc_msgSend_locales(v1425, v286, v287, v288, v289, v290);
          v1354 = objc_msgSend_initWithStrokeProvider_locales_clutterFilter_(v285, v292, (uint64_t)v280, (uint64_t)v291, 0, v293);

          v1350 = objc_msgSend_groupingResultUsingStrokes_distanceMetric_mergingDistanceThreshold_clusteringLinkage_anchorPoints_shouldCancel_(v1354, v294, (uint64_t)v1356, 0, 1, 1, v1363, 125.0);
          v300 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v1407, v295, v296, v297, v298, v299);
          id v301 = v1350;
          id v1408 = v1356;
          id v1398 = v300;
          unint64_t v302 = 0x1E4F1C000uLL;
          v1352 = v301;
          v1384 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v303, v304, v305, v306, v307);
          if (v301)
          {
            objc_msgSend_fastGroupingClusters(v301, v308, v309, v310, v311, v312);
            v317 = (char *)__p[1];
            if (__p[1] != __p[0])
            {
              uint64_t v318 = 0;
              v317 = (char *)__p[0];
              do
              {
                uint64_t v1394 = v318;
                v319 = &v317[72 * v318];
                v324 = objc_msgSend_setWithCapacity_(*(void **)(v302 + 2688), v313, *((void *)v319 + 7), v314, v315, v316);
                v319 += 40;
                v327 = *(void **)v319;
                v325 = v319 + 8;
                v326 = v327;
                if (v327 == v325)
                {
                  id v328 = 0;
                  v343 = 0;
                }
                else
                {
                  id v328 = 0;
                  v329 = 0;
                  uint64_t v330 = 0;
                  double v331 = *MEMORY[0x1E4F1DAD8];
                  double v332 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
                  double x = *MEMORY[0x1E4F1DB20];
                  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
                  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
                  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
                  do
                  {
                    v337 = objc_msgSend_objectAtIndexedSubscript_(v1408, v320, v326[4], v321, v322, v323);
                    v343 = objc_msgSend_encodedStrokeIdentifier(v337, v338, v339, v340, v341, v342);
                    v348 = objc_msgSend_objectForKey_(v1398, v344, (uint64_t)v343, v345, v346, v347);
                    uint64_t v354 = objc_msgSend_integerValue(v348, v349, v350, v351, v352, v353);

                    if (v330) {
                      uint64_t v359 = v330;
                    }
                    else {
                      uint64_t v359 = v354;
                    }
                    if (v359 == v354) {
                      uint64_t v330 = v359;
                    }
                    else {
                      uint64_t v330 = 5;
                    }
                    objc_msgSend_addObject_(v324, v355, (uint64_t)v343, v356, v357, v358);
                    if (!v328)
                    {
                      id v328 = v343;
                      objc_msgSend_bounds(v337, v365, v366, v367, v368, v369);
                      double v331 = v370;
                      double v332 = v371;
                    }
                    objc_msgSend_bounds(v337, v360, v361, v362, v363, v364);
                    v1545.origin.double x = v372;
                    v1545.origin.double y = v373;
                    v1545.size.double width = v374;
                    v1545.size.double height = v375;
                    v1543.origin.double x = x;
                    v1543.origin.double y = y;
                    v1543.size.double width = width;
                    v1543.size.double height = height;
                    CGRect v1544 = CGRectUnion(v1543, v1545);
                    double x = v1544.origin.x;
                    double y = v1544.origin.y;
                    double width = v1544.size.width;
                    double height = v1544.size.height;

                    v376 = (void *)v326[1];
                    if (v376)
                    {
                      do
                      {
                        v377 = v376;
                        v376 = (void *)*v376;
                      }
                      while (v376);
                    }
                    else
                    {
                      do
                      {
                        v377 = (void *)v326[2];
                        BOOL v378 = *v377 == (void)v326;
                        v326 = v377;
                      }
                      while (!v378);
                    }
                    v329 = v343;
                    v326 = v377;
                  }
                  while (v377 != v325);
                  if (v328 && v343)
                  {
                    v379 = [CHStrokeGroup alloc];
                    v381 = objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v379, v380, (uint64_t)v324, (uint64_t)v328, (uint64_t)v343, v330, @"groupingManagerNonText", x, y, width, height, 1.0, v331, v332);
                    objc_msgSend_addObject_(v1384, v382, (uint64_t)v381, v383, v384, v385);
                  }
                }

                uint64_t v318 = v1394 + 1;
                v317 = (char *)__p[0];
                unint64_t v302 = 0x1E4F1C000;
              }
              while (v1394 + 1 < 0x8E38E38E38E38E39 * (((char *)__p[1] - (char *)__p[0]) >> 3));
            }
            v386 = v1384;
            id v387 = v1384;
            if (v317)
            {
              v388 = v317;
              if (__p[1] != v317)
              {
                v389 = (char *)__p[1] - 32;
                do
                {
                  v390 = v389 - 40;
                  sub_1C4999C7C((uint64_t)v389, *((void **)v389 + 1));
                  sub_1C494AC4C((uint64_t)(v389 - 40), *((void **)v389 - 4));
                  v389 -= 72;
                }
                while (v390 != v317);
                v388 = (char *)__p[0];
              }
              __p[1] = v317;
              operator delete(v388);
              v386 = v1384;
            }
          }
          else
          {
            v386 = v1384;
            id v391 = v1384;
          }

          v392 = [CHCTLD alloc];
          v397 = objc_msgSend_initWithType_(v392, v393, 2, v394, v395, v396);
          v403 = objc_msgSend_allObjects(v1384, v398, v399, v400, v401, v402);
          v408 = objc_msgSend_mergeStrokeGroups_(v397, v404, (uint64_t)v403, v405, v406, v407);

          objc_msgSend_addObjectsFromArray_(v1420, v409, (uint64_t)v408, v410, v411, v412);
          objc_msgSend_addObjectsFromArray_(v1414, v413, (uint64_t)v408, v414, v415, v416);
        }
        _Block_object_dispose(&v1486, 8);

        goto LABEL_75;
      }
    }
    else
    {
      BOOL v1306 = objc_msgSend_count(v1361, v165, v166, v167, v168, v169) != 0;
      *(unsigned char *)(*((void *)&v1486 + 1) + 24) = v1306;
      if (!v1379) {
        goto LABEL_20;
      }
    }
    v170 = objc_msgSend_strokeGroups(v1379, v165, v166, v167, v168, v169);
    uint64_t v1515 = MEMORY[0x1E4F143A8];
    uint64_t v1516 = 3221225472;
    v1517 = sub_1C49E9F38;
    v1518 = &unk_1E64E1D88;
    v1525 = &v1486;
    id v1519 = v1366;
    id v1520 = v1369;
    id v1521 = v1389;
    id v1522 = v1407;
    id v1523 = v1381;
    id v1524 = v160;
    v175 = objc_msgSend_objectsPassingTest_(v170, v171, (uint64_t)&v1515, v172, v173, v174);
    objc_msgSend_unionSet_(v1420, v176, (uint64_t)v175, v177, v178, v179);

    goto LABEL_20;
  }
LABEL_76:
  long long v1454 = 0u;
  long long v1455 = 0u;
  long long v1452 = 0u;
  long long v1453 = 0u;
  if (v1425) {
    objc_msgSend_allKeys(v1425->_groupingStrategiesByIdentifierForTextStrokeClasses, v103, v104, v105, v106, v107);
  }
  else {
    objc_msgSend_allKeys(0, v103, v104, v105, v106, v107);
  }
  id v1330 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1330, v417, (uint64_t)&v1452, (uint64_t)v1495, 16, v418);
  if (v1332)
  {
    uint64_t v1333 = *(void *)v1453;
    if (v1425)
    {
LABEL_80:
      uint64_t v1357 = 0;
      while (1)
      {
        if (*(void *)v1453 != v1333) {
          objc_enumerationMutation(v1330);
        }
        v419 = *(void **)(*((void *)&v1452 + 1) + 8 * v1357);
        if (v1358[2]()) {
          goto LABEL_161;
        }
        id v420 = v419;
        id v421 = v1347;
        id v422 = v1337;
        id v1343 = v1346;
        id v1355 = v1388;
        id v1376 = v1338;
        id obja = v1334;
        id v1395 = v1335;
        id v1351 = v1336;
        id v1382 = v1340;
        v1385 = v1358;
        v1362 = v422;
        v1345 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v423, v424, v425, v426, v427);
        v433 = objc_msgSend_addedTextStrokeIdentifiers(v422, v428, v429, v430, v431, v432);
        v1474[0] = MEMORY[0x1E4F143A8];
        v1474[1] = 3221225472;
        v1474[2] = sub_1C49EA344;
        v1474[3] = &unk_1E64E1D38;
        id v434 = v421;
        id v1475 = v434;
        id v435 = v420;
        id v1476 = v435;
        id v436 = v1345;
        id v1477 = v436;
        objc_msgSend_enumerateObjectsUsingBlock_(v433, v437, (uint64_t)v1474, v438, v439, v440);

        v1329 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v441, v442, v443, v444, v445);
        v451 = objc_msgSend_removedTextStrokeIdentifiers(v1362, v446, v447, v448, v449, v450);
        v1470[0] = MEMORY[0x1E4F143A8];
        v1470[1] = 3221225472;
        v1470[2] = sub_1C49EA41C;
        v1470[3] = &unk_1E64E1D38;
        id v452 = v1343;
        id v1471 = v452;
        id v453 = v435;
        id v1472 = v453;
        id v454 = v1329;
        id v1473 = v454;
        objc_msgSend_enumerateObjectsUsingBlock_(v451, v455, (uint64_t)v1470, v456, v457, v458);

        v464 = objc_msgSend_transitionedTextStrokeIdentifiers(v1362, v459, v460, v461, v462, v463);
        *(void *)v1508 = MEMORY[0x1E4F143A8];
        *(void *)&v1508[8] = 3221225472;
        *(void *)&v1508[16] = sub_1C49EA4F4;
        v1509 = &unk_1E64E1DD8;
        id v1370 = v434;
        id v1510 = v1370;
        id v1364 = v453;
        id v1511 = v1364;
        id v1360 = v436;
        id v1512 = v1360;
        id v1341 = v452;
        id v1513 = v1341;
        id v1373 = v454;
        id v1514 = v1373;
        objc_msgSend_enumerateObjectsUsingBlock_(v464, v465, (uint64_t)v1508, v466, v467, v468);

        v1353 = objc_msgSend_strokeProvider(v1425, v469, v470, v471, v472, v473);
        if (!objc_msgSend_count(v1360, v474, v475, v476, v477, v478)
          && !objc_msgSend_count(v1373, v479, v480, v481, v482, v483))
        {
          uint64_t v710 = objc_msgSend_integerValue(v1364, v479, v480, v481, v482, v483);
          v715 = objc_msgSend_strokeGroupsOfClass_(v1355, v711, v710, v712, v713, v714);
          objc_msgSend_unionSet_(obja, v716, (uint64_t)v715, v717, v718, v719);
          goto LABEL_159;
        }
        v484 = objc_msgSend_allObjects(v1360, v479, v480, v481, v482, v483);
        v1468[0] = MEMORY[0x1E4F143A8];
        v1468[1] = 3221225472;
        v1468[2] = sub_1C49EA62C;
        v1468[3] = &unk_1E64E1868;
        id v1469 = v1353;
        v1349 = objc_msgSend_sortedArrayUsingComparator_(v484, v485, (uint64_t)v1468, v486, v487, v488);

        v1367 = objc_msgSend_strokesForIdentifiers_(v1425, v489, (uint64_t)v1349, v490, v491, v492);
        v497 = objc_msgSend_objectForKeyedSubscript_(v1425->_groupingStrategiesByIdentifierForTextStrokeClasses, v493, (uint64_t)v1364, v494, v495, v496);
        long long v1467 = 0u;
        long long v1465 = 0u;
        long long v1466 = 0u;
        long long v1464 = 0u;
        v1380 = v497;
        v503 = objc_msgSend_allKeys(v497, v498, v499, v500, v501, v502);
        uint64_t v506 = objc_msgSend_countByEnumeratingWithState_objects_count_(v503, v504, (uint64_t)&v1464, (uint64_t)&v1504, 16, v505);
        if (v506)
        {
          uint64_t v507 = *(void *)v1465;
LABEL_88:
          uint64_t v508 = 0;
          while (1)
          {
            if (*(void *)v1465 != v507) {
              objc_enumerationMutation(v503);
            }
            uint64_t v509 = *(void *)(*((void *)&v1464 + 1) + 8 * v508);
            if ((*v1378)(v1385)) {
              break;
            }
            v514 = objc_msgSend_objectForKey_(v1380, v510, v509, v511, v512, v513);
            v519 = objc_msgSend_objectForKey_(v1382, v515, v509, v516, v517, v518);
            v525 = objc_msgSend_substrokesByStrokeIdentifier(v1370, v520, v521, v522, v523, v524);
            v527 = objc_msgSend_updatedGroupingResult_byAddingStrokes_removingStrokeIdentifiers_stableStrokeIdentifiers_allSubstrokesByStrokeIdentifier_withCancellationBlock_(v514, v526, (uint64_t)v519, (uint64_t)v1367, (uint64_t)v1373, (uint64_t)v1376, v525, v1385);

            if (v527) {
              objc_msgSend_setObject_forKey_(v1382, v528, (uint64_t)v527, v509, v529, v530);
            }

            if (v506 == ++v508)
            {
              uint64_t v506 = objc_msgSend_countByEnumeratingWithState_objects_count_(v503, v531, (uint64_t)&v1464, (uint64_t)&v1504, 16, v532);
              if (v506) {
                goto LABEL_88;
              }
              break;
            }
          }
        }

        if ((unint64_t)objc_msgSend_count(v1380, v533, v534, v535, v536, v537) < 2)
        {
          v1339 = objc_msgSend_allKeys(v1380, v538, v539, v540, v541, v542);
          objc_msgSend_firstObject(v1339, v695, v696, v697, v698, v699);
          id v1399 = (id)objc_claimAutoreleasedReturnValue();
          v704 = objc_msgSend_objectForKey_(v1382, v700, (uint64_t)v1399, v701, v702, v703);
          objc_msgSend_textStrokeGroups(v704, v705, v706, v707, v708, v709);
          id v1390 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v1339 = objc_msgSend_allKeys(v1380, v538, v539, v540, v541, v542);
          objc_msgSend_dictionaryWithValuesForKeys_(v1382, v543, (uint64_t)v1339, v544, v545, v546);
          id v1399 = (id)objc_claimAutoreleasedReturnValue();
          id v1415 = v1376;
          id v1428 = v1364;
          v1421 = v1385;
          objc_msgSend_set(MEMORY[0x1E4F1CA80], v547, v548, v549, v550, v551);
          id v1390 = (id)objc_claimAutoreleasedReturnValue();
          v557 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v552, v553, v554, v555, v556);
          long long v1489 = 0u;
          long long v1488 = 0u;
          long long v1487 = 0u;
          long long v1486 = 0u;
          v563 = objc_msgSend_allKeys(v1399, v558, v559, v560, v561, v562);
          uint64_t v570 = objc_msgSend_countByEnumeratingWithState_objects_count_(v563, v564, (uint64_t)&v1486, (uint64_t)buf, 16, v565);
          if (v570)
          {
            uint64_t v571 = *(void *)v1487;
            do
            {
              for (uint64_t i = 0; i != v570; ++i)
              {
                if (*(void *)v1487 != v571) {
                  objc_enumerationMutation(v563);
                }
                v573 = *(void **)(*((void *)&v1486 + 1) + 8 * i);
                v574 = objc_msgSend_substringToIndex_(v573, v566, 1, v567, v568, v569);
                uint64_t v580 = objc_msgSend_integerValue(v574, v575, v576, v577, v578, v579);
                LODWORD(v580) = v580 == objc_msgSend_integerValue(v1428, v581, v582, v583, v584, v585);

                if (v580)
                {
                  v586 = objc_msgSend_objectForKey_(v1399, v566, (uint64_t)v573, v567, v568, v569);
                  v592 = objc_msgSend_copy(v586, v587, v588, v589, v590, v591);

                  objc_msgSend_setObject_forKey_(v557, v593, (uint64_t)v592, (uint64_t)v573, v594, v595);
                }
              }
              uint64_t v570 = objc_msgSend_countByEnumeratingWithState_objects_count_(v563, v566, (uint64_t)&v1486, (uint64_t)buf, 16, v569);
            }
            while (v570);
          }
          while (1)
          {

            if ((*v1378)(v1421)) {
              break;
            }
            long long v1485 = 0u;
            long long v1484 = 0u;
            long long v1483 = 0u;
            *(_OWORD *)__p = 0u;
            v601 = objc_msgSend_allKeys(v557, v596, v597, v598, v599, v600);
            uint64_t v608 = objc_msgSend_countByEnumeratingWithState_objects_count_(v601, v602, (uint64_t)__p, (uint64_t)&v1526, 16, v603);
            if (!v608)
            {

              break;
            }
            v563 = 0;
            uint64_t v609 = *(void *)v1483;
            double v610 = -1.79769313e308;
            do
            {
              for (uint64_t j = 0; j != v608; ++j)
              {
                if (*(void *)v1483 != v609) {
                  objc_enumerationMutation(v601);
                }
                v612 = objc_msgSend_objectForKey_(v557, v604, *((void *)__p[1] + j), v605, v606, v607);
                v618 = objc_msgSend_textStrokeGroups(v612, v613, v614, v615, v616, v617);
                v624 = objc_msgSend_allObjects(v618, v619, v620, v621, v622, v623);
                v629 = objc_msgSend_sortedArrayUsingComparator_(v624, v625, (uint64_t)&unk_1F20113F0, v626, v627, v628);

                v635 = objc_msgSend_firstObject(v629, v630, v631, v632, v633, v634);
                v641 = v635;
                if (v635)
                {
                  objc_msgSend_groupingConfidence(v635, v636, v637, v638, v639, v640);
                  if (v647 > v610)
                  {
                    objc_msgSend_groupingConfidence(v641, v642, v643, v644, v645, v646);
                    double v610 = v648;
                    id v649 = v641;

                    v563 = v649;
                  }
                }
              }
              uint64_t v608 = objc_msgSend_countByEnumeratingWithState_objects_count_(v601, v604, (uint64_t)__p, (uint64_t)&v1526, 16, v607);
            }
            while (v608);

            if (!v563) {
              break;
            }
            objc_msgSend_addObject_(v1390, v650, (uint64_t)v563, v651, v652, v653);
            long long v1481 = 0u;
            long long v1480 = 0u;
            long long v1479 = 0u;
            long long v1478 = 0u;
            v659 = objc_msgSend_allKeys(v557, v654, v655, v656, v657, v658);
            uint64_t v662 = objc_msgSend_countByEnumeratingWithState_objects_count_(v659, v660, (uint64_t)&v1478, (uint64_t)&v1515, 16, v661);
            if (v662)
            {
              uint64_t v663 = *(void *)v1479;
              id v1409 = v659;
              do
              {
                for (uint64_t k = 0; k != v662; ++k)
                {
                  if (*(void *)v1479 != v663) {
                    objc_enumerationMutation(v1409);
                  }
                  uint64_t v665 = *(void *)(*((void *)&v1478 + 1) + 8 * k);
                  v666 = v1425->_groupingStrategiesByIdentifierForTextStrokeClasses;
                  v671 = objc_msgSend_objectForKeyedSubscript_(v666, v667, (uint64_t)v1428, v668, v669, v670);
                  v676 = objc_msgSend_objectForKey_(v671, v672, v665, v673, v674, v675);

                  v681 = objc_msgSend_objectForKey_(v557, v677, v665, v678, v679, v680);
                  v687 = objc_msgSend_strokeIdentifiers(v563, v682, v683, v684, v685, v686);
                  v689 = objc_msgSend_updatedGroupingResult_byAddingStrokes_removingStrokeIdentifiers_stableStrokeIdentifiers_allSubstrokesByStrokeIdentifier_withCancellationBlock_(v676, v688, (uint64_t)v681, 0, (uint64_t)v687, (uint64_t)v1415, 0, v1421);

                  if (v689) {
                    objc_msgSend_setObject_forKey_(v557, v690, (uint64_t)v689, v665, v691, v692);
                  }
                }
                v659 = v1409;
                uint64_t v662 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1409, v693, (uint64_t)&v1478, (uint64_t)&v1515, 16, v694);
              }
              while (v662);
            }
          }
          if ((*v1378)(v1421))
          {

            id v1390 = 0;
          }
        }
        uint64_t v725 = objc_msgSend_integerValue(v1364, v720, v721, v722, v723, v724);
        v730 = objc_msgSend_strokeGroupsOfClass_(v1355, v726, v725, v727, v728, v729);
        id v1410 = (id)objc_msgSend_mutableCopy(v730, v731, v732, v733, v734, v735);

        long long v1462 = 0u;
        long long v1463 = 0u;
        long long v1460 = 0u;
        long long v1461 = 0u;
        id v1391 = v1390;
        uint64_t v1416 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1391, v736, (uint64_t)&v1460, (uint64_t)v1500, 16, v737);
        if (!v1416) {
          goto LABEL_158;
        }
        uint64_t v1400 = *(void *)v1461;
        do
        {
          for (uint64_t m = 0; m != v1416; ++m)
          {
            if (*(void *)v1461 != v1400) {
              objc_enumerationMutation(v1391);
            }
            v738 = *(void **)(*((void *)&v1460 + 1) + 8 * m);
            long long v1456 = 0u;
            long long v1457 = 0u;
            long long v1458 = 0u;
            long long v1459 = 0u;
            id v1429 = v1410;
            uint64_t v746 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1429, v739, (uint64_t)&v1456, (uint64_t)v1496, 16, v740);
            if (!v746)
            {
LABEL_152:

              goto LABEL_155;
            }
            uint64_t v747 = *(void *)v1457;
LABEL_143:
            uint64_t v748 = 0;
            while (1)
            {
              if (*(void *)v1457 != v747) {
                objc_enumerationMutation(v1429);
              }
              v749 = *(void **)(*((void *)&v1456 + 1) + 8 * v748);
              v750 = objc_msgSend_strategyIdentifier(v738, v741, v742, v743, v744, v745);
              v756 = objc_msgSend_strategyIdentifier(v749, v751, v752, v753, v754, v755);
              if ((objc_msgSend_isEqualToString_(v750, v757, (uint64_t)v756, v758, v759, v760) & 1) == 0)
              {

                goto LABEL_144;
              }
              v766 = objc_msgSend_strokeIdentifiers(v738, v761, v762, v763, v764, v765);
              v772 = objc_msgSend_strokeIdentifiers(v749, v767, v768, v769, v770, v771);
              char isEqualToSet = objc_msgSend_isEqualToSet_(v766, v773, (uint64_t)v772, v774, v775, v776);

              if (isEqualToSet) {
                break;
              }
LABEL_144:
              if (v746 == ++v748)
              {
                uint64_t v746 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1429, v741, (uint64_t)&v1456, (uint64_t)v1496, 16, v745);
                if (v746) {
                  goto LABEL_143;
                }
                goto LABEL_152;
              }
            }
            id v778 = v749;

            if (v778)
            {
              objc_msgSend_addObject_(obja, v779, (uint64_t)v778, v780, v781, v782);
              objc_msgSend_removeObject_(v1429, v783, (uint64_t)v778, v784, v785, v786);
              goto LABEL_156;
            }
LABEL_155:
            objc_msgSend_addObject_(obja, v779, (uint64_t)v738, v780, v781, v782);
            id v778 = 0;
            objc_msgSend_addObject_(v1395, v787, (uint64_t)v738, v788, v789, v790);
LABEL_156:
          }
          uint64_t v1416 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1391, v791, (uint64_t)&v1460, (uint64_t)v1500, 16, v792);
        }
        while (v1416);
LABEL_158:

        objc_msgSend_unionSet_(v1351, v793, (uint64_t)v1410, v794, v795, v796);
        v715 = v1469;
LABEL_159:

        if (++v1357 == v1332)
        {
          uint64_t v1332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1330, v797, (uint64_t)&v1452, (uint64_t)v1495, 16, v798);
          if (!v1332) {
            goto LABEL_161;
          }
          goto LABEL_80;
        }
      }
    }
LABEL_253:
    uint64_t v1307 = 0;
    while (1)
    {
      if (*(void *)v1453 != v1333) {
        objc_enumerationMutation(v1330);
      }
      v1308 = *(void **)(*((void *)&v1452 + 1) + 8 * v1307);
      if (v1358[2]()) {
        break;
      }
      id v1431 = v1308;
      id v1309 = v1347;
      id v1310 = v1337;
      id v1311 = v1346;
      id v1312 = v1388;
      id v1313 = v1338;
      id v1314 = v1334;
      id v1315 = v1335;
      id v1316 = v1336;
      id v1317 = v1340;

      if (v1332 == ++v1307)
      {
        uint64_t v1332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1330, v1318, (uint64_t)&v1452, (uint64_t)v1495, 16, v1319);
        if (v1332) {
          goto LABEL_253;
        }
        break;
      }
    }
  }
LABEL_161:

  id v1365 = v1334;
  id v1377 = v1335;
  id v1374 = v1336;
  id v1430 = v1340;
  id v1368 = v1347;
  v1371 = v1358;
  if (v1425)
  {
    v1401 = objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v799, (uint64_t)v1365, v800, v801, v802);
    objc_msgSend_set(MEMORY[0x1E4F1CA80], v803, v804, v805, v806, v807);
    id v1392 = (id)objc_claimAutoreleasedReturnValue();
    v1423 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v808, v809, v810, v811, v812);
    if (((*v1378)(v1371) & 1) == 0)
    {
      uint64_t v1413 = 1;
      for (unint64_t n = 0; ; ++n)
      {
        unint64_t v1052 = objc_msgSend_count(v1401, v813, v814, v815, v816, v817);
        uint64_t v814 = n;
        if (n >= v1052) {
          break;
        }
        v1053 = objc_msgSend_objectAtIndexedSubscript_(v1401, v813, n, v815, v816, v817);
        v1054 = v1425->_groupingStrategiesByIdentifierForTextStrokeClasses;
        v1055 = NSNumber;
        uint64_t v1061 = objc_msgSend_classification(v1053, v1056, v1057, v1058, v1059, v1060);
        v1066 = objc_msgSend_numberWithInteger_(v1055, v1062, v1061, v1063, v1064, v1065);
        v1071 = objc_msgSend_objectForKeyedSubscript_(v1054, v1067, (uint64_t)v1066, v1068, v1069, v1070);
        v1077 = objc_msgSend_strategyIdentifier(v1053, v1072, v1073, v1074, v1075, v1076);
        v1082 = objc_msgSend_objectForKeyedSubscript_(v1071, v1078, (uint64_t)v1077, v1079, v1080, v1081);

        uint64_t v1083 = objc_opt_class();
        unint64_t v1093 = v1413;
        if (objc_msgSend_isMemberOfClass_(v1082, v1084, v1083, v1085, v1086, v1087))
        {
          while (v1093 < objc_msgSend_count(v1401, v1088, v1089, v1090, v1091, v1092))
          {
            v1098 = objc_msgSend_objectAtIndexedSubscript_(v1401, v1094, v1093, v1095, v1096, v1097);
            v1099 = v1425->_groupingStrategiesByIdentifierForTextStrokeClasses;
            v1100 = NSNumber;
            uint64_t v1106 = objc_msgSend_classification(v1098, v1101, v1102, v1103, v1104, v1105);
            v1111 = objc_msgSend_numberWithInteger_(v1100, v1107, v1106, v1108, v1109, v1110);
            v1116 = objc_msgSend_objectForKeyedSubscript_(v1099, v1112, (uint64_t)v1111, v1113, v1114, v1115);
            v1122 = objc_msgSend_strategyIdentifier(v1098, v1117, v1118, v1119, v1120, v1121);
            v1127 = objc_msgSend_objectForKeyedSubscript_(v1116, v1123, (uint64_t)v1122, v1124, v1125, v1126);

            uint64_t v1128 = objc_opt_class();
            char isMemberOfClass = objc_msgSend_isMemberOfClass_(v1127, v1129, v1128, v1130, v1131, v1132);
            if (v1082 == v1127) {
              char v1138 = 0;
            }
            else {
              char v1138 = isMemberOfClass;
            }
            if ((v1138 & 1) != 0
              && (objc_msgSend_containsObject_(v1423, v1134, (uint64_t)v1053, v1135, v1136, v1137) & 1) == 0
              && (objc_msgSend_containsObject_(v1423, v1139, (uint64_t)v1098, v1140, v1141, v1142) & 1) == 0)
            {
              objc_msgSend_relativeOverlapOfGroup_withGroup_(v1082, v1143, (uint64_t)v1053, (uint64_t)v1098, v1144, v1145);
              if (v1151 > 0.4)
              {
                v1152 = objc_msgSend_strategyIdentifier(v1053, v1146, v1147, v1148, v1149, v1150);
                v1157 = objc_msgSend_objectForKeyedSubscript_(v1430, v1153, (uint64_t)v1152, v1154, v1155, v1156);
                v1163 = objc_msgSend_substrokesByStrokeIdentifier(v1368, v1158, v1159, v1160, v1161, v1162);
                v1165 = objc_msgSend_regroupedStrokeGroup_fromResult_withAdversarialGroup_allSubstrokesByStrokeIdentifier_cancellationBlock_(v1082, v1164, (uint64_t)v1053, (uint64_t)v1157, (uint64_t)v1098, (uint64_t)v1163, v1371);

                if ((unint64_t)objc_msgSend_count(v1165, v1166, v1167, v1168, v1169, v1170) >= 2)
                {
                  objc_msgSend_unionSet_(v1392, v1171, (uint64_t)v1165, v1173, v1174, v1175);
                  objc_msgSend_addObject_(v1423, v1176, (uint64_t)v1053, v1177, v1178, v1179);
                  v1184 = objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v1180, (uint64_t)v1165, v1181, v1182, v1183);
                  objc_msgSend_addObjectsFromArray_(v1401, v1185, (uint64_t)v1184, v1186, v1187, v1188);
                }
                v1189 = objc_msgSend_strategyIdentifier(v1098, v1171, v1172, v1173, v1174, v1175);
                v1194 = objc_msgSend_objectForKeyedSubscript_(v1430, v1190, (uint64_t)v1189, v1191, v1192, v1193);
                v1200 = objc_msgSend_substrokesByStrokeIdentifier(v1368, v1195, v1196, v1197, v1198, v1199);
                v1202 = objc_msgSend_regroupedStrokeGroup_fromResult_withAdversarialGroup_allSubstrokesByStrokeIdentifier_cancellationBlock_(v1127, v1201, (uint64_t)v1098, (uint64_t)v1194, (uint64_t)v1053, (uint64_t)v1200, v1371);

                if ((unint64_t)objc_msgSend_count(v1202, v1203, v1204, v1205, v1206, v1207) >= 2)
                {
                  objc_msgSend_unionSet_(v1392, v1208, (uint64_t)v1202, v1209, v1210, v1211);
                  objc_msgSend_addObject_(v1423, v1212, (uint64_t)v1098, v1213, v1214, v1215);
                  v1220 = objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v1216, (uint64_t)v1202, v1217, v1218, v1219);
                  objc_msgSend_addObjectsFromArray_(v1401, v1221, (uint64_t)v1220, v1222, v1223, v1224);
                }
              }
            }

            ++v1093;
          }
        }

        ++v1413;
      }
    }
    v1386 = objc_msgSend_mutableCopy(v1423, v813, v814, v815, v816, v817);
    objc_msgSend_minusSet_(v1386, v818, (uint64_t)v1392, v819, v820, v821);
    objc_msgSend_minusSet_(v1386, v822, (uint64_t)v1377, v823, v824, v825);
    objc_msgSend_minusSet_(v1392, v826, (uint64_t)v1423, v827, v828, v829);
    long long v1529 = 0u;
    long long v1528 = 0u;
    long long v1527 = 0u;
    long long v1526 = 0u;
    v835 = objc_msgSend_allKeys(v1430, v830, v831, v832, v833, v834);
    v1396 = v835;
    uint64_t v838 = objc_msgSend_countByEnumeratingWithState_objects_count_(v835, v836, (uint64_t)&v1526, (uint64_t)buf, 16, v837);
    if (v838)
    {
      id objb = *(id *)v1527;
      do
      {
        id v1411 = (id)v838;
        for (iuint64_t i = 0; ii != v1411; iuint64_t i = (char *)ii + 1)
        {
          if (*(id *)v1527 != objb) {
            objc_enumerationMutation(v1396);
          }
          v844 = *(void **)(*((void *)&v1526 + 1) + 8 * (void)ii);
          v845 = objc_msgSend_objectForKeyedSubscript_(v1430, v839, (uint64_t)v844, v840, v841, v842);
          uint64_t v846 = objc_opt_class();
          if (objc_msgSend_isMemberOfClass_(v845, v847, v846, v848, v849, v850))
          {
            v856 = objc_msgSend_strokeGroups(v845, v851, v852, v853, v854, v855);
            int v861 = objc_msgSend_intersectsSet_(v1423, v857, (uint64_t)v856, v858, v859, v860);

            if (v861)
            {
              v867 = objc_msgSend_strokeGroups(v845, v862, v863, v864, v865, v866);
              v1417 = objc_msgSend_mutableCopy(v867, v868, v869, v870, v871, v872);

              v878 = objc_msgSend_createdStrokeGroups(v845, v873, v874, v875, v876, v877);
              v884 = objc_msgSend_mutableCopy(v878, v879, v880, v881, v882, v883);

              v890 = objc_msgSend_deletedStrokeGroups(v845, v885, v886, v887, v888, v889);
              v896 = objc_msgSend_mutableCopy(v890, v891, v892, v893, v894, v895);

              uint64_t v1515 = MEMORY[0x1E4F143A8];
              uint64_t v1516 = 3221225472;
              v1517 = sub_1C49EA6DC;
              v1518 = &unk_1E64E1E00;
              id v1519 = v844;
              v901 = objc_msgSend_objectsPassingTest_(v1392, v897, (uint64_t)&v1515, v898, v899, v900);
              *(void *)&long long v1504 = MEMORY[0x1E4F143A8];
              *((void *)&v1504 + 1) = 3221225472;
              *(void *)&long long v1505 = sub_1C49EA730;
              *((void *)&v1505 + 1) = &unk_1E64E1E00;
              *(void *)&long long v1506 = v844;
              v906 = objc_msgSend_objectsPassingTest_(v1386, v902, (uint64_t)&v1504, v903, v904, v905);
              objc_msgSend_minusSet_(v1417, v907, (uint64_t)v1423, v908, v909, v910);
              objc_msgSend_unionSet_(v1417, v911, (uint64_t)v901, v912, v913, v914);
              objc_msgSend_minusSet_(v884, v915, (uint64_t)v1423, v916, v917, v918);
              objc_msgSend_unionSet_(v884, v919, (uint64_t)v901, v920, v921, v922);
              objc_msgSend_unionSet_(v896, v923, (uint64_t)v906, v924, v925, v926);
              v927 = [CHBottomUpStrokeGroupingResult alloc];
              v933 = objc_msgSend_substrokePlacementsByStrokeIdentifier(v845, v928, v929, v930, v931, v932);
              v935 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v927, v934, (uint64_t)v1417, (uint64_t)v884, (uint64_t)v896, (uint64_t)v933);

              objc_msgSend_setObject_forKeyedSubscript_(v1430, v936, (uint64_t)v935, (uint64_t)v844, v937, v938);
            }
          }
        }
        v835 = v1396;
        uint64_t v838 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1396, v839, (uint64_t)&v1526, (uint64_t)buf, 16, v842);
      }
      while (v838);
    }

    objc_msgSend_minusSet_(v1365, v939, (uint64_t)v1423, v940, v941, v942);
    objc_msgSend_unionSet_(v1365, v943, (uint64_t)v1392, v944, v945, v946);
    objc_msgSend_minusSet_(v1377, v947, (uint64_t)v1423, v948, v949, v950);
    objc_msgSend_unionSet_(v1377, v951, (uint64_t)v1392, v952, v953, v954);
    objc_msgSend_unionSet_(v1374, v955, (uint64_t)v1386, v956, v957, v958);
  }
  if (((*v1378)(v1371) & 1) == 0)
  {
    v1418 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v959, v960, v961, v962, v963);
    long long v1450 = 0u;
    long long v1451 = 0u;
    long long v1448 = 0u;
    long long v1449 = 0u;
    if (v1425) {
      objc_msgSend_allValues(v1425->_groupingStrategiesByIdentifierForTextStrokeClasses, v964, v965, v966, v967, v968);
    }
    else {
      objc_msgSend_allValues(0, v964, v965, v966, v967, v968);
    }
    id v1383 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v1387 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1383, v969, (uint64_t)&v1448, (uint64_t)v1494, 16, v970);
    if (v1387)
    {
      uint64_t v1426 = 0;
      objc = 0;
      v1402 = 0;
      id v1393 = *(id *)v1449;
      do
      {
        for (juint64_t j = 0; jj != v1387; ++jj)
        {
          if (*(id *)v1449 != v1393) {
            objc_enumerationMutation(v1383);
          }
          v976 = *(void **)(*((void *)&v1448 + 1) + 8 * jj);
          long long v1444 = 0u;
          long long v1445 = 0u;
          long long v1446 = 0u;
          long long v1447 = 0u;
          v977 = objc_msgSend_allValues(v976, v971, v972, v973, v974, v975);
          uint64_t v980 = objc_msgSend_countByEnumeratingWithState_objects_count_(v977, v978, (uint64_t)&v1444, (uint64_t)v1493, 16, v979);
          if (v980)
          {
            uint64_t v981 = *(void *)v1445;
            id v1412 = v977;
            do
            {
              uint64_t v982 = 0;
              uint64_t v1424 = v980;
              do
              {
                if (*(void *)v1445 != v981) {
                  objc_enumerationMutation(v977);
                }
                v983 = *(void **)(*((void *)&v1444 + 1) + 8 * v982);
                uint64_t v984 = objc_opt_class();
                if (objc_msgSend_isMemberOfClass_(v983, v985, v984, v986, v987, v988))
                {
                  objc_msgSend_addObject_(v1418, v989, (uint64_t)v983, v990, v991, v992);
                  v998 = objc_msgSend_strategyIdentifier(v983, v993, v994, v995, v996, v997);
                  v1003 = objc_msgSend_objectForKeyedSubscript_(v1430, v999, (uint64_t)v998, v1000, v1001, v1002);
                  v1009 = objc_msgSend_strokeGroups(v1003, v1004, v1005, v1006, v1007, v1008);
                  BOOL v1015 = objc_msgSend_count(v1009, v1010, v1011, v1012, v1013, v1014) == 0;

                  if (!v1015)
                  {
                    long long v1442 = 0u;
                    long long v1443 = 0u;
                    long long v1440 = 0u;
                    long long v1441 = 0u;
                    v1019 = objc_msgSend_strategyIdentifier(v983, v989, v1016, v1017, v1018, v992);
                    v1024 = objc_msgSend_objectForKeyedSubscript_(v1430, v1020, (uint64_t)v1019, v1021, v1022, v1023);
                    v1030 = objc_msgSend_strokeGroups(v1024, v1025, v1026, v1027, v1028, v1029);

                    v1033 = 0;
                    uint64_t v1039 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1030, v1031, (uint64_t)&v1440, (uint64_t)v1492, 16, v1032);
                    if (v1039)
                    {
                      uint64_t v1040 = *(void *)v1441;
                      do
                      {
                        for (kuint64_t k = 0; kk != v1039; ++kk)
                        {
                          if (*(void *)v1441 != v1040) {
                            objc_enumerationMutation(v1030);
                          }
                          v1042 = objc_msgSend_strokeIdentifiers(*(void **)(*((void *)&v1440 + 1) + 8 * kk), v1034, v1035, v1036, v1037, v1038);
                          uint64_t v1048 = objc_msgSend_count(v1042, v1043, v1044, v1045, v1046, v1047);

                          v1033 += v1048;
                        }
                        uint64_t v1039 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1030, v1034, (uint64_t)&v1440, (uint64_t)v1492, 16, v1038);
                      }
                      while (v1039);
                    }

                    ++v1426;
                    if ((uint64_t)v1033 > (uint64_t)objc)
                    {
                      id v1049 = v983;

                      objc = v1033;
                      v1402 = v1049;
                    }
                  }
                  v977 = v1412;
                  uint64_t v980 = v1424;
                }
                ++v982;
              }
              while (v982 != v980);
              uint64_t v980 = objc_msgSend_countByEnumeratingWithState_objects_count_(v977, v989, (uint64_t)&v1444, (uint64_t)v1493, 16, v992);
            }
            while (v980);
          }
        }
        uint64_t v1387 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1383, v971, (uint64_t)&v1448, (uint64_t)v1494, 16, v975);
      }
      while (v1387);

      if (v1402 && v1426 >= 2) {
        objc_msgSend_mergeGroupsPostProcessing_createdGroups_deletedGroups_availableGroupingStrategies_allowOppositeOrientations_groupStatistics_(v1402, v1050, (uint64_t)v1365, (uint64_t)v1377, (uint64_t)v1374, (uint64_t)v1418, 1, 0);
      }
      v1051 = v1402;
    }
    else
    {

      v1051 = 0;
    }
  }
  if ((*v1378)(v1371))
  {
    v1230 = 0;
  }
  else
  {
    objc_msgSend_removeAllObjects(v1377, v1225, v1226, v1227, v1228, v1229);
    objc_msgSend_removeAllObjects(v1374, v1231, v1232, v1233, v1234, v1235);
    long long v1438 = 0u;
    long long v1439 = 0u;
    long long v1436 = 0u;
    long long v1437 = 0u;
    id v1236 = v1365;
    uint64_t v1244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1236, v1237, (uint64_t)&v1436, (uint64_t)v1491, 16, v1238);
    if (v1244)
    {
      uint64_t v1245 = *(void *)v1437;
      do
      {
        for (uint64_t mm = 0; mm != v1244; ++mm)
        {
          if (*(void *)v1437 != v1245) {
            objc_enumerationMutation(v1236);
          }
          uint64_t v1247 = *(void *)(*((void *)&v1436 + 1) + 8 * mm);
          v1248 = objc_msgSend_strokeGroups(v1388, v1239, v1240, v1241, v1242, v1243);
          char v1253 = objc_msgSend_containsObject_(v1248, v1249, v1247, v1250, v1251, v1252);

          if ((v1253 & 1) == 0) {
            objc_msgSend_addObject_(v1377, v1239, v1247, v1241, v1242, v1243);
          }
        }
        uint64_t v1244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1236, v1239, (uint64_t)&v1436, (uint64_t)v1491, 16, v1243);
      }
      while (v1244);
    }

    long long v1434 = 0u;
    long long v1435 = 0u;
    long long v1432 = 0u;
    long long v1433 = 0u;
    v1259 = objc_msgSend_textStrokeGroups(v1388, v1254, v1255, v1256, v1257, v1258);
    uint64_t v1266 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1259, v1260, (uint64_t)&v1432, (uint64_t)v1490, 16, v1261);
    if (v1266)
    {
      uint64_t v1267 = *(void *)v1433;
      do
      {
        for (uint64_t nn = 0; nn != v1266; ++nn)
        {
          if (*(void *)v1433 != v1267) {
            objc_enumerationMutation(v1259);
          }
          uint64_t v1269 = *(void *)(*((void *)&v1432 + 1) + 8 * nn);
          if ((objc_msgSend_containsObject_(v1236, v1262, v1269, v1263, v1264, v1265) & 1) == 0) {
            objc_msgSend_addObject_(v1374, v1262, v1269, v1263, v1264, v1265);
          }
        }
        uint64_t v1266 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1259, v1262, (uint64_t)&v1432, (uint64_t)v1490, 16, v1265);
      }
      while (v1266);
    }

    v1274 = objc_msgSend_setByAddingObjectsFromSet_(v1236, v1270, (uint64_t)v1323, v1271, v1272, v1273);
    v1280 = objc_msgSend_mutableCopy(v1274, v1275, v1276, v1277, v1278, v1279);

    v1285 = objc_msgSend_setByAddingObjectsFromSet_(v1377, v1281, (uint64_t)v1324, v1282, v1283, v1284);
    v1291 = objc_msgSend_mutableCopy(v1285, v1286, v1287, v1288, v1289, v1290);

    v1296 = objc_msgSend_setByAddingObjectsFromSet_(v1374, v1292, (uint64_t)v1325, v1293, v1294, v1295);
    v1302 = objc_msgSend_mutableCopy(v1296, v1297, v1298, v1299, v1300, v1301);

    v1303 = [CHMergedStrokeGroupingResults alloc];
    v1230 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_groupingResultsByStrategyIdentifier_(v1303, v1304, (uint64_t)v1280, (uint64_t)v1291, (uint64_t)v1302, (uint64_t)v1430);
  }
  return v1230;
}

+ (id)identifyStableStrokeIdentifiersUsingOrderedStrokeIdentifiers:(id)a3 prevOrderedStrokeIdentifiers:(id)a4 strokeClassificationResult:(id)a5 prevStrokeClassificationResult:(id)a6
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v139 = a5;
  id v138 = a6;
  objc_msgSend_set(MEMORY[0x1E4F1CA80], v11, v12, v13, v14, v15);
  id v137 = (id)objc_claimAutoreleasedReturnValue();
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v22 = objc_msgSend_count(v9, v16, v17, v18, v19, v20);
    unint64_t v33 = v22 >= objc_msgSend_count(v10, v23, v24, v25, v26, v27)
        ? objc_msgSend_count(v10, v28, v29, v30, v31, v32)
        : objc_msgSend_count(v9, v28, v29, v30, v31, v32);
    if (i >= v33) {
      break;
    }
    uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v9, v34, i, v35, v36, v37);
    uint64_t v43 = objc_msgSend_objectAtIndexedSubscript_(v10, v39, i, v40, v41, v42);
    uint64_t v49 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v139, v44, v45, v46, v47, v48);
    uint64_t v54 = objc_msgSend_objectForKey_(v49, v50, (uint64_t)v38, v51, v52, v53);

    uint64_t v60 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v138, v55, v56, v57, v58, v59);
    uint64_t v65 = objc_msgSend_objectForKey_(v60, v61, (uint64_t)v43, v62, v63, v64);

    uint64_t v66 = objc_opt_class();
    uint64_t v72 = objc_msgSend_integerValue(v54, v67, v68, v69, v70, v71);
    int isStrokeClassificationTextOrMath = objc_msgSend_isStrokeClassificationTextOrMath_(v66, v73, v72, v74, v75, v76);
    uint64_t v78 = objc_opt_class();
    uint64_t v84 = objc_msgSend_integerValue(v65, v79, v80, v81, v82, v83);
    int v89 = objc_msgSend_isStrokeClassificationTextOrMath_(v78, v85, v84, v86, v87, v88);
    int v95 = v89;
    if ((isStrokeClassificationTextOrMath & v89) == 1)
    {
      uint64_t v96 = objc_msgSend_integerValue(v54, v90, v91, v92, v93, v94);
      int v102 = v96 == objc_msgSend_integerValue(v65, v97, v98, v99, v100, v101);
    }
    else
    {
      int v102 = isStrokeClassificationTextOrMath ^ v89 ^ 1;
    }
    if ((objc_msgSend_isEqual_(v38, v90, (uint64_t)v43, v92, v93, v94) & v102) != 1)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v107 = (id)qword_1EA3C9FA8;
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        v136 = v107;
        unint64_t v113 = objc_msgSend_count(v9, v108, v109, v110, v111, v112);
        if (v113 >= objc_msgSend_count(v10, v114, v115, v116, v117, v118)) {
          uint64_t v124 = objc_msgSend_count(v10, v119, v120, v121, v122, v123);
        }
        else {
          uint64_t v124 = objc_msgSend_count(v9, v119, v120, v121, v122, v123);
        }
        *(_DWORD *)buf = 134219264;
        unint64_t v141 = i;
        __int16 v142 = 2048;
        uint64_t v143 = v124;
        __int16 v144 = 1024;
        int v145 = isStrokeClassificationTextOrMath;
        __int16 v146 = 1024;
        int v147 = v95;
        __int16 v148 = 2048;
        uint64_t v107 = v136;
        uint64_t v149 = objc_msgSend_integerValue(v54, v125, v126, v127, v128, v129);
        __int16 v150 = 2048;
        uint64_t v151 = objc_msgSend_integerValue(v65, v130, v131, v132, v133, v134);
        _os_log_impl(&dword_1C492D000, v136, OS_LOG_TYPE_DEFAULT, "Found unstable stroke at index %ld / %ld, isText ? %d, wasText ? %d, class %ld, old class %ld", buf, 0x36u);
      }

      break;
    }
    objc_msgSend_addObject_(v137, v103, (uint64_t)v38, v104, v105, v106);
  }
  return v137;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  ddouble y = a4.dy;
  ddouble x = a4.dx;
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v123 = a3;
  uint64_t v120 = a7;
  if (self) {
    groupingStrategiesByIdentifierForTextStrokeClasses = self->_groupingStrategiesByIdentifierForTextStrokeClasses;
  }
  else {
    groupingStrategiesByIdentifierForTextStrokeClasses = 0;
  }
  uint64_t v14 = groupingStrategiesByIdentifierForTextStrokeClasses;
  uint64_t v15 = NSNumber;
  uint64_t v21 = objc_msgSend_classification(v123, v16, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_numberWithInteger_(v15, v22, v21, v23, v24, v25);
  uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v14, v27, (uint64_t)v26, v28, v29, v30);
  uint64_t v32 = v123;
  uint64_t v38 = objc_msgSend_strategyIdentifier(v123, v33, v34, v35, v36, v37);
  uint64_t v43 = objc_msgSend_objectForKey_(v31, v39, (uint64_t)v38, v40, v41, v42);

  uint64_t v119 = v43;
  if (v43)
  {
    objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v43, v44, (uint64_t)v123, (uint64_t)a5, (uint64_t)a6, (uint64_t)v120, a8, dx, dy);
    uint64_t v45 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v118 = v123;
    if (self)
    {
      id v125 = objc_alloc_init(CHDrawing);
      if (a5) {
        uint64_t v51 = objc_alloc_init(CHDrawing);
      }
      else {
        uint64_t v51 = 0;
      }
      objc_msgSend_bounds(v118, v46, v47, v48, v49, v50);
      uint64_t v53 = v52;
      uint64_t v55 = v54;
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v56, v57, v58, v59, v60);
      id v126 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v66 = objc_msgSend_strokeProvider(self, v61, v62, v63, v64, v65);
      uint64_t v72 = objc_msgSend_strokeIdentifiers(v118, v67, v68, v69, v70, v71, v66);
      uint64_t v78 = objc_msgSend_allObjects(v72, v73, v74, v75, v76, v77);
      uint64_t v83 = objc_msgSend_strokesForIdentifiers_(self, v79, (uint64_t)v78, v80, v81, v82);

      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = sub_1C49EAE1C;
      v136[3] = &unk_1E64E1E28;
      id v116 = v66;
      uint64_t v117 = v83;
      id v137 = v116;
      objc_msgSend_sortedArrayUsingComparator_(v83, v84, (uint64_t)v136, v85, v86, v87);
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v88, (uint64_t)&v132, (uint64_t)v138, 16, v89);
      if (v90)
      {
        uint64_t v91 = *(void *)v133;
        do
        {
          for (uint64_t i = 0; i != v90; ++i)
          {
            if (*(void *)v133 != v91) {
              objc_enumerationMutation(obj);
            }
            uint64_t v93 = *(void **)(*((void *)&v132 + 1) + 8 * i);
            uint64_t v94 = objc_opt_class();
            v127[0] = MEMORY[0x1E4F143A8];
            v127[1] = 3221225472;
            v127[2] = sub_1C49EAEC8;
            v127[3] = &unk_1E64E1E50;
            int v95 = v51;
            uint64_t v128 = v95;
            uint64_t v130 = v53;
            uint64_t v131 = v55;
            uint64_t v96 = v125;
            uint64_t v129 = v96;
            objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v94, v97, (uint64_t)v93, 0, 1, (uint64_t)v127);
            objc_msgSend_endStroke(v96, v98, v99, v100, v101, v102);
            if (v51) {
              objc_msgSend_endStroke(v95, v103, v104, v105, v106, v107);
            }
            id v108 = objc_msgSend_encodedStrokeIdentifier(v93, v103, v104, v105, v106, v107);
            objc_msgSend_addObject_(v126, v109, (uint64_t)v108, v110, v111, v112);
          }
          uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v113, (uint64_t)&v132, (uint64_t)v138, 16, v114);
        }
        while (v90);
      }

      if (a5) {
        *a5 = v51;
      }
      if (a6) {
        *a6 = v126;
      }
      uint64_t v45 = v125;
    }
    else
    {
      uint64_t v45 = 0;
    }

    if (v120) {
      *uint64_t v120 = 1.0;
    }
    uint64_t v32 = v123;
  }

  return v45;
}

- (id)strokesForIdentifiers:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7, v8);
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v55;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v58, (uint64_t)v66, 16, v10);
  if (v16)
  {
    uint64_t v17 = *(void *)v59;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v58 + 1) + 8 * v18);
        uint64_t v20 = objc_msgSend_strokeProvider(self, v11, v12, v13, v14, v15);
        uint64_t v25 = objc_msgSend_strokeIdentifierFromData_(v20, v21, v19, v22, v23, v24);

        uint64_t v31 = objc_msgSend_strokeProvider(self, v26, v27, v28, v29, v30);
        uint64_t v36 = objc_msgSend_strokeForIdentifier_(v31, v32, (uint64_t)v25, v33, v34, v35);

        if (v36)
        {
          objc_msgSend_addObject_(v57, v37, (uint64_t)v36, v38, v39, v40);
        }
        else
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v41 = (id)qword_1EA3C9FA8;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v47 = objc_msgSend_strokeProvider(self, v42, v43, v44, v45, v46);
            uint64_t v53 = objc_msgSend_strokeProviderVersion(v47, v48, v49, v50, v51, v52);
            *(_DWORD *)buf = 138412546;
            uint64_t v63 = v19;
            __int16 v64 = 2112;
            uint64_t v65 = v53;
            _os_log_impl(&dword_1C492D000, v41, OS_LOG_TYPE_DEFAULT, "Failed to get stroke with id: %@ from stroke provider version %@", buf, 0x16u);
          }
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v58, (uint64_t)v66, 16, v15);
    }
    while (v16);
  }

  return v57;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (CHGroupingModel)strokeGroupingModel
{
  return self->_strokeGroupingModel;
}

- (NSArray)locales
{
  return self->_locales;
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
  objc_storeStrong((id *)&self->_groupingStrategiesByIdentifierForTextStrokeClasses, 0);
  objc_storeStrong((id *)&self->_textInputTargets, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_strokeGroupingModel, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
}

@end