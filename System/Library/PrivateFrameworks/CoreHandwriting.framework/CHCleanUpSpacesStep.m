@interface CHCleanUpSpacesStep
- (CHCleanUpSpacesStep)initWithLocale:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHCleanUpSpacesStep

- (CHCleanUpSpacesStep)initWithLocale:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHCleanUpSpacesStep;
  v10 = [(CHCleanUpSpacesStep *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v11;
  }
  return v10;
}

- (id)process:(id)a3 options:(id)a4
{
  v190 = (id *)a3;
  id v181 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHCleanUpSpacesStep is running", buf, 2u);
  }

  v186 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v185 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  unint64_t v191 = 0;
  objc_msgSend_result(v190, v17, v18, v19, v20, v21, v181, &v205, v193);
  while (1)
    v27 = {;
    v33 = objc_msgSend_transcriptionPaths(v27, v28, v29, v30, v31, v32);
    unint64_t v39 = objc_msgSend_count(v33, v34, v35, v36, v37, v38);

    if (v191 >= v39) {
      break;
    }
    v45 = objc_msgSend_result(v190, v40, v41, v42, v43, v44);
    v51 = objc_msgSend_transcriptionPaths(v45, v46, v47, v48, v49, v50);
    v56 = objc_msgSend_objectAtIndexedSubscript_(v51, v52, v191, v53, v54, v55);

    v189 = v56;
    uint64_t v62 = objc_msgSend_length(v56, v57, v58, v59, v60, v61);
    *(void *)buf = 0;
    v210 = buf;
    uint64_t v211 = 0x3032000000;
    v212 = sub_1C4C089AC;
    v213 = sub_1C4C089BC;
    objc_msgSend_leftContext(v190, v63, v64, v65, v66, v67);
    id v214 = (id)objc_claimAutoreleasedReturnValue();
    id v72 = *((id *)v210 + 5);
    if (self
      && objc_msgSend_shouldAddSpaceToNeutralQuotationMarks_(CHRecognizerConfiguration, v68, (uint64_t)self->_locale, v69, v70, v71))
    {
      v78 = objc_msgSend_set(MEMORY[0x1E4F28BD0], v73, v74, v75, v76, v77);
      uint64_t v84 = objc_msgSend_length(v72, v79, v80, v81, v82, v83);
      uint64_t v203 = MEMORY[0x1E4F143A8];
      uint64_t v204 = 3221225472;
      uint64_t v205 = (uint64_t)sub_1C4C10354;
      v206 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E64E0E38;
      v85 = v78;
      v207 = v85;
      objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v72, v86, 0, v84, 2, (uint64_t)&v203);
    }
    else
    {
      v85 = 0;
    }

    uint64_t v203 = 0;
    uint64_t v204 = (uint64_t)&v203;
    uint64_t v205 = 0x3032000000;
    v206 = sub_1C4C089AC;
    v207 = sub_1C4C089BC;
    v92 = objc_msgSend_result(v190, v87, v88, v89, v90, v91);
    objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v92, v93, (uint64_t)v189, 0, v62, 0);
    id v208 = (id)objc_claimAutoreleasedReturnValue();

    v202[0] = 0;
    v202[1] = v202;
    v202[2] = 0x2020000000;
    v202[3] = 0;
    v188 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v94, v95, v96, v97, v98);
    v187 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v99, v100, v101, v102, v103);
    v109 = objc_msgSend_result(v190, v104, v105, v106, v107, v108);
    v192[0] = MEMORY[0x1E4F143A8];
    v192[1] = 3221225472;
    v193[0] = sub_1C4C10D10;
    v193[1] = &unk_1E64E5138;
    v199 = v202;
    v110 = v190;
    v194 = v110;
    v195 = self;
    v111 = self;
    v200 = &v203;
    v201 = buf;
    v112 = v85;
    v196 = v112;
    id v113 = v188;
    id v197 = v113;
    id v114 = v187;
    id v198 = v114;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v109, v115, (uint64_t)v189, 0, v62, (uint64_t)v192);

    objc_msgSend_addObject_(v186, v116, (uint64_t)v114, v117, v118, v119);
    v125 = objc_msgSend_result(v110, v120, v121, v122, v123, v124);
    v131 = objc_msgSend_transcriptionPathScores(v125, v126, v127, v128, v129, v130);
    v136 = objc_msgSend_objectAtIndexedSubscript_(v131, v132, v191, v133, v134, v135);
    objc_msgSend_addObject_(v185, v137, (uint64_t)v136, v138, v139, v140);

    if (objc_msgSend_count(v113, v141, v142, v143, v144, v145))
    {
      if ((objc_msgSend_isEqual_(v113, v146, (uint64_t)v114, v147, v148, v149) & 1) == 0)
      {
        objc_msgSend_addObject_(v186, v150, (uint64_t)v113, v151, v152, v153);
        v159 = objc_msgSend_result(v110, v154, v155, v156, v157, v158);
        v165 = objc_msgSend_transcriptionPathScores(v159, v160, v161, v162, v163, v164);
        v170 = objc_msgSend_objectAtIndexedSubscript_(v165, v166, v191, v167, v168, v169);
        objc_msgSend_addObject_(v185, v171, (uint64_t)v170, v172, v173, v174);
      }
    }

    _Block_object_dispose(v202, 8);
    _Block_object_dispose(&v203, 8);

    _Block_object_dispose(buf, 8);
    ++v191;
    self = v111;
    objc_msgSend_result(v190, v22, v23, v24, v25, v26, v182, v183, v184);
  }
  v175 = objc_msgSend_result(v190, v40, v41, v42, v43, v44);
  v179 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v175, v176, (uint64_t)v186, (uint64_t)v185, v177, v178);
  if (v190) {
    objc_storeStrong(v190 + 3, v179);
  }

  return v190;
}

- (void).cxx_destruct
{
}

@end