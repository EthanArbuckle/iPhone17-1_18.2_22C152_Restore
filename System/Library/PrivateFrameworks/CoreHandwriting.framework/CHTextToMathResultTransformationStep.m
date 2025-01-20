@interface CHTextToMathResultTransformationStep
- (CHTextToMathResultTransformationStep)initWithAdditionalMathRecognitionBlock:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHTextToMathResultTransformationStep

- (CHTextToMathResultTransformationStep)initWithAdditionalMathRecognitionBlock:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CHTextToMathResultTransformationStep;
  v5 = [(CHTextToMathResultTransformationStep *)&v22 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1C8786E90](v4);
    id additionalMathRecognitionBlock = v5->_additionalMathRecognitionBlock;
    v5->_id additionalMathRecognitionBlock = (id)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = objc_msgSend_componentsSeparatedByString_(@"0 1 2 3 4 5 6 7 8 9 . , '", v9, @" ", v10, v11, v12);
    uint64_t v18 = objc_msgSend_setWithArray_(v8, v14, (uint64_t)v13, v15, v16, v17);
    numericalSymbols = v5->_numericalSymbols;
    v5->_numericalSymbols = (NSSet *)v18;

    textToMathTransliterations = v5->_textToMathTransliterations;
    v5->_textToMathTransliterations = (NSDictionary *)&unk_1F203D1C0;
  }
  return v5;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v575 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  long long v560 = 0u;
  long long v561 = 0u;
  long long v562 = 0u;
  long long v563 = 0u;
  if (v4) {
    uint64_t v6 = (void *)v4[9];
  }
  else {
    uint64_t v6 = 0;
  }
  id obj = v6;
  v552 = v5;
  uint64_t v550 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v560, (uint64_t)v570, 16, v8);
  if (v550)
  {
    uint64_t v549 = *(void *)v561;
    do
    {
      uint64_t v555 = 0;
      do
      {
        if (*(void *)v561 != v549) {
          objc_enumerationMutation(obj);
        }
        if (v5) {
          v9 = (void *)v5[10];
        }
        else {
          v9 = 0;
        }
        uint64_t v10 = *(void **)(*((void *)&v560 + 1) + 8 * v555);
        id v11 = v9;
        uint64_t v12 = NSNumber;
        uint64_t v18 = objc_msgSend_uniqueIdentifier(v10, v13, v14, v15, v16, v17);
        v23 = objc_msgSend_numberWithInteger_(v12, v19, v18, v20, v21, v22);
        v556 = objc_msgSend_objectForKeyedSubscript_(v11, v24, (uint64_t)v23, v25, v26, v27);
        v551 = v10;

        v33 = objc_msgSend_mathResult(v556, v28, v29, v30, v31, v32);
        if (v33) {
          goto LABEL_62;
        }
        v39 = objc_msgSend_preferredLocale(v556, v34, v35, v36, v37, v38);
        BOOL v40 = v39 == 0;

        if (v40) {
          goto LABEL_63;
        }
        v46 = objc_msgSend_recognitionResultsByLocale(v556, v41, v42, v43, v44, v45);
        uint64_t v52 = objc_msgSend_preferredLocale(v556, v47, v48, v49, v50, v51);
        objc_msgSend_objectForKeyedSubscript_(v46, v53, v52, v54, v55, v56);
        id v548 = (id)objc_claimAutoreleasedReturnValue();

        v62 = objc_msgSend_topTranscription(v548, v57, v58, v59, v60, v61);
        v68 = objc_msgSend_orderedLocales(v556, v63, v64, v65, v66, v67);
        v547 = v62;
        LOBYTE(v52) = objc_msgSend_isTextTranscriptionUnitConversion_locales_(CHTokenizedTextResult, v69, (uint64_t)v62, (uint64_t)v68, v70, v71);

        if (v52) {
          goto LABEL_13;
        }
        if (objc_msgSend_hasSuffix_(v62, v72, @"二", v74, v75, v76))
        {
          v519 = NSString;
          uint64_t v520 = objc_msgSend_length(v62, v514, v515, v516, v517, v518);
          v525 = objc_msgSend_substringToIndex_(v62, v521, v520 - 1, v522, v523, v524);
          v530 = objc_msgSend_stringWithFormat_(v519, v526, @"%@=", v527, v528, v529, v525);

          v536 = objc_msgSend_orderedLocales(v556, v531, v532, v533, v534, v535);
          int isTextTranscriptionUnitConversion_locales = objc_msgSend_isTextTranscriptionUnitConversion_locales_(CHTokenizedTextResult, v537, (uint64_t)v530, (uint64_t)v536, v538, v539);

          if (isTextTranscriptionUnitConversion_locales)
          {
LABEL_13:
            v77 = objc_msgSend_inputStrokeIdentifiers(v556, v72, v73, v74, v75, v76);
            id v545 = v548;
            id v554 = v77;
            v553 = v552;
            if (!self)
            {
              v444 = 0;
LABEL_52:

              v445 = [CHStrokeGroupRecognitionResult alloc];
              v451 = objc_msgSend_orderedLocales(v556, v446, v447, v448, v449, v450);
              v457 = objc_msgSend_recognitionResultsByLocale(v556, v452, v453, v454, v455, v456);
              v463 = objc_msgSend_errorsByLocale(v556, v458, v459, v460, v461, v462);
              v469 = objc_msgSend_languageFitnessByLocale(v556, v464, v465, v466, v467, v468);
              v475 = objc_msgSend_inputStrokeIdentifiers(v556, v470, v471, v472, v473, v474);
              v477 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v445, v476, (uint64_t)v451, (uint64_t)v457, (uint64_t)v463, (uint64_t)v469, v444, v475);

              if (v552) {
                v478 = (void *)v552[10];
              }
              else {
                v478 = 0;
              }
              id v479 = v478;
              v480 = NSNumber;
              uint64_t v486 = objc_msgSend_uniqueIdentifier(v551, v481, v482, v483, v484, v485);
              v491 = objc_msgSend_numberWithInteger_(v480, v487, v486, v488, v489, v490);
              objc_msgSend_setObject_forKeyedSubscript_(v479, v492, (uint64_t)v477, (uint64_t)v491, v493, v494);

              if (qword_1EA3CA000 != -1) {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
              }
              v495 = (id)qword_1EA3C9FA8;
              if (os_log_type_enabled(v495, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v501 = objc_msgSend_uniqueIdentifier(v551, v496, v497, v498, v499, v500);
                v507 = objc_msgSend_strokeIdentifiers(v551, v502, v503, v504, v505, v506);
                uint64_t v513 = objc_msgSend_count(v507, v508, v509, v510, v511, v512);
                *(_DWORD *)buf = 134218240;
                *(void *)&buf[4] = v501;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v513;
                _os_log_impl(&dword_1C492D000, v495, OS_LOG_TYPE_DEBUG, "CHTextToMathResultTransformationStep transformed text stroke group %lu with %lu strokes into math.", buf, 0x16u);
              }
              goto LABEL_61;
            }
            v558 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v78, v79, v80, v81, v82);
            v88 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v83, v84, v85, v86, v87);
            v568[0] = MEMORY[0x1E4F143A8];
            v568[1] = 3221225472;
            v568[2] = sub_1C4B66B7C;
            v568[3] = &unk_1E64E3150;
            id v559 = v88;
            id v569 = v559;
            objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v545, v89, (uint64_t)v568, v90, v91, v92);
            unint64_t v98 = 0;
            while (2)
            {
              if (v98 >= objc_msgSend_count(v559, v93, v94, v95, v96, v97))
              {
                v435 = [CHTokenizedMathResult alloc];
                *(void *)buf = v558;
                v439 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v436, (uint64_t)buf, 1, v437, v438);
                v444 = objc_msgSend_initWithBestPathTokens_(v435, v440, (uint64_t)v439, v441, v442, v443);

                goto LABEL_52;
              }
              v103 = objc_msgSend_objectAtIndexedSubscript_(v559, v99, v98, v100, v101, v102);
              v109 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v104, v105, v106, v107, v108);
              char v115 = objc_msgSend_properties(v103, v110, v111, v112, v113, v114);
              v116 = @"\\"";
              if ((v115 & 0x20) == 0) {
                v116 = &stru_1F20141C8;
              }
              v117 = v116;
              v123 = objc_msgSend_lastObject(v558, v118, v119, v120, v121, v122);
              BOOL v129 = (objc_msgSend_properties(v123, v124, v125, v126, v127, v128) & 0x800000) == 0;

              if (!v129)
              {

                v117 = @"\\,";
              }
              if (v98 == objc_msgSend_count(v559, v130, v131, v132, v133, v134) - 1)
              {
                v140 = objc_msgSend_string(v103, v135, v136, v137, v138, v139);
                if (objc_msgSend_hasSuffix_(v140, v141, @"=", v142, v143, v144))
                {

                  goto LABEL_24;
                }
                v150 = objc_msgSend_string(v103, v145, v146, v147, v148, v149);
                int hasSuffix = objc_msgSend_hasSuffix_(v150, v151, @"二", v152, v153, v154);

                if (hasSuffix)
                {
LABEL_24:
                  v156 = objc_msgSend_string(v103, v135, v136, v137, v138, v139);
                  if (objc_msgSend_isEqualToString_(v156, v157, @"=", v158, v159, v160))
                  {

                    goto LABEL_33;
                  }
                  v295 = objc_msgSend_string(v103, v161, v162, v163, v164, v165);
                  int isEqualToString = objc_msgSend_isEqualToString_(v295, v296, @"二", v297, v298, v299);

                  if (isEqualToString)
                  {
LABEL_33:
                    v301 = [CHTokenizedMathResultToken alloc];
                    v307 = objc_msgSend_strokeIndexes(v103, v302, v303, v304, v305, v306);
                    objc_msgSend_recognitionScore(v103, v308, v309, v310, v311, v312);
                    double v314 = v313;
                    objc_msgSend_originalBounds(v103, v315, v316, v317, v318, v319);
                    id v182 = (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v301, v320, @"=", (uint64_t)v307, 0x40000, v321, v314, v322, v323, v324, v325);

                    objc_msgSend_addObject_(v109, v326, (uint64_t)v182, v327, v328, v329);
                    id v236 = v117;
                    v117 = &stru_1F20141C8;
                    goto LABEL_48;
                  }
                  id v566 = 0;
                  id v567 = 0;
                  int v367 = sub_1C4B66B88((uint64_t)self, v103, &v567, &v566, 0, @"=", v554, v553);
                  id v182 = v567;
                  id v236 = v566;
                  if (v367)
                  {
                    objc_msgSend_addObject_(v109, v368, (uint64_t)v236, v369, v370, v371);
                    objc_msgSend_addObject_(v109, v372, (uint64_t)v182, v373, v374, v375);
                    goto LABEL_48;
                  }
                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  v376 = (id)qword_1EA3C9FA8;
                  if (os_log_type_enabled(v376, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)&buf[4] = v98;
                    _os_log_impl(&dword_1C492D000, v376, OS_LOG_TYPE_DEBUG, "CHTextToMathResultTransformationStep failed to split text token at index %lu.", buf, 0xCu);
                  }

                  v382 = objc_msgSend_string(v103, v377, v378, v379, v380, v381);
                  sub_1C4B669B0((uint64_t)self, v382);
                  id v267 = (id)objc_claimAutoreleasedReturnValue();

                  v383 = [CHTokenizedMathResultToken alloc];
                  v389 = objc_msgSend_strokeIndexes(v103, v384, v385, v386, v387, v388);
                  objc_msgSend_recognitionScore(v103, v390, v391, v392, v393, v394);
                  double v396 = v395;
                  objc_msgSend_originalBounds(v103, v397, v398, v399, v400, v401);
                  v282 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v383, v402, (uint64_t)v267, (uint64_t)v389, 0x1000000, v403, v396, v404, v405, v406, v407);

                  objc_msgSend_addObject_(v109, v408, (uint64_t)v282, v409, v410, v411);
                  goto LABEL_46;
                }
              }
              objc_msgSend_string(v103, v135, v136, v137, v138, v139);
              id v166 = (id)objc_claimAutoreleasedReturnValue();
              v172 = objc_msgSend_string(MEMORY[0x1E4F28E78], v167, v168, v169, v170, v171);
              uint64_t v178 = objc_msgSend_length(v166, v173, v174, v175, v176, v177);
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = sub_1C4B67814;
              v572 = &unk_1E64E3BD0;
              v573 = self;
              id v179 = v172;
              id v574 = v179;
              objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v166, v180, 0, v178, 2, (uint64_t)buf);
              v181 = v574;
              id v182 = v179;

              if (objc_msgSend_length(v182, v183, v184, v185, v186, v187))
              {
                uint64_t v193 = objc_msgSend_length(v182, v188, v189, v190, v191, v192);
                v199 = objc_msgSend_string(v103, v194, v195, v196, v197, v198);
                LODWORD(v193) = v193 == objc_msgSend_length(v199, v200, v201, v202, v203, v204);

                if (v193)
                {
                  v205 = [CHTokenizedMathResultToken alloc];
                  v211 = objc_msgSend_string(v103, v206, v207, v208, v209, v210);
                  v217 = objc_msgSend_strokeIndexes(v103, v212, v213, v214, v215, v216);
                  objc_msgSend_recognitionScore(v103, v218, v219, v220, v221, v222);
                  double v224 = v223;
                  objc_msgSend_originalBounds(v103, v225, v226, v227, v228, v229);
                  id v236 = (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v205, v230, (uint64_t)v211, (uint64_t)v217, 0x800000, v231, v224, v232, v233, v234, v235);

                  objc_msgSend_addObject_(v109, v237, (uint64_t)v236, v238, v239, v240);
LABEL_48:

                  if (objc_msgSend_length(v117, v412, v413, v414, v415, v416))
                  {
                    v421 = [CHTokenizedMathResultToken alloc];
                    v427 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v422, v423, v424, v425, v426);
                    v430 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v421, v428, (uint64_t)v117, (uint64_t)v427, 0x2000, v429, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

                    objc_msgSend_addObject_(v558, v431, (uint64_t)v430, v432, v433, v434);
                  }
                  objc_msgSend_addObjectsFromArray_(v558, v417, (uint64_t)v109, v418, v419, v420);

                  ++v98;
                  continue;
                }
                id v564 = 0;
                id v565 = 0;
                int v272 = sub_1C4B66B88((uint64_t)self, v103, &v565, &v564, v182, 0, v554, v553);
                id v236 = v565;
                id v267 = v564;
                if (v272)
                {
                  v273 = [CHTokenizedMathResultToken alloc];
                  v279 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v274, v275, v276, v277, v278);
                  v282 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v273, v280, @"\\,", (uint64_t)v279, 0x2000, v281, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

                  objc_msgSend_addObject_(v109, v283, (uint64_t)v236, v284, v285, v286);
                  objc_msgSend_addObject_(v109, v287, (uint64_t)v282, v288, v289, v290);
                  objc_msgSend_addObject_(v109, v291, (uint64_t)v267, v292, v293, v294);
                }
                else
                {
                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  v330 = (id)qword_1EA3C9FA8;
                  if (os_log_type_enabled(v330, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)&buf[4] = v98;
                    _os_log_impl(&dword_1C492D000, v330, OS_LOG_TYPE_DEBUG, "CHTextToMathResultTransformationStep failed to split text token at index %lu.", buf, 0xCu);
                  }

                  v336 = objc_msgSend_string(v103, v331, v332, v333, v334, v335);
                  v282 = sub_1C4B669B0((uint64_t)self, v336);

                  v337 = [CHTokenizedMathResultToken alloc];
                  v343 = objc_msgSend_strokeIndexes(v103, v338, v339, v340, v341, v342);
                  objc_msgSend_recognitionScore(v103, v344, v345, v346, v347, v348);
                  double v350 = v349;
                  objc_msgSend_originalBounds(v103, v351, v352, v353, v354, v355);
                  v362 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v337, v356, (uint64_t)v282, (uint64_t)v343, 0x1000000, v357, v350, v358, v359, v360, v361);

                  objc_msgSend_addObject_(v109, v363, (uint64_t)v362, v364, v365, v366);
                }
