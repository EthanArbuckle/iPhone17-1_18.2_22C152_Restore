@interface CHUpdateTokenPropertyForVariableAssignmentStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHUpdateTokenPropertyForVariableAssignmentStep

- (id)process:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v7 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEBUG, "CHUpdateTokenPropertyForVariableAssignmentStep is running", buf, 2u);
  }

  v93 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  v92 = v5;
  v18 = objc_msgSend_result(v5, v13, v14, v15, v16, v17);
  v29 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22, v23);
  for (unint64_t i = 0; ; ++i)
  {
    v31 = objc_msgSend_transcriptionPaths(v18, v24, v25, v26, v27, v28);
    unint64_t v37 = objc_msgSend_count(v31, v32, v33, v34, v35, v36);

    if (i >= v37) {
      break;
    }
    v43 = objc_msgSend_transcriptionPaths(v18, v38, v39, v40, v41, v42);
    v48 = objc_msgSend_objectAtIndexedSubscript_(v43, v44, i, v45, v46, v47);

    v54 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v49, v50, v51, v52, v53);
    uint64_t v60 = objc_msgSend_tokenColumnCount(v18, v55, v56, v57, v58, v59);
    v63 = objc_msgSend_transcriptionWithPath_columnRange_(v18, v61, (uint64_t)v48, 0, v60, v62);
    char v68 = objc_msgSend_containsString_(v63, v64, @"=", v65, v66, v67);
    *(void *)buf = 0;
    v99 = buf;
    uint64_t v100 = 0x2020000000;
    char v101 = v68;
    uint64_t v74 = objc_msgSend_tokenColumnCount(v18, v69, v70, v71, v72, v73);
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = sub_1C4939E48;
    v94[3] = &unk_1E64E0D70;
    v97 = buf;
    id v95 = v93;
    id v75 = v54;
    id v96 = v75;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v18, v76, (uint64_t)v48, 0, v74, (uint64_t)v94);
    objc_msgSend_addObject_(v29, v77, (uint64_t)v75, v78, v79, v80);

    _Block_object_dispose(buf, 8);
  }
  v81 = [CHTokenizedMathResult alloc];
  v86 = objc_msgSend_initWithBestPathTokens_(v81, v82, (uint64_t)v29, v83, v84, v85);
  objc_msgSend_setResult_(v92, v87, (uint64_t)v86, v88, v89, v90);

  return v92;
}

@end