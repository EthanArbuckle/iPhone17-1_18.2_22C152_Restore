@interface CHTransliterateChineseJapaneseStep
- (CHTransliterateChineseJapaneseStep)initWithTransliterateSentences:(BOOL)a3;
- (id)process:(id)a3 options:(id)a4;
- (void)dealloc;
@end

@implementation CHTransliterateChineseJapaneseStep

- (CHTransliterateChineseJapaneseStep)initWithTransliterateSentences:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CHTransliterateChineseJapaneseStep;
  v4 = [(CHTransliterateChineseJapaneseStep *)&v6 init];
  if (v4)
  {
    long long v7 = *(_OWORD *)"S";
    v8[0] = *(_OWORD *)L"ed-Traditional";
    *(_OWORD *)((char *)v8 + 14) = *(_OWORD *)L"itional";
    v4->_icuTransliterator = (void **)utrans_openU();
    v4->_transliterateSentences = a3;
  }
  return v4;
}

- (id)process:(id)a3 options:(id)a4
{
  v5 = (id *)a3;
  id v168 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  objc_super v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHTransliterateChineseJapaneseStep is running", buf, 2u);
  }

  unint64_t v7 = 0x1E4F1C000uLL;
  v171 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  v170 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16, v17);
  for (unint64_t i = 0; ; ++i)
  {
    v24 = objc_msgSend_result(v5, v18, v19, v20, v21, v22);
    v30 = objc_msgSend_transcriptionPaths(v24, v25, v26, v27, v28, v29);
    unint64_t v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

    if (i >= v36) {
      break;
    }
    v42 = objc_msgSend_result(v5, v37, v38, v39, v40, v41);
    v48 = objc_msgSend_transcriptionPaths(v42, v43, v44, v45, v46, v47);
    v176 = objc_msgSend_objectAtIndexedSubscript_(v48, v49, i, v50, v51, v52);

    v175 = objc_msgSend_array(*(void **)(v7 + 2632), v53, v54, v55, v56, v57);
    v174 = objc_msgSend_array(*(void **)(v7 + 2632), v58, v59, v60, v61, v62);
    v173 = objc_msgSend_array(*(void **)(v7 + 2632), v63, v64, v65, v66, v67);
    v172 = objc_msgSend_array(*(void **)(v7 + 2632), v68, v69, v70, v71, v72);
    v78 = objc_msgSend_result(v5, v73, v74, v75, v76, v77);
    v84 = objc_msgSend_result(v5, v79, v80, v81, v82, v83);
    unint64_t v85 = v7;
    uint64_t v91 = objc_msgSend_tokenColumnCount(v84, v86, v87, v88, v89, v90);
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = sub_1C4C15BB8;
    v177[3] = &unk_1E64E3998;
    id v92 = v173;
    id v178 = v92;
    id v93 = v172;
    id v179 = v93;
    id v94 = v175;
    id v180 = v94;
    id v95 = v174;
    id v181 = v95;
    v182 = self;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v78, v96, (uint64_t)v176, 0, v91, (uint64_t)v177);

    if (objc_msgSend_count(v92, v97, v98, v99, v100, v101)) {
      sub_1C4C045E8((uint64_t)CHPostprocessingStep, v92, v93, v94, v95);
    }
    if (objc_msgSend_count(v94, v102, v103, v104, v105, v106))
    {
      objc_msgSend_addObject_(v171, v107, (uint64_t)v94, v109, v110, v111);
      v117 = objc_msgSend_result(v5, v112, v113, v114, v115, v116);
      v123 = objc_msgSend_transcriptionPathScores(v117, v118, v119, v120, v121, v122);
      v128 = objc_msgSend_objectAtIndexedSubscript_(v123, v124, i, v125, v126, v127);
      objc_msgSend_addObject_(v170, v129, (uint64_t)v128, v130, v131, v132);
    }
    if (objc_msgSend_count(v95, v107, v108, v109, v110, v111))
    {
      if ((objc_msgSend_isEqual_(v95, v133, (uint64_t)v94, v134, v135, v136) & 1) == 0)
      {
        objc_msgSend_addObject_(v171, v137, (uint64_t)v95, v138, v139, v140);
        v146 = objc_msgSend_result(v5, v141, v142, v143, v144, v145);
        v152 = objc_msgSend_transcriptionPathScores(v146, v147, v148, v149, v150, v151);
        v157 = objc_msgSend_objectAtIndexedSubscript_(v152, v153, i, v154, v155, v156);
        objc_msgSend_addObject_(v170, v158, (uint64_t)v157, v159, v160, v161);
      }
    }

    unint64_t v7 = v85;
  }
  v162 = objc_msgSend_result(v5, v37, v38, v39, v40, v41);
  v166 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v162, v163, (uint64_t)v171, (uint64_t)v170, v164, v165);
  if (v5) {
    objc_storeStrong(v5 + 3, v166);
  }

  return v5;
}

- (void)dealloc
{
  if (self->_icuTransliterator)
  {
    utrans_close();
    self->_icuTransliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CHTransliterateChineseJapaneseStep;
  [(CHTransliterateChineseJapaneseStep *)&v3 dealloc];
}

@end