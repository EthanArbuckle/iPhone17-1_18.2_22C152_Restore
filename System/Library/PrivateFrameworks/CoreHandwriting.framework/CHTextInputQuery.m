@interface CHTextInputQuery
+ (id)queryItemStableIdentifierForStrokeGroup:(id)a3;
- (CHTextInputQuery)initWithRecognitionSession:(id)a3;
- (CHTextInputQueryTargetDataSource)textInputTargetsDataSource;
- (NSArray)availableItems;
- (double)totalDuration;
- (id)debugName;
- (void)dealloc;
- (void)q_updateQueryResult;
- (void)setTextInputTargetsDataSource:(id)a3;
@end

@implementation CHTextInputQuery

- (CHTextInputQuery)initWithRecognitionSession:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CHTextInputQuery;
  v3 = [(CHQuery *)&v22 initWithRecognitionSession:a3];
  if (v3)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    availableItems = v3->_availableItems;
    v3->_availableItems = v4;

    objc_msgSend_setPreferredUpdatesInterval_(v3, v6, v7, v8, v9, v10, 0.3);
    v16 = objc_msgSend_recognitionSession(v3, v11, v12, v13, v14, v15);
    objc_msgSend_setActiveTextInputQuery_(v16, v17, (uint64_t)v3, v18, v19, v20);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v7 = objc_msgSend_recognitionSession(self, a2, v2, v3, v4, v5);
  objc_msgSend_activeTextInputQuery(v7, v8, v9, v10, v11, v12);
  uint64_t v13 = (CHTextInputQuery *)objc_claimAutoreleasedReturnValue();

  if (v13 == self)
  {
    uint64_t v19 = objc_msgSend_recognitionSession(self, v14, v15, v16, v17, v18);
    objc_msgSend_setActiveTextInputQuery_(v19, v20, 0, v21, v22, v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)CHTextInputQuery;
  [(CHQuery *)&v24 dealloc];
}

