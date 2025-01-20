@interface CHJapaneseTokenizationAndConversionStep
- (CHJapaneseTokenizationAndConversionStep)initWithMecabra:(id)a3 wordLanguageModel:(void *)a4 ovsStringChecker:(id)a5 promoteKanaConversion:(BOOL)a6;
- (id)process:(id)a3 options:(id)a4;
- (void)dealloc;
@end

@implementation CHJapaneseTokenizationAndConversionStep

- (CHJapaneseTokenizationAndConversionStep)initWithMecabra:(id)a3 wordLanguageModel:(void *)a4 ovsStringChecker:(id)a5 promoteKanaConversion:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHJapaneseTokenizationAndConversionStep;
  v12 = [(CHJapaneseTokenizationAndConversionStep *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mecabraWrapper, a3);
    v13->_mecabraContextRef = (__MecabraContext *)MecabraContextCreateMutable();
    v13->_wordLanguageModel = (void *)LMLanguageModelRetain();
    v13->_promoteKanaConversion = a6;
    objc_storeStrong((id *)&v13->_ovsStringChecker, a5);
  }

  return v13;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v511 = *MEMORY[0x1E4F143B8];
  v452 = (id *)a3;
  id v448 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHJapaneseTokenizationAndConversionStep is running", buf, 2u);
  }

  v469 = objc_msgSend_result(v452, v6, v7, v8, v9, v10);
  v16 = objc_msgSend_string(MEMORY[0x1E4F28E78], v11, v12, v13, v14, v15);
  v508[0] = MEMORY[0x1E4F143A8];
  v508[1] = 3221225472;
  v508[2] = sub_1C4C22214;
  v508[3] = &unk_1E64E3150;
  id v451 = v16;
  id v509 = v451;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v469, v17, (uint64_t)v508, v18, v19, v20);
  v450 = objc_msgSend_leftContext(v452, v21, v22, v23, v24, v25);
  if (objc_msgSend_length(v450, v26, v27, v28, v29, v30))
  {
    objc_msgSend_mecabra(self->_mecabraWrapper, v31, v32, v33, v34, v35, v448);
    uint64_t LengthForContextString = MecabraGetLengthForContextString();
    uint64_t v42 = objc_msgSend_length(v450, v37, v38, v39, v40, v41);
    v47 = objc_msgSend_substringFromIndex_(v450, v43, v42 - LengthForContextString, v44, v45, v46);
    if (objc_msgSend_length(v47, v48, v49, v50, v51, v52))
    {
      objc_msgSend_mecabra(self->_mecabraWrapper, v53, v54, v55, v56, v57);
      id CandidateFromContextString = (id)MecabraCreateCandidateFromContextString();
    }
    else
    {
      id CandidateFromContextString = 0;
    }
  }
  else
  {
    id CandidateFromContextString = 0;
  }
  v58 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v31, v32, v33, v34, v35, v448);
  v64 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v59, v60, v61, v62, v63);
  v461 = objc_msgSend_componentsSeparatedByCharactersInSet_(v451, v65, (uint64_t)v64, v66, v67, v68);

  unint64_t v470 = 0;
  BOOL v74 = 0;
  while (1)
  {
    unint64_t v75 = objc_msgSend_count(v461, v69, v70, v71, v72, v73);
    unint64_t v80 = 0x1E4F1C000;
    uint64_t v81 = v470;
    if (v470 >= v75) {
      break;
    }
    v82 = objc_msgSend_objectAtIndexedSubscript_(v461, v76, v470, v77, v78, v79);
    v467 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v82, v83, @"␠", @" ", v84, v85);

    if (!objc_msgSend_length(v467, v86, v87, v88, v89, v90)) {
      goto LABEL_40;
    }
    if (v470) {
      uint64_t v91 = 0;
    }
    else {
      uint64_t v91 = (uint64_t)CandidateFromContextString;
    }
    v92 = objc_opt_class();
    uint64_t v98 = objc_msgSend_mecabra(self->_mecabraWrapper, v93, v94, v95, v96, v97);
    v465 = objc_msgSend_mecabraTokenizationAndKanaConversionForString_mecabraEngine_contextRef_leftCandidateRef_alternativeCandidateLimit_(v92, v99, (uint64_t)v467, v98, (uint64_t)self->_mecabraContextRef, v91, 2);
    if (objc_msgSend_count(v465, v100, v101, v102, v103, v104)) {
      goto LABEL_22;
    }
    if (qword_1EA3CA000 != -1)
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v105 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
        goto LABEL_21;
      }
