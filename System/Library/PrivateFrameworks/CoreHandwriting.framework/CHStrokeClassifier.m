@interface CHStrokeClassifier
+ (double)containerSupportForPoints:(const void *)a3 withBounds:(CGRect)a4;
+ (id)nonTextCandidateForStroke:(id)a3 withSubstrokes:(id)a4;
+ (int64_t)fallbackTextScriptClassificationForMathGroup:(id)a3 strokeClassificationResult:(id)a4 fromTopNCandidate:(int64_t)a5;
- (CHStrokeClassifier)initWithStrokeProvider:(id)a3 forceClass:(int64_t)a4;
- (CHStrokeProvider)strokeProvider;
- (id)refineResult:(id)a3 usingSortedTextStrokeGroups:(id)a4 cancellationBlock:(id)a5;
- (id)refineResult:(id)a3 usingStrokeClassificationModel:(id)a4 sortedAddedStrokes:(id)a5 removedStrokeIdentifiers:(id)a6 lastResult:(id)a7 cancellationBlock:(id)a8;
- (id)updateResult:(id)a3 addingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 clutterFilter:(id)a6 affectedClutterStrokeIDs:(id)a7 cancellationBlock:(id)a8;
- (int64_t)forcedStrokeClass;
@end

@implementation CHStrokeClassifier

- (CHStrokeClassifier)initWithStrokeProvider:(id)a3 forceClass:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHStrokeClassifier;
  v8 = [(CHStrokeClassifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_strokeProvider, a3);
    v9->_forcedStrokeClass = a4;
  }

  return v9;
}

- (id)updateResult:(id)a3 addingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 clutterFilter:(id)a6 affectedClutterStrokeIDs:(id)a7 cancellationBlock:(id)a8
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v199 = a4;
  id v200 = a5;
  id v15 = a6;
  id v16 = a7;
  v206 = (uint64_t (**)(void))a8;
  v208 = self;
  v22 = objc_msgSend_strokeProvider(self, v17, v18, v19, v20, v21, v16);
  v203 = objc_msgSend_orderedStrokes(v22, v23, v24, v25, v26, v27);

  if (v14) {
    v205 = (CHMutableStrokeClassificationResult *)objc_msgSend_mutableCopy(v14, v28, v29, v30, v31, v32);
  }
  else {
    v205 = objc_alloc_init(CHMutableStrokeClassificationResult);
  }
  v207 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v33, v34, v35, v36, v37);
  v209 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v38, v39, v40, v41, v42);
  v210 = objc_msgSend_mutableCopy(v200, v43, v44, v45, v46, v47);
  long long v229 = 0u;
  long long v230 = 0u;
  long long v227 = 0u;
  long long v228 = 0u;
  id v48 = v16;
  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v227, (uint64_t)v241, 16, v50);
  if (v56)
  {
    uint64_t v57 = *(void *)v228;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v228 != v57) {
          objc_enumerationMutation(v48);
        }
        uint64_t v59 = *(void *)(*((void *)&v227 + 1) + 8 * v58);
        v60 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v14, v51, v52, v53, v54, v55);
        v65 = objc_msgSend_objectForKeyedSubscript_(v60, v61, v59, v62, v63, v64);

        uint64_t v71 = objc_msgSend_integerValue(v65, v66, v67, v68, v69, v70);
        int isHighDensityStroke = objc_msgSend_isHighDensityStroke_(v15, v72, v59, v73, v74, v75);
        if (v71 == 8) {
          int v81 = 0;
        }
        else {
          int v81 = isHighDensityStroke;
        }
        if (v81 == 1)
        {
          objc_msgSend_addObject_(v209, v77, v59, v78, v79, v80);
          objc_msgSend_addObject_(v210, v82, v59, v83, v84, v85);
        }
        else
        {
          if (v71 == 8) {
            char v86 = isHighDensityStroke;
          }
          else {
            char v86 = 1;
          }
          if ((v86 & 1) == 0)
          {
            v87 = objc_opt_class();
            v93 = objc_msgSend_strokeProvider(v208, v88, v89, v90, v91, v92);
            v97 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v87, v94, v59, (uint64_t)v93, v95, v96);

            if (v97)
            {
              objc_msgSend_addObject_(v207, v98, (uint64_t)v97, v99, v100, v101);
            }
            else
            {
              if (qword_1EA3CA000 != -1) {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
              }
              v102 = (id)qword_1EA3C9F90[0];
              if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v236 = v59;
                _os_log_impl(&dword_1C492D000, v102, OS_LOG_TYPE_FAULT, "Unexpected nil stroke in updatedStrokeClassificationResultByAddingStrokes, encoded stroke identifier is %@. Skipping", buf, 0xCu);
              }
            }
          }
        }

        ++v58;
      }
      while (v56 != v58);
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v227, (uint64_t)v241, 16, v55);
    }
    while (v56);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v103 = (id)qword_1EA3C9FF0;
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
  {
    v109 = v103;
    uint64_t v110 = objc_msgSend_count(v199, v104, v105, v106, v107, v108);
    uint64_t v116 = objc_msgSend_count(v200, v111, v112, v113, v114, v115);
    uint64_t v122 = objc_msgSend_count(v209, v117, v118, v119, v120, v121);
    uint64_t v128 = objc_msgSend_count(v207, v123, v124, v125, v126, v127);
    *(_DWORD *)buf = 134218496;
    uint64_t v236 = v110;
    __int16 v237 = 2048;
    uint64_t v238 = v116;
    __int16 v239 = 2048;
    uint64_t v240 = v128 + v122;
    v103 = v109;
    _os_log_impl(&dword_1C492D000, v109, OS_LOG_TYPE_DEFAULT, "updatedStrokeClassificationResult with %ld added strokes, %ld removed strokes, %ld transitioned strokes", buf, 0x20u);
  }

  long long v225 = 0u;
  long long v226 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  obuint64_t j = v200;
  uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v129, (uint64_t)&v223, (uint64_t)v234, 16, v130);
  if (v131)
  {
    uint64_t v132 = *(void *)v224;
    while (2)
    {
      for (uint64_t i = 0; i != v131; ++i)
      {
        if (*(void *)v224 != v132) {
          objc_enumerationMutation(obj);
        }
        uint64_t v134 = *(void *)(*((void *)&v223 + 1) + 8 * i);
        if (v206[2]())
        {
          int v140 = 1;
          goto LABEL_42;
        }
        objc_msgSend_updateByRemovingStrokeIdentifier_withRemovedAndClutterStrokeIDs_(v205, v135, v134, (uint64_t)v210, v136, v137);
      }
      uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v138, (uint64_t)&v223, (uint64_t)v234, 16, v139);
      if (v131) {
        continue;
      }
      break;
    }
  }
  int v140 = 0;
LABEL_42:

  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  id v202 = v209;
  uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v202, v141, (uint64_t)&v219, (uint64_t)v233, 16, v142);
  if (v143)
  {
    uint64_t v144 = *(void *)v220;
    while (2)
    {
      for (uint64_t j = 0; j != v143; ++j)
      {
        if (*(void *)v220 != v144) {
          objc_enumerationMutation(v202);
        }
        uint64_t v146 = *(void *)(*((void *)&v219 + 1) + 8 * j);
        if (v206[2]())
        {
          int v140 = 1;
          goto LABEL_52;
        }
        objc_msgSend_updateByTransitionedClutterStrokeIdentifier_withRemovedAndClutterStrokeIDs_(v205, v147, v146, (uint64_t)v210, v148, v149);
      }
      uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v202, v150, (uint64_t)&v219, (uint64_t)v233, 16, v151);
      if (v143) {
        continue;
      }
      break;
    }
    int v140 = 0;
  }
LABEL_52:

  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id v201 = v199;
  uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v152, (uint64_t)&v215, (uint64_t)v232, 16, v153);
  if (v154)
  {
    uint64_t v155 = *(void *)v216;
    while (2)
    {
      for (uint64_t k = 0; k != v154; ++k)
      {
        if (*(void *)v216 != v155) {
          objc_enumerationMutation(v201);
        }
        v159 = *(void **)(*((void *)&v215 + 1) + 8 * k);
        if (v206[2]())
        {
          int v140 = 1;
          goto LABEL_65;
        }
        v165 = objc_msgSend_encodedStrokeIdentifier(v159, v160, v161, v162, v163, v164);
        int v170 = objc_msgSend_isHighDensityStroke_(v15, v166, (uint64_t)v165, v167, v168, v169);

        if (v170)
        {
          objc_msgSend_updateByAddingClutterStroke_(v205, v171, (uint64_t)v159, v173, v174, v175);
        }
        else
        {
          uint64_t v176 = objc_msgSend_forcedStrokeClass(v208, v171, v172, v173, v174, v175);
          objc_msgSend_updateByAddingNonClutterStroke_withAllStrokes_forceClass_(v205, v177, (uint64_t)v159, (uint64_t)v203, v176, v178);
        }
      }
      uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v157, (uint64_t)&v215, (uint64_t)v232, 16, v158);
      if (v154) {
        continue;
      }
      break;
    }
    int v140 = 0;
  }
LABEL_65:

  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  id v179 = v207;
  uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v179, v180, (uint64_t)&v211, (uint64_t)v231, 16, v181);
  if (v182)
  {
    uint64_t v183 = *(void *)v212;
    while (2)
    {
      for (uint64_t m = 0; m != v182; ++m)
      {
        if (*(void *)v212 != v183) {
          objc_enumerationMutation(v179);
        }
        uint64_t v185 = *(void *)(*((void *)&v211 + 1) + 8 * m);
        if (v206[2]())
        {

          goto LABEL_76;
        }
        uint64_t v191 = objc_msgSend_forcedStrokeClass(v208, v186, v187, v188, v189, v190);
        objc_msgSend_updateByAddingNonClutterStroke_withAllStrokes_forceClass_(v205, v192, v185, (uint64_t)v203, v191, v193);
      }
      uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v179, v194, (uint64_t)&v211, (uint64_t)v231, 16, v195);
      if (v182) {
        continue;
      }
      break;
    }

    v196 = v205;
  }
  else
  {

    v196 = v205;
    if (v140) {
LABEL_76:
    }
      v196 = 0;
  }
  v197 = v196;

  return v197;
}

