@interface CHAutoRefineQuery
- (BOOL)wantsAutoRefineUpdates;
- (CHAutoRefineQuery)initWithRecognitionSession:(id)a3;
- (CHAutoRefineQueryItem)autoRefinedItem;
- (NSArray)autoRefinedItems;
- (id)debugName;
- (void)q_updateQueryResult;
@end

@implementation CHAutoRefineQuery

- (CHAutoRefineQuery)initWithRecognitionSession:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CHAutoRefineQuery;
  v3 = [(CHQuery *)&v11 initWithRecognitionSession:a3];
  v9 = v3;
  if (v3) {
    objc_msgSend_setPreferredUpdatesInterval_(v3, v4, v5, v6, v7, v8, 0.25);
  }
  return v9;
}

- (void)q_updateQueryResult
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHAutoRefineQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHAutoRefineQuery\"", buf, 2u);
  }

  v124.receiver = self;
  v124.super_class = (Class)CHAutoRefineQuery;
  [(CHQuery *)&v124 q_updateQueryResult];
  v13 = objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend_autoRefineResults(v13, v15, v16, v17, v18, v19);
    uint64_t v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);
    *(_DWORD *)buf = 134217984;
    uint64_t v126 = v26;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "AutoRefine query items available: %ld", buf, 0xCu);
  }
  v32 = objc_msgSend_autoRefineResults(v13, v27, v28, v29, v30, v31);
  uint64_t v38 = objc_msgSend_count(v32, v33, v34, v35, v36, v37);

  if (!v38)
  {
    autoRefinedItems = self->_autoRefinedItems;
    self->_autoRefinedItems = 0;

    objc_msgSend_q_queryResultDidChange(self, v114, v115, v116, v117, v118);
    if (qword_1EA3CA000 == -1) {
      goto LABEL_28;
    }
LABEL_36:
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v111 = (id)qword_1EA3C9FC8;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  unint64_t v119 = v6;
  os_signpost_id_t v44 = v4;
  v45 = (void *)MEMORY[0x1E4F1CA48];
  v46 = objc_msgSend_autoRefineResults(v13, v39, v40, v41, v42, v43);
  uint64_t v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51);
  v57 = objc_msgSend_arrayWithCapacity_(v45, v53, v52, v54, v55, v56);

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  v63 = objc_msgSend_autoRefineResults(v13, v58, v59, v60, v61, v62);
  uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v120, (uint64_t)v133, 16, v65);
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v121 != v68) {
          objc_enumerationMutation(v63);
        }
        uint64_t v70 = *(void *)(*((void *)&v120 + 1) + 8 * i);
        v71 = [CHAutoRefineQueryItem alloc];
        v76 = objc_msgSend_initWithAutoRefineResult_(v71, v72, v70, v73, v74, v75);
        objc_msgSend_addObject_(v57, v77, (uint64_t)v76, v78, v79, v80);
      }
      uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v81, (uint64_t)&v120, (uint64_t)v133, 16, v82);
    }
    while (v67);
  }

  objc_storeStrong((id *)&self->_autoRefinedItems, v57);
  v86 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(self->_autoRefinedItems, v83, @", ", (uint64_t)&unk_1F2012CF0, v84, v85);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  os_signpost_id_t v4 = v44;
  v87 = (id)qword_1EA3C9FA0;
  unint64_t v6 = v119;
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
  {
    v93 = objc_msgSend_debugName(self, v88, v89, v90, v91, v92);
    v99 = objc_msgSend_strokeProviderVersion(v13, v94, v95, v96, v97, v98);
    uint64_t v105 = objc_msgSend_count(self->_autoRefinedItems, v100, v101, v102, v103, v104);
    *(_DWORD *)buf = 138413059;
    uint64_t v126 = (uint64_t)v93;
    __int16 v127 = 2112;
    v128 = v99;
    __int16 v129 = 2048;
    uint64_t v130 = v105;
    __int16 v131 = 2117;
    v132 = v86;
    _os_log_impl(&dword_1C492D000, v87, OS_LOG_TYPE_DEFAULT, "AutoRefine: %@: beginning update for result version %@, %ld items with transcriptions = %{sensitive}@", buf, 0x2Au);
  }
  objc_msgSend_q_queryResultDidChange(self, v106, v107, v108, v109, v110);
  if (qword_1EA3CA000 != -1) {
    goto LABEL_36;
  }
LABEL_28:
  v111 = (id)qword_1EA3C9FC8;
  if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
    goto LABEL_31;
  }
LABEL_29:
  if (os_signpost_enabled(v111))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v111, OS_SIGNPOST_INTERVAL_END, v4, "CHAutoRefineQuery", "", buf, 2u);
  }
LABEL_31:

  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v112 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  v112 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
  {
LABEL_33:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v112, OS_LOG_TYPE_DEFAULT, "END \"CHAutoRefineQuery\"", buf, 2u);
  }
LABEL_34:
}

- (CHAutoRefineQueryItem)autoRefinedItem
{
  return (CHAutoRefineQueryItem *)objc_msgSend_firstObject(self->_autoRefinedItems, a2, v2, v3, v4, v5);
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"AutoRefine Query %p", v2, v3, v4, self);
}

- (NSArray)autoRefinedItems
{
  return &self->_autoRefinedItems->super;
}

- (void).cxx_destruct
{
}

- (BOOL)wantsAutoRefineUpdates
{
  return 1;
}

@end