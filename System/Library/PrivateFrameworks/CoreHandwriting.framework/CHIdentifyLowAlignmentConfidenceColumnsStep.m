@interface CHIdentifyLowAlignmentConfidenceColumnsStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHIdentifyLowAlignmentConfidenceColumnsStep

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v110 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v4 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v4, OS_LOG_TYPE_DEBUG, "CHIdentifyLowAlignmentConfidenceColumnsStep is running", buf, 2u);
  }

  v10 = objc_msgSend_result(v110, v5, v6, v7, v8, v9);
  v16 = objc_msgSend_tokenColumns(v10, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_count(v16, v17, v18, v19, v20, v21);
  uint64_t v23 = v22 != 0;

  v29 = objc_msgSend_tokenColumns(v10, v24, v25, v26, v27, v28);
  uint64_t v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

  uint64_t v41 = v35 - 2;
  if (((v35 - 2) & 0x8000000000000000) == 0)
  {
    uint64_t v42 = (__PAIR128__(v35, v22) - 1) >> 64;
    while (1)
    {
      v43 = objc_msgSend_tokenColumns(v10, v36, v37, v38, v39, v40);
      v48 = objc_msgSend_objectAtIndexedSubscript_(v43, v44, v41, v45, v46, v47);

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      v54 = objc_msgSend_textTokenRows(v48, v49, v50, v51, v52, v53);
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v111, (uint64_t)v116, 16, v56);
      if (!v62) {
        break;
      }
      uint64_t v63 = *(void *)v112;
      double v64 = 1.0;
      do
      {
        for (uint64_t i = 0; i != v62; ++i)
        {
          if (*(void *)v112 != v63) {
            objc_enumerationMutation(v54);
          }
          v66 = objc_msgSend_lastObject(*(void **)(*((void *)&v111 + 1) + 8 * i), v57, v58, v59, v60, v61);
          objc_msgSend_alignmentScore(v66, v67, v68, v69, v70, v71);
          double v73 = v72;

          if (v73 < v64) {
            double v64 = v73;
          }
        }
        uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v111, (uint64_t)v116, 16, v61);
      }
      while (v62);

      if (v64 >= 0.9) {
        goto LABEL_21;
      }
      ++v23;
      if (v41-- <= 0)
      {
        uint64_t v23 = v42;
        goto LABEL_21;
      }
    }
  }
LABEL_21:
  if (v23 <= objc_msgSend_changeableTokenColumnCount(v10, v36, v37, v38, v39, v40)) {
    uint64_t v23 = objc_msgSend_changeableTokenColumnCount(v10, v75, v76, v77, v78, v79);
  }
  if (objc_msgSend_tokenColumnCount(v10, v75, v76, v77, v78, v79) - v23 == 1)
  {
    v85 = objc_msgSend_transcriptionPaths(v10, v80, v81, v82, v83, v84);
    v91 = objc_msgSend_firstObject(v85, v86, v87, v88, v89, v90);
    v93 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v10, v92, (uint64_t)v91, 0, 1, 0);

    if (objc_msgSend_countCharacters(v93, v94, v95, v96, v97, v98) == 1) {
      uint64_t v23 = objc_msgSend_tokenColumnCount(v10, v99, v100, v101, v102, v103);
    }
  }
  if (v23 < objc_msgSend_changeableTokenColumnCount(v10, v80, v81, v82, v83, v84))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v108 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v108, OS_LOG_TYPE_FAULT, "CHIdentifyLowAlignmentConfidenceColumnsStep unexpectedly decreased the changeable token column count.", buf, 2u);
    }
  }
  objc_msgSend_setChangeableTokenColumnCount_(v10, v104, v23, v105, v106, v107);

  return v110;
}

@end