- (id)refineResult:(id)a3 usingStrokeClassificationModel:(id)a4 sortedAddedStrokes:(id)a5 removedStrokeIdentifiers:(id)a6 lastResult:(id)a7 cancellationBlock:(id)a8
{
  uint64_t v572 = *MEMORY[0x1E4F143B8];
  id v509 = a3;
  id v510 = a4;
  id v511 = a5;
  id v512 = a6;
  id v513 = a7;
  id v514 = a8;
  uint64_t v18 = objc_msgSend_strokeProvider(self, v13, v14, v15, v16, v17);
  uint64_t v19 = sub_1C4BD26FC((uint64_t)CHStrokeClassifier, v509, v513, v18, v510, v511, v512, v514);

  uint64_t v25 = objc_msgSend_strokeProvider(self, v20, v21, v22, v23, v24);
  id v26 = v19;
  id v527 = v25;
  v515 = v26;
  self;
  uint64_t v32 = objc_msgSend_mutableCopy(v26, v27, v28, v29, v30, v31);
  v534 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v33, v34, v35, v36, v37);
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41, v42);
  id v532 = (id)objc_claimAutoreleasedReturnValue();
  long long v567 = 0u;
  long long v568 = 0u;
  long long v565 = 0u;
  long long v566 = 0u;
  objc_msgSend_scriptClassificationsByStrokeIdentifier(v32, v43, v44, v45, v46, v47);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v565, (uint64_t)v571, 16, v49);
  if (v55)
  {
    uint64_t v538 = *(void *)v566;
    do
    {
      uint64_t v56 = 0;
      do
      {
        if (*(void *)v566 != v538) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = *(void *)(*((void *)&v565 + 1) + 8 * v56);
        uint64_t v58 = objc_msgSend_scriptClassificationsByStrokeIdentifier(v32, v50, v51, v52, v53, v54);
        uint64_t v63 = objc_msgSend_objectForKeyedSubscript_(v58, v59, v57, v60, v61, v62);
        uint64_t v69 = objc_msgSend_integerValue(v63, v64, v65, v66, v67, v68);

        uint64_t v70 = objc_opt_class();
        uint64_t v79 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v70, v71, v57, (uint64_t)v527, v72, v73);
        if (v79)
        {
          uint64_t v80 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v32, v74, v75, v76, v77, v78);
          char v86 = objc_msgSend_encodedStrokeIdentifier(v79, v81, v82, v83, v84, v85);
          uint64_t v91 = objc_msgSend_objectForKeyedSubscript_(v80, v87, (uint64_t)v86, v88, v89, v90);
          uint64_t v97 = objc_msgSend_integerValue(v91, v92, v93, v94, v95, v96);

          if (v69 == 1)
          {
            sub_1C4BD01C8((uint64_t)v32, v79, 2);
            v102 = objc_opt_class();
            char isStrokeClassificationText = objc_msgSend_isStrokeClassificationText_(v102, v103, v97, v104, v105, v106);
            goto LABEL_9;
          }
          if (objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v98, v69, v99, v100, v101))
          {
            if (_os_feature_enabled_impl()) {
              uint64_t v113 = 3;
            }
            else {
              uint64_t v113 = 1;
            }
            sub_1C4BD01C8((uint64_t)v32, v79, v113);
            uint64_t v114 = objc_opt_class();
            if ((objc_msgSend_isStrokeClassificationMath_(v114, v115, v97, v116, v117, v118) & 1) == 0) {
              goto LABEL_23;
            }
          }
          else
          {
            if (v69 != 8)
            {
              sub_1C4BD01C8((uint64_t)v32, v79, 1);
              uint64_t v119 = objc_opt_class();
              char isStrokeClassificationText = objc_msgSend_isStrokeClassificationText_(v119, v120, v97, v121, v122, v123);
LABEL_9:
              if (isStrokeClassificationText) {
                goto LABEL_16;
              }
              goto LABEL_23;
            }
            if ((unint64_t)(v97 - 8) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              sub_1C4BD01C8((uint64_t)v32, v79, 5);
LABEL_23:
              objc_msgSend_addObject_(v532, v108, v57, v109, v110, v111);
            }
          }
        }
        else
        {
          objc_msgSend_addObject_(v534, v74, v57, v76, v77, v78);
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v112 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v570 = v57;
            _os_log_impl(&dword_1C492D000, v112, OS_LOG_TYPE_ERROR, "Unexpected nil stroke in Stroke Classification, encoded stoke identifier is %@. Skipping.", buf, 0xCu);
          }
        }
