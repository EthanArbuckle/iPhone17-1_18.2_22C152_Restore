@interface CHStrokeGroupingStrategy
- (CHStrokeGroupingStrategy)initWithStrokeProvider:(id)a3;
- (CHStrokeProvider)strokeProvider;
- (NSString)strategyIdentifier;
- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8;
- (id)strokeGroupFromGroup:(id)a3 addingStrokes:(id)a4;
- (id)strokeGroupFromStrokes:(id)a3 ancestorIdentifier:(int64_t)a4;
- (id)strokeGroupMergingGroup:(id)a3 withGroup:(id)a4;
- (id)strokesForIdentifiers:(id)a3;
- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8;
- (void)firstStrokeIdentifier:(id *)a3 lastStrokeIdentifier:(id *)a4 inGroup:(id)a5 addingStrokeIdentifiers:(id)a6 removingStrokeIdentifiers:(id)a7;
@end

@implementation CHStrokeGroupingStrategy

- (CHStrokeGroupingStrategy)initWithStrokeProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHStrokeGroupingStrategy;
  v6 = [(CHStrokeGroupingStrategy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_strokeProvider, a3);
  }

  return v7;
}

- (NSString)strategyIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)strokesForIdentifiers:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v11 = v4;
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v65, (uint64_t)v73, 16, v13);
  if (v64)
  {
    uint64_t v20 = *(void *)v66;
    v21 = &qword_1EA3CA000;
    *(void *)&long long v19 = 138412546;
    long long v61 = v19;
    id v62 = v11;
    uint64_t v63 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        while (1)
        {
          if (*(void *)v66 != v20) {
            objc_enumerationMutation(v11);
          }
          uint64_t v23 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          v24 = objc_msgSend_strokeProvider(self, v14, v15, v16, v17, v18, v61);
          v29 = objc_msgSend_strokeIdentifierFromData_(v24, v25, v23, v26, v27, v28);

          v35 = objc_msgSend_strokeProvider(self, v30, v31, v32, v33, v34);
          v40 = objc_msgSend_strokeForIdentifier_(v35, v36, (uint64_t)v29, v37, v38, v39);

          if (!v40) {
            break;
          }
          objc_msgSend_addObject_(v10, v41, (uint64_t)v40, v42, v43, v44);

          if (v64 == ++i) {
            goto LABEL_3;
          }
        }
        if (*v21 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v45 = (id)qword_1EA3C9FA8;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_strokeProvider(self, v46, v47, v48, v49, v50);
          v52 = v51 = v10;
          objc_msgSend_strokeProviderVersion(v52, v53, v54, v55, v56, v57);
          v59 = v58 = v21;
          *(_DWORD *)buf = v61;
          uint64_t v70 = v23;
          __int16 v71 = 2112;
          v72 = v59;
          _os_log_impl(&dword_1C492D000, v45, OS_LOG_TYPE_DEFAULT, "Failed to get stroke with id: %@ from stroke provider version %@", buf, 0x16u);

          v21 = v58;
          v10 = v51;
          id v11 = v62;
          uint64_t v20 = v63;
        }
      }
LABEL_3:
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v65, (uint64_t)v73, 16, v18);
    }
    while (v64);
  }

  return v10;
}