LABEL_20:
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v105, OS_LOG_TYPE_FAULT, "At least one phrase should be returned in Mecabra tokenization and conversion step.", buf, 2u);
      goto LABEL_21;
    }
    v105 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      goto LABEL_20;
    }
LABEL_21:

LABEL_22:
    long long v506 = 0u;
    long long v507 = 0u;
    long long v504 = 0u;
    long long v505 = 0u;
    id v106 = v465;
    uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v107, (uint64_t)&v504, (uint64_t)v510, 16, v108);
    if (!v114) {
      goto LABEL_39;
    }
    uint64_t v115 = *(void *)v505;
    do
    {
      for (uint64_t i = 0; i != v114; ++i)
      {
        if (*(void *)v505 != v115) {
          objc_enumerationMutation(v106);
        }
        v117 = *(void **)(*((void *)&v504 + 1) + 8 * i);
        if (!objc_msgSend_count(v117, v109, v110, v111, v112, v113))
        {
          if (qword_1EA3CA000 == -1)
          {
            v122 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT)) {
              goto LABEL_32;
            }
          }
          else
          {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            v122 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
            {
LABEL_32:
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v122, OS_LOG_TYPE_FAULT, "At least one candidate should be returned for each phrase in Mecabra tokenization and conversion step.", buf, 2u);
            }
          }
        }
        objc_msgSend_addObject_(v58, v118, (uint64_t)v117, v119, v120, v121);
        if (v74)
        {
          BOOL v74 = 1;
        }
        else
        {
          v123 = objc_msgSend_lastObject(v58, v109, v110, v111, v112, v113);
          BOOL v74 = (unint64_t)objc_msgSend_count(v123, v124, v125, v126, v127, v128) > 1;
        }
      }
      uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v109, (uint64_t)&v504, (uint64_t)v510, 16, v113);
    }
    while (v114);
LABEL_39:

