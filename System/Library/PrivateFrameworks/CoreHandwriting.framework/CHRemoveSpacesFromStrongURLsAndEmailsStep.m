@interface CHRemoveSpacesFromStrongURLsAndEmailsStep
- (CHRemoveSpacesFromStrongURLsAndEmailsStep)initWithPatternFst:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveSpacesFromStrongURLsAndEmailsStep

- (CHRemoveSpacesFromStrongURLsAndEmailsStep)initWithPatternFst:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHRemoveSpacesFromStrongURLsAndEmailsStep;
  v6 = [(CHRemoveSpacesFromStrongURLsAndEmailsStep *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_patternFST, a3);
  }

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v553 = *MEMORY[0x1E4F143B8];
  v509 = (id *)a3;
  id v501 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v515 = (uint64_t *)self;
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromStrongURLsAndEmailsStep is running", buf, 2u);
  }

  v503 = objc_msgSend_leftContext(v509, v7, v8, v9, v10, v11);
  if (objc_msgSend_length(v503, v12, v13, v14, v15, v16))
  {
    v22 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v17, v18, v19, v20, v21);
    uint64_t v26 = objc_msgSend_rangeOfCharacterFromSet_options_(v503, v23, (uint64_t)v22, 4, v24, v25);
    uint64_t v28 = v27;

    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v29 = objc_msgSend_substringFromIndex_(v503, v17, v26 + v28, v19, v20, v21);

      v503 = (void *)v29;
    }
  }
  if (objc_msgSend_length(v503, v17, v18, v19, v20, v21))
  {
    v35 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v30, v31, v32, v33, v34);
    v40 = objc_msgSend_stringByTrimmingCharactersInSet_(v503, v36, (uint64_t)v35, v37, v38, v39);

    v46 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v41, v42, v43, v44, v45);
    v51 = objc_msgSend_componentsSeparatedByCharactersInSet_(v40, v47, (uint64_t)v46, v48, v49, v50);

    uint64_t v57 = objc_msgSend_count(v51, v52, v53, v54, v55, v56);
    objc_msgSend_objectAtIndexedSubscript_(v51, v58, v57 - 1, v59, v60, v61);
    v502 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v503 = v40;
  }
  else
  {
    v502 = &stru_1F20141C8;
  }
  v62 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v30, v31, v32, v33, v34);
  v67 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v63, (uint64_t)&stru_1F20141C8, v64, v65, v66);
  uint64_t v68 = *MEMORY[0x1E4F1DB20];
  uint64_t v69 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v70 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v71 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v72 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  v543[0] = *MEMORY[0x1E4F1DAD8];
  v543[1] = v72;
  v543[2] = v543[0];
  v543[3] = v72;
  v543[4] = v543[0];
  v543[5] = v72;
  v543[6] = v543[0];
  v543[7] = v72;
  v543[8] = v543[0];
  v543[9] = v72;
  v543[10] = v543[0];
  v543[11] = v72;
  v543[12] = v543[0];
  v543[13] = v72;
  v543[14] = v543[0];
  v543[15] = v72;
  v504 = objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v73, (uint64_t)v502, (uint64_t)v62, 0, 0, v67, 0, 0.0, 0.0, 0.0, 0.0, 0, v68, v69, v70, v71, v543);

  v505 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v74, v75, v76, v77, v78);
  v506 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v79, v80, v81, v82, v83);
  unint64_t v508 = 0;
  unint64_t v517 = 0;
  char v513 = 0;
  while (1)
  {
    v89 = objc_msgSend_result(v509, v84, v85, v86, v87, v88);
    v95 = objc_msgSend_transcriptionPaths(v89, v90, v91, v92, v93, v94);
    BOOL v101 = v508 < objc_msgSend_count(v95, v96, v97, v98, v99, v100);

    if (!v101) {
      break;
    }
    v107 = objc_msgSend_result(v509, v102, v103, v104, v105, v106);
    v113 = objc_msgSend_transcriptionPaths(v107, v108, v109, v110, v111, v112);
    v510 = objc_msgSend_objectAtIndexedSubscript_(v113, v114, v508, v115, v116, v117);

    v507 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v118, v119, v120, v121, v122);
    objc_msgSend_addObject_(v507, v123, (uint64_t)v504, v124, v125, v126);
    v132 = objc_msgSend_result(v509, v127, v128, v129, v130, v131);
    v138 = objc_msgSend_result(v509, v133, v134, v135, v136, v137);
    v144 = objc_msgSend_tokenColumns(v138, v139, v140, v141, v142, v143);
    uint64_t v150 = objc_msgSend_count(v144, v145, v146, v147, v148, v149);
    v541[0] = MEMORY[0x1E4F143A8];
    v541[1] = 3221225472;
    v541[2] = sub_1C4C12CF0;
    v541[3] = &unk_1E64E3150;
    id v514 = v507;
    id v542 = v514;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v132, v151, (uint64_t)v510, 0, v150, (uint64_t)v541);

    unint64_t v157 = 0;
    int v534 = 0;
    v512 = 0;
    unint64_t v530 = 0;
    NSUInteger range = 0;
    unint64_t v526 = 0x7FFFFFFFFFFFFFFFLL;
    while (v157 < objc_msgSend_count(v514, v152, v153, v154, v155, v156))
    {
      v162 = objc_msgSend_objectAtIndexedSubscript_(v514, v158, v157, v159, v160, v161);
      v168 = objc_msgSend_string(v162, v163, v164, v165, v166, v167);
      unint64_t v532 = v157;
      v528 = objc_msgSend_lowercaseString(v168, v169, v170, v171, v172, v173);

      v176 = objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v174, 11, v515[1], 0, v175);
      uint64_t v179 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v177, (uint64_t)v528, (uint64_t)v176, v515[1], v178);

      v182 = objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v180, 12, v515[1], 0, v181);
      v185 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v183, (uint64_t)v528, (uint64_t)v182, v515[1], v184);

      v188 = objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v186, 13, v515[1], 0, v187);
      uint64_t v191 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v189, (uint64_t)v528, (uint64_t)v188, v515[1], v190);

      unsigned int isString_fullPattern_inNetwork = v191 != 0;
      if (!(v179 | v191))
      {

        break;
      }
      *(void *)v536 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v192, (uint64_t)v528, v193, v194, v195);
      unint64_t v202 = v157;
      if (v157 || !v185)
      {
        if (!v157)
        {
          int v203 = 0;
LABEL_28:
          if (!isString_fullPattern_inNetwork) {
            goto LABEL_29;
          }
          goto LABEL_19;
        }
        int isCompletePattern = objc_msgSend_isCompletePattern((void *)v179, v197, v198, v199, v200, v201);
        unsigned int isString_fullPattern_inNetwork = 0;
        if (v185) {
          int v203 = 1;
        }
        else {
          int v203 = isCompletePattern;
        }
        if ((v203 & 1) == 0) {
          goto LABEL_28;
        }
      }
      else
      {
        int v203 = 1;
      }