- (void)firstStrokeIdentifier:(id *)a3 lastStrokeIdentifier:(id *)a4 inGroup:(id)a5 addingStrokeIdentifiers:(id)a6 removingStrokeIdentifiers:(id)a7
{
  v204 = a3;
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v18 = objc_msgSend_firstStrokeIdentifier(v10, v13, v14, v15, v16, v17);
  v24 = objc_msgSend_strokeProvider(self, v19, v20, v21, v22, v23);
  v212 = objc_msgSend_strokeIdentifierFromData_(v24, v25, (uint64_t)v18, v26, v27, v28);

  uint64_t v34 = objc_msgSend_lastStrokeIdentifier(v10, v29, v30, v31, v32, v33);
  v40 = objc_msgSend_strokeProvider(self, v35, v36, v37, v38, v39);
  v211 = objc_msgSend_strokeIdentifierFromData_(v40, v41, (uint64_t)v34, v42, v43, v44);

  v206 = v12;
  v207 = v10;
  if (!v12 || !objc_msgSend_count(v12, v45, v46, v47, v48, v49)) {
    goto LABEL_28;
  }
  uint64_t v55 = objc_msgSend_strokeIdentifiers(v10, v50, v51, v52, v53, v54);
  long long v61 = objc_msgSend_mutableCopy(v55, v56, v57, v58, v59, v60);

  obuint64_t j = v61;
  objc_msgSend_minusSet_(v61, v62, (uint64_t)v12, v63, v64, v65);
  if (objc_msgSend_containsObject_(v12, v66, (uint64_t)v18, v67, v68, v69))
  {

    uint64_t v18 = 0;
    if (!objc_msgSend_containsObject_(v12, v74, (uint64_t)v34, v75, v76, v77)) {
      goto LABEL_5;
    }
LABEL_27:

    uint64_t v34 = 0;
    if (v61) {
      goto LABEL_6;
    }
LABEL_28:
    obuint64_t j = 0;
    goto LABEL_29;
  }
  if (objc_msgSend_containsObject_(v12, v70, (uint64_t)v34, v71, v72, v73)) {
    goto LABEL_27;
  }
LABEL_5:
  if (!v61) {
    goto LABEL_28;
  }
LABEL_6:
  if (!v18 || !v34)
  {
    id v209 = v11;
    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    obuint64_t j = v61;
    uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v217, (uint64_t)v222, 16, v79);
    if (v80)
    {
      uint64_t v86 = v80;
      uint64_t v87 = *(void *)v218;
      if (v18)
      {
        if (v34)
        {
          do
          {
            for (uint64_t i = 0; i != v86; ++i)
            {
              if (*(void *)v218 != v87) {
                objc_enumerationMutation(obj);
              }
              uint64_t v89 = *(void *)(*((void *)&v217 + 1) + 8 * i);
              v90 = objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v95 = objc_msgSend_strokeIdentifierFromData_(v90, v91, v89, v92, v93, v94);
            }
            uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
        else
        {
          do
          {
            for (uint64_t j = 0; j != v86; ++j)
            {
              if (*(void *)v218 != v87) {
                objc_enumerationMutation(obj);
              }
              v98 = *(void **)(*((void *)&v217 + 1) + 8 * j);
              v99 = objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v104 = objc_msgSend_strokeIdentifierFromData_(v99, v100, (uint64_t)v98, v101, v102, v103);

              if (!v34
                || (objc_msgSend_strokeProvider(self, v105, v106, v107, v108, v109),
                    v110 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v114 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v110, v111, (uint64_t)v104, (uint64_t)v211, v112, v113), v110, v114 == 1))
              {
                id v97 = v98;

                uint64_t v34 = v97;
              }
            }
            uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
      }
      else
      {
        uint64_t v18 = 0;
        if (v34)
        {
          do
          {
            for (uint64_t k = 0; k != v86; ++k)
            {
              if (*(void *)v218 != v87) {
                objc_enumerationMutation(obj);
              }
              v157 = *(void **)(*((void *)&v217 + 1) + 8 * k);
              v158 = objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v163 = objc_msgSend_strokeIdentifierFromData_(v158, v159, (uint64_t)v157, v160, v161, v162);

              if (!v18
                || (objc_msgSend_strokeProvider(self, v164, v165, v166, v167, v168),
                    v169 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v173 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v169, v170, (uint64_t)v163, (uint64_t)v212, v171, v172), v169, v173 == -1))
              {
                id v156 = v157;

                uint64_t v18 = v156;
              }
            }
            uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
        else
        {
          do
          {
            for (uint64_t m = 0; m != v86; ++m)
            {
              if (*(void *)v218 != v87) {
                objc_enumerationMutation(obj);
              }
              v176 = *(void **)(*((void *)&v217 + 1) + 8 * m);
              v177 = objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v182 = objc_msgSend_strokeIdentifierFromData_(v177, v178, (uint64_t)v176, v179, v180, v181);

              if (!v18
                || (objc_msgSend_strokeProvider(self, v183, v184, v185, v186, v187),
                    v188 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v192 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v188, v189, (uint64_t)v182, (uint64_t)v212, v190, v191), v188, v192 == -1))
              {
                id v198 = v176;

                uint64_t v18 = v198;
              }
              if (!v34
                || (objc_msgSend_strokeProvider(self, v193, v194, v195, v196, v197),
                    v199 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v203 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v199, v200, (uint64_t)v182, (uint64_t)v211, v201, v202), v199, v203 == 1))
              {
                id v175 = v176;

                uint64_t v34 = v175;
              }
            }
            uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
      }
    }

    id v11 = v209;
  }
LABEL_29:
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  id v210 = v11;
  uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v210, v115, (uint64_t)&v213, (uint64_t)v221, 16, v116);
  if (v117)
  {
    uint64_t v123 = v117;
    uint64_t v124 = *(void *)v214;
    do
    {
      for (uint64_t n = 0; n != v123; ++n)
      {
        if (*(void *)v214 != v124) {
          objc_enumerationMutation(v210);
        }
        v127 = *(void **)(*((void *)&v213 + 1) + 8 * n);
        v128 = objc_msgSend_strokeProvider(self, v118, v119, v120, v121, v122, v204);
        v133 = objc_msgSend_strokeIdentifierFromData_(v128, v129, (uint64_t)v127, v130, v131, v132);

        if (!v18
          || (objc_msgSend_strokeProvider(self, v134, v135, v136, v137, v138),
              v139 = objc_claimAutoreleasedReturnValue(),
              uint64_t v143 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v139, v140, (uint64_t)v133, (uint64_t)v212, v141, v142), v139, v143 == -1))
        {
          id v149 = v127;

          uint64_t v18 = v149;
        }
        if (!v34
          || (objc_msgSend_strokeProvider(self, v144, v145, v146, v147, v148),
              v150 = objc_claimAutoreleasedReturnValue(),
              uint64_t v154 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v150, v151, (uint64_t)v133, (uint64_t)v211, v152, v153), v150, v154 == 1))
        {
          id v126 = v127;

          uint64_t v34 = v126;
        }
      }
      uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v210, v118, (uint64_t)&v213, (uint64_t)v221, 16, v122);
    }
    while (v123);
  }

  if (v204) {
    id *v204 = v18;
  }
  if (a4) {
    *a4 = v34;
  }
}

