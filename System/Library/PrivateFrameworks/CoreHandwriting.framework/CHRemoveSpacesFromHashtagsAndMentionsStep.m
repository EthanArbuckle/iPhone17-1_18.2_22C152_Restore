@interface CHRemoveSpacesFromHashtagsAndMentionsStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveSpacesFromHashtagsAndMentionsStep

- (id)process:(id)a3 options:(id)a4
{
  v5 = (id *)a3;
  id v227 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromHashtagsAndMentionsStep is running", buf, 2u);
  }

  unint64_t v7 = 0x1E4F1C000uLL;
  v233 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  v232 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16, v17);
  unint64_t v23 = 0;
  v228 = v235;
  v229 = v5;
  while (1)
  {
    v24 = objc_msgSend_result(v5, v18, v19, v20, v21, v22);
    v30 = objc_msgSend_transcriptionPaths(v24, v25, v26, v27, v28, v29);
    unint64_t v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

    if (v23 >= v36) {
      break;
    }
    v42 = objc_msgSend_result(v5, v37, v38, v39, v40, v41);
    v48 = objc_msgSend_transcriptionPaths(v42, v43, v44, v45, v46, v47);
    v53 = objc_msgSend_objectAtIndexedSubscript_(v48, v49, v23, v50, v51, v52);

    v59 = objc_msgSend_array(*(void **)(v7 + 2632), v54, v55, v56, v57, v58);
    v65 = objc_msgSend_array(*(void **)(v7 + 2632), v60, v61, v62, v63, v64);
    uint64_t v256 = 0;
    v257 = &v256;
    uint64_t v258 = 0x3032000000;
    v259 = sub_1C4C089AC;
    v260 = sub_1C4C089BC;
    id v261 = 0;
    uint64_t v252 = 0;
    v253 = &v252;
    uint64_t v254 = 0x2020000000;
    char v255 = 0;
    *(void *)buf = 0;
    v245 = buf;
    uint64_t v246 = 0x5012000000;
    v247 = sub_1C4C141F8;
    v248 = nullsub_55;
    v249 = &unk_1C4CB5C62;
    long long v66 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v250 = *MEMORY[0x1E4F1DB20];
    long long v251 = v66;
    v243[0] = 0;
    v243[1] = v243;
    v243[2] = 0x2020000000;
    v243[3] = 0x43E0000000000000;
    v72 = objc_msgSend_result(v5, v67, v68, v69, v70, v71);
    v78 = objc_msgSend_result(v5, v73, v74, v75, v76, v77);
    uint64_t v84 = objc_msgSend_tokenColumnCount(v78, v79, v80, v81, v82, v83);
    v234[0] = MEMORY[0x1E4F143A8];
    v234[1] = 3221225472;
    v235[0] = sub_1C4C14208;
    v235[1] = &unk_1E64E5160;
    id v85 = v65;
    id v236 = v85;
    unint64_t v242 = v23;
    v238 = &v256;
    v239 = &v252;
    id v86 = v59;
    id v237 = v86;
    v240 = v243;
    v241 = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v72, v87, (uint64_t)v53, 0, v84, (uint64_t)v234);

    v93 = v257;
    v94 = (void *)v257[5];
    if (v94)
    {
      v231 = v53;
      id v100 = v94;
      if (*((unsigned char *)v253 + 24))
      {
        v101 = objc_msgSend_string((void *)v93[5], v95, v96, v97, v98, v99);
        v230 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v101, v102, @" ", (uint64_t)&stru_1F20141C8, v103, v104);

        v105 = [CHTokenizedTextResultToken alloc];
        v111 = objc_msgSend_strokeIndexes((void *)v257[5], v106, v107, v108, v109, v110);
        objc_msgSend_modelScore((void *)v257[5], v112, v113, v114, v115, v116);
        double v118 = v117;
        objc_msgSend_recognitionScore((void *)v257[5], v119, v120, v121, v122, v123);
        double v125 = v124;
        objc_msgSend_combinedScore((void *)v257[5], v126, v127, v128, v129, v130);
        double v132 = v131;
        objc_msgSend_alignmentScore((void *)v257[5], v133, v134, v135, v136, v137);
        double v139 = v138;
        uint64_t v145 = objc_msgSend_properties((void *)v257[5], v140, v141, v142, v143, v144);
        v151 = objc_msgSend_recognizerSourceLocale((void *)v257[5], v146, v147, v148, v149, v150);
        uint64_t v157 = objc_msgSend_inputSources((void *)v257[5], v152, v153, v154, v155, v156);
        uint64_t v163 = objc_msgSend_substrokeCount((void *)v257[5], v158, v159, v160, v161, v162);
        objc_msgSend_bounds((void *)v257[5], v164, v165, v166, v167, v168);
        uint64_t v174 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v105, v169, (uint64_t)v230, (uint64_t)v111, 0, v145, v151, v157 | 0x200, v118, v125, v132, v139, v170, v171, v172, v173, v163, v227, v228);

        id v100 = (id)v174;
      }
      objc_msgSend_addObject_(v86, v95, (uint64_t)v100, v97, v98, v99);

      v53 = v231;
    }
    v5 = v229;
    if (objc_msgSend_count(v86, v88, v89, v90, v91, v92))
    {
      if ((objc_msgSend_isEqual_(v86, v175, (uint64_t)v85, v176, v177, v178) & 1) == 0)
      {
        objc_msgSend_addObject_(v233, v175, (uint64_t)v86, v176, v177, v178);
        v184 = objc_msgSend_result(v229, v179, v180, v181, v182, v183);
        v190 = objc_msgSend_transcriptionPathScores(v184, v185, v186, v187, v188, v189);
        v195 = objc_msgSend_objectAtIndexedSubscript_(v190, v191, v23, v192, v193, v194);
        objc_msgSend_addObject_(v232, v196, (uint64_t)v195, v197, v198, v199);
      }
    }
    objc_msgSend_addObject_(v233, v175, (uint64_t)v85, v176, v177, v178);
    v205 = objc_msgSend_result(v229, v200, v201, v202, v203, v204);
    v211 = objc_msgSend_transcriptionPathScores(v205, v206, v207, v208, v209, v210);
    v216 = objc_msgSend_objectAtIndexedSubscript_(v211, v212, v23, v213, v214, v215);
    objc_msgSend_addObject_(v232, v217, (uint64_t)v216, v218, v219, v220);

    _Block_object_dispose(v243, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v252, 8);
    _Block_object_dispose(&v256, 8);

    ++v23;
    unint64_t v7 = 0x1E4F1C000;
  }
  v221 = objc_msgSend_result(v5, v37, v38, v39, v40, v41);
  v225 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v221, v222, (uint64_t)v233, (uint64_t)v232, v223, v224);
  if (v5) {
    objc_storeStrong(v5 + 3, v225);
  }

  return v5;
}

@end