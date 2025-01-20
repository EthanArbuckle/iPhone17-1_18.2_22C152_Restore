@interface CHMutableStrokeClassificationResult
- (CHMutableStrokeClassificationResult)init;
- (CHMutableStrokeClassificationResult)initWithStrokeClassificationsByStrokeIdentifier:(id)a3 scriptClassificationsByStrokeIdentifier:(id)a4 scriptClassificationRawResultsByStrokeIdentifier:(id)a5 substrokesByStrokeIdentifier:(id)a6 nontextCandidates:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nontextCandidates;
- (id)scriptClassificationRawResultsByStrokeIdentifier;
- (id)scriptClassificationsByStrokeIdentifier;
- (id)strokeClassificationsByStrokeIdentifier;
- (id)substrokesByStrokeIdentifier;
- (void)updateByAddingClutterStroke:(id)a3;
- (void)updateByAddingNonClutterStroke:(id)a3 withAllStrokes:(id)a4 forceClass:(int64_t)a5;
- (void)updateByRemovingStrokeIdentifier:(id)a3 withRemovedAndClutterStrokeIDs:(id)a4;
- (void)updateByTransitionedClutterStrokeIdentifier:(id)a3 withRemovedAndClutterStrokeIDs:(id)a4;
- (void)updateNonTextCandidatesByRemovingSupportFromStrokeIdentifier:(id)a3 skippingCandidatesWithStrokeIdentifier:(id)a4;
- (void)updateNonTextCandidatesSupportFromStroke:(id)a3;
@end

@implementation CHMutableStrokeClassificationResult

- (CHMutableStrokeClassificationResult)init
{
  v14.receiver = self;
  v14.super_class = (Class)CHMutableStrokeClassificationResult;
  v2 = [(CHStrokeClassificationResult *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    strokeClassificationsByStrokeIdentifier = v2->_strokeClassificationsByStrokeIdentifier;
    v2->_strokeClassificationsByStrokeIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scriptClassificationsByStrokeIdentifier = v2->_scriptClassificationsByStrokeIdentifier;
    v2->_scriptClassificationsByStrokeIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scriptClassificationRawResultsByStrokeIdentifier = v2->_scriptClassificationRawResultsByStrokeIdentifier;
    v2->_scriptClassificationRawResultsByStrokeIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    substrokesByStrokeIdentifier = v2->_substrokesByStrokeIdentifier;
    v2->_substrokesByStrokeIdentifier = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    nontextCandidates = v2->_nontextCandidates;
    v2->_nontextCandidates = v11;
  }
  return v2;
}

- (CHMutableStrokeClassificationResult)initWithStrokeClassificationsByStrokeIdentifier:(id)a3 scriptClassificationsByStrokeIdentifier:(id)a4 scriptClassificationRawResultsByStrokeIdentifier:(id)a5 substrokesByStrokeIdentifier:(id)a6 nontextCandidates:(id)a7
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v75 = a4;
  id v76 = a5;
  id v12 = a6;
  id v13 = a7;
  v81.receiver = self;
  v81.super_class = (Class)CHMutableStrokeClassificationResult;
  v19 = [(CHStrokeClassificationResult *)&v81 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_mutableCopy(v74, v14, v15, v16, v17, v18);
    strokeClassificationsByStrokeIdentifier = v19->_strokeClassificationsByStrokeIdentifier;
    v19->_strokeClassificationsByStrokeIdentifier = (NSMutableDictionary *)v20;

    uint64_t v27 = objc_msgSend_mutableCopy(v75, v22, v23, v24, v25, v26);
    scriptClassificationsByStrokeIdentifier = v19->_scriptClassificationsByStrokeIdentifier;
    v19->_scriptClassificationsByStrokeIdentifier = (NSMutableDictionary *)v27;

    uint64_t v34 = objc_msgSend_mutableCopy(v76, v29, v30, v31, v32, v33);
    scriptClassificationRawResultsByStrokeIdentifier = v19->_scriptClassificationRawResultsByStrokeIdentifier;
    v19->_scriptClassificationRawResultsByStrokeIdentifier = (NSMutableDictionary *)v34;

    uint64_t v41 = objc_msgSend_mutableCopy(v12, v36, v37, v38, v39, v40);
    substrokesByStrokeIdentifier = v19->_substrokesByStrokeIdentifier;
    v19->_substrokesByStrokeIdentifier = (NSMutableDictionary *)v41;

    id v43 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v49 = objc_msgSend_count(v13, v44, v45, v46, v47, v48);
    uint64_t v54 = objc_msgSend_initWithCapacity_(v43, v50, v49, v51, v52, v53);
    nontextCandidates = v19->_nontextCandidates;
    v19->_nontextCandidates = (NSMutableSet *)v54;

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v56 = v13;
    uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v77, (uint64_t)v82, 16, v58);
    if (v64)
    {
      uint64_t v65 = *(void *)v78;
      do
      {
        uint64_t v66 = 0;
        do
        {
          if (*(void *)v78 != v65) {
            objc_enumerationMutation(v56);
          }
          v67 = v19->_nontextCandidates;
          v68 = objc_msgSend_mutableCopy(*(void **)(*((void *)&v77 + 1) + 8 * v66), v59, v60, v61, v62, v63);
          objc_msgSend_addObject_(v67, v69, (uint64_t)v68, v70, v71, v72);

          ++v66;
        }
        while (v64 != v66);
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v77, (uint64_t)v82, 16, v63);
      }
      while (v64);
    }
  }
  return v19;
}

