@interface CHSemanticTokenizerStep
- (CHSemanticTokenizerStep)initWithWordLanguageModel:(void *)a3 ovsStringChecker:(id)a4;
- (id)process:(id)a3 options:(id)a4;
- (void)dealloc;
@end

@implementation CHSemanticTokenizerStep

- (CHSemanticTokenizerStep)initWithWordLanguageModel:(void *)a3 ovsStringChecker:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CHSemanticTokenizerStep;
  v7 = [(CHSemanticTokenizerStep *)&v9 init];
  if (v7)
  {
    v7->_wordLanguageModel = (void *)LMLanguageModelRetain();
    objc_storeStrong((id *)&v7->_ovsStringChecker, a4);
  }

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v281 = *MEMORY[0x1E4F143B8];
  v239 = (id *)a3;
  id v237 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHSemanticTokenizerStep is running", buf, 2u);
  }

  v12 = objc_msgSend_result(v239, v7, v8, v9, v10, v11);
  v242 = objc_msgSend_topTranscription(v12, v13, v14, v15, v16, v17);
  v18 = objc_opt_class();
  id v274 = 0;
  v243 = objc_msgSend_tokensRangesForString_outTokenIDs_wordLanguageModel_(v18, v19, (uint64_t)v242, (uint64_t)&v274, (uint64_t)self->_wordLanguageModel, v20);
  id v21 = v274;
  uint64_t v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  if (v27 != objc_msgSend_count(v243, v28, v29, v30, v31, v32))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v38 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      uint64_t v44 = objc_msgSend_count(v21, v39, v40, v41, v42, v43);
      uint64_t v50 = objc_msgSend_count(v243, v45, v46, v47, v48, v49);
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v50;
      _os_log_impl(&dword_1C492D000, v38, OS_LOG_TYPE_FAULT, "wordID count %lu should match wordRangesInString count %lu", buf, 0x16u);
    }
  }
  v51 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v52 = objc_msgSend_count(v21, v33, v34, v35, v36, v37);
  v244 = objc_msgSend_dictionaryWithCapacity_(v51, v53, v52, v54, v55, v56);
  for (unint64_t i = 0; i < objc_msgSend_count(v21, v57, v58, v59, v60, v61); ++i)
  {
    v68 = objc_msgSend_objectAtIndex_(v243, v63, i, v65, v66, v67);
    uint64_t v74 = objc_msgSend_rangeValue(v68, v69, v70, v71, v72, v73);
    v78 = objc_msgSend_substringWithRange_(v242, v75, v74, (uint64_t)v75, v76, v77);

    v83 = objc_msgSend_objectAtIndex_(v21, v79, i, v80, v81, v82);
    objc_msgSend_setValue_forKey_(v244, v84, (uint64_t)v83, (uint64_t)v78, v85, v86);
  }
  if (objc_msgSend_count(v243, v63, v64, v65, v66, v67))
  {
    v241 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v87, v88, v89, v90, v91);
    v240 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v92, v93, v94, v95, v96);
    v236 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v97, v98, v99, v100, v101);
    v273[0] = 0;
    v273[1] = v273;
    v273[2] = 0x2020000000;
    v273[3] = 0;
    uint64_t v269 = 0;
    v270 = &v269;
    uint64_t v271 = 0x2020000000;
    uint64_t v272 = 0;
    v267[0] = 0;
    v267[1] = v267;
    v267[2] = 0x3032000000;
    v267[3] = sub_1C4C089AC;
    v267[4] = sub_1C4C089BC;
    objc_msgSend_objectAtIndex_(v21, v102, 0, v103, v104, v105);
    id v268 = (id)objc_claimAutoreleasedReturnValue();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4012000000;
    v276 = sub_1C4C0F804;
    v277 = nullsub_54;
    v278 = &unk_1C4CB5C62;
    uint64_t v279 = 0;
    uint64_t v280 = 0;
    v110 = objc_msgSend_objectAtIndex_(v243, v106, v270[3], v107, v108, v109);
    uint64_t v279 = objc_msgSend_rangeValue(v110, v111, v112, v113, v114, v115);
    uint64_t v280 = v116;

    v265[0] = 0;
    v265[1] = v265;
    v265[2] = 0x4012000000;
    v265[3] = sub_1C4C0F804;
    v265[4] = nullsub_54;
    v265[5] = &unk_1C4CB5C62;
    long long v266 = xmmword_1C4C3B320;
    uint64_t v259 = 0;
    v260 = &v259;
    uint64_t v261 = 0x3032000000;
    v262 = sub_1C4C089AC;
    v263 = sub_1C4C089BC;
    id v264 = 0;
    v122 = objc_msgSend_transcriptionPaths(v12, v117, v118, v119, v120, v121);
    v128 = objc_msgSend_firstObject(v122, v123, v124, v125, v126, v127);
    v134 = objc_msgSend_tokenColumns(v12, v129, v130, v131, v132, v133);
    uint64_t v140 = objc_msgSend_count(v134, v135, v136, v137, v138, v139);
    v248[0] = MEMORY[0x1E4F143A8];
    v248[1] = 3221225472;
    v248[2] = sub_1C4C0F814;
    v248[3] = &unk_1E64E50E8;
    v253 = v273;
    v254 = buf;
    v255 = &v269;
    id v249 = v243;
    v256 = &v259;
    v257 = v267;
    id v250 = v21;
    v251 = self;
    id v238 = v236;
    id v252 = v238;
    v258 = v265;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v12, v141, (uint64_t)v128, 0, v140, (uint64_t)v248);

    sub_1C4C0ECCC((uint64_t)self, (void *)v260[5]);
    objc_msgSend_addObject_(v238, v142, v260[5], v143, v144, v145);
    objc_msgSend_addObject_(v241, v146, (uint64_t)v238, v147, v148, v149);
    v155 = objc_msgSend_transcriptionPathScores(v12, v150, v151, v152, v153, v154);
    v161 = objc_msgSend_firstObject(v155, v156, v157, v158, v159, v160);
    objc_msgSend_addObject_(v240, v162, (uint64_t)v161, v163, v164, v165);

    for (unint64_t j = 1; ; ++j)
    {
      v172 = objc_msgSend_transcriptionPaths(v12, v166, v167, v168, v169, v170);
      BOOL v178 = j < objc_msgSend_count(v172, v173, v174, v175, v176, v177);

      if (!v178) {
        break;
      }
      v184 = objc_msgSend_transcriptionPaths(v12, v179, v180, v181, v182, v183);
      v189 = objc_msgSend_objectAtIndex_(v184, v185, j, v186, v187, v188);

      v195 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v190, v191, v192, v193, v194);
      v201 = objc_msgSend_tokenColumns(v12, v196, v197, v198, v199, v200);
      uint64_t v207 = objc_msgSend_count(v201, v202, v203, v204, v205, v206);
      v245[0] = MEMORY[0x1E4F143A8];
      v245[1] = 3221225472;
      v245[2] = sub_1C4C0FAFC;
      v245[3] = &unk_1E64E3810;
      id v246 = v244;
      id v208 = v195;
      id v247 = v208;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v12, v209, (uint64_t)v189, 0, v207, (uint64_t)v245);

      objc_msgSend_addObject_(v241, v210, (uint64_t)v208, v211, v212, v213);
      v219 = objc_msgSend_transcriptionPathScores(v12, v214, v215, v216, v217, v218);
      v224 = objc_msgSend_objectAtIndex_(v219, v220, j, v221, v222, v223);
      objc_msgSend_addObject_(v240, v225, (uint64_t)v224, v226, v227, v228);
    }
    v229 = objc_msgSend_result(v239, v179, v180, v181, v182, v183);
    v233 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v229, v230, (uint64_t)v241, (uint64_t)v240, v231, v232);
    if (v239) {
      objc_storeStrong(v239 + 3, v233);
    }

    _Block_object_dispose(&v259, 8);
    _Block_object_dispose(v265, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v267, 8);

    _Block_object_dispose(&v269, 8);
    _Block_object_dispose(v273, 8);
  }
  v234 = v239;

  return v234;
}

- (void)dealloc
{
  if (self->_wordLanguageModel) {
    LMLanguageModelRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)CHSemanticTokenizerStep;
  [(CHSemanticTokenizerStep *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end