- (id)strokeGroupFromStrokes:(id)a3 ancestorIdentifier:(int64_t)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v13 = objc_msgSend_count(v6, v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_setWithCapacity_(v7, v14, v13, v15, v16, v17);
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v23 = v6;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v97, (uint64_t)v101, 16, v25);
  if (v26)
  {
    uint64_t v32 = v26;
    uint64_t v33 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v98 != v33) {
          objc_enumerationMutation(v23);
        }
        v35 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        uint64_t v36 = objc_msgSend_encodedStrokeIdentifier(v35, v27, v28, v29, v30, v31, (void)v97);
        objc_msgSend_addObject_(v18, v37, (uint64_t)v36, v38, v39, v40);

        objc_msgSend_bounds(v35, v41, v42, v43, v44, v45);
        v106.origin.double x = v46;
        v106.origin.double y = v47;
        v106.size.double width = v48;
        v106.size.double height = v49;
        v104.origin.double x = x;
        v104.origin.double y = y;
        v104.size.double width = width;
        v104.size.double height = height;
        CGRect v105 = CGRectUnion(v104, v106);
        double x = v105.origin.x;
        double y = v105.origin.y;
        double width = v105.size.width;
        double height = v105.size.height;
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v27, (uint64_t)&v97, (uint64_t)v101, 16, v31);
    }
    while (v32);
  }

  id v50 = objc_alloc((Class)objc_opt_class());
  uint64_t v56 = objc_msgSend_firstObject(v23, v51, v52, v53, v54, v55);
  id v62 = objc_msgSend_strokeIdentifier(v56, v57, v58, v59, v60, v61);
  uint64_t v68 = objc_msgSend_lastObject(v23, v63, v64, v65, v66, v67);
  uint64_t v74 = objc_msgSend_strokeIdentifier(v68, v69, v70, v71, v72, v73);
  uint64_t v80 = objc_msgSend_strategyIdentifier(self, v75, v76, v77, v78, v79);
  uint64_t v86 = objc_msgSend_firstObject(v23, v81, v82, v83, v84, v85);
  objc_msgSend_bounds(v86, v87, v88, v89, v90, v91);
  StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigiuint64_t n = objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v50, v92, a4, (uint64_t)v18, (uint64_t)v62, (uint64_t)v74, 1, v80, x, y, width, height, 1.0, v93, v94);

  return StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
}