LABEL_16:

        ++v56;
      }
      while (v55 != v56);
      uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v565, (uint64_t)v571, 16, v54);
      uint64_t v55 = v124;
    }
    while (v124);
  }

  if (objc_msgSend_count(v534, v125, v126, v127, v128, v129))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v130 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
    {
      uint64_t v136 = objc_msgSend_count(v534, v131, v132, v133, v134, v135);
      *(_DWORD *)buf = 134217984;
      uint64_t v570 = v136;
      _os_log_impl(&dword_1C492D000, v130, OS_LOG_TYPE_ERROR, "Removing %lu invalid nil strokes in Stroke Classification", buf, 0xCu);
    }

    long long v563 = 0u;
    long long v564 = 0u;
    long long v561 = 0u;
    long long v562 = 0u;
    id v137 = v534;
    uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v138, (uint64_t)&v561, (uint64_t)buf, 16, v139);
    if (v143)
    {
      uint64_t v144 = *(void *)v562;
      do
      {
        for (uint64_t i = 0; i != v143; ++i)
        {
          if (*(void *)v562 != v144) {
            objc_enumerationMutation(v137);
          }
          objc_msgSend_updateByRemovingStrokeIdentifier_withRemovedAndClutterStrokeIDs_(v32, v140, *(void *)(*((void *)&v561 + 1) + 8 * i), (uint64_t)v137, v141, v142);
        }
        uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v140, (uint64_t)&v561, (uint64_t)buf, 16, v142);
      }
      while (v143);
    }
  }
  id v146 = v532;

  id v147 = v146;
  uint64_t v153 = objc_msgSend_strokeProvider(self, v148, v149, v150, v151, v152);
  id v154 = v32;
  id v528 = v147;
  id obja = v153;
  v516 = v154;
  self;
  v160 = objc_msgSend_mutableCopy(v154, v155, v156, v157, v158, v159);
  long long v558 = 0u;
  long long v559 = 0u;
  long long v556 = 0u;
  long long v557 = 0u;
  v166 = objc_msgSend_nontextCandidates(v160, v161, v162, v163, v164, v165);
  uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v166, v167, (uint64_t)&v556, (uint64_t)v571, 16, v168);
  if (v174)
  {
    uint64_t v175 = *(void *)v557;
    do
    {
      for (uint64_t j = 0; j != v174; ++j)
      {
        if (*(void *)v557 != v175) {
          objc_enumerationMutation(v166);
        }
        v177 = *(void **)(*((void *)&v556 + 1) + 8 * j);
        uint64_t v178 = objc_msgSend_scriptClassificationsByStrokeIdentifier(v160, v169, v170, v171, v172, v173);
        v184 = objc_msgSend_strokeIdentifier(v177, v179, v180, v181, v182, v183);
        uint64_t v189 = objc_msgSend_objectForKeyedSubscript_(v178, v185, (uint64_t)v184, v186, v187, v188);
        uint64_t v195 = objc_msgSend_integerValue(v189, v190, v191, v192, v193, v194);

        if (v195 == 1)
        {
          objc_msgSend_setFallbackClassification_(v177, v196, 2, v197, v198, v199);
        }
        else if (v195 == 8)
        {
          objc_msgSend_setFallbackClassification_(v177, v196, 5, v197, v198, v199);
        }
        else if (objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v196, v195, v197, v198, v199))
        {
          objc_msgSend_setFallbackClassification_(v177, v200, 3, v201, v202, v203);
        }
        else
        {
          objc_msgSend_setFallbackClassification_(v177, v200, 1, v201, v202, v203);
        }
      }
      uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v166, v169, (uint64_t)&v556, (uint64_t)v571, 16, v173);
    }
    while (v174);
  }

  long long v554 = 0u;
  long long v555 = 0u;
  long long v552 = 0u;
  long long v553 = 0u;
  id v522 = v528;
  uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v522, v204, (uint64_t)&v552, (uint64_t)buf, 16, v205);
  if (v210)
  {
    uint64_t v211 = *(void *)v553;
    do
    {
      for (uint64_t k = 0; k != v210; ++k)
      {
        if (*(void *)v553 != v211) {
          objc_enumerationMutation(v522);
        }
        long long v213 = objc_msgSend_strokeIdentifierFromData_(obja, v206, *(void *)(*((void *)&v552 + 1) + 8 * k), v207, v208, v209);
        long long v218 = objc_msgSend_strokeForIdentifier_(obja, v214, (uint64_t)v213, v215, v216, v217);
        objc_msgSend_updateNonTextCandidatesSupportFromStroke_(v160, v219, (uint64_t)v218, v220, v221, v222);
      }
      uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v522, v206, (uint64_t)&v552, (uint64_t)buf, 16, v209);
    }
    while (v210);
  }

  v517 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v223, v224, v225, v226, v227);
  long long v550 = 0u;
  long long v551 = 0u;
  long long v548 = 0u;
  long long v549 = 0u;
  objc_msgSend_nontextCandidates(v160, v228, v229, v230, v231, v232);
  id v521 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v524 = objc_msgSend_countByEnumeratingWithState_objects_count_(v521, v233, (uint64_t)&v548, (uint64_t)&v565, 16, v234);
  if (!v524) {
    goto LABEL_161;
  }
  uint64_t v523 = *(void *)v549;
  do
  {
    uint64_t v530 = 0;
    while (2)
    {
      if (*(void *)v549 != v523) {
        objc_enumerationMutation(v521);
      }
      uint64_t v240 = *(void **)(*((void *)&v548 + 1) + 8 * v530);
      if ((objc_msgSend_isLongHorizontalNonTextLine(v240, v235, v236, v237, v238, v239) & 1) == 0) {
        goto LABEL_67;
      }
      v241 = objc_msgSend_supportingStrokeIdentifiers(v240, v235, v236, v237, v238, v239);
      objc_msgSend_sizeRatioFromStrokes_(v240, v242, (uint64_t)v241, v243, v244, v245);
      double v247 = v246;
      v535 = v240;

      if (v247 < 0.15) {
        goto LABEL_67;
      }
      v248 = objc_msgSend_scriptClassificationsByStrokeIdentifier(v160, v235, v236, v237, v238, v239);
      v254 = objc_msgSend_strokeIdentifier(v240, v249, v250, v251, v252, v253);
      v259 = objc_msgSend_objectForKey_(v248, v255, (uint64_t)v254, v256, v257, v258);
      uint64_t v526 = objc_msgSend_integerValue(v259, v260, v261, v262, v263, v264);

      v270 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v160, v265, v266, v267, v268, v269);
      v276 = objc_msgSend_strokeIdentifier(v535, v271, v272, v273, v274, v275);
      v525 = objc_msgSend_objectForKey_(v270, v277, (uint64_t)v276, v278, v279, v280);

      v286 = objc_msgSend_probabilityByScriptClassifications(v525, v281, v282, v283, v284, v285);
      uint64_t v291 = objc_msgSend_numberWithInteger_(NSNumber, v287, v526, v288, v289, v290);
      v296 = objc_msgSend_objectForKeyedSubscript_(v286, v292, v291, v293, v294, v295);
      objc_msgSend_floatValue(v296, v297, v298, v299, v300, v301);
      float v303 = v302;

      v309 = objc_msgSend_orderedScriptClassification(v525, v304, v305, v306, v307, v308);
      LOBYTE(v291) = objc_msgSend_count(v309, v310, v311, v312, v313, v314) == 0;

      if (v291)
      {
        uint64_t v326 = 0;
        double v327 = v303;
        uint64_t v328 = v526;
        if (v526 == 16)
        {
LABEL_74:
          BOOL v329 = 1;
LABEL_80:
          int v330 = 0;
          BOOL v332 = v526 == 8 && v326 == 15;
          BOOL v334 = v526 != 8 && v326 == 8;
          if (v327 >= 0.8) {
            BOOL v334 = 0;
          }
          if (!v329) {
            goto LABEL_106;
          }
          goto LABEL_108;
        }
      }
      else
      {
        v320 = objc_msgSend_scriptClassificationAtIndex_(v525, v315, 1, v317, v318, v319);
        uint64_t v326 = objc_msgSend_integerValue(v320, v321, v322, v323, v324, v325);

        double v327 = v303;
        uint64_t v328 = v526;
        if (v526 == 16) {
          goto LABEL_74;
        }
      }
      if (v328 == 8 || v326 != 16 || v327 >= 0.8)
      {
        BOOL v329 = v247 > 0.7 && v526 == 7;
        if (v526 != 15) {
          goto LABEL_80;
        }
      }
      else
      {
        BOOL v329 = 1;
        if (v526 != 15) {
          goto LABEL_80;
        }
      }
      int v330 = 1;
      BOOL v332 = 1;
      BOOL v334 = v326 == 8;
      if (v327 >= 0.8) {
        BOOL v334 = 0;
      }
      if (!v329)
      {
LABEL_106:
        if (!v332 && !v334) {
          goto LABEL_66;
        }
      }
LABEL_108:
      v531 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v315, v316, v317, v318, v319);
      v539 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v336, v337, v338, v339, v340);
      BOOL v519 = v329;
      BOOL v520 = v332;
      int v518 = v330;
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v341, v342, v343, v344, v345);
      id v533 = (id)objc_claimAutoreleasedReturnValue();
      v351 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v346, v347, v348, v349, v350);
      long long v546 = 0u;
      long long v547 = 0u;
      long long v544 = 0u;
      long long v545 = 0u;
      v357 = objc_msgSend_supportingStrokeIdentifiers(v535, v352, v353, v354, v355, v356);
      uint64_t v365 = objc_msgSend_countByEnumeratingWithState_objects_count_(v357, v358, (uint64_t)&v544, (uint64_t)&v561, 16, v359);
      if (!v365) {
        goto LABEL_128;
      }
      uint64_t v366 = *(void *)v545;
      do
      {
        for (uint64_t m = 0; m != v365; ++m)
        {
          if (*(void *)v545 != v366) {
            objc_enumerationMutation(v357);
          }
          uint64_t v368 = *(void *)(*((void *)&v544 + 1) + 8 * m);
          v369 = objc_msgSend_scriptClassificationsByStrokeIdentifier(v160, v360, v361, v362, v363, v364);
          v374 = objc_msgSend_objectForKey_(v369, v370, v368, v371, v372, v373);
          uint64_t v380 = objc_msgSend_integerValue(v374, v375, v376, v377, v378, v379);

          char isScriptClassificationMath = objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v381, v380, v382, v383, v384);
          if (v380 == 8) {
            char v386 = 1;
          }
          else {
            char v386 = isScriptClassificationMath;
          }
          v387 = v351;
          if ((v386 & 1) == 0)
          {
LABEL_111:
            objc_msgSend_addObject_(v387, v360, v368, v362, v363, v364);
            continue;
          }
          if ((v380 & 0xFFFFFFFFFFFFFFFELL) == 0xE)
          {
            v388 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v360, v368, (uint64_t)obja, v363, v364);
            if (objc_msgSend_isHorizontalAlignedWithStroke_(v535, v389, (uint64_t)v388, v390, v391, v392)) {
              objc_msgSend_addObject_(v533, v393, v368, v394, v395, v396);
            }
            else {
              objc_msgSend_addObject_(v539, v393, v368, v394, v395, v396);
            }
          }
          else if ((v380 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
          {
            objc_msgSend_addObject_(v539, v360, v368, v362, v363, v364);
            v387 = v531;
            if (v380 == 13) {
              goto LABEL_111;
            }
          }
        }
        uint64_t v365 = objc_msgSend_countByEnumeratingWithState_objects_count_(v357, v360, (uint64_t)&v544, (uint64_t)&v561, 16, v364);
      }
      while (v365);
LABEL_128:

      objc_msgSend_support(v535, v397, v398, v399, v400, v401);
      if (v407 >= 0.0)
      {
        int v429 = 1;
        goto LABEL_135;
      }
      if (!objc_msgSend_count(v539, v402, v403, v404, v405, v406))
      {
        double v419 = 0.0;
        if (v519) {
          goto LABEL_131;
        }
LABEL_143:
        if (!v520) {
          goto LABEL_141;
        }
        if (objc_msgSend_count(v531, v408, v409, v410, v411, v412))
        {
          objc_msgSend_supportFromStrokes_(v535, v402, (uint64_t)v531, v404, v405, v406);
          double v467 = v466 / (double)(unint64_t)objc_msgSend_count(v531, v461, v462, v463, v464, v465);
          if (v419 != 0.0)
          {
LABEL_146:
            BOOL v468 = v467 / v419 > 0.7;
LABEL_159:
            int v429 = !v468;
            goto LABEL_135;
          }
        }
        else
        {
          double v467 = 0.0;
          if (v419 != 0.0) {
            goto LABEL_146;
          }
        }
        BOOL v468 = 0;
        goto LABEL_159;
      }
      objc_msgSend_supportFromStrokes_(v535, v408, (uint64_t)v539, v410, v411, v412);
      double v419 = v418 / (double)(unint64_t)objc_msgSend_count(v539, v413, v414, v415, v416, v417);
      if (!v519) {
        goto LABEL_143;
      }
LABEL_131:
      if (objc_msgSend_count(v351, v408, v409, v410, v411, v412)
        && (objc_msgSend_supportFromStrokes_(v535, v420, (uint64_t)v351, v422, v423, v424), double v426 = v425, v425 > 0.0))
      {
        objc_msgSend_support(v535, v420, v421, v422, v423, v424);
        BOOL v428 = v426 / fabs(v427) > 0.15;
      }
      else
      {
        BOOL v428 = 0;
      }
      if (objc_msgSend_count(v533, v420, v421, v422, v423, v424))
      {
        objc_msgSend_supportFromStrokes_(v535, v469, (uint64_t)v533, v471, v472, v473);
        double v480 = v479 / (double)(unint64_t)objc_msgSend_count(v533, v474, v475, v476, v477, v478);
      }
      else
      {
        double v480 = 0.0;
      }
      if (objc_msgSend_count(v539, v469, v470, v471, v472, v473)
        || !objc_msgSend_count(v533, v402, v481, v404, v405, v406))
      {
        if (v419 == 0.0) {
          int v429 = v428;
        }
        else {
          int v429 = v480 / v419 > 0.32 || v428;
        }
      }
      else
      {
        int v429 = v428 | 1;
      }
LABEL_135:
      if (v526 != 8 && v429)
      {
        objc_msgSend_setFallbackClassification_(v535, v402, 5, v404, v405, v406);
        v435 = objc_msgSend_strokeIdentifier(v535, v430, v431, v432, v433, v434);
        sub_1C4BD0118((uint64_t)v160, v435, 6);

        v441 = objc_msgSend_strokeIdentifier(v535, v436, v437, v438, v439, v440);
        objc_msgSend_addObject_(v517, v442, (uint64_t)v441, v443, v444, v445);
        goto LABEL_140;
      }
      if (((v518 | v429 | !v520) & 1) == 0)
      {
        objc_msgSend_setFallbackClassification_(v535, v402, 3, v404, v405, v406);
        v451 = objc_msgSend_strokeIdentifier(v535, v446, v447, v448, v449, v450);
        sub_1C4BD0118((uint64_t)v160, v451, 3);

        v441 = objc_msgSend_strokeIdentifier(v535, v452, v453, v454, v455, v456);
        objc_msgSend_addObject_(v517, v457, (uint64_t)v441, v458, v459, v460);
LABEL_140:
      }
