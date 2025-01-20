@interface CHVisualToLogicalTransformStep
- (CHVisualToLogicalTransformStep)initWithBaseDirection:(int)a3 mode:(int)a4;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHVisualToLogicalTransformStep

- (CHVisualToLogicalTransformStep)initWithBaseDirection:(int)a3 mode:(int)a4
{
  v5 = *(CRBiDiTransform **)&a3;
  v11.receiver = self;
  v11.super_class = (Class)CHVisualToLogicalTransformStep;
  v6 = [(CHVisualToLogicalTransformStep *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_bidiTransform = v5;
    v6->_mode = a4;
    v8 = (objc_class *)objc_alloc_init(MEMORY[0x1E4FAF100]);
    Class isa = v7[1].super.super.super.isa;
    v7[1].super.super.super.Class isa = v8;
  }
  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v856 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  id v782 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v810 = v5;
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHVisualToLogicalTransformStep is running", buf, 2u);
  }

  bidiTransforunint64_t m = self->_bidiTransform;
  if (((unint64_t)bidiTransform & 0xFFFFFFFFFFFFFFFELL) != 0xFE || self->_mode != 4) {
    goto LABEL_13;
  }
  v12 = v5;
  *(void *)&long long v846 = 0;
  *((void *)&v846 + 1) = &v846;
  long long v847 = 0x2020000000uLL;
  *(void *)&long long v839 = 0;
  *((void *)&v839 + 1) = &v839;
  *(void *)&long long v840 = 0x2020000000;
  *((void *)&v840 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)&long long v835 = 0;
  *((void *)&v835 + 1) = &v835;
  *(void *)&long long v836 = 0x2020000000;
  *((void *)&v836 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  v18 = objc_msgSend_result(v12, v13, v14, v15, v16, v17);
  v24 = objc_msgSend_result(v12, v19, v20, v21, v22, v23);
  v30 = objc_msgSend_transcriptionPaths(v24, v25, v26, v27, v28, v29);
  v35 = objc_msgSend_objectAtIndexedSubscript_(v30, v31, 0, v32, v33, v34);
  v41 = objc_msgSend_result(v12, v36, v37, v38, v39, v40);
  uint64_t v47 = objc_msgSend_tokenColumnCount(v41, v42, v43, v44, v45, v46);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_1C4C16158;
  v851 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E64E51B0;
  v853 = &v846;
  v852 = self;
  v854 = &v835;
  v855 = &v839;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v18, v48, (uint64_t)v35, 0, v47, (uint64_t)buf);

  if (((unint64_t)self->_bidiTransform & 0xFFFFFFFFFFFFFFFELL) == 0xFE) {
    self->_bidiTransforunint64_t m = *(CRBiDiTransform **)(*((void *)&v846 + 1) + 24);
  }
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v49 = (id)qword_1EA3C9F98;
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v49 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
LABEL_11:
    v50 = self->_bidiTransform;
    LODWORD(v843) = 134217984;
    *(void *)((char *)&v843 + 4) = v50;
    _os_log_impl(&dword_1C492D000, v49, OS_LOG_TYPE_DEBUG, "CHVisualToLogicalTransformStep resolved base direction to %li", (uint8_t *)&v843, 0xCu);
  }
LABEL_12:

  _Block_object_dispose(&v835, 8);
  _Block_object_dispose(&v839, 8);
  _Block_object_dispose(&v846, 8);

