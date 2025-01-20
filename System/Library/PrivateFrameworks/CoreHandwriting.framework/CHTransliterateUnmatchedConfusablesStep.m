@interface CHTransliterateUnmatchedConfusablesStep
- (BOOL)doesTransliterateAtIndexResolveUnmatchingCase:(id)a3 atIndex:(int64_t)a4 withString:(id)a5 unmatchingCase:(int)a6 shouldForceLocaleFormatNumber:(BOOL)a7;
- (BOOL)updateUnmatchingSymbol:(id)a3 unmatchingType:(int)a4 mode:(id)a5 shouldForceLocaleFormatNumber:(BOOL)a6 outUpdatedPathTokens:(id)a7;
- (CHTransliterateUnmatchedConfusablesStep)initWithCodemap:(id)a3;
- (id).cxx_construct;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHTransliterateUnmatchedConfusablesStep

- (CHTransliterateUnmatchedConfusablesStep)initWithCodemap:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHTransliterateUnmatchedConfusablesStep;
  v9 = [(CHTransliterateUnmatchedConfusablesStep *)&v16 init];
  if (v9)
  {
    objc_msgSend_createLatexHelperFromMathCodemap_(CHMathPostProcessingManager, v5, (uint64_t)v4, v6, v7, v8);
    uint64_t value = (uint64_t)v9->latexHelper.__ptr_.__value_;
    v9->latexHelper.__ptr_.__value_ = v15;
    if (value)
    {
      uint64_t v11 = sub_1C494A3D8(value);
      MEMORY[0x1C8786460](v11, 0x10A0C409F3568C5);
    }
    mathOpeningConfusableMappings = v9->_mathOpeningConfusableMappings;
    v9->_mathOpeningConfusableMappings = (NSDictionary *)&unk_1F203CE50;

    mathClosingConfusableMappings = v9->_mathClosingConfusableMappings;
    v9->_mathClosingConfusableMappings = (NSDictionary *)&unk_1F203CE78;
  }
  return v9;
}

- (BOOL)doesTransliterateAtIndexResolveUnmatchingCase:(id)a3 atIndex:(int64_t)a4 withString:(id)a5 unmatchingCase:(int)a6 shouldForceLocaleFormatNumber:(BOOL)a7
{
  BOOL v58 = a7;
  id v11 = a3;
  id v59 = a5;
  v17 = objc_msgSend_mutableCopy(v11, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_objectAtIndexedSubscript_(v11, v18, a4, v19, v20, v21);
  v26 = objc_msgSend_updatedToken_withString_(CHTokenizedMathResultToken, v23, (uint64_t)v22, (uint64_t)v59, v24, v25);

  objc_msgSend_setObject_atIndexedSubscript_(v17, v27, (uint64_t)v26, a4, v28, v29);
  v33 = objc_msgSend_concatenateTokensIntoTranscription_tokenSeparator_(CHMathPostProcessingManager, v30, (uint64_t)v17, @" ", v31, v32);
  uint64_t value = self->latexHelper.__ptr_.__value_;
  id v35 = v33;
  v41 = (const char *)objc_msgSend_UTF8String(v35, v36, v37, v38, v39, v40);
  size_t v42 = strlen(v41);
  if (v42 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  v43 = (void *)v42;
  if (v42 >= 0x17)
  {
    uint64_t v45 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v42 | 7) != 0x17) {
      uint64_t v45 = v42 | 7;
    }
    uint64_t v46 = v45 + 1;
    v44 = (void **)operator new(v45 + 1);
    __dst[1] = v43;
    unint64_t v61 = v46 | 0x8000000000000000;
    __dst[0] = v44;
    goto LABEL_8;
  }
  HIBYTE(v61) = v42;
  v44 = __dst;
  if (v42) {
LABEL_8:
  }
    memmove(v44, v41, (size_t)v43);
  *((unsigned char *)v43 + (void)v44) = 0;
  sub_1C4B17C20((CoreHandwriting::LaTeXSyntaxHelper *)value, (uint64_t *)__dst, &v62);
  if (SHIBYTE(v61) < 0)
  {
    operator delete(__dst[0]);
    v49 = (char *)v63[0];
    if (!v63[0]) {
      goto LABEL_23;
    }
  }
  else
  {
    v49 = (char *)v63[0];
    if (!v63[0]) {
      goto LABEL_23;
    }
  }
  v50 = (char *)v63;
  v51 = v49;
  do
  {
    v52 = v51;
    v53 = v50;
    int v54 = *((_DWORD *)v51 + 8);
    if (v54 >= a6) {
      v50 = v51;
    }
    else {
      v51 += 8;
    }
    v51 = *(char **)v51;
  }
  while (v51);
  if (v50 != (char *)v63)
  {
    v55 = v54 >= a6 ? v52 : v53;
    if (*((_DWORD *)v55 + 8) <= a6)
    {
      char isTranscriptionValidExpression_limitToCurrentLocale = 0;
      goto LABEL_24;
    }
  }
LABEL_23:
  char isTranscriptionValidExpression_limitToCurrentLocale = objc_msgSend_isTranscriptionValidExpression_limitToCurrentLocale_(CHTokenizedMathResult, v49, (uint64_t)v17, v58, v47, v48);
  v49 = (char *)v63[0];
LABEL_24:
  sub_1C494AC4C((uint64_t)&v62, v49);

  return isTranscriptionValidExpression_limitToCurrentLocale;
}