- (id)strokeGroupFromGroup:(id)a3 addingStrokes:(id)a4
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v14 = objc_msgSend_count(v7, v9, v10, v11, v12, v13);
  long long v19 = objc_msgSend_setWithCapacity_(v8, v15, v14, v16, v17, v18);
  objc_msgSend_bounds(v6, v20, v21, v22, v23, v24);
  double x = v25;
  double y = v27;
  double width = v29;
  double height = v31;
  objc_msgSend_firstStrokeOrigin(v6, v33, v34, v35, v36, v37);
  double v143 = v39;
  double v144 = v38;
  objc_msgSend_firstStrokeOrigin(v6, v40, v41, v42, v43, v44);
  double v46 = v45;
  objc_msgSend_firstStrokeOrigin(v6, v47, v48, v49, v50, v51);
  double v53 = v52;
  objc_msgSend_firstStrokeOrigin(v6, v54, v55, v56, v57, v58);
  double v60 = v59;
  objc_msgSend_firstStrokeOrigin(v6, v61, v62, v63, v64, v65);
  double v67 = v66;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v68 = v7;
  uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v147, (uint64_t)v151, 16, v70);
  if (v71)
  {
    uint64_t v77 = v71;
    double v78 = v60 * v67 + v46 * v53;
    uint64_t v79 = *(void *)v148;
    do
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v148 != v79) {
          objc_enumerationMutation(v68);
        }
        v81 = *(void **)(*((void *)&v147 + 1) + 8 * i);
        uint64_t v82 = objc_msgSend_encodedStrokeIdentifier(v81, v72, v73, v74, v75, v76, *(void *)&v143, *(void *)&v144);
        objc_msgSend_addObject_(v19, v83, (uint64_t)v82, v84, v85, v86);

        objc_msgSend_bounds(v81, v87, v88, v89, v90, v91);
        v156.origin.double x = v92;
        v156.origin.double y = v93;
        v156.size.double width = v94;
        v156.size.double height = v95;
        v154.origin.double x = x;
        v154.origin.double y = y;
        v154.size.double width = width;
        v154.size.double height = height;
        CGRect v155 = CGRectUnion(v154, v156);
        double x = v155.origin.x;
        double y = v155.origin.y;
        double width = v155.size.width;
        double height = v155.size.height;
        objc_msgSend_bounds(v81, v96, v97, v98, v99, v100);
        double v102 = v101;
        objc_msgSend_bounds(v81, v103, v104, v105, v106, v107);
        double v109 = v108;
        objc_msgSend_bounds(v81, v110, v111, v112, v113, v114);
        double v116 = v115;
        objc_msgSend_bounds(v81, v117, v118, v119, v120, v121);
        if (v116 * v122 + v102 * v109 < v78)
        {
          objc_msgSend_bounds(v81, v72, v73, v74, v75, v76);
          double v143 = v124;
          double v144 = v123;
        }
      }
      uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v72, (uint64_t)&v147, (uint64_t)v151, 16, v76);
    }
    while (v77);
  }

  id v145 = 0;
  id v146 = 0;
  objc_msgSend_firstStrokeIdentifier_lastStrokeIdentifier_inGroup_addingStrokeIdentifiers_removingStrokeIdentifiers_(self, v125, (uint64_t)&v146, (uint64_t)&v145, (uint64_t)v6, (uint64_t)v19, 0);
  id v126 = v146;
  id v127 = v145;
  uint64_t v133 = objc_msgSend_classification(v6, v128, v129, v130, v131, v132);
  objc_msgSend_groupingConfidence(v6, v134, v135, v136, v137, v138);
  uint64_t v141 = objc_msgSend_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_firstStrokeOrigin_(v6, v139, (uint64_t)v19, 0, (uint64_t)v126, (uint64_t)v127, v133, x, y, width, height, v140, v144, v143);

  return v141;
}

- (id)strokeGroupMergingGroup:(id)a3 withGroup:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  uint64_t v13 = objc_msgSend_strokeIdentifiers(a4, v8, v9, v10, v11, v12);
  long long v19 = objc_msgSend_allObjects(v13, v14, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_strokesForIdentifiers_(self, v20, (uint64_t)v19, v21, v22, v23);
  double v29 = objc_msgSend_setWithArray_(v6, v25, (uint64_t)v24, v26, v27, v28);

  uint64_t v33 = objc_msgSend_strokeGroupFromGroup_addingStrokes_(self, v30, (uint64_t)v7, (uint64_t)v29, v31, v32);

  return v33;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (void).cxx_destruct
{
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  uint64_t v8 = [CHStrokeGroupingResult alloc];
  uint64_t v14 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v9, v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v8, v15, (uint64_t)v14, 0, 0, v16);

  return v17;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  uint64_t v11 = objc_alloc_init(CHDrawing);
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 1.0;
  }
  if (a8) {
    *a8 = 0;
  }
  return v11;
}

@end