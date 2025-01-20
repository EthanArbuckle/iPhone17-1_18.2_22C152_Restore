@interface CHCyrillicRecoverConfusableWordsStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHCyrillicRecoverConfusableWordsStep

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v550 = *MEMORY[0x1E4F143B8];
  v520 = (id *)a3;
  id v510 = a4;
  v515 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  v514 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  objc_msgSend_leftContext(v520, v15, v16, v17, v18, v19);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v511 = lastWordInString(v20);

  uint64_t v545 = 0;
  v546 = &v545;
  uint64_t v547 = 0x2020000000;
  uint64_t v548 = 0;
  uint64_t v541 = 0;
  v542 = &v541;
  uint64_t v543 = 0x2020000000;
  uint64_t v544 = 0;
  v26 = objc_msgSend_leftContext(v520, v21, v22, v23, v24, v25);
  v32 = objc_msgSend_leftContext(v520, v27, v28, v29, v30, v31);
  uint64_t v38 = objc_msgSend_length(v32, v33, v34, v35, v36, v37);
  v540[0] = MEMORY[0x1E4F143A8];
  v540[1] = 3221225472;
  v540[2] = sub_1C4C25720;
  v540[3] = &unk_1E64E53B8;
  v540[4] = self;
  v540[5] = &v545;
  v540[6] = &v541;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v26, v39, 0, v38, 3, (uint64_t)v540);

  v518 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v40, v41, v42, v43, v44);
  unint64_t v50 = 0;
  uint64_t v516 = 0;
  uint64_t v517 = 0;
  while (1)
  {
    v51 = objc_msgSend_result(v520, v45, v46, v47, v48, v49);
    BOOL v57 = v50 < objc_msgSend_tokenColumnCount(v51, v52, v53, v54, v55, v56);

    if (!v57) {
      break;
    }
    v63 = objc_msgSend_result(v520, v58, v59, v60, v61, v62);
    v69 = objc_msgSend_result(v520, v64, v65, v66, v67, v68);
    v75 = objc_msgSend_transcriptionPaths(v69, v70, v71, v72, v73, v74);
    v80 = objc_msgSend_objectAtIndexedSubscript_(v75, v76, 0, v77, v78, v79);
    v84 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v63, v81, (uint64_t)v80, v50, v82, v83);

    objc_msgSend_addObject_(v518, v85, (uint64_t)v84, v86, v87, v88);
    __int16 v539 = 0;
    sub_1C4C24160((uint64_t)self, v84, (unsigned char *)&v539 + 1, &v539);
    uint64_t v89 = v539;
    uint64_t v90 = HIBYTE(v539);

    v516 += v89;
    v517 += v90;
    ++v50;
  }
  v512 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v58, v59, v60, v61, v62);
  v513 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v91, v92, v93, v94, v95);
  unint64_t v519 = 0;
  objc_msgSend_result(v520, v96, v97, v98, v99, v100);
  while (1)
    v101 = {;
    BOOL v107 = v519 < objc_msgSend_tokenColumnCount(v101, v102, v103, v104, v105, v106);

    if (!v107) {
      break;
    }
    v112 = objc_msgSend_objectAtIndexedSubscript_(v518, v108, v519, v109, v110, v111);
    __int16 v539 = 0;
    sub_1C4C24160((uint64_t)self, v112, (unsigned char *)&v539 + 1, &v539);
    uint64_t v118 = objc_msgSend_count(v112, v113, v114, v115, v116, v117);
    v123 = objc_msgSend_objectAtIndexedSubscript_(v112, v119, 0, v120, v121, v122);
    v526 = v112;
    v129 = objc_msgSend_string(v123, v124, v125, v126, v127, v128);
    unint64_t v135 = objc_msgSend_length(v129, v130, v131, v132, v133, v134);
    BOOL v136 = v118 != 1;

    char v141 = v135 > 6 || v136;
    if ((v141 & 1) != 0 || v539 == HIBYTE(v539))
    {
      v149 = v526;
      objc_msgSend_addObjectsFromArray_(v512, v137, (uint64_t)v526, v138, v139, v140);
      objc_msgSend_addObjectsFromArray_(v513, v150, (uint64_t)v526, v151, v152, v153);
      goto LABEL_87;
    }
    __int16 v538 = 0;
    v142 = v526;
    if (v519)
    {
      v143 = objc_msgSend_objectAtIndexedSubscript_(v518, v137, v519 - 1, v138, v139, v140);
      sub_1C4C24160((uint64_t)self, v143, (unsigned char *)&v538 + 1, &v538);

      v142 = v526;
    }
    else
    {
      sub_1C4C243F4((uint64_t)self, v511, (unsigned char *)&v538 + 1, &v538);
    }
    BOOL v154 = 0;
    BOOL v156 = HIBYTE(v539) == HIBYTE(v538) && v539 == v538;
    if (HIBYTE(v538) | v538 && !v156)
    {
      v157 = objc_msgSend_firstObject(v142, v144, v145, v146, v147, v148);
      BOOL v154 = (objc_msgSend_properties(v157, v158, v159, v160, v161, v162) & 0x20) == 0;

      v142 = v526;
    }
    __int16 v537 = 0;
    if (v519 < objc_msgSend_count(v518, v144, v145, v146, v147, v148) - 1)
    {
      v167 = objc_msgSend_objectAtIndexedSubscript_(v518, v163, v519 + 1, v164, v165, v166);
      sub_1C4C24160((uint64_t)self, v167, (unsigned char *)&v537 + 1, &v537);

      v142 = v526;
    }
    int v168 = v539;
    if (v156 || HIBYTE(v539) == HIBYTE(v537) && v539 == v537)
    {
      BOOL v169 = 0;
      if (!(_BYTE)v539) {
        goto LABEL_33;
      }
    }
    else
    {
      v172 = objc_msgSend_objectAtIndexedSubscript_(v142, v163, 0, v164, v165, v166);
      v178 = objc_msgSend_string(v172, v173, v174, v175, v176, v177);
      BOOL v169 = (unint64_t)objc_msgSend_length(v178, v179, v180, v181, v182, v183) < 3;

      int v168 = v539;
      if (!(_BYTE)v539)
      {
LABEL_33:
        int v170 = HIBYTE(v539);
        goto LABEL_34;
      }
    }
    int v170 = HIBYTE(v539);
    if (HIBYTE(v538) | HIBYTE(v537))
    {
      BOOL v171 = 1;
      goto LABEL_36;
    }
LABEL_34:
    if (v170)
    {
      BOOL v171 = (v538 | v537) != 0;
      if (!v168) {
        goto LABEL_38;
      }
    }
    else
    {
      BOOL v171 = 0;
      if (!v168)
      {
LABEL_38:
        uint64_t v184 = v517;
        unint64_t v185 = v546[3] + v516;
        v186 = v542;
        goto LABEL_39;
      }
    }
LABEL_36:
    uint64_t v184 = v516;
    unint64_t v185 = v542[3] + v517;
    v186 = v546;
LABEL_39:
    BOOL v187 = (double)v185 / (double)(unint64_t)(v186[3] + v184) > 1.0 && v171;
    if (v170)
    {
      v188 = objc_msgSend_objectAtIndexedSubscript_(v526, v163, 0, v164, v165, v166);
      v194 = objc_msgSend_string(v188, v189, v190, v191, v192, v193);
      objc_msgSend_transformLatinToCyrillic_(CHLanguageUtilities, v195, (uint64_t)v194, v196, v197, v198);
    }
    else
    {
      v188 = objc_msgSend_objectAtIndexedSubscript_(v526, v163, 0, v164, v165, v166);
      v194 = objc_msgSend_string(v188, v199, v200, v201, v202, v203);
      objc_msgSend_transformCyrillicToLatin_(CHLanguageUtilities, v204, (uint64_t)v194, v205, v206, v207);
    v525 = };

    v527 = objc_msgSend_objectAtIndexedSubscript_(v526, v208, 0, v209, v210, v211);
    v217 = objc_msgSend_result(v520, v212, v213, v214, v215, v216);
    v222 = objc_msgSend_tokenRowsAtColumnIndex_(v217, v218, v519, v219, v220, v221);

    long long v535 = 0u;
    long long v536 = 0u;
    long long v533 = 0u;
    long long v534 = 0u;
    obunint64_t j = v222;
    uint64_t v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v223, (uint64_t)&v533, (uint64_t)v549, 16, v224);
    if (!v230)
    {

      goto LABEL_85;
    }
    uint64_t v529 = *(void *)v534;
    char v523 = 0;
    int v524 = v169 || v154;
    int v522 = v187 || v154;
    double v231 = -1.0;
    do
    {
      for (uint64_t i = 0; i != v230; ++i)
      {
        if (*(void *)v534 != v529) {
          objc_enumerationMutation(obj);
        }
        v233 = *(void **)(*((void *)&v533 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend_count(v233, v225, v226, v227, v228, v229) <= 1)
        {
          v234 = objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229);
          v240 = objc_msgSend_string(v234, v235, v236, v237, v238, v239);
          if ((unint64_t)objc_msgSend_length(v240, v241, v242, v243, v244, v245) >= 7)
          {

LABEL_55:
            continue;
          }
          v250 = objc_msgSend_objectAtIndexedSubscript_(v233, v246, 0, v247, v248, v249);
          v256 = objc_msgSend_string(v250, v251, v252, v253, v254, v255);
          v261 = objc_msgSend_objectAtIndexedSubscript_(v526, v257, 0, v258, v259, v260);
          v267 = objc_msgSend_string(v261, v262, v263, v264, v265, v266);
          char isEqualToString = objc_msgSend_isEqualToString_(v256, v268, (uint64_t)v267, v269, v270, v271);

          if ((isEqualToString & 1) == 0)
          {
            v273 = objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229);
            v279 = objc_msgSend_string(v273, v274, v275, v276, v277, v278);
            BOOL v285 = objc_msgSend_length(v279, v280, v281, v282, v283, v284) == 1;

            if ((v285 & v524) != 1) {
              goto LABEL_74;
            }
            __int16 v532 = 0;
            sub_1C4C24160((uint64_t)self, v233, (unsigned char *)&v532 + 1, &v532);
            BOOL v291 = HIBYTE(v532) == HIBYTE(v538) && v532 == v538;
            if (HIBYTE(v532) == HIBYTE(v537) && v532 == v537) {
              BOOL v291 = 1;
            }
            if (HIBYTE(v532) | v532
              && v291
              && (objc_msgSend_objectAtIndexedSubscript_(v233, v286, 0, v287, v288, v289),
                  v293 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_recognitionScore(v293, v294, v295, v296, v297, v298),
                  BOOL v300 = v299 > v231,
                  v293,
                  v300))
            {
              v301 = objc_msgSend_objectAtIndexedSubscript_(v233, v286, 0, v287, v288, v289);

              v306 = objc_msgSend_objectAtIndexedSubscript_(v233, v302, 0, v303, v304, v305);
              objc_msgSend_recognitionScore(v306, v307, v308, v309, v310, v311);
              double v231 = v312;

              char v523 = 1;
            }
            else
            {
LABEL_74:
              v301 = v527;
            }
            v313 = objc_msgSend_objectAtIndexedSubscript_(v233, v286, 0, v287, v288, v289);
            v319 = objc_msgSend_string(v313, v314, v315, v316, v317, v318);
            int v324 = objc_msgSend_containsObject_(v525, v320, (uint64_t)v319, v321, v322, v323);

            if (!v324
              || ((objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229),
                   v325 = objc_claimAutoreleasedReturnValue(),
                   objc_msgSend_recognitionScore(v325, v326, v327, v328, v329, v330),
                   ((v331 > v231) & v523) == 0)
                ? (BOOL v332 = v331 > v231)
                : (BOOL v332 = v522),
                  v325,
                  !v332))
            {
              v527 = v301;
              continue;
            }
            v527 = objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229);

            v234 = objc_msgSend_objectAtIndexedSubscript_(v233, v333, 0, v334, v335, v336);
            objc_msgSend_recognitionScore(v234, v337, v338, v339, v340, v341);
            double v231 = v342;
            char v523 = v522;
            goto LABEL_55;
          }
        }
      }
      uint64_t v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v225, (uint64_t)&v533, (uint64_t)v549, 16, v229);
    }
    while (v230);

    if (v523)
    {
      objc_msgSend_addObject_(v512, v343, (uint64_t)v527, v344, v345, v346);
      v351 = objc_msgSend_objectAtIndexedSubscript_(v526, v347, 0, v348, v349, v350);
      objc_msgSend_addObject_(v513, v352, (uint64_t)v351, v353, v354, v355);

      goto LABEL_86;
    }
