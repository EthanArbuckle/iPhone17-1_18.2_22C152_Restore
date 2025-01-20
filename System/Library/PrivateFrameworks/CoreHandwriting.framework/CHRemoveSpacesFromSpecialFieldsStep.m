@interface CHRemoveSpacesFromSpecialFieldsStep
- (CHRemoveSpacesFromSpecialFieldsStep)initWithPatternFst:(id)a3 patternType:(int64_t)a4 capitalizationToSplit:(BOOL)a5 convertToLowercase:(BOOL)a6;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveSpacesFromSpecialFieldsStep

- (CHRemoveSpacesFromSpecialFieldsStep)initWithPatternFst:(id)a3 patternType:(int64_t)a4 capitalizationToSplit:(BOOL)a5 convertToLowercase:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CHRemoveSpacesFromSpecialFieldsStep;
  v12 = [(CHRemoveSpacesFromSpecialFieldsStep *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_patternFST, a3);
    v13->_patternType = a4;
    v13->_capitalizationToSplit = a5;
    v13->_convertToLowercase = a6;
  }

  return v13;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v438 = *MEMORY[0x1E4F143B8];
  v426 = (id *)a3;
  id v411 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromSpecialFieldsStep is running", buf, 2u);
  }

  v16 = objc_msgSend_leftContext(v426, v6, v7, v8, v9, v10);
  if (!v16
    || (objc_msgSend_leftContext(v426, v11, v12, v13, v14, v15),
        v17 = objc_claimAutoreleasedReturnValue(),
        BOOL v23 = objc_msgSend_length(v17, v18, v19, v20, v21, v22) == 0,
        v17,
        v16,
        v23))
  {
    v414 = &stru_1F20141C8;
  }
  else
  {
    v27 = objc_msgSend_leftContext(v426, v11, v24, v25, v26, v15);
    v33 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v28, v29, v30, v31, v32);
    objc_msgSend_stringByTrimmingCharactersInSet_(v27, v34, (uint64_t)v33, v35, v36, v37);
    v414 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v38, v39, v40, v41, v42);
    v48 = objc_msgSend_componentsSeparatedByCharactersInSet_(v414, v44, (uint64_t)v43, v45, v46, v47);

    if ((unint64_t)objc_msgSend_count(v48, v49, v50, v51, v52, v53) >= 2)
    {
      v401 = v426;
      v412 = v414;
      v414 = &stru_1F20141C8;
      goto LABEL_44;
    }
  }
  v412 = objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v11, self->_patternType, (uint64_t)self->_patternFST, 0, v15);
  v413 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v54, (uint64_t)v414, (uint64_t)v412, (uint64_t)self->_patternFST, v55);
  if (v413)
  {
    v409 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v56, v57, v58, v59, v60);
    v410 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v61, v62, v63, v64, v65);
    for (unint64_t i = 0; ; ++i)
    {
      v71 = objc_msgSend_result(v426, v66, v67, v68, v69, v70);
      v77 = objc_msgSend_transcriptionPaths(v71, v72, v73, v74, v75, v76);
      BOOL v83 = i < objc_msgSend_count(v77, v78, v79, v80, v81, v82);

      if (!v83) {
        break;
      }
      v89 = objc_msgSend_result(v426, v84, v85, v86, v87, v88);
      v95 = objc_msgSend_transcriptionPaths(v89, v90, v91, v92, v93, v94);
      v416 = objc_msgSend_objectAtIndexedSubscript_(v95, v96, i, v97, v98, v99);

      id v100 = v413;
      v423 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v101, v102, v103, v104, v105);
      v424 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v106, v107, v108, v109, v110);
      for (unint64_t j = 0; j < objc_msgSend_length(v416, v111, v112, v113, v114, v115); ++j)
      {
        uint64_t v120 = objc_msgSend_indexAtPosition_(v416, v116, j, v117, v118, v119);
        v126 = objc_msgSend_result(v426, v121, v122, v123, v124, v125);
        v132 = objc_msgSend_tokenColumns(v126, v127, v128, v129, v130, v131);
        v137 = objc_msgSend_objectAtIndexedSubscript_(v132, v133, j, v134, v135, v136);
        v143 = objc_msgSend_textTokenRows(v137, v138, v139, v140, v141, v142);
        v148 = objc_msgSend_objectAtIndexedSubscript_(v143, v144, v120, v145, v146, v147);

        long long v434 = 0u;
        long long v435 = 0u;
        long long v432 = 0u;
        long long v433 = 0u;
        obunint64_t j = v148;
        uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v149, (uint64_t)&v432, (uint64_t)v437, 16, v150);
        v152 = off_1E64E0000;
        if (v151)
        {
          uint64_t v425 = *(void *)v433;
          do
          {
            uint64_t v427 = v151;
            uint64_t v153 = 0;
            uint64_t v154 = (uint64_t)v100;
            do
            {
              v428 = (void *)v154;
              if (*(void *)v433 != v425) {
                objc_enumerationMutation(obj);
              }
              id v155 = *(id *)(*((void *)&v432 + 1) + 8 * v153);
              v156 = v152[85];
              v162 = objc_msgSend_string(v155, v157, v158, v159, v160, v161);
              v430 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(v156, v163, (uint64_t)v162, v154, (uint64_t)self->_patternFST, v164);

              v170 = objc_msgSend_string(v155, v165, v166, v167, v168, v169);
              v176 = objc_msgSend_firstComposedCharacter(v170, v171, v172, v173, v174, v175);
              v182 = objc_msgSend_uppercaseLetterCharacterSet(MEMORY[0x1E4F28B88], v177, v178, v179, v180, v181);
              id v183 = v176;
              id v184 = v182;
              if (objc_msgSend_length(v183, v185, v186, v187, v188, v189))
              {
                v194 = objc_msgSend_stringByTrimmingCharactersInSet_(v183, v190, (uint64_t)v184, v191, v192, v193);
                BOOL v200 = objc_msgSend_length(v194, v195, v196, v197, v198, v199) == 0;
              }
              else
              {
                BOOL v200 = 0;
              }

              v206 = v155;
              if (v430)
              {
                if (!v200 || (v206 = v155, !self->_capitalizationToSplit))
                {
                  v212 = objc_msgSend_string(v155, v201, v202, v203, v204, v205);
                  if (self->_convertToLowercase)
                  {
                    v213 = objc_msgSend_string(v155, v207, v208, v209, v210, v211);
                    uint64_t v219 = objc_msgSend_lowercaseString(v213, v214, v215, v216, v217, v218);

                    v212 = (void *)v219;
                  }
                  uint64_t v220 = objc_msgSend_properties(v155, v207, v208, v209, v210, v211);
                  v226 = objc_msgSend_strokeIndexes(v155, v221, v222, v223, v224, v225);
                  uint64_t v232 = objc_msgSend_wordID(v155, v227, v228, v229, v230, v231);
                  objc_msgSend_modelScore(v155, v233, v234, v235, v236, v237);
                  double v239 = v238;
                  objc_msgSend_recognitionScore(v155, v240, v241, v242, v243, v244);
                  double v246 = v245;
                  objc_msgSend_combinedScore(v155, v247, v248, v249, v250, v251);
                  double v253 = v252;
                  objc_msgSend_alignmentScore(v155, v254, v255, v256, v257, v258);
                  double v260 = v259;
                  v266 = objc_msgSend_recognizerSourceLocale(v155, v261, v262, v263, v264, v265);
                  double v419 = v260;
                  double v420 = v253;
                  double v421 = v246;
                  double v422 = v239;
                  uint64_t v272 = objc_msgSend_inputSources(v155, v267, v268, v269, v270, v271);
                  uint64_t v278 = objc_msgSend_substrokeCount(v155, v273, v274, v275, v276, v277);
                  objc_msgSend_bounds(v155, v279, v280, v281, v282, v283);
                  double v285 = v284;
                  double v287 = v286;
                  double v289 = v288;
                  double v291 = v290;
                  objc_msgSend_originalBounds(v155, v292, v293, v294, v295, v296);
                  uint64_t v303 = v302;
                  uint64_t v305 = v304;
                  uint64_t v307 = v306;
                  uint64_t v309 = v308;
                  if (v155) {
                    objc_msgSend_principalLines(v155, v297, v298, v299, v300, v301);
                  }
                  else {
                    memset(v431, 0, sizeof(v431));
                  }
                  objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v297, (uint64_t)v212, (uint64_t)v226, v232, v220 & 0xFFFFFFFFFFFFFF9FLL | 0x40, v266, v272 | 0x200, v422, v421, v420, v419, v285, v287, v289, v291, v278, v303, v305,
                    v307,
                    v309,
                  v206 = v431);
                }
              }
              if (objc_msgSend_isTopOriginal(v155, v201, v202, v203, v204, v205)) {
                objc_msgSend_addObject_(v423, v310, (uint64_t)v155, v311, v312, v313);
              }
              else {
                objc_msgSend_addObject_(v423, v310, (uint64_t)v206, v311, v312, v313);
              }
              objc_msgSend_addObject_(v424, v314, (uint64_t)v206, v315, v316, v317);
              v318 = NSString;
              v324 = objc_msgSend_result(v426, v319, v320, v321, v322, v323);
              v329 = objc_msgSend_precedingSeparatorForToken_(v324, v325, (uint64_t)v206, v326, v327, v328);
              v335 = objc_msgSend_string(v206, v330, v331, v332, v333, v334);
              v340 = objc_msgSend_stringWithFormat_(v318, v336, @"%@%@", v337, v338, v339, v329, v335);

              id v100 = (id)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v341, (uint64_t)v340, (uint64_t)v428, (uint64_t)self->_patternFST, v342);
              ++v153;
              uint64_t v154 = (uint64_t)v100;
              v152 = off_1E64E0000;
            }
            while (v427 != v153);
            uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v343, (uint64_t)&v432, (uint64_t)v437, 16, v344);
          }
          while (v151);
        }
      }
      objc_msgSend_addObject_(v409, v116, (uint64_t)v424, v117, v118, v119);
      v350 = objc_msgSend_result(v426, v345, v346, v347, v348, v349);
      v356 = objc_msgSend_transcriptionPathScores(v350, v351, v352, v353, v354, v355);
      v361 = objc_msgSend_objectAtIndexedSubscript_(v356, v357, i, v358, v359, v360);
      objc_msgSend_addObject_(v410, v362, (uint64_t)v361, v363, v364, v365);

      if ((objc_msgSend_modifiesOriginalTokens(self, v366, v367, v368, v369, v370) & 1) == 0
        && (objc_msgSend_isEqualToArray_(v423, v371, (uint64_t)v424, v372, v373, v374) & 1) == 0)
      {
        objc_msgSend_addObject_(v409, v375, (uint64_t)v423, v376, v377, v378);
        v384 = objc_msgSend_result(v426, v379, v380, v381, v382, v383);
        v390 = objc_msgSend_transcriptionPathScores(v384, v385, v386, v387, v388, v389);
        v395 = objc_msgSend_objectAtIndexedSubscript_(v390, v391, i, v392, v393, v394);
        objc_msgSend_addObject_(v410, v396, (uint64_t)v395, v397, v398, v399);
      }
    }
    v403 = objc_msgSend_result(v426, v84, v85, v86, v87, v88);
    v407 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v403, v404, (uint64_t)v409, (uint64_t)v410, v405, v406);
    if (v426) {
      objc_storeStrong(v426 + 3, v407);
    }

    v408 = v426;
    v48 = v413;
  }
  else
  {
    v400 = v426;
    v48 = 0;
  }
LABEL_44:

  return v426;
}

- (void).cxx_destruct
{
}

@end