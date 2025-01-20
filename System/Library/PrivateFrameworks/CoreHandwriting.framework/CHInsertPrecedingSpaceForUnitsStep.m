@interface CHInsertPrecedingSpaceForUnitsStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHInsertPrecedingSpaceForUnitsStep

- (id)process:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v89 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHInsertPrecedingSpaceForUnitsStep is running", buf, 2u);
  }

  v90 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  for (unint64_t i = 0; ; ++i)
  {
    v18 = objc_msgSend_result(v5, v12, v13, v14, v15, v16);
    v24 = objc_msgSend_transcriptionPaths(v18, v19, v20, v21, v22, v23);
    unint64_t v30 = objc_msgSend_count(v24, v25, v26, v27, v28, v29);

    if (i >= v30) {
      break;
    }
    v36 = objc_msgSend_result(v5, v31, v32, v33, v34, v35);
    v42 = objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
    v47 = objc_msgSend_objectAtIndexedSubscript_(v42, v43, i, v44, v45, v46);

    v58 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v48, v49, v50, v51, v52);
    if (qword_1EA3C9CE0 != -1) {
      dispatch_once(&qword_1EA3C9CE0, &unk_1F20134B0);
    }
    *(void *)buf = 0;
    v107 = buf;
    uint64_t v108 = 0x2020000000;
    char v109 = 1;
    v104[0] = 0;
    v104[1] = v104;
    v104[2] = 0x2020000000;
    char v105 = 1;
    v102[0] = 0;
    v102[1] = v102;
    v102[2] = 0x2020000000;
    char v103 = 1;
    v100[0] = 0;
    v100[1] = v100;
    v100[2] = 0x2020000000;
    char v101 = 1;
    v98[0] = 0;
    v98[1] = v98;
    v98[2] = 0x2020000000;
    char v99 = 0;
    v59 = objc_msgSend_result(v5, v53, v54, v55, v56, v57);
    v65 = objc_msgSend_result(v5, v60, v61, v62, v63, v64);
    uint64_t v71 = objc_msgSend_tokenColumnCount(v65, v66, v67, v68, v69, v70);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = sub_1C493A4C0;
    v91[3] = &unk_1E64E0D98;
    v93 = buf;
    v94 = v104;
    v95 = v100;
    v96 = v98;
    id v72 = v58;
    id v92 = v72;
    v97 = v102;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v59, v73, (uint64_t)v47, 0, v71, (uint64_t)v91);

    objc_msgSend_addObject_(v90, v74, (uint64_t)v72, v75, v76, v77);
    _Block_object_dispose(v98, 8);
    _Block_object_dispose(v100, 8);
    _Block_object_dispose(v102, 8);
    _Block_object_dispose(v104, 8);
    _Block_object_dispose(buf, 8);
  }
  v78 = [CHTokenizedMathResult alloc];
  v83 = objc_msgSend_initWithBestPathTokens_(v78, v79, (uint64_t)v90, v80, v81, v82);
  objc_msgSend_setResult_(v5, v84, (uint64_t)v83, v85, v86, v87);

  return v5;
}

@end