- (void)updateNonTextCandidatesByRemovingSupportFromStrokeIdentifier:(id)a3 skippingCandidatesWithStrokeIdentifier:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v59 = 88;
  uint64_t v60 = self;
  v8 = self->_nontextCandidates;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v61, (uint64_t)v65, 16, v10);
  if (!v16)
  {

    id v17 = 0;
    goto LABEL_17;
  }
  id v17 = 0;
  uint64_t v18 = *(void *)v62;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v62 != v18) {
        objc_enumerationMutation(v8);
      }
      v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      v22 = objc_msgSend_strokeIdentifier(v21, v11, v12, v13, v14, v15, v59);
      int isEqual = objc_msgSend_isEqual_(v22, v23, (uint64_t)v6, v24, v25, v26);

      if (isEqual)
      {
        uint64_t v20 = v17;
        id v17 = v21;
LABEL_5:

        continue;
      }
      uint64_t v33 = objc_msgSend_strokeIdentifier(v21, v28, v29, v30, v31, v32);
      int v38 = objc_msgSend_containsObject_(v7, v34, (uint64_t)v33, v35, v36, v37);

      if ((v38 & 1) == 0
        && objc_msgSend_adjustSupportByRemovingStrokeIdentifier_(v21, v11, (uint64_t)v6, v13, v14, v15))
      {
        strokeClassificationsByStrokeIdentifier = v60->_strokeClassificationsByStrokeIdentifier;
        uint64_t v40 = NSNumber;
        uint64_t v41 = objc_msgSend_effectiveClassification(v21, v11, v12, v13, v14, v15);
        uint64_t v20 = objc_msgSend_numberWithInteger_(v40, v42, v41, v43, v44, v45);
        uint64_t v51 = objc_msgSend_strokeIdentifier(v21, v46, v47, v48, v49, v50);
        objc_msgSend_setObject_forKey_(strokeClassificationsByStrokeIdentifier, v52, (uint64_t)v20, (uint64_t)v51, v53, v54);

        goto LABEL_5;
      }
    }
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v61, (uint64_t)v65, 16, v15);
  }
  while (v16);

  if (v17) {
    objc_msgSend_removeObject_(*(void **)((char *)&v60->super.super.isa + v59), v55, (uint64_t)v17, v56, v57, v58);
  }
LABEL_17:
}