LABEL_19:
      if (objc_msgSend_length(*(void **)v536, v197, v198, v199, v200, v201) > v530)
      {
        unint64_t v530 = objc_msgSend_length(*(void **)v536, v197, v198, v199, v200, v201);
        goto LABEL_32;
      }
LABEL_29:
      if (!v157 || v526 >= v157)
      {
LABEL_37:
        unsigned int isString_fullPattern_inNetwork = v517;
        int v203 = HIDWORD(v517);
        goto LABEL_38;
      }
      unsigned int isString_fullPattern_inNetwork = objc_msgSend_isString_fullPattern_inNetwork_(CHPatternNetwork, v197, (uint64_t)v528, 10, v515[1], v201);
      int v207 = objc_msgSend_isString_fullPattern_inNetwork_(CHPatternNetwork, v205, (uint64_t)v528, 11, v515[1], v206);
      int v203 = v207;
      if ((isString_fullPattern_inNetwork & 1) == 0)
      {
        if (!v207) {
          goto LABEL_37;
        }
        if ((v517 & 0x100000000) == 0)
        {
          int v203 = 0;
          unsigned int isString_fullPattern_inNetwork = v517;
          goto LABEL_38;
        }
        if (v513)
        {
          int v203 = 1;
          unsigned int isString_fullPattern_inNetwork = v517;
          goto LABEL_38;
        }
      }