LABEL_141:

LABEL_66:
LABEL_67:
      if (++v530 != v524) {
        continue;
      }
      break;
    }
    uint64_t v524 = objc_msgSend_countByEnumeratingWithState_objects_count_(v521, v235, (uint64_t)&v548, (uint64_t)&v565, 16, v239);
  }
  while (v524);
LABEL_161:

  long long v542 = 0u;
  long long v543 = 0u;
  long long v540 = 0u;
  long long v541 = 0u;
  id v482 = v517;
  uint64_t v489 = objc_msgSend_countByEnumeratingWithState_objects_count_(v482, v483, (uint64_t)&v540, (uint64_t)v560, 16, v484);
  if (v489)
  {
    uint64_t v490 = *(void *)v541;
    do
    {
      for (uint64_t n = 0; n != v489; ++n)
      {
        if (*(void *)v541 != v490) {
          objc_enumerationMutation(v482);
        }
        v492 = objc_msgSend_strokeIdentifierFromData_(obja, v485, *(void *)(*((void *)&v540 + 1) + 8 * n), v486, v487, v488);
        v497 = objc_msgSend_strokeForIdentifier_(obja, v493, (uint64_t)v492, v494, v495, v496);
        objc_msgSend_updateNonTextCandidatesSupportFromStroke_(v160, v498, (uint64_t)v497, v499, v500, v501);
      }
      uint64_t v489 = objc_msgSend_countByEnumeratingWithState_objects_count_(v482, v485, (uint64_t)&v540, (uint64_t)v560, 16, v488);
    }
    while (v489);
  }

  v507 = objc_msgSend_copy(v160, v502, v503, v504, v505, v506);
  return v507;
}

- (id)refineResult:(id)a3 usingSortedTextStrokeGroups:(id)a4 cancellationBlock:(id)a5
{
  uint64_t v1008 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v928 = a4;
  v933 = (uint64_t (**)(void))a5;
  v942 = v7;
  id v959 = (id)objc_msgSend_mutableCopy(v7, v8, v9, v10, v11, v12);
  v951 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15, v16, v17);
  long long v983 = 0u;
  long long v984 = 0u;
  long long v981 = 0u;
  long long v982 = 0u;
  obunint64_t j = v928;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v981, (uint64_t)v1000, 16, v19);
  if (v25)
  {
    uint64_t v26 = *(void *)v982;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v982 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v981 + 1) + 8 * i);
        uint64_t v29 = objc_msgSend_allKeys(v951, v20, v21, v22, v23, v24);
        uint64_t v30 = NSNumber;
        uint64_t v36 = objc_msgSend_classification(v28, v31, v32, v33, v34, v35);
        uint64_t v41 = objc_msgSend_numberWithInteger_(v30, v37, v36, v38, v39, v40);
        char v46 = objc_msgSend_containsObject_(v29, v42, (uint64_t)v41, v43, v44, v45);

        if ((v46 & 1) == 0)
        {
          uint64_t v52 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v47, v48, v49, v50, v51);
          uint64_t v53 = NSNumber;
          uint64_t v59 = objc_msgSend_classification(v28, v54, v55, v56, v57, v58);
          uint64_t v64 = objc_msgSend_numberWithInteger_(v53, v60, v59, v61, v62, v63);
          objc_msgSend_setObject_forKeyedSubscript_(v951, v65, (uint64_t)v52, (uint64_t)v64, v66, v67);
        }
        uint64_t v68 = NSNumber;
        uint64_t v69 = objc_msgSend_classification(v28, v47, v48, v49, v50, v51);
        uint64_t v74 = objc_msgSend_numberWithInteger_(v68, v70, v69, v71, v72, v73);
        uint64_t v79 = objc_msgSend_objectForKeyedSubscript_(v951, v75, (uint64_t)v74, v76, v77, v78);
        objc_msgSend_addObject_(v79, v80, (uint64_t)v28, v81, v82, v83);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v981, (uint64_t)v1000, 16, v24);
    }
    while (v25);
  }

  v946 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v84, v85, v86, v87, v88);
  v931 = objc_msgSend_objectForKeyedSubscript_(v951, v89, (uint64_t)&unk_1F203F0A8, v90, v91, v92);
  v930 = objc_msgSend_objectForKeyedSubscript_(v951, v93, (uint64_t)&unk_1F203F0C0, v94, v95, v96);
  double v97 = *MEMORY[0x1E4F1DB30];
  v103 = objc_msgSend_strokeProvider(self, v98, v99, v100, v101, v102);
  char v104 = objc_opt_respondsToSelector();

  if (v104)
  {
    uint64_t v110 = objc_msgSend_strokeProvider(self, v105, v106, v107, v108, v109);
    objc_msgSend_drawingCanvasSize(v110, v111, v112, v113, v114, v115);
    double v97 = v116;
  }
  uint64_t v950 = 0;
  if (!v931 || !v930)
  {
LABEL_131:
    unint64_t v940 = 0;
    while (1)
    {
      if (v940 >= objc_msgSend_count(obj, v105, v106, v107, v108, v109))
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v915 = (id)qword_1EA3C9FF0;
        if (os_log_type_enabled(v915, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v921 = objc_msgSend_count(v946, v916, v917, v918, v919, v920);
          *(_DWORD *)buf = 134218240;
          uint64_t v1003 = v950;
          __int16 v1004 = 2048;
          uint64_t v1005 = v921;
          _os_log_impl(&dword_1C492D000, v915, OS_LOG_TYPE_DEFAULT, "RefineResult: transitionned strokes = %ld, group replacement = %ld", buf, 0x16u);
        }
        goto LABEL_194;
      }
      if (v933[2]()) {
        goto LABEL_195;
      }
      v649 = objc_msgSend_objectAtIndexedSubscript_(obj, v645, v940, v646, v647, v648);
      v650 = NSNumber;
      v945 = v649;
      uint64_t v656 = objc_msgSend_uniqueIdentifier(v649, v651, v652, v653, v654, v655);
      v661 = objc_msgSend_numberWithInteger_(v650, v657, v656, v658, v659, v660);
      v666 = objc_msgSend_objectForKeyedSubscript_(v946, v662, (uint64_t)v661, v663, v664, v665);
      BOOL v667 = v666 == 0;

      if (!v667)
      {
        v673 = NSNumber;
        uint64_t v674 = objc_msgSend_uniqueIdentifier(v945, v668, v669, v670, v671, v672);
        v679 = objc_msgSend_numberWithInteger_(v673, v675, v674, v676, v677, v678);
        uint64_t v684 = objc_msgSend_objectForKeyedSubscript_(v946, v680, (uint64_t)v679, v681, v682, v683);

        v945 = (void *)v684;
      }
      for (unint64_t j = ++v940; ; unint64_t j = v948 + 1)
      {
        uint64_t v948 = j;
        if (j >= objc_msgSend_count(obj, v668, v669, v670, v671, v672)) {
          break;
        }
        v690 = objc_msgSend_objectAtIndexedSubscript_(obj, v686, v948, v687, v688, v689);
        v691 = NSNumber;
        uint64_t v697 = objc_msgSend_uniqueIdentifier(v690, v692, v693, v694, v695, v696);
        v702 = objc_msgSend_numberWithInteger_(v691, v698, v697, v699, v700, v701);
        v707 = objc_msgSend_objectForKeyedSubscript_(v946, v703, (uint64_t)v702, v704, v705, v706);
        BOOL v708 = v707 == 0;

        if (!v708)
        {
          v714 = NSNumber;
          uint64_t v715 = objc_msgSend_uniqueIdentifier(v945, v709, v710, v711, v712, v713);
          v720 = objc_msgSend_numberWithInteger_(v714, v716, v715, v717, v718, v719);
          uint64_t v725 = objc_msgSend_objectForKeyedSubscript_(v946, v721, (uint64_t)v720, v722, v723, v724);

          v690 = (void *)v725;
        }
        v726 = objc_msgSend_strokeProvider(self, v709, v710, v711, v712, v713);
        id v958 = v945;
        id v953 = v690;
        id v727 = v942;
        id v728 = v726;
        self;
        v729 = objc_opt_class();
        objc_msgSend_bounds(v958, v730, v731, v732, v733, v734);
        double v736 = v735;
        double v738 = v737;
        double v740 = v739;
        double v742 = v741;
        objc_msgSend_bounds(v953, v743, v744, v745, v746, v747);
        objc_msgSend_distanceFromRectangle_toRectangle_(v729, v748, v749, v750, v751, v752, v736, v738, v740, v742, v753, v754, v755, v756);
        if (v757 <= 1.0)
        {
          v993[0] = MEMORY[0x1E4F143A8];
          v993[1] = 3221225472;
          v993[2] = sub_1C4BD6A6C;
          v993[3] = &unk_1E64E4E28;
          id v994 = v727;
          v759 = (uint64_t (**)(void, void, void))MEMORY[0x1C8786E90](v993);
          long long v991 = 0u;
          long long v992 = 0u;
          long long v989 = 0u;
          long long v990 = 0u;
          v765 = objc_msgSend_strokeIdentifiers(v953, v760, v761, v762, v763, v764);
          uint64_t v771 = objc_msgSend_countByEnumeratingWithState_objects_count_(v765, v766, (uint64_t)&v989, (uint64_t)buf, 16, v767);
          if (v771)
          {
            uint64_t v772 = *(void *)v990;
LABEL_145:
            uint64_t v773 = 0;
            while (1)
            {
              if (*(void *)v990 != v772) {
                objc_enumerationMutation(v765);
              }
              v774 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v768, *(void *)(*((void *)&v989 + 1) + 8 * v773), (uint64_t)v728, v769, v770);
              char v775 = ((uint64_t (**)(void, void *, id))v759)[2](v759, v774, v958);

              if (v775) {
                break;
              }
              if (v771 == ++v773)
              {
                uint64_t v771 = objc_msgSend_countByEnumeratingWithState_objects_count_(v765, v768, (uint64_t)&v989, (uint64_t)buf, 16, v770);
                if (v771) {
                  goto LABEL_145;
                }
                goto LABEL_151;
              }
            }
LABEL_160:
            int v758 = 1;
          }
          else
          {
LABEL_151:

            long long v987 = 0u;
            long long v988 = 0u;
            long long v985 = 0u;
            long long v986 = 0u;
            v765 = objc_msgSend_strokeIdentifiers(v958, v776, v777, v778, v779, v780);
            uint64_t v786 = objc_msgSend_countByEnumeratingWithState_objects_count_(v765, v781, (uint64_t)&v985, (uint64_t)v1001, 16, v782);
            if (v786)
            {
              uint64_t v787 = *(void *)v986;
LABEL_153:
              uint64_t v788 = 0;
              while (1)
              {
                if (*(void *)v986 != v787) {
                  objc_enumerationMutation(v765);
                }
                v789 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v783, *(void *)(*((void *)&v985 + 1) + 8 * v788), (uint64_t)v728, v784, v785);
                char v790 = ((uint64_t (**)(void, void *, id))v759)[2](v759, v789, v953);

                if (v790) {
                  goto LABEL_160;
                }
                if (v786 == ++v788)
                {
                  uint64_t v786 = objc_msgSend_countByEnumeratingWithState_objects_count_(v765, v783, (uint64_t)&v985, (uint64_t)v1001, 16, v785);
                  if (v786) {
                    goto LABEL_153;
                  }
                  break;
                }
              }
            }
            int v758 = 0;
          }

          goto LABEL_162;
        }
        int v758 = 0;
LABEL_162:

        v791 = v953;
        uint64_t v797 = objc_msgSend_classification(v958, v792, v793, v794, v795, v796);
        uint64_t v803 = objc_msgSend_classification(v953, v798, v799, v800, v801, v802);
        self;
        if (objc_msgSend_isStrokeClassificationTextOrMath_(CHStrokeUtilities, v804, v797, v805, v806, v807)&& objc_msgSend_isStrokeClassificationTextOrMath_(CHStrokeUtilities, v808, v803, v809, v810, v811))
        {
          if objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v812, v797, v813, v814, v815)&& (objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v816, v803, v817, v818, v819))
          {
            int isStrokeClassificationMath = 1;
          }
          else
          {
            if (!objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v816, v803, v817, v818, v819))goto LABEL_189; {
            int isStrokeClassificationMath = objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v821, v797, v822, v823, v824);
            }
          }
          if ((v758 & isStrokeClassificationMath) == 1)
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v825 = (id)qword_1EA3C9FF0;
            if (os_log_type_enabled(v825, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v825, OS_LOG_TYPE_DEBUG, "Converting overlapping groups to the same stroke classification", buf, 2u);
            }

            v831 = objc_msgSend_strategyIdentifier(v958, v826, v827, v828, v829, v830);
            uint64_t v837 = objc_msgSend_classification(v958, v832, v833, v834, v835, v836);
            v841 = objc_msgSend_strokeGroupWithUpdatedStrategyIdentifier_classification_(v953, v838, (uint64_t)v831, v837, v839, v840);
            v842 = NSNumber;
            uint64_t v848 = objc_msgSend_uniqueIdentifier(v953, v843, v844, v845, v846, v847);
            v853 = objc_msgSend_numberWithInteger_(v842, v849, v848, v850, v851, v852);
            objc_msgSend_setObject_forKeyedSubscript_(v946, v854, (uint64_t)v841, (uint64_t)v853, v855, v856);

            long long v963 = 0u;
            long long v964 = 0u;
            long long v961 = 0u;
            long long v962 = 0u;
            objc_msgSend_strokeIdentifiers(v953, v857, v858, v859, v860, v861);
            id v955 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v869 = objc_msgSend_countByEnumeratingWithState_objects_count_(v955, v862, (uint64_t)&v961, (uint64_t)v995, 16, v863);
            if (v869)
            {
              uint64_t v870 = *(void *)v962;
              do
              {
                uint64_t v871 = 0;
                v950 += v869;
                do
                {
                  if (*(void *)v962 != v870) {
                    objc_enumerationMutation(v955);
                  }
                  uint64_t v872 = *(void *)(*((void *)&v961 + 1) + 8 * v871);
                  v873 = objc_msgSend_strokeProvider(self, v864, v865, v866, v867, v868);
                  v877 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v874, v872, (uint64_t)v873, v875, v876);

                  if (v877)
                  {
                    uint64_t v883 = objc_msgSend_classification(v958, v878, v879, v880, v881, v882);
                    sub_1C4BD01C8((uint64_t)v959, v877, v883);
                  }
                  else
                  {
                    if (qword_1EA3CA000 != -1) {
                      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                    }
                    v884 = (id)qword_1EA3C9FF0;
                    if (os_log_type_enabled(v884, OS_LOG_TYPE_ERROR))
                    {
                      v890 = objc_msgSend_strokeProvider(self, v885, v886, v887, v888, v889);
                      v896 = objc_msgSend_strokeProviderVersion(v890, v891, v892, v893, v894, v895);
                      v902 = objc_msgSend_strokeProvider(self, v897, v898, v899, v900, v901);
                      v908 = objc_msgSend_orderedStrokes(v902, v903, v904, v905, v906, v907);
                      uint64_t v914 = objc_msgSend_count(v908, v909, v910, v911, v912, v913);
                      *(_DWORD *)buf = 138412802;
                      uint64_t v1003 = v872;
                      __int16 v1004 = 2112;
                      uint64_t v1005 = (uint64_t)v896;
                      __int16 v1006 = 2048;
                      uint64_t v1007 = v914;
                      _os_log_impl(&dword_1C492D000, v884, OS_LOG_TYPE_ERROR, "Invalid stroke with identifier %@ for stroke provider: versiouint64_t n = %@, number of strokes = %ld", buf, 0x20u);
                    }
                  }

                  ++v871;
                }
                while (v869 != v871);
                uint64_t v869 = objc_msgSend_countByEnumeratingWithState_objects_count_(v955, v864, (uint64_t)&v961, (uint64_t)v995, 16, v868);
              }
              while (v869);
            }

            v791 = v953;
          }
        }