- (void)updateByRemovingStrokeIdentifier:(id)a3 withRemovedAndClutterStrokeIDs:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  objc_msgSend_removeObjectForKey_(self->_strokeClassificationsByStrokeIdentifier, v7, (uint64_t)v26, v8, v9, v10);
  objc_msgSend_removeObjectForKey_(self->_scriptClassificationsByStrokeIdentifier, v11, (uint64_t)v26, v12, v13, v14);
  objc_msgSend_removeObjectForKey_(self->_scriptClassificationRawResultsByStrokeIdentifier, v15, (uint64_t)v26, v16, v17, v18);
  objc_msgSend_removeObjectForKey_(self->_substrokesByStrokeIdentifier, v19, (uint64_t)v26, v20, v21, v22);
  objc_msgSend_updateNonTextCandidatesByRemovingSupportFromStrokeIdentifier_skippingCandidatesWithStrokeIdentifier_(self, v23, (uint64_t)v26, (uint64_t)v6, v24, v25);
}

- (void)updateByTransitionedClutterStrokeIdentifier:(id)a3 withRemovedAndClutterStrokeIDs:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  objc_msgSend_removeObjectForKey_(self->_substrokesByStrokeIdentifier, v7, (uint64_t)v17, v8, v9, v10);
  objc_msgSend_updateNonTextCandidatesByRemovingSupportFromStrokeIdentifier_skippingCandidatesWithStrokeIdentifier_(self, v11, (uint64_t)v17, (uint64_t)v6, v12, v13);
  objc_msgSend_setObject_forKey_(self->_strokeClassificationsByStrokeIdentifier, v14, (uint64_t)&unk_1F203F090, (uint64_t)v17, v15, v16);
}

- (void)updateByAddingNonClutterStroke:(id)a3 withAllStrokes:(id)a4 forceClass:(int64_t)a5
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v109 = a4;
  v111 = v8;
  uint64_t v9 = objc_opt_class();
  v110 = objc_msgSend_substrokesForStroke_(v9, v10, (uint64_t)v8, v11, v12, v13);
  substrokesByStrokeIdentifier = self->_substrokesByStrokeIdentifier;
  uint64_t v20 = objc_msgSend_encodedStrokeIdentifier(v8, v15, v16, v17, v18, v19);
  objc_msgSend_setObject_forKey_(substrokesByStrokeIdentifier, v21, (uint64_t)v110, (uint64_t)v20, v22, v23);

  uint64_t v29 = &OBJC_IVAR___CHClientStroke__endTimestamp;
  if (!a5)
  {
    if ((objc_msgSend_strokeAttributes(v8, v24, v25, v26, v27, v28) & 2) != 0)
    {
      a5 = 5;
    }
    else
    {
      uint64_t v30 = objc_opt_class();
      int v38 = objc_msgSend_nonTextCandidateForStroke_withSubstrokes_(v30, v31, (uint64_t)v8, (uint64_t)v110, v32, v33);
      if (v38)
      {
        objc_msgSend_addObject_(self->_nontextCandidates, v34, (uint64_t)v38, v35, v36, v37);
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id obj = v109;
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v113, (uint64_t)v117, 16, v40);
        if (v46)
        {
          uint64_t v47 = *(void *)v114;
          do
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v114 != v47) {
                objc_enumerationMutation(obj);
              }
              uint64_t v49 = *(void **)(*((void *)&v113 + 1) + 8 * i);
              strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
              uint64_t v51 = objc_msgSend_encodedStrokeIdentifier(v49, v41, v42, v43, v44, v45);
              uint64_t v56 = objc_msgSend_objectForKey_(strokeClassificationsByStrokeIdentifier, v52, (uint64_t)v51, v53, v54, v55);
              uint64_t v62 = objc_msgSend_unsignedIntegerValue(v56, v57, v58, v59, v60, v61);

              v68 = objc_msgSend_encodedStrokeIdentifier(v49, v63, v64, v65, v66, v67);
              id v74 = objc_msgSend_strokeIdentifier(v38, v69, v70, v71, v72, v73);
              char isEqual = objc_msgSend_isEqual_(v68, v75, (uint64_t)v74, v76, v77, v78);

              if ((isEqual & 1) == 0)
              {
                long long v80 = self->_substrokesByStrokeIdentifier;
                objc_super v81 = objc_msgSend_encodedStrokeIdentifier(v49, v41, v42, v43, v44, v45);
                v86 = objc_msgSend_objectForKey_(v80, v82, (uint64_t)v81, v83, v84, v85);

                if (v86) {
                  objc_msgSend_adjustSupportByAddingStroke_consistingOfSubstrokes_strokeClassification_(v38, v87, (uint64_t)v49, (uint64_t)v86, v62, v88);
                }
              }
            }
            uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v113, (uint64_t)v117, 16, v45);
          }
          while (v46);
        }

        a5 = objc_msgSend_effectiveClassification(v38, v89, v90, v91, v92, v93);
      }
      else
      {
        a5 = 1;
      }
    }
    uint64_t v29 = &OBJC_IVAR___CHClientStroke__endTimestamp;
  }
  v94 = *(Class *)((char *)&self->super.super.isa + v29[952]);
  v95 = objc_msgSend_numberWithInteger_(NSNumber, v24, a5, v26, v27, v28);
  v101 = objc_msgSend_encodedStrokeIdentifier(v111, v96, v97, v98, v99, v100);
  objc_msgSend_setObject_forKey_(v94, v102, (uint64_t)v95, (uint64_t)v101, v103, v104);

  objc_msgSend_updateNonTextCandidatesSupportFromStroke_(self, v105, (uint64_t)v111, v106, v107, v108);
}