LABEL_32:
      NSUInteger range = 1;
      unint64_t v526 = v157;
LABEL_38:
      uint64_t v208 = 2;
      unint64_t v517 = __PAIR64__(v203, isString_fullPattern_inNetwork);
      while (1)
      {
        unint64_t v209 = objc_msgSend_count(v514, v197, v198, v199, v200, v201);
        unint64_t v214 = v202 + v208 - 1;
        if (v214 >= v209) {
          break;
        }
        v215 = objc_msgSend_objectAtIndexedSubscript_(v514, v210, v214, v211, v212, v213);
        v221 = objc_msgSend_string(v215, v216, v217, v218, v219, v220);
        v227 = objc_msgSend_lowercaseString(v221, v222, v223, v224, v225, v226);

        uint64_t v230 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v228, (uint64_t)v227, v179, v515[1], v229);
        uint64_t v233 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v231, (uint64_t)v227, v191, v515[1], v232);
        if (!(v230 | v233))
        {

          uint64_t v191 = 0;
          uint64_t v179 = (uint64_t)v227;
          goto LABEL_62;
        }
        id v234 = (id)v230;

        id v235 = (id)v233;
        id v238 = (id)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v236, (uint64_t)v227, (uint64_t)v185, v515[1], v237);

        int v244 = objc_msgSend_isCompletePattern(v234, v239, v240, v241, v242, v243);
        if (v238) {
          int v250 = 1;
        }
        else {
          int v250 = v244;
        }
        if (v235)
        {
          if ((objc_msgSend_containsString_(*(void **)v536, v245, @"@", v247, v248, v249) & 1) != 0
            || objc_msgSend_containsString_(v227, v245, @"@", v247, v248, v249))
          {
            if (objc_msgSend_containsString_(*(void **)v536, v245, @".", v247, v248, v249)) {
              int v251 = 1;
            }
            else {
              int v251 = objc_msgSend_containsString_(v227, v245, @".", v247, v248, v249);
            }
            int v252 = 1;
LABEL_53:
            objc_msgSend_appendString_(*(void **)v536, v245, (uint64_t)v227, v247, v248, v249);
            int v534 = v252;
            goto LABEL_54;
          }
          int v534 = 0;
        }
        int v251 = 0;
        int v252 = v534;
        char v253 = v250 | v534;
        int v534 = 0;
        if (v253) {
          goto LABEL_53;
        }
LABEL_54:
        if ((v250 | v251) == 1
          && (v513 |= v238 != 0, objc_msgSend_length(*(void **)v536, v245, v246, v247, v248, v249) > v530))
        {
          unint64_t v530 = objc_msgSend_length(*(void **)v536, v254, v255, v256, v257, v258);
          id v259 = *(id *)v536;

          v512 = v259;
          NSUInteger range = v208;
          unint64_t v526 = v532;
          HIDWORD(v517) = v250;
        }
        else
        {
          int v251 = v517;
        }

        ++v208;
        uint64_t v191 = (uint64_t)v235;
        v185 = v238;
        uint64_t v179 = (uint64_t)v234;
        LODWORD(v517) = v251;
        unint64_t v202 = v532;
      }
      if (!v179) {
        goto LABEL_63;
      }
LABEL_62:

