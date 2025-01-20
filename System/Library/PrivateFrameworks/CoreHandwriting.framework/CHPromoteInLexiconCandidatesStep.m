@interface CHPromoteInLexiconCandidatesStep
- (CHPromoteInLexiconCandidatesStep)initWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHPromoteInLexiconCandidatesStep

- (CHPromoteInLexiconCandidatesStep)initWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHPromoteInLexiconCandidatesStep;
  result = [(CHPromoteInLexiconCandidatesStep *)&v7 init];
  if (result)
  {
    result->_staticLexicon = a3;
    result->_customLexicon = a4;
  }
  return result;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v373 = *MEMORY[0x1E4F143B8];
  v366 = (id *)a3;
  id v357 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHPromoteInLexiconCandidatesStep is running", buf, 2u);
  }

  v360 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  v359 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  v21 = objc_msgSend_result(v366, v16, v17, v18, v19, v20);
  v27 = objc_msgSend_transcriptionPaths(v21, v22, v23, v24, v25, v26);
  v362 = objc_msgSend_firstObject(v27, v28, v29, v30, v31, v32);

  v363 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v33, v34, v35, v36, v37);
  unint64_t v43 = 0;
  char v358 = 0;
  while (1)
  {
    v44 = objc_msgSend_result(v366, v38, v39, v40, v41, v42);
    uint64_t v365 = v43;
    BOOL v50 = v43 < objc_msgSend_tokenColumnCount(v44, v45, v46, v47, v48, v49);

    if (!v50) {
      break;
    }
    uint64_t v55 = objc_msgSend_indexAtPosition_(v362, v51, v365, v52, v53, v54);
    v61 = objc_msgSend_result(v366, v56, v57, v58, v59, v60);
    v66 = objc_msgSend_tokenRowsAtColumnIndex_(v61, v62, v365, v63, v64, v65);

    v71 = objc_msgSend_objectAtIndexedSubscript_(v66, v67, v55, v68, v69, v70);
    uint64_t v77 = objc_msgSend_count(v71, v72, v73, v74, v75, v76);

    unint64_t v83 = objc_msgSend_count(v66, v78, v79, v80, v81, v82);
    if (v77 != 1 || v83 < 2) {
      goto LABEL_38;
    }
    v88 = objc_msgSend_objectAtIndexedSubscript_(v66, v84, v55, v85, v86, v87);
    v93 = objc_msgSend_objectAtIndexedSubscript_(v88, v89, 0, v90, v91, v92);
    v99 = objc_msgSend_string(v93, v94, v95, v96, v97, v98);

    if (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v100, (uint64_t)v99, (uint64_t)self->_staticLexicon, 0, v101))char HasMatchingString = 1; {
    else
    }
      char HasMatchingString = objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v102, (uint64_t)v99, (uint64_t)self->_customLexicon, 0, v105);
    v107 = objc_msgSend_objectAtIndexedSubscript_(v66, v102, v55, v103, v104, v105);
    v112 = objc_msgSend_objectAtIndexedSubscript_(v107, v108, 0, v109, v110, v111);
    char v118 = objc_msgSend_inputSources(v112, v113, v114, v115, v116, v117);

    if ((HasMatchingString & 1) != 0 || (unint64_t)objc_msgSend_length(v99, v119, v120, v121, v122, v123) < 3)
    {

LABEL_38:
      uint64_t v237 = v55;
      goto LABEL_39;
    }

    if ((v118 & 0x10) != 0) {
      goto LABEL_38;
    }
    unint64_t v125 = 0;
    double v126 = 0.25;
    uint64_t v361 = 0x7FFFFFFFFFFFFFFFLL;
    while (v125 < objc_msgSend_count(v66, v84, v124, v85, v86, v87))
    {
      v127 = objc_msgSend_objectAtIndexedSubscript_(v66, v84, v125, v85, v86, v87);
      BOOL v134 = objc_msgSend_count(v127, v128, v129, v130, v131, v132) == 1 && v55 != v125;

      if (v134)
      {
        v135 = objc_msgSend_objectAtIndexedSubscript_(v66, v84, v125, v85, v86, v87);
        v140 = objc_msgSend_objectAtIndexedSubscript_(v135, v136, 0, v137, v138, v139);
        v146 = objc_msgSend_string(v140, v141, v142, v143, v144, v145);
        if (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v147, (uint64_t)v146, (uint64_t)self->_staticLexicon, 0, v148))
        {
          int v153 = 1;
        }
        else
        {
          v154 = objc_msgSend_objectAtIndexedSubscript_(v66, v149, v125, v150, v151, v152);
          v159 = objc_msgSend_objectAtIndexedSubscript_(v154, v155, 0, v156, v157, v158);
          v165 = objc_msgSend_string(v159, v160, v161, v162, v163, v164);
          int v153 = objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v166, (uint64_t)v165, (uint64_t)self->_customLexicon, 0, v167);
        }
        v172 = objc_msgSend_objectAtIndexedSubscript_(v66, v168, v55, v169, v170, v171);
        v177 = objc_msgSend_objectAtIndexedSubscript_(v172, v173, 0, v174, v175, v176);
        objc_msgSend_recognitionScore(v177, v178, v179, v180, v181, v182);
        double v184 = v183;
        v189 = objc_msgSend_objectAtIndexedSubscript_(v66, v185, v125, v186, v187, v188);
        v194 = objc_msgSend_objectAtIndexedSubscript_(v189, v190, 0, v191, v192, v193);
        objc_msgSend_recognitionScore(v194, v195, v196, v197, v198, v199);
        double v201 = v200;

        double v202 = v184 - v201;
        int v203 = v202 < v126 ? v153 : 0;
        if (v203 == 1)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v204 = (id)qword_1EA3C9F98;
          if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG))
          {
            v209 = objc_msgSend_objectAtIndexedSubscript_(v66, v205, v125, v206, v207, v208);
            v214 = objc_msgSend_objectAtIndexedSubscript_(v209, v210, 0, v211, v212, v213);
            v220 = objc_msgSend_string(v214, v215, v216, v217, v218, v219);
            v225 = objc_msgSend_objectAtIndexedSubscript_(v66, v221, v55, v222, v223, v224);
            v230 = objc_msgSend_objectAtIndexedSubscript_(v225, v226, 0, v227, v228, v229);
            v236 = objc_msgSend_string(v230, v231, v232, v233, v234, v235);
            *(_DWORD *)buf = 138412546;
            v370 = v220;
            __int16 v371 = 2112;
            v372 = v236;
            _os_log_impl(&dword_1C492D000, v204, OS_LOG_TYPE_DEBUG, "CHPromoteInLexiconCandidatesStep promoting %@ over %@", buf, 0x16u);
          }
          char v358 = 1;
          uint64_t v361 = v125;
          double v126 = v202;
        }
      }
      ++v125;
    }
    uint64_t v237 = v361;
    if (v361 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_38;
    }