- (void)updateNonTextCandidatesSupportFromStroke:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
  uint64_t v11 = objc_msgSend_encodedStrokeIdentifier(v4, v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_objectForKey_(strokeClassificationsByStrokeIdentifier, v12, (uint64_t)v11, v13, v14, v15);
  uint64_t v91 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19, v20, v21);

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = self->_nontextCandidates;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v93, (uint64_t)v97, 16, v23);
  if (v29)
  {
    uint64_t v30 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v94 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        uint64_t v33 = objc_msgSend_encodedStrokeIdentifier(v4, v24, v25, v26, v27, v28);
        uint64_t v39 = objc_msgSend_strokeIdentifier(v32, v34, v35, v36, v37, v38);
        char isEqual = objc_msgSend_isEqual_(v33, v40, (uint64_t)v39, v41, v42, v43);

        if ((isEqual & 1) == 0)
        {
          substrokesByStrokeIdentifier = self->_substrokesByStrokeIdentifier;
          uint64_t v46 = objc_msgSend_encodedStrokeIdentifier(v4, v24, v25, v26, v27, v28);
          uint64_t v51 = objc_msgSend_objectForKey_(substrokesByStrokeIdentifier, v47, (uint64_t)v46, v48, v49, v50);

          if (!v51)
          {
            uint64_t v54 = objc_opt_class();
            uint64_t v51 = objc_msgSend_substrokesForStroke_(v54, v55, (uint64_t)v4, v56, v57, v58);
            uint64_t v59 = self->_substrokesByStrokeIdentifier;
            uint64_t v65 = objc_msgSend_encodedStrokeIdentifier(v4, v60, v61, v62, v63, v64);
            objc_msgSend_setObject_forKey_(v59, v66, (uint64_t)v51, (uint64_t)v65, v67, v68);
          }
          if (objc_msgSend_adjustSupportByAddingStroke_consistingOfSubstrokes_strokeClassification_(v32, v52, (uint64_t)v4, (uint64_t)v51, v91, v53))
          {
            id v74 = self->_strokeClassificationsByStrokeIdentifier;
            id v75 = NSNumber;
            uint64_t v76 = objc_msgSend_effectiveClassification(v32, v69, v70, v71, v72, v73);
            objc_super v81 = objc_msgSend_numberWithInteger_(v75, v77, v76, v78, v79, v80);
            v87 = objc_msgSend_strokeIdentifier(v32, v82, v83, v84, v85, v86);
            objc_msgSend_setObject_forKey_(v74, v88, (uint64_t)v81, (uint64_t)v87, v89, v90);
          }
        }
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v93, (uint64_t)v97, 16, v28);
    }
    while (v29);
  }
}