LABEL_63:
      if (v185) {

      }
      if (v191) {
      unint64_t v157 = v532 + 1;
      }
    }
    uint64_t v260 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v517 | BYTE4(v517)) & (v517 | ~BYTE4(v517) | ((uint64_t)v530 > 3))) {
      uint64_t v260 = v526;
    }
    *(void *)v536 = v260;
    if (!(BYTE4(v517) & 1 | ((v517 & 1) == 0)))
    {
      int v261 = objc_msgSend_containsString_(v512, v158, @"@", v159, v160, v161);
      uint64_t v262 = *(void *)v536;
      if (!v261) {
        uint64_t v262 = 0x7FFFFFFFFFFFFFFFLL;
      }
      *(void *)v536 = v262;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v263 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG))
    {
      v555.location = *(void *)v536;
      v555.length = range;
      v264 = NSStringFromRange(v555);
      *(_DWORD *)buf = 138413058;
      v546 = v264;
      __int16 v547 = 2048;
      unint64_t v548 = v530;
      __int16 v549 = 1024;
      int v550 = v517 & 1;
      __int16 v551 = 1024;
      int v552 = BYTE4(v517) & 1;
      _os_log_impl(&dword_1C492D000, v263, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromStrongURLsStep range: %@ stringLength: %li isEmail: %i isUrl: %i", buf, 0x22u);
    }
    v527 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v265, v266, v267, v268, v269);
    v529 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v270, v271, v272, v273, v274);
    unint64_t v511 = 0;
    uint64_t v280 = 1;