LABEL_85:
    v356 = objc_msgSend_objectAtIndexedSubscript_(v526, v343, 0, v344, v345, v346);
    objc_msgSend_addObject_(v512, v357, (uint64_t)v356, v358, v359, v360);

    objc_msgSend_addObject_(v513, v361, (uint64_t)v527, v362, v363, v364);
LABEL_86:

    v149 = v526;
LABEL_87:

    ++v519;
    objc_msgSend_result(v520, v365, v366, v367, v368, v369);
  }
  if ((objc_msgSend_isEqual_(v512, v108, (uint64_t)v513, v109, v110, v111) & 1) == 0)
  {
    objc_msgSend_addObject_(v515, v370, (uint64_t)v512, v371, v372, v373);
    v379 = objc_msgSend_result(v520, v374, v375, v376, v377, v378);
    v385 = objc_msgSend_transcriptionPathScores(v379, v380, v381, v382, v383, v384);
    v390 = objc_msgSend_objectAtIndexedSubscript_(v385, v386, 0, v387, v388, v389);
    objc_msgSend_addObject_(v514, v391, (uint64_t)v390, v392, v393, v394);
  }
  objc_msgSend_addObject_(v515, v370, (uint64_t)v513, v371, v372, v373);
  v400 = objc_msgSend_result(v520, v395, v396, v397, v398, v399);
  v406 = objc_msgSend_transcriptionPathScores(v400, v401, v402, v403, v404, v405);
  v411 = objc_msgSend_objectAtIndexedSubscript_(v406, v407, 0, v408, v409, v410);
  objc_msgSend_addObject_(v514, v412, (uint64_t)v411, v413, v414, v415);

  for (unint64_t j = 1; ; ++j)
  {
    v422 = objc_msgSend_result(v520, v416, v417, v418, v419, v420);
    v428 = objc_msgSend_transcriptionPaths(v422, v423, v424, v425, v426, v427);
    BOOL v434 = j < objc_msgSend_count(v428, v429, v430, v431, v432, v433);

    if (!v434) {
      break;
    }
    v440 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v435, v436, v437, v438, v439);
    v446 = objc_msgSend_result(v520, v441, v442, v443, v444, v445);
    v452 = objc_msgSend_result(v520, v447, v448, v449, v450, v451);
    v458 = objc_msgSend_transcriptionPaths(v452, v453, v454, v455, v456, v457);
    v463 = objc_msgSend_objectAtIndexedSubscript_(v458, v459, j, v460, v461, v462);
    v469 = objc_msgSend_result(v520, v464, v465, v466, v467, v468);
    uint64_t v475 = objc_msgSend_tokenColumnCount(v469, v470, v471, v472, v473, v474);
    v530[0] = MEMORY[0x1E4F143A8];
    v530[1] = 3221225472;
    v530[2] = sub_1C4C25794;
    v530[3] = &unk_1E64E3150;
    id v476 = v440;
    id v531 = v476;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v446, v477, (uint64_t)v463, 0, v475, (uint64_t)v530);

    objc_msgSend_addObject_(v515, v478, (uint64_t)v476, v479, v480, v481);
    v487 = objc_msgSend_result(v520, v482, v483, v484, v485, v486);
    v493 = objc_msgSend_transcriptionPathScores(v487, v488, v489, v490, v491, v492);
    v498 = objc_msgSend_objectAtIndexedSubscript_(v493, v494, j, v495, v496, v497);
    objc_msgSend_addObject_(v514, v499, (uint64_t)v498, v500, v501, v502);
  }
  v503 = objc_msgSend_result(v520, v435, v436, v437, v438, v439);
  v507 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v503, v504, (uint64_t)v515, (uint64_t)v514, v505, v506);
  if (v520) {
    objc_storeStrong(v520 + 3, v507);
  }

  v508 = v520;
  _Block_object_dispose(&v541, 8);
  _Block_object_dispose(&v545, 8);

  return v508;
}

@end