- (void)q_updateQueryResult
{
  uint64_t v2 = self;
  v206[1] = *MEMORY[0x1E4F143B8];
  v192.receiver = self;
  v192.super_class = (Class)CHTextInputQuery;
  [(CHQuery *)&v192 q_updateQueryResult];
  objc_msgSend_q_sessionResult(v2, v3, v4, v5, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v8;
  if (!v2)
  {
    uint64_t v15 = 0;

    if (qword_1EA3CA000 == -1) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  uint64_t v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_strokeGroupingResult(v14, v16, v17, v18, v19, v20);
  v27 = objc_msgSend_strokeGroups(v21, v22, v23, v24, v25, v26);

  v28 = (void *)MEMORY[0x1E4F29008];
  v29 = NSStringFromSelector(sel_ancestorIdentifier);
  uint64_t v33 = objc_msgSend_sortDescriptorWithKey_ascending_(v28, v30, (uint64_t)v29, 1, v31, v32);

  v181 = (void *)v33;
  v206[0] = v33;
  v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)v206, 1, v35, v36);
  v182 = v27;
  v42 = objc_msgSend_sortedArrayUsingDescriptors_(v27, v38, (uint64_t)v37, v39, v40, v41);

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id obj = v42;
  uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v193, (uint64_t)buf, 16, v44);
  if (v188)
  {
    uint64_t v187 = *(void *)v194;
    v185 = v14;
    v186 = v2;
    v184 = v15;
    do
    {
      for (uint64_t i = 0; i != v188; ++i)
      {
        if (*(void *)v194 != v187) {
          objc_enumerationMutation(obj);
        }
        v55 = *(void **)(*((void *)&v193 + 1) + 8 * i);
        v56 = NSNumber;
        uint64_t v57 = objc_msgSend_uniqueIdentifier(v55, v45, v46, v47, v48, v49);
        v190 = objc_msgSend_numberWithInteger_(v56, v58, v57, v59, v60, v61);
        v62 = objc_opt_class();
        v189 = objc_msgSend_queryItemStableIdentifierForStrokeGroup_(v62, v63, (uint64_t)v55, v64, v65, v66);
        uint64_t v72 = objc_msgSend_uniqueIdentifier(v55, v67, v68, v69, v70, v71);
        v77 = objc_msgSend_textCorrectionResultForStrokeGroupIdentifier_(v14, v73, v72, v74, v75, v76);
        v83 = v77;
        if (v77)
        {
          v89 = objc_msgSend_inputStrokeIdentifiers(v77, v78, v79, v80, v81, v82);
        }
        else
        {
          v90 = objc_msgSend_strokeIdentifiers(v55, v78, v79, v80, v81, v82);
          v96 = objc_msgSend_allObjects(v90, v91, v92, v93, v94, v95);

          v89 = objc_msgSend_sortedArrayUsingComparator_(v96, v97, (uint64_t)&unk_1F2012E30, v98, v99, v100);
        }
        v101 = objc_msgSend_recognitionSession(v2, v84, v85, v86, v87, v88);
        v107 = objc_msgSend_latestStrokeProvider(v101, v102, v103, v104, v105, v106);
        v111 = objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v108, (uint64_t)v89, (uint64_t)v107, v109, v110);

        if (v111)
        {
          v112 = [CHTextInputQueryItem alloc];
          v118 = objc_msgSend_textCorrectionResult(v83, v113, v114, v115, v116, v117);
          id v119 = v190;
          id v120 = v189;
          id v121 = v111;
          id v122 = v118;
          if (v112)
          {
            v197.receiver = v112;
            v197.super_class = (Class)CHTextInputQueryItem;
            v112 = [(CHQuery *)&v197 init];
            if (v112)
            {
              uint64_t v128 = objc_msgSend_copy(v119, v123, v124, v125, v126, v127);
              itemIdentifier = v112->_itemIdentifier;
              v112->_itemIdentifier = (NSNumber *)v128;

              uint64_t v135 = objc_msgSend_copy(v120, v130, v131, v132, v133, v134);
              itemStableIdentifier = v112->_itemStableIdentifier;
              v112->_itemStableIdentifier = (NSNumber *)v135;

              uint64_t v142 = objc_msgSend_copy(v121, v137, v138, v139, v140, v141);
              strokeIdentifiers = v112->_strokeIdentifiers;
              v112->_strokeIdentifiers = (NSArray *)v142;

              objc_storeStrong((id *)&v112->_correctionResult, v118);
            }
          }

          uint64_t v15 = v184;
          objc_msgSend_addObject_(v184, v51, (uint64_t)v112, v52, v53, v54);

          uint64_t v14 = v185;
          uint64_t v2 = v186;
        }
      }
      uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v193, (uint64_t)buf, 16, v49);
    }
    while (v188);
  }

  if (qword_1EA3CA000 != -1) {
LABEL_28:
  }
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
LABEL_18:
  v144 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
  {
    v150 = objc_msgSend_debugName(v2, v145, v146, v147, v148, v149);
    v156 = objc_msgSend_recognitionSession(v2, v151, v152, v153, v154, v155);
    v162 = objc_msgSend_strokeProviderVersion(v14, v157, v158, v159, v160, v161);
    uint64_t v168 = objc_msgSend_count(v15, v163, v164, v165, v166, v167);
    *(_DWORD *)buf = 138413058;
    v199 = v150;
    __int16 v200 = 2048;
    v201 = v156;
    __int16 v202 = 2112;
    v203 = v162;
    __int16 v204 = 2048;
    uint64_t v205 = v168;
    _os_log_impl(&dword_1C492D000, v144, OS_LOG_TYPE_DEBUG, "%@: finished update for session %p, version %@. %ld item(s) available.", buf, 0x2Au);
  }
  if (v14)
  {
    objc_msgSend_generationDuration(v14, v169, v170, v171, v172, v173);
    if (!v2) {
      goto LABEL_26;
    }
  }
  else
  {
    long long v191 = 0u;
    if (!v2) {
      goto LABEL_26;
    }
  }
  v2->_totalDuration = *((double *)&v191 + 1);
  if (v2->_availableItems != v15)
  {
    uint64_t v174 = objc_msgSend_copy(v15, v169, v170, v171, v172, v173);
    availableItems = v2->_availableItems;
    v2->_availableItems = (NSArray *)v174;

    objc_msgSend_q_queryResultDidChange(v2, v176, v177, v178, v179, v180);
  }
LABEL_26:
}

- (NSArray)availableItems
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4B084E0;
  uint64_t v15 = sub_1C4B084F0;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4B084F8;
  v10[3] = &unk_1E64E1048;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Text Input Query %p", v2, v3, v4, self);
}

- (CHTextInputQueryTargetDataSource)textInputTargetsDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInputTargetsDataSource);
  return (CHTextInputQueryTargetDataSource *)WeakRetained;
}

- (void)setTextInputTargetsDataSource:(id)a3
{
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textInputTargetsDataSource);
  objc_storeStrong((id *)&self->_availableItems, 0);
}

+ (id)queryItemStableIdentifierForStrokeGroup:(id)a3
{
  uint64_t v6 = NSNumber;
  uint64_t v8 = objc_msgSend_ancestorIdentifier(a3, a2, (uint64_t)a3, v3, v4, v5);
  return (id)objc_msgSend_numberWithInteger_(v6, v7, v8, v9, v10, v11);
}

@end