LABEL_81:
    if (v511 < objc_msgSend_length(v510, v275, v276, v277, v278, v279))
    {
      uint64_t v285 = objc_msgSend_indexAtPosition_(v510, v281, v511, v282, v283, v284);
      v291 = objc_msgSend_result(v509, v286, v287, v288, v289, v290);
      v297 = objc_msgSend_tokenColumns(v291, v292, v293, v294, v295, v296);
      v302 = objc_msgSend_objectAtIndexedSubscript_(v297, v298, v511, v299, v300, v301);
      v308 = objc_msgSend_textTokenRows(v302, v303, v304, v305, v306, v307);
      v313 = objc_msgSend_objectAtIndexedSubscript_(v308, v309, v285, v310, v311, v312);

      long long v539 = 0u;
      long long v540 = 0u;
      long long v537 = 0u;
      long long v538 = 0u;
      id obj = v313;
      uint64_t v316 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v314, (uint64_t)&v537, (uint64_t)v544, 16, v315);
      if (!v316)
      {
        uint64_t v439 = v280;
        goto LABEL_105;
      }
      uint64_t v531 = *(void *)v538;
      while (1)
      {
        uint64_t v317 = 0;
        uint64_t v533 = v316;
        uint64_t v535 = v280;
        uint64_t v516 = v316 + v280;
        uint64_t v520 = v280 - *(void *)v536;
        do
        {
          if (*(void *)v538 != v531) {
            objc_enumerationMutation(obj);
          }
          unint64_t v318 = v535 + v317;
          id v319 = *(id *)(*((void *)&v537 + 1) + 8 * v317);
          v325 = v319;
          v326 = v319;
          if (*(void *)v536 <= (unint64_t)(v535 + v317))
          {
            v326 = v319;
            if (v520 + v317 < range)
            {
              uint64_t v327 = objc_msgSend_properties(v319, v320, v321, v322, v323, v324);
              uint64_t v333 = v327 | 0x40;
              if ((v517 & 0x100000000) != 0)
              {
                if (v318 <= *(void *)v536) {
                  goto LABEL_94;
                }
LABEL_93:
                uint64_t v333 = v327 & 0xFFFFFFFFFFFFFF9FLL | 0x40;
              }
              else if ((v517 & (v318 > *(void *)v536)) == 1)
              {
                goto LABEL_93;
              }
LABEL_94:
              v525 = objc_msgSend_string(v325, v328, v329, v330, v331, v332);
              v339 = objc_msgSend_lowercaseString(v525, v334, v335, v336, v337, v338);
              v345 = objc_msgSend_strokeIndexes(v325, v340, v341, v342, v343, v344);
              uint64_t v351 = objc_msgSend_wordID(v325, v346, v347, v348, v349, v350);
              objc_msgSend_modelScore(v325, v352, v353, v354, v355, v356);
              double v358 = v357;
              objc_msgSend_recognitionScore(v325, v359, v360, v361, v362, v363);
              double v365 = v364;
              objc_msgSend_combinedScore(v325, v366, v367, v368, v369, v370);
              double v372 = v371;
              objc_msgSend_alignmentScore(v325, v373, v374, v375, v376, v377);
              double v379 = v378;
              v385 = objc_msgSend_recognizerSourceLocale(v325, v380, v381, v382, v383, v384);
              double v521 = v379;
              double v522 = v372;
              double v523 = v365;
              double v524 = v358;
              uint64_t v391 = objc_msgSend_inputSources(v325, v386, v387, v388, v389, v390);
              uint64_t v397 = objc_msgSend_substrokeCount(v325, v392, v393, v394, v395, v396);
              objc_msgSend_bounds(v325, v398, v399, v400, v401, v402);
              double v404 = v403;
              double v406 = v405;
              double v408 = v407;
              double v410 = v409;
              objc_msgSend_originalBounds(v325, v411, v412, v413, v414, v415);
              uint64_t v422 = v421;
              uint64_t v424 = v423;
              uint64_t v426 = v425;
              uint64_t v428 = v427;
              if (v325) {
                objc_msgSend_principalLines(v325, v416, v417, v418, v419, v420);
              }
              else {
                memset(&v536[8], 0, 128);
              }
              objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v416, (uint64_t)v339, (uint64_t)v345, v351, v333, v385, v391 | 0x200, v524, v523, v522, v521, v404, v406, v408, v410, v397, v422, v424,
                v426,
                v428,
                &v536[8],
              v326 = v501);
            }
          }
          if (objc_msgSend_isTopOriginal(v325, v320, v321, v322, v323, v324)) {
            objc_msgSend_addObject_(v527, v429, (uint64_t)v325, v430, v431, v432);
          }
          else {
            objc_msgSend_addObject_(v527, v429, (uint64_t)v326, v430, v431, v432);
          }
          objc_msgSend_addObject_(v529, v433, (uint64_t)v326, v434, v435, v436);

          ++v317;
        }
        while (v533 != v317);
        uint64_t v316 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v437, (uint64_t)&v537, (uint64_t)v544, 16, v438);
        uint64_t v439 = v516;
        uint64_t v280 = v516;
        if (!v316)
        {
LABEL_105:
          uint64_t v280 = v439;

          ++v511;
          goto LABEL_81;
        }
      }
    }
    objc_msgSend_addObject_(v505, v281, (uint64_t)v529, v282, v283, v284);
    v445 = objc_msgSend_result(v509, v440, v441, v442, v443, v444);
    v451 = objc_msgSend_transcriptionPathScores(v445, v446, v447, v448, v449, v450);
    v456 = objc_msgSend_objectAtIndexedSubscript_(v451, v452, v508, v453, v454, v455);
    objc_msgSend_addObject_(v506, v457, (uint64_t)v456, v458, v459, v460);

    if ((objc_msgSend_modifiesOriginalTokens(v515, v461, v462, v463, v464, v465) & 1) == 0
      && (objc_msgSend_isEqualToArray_(v527, v466, (uint64_t)v529, v467, v468, v469) & 1) == 0)
    {
      objc_msgSend_addObject_(v505, v470, (uint64_t)v527, v471, v472, v473);
      v479 = objc_msgSend_result(v509, v474, v475, v476, v477, v478);
      v485 = objc_msgSend_transcriptionPathScores(v479, v480, v481, v482, v483, v484);
      v490 = objc_msgSend_objectAtIndexedSubscript_(v485, v486, v508, v487, v488, v489);
      objc_msgSend_addObject_(v506, v491, (uint64_t)v490, v492, v493, v494);
    }
    ++v508;
  }
  v495 = objc_msgSend_result(v509, v102, v103, v104, v105, v106);
  v499 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v495, v496, (uint64_t)v505, (uint64_t)v506, v497, v498);
  if (v509) {
    objc_storeStrong(v509 + 3, v499);
  }

  return v509;
}

- (void).cxx_destruct
{
}

@end