- (id)strokeClassificationsByStrokeIdentifier
{
  return self->_strokeClassificationsByStrokeIdentifier;
}

- (id)scriptClassificationsByStrokeIdentifier
{
  return self->_scriptClassificationsByStrokeIdentifier;
}

- (id)scriptClassificationRawResultsByStrokeIdentifier
{
  return self->_scriptClassificationRawResultsByStrokeIdentifier;
}

- (id)substrokesByStrokeIdentifier
{
  return self->_substrokesByStrokeIdentifier;
}

- (id)nontextCandidates
{
  return self->_nontextCandidates;
}

- (void)updateByAddingClutterStroke:(id)a3
{
  id v4 = a3;
  strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
  id v47 = v4;
  uint64_t v11 = objc_msgSend_encodedStrokeIdentifier(v4, v6, v7, v8, v9, v10);
  objc_msgSend_setObject_forKey_(strokeClassificationsByStrokeIdentifier, v12, (uint64_t)&unk_1F203F090, (uint64_t)v11, v13, v14);

  scriptClassificationsByStrokeIdentifier = self->_scriptClassificationsByStrokeIdentifier;
  uint64_t v21 = objc_msgSend_encodedStrokeIdentifier(v47, v16, v17, v18, v19, v20);
  objc_msgSend_setObject_forKey_(scriptClassificationsByStrokeIdentifier, v22, (uint64_t)&unk_1F203F090, (uint64_t)v21, v23, v24);

  uint64_t v30 = objc_msgSend_defaultScriptClassificationDictionary(CHStrokeUtilities, v25, v26, v27, v28, v29);
  uint64_t v31 = [CHScriptClassificationRawResult alloc];
  uint64_t v36 = objc_msgSend_initWithProbabilityByScriptClassifications_(v31, v32, (uint64_t)v30, v33, v34, v35);
  scriptClassificationRawResultsByStrokeIdentifier = self->_scriptClassificationRawResultsByStrokeIdentifier;
  uint64_t v43 = objc_msgSend_encodedStrokeIdentifier(v47, v38, v39, v40, v41, v42);
  objc_msgSend_setObject_forKey_(scriptClassificationRawResultsByStrokeIdentifier, v44, (uint64_t)v36, (uint64_t)v43, v45, v46);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHStrokeClassificationResult alloc];
  strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
  scriptClassificationsByStrokeIdentifier = self->_scriptClassificationsByStrokeIdentifier;
  scriptClassificationRawResultsByStrokeIdentifier = self->_scriptClassificationRawResultsByStrokeIdentifier;
  substrokesByStrokeIdentifier = self->_substrokesByStrokeIdentifier;
  nontextCandidates = self->_nontextCandidates;
  return (id)objc_msgSend_initWithStrokeClassificationsByStrokeIdentifier_scriptClassificationsByStrokeIdentifier_scriptClassificationRawResultsByStrokeIdentifier_substrokesByStrokeIdentifier_nontextCandidates_(v4, v5, (uint64_t)strokeClassificationsByStrokeIdentifier, (uint64_t)scriptClassificationsByStrokeIdentifier, (uint64_t)scriptClassificationRawResultsByStrokeIdentifier, (uint64_t)substrokesByStrokeIdentifier, nontextCandidates);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nontextCandidates, 0);
  objc_storeStrong((id *)&self->_substrokesByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationRawResultsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeClassificationsByStrokeIdentifier, 0);
}

@end