LABEL_13:
  v784 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v785 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v51, v52, v53, v54, v55);
  unint64_t v808 = 0;
  while (1)
  {
    v61 = objc_msgSend_result(v810, v56, v57, v58, v59, v60);
    v67 = objc_msgSend_transcriptionPaths(v61, v62, v63, v64, v65, v66);
    BOOL v73 = v808 < objc_msgSend_count(v67, v68, v69, v70, v71, v72);

    if (!v73) {
      break;
    }
    v79 = objc_msgSend_result(v810, v74, v75, v76, v77, v78);
    v85 = objc_msgSend_transcriptionPaths(v79, v80, v81, v82, v83, v84);
    v802 = objc_msgSend_objectAtIndexedSubscript_(v85, v86, v808, v87, v88, v89);

    v796 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v90, v91, v92, v93, v94);
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v95, v96, v97, v98, v99);
    id v805 = (id)objc_claimAutoreleasedReturnValue();
    v100 = self;
    v813 = objc_msgSend_string(NSString, v101, v102, v103, v104, v105);
    v811 = objc_msgSend_string(NSString, v106, v107, v108, v109, v110);
    v803 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v111, v112, v113, v114, v115);
    v804 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v116, v117, v118, v119, v120);
    v793 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v121, v122, v123, v124, v125);
    v809 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v126, v127, v128, v129, v130);
    v800 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v131, v132, v133, v134, v135);
    *(void *)&long long v843 = 0;
    *((void *)&v843 + 1) = &v843;
    uint64_t v844 = 0x2020000000;
    __int16 v845 = 32;
    v146 = objc_msgSend_leftContext(v810, v136, v137, v138, v139, v140);
    if (v146)
    {
      v147 = objc_msgSend_leftContext(v810, v141, v142, v143, v144, v145);
      BOOL v153 = objc_msgSend_length(v147, v148, v149, v150, v151, v152) == 0;

      v100 = self;
      if (!v153)
      {
        v154 = objc_msgSend_leftContext(v810, v141, v142, v143, v144, v145);
        v160 = objc_msgSend_leftContext(v810, v155, v156, v157, v158, v159);
        uint64_t v166 = objc_msgSend_length(v160, v161, v162, v163, v164, v165);
        __int16 v171 = objc_msgSend_characterAtIndex_(v154, v167, v166 - 1, v168, v169, v170);
        *(_WORD *)(*((void *)&v843 + 1) + 24) = v171;

        v100 = self;
      }
    }
    v172 = objc_msgSend_result(v810, v141, v142, v143, v144, v145);
    v178 = objc_msgSend_result(v810, v173, v174, v175, v176, v177);
    uint64_t v184 = objc_msgSend_tokenColumnCount(v178, v179, v180, v181, v182, v183);
    v832[0] = MEMORY[0x1E4F143A8];
    v832[1] = 3221225472;
    v832[2] = sub_1C4C17DB4;
    v832[3] = &unk_1E64E51D8;
    v832[4] = v100;
    v834 = &v843;
    id v185 = v793;
    id v833 = v185;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v172, v186, (uint64_t)v802, 0, v184, (uint64_t)v832);

    id v798 = v185;
    v819 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v187, v188, v189, v190, v191);
    v816 = objc_msgSend_string(MEMORY[0x1E4F28E78], v192, v193, v194, v195, v196);
    v823 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v197, v198, v199, v200, v201);
    long long v848 = 0u;
    long long v849 = 0u;
    long long v846 = 0u;
    long long v847 = 0u;
    obunint64_t j = v798;
    uint64_t v209 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v202, (uint64_t)&v846, (uint64_t)buf, 16, v203);
    if (v209)
    {
      uint64_t v210 = 0;
      uint64_t v211 = *(void *)v847;
      do
      {
        for (uint64_t i = 0; i != v209; ++i)
        {
          if (*(void *)v847 != v211) {
            objc_enumerationMutation(obj);
          }
          v213 = *(void **)(*((void *)&v846 + 1) + 8 * i);
          v219 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v204, v205, v206, v207, v208);
          for (unint64_t j = 0; ; ++j)
          {
            v221 = objc_msgSend_string(v213, v214, v215, v216, v217, v218);
            BOOL v227 = j < objc_msgSend_length(v221, v222, v223, v224, v225, v226);

            if (!v227) {
              break;
            }
            v233 = objc_msgSend_numberWithInteger_(NSNumber, v228, v210 + j, v230, v231, v232);
            objc_msgSend_addObject_(v219, v234, (uint64_t)v233, v235, v236, v237);
          }
          v238 = objc_msgSend_copy(v219, v228, v229, v230, v231, v232);
          objc_msgSend_addObject_(v823, v239, (uint64_t)v238, v240, v241, v242);

          v248 = objc_msgSend_string(v213, v243, v244, v245, v246, v247);
          objc_msgSend_addObject_(v819, v249, (uint64_t)v248, v250, v251, v252);

          v258 = objc_msgSend_string(v213, v253, v254, v255, v256, v257);
          uint64_t v264 = objc_msgSend_length(v258, v259, v260, v261, v262, v263);

          v210 += v264 + 1;
        }
        uint64_t v209 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v204, (uint64_t)&v846, (uint64_t)buf, 16, v208);
      }
      while (v209);
    }

    v269 = objc_msgSend_componentsJoinedByString_(v819, v265, @" ", v266, v267, v268);
    objc_msgSend_setString_(v816, v270, (uint64_t)v269, v271, v272, v273);

    id v279 = (id)objc_msgSend_copy(v816, v274, v275, v276, v277, v278);
    id v285 = (id)objc_msgSend_copy(v823, v280, v281, v282, v283, v284);

    v799 = (uint64_t (*)(uint64_t, uint64_t))v279;
    id v795 = v285;

    v286 = self->_bidiTransform;
    uint64_t v287 = 4;
    if (v286 != (CRBiDiTransform *)255) {
      uint64_t v287 = 0;
    }
    if (v286 == (CRBiDiTransform *)254) {
      uint64_t v287 = 3;
    }
    uint64_t v288 = 2;
    if (v286 != (CRBiDiTransform *)1) {
      uint64_t v288 = 0;
    }
    if (!v286) {
      uint64_t v288 = 1;
    }
    if ((uint64_t)v286 <= 253) {
      uint64_t v289 = v288;
    }
    else {
      uint64_t v289 = v287;
    }
    unsigned __int8 v831 = 1;
    v290 = self[1].super.super.super.isa;
    id v829 = v800;
    id v830 = v805;
    id v828 = v811;
    v797 = objc_msgSend_transformVisualToLogical_visualDirectionality_logicalBaseDirectionality_baseDirectionalityPredictionMode_outTokenizedLogicalOrderIndexes_outReorderingPermutation_outMirroredVisualString_outLogicalBaseDirection_(v290, v291, (uint64_t)v799, 2, v289, 0, &v830, &v829, &v828, &v831);
    id v794 = v830;

    id v817 = v829;
    id v801 = v828;

    self->_bidiTransforunint64_t m = (CRBiDiTransform *)v831;
    if (!v797)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v308 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v308, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v308, OS_LOG_TYPE_FAULT, "CHVisualToLogicalTransformStep encountered ubidi failure", buf, 2u);
      }

      v783 = v810;
      goto LABEL_93;
    }
    id v814 = v795;
    id v789 = v794;
    id v812 = v801;
    v791 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v292, v293, v294, v295, v296);
    v790 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v297, v298, v299, v300, v301);
    v307 = self->_bidiTransform;
    if (v307 == (CRBiDiTransform *)1)
    {
      unsigned int isNaturallyRTL = 1;
    }
    else if (v307 == (CRBiDiTransform *)255)
    {
      unsigned int isNaturallyRTL = objc_msgSend__isNaturallyRTL(v812, v302, v303, v304, v305, v306);
    }
    else
    {
      unsigned int isNaturallyRTL = 0;
    }
    long long v837 = 0u;
    long long v838 = 0u;
    long long v835 = 0u;
    long long v836 = 0u;
    id v806 = v789;
    uint64_t v786 = objc_msgSend_countByEnumeratingWithState_objects_count_(v806, v309, (uint64_t)&v835, (uint64_t)&v846, 16, v310);
    if (v786)
    {
      uint64_t v788 = *(void *)v836;
      do
      {
        uint64_t v792 = 0;
        while (2)
        {
          if (*(void *)v836 != v788) {
            objc_enumerationMutation(v806);
          }
          unint64_t v824 = 0;
          v316 = *(void **)(*((void *)&v835 + 1) + 8 * v792);
          while (1)
          {
            if (v824 >= objc_msgSend_count(v814, v311, v312, v313, v314, v315)) {
              goto LABEL_75;
            }
            v820 = objc_msgSend_objectAtIndexedSubscript_(v814, v317, v824, v318, v319, v320);
            v326 = objc_msgSend_array(v316, v321, v322, v323, v324, v325);
            v331 = objc_msgSend_sortedArrayUsingSelector_(v326, v327, (uint64_t)sel_compare_, v328, v329, v330);

            v337 = objc_msgSend_array(v820, v332, v333, v334, v335, v336);
            v342 = objc_msgSend_sortedArrayUsingSelector_(v337, v338, (uint64_t)sel_compare_, v339, v340, v341);

            if (objc_msgSend_isEqualToArray_(v331, v343, (uint64_t)v342, v344, v345, v346)) {
              break;
            }

            ++v824;
          }
          v351 = objc_msgSend_numberWithInteger_(NSNumber, v347, v824, v348, v349, v350);
          objc_msgSend_addObject_(v791, v352, (uint64_t)v351, v353, v354, v355);

          id v356 = v812;
          id v357 = v316;
          v358 = (void *)MEMORY[0x1E4F28E78];
          uint64_t v364 = objc_msgSend_count(v357, v359, v360, v361, v362, v363);
          v369 = objc_msgSend_stringWithCapacity_(v358, v365, v364, v366, v367, v368);
          long long v841 = 0u;
          long long v842 = 0u;
          long long v839 = 0u;
          long long v840 = 0u;
          id v370 = v357;
          uint64_t v378 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v371, (uint64_t)&v839, (uint64_t)buf, 16, v372);
          if (v378)
          {
            uint64_t v379 = *(void *)v840;
            do
            {
              for (uint64_t k = 0; k != v378; ++k)
              {
                if (*(void *)v840 != v379) {
                  objc_enumerationMutation(v370);
                }
                uint64_t v381 = objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v839 + 1) + 8 * k), v373, v374, v375, v376, v377);
                v385 = objc_msgSend_substringWithRange_(v356, v382, v381, 1, v383, v384);
                objc_msgSend_appendString_(v369, v386, (uint64_t)v385, v387, v388, v389);
              }
              uint64_t v378 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v373, (uint64_t)&v839, (uint64_t)buf, 16, v377);
            }
            while (v378);
          }

          v395 = objc_msgSend_copy(v369, v390, v391, v392, v393, v394);
          id v396 = v395;
          v405 = @"الله";
          if ((objc_msgSend_isEqualToString_(v396, v397, @"اللّه", v398, v399, v400) & 1) == 0
            && (objc_msgSend_isEqualToString_(v396, v401, @"اللَّه", v402, v403, v404) & 1) == 0)
          {
            v405 = @"لله";
            if ((objc_msgSend_isEqualToString_(v396, v406, @"للّه", v407, v408, v409) & 1) == 0
              && (objc_msgSend_isEqualToString_(v396, v410, @"للَّه", v411, v412, v413) & 1) == 0)
            {
              v405 = (__CFString *)v396;
            }
          }

          v414 = objc_opt_class();
          v418 = objc_msgSend_performInverseBiDiForNumeric_isRTLContext_(v414, v415, (uint64_t)v405, isNaturallyRTL, v416, v417);

          objc_msgSend_addObject_(v790, v419, (uint64_t)v418, v420, v421, v422);
          if (v824 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_75:

            int v435 = 0;
            id v428 = v803;
            id v434 = v804;
            goto LABEL_76;
          }
          if (++v792 != v786) {
            continue;
          }
          break;
        }
        uint64_t v786 = objc_msgSend_countByEnumeratingWithState_objects_count_(v806, v311, (uint64_t)&v835, (uint64_t)&v846, 16, v315);
      }
      while (v786);
    }

    id v428 = (id)objc_msgSend_copy(v791, v423, v424, v425, v426, v427);
    id v434 = (id)objc_msgSend_copy(v790, v429, v430, v431, v432, v433);
    int v435 = 1;