- (BOOL)updateUnmatchingSymbol:(id)a3 unmatchingType:(int)a4 mode:(id)a5 shouldForceLocaleFormatNumber:(BOOL)a6 outUpdatedPathTokens:(id)a7
{
  BOOL v357 = a6;
  uint64_t v385 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v356 = a5;
  id v349 = a7;
  v367 = v10;
  uint64_t v14 = objc_msgSend_concatenateTokensIntoTranscription_tokenSeparator_(CHMathPostProcessingManager, v11, (uint64_t)v10, @" ", v12, v13);
  v358 = self;
  uint64_t value = self->latexHelper.__ptr_.__value_;
  id v348 = v14;
  uint64_t v21 = (const char *)objc_msgSend_UTF8String(v348, v16, v17, v18, v19, v20);
  size_t v22 = strlen(v21);
  if (v22 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  size_t v23 = v22;
  if (v22 >= 0x17)
  {
    uint64_t v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17) {
      uint64_t v25 = v22 | 7;
    }
    uint64_t v26 = v25 + 1;
    p_dst = (void **)operator new(v25 + 1);
    size_t v377 = v23;
    unint64_t v378 = v26 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v378) = v22;
  p_dst = (void **)&__dst;
  if (v22) {
LABEL_8:
  }
    memmove(p_dst, v21, v23);
  *((unsigned char *)p_dst + v23) = 0;
  sub_1C4B17C20((CoreHandwriting::LaTeXSyntaxHelper *)value, (uint64_t *)&__dst, &v379);
  if ((SHIBYTE(v378) & 0x80000000) == 0)
  {
    v27 = (void *)v380[0];
    if (!v380[0]) {
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  operator delete(__dst);
  v27 = (void *)v380[0];
  if (v380[0])
  {
LABEL_13:
    uint64_t v28 = v380;
    uint64_t v29 = v27;
    do
    {
      v30 = v29;
      uint64_t v31 = v28;
      int v32 = *((_DWORD *)v29 + 8);
      if (v32 >= a4) {
        uint64_t v28 = v29;
      }
      else {
        ++v29;
      }
      uint64_t v29 = (void *)*v29;
    }
    while (v29);
    if (v28 == v380) {
      goto LABEL_23;
    }
    v33 = v32 >= a4 ? v30 : v31;
    if (*((_DWORD *)v33 + 8) > a4) {
      goto LABEL_23;
    }
    if (v32 < a4) {
      v30 = v31;
    }
    __dst = 0;
    size_t v377 = 0;
    unint64_t v378 = 0;
    uint64_t v37 = (unsigned char *)v30[5];
    v36 = (unsigned char *)v30[6];
    int64_t v38 = v36 - v37;
    if (v36 == v37)
    {
      char v344 = 0;
LABEL_89:
      BOOL v34 = v344 & 1;
      v27 = (void *)v380[0];
      goto LABEL_24;
    }
    if (v38 < 0) {
      sub_1C494A220();
    }
    uint64_t v39 = (void **)operator new(v36 - v37);
    __dst = v39;
    unint64_t v378 = (unint64_t)v39 + 4 * (v38 >> 2);
    memcpy(v39, v37, v38);
    char v345 = 0;
    v346 = (int *)v39 + (v38 >> 2);
    size_t v377 = (size_t)v346;
LABEL_30:
    v347 = v39;
    uint64_t v353 = *(int *)v39;
    v362 = objc_msgSend_objectAtIndexedSubscript_(v367, v40, v353, v41, v42, v43);
    objc_msgSend_score(v362, v44, v45, v46, v47, v48);
    double v50 = v49;
    mathOpeningConfusableMappings = v358->_mathOpeningConfusableMappings;
    v57 = objc_msgSend_string(v362, v52, v53, v54, v55, v56);
    v62 = objc_msgSend_objectForKey_(mathOpeningConfusableMappings, v58, (uint64_t)v57, v59, v60, v61);

    long long v374 = 0u;
    long long v375 = 0u;
    long long v372 = 0u;
    long long v373 = 0u;
    obuint64_t j = v62;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v372, (uint64_t)v384, 16, v64);
    if (!v65)
    {

      v360 = 0;
      goto LABEL_84;
    }
    v360 = 0;
    float v71 = v50;
    uint64_t v351 = *(void *)v373;
    uint64_t v352 = v65;
    unint64_t v72 = v353;
LABEL_32:
    uint64_t v354 = 0;
    while (1)
    {
      if (*(void *)v373 != v351) {
        objc_enumerationMutation(obj);
      }
      uint64_t v365 = *(void *)(*((void *)&v372 + 1) + 8 * v354);
      if (v360) {
        goto LABEL_42;
      }
      v73 = objc_msgSend_objectAtIndexedSubscript_(v367, v66, v353, v68, v69, v70);
      uint64_t v79 = objc_msgSend_properties(v73, v74, v75, v76, v77, v78);

      if (objc_msgSend_isEqualToString_(v356, v80, @"opening", v81, v82, v83)) {
        break;
      }
      if (objc_msgSend_isEqualToString_(v356, v84, @"closing", v85, v86, v87))
      {
        v88 = objc_msgSend_objectAtIndexedSubscript_(v367, v94, v353, v95, v96, v97);
        uint64_t v79 = objc_msgSend_properties(v88, v98, v99, v100, v101, v102) & 0xFFFFFFFFFFFFEFFFLL;
        goto LABEL_40;
      }
LABEL_41:
      v103 = [CHTokenizedMathResultToken alloc];
      v108 = objc_msgSend_objectAtIndexedSubscript_(v367, v104, v353, v105, v106, v107);
      v114 = objc_msgSend_strokeIndexes(v108, v109, v110, v111, v112, v113);
      v119 = objc_msgSend_objectAtIndexedSubscript_(v367, v115, v353, v116, v117, v118);
      objc_msgSend_bounds(v119, v120, v121, v122, v123, v124);
      double v126 = v125;
      double v128 = v127;
      double v130 = v129;
      double v132 = v131;
      v137 = objc_msgSend_objectAtIndexedSubscript_(v367, v133, v353, v134, v135, v136);
      v143 = objc_msgSend_maskedAlternative(v137, v138, v139, v140, v141, v142);
      v148 = objc_msgSend_objectAtIndexedSubscript_(v367, v144, v353, v145, v146, v147);
      objc_msgSend_maskedAlternativeScore(v148, v149, v150, v151, v152, v153);
      v360 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v103, v154, v365, (uint64_t)v114, v79, (uint64_t)v143, 1.0, v126, v128, v130, v132, v155);

LABEL_42:
      v355 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v66, v67, v68, v69, v70);
      if (objc_msgSend_isEqualToString_(v356, v156, @"opening", v157, v158, v159))
      {
        for (unint64_t i = (int)v353 + 1; i < objc_msgSend_count(v367, v160, v161, v162, v163, v164); ++i)
        {
          v170 = objc_msgSend_numberWithInteger_(NSNumber, v166, i, v167, v168, v169);
          objc_msgSend_addObject_(v355, v171, (uint64_t)v170, v172, v173, v174);
        }
      }
      else if (objc_msgSend_isEqualToString_(v356, v160, @"closing", v162, v163, v164))
      {
        if ((int)v353 >= 1)
        {
          uint64_t v179 = (v353 - 1);
          do
          {
            v180 = objc_msgSend_numberWithInteger_(NSNumber, v175, v179, v176, v177, v178);
            objc_msgSend_addObject_(v355, v181, (uint64_t)v180, v182, v183, v184);
          }
          while (v179-- > 0);
        }
      }
      else
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v186 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
        {
          id v187 = v356;
          uint64_t v193 = objc_msgSend_UTF8String(v187, v188, v189, v190, v191, v192);
          *(_DWORD *)buf = 136315138;
          uint64_t v383 = v193;
          _os_log_impl(&dword_1C492D000, v186, OS_LOG_TYPE_ERROR, "Wrong parameter has been passed in post-processing: (%s). ", buf, 0xCu);
        }
      }
      long long v370 = 0u;
      long long v371 = 0u;
      long long v368 = 0u;
      long long v369 = 0u;
      id v363 = v355;
      uint64_t v366 = objc_msgSend_countByEnumeratingWithState_objects_count_(v363, v194, (uint64_t)&v368, (uint64_t)v381, 16, v195);
      if (v366)
      {
        uint64_t v364 = *(void *)v369;
        do
        {
          for (uint64_t j = 0; j != v366; ++j)
          {
            if (*(void *)v369 != v364) {
              objc_enumerationMutation(v363);
            }
            uint64_t v202 = objc_msgSend_integerValue(*(void **)(*((void *)&v368 + 1) + 8 * j), v196, v197, v198, v199, v200);
            v207 = objc_msgSend_objectAtIndexedSubscript_(v367, v203, v202, v204, v205, v206);
            v213 = objc_msgSend_string(v207, v208, v209, v210, v211, v212);
            if (objc_msgSend_isEqualToString_(v213, v214, v365, v215, v216, v217))
            {
              v222 = objc_msgSend_objectAtIndexedSubscript_(v367, v218, v202, v219, v220, v221);
              objc_msgSend_score(v222, v223, v224, v225, v226, v227);
              if (v233 >= v71)
              {
                uint64_t v202 = v72;
              }
              else
              {
                v234 = objc_msgSend_string(v362, v228, v229, v230, v231, v232);
                int shouldForceLocaleFormatNumber = objc_msgSend_doesTransliterateAtIndexResolveUnmatchingCase_atIndex_withString_unmatchingCase_shouldForceLocaleFormatNumber_(v358, v235, (uint64_t)v367, v202, (uint64_t)v234, a4, v357);

                if (!shouldForceLocaleFormatNumber) {
                  continue;
                }
                v237 = objc_msgSend_objectAtIndexedSubscript_(v367, v196, v202, v198, v199, v200);
                objc_msgSend_score(v237, v238, v239, v240, v241, v242);
                double v244 = v243;

                v249 = objc_msgSend_objectAtIndexedSubscript_(v367, v245, v202, v246, v247, v248);
                uint64_t v361 = objc_msgSend_properties(v249, v250, v251, v252, v253, v254);

                if (objc_msgSend_isEqualToString_(v356, v255, @"opening", v256, v257, v258))
                {
                  v263 = objc_msgSend_objectAtIndexedSubscript_(v367, v259, v202, v260, v261, v262);
                  uint64_t v269 = objc_msgSend_properties(v263, v264, v265, v266, v267, v268) & 0x1000;
                  goto LABEL_72;
                }
                if (objc_msgSend_isEqualToString_(v356, v259, @"closing", v260, v261, v262))
                {
                  v263 = objc_msgSend_objectAtIndexedSubscript_(v367, v270, v202, v271, v272, v273);
                  uint64_t v269 = objc_msgSend_properties(v263, v274, v275, v276, v277, v278) & 0x800;
LABEL_72:
                  uint64_t v361 = v269;
                }
                v279 = [CHTokenizedMathResultToken alloc];
                v207 = objc_msgSend_string(v362, v280, v281, v282, v283, v284);
                v213 = objc_msgSend_objectAtIndexedSubscript_(v367, v285, v202, v286, v287, v288);
                v222 = objc_msgSend_strokeIndexes(v213, v289, v290, v291, v292, v293);
                v298 = objc_msgSend_objectAtIndexedSubscript_(v367, v294, v202, v295, v296, v297);
                objc_msgSend_bounds(v298, v299, v300, v301, v302, v303);
                double v305 = v304;
                double v307 = v306;
                double v309 = v308;
                double v311 = v310;
                v316 = objc_msgSend_objectAtIndexedSubscript_(v367, v312, v202, v313, v314, v315);
                v322 = objc_msgSend_maskedAlternative(v316, v317, v318, v319, v320, v321);
                v327 = objc_msgSend_objectAtIndexedSubscript_(v367, v323, v202, v324, v325, v326);
                objc_msgSend_maskedAlternativeScore(v327, v328, v329, v330, v331, v332);
                uint64_t v335 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v279, v333, (uint64_t)v207, (uint64_t)v222, v361, (uint64_t)v322, 1.0, v305, v307, v309, v311, v334);

                float v71 = v244;
                v360 = (void *)v335;
              }

              goto LABEL_75;
            }
            uint64_t v202 = v72;
LABEL_75:

            unint64_t v72 = v202;
          }
          uint64_t v366 = objc_msgSend_countByEnumeratingWithState_objects_count_(v363, v196, (uint64_t)&v368, (uint64_t)v381, 16, v200);
        }
        while (v366);
      }

      if (++v354 == v352)
      {
        uint64_t v352 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v372, (uint64_t)v384, 16, v70);
        if (!v352)
        {

          if (v360 && (v72 & 0x8000000000000000) == 0 && v72 < objc_msgSend_count(v367, v336, v337, v338, v339, v340))
          {
            objc_msgSend_setObject_atIndexedSubscript_(v349, v341, (uint64_t)v360, v72, v342, v343);
            char v345 = 1;
          }
LABEL_84:

          uint64_t v39 = (void **)((char *)v347 + 4);
          if ((int *)((char *)v347 + 4) == v346)
          {
            if (__dst) {
              operator delete(__dst);
            }
            char v344 = v345;
            goto LABEL_89;
          }
          goto LABEL_30;
        }
        goto LABEL_32;
      }
    }
    v88 = objc_msgSend_objectAtIndexedSubscript_(v367, v84, v353, v85, v86, v87);
    uint64_t v79 = objc_msgSend_properties(v88, v89, v90, v91, v92, v93) & 0xFFFFFFFFFFFFF7FFLL;