LABEL_40:
    ++v470;
  }
  if (CandidateFromContextString) {

  }
  if (v74) {
    goto LABEL_48;
  }
  if (objc_msgSend_count(v58, v76, v81, v77, v78, v79))
  {
    *(void *)buf = 0;
    v494 = buf;
    uint64_t v495 = 0x2020000000;
    v496 = 0;
    v134 = objc_msgSend_transcriptionPaths(v469, v129, v130, v131, v132, v133);
    v140 = objc_msgSend_firstObject(v134, v135, v136, v137, v138, v139);
    v146 = objc_msgSend_transcriptionPaths(v469, v141, v142, v143, v144, v145);
    v152 = objc_msgSend_firstObject(v146, v147, v148, v149, v150, v151);
    uint64_t v158 = objc_msgSend_length(v152, v153, v154, v155, v156, v157);
    v503[0] = MEMORY[0x1E4F143A8];
    v503[1] = 3221225472;
    v503[2] = sub_1C4C22310;
    v503[3] = &unk_1E64E31B8;
    v503[4] = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v469, v159, (uint64_t)v140, 0, v158, (uint64_t)v503);

    unint64_t v80 = 0x1E4F1C000uLL;
    uint64_t v165 = objc_msgSend_count(v58, v160, v161, v162, v163, v164);
    uint64_t v166 = *((void *)v494 + 3);
    _Block_object_dispose(buf, 8);
    if (v165 != v166)
    {
LABEL_48:
      v167 = objc_msgSend_array(*(void **)(v80 + 2632), v76, v81, v77, v78, v79);
      v468 = objc_msgSend_array(*(void **)(v80 + 2632), v168, v169, v170, v171, v172);
      for (unint64_t j = 0; ; unint64_t j = v471 + 1)
      {
        v179 = objc_msgSend_transcriptionPaths(v469, v173, v174, v175, v176, v177);
        uint64_t v471 = j;
        BOOL v185 = j < objc_msgSend_count(v179, v180, v181, v182, v183, v184);

        if (!v185)
        {
          v441 = objc_msgSend_result(v452, v186, v187, v188, v189, v190);
          v445 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v441, v442, (uint64_t)v167, (uint64_t)v468, v443, v444);
          if (v452) {
            objc_storeStrong(v452 + 3, v445);
          }

          break;
        }
        v191 = objc_msgSend_transcriptionPaths(v469, v186, v187, v188, v189, v190);
        v460 = objc_msgSend_objectAtIndexedSubscript_(v191, v192, v471, v193, v194, v195);

        v458 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v196, v197, v198, v199, v200);
        v457 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v201, v202, v203, v204, v205);
        v456 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v206, v207, v208, v209, v210);
        v454 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v211, v212, v213, v214, v215);
        v453 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v216, v217, v218, v219, v220);
        v455 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v221, v222, v223, v224, v225);
        v502[0] = 0;
        v502[1] = v502;
        v502[2] = 0x2020000000;
        v502[3] = 0;
        v501[0] = 0;
        v501[1] = v501;
        v501[2] = 0x2020000000;
        v501[3] = 0;
        v499[0] = 0;
        v499[1] = v499;
        v499[2] = 0x2020000000;
        uint64_t v500 = 0;
        v230 = objc_msgSend_objectAtIndexedSubscript_(v58, v226, 0, v227, v228, v229);
        v236 = objc_msgSend_firstObject(v230, v231, v232, v233, v234, v235);
        uint64_t v242 = objc_msgSend_length(v236, v237, v238, v239, v240, v241);

        uint64_t v500 = v242;
        *(void *)buf = 0;
        v494 = buf;
        uint64_t v495 = 0x3032000000;
        v496 = sub_1C4C089AC;
        v497 = sub_1C4C089BC;
        objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v243, (uint64_t)&stru_1F20141C8, v244, v245, v246);
        id v498 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v487 = 0;
        v488 = &v487;
        uint64_t v489 = 0x3032000000;
        v490 = sub_1C4C089AC;
        v491 = sub_1C4C089BC;
        id v492 = 0;
        uint64_t v252 = objc_msgSend_tokenColumnCount(v469, v247, v248, v249, v250, v251);
        v472[0] = MEMORY[0x1E4F143A8];
        v472[1] = 3221225472;
        v472[2] = sub_1C4C22328;
        v472[3] = &unk_1E64E5368;
        uint64_t v486 = v471;
        v481 = &v487;
        id v459 = v456;
        id v473 = v459;
        id v253 = v455;
        id v474 = v253;
        id v254 = v453;
        id v475 = v254;
        id v255 = v458;
        id v476 = v255;
        id v466 = v454;
        id v477 = v466;
        id v256 = v457;
        v482 = v501;
        v483 = v499;
        v484 = buf;
        id v464 = v256;
        id v478 = v256;
        v479 = self;
        id v480 = v58;
        v485 = v502;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v469, v257, (uint64_t)v460, 0, v252, (uint64_t)v472);
        if (!v471)
        {
          if (objc_msgSend_count(v459, v258, v259, v260, v261, v262))
          {
            for (unint64_t k = 0; k < objc_msgSend_count(v253, v263, v264, v265, v266, v267); ++k)
            {
              while (objc_msgSend_count(v254, v269, v270, v271, v272, v273) <= k)
              {
                v279 = objc_msgSend_mutableCopy(v255, v274, v275, v276, v277, v278);
                objc_msgSend_addObject_(v254, v280, (uint64_t)v279, v281, v282, v283);
              }
              v284 = objc_msgSend_objectAtIndexedSubscript_(v253, v274, k, v276, v277, v278);
              BOOL v290 = objc_msgSend_count(v284, v285, v286, v287, v288, v289) == 0;

              if (!v290)
              {
                v291 = objc_msgSend_objectAtIndexedSubscript_(v253, v263, k, v265, v266, v267);
                v296 = objc_msgSend_objectAtIndexedSubscript_(v254, v292, k, v293, v294, v295);
                sub_1C4C045E8((uint64_t)CHPostprocessingStep, v291, v466, v296, 0);
              }
            }
            sub_1C4C045E8((uint64_t)CHPostprocessingStep, v459, v466, v255, v464);
          }
          if (!objc_msgSend_count(v464, v263, v264, v265, v266, v267))
          {
            uint64_t v259 = v488[5];
            if (v259) {
              objc_msgSend_addObject_(v464, v258, v259, v260, v261, v262);
            }
          }
        }
        if (self && self->_promoteKanaConversion)
        {
          if (objc_msgSend_count(v255, v258, v259, v260, v261, v262))
          {
            objc_msgSend_addObject_(v167, v297, (uint64_t)v255, v299, v300, v301);
            v307 = objc_msgSend_transcriptionPathScores(v469, v302, v303, v304, v305, v306);
            v312 = objc_msgSend_objectAtIndexedSubscript_(v307, v308, v471, v309, v310, v311);
            v318 = objc_msgSend_copy(v312, v313, v314, v315, v316, v317);
            objc_msgSend_addObject_(v468, v319, (uint64_t)v318, v320, v321, v322);
          }
          if (!objc_msgSend_count(v464, v297, v298, v299, v300, v301)
            || (objc_msgSend_isEqual_(v464, v323, (uint64_t)v255, v325, v326, v327) & 1) != 0)
          {
            goto LABEL_76;
          }
          objc_msgSend_addObject_(v167, v323, (uint64_t)v464, v325, v326, v327);
          v333 = objc_msgSend_transcriptionPathScores(v469, v328, v329, v330, v331, v332);
          v338 = objc_msgSend_objectAtIndexedSubscript_(v333, v334, v471, v335, v336, v337);
          v344 = objc_msgSend_copy(v338, v339, v340, v341, v342, v343);
          objc_msgSend_addObject_(v468, v345, (uint64_t)v344, v346, v347, v348);
        }
        else
        {
          if (objc_msgSend_count(v464, v258, v259, v260, v261, v262))
          {
            objc_msgSend_addObject_(v167, v349, (uint64_t)v464, v351, v352, v353);
            v359 = objc_msgSend_transcriptionPathScores(v469, v354, v355, v356, v357, v358);
            v364 = objc_msgSend_objectAtIndexedSubscript_(v359, v360, v471, v361, v362, v363);
            v370 = objc_msgSend_copy(v364, v365, v366, v367, v368, v369);
            objc_msgSend_addObject_(v468, v371, (uint64_t)v370, v372, v373, v374);
          }
          if (!objc_msgSend_count(v255, v349, v350, v351, v352, v353)
            || (objc_msgSend_isEqual_(v255, v323, (uint64_t)v464, v325, v326, v327) & 1) != 0)
          {
            goto LABEL_76;
          }
          objc_msgSend_addObject_(v167, v323, (uint64_t)v255, v325, v326, v327);
          v333 = objc_msgSend_transcriptionPathScores(v469, v375, v376, v377, v378, v379);
          v338 = objc_msgSend_objectAtIndexedSubscript_(v333, v380, v471, v381, v382, v383);
          v344 = objc_msgSend_copy(v338, v384, v385, v386, v387, v388);
          objc_msgSend_addObject_(v468, v389, (uint64_t)v344, v390, v391, v392);
        }

