@interface CHRemoveInvalidArabicDiacriticsStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveInvalidArabicDiacriticsStep

- (id)process:(id)a3 options:(id)a4
{
  v5 = (id *)a3;
  id v116 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveInvalidArabicDiacriticsStep is running", buf, 2u);
  }

  v118 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v117 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  for (unint64_t i = 0; ; ++i)
  {
    v23 = objc_msgSend_result(v5, v17, v18, v19, v20, v21);
    v29 = objc_msgSend_transcriptionPaths(v23, v24, v25, v26, v27, v28);
    unint64_t v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

    if (i >= v35) {
      break;
    }
    v41 = objc_msgSend_result(v5, v36, v37, v38, v39, v40);
    v47 = objc_msgSend_transcriptionPaths(v41, v42, v43, v44, v45, v46);
    v52 = objc_msgSend_objectAtIndexedSubscript_(v47, v48, i, v49, v50, v51);

    v58 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v53, v54, v55, v56, v57);
    v64 = objc_msgSend_result(v5, v59, v60, v61, v62, v63);
    v70 = objc_msgSend_result(v5, v65, v66, v67, v68, v69);
    uint64_t v76 = objc_msgSend_tokenColumnCount(v70, v71, v72, v73, v74, v75);
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = sub_1C4C1E258;
    v119[3] = &unk_1E64E3150;
    id v77 = v58;
    id v120 = v77;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v64, v78, (uint64_t)v52, 0, v76, (uint64_t)v119);

    objc_msgSend_addObject_(v118, v79, (uint64_t)v77, v80, v81, v82);
    v88 = objc_msgSend_result(v5, v83, v84, v85, v86, v87);
    v94 = objc_msgSend_transcriptionPathScores(v88, v89, v90, v91, v92, v93);
    v99 = objc_msgSend_objectAtIndexedSubscript_(v94, v95, i, v96, v97, v98);
    v105 = objc_msgSend_copy(v99, v100, v101, v102, v103, v104);
    objc_msgSend_addObject_(v117, v106, (uint64_t)v105, v107, v108, v109);
  }
  v110 = objc_msgSend_result(v5, v36, v37, v38, v39, v40);
  v114 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v110, v111, (uint64_t)v118, (uint64_t)v117, v112, v113);
  if (v5) {
    objc_storeStrong(v5 + 3, v114);
  }

  return v5;
}

@end