LABEL_189:
      }
    }
  }
  long long v979 = 0u;
  long long v980 = 0u;
  long long v977 = 0u;
  long long v978 = 0u;
  v926 = v931;
  uint64_t v924 = objc_msgSend_countByEnumeratingWithState_objects_count_(v926, v117, (uint64_t)&v977, (uint64_t)v999, 16, v118);
  if (!v924)
  {
    uint64_t v950 = 0;
    goto LABEL_130;
  }
  uint64_t v950 = 0;
  uint64_t v925 = *(void *)v978;
LABEL_16:
  uint64_t v927 = 0;
LABEL_17:
  if (*(void *)v978 != v925) {
    objc_enumerationMutation(v926);
  }
  uint64_t v124 = *(void **)(*((void *)&v977 + 1) + 8 * v927);
  uint64_t v125 = NSNumber;
  uint64_t v126 = objc_msgSend_uniqueIdentifier(v124, v119, v120, v121, v122, v123);
  uint64_t v131 = objc_msgSend_numberWithInteger_(v125, v127, v126, v128, v129, v130);
  uint64_t v141 = objc_msgSend_objectForKeyedSubscript_(v946, v132, (uint64_t)v131, v133, v134, v135);
  if (v141)
  {
    uint64_t v142 = NSNumber;
    uint64_t v143 = objc_msgSend_uniqueIdentifier(v124, v136, v137, v138, v139, v140);
    uint64_t v148 = objc_msgSend_numberWithInteger_(v142, v144, v143, v145, v146, v147);
    objc_msgSend_objectForKeyedSubscript_(v946, v149, (uint64_t)v148, v150, v151, v152);
    id v937 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v937 = v124;
  }

  if ((v933[2]() & 1) == 0)
  {
    long long v975 = 0u;
    long long v976 = 0u;
    long long v973 = 0u;
    long long v974 = 0u;
    id v934 = v930;
    uint64_t v938 = objc_msgSend_countByEnumeratingWithState_objects_count_(v934, v153, (uint64_t)&v973, (uint64_t)v998, 16, v154);
    if (!v938) {
      goto LABEL_126;
    }
    uint64_t v935 = *(void *)v974;
    while (1)
    {
      uint64_t v947 = 0;
      do
      {
        if (*(void *)v974 != v935) {
          objc_enumerationMutation(v934);
        }
        v160 = *(void **)(*((void *)&v973 + 1) + 8 * v947);
        uint64_t v161 = NSNumber;
        uint64_t v162 = objc_msgSend_uniqueIdentifier(v160, v155, v156, v157, v158, v159);
        uint64_t v167 = objc_msgSend_numberWithInteger_(v161, v163, v162, v164, v165, v166);
        v177 = objc_msgSend_objectForKeyedSubscript_(v946, v168, (uint64_t)v167, v169, v170, v171);
        if (v177)
        {
          uint64_t v178 = NSNumber;
          uint64_t v179 = objc_msgSend_uniqueIdentifier(v160, v172, v173, v174, v175, v176);
          v184 = objc_msgSend_numberWithInteger_(v178, v180, v179, v181, v182, v183);
          objc_msgSend_objectForKeyedSubscript_(v946, v185, (uint64_t)v184, v186, v187, v188);
          id v939 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v939 = v160;
        }

        uint64_t v194 = objc_msgSend_strokeProvider(self, v189, v190, v191, v192, v193);
        id v195 = v939;
        id v196 = v937;
        id v941 = v942;
        id v954 = v195;
        id v956 = v194;
        v952 = v196;
        uint64_t v936 = self;
        if (objc_msgSend_classification(v196, v197, v198, v199, v200, v201) == 1
          || objc_msgSend_classification(v195, v202, v203, v204, v205, v206) == 3)
        {
          goto LABEL_62;
        }
        long long v212 = objc_msgSend_strokeIdentifiers(v195, v207, v208, v209, v210, v211);
        if ((unint64_t)objc_msgSend_count(v212, v213, v214, v215, v216, v217) <= 1)
        {

LABEL_62:
          int v332 = 0;
          int v333 = 0;
          int v334 = 0;
          goto LABEL_63;
        }
        long long v223 = objc_msgSend_strokeIdentifiers(v196, v218, v219, v220, v221, v222);
        BOOL v229 = (unint64_t)objc_msgSend_count(v223, v224, v225, v226, v227, v228) < 2;

        if (v229) {
          goto LABEL_62;
        }
        uint64_t v230 = objc_opt_class();
        objc_msgSend_bounds(v196, v231, v232, v233, v234, v235);
        double v237 = v236;
        double v239 = v238;
        double v241 = v240;
        double v243 = v242;
        objc_msgSend_bounds(v954, v244, v245, v246, v247, v248);
        objc_msgSend_distanceFromRectangle_toRectangle_(v230, v249, v250, v251, v252, v253, v237, v239, v241, v243, v254, v255, v256, v257);
        double v259 = v258;
        if (v97 > 0.0 && v258 > v97) {
          goto LABEL_62;
        }
        HIDWORD(v929) = sub_1C4BD6858((uint64_t)CHStrokeClassifier, &unk_1F203DD58, v196, v941);
        LODWORD(v929) = sub_1C4BD6858((uint64_t)CHStrokeClassifier, &unk_1F203DD70, v196, v941);
        id v260 = v954;
        id v261 = v941;
        id v943 = v956;
        v932 = v260;
        self;
        uint64_t v267 = objc_msgSend_strokeIdentifiers(v260, v262, v263, v264, v265, v266);
        LOBYTE(v260) = objc_msgSend_count(v267, v268, v269, v270, v271, v272) == 0;

        double v278 = 0.0;
        if ((v260 & 1) == 0)
        {
          long long v991 = 0u;
          long long v992 = 0u;
          long long v989 = 0u;
          long long v990 = 0u;
          uint64_t v279 = objc_msgSend_strokeIdentifiers(v932, v273, v274, v275, v276, v277);
          uint64_t v287 = objc_msgSend_countByEnumeratingWithState_objects_count_(v279, v280, (uint64_t)&v989, (uint64_t)buf, 16, v281);
          if (v287)
          {
            int v288 = 0;
            uint64_t v289 = *(void *)v990;
            do
            {
              for (uint64_t k = 0; k != v287; ++k)
              {
                if (*(void *)v990 != v289) {
                  objc_enumerationMutation(v279);
                }
                uint64_t v291 = *(void *)(*((void *)&v989 + 1) + 8 * k);
                v292 = objc_msgSend_substrokesByStrokeIdentifier(v261, v282, v283, v284, v285, v286);
                v297 = objc_msgSend_objectForKey_(v292, v293, v291, v294, v295, v296);

                if (!v297)
                {
                  uint64_t v301 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v298, v291, (uint64_t)v943, v299, v300);
                  float v302 = objc_opt_class();
                  v297 = objc_msgSend_substrokesForStroke_(v302, v303, (uint64_t)v301, v304, v305, v306);
                }
                long long v987 = 0u;
                long long v988 = 0u;
                long long v985 = 0u;
                long long v986 = 0u;
                id v307 = v297;
                uint64_t v315 = objc_msgSend_countByEnumeratingWithState_objects_count_(v307, v308, (uint64_t)&v985, (uint64_t)v1001, 16, v309);
                if (v315)
                {
                  uint64_t v316 = *(void *)v986;
                  do
                  {
                    for (uint64_t m = 0; m != v315; ++m)
                    {
                      if (*(void *)v986 != v316) {
                        objc_enumerationMutation(v307);
                      }
                      objc_msgSend_bounds(*(void **)(*((void *)&v985 + 1) + 8 * m), v310, v311, v312, v313, v314);
                      double v278 = v278 + v318;
                    }
                    uint64_t v315 = objc_msgSend_countByEnumeratingWithState_objects_count_(v307, v310, (uint64_t)&v985, (uint64_t)v1001, 16, v314);
                  }
                  while (v315);
                }

                int v324 = objc_msgSend_count(v307, v319, v320, v321, v322, v323);
                v288 += v324;
              }
              uint64_t v287 = objc_msgSend_countByEnumeratingWithState_objects_count_(v279, v282, (uint64_t)&v989, (uint64_t)buf, 16, v286);
            }
            while (v287);

            if (v288) {
              double v278 = v278 / (double)v288;
            }
            else {
              double v278 = 0.0;
            }
          }
          else
          {
          }
        }

        objc_msgSend_bounds(v932, v325, v326, v327, v328, v329);
        double v331 = 2.2;
        if (v929) {
          double v331 = 5.0;
        }
        if (v330 / v278 > v331) {
          goto LABEL_62;
        }
        int v332 = 0;
        if (v259 <= 1.0)
        {
          int v333 = 0;
          int v334 = 0;
        }
        else
        {
          int v333 = 0;
          int v334 = 0;
          if (v259 < v278 + v278)
          {
            int v516 = sub_1C4BD6858(v936, &unk_1F203DD88, v952, v261);
            objc_msgSend_bounds(v932, v517, v518, v519, v520, v521);
            double v523 = v522;
            objc_msgSend_bounds(v952, v524, v525, v526, v527, v528);
            double v530 = v529;
            objc_msgSend_bounds(v932, v531, v532, v533, v534, v535);
            double v537 = v536;
            double v944 = v97;
            objc_msgSend_bounds(v952, v538, v539, v540, v541, v542);
            double v544 = v543;
            double v923 = v523;
            objc_msgSend_bounds(v932, v545, v546, v547, v548, v549);
            double v551 = v550;
            double v553 = v552;
            double v555 = v554;
            double v557 = v556;
            objc_msgSend_bounds(v952, v558, v559, v560, v561, v562);
            objc_msgSend_horizontalDistanceBetweenRectangle_rectangle_(CHStrokeUtilities, v563, v564, v565, v566, v567, v551, v553, v555, v557, v568, v569, v570, v571);
            double v573 = v572;
            objc_msgSend_bounds(v932, v574, v575, v576, v577, v578);
            double v580 = v579;
            double v582 = v581;
            double v584 = v583;
            double v586 = v585;
            objc_msgSend_bounds(v952, v587, v588, v589, v590, v591);
            objc_msgSend_verticalDistanceBetweenRectangle_rectangle_(CHStrokeUtilities, v592, v593, v594, v595, v596, v580, v582, v584, v586, v597, v598, v599, v600);
            double v607 = fmin(v537, v544);
            BOOL v608 = v606 < v607 * -0.3;
            if (v573 <= 0.0) {
              BOOL v608 = 0;
            }
            BOOL v609 = v573 < v607 * -0.3;
            if (v606 <= 0.0) {
              BOOL v609 = 0;
            }
            if (v516) {
              BOOL v610 = v609;
            }
            else {
              BOOL v610 = v608;
            }
            objc_msgSend_bounds(v952, v601, v602, v603, v604, v605);
            double v612 = v611;
            objc_msgSend_bounds(v932, v613, v614, v615, v616, v617);
            double v97 = v944;
            double v618 = fmax(v923, v530);
            double v620 = vabdd_f64(v612, v619);
            double v621 = v618 * 0.75;
            BOOL v622 = v620 < v618 * 0.75;
            objc_msgSend_bounds(v952, v623, v624, v625, v626, v627);
            double v629 = v628;
            objc_msgSend_bounds(v932, v630, v631, v632, v633, v634);
            if (v516)
            {
              BOOL v641 = vabdd_f64(v629, v640) < v607 * 0.75;
              BOOL v622 = v620 < v621 && v641;
            }
            v642 = objc_msgSend_changeableTextMathScriptClassifications(CHScriptClassificationRawResult, v635, v636, v637, v638, v639);
            int v643 = sub_1C4BD6858(v936, v642, v932, v261);

            if (v610) {
              int v333 = v622 & v643 | v929;
            }
            else {
              int v333 = 0;
            }
            int v334 = v610 & (v622 | v929);
            int v332 = v334 & HIDWORD(v929);
          }
        }
LABEL_63:

        if (v334)
        {
          if (v332)
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v335 = (id)qword_1EA3C9FF0;
            if (os_log_type_enabled(v335, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v335, OS_LOG_TYPE_DEBUG, "Converting neighbor math group to text group classification", buf, 2u);
            }

            v341 = objc_msgSend_strategyIdentifier(v954, v336, v337, v338, v339, v340);
            uint64_t v347 = objc_msgSend_classification(v954, v342, v343, v344, v345, v346);
            v351 = objc_msgSend_strokeGroupWithUpdatedStrategyIdentifier_classification_(v952, v348, (uint64_t)v341, v347, v349, v350);
            v352 = NSNumber;
            uint64_t v358 = objc_msgSend_uniqueIdentifier(v952, v353, v354, v355, v356, v357);
            uint64_t v363 = objc_msgSend_numberWithInteger_(v352, v359, v358, v360, v361, v362);
            objc_msgSend_setObject_forKeyedSubscript_(v946, v364, (uint64_t)v351, (uint64_t)v363, v365, v366);

            long long v971 = 0u;
            long long v972 = 0u;
            long long v969 = 0u;
            long long v970 = 0u;
            objc_msgSend_strokeIdentifiers(v952, v367, v368, v369, v370, v371);
            id v957 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v379 = objc_msgSend_countByEnumeratingWithState_objects_count_(v957, v372, (uint64_t)&v969, (uint64_t)v997, 16, v373);
            if (v379)
            {
              uint64_t v380 = *(void *)v970;
              do
              {
                uint64_t v381 = 0;
                v950 += v379;
                do
                {
                  if (*(void *)v970 != v380) {
                    objc_enumerationMutation(v957);
                  }
                  uint64_t v382 = *(void *)(*((void *)&v969 + 1) + 8 * v381);
                  uint64_t v383 = objc_msgSend_strokeProvider(self, v374, v375, v376, v377, v378);
                  v387 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v384, v382, (uint64_t)v383, v385, v386);

                  if (v387)
                  {
                    uint64_t v393 = objc_msgSend_classification(v954, v388, v389, v390, v391, v392);
                    sub_1C4BD01C8((uint64_t)v959, v387, v393);
                  }
                  else
                  {
                    if (qword_1EA3CA000 != -1) {
                      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                    }
                    uint64_t v394 = (id)qword_1EA3C9FF0;
                    if (os_log_type_enabled(v394, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v400 = objc_msgSend_strokeProvider(self, v395, v396, v397, v398, v399);
                      uint64_t v406 = objc_msgSend_strokeProviderVersion(v400, v401, v402, v403, v404, v405);
                      uint64_t v412 = objc_msgSend_strokeProvider(self, v407, v408, v409, v410, v411);
                      double v418 = objc_msgSend_orderedStrokes(v412, v413, v414, v415, v416, v417);
                      uint64_t v424 = objc_msgSend_count(v418, v419, v420, v421, v422, v423);
                      *(_DWORD *)buf = 138412802;
                      uint64_t v1003 = v382;
                      __int16 v1004 = 2112;
                      uint64_t v1005 = (uint64_t)v406;
                      __int16 v1006 = 2048;
                      uint64_t v1007 = v424;
                      _os_log_impl(&dword_1C492D000, v394, OS_LOG_TYPE_ERROR, "Invalid stroke with identifier %@ for stroke provider: versiouint64_t n = %@, number of strokes = %ld", buf, 0x20u);
                    }
                  }

                  ++v381;
                }
                while (v379 != v381);
                uint64_t v379 = objc_msgSend_countByEnumeratingWithState_objects_count_(v957, v374, (uint64_t)&v969, (uint64_t)v997, 16, v378);
              }
              while (v379);
            }
          }
          else
          {
            double v425 = v954;
            if (!v333) {
              goto LABEL_105;
            }
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            double v426 = (id)qword_1EA3C9FF0;
            if (os_log_type_enabled(v426, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v426, OS_LOG_TYPE_DEBUG, "Converting neighbor text group to math group classification", buf, 2u);
            }

            uint64_t v432 = objc_msgSend_strategyIdentifier(v952, v427, v428, v429, v430, v431);
            uint64_t v438 = objc_msgSend_classification(v952, v433, v434, v435, v436, v437);
            v442 = objc_msgSend_strokeGroupWithUpdatedStrategyIdentifier_classification_(v954, v439, (uint64_t)v432, v438, v440, v441);
            uint64_t v443 = NSNumber;
            uint64_t v449 = objc_msgSend_uniqueIdentifier(v954, v444, v445, v446, v447, v448);
            uint64_t v454 = objc_msgSend_numberWithInteger_(v443, v450, v449, v451, v452, v453);
            objc_msgSend_setObject_forKeyedSubscript_(v946, v455, (uint64_t)v442, (uint64_t)v454, v456, v457);

            long long v967 = 0u;
            long long v968 = 0u;
            long long v965 = 0u;
            long long v966 = 0u;
            objc_msgSend_strokeIdentifiers(v954, v458, v459, v460, v461, v462);
            id v957 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v470 = objc_msgSend_countByEnumeratingWithState_objects_count_(v957, v463, (uint64_t)&v965, (uint64_t)v996, 16, v464);
            if (v470)
            {
              uint64_t v471 = *(void *)v966;
              do
              {
                uint64_t v472 = 0;
                v950 += v470;
                do
                {
                  if (*(void *)v966 != v471) {
                    objc_enumerationMutation(v957);
                  }
                  uint64_t v473 = *(void *)(*((void *)&v965 + 1) + 8 * v472);
                  v474 = objc_msgSend_strokeProvider(self, v465, v466, v467, v468, v469);
                  uint64_t v478 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v475, v473, (uint64_t)v474, v476, v477);

                  if (v478)
                  {
                    uint64_t v484 = objc_msgSend_classification(v952, v479, v480, v481, v482, v483);
                    sub_1C4BD01C8((uint64_t)v959, v478, v484);
                  }
                  else
                  {
                    if (qword_1EA3CA000 != -1) {
                      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                    }
                    v485 = (id)qword_1EA3C9FF0;
                    if (os_log_type_enabled(v485, OS_LOG_TYPE_ERROR))
                    {
                      v491 = objc_msgSend_strokeProvider(self, v486, v487, v488, v489, v490);
                      v497 = objc_msgSend_strokeProviderVersion(v491, v492, v493, v494, v495, v496);
                      uint64_t v503 = objc_msgSend_strokeProvider(self, v498, v499, v500, v501, v502);
                      id v509 = objc_msgSend_orderedStrokes(v503, v504, v505, v506, v507, v508);
                      uint64_t v515 = objc_msgSend_count(v509, v510, v511, v512, v513, v514);
                      *(_DWORD *)buf = 138412802;
                      uint64_t v1003 = v473;
                      __int16 v1004 = 2112;
                      uint64_t v1005 = (uint64_t)v497;
                      __int16 v1006 = 2048;
                      uint64_t v1007 = v515;
                      _os_log_impl(&dword_1C492D000, v485, OS_LOG_TYPE_ERROR, "Invalid stroke with identifier %@ for stroke provider: versiouint64_t n = %@, number of strokes = %ld", buf, 0x20u);
                    }
                  }

                  ++v472;
                }
                while (v470 != v472);
                uint64_t v470 = objc_msgSend_countByEnumeratingWithState_objects_count_(v957, v465, (uint64_t)&v965, (uint64_t)v996, 16, v469);
              }
              while (v470);
            }
          }
        }
        double v425 = v954;