LABEL_76:

    id v436 = v428;
    id v815 = v434;

    uint64_t v442 = objc_msgSend_count(obj, v437, v438, v439, v440, v441);
    if (v442 == objc_msgSend_count(v436, v443, v444, v445, v446, v447))
    {
      if (v435)
      {
        if (objc_msgSend_count(obj, v448, v449, v450, v451, v452))
        {
          v457 = objc_msgSend_objectAtIndexedSubscript_(v436, v453, 0, v454, v455, v456);
          uint64_t v463 = objc_msgSend_unsignedIntegerValue(v457, v458, v459, v460, v461, v462);

          v468 = objc_msgSend_objectAtIndexedSubscript_(obj, v464, v463, v465, v466, v467);
          v825 = objc_msgSend_objectAtIndexedSubscript_(v815, v469, 0, v470, v471, v472);
          uint64_t v478 = objc_msgSend_properties(v468, v473, v474, v475, v476, v477);
          v483 = objc_msgSend_objectAtIndexedSubscript_(obj, v479, 0, v480, v481, v482);
          LOBYTE(v463) = objc_msgSend_properties(v483, v484, v485, v486, v487, v488);

          v489 = [CHTokenizedTextResultToken alloc];
          v821 = objc_msgSend_strokeIndexes(v468, v490, v491, v492, v493, v494);
          uint64_t v500 = objc_msgSend_wordID(v468, v495, v496, v497, v498, v499);
          objc_msgSend_modelScore(v468, v501, v502, v503, v504, v505);
          double v507 = v506;
          objc_msgSend_recognitionScore(v468, v508, v509, v510, v511, v512);
          double v514 = v513;
          objc_msgSend_combinedScore(v468, v515, v516, v517, v518, v519);
          double v521 = v520;
          objc_msgSend_alignmentScore(v468, v522, v523, v524, v525, v526);
          double v528 = v527;
          v534 = objc_msgSend_recognizerSourceLocale(v468, v529, v530, v531, v532, v533);
          uint64_t v540 = objc_msgSend_inputSources(v468, v535, v536, v537, v538, v539);
          uint64_t v546 = objc_msgSend_substrokeCount(v468, v541, v542, v543, v544, v545);
          objc_msgSend_bounds(v468, v547, v548, v549, v550, v551);
          v557 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v489, v552, (uint64_t)v825, (uint64_t)v821, v500, v463 & 0x20 | v478 & 0xFFFFFFFFFFFFFFDFLL, v534, v540, v507, v514, v521, v528, v553, v554, v555, v556, v546);

          objc_msgSend_addObject_(v809, v558, (uint64_t)v557, v559, v560, v561);
          for (unint64_t m = 1; m < objc_msgSend_count(obj, v562, v563, v564, v565, v566); ++m)
          {
            v568 = objc_msgSend_objectAtIndexedSubscript_(v436, v453, m, v454, v455, v456);
            uint64_t v574 = objc_msgSend_unsignedIntegerValue(v568, v569, v570, v571, v572, v573);

            v579 = objc_msgSend_objectAtIndexedSubscript_(obj, v575, v574, v576, v577, v578);
            v826 = objc_msgSend_objectAtIndexedSubscript_(v815, v580, m, v581, v582, v583);
            uint64_t v589 = objc_msgSend_properties(v579, v584, v585, v586, v587, v588);
            v590 = [CHTokenizedTextResultToken alloc];
            v822 = objc_msgSend_strokeIndexes(v579, v591, v592, v593, v594, v595);
            uint64_t v601 = objc_msgSend_wordID(v579, v596, v597, v598, v599, v600);
            objc_msgSend_modelScore(v579, v602, v603, v604, v605, v606);
            double v608 = v607;
            objc_msgSend_recognitionScore(v579, v609, v610, v611, v612, v613);
            double v615 = v614;
            objc_msgSend_combinedScore(v579, v616, v617, v618, v619, v620);
            double v622 = v621;
            objc_msgSend_alignmentScore(v579, v623, v624, v625, v626, v627);
            double v629 = v628;
            v635 = objc_msgSend_recognizerSourceLocale(v579, v630, v631, v632, v633, v634);
            uint64_t v641 = objc_msgSend_inputSources(v579, v636, v637, v638, v639, v640);
            uint64_t v647 = objc_msgSend_substrokeCount(v579, v642, v643, v644, v645, v646);
            objc_msgSend_bounds(v579, v648, v649, v650, v651, v652);
            v658 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v590, v653, (uint64_t)v826, (uint64_t)v822, v601, v589 | 0x20, v635, v641, v608, v615, v622, v629, v654, v655, v656, v657, v647);

            objc_msgSend_addObject_(v809, v659, (uint64_t)v658, v660, v661, v662);
          }
        }
        goto LABEL_92;
      }
    }
    else
    {
      uint64_t v663 = objc_msgSend_count(obj, v448, v449, v450, v451, v452);
      if (v663 != objc_msgSend_count(v436, v664, v665, v666, v667, v668))
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v669 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v669, OS_LOG_TYPE_FAULT))
        {
          uint64_t v675 = objc_msgSend_count(obj, v670, v671, v672, v673, v674);
          uint64_t v681 = objc_msgSend_count(v436, v676, v677, v678, v679, v680);
          *(_DWORD *)buf = 134218498;
          *(void *)&buf[4] = v675;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v681;
          *(_WORD *)&buf[22] = 2112;
          v851 = v799;
          _os_log_impl(&dword_1C492D000, v669, OS_LOG_TYPE_FAULT, "CHVisualToLogicalTransformStep resulted in inconsistent token mapping. visualTokensInPath count (%lu) != tokenMapping count (%lu) for visual string %@", buf, 0x20u);
        }
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v851 = sub_1C4C089AC;
    v852 = (CHVisualToLogicalTransformStep *)sub_1C4C089BC;
    v853 = 0;
    v682 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v683 = objc_msgSend_length(v812, v448, v449, v450, v451, v452);
    v688 = objc_msgSend_stringWithCapacity_(v682, v684, v683, v685, v686, v687);
    v694 = objc_msgSend_result(v810, v689, v690, v691, v692, v693);
    v700 = objc_msgSend_result(v810, v695, v696, v697, v698, v699);
    uint64_t v706 = objc_msgSend_tokenColumnCount(v700, v701, v702, v703, v704, v705);
    v827[0] = MEMORY[0x1E4F143A8];
    v827[1] = 3221225472;
    v827[2] = sub_1C4C183A8;
    v827[3] = &unk_1E64E31B8;
    v827[4] = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v694, v707, (uint64_t)v802, 0, v706, (uint64_t)v827);

    for (unint64_t n = 0; n < objc_msgSend_count(v817, v708, v709, v710, v711, v712); ++n)
    {
      v718 = objc_msgSend_objectAtIndexedSubscript_(v817, v714, n, v715, v716, v717);
      uint64_t v724 = objc_msgSend_integerValue(v718, v719, v720, v721, v722, v723);
      v728 = objc_msgSend_substringWithRange_(v812, v725, v724, 1, v726, v727);
      objc_msgSend_appendString_(v688, v729, (uint64_t)v728, v730, v731, v732);
    }
    objc_msgSend_setString_(*(void **)(*(void *)&buf[8] + 40), v714, (uint64_t)v688, v715, v716, v717);
    v738 = objc_msgSend_copy(*(void **)(*(void *)&buf[8] + 40), v733, v734, v735, v736, v737);
    objc_msgSend_addObject_(v809, v739, (uint64_t)v738, v740, v741, v742);

    _Block_object_dispose(buf, 8);