LABEL_40:

    goto LABEL_41;
  }
LABEL_23:
  BOOL v34 = 0;
LABEL_24:
  sub_1C494AC4C((uint64_t)&v379, v27);

  return v34;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v86 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEBUG, "CHTransliterateUnmatchedConfusablesStep is running", buf, 2u);
  }

  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v86, v8, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v9, v10, v11);
  if (v16)
  {
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v86, v12, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v13, v14, v15);
    uint64_t v23 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);
  }
  else
  {
    uint64_t v23 = 1;
  }

  uint64_t v87 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25, v26, v27, v28);
  char v34 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    v36 = objc_msgSend_result(v6, v29, v30, v31, v32, v33, v86);
    uint64_t v42 = objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
    unint64_t v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);

    if (i >= v48) {
      break;
    }
    v52 = objc_msgSend_retrievePathTokens_atPathIndex_(self, v49, (uint64_t)v6, i, v50, v51);
    BOOL v58 = objc_msgSend_mutableCopy(v52, v53, v54, v55, v56, v57);
    uint64_t v64 = objc_msgSend_mutableCopy(v52, v59, v60, v61, v62, v63);
    int shouldForceLocaleFormatNumber_outUpdatedPathTokens = objc_msgSend_updateUnmatchingSymbol_unmatchingType_mode_shouldForceLocaleFormatNumber_outUpdatedPathTokens_(self, v65, (uint64_t)v52, 4, @"opening", v23, v58);
    int v68 = objc_msgSend_updateUnmatchingSymbol_unmatchingType_mode_shouldForceLocaleFormatNumber_outUpdatedPathTokens_(self, v67, (uint64_t)v58, 5, @"closing", v23, v64);
    char v73 = v68;
    if (shouldForceLocaleFormatNumber_outUpdatedPathTokens) {
      uint64_t v74 = (uint64_t)v58;
    }
    else {
      uint64_t v74 = (uint64_t)v52;
    }
    if (v68) {
      objc_msgSend_addObject_(v87, v69, (uint64_t)v64, v70, v71, v72);
    }
    else {
      objc_msgSend_addObject_(v87, v69, v74, v70, v71, v72);
    }
    char v34 = shouldForceLocaleFormatNumber_outUpdatedPathTokens | v73;
  }
  if (v34)
  {
    uint64_t v75 = [CHTokenizedMathResult alloc];
    v80 = objc_msgSend_initWithBestPathTokens_(v75, v76, (uint64_t)v87, v77, v78, v79);
    objc_msgSend_setResult_(v6, v81, (uint64_t)v80, v82, v83, v84);
  }
  return v6;
}

- (void).cxx_destruct
{
  uint64_t value = self->latexHelper.__ptr_.__value_;
  self->latexHelper.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v4 = sub_1C494A3D8((uint64_t)value);
    MEMORY[0x1C8786460](v4, 0x10A0C409F3568C5);
  }
  objc_storeStrong((id *)&self->_mathClosingConfusableMappings, 0);
  objc_storeStrong((id *)&self->_mathOpeningConfusableMappings, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end