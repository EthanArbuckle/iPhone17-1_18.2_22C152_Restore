@interface CHReorderSCTCConfusionStep
- (CHReorderSCTCConfusionStep)initWithMaxResultCount:(int64_t)a3;
- (id)process:(id)a3 options:(id)a4;
- (void)dealloc;
@end

@implementation CHReorderSCTCConfusionStep

- (CHReorderSCTCConfusionStep)initWithMaxResultCount:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CHReorderSCTCConfusionStep;
  v4 = [(CHReorderSCTCConfusionStep *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxResultCount = a3;
    long long v8 = *(_OWORD *)"T";
    v9[0] = *(_OWORD *)L"nal-Simplified";
    *(_OWORD *)((char *)v9 + 14) = *(_OWORD *)L"plified";
    v4->_icuTransliterator = (void **)utrans_openU();
  }
  return v5;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v408 = *MEMORY[0x1E4F143B8];
  v382 = (id *)a3;
  id v375 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHReorderSCTCConfusionStep is running", buf, 2u);
  }

  int64_t maxResultCount = self->_maxResultCount;
  v13 = objc_msgSend_result(v382, v8, v9, v10, v11, v12);
  v19 = objc_msgSend_transcriptionPaths(v13, v14, v15, v16, v17, v18);
  int64_t v380 = maxResultCount;
  LOBYTE(maxResultCount) = (unint64_t)objc_msgSend_count(v19, v20, v21, v22, v23, v24) < 2;

  if ((maxResultCount & 1) == 0)
  {
    v377 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
    v376 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v30, v31, v32, v33, v34);
    v40 = objc_msgSend_result(v382, v35, v36, v37, v38, v39);
    v46 = objc_msgSend_transcriptionPaths(v40, v41, v42, v43, v44, v45);
    v374 = objc_msgSend_objectAtIndexedSubscript_(v46, v47, 0, v48, v49, v50);

    v56 = objc_msgSend_result(v382, v51, v52, v53, v54, v55);
    v62 = objc_msgSend_transcriptionPaths(v56, v57, v58, v59, v60, v61);
    v373 = objc_msgSend_objectAtIndexedSubscript_(v62, v63, 1, v64, v65, v66);

    v72 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v67, v68, v69, v70, v71);
    v371 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v73, v74, v75, v76, v77, v72);
    v83 = objc_msgSend_result(v382, v78, v79, v80, v81, v82);
    v89 = objc_msgSend_result(v382, v84, v85, v86, v87, v88);
    uint64_t v95 = objc_msgSend_tokenColumnCount(v89, v90, v91, v92, v93, v94);
    v400[0] = MEMORY[0x1E4F143A8];
    v400[1] = 3221225472;
    v400[2] = sub_1C4C1DB04;
    v400[3] = &unk_1E64E52F0;
    id v96 = v72;
    id v401 = v96;
    v402 = self;
    id v97 = v371;
    id v403 = v97;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v83, v98, (uint64_t)v374, 0, v95, (uint64_t)v400);

    v372 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v99, v100, v101, v102, v103);
    v109 = objc_msgSend_result(v382, v104, v105, v106, v107, v108);
    v115 = objc_msgSend_result(v382, v110, v111, v112, v113, v114);
    uint64_t v121 = objc_msgSend_tokenColumnCount(v115, v116, v117, v118, v119, v120);
    v398[0] = MEMORY[0x1E4F143A8];
    v398[1] = 3221225472;
    v398[2] = sub_1C4C1DDB4;
    v398[3] = &unk_1E64E3150;
    id v122 = v372;
    id v399 = v122;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v109, v123, (uint64_t)v373, 0, v121, (uint64_t)v398);

    v129 = objc_msgSend_string(MEMORY[0x1E4F28E78], v124, v125, v126, v127, v128);
    long long v396 = 0u;
    long long v397 = 0u;
    long long v394 = 0u;
    long long v395 = 0u;
    id v130 = v97;
    uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v131, (uint64_t)&v394, (uint64_t)v407, 16, v132);
    if (v138)
    {
      uint64_t v139 = *(void *)v395;
      do
      {
        for (uint64_t i = 0; i != v138; ++i)
        {
          if (*(void *)v395 != v139) {
            objc_enumerationMutation(v130);
          }
          v141 = objc_msgSend_string(*(void **)(*((void *)&v394 + 1) + 8 * i), v133, v134, v135, v136, v137);
          objc_msgSend_appendString_(v129, v142, (uint64_t)v141, v143, v144, v145);
        }
        uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v133, (uint64_t)&v394, (uint64_t)v407, 16, v137);
      }
      while (v138);
    }

    v151 = objc_msgSend_string(MEMORY[0x1E4F28E78], v146, v147, v148, v149, v150);
    long long v392 = 0u;
    long long v393 = 0u;
    long long v390 = 0u;
    long long v391 = 0u;
    id v152 = v96;
    uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v152, v153, (uint64_t)&v390, (uint64_t)v406, 16, v154);
    if (v160)
    {
      uint64_t v161 = *(void *)v391;
      do
      {
        for (uint64_t j = 0; j != v160; ++j)
        {
          if (*(void *)v391 != v161) {
            objc_enumerationMutation(v152);
          }
          v163 = objc_msgSend_string(*(void **)(*((void *)&v390 + 1) + 8 * j), v155, v156, v157, v158, v159);
          objc_msgSend_appendString_(v151, v164, (uint64_t)v163, v165, v166, v167);
        }
        uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v152, v155, (uint64_t)&v390, (uint64_t)v406, 16, v159);
      }
      while (v160);
    }

    v173 = objc_msgSend_string(MEMORY[0x1E4F28E78], v168, v169, v170, v171, v172);
    long long v388 = 0u;
    long long v389 = 0u;
    long long v386 = 0u;
    long long v387 = 0u;
    id v174 = v122;
    uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v175, (uint64_t)&v386, (uint64_t)v405, 16, v176);
    if (v182)
    {
      uint64_t v183 = *(void *)v387;
      do
      {
        for (uint64_t k = 0; k != v182; ++k)
        {
          if (*(void *)v387 != v183) {
            objc_enumerationMutation(v174);
          }
          v185 = objc_msgSend_string(*(void **)(*((void *)&v386 + 1) + 8 * k), v177, v178, v179, v180, v181);
          objc_msgSend_appendString_(v173, v186, (uint64_t)v185, v187, v188, v189);
        }
        uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v177, (uint64_t)&v386, (uint64_t)v405, 16, v181);
      }
      while (v182);
    }

    int isEqual = objc_msgSend_isEqual_(v151, v190, (uint64_t)v173, v191, v192, v193);
    if ((objc_msgSend_isEqual_(v129, v195, (uint64_t)v173, v196, v197, v198) ^ 1 | isEqual))
    {
      objc_msgSend_addObject_(v377, v199, (uint64_t)v152, v200, v201, v202);
      v208 = objc_msgSend_result(v382, v203, v204, v205, v206, v207);
      v378 = objc_msgSend_transcriptionPathScores(v208, v209, v210, v211, v212, v213);
      v218 = objc_msgSend_objectAtIndexedSubscript_(v378, v214, 0, v215, v216, v217);
      v224 = objc_msgSend_copy(v218, v219, v220, v221, v222, v223);
      objc_msgSend_addObject_(v376, v225, (uint64_t)v224, v226, v227, v228);
      v229 = v208;
      uint64_t v230 = 1;
    }
    else
    {
      objc_msgSend_addObject_(v377, v199, (uint64_t)v174, v200, v201, v202);
      v236 = objc_msgSend_result(v382, v231, v232, v233, v234, v235);
      v242 = objc_msgSend_transcriptionPathScores(v236, v237, v238, v239, v240, v241);
      v247 = objc_msgSend_objectAtIndexedSubscript_(v242, v243, 1, v244, v245, v246);
      v253 = objc_msgSend_copy(v247, v248, v249, v250, v251, v252);
      objc_msgSend_addObject_(v376, v254, (uint64_t)v253, v255, v256, v257);

      objc_msgSend_addObject_(v377, v258, (uint64_t)v152, v259, v260, v261);
      v267 = objc_msgSend_result(v382, v262, v263, v264, v265, v266);
      v378 = objc_msgSend_transcriptionPathScores(v267, v268, v269, v270, v271, v272);
      v218 = objc_msgSend_objectAtIndexedSubscript_(v378, v273, 0, v274, v275, v276);
      v224 = objc_msgSend_copy(v218, v277, v278, v279, v280, v281);
      objc_msgSend_addObject_(v376, v282, (uint64_t)v224, v283, v284, v285);
      v229 = v267;
      uint64_t v230 = 2;
    }
    unint64_t v383 = v230;

    if (v380 != 1)
    {
      while (1)
      {
        v297 = objc_msgSend_result(v382, v286, v287, v288, v289, v290);
        v303 = objc_msgSend_transcriptionPaths(v297, v298, v299, v300, v301, v302);
        BOOL v309 = v383 < objc_msgSend_count(v303, v304, v305, v306, v307, v308);

        if (!v309) {
          break;
        }
        v310 = objc_msgSend_result(v382, v286, v287, v288, v289, v290);
        v316 = objc_msgSend_transcriptionPaths(v310, v311, v312, v313, v314, v315);
        v381 = objc_msgSend_objectAtIndexedSubscript_(v316, v317, v383, v318, v319, v320);

        v379 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v321, v322, v323, v324, v325);
        v331 = objc_msgSend_result(v382, v326, v327, v328, v329, v330);
        v337 = objc_msgSend_result(v382, v332, v333, v334, v335, v336);
        uint64_t v343 = objc_msgSend_tokenColumnCount(v337, v338, v339, v340, v341, v342);
        v384[0] = MEMORY[0x1E4F143A8];
        v384[1] = 3221225472;
        v384[2] = sub_1C4C1DDC0;
        v384[3] = &unk_1E64E3150;
        id v344 = v379;
        id v385 = v344;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v331, v345, (uint64_t)v381, 0, v343, (uint64_t)v384);

        objc_msgSend_addObject_(v377, v346, (uint64_t)v344, v347, v348, v349);
        v355 = objc_msgSend_result(v382, v350, v351, v352, v353, v354);
        v361 = objc_msgSend_transcriptionPathScores(v355, v356, v357, v358, v359, v360);
        v366 = objc_msgSend_objectAtIndexedSubscript_(v361, v362, v383, v363, v364, v365);
        objc_msgSend_addObject_(v376, v367, (uint64_t)v366, v368, v369, v370);

        ++v383;
      }
    }
    v291 = objc_msgSend_result(v382, v286, v287, v288, v289, v290);
    v295 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v291, v292, (uint64_t)v377, (uint64_t)v376, v293, v294);
    if (v382) {
      objc_storeStrong(v382 + 3, v295);
    }
  }
  return v382;
}

- (void)dealloc
{
  if (self->_icuTransliterator)
  {
    utrans_close();
    self->_icuTransliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CHReorderSCTCConfusionStep;
  [(CHReorderSCTCConfusionStep *)&v3 dealloc];
}

@end