LABEL_105:

        ++v947;
      }
      while (v947 != v938);
      uint64_t v644 = objc_msgSend_countByEnumeratingWithState_objects_count_(v934, v155, (uint64_t)&v973, (uint64_t)v998, 16, v159);
      uint64_t v938 = v644;
      if (!v644)
      {
LABEL_126:

        if (++v927 == v924)
        {
          uint64_t v924 = objc_msgSend_countByEnumeratingWithState_objects_count_(v926, v119, (uint64_t)&v977, (uint64_t)v999, 16, v123);
          if (!v924)
          {
LABEL_130:

            goto LABEL_131;
          }
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
  }

  v915 = v926;
LABEL_194:

LABEL_195:
  return v959;
}

+ (id)nonTextCandidateForStroke:(id)a3 withSubstrokes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_msgSend_bounds(v5, v7, v8, v9, v10, v11);
  double v13 = v12;
  objc_msgSend_bounds(v5, v14, v15, v16, v17, v18);
  double v20 = v19;
  objc_msgSend_bounds(v5, v21, v22, v23, v24, v25);
  double v27 = v26;
  objc_msgSend_bounds(v5, v28, v29, v30, v31, v32);
  if (sqrt(v27 * v33 + v13 * v20) <= 63.0)
  {
    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v64 = 0;
    uint64_t v65 = &v64;
    uint64_t v66 = 0x4812000000;
    uint64_t v67 = sub_1C4BD6FFC;
    uint64_t v68 = sub_1C4BD7020;
    uint64_t v69 = &unk_1C4CB5C62;
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    __p = 0;
    uint64_t v34 = objc_opt_class();
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = sub_1C4BD7038;
    v63[3] = &unk_1E64E18B8;
    v63[4] = &v64;
    objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v34, v35, (uint64_t)v5, 0, 1, (uint64_t)v63);
    double v62 = 0.0;
    uint64_t v36 = objc_opt_class();
    objc_msgSend_lineOrientationForStrokePoints_error_(v36, v37, (uint64_t)(v65 + 6), (uint64_t)&v62, v38, v39);
    double v41 = v40;
    if (v62 >= 1.0)
    {
      char v46 = objc_opt_class();
      uint64_t v47 = v65;
      objc_msgSend_bounds(v5, v48, v49, v50, v51, v52);
      objc_msgSend_containerSupportForPoints_withBounds_(v46, v53, (uint64_t)(v47 + 6), v54, v55, v56);
      double v58 = v57;
      uint64_t v59 = [CHMutableNonTextCandidateStroke alloc];
      uint64_t v44 = objc_msgSend_initWithStroke_consistingOfSubstrokes_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_(v59, v60, (uint64_t)v5, (uint64_t)v6, 7, 1, 0.0, 0.0, v58);
    }
    else
    {
      uint64_t v42 = [CHMutableNonTextCandidateStroke alloc];
      uint64_t v44 = objc_msgSend_initWithStroke_consistingOfSubstrokes_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_(v42, v43, (uint64_t)v5, (uint64_t)v6, 6, 1, v41, v62, 0.0);
    }
    uint64_t v45 = (void *)v44;
    _Block_object_dispose(&v64, 8);
    if (__p)
    {
      uint64_t v71 = __p;
      operator delete(__p);
    }
  }

  return v45;
}

