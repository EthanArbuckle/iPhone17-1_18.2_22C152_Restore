@interface CHRemoveSpacesFromEnglishAndKoreanParticlesStep
- (CHRemoveSpacesFromEnglishAndKoreanParticlesStep)init;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveSpacesFromEnglishAndKoreanParticlesStep

- (CHRemoveSpacesFromEnglishAndKoreanParticlesStep)init
{
  v10.receiver = self;
  v10.super_class = (Class)CHRemoveSpacesFromEnglishAndKoreanParticlesStep;
  v6 = [(CHRemoveSpacesFromEnglishAndKoreanParticlesStep *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v2, @"이는다고가지나요에도니라로은면을만들인네의랑래를", v3, v4, v5);
    koreanParticlesCharSet = v6->_koreanParticlesCharSet;
    v6->_koreanParticlesCharSet = (NSCharacterSet *)v7;
  }
  return v6;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v5 = (id *)a3;
  id v143 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromEnglishAndKoreanParticlesStep is running", buf, 2u);
  }

  v146 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v145 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
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

    v147 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v53, v54, v55, v56, v57);
    v63 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v58, v59, v60, v61, v62);
    uint64_t v163 = 0;
    v164 = &v163;
    uint64_t v165 = 0x3032000000;
    v166 = sub_1C4C089AC;
    v167 = sub_1C4C089BC;
    id v168 = 0;
    *(void *)buf = 0;
    v156 = buf;
    uint64_t v157 = 0x5012000000;
    v158 = sub_1C4C141F8;
    v159 = nullsub_55;
    v160 = &unk_1C4CB5C62;
    long long v64 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v161 = *MEMORY[0x1E4F1DB20];
    long long v162 = v64;
    v70 = objc_msgSend_result(v5, v65, v66, v67, v68, v69);
    v76 = objc_msgSend_result(v5, v71, v72, v73, v74, v75);
    uint64_t v82 = objc_msgSend_tokenColumnCount(v76, v77, v78, v79, v80, v81);
    v148[0] = MEMORY[0x1E4F143A8];
    v148[1] = 3221225472;
    v148[2] = sub_1C4C14F84;
    v148[3] = &unk_1E64E5188;
    id v83 = v63;
    id v149 = v83;
    v150 = self;
    unint64_t v154 = i;
    v152 = &v163;
    id v84 = v147;
    id v151 = v84;
    v153 = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v70, v85, (uint64_t)v52, 0, v82, (uint64_t)v148);

    uint64_t v90 = v164[5];
    if (v90) {
      objc_msgSend_addObject_(v84, v86, v90, v87, v88, v89);
    }
    if (objc_msgSend_count(v84, v86, v90, v87, v88, v89))
    {
      if ((objc_msgSend_isEqual_(v84, v91, (uint64_t)v83, v92, v93, v94) & 1) == 0)
      {
        objc_msgSend_addObject_(v146, v91, (uint64_t)v84, v92, v93, v94);
        v100 = objc_msgSend_result(v5, v95, v96, v97, v98, v99);
        v106 = objc_msgSend_transcriptionPathScores(v100, v101, v102, v103, v104, v105);
        v111 = objc_msgSend_objectAtIndexedSubscript_(v106, v107, i, v108, v109, v110);
        objc_msgSend_addObject_(v145, v112, (uint64_t)v111, v113, v114, v115);
      }
    }
    objc_msgSend_addObject_(v146, v91, (uint64_t)v83, v92, v93, v94);
    v121 = objc_msgSend_result(v5, v116, v117, v118, v119, v120);
    v127 = objc_msgSend_transcriptionPathScores(v121, v122, v123, v124, v125, v126);
    v132 = objc_msgSend_objectAtIndexedSubscript_(v127, v128, i, v129, v130, v131);
    objc_msgSend_addObject_(v145, v133, (uint64_t)v132, v134, v135, v136);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v163, 8);
  }
  v137 = objc_msgSend_result(v5, v36, v37, v38, v39, v40);
  v141 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v137, v138, (uint64_t)v146, (uint64_t)v145, v139, v140);
  if (v5) {
    objc_storeStrong(v5 + 3, v141);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end