LABEL_92:
    objc_msgSend_addObject_(v784, v453, (uint64_t)v809, v454, v455, v456);
    v748 = objc_msgSend_result(v810, v743, v744, v745, v746, v747);
    v754 = objc_msgSend_transcriptionPathScores(v748, v749, v750, v751, v752, v753);
    v759 = objc_msgSend_objectAtIndexedSubscript_(v754, v755, v808, v756, v757, v758);
    objc_msgSend_addObject_(v785, v760, (uint64_t)v759, v761, v762, v763);

    v803 = v436;
    v804 = v815;
LABEL_93:

    _Block_object_dispose(&v843, 8);
    ++v808;
    if (!v797) {
      goto LABEL_100;
    }
  }
  v764 = objc_msgSend_result(v810, v74, v75, v76, v77, v78);
  v768 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v764, v765, (uint64_t)v784, (uint64_t)v785, v766, v767);
  if (v810) {
    objc_storeStrong(v810 + 3, v768);
  }

  v769 = self->_bidiTransform;
  v775 = objc_msgSend_result(v810, v770, v771, v772, v773, v774);
  objc_msgSend_setBaseWritingDirection_(v775, v776, (uint64_t)v769, v777, v778, v779);

  if (self->_mode == 6) {
    self->_bidiTransforunint64_t m = bidiTransform;
  }
  v783 = v810;
LABEL_100:

  return v783;
}

- (void).cxx_destruct
{
}

@end