LABEL_76:
        for (unint64_t m = 0; m < objc_msgSend_count(v254, v323, v324, v325, v326, v327); ++m)
        {
          v398 = objc_msgSend_objectAtIndexedSubscript_(v254, v394, m, v395, v396, v397);
          if (objc_msgSend_count(v398, v399, v400, v401, v402, v403))
          {
            unint64_t v409 = 0;
            while (v409 < objc_msgSend_count(v167, v404, v405, v406, v407, v408))
            {
              v414 = objc_msgSend_objectAtIndexedSubscript_(v167, v410, v409, v411, v412, v413);
              char isEqual = objc_msgSend_isEqual_(v398, v415, (uint64_t)v414, v416, v417, v418);

              ++v409;
              if (isEqual) {
                goto LABEL_84;
              }
            }
            objc_msgSend_addObject_(v167, v410, (uint64_t)v398, v411, v412, v413);
            v425 = objc_msgSend_transcriptionPathScores(v469, v420, v421, v422, v423, v424);
            v430 = objc_msgSend_objectAtIndexedSubscript_(v425, v426, v471, v427, v428, v429);
            v436 = objc_msgSend_copy(v430, v431, v432, v433, v434, v435);
            objc_msgSend_addObject_(v468, v437, (uint64_t)v436, v438, v439, v440);
          }
LABEL_84:
        }
        _Block_object_dispose(&v487, 8);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v499, 8);
        _Block_object_dispose(v501, 8);
        _Block_object_dispose(v502, 8);
      }
    }
  }
  v446 = v452;

  return v446;
}

- (void)dealloc
{
  if (self->_mecabraContextRef)
  {
    MecabraContextRelease();
    self->_mecabraContextRef = 0;
  }
  if (self->_wordLanguageModel) {
    LMLanguageModelRelease();
  }
  mecabraWrapper = self->_mecabraWrapper;
  self->_mecabraWrapper = 0;

  v4.receiver = self;
  v4.super_class = (Class)CHJapaneseTokenizationAndConversionStep;
  [(CHJapaneseTokenizationAndConversionStep *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end