+ (double)containerSupportForPoints:(const void *)a3 withBounds:(CGRect)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  __int32 v54 = 0;
  memset(v53, 0, sizeof(v53));
  uint64_t v4 = *((void *)a3 + 1) - *(void *)a3;
  if (v4)
  {
    unint64_t v5 = v4 >> 4;
    if (v5 <= 1) {
      unint64_t v5 = 1;
    }
    id v6 = (double *)(*(void *)a3 + 8);
    while (1)
    {
      uint64_t v7 = (uint64_t)fmin((*(v6 - 1) - a4.origin.x) / a4.size.width * 10.0, 9.0)
         + 10 * (uint64_t)fmin((*v6 - a4.origin.y) / a4.size.height * 10.0, 9.0);
      if (v7 < 0) {
        break;
      }
      *((unsigned char *)v53 + v7) = 1;
      v6 += 2;
      if (!--v5) {
        goto LABEL_13;
      }
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v8 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v51 = 134217984;
      uint64_t v52 = v7;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_ERROR, "Index %ld out of bounds in normalized image for container support calculation.", (uint8_t *)&v51, 0xCu);
    }
  }
LABEL_13:
  uint64_t v9 = 0;
  double v10 = 0.0;
  uint64_t v11 = (float64x2_t *)&xmmword_1C4C44930;
  v12.i32[1] = 255;
  do
  {
    int8x16_t v13 = (int8x16_t)v53[v9];
    v14.i32[0] = v13.u8[0];
    v14.i32[1] = v13.u8[1];
    int8x8_t v15 = vand_s8(v14, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v15.u32[0];
    v16.i64[1] = v15.u32[1];
    v17.i32[0] = v13.u8[2];
    float64x2_t v18 = vcvtq_f64_u64(v16);
    v17.i32[1] = v13.u8[3];
    int8x8_t v19 = vand_s8(v17, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v19.u32[0];
    v16.i64[1] = v19.u32[1];
    v20.i32[0] = v13.u8[4];
    v20.i32[1] = v13.u8[5];
    float64x2_t v21 = vcvtq_f64_u64(v16);
    int8x8_t v22 = vand_s8(v20, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v22.u32[0];
    v16.i64[1] = v22.u32[1];
    float64x2_t v23 = vcvtq_f64_u64(v16);
    v24.i32[0] = v13.u8[6];
    v24.i32[1] = v13.u8[7];
    int8x8_t v25 = vand_s8(v24, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v25.u32[0];
    v16.i64[1] = v25.u32[1];
    float64x2_t v26 = vcvtq_f64_u64(v16);
    v13.i64[0] = vextq_s8(v13, v13, 8uLL).u64[0];
    v27.i32[0] = v13.u8[0];
    v27.i32[1] = v13.u8[1];
    int8x8_t v28 = vand_s8(v27, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v28.u32[0];
    v16.i64[1] = v28.u32[1];
    float64x2_t v29 = vcvtq_f64_u64(v16);
    v30.i32[0] = v13.u8[2];
    v30.i32[1] = v13.u8[3];
    int8x8_t v31 = vand_s8(v30, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v31.u32[0];
    v16.i64[1] = v31.u32[1];
    float64x2_t v32 = vcvtq_f64_u64(v16);
    v33.i32[0] = v13.u8[4];
    v33.i32[1] = v13.u8[5];
    int8x8_t v34 = vand_s8(v33, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v34.u32[0];
    v16.i64[1] = v34.u32[1];
    float64x2_t v35 = vcvtq_f64_u64(v16);
    v36.i32[0] = v13.u8[6];
    v36.i32[1] = v13.u8[7];
    *(int8x8_t *)v13.i8 = vand_s8(v36, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v13.u32[0];
    v16.i64[1] = v13.u32[1];
    float64x2_t v37 = vmulq_f64(v11[7], vcvtq_f64_u64(v16));
    float64x2_t v38 = vmulq_f64(v11[6], v35);
    float64x2_t v39 = vmulq_f64(v11[5], v32);
    float64x2_t v40 = vmulq_f64(v11[4], v29);
    float64x2_t v41 = vmulq_f64(v11[3], v26);
    float64x2_t v42 = vmulq_f64(v11[2], v23);
    float64x2_t v43 = vmulq_f64(v11[1], v21);
    float64x2_t v44 = vmulq_f64(*v11, v18);
    double v10 = v10
        + v44.f64[0]
        + v44.f64[1]
        + v43.f64[0]
        + v43.f64[1]
        + v42.f64[0]
        + v42.f64[1]
        + v41.f64[0]
        + v41.f64[1]
        + v40.f64[0]
        + v40.f64[1]
        + v39.f64[0]
        + v39.f64[1]
        + v38.f64[0]
        + v38.f64[1]
        + v37.f64[0]
        + v37.f64[1];
    ++v9;
    v11 += 8;
  }
  while (v9 != 6);
  v12.i32[0] = v54;
  int8x16_t v45 = (int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v12));
  int8x8_t v46 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL), (int8x8_t)0xFF000000FFLL);
  v47.i64[0] = v46.u32[0];
  v47.i64[1] = v46.u32[1];
  float64x2_t v48 = vcvtq_f64_u64(v47);
  *(int8x8_t *)v45.i8 = vand_s8(*(int8x8_t *)v45.i8, (int8x8_t)0xFF000000FFLL);
  v47.i64[0] = v45.u32[0];
  v47.i64[1] = v45.u32[1];
  float64x2_t v49 = vcvtq_f64_u64(v47);
  return v10 + v49.f64[0] + v49.f64[1] + v48.f64[0] + v48.f64[1];
}

+ (int64_t)fallbackTextScriptClassificationForMathGroup:(id)a3 strokeClassificationResult:(id)a4 fromTopNCandidate:(int64_t)a5
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v150 = a4;
  uint64_t v147 = v7;
  int8x16_t v13 = objc_msgSend_strokeIdentifiers(v7, v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_count(v13, v14, v15, v16, v17, v18);

  int64_t v25 = 7;
  if (v150 && v19)
  {
    uint64_t v149 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22, v23, v24);
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    objc_msgSend_strokeIdentifiers(v7, v26, v27, v28, v29, v30);
    obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v164, (uint64_t)v168, 16, v32);
    if (v38)
    {
      uint64_t v39 = *(void *)v165;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v165 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = *(void *)(*((void *)&v164 + 1) + 8 * i);
          float64x2_t v42 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v150, v33, v34, v35, v36, v37);
          uint64x2_t v47 = objc_msgSend_objectForKey_(v42, v43, v41, v44, v45, v46);

          unint64_t v53 = 0;
          while (1)
          {
            __int32 v54 = objc_msgSend_orderedScriptClassification(v47, v48, v49, v50, v51, v52);
            if (objc_msgSend_count(v54, v55, v56, v57, v58, v59) <= (unint64_t)a5)
            {
              uint64_t v70 = objc_msgSend_orderedScriptClassification(v47, v60, v61, v62, v63, v64);
              BOOL v65 = v53 < objc_msgSend_count(v70, v71, v72, v73, v74, v75);
            }
            else
            {
              BOOL v65 = v53 < a5;
            }

            if (!v65) {
              break;
            }
            uint64_t v76 = objc_msgSend_scriptClassificationAtIndex_(v47, v66, v53, v67, v68, v69);
            uint64_t v82 = objc_msgSend_integerValue(v76, v77, v78, v79, v80, v81);

            char isScriptClassificationMath = objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v83, v82, v84, v85, v86);
            if (v82 == 8) {
              char v88 = 1;
            }
            else {
              char v88 = isScriptClassificationMath;
            }
            ++v53;
            if ((v88 & 1) == 0)
            {
              uint64_t v89 = objc_msgSend_numberWithInteger_(NSNumber, v48, v82, v50, v51, v52);
              uint64_t v94 = objc_msgSend_objectForKeyedSubscript_(v149, v90, (uint64_t)v89, v91, v92, v93);

              uint64_t v100 = NSNumber;
              if (v94)
              {
                int v101 = objc_msgSend_intValue(v94, v95, v96, v97, v98, v99);
                uint64_t v106 = objc_msgSend_numberWithInt_(v100, v102, (v101 + 1), v103, v104, v105);
                uint64_t v111 = objc_msgSend_numberWithInteger_(NSNumber, v107, v82, v108, v109, v110);
                objc_msgSend_setObject_forKeyedSubscript_(v149, v112, (uint64_t)v106, (uint64_t)v111, v113, v114);
              }
              else
              {
                uint64_t v106 = objc_msgSend_numberWithInteger_(NSNumber, v95, v82, v97, v98, v99);
                objc_msgSend_setObject_forKeyedSubscript_(v149, v115, (uint64_t)&unk_1F203F138, (uint64_t)v106, v116, v117);
              }

              break;
            }
          }
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v164, (uint64_t)v168, 16, v37);
      }
      while (v38);
    }

    uint64_t v158 = 0;
    uint64_t v159 = &v158;
    uint64_t v160 = 0x3032000000;
    uint64_t v161 = sub_1C4BD7A14;
    uint64_t v162 = sub_1C4BD7A24;
    id v163 = 0;
    uint64_t v152 = 0;
    uint64_t v153 = &v152;
    uint64_t v154 = 0x3032000000;
    uint64_t v155 = sub_1C4BD7A14;
    uint64_t v156 = sub_1C4BD7A24;
    id v157 = &unk_1F203F150;
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = sub_1C4BD7A2C;
    v151[3] = &unk_1E64E4E50;
    v151[4] = &v152;
    v151[5] = &v158;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v149, v118, (uint64_t)v151, v119, v120, v121);
    if (v159[5]
      && (objc_msgSend_floatValue((void *)v153[5], v122, v123, v124, v125, v126),
          float v128 = v127,
          objc_msgSend_strokeIdentifiers(v147, v129, v130, v131, v132, v133),
          uint64_t v134 = objc_claimAutoreleasedReturnValue(),
          BOOL v140 = (float)(v128 / (float)(unint64_t)objc_msgSend_count(v134, v135, v136, v137, v138, v139)) > 0.6,
          v134,
          v140))
    {
      int64_t v25 = objc_msgSend_integerValue((void *)v159[5], v141, v142, v143, v144, v145);
    }
    else
    {
      int64_t v25 = 7;
    }
    _Block_object_dispose(&v152, 8);

    _Block_object_dispose(&v158, 8);
  }

  return v25;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (int64_t)forcedStrokeClass
{
  return self->_forcedStrokeClass;
}

- (void).cxx_destruct
{
}

@end