LABEL_39:
    v238 = objc_msgSend_objectAtIndexedSubscript_(v66, v84, v237, v85, v86, v87);
    objc_msgSend_addObjectsFromArray_(v363, v239, (uint64_t)v238, v240, v241, v242);

    unint64_t v43 = v365 + 1;
  }
  if (v358)
  {
    objc_msgSend_addObject_(v360, v51, (uint64_t)v363, v52, v53, v54);
    v248 = objc_msgSend_result(v366, v243, v244, v245, v246, v247);
    v254 = objc_msgSend_transcriptionPathScores(v248, v249, v250, v251, v252, v253);
    v259 = objc_msgSend_objectAtIndexedSubscript_(v254, v255, 0, v256, v257, v258);
    objc_msgSend_addObject_(v359, v260, (uint64_t)v259, v261, v262, v263);

    for (unint64_t i = 0; ; ++i)
    {
      v270 = objc_msgSend_result(v366, v264, v265, v266, v267, v268);
      v276 = objc_msgSend_transcriptionPaths(v270, v271, v272, v273, v274, v275);
      BOOL v282 = i < objc_msgSend_count(v276, v277, v278, v279, v280, v281);

      if (!v282) {
        break;
      }
      v288 = objc_msgSend_result(v366, v283, v284, v285, v286, v287);
      v294 = objc_msgSend_transcriptionPaths(v288, v289, v290, v291, v292, v293);
      v299 = objc_msgSend_objectAtIndexedSubscript_(v294, v295, i, v296, v297, v298);

      v305 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v300, v301, v302, v303, v304);
      v311 = objc_msgSend_result(v366, v306, v307, v308, v309, v310);
      v317 = objc_msgSend_result(v366, v312, v313, v314, v315, v316);
      uint64_t v323 = objc_msgSend_tokenColumnCount(v317, v318, v319, v320, v321, v322);
      v367[0] = MEMORY[0x1E4F143A8];
      v367[1] = 3221225472;
      v367[2] = sub_1C4C0BAD8;
      v367[3] = &unk_1E64E3150;
      id v324 = v305;
      id v368 = v324;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v311, v325, (uint64_t)v299, 0, v323, (uint64_t)v367);

      objc_msgSend_addObject_(v360, v326, (uint64_t)v324, v327, v328, v329);
      v335 = objc_msgSend_result(v366, v330, v331, v332, v333, v334);
      v341 = objc_msgSend_transcriptionPathScores(v335, v336, v337, v338, v339, v340);
      v346 = objc_msgSend_objectAtIndexedSubscript_(v341, v342, i, v343, v344, v345);
      objc_msgSend_addObject_(v359, v347, (uint64_t)v346, v348, v349, v350);
    }
    v351 = objc_msgSend_result(v366, v283, v284, v285, v286, v287);
    v355 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v351, v352, (uint64_t)v360, (uint64_t)v359, v353, v354);
    if (v366) {
      objc_storeStrong(v366 + 3, v355);
    }
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v351 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v351, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v351, OS_LOG_TYPE_DEBUG, "CHPromoteInLexiconCandidatesStep did not find any suitable tokens for promotion", buf, 2u);
    }
  }

  return v366;
}

@end