LABEL_46:
              }
              else
              {
                v241 = objc_msgSend_string(v103, v188, v189, v190, v191, v192);
                sub_1C4B669B0((uint64_t)self, v241);
                id v236 = (id)objc_claimAutoreleasedReturnValue();

                v242 = [CHTokenizedMathResultToken alloc];
                v248 = objc_msgSend_strokeIndexes(v103, v243, v244, v245, v246, v247);
                objc_msgSend_recognitionScore(v103, v249, v250, v251, v252, v253);
                double v255 = v254;
                objc_msgSend_originalBounds(v103, v256, v257, v258, v259, v260);
                id v267 = (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v242, v261, (uint64_t)v236, (uint64_t)v248, 0x1000000, v262, v255, v263, v264, v265, v266);

                objc_msgSend_addObject_(v109, v268, (uint64_t)v267, v269, v270, v271);
              }
              break;
            }

            goto LABEL_48;
          }
        }
LABEL_61:

        v33 = v548;
LABEL_62:

LABEL_63:
        ++v555;
        v5 = v552;
      }
      while (v555 != v550);
      uint64_t v543 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v541, (uint64_t)&v560, (uint64_t)v570, 16, v542);
      uint64_t v550 = v543;
    }
    while (v543);
  }

  return v552;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToMathTransliterations, 0);
  objc_storeStrong((id *)&self->_numericalSymbols, 0);
  objc_storeStrong(&self->_additionalMathRecognitionBlock, 0);
}

@end